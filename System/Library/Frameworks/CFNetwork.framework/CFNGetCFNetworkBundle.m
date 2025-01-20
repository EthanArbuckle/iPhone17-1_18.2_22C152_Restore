@interface CFNGetCFNetworkBundle
@end

@implementation CFNGetCFNetworkBundle

CFTypeRef ____CFNGetCFNetworkBundle_block_invoke()
{
  CFBundleRef BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.CFNetwork");
  if (!BundleWithIdentifier) {
    CFBundleRef BundleWithIdentifier = CFBundleGetMainBundle();
  }
  __CFNGetCFNetworkBundle::bundle = (uint64_t)BundleWithIdentifier;

  return CFRetain(BundleWithIdentifier);
}

@end