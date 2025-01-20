@interface SFAuthenticationContext
@end

@implementation SFAuthenticationContext

void __32___SFAuthenticationContext_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateAuthentication];
}

void __75___SFAuthenticationContext_authenticateForClient_userInitiated_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = *(unsigned char **)(a1 + 32);
    if (v6[81])
    {
      a2 = 0;
    }
    else
    {
      if ([v6 _contextRequiresSessionBasedAuthentication]) {
        [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
      }
      a2 = 1;
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = 0;

  if (a2)
  {
    v12.tv_sec = 0;
    v12.tv_nsec = 0;
    clock_gettime(_CLOCK_MONOTONIC, &v12);
    double v9 = (double)v12.tv_nsec / 1000000000.0 + (double)v12.tv_sec;
  }
  else
  {
    double v9 = 1.79769313e308;
  }
  *(double *)(*(void *)(a1 + 32) + 56) = v9;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 81))
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.mobilesafari.authenticationContextErrorDomain" code:1 userInfo:0];
  }
  else
  {
    id v10 = v5;
  }
  v11 = v10;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) _processNextClientAwaitingAuthenticationUserInitiated:*(unsigned __int8 *)(a1 + 56)];
}

void __75___SFAuthenticationContext_authenticateForClient_userInitiated_completion___block_invoke_24(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75___SFAuthenticationContext_authenticateForClient_userInitiated_completion___block_invoke_2;
  block[3] = &unk_1E5C76BF0;
  uint64_t v6 = *(void *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __75___SFAuthenticationContext_authenticateForClient_userInitiated_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_2;
  v7[3] = &unk_1E5C76C40;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  (*(void (**)(uint64_t, BOOL))(v3 + 16))(v3, v2 == 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_2_67;
  v12[3] = &unk_1E5C76C90;
  id v14 = *(id *)(a1 + 40);
  BOOL v15 = v6 == 0;
  id v7 = v6;
  id v13 = v7;
  id v8 = (void (**)(void))MEMORY[0x1AD0C36A0](v12);
  uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "authenticationCustomUIProgressObserverForContext:");
  if (!v6 || !*(unsigned char *)(*(void *)(a1 + 32) + 82))
  {
    uint64_t v10 = [v5 objectForKeyedSubscript:&unk_1EFBDEED8];
    int v11 = [v10 BOOLValue];

    if (v11 && !v6 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v9 authenticationDidEncounterMatch:*(void *)(a1 + 32) completion:v8];
      goto LABEL_10;
    }
LABEL_9:
    v8[2](v8);
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_9;
  }
  [v9 authenticationDidCancel:*(void *)(a1 + 32) completion:v8];
LABEL_10:
}

uint64_t __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_2_67(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_4;
  block[3] = &unk_1E5C75BC0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __82___SFAuthenticationContext_preemptOngoingAuthenticationWithPasccodeAuthentication__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __82___SFAuthenticationContext_preemptOngoingAuthenticationWithPasccodeAuthentication__block_invoke_2;
  v2[3] = &unk_1E5C72988;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __82___SFAuthenticationContext_preemptOngoingAuthenticationWithPasccodeAuthentication__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "authenticationCustomUIProgressObserverForContext:");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_opt_respondsToSelector()) {
      [v2 authenticationDidFallbackToPasscode:*(void *)(a1 + 32)];
    }
  }
}

uint64_t __47___SFAuthenticationContext_event_params_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleTouchIDEventWithParameters:*(void *)(a1 + 40)];
}

@end