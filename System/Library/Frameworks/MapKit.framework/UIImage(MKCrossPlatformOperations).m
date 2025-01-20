@interface UIImage(MKCrossPlatformOperations)
+ (uint64_t)_mapkit_systemImageNamed:()MKCrossPlatformOperations;
@end

@implementation UIImage(MKCrossPlatformOperations)

+ (uint64_t)_mapkit_systemImageNamed:()MKCrossPlatformOperations
{
  return objc_msgSend(MEMORY[0x1E4F42A80], "_systemImageNamed:");
}

@end