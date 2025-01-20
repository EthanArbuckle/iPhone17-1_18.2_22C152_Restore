@interface HMDApplicationRegistryApplicationForBundleURL
@end

@implementation HMDApplicationRegistryApplicationForBundleURL

uint64_t ____HMDApplicationRegistryApplicationForBundleURL_block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 bundleURL];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

@end