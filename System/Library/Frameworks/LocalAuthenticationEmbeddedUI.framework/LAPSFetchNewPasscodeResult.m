@interface LAPSFetchNewPasscodeResult
- (BOOL)isPasscodeRecoveryEnabled;
- (LAPSFetchNewPasscodeResult)initWithPasscode:(id)a3 isPasscodeRecoveryEnabled:(BOOL)a4;
- (LAPSFetchNewPasscodeResult)initWithRawPasscode:(id)a3;
- (LAPSFetchNewPasscodeResult)initWithRawPasscode:(id)a3 isPasscodeRecoveryEnabled:(BOOL)a4;
- (LAPSPasscode)passcode;
@end

@implementation LAPSFetchNewPasscodeResult

- (LAPSFetchNewPasscodeResult)initWithPasscode:(id)a3 isPasscodeRecoveryEnabled:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LAPSFetchNewPasscodeResult;
  v8 = [(LAPSFetchNewPasscodeResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_passcode, a3);
    v9->_isPasscodeRecoveryEnabled = a4;
  }

  return v9;
}

- (LAPSFetchNewPasscodeResult)initWithRawPasscode:(id)a3 isPasscodeRecoveryEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [[LAPSPasscode alloc] initWithPasscode:v6];

  v8 = [(LAPSFetchNewPasscodeResult *)self initWithPasscode:v7 isPasscodeRecoveryEnabled:v4];
  return v8;
}

- (LAPSFetchNewPasscodeResult)initWithRawPasscode:(id)a3
{
  id v4 = a3;
  v5 = [[LAPSPasscode alloc] initWithPasscode:v4];

  id v6 = [(LAPSFetchNewPasscodeResult *)self initWithPasscode:v5 isPasscodeRecoveryEnabled:0];
  return v6;
}

- (LAPSPasscode)passcode
{
  return self->_passcode;
}

- (BOOL)isPasscodeRecoveryEnabled
{
  return self->_isPasscodeRecoveryEnabled;
}

- (void).cxx_destruct
{
}

@end