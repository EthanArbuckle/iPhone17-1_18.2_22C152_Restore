@interface LAPSFetchOldPasscodeResult
- (LAPSFetchOldPasscodeResult)initWithPasscode:(id)a3;
- (LAPSFetchOldPasscodeResult)initWithRawPasscode:(id)a3;
- (LAPSPasscode)passcode;
@end

@implementation LAPSFetchOldPasscodeResult

- (LAPSFetchOldPasscodeResult)initWithPasscode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSFetchOldPasscodeResult;
  v6 = [(LAPSFetchOldPasscodeResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_passcode, a3);
  }

  return v7;
}

- (LAPSFetchOldPasscodeResult)initWithRawPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [[LAPSPasscode alloc] initWithPasscode:v4];

  v6 = [(LAPSFetchOldPasscodeResult *)self initWithPasscode:v5];
  return v6;
}

- (LAPSPasscode)passcode
{
  return self->_passcode;
}

- (void).cxx_destruct
{
}

@end