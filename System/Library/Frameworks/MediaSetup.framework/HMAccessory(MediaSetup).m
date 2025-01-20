@interface HMAccessory(MediaSetup)
- (BOOL)isEndpoint;
- (uint64_t)isHomePod;
- (uint64_t)isPartOfHome:()MediaSetup;
@end

@implementation HMAccessory(MediaSetup)

- (uint64_t)isHomePod
{
  v1 = [a1 category];
  v2 = [v1 categoryType];

  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0B0A0]];
  return v3;
}

- (uint64_t)isPartOfHome:()MediaSetup
{
  id v4 = a3;
  v5 = [a1 home];
  v6 = [v5 uniqueIdentifier];
  v7 = [v4 uniqueIdentifier];

  uint64_t v8 = [v6 isEqual:v7];
  return v8;
}

- (BOOL)isEndpoint
{
  v1 = [a1 siriEndpointProfile];
  BOOL v2 = v1 != 0;

  return v2;
}

@end