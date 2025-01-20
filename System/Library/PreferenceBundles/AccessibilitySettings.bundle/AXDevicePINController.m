@interface AXDevicePINController
+ (BOOL)settingEnabled;
- (BOOL)_deviceHasBiometrics;
- (BOOL)isNumericPIN;
- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4;
- (BOOL)simplePIN;
- (BOOL)useProgressiveDelays;
- (BOOL)validatePIN:(id)a3;
- (id)stringsTable;
- (int)passcodeLength;
- (void)setPIN:(id)a3;
@end

@implementation AXDevicePINController

- (BOOL)_deviceHasBiometrics
{
  if (MGGetBoolAnswer()) {
    return 1;
  }

  return AXDeviceHasPearl();
}

- (int)passcodeLength
{
  int v8 = 0;
  v3 = +[MCProfileConnection sharedConnection];
  unsigned int v4 = [v3 unlockScreenTypeWithOutSimplePasscodeType:&v8];

  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v8 == -1;
  }
  if (v5) {
    BOOL v6 = [(AXDevicePINController *)self _deviceHasBiometrics];
  }
  else {
    BOOL v6 = v8 == 1;
  }
  if (v6) {
    return 6;
  }
  else {
    return 4;
  }
}

+ (BOOL)settingEnabled
{
  return 1;
}

- (BOOL)isNumericPIN
{
  return 1;
}

- (BOOL)simplePIN
{
  return 1;
}

- (BOOL)useProgressiveDelays
{
  return 0;
}

- (BOOL)validatePIN:(id)a3
{
  return 1;
}

- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4
{
  id v5 = [a3 length];
  return v5 == (id)[(AXDevicePINController *)self passcodeLength];
}

- (id)stringsTable
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  v5.receiver = self;
  v5.super_class = (Class)AXDevicePINController;
  v3 = [(AXDevicePINController *)&v5 stringsTable];

  return v3;
}

- (void)setPIN:(id)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

@end