@interface GKRemoteViewServiceController
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)_dismissSelfAfterGettingShouldFinish;
- (BOOL)didSetRemoteGame;
- (BOOL)serviceNeedsFriendCode;
- (BOOL)serviceNeedsLocalPlayer;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)viewDidAppear;
- (GKHostedViewController)managingViewController;
- (NSMutableDictionary)dirtyProperties;
- (UIColor)previousStatusBarColor;
- (id)blockToPerformAfterViewDidAppear;
- (id)observedKeyPaths;
- (int64_t)_desiredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_performBlockAfterViewDidAppearIfNeeded;
- (void)_performSelectorAfterAppearingOrTimeOut:(SEL)a3;
- (void)dealloc;
- (void)nudge;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)populateInitialStateForRemoteView:(id)a3;
- (void)remoteViewControllerIsCanceling;
- (void)remoteViewControllerIsFinishing;
- (void)setBlockToPerformAfterViewDidAppear:(id)a3;
- (void)setDidSetRemoteGame:(BOOL)a3;
- (void)setDirtyProperties:(id)a3;
- (void)setManagingViewController:(id)a3;
- (void)setPreviousStatusBarColor:(id)a3;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
- (void)setViewDidAppear:(BOOL)a3;
- (void)setupRemoteView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation GKRemoteViewServiceController

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = self;
  if ([(GKRemoteViewServiceController *)v2 observationInfo])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = [(GKRemoteViewServiceController *)v2 observedKeyPaths];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [(GKRemoteViewServiceController *)v2 removeObserver:v2 forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v7++) context:0];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  v8.receiver = v2;
  v8.super_class = (Class)GKRemoteViewServiceController;
  [(_UIRemoteViewController *)&v8 dealloc];
}

+ (id)exportedInterface
{
  return +[GKViewServiceInterface extensionHostInterface];
}

+ (id)serviceViewControllerInterface
{
  return +[GKViewServiceInterface extensionInterface];
}

- (id)observedKeyPaths
{
  return (id)[MEMORY[0x1E4F1C978] array];
}

- (BOOL)serviceNeedsLocalPlayer
{
  return 1;
}

- (BOOL)serviceNeedsFriendCode
{
  v2 = [(GKRemoteViewServiceController *)self managingViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)populateInitialStateForRemoteView:(id)a3
{
  id v23 = a3;
  uint64_t v4 = [NSNumber numberWithInt:getpid()];
  [v23 setObject:v4 forKey:@"HostPID"];

  uint64_t v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = 0.0;
  if (v6 != 1)
  {
    objc_super v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v8 statusBarHeight];
    double v7 = v9;
  }
  long long v10 = [NSNumber numberWithDouble:v7];
  [v23 setObject:v10 forKey:@"StatusBarHeight"];

  if ([(GKRemoteViewServiceController *)self serviceNeedsLocalPlayer])
  {
    long long v11 = [MEMORY[0x1E4F63760] localPlayer];
    [v23 setObject:v11 forKey:@"LocalPlayer"];
  }
  if ([(GKRemoteViewServiceController *)self serviceNeedsFriendCode])
  {
    long long v12 = [(GKRemoteViewServiceController *)self managingViewController];
    v13 = [v12 friendCode];

    if (v13)
    {
      uint64_t v14 = [v12 friendCode];
      [v23 setObject:v14 forKey:@"GKFriendCodeKey"];
    }
    v15 = [v12 friendSupportPageURL];

    if (v15)
    {
      v16 = [v12 friendSupportPageURL];
      [v23 setObject:v16 forKey:@"GKFriendSupportPageURLKey"];
    }
    v17 = [v12 recipients];

    if (v17)
    {
      v18 = [v12 recipients];
      [v23 setObject:v18 forKey:@"GKFriendRecipientsKey"];
    }
    v19 = [v12 chatGUID];

    if (v19)
    {
      v20 = [v12 chatGUID];
      [v23 setObject:v20 forKey:@"GKChatGUIDKey"];
    }
    v21 = [v12 hostApp];

    if (v21)
    {
      v22 = [v12 hostApp];
      [v23 setObject:v22 forKey:@"GKHostAppKey"];
    }
  }
}

- (void)nudge
{
  id v2 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v2 nudge];
}

- (void)setupRemoteView
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "setting game and player", v2, v3, v4, v5, v6);
}

void __48__GKRemoteViewServiceController_setupRemoteView__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) _endDelayingPresentation];
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    __48__GKRemoteViewServiceController_setupRemoteView__block_invoke_cold_1();
  }
  [WeakRetained setDidSetRemoteGame:a2];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  double v7 = [(GKRemoteViewServiceController *)self observedKeyPaths];
  int v8 = [v7 containsObject:v10];

  if (v8)
  {
    double v9 = [(GKRemoteViewServiceController *)self valueForKeyPath:v10];
    [(GKRemoteViewServiceController *)self setValue:v9 forKeyPath:v10];
  }
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_dirtyProperties)
  {
    int v8 = [MEMORY[0x1E4F1CA60] dictionary];
    [(GKRemoteViewServiceController *)self setDirtyProperties:v8];
  }
  double v9 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  id v10 = [(GKRemoteViewServiceController *)self managingViewController];
  long long v11 = (void *)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v12 = (id)GKOSLoggers();
  }
  v13 = (os_log_t *)MEMORY[0x1E4F63868];
  uint64_t v14 = *MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKRemoteViewServiceController setValue:forKeyPath:]((uint64_t)v7, v14);
  }
  v15 = [(GKRemoteViewServiceController *)self dirtyProperties];
  v16 = v15;
  if (v6) {
    [v15 setObject:v6 forKey:v7];
  }
  else {
    [v15 removeObjectForKey:v7];
  }

  [v10 _beginDelayingPresentation];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke;
  v22[3] = &unk_1E5F63DE0;
  id v17 = v7;
  id v23 = v17;
  id v18 = v6;
  id v24 = v18;
  v25 = self;
  id v19 = v10;
  id v26 = v19;
  [v9 setValue:v18 forKeyPath:v17 withReply:v22];
  if (!*v11) {
    id v20 = (id)GKOSLoggers();
  }
  os_log_t v21 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEBUG)) {
    -[GKRemoteViewServiceController setValue:forKeyPath:]((uint64_t)v17, v21, self);
  }
}

uint64_t __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F63860];
  uint64_t v4 = *MEMORY[0x1E4F63860];
  id v5 = (os_log_t *)MEMORY[0x1E4F63868];
  if (a2)
  {
    if (!v4) {
      id v6 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
      __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke_cold_2();
    }
    id v7 = [*(id *)(a1 + 48) dirtyProperties];
    [v7 removeObjectForKey:*(void *)(a1 + 32)];
  }
  else
  {
    if (!v4) {
      id v8 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
      __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke_cold_3();
    }
  }
  if (!*v3) {
    id v9 = (id)GKOSLoggers();
  }
  id v10 = *v5;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke_cold_1(a1, v10);
  }

  return [*(id *)(a1 + 56) _endDelayingPresentation];
}

- (int64_t)_desiredStatusBarStyle
{
  return 300;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F63760] local];
  [v5 hideAccessPoint];

  [(GKRemoteViewServiceController *)self setupRemoteView];
  v9.receiver = self;
  v9.super_class = (Class)GKRemoteViewServiceController;
  [(_UIRemoteViewController *)&v9 viewWillAppear:v3];
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKRemoteViewServiceController viewWillAppear:]();
  }
  id v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 != 1 || *MEMORY[0x1E4F63830] && !*MEMORY[0x1E4F63A38]) {
    [(UIViewController *)self _gkSaveStatusBarStyleAnimated:v3 setToStyle:[(GKRemoteViewServiceController *)self _desiredStatusBarStyle]];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKRemoteViewServiceController;
  [(_UIRemoteViewController *)&v6 viewDidAppear:a3];
  if (!*MEMORY[0x1E4F63860]) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = (void *)*MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKRemoteViewServiceController viewDidAppear:](v5);
  }
  [(GKRemoteViewServiceController *)self setViewDidAppear:1];
  [(GKRemoteViewServiceController *)self _performBlockAfterViewDidAppearIfNeeded];
}

- (void)_performBlockAfterViewDidAppearIfNeeded
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "EXECUTE CLEANUP BLOCK?", v2, v3, v4, v5, v6);
}

uint64_t __72__GKRemoteViewServiceController__performBlockAfterViewDidAppearIfNeeded__block_invoke(uint64_t a1)
{
  if (!*MEMORY[0x1E4F63860]) {
    id v2 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    __72__GKRemoteViewServiceController__performBlockAfterViewDidAppearIfNeeded__block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return [*(id *)(a1 + 32) setBlockToPerformAfterViewDidAppear:0];
}

- (void)_performSelectorAfterAppearingOrTimeOut:(SEL)a3
{
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__GKRemoteViewServiceController__performSelectorAfterAppearingOrTimeOut___block_invoke;
  v7[3] = &unk_1E5F63E08;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  [(GKRemoteViewServiceController *)self setBlockToPerformAfterViewDidAppear:v7];
  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__GKRemoteViewServiceController__performSelectorAfterAppearingOrTimeOut___block_invoke_2;
  v6[3] = &unk_1E5F62EB0;
  v6[4] = self;
  dispatch_after(v5, MEMORY[0x1E4F14428], v6);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __73__GKRemoteViewServiceController__performSelectorAfterAppearingOrTimeOut___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _gkPerformSelector:*(void *)(a1 + 40)];
}

uint64_t __73__GKRemoteViewServiceController__performSelectorAfterAppearingOrTimeOut___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setViewDidAppear:1];
  id v2 = *(void **)(a1 + 32);

  return [v2 _performBlockAfterViewDidAppearIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKRemoteViewServiceController;
  [(_UIRemoteViewController *)&v4 viewWillDisappear:a3];
  if (!*MEMORY[0x1E4F63860]) {
    id v3 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKRemoteViewServiceController viewWillDisappear:]();
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKRemoteViewServiceController;
  -[_UIRemoteViewController viewDidDisappear:](&v7, sel_viewDidDisappear_);
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG)) {
    -[GKRemoteViewServiceController viewDidDisappear:]();
  }
  [(UIViewController *)self _gkRestoreStatusBarStyle:v3];
  uint8_t v6 = [MEMORY[0x1E4F63760] local];
  [v6 showAccessPoint];
}

- (BOOL)_dismissSelfAfterGettingShouldFinish
{
  return 1;
}

- (void)remoteViewControllerIsFinishing
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "DISMISSED (FINISHING - WAITING FOR viewDidAppear)", v2, v3, v4, v5, v6);
}

- (void)remoteViewControllerIsCanceling
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "DISMISSED (CANCELLING - WAITING FOR viewDidAppear)", v2, v3, v4, v5, v6);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  uint8_t v6 = *MEMORY[0x1E4F63850];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
    -[GKRemoteViewServiceController viewServiceDidTerminateWithError:]((uint64_t)v4, v6);
  }
  objc_super v7 = [(GKRemoteViewServiceController *)self managingViewController];

  if (v7)
  {
    uint64_t v8 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
    [v8 remoteViewControllerDidCancel];

    [(GKRemoteViewServiceController *)self remoteViewControllerIsCanceling];
    objc_super v9 = [(GKRemoteViewServiceController *)self managingViewController];
    [v9 resetRemoteViewController];
  }
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)didSetRemoteGame
{
  return self->_didSetRemoteGame;
}

- (void)setDidSetRemoteGame:(BOOL)a3
{
  self->_didSetRemoteGame = a3;
}

- (BOOL)viewDidAppear
{
  return self->_viewDidAppear;
}

- (void)setViewDidAppear:(BOOL)a3
{
  self->_viewDidAppear = a3;
}

- (NSMutableDictionary)dirtyProperties
{
  return self->_dirtyProperties;
}

- (void)setDirtyProperties:(id)a3
{
}

- (GKHostedViewController)managingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managingViewController);

  return (GKHostedViewController *)WeakRetained;
}

- (void)setManagingViewController:(id)a3
{
}

- (UIColor)previousStatusBarColor
{
  return self->_previousStatusBarColor;
}

- (void)setPreviousStatusBarColor:(id)a3
{
}

- (id)blockToPerformAfterViewDidAppear
{
  return self->_blockToPerformAfterViewDidAppear;
}

- (void)setBlockToPerformAfterViewDidAppear:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_blockToPerformAfterViewDidAppear, 0);
  objc_storeStrong((id *)&self->_previousStatusBarColor, 0);
  objc_destroyWeak((id *)&self->_managingViewController);

  objc_storeStrong((id *)&self->_dirtyProperties, 0);
}

void __48__GKRemoteViewServiceController_setupRemoteView__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "did set game and player", v2, v3, v4, v5, v6);
}

- (void)setValue:(void *)a3 forKeyPath:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  uint8_t v6 = [a3 dirtyProperties];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_debug_impl(&dword_1AF250000, v5, OS_LOG_TYPE_DEBUG, "dirty properties after adding %@: %@", (uint8_t *)&v7, 0x16u);
}

- (void)setValue:(uint64_t)a1 forKeyPath:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AF250000, a2, OS_LOG_TYPE_DEBUG, "changed key %@", (uint8_t *)&v2, 0xCu);
}

void __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 48) dirtyProperties];
  int v5 = [v4 count];
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = [*(id *)(a1 + 48) dirtyProperties];
  uint64_t v8 = [v7 count];
  __int16 v9 = *(void **)(a1 + 48);
  if (v8)
  {
    id v10 = [v9 dirtyProperties];
    id v12 = v10;
  }
  else
  {
    id v10 = [v9 managingViewController];
    int v11 = [(__CFString *)v10 shouldPresentRemoteViewController];
    id v12 = @"don't present";
    if (v11) {
      id v12 = @"present";
    }
  }
  v13[0] = 67109634;
  v13[1] = v5;
  __int16 v14 = 2112;
  uint64_t v15 = v6;
  __int16 v16 = 2112;
  id v17 = v12;
  _os_log_debug_impl(&dword_1AF250000, a2, OS_LOG_TYPE_DEBUG, "%u dirty properties after purging %@: %@", (uint8_t *)v13, 0x1Cu);
}

void __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1AF250000, v0, OS_LOG_TYPE_DEBUG, "service changed key %@ to %@", v1, 0x16u);
}

void __53__GKRemoteViewServiceController_setValue_forKeyPath___block_invoke_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1AF250000, v0, OS_LOG_TYPE_DEBUG, "service failed to change key %@ to %@", v1, 0x16u);
}

- (void)viewWillAppear:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "APPEARING", v2, v3, v4, v5, v6);
}

- (void)viewDidAppear:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)MEMORY[0x1E4F29060];
  uint64_t v2 = a1;
  uint64_t v3 = [v1 callStackSymbols];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1AF250000, v2, OS_LOG_TYPE_DEBUG, "APPEARED (%@)", (uint8_t *)&v4, 0xCu);
}

void __72__GKRemoteViewServiceController__performBlockAfterViewDidAppearIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "EXECUTE CLEANUP BLOCK", v2, v3, v4, v5, v6);
}

- (void)viewWillDisappear:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "DISAPPEARING", v2, v3, v4, v5, v6);
}

- (void)viewDidDisappear:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AF250000, v0, v1, "DISAPPEARED", v2, v3, v4, v5, v6);
}

- (void)viewServiceDidTerminateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "view service dead: %@", (uint8_t *)&v2, 0xCu);
}

@end