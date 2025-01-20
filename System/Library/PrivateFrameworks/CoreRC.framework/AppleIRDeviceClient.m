@interface AppleIRDeviceClient
+ (BOOL)supportsSecureCoding;
- (BOOL)isAppleRemote;
- (BOOL)pairAppleRemote:(id *)a3;
- (BOOL)unpairAppleRemote:(id *)a3;
- (Class)classForCoder;
@end

@implementation AppleIRDeviceClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return NSClassFromString(&cfstr_Appleirdevicep_4.isa);
}

- (BOOL)isAppleRemote
{
  return 1;
}

- (BOOL)pairAppleRemote:(id *)a3
{
  id v5 = [(CoreRCDevice *)self bus];
  return [v5 setPairState:1 forAppleRemote:self error:a3];
}

- (BOOL)unpairAppleRemote:(id *)a3
{
  id v5 = [(CoreRCDevice *)self bus];
  return [v5 setPairState:0 forAppleRemote:self error:a3];
}

@end