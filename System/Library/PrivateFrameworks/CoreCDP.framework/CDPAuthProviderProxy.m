@interface CDPAuthProviderProxy
+ (id)proxyWithAuthProvider:(id)a3;
- (void)cdpContext:(id)a3 performSilentRecoveryTokenRenewal:(id)a4;
- (void)cdpContext:(id)a3 verifyMasterKey:(id)a4 completion:(id)a5;
@end

@implementation CDPAuthProviderProxy

+ (id)proxyWithAuthProvider:(id)a3
{
  v3 = (CDPAuthProvider *)a3;
  v4 = objc_alloc_init(CDPAuthProviderProxy);
  authProvider = v4->_authProvider;
  v4->_authProvider = v3;

  return v4;
}

- (void)cdpContext:(id)a3 performSilentRecoveryTokenRenewal:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "Starting token renewal", buf, 2u);
  }

  if (objc_opt_respondsToSelector())
  {
    authProvider = self->_authProvider;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__CDPAuthProviderProxy_cdpContext_performSilentRecoveryTokenRenewal___block_invoke;
    v11[3] = &unk_264317108;
    id v12 = v7;
    [(CDPAuthProvider *)authProvider cdpContext:v6 performSilentRecoveryTokenRenewal:v11];
    v10 = v12;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    v10 = _CDPStateError(-5200, 0);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
    goto LABEL_7;
  }
LABEL_8:
}

void __69__CDPAuthProviderProxy_cdpContext_performSilentRecoveryTokenRenewal___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __69__CDPAuthProviderProxy_cdpContext_performSilentRecoveryTokenRenewal___block_invoke_cold_1(v8);
  }
}

- (void)cdpContext:(id)a3 verifyMasterKey:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 altDSID];
    *(_DWORD *)buf = 138412290;
    v18 = v12;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "Starting MRK verification for %@", buf, 0xCu);
  }
  if (objc_opt_respondsToSelector())
  {
    authProvider = self->_authProvider;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __62__CDPAuthProviderProxy_cdpContext_verifyMasterKey_completion___block_invoke;
    v15[3] = &unk_264317130;
    id v16 = v10;
    [(CDPAuthProvider *)authProvider cdpContext:v8 verifyMasterKey:v9 completion:v15];
    v14 = v16;
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    v14 = _CDPStateError(-5200, 0);
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
    goto LABEL_7;
  }
LABEL_8:
}

void __62__CDPAuthProviderProxy_cdpContext_verifyMasterKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __62__CDPAuthProviderProxy_cdpContext_verifyMasterKey_completion___block_invoke_cold_1(v8);
  }
}

- (void).cxx_destruct
{
}

void __69__CDPAuthProviderProxy_cdpContext_performSilentRecoveryTokenRenewal___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2182AE000, log, OS_LOG_TYPE_DEBUG, "Token completion block called", v1, 2u);
}

void __62__CDPAuthProviderProxy_cdpContext_verifyMasterKey_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2182AE000, log, OS_LOG_TYPE_DEBUG, "MRK verification completion block called", v1, 2u);
}

@end