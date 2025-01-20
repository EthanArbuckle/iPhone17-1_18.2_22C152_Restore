@interface SFMDevicePlaySoundRouter
+ (id)commandName;
+ (id)handlerClassName;
+ (id)legacyHandlerClassName;
@end

@implementation SFMDevicePlaySoundRouter

+ (id)commandName
{
  return @"PlaySound";
}

+ (id)legacyHandlerClassName
{
  return @"FMIPSADevicePlaySound";
}

+ (id)handlerClassName
{
  return @"SFMDevicePlaySoundHandler";
}

@end