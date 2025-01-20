@interface CSDeviceUnblockPolicy
- (BOOL)canUnblockDevice;
- (BOOL)canUnblockDeviceUsingErase;
- (BOOL)canUnblockDeviceUsingRecovery;
- (CSDeviceUnblockPolicy)initWithEnvironment:(id)a3;
@end

@implementation CSDeviceUnblockPolicy

- (CSDeviceUnblockPolicy)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSDeviceUnblockPolicy;
  v6 = [(CSDeviceUnblockPolicy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_env, a3);
  }

  return v7;
}

- (BOOL)canUnblockDeviceUsingErase
{
  if (![(CSDeviceUnblockPolicyEnvironment *)self->_env isUserRequestedEraseEnabled]
    || ![(CSDeviceUnblockPolicyEnvironment *)self->_env isUserFindMyAccountPresent])
  {
    return 0;
  }
  env = self->_env;

  return [(CSDeviceUnblockPolicyEnvironment *)env isDeviceInternetConnectionActive];
}

- (BOOL)canUnblockDeviceUsingRecovery
{
  return [(CSDeviceUnblockPolicyEnvironment *)self->_env isPasscodeGracePeriodUsable];
}

- (BOOL)canUnblockDevice
{
  if ([(CSDeviceUnblockPolicy *)self canUnblockDeviceUsingErase]) {
    return 1;
  }

  return [(CSDeviceUnblockPolicy *)self canUnblockDeviceUsingRecovery];
}

- (void).cxx_destruct
{
}

@end