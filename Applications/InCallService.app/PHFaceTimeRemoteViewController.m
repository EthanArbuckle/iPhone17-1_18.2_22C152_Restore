@interface PHFaceTimeRemoteViewController
+ (id)viewControllerClassName;
- (int64_t)backgroundStyle;
- (void)viewDidLoad;
@end

@implementation PHFaceTimeRemoteViewController

+ (id)viewControllerClassName
{
  return @"FTRemoteRecentsContainerViewController";
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PHFaceTimeRemoteViewController;
  [(PHFaceTimeRemoteViewController *)&v3 viewDidLoad];
  [(PHFaceTimeRemoteViewController *)self setModalTransitionStyle:14];
}

- (int64_t)backgroundStyle
{
  return 4;
}

@end