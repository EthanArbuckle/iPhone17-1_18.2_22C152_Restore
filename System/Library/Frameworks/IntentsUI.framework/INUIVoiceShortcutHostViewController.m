@interface INUIVoiceShortcutHostViewController
+ (id)_voiceShortcutUIExtension;
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
+ (void)getViewControllerCompletion:(id)a3;
+ (void)getViewControllerForAddingShortcut:(id)a3 completion:(id)a4;
+ (void)getViewControllerForEditingVoiceShortcut:(id)a3 completion:(id)a4;
+ (void)initialize;
- (INUIVoiceShortcutHostContext)serviceContext;
- (INUIVoiceShortcutRemoteViewControllerDelegate)delegate;
- (int64_t)mode;
- (void)remoteViewControllerDidCancel;
- (void)remoteViewControllerDidCreateVoiceShortcut:(id)a3 error:(id)a4;
- (void)remoteViewControllerDidDeleteVoiceShortcutWithIdentifier:(id)a3;
- (void)remoteViewControllerDidUpdateVoiceShortcut:(id)a3 error:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setServiceContext:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation INUIVoiceShortcutHostViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceContext, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (INUIVoiceShortcutHostContext)serviceContext
{
  return self->_serviceContext;
}

- (void)setDelegate:(id)a3
{
}

- (INUIVoiceShortcutRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (INUIVoiceShortcutRemoteViewControllerDelegate *)WeakRetained;
}

- (void)remoteViewControllerDidCancel
{
  id v2 = [(INUIVoiceShortcutHostViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 remoteViewControllerDidCancel];
  }
}

- (void)remoteViewControllerDidDeleteVoiceShortcutWithIdentifier:(id)a3
{
  id v5 = a3;
  v4 = [(INUIVoiceShortcutHostViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 remoteViewControllerDidDeleteVoiceShortcutWithIdentifier:v5];
  }
}

- (void)remoteViewControllerDidUpdateVoiceShortcut:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(INUIVoiceShortcutHostViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 remoteViewControllerDidUpdateVoiceShortcut:v8 error:v6];
  }
}

- (void)remoteViewControllerDidCreateVoiceShortcut:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(INUIVoiceShortcutHostViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 remoteViewControllerDidCreateVoiceShortcut:v8 error:v6];
  }
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [(INUIVoiceShortcutHostViewController *)self mode];
  id v6 = @"Unknown";
  if (v5 == 1) {
    id v6 = @"Add";
  }
  if (v5 == 2) {
    id v6 = @"Edit";
  }
  v7 = v6;
  id v8 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    v10 = "-[INUIVoiceShortcutHostViewController viewServiceDidTerminateWithError:]";
    __int16 v11 = 2112;
    v12 = v7;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_20A3EB000, v8, OS_LOG_TYPE_INFO, "%s VoiceShortcutUIExtension view service (for %@) terminated with error=%{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)setServiceContext:(id)a3
{
  id v4 = (INUIVoiceShortcutHostContext *)a3;
  [(INUIVoiceShortcutHostContext *)self->_serviceContext setDelegate:0];
  serviceContext = self->_serviceContext;
  self->_serviceContext = v4;
  id v6 = v4;

  [(INUIVoiceShortcutHostContext *)self->_serviceContext setDelegate:self];
}

+ (id)serviceViewControllerInterface
{
  return +[INUIVoiceShortcutXPCInterface remoteViewControllerServingInterface];
}

+ (id)exportedInterface
{
  return +[INUIVoiceShortcutXPCInterface remoteViewControllerHostingInterface];
}

+ (void)getViewControllerCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [a1 _voiceShortcutUIExtension];
  if (v5)
  {
    id v6 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[INUIVoiceShortcutHostViewController getViewControllerCompletion:]";
      __int16 v22 = 2114;
      v23 = v5;
      _os_log_impl(&dword_20A3EB000, v6, OS_LOG_TYPE_INFO, "%s Instantiating view controller from extension: %{public}@", buf, 0x16u);
    }
    id v7 = objc_alloc_init(MEMORY[0x263F08810]);
    id v8 = [MEMORY[0x263F01890] bundleRecordForCurrentProcess];
    int v9 = [v8 URL];

    id v10 = [v9 path];
    [v10 UTF8String];
    __int16 v11 = (const char *)sandbox_extension_issue_file();

    v18[0] = @"INUIVoiceShortcutExtensionItemBundleURL";
    v18[1] = @"INUIVoiceShortcutExtensionItemSandboxExtensionData";
    v19[0] = v9;
    v12 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v11 length:strlen(v11) + 1];
    v19[1] = v12;
    __int16 v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    [v7 setUserInfo:v13];

    id v17 = v7;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __67__INUIVoiceShortcutHostViewController_getViewControllerCompletion___block_invoke;
    v15[3] = &unk_263FD6B78;
    id v16 = v4;
    [v5 instantiateViewControllerWithInputItems:v14 listenerEndpoint:0 connectionHandler:v15];
  }
  else
  {
    INIntentError();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v7);
  }
}

void __67__INUIVoiceShortcutHostViewController_getViewControllerCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v12 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[INUIVoiceShortcutHostViewController getViewControllerCompletion:]_block_invoke";
      __int16 v19 = 2114;
      id v20 = v9;
      _os_log_error_impl(&dword_20A3EB000, v12, OS_LOG_TYPE_ERROR, "%s Failed to instantiate view service: %{public}@", buf, 0x16u);
    }
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = INIntentError();
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
    goto LABEL_12;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  __int16 v11 = *MEMORY[0x263F0F810];
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[INUIVoiceShortcutHostViewController getViewControllerCompletion:]_block_invoke";
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_error_impl(&dword_20A3EB000, v11, OS_LOG_TYPE_ERROR, "%s Unexpected remoteViewController class: %{public}@", buf, 0x16u);
    }
    uint64_t v15 = *(void *)(a1 + 32);
    id v14 = [NSString stringWithFormat:@"Unexpected remoteViewController class: %@", v8];
    id v16 = INIntentError();
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);

LABEL_12:
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "+[INUIVoiceShortcutHostViewController getViewControllerCompletion:]_block_invoke";
    __int16 v19 = 2114;
    id v20 = v8;
    __int16 v21 = 2114;
    id v22 = v7;
    _os_log_impl(&dword_20A3EB000, v11, OS_LOG_TYPE_INFO, "%s Got view controller %{public}@ identifier=%{public}@", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_13:
}

+ (void)getViewControllerForEditingVoiceShortcut:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91__INUIVoiceShortcutHostViewController_getViewControllerForEditingVoiceShortcut_completion___block_invoke;
  v10[3] = &unk_263FD6810;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [a1 getViewControllerCompletion:v10];
}

void __91__INUIVoiceShortcutHostViewController_getViewControllerForEditingVoiceShortcut_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    [v3 setMode:2];
    id v4 = [v5 remoteViewControllerProxy];
    [v4 buildForEditingVoiceShortcut:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)getViewControllerForAddingShortcut:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  id v8 = v6;
  id v35 = v8;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  v32[4] = __Block_byref_object_dispose_;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy_;
  v30[4] = __Block_byref_object_dispose_;
  id v31 = 0;
  id v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __85__INUIVoiceShortcutHostViewController_getViewControllerForAddingShortcut_completion___block_invoke;
  v25 = &unk_263FD6798;
  id v10 = v8;
  id v26 = v10;
  v28 = v30;
  v29 = v34;
  dispatch_group_t v27 = v9;
  INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler();
  dispatch_group_enter(v27);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  void v18[2] = __85__INUIVoiceShortcutHostViewController_getViewControllerForAddingShortcut_completion___block_invoke_4;
  v18[3] = &unk_263FD67C0;
  id v20 = v30;
  __int16 v21 = v32;
  id v11 = v27;
  __int16 v19 = v11;
  [a1 getViewControllerCompletion:v18];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__INUIVoiceShortcutHostViewController_getViewControllerForAddingShortcut_completion___block_invoke_6;
  block[3] = &unk_263FD67E8;
  id v14 = v7;
  uint64_t v15 = v32;
  id v16 = v34;
  id v17 = v30;
  id v12 = v7;
  dispatch_group_notify(v11, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v34, 8);
}

void __85__INUIVoiceShortcutHostViewController_getViewControllerForAddingShortcut_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 136315650;
      id v12 = "+[INUIVoiceShortcutHostViewController getViewControllerForAddingShortcut:completion:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_error_impl(&dword_20A3EB000, v8, OS_LOG_TYPE_ERROR, "%s Error injecting image proxies into %{publc}@: %{public}@", (uint8_t *)&v11, 0x20u);
    }
    uint64_t v9 = a1 + 48;
  }
  else
  {
    uint64_t v9 = a1 + 56;
    a3 = a2;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)v9 + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __85__INUIVoiceShortcutHostViewController_getViewControllerForAddingShortcut_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      id v12 = "+[INUIVoiceShortcutHostViewController getViewControllerForAddingShortcut:completion:]_block_invoke";
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_error_impl(&dword_20A3EB000, v7, OS_LOG_TYPE_ERROR, "%s Error getting hosted view controller, error: %{public}@", (uint8_t *)&v11, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__INUIVoiceShortcutHostViewController_getViewControllerForAddingShortcut_completion___block_invoke_6(void *a1)
{
  id v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (v2)
  {
    [v2 setMode:1];
    id v3 = [*(id *)(*(void *)(a1[5] + 8) + 40) remoteViewControllerProxy];
    [v3 buildForAddingShortcut:*(void *)(*(void *)(a1[6] + 8) + 40)];
  }
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1[7] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

+ (id)_voiceShortcutUIExtension
{
  if (_voiceShortcutUIExtension_onceToken != -1) {
    dispatch_once(&_voiceShortcutUIExtension_onceToken, &__block_literal_global);
  }
  id v2 = (void *)_voiceShortcutUIExtension_extension;

  return v2;
}

void __64__INUIVoiceShortcutHostViewController__voiceShortcutUIExtension__block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = 0;
  uint64_t v0 = [MEMORY[0x263F08800] extensionWithIdentifier:@"com.apple.WorkflowUI.AddShortcutExtension" error:&v4];
  id v1 = v4;
  id v2 = (void *)_voiceShortcutUIExtension_extension;
  _voiceShortcutUIExtension_extension = v0;

  if (!_voiceShortcutUIExtension_extension)
  {
    id v3 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v6 = "+[INUIVoiceShortcutHostViewController _voiceShortcutUIExtension]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v1;
      _os_log_error_impl(&dword_20A3EB000, v3, OS_LOG_TYPE_ERROR, "%s Could not get VoiceShortcutUI extension: %@", buf, 0x16u);
    }
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x270EF5260]();
  }
}

@end