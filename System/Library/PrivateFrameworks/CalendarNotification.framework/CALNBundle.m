@interface CALNBundle
+ (id)bundle;
@end

@implementation CALNBundle

+ (id)bundle
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __20__CALNBundle_bundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (bundle_onceToken != -1) {
    dispatch_once(&bundle_onceToken, block);
  }
  v2 = (void *)bundle_bundle;
  return v2;
}

uint64_t __20__CALNBundle_bundle__block_invoke(uint64_t a1)
{
  bundle_bundle = [MEMORY[0x263F086E0] bundleForClass:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

@end