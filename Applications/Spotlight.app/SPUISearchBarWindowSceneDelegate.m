@interface SPUISearchBarWindowSceneDelegate
- (SPUISearchBarWindow)searchBarWindow;
- (SPUISearchHeader)view;
- (double)headerHeight;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)didFocusHeader;
- (void)didSizeWithHeight:(double)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setHeaderHeight:(double)a3;
- (void)setSearchBarWindow:(id)a3;
- (void)setView:(id)a3;
- (void)sizeBar;
@end

@implementation SPUISearchBarWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  [v6 _setKeepContextAssociationInBackground:1];
  v20 = self;
  v7 = +[NSArray arrayWithObjects:&v20 count:1];
  v8 = [v6 _FBSScene];
  v9 = [v8 identifier];
  [v6 _registerSettingsDiffActionArray:v7 forKey:v9];

  v10 = objc_opt_new();
  v11 = +[SPUISearchViewControllerHolder sharedInstance];
  v12 = [v11 searchViewController];
  v13 = [v12 createAdditionalHeaderView];

  [v13 setInteractionDelegate:self];
  [v10 setView:v13];
  [(SPUISearchBarWindowSceneDelegate *)self setView:v13];
  [v13 setActiveInterfaceOrientation:1];
  v14 = objc_alloc_init(SPUISearchBarWindow);
  [(SPUISearchBarWindowSceneDelegate *)self setSearchBarWindow:v14];

  v15 = [(SPUISearchBarWindowSceneDelegate *)self searchBarWindow];
  [v15 setBackgroundColor:0];

  v16 = [(SPUISearchBarWindowSceneDelegate *)self searchBarWindow];
  [v16 setWindowScene:v6];

  v17 = [(SPUISearchBarWindowSceneDelegate *)self searchBarWindow];
  [v17 setRootViewController:v10];

  v18 = [(SPUISearchBarWindowSceneDelegate *)self searchBarWindow];
  [v18 setHidden:0];

  [(SPUISearchBarWindowSceneDelegate *)self sizeBar];
  v19 = +[NSNotificationCenter defaultCenter];
  [v19 addObserver:self selector:"sizeBar" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)sizeBar
{
  v3 = [(SPUISearchBarWindowSceneDelegate *)self view];
  [v3 setNeedsLayout];

  v4 = [(SPUISearchBarWindowSceneDelegate *)self view];
  [v4 layoutIfNeeded];

  id v6 = [(SPUISearchBarWindowSceneDelegate *)self view];
  [v6 systemLayoutSizeFittingSize:UILayoutFittingExpandedSize.width, UILayoutFittingExpandedSize.height];
  [(SPUISearchBarWindowSceneDelegate *)self didSizeWithHeight:v5];
}

- (void)didSizeWithHeight:(double)a3
{
  [(SPUISearchBarWindowSceneDelegate *)self headerHeight];
  if (v5 != a3)
  {
    [(SPUISearchBarWindowSceneDelegate *)self setHeaderHeight:a3];
    id v6 = [(SPUISearchBarWindowSceneDelegate *)self searchBarWindow];
    v7 = [v6 _scene];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000511C;
    v8[3] = &unk_10000C468;
    *(double *)&v8[4] = a3;
    [v7 updateClientSettingsWithBlock:v8];
  }
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v17 = a4;
  v9 = [v17 settings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v11 = v17;
  if (isKindOfClass)
  {
    v12 = [v17 settings];
    id v13 = [v12 interfaceOrientation];
    v14 = [(SPUISearchBarWindowSceneDelegate *)self view];
    id v15 = [v14 activeInterfaceOrientation];

    if (v15 != v13)
    {
      v16 = [(SPUISearchBarWindowSceneDelegate *)self view];
      [v16 setActiveInterfaceOrientation:v13];

      [(SPUISearchBarWindowSceneDelegate *)self sizeBar];
    }

    v11 = v17;
  }
}

- (void)didFocusHeader
{
  v3 = +[SPUISearchViewControllerHolder sharedInstance];
  v4 = [v3 searchViewController];
  double v5 = [v4 headerView];
  [v5 showCancelButton:0 animated:0];

  id v6 = [(SPUISearchBarWindowSceneDelegate *)self searchBarWindow];
  v7 = [v6 _scene];
  [v7 updateClientSettingsWithTransitionBlock:&stru_10000C4A8];

  id v10 = [(SPUISearchBarWindowSceneDelegate *)self searchBarWindow];
  v8 = [v10 rootViewController];
  v9 = [v8 view];
  [v9 endEditing:1];
}

- (SPUISearchBarWindow)searchBarWindow
{
  return (SPUISearchBarWindow *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSearchBarWindow:(id)a3
{
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (SPUISearchHeader)view
{
  return (SPUISearchHeader *)objc_getProperty(self, a2, 24, 1);
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);

  objc_storeStrong((id *)&self->_searchBarWindow, 0);
}

@end