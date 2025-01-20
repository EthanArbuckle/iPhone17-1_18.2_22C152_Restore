@interface BPSFollowUpController
+ (id)_currentDevice;
+ (id)_domainAccessorForDevice:(id)a3;
+ (id)baseDomainIdentifier;
+ (id)skippedSetupPaneClassesForCurrentDevice;
+ (id)skippedSetupPaneClassesForDevice:(id)a3;
+ (void)addFollowUpForIdentifier:(id)a3 withAttributes:(id)a4 withCompletion:(id)a5;
+ (void)markSkippedSetupPaneClass:(Class)a3 forDevice:(id)a4;
+ (void)markSkippedSetupPaneClassForCurrentDevice:(Class)a3;
+ (void)removeFollowUpForIdentifier:(id)a3 withCompletion:(id)a4;
+ (void)removeSkippedPaneClass:(Class)a3 forDevice:(id)a4;
+ (void)removeSkippedPaneClassForCurrentDevice:(Class)a3;
@end

@implementation BPSFollowUpController

+ (id)baseDomainIdentifier
{
  return @"com.apple.Bridge";
}

+ (id)skippedSetupPaneClassesForCurrentDevice
{
  v3 = [a1 _currentDevice];
  v4 = [a1 skippedSetupPaneClassesForDevice:v3];

  return v4;
}

+ (id)skippedSetupPaneClassesForDevice:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [a1 _domainAccessorForDevice:a3];
  v4 = [v3 objectForKey:@"BridgeSkippedSetupPanes"];

  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v4 = (void *)MEMORY[0x263EFFA68];
  }
  v5 = bps_setup_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    v8 = "+[BPSFollowUpController skippedSetupPaneClassesForDevice:]";
    __int16 v9 = 2050;
    uint64_t v10 = [v4 count];
    _os_log_impl(&dword_21C513000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s found %{public}lu panes", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

+ (id)_domainAccessorForDevice:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F57520];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithDomain:@"com.apple.Bridge" pairedDevice:v4];

  return v5;
}

+ (id)_currentDevice
{
  return (id)[(id)*MEMORY[0x263F1D020] activeWatch];
}

+ (void)addFollowUpForIdentifier:(id)a3 withAttributes:(id)a4 withCompletion:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && v9 && [v8 length])
  {
    uint64_t v11 = [a1 baseDomainIdentifier];
    id v12 = objc_alloc_init(MEMORY[0x263F35388]);
    [v12 setUniqueIdentifier:v8];
    [v12 setGroupIdentifier:v11];
    v13 = [v9 localizedTitle];
    [v12 setTitle:v13];

    v14 = [v9 localizedDescription];
    [v12 setInformativeText:v14];

    [v12 setTargetBundleIdentifier:v11];
    id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
    v15 = [v9 followUpActions];

    if (v15)
    {
      id v37 = v12;
      id v38 = v10;
      id v39 = v8;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v16 = [v9 followUpActions];
      v17 = [v16 allKeys];

      uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v45 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            v23 = (void *)MEMORY[0x263F35378];
            v24 = [v9 followUpActions];
            [v24 objectForKeyedSubscript:v22];
            v26 = id v25 = v9;
            v27 = [v23 actionWithLabel:v22 url:v26];

            id v9 = v25;
            [v40 addObject:v27];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v19);
      }

      id v10 = v38;
      id v8 = v39;
      id v12 = v37;
    }
    [v12 setActions:v40];
    if ([v9 wantNotification])
    {
      id v28 = objc_alloc_init(MEMORY[0x263F35390]);
      v29 = [v9 localizedNotificationTitle];
      [v28 setTitle:v29];

      v30 = [v9 localizedNotificationDescription];
      [v28 setInformativeText:v30];

      v31 = [v28 options];
      [v31 setByAddingObject:*MEMORY[0x263F35310]];
      v33 = id v32 = v9;
      [v28 setOptions:v33];

      v34 = [v28 options];
      v35 = [v34 setByAddingObject:*MEMORY[0x263F35328]];
      [v28 setOptions:v35];

      id v9 = v32;
      [v12 setNotification:v28];
    }
    v36 = (void *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:v11];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __80__BPSFollowUpController_addFollowUpForIdentifier_withAttributes_withCompletion___block_invoke;
    v42[3] = &unk_2644089C8;
    id v43 = v10;
    [v36 postFollowUpItem:v12 completion:v42];
  }
  else
  {
    uint64_t v11 = bps_setup_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C513000, v11, OS_LOG_TYPE_DEFAULT, "Error!! Issuing a FollowUp requires dictating an identifier!", buf, 2u);
    }
  }
}

uint64_t __80__BPSFollowUpController_addFollowUpForIdentifier_withAttributes_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)removeFollowUpForIdentifier:(id)a3 withCompletion:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 baseDomainIdentifier];
  if (v6 && [v6 length])
  {
    id v9 = [objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:v8];
    id v10 = [NSString stringWithFormat:@"%@.%@", v8, v6];
    v15[0] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __68__BPSFollowUpController_removeFollowUpForIdentifier_withCompletion___block_invoke;
    v13[3] = &unk_2644089C8;
    id v14 = v7;
    [v9 clearPendingFollowUpItemsWithUniqueIdentifiers:v11 completion:v13];
  }
  else
  {
    id v9 = bps_setup_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C513000, v9, OS_LOG_TYPE_DEFAULT, "Error!! Issuing a FollowUp requires dictating an identifier!", buf, 2u);
    }
  }
}

uint64_t __68__BPSFollowUpController_removeFollowUpForIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)markSkippedSetupPaneClassForCurrentDevice:(Class)a3
{
  id v5 = [a1 _currentDevice];
  [a1 markSkippedSetupPaneClass:a3 forDevice:v5];
}

+ (void)removeSkippedPaneClassForCurrentDevice:(Class)a3
{
  id v5 = [a1 _currentDevice];
  [a1 removeSkippedPaneClass:a3 forDevice:v5];
}

+ (void)markSkippedSetupPaneClass:(Class)a3 forDevice:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = bps_setup_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136446466;
    v16 = "+[BPSFollowUpController markSkippedSetupPaneClass:forDevice:]";
    __int16 v17 = 2114;
    Class v18 = a3;
    _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", (uint8_t *)&v15, 0x16u);
  }

  id v8 = [MEMORY[0x263F086E0] bundleForClass:a3];
  id v9 = [MEMORY[0x263F086E0] mainBundle];

  if (v8 != v9) {
    a3 = (Class)[v8 principalClass];
  }
  id v10 = NSStringFromClass(a3);
  uint64_t v11 = [a1 _domainAccessorForDevice:v6];

  id v12 = [v11 objectForKey:@"BridgeSkippedSetupPanes"];
  if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v12 = (void *)MEMORY[0x263EFFA68];
  }
  if (([v12 containsObject:v10] & 1) == 0)
  {
    uint64_t v13 = [v12 arrayByAddingObject:v10];

    id v12 = (void *)v13;
  }
  [v11 setObject:v12 forKey:@"BridgeSkippedSetupPanes"];
  id v14 = (id)[v11 synchronize];
}

+ (void)removeSkippedPaneClass:(Class)a3 forDevice:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = bps_setup_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136446466;
    Class v14 = (Class)"+[BPSFollowUpController removeSkippedPaneClass:forDevice:]";
    __int16 v15 = 2114;
    Class v16 = a3;
    _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", (uint8_t *)&v13, 0x16u);
  }

  id v8 = NSStringFromClass(a3);
  id v9 = [a1 _domainAccessorForDevice:v6];

  id v10 = [v9 objectForKey:@"BridgeSkippedSetupPanes"];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v11 = [v10 mutableCopy];
    [v11 removeObject:v8];
    [v9 setObject:v11 forKey:@"BridgeSkippedSetupPanes"];
    id v12 = (id)[v9 synchronize];
  }
  else
  {
    uint64_t v11 = bps_setup_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      Class v14 = a3;
      _os_log_impl(&dword_21C513000, v11, OS_LOG_TYPE_DEFAULT, "Error: tried to remove skipped pane '%@' but none was found", (uint8_t *)&v13, 0xCu);
    }
  }
}

@end