@interface NSBundle(AppleMediaServices)
- (id)icon;
- (uint64_t)ams_imageForResource:()AppleMediaServices;
@end

@implementation NSBundle(AppleMediaServices)

- (id)icon
{
  v2 = [a1 infoDictionary];
  v3 = [v2 objectForKeyedSubscript:@"CFBundleIconName"];

  if (!v3)
  {
    v4 = [a1 infoDictionary];
    v3 = [v4 objectForKeyedSubscript:*MEMORY[0x263EFFA98]];
  }
  v5 = [MEMORY[0x263F827E8] imageNamed:v3 inBundle:a1 compatibleWithTraitCollection:0];

  return v5;
}

- (uint64_t)ams_imageForResource:()AppleMediaServices
{
  return [MEMORY[0x263F827E8] imageNamed:a3 inBundle:a1 compatibleWithTraitCollection:0];
}

@end