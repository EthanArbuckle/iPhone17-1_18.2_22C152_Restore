@interface HFItem(AXPriv)
- (id)_axLatestResultForKey:()AXPriv;
- (uint64_t)_axBadgeType;
- (uint64_t)_axStatusItemCategory;
@end

@implementation HFItem(AXPriv)

- (id)_axLatestResultForKey:()AXPriv
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  if ([a1 resultsContainRequiredProperties:v5])
  {
    v6 = [a1 latestResults];
    v7 = [v6 objectForKeyedSubscript:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)_axBadgeType
{
  v1 = [a1 _axLatestResultForKey:*MEMORY[0x263F47A08]];
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)_axStatusItemCategory
{
  v1 = [a1 _axLatestResultForKey:*MEMORY[0x263F47A28]];
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 4;
  }

  return v3;
}

@end