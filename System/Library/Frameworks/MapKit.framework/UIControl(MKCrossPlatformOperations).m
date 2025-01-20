@interface UIControl(MKCrossPlatformOperations)
- (uint64_t)_mapkit_setTarget:()MKCrossPlatformOperations action:;
@end

@implementation UIControl(MKCrossPlatformOperations)

- (uint64_t)_mapkit_setTarget:()MKCrossPlatformOperations action:
{
  return [a1 addTarget:a3 action:a4 forControlEvents:0x2000];
}

@end