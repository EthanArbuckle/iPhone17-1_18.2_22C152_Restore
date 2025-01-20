@interface CPSOpenClipCardPresenter
+ (id)responseForOpenClipAction:(BOOL)a3;
+ (id)sharedPresenter;
- (CPSOpenClipCardPresenter)init;
- (void)_activateAlertHandleWithSettings:(id)a3 viewControllerClassName:(id)a4 repsonseHandler:(id)a5;
- (void)_activateAlertHandleWithURL:(id)a3 completionHandler:(id)a4;
- (void)_invalidateSharingClient;
- (void)_performStagedLocationConfirmationDisplayIfNeeded;
- (void)_sharingClientDidInvalidate;
- (void)_showCardWithOptions:(unint64_t)a3 activationHandler:(id)a4 completionHandler:(id)a5;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)showCardWithURL:(id)a3 completionHandler:(id)a4;
- (void)showLocationConfirmationSheetWithRequest:(id)a3 completion:(id)a4;
@end

@implementation CPSOpenClipCardPresenter

+ (id)sharedPresenter
{
  if (sharedPresenter_onceToken != -1) {
    dispatch_once(&sharedPresenter_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedPresenter_presenter;

  return v2;
}

uint64_t __43__CPSOpenClipCardPresenter_sharedPresenter__block_invoke()
{
  sharedPresenter_presenter = objc_alloc_init(CPSOpenClipCardPresenter);

  return MEMORY[0x270F9A758]();
}

- (CPSOpenClipCardPresenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)CPSOpenClipCardPresenter;
  v2 = [(CPSOpenClipCardPresenter *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ClipServices.OpenClipCardPresenter", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)showCardWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__CPSOpenClipCardPresenter_showCardWithURL_completionHandler___block_invoke;
  v10[3] = &unk_26424E678;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CPSOpenClipCardPresenter *)self _showCardWithOptions:119 activationHandler:v10 completionHandler:v8];
}

uint64_t __62__CPSOpenClipCardPresenter_showCardWithURL_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateAlertHandleWithURL:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)showLocationConfirmationSheetWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke;
  v15[3] = &unk_26424E678;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = (void *)MEMORY[0x2166BE5C0](v15);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_10;
  block[3] = &unk_26424E6F0;
  block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(queue, block);
}

void __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_2;
  v6[3] = &unk_26424F900;
  v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v3;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_8;
  v4[3] = &unk_26424ED90;
  id v5 = *(id *)(a1 + 48);
  [v2 _showCardWithOptions:33 activationHandler:v6 completionHandler:v4];
}

void __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v10 = 0;
  id v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v10];
  id v4 = v10;
  if (v4)
  {
    id v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_2_cold_1((uint64_t)v4, v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263F29C78]);
    [v6 setObject:v3 forSetting:0];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_5;
    v8[3] = &unk_26424F8D8;
    id v7 = *(void **)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    [v7 _activateAlertHandleWithSettings:v6 viewControllerClassName:@"CPSLocationAlertViewController" repsonseHandler:v8];
  }
}

void __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 info];
  id v4 = [v3 objectForSetting:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v4 integerValue]);
  }
  else
  {
    id v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_5_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
  }
}

uint64_t __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_8(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = result;
    id v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_8_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    return (*(uint64_t (**)(void))(*(void *)(v2 + 32) + 16))();
  }
  return result;
}

uint64_t __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8) || *(void *)(v1 + 16))
  {
    *(void *)(*(void *)(a1 + 32) + 32) = MEMORY[0x2166BE5C0](*(void *)(a1 + 40));
    return MEMORY[0x270F9A758]();
  }
  else
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v2();
  }
}

- (void)_performStagedLocationConfirmationDisplayIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_stagedLocationConfirmationDisplay && !self->_alertHandle && !self->_sharingClient)
  {
    uint64_t v4 = (void (**)(void))MEMORY[0x2166BE5C0]();
    id stagedLocationConfirmationDisplay = self->_stagedLocationConfirmationDisplay;
    self->_id stagedLocationConfirmationDisplay = 0;

    v4[2]();
  }
}

- (void)_showCardWithOptions:(unint64_t)a3 activationHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke;
  v13[3] = &unk_26424F978;
  v13[4] = self;
  id v14 = v9;
  id v11 = v9;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  id v15 = v8;
  id v12 = v8;
  dispatch_async(queue, v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else if (*(void *)(v2 + 16))
  {
    uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x263F6C1F0]);
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 16);
    *(void *)(v13 + 16) = v12;

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_12;
    v21[3] = &unk_26424EBF8;
    objc_copyWeak(&v22, (id *)(a1 + 56));
    [*(id *)(*(void *)(a1 + 32) + 16) setInvalidationHandler:v21];
    id v15 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v16 = *(void *)(a1 + 64);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_2;
    v17[3] = &unk_26424F950;
    objc_copyWeak(&v20, (id *)(a1 + 56));
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 40);
    [v15 startProxCardTransactionWithOptions:v16 completion:v17];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
  }
}

void __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _sharingClientDidInvalidate];
    id WeakRetained = v2;
  }
}

void __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_2(id *a1, char a2)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[3];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_3;
    v8[3] = &unk_26424F928;
    char v11 = a2;
    id v7 = a1[4];
    void v8[4] = v5;
    id v9 = v7;
    id v10 = a1[5];
    dispatch_async(v6, v8);
  }
}

uint64_t __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v2();
  }
  else
  {
    [*(id *)(a1 + 32) _invalidateSharingClient];
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v4();
  }
}

- (void)_activateAlertHandleWithSettings:(id)a3 viewControllerClassName:(id)a4 repsonseHandler:(id)a5
{
  queue = self->_queue;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2(queue);
  id v18 = (id)[objc_alloc(MEMORY[0x263F79410]) initWithServiceName:@"com.apple.ClipViewService" viewControllerClassName:v10];

  id v12 = objc_alloc_init(MEMORY[0x263F79408]);
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F29BB0]) initWithInfo:v11 timeout:self->_queue forResponseOnQueue:v9 withHandler:0.0];

  id v14 = [MEMORY[0x263EFFA08] setWithObject:v13];
  [v12 setActions:v14];

  id v15 = (SBSRemoteAlertHandle *)[MEMORY[0x263F79428] newHandleWithDefinition:v18 configurationContext:v12];
  alertHandle = self->_alertHandle;
  self->_alertHandle = v15;

  [(SBSRemoteAlertHandle *)self->_alertHandle addObserver:self];
  id v17 = objc_alloc_init(MEMORY[0x263F793F8]);
  [(SBSRemoteAlertHandle *)self->_alertHandle activateWithContext:v17];
}

- (void)_activateAlertHandleWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x263F29C78];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  [v9 setObject:v8 forSetting:0];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__CPSOpenClipCardPresenter__activateAlertHandleWithURL_completionHandler___block_invoke;
  v11[3] = &unk_26424F8D8;
  id v12 = v6;
  id v10 = v6;
  [(CPSOpenClipCardPresenter *)self _activateAlertHandleWithSettings:v9 viewControllerClassName:@"CPSAlertViewController" repsonseHandler:v11];
}

uint64_t __74__CPSOpenClipCardPresenter__activateAlertHandleWithURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 info];
  [v3 flagForSetting:0];

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

+ (id)responseForOpenClipAction:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v4 setFlag:v3 forSetting:0];
  uint64_t v5 = [MEMORY[0x263F29BC0] responseWithInfo:v4];

  return v5;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__CPSOpenClipCardPresenter_remoteAlertHandleDidDeactivate___block_invoke;
  v7[3] = &unk_26424E7D8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __59__CPSOpenClipCardPresenter_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  id v2 = *(void **)(a1 + 40);

  return [v2 _invalidateSharingClient];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__CPSOpenClipCardPresenter_remoteAlertHandle_didInvalidateWithError___block_invoke;
  v8[3] = &unk_26424E7D8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __69__CPSOpenClipCardPresenter_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(v3 + 8);
  if (v4 == *(void **)(a1 + 32))
  {
    *(void *)(v3 + 8) = 0;

    [*(id *)(a1 + 40) _invalidateSharingClient];
    id v5 = *(void **)(a1 + 40);
    return [v5 _performStagedLocationConfirmationDisplayIfNeeded];
  }
  return result;
}

- (void)_invalidateSharingClient
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sharingClient = self->_sharingClient;
  if (sharingClient)
  {
    [(SFClient *)sharingClient invalidate];
  }
}

- (void)_sharingClientDidInvalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CPSOpenClipCardPresenter__sharingClientDidInvalidate__block_invoke;
  block[3] = &unk_26424E7B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__CPSOpenClipCardPresenter__sharingClientDidInvalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _performStagedLocationConfirmationDisplayIfNeeded];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stagedLocationConfirmationDisplay, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sharingClient, 0);

  objc_storeStrong((id *)&self->_alertHandle, 0);
}

void __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21559C000, a2, OS_LOG_TYPE_ERROR, "Fail to encode location request with error: %@", (uint8_t *)&v2, 0xCu);
}

void __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_5_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __80__CPSOpenClipCardPresenter_showLocationConfirmationSheetWithRequest_completion___block_invoke_8_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __85__CPSOpenClipCardPresenter__showCardWithOptions_activationHandler_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end