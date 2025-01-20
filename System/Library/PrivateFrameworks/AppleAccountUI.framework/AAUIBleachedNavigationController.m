@interface AAUIBleachedNavigationController
- (BOOL)shouldAutorotate;
- (void)viewDidLoad;
@end

@implementation AAUIBleachedNavigationController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIBleachedNavigationController;
  [(AAUIBleachedNavigationController *)&v6 viewDidLoad];
  v3 = [(AAUIBleachedNavigationController *)self navigationBar];
  [v3 _setHidesShadow:1];
  v4 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.96];
  v7.width = 1.0;
  v7.height = 1.0;
  UIGraphicsBeginImageContext(v7);
  [v4 set];
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 1.0;
  v8.size.height = 1.0;
  UIRectFill(v8);
  v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [v3 setBackgroundImage:v5 forBarMetrics:0];
}

- (BOOL)shouldAutorotate
{
  return 0;
}

@end