@interface NSBundle
@end

@implementation NSBundle

void __58__NSBundle_SafariServicesExtras___sf_safariServicesBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.SafariServices"];
  v1 = (void *)_sf_safariServicesBundle_bundle;
  _sf_safariServicesBundle_bundle = v0;
}

@end