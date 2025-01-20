@interface WFAirDropActionUIKitUserInterface
- (id)excludedActivityTypes;
@end

@implementation WFAirDropActionUIKitUserInterface

- (id)excludedActivityTypes
{
  v11[14] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F6BD28];
  v11[0] = *MEMORY[0x263F6BD10];
  v11[1] = v2;
  uint64_t v3 = *MEMORY[0x263F6BD00];
  v11[2] = *MEMORY[0x263F6BD38];
  v11[3] = v3;
  uint64_t v4 = *MEMORY[0x263F6BD40];
  v11[4] = *MEMORY[0x263F6BCF0];
  v11[5] = v4;
  uint64_t v5 = *MEMORY[0x263F6BCE0];
  v11[6] = *MEMORY[0x263F6BCE8];
  v11[7] = v5;
  uint64_t v6 = *MEMORY[0x263F6BCD0];
  v11[8] = *MEMORY[0x263F6BD48];
  v11[9] = v6;
  uint64_t v7 = *MEMORY[0x263F6BD30];
  v11[10] = *MEMORY[0x263F6BD18];
  v11[11] = v7;
  uint64_t v8 = *MEMORY[0x263F23350];
  v11[12] = *MEMORY[0x263F6BD20];
  v11[13] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:14];
  return v9;
}

@end