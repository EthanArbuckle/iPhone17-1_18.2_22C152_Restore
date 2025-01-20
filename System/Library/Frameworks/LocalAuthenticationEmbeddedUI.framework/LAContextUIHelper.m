@interface LAContextUIHelper
- (void)authenticateWithOptions:(id)a3 availableMechanisms:(id)a4 hostVC:(id)a5 context:(id)a6 reply:(id)a7;
- (void)cancel;
- (void)contextDidBecomeInvalid:(id)a3;
- (void)dealloc;
@end

@implementation LAContextUIHelper

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ui);
  [WeakRetained dismiss];

  v4 = LA_LOG();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_23F450000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocated", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)LAContextUIHelper;
  [(LAContextUIHelper *)&v5 dealloc];
}

- (void)authenticateWithOptions:(id)a3 availableMechanisms:(id)a4 hostVC:(id)a5 context:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void, void *))a7;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  p_ui = &self->_ui;
  id WeakRetained = objc_loadWeakRetained((id *)p_ui);

  if (WeakRetained)
  {
    v19 = [MEMORY[0x263F104E0] errorWithCode:-1008 message:@"Another interactive authentication is ongoing"];
    v16[2](v16, 0, v19);
  }
  else
  {
    v20 = [LAAuthorizationViewController alloc];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __86__LAContextUIHelper_authenticateWithOptions_availableMechanisms_hostVC_context_reply___block_invoke;
    v28[3] = &unk_26506EAC0;
    id v29 = v13;
    id v30 = v15;
    id v31 = v12;
    v21 = __86__LAContextUIHelper_authenticateWithOptions_availableMechanisms_hostVC_context_reply___block_invoke((uint64_t)v28);
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __86__LAContextUIHelper_authenticateWithOptions_availableMechanisms_hostVC_context_reply___block_invoke_2;
    v26 = &unk_26506EAE8;
    v27 = v16;
    v22 = [(LAAuthorizationViewController *)v20 initWithConfiguration:v21 completion:&v23];

    -[LAAuthorizationViewController presentInContainerViewController:](v22, "presentInContainerViewController:", v14, v23, v24, v25, v26);
    objc_storeWeak((id *)p_ui, v22);
  }
}

id __86__LAContextUIHelper_authenticateWithOptions_availableMechanisms_hostVC_context_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F52528] buildWithAvailableMechanisms:*(void *)(a1 + 32)];
  id v3 = objc_alloc(MEMORY[0x263F52520]);
  v4 = [*(id *)(a1 + 40) externalizedContext];
  objc_super v5 = (void *)[v3 initWithContext:v4 requirement:v2 options:*(void *)(a1 + 48)];

  return v5;
}

void __86__LAContextUIHelper_authenticateWithOptions_availableMechanisms_hostVC_context_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = LA_LOG();
  objc_super v5 = v4;
  if (v3)
  {
    os_log_type_t v6 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v5, v6)) {
      goto LABEL_8;
    }
    [NSString stringWithFormat:@"(err=%@)", v3];
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    v7 = @"successfully";
  }
  *(_DWORD *)buf = 138543362;
  v10 = v7;
  _os_log_impl(&dword_23F450000, v5, v6, "Authorization sheet finished %{public}@", buf, 0xCu);
  if (v3) {

  }
LABEL_8:
  if (v3) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = MEMORY[0x263EFFA78];
  }
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v8, v3);
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = LA_LOG();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    os_log_type_t v6 = self;
    _os_log_impl(&dword_23F450000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelled", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_ui);
  [WeakRetained dismiss];
}

- (void)contextDidBecomeInvalid:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(LAContextUIHelper *)self cancel];
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__LAContextUIHelper_contextDidBecomeInvalid___block_invoke;
    block[3] = &unk_26506EB10;
    objc_copyWeak(&v7, &location);
    id v6 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __45__LAContextUIHelper_contextDidBecomeInvalid___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained contextDidBecomeInvalid:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void).cxx_destruct
{
}

@end