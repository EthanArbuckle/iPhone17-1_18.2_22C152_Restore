@interface CCUIMainViewControllerFactory
+ (id)mainViewControllerWithSystemAgent:(id)a3;
@end

@implementation CCUIMainViewControllerFactory

+ (id)mainViewControllerWithSystemAgent:(id)a3
{
  id v3 = a3;
  v4 = [[CCUIMainViewController alloc] initWithSystemAgent:v3];

  return v4;
}

@end