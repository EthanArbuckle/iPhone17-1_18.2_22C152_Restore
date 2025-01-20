@interface AKAuthorizationClientImpl
- (AKAuthorizationUIProvider)uiProvider;
- (void)dealloc;
- (void)presentAuthorizationUIForContext:(id)a3 completion:(id)a4;
- (void)setUiProvider:(id)a3;
@end

@implementation AKAuthorizationClientImpl

- (void)presentAuthorizationUIForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_uiProvider)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__AKAuthorizationClientImpl_presentAuthorizationUIForContext_completion___block_invoke;
    block[3] = &unk_1E5760B00;
    block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v8 = _AKLogSiwa();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "UI provider is nil", v10, 2u);
    }

    v9 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7061);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
  }
}

uint64_t __73__AKAuthorizationClientImpl_presentAuthorizationUIForContext_completion___block_invoke(void *a1)
{
  v2 = _AKLogSiwa();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_193494000, v2, OS_LOG_TYPE_DEFAULT, "Present Authorization call forwarded to UI provider", v4, 2u);
  }

  return [*(id *)(a1[4] + 8) presentAuthorizationUIForContext:a1[5] completion:a1[6]];
}

- (void)dealloc
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193494000, v3, OS_LOG_TYPE_DEFAULT, "Authorization Client that has UI provider deallocated", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationClientImpl;
  [(AKAuthorizationClientImpl *)&v4 dealloc];
}

- (AKAuthorizationUIProvider)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end