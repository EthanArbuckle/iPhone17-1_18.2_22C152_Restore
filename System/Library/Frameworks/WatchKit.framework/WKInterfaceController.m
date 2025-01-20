@interface WKInterfaceController
+ (BOOL)openParentApplication:(id)a3 reply:(id)a4;
+ (CGRect)screenBounds;
+ (double)screenScale;
+ (void)_insertPageControllersAtIndexes:(id)a3 withNames:(id)a4 contexts:(id)a5;
+ (void)_movePageControllerAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
+ (void)_removePageControllersAtIndexes:(id)a3;
+ (void)reloadRootControllersWithNames:(id)a3 contexts:(id)a4;
- (CGRect)contentFrame;
- (NSArray)properties;
- (NSArray)topLevelObjects;
- (NSMutableArray)pendingGestureInstallationFinishedBlocks;
- (NSMutableArray)uninstalledGestureIDs;
- (NSMutableDictionary)gestureRecognizers;
- (NSString)viewControllerID;
- (WKCrownSequencer)crownSequencer;
- (WKInterfaceController)init;
- (id)contextForSegueWithIdentifier:(id)a3;
- (id)contextForSegueWithIdentifier:(id)a3 inTable:(id)a4 rowIndex:(int64_t)a5;
- (id)contextsForSegueWithIdentifier:(id)a3;
- (id)contextsForSegueWithIdentifier:(id)a3 inTable:(id)a4 rowIndex:(int64_t)a5;
- (void)_handleActionWithIdentifier:(id)a3 forNotification:(id)a4 remoteNotification:(id)a5 localNotification:(id)a6;
- (void)addMenuItemWithImage:(id)a3 title:(id)a4 action:(SEL)a5;
- (void)addMenuItemWithImageNamed:(id)a3 title:(id)a4 action:(SEL)a5;
- (void)addMenuItemWithItemIcon:(int64_t)a3 title:(id)a4 action:(SEL)a5;
- (void)animateWithDuration:(double)a3 animations:(id)a4;
- (void)becomeCurrentPage;
- (void)clearAllMenuItems;
- (void)didRegisterWithRemoteInterface;
- (void)dismissAddPassesController;
- (void)dismissController;
- (void)dismissTextInputController;
- (void)invalidateUserActivity;
- (void)popController;
- (void)popToRootController;
- (void)presentAddPassesControllerWithPasses:(id)a3 completion:(id)a4;
- (void)presentControllerWithName:(id)a3 context:(id)a4;
- (void)presentControllerWithNames:(id)a3 contexts:(id)a4;
- (void)presentTextInputControllerWithSuggestions:(id)a3 allowedInputMode:(int64_t)a4 completion:(id)a5;
- (void)presentTextInputControllerWithSuggestionsForLanguage:(id)a3 allowedInputMode:(int64_t)a4 completion:(id)a5;
- (void)pushControllerWithName:(id)a3 context:(id)a4;
- (void)setContentFrame:(CGRect)a3;
- (void)setGestureRecognizers:(id)a3;
- (void)setPendingGestureInstallationFinishedBlocks:(id)a3;
- (void)setProperties:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopLevelObjects:(id)a3;
- (void)setUninstalledGestureIDs:(id)a3;
- (void)setViewControllerID:(id)a3;
- (void)updateUserActivity:(id)a3 userInfo:(id)a4;
- (void)updateUserActivity:(id)a3 userInfo:(id)a4 webpageURL:(id)a5;
@end

@implementation WKInterfaceController

+ (double)screenScale
{
  v2 = +[WKInterfaceDevice currentDevice];
  [v2 screenScale];
  double v4 = v3;

  return v4;
}

+ (CGRect)screenBounds
{
  v2 = +[WKInterfaceDevice currentDevice];
  [v2 screenBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (WKInterfaceController)init
{
  v8.receiver = self;
  v8.super_class = (Class)WKInterfaceController;
  v2 = [(WKInterfaceController *)&v8 init];
  [(WKInterfaceController *)v2 setViewControllerID:__viewControllerID];
  -[WKInterfaceController setContentFrame:](v2, "setContentFrame:", __contentFrame, *(double *)&qword_267F486B8, unk_267F486C0);
  [(WKInterfaceController *)v2 setProperties:__properties];
  double v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(WKInterfaceController *)v2 setGestureRecognizers:v3];

  if (init_onceToken != -1) {
    dispatch_once(&init_onceToken, &__block_literal_global_5);
  }
  double v4 = [MEMORY[0x263EFF980] array];
  [(WKInterfaceController *)v2 setUninstalledGestureIDs:v4];

  double v5 = [MEMORY[0x263EFF980] array];
  [(WKInterfaceController *)v2 setPendingGestureInstallationFinishedBlocks:v5];

  double v6 = +[SPRemoteInterface controller:v2 setupProperties:__properties viewControllerID:__viewControllerID tableIndex:0x7FFFFFFFFFFFFFFFLL rowIndex:0x7FFFFFFFFFFFFFFFLL classForType:_WKInterfaceObjectClassWithType];
  [(WKInterfaceController *)v2 setTopLevelObjects:v6];

  (*(void (**)(uint64_t, WKInterfaceController *))(__remoteSetup + 16))(__remoteSetup, v2);
  return v2;
}

uint64_t __29__WKInterfaceController_init__block_invoke()
{
  __gestureRecognizersQueue = (uint64_t)dispatch_queue_create("com.apple.watchKit.WKInterfaceControllerGestureRecognizers", MEMORY[0x263EF83A8]);

  return MEMORY[0x270F9A758]();
}

- (void)didRegisterWithRemoteInterface
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(WKInterfaceController *)self topLevelObjects];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) didRegisterWithRemoteInterface];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_handleActionWithIdentifier:(id)a3 forNotification:(id)a4 remoteNotification:(id)a5 localNotification:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = objc_opt_class();
  if (spUtils_subclassForObjectOverridesSelectorFromSuperclass(self, (uint64_t)sel_handleActionWithIdentifier_forNotification_, v14))
  {
    v15 = wk_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136446978;
      v23 = "-[WKInterfaceController _handleActionWithIdentifier:forNotification:remoteNotification:localNotification:]";
      __int16 v24 = 1024;
      int v25 = 276;
      __int16 v26 = 2114;
      v27 = self;
      __int16 v28 = 2114;
      id v29 = v10;
      _os_log_impl(&dword_2211F3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling handleActionWithIdentifier:forNotification: on %{public}@ with identifier %{public}@", (uint8_t *)&v22, 0x26u);
    }

    [(WKInterfaceController *)self handleActionWithIdentifier:v10 forNotification:v11];
  }
  else if (v13)
  {
    v16 = wk_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136446978;
      v23 = "-[WKInterfaceController _handleActionWithIdentifier:forNotification:remoteNotification:localNotification:]";
      __int16 v24 = 1024;
      int v25 = 283;
      __int16 v26 = 2114;
      v27 = self;
      __int16 v28 = 2114;
      id v29 = v10;
      _os_log_impl(&dword_2211F3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling handleActionWithIdentifier:forLocalNotification: on %{public}@ with identifier %{public}@", (uint8_t *)&v22, 0x26u);
    }

    [(WKInterfaceController *)self handleActionWithIdentifier:v10 forLocalNotification:v13];
  }
  else
  {
    v17 = wk_default_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v18)
      {
        int v22 = 136446978;
        v23 = "-[WKInterfaceController _handleActionWithIdentifier:forNotification:remoteNotification:localNotification:]";
        __int16 v24 = 1024;
        int v25 = 286;
        __int16 v26 = 2114;
        v27 = self;
        __int16 v28 = 2114;
        id v29 = v10;
        _os_log_impl(&dword_2211F3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling handleActionWithIdentifier:forRemoteNotification: on %{public}@ with identifier %{public}@", (uint8_t *)&v22, 0x26u);
      }

      v19 = self;
      id v20 = v10;
      id v21 = v12;
    }
    else
    {
      if (v18)
      {
        int v22 = 136446978;
        v23 = "-[WKInterfaceController _handleActionWithIdentifier:forNotification:remoteNotification:localNotification:]";
        __int16 v24 = 1024;
        int v25 = 289;
        __int16 v26 = 2114;
        v27 = self;
        __int16 v28 = 2114;
        id v29 = v10;
        _os_log_impl(&dword_2211F3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling handleActionWithIdentifier:forRemoteNotification: on %{public}@ with identifier %{public}@", (uint8_t *)&v22, 0x26u);
      }

      id v21 = (id)MEMORY[0x263EFFA78];
      v19 = self;
      id v20 = v10;
    }
    [(WKInterfaceController *)v19 handleActionWithIdentifier:v20 forRemoteNotification:v21];
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__WKInterfaceController_setTitle___block_invoke;
  v8[3] = &unk_264598D10;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = (void (**)(void))MEMORY[0x223C7C250](v8);
  if (isRunningOnMainQueue())
  {
    v6[2](v6);
  }
  else
  {
    long long v7 = wk_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WKInterfaceController setTitle:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

void __34__WKInterfaceController_setTitle___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) viewControllerID];
  v2 = (void *)[*(id *)(a1 + 40) copy];
  +[SPRemoteInterface setController:v3 key:@"#title" property:&stru_26D3103D0 value:v2];
}

- (void)pushControllerWithName:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__WKInterfaceController_pushControllerWithName_context___block_invoke;
  v12[3] = &unk_264598C98;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = (void (**)(void))MEMORY[0x223C7C250](v12);
  if (isRunningOnMainQueue())
  {
    v10[2](v10);
  }
  else
  {
    id v11 = wk_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WKInterfaceController pushControllerWithName:context:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __56__WKInterfaceController_pushControllerWithName_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id)[*(id *)(a1 + 40) copy];
  +[SPRemoteInterface controller:v2 pushInterfaceController:v3 context:*(void *)(a1 + 48)];
}

- (void)popController
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

uint64_t __38__WKInterfaceController_popController__block_invoke(uint64_t a1)
{
  return +[SPRemoteInterface controllerPop:*(void *)(a1 + 32)];
}

- (void)popToRootController
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

uint64_t __44__WKInterfaceController_popToRootController__block_invoke(uint64_t a1)
{
  return +[SPRemoteInterface controllerPopToRoot:*(void *)(a1 + 32)];
}

+ (void)reloadRootControllersWithNames:(id)a3 contexts:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__WKInterfaceController_reloadRootControllersWithNames_contexts___block_invoke;
  v11[3] = &unk_264598D10;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = (void (**)(void))MEMORY[0x223C7C250](v11);
  if (isRunningOnMainQueue())
  {
    v9[2](v9);
  }
  else
  {
    id v10 = wk_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[WKInterfaceController reloadRootControllersWithNames:contexts:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

void __65__WKInterfaceController_reloadRootControllersWithNames_contexts___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v4 = (id)[*(id *)(a1 + 32) copy];
    uint64_t v2 = (void *)[*(id *)(a1 + 40) copy];
    +[SPRemoteInterface reloadRootControllersWithNames:v4 contexts:v2];
  }
  else
  {
    uint64_t v3 = wk_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __65__WKInterfaceController_reloadRootControllersWithNames_contexts___block_invoke_cold_1();
    }
  }
}

+ (void)_insertPageControllersAtIndexes:(id)a3 withNames:(id)a4 contexts:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = a5;
  if ([v7 count])
  {
    id v9 = (void *)[v11 copy];
    id v10 = (void *)[v7 copy];
    +[SPRemoteInterface insertPageControllerAtIndexes:v9 withNames:v10 contexts:v8];
  }
}

+ (void)_movePageControllerAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
}

+ (void)_removePageControllersAtIndexes:(id)a3
{
  id v3 = (id)[a3 copy];
  +[SPRemoteInterface removePageControllerAtIndexes:v3];
}

- (void)becomeCurrentPage
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

uint64_t __42__WKInterfaceController_becomeCurrentPage__block_invoke(uint64_t a1)
{
  return +[SPRemoteInterface controllerBecomeCurrentPage:*(void *)(a1 + 32)];
}

- (void)presentControllerWithName:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__WKInterfaceController_presentControllerWithName_context___block_invoke;
  v12[3] = &unk_264598C98;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = (void (**)(void))MEMORY[0x223C7C250](v12);
  if (isRunningOnMainQueue())
  {
    v10[2](v10);
  }
  else
  {
    id v11 = wk_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WKInterfaceController presentControllerWithName:context:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __59__WKInterfaceController_presentControllerWithName_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id)[*(id *)(a1 + 40) copy];
  +[SPRemoteInterface controller:v2 presentInterfaceController:v3 context:*(void *)(a1 + 48)];
}

- (void)presentControllerWithNames:(id)a3 contexts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__WKInterfaceController_presentControllerWithNames_contexts___block_invoke;
  v12[3] = &unk_264598C98;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = (void (**)(void))MEMORY[0x223C7C250](v12);
  if (isRunningOnMainQueue())
  {
    v10[2](v10);
  }
  else
  {
    id v11 = wk_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WKInterfaceController presentControllerWithNames:contexts:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __61__WKInterfaceController_presentControllerWithNames_contexts___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = (id)[*(id *)(a1 + 40) copy];
  id v3 = (void *)[*(id *)(a1 + 48) copy];
  +[SPRemoteInterface controller:v2 presentInterfaceControllers:v4 contexts:v3];
}

- (void)dismissController
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

uint64_t __42__WKInterfaceController_dismissController__block_invoke(uint64_t a1)
{
  return +[SPRemoteInterface controllerDismiss:*(void *)(a1 + 32)];
}

- (void)presentTextInputControllerWithSuggestions:(id)a3 allowedInputMode:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __95__WKInterfaceController_presentTextInputControllerWithSuggestions_allowedInputMode_completion___block_invoke;
  v14[3] = &unk_264599D58;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a4;
  id v10 = v8;
  id v11 = v9;
  id v12 = (void (**)(void))MEMORY[0x223C7C250](v14);
  if (isRunningOnMainQueue())
  {
    v12[2](v12);
  }
  else
  {
    id v13 = wk_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[WKInterfaceController presentTextInputControllerWithSuggestions:allowedInputMode:completion:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
}

void __95__WKInterfaceController_presentTextInputControllerWithSuggestions_allowedInputMode_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v5 = (id)[*(id *)(a1 + 40) copy];
    uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
    +[SPRemoteInterface controller:v2 presentTextInputControllerWithSuggestions:v5 allowedInputMode:v3 completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v4 = wk_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __95__WKInterfaceController_presentTextInputControllerWithSuggestions_allowedInputMode_completion___block_invoke_cold_1();
    }
  }
}

- (void)presentTextInputControllerWithSuggestionsForLanguage:(id)a3 allowedInputMode:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __106__WKInterfaceController_presentTextInputControllerWithSuggestionsForLanguage_allowedInputMode_completion___block_invoke;
  v14[3] = &unk_264599D80;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  int64_t v17 = a4;
  id v10 = v8;
  id v11 = v9;
  id v12 = (void (**)(void))MEMORY[0x223C7C250](v14);
  if (isRunningOnMainQueue())
  {
    v12[2](v12);
  }
  else
  {
    id v13 = wk_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[WKInterfaceController presentTextInputControllerWithSuggestionsForLanguage:allowedInputMode:completion:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
}

void __106__WKInterfaceController_presentTextInputControllerWithSuggestionsForLanguage_allowedInputMode_completion___block_invoke(void *a1)
{
  if (a1[5])
  {
    uint64_t v2 = a1[4];
    uint64_t v3 = a1[6];
    id v5 = [NSNumber numberWithInteger:a1[7]];
    +[SPRemoteInterface controller:v2 presentTextInputControllerWithSuggestionsForLanguage:v3 allowedInputMode:v5 completion:a1[5]];
  }
  else
  {
    uint64_t v4 = wk_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __106__WKInterfaceController_presentTextInputControllerWithSuggestionsForLanguage_allowedInputMode_completion___block_invoke_cold_1();
    }
  }
}

- (void)dismissTextInputController
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

uint64_t __51__WKInterfaceController_dismissTextInputController__block_invoke(uint64_t a1)
{
  return +[SPRemoteInterface controllerDismissTextInputController:*(void *)(a1 + 32)];
}

- (void)presentAddPassesControllerWithPasses:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__WKInterfaceController_presentAddPassesControllerWithPasses_completion___block_invoke;
  v12[3] = &unk_264599C10;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = (void (**)(void))MEMORY[0x223C7C250](v12);
  if (isRunningOnMainQueue())
  {
    v10[2](v10);
  }
  else
  {
    id v11 = wk_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WKInterfaceController presentAddPassesControllerWithPasses:completion:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

uint64_t __73__WKInterfaceController_presentAddPassesControllerWithPasses_completion___block_invoke(void *a1)
{
  return +[SPRemoteInterface controller:a1[4] presentAddPassesControllerWithPasses:a1[5] completion:a1[6]];
}

- (void)dismissAddPassesController
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

uint64_t __51__WKInterfaceController_dismissAddPassesController__block_invoke(uint64_t a1)
{
  return +[SPRemoteInterface controllerDismissAddPassesController:*(void *)(a1 + 32)];
}

- (id)contextForSegueWithIdentifier:(id)a3
{
  return 0;
}

- (id)contextForSegueWithIdentifier:(id)a3 inTable:(id)a4 rowIndex:(int64_t)a5
{
  return 0;
}

- (id)contextsForSegueWithIdentifier:(id)a3
{
  return 0;
}

- (id)contextsForSegueWithIdentifier:(id)a3 inTable:(id)a4 rowIndex:(int64_t)a5
{
  return 0;
}

- (void)animateWithDuration:(double)a3 animations:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__WKInterfaceController_animateWithDuration_animations___block_invoke;
    block[3] = &unk_264599DA8;
    block[4] = self;
    double v10 = a3;
    id v9 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __56__WKInterfaceController_animateWithDuration_animations___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) viewControllerID];
  uint64_t v3 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  +[SPRemoteInterface setController:v2 key:@"#animateBegin" property:&stru_26D3103D0 value:v3];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = [*(id *)(a1 + 32) viewControllerID];
  +[SPRemoteInterface setController:v4 key:@"#animateCommit" property:&stru_26D3103D0 value:0];
}

- (void)addMenuItemWithImage:(id)a3 title:(id)a4 action:(SEL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__WKInterfaceController_addMenuItemWithImage_title_action___block_invoke;
  v14[3] = &unk_264599DD0;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = self;
  SEL v18 = a5;
  id v10 = v9;
  id v11 = v8;
  id v12 = (void (**)(void))MEMORY[0x223C7C250](v14);
  if (isRunningOnMainQueue())
  {
    v12[2](v12);
  }
  else
  {
    id v13 = wk_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[WKInterfaceController addMenuItemWithImage:title:action:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
}

void __59__WKInterfaceController_addMenuItemWithImage_title_action___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = NSStringFromSelector(*(SEL *)(a1 + 56));
  uint64_t v3 = (void *)v2;
  if (!*(void *)(a1 + 32) || (*(void *)(a1 + 40) ? (BOOL v4 = v2 == 0) : (BOOL v4 = 1), v4))
  {
    uint64_t v5 = wk_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __59__WKInterfaceController_addMenuItemWithImage_title_action___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 48) viewControllerID];
    id v6 = objc_msgSend(*(id *)(a1 + 40), "copy", *(void *)(a1 + 32));
    v8[1] = v6;
    v8[2] = v3;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];
    +[SPRemoteInterface setController:v5 key:@"#item" property:&stru_26D3103D0 value:v7];
  }
}

- (void)addMenuItemWithImageNamed:(id)a3 title:(id)a4 action:(SEL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__WKInterfaceController_addMenuItemWithImageNamed_title_action___block_invoke;
  v14[3] = &unk_264599DD0;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = self;
  SEL v18 = a5;
  id v10 = v9;
  id v11 = v8;
  id v12 = (void (**)(void))MEMORY[0x223C7C250](v14);
  if (isRunningOnMainQueue())
  {
    v12[2](v12);
  }
  else
  {
    id v13 = wk_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[WKInterfaceController addMenuItemWithImageNamed:title:action:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
}

void __64__WKInterfaceController_addMenuItemWithImageNamed_title_action___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = NSStringFromSelector(*(SEL *)(a1 + 56));
  uint64_t v3 = (void *)v2;
  if (!*(void *)(a1 + 32) || (*(void *)(a1 + 40) ? (BOOL v4 = v2 == 0) : (BOOL v4 = 1), v4))
  {
    uint64_t v5 = wk_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__WKInterfaceController_addMenuItemWithImageNamed_title_action___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 48) viewControllerID];
    id v6 = (void *)[*(id *)(a1 + 32) copy];
    id v7 = objc_msgSend(*(id *)(a1 + 40), "copy", v6);
    v9[1] = v7;
    v9[2] = v3;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    +[SPRemoteInterface setController:v5 key:@"#item" property:&stru_26D3103D0 value:v8];
  }
}

- (void)addMenuItemWithItemIcon:(int64_t)a3 title:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__WKInterfaceController_addMenuItemWithItemIcon_title_action___block_invoke;
  v12[3] = &unk_264598D88;
  id v13 = v8;
  id v14 = self;
  SEL v15 = a5;
  int64_t v16 = a3;
  id v9 = v8;
  id v10 = (void (**)(void))MEMORY[0x223C7C250](v12);
  if (isRunningOnMainQueue())
  {
    v10[2](v10);
  }
  else
  {
    id v11 = wk_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WKInterfaceController addMenuItemWithItemIcon:title:action:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __62__WKInterfaceController_addMenuItemWithItemIcon_title_action___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = NSStringFromSelector(*(SEL *)(a1 + 48));
  uint64_t v3 = (void *)v2;
  if (*(void *)(a1 + 32)) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    uint64_t v5 = wk_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __62__WKInterfaceController_addMenuItemWithItemIcon_title_action___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 40) viewControllerID];
    id v6 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
    id v7 = objc_msgSend(*(id *)(a1 + 32), "copy", v6);
    v9[1] = v7;
    v9[2] = v3;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    +[SPRemoteInterface setController:v5 key:@"#item" property:&stru_26D3103D0 value:v8];
  }
}

- (void)clearAllMenuItems
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

void __42__WKInterfaceController_clearAllMenuItems__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewControllerID];
  +[SPRemoteInterface setController:v1 key:@"#item" property:&stru_26D3103D0 value:0];
}

- (void)updateUserActivity:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__WKInterfaceController_updateUserActivity_userInfo___block_invoke;
  v12[3] = &unk_264598C98;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = (void (**)(void))MEMORY[0x223C7C250](v12);
  if (isRunningOnMainQueue())
  {
    v10[2](v10);
  }
  else
  {
    id v11 = wk_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WKInterfaceController updateUserActivity:userInfo:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __53__WKInterfaceController_updateUserActivity_userInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = wk_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __53__WKInterfaceController_updateUserActivity_userInfo___block_invoke_cold_1();
  }

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)[*(id *)(a1 + 40) copy];
  uint64_t v5 = (void *)[*(id *)(a1 + 48) copy];
  [v3 updateUserActivity:v4 userInfo:v5 webpageURL:0];
}

- (void)updateUserActivity:(id)a3 userInfo:(id)a4 webpageURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__WKInterfaceController_updateUserActivity_userInfo_webpageURL___block_invoke;
  v16[3] = &unk_264598CE8;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v20 = self;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = (void (**)(void))MEMORY[0x223C7C250](v16);
  if (isRunningOnMainQueue())
  {
    v14[2](v14);
  }
  else
  {
    SEL v15 = wk_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[WKInterfaceController updateUserActivity:userInfo:webpageURL:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v14);
  }
}

void __64__WKInterfaceController_updateUserActivity_userInfo_webpageURL___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length] && (*(void *)(a1 + 40) || *(void *)(a1 + 48)))
  {
    id v7 = (id)[*(id *)(a1 + 32) copy];
    uint64_t v2 = (void *)[*(id *)(a1 + 40) copy];
    uint64_t v3 = (void *)[*(id *)(a1 + 48) copy];
    +[SPRemoteInterface updateUserActivity:v7 userInfo:v2 webpageURL:v3 interfaceController:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = wk_default_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v6) {
        __64__WKInterfaceController_updateUserActivity_userInfo_webpageURL___block_invoke_cold_2();
      }
    }
    else if (v6)
    {
      __64__WKInterfaceController_updateUserActivity_userInfo_webpageURL___block_invoke_cold_1();
    }
  }
}

- (void)invalidateUserActivity
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

uint64_t __47__WKInterfaceController_invalidateUserActivity__block_invoke(uint64_t a1)
{
  return +[SPRemoteInterface updateUserActivity:0 userInfo:0 webpageURL:0 interfaceController:*(void *)(a1 + 32)];
}

+ (BOOL)openParentApplication:(id)a3 reply:(id)a4
{
  return 0;
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (WKCrownSequencer)crownSequencer
{
  return self->_crownSequencer;
}

- (NSArray)topLevelObjects
{
  return self->_topLevelObjects;
}

- (void)setTopLevelObjects:(id)a3
{
}

- (NSArray)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSString)viewControllerID
{
  return self->_viewControllerID;
}

- (void)setViewControllerID:(id)a3
{
}

- (NSMutableDictionary)gestureRecognizers
{
  return self->_gestureRecognizers;
}

- (void)setGestureRecognizers:(id)a3
{
}

- (NSMutableArray)uninstalledGestureIDs
{
  return self->_uninstalledGestureIDs;
}

- (void)setUninstalledGestureIDs:(id)a3
{
}

- (NSMutableArray)pendingGestureInstallationFinishedBlocks
{
  return self->_pendingGestureInstallationFinishedBlocks;
}

- (void)setPendingGestureInstallationFinishedBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingGestureInstallationFinishedBlocks, 0);
  objc_storeStrong((id *)&self->_uninstalledGestureIDs, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
  objc_storeStrong((id *)&self->_viewControllerID, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_topLevelObjects, 0);

  objc_storeStrong((id *)&self->_crownSequencer, 0);
}

- (void)setTitle:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

- (void)pushControllerWithName:context:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

+ (void)reloadRootControllersWithNames:contexts:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

void __65__WKInterfaceController_reloadRootControllersWithNames_contexts___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: Error - reloadRootControllersWithNames:contexts: requires names to be non-nil", v2, v3, v4, v5, v6);
}

- (void)presentControllerWithName:context:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

- (void)presentControllerWithNames:contexts:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

- (void)presentTextInputControllerWithSuggestions:allowedInputMode:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

void __95__WKInterfaceController_presentTextInputControllerWithSuggestions_allowedInputMode_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: Error - presentTextInputControllerWithSuggestions:allowedInputMode:completion: requires a non-NULL completion block", v2, v3, v4, v5, v6);
}

- (void)presentTextInputControllerWithSuggestionsForLanguage:allowedInputMode:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

void __106__WKInterfaceController_presentTextInputControllerWithSuggestionsForLanguage_allowedInputMode_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: Error - presentTextInputControllerWithSuggestionsForLanguage:allowedInputMode:completion: requires a non-NULL completion block", v2, v3, v4, v5, v6);
}

- (void)presentAddPassesControllerWithPasses:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

- (void)addMenuItemWithImage:title:action:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

void __59__WKInterfaceController_addMenuItemWithImage_title_action___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: Error - addMenuItemWithImage:title:action requires a non-nil image and title and valid action", v2, v3, v4, v5, v6);
}

- (void)addMenuItemWithImageNamed:title:action:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

void __64__WKInterfaceController_addMenuItemWithImageNamed_title_action___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: Error - addMenuItemWithImageNamed:title:action requires a non-nil image name and title and valid action", v2, v3, v4, v5, v6);
}

- (void)addMenuItemWithItemIcon:title:action:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

void __62__WKInterfaceController_addMenuItemWithItemIcon_title_action___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: Error - addMenuItemWithItemIcon:title:action requires a non-nil title and valid action", v2, v3, v4, v5, v6);
}

- (void)updateUserActivity:userInfo:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

void __53__WKInterfaceController_updateUserActivity_userInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: -[WKInterfaceController updateUserActivity:userInfo:] has been deprecated. Please use the new -[WKInterfaceController updateUserActivity:userInfo:webpageURL:] instead. This call will go away soon and calling it will crash.", v2, v3, v4, v5, v6);
}

- (void)updateUserActivity:userInfo:webpageURL:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
}

void __64__WKInterfaceController_updateUserActivity_userInfo_webpageURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: Error - updateUserActivity requires a non-empty type", v2, v3, v4, v5, v6);
}

void __64__WKInterfaceController_updateUserActivity_userInfo_webpageURL___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_2211F3000, v0, v1, "%{public}s:%d: Error - updateUserActivity requires either userInfo or webpageURL to be non-nil", v2, v3, v4, v5, v6);
}

@end