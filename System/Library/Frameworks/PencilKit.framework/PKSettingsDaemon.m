@interface PKSettingsDaemon
+ (BOOL)autoRefineEnabled;
+ (id)daemonQueue;
+ (void)_dispatchWithErrorHandler:(id)a3 successHandler:(id)a4;
+ (void)openPencilPreferences;
+ (void)prefersPencilOnlyDrawing:(BOOL)a3;
+ (void)prewarmServiceConnectionIfNeeded;
+ (void)setAutoRefineEnabled:(BOOL)a3;
+ (void)setCurrentScribbleLanguageIdentifiers:(id)a3;
+ (void)setPrefersPencilHoverPreviewEnabled:(BOOL)a3 withCompletion:(id)a4;
+ (void)setPrefersPencilOnlyDrawing:(BOOL)a3;
@end

@implementation PKSettingsDaemon

+ (BOOL)autoRefineEnabled
{
  if (_os_feature_enabled_impl()
    && PKIsPadDevice()
    && CHGetPersonalizedSynthesisSupportState() >= 3
    && PKCurrentAppSupportsRefinement()
    && [(id)objc_opt_class() hasAutoRefineLocaleEnabled])
  {
    v2 = PKUIKitUserDefaults();
    v3 = [v2 objectForKey:@"UIAutoRefineEnabledKey"];

    if (v3) {
      LOBYTE(v3) = [v2 BOOLForKey:@"UIAutoRefineEnabledKey"];
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

+ (void)prewarmServiceConnectionIfNeeded
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PKSettingsDaemon_prewarmServiceConnectionIfNeeded__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (prewarmServiceConnectionIfNeeded_onceToken != -1) {
    dispatch_once(&prewarmServiceConnectionIfNeeded_onceToken, block);
  }
}

uint64_t __52__PKSettingsDaemon_prewarmServiceConnectionIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dispatchWithErrorHandler:&__block_literal_global_58 successHandler:&__block_literal_global_7_1];
}

void __52__PKSettingsDaemon_prewarmServiceConnectionIfNeeded__block_invoke_2()
{
  v0 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_1C44F8000, v0, OS_LOG_TYPE_ERROR, "Error creating connection to settings service", v1, 2u);
  }
}

void __52__PKSettingsDaemon_prewarmServiceConnectionIfNeeded__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 getGlobalPrefersPencilHoverPreviewEnabledWithCompletion:&__block_literal_global_11_0];
  }
  v3 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Successfully created connection to settings service", v4, 2u);
  }
}

+ (id)daemonQueue
{
  if (qword_1EB3C6098 != -1) {
    dispatch_once(&qword_1EB3C6098, &__block_literal_global_14);
  }
  id v2 = (void *)_MergedGlobals_145;

  return v2;
}

void __31__PKSettingsDaemon_daemonQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.PencilKit.settingsDaemon", 0);
  v1 = (void *)_MergedGlobals_145;
  _MergedGlobals_145 = (uint64_t)v0;
}

+ (void)setPrefersPencilOnlyDrawing:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__PKSettingsDaemon_setPrefersPencilOnlyDrawing___block_invoke_18;
  v3[3] = &__block_descriptor_33_e38_v16__0___CHPKRemoteSettingsProtocol__8l;
  BOOL v4 = a3;
  [a1 _dispatchWithErrorHandler:&__block_literal_global_17 successHandler:v3];
}

void __48__PKSettingsDaemon_setPrefersPencilOnlyDrawing___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412546;
    v5 = @"prefersPencilOnlyDrawing";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_ERROR, "Error creating xpc connection to set %@: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __48__PKSettingsDaemon_setPrefersPencilOnlyDrawing___block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"YES";
    if (!*(unsigned char *)(a1 + 32)) {
      v5 = @"NO";
    }
    int v6 = 138412546;
    id v7 = @"prefersPencilOnlyDrawing";
    __int16 v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Setting %@ : %@", (uint8_t *)&v6, 0x16u);
  }

  [v3 setGlobalPrefersPencilOnlyDrawing:*(unsigned __int8 *)(a1 + 32)];
}

+ (void)prefersPencilOnlyDrawing:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__PKSettingsDaemon_prefersPencilOnlyDrawing___block_invoke_28;
  v3[3] = &__block_descriptor_33_e38_v16__0___CHPKRemoteSettingsProtocol__8l;
  BOOL v4 = a3;
  [a1 _dispatchWithErrorHandler:&__block_literal_global_27 successHandler:v3];
}

void __45__PKSettingsDaemon_prefersPencilOnlyDrawing___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412546;
    v5 = @"prefersPencilOnlyDrawing";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_ERROR, "Error creating xpc connection to set %@: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __45__PKSettingsDaemon_prefersPencilOnlyDrawing___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"YES";
    if (!*(unsigned char *)(a1 + 32)) {
      v5 = @"NO";
    }
    int v6 = 138412546;
    id v7 = @"prefersPencilOnlyDrawing";
    __int16 v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Setting %@ : %@", (uint8_t *)&v6, 0x16u);
  }

  [v3 setGlobalPrefersPencilOnlyDrawing:*(unsigned __int8 *)(a1 + 32)];
}

+ (void)setAutoRefineEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__PKSettingsDaemon_setAutoRefineEnabled___block_invoke_31;
  v3[3] = &__block_descriptor_33_e38_v16__0___CHPKRemoteSettingsProtocol__8l;
  BOOL v4 = a3;
  [a1 _dispatchWithErrorHandler:&__block_literal_global_30 successHandler:v3];
}

void __41__PKSettingsDaemon_setAutoRefineEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412546;
    v5 = @"UIAutoRefineEnabledKey";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_ERROR, "Error creating xpc connection to set %@: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __41__PKSettingsDaemon_setAutoRefineEnabled___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 32);
    int v6 = 138412546;
    id v7 = @"UIAutoRefineEnabledKey";
    __int16 v8 = 1024;
    int v9 = v5;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Setting '%@' to %{BOOL}d", (uint8_t *)&v6, 0x12u);
  }

  if (objc_opt_respondsToSelector()) {
    [v3 setGlobalAutoRefineEnabled:*(unsigned __int8 *)(a1 + 32) withCompletion:&__block_literal_global_36];
  }
}

void __41__PKSettingsDaemon_setAutoRefineEnabled___block_invoke_34()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PKRemoteAutoRefineSettingsDidChange", 0, 0, 1u);
}

+ (void)openPencilPreferences
{
}

void __41__PKSettingsDaemon_openPencilPreferences__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_ERROR, "Error opening pencil preferences from palette: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __41__PKSettingsDaemon_openPencilPreferences__block_invoke_39(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Opening Pencil Settings", v4, 2u);
  }

  [v2 openPencilSettings];
}

+ (void)setCurrentScribbleLanguageIdentifiers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PKSettingsDaemon_setCurrentScribbleLanguageIdentifiers___block_invoke_44;
  v6[3] = &unk_1E64C9760;
  id v7 = v4;
  id v5 = v4;
  [a1 _dispatchWithErrorHandler:&__block_literal_global_43 successHandler:v6];
}

void __58__PKSettingsDaemon_setCurrentScribbleLanguageIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412546;
    id v5 = @"CurrentScribbleLanguages";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_ERROR, "Error creating xpc connection to set %@: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __58__PKSettingsDaemon_setCurrentScribbleLanguageIdentifiers___block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = @"CurrentScribbleLanguages";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Setting %@ : %@", (uint8_t *)&v6, 0x16u);
  }

  if (objc_opt_respondsToSelector()) {
    [v3 setCurrentScribbleLanguageIdentifiers:*(void *)(a1 + 32)];
  }
}

+ (void)setPrefersPencilHoverPreviewEnabled:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke;
  aBlock[3] = &unk_1E64C6060;
  id v16 = v6;
  id v7 = v6;
  __int16 v8 = _Block_copy(aBlock);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke_2;
  v13[3] = &unk_1E64C9788;
  id v14 = v8;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke_47;
  v10[3] = &unk_1E64C97B0;
  BOOL v12 = a3;
  id v11 = v14;
  id v9 = v14;
  [a1 _dispatchWithErrorHandler:v13 successHandler:v10];
}

uint64_t __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *MEMORY[0x1E4FB2E50];
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_ERROR, "Error creating xpc connection to set %@: %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = objc_opt_respondsToSelector();
  uint64_t v5 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *MEMORY[0x1E4FB2E50];
      __int16 v8 = @"YES";
      if (!*(unsigned char *)(a1 + 40)) {
        __int16 v8 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Setting %@ to %@", buf, 0x16u);
    }

    uint64_t v9 = *(unsigned __int8 *)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke_50;
    v12[3] = &unk_1E64C6060;
    id v13 = *(id *)(a1 + 32);
    [v3 setGlobalPrefersPencilHoverPreviewEnabled:v9 withCompletion:v12];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *MEMORY[0x1E4FB2E50];
      id v11 = @"YES";
      if (!*(unsigned char *)(a1 + 40)) {
        id v11 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_error_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_ERROR, "Unable to set %@ to %@. Proxy doesn't respond to method.", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke_50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_dispatchWithErrorHandler:(id)a3 successHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [a1 daemonQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__PKSettingsDaemon__dispatchWithErrorHandler_successHandler___block_invoke;
  v11[3] = &unk_1E64C9800;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __61__PKSettingsDaemon__dispatchWithErrorHandler_successHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.handwritingd.pksettings" options:0];
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F20A74E8];
  [v2 setRemoteObjectInterface:v3];
  [v2 resume];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  __int16 v8 = __61__PKSettingsDaemon__dispatchWithErrorHandler_successHandler___block_invoke_2;
  id v9 = &unk_1E64C97D8;
  id v10 = *(id *)(a1 + 32);
  id v11 = &v12;
  char v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&v6];
  if (!*((unsigned char *)v13 + 24))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
    }
  }
  objc_msgSend(v2, "invalidate", v6, v7, v8, v9);

  _Block_object_dispose(&v12, 8);
}

uint64_t __61__PKSettingsDaemon__dispatchWithErrorHandler_successHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

@end