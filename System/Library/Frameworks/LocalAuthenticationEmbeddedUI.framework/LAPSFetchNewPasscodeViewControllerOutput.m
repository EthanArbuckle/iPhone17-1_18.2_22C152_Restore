@interface LAPSFetchNewPasscodeViewControllerOutput
- (BOOL)isPasscodeRecoveryEnabled;
- (LAPSPasscode)passcode;
- (void)setIsPasscodeRecoveryEnabled:(BOOL)a3;
- (void)setPasscode:(id)a3;
@end

@implementation LAPSFetchNewPasscodeViewControllerOutput

- (LAPSPasscode)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (BOOL)isPasscodeRecoveryEnabled
{
  return self->_isPasscodeRecoveryEnabled;
}

- (void)setIsPasscodeRecoveryEnabled:(BOOL)a3
{
  self->_isPasscodeRecoveryEnabled = a3;
}

- (void).cxx_destruct
{
}

@end