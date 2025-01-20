@interface CSDeviceUnblockPolicyEnvironmentBuilder
- (BOOL)isDeviceInternetConnectionActive;
- (BOOL)isPasscodeGracePeriodUsable;
- (BOOL)isUserFindMyAccountPresent;
- (BOOL)isUserRequestedEraseEnabled;
- (void)setIsDeviceInternetConnectionActive:(BOOL)a3;
- (void)setIsPasscodeGracePeriodUsable:(BOOL)a3;
- (void)setIsUserFindMyAccountPresent:(BOOL)a3;
- (void)setIsUserRequestedEraseEnabled:(BOOL)a3;
@end

@implementation CSDeviceUnblockPolicyEnvironmentBuilder

- (BOOL)isUserRequestedEraseEnabled
{
  return self->_isUserRequestedEraseEnabled;
}

- (void)setIsUserRequestedEraseEnabled:(BOOL)a3
{
  self->_isUserRequestedEraseEnabled = a3;
}

- (BOOL)isUserFindMyAccountPresent
{
  return self->_isUserFindMyAccountPresent;
}

- (void)setIsUserFindMyAccountPresent:(BOOL)a3
{
  self->_isUserFindMyAccountPresent = a3;
}

- (BOOL)isDeviceInternetConnectionActive
{
  return self->_isDeviceInternetConnectionActive;
}

- (void)setIsDeviceInternetConnectionActive:(BOOL)a3
{
  self->_isDeviceInternetConnectionActive = a3;
}

- (BOOL)isPasscodeGracePeriodUsable
{
  return self->_isPasscodeGracePeriodUsable;
}

- (void)setIsPasscodeGracePeriodUsable:(BOOL)a3
{
  self->_isPasscodeGracePeriodUsable = a3;
}

@end