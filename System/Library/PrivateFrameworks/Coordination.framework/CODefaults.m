@interface CODefaults
+ (id)coordinationBundleID;
+ (id)userDefaultsForIdentifer:(id)a3;
@end

@implementation CODefaults

+ (id)coordinationBundleID
{
  return @"com.apple.coordinated";
}

+ (id)userDefaultsForIdentifer:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F086E0], "mainBundle", a3);
  v4 = [v3 bundleIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.coordinated"];

  if (v5)
  {
    v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  }
  else
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.coordinated"];
  }

  return v6;
}

@end