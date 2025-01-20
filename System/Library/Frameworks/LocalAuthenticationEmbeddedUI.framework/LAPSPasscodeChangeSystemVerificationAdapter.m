@interface LAPSPasscodeChangeSystemVerificationAdapter
- (BOOL)canChangePasscodeWithError:(id *)a3;
- (BOOL)hasPasscode;
- (LAPSPasscodeChangeSystemVerificationAdapter)initWithPersistence:(id)a3;
- (id)lastPasscodeChange;
- (id)newPasscodeRequest;
- (id)oldPasscodeRequest;
- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5;
- (void)verifyNewPasscode:(id)a3 completion:(id)a4;
- (void)verifyPasscode:(id)a3 completion:(id)a4;
@end

@implementation LAPSPasscodeChangeSystemVerificationAdapter

- (LAPSPasscodeChangeSystemVerificationAdapter)initWithPersistence:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSPasscodeChangeSystemVerificationAdapter;
  v5 = [(LAPSPasscodeChangeSystemVerificationAdapter *)&v9 init];
  if (v5)
  {
    v6 = [[LAPSCurrentPasscodeService alloc] initWithPersistence:v4];
    currentPasscodeService = v5->_currentPasscodeService;
    v5->_currentPasscodeService = v6;
  }
  return v5;
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
  return objc_alloc_init(LAPSFetchNewPasscodeRequest);
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
  return 1;
}

- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5
{
}

- (void)verifyNewPasscode:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
}

@end