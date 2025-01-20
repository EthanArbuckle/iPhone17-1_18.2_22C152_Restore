@interface HMAccessorySettingsController(HFAdditions)
- (id)hf_updateAccessorySettingWithHomeIdentifier:()HFAdditions accessoryIdentifier:keyPath:settingValue:;
@end

@implementation HMAccessorySettingsController(HFAdditions)

- (id)hf_updateAccessorySettingWithHomeIdentifier:()HFAdditions accessoryIdentifier:keyPath:settingValue:
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x263F58190]);
  v15 = +[HFHomeKitDispatcher sharedDispatcher];
  v16 = [v15 homeManager];
  v17 = objc_msgSend(v16, "hf_homeWithIdentifier:", v10);

  v18 = objc_msgSend(v17, "hf_accessoryWithIdentifier:", v11);
  objc_msgSend(v18, "hf_onboardSiriEndpointIfNeededWithSettingKeyPath:settingValue:", v12, v13);
  v19 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v33 = v12;
    __int16 v34 = 2112;
    id v35 = v11;
    __int16 v36 = 2112;
    id v37 = v13;
    _os_log_debug_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEBUG, "Kicking off update for setting [%@] for accessoryID: [%@] with value [%@]", buf, 0x20u);
  }

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __131__HMAccessorySettingsController_HFAdditions__hf_updateAccessorySettingWithHomeIdentifier_accessoryIdentifier_keyPath_settingValue___block_invoke;
  v27[3] = &unk_2640922B0;
  id v28 = v12;
  id v29 = v11;
  id v30 = v13;
  id v20 = v14;
  id v31 = v20;
  id v21 = v13;
  id v22 = v11;
  id v23 = v12;
  [a1 updateAccessorySettingWithHomeIdentifier:v10 accessoryIdentifier:v22 keyPath:v23 settingValue:v21 completionHandler:v27];
  v24 = v31;
  id v25 = v20;

  return v25;
}

@end