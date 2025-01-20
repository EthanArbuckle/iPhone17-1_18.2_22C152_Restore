@interface LAPSPasscodeChangeSystemStandardAdapter
- (BOOL)canChangePasscodeWithError:(id *)a3;
- (BOOL)hasPasscode;
- (LAPSPasscodeChangeSystemStandardAdapter)initWithPersistence:(id)a3;
- (LAPSPasscodeChangeSystemStandardAdapter)initWithPersistence:(id)a3 options:(id)a4;
- (id)lastPasscodeChange;
- (id)newPasscodeRequest;
- (id)oldPasscodeRequest;
- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5;
- (void)verifyNewPasscode:(id)a3 completion:(id)a4;
- (void)verifyPasscode:(id)a3 completion:(id)a4;
@end

@implementation LAPSPasscodeChangeSystemStandardAdapter

- (LAPSPasscodeChangeSystemStandardAdapter)initWithPersistence:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(LAPSPasscodeChangeSystemOptions);
  v6 = [(LAPSPasscodeChangeSystemStandardAdapter *)self initWithPersistence:v4 options:v5];

  return v6;
}

- (LAPSPasscodeChangeSystemStandardAdapter)initWithPersistence:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)LAPSPasscodeChangeSystemStandardAdapter;
  v8 = [(LAPSPasscodeChangeSystemStandardAdapter *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_options, a4);
    v10 = [LAPSCurrentPasscodeService alloc];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__LAPSPasscodeChangeSystemStandardAdapter_initWithPersistence_options___block_invoke;
    v19[3] = &unk_26506E9A8;
    id v20 = v7;
    v11 = __71__LAPSPasscodeChangeSystemStandardAdapter_initWithPersistence_options___block_invoke((uint64_t)v19);
    uint64_t v12 = [(LAPSCurrentPasscodeService *)v10 initWithPersistence:v6 options:v11];
    currentPasscodeService = v9->_currentPasscodeService;
    v9->_currentPasscodeService = (LAPSCurrentPasscodeService *)v12;

    v14 = [[LAPSNewPasscodeService alloc] initWithPersistence:v6];
    newPasscodeService = v9->_newPasscodeService;
    v9->_newPasscodeService = v14;

    v16 = [[LAPSRecoveryPasscodeService alloc] initWithPersistence:v6];
    recoveryPasscodeService = v9->_recoveryPasscodeService;
    v9->_recoveryPasscodeService = v16;
  }
  return v9;
}

LAPSCurrentPasscodeServiceOptions *__71__LAPSPasscodeChangeSystemStandardAdapter_initWithPersistence_options___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(LAPSCurrentPasscodeServiceOptions);
  -[LAPSCurrentPasscodeServiceOptions setSkipSuccessNotification:](v2, "setSkipSuccessNotification:", [*(id *)(a1 + 32) skipSuccessNotification]);

  return v2;
}

- (id)oldPasscodeRequest
{
  v3 = objc_alloc_init(LAPSFetchOldPasscodeRequest);
  [(LAPSFetchOldPasscodeRequest *)v3 setFailedAttempts:[(LAPSCurrentPasscodeService *)self->_currentPasscodeService failedPasscodeAttempts]];
  id v4 = [(LAPSCurrentPasscodeService *)self->_currentPasscodeService passcodeType];
  [(LAPSFetchOldPasscodeRequest *)v3 setPasscodeType:v4];

  [(LAPSFetchOldPasscodeRequest *)v3 setBackoffTimeout:[(LAPSCurrentPasscodeService *)self->_currentPasscodeService backoffTimeout]];

  return v3;
}

- (id)newPasscodeRequest
{
  v3 = objc_alloc_init(LAPSFetchNewPasscodeRequest);
  id v4 = [(LAPSNewPasscodeService *)self->_newPasscodeService allowedPasscodeTypes];
  [(LAPSFetchNewPasscodeRequest *)v3 setAllowedPasscodeTypes:v4];

  v5 = [(LAPSNewPasscodeService *)self->_newPasscodeService passcodeType];
  [(LAPSFetchNewPasscodeRequest *)v3 setPasscodeType:v5];

  if ([(LAPSRecoveryPasscodeService *)self->_recoveryPasscodeService isPasscodeRecoverySupported])
  {
    BOOL v6 = [(LAPSPasscodeChangeSystemStandardAdapter *)self hasPasscode];
  }
  else
  {
    BOOL v6 = 0;
  }
  [(LAPSFetchNewPasscodeRequest *)v3 setIsPasscodeRecoverySupported:v6];
  [(LAPSFetchNewPasscodeRequest *)v3 setIsPasscodeRecoveryRestricted:[(LAPSRecoveryPasscodeService *)self->_recoveryPasscodeService isPasscodeRecoveryRestricted]];
  [(LAPSFetchNewPasscodeRequest *)v3 setIsPasscodeRecoveryEnabled:[(LAPSRecoveryPasscodeService *)self->_recoveryPasscodeService isPasscodeRecoveryEnabled]];
  return v3;
}

- (id)lastPasscodeChange
{
  return [(LAPSCurrentPasscodeService *)self->_currentPasscodeService passcodeCreationDate];
}

- (BOOL)hasPasscode
{
  return [(LAPSCurrentPasscodeService *)self->_currentPasscodeService hasPasscode];
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
}

- (BOOL)canChangePasscodeWithError:(id *)a3
{
  return [(LAPSCurrentPasscodeService *)self->_currentPasscodeService canChangePasscodeWithError:a3];
}

- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5
{
  currentPasscodeService = self->_currentPasscodeService;
  id v8 = a5;
  id v9 = a4;
  id v12 = [a3 passcode];
  v10 = [v9 passcode];
  uint64_t v11 = [v9 isPasscodeRecoveryEnabled];

  [(LAPSCurrentPasscodeService *)currentPasscodeService changePasscode:v12 to:v10 enableRecovery:v11 completion:v8];
}

- (void)verifyNewPasscode:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryPasscodeService, 0);
  objc_storeStrong((id *)&self->_newPasscodeService, 0);
  objc_storeStrong((id *)&self->_currentPasscodeService, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end