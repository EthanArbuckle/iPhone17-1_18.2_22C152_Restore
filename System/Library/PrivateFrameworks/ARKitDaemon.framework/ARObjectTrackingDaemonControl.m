@interface ARObjectTrackingDaemonControl
+ (id)serviceName;
@end

@implementation ARObjectTrackingDaemonControl

+ (id)serviceName
{
  return (id)*MEMORY[0x263F20E30];
}

@end