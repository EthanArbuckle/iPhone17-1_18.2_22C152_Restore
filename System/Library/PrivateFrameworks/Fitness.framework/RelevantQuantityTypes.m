@interface RelevantQuantityTypes
@end

@implementation RelevantQuantityTypes

void ___RelevantQuantityTypes_block_invoke()
{
  v16[12] = *MEMORY[0x263EF8340];
  v12 = (void *)MEMORY[0x263EFFA08];
  v15 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DE0]];
  v16[0] = v15;
  v14 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DB0]];
  v16[1] = v14;
  v13 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DD8]];
  v16[2] = v13;
  v0 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09BC0]];
  v16[3] = v0;
  v1 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09C08]];
  v16[4] = v1;
  v2 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09F18]];
  v16[5] = v2;
  v3 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09F58]];
  v16[6] = v3;
  v4 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DA8]];
  v16[7] = v4;
  v5 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DB8]];
  v16[8] = v5;
  v6 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DC0]];
  v16[9] = v6;
  v7 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DC8]];
  v16[10] = v7;
  v8 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09DD0]];
  v16[11] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:12];
  uint64_t v10 = [v12 setWithArray:v9];
  v11 = (void *)_RelevantQuantityTypes___relevantQuantityTypes;
  _RelevantQuantityTypes___relevantQuantityTypes = v10;
}

@end