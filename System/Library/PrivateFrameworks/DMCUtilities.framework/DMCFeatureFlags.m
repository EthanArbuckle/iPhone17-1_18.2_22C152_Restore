@interface DMCFeatureFlags
+ (BOOL)hasT2;
+ (BOOL)isAppDistributionPVEnabled;
+ (BOOL)isAppleInternal;
+ (BOOL)isDEPPushEnabled;
+ (BOOL)isHRNEnabled;
+ (BOOL)isMDACoResidencyEnabled;
+ (BOOL)isMDAMDMManagedEnabled;
+ (BOOL)isVisionMDMEnabled;
+ (BOOL)isVisionProfileEnrollEnabled;
+ (BOOL)isWellKnownDiscoveryEnabled;
@end

@implementation DMCFeatureFlags

+ (BOOL)isAppDistributionPVEnabled
{
  return MEMORY[0x1F40C9FB0]("DeviceManagementClient", "AppDistributionPV");
}

+ (BOOL)isDEPPushEnabled
{
  return MEMORY[0x1F40C9FB0]("DeviceManagementClient", "DEPPush");
}

+ (BOOL)isHRNEnabled
{
  return MEMORY[0x1F40C9FB0]("DeviceManagementClient", "HRN");
}

+ (BOOL)isMDACoResidencyEnabled
{
  return MEMORY[0x1F40C9FB0]("DeviceManagementClient", "MDACoResidency");
}

+ (BOOL)isMDAMDMManagedEnabled
{
  return MEMORY[0x1F40C9FB0]("DeviceManagementClient", "MDAMDMManaged");
}

+ (BOOL)isVisionMDMEnabled
{
  return MEMORY[0x1F40C9FB0]("DeviceManagementClient", "VisionMDM");
}

+ (BOOL)isVisionProfileEnrollEnabled
{
  return MEMORY[0x1F40C9FB0]("DeviceManagementClient", "VisionProfileEnroll");
}

+ (BOOL)isWellKnownDiscoveryEnabled
{
  return MEMORY[0x1F40C9FB0]("DeviceManagementClient", "WellKnownDiscovery");
}

+ (BOOL)isAppleInternal
{
  return MEMORY[0x1F40CD658]("com.apple.DeviceManagementClient", a2);
}

+ (BOOL)hasT2
{
  return 1;
}

@end