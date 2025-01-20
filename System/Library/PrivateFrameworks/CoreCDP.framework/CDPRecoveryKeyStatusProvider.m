@interface CDPRecoveryKeyStatusProvider
- (BOOL)idmsHasRK;
- (BOOL)isRecoveryKeySetInOctagonWithError:(id *)a3;
- (BOOL)isRecoveryKeySetInSOSWithError:(id *)a3;
- (CDPRecoveryKeyStatusProvider)initWithContext:(id)a3;
- (void)idmsHasRK;
@end

@implementation CDPRecoveryKeyStatusProvider

- (CDPRecoveryKeyStatusProvider)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPRecoveryKeyStatusProvider;
  v5 = [(CDPRecoveryKeyStatusProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[CDPContext preflightContext:v4];
    context = v5->_context;
    v5->_context = (CDPContext *)v6;
  }
  return v5;
}

- (BOOL)idmsHasRK
{
  v3 = [MEMORY[0x263F290F0] sharedInstance];
  id v4 = [(CDPContext *)self->_context altDSID];
  v5 = [v3 authKitAccountWithAltDSID:v4];

  if (!v5)
  {
    v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(CDPRecoveryKeyStatusProvider *)v8 idmsHasRK];
    }

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_7:
    char v7 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = [v3 hasModernRecoveryKeyForAccount:v5];
  char v7 = [v6 BOOLValue];

LABEL_8:
  return v7;
}

- (BOOL)isRecoveryKeySetInOctagonWithError:(id *)a3
{
  id v4 = [(CDPContext *)self->_context cliqueConfiguration];
  if (v4)
  {
    id v16 = 0;
    char v5 = [MEMORY[0x263F16D30] isRecoveryKeySetInOctagon:v4 error:&v16];
    id v6 = v16;
    if (v6)
    {
      char v7 = _CDPLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CDPRecoveryKeyStatusProvider isRecoveryKeySetInOctagonWithError:]((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
      }

      char v5 = 0;
      if (a3) {
        *a3 = v6;
      }
    }
  }
  else
  {
    uint64_t v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CDPRecoveryKeyStatusProvider isRecoveryKeySetInOctagonWithError:](v14);
    }

    if (a3)
    {
      objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:underlyingError:", -5217, *a3);
      char v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isRecoveryKeySetInSOSWithError:(id *)a3
{
  id v4 = [(CDPContext *)self->_context cliqueConfiguration];
  id v15 = 0;
  char v5 = [MEMORY[0x263F16D30] isRecoveryKeySetInSOS:v4 error:&v15];
  id v6 = v15;
  if (v6)
  {
    char v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CDPRecoveryKeyStatusProvider isRecoveryKeySetInSOSWithError:]((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }

    char v5 = 0;
    if (a3) {
      *a3 = v6;
    }
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)idmsHasRK
{
}

- (void)isRecoveryKeySetInOctagonWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2182AE000, log, OS_LOG_TYPE_ERROR, "CDPContext cliqueConfiguration returned nil. Cannot check if RK state matches across systems.", v1, 2u);
}

- (void)isRecoveryKeySetInOctagonWithError:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isRecoveryKeySetInSOSWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end