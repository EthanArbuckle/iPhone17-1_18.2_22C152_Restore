@interface SFMDeviceSearchRouter
+ (id)commandName;
+ (id)handlerClassName;
+ (id)legacyHandlerClassName;
@end

@implementation SFMDeviceSearchRouter

+ (id)commandName
{
  return @"DeviceSearch";
}

+ (id)legacyHandlerClassName
{
  return @"FMIPSADeviceSearch";
}

+ (id)handlerClassName
{
  return 0;
}

@end