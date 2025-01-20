@interface FLFollowUpActionHandler
- (NSString)description;
- (id)_extensionLoader;
- (id)extensionRequestedViewControllerPresentation;
- (void)dealloc;
- (void)extensionDidFinish;
- (void)extensionDidFinishWithError:(id)a3;
- (void)extensionDidFinishWithError:(id)a3 userInfo:(id)a4 completionHandler:(id)a5;
- (void)extensionDidFinishWithUserInfo:(id)a3 completionHandler:(id)a4;
- (void)handleExtensionBasedAction:(id)a3 completion:(id)a4;
- (void)handleExtensionBasedAction:(id)a3 completionWithUserInfo:(id)a4;
- (void)setExtensionRequestedViewControllerPresentation:(id)a3;
@end

@implementation FLFollowUpActionHandler

- (id)_extensionLoader
{
  extensionLoader = self->_extensionLoader;
  if (!extensionLoader)
  {
    v4 = [FLViewExtensionLoader alloc];
    v5 = [(FLHeadlessActionHandler *)self item];
    v6 = [(FLHeadlessExtensionLoader *)v4 initWithFollowUp:v5 andDelegate:self];
    v7 = self->_extensionLoader;
    self->_extensionLoader = v6;

    objc_initWeak(&location, self);
    v8 = self->_extensionLoader;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__FLFollowUpActionHandler__extensionLoader__block_invoke;
    v10[3] = &unk_2645F2560;
    objc_copyWeak(&v11, &location);
    [(FLHeadlessExtensionLoader *)v8 setRequestInterruptionBlock:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    extensionLoader = self->_extensionLoader;
  }

  return extensionLoader;
}

void __43__FLFollowUpActionHandler__extensionLoader__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = FLError();
    [WeakRetained extensionDidFinishWithError:v1];
  }
}

- (void)handleExtensionBasedAction:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__FLFollowUpActionHandler_handleExtensionBasedAction_completion___block_invoke;
  v8[3] = &unk_2645F2588;
  id v9 = v6;
  id v7 = v6;
  [(FLFollowUpActionHandler *)self handleExtensionBasedAction:a3 completionWithUserInfo:v8];
}

uint64_t __65__FLFollowUpActionHandler_handleExtensionBasedAction_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)handleExtensionBasedAction:(id)a3 completionWithUserInfo:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _FLSignpostCreate();
  uint64_t v10 = v9;
  id v11 = _FLSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[FLFollowUpActionHandler handleExtensionBasedAction:completionWithUserInfo:](v8, v11);
  }

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke;
  v21[3] = &unk_2645F25B0;
  uint64_t v23 = v8;
  uint64_t v24 = v10;
  id v12 = v7;
  id v22 = v12;
  v13 = (void *)MEMORY[0x223C91420](v21);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v13;

  v15 = _FLLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(FLHeadlessActionHandler *)self item];
    *(_DWORD *)buf = 138412290;
    v26 = v16;
    _os_log_impl(&dword_221DA3000, v15, OS_LOG_TYPE_DEFAULT, "Starting to load extension for follow up: %@", buf, 0xCu);
  }
  v17 = [MEMORY[0x263F353A0] sharedExtensionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_3;
  block[3] = &unk_2645F2538;
  block[4] = self;
  id v20 = v6;
  id v18 = v6;
  dispatch_async(v17, block);
}

void __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  unint64_t Nanoseconds = _FLSignpostGetNanoseconds();
  uint64_t v10 = _FLSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_cold_1(Nanoseconds, (uint64_t *)(a1 + 40), v10);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v11 + 16))(v11, a2, v7, v8);
  }
}

void __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _extensionLoader];
  v3 = [v2 remoteInterface];

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = [v4 item];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_2;
    v7[3] = &unk_2645F25D8;
    uint64_t v6 = *(void *)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    [v3 processFollowUpItem:v5 selectedAction:v6 completion:v7];
  }
  else
  {
    [v4 extensionDidFinish];
  }
}

void __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [NSNumber numberWithBool:a2];
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_221DA3000, v4, OS_LOG_TYPE_DEFAULT, "Extension processed follow up: %@", buf, 0xCu);
  }
  if (a2)
  {
    [*(id *)(a1 + 32) extensionDidFinish];
  }
  else
  {
    uint64_t v6 = _FLLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221DA3000, v6, OS_LOG_TYPE_DEFAULT, "Extension did not handle this event silently, trying to fetch remote UI", buf, 2u);
    }

    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 16) remoteViewController];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 24);
    *(void *)(v8 + 24) = v7;

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_5;
    block[3] = &unk_2645F2380;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) extensionRequestedViewControllerPresentation];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) extensionRequestedViewControllerPresentation];
    v3[2](v3, *(void *)(*(void *)(a1 + 32) + 24));
  }
}

- (void)extensionDidFinishWithUserInfo:(id)a3 completionHandler:(id)a4
{
}

- (void)extensionDidFinish
{
}

- (void)extensionDidFinishWithError:(id)a3
{
}

- (void)extensionDidFinishWithError:(id)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __82__FLFollowUpActionHandler_extensionDidFinishWithError_userInfo_completionHandler___block_invoke;
  v18[3] = &unk_2645F2600;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  v14 = (void *)MEMORY[0x223C91420](v18);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__FLFollowUpActionHandler_extensionDidFinishWithError_userInfo_completionHandler___block_invoke_8;
  v16[3] = &unk_2645F2628;
  v16[4] = self;
  id v17 = v14;
  id v15 = v14;
  dispatch_async(MEMORY[0x263EF83A0], v16);
}

uint64_t __82__FLFollowUpActionHandler_extensionDidFinishWithError_userInfo_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 32);
  if (v2)
  {
    (*(void (**)(uint64_t, BOOL, void))(v2 + 16))(v2, a1[5] == 0, a1[6]);
    uint64_t v3 = a1[4];
    v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
  v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_221DA3000, v5, OS_LOG_TYPE_DEFAULT, "Handler completed", v7, 2u);
  }

  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __82__FLFollowUpActionHandler_extensionDidFinishWithError_userInfo_completionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) presentingViewController];

  if (v2)
  {
    uint64_t v3 = _FLLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221DA3000, v3, OS_LOG_TYPE_DEFAULT, "Dismissing remote view contrller", buf, 2u);
    }

    v4 = *(void **)(*(void *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __82__FLFollowUpActionHandler_extensionDidFinishWithError_userInfo_completionHandler___block_invoke_9;
    v6[3] = &unk_2645F23A8;
    id v7 = *(id *)(a1 + 40);
    [v4 dismissViewControllerAnimated:1 completion:v6];
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

uint64_t __82__FLFollowUpActionHandler_extensionDidFinishWithError_userInfo_completionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v4 = [(id)objc_opt_class() description];
  v5 = [v3 stringWithFormat:@"<%@: %p>", v4, self];

  return (NSString *)v5;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_221DA3000, v3, OS_LOG_TYPE_DEFAULT, "%@ going away", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)FLFollowUpActionHandler;
  [(FLHeadlessActionHandler *)&v4 dealloc];
}

- (id)extensionRequestedViewControllerPresentation
{
  return self->_extensionRequestedViewControllerPresentation;
}

- (void)setExtensionRequestedViewControllerPresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_extensionRequestedViewControllerPresentation, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);

  objc_storeStrong((id *)&self->_extensionLoader, 0);
}

- (void)handleExtensionBasedAction:(uint64_t)a1 completionWithUserInfo:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_221DA3000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%llu]: Extension Processing", (uint8_t *)&v2, 0xCu);
}

void __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_cold_1(unint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = (double)a1 / 1000000000.0;
  _os_log_debug_impl(&dword_221DA3000, log, OS_LOG_TYPE_DEBUG, "END [%llu] %fs: Extension Processing", (uint8_t *)&v4, 0x16u);
}

@end