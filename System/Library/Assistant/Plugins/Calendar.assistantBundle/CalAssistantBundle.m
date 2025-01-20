@interface CalAssistantBundle
+ (id)bundle;
@end

@implementation CalAssistantBundle

+ (id)bundle
{
  uint64_t v2 = MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();

  return (id)MEMORY[0x270F9A6D0](v2, sel_bundleForClass_, v3, v4);
}

@end