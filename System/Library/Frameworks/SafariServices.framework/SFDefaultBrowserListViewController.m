@interface SFDefaultBrowserListViewController
- (void)setNavigationEnabled:(BOOL)a3;
@end

@implementation SFDefaultBrowserListViewController

- (void)setNavigationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = !a3;
  v6 = [(OBBaseWelcomeController *)self navigationItem];
  [v6 setHidesBackButton:v5];

  id v8 = [(SFDefaultBrowserListViewController *)self navigationController];
  v7 = [v8 interactivePopGestureRecognizer];
  [v7 setEnabled:v3];
}

@end