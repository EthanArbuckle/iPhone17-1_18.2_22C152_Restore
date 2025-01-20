@interface NSBundle(AppleMediaServices)
+ (uint64_t)ams_AppleMediaServicesBundle;
+ (uint64_t)ams_MusicBundle;
@end

@implementation NSBundle(AppleMediaServices)

+ (uint64_t)ams_AppleMediaServicesBundle
{
  return [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/AppleMediaServices.framework"];
}

+ (uint64_t)ams_MusicBundle
{
  return [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Applications/Music.app"];
}

@end