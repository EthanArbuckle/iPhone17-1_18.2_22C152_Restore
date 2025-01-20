@interface HUAccessorySettingsUtilities
+ (BOOL)_shouldCollapseModuleForGroupKeyPath:(id)a3;
+ (BOOL)_shouldSkipModuleCreationForGroupKeyPath:(id)a3 accessory:(id)a4 home:(id)a5;
+ (id)generateModulesFromSettingsDictionary:(id)a3 itemUpdater:(id)a4 home:(id)a5 sourceItem:(id)a6 usageOptions:(id)a7 settingsController:(id)a8;
@end

@implementation HUAccessorySettingsUtilities

+ (id)generateModulesFromSettingsDictionary:(id)a3 itemUpdater:(id)a4 home:(id)a5 sourceItem:(id)a6 usageOptions:(id)a7 settingsController:(id)a8
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v41 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a8;
  id v40 = (id)objc_opt_new();
  v15 = objc_msgSend(MEMORY[0x1E4F68E90], "hf_accessorySettingsDictionary");
  v16 = [v13 accessories];
  uint64_t v17 = [v16 anyObject];

  v18 = (void *)v17;
  if (v15)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v37 = v15;
    id obj = v15;
    uint64_t v19 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v44;
      uint64_t v38 = *(void *)v44;
      id v39 = a1;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v44 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          if (([a1 _shouldSkipModuleCreationForGroupKeyPath:v23 accessory:v18 home:v12] & 1) == 0)
          {
            v24 = v18;
            if ([a1 _shouldCollapseModuleForGroupKeyPath:v23])
            {
              BOOL v25 = 1;
              v26 = obj;
            }
            else
            {
              v26 = obj;
              v27 = [obj objectForKeyedSubscript:v23];
              v28 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F683A0]];
              BOOL v25 = v28 != 0;
            }
            v29 = [[HUHomeKitAccessorySettingsItemModule alloc] initWithSettingsController:v14 itemUpdater:v41 home:v12 sourceItem:v13 settingGroupKeyPath:v23 isCollapsed:v25];
            [v26 objectForKeyedSubscript:v23];
            id v30 = v14;
            v32 = id v31 = v13;
            v33 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F68020]];

            if (v33)
            {
              v34 = (void *)[objc_alloc(NSClassFromString(v33)) initWithSettingsController:v30 sourceItem:v31 home:v12];
              [(HUHomeKitAccessorySettingsItemModule *)v29 setAccessorySettingsManager:v34];
            }
            v35 = HFLogForCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v48 = v29;
              __int16 v49 = 2112;
              uint64_t v50 = v23;
              _os_log_impl(&dword_1BE345000, v35, OS_LOG_TYPE_DEFAULT, "Created settingsModule [%@] for groupKeyPath [%@]", buf, 0x16u);
            }

            objc_msgSend(v40, "na_safeAddObject:", v29);
            id v13 = v31;
            id v14 = v30;
            uint64_t v21 = v38;
            a1 = v39;
            v18 = v24;
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v20);
    }

    v15 = v37;
  }

  return v40;
}

+ (BOOL)_shouldSkipModuleCreationForGroupKeyPath:(id)a3 accessory:(id)a4 home:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v11 = objc_msgSend(v8, "hf_categoryOrPrimaryServiceType");
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F2C218]];

  if (v12)
  {
    [v10 addObject:*MEMORY[0x1E4F68030]];
  }
  else
  {
    v23[0] = *MEMORY[0x1E4F68748];
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [v10 addObjectsFromArray:v13];
  }
  if ([v8 supportsUserMediaSettings]) {
    [v10 addObject:*MEMORY[0x1E4F68468]];
  }
  id v14 = (uint64_t *)MEMORY[0x1E4F68408];
  if ([v7 isEqualToString:*MEMORY[0x1E4F68408]])
  {
    v15 = objc_msgSend(v9, "hf_allCameraProfilesWithDoorbellService");
    uint64_t v16 = [v15 count];

    if (!v16)
    {
      uint64_t v22 = *v14;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      [v10 addObjectsFromArray:v17];
    }
  }
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    uint64_t v21 = *MEMORY[0x1E4F68308];
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v10 addObjectsFromArray:v18];
  }
  char v19 = [v10 containsObject:v7];

  return v19;
}

+ (BOOL)_shouldCollapseModuleForGroupKeyPath:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F68030]]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4F68CC8]];
  }

  return v4;
}

@end