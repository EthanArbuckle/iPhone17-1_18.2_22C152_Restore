@interface DTODeviceInfoProvider
- (BOOL)hasBeenUnlockedSinceBoot;
- (BOOL)hasBiometricEnrollmentsForCurrentUser;
- (BOOL)hasBiometricEnrollmentsForUser:(unsigned int)a3;
- (BOOL)hasCompletedSetup;
- (BOOL)hasPasscodeSetForCurrentUser;
- (BOOL)hasPasscodeSetForUser:(unsigned int)a3;
- (BOOL)isPhone;
- (id)serialNumber;
@end

@implementation DTODeviceInfoProvider

- (BOOL)hasBiometricEnrollmentsForCurrentUser
{
  uint64_t v3 = geteuid();

  return [(DTODeviceInfoProvider *)self hasBiometricEnrollmentsForUser:v3];
}

- (BOOL)hasBiometricEnrollmentsForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = +[BiometryHelper sharedInstance];
  v5 = +[NSNumber numberWithUnsignedInt:v3];
  unsigned __int8 v6 = [v4 isEnrolled:v5 error:0];

  return v6;
}

- (id)serialNumber
{
  v2 = +[LACMobileGestalt serialNumber];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = &stru_100039678;
  }
  v4 = v2;

  return v4;
}

- (BOOL)hasPasscodeSetForCurrentUser
{
  uint64_t v3 = geteuid();

  return [(DTODeviceInfoProvider *)self hasPasscodeSetForUser:v3];
}

- (BOOL)hasPasscodeSetForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = +[LAPasscodeHelper sharedInstance];
  LOBYTE(v3) = [v4 isPasscodeSetForUser:v3 error:0];

  return v3;
}

- (BOOL)isPhone
{
  return +[LACMobileGestalt isIdiomPhone];
}

- (BOOL)hasBeenUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

- (BOOL)hasCompletedSetup
{
  v2 = +[LACSetUpStateProvider sharedInstance];
  unsigned __int8 v3 = [v2 hasCompletedSetup];

  return v3;
}

@end