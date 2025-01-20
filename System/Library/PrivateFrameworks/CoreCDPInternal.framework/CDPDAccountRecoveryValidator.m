@interface CDPDAccountRecoveryValidator
- (CDPDAccountRecoveryValidator)initWithContext:(id)a3 authProvider:(id)a4 octagonTrustProxy:(id)a5;
- (NSDictionary)recoveredInfo;
- (NSString)recoveryKey;
- (id)_cdpErrorFromAuthKitError:(id)a3;
- (void)confirmRecoveryKey:(id)a3 completion:(id)a4;
- (void)generateRecoveryKey:(id)a3;
- (void)setRecoveredInfo:(id)a3;
- (void)setRecoveryKey:(id)a3;
@end

@implementation CDPDAccountRecoveryValidator

- (CDPDAccountRecoveryValidator)initWithContext:(id)a3 authProvider:(id)a4 octagonTrustProxy:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(CDPDAccountRecoveryValidator *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_authProvider, a4);
    objc_storeStrong((id *)&v13->_context, a3);
    objc_storeStrong((id *)&v13->_octagonTrustProxy, a5);
  }

  return v13;
}

- (void)confirmRecoveryKey:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "%@ : Confirming recovery key", buf, 0xCu);
  }

  if (!v7) {
    -[CDPDAccountRecoveryValidator confirmRecoveryKey:completion:]();
  }
  authProvider = self->_authProvider;
  if (!authProvider) {
    -[CDPDAccountRecoveryValidator confirmRecoveryKey:completion:]();
  }
  context = self->_context;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__CDPDAccountRecoveryValidator_confirmRecoveryKey_completion___block_invoke;
  v13[3] = &unk_26432F0B8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(CDPAuthProviderInternal *)authProvider cdpContext:context verifyMasterKey:v12 completion:v13];
}

void __62__CDPDAccountRecoveryValidator_confirmRecoveryKey_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) setRecoveredInfo:a2];
    [*(id *)(a1 + 32) setRecoveryKey:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = *(void **)(v6 + 24);
    id v9 = [*(id *)(v6 + 16) altDSID];
    id v17 = 0;
    int v10 = [v8 cacheRecoveryKey:v7 forAltDSID:v9 error:&v17];
    id v11 = v17;

    id v12 = _CDPLogSystem();
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "cached reovery key", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __62__CDPDAccountRecoveryValidator_confirmRecoveryKey_completion___block_invoke_cold_1(v13);
    }

    v16 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "%@ : recovery failed with error %@", buf, 0x16u);
    }

    id v11 = [*(id *)(a1 + 32) _cdpErrorFromAuthKitError:v5];
    v16 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v16();
}

- (void)generateRecoveryKey:(id)a3
{
  v3 = (void (**)(id, void, void *))a3;
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CDPDAccountRecoveryValidator generateRecoveryKey:](v4);
  }

  if (v3)
  {
    id v5 = _CDPStateError();
    v3[2](v3, 0, v5);
  }
}

- (id)_cdpErrorFromAuthKitError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x263F28F30]]) {
      [v4 code];
    }

    uint64_t v6 = _CDPStateErrorWithUnderlying();
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSDictionary)recoveredInfo
{
  return self->_recoveredInfo;
}

- (void)setRecoveredInfo:(id)a3
{
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_recoveredInfo, 0);
  objc_storeStrong((id *)&self->_octagonTrustProxy, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_authProvider, 0);
}

- (void)confirmRecoveryKey:completion:.cold.1()
{
}

- (void)confirmRecoveryKey:completion:.cold.2()
{
}

void __62__CDPDAccountRecoveryValidator_confirmRecoveryKey_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "failed to cache recovery key", v1, 2u);
}

- (void)generateRecoveryKey:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "Programming error detected! File a radar!", v1, 2u);
}

@end