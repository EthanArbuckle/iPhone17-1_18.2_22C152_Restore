@interface ARObjectTrackingRemoteControl
+ (id)serviceName;
@end

@implementation ARObjectTrackingRemoteControl

+ (id)serviceName
{
  return @"com.apple.arkit.service.objectTrackingControl";
}

@end