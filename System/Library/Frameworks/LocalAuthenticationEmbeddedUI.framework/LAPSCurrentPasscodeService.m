@interface LAPSCurrentPasscodeService
- (BOOL)canChangePasscodeWithError:(id *)a3;
- (BOOL)canRemovePasscodeWithError:(id *)a3;
- (BOOL)hasPasscode;
- (LAPSCurrentPasscodeService)initWithPersistence:(id)a3;
- (LAPSCurrentPasscodeService)initWithPersistence:(id)a3 options:(id)a4;
- (LAPSPasscodePersistence)persistence;
- (id)passcodeCreationDate;
- (id)passcodeType;
- (int64_t)backoffTimeout;
- (int64_t)failedPasscodeAttempts;
- (void)_reportPasscodeChangedTo:(id)a3;
- (void)changePasscode:(id)a3 to:(id)a4 enableRecovery:(BOOL)a5 completion:(id)a6;
- (void)verifyPasscode:(id)a3 completion:(id)a4;
@end

@implementation LAPSCurrentPasscodeService

- (LAPSCurrentPasscodeService)initWithPersistence:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(LAPSCurrentPasscodeServiceOptions);
  v6 = [(LAPSCurrentPasscodeService *)self initWithPersistence:v4 options:v5];

  return v6;
}

- (LAPSCurrentPasscodeService)initWithPersistence:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LAPSCurrentPasscodeService;
  v9 = [(LAPSCurrentPasscodeService *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistence, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (BOOL)hasPasscode
{
  v2 = [(LAPSCurrentPasscodeService *)self persistence];
  char v3 = [v2 hasPasscode];

  return v3;
}

- (id)passcodeCreationDate
{
  return (id)[(LAPSPasscodePersistence *)self->_persistence passcodeCreationDate];
}

- (int64_t)backoffTimeout
{
  v2 = [(LAPSCurrentPasscodeService *)self persistence];
  char v3 = [v2 backoffTimeout];
  id v4 = v3;
  if (!v3) {
    char v3 = &unk_26F32BB48;
  }
  int64_t v5 = [v3 integerValue];

  return v5;
}

- (id)passcodeType
{
  v2 = [(LAPSCurrentPasscodeService *)self persistence];
  char v3 = [v2 passcodeType];

  return v3;
}

- (int64_t)failedPasscodeAttempts
{
  v2 = [(LAPSCurrentPasscodeService *)self persistence];
  char v3 = [v2 failedPasscodeAttempts];
  id v4 = v3;
  if (!v3) {
    char v3 = &unk_26F32BB48;
  }
  int64_t v5 = [v3 integerValue];

  return v5;
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
  v11 = (void (**)(id, uint64_t))a4;
  id v6 = a3;
  id v7 = [(LAPSCurrentPasscodeService *)self persistence];
  id v8 = [v7 verifyPasscode:v6];

  if (v8)
  {
    if ([(LAPSCurrentPasscodeService *)self backoffTimeout] < 1)
    {
      if (+[LAPSErrorBuilder checkError:v8 hasCode:4]) {
        +[LAPSErrorBuilder invalidPasscodeErrorWithFailedAttemptsCount:[(LAPSCurrentPasscodeService *)self failedPasscodeAttempts]];
      }
      else {
      uint64_t v9 = +[LAPSErrorBuilder genericErrorWithUnderlyingError:v8];
      }
    }
    else
    {
      uint64_t v9 = +[LAPSErrorBuilder invalidPasscodeErrorWithFailedAttemptsCount:[(LAPSCurrentPasscodeService *)self failedPasscodeAttempts] backoffTimeout:[(LAPSCurrentPasscodeService *)self backoffTimeout]];
    }
    v10 = (void *)v9;
    v11[2](v11, v9);
  }
  else
  {
    v11[2](v11, 0);
  }
}

- (BOOL)canChangePasscodeWithError:(id *)a3
{
  char v4 = [(LAPSPasscodePersistence *)self->_persistence canChangePasscode];
  BOOL v5 = v4;
  if (a3 && (v4 & 1) == 0)
  {
    *a3 = +[LAPSErrorBuilder genericErrorWithDebugDescription:@"Passcode change is not allowed"];
  }
  return v5;
}

- (BOOL)canRemovePasscodeWithError:(id *)a3
{
  return [(LAPSPasscodePersistence *)self->_persistence canRemovePasscode:a3];
}

- (void)changePasscode:(id)a3 to:(id)a4 enableRecovery:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  v28[3] = *MEMORY[0x263EF8340];
  id v10 = a4;
  v11 = (void (**)(id, void))a6;
  id v12 = a3;
  v13 = [(LAPSCurrentPasscodeService *)self persistence];
  id v26 = 0;
  char v14 = [v13 changePasscode:v12 to:v10 enableRecovery:v7 error:&v26];

  id v15 = v26;
  if (v14)
  {
    v16 = [(LAPSCurrentPasscodeService *)self persistence];
    v17 = [v16 setPasscodeRecoveryEnabled:v7];

    if (v17)
    {
      v18 = [NSString stringWithFormat:@"Passcode recovery intent storage failed (error: %@)", v17];
      v19 = LACLogPasscodeService();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[LAPSCurrentPasscodeService changePasscode:to:enableRecovery:completion:]((uint64_t)v18, v19);
      }
    }
    if ([(LAPSCurrentPasscodeServiceOptions *)self->_options skipSuccessNotification])
    {
      v20 = LACLogPasscodeService();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23F450000, v20, OS_LOG_TYPE_DEFAULT, "Skipping success notification as requested", buf, 2u);
      }
    }
    else
    {
      [(LAPSCurrentPasscodeService *)self _reportPasscodeChangedTo:v10];
    }
    v11[2](v11, 0);
  }
  else
  {
    v27[0] = *MEMORY[0x263F08320];
    uint64_t v21 = +[LALocalizedString passcodeChangeFailedTitle];
    v28[0] = v21;
    v27[1] = *MEMORY[0x263F07F80];
    v22 = [NSString stringWithFormat:@"Passcode change failed (error: %@)", v15];
    v27[2] = @"LAPSInteractiveErrorKey";
    v28[1] = v22;
    v28[2] = MEMORY[0x263EFFA88];
    v23 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
    v24 = +[LAPSErrorBuilder errorWithCode:9 userInfo:v23];
    ((void (**)(id, void *))v11)[2](v11, v24);

    v11 = (void (**)(id, void))v21;
    v17 = v15;
  }
}

- (void)_reportPasscodeChangedTo:(id)a3
{
  id v4 = a3;
  BOOL v5 = LACLogPasscodeService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl(&dword_23F450000, v5, OS_LOG_TYPE_DEFAULT, "CDP update will start", v7, 2u);
  }

  id v6 = [(LAPSCurrentPasscodeService *)self persistence];
  [v6 reportPasscodeDidChangeTo:v4 completion:&__block_literal_global_2];
}

void __55__LAPSCurrentPasscodeService__reportPasscodeChangedTo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  char v3 = LACLogPasscodeService();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_23F450000, v3, OS_LOG_TYPE_DEFAULT, "CDP update did finish (error: %@)", (uint8_t *)&v4, 0xCu);
  }
}

- (LAPSPasscodePersistence)persistence
{
  return self->_persistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

- (void)changePasscode:(uint64_t)a1 to:(NSObject *)a2 enableRecovery:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F450000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end