@interface LAContext
@end

@implementation LAContext

void __83__LAContext_UI__evaluateAccessControl_operation_options_presentationContext_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && !*(unsigned char *)(a1 + 88) && ([MEMORY[0x263F104E0] error:v6 hasCode:-1004] & 1) != 0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __83__LAContext_UI__evaluateAccessControl_operation_options_presentationContext_reply___block_invoke_2;
    v10[3] = &unk_26506E9F8;
    objc_copyWeak(v16, (id *)(a1 + 64));
    id v7 = *(id *)(a1 + 32);
    v8 = *(void **)(a1 + 72);
    v9 = *(void **)(a1 + 80);
    id v11 = v7;
    v16[1] = v8;
    v16[2] = v9;
    id v12 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 56);
    id v13 = v6;
    id v14 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], v10);

    objc_destroyWeak(v16);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __83__LAContext_UI__evaluateAccessControl_operation_options_presentationContext_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v4 = LAViewControllerForPresentationContext(*(void **)(a1 + 32));
    if (v4)
    {
      id v5 = objc_alloc_init(LAContextUIHelper);
      [WeakRetained setUiHelper:v5];
      [WeakRetained addContextObserver:v5];
      id v6 = LA_LOG();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 80);
        uint64_t v8 = *(void *)(a1 + 88);
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        uint64_t v30 = v7;
        __int16 v31 = 1024;
        int v32 = v8;
        __int16 v33 = 2114;
        uint64_t v34 = v9;
        __int16 v35 = 2112;
        id v36 = WeakRetained;
        _os_log_impl(&dword_23F450000, v6, OS_LOG_TYPE_DEFAULT, "evaluateAccessControl:%{public}@ operation:%d options:%{public}@ on %@", buf, 0x26u);
      }

      id v10 = objc_alloc(MEMORY[0x263F10468]);
      id v11 = [WeakRetained externalizedContext];
      id v12 = (void *)[v10 initWithExternalizedContext:v11];

      id v13 = [*(id *)(a1 + 48) userInfo];
      uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F10430]];
      id v15 = (void *)v14;
      v16 = (void *)MEMORY[0x263EFFA68];
      if (v14) {
        v16 = (void *)v14;
      }
      id v17 = v16;

      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __83__LAContext_UI__evaluateAccessControl_operation_options_presentationContext_reply___block_invoke_3;
      v22[3] = &unk_26506E9D0;
      objc_copyWeak(v28, v2);
      id v18 = *(id *)(a1 + 40);
      v19 = *(void **)(a1 + 80);
      id v23 = v18;
      v28[1] = v19;
      id v24 = v4;
      id v20 = v12;
      v21 = *(void **)(a1 + 88);
      id v25 = v20;
      v28[2] = v21;
      id v26 = *(id *)(a1 + 56);
      id v27 = *(id *)(a1 + 64);
      [WeakRetained _validateAvailableMechanims:v17 completion:v22];

      objc_destroyWeak(v28);
    }
    else
    {
      [WeakRetained evaluateAccessControl:*(void *)(a1 + 80) operation:*(void *)(a1 + 88) options:*(void *)(a1 + 40) reply:*(void *)(a1 + 64)];
    }
  }
}

void __83__LAContext_UI__evaluateAccessControl_operation_options_presentationContext_reply___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _authenticateWithOptions:*(void *)(a1 + 32) acl:*(void *)(a1 + 80) availableMechanisms:v5 hostVC:*(void *)(a1 + 40) context:*(void *)(a1 + 48) operation:*(void *)(a1 + 88) updatedOptions:*(void *)(a1 + 56) reply:*(void *)(a1 + 64)];
  }
}

void __112__LAContext_UI___authenticateWithOptions_acl_availableMechanisms_hostVC_context_operation_updatedOptions_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = LA_LOG();
  if (v6) {
    os_log_type_t v8 = LALogTypeForInternalError();
  }
  else {
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  }
  if (os_log_type_enabled(v7, v8))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v10 = WeakRetained;
    id v11 = @"successfully";
    if (v6) {
      id v11 = v6;
    }
    int v14 = 138412546;
    id v15 = WeakRetained;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_impl(&dword_23F450000, v7, v8, "evaluateAccessControl on %@ finished %{public}@", (uint8_t *)&v14, 0x16u);
  }
  id v12 = objc_loadWeakRetained((id *)(a1 + 48));
  id v13 = v12;
  if (v12)
  {
    if (v6) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else {
      [v12 evaluateAccessControl:*(void *)(a1 + 56) operation:*(void *)(a1 + 64) options:*(void *)(a1 + 32) reply:*(void *)(a1 + 40)];
    }
  }
}

void __56__LAContext_UI___validateAvailableMechanims_completion___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__LAContext_UI___validateAvailableMechanims_completion___block_invoke_2;
  block[3] = &unk_26506EA70;
  char v6 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __56__LAContext_UI___validateAvailableMechanims_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    id v3 = (id)[*(id *)(a1 + 32) mutableCopy];
    [v3 removeObject:&unk_26F32BB30];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end