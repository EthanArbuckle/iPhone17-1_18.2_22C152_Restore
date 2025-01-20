@interface SFMDeviceSyncRouter
+ (id)commandName;
+ (id)handlerClassName;
+ (id)legacyHandlerClassName;
@end

@implementation SFMDeviceSyncRouter

+ (id)commandName
{
  return @"DeviceSync";
}

+ (id)legacyHandlerClassName
{
  return @"FMIPSiriDeviceSync";
}

+ (id)handlerClassName
{
  return @"SFMDeviceSyncHandler";
}

@end