@interface CSHostPowerSourceMonitor
+ (id)sharedInstance;
- (CSHostPowerSourceMonitor)init;
- (int64_t)currentPowerSource;
@end

@implementation CSHostPowerSourceMonitor

- (int64_t)currentPowerSource
{
  return 0;
}

- (CSHostPowerSourceMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSHostPowerSourceMonitor;

  return 0;
}

+ (id)sharedInstance
{
  return 0;
}

@end