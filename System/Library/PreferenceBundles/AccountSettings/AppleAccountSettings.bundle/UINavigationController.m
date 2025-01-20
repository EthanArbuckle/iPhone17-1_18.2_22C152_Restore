@interface UINavigationController
- (id)_aaui_activityIndicatorView;
- (id)_aaui_currentRightBarButtonItems;
- (void)_aaui_setActivityIndicatorView:(id)a3;
- (void)_aaui_setCurrentRightBarButtonItems:(id)a3;
- (void)aaui_hideActivityIndicator;
- (void)aaui_showActivityIndicator;
@end

@implementation UINavigationController

- (void)aaui_showActivityIndicator
{
  v3 = [(UINavigationController *)self _aaui_activityIndicatorView];

  if (!v3)
  {
    id v4 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [(UINavigationController *)self _aaui_setActivityIndicatorView:v4];

    v5 = [(UINavigationController *)self _aaui_activityIndicatorView];
    [v5 setHidesWhenStopped:1];
  }
  v6 = [(UINavigationController *)self _aaui_activityIndicatorView];
  [v6 startAnimating];

  id v7 = objc_alloc((Class)UIBarButtonItem);
  v8 = [(UINavigationController *)self _aaui_activityIndicatorView];
  id v14 = [v7 initWithCustomView:v8];

  v9 = [(UINavigationController *)self topViewController];
  v10 = [v9 navigationItem];
  v11 = [v10 rightBarButtonItems];
  [(UINavigationController *)self _aaui_setCurrentRightBarButtonItems:v11];

  v12 = [(UINavigationController *)self topViewController];
  v13 = [v12 navigationItem];
  [v13 setRightBarButtonItem:v14];
}

- (void)aaui_hideActivityIndicator
{
  v3 = [(UINavigationController *)self _aaui_activityIndicatorView];
  [v3 stopAnimating];

  id v4 = [(UINavigationController *)self _aaui_currentRightBarButtonItems];

  if (v4)
  {
    v5 = [(UINavigationController *)self topViewController];
    v6 = [v5 navigationItem];
    id v7 = [(UINavigationController *)self _aaui_currentRightBarButtonItems];
    [v6 setRightBarButtonItems:v7];
  }

  [(UINavigationController *)self _aaui_setCurrentRightBarButtonItems:0];
}

- (id)_aaui_activityIndicatorView
{
  return objc_getAssociatedObject(self, "_aaui_activityIndicatorView");
}

- (void)_aaui_setActivityIndicatorView:(id)a3
{
}

- (id)_aaui_currentRightBarButtonItems
{
  return objc_getAssociatedObject(self, "_aaui_currentRightBarButtonItems");
}

- (void)_aaui_setCurrentRightBarButtonItems:(id)a3
{
}

@end