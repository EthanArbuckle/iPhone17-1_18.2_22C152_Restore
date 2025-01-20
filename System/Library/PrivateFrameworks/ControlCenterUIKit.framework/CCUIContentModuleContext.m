@interface CCUIContentModuleContext
+ (BOOL)areAnimationsPermittedInWindow:(id)a3;
+ (id)_sharedOpenAppService;
+ (id)_sharedOpenApplicationOptions;
+ (void)initialize;
+ (void)performWithoutAnimationWhileHiddenInWindow:(id)a3 actions:(id)a4;
+ (void)setAnimationsPermitted:(BOOL)a3 inWindow:(id)a4;
- (BOOL)isDevicePasscodeLocked;
- (CCUIContentModuleContext)initWithModuleIdentifier:(id)a3 uniqueIdentifier:(id)a4;
- (CCUIContentModuleContextDelegate)delegate;
- (CCUIModuleLayoutSize)moduleLayoutSizeForOrientation:(int64_t)a3;
- (CCUISensorActivityData)sensorActivityDataEligibleForInactiveMicModeSelection;
- (NSString)moduleIdentifier;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)queue;
- (id)sensorActivityDataForActiveSensorType:(unint64_t)a3;
- (void)dismissControlCenter;
- (void)dismissModule;
- (void)enqueueStatusUpdate:(id)a3;
- (void)openApplication:(id)a3 completionHandler:(id)a4;
- (void)openApplication:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)requestAuthenticationWithCompletionHandler:(id)a3;
- (void)requestExpandModule;
- (void)requestLayoutSizeUpdate;
- (void)setDelegate:(id)a3;
- (void)setHomeGestureDismissalAllowed:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation CCUIContentModuleContext

+ (void)performWithoutAnimationWhileHiddenInWindow:(id)a3 actions:(id)a4
{
  id v7 = a3;
  v6 = (void (**)(void))a4;
  if (v6)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    if ([a1 areAnimationsPermittedInWindow:v7]) {
      v6[2](v6);
    }
    else {
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
    }
  }
}

+ (BOOL)areAnimationsPermittedInWindow:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v3)
  {
    int v4 = [v3 _contextId];
    BOOL v5 = v4 != __animationsDisabledContextID;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)_sharedOpenAppService
{
  if (_sharedOpenAppService_onceToken != -1) {
    dispatch_once(&_sharedOpenAppService_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)_sharedOpenAppService___openAppService;
  return v2;
}

uint64_t __49__CCUIContentModuleContext__sharedOpenAppService__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
  uint64_t v1 = _sharedOpenAppService___openAppService;
  _sharedOpenAppService___openAppService = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)_sharedOpenApplicationOptions
{
  if (_sharedOpenApplicationOptions_onceToken != -1) {
    dispatch_once(&_sharedOpenApplicationOptions_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)_sharedOpenApplicationOptions___options;
  return v2;
}

void __57__CCUIContentModuleContext__sharedOpenApplicationOptions__block_invoke()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F626A0];
  v3[0] = *MEMORY[0x1E4F62688];
  v3[1] = v0;
  v4[0] = MEMORY[0x1E4F1CC38];
  v4[1] = MEMORY[0x1E4F1CC38];
  v3[2] = *MEMORY[0x1E4F62658];
  v4[2] = @"CCUIAppLaunchOriginControlCenter";
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
  v2 = (void *)_sharedOpenApplicationOptions___options;
  _sharedOpenApplicationOptions___options = v1;
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_6);
  }
}

uint64_t __38__CCUIContentModuleContext_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ControlCenter.Module", "AppLauncher");
  uint64_t v1 = kApplicationLauncherLog;
  kApplicationLauncherLog = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (CCUIContentModuleContext)initWithModuleIdentifier:(id)a3 uniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CCUIContentModuleContext;
  v8 = [(CCUIContentModuleContext *)&v19 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSUUID *)v9;

    uint64_t v11 = [v6 copy];
    moduleIdentifier = v8->_moduleIdentifier;
    v8->_moduleIdentifier = (NSString *)v11;

    v13 = [MEMORY[0x1E4F4F730] serial];
    v14 = [v13 autoreleaseFrequency:1];
    v15 = [v14 serviceClass:25];
    uint64_t v16 = BSDispatchQueueCreate();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v16;
  }
  return v8;
}

- (void)requestAuthenticationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CCUIContentModuleContext *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__CCUIContentModuleContext_requestAuthenticationWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6AD4708;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __71__CCUIContentModuleContext_requestAuthenticationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  SBSRequestPasscodeUnlockAlertUI();
}

uint64_t __71__CCUIContentModuleContext_requestAuthenticationWithCompletionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() _sharedOpenApplicationOptions];
  uint64_t v9 = [(CCUIContentModuleContext *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CCUIContentModuleContext_openURL_completionHandler___block_invoke;
  block[3] = &unk_1E6AD4730;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(v9, block);
}

void __54__CCUIContentModuleContext_openURL_completionHandler___block_invoke(uint64_t *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  id v10 = 0;
  uint64_t v5 = [v2 openSensitiveURL:v3 withOptions:v4 error:&v10];
  id v6 = v10;

  id v7 = kApplicationLauncherLog;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)kApplicationLauncherLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1D834A000, v7, OS_LOG_TYPE_DEFAULT, "Launched URL %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)kApplicationLauncherLog, OS_LOG_TYPE_ERROR))
  {
    __54__CCUIContentModuleContext_openURL_completionHandler___block_invoke_cold_1(a1 + 4, (uint64_t)v6, v7);
  }
  uint64_t v9 = a1[6];
  if (v9) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v5);
  }
}

- (void)openApplication:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() _sharedOpenApplicationOptions];
  [(CCUIContentModuleContext *)self openApplication:v7 withOptions:v8 completionHandler:v6];
}

- (void)openApplication:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(id)objc_opt_class() _sharedOpenAppService];
  id v11 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__CCUIContentModuleContext_openApplication_withOptions_completionHandler___block_invoke;
  v14[3] = &unk_1E6AD4758;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  [v10 openApplication:v13 withOptions:v11 completion:v14];
}

void __74__CCUIContentModuleContext_openApplication_withOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = kApplicationLauncherLog;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)kApplicationLauncherLog, OS_LOG_TYPE_ERROR)) {
      __74__CCUIContentModuleContext_openApplication_withOptions_completionHandler___block_invoke_cold_1(a1, v7);
    }
  }
  else if (os_log_type_enabled((os_log_t)kApplicationLauncherLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138543362;
    uint64_t v11 = v8;
    _os_log_impl(&dword_1D834A000, v7, OS_LOG_TYPE_DEFAULT, "Launched application %{public}@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, BOOL))(v9 + 16))(v9, v6 == 0);
  }
}

- (void)enqueueStatusUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__CCUIContentModuleContext_enqueueStatusUpdate___block_invoke;
  v6[3] = &unk_1E6AD4340;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __48__CCUIContentModuleContext_enqueueStatusUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 contentModuleContext:*(void *)(a1 + 32) enqueueStatusUpdate:*(void *)(a1 + 40)];
}

- (void)setHomeGestureDismissalAllowed:(BOOL)a3
{
}

void __59__CCUIContentModuleContext_setHomeGestureDismissalAllowed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contentModuleContext:*(void *)(a1 + 32) didUpdateHomeGestureDismissalAllowed:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)requestExpandModule
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CCUIContentModuleContext_requestExpandModule__block_invoke;
  block[3] = &unk_1E6AD41E8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __47__CCUIContentModuleContext_requestExpandModule__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 requestExpandModuleForContentModuleContext:*(void *)(a1 + 32)];
}

- (void)dismissModule
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CCUIContentModuleContext_dismissModule__block_invoke;
  block[3] = &unk_1E6AD41E8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __41__CCUIContentModuleContext_dismissModule__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dismissExpandedViewForContentModuleContext:*(void *)(a1 + 32)];
}

- (void)dismissControlCenter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CCUIContentModuleContext_dismissControlCenter__block_invoke;
  block[3] = &unk_1E6AD41E8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __48__CCUIContentModuleContext_dismissControlCenter__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dismissControlCenterForContentModuleContext:*(void *)(a1 + 32)];
}

- (void)requestLayoutSizeUpdate
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CCUIContentModuleContext_requestLayoutSizeUpdate__block_invoke;
  block[3] = &unk_1E6AD41E8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__CCUIContentModuleContext_requestLayoutSizeUpdate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 requestModuleLayoutSizeUpdateForContentModuleContext:*(void *)(a1 + 32)];
  }
}

- (id)sensorActivityDataForActiveSensorType:(unint64_t)a3
{
  id v5 = [(CCUIContentModuleContext *)self delegate];
  id v6 = [v5 contentModuleContext:self requestsSensorActivityDataForActiveSensorType:a3];

  return v6;
}

- (CCUISensorActivityData)sensorActivityDataEligibleForInactiveMicModeSelection
{
  uint64_t v3 = [(CCUIContentModuleContext *)self delegate];
  id v4 = [v3 contentModuleContextRequestsSensorActivityDataEligibleForInactiveMicModeSelection:self];

  return (CCUISensorActivityData *)v4;
}

- (CCUIModuleLayoutSize)moduleLayoutSizeForOrientation:(int64_t)a3
{
  id v5 = [(CCUIContentModuleContext *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 moduleLayoutSizeForContentModuleContext:self forOrientation:a3];
    unint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v8 = 0;
  }

  unint64_t v9 = v6;
  unint64_t v10 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (BOOL)isDevicePasscodeLocked
{
  uint64_t v3 = [(CCUIContentModuleContext *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isDevicePasscodeLockedForContentModuleContext:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (void)setAnimationsPermitted:(BOOL)a3 inWindow:(id)a4
{
  id v9 = a4;
  if (!v9 && !a3)
  {
    unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"CCUIContentModuleContext.m" lineNumber:217 description:@"A window is required in order to disable animations"];
  }
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (a3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = [v9 _contextId];
  }
  __animationsDisabledContextID = v7;
  MEMORY[0x1F41817F8](v7, v9);
}

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

- (CCUIContentModuleContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CCUIContentModuleContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);
}

void __54__CCUIContentModuleContext_openURL_completionHandler___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D834A000, log, OS_LOG_TYPE_ERROR, "Failed to launch URL %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __74__CCUIContentModuleContext_openApplication_withOptions_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D834A000, a2, OS_LOG_TYPE_ERROR, "Failed to launch application %{public}@", (uint8_t *)&v3, 0xCu);
}

@end