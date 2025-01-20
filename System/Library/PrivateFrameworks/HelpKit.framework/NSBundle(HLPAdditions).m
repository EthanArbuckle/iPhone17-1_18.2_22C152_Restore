@interface NSBundle(HLPAdditions)
+ (id)HLPBundle;
+ (void)removeHLPBundle;
@end

@implementation NSBundle(HLPAdditions)

+ (id)HLPBundle
{
  v0 = (void *)gHLPBundle;
  if (!gHLPBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.helpkit"];
    v2 = (void *)gHLPBundle;
    gHLPBundle = v1;

    v0 = (void *)gHLPBundle;
  }
  return v0;
}

+ (void)removeHLPBundle
{
  v0 = (void *)gHLPBundle;
  gHLPBundle = 0;
}

@end