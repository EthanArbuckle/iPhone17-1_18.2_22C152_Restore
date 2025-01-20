@interface CKDebugSceneDelegate
- (UIWindow)window;
- (void)displayViewController:(id)a3 forScene:(id)a4 title:(id)a5;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation CKDebugSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a3;
  v8 = [a5 userActivities];
  v9 = [v8 anyObject];

  v10 = [v9 activityType];
  int v11 = [v10 isEqualToString:@"com.apple.Messages.ShowMessageInspector"];

  if (v11)
  {
    v12 = [v9 userInfo];
    v13 = [v12 objectForKey:@"message-guid"];

    v14 = [MEMORY[0x1E4F6BC30] sharedInstance];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__CKDebugSceneDelegate_scene_willConnectToSession_options___block_invoke;
    v19[3] = &unk_1E5625B48;
    v19[4] = self;
    id v20 = v7;
    [v14 loadMessageWithGUID:v13 completionBlock:v19];
  }
  else
  {
    v15 = +[DebugInspectorContainerViewControllerFactory debugMenuViewController];
    [(CKDebugSceneDelegate *)self displayViewController:v15 forScene:v7 title:@"Messages Debug Menu"];
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F42D60]);
  v17 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  [v16 setCanActivateForTargetContentIdentifierPredicate:v17];

  v18 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  [v16 setPrefersToActivateForTargetContentIdentifierPredicate:v18];

  [v7 setActivationConditions:v16];
}

void __59__CKDebugSceneDelegate_scene_willConnectToSession_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = +[DebugInspectorContainerViewControllerFactory inspectorViewControllerForMessage:a2];
  [v3 displayViewController:v4 forScene:*(void *)(a1 + 40) title:@"Message"];
}

- (void)displayViewController:(id)a3 forScene:(id)a4 title:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [v15 sizeRestrictions];
  objc_msgSend(v10, "setMinimumSize:", 300.0, 200.0);

  int v11 = [v15 sizeRestrictions];
  objc_msgSend(v11, "setMaximumSize:", 440.0, 720.0);

  [v15 setTitle:v8];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F43058]) initWithWindowScene:v15];
  [(CKDebugSceneDelegate *)self setWindow:v12];

  v13 = [(CKDebugSceneDelegate *)self window];
  [v13 setRootViewController:v9];

  v14 = [(CKDebugSceneDelegate *)self window];
  [v14 makeKeyAndVisible];
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end