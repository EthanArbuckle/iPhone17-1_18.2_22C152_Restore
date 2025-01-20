@interface SUSettingsViewControllerFactory
- (id)newPlaceholderViewController;
@end

@implementation SUSettingsViewControllerFactory

- (id)newPlaceholderViewController
{
  v6.receiver = self;
  v6.super_class = (Class)SUSettingsViewControllerFactory;
  id v2 = [(SUSettingsViewControllerFactory *)&v6 newPlaceholderViewController];
  v3 = +[UIColor systemBackgroundColor];
  v4 = +[SUGradient gradientWithColor:v3];
  [v2 setDefaultBackgroundGradient:v4];

  return v2;
}

@end