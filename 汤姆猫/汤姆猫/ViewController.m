

#import "ViewController.h"

#define KmarkH self.view.bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = self.view.bounds;
    imageView.image = [UIImage imageNamed:@"angry_00.jpg"];
    imageView.tag = 100;
    [self.view addSubview:imageView];
    
    
    [self creatImageButton:CGRectMake(5,KmarkH-60,50,50) imageName:@"eat" tag:39];
    [self creatImageButton:CGRectMake(5,KmarkH-100,50,50) imageName:@"drink" tag:80];
    [self creatImageButton:CGRectMake(5,KmarkH-140,50,50) imageName:@"cymbal" tag:13];
    [self creatImageButton:CGRectMake(5,KmarkH-180,50,50) imageName:@"fart" tag:28];
    [self creatImageButton:CGRectMake(5,KmarkH-220,50,50) imageName:@"pie" tag:24];
    [self creatImageButton:CGRectMake(5,KmarkH-260,50,50) imageName:@"scratch" tag:55];
    
    
    //其他没有图标的几个
    [self creatOtherImageButton:CGRectMake(80,100,160,170) imageName:@"knockout" tag:81];
    [self creatOtherImageButton:CGRectMake(110,KmarkH-60,40,40) imageName:@"footRight" tag:30];
    [self creatOtherImageButton:CGRectMake(165,KmarkH-60,40,40) imageName:@"footLeft" tag:29];
    [self creatOtherImageButton:CGRectMake(110,KmarkH-200,100,110) imageName:@"stomach" tag:34];
    [self creatOtherImageButton:CGRectMake(215,KmarkH-130,30,70) imageName:@"angry" tag:26];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 30);
    button.center = CGPointMake([UIScreen mainScreen].bounds.size.width-30, [UIScreen mainScreen].bounds.size.height-30);
    [button setTitle:@"停止" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    button.layer.cornerRadius = 10;
    button.tag = 111;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-50,  self.view.frame.size.width, 50)];
    
   
    lable.text = @"送给姜女士";
    lable.textColor = [UIColor whiteColor];
    lable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lable];
    
}

//创建图标
- (void)creatImageButton:(CGRect)frame imageName:(NSString *)ImageName tag:(NSInteger)tag
{
    UIButton *markButton = [UIButton buttonWithType:UIButtonTypeCustom];
    markButton.frame = frame;
    markButton.tag = tag;
    NSString *str = [[NSString alloc] initWithFormat:@"%@.png",ImageName];
    [markButton setBackgroundImage:[UIImage imageNamed:str] forState:UIControlStateNormal];
    [markButton addTarget:self action:@selector(animationClick:) forControlEvents:UIControlEventTouchUpInside];
    [markButton setTitle:ImageName forState:UIControlStateNormal];
    markButton.titleLabel.alpha = 0;
    [self.view addSubview:markButton];
}
//没有图标的几个
- (void)creatOtherImageButton:(CGRect)frame imageName:(NSString *)ImageName tag:(NSInteger)tag
{
    UIButton *otherButton = [UIButton buttonWithType:UIButtonTypeCustom];
    otherButton.frame = frame;
    [otherButton setTitle:ImageName forState:UIControlStateNormal];
    otherButton.tag = tag;
    otherButton.titleLabel.alpha = 0;
    [otherButton addTarget:self action:@selector(animationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:otherButton];
}

//点击开始动画的方法实现
- (void)animationClick:(UIButton *)button
{
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:100];
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    for(int i = 1; i < button.tag; i++)
    {                                                               //取得按键的名字
        NSString *str = [NSString stringWithFormat:@"%@_%02d.jpg",button.currentTitle,i];
        [mArray addObject:[UIImage imageNamed:str]];
    }
    imageView.animationImages = mArray;
   
    imageView.animationDuration = 0.07 * button.tag;

    imageView.animationRepeatCount = 1;
    [imageView startAnimating];
    
}
- (void)buttonClick:(UIButton *)button{
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:100];
    [imageView stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
