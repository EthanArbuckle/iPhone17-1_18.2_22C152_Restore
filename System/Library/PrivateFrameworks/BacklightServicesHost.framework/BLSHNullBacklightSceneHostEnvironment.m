@interface BLSHNullBacklightSceneHostEnvironment
- (BLSHNullBacklightSceneHostEnvironment)init;
@end

@implementation BLSHNullBacklightSceneHostEnvironment

- (BLSHNullBacklightSceneHostEnvironment)init
{
  v3 = NSString;
  v4 = [MEMORY[0x263F08C38] UUID];
  v5 = [v4 UUIDString];
  v6 = [v3 stringWithFormat:@"NullEnvironment:%@", v5];
  v9.receiver = self;
  v9.super_class = (Class)BLSHNullBacklightSceneHostEnvironment;
  v7 = [(BLSHBaseSceneHostEnvironment *)&v9 initWithIdentifier:v6];

  return v7;
}

@end