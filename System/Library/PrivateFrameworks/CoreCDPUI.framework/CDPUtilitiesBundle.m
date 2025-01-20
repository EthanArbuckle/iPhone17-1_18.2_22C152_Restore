@interface CDPUtilitiesBundle
+ (id)bundle;
@end

@implementation CDPUtilitiesBundle

+ (id)bundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 bundleForClass:v3];
}

@end