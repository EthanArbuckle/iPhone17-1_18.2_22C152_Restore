@interface LAPSPasscodeChangeSystemRecoveryAdapter
- (BOOL)canChangePasscodeWithError:(id *)a3;
- (BOOL)hasPasscode;
- (LAPSPasscodeChangeSystemRecoveryAdapter)initWithPersistence:(id)a3;
- (id)lastPasscodeChange;
- (id)newPasscodeRequest;
- (id)oldPasscodeRequest;
- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5;
- (void)verifyNewPasscode:(id)a3 completion:(id)a4;
- (void)verifyPasscode:(id)a3 completion:(id)a4;
@end

@implementation LAPSPasscodeChangeSystemRecoveryAdapter

- (LAPSPasscodeChangeSystemRecoveryAdapter)initWithPersistence:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LAPSPasscodeChangeSystemRecoveryAdapter;
  v5 = [(LAPSPasscodeChangeSystemRecoveryAdapter *)&v13 init];
  if (v5)
  {
    v6 = [[LAPSRecoveryPasscodeService alloc] initWithPersistence:v4];
    passcodeRecoveryService = v5->_passcodeRecoveryService;
    v5->_passcodeRecoveryService = v6;

    v8 = [[LAPSNewPasscodeService alloc] initWithPersistence:v4];
    newPasscodeService = v5->_newPasscodeService;
    v5->_newPasscodeService = v8;

    v10 = [[LAPSCurrentPasscodeService alloc] initWithPersistence:v4];
    currentPasscodeService = v5->_currentPasscodeService;
    v5->_currentPasscodeService = v10;
  }
  return v5;
}

- (id)oldPasscodeRequest
{
  v3 = objc_alloc_init(LAPSFetchOldPasscodeRequest);
  [(LAPSFetchOldPasscodeRequest *)v3 setFailedAttempts:[(LAPSRecoveryPasscodeService *)self->_passcodeRecoveryService failedPasscodeAttempts]];
  id v4 = [(LAPSRecoveryPasscodeService *)self->_passcodeRecoveryService passcodeType];
  [(LAPSFetchOldPasscodeRequest *)v3 setPasscodeType:v4];

  [(LAPSFetchOldPasscodeRequest *)v3 setBackoffTimeout:0];

  return v3;
}

- (id)newPasscodeRequest
{
  v3 = objc_alloc_init(LAPSFetchNewPasscodeRequest);
  id v4 = [(LAPSNewPasscodeService *)self->_newPasscodeService allowedPasscodeTypes];
  [(LAPSFetchNewPasscodeRequest *)v3 setAllowedPasscodeTypes:v4];

  v5 = [(LAPSNewPasscodeService *)self->_newPasscodeService passcodeType];
  [(LAPSFetchNewPasscodeRequest *)v3 setPasscodeType:v5];

  [(LAPSFetchNewPasscodeRequest *)v3 setIsPasscodeRecoverySupported:[(LAPSRecoveryPasscodeService *)self->_passcodeRecoveryService isPasscodeRecoverySupported]];
  [(LAPSFetchNewPasscodeRequest *)v3 setIsPasscodeRecoveryRestricted:[(LAPSRecoveryPasscodeService *)self->_passcodeRecoveryService isPasscodeRecoveryRestricted]];
  [(LAPSFetchNewPasscodeRequest *)v3 setIsPasscodeRecoveryEnabled:[(LAPSRecoveryPasscodeService *)self->_passcodeRecoveryService isPasscodeRecoveryEnabled]];
  return v3;
}

- (BOOL)hasPasscode
{
  return [(LAPSCurrentPasscodeService *)self->_currentPasscodeService hasPasscode];
}

- (id)lastPasscodeChange
{
  return [(LAPSCurrentPasscodeService *)self->_currentPasscodeService passcodeCreationDate];
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
}

- (BOOL)canChangePasscodeWithError:(id *)a3
{
  return [(LAPSRecoveryPasscodeService *)self->_passcodeRecoveryService isPasscodeRecoveryAvailableWithError:a3];
}

- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5
{
  passcodeRecoveryService = self->_passcodeRecoveryService;
  id v8 = a5;
  id v9 = a4;
  id v12 = [a3 passcode];
  v10 = [v9 passcode];
  uint64_t v11 = [v9 isPasscodeRecoveryEnabled];

  [(LAPSRecoveryPasscodeService *)passcodeRecoveryService changePasscode:v12 to:v10 enableRecovery:v11 completion:v8];
}

- (void)verifyNewPasscode:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newPasscodeService, 0);
  objc_storeStrong((id *)&self->_passcodeRecoveryService, 0);

  objc_storeStrong((id *)&self->_currentPasscodeService, 0);
}

@end