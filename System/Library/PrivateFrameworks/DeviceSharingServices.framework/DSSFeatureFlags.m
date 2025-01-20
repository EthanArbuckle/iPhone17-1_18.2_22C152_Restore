@interface DSSFeatureFlags
+ (BOOL)isGuestUserHandoverEnabled;
+ (BOOL)isMigrationEnabled;
+ (BOOL)isSelectedAppsEnabled;
+ (BOOL)isV2Enabled;
@end

@implementation DSSFeatureFlags

+ (BOOL)isMigrationEnabled
{
  return MEMORY[0x270ED8070]("DeviceSharing", "GuestUserModeMigration");
}

+ (BOOL)isV2Enabled
{
  return MEMORY[0x270ED8070]("DeviceSharing", "GuestUserModeV2");
}

+ (BOOL)isGuestUserHandoverEnabled
{
  return MEMORY[0x270ED8070]("DeviceSharing", "GuestUserHandover");
}

+ (BOOL)isSelectedAppsEnabled
{
  return MEMORY[0x270ED8070]("DeviceSharing", "GuestUserSelectedApps");
}

@end