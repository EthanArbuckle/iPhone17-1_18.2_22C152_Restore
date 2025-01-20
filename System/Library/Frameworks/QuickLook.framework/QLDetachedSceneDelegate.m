@interface QLDetachedSceneDelegate
- (NSArray)urls;
- (NSDictionary)editingModes;
- (NSUserActivity)quicklookActivity;
- (QLPreviewController)quicklookController;
- (UIWindow)window;
- (id)activityFromOptions:(id)a3;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (id)stateRestorationActivityForScene:(id)a3;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4;
- (unint64_t)selectedURLIndex;
- (void)previewControllerWillDismiss:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setEditingModes:(id)a3;
- (void)setQuicklookActivity:(id)a3;
- (void)setQuicklookController:(id)a3;
- (void)setSelectedURLIndex:(unint64_t)a3;
- (void)setUrls:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation QLDetachedSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 stateRestorationActivity];

  if (v11) {
    [v9 stateRestorationActivity];
  }
  else {
  v12 = [(QLDetachedSceneDelegate *)self activityFromOptions:v10];
  }
  [(QLDetachedSceneDelegate *)self setQuicklookActivity:v12];

  v13 = [(QLDetachedSceneDelegate *)self quicklookActivity];
  v14 = [v13 userInfo];
  v15 = [v14 objectForKey:@"com.apple.quicklook.private.activity.URLsKey"];
  [(QLDetachedSceneDelegate *)self setUrls:v15];

  v16 = [(QLDetachedSceneDelegate *)self quicklookActivity];
  v17 = [v16 userInfo];
  v18 = [v17 objectForKey:@"com.apple.quicklook.private.activity.IndexKey"];
  -[QLDetachedSceneDelegate setSelectedURLIndex:](self, "setSelectedURLIndex:", [v18 unsignedIntValue]);

  v19 = [(QLDetachedSceneDelegate *)self quicklookActivity];
  v20 = [v19 userInfo];
  v21 = [v20 objectForKey:@"com.apple.quicklook.private.activity.EditingModes"];
  [(QLDetachedSceneDelegate *)self setEditingModes:v21];

  id v31 = v8;
  v22 = objc_alloc_init(QLPreviewController);
  [(QLDetachedSceneDelegate *)self setQuicklookController:v22];

  v23 = [(QLDetachedSceneDelegate *)self quicklookController];
  [v23 setDelegate:self];

  v24 = [(QLDetachedSceneDelegate *)self quicklookController];
  [v24 setDataSource:self];

  unint64_t v25 = [(QLDetachedSceneDelegate *)self selectedURLIndex];
  v26 = [(QLDetachedSceneDelegate *)self quicklookController];
  [v26 setCurrentPreviewItemIndex:v25];

  v27 = (void *)[objc_alloc(MEMORY[0x263F82E88]) initWithWindowScene:v31];
  [(QLDetachedSceneDelegate *)self setWindow:v27];

  v28 = [(QLDetachedSceneDelegate *)self quicklookController];
  v29 = [(QLDetachedSceneDelegate *)self window];
  [v29 setRootViewController:v28];

  v30 = [(QLDetachedSceneDelegate *)self window];
  [v30 makeKeyAndVisible];
}

- (void)sceneDidDisconnect:(id)a3
{
  [(QLDetachedSceneDelegate *)self setWindow:0];
  [(QLDetachedSceneDelegate *)self setQuicklookController:0];
  [(QLDetachedSceneDelegate *)self setUrls:0];
  [(QLDetachedSceneDelegate *)self setSelectedURLIndex:0];
  uint64_t v4 = MEMORY[0x263EFFA78];

  [(QLDetachedSceneDelegate *)self setEditingModes:v4];
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = [(QLDetachedSceneDelegate *)self quicklookController];
  -[QLDetachedSceneDelegate setSelectedURLIndex:](self, "setSelectedURLIndex:", [v4 currentPreviewItemIndex]);
}

- (id)activityFromOptions:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(a3, "userActivities", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [v8 activityType];
        char v10 = [v9 isEqualToString:@"com.apple.quicklook.private.scene.detachedActivityType"];

        if (v10)
        {
          id v11 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (void)previewControllerWillDismiss:(id)a3
{
  objc_msgSend(MEMORY[0x263F82438], "sharedApplication", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(QLDetachedSceneDelegate *)self window];
  uint64_t v5 = [v4 windowScene];
  uint64_t v6 = [v5 session];
  [v7 requestSceneSessionDestruction:v6 options:0 errorHandler:0];
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  v3 = [(QLDetachedSceneDelegate *)self urls];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  uint64_t v5 = [(QLDetachedSceneDelegate *)self urls];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a4];

  return v6;
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(QLDetachedSceneDelegate *)self editingModes];
  id v7 = [v6 objectForKeyedSubscript:v5];

  int64_t v8 = [v7 integerValue];
  return v8;
}

- (id)stateRestorationActivityForScene:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  int64_t v4 = (void *)[objc_alloc(MEMORY[0x263F018D0]) initWithActivityType:@"com.apple.quicklook.private.scene.detachedActivityType"];
  v9[0] = @"com.apple.quicklook.private.activity.URLsKey";
  id v5 = [(QLDetachedSceneDelegate *)self urls];
  v9[1] = @"com.apple.quicklook.private.activity.IndexKey";
  v10[0] = v5;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[QLDetachedSceneDelegate selectedURLIndex](self, "selectedURLIndex"));
  v10[1] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v4 addUserInfoEntriesFromDictionary:v7];

  return v4;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (QLPreviewController)quicklookController
{
  return self->_quicklookController;
}

- (void)setQuicklookController:(id)a3
{
}

- (NSUserActivity)quicklookActivity
{
  return self->_quicklookActivity;
}

- (void)setQuicklookActivity:(id)a3
{
}

- (NSArray)urls
{
  return self->_urls;
}

- (void)setUrls:(id)a3
{
}

- (unint64_t)selectedURLIndex
{
  return self->_selectedURLIndex;
}

- (void)setSelectedURLIndex:(unint64_t)a3
{
  self->_selectedURLIndex = a3;
}

- (NSDictionary)editingModes
{
  return self->_editingModes;
}

- (void)setEditingModes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingModes, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_quicklookActivity, 0);
  objc_storeStrong((id *)&self->_quicklookController, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end