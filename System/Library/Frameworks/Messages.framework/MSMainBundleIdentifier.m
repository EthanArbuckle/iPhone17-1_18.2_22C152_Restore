@interface MSMainBundleIdentifier
@end

@implementation MSMainBundleIdentifier

void ___MSMainBundleIdentifier_block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v2 bundleIdentifier];
  v1 = (void *)_MSMainBundleIdentifier_bundleIdentifier;
  _MSMainBundleIdentifier_bundleIdentifier = v0;
}

@end