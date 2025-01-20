@interface STScreenTimeBundle
+ (NSBundle)bundle;
@end

@implementation STScreenTimeBundle

+ (NSBundle)bundle
{
  return (NSBundle *)[MEMORY[0x263F086E0] bundleForClass:a1];
}

@end