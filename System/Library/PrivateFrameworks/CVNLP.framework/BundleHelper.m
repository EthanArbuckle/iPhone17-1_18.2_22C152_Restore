@interface BundleHelper
- (id)createBundle;
@end

@implementation BundleHelper

- (id)createBundle
{
  uint64_t v2 = MEMORY[0x1E4F28B50];
  uint64_t v3 = objc_opt_class();
  return (id)MEMORY[0x1F4181798](v2, sel_bundleForClass_, v3, v4);
}

@end