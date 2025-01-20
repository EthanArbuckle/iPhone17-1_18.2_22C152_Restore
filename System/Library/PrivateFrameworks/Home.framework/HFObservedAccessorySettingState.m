@interface HFObservedAccessorySettingState
@end

@implementation HFObservedAccessorySettingState

uint64_t __61___HFObservedAccessorySettingState_initWithSettings_setting___block_invoke(uint64_t a1, void *a2)
{
  return [a2 title];
}

void __47___HFObservedAccessorySettingState_na_identity__block_invoke_2()
{
  id v5 = [MEMORY[0x263F58198] builder];
  v0 = [v5 appendCharacteristic:&__block_literal_global_27_0];
  v1 = [v0 appendCharacteristic:&__block_literal_global_29];
  v2 = [v1 appendCharacteristic:&__block_literal_global_31_0];
  uint64_t v3 = [v2 build];
  v4 = (void *)qword_26AB2EE28;
  qword_26AB2EE28 = v3;
}

uint64_t __47___HFObservedAccessorySettingState_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 settings];
}

uint64_t __47___HFObservedAccessorySettingState_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setting];
}

uint64_t __47___HFObservedAccessorySettingState_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 selectionOptions];
}

@end