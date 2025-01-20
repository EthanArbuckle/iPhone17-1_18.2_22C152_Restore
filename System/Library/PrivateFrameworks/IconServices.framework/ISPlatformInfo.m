@interface ISPlatformInfo
+ (id)sharedInstance;
- (BOOL)supportsRequestingLayerStacksForPlatform:(unint64_t)a3;
- (BOOL)supportsRequestingMultisizedImagesForPlatform:(unint64_t)a3;
@end

@implementation ISPlatformInfo

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_29);
  }
  v2 = (void *)sharedInstance_sharedInstance_5;
  return v2;
}

uint64_t __32__ISPlatformInfo_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_5 = objc_alloc_init(ISPlatformInfo);
  return MEMORY[0x1F41817F8]();
}

- (BOOL)supportsRequestingLayerStacksForPlatform:(unint64_t)a3
{
  BOOL v5 = [(IFPlatformInfo *)self nativePlatform] == 32
    || [(IFPlatformInfo *)self nativePlatform] == 16;
  BOOL result = 1;
  if (a3 != 32 && a3 != 16 && (a3 || !v5)) {
    return 0;
  }
  return result;
}

- (BOOL)supportsRequestingMultisizedImagesForPlatform:(unint64_t)a3
{
  BOOL v5 = [(IFPlatformInfo *)self nativePlatform] == 1
    || [(IFPlatformInfo *)self nativePlatform] == 2
    || [(IFPlatformInfo *)self nativePlatform] == 4
    || [(IFPlatformInfo *)self nativePlatform] == 8
    || [(IFPlatformInfo *)self nativePlatform] == 16;
  return a3 <= 0x10 && (((1 << a3) & 0x10116) != 0 || !a3 && v5);
}

@end