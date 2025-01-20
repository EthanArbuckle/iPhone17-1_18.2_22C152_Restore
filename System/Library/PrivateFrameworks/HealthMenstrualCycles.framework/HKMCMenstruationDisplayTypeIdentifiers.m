@interface HKMCMenstruationDisplayTypeIdentifiers
@end

@implementation HKMCMenstruationDisplayTypeIdentifiers

void ___HKMCMenstruationDisplayTypeIdentifiers_block_invoke()
{
  v2[2] = *MEMORY[0x263EF8340];
  v2[0] = @"DisplayTypeIdentifierIntermenstrualBleeding";
  v2[1] = @"DisplayTypeIdentifierSymptoms";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:2];
  v1 = (void *)_HKMCMenstruationDisplayTypeIdentifiers_displayTypeIdentifiers;
  _HKMCMenstruationDisplayTypeIdentifiers_displayTypeIdentifiers = v0;
}

@end