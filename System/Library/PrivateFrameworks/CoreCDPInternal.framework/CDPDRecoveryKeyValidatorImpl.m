@interface CDPDRecoveryKeyValidatorImpl
- (BOOL)recoveryKeyVerified;
- (CDPDRecoveryKeyValidatorImpl)initWithContext:(id)a3 delegate:(id)a4 octagonTrustProxy:(id)a5;
- (NSString)recoveryKey;
- (void)confirmRecoveryKey:(id)a3 completion:(id)a4;
- (void)generateRecoveryKey:(id)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setRecoveryKeyVerified:(BOOL)a3;
@end

@implementation CDPDRecoveryKeyValidatorImpl

- (CDPDRecoveryKeyValidatorImpl)initWithContext:(id)a3 delegate:(id)a4 octagonTrustProxy:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(CDPDRecoveryKeyValidatorImpl *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    v13->_recoveryKeyVerified = 0;
    objc_storeStrong((id *)&v13->_octagonTrustProxy, a5);
  }

  return v13;
}

- (void)confirmRecoveryKey:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = self;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "%@ : Confirming recovery key", buf, 0xCu);
  }

  if (!v7) {
    -[CDPDRecoveryKeyValidatorImpl confirmRecoveryKey:completion:]();
  }
  id v9 = [(CDPDRecoveryKeyValidatorImpl *)self recoveryKey];
  char v10 = [v9 isEqualToString:v6];

  if (v10)
  {
    octagonTrustProxy = self->_octagonTrustProxy;
    v12 = [(CDPContext *)self->_context altDSID];
    id v24 = 0;
    int v13 = [(CDPDOctagonTrustProxy *)octagonTrustProxy cacheRecoveryKey:v6 forAltDSID:v12 error:&v24];
    id v14 = v24;

    v15 = _CDPLogSystem();
    v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "cached reovery key", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __62__CDPDAccountRecoveryValidator_confirmRecoveryKey_completion___block_invoke_cold_1(v16);
    }

    v18 = self->_octagonTrustProxy;
    id v23 = 0;
    uint64_t v19 = [(CDPDOctagonTrustProxy *)v18 registerRecoveryKey:v6 error:&v23];
    id v20 = v23;
    v21 = _CDPLogSystem();
    v22 = v21;
    if (v19)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v22, OS_LOG_TYPE_DEFAULT, "Registered recovery key in local trust systems", buf, 2u);
      }

      [(CDPDRecoveryKeyValidatorImpl *)self setRecoveryKeyVerified:1];
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[CDPDRecoveryKeyValidatorImpl confirmRecoveryKey:completion:]((uint64_t)v20, v22);
      }
    }
    v7[2](v7, v19, v20);
  }
  else
  {
    v17 = _CDPLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CDPDRecoveryKeyValidatorImpl confirmRecoveryKey:completion:].cold.4(v17);
    }

    v7[2](v7, 0, 0);
  }
}

- (void)generateRecoveryKey:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *, id))a3;
  v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "%@ : Generating recovery key", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = 0;
  v7 = [WeakRetained generateRecoveryKeyWithInfo:MEMORY[0x263EFFA78] error:&v10];
  id v8 = v10;
  [(CDPDRecoveryKeyValidatorImpl *)self setRecoveryKey:v7];

  id v9 = [(CDPDRecoveryKeyValidatorImpl *)self recoveryKey];
  v4[2](v4, v9, v8);
}

- (void)setRecoveryKey:(id)a3
{
  v4 = (NSString *)a3;
  [(CDPDRecoveryKeyValidatorImpl *)self setRecoveryKeyVerified:0];
  recoveryKey = self->_recoveryKey;
  self->_recoveryKey = v4;
}

- (BOOL)recoveryKeyVerified
{
  return self->_recoveryKeyVerified;
}

- (void)setRecoveryKeyVerified:(BOOL)a3
{
  self->_recoveryKeyVerified = a3;
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_octagonTrustProxy, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)confirmRecoveryKey:completion:.cold.1()
{
}

- (void)confirmRecoveryKey:(uint64_t)a1 completion:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 141558274;
  uint64_t v3 = 1752392040;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to register recovery key in local trust systems with error: %{mask.hash}@", (uint8_t *)&v2, 0x16u);
}

- (void)confirmRecoveryKey:(os_log_t)log completion:.cold.4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "Key mismatch detected", v1, 2u);
}

@end