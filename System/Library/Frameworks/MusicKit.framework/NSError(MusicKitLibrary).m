@interface NSError(MusicKitLibrary)
+ (uint64_t)musicKit_defaultLibraryError;
@end

@implementation NSError(MusicKitLibrary)

+ (uint64_t)musicKit_defaultLibraryError
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"MusicKitLibraryErrorDomain" code:1 userInfo:0];
}

@end