@interface CKBrowserSwitcherFooterViewStickersDataSource
- (CKBrowserSwitcherFooterViewStickersDataSource)init;
- (id)pluginManager;
- (id)switcherView:(id)a3 indexPathOfModelWithIdentifier:(id)a4;
- (id)switcherView:(id)a3 modelAtIndexPath:(id)a4 type:(int64_t *)a5;
- (unint64_t)numberOfPluginsInSwitcherView:(id)a3 forSection:(unint64_t)a4;
@end

@implementation CKBrowserSwitcherFooterViewStickersDataSource

- (CKBrowserSwitcherFooterViewStickersDataSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKBrowserSwitcherFooterViewStickersDataSource;
  v2 = [(CKBrowserSwitcherFooterViewStickersDataSource *)&v5 init];
  if (v2)
  {
    v3 = +[CKBalloonPluginManager sharedInstance];
    [v3 updateAppInstallations];
  }
  return v2;
}

- (unint64_t)numberOfPluginsInSwitcherView:(id)a3 forSection:(unint64_t)a4
{
  if (a4) {
    return 0;
  }
  v4 = [(CKBrowserSwitcherFooterViewStickersDataSource *)self pluginManager];
  objc_super v5 = [v4 combinedStickerApps];
  unint64_t v6 = [v5 count];

  return v6;
}

- (id)switcherView:(id)a3 modelAtIndexPath:(id)a4 type:(int64_t *)a5
{
  id v7 = a4;
  v8 = [(CKBrowserSwitcherFooterViewStickersDataSource *)self pluginManager];
  v9 = [v8 orderedCombinedStickerApps];
  unint64_t v10 = [v7 item];
  if (v10 < [v9 count])
  {
    v11 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v12 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int64_t v12 = 0;
        id v13 = 0;
LABEL_10:

        if (!a5) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      int64_t v12 = 2;
    }
    id v13 = v11;
    goto LABEL_10;
  }
  int64_t v12 = 0;
  id v13 = 0;
  if (a5) {
LABEL_11:
  }
    *a5 = v12;
LABEL_12:

  return v13;
}

- (id)switcherView:(id)a3 indexPathOfModelWithIdentifier:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(CKBrowserSwitcherFooterViewStickersDataSource *)self pluginManager];
  id v7 = [v6 combinedStickersAppsIndexPathMap];
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