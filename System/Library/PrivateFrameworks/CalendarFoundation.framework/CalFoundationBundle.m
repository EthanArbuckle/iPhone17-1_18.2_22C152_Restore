@interface CalFoundationBundle
+ (id)bundle;
@end

@implementation CalFoundationBundle

+ (id)bundle
{
  v2 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 bundleForClass:v3];
}

@end