@interface HMCharacteristicMetadata
@end

@implementation HMCharacteristicMetadata

void __53__HMCharacteristicMetadata_HFAdditions__hf_isInteger__block_invoke_2()
{
  v6[5] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0BE70];
  v6[0] = *MEMORY[0x263F0BE48];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0BE60];
  v6[2] = *MEMORY[0x263F0BE58];
  v6[3] = v2;
  v6[4] = *MEMORY[0x263F0BE68];
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  uint64_t v4 = [v0 setWithArray:v3];
  v5 = (void *)qword_26AB2F1B8;
  qword_26AB2F1B8 = v4;
}

@end