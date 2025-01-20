@interface HMAccessorySettingsController
@end

@implementation HMAccessorySettingsController

void __131__HMAccessorySettingsController_HFAdditions__hf_updateAccessorySettingWithHomeIdentifier_accessoryIdentifier_keyPath_settingValue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = HFLogForCategory(0x26uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v12 = 138413058;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Error updating setting [%@] for accessoryID: [%@] with value [%@] with error: [%@]", (uint8_t *)&v12, 0x2Au);
    }

    [*(id *)(a1 + 56) finishWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 56) finishWithNoResult];
  }
  v8 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    int v12 = 138412802;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_debug_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEBUG, "Finished update for setting [%@] for accessoryID: [%@] with value [%@]", (uint8_t *)&v12, 0x20u);
  }
}

@end