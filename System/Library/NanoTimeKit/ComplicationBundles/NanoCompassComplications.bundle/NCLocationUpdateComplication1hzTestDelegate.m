@interface NCLocationUpdateComplication1hzTestDelegate
- (NCLocationUpdateComplication1hzTestDelegate)init;
- (double)expectedAccuracy;
@end

@implementation NCLocationUpdateComplication1hzTestDelegate

- (NCLocationUpdateComplication1hzTestDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)NCLocationUpdateComplication1hzTestDelegate;
  return [(NCLocationUpdateBaseDelegate *)&v3 init];
}

- (double)expectedAccuracy
{
  return *MEMORY[0x263F00B10];
}

@end