@interface NRDevice
+ (id)activeDevice;
- (BOOL)hasHomeButton;
- (BOOL)isCellularSeries3;
- (BOOL)isRunningInternalBuild;
- (BOOL)isTinker;
@end

@implementation NRDevice

- (BOOL)isTinker
{
  v2 = [(NRDevice *)self valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasHomeButton
{
  v2 = [(NRDevice *)self valueForProperty:NRDevicePropertyHomeButtonType];
  unsigned __int8 v3 = (char *)[v2 integerValue];

  return v3 != (unsigned char *)&dword_0 + 2;
}

- (BOOL)isRunningInternalBuild
{
  if (qword_22F20 != -1) {
    dispatch_once(&qword_22F20, &stru_1C5D8);
  }
  return byte_22F18;
}

- (BOOL)isCellularSeries3
{
  v2 = [(NRDevice *)self valueForProperty:NRDevicePropertyProductType];
  unsigned __int8 v3 = [v2 stringValue];

  BOOL v4 = ![v3 caseInsensitiveCompare:@"watch3,1"]
    || ![v3 caseInsensitiveCompare:@"watch3,2"];

  return v4;
}

+ (id)activeDevice
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned __int8 v3 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  BOOL v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  v5 = [v4 firstObject];

  return v5;
}

@end