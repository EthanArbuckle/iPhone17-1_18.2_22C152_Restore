@interface CKSettingsSharedWithYouController
- (CKSettingsSharedWithYouController)init;
- (id)appIsEnabled:(id)a3;
- (id)getAppBundleIDsFromDefaults;
- (id)getAppSpecifiers;
- (id)sharedWithYouEnabled:(id)a3;
- (id)specifiers;
- (void)postNotificationForAppEnablementChanges;
- (void)setAppIsEnabled:(id)a3 specifier:(id)a4 shouldPostNotification:(id)a5;
- (void)setSharedWithYouEnabled:(id)a3 specifier:(id)a4;
- (void)setupDefaultAppsIfRequired;
- (void)updateAppPreferencesWith:(id)a3;
@end

@implementation CKSettingsSharedWithYouController

- (CKSettingsSharedWithYouController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKSettingsSharedWithYouController;
  v2 = [(CKSettingsSharedWithYouController *)&v5 init];
  if (v2)
  {
    v3 = MessagesSettingsLocalizedString(@"SHARED_WITH_YOU");
    [(CKSettingsSharedWithYouController *)v2 setTitle:v3];
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SHARED_WITH_YOU_GLOBAL_GROUP"];
    [v5 addObject:v6];
    v7 = (void *)MEMORY[0x263F5FC40];
    v8 = MessagesSettingsLocalizedString(@"AUTOMATIC_SHARING");
    v9 = [v7 preferenceSpecifierNamed:v8 target:self set:sel_setSharedWithYouEnabled_specifier_ get:sel_sharedWithYouEnabled_ detail:0 cell:6 edit:0];

    v10 = MessagesSettingsLocalizedString(@"AUTOMATIC_SHARING_FOOTER_DESCRIPTION");
    [v6 setProperty:v10 forKey:*MEMORY[0x263F600F8]];

    if ([MEMORY[0x263F4AF78] deviceIsLockedDown]) {
      [v9 setProperty:&unk_26D075AA0 forKey:*MEMORY[0x263F600A8]];
    }
    if (_os_feature_enabled_impl())
    {
      v11 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:@"com.apple.MobileSMS"];
      int v12 = [v11 isLocked];

      if (v12) {
        [v9 setProperty:&unk_26D075AA0 forKey:*MEMORY[0x263F600A8]];
      }
    }
    [v5 addObject:v9];
    v13 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v5 addObject:v13];

    [(CKSettingsSharedWithYouController *)self setupDefaultAppsIfRequired];
    v14 = [(CKSettingsSharedWithYouController *)self getAppSpecifiers];
    if (v14) {
      [v5 addObjectsFromArray:v14];
    }
    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)setSharedWithYouEnabled:(id)a3 specifier:(id)a4
{
  id v5 = (void *)MEMORY[0x263F4AF68];
  id v6 = a3;
  v7 = [v5 sharedInstance];
  objc_msgSend(v7, "setBool:forDomain:forKey:", objc_msgSend(v6, "BOOLValue"), @"com.apple.SocialLayer", @"SharedWithYouEnabled");

  [(CKSettingsSharedWithYouController *)self updateAppPreferencesWith:v6];
  v8 = (const char *)[@"SLSharedWithYouSettingHasChanged" UTF8String];
  notify_post(v8);
}

- (id)sharedWithYouEnabled:(id)a3
{
  if ((objc_msgSend(MEMORY[0x263F4AF78], "deviceIsLockedDown", a3) & 1) != 0
    || _os_feature_enabled_impl()
    && ([MEMORY[0x263F251D0] applicationWithBundleIdentifier:@"com.apple.MobileSMS"],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 isLocked],
        v3,
        (v4 & 1) != 0))
  {
    id v5 = &unk_26D075AA0;
  }
  else
  {
    id v6 = [MEMORY[0x263F4AF68] sharedInstance];
    uint64_t v7 = [v6 getBoolFromDomain:@"com.apple.SocialLayer" forKey:@"SharedWithYouEnabled"];

    id v5 = [NSNumber numberWithBool:v7];
  }
  return v5;
}

- (void)updateAppPreferencesWith:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F4AF68] sharedInstance];
  id v6 = [v5 getValueFromDomain:@"com.apple.SocialLayer" forKey:@"SharedWithYouApps"];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  id v16 = [MEMORY[0x263EFF980] array];
  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__CKSettingsSharedWithYouController_updateAppPreferencesWith___block_invoke;
    v8[3] = &unk_2644F0F80;
    v8[4] = self;
    id v9 = v4;
    v10 = &v11;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
  }
  if ([(id)v12[5] count])
  {
    [(CKSettingsSharedWithYouController *)self postNotificationForAppEnablementChanges];
    [(CKSettingsSharedWithYouController *)self reload];
  }
  _Block_object_dispose(&v11, 8);
}

void __62__CKSettingsSharedWithYouController_updateAppPreferencesWith___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) specifiers];
  uint64_t v7 = [v6 specifierForID:v12];

  id v8 = *(id *)(a1 + 40);
  id v9 = v5;
  if (v8 != v5)
  {
    v10 = *(void **)(a1 + 32);
    uint64_t v11 = [NSNumber numberWithBool:0];
    [v10 setAppIsEnabled:v8 specifier:v7 shouldPostNotification:v11];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v12];
    id v9 = *(id *)(a1 + 40);
  }
  [v7 setProperty:v9 forKey:*MEMORY[0x263F600A8]];
}

- (void)setupDefaultAppsIfRequired
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CKSettingsSharedWithYouController *)self getAppBundleIDsFromDefaults];
  id v4 = [MEMORY[0x263F4B098] sharedManager];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "performSelector:", sel_defaultAppBundleIDs), "mutableCopy");

  id v6 = [MEMORY[0x263F4AF68] sharedInstance];
  uint64_t v7 = [v6 getBoolFromDomain:@"com.apple.SocialLayer" forKey:@"SharedWithYouEnabled"];

  v42 = (void *)v5;
  if (![v3 count])
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v8 = [MEMORY[0x263F4B098] onboardingAppBundleIDs];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v52 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          v14 = [MEMORY[0x263F4B098] sharedManager];
          [v14 setSharedWithYouEnabled:v7 forApplicationWithBundleID:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v10);
    }

    uint64_t v5 = (uint64_t)v42;
  }
  v15 = [(CKSettingsSharedWithYouController *)self getAppBundleIDsFromDefaults];

  id v16 = [MEMORY[0x263EFFA08] setWithArray:v15];
  unint64_t v17 = [v16 count];
  v18 = [MEMORY[0x263EFFA08] setWithArray:v5];
  unint64_t v19 = [v18 count];

  if (v17 < v19)
  {
    NSLog(&cfstr_MessagesSettin.isa);
    v20 = [MEMORY[0x263F4B098] collaborationAppBundleIDs];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v48 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v47 + 1) + 8 * j);
          v26 = [MEMORY[0x263F4B098] sharedManager];
          [v26 setSharedWithYouEnabled:v7 forApplicationWithBundleID:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }
      while (v22);
    }
  }
  v27 = [(CKSettingsSharedWithYouController *)self getAppBundleIDsFromDefaults];

  unint64_t v28 = [v27 count];
  v29 = v42;
  if (v28 < [v42 count])
  {
    [v42 removeObjectsInArray:v27];
    if ([v42 count])
    {
      v41 = v27;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v30 = v42;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v44;
        do
        {
          for (uint64_t k = 0; k != v32; ++k)
          {
            if (*(void *)v44 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void *)(*((void *)&v43 + 1) + 8 * k);
            if (v7)
            {
              v36 = [MEMORY[0x263F4AF68] sharedInstance];
              v37 = [v36 getValueFromDomain:@"com.apple.SocialLayer" forKey:@"SharedWithYouApps"];

              v38 = [v37 valueForKey:v35];
              uint64_t v39 = [v38 BOOLValue];

              v40 = [MEMORY[0x263F4B098] sharedManager];
              [v40 setSharedWithYouEnabled:v39 forApplicationWithBundleID:v35];
            }
            else
            {
              v37 = [MEMORY[0x263F4B098] sharedManager];
              [v37 setSharedWithYouEnabled:0 forApplicationWithBundleID:v35];
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
        }
        while (v32);
      }

      v27 = v41;
      v29 = v42;
    }
  }
}

- (id)getAppSpecifiers
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = MessagesSettingsLocalizedString(@"APPS_HEADER");
  uint64_t v5 = [v3 groupSpecifierWithID:@"SHARED_WITH_YOU_APPS_GROUP" name:v4];

  id v25 = v2;
  [v2 addObject:v5];
  id v6 = [MEMORY[0x263F4B098] sharedManager];
  uint64_t v7 = [v6 performSelector:sel_sharedWithYouApps];

  v24 = v7;
  id v8 = [v7 allKeys];
  uint64_t v9 = [v8 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  if ([v9 count])
  {
    uint64_t v21 = v9;
    uint64_t v22 = v5;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      uint64_t v14 = *MEMORY[0x263F60188];
      uint64_t v15 = *MEMORY[0x263F601A8];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          unint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v17 length])
          {
            v18 = [v24 objectForKey:v17];
            unint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F5FC40]) initWithName:v17 target:self set:sel_setAppIsEnabled_specifier_shouldPostNotification_ get:sel_appIsEnabled_ detail:0 cell:6 edit:0];
            [v19 setIdentifier:v18];
            [v19 setProperty:v18 forKey:v14];
            [v19 setProperty:@"YES" forKey:v15];
            [v25 addObject:v19];
          }
          else
          {
            NSLog(&cfstr_MessagesSettin_0.isa, v17);
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v12);
    }

    uint64_t v9 = v21;
    uint64_t v5 = v22;
  }

  return v25;
}

- (id)getAppBundleIDsFromDefaults
{
  id v2 = [MEMORY[0x263F4AF68] sharedInstance];
  uint64_t v3 = [v2 getValueFromDomain:@"com.apple.SocialLayer" forKey:@"SharedWithYouApps"];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [v4 allKeys];

  return v5;
}

- (void)setAppIsEnabled:(id)a3 specifier:(id)a4 shouldPostNotification:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263F4AF68] sharedInstance];
  uint64_t v11 = [v10 getValueFromDomain:@"com.apple.SocialLayer" forKey:@"SharedWithYouApps"];
  uint64_t v12 = (void *)[v11 mutableCopy];

  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
  }
  uint64_t v13 = [v8 identifier];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    uint64_t v15 = [v8 identifier];
    [v12 setValue:v22 forKey:v15];
  }
  id v16 = [MEMORY[0x263F4AF68] sharedInstance];
  unint64_t v17 = (void *)[v12 copy];
  [v16 setValue:v17 forDomain:@"com.apple.SocialLayer" forKey:@"SharedWithYouApps"];

  uint64_t v18 = *MEMORY[0x263F600A8];
  unint64_t v19 = [v8 propertyForKey:*MEMORY[0x263F600A8]];
  v20 = v19;
  if (!v19 || (int v21 = [v19 BOOLValue], v21 != objc_msgSend(v22, "BOOLValue"))) {
    [v8 setProperty:v22 forKey:v18];
  }
  if (!v9 || [v9 BOOLValue]) {
    [(CKSettingsSharedWithYouController *)self postNotificationForAppEnablementChanges];
  }
}

- (id)appIsEnabled:(id)a3
{
  id v3 = a3;
  id v4 = [NSNumber numberWithBool:0];
  if ([MEMORY[0x263F4AF78] deviceIsLockedDown]
    || _os_feature_enabled_impl()
    && ([MEMORY[0x263F251D0] applicationWithBundleIdentifier:@"com.apple.MobileSMS"],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isLocked],
        v5,
        v6))
  {
    [v3 setProperty:&unk_26D075AA0 forKey:*MEMORY[0x263F600A8]];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F4AF68] sharedInstance];
    int v8 = [v7 getBoolFromDomain:@"com.apple.SocialLayer" forKey:@"SharedWithYouEnabled"];

    if (v8)
    {
      id v9 = [v3 identifier];
      id v10 = [MEMORY[0x263F4AF68] sharedInstance];
      uint64_t v11 = [v10 getValueFromDomain:@"com.apple.SocialLayer" forKey:@"SharedWithYouApps"];

      uint64_t v12 = [v11 valueForKey:v9];

      id v4 = (void *)v12;
    }
    else
    {
      id v9 = [NSNumber numberWithBool:0];
      [v3 setProperty:v9 forKey:*MEMORY[0x263F600A8]];
    }
  }
  id v13 = v4;

  return v13;
}

- (void)postNotificationForAppEnablementChanges
{
  id v2 = (const char *)[@"SLSharedWithYouAppSettingHasChanged" UTF8String];
  notify_post(v2);
}

@end