@interface MXExtensionService
@end

@implementation MXExtensionService

void __47___MXExtensionService_extensionCompletionQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MapKit._MXExtensionService.completion", v2);
  v1 = (void *)qword_1EB315D70;
  qword_1EB315D70 = (uint64_t)v0;
}

void __78___MXExtensionService_connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78___MXExtensionService_connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke_2;
    v8[3] = &unk_1E54B9B48;
    v8[4] = WeakRetained;
    v9 = v3;
    id v10 = *(id *)(a1 + 32);
    [WeakRetained _connectExtensionWithRemoteViewControllerNeeded:v5 Handler:v8];
  }
  else
  {
    v3[2](v3);
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = [MEMORY[0x1E4F28C58] _errorWithExtensionServiceError:1];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

void __78___MXExtensionService_connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v6 = [v12 URLHandlingDelegate];

  if (v6)
  {
    v7 = [v12 realExtension];
    v8 = [*(id *)(a1 + 32) connectionIdentifier];
    v9 = [v7 _extensionContextForUUID:v8];

    if ([v9 conformsToProtocol:&unk_1ED9B66D0])
    {
      id v10 = [v12 URLHandlingDelegate];
      [v9 setURLHandlingDelegate:v10];
    }
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v12, v5);
  }
}

void __79___MXExtensionService__connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5) {
    [*(id *)(a1 + 32) setState:3];
  }
  if (v6)
  {
    [*(id *)(a1 + 32) setConnectionIdentifier:v6];
    [*(id *)(a1 + 32) setState:2];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __79___MXExtensionService__connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8) {
    [*(id *)(a1 + 32) setState:3];
  }
  if (v9 && v7)
  {
    [*(id *)(a1 + 32) setConnectionIdentifier:v9];
    [*(id *)(a1 + 32) setState:2];
  }
  [*(id *)(a1 + 32) setRemoteViewController:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __42___MXExtensionService_disconnectExtension__block_invoke(uint64_t a1, void *a2)
{
  v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained state] == 2) {
    [WeakRetained setState:3];
  }
  v4[2]();
}

void __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__9;
  v14 = __Block_byref_object_dispose__9;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_2;
  v9[3] = &unk_1E54B9C10;
  id v7 = *(NSObject **)(a1 + 32);
  v9[4] = *(void *)(a1 + 40);
  v9[5] = &v10;
  dispatch_sync(v7, v9);
  uint64_t v8 = v11[5];
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
  _Block_object_dispose(&v10, 8);
}

void __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v2 = MEMORY[0x18C139AE0]();
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

void __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_4;
    v9[3] = &unk_1E54B9C60;
    id v10 = *(id *)(a1 + 48);
    id v6 = [a2 vendorContextWithErrorHandler:v9];
    id v7 = v6;
    if (v6)
    {
      if ([v6 conformsToProtocol:&unk_1ED9C3C88])
      {
        [v7 handleRequest:*(void *)(a1 + 32) requestDispatcher:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
      }
      else
      {
        uint64_t v8 = [MEMORY[0x1E4F28C58] _errorWithExtensionServiceError:7];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
  }
}

uint64_t __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_5(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] _errorWithExtensionServiceError:1];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    [v4 receiveUpdatedResponse:0 error:a3];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_2;
    v9[3] = &unk_1E54B9CB0;
    id v10 = *(id *)(a1 + 32);
    id v6 = [a2 vendorContextWithErrorHandler:v9];
    id v7 = v6;
    if (v6)
    {
      if ([v6 conformsToProtocol:&unk_1ED9C3CE8])
      {
        [v7 startSendingUpdatesForRequest:*(void *)(a1 + 40) requestDispatcher:*(void *)(a1 + 48) toObserver:*(void *)(a1 + 32)];
      }
      else
      {
        uint64_t v8 = [MEMORY[0x1E4F28C58] _errorWithExtensionServiceError:7];
        [*(id *)(a1 + 32) receiveUpdatedResponse:0 error:v8];
      }
    }
  }
}

uint64_t __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) receiveUpdatedResponse:0 error:a2];
}

void __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] _errorWithExtensionServiceError:1];
  [*(id *)(a1 + 32) receiveUpdatedResponse:0 error:v2];
  [*(id *)(a1 + 40) stopSendingUpdatesForRequest:*(void *)(a1 + 48) requestDispatcher:*(void *)(a1 + 56)];
}

void __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_4(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__9;
  uint64_t v8 = __Block_byref_object_dispose__9;
  id v9 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_5;
  v3[3] = &unk_1E54B9C10;
  v1 = *(NSObject **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  v3[5] = &v4;
  dispatch_sync(v1, v3);
  uint64_t v2 = v5[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  _Block_object_dispose(&v4, 8);
}

void __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_5(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v2 = MEMORY[0x18C139AE0]();
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

uint64_t __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70___MXExtensionService_stopSendingUpdatesForRequest_requestDispatcher___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 vendorContextWithErrorHandler:&__block_literal_global_106];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v6 = v3;
      int v5 = [v3 conformsToProtocol:&unk_1ED9C3CE8];
      uint64_t v4 = v6;
      if (v5)
      {
        [v6 stopSendingUpdatesForRequest:*(void *)(a1 + 32) requestDispatcher:*(void *)(a1 + 40)];
        uint64_t v4 = v6;
      }
    }
  }
}

uint64_t __53___MXExtensionService_vendorContextWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 disconnectExtension];
}

void __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__19;
  v14 = __Block_byref_object_dispose__19;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_2;
  v9[3] = &unk_1E54B9C10;
  id v7 = *(NSObject **)(a1 + 32);
  void v9[4] = *(void *)(a1 + 40);
  v9[5] = &v10;
  dispatch_sync(v7, v9);
  uint64_t v8 = v11[5];
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
  _Block_object_dispose(&v10, 8);
}

void __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v2 = MEMORY[0x18C139AE0]();
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

void __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_3(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_4;
    v14[3] = &unk_1E54B9C60;
    id v15 = a1[6];
    id v6 = [v5 vendorContextWithErrorHandler:v14];
    id v7 = [v5 _errorForIntentVendorContext:v6];
    if (v7)
    {
      (*((void (**)(void))a1[6] + 2))();
    }
    else
    {
      uint64_t v8 = [a1[4] identifier];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_5;
      v9[3] = &unk_1E54BC110;
      id v10 = v6;
      id v11 = a1[5];
      id v12 = a1[4];
      id v13 = a1[6];
      [v10 beginTransactionWithIntentIdentifier:v8 completion:v9];
    }
  }
}

uint64_t __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_6;
  v4[3] = &unk_1E54BC0E8;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 resolveIntentSlot:v2 forIntent:v3 completionBlock:v4];
}

uint64_t __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_7(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] _errorWithExtensionServiceError:1];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__19;
  v20 = __Block_byref_object_dispose__19;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_2;
  v15[3] = &unk_1E54B9C10;
  id v13 = *(NSObject **)(a1 + 32);
  v15[4] = *(void *)(a1 + 40);
  v15[5] = &v16;
  dispatch_sync(v13, v15);
  uint64_t v14 = v17[5];
  if (v14) {
    (*(void (**)(uint64_t, id, id, id, id))(v14 + 16))(v14, v9, v10, v11, v12);
  }
  _Block_object_dispose(&v16, 8);
}

void __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v2 = MEMORY[0x18C139AE0]();
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

void __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_4;
    v21[3] = &unk_1E54B9C60;
    id v22 = *(id *)(a1 + 40);
    id v6 = [v5 vendorContextWithErrorHandler:v21];
    id v7 = [v5 _errorForIntentVendorContext:v6];
    if (v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_5;
      v18[3] = &unk_1E54BC160;
      id v19 = v5;
      long long v12 = *(_OWORD *)(a1 + 40);
      id v8 = (id)v12;
      long long v20 = v12;
      id v9 = (void *)MEMORY[0x18C139AE0](v18);
      id v10 = [*(id *)(a1 + 32) identifier];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_6;
      v13[3] = &unk_1E54BC188;
      char v17 = *(unsigned char *)(a1 + 56);
      id v14 = v6;
      id v15 = *(id *)(a1 + 32);
      id v16 = v9;
      id v11 = v9;
      [v14 beginTransactionWithIntentIdentifier:v10 completion:v13];
    }
  }
}

uint64_t __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v13 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = [*(id *)(a1 + 32) _errorForIntentResponse:v13 withExpectResponseClass:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_6(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  if (v2) {
    return [v3 handleIntent:v4 withCompletion:v5];
  }
  else {
    return [v3 confirmIntent:v4 withCompletion:v5];
  }
}

void __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_7(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] _errorWithExtensionServiceError:1];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84___MXExtensionService_INIntent__completeTransactionWithIntentIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __94___MXExtensionService_INIntent__cancelTransactionDueToTimeoutWithIntentIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __94___MXExtensionService_INIntent___completeOrCancelTransaction_withIntentIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    id v5 = a2;
    id v9 = [v5 vendorContextWithErrorHandler:&__block_literal_global_67];
    id v6 = objc_msgSend(v5, "_errorForIntentVendorContext:");

    if (!v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      if (*(unsigned char *)(a1 + 48)) {
        [v9 completeTransactionWithIntentIdentifier:v7 completion:v8];
      }
      else {
        [v9 cancelTransactionDueToTimeoutWithIntentIdentifier:v7 completion:v8];
      }
    }
  }
}

void __73___MXExtensionService_INIntent__startSendingUpdatesForIntent_toObserver___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) didReceiveError:a3];
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __73___MXExtensionService_INIntent__startSendingUpdatesForIntent_toObserver___block_invoke_2;
    id v11 = &unk_1E54BC200;
    id v12 = *(id *)(a1 + 32);
    id v13 = 0;
    id v6 = [v5 vendorContextWithErrorHandler:&v8];
    uint64_t v7 = objc_msgSend(v5, "_errorForIntentVendorContext:", v6, v8, v9, v10, v11);
    if (v7) {
      [*(id *)(a1 + 32) didReceiveError:v7];
    }
    else {
      [v6 startSendingUpdatesForIntent:*(void *)(a1 + 40) toObserver:*(void *)(a1 + 32)];
    }
  }
}

uint64_t __73___MXExtensionService_INIntent__startSendingUpdatesForIntent_toObserver___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didReceiveError:*(void *)(a1 + 40)];
}

void __73___MXExtensionService_INIntent__startSendingUpdatesForIntent_toObserver___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] _errorWithExtensionServiceError:1];
  [*(id *)(a1 + 32) didReceiveError:v2];
  [*(id *)(a1 + 40) stopSendingUpdatesForIntent:*(void *)(a1 + 48)];
}

void __61___MXExtensionService_INIntent__stopSendingUpdatesForIntent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    id v5 = a2;
    id v7 = [v5 vendorContextWithErrorHandler:&__block_literal_global_73];
    id v6 = objc_msgSend(v5, "_errorForIntentVendorContext:");

    if (!v6) {
      [v7 stopSendingUpdatesForIntent:*(void *)(a1 + 32)];
    }
  }
}

uint64_t __99___MXExtensionService_INIntent_willBeDepreicatedSoon__handleIntent_expectResponseClass_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a5);
  }
  return result;
}

@end