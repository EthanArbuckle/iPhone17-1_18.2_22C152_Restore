@interface MCProfileStateHandler
+ (id)restrictionsStateDictionaryWithDetailsIncluded:(BOOL)a3;
+ (id)settingsStateDictionaryWithDetailsIncluded:(BOOL)a3;
+ (void)addProfileRestrictionsStateHandler;
+ (void)addProfileSettingsStateHandler;
@end

@implementation MCProfileStateHandler

+ (void)addProfileSettingsStateHandler
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__MCProfileStateHandler_addProfileSettingsStateHandler__block_invoke;
  v2[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v2[4] = a1;
  [a1 addStateHandlerWithName:"Profile Settings" stateBlock:v2];
}

uint64_t __55__MCProfileStateHandler_addProfileSettingsStateHandler__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) settingsStateDictionaryWithDetailsIncluded:1];
}

+ (void)addProfileRestrictionsStateHandler
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__MCProfileStateHandler_addProfileRestrictionsStateHandler__block_invoke;
  v2[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v2[4] = a1;
  [a1 addStateHandlerWithName:"Profile Restrictions" stateBlock:v2];
}

uint64_t __59__MCProfileStateHandler_addProfileRestrictionsStateHandler__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) restrictionsStateDictionaryWithDetailsIncluded:1];
}

+ (id)settingsStateDictionaryWithDetailsIncluded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = +[MCProfileConnection sharedConnection];
  v6 = v5;
  if (v3)
  {
    v7 = [v5 userSettingsForSystem];
    [v4 setObject:v7 forKeyedSubscript:@"System user settings"];

    v8 = [v6 userSettingsForCurrentUser];
    v9 = @"User's user settings";
  }
  else
  {
    v8 = [v5 userSettings];
    v9 = @"User settings";
  }
  [v4 setObject:v8 forKeyedSubscript:v9];

  v10 = [v6 effectiveUserSettings];
  [v4 setObject:v10 forKeyedSubscript:@"Effective user settings"];
  v11 = [v10 objectForKey:@"restrictedBool"];
  if (v11)
  {
    v12 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          if ([v6 isBoolSettingLockedDownByRestrictions:v18]) {
            [v12 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v15);
    }

    [v4 setObject:v12 forKeyedSubscript:@"UI disabled for BOOL settings"];
  }
  v19 = [v10 objectForKey:@"restrictedValue"];
  if (v19)
  {
    v28 = v11;
    v20 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v21 = v19;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          if ([v6 isValueSettingLockedDownByRestrictions:v26]) {
            [v20 addObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v23);
    }

    [v4 setObject:v20 forKeyedSubscript:@"UI disabled for value settings"];
    v11 = v28;
  }

  return v4;
}

+ (id)restrictionsStateDictionaryWithDetailsIncluded:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v3)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v6 = MCSystemProfileRestrictionsFilePath();
    v7 = (void *)[v5 initWithContentsOfFile:v6];
    [v4 setObject:v7 forKeyedSubscript:@"Restrictions per system profile"];

    id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v9 = MCUserProfileRestrictionsFilePath();
    v10 = (void *)[v8 initWithContentsOfFile:v9];
    [v4 setObject:v10 forKeyedSubscript:@"Restrictions per user profile"];

    id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v12 = MCSystemClientRestrictionsFilePath();
    id v13 = (void *)[v11 initWithContentsOfFile:v12];
    [v4 setObject:v13 forKeyedSubscript:@"Restrictions per system client"];

    id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v15 = MCUserClientRestrictionsFilePath();
    uint64_t v16 = (void *)[v14 initWithContentsOfFile:v15];
    [v4 setObject:v16 forKeyedSubscript:@"Restrictions per user client"];
  }
  v17 = +[MCProfileConnection sharedConnection];
  uint64_t v18 = [v17 effectiveRestrictions];
  [v4 setObject:v18 forKeyedSubscript:@"Restrictions summary"];

  return v4;
}

@end