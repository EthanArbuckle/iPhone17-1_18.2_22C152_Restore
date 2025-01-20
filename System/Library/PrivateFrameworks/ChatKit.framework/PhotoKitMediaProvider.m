@interface PhotoKitMediaProvider
@end

@implementation PhotoKitMediaProvider

void ___PhotoKitMediaProvider_block_invoke()
{
  id v2 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
  uint64_t v0 = [MEMORY[0x1E4F904E0] mediaProviderWithLibrary:v2];
  v1 = (void *)_PhotoKitMediaProvider__photoKitMediaProvider;
  _PhotoKitMediaProvider__photoKitMediaProvider = v0;
}

@end