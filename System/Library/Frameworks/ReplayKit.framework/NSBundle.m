@interface NSBundle
@end

@implementation NSBundle

void __44__NSBundle_RPExtensions___rpFrameworkBundle__block_invoke()
{
  v0 = (void *)MEMORY[0x263F086E0];
  id v3 = [NSURL fileURLWithPath:@"/System/Library/Frameworks/ReplayKit.framework"];
  uint64_t v1 = [v0 bundleWithURL:v3];
  v2 = (void *)_rpFrameworkBundle_sFrameworkBundle;
  _rpFrameworkBundle_sFrameworkBundle = v1;
}

@end