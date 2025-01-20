@interface DPBitValueMap
@end

@implementation DPBitValueMap

uint64_t __28___DPBitValueMap_initialize__block_invoke()
{
  _allBitValueMaps = [MEMORY[0x1E4F1CC08] mutableCopy];
  return MEMORY[0x1F41817F8]();
}

void __59___DPBitValueMap_bitValueMapForKey_fromConfigurationsFile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 objectForKeyedSubscript:@"Value"];
  v4 = [v3 objectForKeyedSubscript:@"Index"];

  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v5];
}

@end