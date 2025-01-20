@interface UIDevice(DKExtensions)
- (uint64_t)dk_deviceSupportsGL;
@end

@implementation UIDevice(DKExtensions)

- (uint64_t)dk_deviceSupportsGL
{
  if (dk_deviceSupportsGL_onceToken != -1) {
    dispatch_once(&dk_deviceSupportsGL_onceToken, &__block_literal_global);
  }
  return dk_deviceSupportsGL_useGL;
}

@end