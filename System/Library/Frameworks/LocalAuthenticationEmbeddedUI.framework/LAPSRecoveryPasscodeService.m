@interface LAPSRecoveryPasscodeService
- (BOOL)_hasAttemptedPasscodeEnoughTimes;
- (BOOL)_hasPasscodeRecoveryAttemptsLeft;
- (BOOL)isPasscodeRecoveryAvailableWithError:(id *)a3;
- (BOOL)isPasscodeRecoveryEnabled;
- (BOOL)isPasscodeRecoveryRestricted;
- (BOOL)isPasscodeRecoverySupported;
- (LAPSPasscodePersistence)persistence;
- (LAPSRecoveryPasscodeService)initWithPersistence:(id)a3;
- (id)passcodeType;
- (int64_t)_failedPasscodeAttempts;
- (int64_t)_failedPasscodeRecoveryAttempts;
- (int64_t)_maxPasscodeRecoveryAttempts;
- (int64_t)_minRequiredPasscodeFailures;
- (void)_clearRecoveryPasscode;
- (void)_reportPasscodeChangedTo:(id)a3;
- (void)_setPasscodeRecoveryEnabled:(BOOL)a3;
- (void)changePasscode:(id)a3 to:(id)a4 enableRecovery:(BOOL)a5 completion:(id)a6;
- (void)verifyPasscode:(id)a3 completion:(id)a4;
@end

@implementation LAPSRecoveryPasscodeService

- (LAPSRecoveryPasscodeService)initWithPersistence:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSRecoveryPasscodeService;
  v6 = [(LAPSRecoveryPasscodeService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistence, a3);
  }

  return v7;
}

- (BOOL)isPasscodeRecoverySupported
{
  v2 = [(LAPSRecoveryPasscodeService *)self persistence];
  char v3 = [v2 isPasscodeRecoverySupported];

  return v3;
}

- (BOOL)isPasscodeRecoveryRestricted
{
  v2 = [(LAPSRecoveryPasscodeService *)self persistence];
  char v3 = [v2 isPasscodeRecoveryRestricted];

  return v3;
}

- (BOOL)isPasscodeRecoveryEnabled
{
  v2 = [(LAPSRecoveryPasscodeService *)self persistence];
  char v3 = [v2 isPasscodeRecoveryEnabled];

  return v3;
}

- (BOOL)isPasscodeRecoveryAvailableWithError:(id *)a3
{
  id v5 = [(LAPSRecoveryPasscodeService *)self persistence];
  char v6 = [v5 hasPasscode];

  if ((v6 & 1) == 0)
  {
    if (!a3) {
      return 0;
    }
    v12 = @"Passcode is not set";
LABEL_13:
    v13 = +[LAPSErrorBuilder genericErrorWithDebugDescription:v12];
LABEL_14:
    id v14 = v13;
    BOOL result = 0;
    *a3 = v14;
    return result;
  }
  v7 = [(LAPSRecoveryPasscodeService *)self persistence];
  char v8 = [v7 isPasscodeLockedOut];

  if ((v8 & 1) == 0)
  {
    if (!a3) {
      return 0;
    }
    v12 = @"Key bag is not ready for recovery";
    goto LABEL_13;
  }
  objc_super v9 = [(LAPSRecoveryPasscodeService *)self persistence];
  char v10 = [v9 isPasscodeRecoveryAvailable];

  if ((v10 & 1) == 0)
  {
    if (!a3) {
      return 0;
    }
    v12 = @"Passcode recovery is not available";
    goto LABEL_13;
  }
  if ([(LAPSRecoveryPasscodeService *)self _hasPasscodeRecoveryAttemptsLeft])
  {
    if ([(LAPSRecoveryPasscodeService *)self _hasAttemptedPasscodeEnoughTimes]) {
      return 1;
    }
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"Passcode reset is only available after %d failures", -[LAPSRecoveryPasscodeService _minRequiredPasscodeFailures](self, "_minRequiredPasscodeFailures"));
    if (a3)
    {
      *a3 = +[LAPSErrorBuilder genericErrorWithDebugDescription:v15];
    }

    return 0;
  }
  if (a3)
  {
    v13 = +[LAPSErrorBuilder tooManyAttemptsError];
    goto LABEL_14;
  }
  return 0;
}

- (id)passcodeType
{
  v2 = [(LAPSRecoveryPasscodeService *)self persistence];
  char v3 = [v2 recoveryPasscodeType];

  return v3;
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
  char v10 = (void (**)(id, void *))a4;
  id v6 = a3;
  v7 = [(LAPSRecoveryPasscodeService *)self persistence];
  char v8 = [v7 verifyRecoveryPasscode:v6];

  if (v8)
  {
    if ([(LAPSRecoveryPasscodeService *)self _hasPasscodeRecoveryAttemptsLeft])
    {
      if (+[LAPSErrorBuilder checkError:v8 hasCode:4]) {
        +[LAPSErrorBuilder invalidPasscodeErrorWithFailedAttemptsCount:[(LAPSRecoveryPasscodeService *)self failedPasscodeAttempts]];
      }
      else {
      objc_super v9 = +[LAPSErrorBuilder genericErrorWithUnderlyingError:v8];
      }
      v10[2](v10, v9);
    }
    else
    {
      [(LAPSRecoveryPasscodeService *)self _clearRecoveryPasscode];
      objc_super v9 = +[LAPSErrorBuilder tooManyAttemptsError];
      v10[2](v10, v9);
    }
  }
  else
  {
    v10[2](v10, 0);
  }
}

- (void)changePasscode:(id)a3 to:(id)a4 enableRecovery:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  v22[3] = *MEMORY[0x263EF8340];
  id v10 = a4;
  v11 = (void (**)(id, void))a6;
  id v12 = a3;
  v13 = [(LAPSRecoveryPasscodeService *)self persistence];
  id v20 = 0;
  char v14 = [v13 performRecovery:v12 newPasscode:v10 enableRecovery:v7 error:&v20];

  id v15 = v20;
  if (v14)
  {
    [(LAPSRecoveryPasscodeService *)self _reportPasscodeChangedTo:v10];
    [(LAPSRecoveryPasscodeService *)self _setPasscodeRecoveryEnabled:v7];
    v11[2](v11, 0);
  }
  else
  {
    v21[0] = *MEMORY[0x263F08320];
    uint64_t v16 = +[LALocalizedString passcodeRecoveryFailedTitle];
    v22[0] = v16;
    v21[1] = *MEMORY[0x263F07F80];
    v17 = [NSString stringWithFormat:@"Passcode recovery failed (error: %@)", v15];
    v21[2] = @"LAPSInteractiveErrorKey";
    v22[1] = v17;
    v22[2] = MEMORY[0x263EFFA88];
    v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
    v19 = +[LAPSErrorBuilder errorWithCode:9 userInfo:v18];
    ((void (**)(id, void *))v11)[2](v11, v19);

    v11 = (void (**)(id, void))v16;
  }
}

- (BOOL)_hasAttemptedPasscodeEnoughTimes
{
  int64_t v3 = [(LAPSRecoveryPasscodeService *)self _failedPasscodeAttempts];
  return v3 >= [(LAPSRecoveryPasscodeService *)self _minRequiredPasscodeFailures];
}

- (int64_t)_failedPasscodeAttempts
{
  v2 = [(LAPSRecoveryPasscodeService *)self persistence];
  int64_t v3 = [v2 failedPasscodeAttempts];
  v4 = v3;
  if (!v3) {
    int64_t v3 = &unk_26F32BB60;
  }
  int64_t v5 = [v3 integerValue];

  return v5;
}

- (int64_t)_minRequiredPasscodeFailures
{
  return 4;
}

- (BOOL)_hasPasscodeRecoveryAttemptsLeft
{
  int64_t v3 = [(LAPSRecoveryPasscodeService *)self _maxPasscodeRecoveryAttempts];
  return v3 > [(LAPSRecoveryPasscodeService *)self _failedPasscodeRecoveryAttempts];
}

- (int64_t)_maxPasscodeRecoveryAttempts
{
  v2 = [(LAPSRecoveryPasscodeService *)self persistence];
  int64_t v3 = [v2 maxPasscodeRecoveryAttempts];
  v4 = v3;
  if (!v3) {
    int64_t v3 = &unk_26F32BB60;
  }
  int64_t v5 = [v3 integerValue];

  return v5;
}

- (int64_t)_failedPasscodeRecoveryAttempts
{
  v2 = [(LAPSRecoveryPasscodeService *)self persistence];
  int64_t v3 = [v2 failedPasscodeRecoveryAttempts];
  v4 = v3;
  if (!v3) {
    int64_t v3 = &unk_26F32BB78;
  }
  int64_t v5 = [v3 integerValue];

  return v5;
}

- (void)_clearRecoveryPasscode
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F450000, a2, OS_LOG_TYPE_ERROR, "Could not clear recovery blob (error: %@)", (uint8_t *)&v2, 0xCu);
}

- (void)_reportPasscodeChangedTo:(id)a3
{
  id v4 = a3;
  int64_t v5 = LACLogPasscodeService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl(&dword_23F450000, v5, OS_LOG_TYPE_DEFAULT, "CDP update will start", v7, 2u);
  }

  id v6 = [(LAPSRecoveryPasscodeService *)self persistence];
  [v6 reportPasscodeDidChangeTo:v4 completion:&__block_literal_global_3];
}

void __56__LAPSRecoveryPasscodeService__reportPasscodeChangedTo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = LACLogPasscodeService();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_23F450000, v3, OS_LOG_TYPE_DEFAULT, "CDP update did finish (error: %@)", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_setPasscodeRecoveryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [(LAPSRecoveryPasscodeService *)self persistence];
  id v5 = [v4 setPasscodeRecoveryEnabled:v3];

  if (v5)
  {
    uint64_t v6 = LACLogPasscodeService();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[LAPSRecoveryPasscodeService _setPasscodeRecoveryEnabled:]((uint64_t)v5, v6);
    }
  }
}

- (LAPSPasscodePersistence)persistence
{
  return self->_persistence;
}

- (void).cxx_destruct
{
}

- (void)_setPasscodeRecoveryEnabled:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F450000, a2, OS_LOG_TYPE_ERROR, "Passcode recovery intent storage failed (error: %@)", (uint8_t *)&v2, 0xCu);
}

@end