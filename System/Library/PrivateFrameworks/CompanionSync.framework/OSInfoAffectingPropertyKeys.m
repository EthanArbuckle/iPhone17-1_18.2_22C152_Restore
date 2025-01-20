@interface OSInfoAffectingPropertyKeys
@end

@implementation OSInfoAffectingPropertyKeys

void ___OSInfoAffectingPropertyKeys_block_invoke()
{
  v5[3] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F57668];
  v5[0] = *MEMORY[0x263F57560];
  v5[1] = v1;
  v5[2] = *MEMORY[0x263F57658];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  uint64_t v3 = [v0 setWithArray:v2];
  v4 = (void *)_OSInfoAffectingPropertyKeys___set;
  _OSInfoAffectingPropertyKeys___set = v3;
}

@end