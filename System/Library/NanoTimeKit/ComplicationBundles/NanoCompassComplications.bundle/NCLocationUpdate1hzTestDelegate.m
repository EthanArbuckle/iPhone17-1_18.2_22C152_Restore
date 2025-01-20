@interface NCLocationUpdate1hzTestDelegate
- (NCLocationUpdate1hzTestDelegate)init;
- (double)expectedAccuracy;
@end

@implementation NCLocationUpdate1hzTestDelegate

- (NCLocationUpdate1hzTestDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)NCLocationUpdate1hzTestDelegate;
  return [(NCLocationUpdateAppDelegate *)&v3 init];
}

- (double)expectedAccuracy
{
  return *MEMORY[0x263F00B10];
}

@end