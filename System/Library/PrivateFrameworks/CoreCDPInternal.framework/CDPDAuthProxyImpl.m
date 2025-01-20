@interface CDPDAuthProxyImpl
- (BOOL)isPrimaryAppleIDLoggedIn;
- (id)_authContextFromCDPContext:(id)a3;
- (void)cdpContext:(id)a3 persistMasterKeyVerifier:(id)a4 completion:(id)a5;
- (void)cdpContext:(id)a3 persistRecoveryKey:(id)a4 keyType:(unint64_t)a5 completion:(id)a6;
- (void)cdpContext:(id)a3 verifyMasterKey:(id)a4 completion:(id)a5;
- (void)getUserInformationForAltDSID:(id)a3 completion:(id)a4;
@end

@implementation CDPDAuthProxyImpl

- (void)cdpContext:(id)a3 persistRecoveryKey:(id)a4 keyType:(unint64_t)a5 completion:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v10 altDSID];
    int v18 = 134218242;
    unint64_t v19 = a5;
    __int16 v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Attempting to persist verifier for keyType: %ld for %@", (uint8_t *)&v18, 0x16u);
  }
  v15 = [(CDPDAuthProxyImpl *)self _authContextFromCDPContext:v10];
  [v15 setAuthenticationType:1];
  id v16 = objc_alloc_init(MEMORY[0x263F29230]);
  [v16 setVerifier:v12];

  [v16 setKeyType:0];
  if (a5 == 1) {
    [v16 setKeyType:1];
  }
  id v17 = objc_alloc_init(MEMORY[0x263F29118]);
  [v17 persistRecoveryKeyWithContext:v16 authContext:v15 completion:v11];
}

- (void)cdpContext:(id)a3 persistMasterKeyVerifier:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 altDSID];
    int v15 = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    int v18 = v12;
    _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to persist verifier: %@ for %@", (uint8_t *)&v15, 0x16u);
  }
  v13 = [(CDPDAuthProxyImpl *)self _authContextFromCDPContext:v8];
  [v13 setAuthenticationType:1];
  id v14 = objc_alloc_init(MEMORY[0x263F29118]);
  [v14 persistMasterKeyVerifier:v9 context:v13 completion:v10];
}

- (void)cdpContext:(id)a3 verifyMasterKey:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CDPDAuthProxyImpl *)self _authContextFromCDPContext:a3];
  if (objc_opt_respondsToSelector()) {
    [v10 setIsRKVerification:1];
  }
  [v10 setAuthenticationType:1];
  if (objc_opt_respondsToSelector())
  {
    id v11 = [MEMORY[0x263F290F8] recoveryContextWithAuthContext:v10];
    id v12 = objc_alloc_init(MEMORY[0x263F29118]);
    if (objc_opt_respondsToSelector())
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __59__CDPDAuthProxyImpl_cdpContext_verifyMasterKey_completion___block_invoke;
      v16[3] = &unk_26432F1E0;
      id v17 = v9;
      [v12 verifyMasterKey:v8 context:v11 completion:v16];
      v13 = v17;
    }
    else
    {
      int v15 = _CDPLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CDPDAuthProxyImpl cdpContext:verifyMasterKey:completion:](v15);
      }

      if (!v9) {
        goto LABEL_15;
      }
      v13 = _CDPStateError();
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
    }

LABEL_15:
    goto LABEL_16;
  }
  id v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[CDPDAuthProxyImpl cdpContext:verifyMasterKey:completion:](v14);
  }

  if (v9)
  {
    id v11 = _CDPStateError();
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v11);
LABEL_16:
  }
}

void __59__CDPDAuthProxyImpl_cdpContext_verifyMasterKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = *(void (**)(void))(v6 + 16);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = *(void (**)(void))(v6 + 16);
  }
  v7();
LABEL_7:
}

- (id)_authContextFromCDPContext:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F29110];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setIsUsernameEditable:0];
  uint64_t v6 = [v4 appleID];
  [v5 setUsername:v6];

  v7 = [v4 altDSID];
  [v5 setAltDSID:v7];

  id v8 = [v4 dsid];

  id v9 = [v8 stringValue];
  [v5 setDSID:v9];

  return v5;
}

- (BOOL)isPrimaryAppleIDLoggedIn
{
  v2 = [MEMORY[0x263F290F0] sharedInstance];
  v3 = [v2 primaryAuthKitAccount];

  return v3 != 0;
}

- (void)getUserInformationForAltDSID:(id)a3 completion:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F29118];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 getUserInformationForAltDSID:v7 completion:v6];
}

- (void)cdpContext:(os_log_t)log verifyMasterKey:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "AKAppleIDAuthenticationController verifyMasterKey unimplemented", v1, 2u);
}

- (void)cdpContext:(os_log_t)log verifyMasterKey:completion:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "AKAccountRecoveryContext recoveryContextWithAuthContext unimplemented", v1, 2u);
}

@end