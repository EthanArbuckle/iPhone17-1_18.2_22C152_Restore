@interface HMDApplicationRegistryApplicationWithBundleIdentifier
@end

@implementation HMDApplicationRegistryApplicationWithBundleIdentifier

uint64_t ____HMDApplicationRegistryApplicationWithBundleIdentifier_block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

@end