@interface ECEmailCoreFramework
+ (NSBundle)bundle;
@end

@implementation ECEmailCoreFramework

+ (NSBundle)bundle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__ECEmailCoreFramework_bundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (bundle_onceToken != -1) {
    dispatch_once(&bundle_onceToken, block);
  }
  v2 = (void *)bundle_emailCoreFrameworkBundle;
  return (NSBundle *)v2;
}

uint64_t __30__ECEmailCoreFramework_bundle__block_invoke(uint64_t a1)
{
  bundle_emailCoreFrameworkBundle = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

@end