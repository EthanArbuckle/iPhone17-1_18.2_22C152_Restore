@interface CARTemplateUIWindowSceneDelegate
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
@end

@implementation CARTemplateUIWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v5 = a3;
  id v6 = +[UIApplication sharedApplication];
  [v6 didConnectScene:v5];
}

@end