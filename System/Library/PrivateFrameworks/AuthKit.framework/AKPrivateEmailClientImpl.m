@interface AKPrivateEmailClientImpl
- (AKPrivateEmailUIProvider)uiProvider;
- (void)presentPrivateEmailUIForContext:(id)a3 completion:(id)a4;
- (void)setUiProvider:(id)a3;
@end

@implementation AKPrivateEmailClientImpl

- (void)presentPrivateEmailUIForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _AKLogHme();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AKPrivateEmailClientImpl presentPrivateEmailUIForContext:completion:]((uint64_t)v6, (uint64_t)self, v8);
  }

  if (self->_uiProvider)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__AKPrivateEmailClientImpl_presentPrivateEmailUIForContext_completion___block_invoke;
    block[3] = &unk_1E5760B00;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __71__AKPrivateEmailClientImpl_presentPrivateEmailUIForContext_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) presentPrivateEmailUIForContext:a1[5] completion:a1[6]];
}

- (AKPrivateEmailUIProvider)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)presentPrivateEmailUIForContext:(os_log_t)log completion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 8);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Presenting %@ to %@", (uint8_t *)&v4, 0x16u);
}

@end