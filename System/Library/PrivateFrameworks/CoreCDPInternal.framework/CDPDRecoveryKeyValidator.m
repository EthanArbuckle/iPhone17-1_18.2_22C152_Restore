@interface CDPDRecoveryKeyValidator
- (void)_validateRecoveryKey:(id)a3 completion:(id)a4;
- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4;
@end

@implementation CDPDRecoveryKeyValidator

- (void)_validateRecoveryKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(CDPDSecureBackupContext);
  [(CDPDSecureBackupContext *)v8 setRecoveryKey:v7];

  v9 = [(CDPDDeviceSecretValidator *)self delegate];

  if (v9)
  {
    v10 = [(CDPDDeviceSecretValidator *)self delegate];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__CDPDRecoveryKeyValidator__validateRecoveryKey_completion___block_invoke;
    v13[3] = &unk_26432F368;
    id v14 = v6;
    [v10 secretValidator:self validateRecoveryKeyWithContext:v8 completion:v13];

    v11 = v14;
LABEL_7:

    goto LABEL_8;
  }
  v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRecoveryKeyValidator _validateRecoveryKey:completion:](v12);
  }

  if (v6)
  {
    v11 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 0);
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v11);
    goto LABEL_7;
  }
LABEL_8:
}

void __60__CDPDRecoveryKeyValidator__validateRecoveryKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = *(void (**)(void))(v6 + 16);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = *(void (**)(void))(v6 + 16);
  }
  v7();
LABEL_7:
}

- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__CDPDRecoveryKeyValidator_validateRecoveryKey_withCompletion___block_invoke;
  v8[3] = &unk_26432F368;
  id v9 = v6;
  id v7 = v6;
  [(CDPDRecoveryKeyValidator *)self _validateRecoveryKey:a3 completion:v8];
}

void __63__CDPDRecoveryKeyValidator_validateRecoveryKey_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = *(void (**)(void))(v6 + 16);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = *(void (**)(void))(v6 + 16);
  }
  v7();
LABEL_7:
}

- (void)_validateRecoveryKey:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "delegate is nil, calling completion with error", v1, 2u);
}

@end