@interface NSError(HSAdditions)
+ (uint64_t)hs_cloudErrorWithCode:()HSAdditions userInfo:;
+ (uint64_t)hs_cloudLibraryUploadErrorWithCode:()HSAdditions userInfo:;
+ (uint64_t)hs_homeSharingErrorWithCode:()HSAdditions userInfo:;
@end

@implementation NSError(HSAdditions)

+ (uint64_t)hs_cloudLibraryUploadErrorWithCode:()HSAdditions userInfo:
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"HSCloudLibraryUploadErrorDomain" code:a3 userInfo:a4];
}

+ (uint64_t)hs_cloudErrorWithCode:()HSAdditions userInfo:
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"HSCloudErrorDomain" code:a3 userInfo:a4];
}

+ (uint64_t)hs_homeSharingErrorWithCode:()HSAdditions userInfo:
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"HSHomeSharingErrorDomain" code:a3 userInfo:a4];
}

@end