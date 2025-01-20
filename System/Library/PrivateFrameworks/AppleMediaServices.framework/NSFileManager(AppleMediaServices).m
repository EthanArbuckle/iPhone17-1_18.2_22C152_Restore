@interface NSFileManager(AppleMediaServices)
+ (uint64_t)ams_ensureDirectoryExists:()AppleMediaServices;
@end

@implementation NSFileManager(AppleMediaServices)

+ (uint64_t)ams_ensureDirectoryExists:()AppleMediaServices
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    if ([v4 fileExistsAtPath:v3]) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

@end