@interface AAUIDefaultFetchDescriptors
@end

@implementation AAUIDefaultFetchDescriptors

void ___AAUIDefaultFetchDescriptors_block_invoke()
{
  v7[6] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFEBA0] descriptorForRequiredKeys];
  uint64_t v1 = *MEMORY[0x263EFDFF8];
  v7[0] = v0;
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x263EFE030];
  v7[2] = *MEMORY[0x263EFDF60];
  v7[3] = v2;
  v3 = [MEMORY[0x263EFEC50] descriptorForRequiredKeys];
  v7[4] = v3;
  v4 = [MEMORY[0x263EFEBA0] descriptorForRequiredKeys];
  v7[5] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:6];
  v6 = (void *)_AAUIDefaultFetchDescriptors_fetchDescriptors;
  _AAUIDefaultFetchDescriptors_fetchDescriptors = v5;
}

@end