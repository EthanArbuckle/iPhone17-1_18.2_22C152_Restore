@interface CKBrowserSwitcherFooterViewDataSource
- (CKBrowserSwitcherFooterViewDataSource)init;
- (id)pluginManager;
- (id)switcherView:(id)a3 indexPathOfModelWithIdentifier:(id)a4;
- (id)switcherView:(id)a3 modelAtIndexPath:(id)a4 type:(int64_t *)a5;
- (unint64_t)numberOfPluginsInSwitcherView:(id)a3 forSection:(unint64_t)a4;
@end

@implementation CKBrowserSwitcherFooterViewDataSource

- (CKBrowserSwitcherFooterViewDataSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKBrowserSwitcherFooterViewDataSource;
  v2 = [(CKBrowserSwitcherFooterViewDataSource *)&v5 init];
  if (v2)
  {
    v3 = +[CKBalloonPluginManager sharedInstance];
    [v3 updateAppInstallations];
  }
  return v2;
}

- (unint64_t)numberOfPluginsInSwitcherView:(id)a3 forSection:(unint64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      unint64_t v10 = 0;
      goto LABEL_7;
    }
    v7 = [(CKBrowserSwitcherFooterViewDataSource *)self pluginManager];
    v8 = [v7 visibleRecentAppStripPlugins];
  }
  else
  {
    v7 = [(CKBrowserSwitcherFooterViewDataSource *)self pluginManager];
    v8 = [v7 visibleFavoriteAppStripPlugins];
  }
  v9 = v8;
  unint64_t v10 = [v8 count];

LABEL_7:
  return v10;
}

- (id)switcherView:(id)a3 modelAtIndexPath:(id)a4 type:(int64_t *)a5
{
  id v7 = a4;
  v8 = [(CKBrowserSwitcherFooterViewDataSource *)self pluginManager];
  v9 = [v8 visibleFavoriteAppStripPlugins];
  unint64_t v10 = [v8 visibleRecentAppStripPlugins];
  if ([v7 section]) {
    v11 = v10;
  }
  else {
    v11 = v9;
  }
  id v12 = v11;
  unint64_t v13 = [v7 item];
  if (v13 < [v12 count])
  {
    v14 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v15 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int64_t v15 = 0;
        id v16 = 0;
LABEL_13:

        if (!a5) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
      int64_t v15 = 2;
    }
    id v16 = v14;
    goto LABEL_13;
  }
  int64_t v15 = 0;
  id v16 = 0;
  if (a5) {
LABEL_14:
  }
    *a5 = v15;
LABEL_15:

  return v16;
}

- (id)switcherView:(id)a3 indexPathOfModelWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(CKBrowserSwitcherFooterViewDataSource *)self pluginManager];
  id v7 = [v6 pluginIndexPathMap];
  v8 = [v7 objectForKey:v5];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:0x7FFFFFFFFFFFFFFFLL];
  }
  unint64_t v10 = v9;

  return v10;
}

- (id)pluginManager
{
  return +[CKBalloonPluginManager sharedInstance];
}

@end