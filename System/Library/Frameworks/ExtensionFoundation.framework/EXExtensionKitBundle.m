@interface EXExtensionKitBundle
@end

@implementation EXExtensionKitBundle

void ___EXExtensionKitBundle_block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28B50];
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 bundleForClass:v3];
  v2 = (void *)_EXExtensionKitBundle_bundle;
  _EXExtensionKitBundle_bundle = v1;
}

@end