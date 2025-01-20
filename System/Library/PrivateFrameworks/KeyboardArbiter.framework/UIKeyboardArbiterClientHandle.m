@interface UIKeyboardArbiterClientHandle
@end

@implementation UIKeyboardArbiterClientHandle

uint64_t __53___UIKeyboardArbiterClientHandle_activeProcessResign__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queue_activeProcessResignWithCompletion:");
}

void __61___UIKeyboardArbiterClientHandle_beginAcquiringFocusOnQueue___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    memset(v11, 0, sizeof(v11));
    v3 = _UIArbiterLog();
    os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    uint64_t v4 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v4;
    LODWORD(v8) = 12;
    v5 = (_OWORD *)_os_log_send_and_compose_impl();

    v6 = +[_UIKeyboardArbiterDebug sharedInstance];
    v7 = (void *)[[NSString alloc] initWithUTF8String:v11];
    [v6 errorWithMessage:v7];

    if (v5 != v11) {
      free(v5);
    }
    [WeakRetained clearAcquiringFocus];
  }
}

void __48___UIKeyboardArbiterClientHandle_didAttachLayer__block_invoke(void *a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F64630];
  uint64_t v4 = (void *)a1[4];
  id v5 = a2;
  v6 = objc_msgSend(v3, "targetWithPid:environmentIdentifier:", objc_msgSend(v4, "processIdentifier"), a1[5]);
  [v5 setTarget:v6];

  [v5 setInheritingEnvironment:a1[6]];
  v7 = [MEMORY[0x263F644B8] grantWithNamespace:*MEMORY[0x263F83EC0] sourceEnvironment:a1[6] attributes:0];
  v9[0] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v5 setAdditionalAttributes:v8];
}

void __72___UIKeyboardArbiterClientHandle_takeProcessAssertionOnRemoteWithQueue___block_invoke(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  memset(v13, 0, sizeof(v13));
  if (a2)
  {
    v3 = _UIArbiterLog();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
    uint64_t v4 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v4;
    LODWORD(v10) = 12;
    id v5 = (_OWORD *)_os_log_send_and_compose_impl();

    v6 = +[_UIKeyboardArbiterDebug sharedInstance];
    v7 = (void *)[[NSString alloc] initWithUTF8String:v13];
    [v6 debugWithMessage:v7];
  }
  else
  {
    uint64_t v8 = _UIArbiterLog();
    os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v9;
    LODWORD(v10) = 12;
    id v5 = (_OWORD *)_os_log_send_and_compose_impl();

    v6 = +[_UIKeyboardArbiterDebug sharedInstance];
    v7 = (void *)[[NSString alloc] initWithUTF8String:v13];
    [v6 errorWithMessage:v7];
  }

  if (v5 != v13) {
    free(v5);
  }
}

void __72___UIKeyboardArbiterClientHandle_takeProcessAssertionOnRemoteWithQueue___block_invoke_537(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  memset(v16, 0, sizeof(v16));
  id v4 = a3;
  id v5 = _UIArbiterLog();
  os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  uint64_t v6 = *(void *)(a1 + 32);
  int v12 = 138412546;
  uint64_t v13 = v6;
  __int16 v14 = 2112;
  id v15 = v4;
  LODWORD(v11) = 22;
  v7 = (_OWORD *)_os_log_send_and_compose_impl();

  uint64_t v8 = +[_UIKeyboardArbiterDebug sharedInstance];
  id v9 = [NSString alloc];

  uint64_t v10 = (void *)[v9 initWithUTF8String:v16];
  [v8 errorWithMessage:v10];

  if (v7 != v16) {
    free(v7);
  }
}

void __72___UIKeyboardArbiterClientHandle_takeProcessAssertionOnRemoteWithQueue___block_invoke_542(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 128) - 1;
  *(void *)(v1 + 128) = v2;
  if (!v2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(void *)(v4 + 120))
    {
      if (*(void *)(v4 + 24))
      {
        memset(v18, 0, sizeof(v18));
        id v5 = _UIArbiterLog();
        os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = *(void *)(v6 + 120);
        int v14 = 138412546;
        uint64_t v15 = v6;
        __int16 v16 = 2048;
        uint64_t v17 = v7;
        LODWORD(v13) = 22;
        uint64_t v8 = (_OWORD *)_os_log_send_and_compose_impl();

        id v9 = +[_UIKeyboardArbiterDebug sharedInstance];
        uint64_t v10 = (void *)[[NSString alloc] initWithUTF8String:v18];
        [v9 errorWithMessage:v10];

        if (v8 != v18) {
          free(v8);
        }
        if (TIGetDisableArbiterConnectionTimeoutValue_onceToken != -1) {
          dispatch_once(&TIGetDisableArbiterConnectionTimeoutValue_onceToken, &__block_literal_global_722);
        }
        uint64_t v11 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
        int v12 = [(id)v11 valueForPreferenceKey:@"DisableArbiterConnectionTimeout"];

        LOBYTE(v11) = [v12 BOOLValue];
        if ((v11 & 1) == 0) {
          [*(id *)(*(void *)(a1 + 32) + 176) invalidate];
        }
      }
    }
  }
}

void __44___UIKeyboardArbiterClientHandle_invalidate__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    memset(v11, 0, sizeof(v11));
    v3 = _UIArbiterLog();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
    uint64_t v4 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v4;
    LODWORD(v8) = 12;
    id v5 = (_OWORD *)_os_log_send_and_compose_impl();

    uint64_t v6 = +[_UIKeyboardArbiterDebug sharedInstance];
    uint64_t v7 = (void *)[[NSString alloc] initWithUTF8String:v11];
    [v6 debugWithMessage:v7];

    if (v5 != v11) {
      free(v5);
    }
  }
}

@end