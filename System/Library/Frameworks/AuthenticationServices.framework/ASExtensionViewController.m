@interface ASExtensionViewController
@end

@implementation ASExtensionViewController

void __57___ASExtensionViewController__extensionRequestDidFinish___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _invalidateNonUIRequestTimerIfNeeded];
    id WeakRetained = v4;
    if (*(unsigned char *)(a1 + 40))
    {
      v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4097 userInfo:0];
      [v4 _requestDidFailWithError:v3 completion:0];

      id WeakRetained = v4;
    }
  }
}

void __53___ASExtensionViewController_setDismissOnBackground___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[126] _kill:9];
    id WeakRetained = v2;
  }
}

void __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    v10 = *(void **)(*(void *)(a1 + 32) + 1008);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke_2;
    v21[3] = &unk_264395CB0;
    objc_copyWeak(&v22, (id *)(a1 + 48));
    objc_msgSend(v10, "_sf_addHandlerForRequestIdentifier:withBlock:", v7, v21);
    objc_destroyWeak(&v22);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke_3;
  v15[3] = &unk_264395CD8;
  id v16 = v9;
  id v17 = v8;
  v11 = *(void **)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = v7;
  id v20 = v11;
  id v12 = v7;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

void __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _extensionRequestDidFinish:a2];
}

void __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke_3(uint64_t a1)
{
  v2 = (void **)(a1 + 32);
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke_3_cold_1(v2, v3);
    }
    [*(id *)(a1 + 48) _requestDidFailWithError:*(void *)(a1 + 32) completion:0];
  }
  else
  {
    id v5 = [*(id *)(*(void *)(a1 + 48) + 1008) _extensionContextForUUID:*(void *)(a1 + 56)];
    [v5 setDelegate:*(void *)(a1 + 48)];
    id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 1008), "_as_auxiliaryRemoteObjectWithRequestID:", *(void *)(a1 + 56));
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    [*(id *)(a1 + 48) _setRemoteViewController:*(void *)(a1 + 40)];
  }
}

void __67___ASExtensionViewController__beginNonUIRequest_connectionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    v10 = *(void **)(*(void *)(a1 + 32) + 1008);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __67___ASExtensionViewController__beginNonUIRequest_connectionHandler___block_invoke_2;
    v21[3] = &unk_264395CB0;
    objc_copyWeak(&v22, (id *)(a1 + 48));
    objc_msgSend(v10, "_sf_addHandlerForRequestIdentifier:withBlock:", v7, v21);
    objc_destroyWeak(&v22);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67___ASExtensionViewController__beginNonUIRequest_connectionHandler___block_invoke_3;
  v15[3] = &unk_264395CD8;
  id v16 = v9;
  id v17 = v8;
  v11 = *(void **)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = v7;
  id v20 = v11;
  id v12 = v7;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

void __67___ASExtensionViewController__beginNonUIRequest_connectionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _extensionRequestDidFinish:a2];
}

void __67___ASExtensionViewController__beginNonUIRequest_connectionHandler___block_invoke_3(uint64_t a1)
{
  v2 = (void **)(a1 + 32);
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke_3_cold_1(v2, v3);
    }
    [*(id *)(a1 + 48) _requestDidFailWithError:0 completion:0];
  }
  else
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 48) + 1008) _extensionContextForUUID:*(void *)(a1 + 56)];
    uint64_t v5 = *(void *)(a1 + 48);
    v6 = *(void **)(v5 + 984);
    *(void *)(v5 + 984) = v4;

    objc_msgSend(*(id *)(*(void *)(a1 + 48) + 984), "setDelegate:");
    objc_msgSend(*(id *)(*(void *)(a1 + 48) + 1008), "_as_auxiliaryRemoteObjectWithRequestID:", *(void *)(a1 + 56));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __85___ASExtensionViewController_prepareToCancelRequestWithHostContext_error_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateNonUIRequestTimerIfNeeded];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 984);
  if (v3
    && *(void *)(a1 + 40) == v3
    && (int v4 = objc_msgSend(*(id *)(a1 + 48), "safari_matchesErrorDomain:andCode:", @"ASExtensionErrorDomain", 100), v2 = *(void *)(a1 + 32), v4)&& *(unsigned char *)(v2 + 1000))
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_21918F000, v5, OS_LOG_TYPE_DEFAULT, "Extension requires user interaction - re-running with UI", v9, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    return [*(id *)(a1 + 32) _nonUIRequestDidRequireUserInteraction];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    return [(id)v2 _requestDidFailWithError:v7 completion:v8];
  }
}

void __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke_3_cold_1(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  int v4 = objc_msgSend(v2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v5, v6, "Failed to get remote view controller: %{public}@", v7, v8, v9, v10, 2u);
}

@end