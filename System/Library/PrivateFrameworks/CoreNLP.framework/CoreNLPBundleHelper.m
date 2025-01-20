@interface CoreNLPBundleHelper
- (id)createBundle;
@end

@implementation CoreNLPBundleHelper

- (id)createBundle
{
  v2 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 bundleForClass:v3];
}

@end