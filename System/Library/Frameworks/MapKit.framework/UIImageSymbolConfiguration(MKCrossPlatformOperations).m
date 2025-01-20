@interface UIImageSymbolConfiguration(MKCrossPlatformOperations)
+ (uint64_t)_mapkit_configurationWithPointSize:()MKCrossPlatformOperations weight:;
+ (uint64_t)_mapkit_configurationWithPointSize:()MKCrossPlatformOperations weight:scale:;
@end

@implementation UIImageSymbolConfiguration(MKCrossPlatformOperations)

+ (uint64_t)_mapkit_configurationWithPointSize:()MKCrossPlatformOperations weight:
{
  return objc_msgSend(MEMORY[0x1E4F42A98], "configurationWithPointSize:weight:", (uint64_t)a2);
}

+ (uint64_t)_mapkit_configurationWithPointSize:()MKCrossPlatformOperations weight:scale:
{
  return objc_msgSend(MEMORY[0x1E4F42A98], "configurationWithPointSize:weight:scale:", (uint64_t)a2, a5);
}

@end