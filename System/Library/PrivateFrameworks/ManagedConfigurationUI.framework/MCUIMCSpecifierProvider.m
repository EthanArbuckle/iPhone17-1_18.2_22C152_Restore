@interface MCUIMCSpecifierProvider
- (BOOL)_showProfileDetailPageForUserEnrollmentProfile:(id)a3;
- (id)_specifierForAppSigner:(id)a3;
- (id)_specifierForBlockedApp:(id)a3;
- (id)specifiers;
- (void)_loadAppSignerFromSpecifier:(id)a3;
- (void)_presentModalNavController:(id)a3;
- (void)_presentViewController:(id)a3;
- (void)_selectInstalledProfileIdentifier:(id)a3;
- (void)_selectUninstalledProfileIdentifier:(id)a3;
- (void)loadProfileFromSpecifier:(id)a3;
@end

@implementation MCUIMCSpecifierProvider

- (id)specifiers
{
  v76[1] = *MEMORY[0x1E4F143B8];
  v3 = +[MCUIDataManager sharedManager];
  id v71 = 0;
  id v72 = 0;
  id v69 = 0;
  id v70 = 0;
  id v67 = 0;
  id v68 = 0;
  [v3 allDeviceManagementOutMDMProfileInfo:&v72 outConfigurationProfilesInfo:&v71 outUninstalledProfilesInfo:&v70 outEnterpriseAppSigners:&v69 outFreeDevAppSigners:&v68 outBlockedApplications:&v67];
  id v4 = v72;
  id v5 = v71;
  id v6 = v70;
  id v7 = v69;
  id v8 = v68;
  id v51 = v67;

  v9 = objc_opt_new();
  if (v4)
  {
    v10 = [MEMORY[0x1E4F179C8] defaultStore];
    v11 = objc_msgSend(v10, "dmc_visibleRemoteManagementAccounts");

    if (![v11 count])
    {
      v76[0] = v4;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:1];
      v13 = [(MCUISpecifierProvider *)self specifiersForMDMProfiles:v12];

      if (v13) {
        [v9 addObjectsFromArray:v13];
      }
    }
  }
  uint64_t v14 = [(MCUISpecifierProvider *)self specifiersForUninstalledProfiles:v6];
  if (v14) {
    [v9 addObjectsFromArray:v14];
  }
  v48 = (void *)v14;
  v49 = v6;
  v50 = v5;
  uint64_t v15 = [(MCUISpecifierProvider *)self specifiersForInstalledProfiles:v5];
  if (v15) {
    [v9 addObjectsFromArray:v15];
  }
  v47 = (void *)v15;
  char v66 = 0;
  id v52 = v8;
  id v53 = v7;
  if ([(MCUISpecifierProvider *)self isSectionPopulated:v7 outIsPlural:&v66])
  {
    if (v66) {
      v16 = @"ENTERPRISE_APP_PLURAL";
    }
    else {
      v16 = @"ENTERPRISE_APP_SINGULAR";
    }
    v17 = MCUILocalizedString(v16);
    v18 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:v17];
    [v9 addObject:v18];

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v19 = v7;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v62 objects:v75 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v63 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [(MCUIMCSpecifierProvider *)self _specifierForAppSigner:*(void *)(*((void *)&v62 + 1) + 8 * i)];
          [v9 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v62 objects:v75 count:16];
      }
      while (v21);
    }

    id v8 = v52;
    id v7 = v53;
  }
  if ([(MCUISpecifierProvider *)self isSectionPopulated:v8 outIsPlural:&v66])
  {
    if (v66) {
      v25 = @"DEVELOPER_APP_PLURAL";
    }
    else {
      v25 = @"DEVELOPER_APP_SINGULAR";
    }
    v26 = MCUILocalizedString(v25);
    v27 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:v26];
    [v9 addObject:v27];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v28 = v8;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v58 objects:v74 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v59 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [(MCUIMCSpecifierProvider *)self _specifierForAppSigner:*(void *)(*((void *)&v58 + 1) + 8 * j)];
          [v9 addObject:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v58 objects:v74 count:16];
      }
      while (v30);
    }

    id v8 = v52;
    id v7 = v53;
  }
  v34 = v51;
  if ([(MCUISpecifierProvider *)self isSectionPopulated:v51 outIsPlural:&v66])
  {
    id v46 = v4;
    if (v66) {
      v35 = @"BLOCKED_APP_PLURAL";
    }
    else {
      v35 = @"BLOCKED_APP";
    }
    v36 = MCUILocalizedString(v35);
    v37 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:v36];
    [v9 addObject:v37];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v38 = v51;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v54 objects:v73 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v55;
      do
      {
        for (uint64_t k = 0; k != v40; ++k)
        {
          if (*(void *)v55 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v43 = *(void *)(*((void *)&v54 + 1) + 8 * k);
          v44 = [(MCUIMCSpecifierProvider *)self _specifierForBlockedApp:v43];
          if (v44) {
            [v9 addObject:v44];
          }
          else {
            NSLog(&cfstr_McuiMcSpecifie.isa, v43);
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v54 objects:v73 count:16];
      }
      while (v40);
    }

    id v4 = v46;
    id v8 = v52;
    id v7 = v53;
    v34 = v51;
  }

  return v9;
}

- (id)_specifierForAppSigner:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identity];
  id v6 = [(MCUISpecifierProvider *)self specifierWithName:v5 detail:objc_opt_class()];

  id v7 = [v4 displayName];
  [v6 setProperty:v7 forKey:*MEMORY[0x1E4F93240]];

  if ([v4 isTrusted])
  {
    id v8 = (void *)MEMORY[0x1E4F28EE0];
    v9 = NSNumber;
    v10 = [v4 applications];
    v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "count"));
    v12 = [v8 localizedStringFromNumber:v11 numberStyle:0];
  }
  else
  {
    v12 = MCUILocalizedString(@"NOT_TRUSTED_PROFILE");
  }
  [v6 setProperty:v12 forKey:*MEMORY[0x1E4F93230]];
  [v6 setProperty:v4 forKey:@"MCUIPSItemKey"];
  [v6 setControllerLoadAction:sel__loadAppSignerFromSpecifier_];
  [v6 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93068]];

  return v6;
}

- (void)_loadAppSignerFromSpecifier:(id)a3
{
  id v6 = a3;
  id v4 = [v6 propertyForKey:@"MCUIPSItemKey"];
  if (v4)
  {
    id v5 = [[MCUIAppSignerViewController alloc] initWithAppSigner:v4];
    [(MCUIMCSpecifierProvider *)self _presentViewController:v5];
  }
  else
  {
    NSLog(&cfstr_McuiMcSpecifie_0.isa, v6);
  }
}

- (id)_specifierForBlockedApp:(id)a3
{
  id v4 = a3;
  if ([v4 isBlocked])
  {
    id v5 = [v4 bundleID];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      MCUILocalizedString(@"UNKNOWN_APP");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;

    uint64_t v10 = [v4 name];
    v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = v9;
    }
    id v13 = v12;

    id v8 = [(MCUISpecifierProvider *)self specifierWithName:v13 detail:objc_opt_class()];
    uint64_t v14 = [v4 misCDHash];
    [v8 setProperty:v14 forKey:@"MCUIBlockedAppCdHash"];

    uint64_t v15 = [v4 misHashType];
    [v8 setProperty:v15 forKey:@"MCUIBlockedAppHashType"];

    [v8 setProperty:v13 forKey:@"MCUIBlockedAppName"];
    [v8 setProperty:v13 forKey:*MEMORY[0x1E4F93240]];

    v16 = [v4 iconForVariant:0];
    [v8 setProperty:v16 forKey:*MEMORY[0x1E4F93190]];

    [v8 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93130]];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)loadProfileFromSpecifier:(id)a3
{
  id v4 = a3;
  id v7 = [v4 propertyForKey:@"MCUIPSItemKey"];
  if (v7)
  {
    id v5 = [v4 propertyForKey:@"MCUIPSInstalledKey"];

    if (v5 && [v5 BOOLValue])
    {
      id v6 = [v7 identifier];
      [(MCUIMCSpecifierProvider *)self _selectInstalledProfileIdentifier:v6];
    }
    else
    {
      id v6 = [v7 identifier];
      [(MCUIMCSpecifierProvider *)self _selectUninstalledProfileIdentifier:v6];
    }
  }
  else
  {
    NSLog(&cfstr_McuiMcSpecifie_1.isa, v4);
    id v5 = v4;
  }
}

- (void)_selectInstalledProfileIdentifier:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F74230];
  id v5 = a3;
  id v6 = [v4 sharedConnection];
  id v8 = [v6 installedProfileWithIdentifier:v5];

  id v7 = [[MCRemoveProfileViewController alloc] initWithProfile:v8];
  [(MCUIMCSpecifierProvider *)self _presentViewController:v7];
}

- (void)_selectUninstalledProfileIdentifier:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F74230];
  id v5 = a3;
  id v6 = [v4 sharedConnection];
  objc_msgSend(v6, "uninstalledProfileDataWithIdentifier:targetDevice:", v5, objc_msgSend(MEMORY[0x1E4F74220], "thisDeviceType"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (![(MCUIMCSpecifierProvider *)self _showProfileDetailPageForUserEnrollmentProfile:v9])
  {
    id v7 = [[MCInstallProfileViewController alloc] initWithInstallableProfileData:v9 fromSource:1];
    id v8 = [[MCUINavigationViewController alloc] initWithRootViewController:v7];
    [(MCUIMCSpecifierProvider *)self _presentModalNavController:v8];
  }
}

- (BOOL)_showProfileDetailPageForUserEnrollmentProfile:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v5 = [MEMORY[0x1E4F74220] profileWithData:v4 outError:&v12];
  id v6 = v5;
  if (v12)
  {
    NSLog(&cfstr_McuiMcSpecifie_2.isa);
LABEL_5:
    BOOL v10 = 0;
    goto LABEL_6;
  }
  if (![v5 isUserEnrollmentProfile]) {
    goto LABEL_5;
  }
  id v7 = [[MCProfileTitlePageViewModel alloc] initWithProfile:v6 profileData:v4];
  id v8 = [[MCProfileTitlePageViewController alloc] initWithViewModel:v7];
  id v9 = [[MCUIDismissalAwareNavigationController alloc] initWithRootViewController:v8];
  [(MCUIMCSpecifierProvider *)self _presentModalNavController:v9];

  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (void)_presentModalNavController:(id)a3
{
  id v7 = a3;
  if (MCUIIsiPad()) {
    [v7 setModalPresentationStyle:2];
  }
  id v4 = [(MCUISpecifierProvider *)self delegate];
  id v5 = [v4 mcuiViewController];
  id v6 = [v5 navigationController];
  [v6 presentViewController:v7 animated:1 completion:0];
}

- (void)_presentViewController:(id)a3
{
  id v4 = a3;
  id v7 = [(MCUISpecifierProvider *)self delegate];
  id v5 = [v7 mcuiViewController];
  id v6 = [v5 navigationController];
  [v6 pushViewController:v4 animated:1];
}

@end