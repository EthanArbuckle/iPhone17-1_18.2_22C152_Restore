@interface DEDCapability
+ (id)allCapabilities;
+ (id)decodeCapabilitiesString:(id)a3;
+ (id)defaultCapabilities;
+ (id)encodeCapabilitySet:(id)a3;
@end

@implementation DEDCapability

+ (id)encodeCapabilitySet:(id)a3
{
  v3 = [a3 allObjects];
  v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

+ (id)decodeCapabilitiesString:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9C0];
  v4 = [a3 componentsSeparatedByString:@","];
  v5 = [v3 setWithArray:v4];

  [v5 addObject:@"classic"];
  return v5;
}

+ (id)allCapabilities
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"classic", @"enhanced-execution", @"cloudkit", @"mutable-bug-session", @"session-state", @"enhanced-execution-v2", 0);
}

+ (id)defaultCapabilities
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"classic"];
}

@end