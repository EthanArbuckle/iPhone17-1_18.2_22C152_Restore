@interface HMAccessoryNetworkProtectionGroup
@end

@implementation HMAccessoryNetworkProtectionGroup

uint64_t __81__HMAccessoryNetworkProtectionGroup_HFAdditions__hf_networkConfigurationProfiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_networkConfigurationProfiles");
}

uint64_t __81__HMAccessoryNetworkProtectionGroup_HFAdditions__hf_displayCurrentProtectionMode__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 currentProtectionMode];
  return [v2 numberWithInteger:v3];
}

void __74__HMAccessoryNetworkProtectionGroup_HFAdditions__hf_updateProtectionMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v6 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138412546;
    id v9 = WeakRetained;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Updating network protection group %@ to protectionMode %li", (uint8_t *)&v8, 0x16u);
  }

  [WeakRetained updateProtectionMode:*(void *)(a1 + 40) completion:v4];
}

uint64_t __84__HMAccessoryNetworkProtectionGroup_HFAdditions__hf_updateProtectionMode_forGroups___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_updateProtectionMode:", *(void *)(a1 + 32));
}

@end