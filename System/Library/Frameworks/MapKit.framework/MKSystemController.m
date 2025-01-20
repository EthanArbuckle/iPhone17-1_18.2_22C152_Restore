@interface MKSystemController
+ (id)sharedInstance;
- (BOOL)_isInSpotlight;
- (BOOL)_isRunningInLockScreen;
- (BOOL)_shouldUseLaunchServices;
- (BOOL)isDevicePluggedIn;
- (BOOL)isHiDPI;
- (BOOL)isInternalInstall;
- (BOOL)isPhone6PlusOrLarger;
- (BOOL)isWifiEnabled;
- (BOOL)openURL:(id)a3;
- (BOOL)overrideBlurStyle;
- (BOOL)reduceMotionEnabled;
- (BOOL)requiresRTT;
- (BOOL)shouldCaptureMapViewGestureAnalytics;
- (BOOL)supports3DImagery;
- (BOOL)supports3DMaps;
- (BOOL)supportsAlwaysOnCompass;
- (BOOL)supportsPitchAPI;
- (CGSize)screenSize;
- (MKSystemControllerOpenURLDelegate)openURLDelegate;
- (double)screenScale;
- (id)_defaultOpenURLOptions;
- (int)userInterfaceIdiom;
- (void)openURL:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)openURL:(id)a3 fromScene:(id)a4 completionHandler:(id)a5;
- (void)openUserActivity:(id)a3 withApplicationRecord:(id)a4 requireOptionKeyPromptUnlockDevice:(BOOL)a5 completionHandler:(id)a6;
- (void)placeDialRequest:(id)a3 completionHandler:(id)a4;
- (void)setOpenURLDelegate:(id)a3;
@end

@implementation MKSystemController

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MKSystemController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB315F88 != -1) {
    dispatch_once(&qword_1EB315F88, block);
  }
  v2 = (void *)qword_1EB315F80;

  return v2;
}

- (int)userInterfaceIdiom
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((unint64_t)(v3 - 1) > 5) {
    return 0;
  }
  else {
    return dword_18BD1B4D0[v3 - 1];
  }
}

- (BOOL)supportsPitchAPI
{
  uint64_t v3 = [MEMORY[0x1E4F64860] sharedPlatform];
  char v4 = [v3 mapsFeatureFreedomEnabled];

  if (v4) {
    return 1;
  }

  return [(MKSystemController *)self supports3DMaps];
}

- (BOOL)supports3DMaps
{
  v2 = [MEMORY[0x1E4F64860] sharedPlatform];
  char v3 = [v2 mapsFeatureFreedomEnabled];

  if (v3) {
    return 1;
  }
  if (qword_1EB315F98 != -1) {
    dispatch_once(&qword_1EB315F98, &__block_literal_global_32);
  }
  return byte_1EB315F71 != 0;
}

- (BOOL)isInternalInstall
{
  v2 = [MEMORY[0x1E4F64860] sharedPlatform];
  char v3 = [v2 isInternalInstall];

  return v3;
}

- (double)screenScale
{
  v2 = (void *)MGCopyAnswer();
  double v3 = 1.0;
  if (v2)
  {
    char v4 = v2;
    CFTypeID v5 = CFGetTypeID(v2);
    if (v5 == CFNumberGetTypeID())
    {
      [v4 floatValue];
      double v3 = v6;
    }
    CFRelease(v4);
  }
  if (v3 <= 0.0) {
    return 1.0;
  }
  else {
    return v3;
  }
}

- (BOOL)requiresRTT
{
  return ![(MKSystemController *)self supports3DMaps];
}

uint64_t __45__MKSystemController_supportsAlwaysOnCompass__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _MergedGlobals_155 = result;
  return result;
}

uint64_t __36__MKSystemController_supports3DMaps__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB315F71 = result;
  return result;
}

void __36__MKSystemController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB315F80;
  qword_1EB315F80 = (uint64_t)v1;
}

- (BOOL)supportsAlwaysOnCompass
{
  if (qword_1EB315F90 != -1) {
    dispatch_once(&qword_1EB315F90, &__block_literal_global_61);
  }
  return _MergedGlobals_155;
}

- (BOOL)isWifiEnabled
{
  v2 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  char v3 = [v2 isWiFiEnabled];

  return v3;
}

- (BOOL)isDevicePluggedIn
{
  int out_token = 0;
  notify_register_check("com.apple.springboard.pluggedin", &out_token);
  uint64_t v3 = 0;
  notify_get_state(out_token, &v3);
  notify_cancel(out_token);
  return v3 != 0;
}

- (BOOL)isPhone6PlusOrLarger
{
  if ([(MKSystemController *)self userInterfaceIdiom]) {
    return 0;
  }
  [(MKSystemController *)self screenSize];
  return v5 > 667.0 || v4 > 667.0;
}

- (CGSize)screenSize
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isHiDPI
{
  [(MKSystemController *)self screenScale];
  return v2 > 1.0;
}

- (BOOL)supports3DImagery
{
  double v2 = [MEMORY[0x1E4F64860] sharedPlatform];
  char v3 = [v2 mapsFeatureFreedomEnabled];

  if (v3) {
    return 1;
  }
  if (qword_1EB315FA0 != -1) {
    dispatch_once(&qword_1EB315FA0, &__block_literal_global_37_0);
  }
  return byte_1EB315F72 != 0;
}

uint64_t __39__MKSystemController_supports3DImagery__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB315F72 = result;
  return result;
}

- (BOOL)reduceMotionEnabled
{
  return _AXSReduceMotionEnabled() != 0;
}

- (id)_defaultOpenURLOptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = getFBSOpenApplicationOptionKeyPromptUnlockDevice();
  char v3 = (void *)v2;
  if (v2)
  {
    uint64_t v7 = v2;
    double v4 = [NSNumber numberWithBool:1];
    v8[0] = v4;
    double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (BOOL)_isInSpotlight
{
  if (qword_1EB315FA8 != -1) {
    dispatch_once(&qword_1EB315FA8, &__block_literal_global_45);
  }
  return byte_1EB315F73;
}

void __36__MKSystemController__isInSpotlight__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  byte_1EB315F73 = [v0 isEqualToString:@"com.apple.Spotlight"];
}

- (BOOL)_shouldUseLaunchServices
{
  char v3 = [MEMORY[0x1E4F42738] sharedApplication];

  if (!v3 || (_UIApplicationIsExtension() & 1) != 0 || [(MKSystemController *)self _isInSpotlight]) {
    return 1;
  }

  return [(MKSystemController *)self _isRunningInLockScreen];
}

- (BOOL)_isRunningInLockScreen
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication", 0);
  char v3 = [v2 connectedScenes];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    uint64_t v7 = *MEMORY[0x1E4F44298];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 session];
        v11 = [v10 role];
        if ([v11 isEqualToString:v7])
        {
          if (![v9 activationState])
          {

LABEL_15:
            BOOL v13 = 1;
            goto LABEL_16;
          }
          uint64_t v12 = [v9 activationState];

          if (v12 == 1) {
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_16:

  return v13;
}

- (BOOL)openURL:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_openURLDelegate);
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained openURL:v4 completionHandler:0];
  }
  else if ([(MKSystemController *)self _shouldUseLaunchServices] {
         || ([(id)*MEMORY[0x1E4F43630] openURL:v4] & 1) == 0)
  }
  {
    double v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v9 = [(MKSystemController *)self _defaultOpenURLOptions];
    char v7 = [v8 openURL:v4 withOptions:v9 error:0];

    goto LABEL_7;
  }
  char v7 = 1;
LABEL_7:

  return v7;
}

- (void)openURL:(id)a3 fromScene:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    v10 = (objc_class *)MEMORY[0x1E4F224A0];
    id v11 = a3;
    id v12 = objc_alloc_init(v10);
    BOOL v13 = [v8 _currentOpenApplicationEndpoint];
    [v12 setTargetConnectionEndpoint:v13];

    v14 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__MKSystemController_openURL_fromScene_completionHandler___block_invoke;
    v15[3] = &unk_1E54BBAD0;
    id v16 = v9;
    [v14 openURL:v11 configuration:v12 completionHandler:v15];
  }
  else
  {
    id v12 = a3;
    [(MKSystemController *)self openURL:v12 completionHandler:v9];
  }
}

uint64_t __58__MKSystemController_openURL_fromScene_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3 == 0);
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_openURLDelegate);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained openURL:v6 completionHandler:v7];
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __48__MKSystemController_openURL_completionHandler___block_invoke;
    v17[3] = &unk_1E54BBAF8;
    v17[4] = self;
    id v10 = v7;
    id v18 = v10;
    id v11 = (void (**)(void, void))MEMORY[0x18C139AE0](v17);
    if ([(MKSystemController *)self _shouldUseLaunchServices])
    {
      ((void (**)(void, id))v11)[2](v11, v6);
    }
    else
    {
      id v12 = (void *)*MEMORY[0x1E4F43630];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __48__MKSystemController_openURL_completionHandler___block_invoke_4;
      v13[3] = &unk_1E54BBB20;
      id v15 = v10;
      id v16 = v11;
      id v14 = v6;
      [v12 openURL:v14 withCompletionHandler:v13];
    }
  }
}

void __48__MKSystemController_openURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__MKSystemController_openURL_completionHandler___block_invoke_2;
  v9[3] = &unk_1E54B9240;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v4;
  id v12 = v5;
  id v6 = v3;
  id v7 = (void *)MEMORY[0x18C139AE0](v9);
  id v8 = dispatch_get_global_queue(25, 0);
  dispatch_async(v8, v7);
}

void __48__MKSystemController_openURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) _defaultOpenURLOptions];
  char v5 = [v2 openURL:v3 withOptions:v4];

  id v6 = *(void **)(a1 + 48);
  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__MKSystemController_openURL_completionHandler___block_invoke_3;
    v7[3] = &unk_1E54BAF98;
    id v8 = v6;
    char v9 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __48__MKSystemController_openURL_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __48__MKSystemController_openURL_completionHandler___block_invoke_4(void *a1, int a2)
{
  if (!a2) {
    return (*(uint64_t (**)(void, void))(a1[6] + 16))(a1[6], a1[4]);
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)placeDialRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isValid])
  {
    char v14 = 0;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    id v7 = (unsigned int (*)(char *))getSBSGetScreenLockStatusSymbolLoc_ptr;
    v23 = getSBSGetScreenLockStatusSymbolLoc_ptr;
    if (!getSBSGetScreenLockStatusSymbolLoc_ptr)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      long long v17 = __getSBSGetScreenLockStatusSymbolLoc_block_invoke;
      id v18 = &unk_1E54B8448;
      v19 = &v20;
      id v8 = (void *)SpringBoardServicesLibrary();
      v21[3] = (uint64_t)dlsym(v8, "SBSGetScreenLockStatus");
      getSBSGetScreenLockStatusSymbolLoc_ptr = *(_UNKNOWN **)(v19[1] + 24);
      id v7 = (unsigned int (*)(char *))v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v7)
    {
      dlerror();
      id v10 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v20, 8);
      _Unwind_Resume(v10);
    }
    if (v7(&v14) && v14) {
      [v5 setShowUIPrompt:0];
    }
    char v9 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MKSystemController_placeDialRequest_completionHandler___block_invoke;
    block[3] = &unk_1E54B8630;
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v9, block);
  }
}

void __57__MKSystemController_placeDialRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  uint64_t v2 = (void *)getTUCallCenterClass_softClass;
  uint64_t v14 = getTUCallCenterClass_softClass;
  if (!getTUCallCenterClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getTUCallCenterClass_block_invoke;
    v10[3] = &unk_1E54B8448;
    v10[4] = &v11;
    __getTUCallCenterClass_block_invoke((uint64_t)v10);
    uint64_t v2 = (void *)v12[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v11, 8);
  uint64_t v4 = (void *)[objc_alloc((Class)v3) initWithQueue:0];
  uint64_t v6 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v7 = v4;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __57__MKSystemController_placeDialRequest_completionHandler___block_invoke_2;
    v8[3] = &unk_1E54B9C60;
    id v9 = v5;
    [v7 launchAppForDialRequest:v6 completion:v8];
  }
  else
  {
    [v4 launchAppForDialRequest:v6 completion:0];
  }
}

void __57__MKSystemController_placeDialRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__MKSystemController_placeDialRequest_completionHandler___block_invoke_3;
  v6[3] = &unk_1E54B8360;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __57__MKSystemController_placeDialRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)openURL:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_openURLDelegate);
  id v12 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained openURL:v8 bundleIdentifier:v9 completionHandler:v10];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    uint64_t v14 = [v13 operationToOpenResource:v8 usingApplication:v9 userInfo:0];

    if (v14)
    {
      if (v10)
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __65__MKSystemController_openURL_bundleIdentifier_completionHandler___block_invoke;
        v18[3] = &unk_1E54B82E8;
        id v19 = v10;
        [v14 setCompletionBlock:v18];
      }
      uint64_t v15 = dispatch_get_global_queue(25, 0);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __65__MKSystemController_openURL_bundleIdentifier_completionHandler___block_invoke_3;
      v16[3] = &unk_1E54B8188;
      id v17 = v14;
      dispatch_async(v15, v16);
    }
    else if (v10)
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

void __65__MKSystemController_openURL_bundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MKSystemController_openURL_bundleIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_1E54B82E8;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __65__MKSystemController_openURL_bundleIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__MKSystemController_openURL_bundleIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

- (void)openUserActivity:(id)a3 withApplicationRecord:(id)a4 requireOptionKeyPromptUnlockDevice:(BOOL)a5 completionHandler:(id)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_opt_new();
  id v12 = getFBSOpenApplicationOptionKeyPromptUnlockDevice();
  id v18 = v12;
  v19[0] = MEMORY[0x1E4F1CC38];
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  [v11 setFrontBoardOptions:v13];

  uint64_t v14 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __114__MKSystemController_openUserActivity_withApplicationRecord_requireOptionKeyPromptUnlockDevice_completionHandler___block_invoke;
  v16[3] = &unk_1E54BBB48;
  id v17 = v8;
  id v15 = v8;
  [v14 openUserActivity:v10 usingApplicationRecord:v9 configuration:v11 completionHandler:v16];
}

uint64_t __114__MKSystemController_openUserActivity_withApplicationRecord_requireOptionKeyPromptUnlockDevice_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)overrideBlurStyle
{
  if (qword_1EB315FB0 != -1) {
    dispatch_once(&qword_1EB315FB0, &__block_literal_global_59);
  }
  return byte_1EB315F74;
}

uint64_t __39__MKSystemController_overrideBlurStyle__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB315F74 = result ^ 1;
  return result;
}

- (BOOL)shouldCaptureMapViewGestureAnalytics
{
  if (qword_1EB315FB8 != -1) {
    dispatch_once(&qword_1EB315FB8, &__block_literal_global_64);
  }
  return byte_1EB315F75;
}

void __58__MKSystemController_shouldCaptureMapViewGestureAnalytics__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  size_t v4 = 8;
  unint64_t v5 = 0;
  if (sysctlbyname("hw.memsize", &v5, &v4, 0, 0) < 0)
  {
    id v1 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      id v2 = __error();
      id v3 = strerror(*v2);
      *(_DWORD *)buf = 136315138;
      id v7 = v3;
      _os_log_impl(&dword_18BAEC000, v1, OS_LOG_TYPE_ERROR, "sysctlbyname failed with err : %s", buf, 0xCu);
    }
  }
  else
  {
    v5 >>= 20;
    unint64_t v0 = v5;
    byte_1EB315F75 = v0 > GEOConfigGetInteger();
  }
}

- (MKSystemControllerOpenURLDelegate)openURLDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_openURLDelegate);

  return (MKSystemControllerOpenURLDelegate *)WeakRetained;
}

- (void)setOpenURLDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end