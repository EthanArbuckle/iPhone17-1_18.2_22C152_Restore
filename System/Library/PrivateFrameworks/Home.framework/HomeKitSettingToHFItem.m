@interface HomeKitSettingToHFItem
@end

@implementation HomeKitSettingToHFItem

void __48___HomeKitSettingToHFItem_CacheItem_na_identity__block_invoke_2()
{
  id v3 = [MEMORY[0x263F58198] builder];
  v0 = [v3 appendCharacteristic:&__block_literal_global_59_1];
  uint64_t v1 = [v0 build];
  v2 = (void *)qword_26AB2EA08;
  qword_26AB2EA08 = v1;
}

uint64_t __48___HomeKitSettingToHFItem_CacheItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 keyPath];
}

@end