@interface NSString(FBKFile)
- (uint64_t)isImageFile;
- (uint64_t)isVideoFile;
@end

@implementation NSString(FBKFile)

- (uint64_t)isImageFile
{
  v2 = [a1 pathExtension];
  if (v2)
  {
    if (commonImageFormats_onceToken != -1) {
      dispatch_once(&commonImageFormats_onceToken, &__block_literal_global_0);
    }
    id v3 = (id)commonImageFormats__commonExtensions;
    v4 = [a1 pathExtension];
    v5 = [v4 lowercaseString];
    uint64_t v6 = [v3 containsObject:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)isVideoFile
{
  v2 = [a1 pathExtension];
  if (v2)
  {
    id v3 = [a1 pathExtension];
    v4 = [v3 lowercaseString];
    uint64_t v5 = [v4 isEqualToString:@"mov"];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

@end