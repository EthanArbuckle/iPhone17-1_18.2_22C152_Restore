@interface HMSettings(HFAdditions)
+ (id)hf_LoadSettingsAllowlist:()HFAdditions;
+ (void)hf_resetAllowlists;
- (id)hf_accessorySettingAtKeyPath:()HFAdditions;
- (id)hf_accessorySettingGroupAtKeyPath:()HFAdditions;
- (id)hf_accessorySettingItemAtKeyPath:()HFAdditions;
- (uint64_t)hf_codex;
@end

@implementation HMSettings(HFAdditions)

+ (void)hf_resetAllowlists
{
  v0 = (void *)_MergedGlobals_310;
  if (_MergedGlobals_310)
  {
    _MergedGlobals_310 = 0;
  }
  v1 = (void *)qword_26AB2FCE0;
  if (qword_26AB2FCE0)
  {
    qword_26AB2FCE0 = 0;
  }
}

+ (id)hf_LoadSettingsAllowlist:()HFAdditions
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a3 != 1)
    {
      v6 = 0;
      goto LABEL_8;
    }
    v6 = @"SettingsAllowlist-User";
    v7 = &qword_26AB2FCE0;
  }
  else
  {
    v6 = @"SettingsAllowlist-HomePod";
    v7 = &_MergedGlobals_310;
  }
  id v8 = (id)*v7;
  if (v8) {
    goto LABEL_23;
  }
LABEL_8:
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 URLForResource:v6 withExtension:@"plist"];

  id v17 = 0;
  id v8 = +[HFAccessorySettingsEntity settingsAtURL:v10 error:&v17];
  id v11 = v17;
  if (v11 || !v8)
  {
    v12 = HFLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v6;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "Error building Settings Allowlist: %@ %@", buf, 0x16u);
    }
  }
  v13 = HFLogForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v19 = v6;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_debug_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEBUG, "retrieved settings allowlist %@ %@ with error %@", buf, 0x20u);
  }

  if (v8)
  {
    if (a3) {
      goto LABEL_17;
    }
LABEL_20:
    v14 = &_MergedGlobals_310;
    goto LABEL_21;
  }
  v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"HMAccessorySettings+HFAdditions.m", 81, @"Invalid parameter not satisfying: %@", @"currentAllowlist" object file lineNumber description];

  if (!a3) {
    goto LABEL_20;
  }
LABEL_17:
  if (a3 == 1)
  {
    v14 = &qword_26AB2FCE0;
LABEL_21:
    objc_storeStrong((id *)v14, v8);
  }

LABEL_23:
  return v8;
}

- (uint64_t)hf_codex
{
  v0 = objc_opt_class();
  uint64_t v1 = [v0 isEqual:objc_opt_class()];
  v2 = objc_opt_class();
  return objc_msgSend(v2, "hf_LoadSettingsAllowlist:", v1);
}

- (id)hf_accessorySettingGroupAtKeyPath:()HFAdditions
{
  id v4 = a3;
  objc_opt_class();
  v5 = objc_msgSend(a1, "hf_accessorySettingItemAtKeyPath:", v4);

  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)hf_accessorySettingAtKeyPath:()HFAdditions
{
  id v4 = a3;
  objc_opt_class();
  v5 = objc_msgSend(a1, "hf_accessorySettingItemAtKeyPath:", v4);

  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)hf_accessorySettingItemAtKeyPath:()HFAdditions
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"HMAccessorySettings+HFAdditions.m", 130, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];
  }
  v6 = [a1 rootGroup];
  id v7 = [v6 keyPath];
  int v8 = [v7 isEqualToString:v5];

  if (v8)
  {
    id v9 = a1;
  }
  else
  {
    id v28 = v5;
    v10 = [v5 componentsSeparatedByString:@"."];
    id v11 = [a1 rootGroup];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v15 = 0;
      uint64_t v16 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v12);
          }
          if (!v11)
          {
            id v9 = 0;
LABEL_19:

            goto LABEL_22;
          }
          v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([v18 isEqualToString:@"root"])
          {
            v19 = @"root";

            v15 = v19;
          }
          else
          {
            __int16 v20 = [(__CFString *)v15 stringByAppendingFormat:@".%@", v18];

            id v21 = (void *)MEMORY[0x21053EE50]();
            __int16 v22 = [v11 settings];
            v31[0] = MEMORY[0x263EF8330];
            v31[1] = 3221225472;
            v31[2] = __60__HMSettings_HFAdditions__hf_accessorySettingItemAtKeyPath___block_invoke;
            v31[3] = &unk_26408F918;
            v15 = v20;
            v32 = v15;
            objc_msgSend(v22, "na_firstObjectPassingTest:", v31);
            id v9 = (id)objc_claimAutoreleasedReturnValue();

            if (v9) {
              goto LABEL_19;
            }
            id v23 = (void *)MEMORY[0x21053EE50]();
            uint64_t v24 = [v11 groups];
            v29[0] = MEMORY[0x263EF8330];
            v29[1] = 3221225472;
            v29[2] = __60__HMSettings_HFAdditions__hf_accessorySettingItemAtKeyPath___block_invoke_2;
            v29[3] = &unk_26409AAB8;
            v15 = v15;
            v30 = v15;
            uint64_t v25 = objc_msgSend(v24, "na_firstObjectPassingTest:", v29);

            id v11 = (id)v25;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    else
    {
      v15 = 0;
    }

    id v11 = v11;
    id v9 = v11;
LABEL_22:
    id v5 = v28;
  }
  return v9;
}

@end