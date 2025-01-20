@interface HUSetupBannerItem
- (id)_determineRequiredAccessorySetupReminders:(id)a3;
- (id)_determineRequiredLockAccessorySetupReminders:(id)a3;
- (id)_determineRequiredOnboardingReminders:(id)a3;
- (id)_namesOfAccessoriesNeedingNaturalLightingOnboarding;
- (id)_possibleDependentKeyPaths;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUSetupBannerItem

uint64_t __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_2_234(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue]) {
    [*(id *)(a1 + 32) addObject:*MEMORY[0x1E4F684D0]];
  }
  v3 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v4 = *(void *)(a1 + 32);

  return [v3 futureWithResult:v4];
}

uint64_t __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_4(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue]) {
    [*(id *)(a1 + 32) addObject:*MEMORY[0x1E4F684E8]];
  }
  v3 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v4 = *(void *)(a1 + 32);

  return [v3 futureWithResult:v4];
}

BOOL __63__HUSetupBannerItem__determineRequiredAccessorySetupReminders___block_invoke_241(uint64_t a1, void *a2)
{
  v2 = [a2 pendingConfigurationIdentifier];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)_possibleDependentKeyPaths
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F68498], *MEMORY[0x1E4F684A0], *MEMORY[0x1E4F684B8], *MEMORY[0x1E4F684C0], *MEMORY[0x1E4F684D0], *MEMORY[0x1E4F684D8], *MEMORY[0x1E4F684E0], *MEMORY[0x1E4F684E8], 0);
}

id __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v218[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  if ([*(id *)(a1 + 32) forceShowBanner]
    && ![*(id *)(a1 + 40) count]
    && ![v3 count])
  {
    uint64_t v5 = *MEMORY[0x1E4F684D8];
    v218[0] = *MEMORY[0x1E4F684B8];
    v218[1] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v218 count:2];

    id v3 = (id)v6;
  }
  v193 = v3;
  if (![*(id *)(a1 + 40) count])
  {
    if (![v3 count])
    {
      uint64_t v55 = 0;
      int v47 = 0;
      uint64_t v56 = 1;
      goto LABEL_42;
    }
    v24 = HFLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      v26 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138413058;
      uint64_t v211 = v25;
      __int16 v212 = 2112;
      v213 = v26;
      __int16 v214 = 2048;
      uint64_t v215 = [v3 count];
      __int16 v216 = 2112;
      id v217 = v3;
      _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@ Showing reminder banner for %lu onboarding features (%@)", buf, 0x2Au);
    }
    [v4 setObject:&unk_1F19B49D0 forKeyedSubscript:@"HFResultSetupBannerType"];
    [v4 setObject:v3 forKeyedSubscript:@"HFResultKeyPathsForUnfinishedOnboardingFlows"];
    if ([v3 count] == 1)
    {
      v12 = [v3 firstObject];
      if ([v12 isEqualToString:*MEMORY[0x1E4F684B8]])
      {
        v27 = _HULocalizedStringWithDefaultValue(@"HUSetupCellFinishVoiceProfileSetup_Title", @"HUSetupCellFinishVoiceProfileSetup_Title", 1);
        [v4 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

        [v4 setObject:@"Home.Banners.SetUp.FinishVoiceProfile" forKeyedSubscript:*MEMORY[0x1E4F68928]];
        [v4 setObject:@"HUSetupCellFinishVoiceProfileSetup_Title" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
        v28 = _HULocalizedStringWithDefaultValue(@"HUSetupCellFinishVoiceProfileSetup_Details", @"HUSetupCellFinishVoiceProfileSetup_Details", 1);
        [v4 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F68980]];

        v29 = _HULocalizedStringWithDefaultValue(@"HUSetupCellContinue", @"HUSetupCellContinue", 1);
        [v4 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F68948]];

        id v30 = objc_alloc(MEMORY[0x1E4F692D0]);
        uint64_t v31 = *MEMORY[0x1E4F68670];
        v203[0] = *MEMORY[0x1E4F68678];
        v203[1] = v31;
        uint64_t v32 = *MEMORY[0x1E4F68660];
        v204[0] = *MEMORY[0x1E4F68668];
        v204[1] = v32;
        v33 = (void *)MEMORY[0x1E4F1C9E8];
        v34 = v204;
        v35 = v203;
      }
      else
      {
        if (![v12 isEqualToString:*MEMORY[0x1E4F684D8]])
        {
          if (![v12 isEqualToString:*MEMORY[0x1E4F684E8]])
          {
            if (![v12 isEqualToString:*MEMORY[0x1E4F684D0]]) {
              goto LABEL_40;
            }
            v110 = _HULocalizedStringWithDefaultValue(@"HUSetupCellFinishNaturalLightingSetup_Title", @"HUSetupCellFinishNaturalLightingSetup_Title", 1);
            [v4 setObject:v110 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

            [v4 setObject:@"Home.Banners.SetUp.FinishNaturalLighting" forKeyedSubscript:*MEMORY[0x1E4F68928]];
            [v4 setObject:@"HUSetupCellFinishNaturalLightingSetup_Title" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
            v18 = _HULocalizedStringWithDefaultValue(@"HUSetupCellFinishNaturalLightingSetup_Details", @"HUSetupCellFinishNaturalLightingSetup_Details", 1);
            v19 = [*(id *)(a1 + 32) _namesOfAccessoriesNeedingNaturalLightingOnboarding];
            if ([v19 count] == 1)
            {
              v111 = [v19 firstObject];
              uint64_t v118 = HULocalizedStringWithFormat(@"HUSetupCellFinishNaturalLightingSetup_Details_SingleAccessory", @"%@", v112, v113, v114, v115, v116, v117, (uint64_t)v111);

              v18 = (void *)v118;
            }
            [v4 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F68980]];
            v119 = _HULocalizedStringWithDefaultValue(@"HUSetupCellFinishNaturalLightingSetup_Continue", @"HUSetupCellFinishNaturalLightingSetup_Continue", 1);
            [v4 setObject:v119 forKeyedSubscript:*MEMORY[0x1E4F68948]];

            id v120 = objc_alloc(MEMORY[0x1E4F692D0]);
            uint64_t v121 = *MEMORY[0x1E4F68670];
            v199[0] = *MEMORY[0x1E4F68678];
            v199[1] = v121;
            uint64_t v122 = *MEMORY[0x1E4F685E8];
            v200[0] = *MEMORY[0x1E4F685F0];
            v200[1] = v122;
            v123 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v200 forKeys:v199 count:2];
            v124 = (void *)[v120 initWithImageIdentifiersKeyedBySize:v123];
            [v4 setObject:v124 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

            goto LABEL_38;
          }
          v102 = _HULocalizedStringWithDefaultValue(@"HUEnergySettingsConnectUtilityTitle", @"HUEnergySettingsConnectUtilityTitle", 1);
          [v4 setObject:v102 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

          [v4 setObject:@"Home.Banners.SetUp.FinishUtility" forKeyedSubscript:*MEMORY[0x1E4F68928]];
          [v4 setObject:@"HUEnergySettingsConnectUtilityTitle" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
          v103 = _HULocalizedStringWithDefaultValue(@"HUEnergySettingsConnectUtilityDetail", @"HUEnergySettingsConnectUtilityDetail", 1);
          [v4 setObject:v103 forKeyedSubscript:*MEMORY[0x1E4F68980]];

          v104 = _HULocalizedStringWithDefaultValue(@"HUEnergySettingsConnectUtility", @"HUEnergySettingsConnectUtility", 1);
          [v4 setObject:v104 forKeyedSubscript:*MEMORY[0x1E4F68948]];

          v18 = HUImageNamed(@"Onboarding-HomeUtilityLogo");
          v63 = (void *)MEMORY[0x1E4F689F8];
LABEL_28:
          [v4 setObject:v18 forKeyedSubscript:*v63];
LABEL_39:

          goto LABEL_40;
        }
        v74 = _HULocalizedStringWithDefaultValue(@"HUSetupCellFinishTVViewingProfileSetup_Title", @"HUSetupCellFinishTVViewingProfileSetup_Title", 1);
        [v4 setObject:v74 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

        [v4 setObject:@"Home.Banners.SetUp.FinishTVViewingProfile" forKeyedSubscript:*MEMORY[0x1E4F68928]];
        [v4 setObject:@"HUSetupCellFinishTVViewingProfileSetup_Title" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
        v75 = _HULocalizedStringWithDefaultValue(@"HUSetupCellFinishTVViewingProfileSetup_Details", @"HUSetupCellFinishTVViewingProfileSetup_Details", 1);
        [v4 setObject:v75 forKeyedSubscript:*MEMORY[0x1E4F68980]];

        v76 = _HULocalizedStringWithDefaultValue(@"HUSetupCellContinue", @"HUSetupCellContinue", 1);
        [v4 setObject:v76 forKeyedSubscript:*MEMORY[0x1E4F68948]];

        id v30 = objc_alloc(MEMORY[0x1E4F692D0]);
        uint64_t v77 = *MEMORY[0x1E4F68670];
        v201[0] = *MEMORY[0x1E4F68678];
        v201[1] = v77;
        uint64_t v78 = *MEMORY[0x1E4F685C0];
        v202[0] = *MEMORY[0x1E4F685C8];
        v202[1] = v78;
        v33 = (void *)MEMORY[0x1E4F1C9E8];
        v34 = v202;
        v35 = v201;
      }
      v18 = [v33 dictionaryWithObjects:v34 forKeys:v35 count:2];
      v19 = (void *)[v30 initWithImageIdentifiersKeyedBySize:v18];
      uint64_t v79 = *MEMORY[0x1E4F689E8];
      v80 = v4;
      v81 = v19;
LABEL_37:
      [v80 setObject:v81 forKeyedSubscript:v79];
      goto LABEL_38;
    }
    v57 = _HULocalizedStringWithDefaultValue(@"HUSetupCellFinishHomeSetup_Title", @"HUSetupCellFinishHomeSetup_Title", 1);
    [v4 setObject:v57 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [v4 setObject:@"Home.Banners.SetUp.FinishSettingUpHome" forKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v4 setObject:@"HUSetupCellFinishHomeSetup_Title" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
    v58 = _HULocalizedStringWithDefaultValue(@"HUSetupCellFinishHomeSetup_Details", @"HUSetupCellFinishHomeSetup_Details", 1);
    [v4 setObject:v58 forKeyedSubscript:*MEMORY[0x1E4F68980]];

    v59 = _HULocalizedStringWithDefaultValue(@"HUSetupCellContinue", @"HUSetupCellContinue", 1);
    [v4 setObject:v59 forKeyedSubscript:*MEMORY[0x1E4F68948]];

    id v39 = objc_alloc(MEMORY[0x1E4F692D0]);
    uint64_t v60 = *MEMORY[0x1E4F68670];
    v197[0] = *MEMORY[0x1E4F68678];
    v197[1] = v60;
    uint64_t v61 = *MEMORY[0x1E4F685D8];
    v198[0] = *MEMORY[0x1E4F685E0];
    v198[1] = v61;
    v42 = (void *)MEMORY[0x1E4F1C9E8];
    v43 = v198;
    v44 = v197;
LABEL_26:
    v12 = [v42 dictionaryWithObjects:v43 forKeys:v44 count:2];
    uint64_t v62 = [v39 initWithImageIdentifiersKeyedBySize:v12];
LABEL_27:
    v18 = (void *)v62;
    v63 = (void *)MEMORY[0x1E4F689E8];
    goto LABEL_28;
  }
  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v10 = [*(id *)(a1 + 40) count];
    v11 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    uint64_t v211 = v8;
    __int16 v212 = 2112;
    v213 = v9;
    __int16 v214 = 2048;
    uint64_t v215 = v10;
    __int16 v216 = 2112;
    id v217 = v11;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Showing reminder banner for %lu accessory setup features (%@)", buf, 0x2Au);
  }
  [v4 setObject:&unk_1F19B49B8 forKeyedSubscript:@"HFResultSetupBannerType"];
  [v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"HFResultSetupBannerAccessorySetupFlowsKey"];
  if ([*(id *)(a1 + 40) count] != 1)
  {
    v36 = _HULocalizedStringWithDefaultValue(@"HUSetupCellFinishHomeSetup_Title", @"HUSetupCellFinishHomeSetup_Title", 1);
    [v4 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [v4 setObject:@"Home.Banners.SetUp.FinishSettingUpHome" forKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v4 setObject:@"HUSetupCellFinishHomeSetup_Title" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
    v37 = _HULocalizedStringWithDefaultValue(@"HUSetupCellFinishHomeSetup_Details", @"HUSetupCellFinishHomeSetup_Details", 1);
    [v4 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F68980]];

    v38 = _HULocalizedStringWithDefaultValue(@"HUSetupCellContinue", @"HUSetupCellContinue", 1);
    [v4 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F68948]];

    id v39 = objc_alloc(MEMORY[0x1E4F692D0]);
    uint64_t v40 = *MEMORY[0x1E4F68670];
    v205[0] = *MEMORY[0x1E4F68678];
    v205[1] = v40;
    uint64_t v41 = *MEMORY[0x1E4F685D8];
    v206[0] = *MEMORY[0x1E4F685E0];
    v206[1] = v41;
    v42 = (void *)MEMORY[0x1E4F1C9E8];
    v43 = v206;
    v44 = v205;
    goto LABEL_26;
  }
  v12 = [*(id *)(a1 + 40) firstObject];
  v13 = [v12 type];
  int v14 = [v13 isEqualToString:HFAccessorySetupFlowTypeResume];

  if (v14)
  {
    [v4 setObject:&unk_1F19B49B8 forKeyedSubscript:@"HFResultSetupBannerType"];
    [v4 setObject:v3 forKeyedSubscript:@"HFResultKeyPathsForUnfinishedOnboardingFlows"];
    objc_opt_class();
    v15 = [v12 homeKitObjects];
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    if ([v17 count] == 1)
    {
      v18 = [v17 firstObject];

      v19 = objc_msgSend(v18, "hf_categoryOrPrimaryServiceType");
      v20 = HFLocalizedCategoryOrPrimaryServiceTypeString();
      [v4 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      [v4 setObject:@"Home.Banners.SetUp.ResumeAccessoryConfiguration" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v4 setObject:@"HUSetupBannerResumeAccessoryConfigurationTitle" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
      v21 = _HULocalizedStringWithDefaultValue(@"HUSetupBannerResumeAccessoryConfigurationSubtitle", @"HUSetupBannerResumeAccessoryConfigurationSubtitle", 1);
      [v4 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F68980]];

      v22 = HFLocalizedCategoryOrPrimaryServiceTypeString();
      [v4 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F68948]];

      v23 = [MEMORY[0x1E4F69548] iconDescriptorForAccessory:v18];
      [v4 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

LABEL_38:
      goto LABEL_39;
    }
    unint64_t v64 = [v17 count];

    if (v64 < 2)
    {
LABEL_40:
      uint64_t v55 = 0;
      int v47 = 0;
      goto LABEL_41;
    }
    v65 = _HULocalizedStringWithDefaultValue(@"HUSetupBannerResumeMultipleAccessoriesConfigurationTitle", @"HUSetupBannerResumeMultipleAccessoriesConfigurationTitle", 1);
    [v4 setObject:v65 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [v4 setObject:@"Home.Banners.SetUp.ResumeMultipleAccessoryConfiguration" forKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v4 setObject:@"HUSetupBannerResumeMultipleAccessoriesConfigurationTitle" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
    v66 = _HULocalizedStringWithDefaultValue(@"HUSetupBannerResumeMultipleAccessoriesConfigurationSubtitle", @"HUSetupBannerResumeMultipleAccessoriesConfigurationSubtitle", 1);
    [v4 setObject:v66 forKeyedSubscript:*MEMORY[0x1E4F68980]];

    v67 = _HULocalizedStringWithDefaultValue(@"HUSetupBannerResumeMultipleAccessoriesConfigurationButton", @"HUSetupBannerResumeMultipleAccessoriesConfigurationButton", 1);
    [v4 setObject:v67 forKeyedSubscript:*MEMORY[0x1E4F68948]];

    uint64_t v62 = [objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"house.circle.fill"];
    goto LABEL_27;
  }
  v45 = [v12 type];
  int v46 = [v45 isEqualToString:HFAccessorySetupFlowTypeLockAccessFirmwareUpdateAll];

  if (!v46)
  {
    v68 = [v12 type];
    int v69 = [v68 isEqualToString:HFAccessorySetupFlowTypeLockAccessAll];

    if (v69)
    {
      int v47 = 1;
      v70 = _HULocalizedStringWithDefaultValue(@"HUSetupBannerLocksUserOnboarding_Title_WalletKeyExpressMode", @"HUSetupBannerLocksUserOnboarding_Title_WalletKeyExpressMode", 1);
      [v4 setObject:v70 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      [v4 setObject:@"Home.Banners.SetUp.Lock.HomeKeyAndExpressMode" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v4 setObject:@"HUSetupBannerLocksUserOnboarding_Title_WalletKeyExpressMode" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
      v71 = _HULocalizedStringWithDefaultValue(@"HUSetupBannerLocksUserOnboarding_Details_All", @"HUSetupBannerLocksUserOnboarding_Details_All", 1);
      [v4 setObject:v71 forKeyedSubscript:*MEMORY[0x1E4F68980]];

      v72 = _HULocalizedStringWithDefaultValue(@"HUSetupCellSetUp", @"HUSetupCellSetUp", 1);
      [v4 setObject:v72 forKeyedSubscript:*MEMORY[0x1E4F68948]];

      v51 = [*(id *)(a1 + 48) home];
      v52 = objc_msgSend(v51, "hf_walletKeyAccessories");
      v53 = v52;
      v54 = &__block_literal_global_67_0;
      goto LABEL_33;
    }
    v98 = [v12 type];
    int v99 = [v98 isEqualToString:HFAccessorySetupFlowTypeLockAccessFirmwareUpdatePinCode];

    if (v99)
    {
      int v47 = 1;
      v100 = _HULocalizedStringWithDefaultValue(@"HUSetupCellLockFeatures_Title", @"HUSetupCellLockFeatures_Title", 1);
      [v4 setObject:v100 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      [v4 setObject:@"Home.Banners.SetUp.Lock.FirmwareUpdatePinCode" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v4 setObject:@"HUSetupCellLockFeatures_Title" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
      v101 = @"HUSetupCellLockFeatures_Details_AccessCode";
LABEL_54:
      v108 = _HULocalizedStringWithDefaultValue(v101, v101, 1);
      [v4 setObject:v108 forKeyedSubscript:*MEMORY[0x1E4F68980]];

      v109 = _HULocalizedStringWithDefaultValue(@"HUSetupCellSetUp", @"HUSetupCellSetUp", 1);
      [v4 setObject:v109 forKeyedSubscript:*MEMORY[0x1E4F68948]];

      uint64_t v55 = 0;
      goto LABEL_41;
    }
    v105 = [v12 type];
    int v106 = [v105 isEqualToString:HFAccessorySetupFlowTypeLockAccessPinCode];

    if (v106)
    {
      int v47 = 1;
      v107 = _HULocalizedStringWithDefaultValue(@"HUSetupBannerLocksUserOnboarding_Title_AccessCode", @"HUSetupBannerLocksUserOnboarding_Title_AccessCode", 1);
      [v4 setObject:v107 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      [v4 setObject:@"Home.Banners.SetUp.Lock.PersonalAccessCodeAvailable" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v4 setObject:@"HUSetupBannerLocksUserOnboarding_Title_AccessCode" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
      v101 = @"HUSetupBannerLocksUserOnboarding_Details_AccessCode";
      goto LABEL_54;
    }
    v125 = [v12 type];
    int v126 = [v125 isEqualToString:HFAccessorySetupFlowTypeLockAccessFirmwareUpdateWalletKey];

    if (v126)
    {
      uint64_t v55 = 1;
      v127 = _HULocalizedStringWithDefaultValue(@"HUSetupCellLockFeatures_Title", @"HUSetupCellLockFeatures_Title", 1);
      [v4 setObject:v127 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      [v4 setObject:@"Home.Banners.SetUp.Lock.Features" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v4 setObject:@"HUSetupCellLockFeatures_Title" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
      v128 = @"HUSetupCellLockFeatures_Details_WalletKey";
LABEL_67:
      v145 = _HULocalizedStringWithDefaultValue(v128, v128, 1);
      [v4 setObject:v145 forKeyedSubscript:*MEMORY[0x1E4F68980]];

      v146 = _HULocalizedStringWithDefaultValue(@"HUSetupCellSetUp", @"HUSetupCellSetUp", 1);
      [v4 setObject:v146 forKeyedSubscript:*MEMORY[0x1E4F68948]];

      int v47 = 1;
      goto LABEL_41;
    }
    v129 = [v12 type];
    if ([v129 isEqualToString:HFAccessorySetupFlowTypeLockAccessWalletKeyUWB])
    {
      int v130 = _os_feature_enabled_impl();

      if (v130)
      {
        v131 = _HULocalizedStringWithDefaultValue(@"HUSetupCellLocksUserOnboarding_Title_WalletKeyUWB", @"HUSetupCellLocksUserOnboarding_Title_WalletKeyUWB", 1);
        [v4 setObject:v131 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

        [v4 setObject:@"HUSetupCellLocksUserOnboarding_Title_WalletKeyUWB" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
        v132 = _HULocalizedStringWithDefaultValue(@"HUSetupCellLocksUserOnboarding_Details_WalletKeyUWB", @"HUSetupCellLocksUserOnboarding_Details_WalletKeyUWB", 1);
        [v4 setObject:v132 forKeyedSubscript:*MEMORY[0x1E4F68980]];

        v133 = _HULocalizedStringWithDefaultValue(@"HUSetupCellSetUp", @"HUSetupCellSetUp", 1);
        [v4 setObject:v133 forKeyedSubscript:*MEMORY[0x1E4F68948]];

        [v4 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F68AB0]];
        v134 = (void *)MEMORY[0x1E4F42A98];
        v135 = [MEMORY[0x1E4F428B8] lightGrayColor];
        v209[0] = v135;
        v136 = [MEMORY[0x1E4F428B8] lightGrayColor];
        v209[1] = v136;
        v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:v209 count:2];
        v18 = [v134 configurationWithPaletteColors:v137];

        v138 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"door.left.hand.closed" configuration:v18];
        [v4 setObject:v138 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

        v139 = (void *)MEMORY[0x1E4F42A98];
        v140 = [MEMORY[0x1E4F428B8] labelColor];
        v19 = [v139 configurationWithHierarchicalColor:v140];

        v141 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"figure.stand" configuration:v19];
        [v4 setObject:v141 forKeyedSubscript:*MEMORY[0x1E4F68A90]];

        uint64_t v79 = *MEMORY[0x1E4F68A98];
        v81 = &unk_1F19B6280;
        v80 = v4;
        goto LABEL_37;
      }
    }
    else
    {
    }
    v142 = [v12 type];
    int v143 = [v142 isEqualToString:HFAccessorySetupFlowTypeLockAccessWalletKey];

    if (v143)
    {
      uint64_t v55 = 1;
      v144 = _HULocalizedStringWithDefaultValue(@"HUSetupBannerLocksUserOnboarding_Title_WalletKeyExpressMode", @"HUSetupBannerLocksUserOnboarding_Title_WalletKeyExpressMode", 1);
      [v4 setObject:v144 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      [v4 setObject:@"Home.Banners.SetUp.Lock.WalletKeyAndExpressMode" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v4 setObject:@"HUSetupBannerLocksUserOnboarding_Title_WalletKeyExpressMode" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
      v128 = @"HUSetupBannerLocksUserOnboarding_Details_WalletKey";
      goto LABEL_67;
    }
    v147 = [v12 type];
    int v148 = [v147 isEqualToString:HFAccessorySetupFlowTypeSafetyAndSecurity];

    if (v148)
    {
      v149 = _HULocalizedStringWithDefaultValue(@"HUSafetyAndSecurityBanner_Title", @"HUSafetyAndSecurityBanner_Title", 1);
      [v4 setObject:v149 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      [v4 setObject:@"HUSafetyAndSecurityBanner_Title" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
      v150 = _HULocalizedStringWithDefaultValue(@"HUSafetyAndSecurityBanner_Description", @"HUSafetyAndSecurityBanner_Description", 1);
      [v4 setObject:v150 forKeyedSubscript:*MEMORY[0x1E4F68980]];

      v151 = _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
      [v4 setObject:v151 forKeyedSubscript:*MEMORY[0x1E4F68948]];

      id v152 = objc_alloc(MEMORY[0x1E4F691D0]);
      v153 = objc_msgSend(MEMORY[0x1E4F42A80], "hf_safetyAndSecurityImage");
      v154 = [v153 configuration];
      v155 = (void *)[v152 initWithSystemImageNamed:@"house.badge.shield.half.filled.fill" configuration:v154];
      [v4 setObject:v155 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

      goto LABEL_40;
    }
    v156 = [v12 type];
    int v157 = [v156 isEqualToString:HFAccessorySetupFlowTypeSiriEndpoint];

    if (!v157) {
      goto LABEL_40;
    }
    v158 = [*(id *)(a1 + 32) home];
    v18 = objc_msgSend(v158, "hf_siriEndpointCapableAccessoriesToOnboard");

    if ((unint64_t)[v18 count] < 2)
    {
      if ([v18 count] != 1)
      {
LABEL_76:
        id v188 = objc_alloc(MEMORY[0x1E4F692D0]);
        uint64_t v189 = *MEMORY[0x1E4F68670];
        v207[0] = *MEMORY[0x1E4F68678];
        v207[1] = v189;
        uint64_t v190 = *MEMORY[0x1E4F68660];
        v208[0] = *MEMORY[0x1E4F68668];
        v208[1] = v190;
        v191 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v208 forKeys:v207 count:2];
        v192 = (void *)[v188 initWithImageIdentifiersKeyedBySize:v191];
        [v4 setObject:v192 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

        goto LABEL_39;
      }
      v169 = [v18 firstObject];
      v170 = objc_msgSend(v169, "hf_serviceNameComponents");
      v171 = [v170 serviceName];
      v178 = HULocalizedStringWithFormat(@"HUSetupCellSiriEndpointSetup_Title_Single", @"%@", v172, v173, v174, v175, v176, v177, (uint64_t)v171);
      [v4 setObject:v178 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      [v4 setObject:@"Home.Banners.SetUp.Endpoint.SiriIsNowAvailable" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v4 setObject:@"HUSetupCellSiriEndpointSetup_Title_Single" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
      v167 = [v18 firstObject];
      v179 = objc_msgSend(v167, "hf_userFriendlyLocalizedLowercaseDescription");
      v186 = HULocalizedStringWithFormat(@"HUSetupCellSiriEndpointSetup_Details_Single", @"%@", v180, v181, v182, v183, v184, v185, (uint64_t)v179);
      [v4 setObject:v186 forKeyedSubscript:*MEMORY[0x1E4F68980]];

      v168 = @"HUSetupCellSiriEndpointSetup_ActionButtonTitle_Single";
    }
    else
    {
      v159 = _HULocalizedStringWithDefaultValue(@"HUSetupCellSiriEndpointSetup_Title_Multiple", @"HUSetupCellSiriEndpointSetup_Title_Multiple", 1);
      [v4 setObject:v159 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      [v4 setObject:@"Home.Banners.SetUp.Endpoint.AddSiriToAccesories" forKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v4 setObject:@"HUSetupCellSiriEndpointSetup_Title_Multiple" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
      uint64_t v160 = [v18 count];
      v167 = HULocalizedStringWithFormat(@"HUSetupCellSiriEndpointSetup_Details_Multiple", @"%lu", v161, v162, v163, v164, v165, v166, v160);
      [v4 setObject:v167 forKeyedSubscript:*MEMORY[0x1E4F68980]];
      v168 = @"HUSetupCellSiriEndpointSetup_ActionButtonTitle_Multiple";
    }

    v187 = _HULocalizedStringWithDefaultValue(v168, v168, 1);
    [v4 setObject:v187 forKeyedSubscript:*MEMORY[0x1E4F68948]];

    goto LABEL_76;
  }
  int v47 = 1;
  v48 = _HULocalizedStringWithDefaultValue(@"HUSetupCellLockFeatures_Title", @"HUSetupCellLockFeatures_Title", 1);
  [v4 setObject:v48 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v4 setObject:@"Home.Banners.SetUp.Lock.NewFeatures" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  [v4 setObject:@"HUSetupCellLockFeatures_Title" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  v49 = _HULocalizedStringWithDefaultValue(@"HUSetupCellLockFeatures_Details_All", @"HUSetupCellLockFeatures_Details_All", 1);
  [v4 setObject:v49 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  v50 = _HULocalizedStringWithDefaultValue(@"HUSetupCellSetUp", @"HUSetupCellSetUp", 1);
  [v4 setObject:v50 forKeyedSubscript:*MEMORY[0x1E4F68948]];

  v51 = [*(id *)(a1 + 48) home];
  v52 = objc_msgSend(v51, "hf_walletKeyAccessories");
  v53 = v52;
  v54 = &__block_literal_global_176;
LABEL_33:
  int v73 = objc_msgSend(v52, "na_any:", v54);

  uint64_t v55 = v73 ^ 1u;
LABEL_41:

  uint64_t v56 = 0;
LABEL_42:
  v82 = [MEMORY[0x1E4F1CA80] set];
  v83 = [MEMORY[0x1E4F1CA80] set];
  v84 = [*(id *)(a1 + 32) home];
  v85 = objc_msgSend(v84, "hf_homePods");

  [v82 addObjectsFromArray:v85];
  v86 = [*(id *)(a1 + 32) home];
  [v82 addObject:v86];

  v87 = [*(id *)(a1 + 32) home];
  v88 = [v87 currentUser];
  [v82 addObject:v88];

  v196[0] = objc_opt_class();
  v196[1] = objc_opt_class();
  v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:2];
  [v83 addObjectsFromArray:v89];

  [v83 addObject:objc_opt_class()];
  [v83 addObject:objc_opt_class()];
  [v4 setObject:v82 forKeyedSubscript:*MEMORY[0x1E4F68908]];
  [v4 setObject:v83 forKeyedSubscript:*MEMORY[0x1E4F68900]];
  v90 = [NSNumber numberWithBool:v56];
  [v4 setObject:v90 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  v91 = [*(id *)(a1 + 32) _possibleDependentKeyPaths];
  [v4 setObject:v91 forKeyedSubscript:*MEMORY[0x1E4F68BF0]];

  v92 = [*(id *)(a1 + 48) homekitObjectIdentifiers];
  [v4 setObject:v92 forKeyedSubscript:*MEMORY[0x1E4F68BF8]];

  [v4 setObject:&unk_1F19B49E8 forKeyedSubscript:@"bannerItemCategory"];
  if (v47)
  {
    v93 = (void *)MEMORY[0x1E4F69770];
    v94 = [*(id *)(a1 + 48) home];
    v95 = [v93 walletKeyIconDescriptorForHome:v94 shouldUseKeyholeAsset:v55 foriPhoneDevice:1];
    v194[0] = MEMORY[0x1E4F143A8];
    v194[1] = 3221225472;
    v194[2] = __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke_226;
    v194[3] = &unk_1E638DDD0;
    id v195 = v4;
    v96 = [v95 flatMap:v194];
  }
  else
  {
    v96 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];
  }

  return v96;
}

- (id)_determineRequiredLockAccessorySetupReminders:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F68ED0] sharedHandler];
  int v6 = [v5 isAccessorySetupActive];

  if (v6)
  {
LABEL_6:
    uint64_t v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CBF0]];
    goto LABEL_13;
  }
  if ([MEMORY[0x1E4F69758] isAVisionPro])
  {
    v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = self;
      __int16 v31 = 2080;
      uint64_t v32 = "-[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:]";
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Not showing any lock related banners because the device is vision.", buf, 0x16u);
    }

    goto LABEL_6;
  }
  v9 = [v4 home];
  int v10 = [MEMORY[0x1E4F69758] isAnIPhone];
  v11 = objc_msgSend(v9, "hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary");
  v12 = objc_msgSend(v9, "hf_walletKeyAccessories");
  uint64_t v13 = [v12 count];

  if (v13 && v10 && ([v11 isFinished] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    int v14 = objc_opt_new();
    v15 = [v4 hasDismissedWalletKeyExpressModeOnboardingOnThisDevice];
    objc_msgSend(v14, "na_safeAddObject:", v15);
    objc_msgSend(v14, "na_safeAddObject:", v11);
    v16 = (void *)MEMORY[0x1E4F7A0D8];
    id v17 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    v18 = [v16 combineAllFutures:v14 ignoringErrors:1 scheduler:v17];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __67__HUSetupBannerItem__determineRequiredLockAccessorySetupReminders___block_invoke;
    v22[3] = &unk_1E638DEC0;
    id v23 = v9;
    id v24 = v14;
    id v25 = v15;
    id v26 = v11;
    id v27 = v4;
    char v28 = v10;
    id v19 = v15;
    id v20 = v14;
    uint64_t v8 = [v18 flatMap:v22];
  }
LABEL_13:

  return v8;
}

id __67__HUSetupBannerItem__determineRequiredLockAccessorySetupReminders___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v65 = [*(id *)(a1 + 32) dismissedWalletKeyUWBUnlockOnboarding];
  uint64_t v4 = [*(id *)(a1 + 40) indexOfObject:*(void *)(a1 + 48)];
  objc_opt_class();
  uint64_t v5 = [v3 objectAtIndex:v4];
  if (objc_opt_isKindOfClass()) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  id v68 = v6;

  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v3 objectAtIndex:v4];
    *(_DWORD *)buf = 136316418;
    v85 = "-[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:]_block_invoke";
    __int16 v86 = 2048;
    *(void *)v87 = v4;
    *(_WORD *)&v87[8] = 1024;
    *(_DWORD *)v88 = v8 == 0;
    *(_WORD *)&v88[4] = 1024;
    *(_DWORD *)&v88[6] = v68 == 0;
    *(_WORD *)&v88[10] = 2112;
    *(void *)&v88[12] = v3;
    *(_WORD *)&v88[20] = 2048;
    *(void *)&v88[22] = [v3 count];
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "(%s) expressModeIndex = %lu | result[index] == nil : %{BOOL}d | isNSNumber = %{BOOL}d | result = %@ (count = %ld)", buf, 0x36u);
  }
  char v64 = [v68 BOOLValue];
  uint64_t v9 = [*(id *)(a1 + 40) indexOfObject:*(void *)(a1 + 56)];
  objc_opt_class();
  int v10 = [v3 objectAtIndex:v9];
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  uint64_t v13 = HFLogForCategory();
  int v69 = v12;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [v12 walletKey];
    v15 = [v12 walletKey];
    int v16 = [v15 isExpressEnabled];
    uint64_t v17 = [v3 count];
    *(_DWORD *)buf = 136316418;
    v85 = "-[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:]_block_invoke";
    __int16 v86 = 1024;
    *(_DWORD *)v87 = v12 == 0;
    *(_WORD *)&v87[4] = 1024;
    *(_DWORD *)&v87[6] = v14 == 0;
    *(_WORD *)v88 = 1024;
    *(_DWORD *)&v88[2] = v16;
    *(_WORD *)&v88[6] = 2112;
    *(void *)&v88[8] = v3;
    *(_WORD *)&v88[16] = 2048;
    *(void *)&v88[18] = v17;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "(%s) walletKeyDeviceState == nil: %{BOOL}d | walletKeyDeviceState.walletKey == nil: %{BOOL}d | expressEnabled = %{BOOL}d | result = %@ (count %ld)", buf, 0x32u);
  }
  v18 = [v12 walletKey];
  if (v18)
  {
    id v19 = [v12 walletKey];
    if ([v19 isUWBUnlockEnabled]) {
      int v20 = 1;
    }
    else {
      int v20 = objc_msgSend(*(id *)(a1 + 32), "hf_containsWalletKeyUWBAccessory") ^ 1;
    }
  }
  else
  {
    int v20 = 1;
  }

  int v21 = _os_feature_enabled_impl() ^ 1 | v20;
  v22 = HFLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    if (v21) {
      id v23 = @"YES";
    }
    else {
      id v23 = @"NO";
    }
    id v24 = [*(id *)(a1 + 32) name];
    id v25 = objc_msgSend(*(id *)(a1 + 32), "hf_accessoriesSupportingUWBUnlock");
    *(_DWORD *)buf = 136316162;
    v85 = "-[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:]_block_invoke";
    __int16 v86 = 2112;
    *(void *)v87 = v23;
    id v12 = v69;
    *(_WORD *)&v87[8] = 2112;
    *(void *)v88 = v69;
    *(_WORD *)&v88[8] = 2112;
    *(void *)&v88[10] = v24;
    *(_WORD *)&v88[18] = 2112;
    *(void *)&v88[20] = v25;
    _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "(%s) shouldHideWalletKeyUWBBanner = %@. walletKeyDeviceState = %@. HMHome %@ has UWB supported accessories %@.", buf, 0x34u);
  }
  id v26 = [v12 walletKey];
  id v67 = v3;
  if (v26)
  {
    id v27 = [v12 walletKey];
    char v28 = [v27 isExpressEnabled];
  }
  else
  {
    char v28 = 1;
  }

  v29 = objc_msgSend(*(id *)(a1 + 32), "hf_accessoriesSupportingAccessCodes");
  uint64_t v30 = [v29 count];

  __int16 v31 = *(void **)(a1 + 32);
  uint64_t v32 = [*(id *)(a1 + 64) user];
  int v33 = objc_msgSend(v31, "hf_userIsAdministrator:", v32);

  v34 = *(void **)(a1 + 32);
  v35 = [*(id *)(a1 + 64) user];
  int v36 = objc_msgSend(v34, "hf_userIsOwner:", v35);

  char v63 = v21;
  if (!v30)
  {
    int v37 = 0;
LABEL_35:
    int v38 = 0;
    goto LABEL_36;
  }
  if (v33)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingAccessCodes") & 1) == 0 && (v36 & 1) == 0) {
      goto LABEL_29;
    }
LABEL_32:
    int v37 = [*(id *)(a1 + 32) hasOnboardedForAccessCode] ^ 1;
    goto LABEL_33;
  }
  if (v36) {
    goto LABEL_32;
  }
LABEL_29:
  int v37 = 0;
LABEL_33:
  if (![*(id *)(a1 + 32) hasOnboardedForAccessCode]
    || ([*(id *)(a1 + 64) hasDismissedAccessCodeOnboarding] & 1) != 0)
  {
    goto LABEL_35;
  }
  int v38 = objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingAccessCodes");
LABEL_36:
  id v39 = HFLogForCategory();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v61 = v30 != 0;
    char v62 = v28;
    uint64_t v40 = *(void **)(a1 + 32);
    uint64_t v41 = *(void *)(a1 + 64);
    int v42 = [v40 hasOnboardedForAccessCode];
    int v43 = [*(id *)(a1 + 64) hasDismissedAccessCodeOnboarding];
    int v44 = objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingAccessCodes");
    *(_DWORD *)buf = 136317186;
    v85 = "-[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:]_block_invoke";
    __int16 v86 = 1024;
    *(_DWORD *)v87 = v37;
    *(_WORD *)&v87[4] = 1024;
    *(_DWORD *)&v87[6] = v38;
    *(_WORD *)v88 = 2112;
    *(void *)&v88[2] = v40;
    *(_WORD *)&v88[10] = 2112;
    *(void *)&v88[12] = v41;
    *(_WORD *)&v88[20] = 1024;
    char v28 = v62;
    *(_DWORD *)&v88[22] = v61;
    *(_WORD *)&v88[26] = 1024;
    *(_DWORD *)&v88[28] = v42;
    __int16 v89 = 1024;
    int v90 = v43;
    __int16 v91 = 1024;
    int v92 = v44;
    _os_log_impl(&dword_1BE345000, v39, OS_LOG_TYPE_DEFAULT, "(%s) needsPinCodeFirmwareUpgradeSetup=%{BOOL}d | needsPinCodeUserOnboardingSetup=%{BOOL}d                for home %@ user %@ | eligibleForPinCodeSetup=%{BOOL}d | homeHasOnboarded=%{BOOL}d | userHasPreviouslyDismissed=%{BOOL}d | hasHomeHubSupportingAccessCodes=%{BOOL}d", buf, 0x44u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__HUSetupBannerItem__determineRequiredLockAccessorySetupReminders___block_invoke_253;
  aBlock[3] = &unk_1E638DE70;
  char v75 = v33;
  id v73 = *(id *)(a1 + 32);
  char v76 = v36;
  char v77 = v65;
  char v78 = v63;
  char v79 = v64;
  char v80 = v28;
  char v81 = v37;
  char v82 = v38;
  id v74 = *(id *)(a1 + 64);
  char v83 = *(unsigned char *)(a1 + 72);
  v45 = _Block_copy(aBlock);
  int v46 = objc_msgSend(*(id *)(a1 + 32), "hf_walletKeyAccessories");
  if ([v46 count]) {
    BOOL v47 = *(unsigned char *)(a1 + 72) != 0;
  }
  else {
    BOOL v47 = 0;
  }
  v48 = v67;

  v49 = HFLogForCategory();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v50 = *(void **)(a1 + 32);
    v51 = [v50 currentUser];
    v52 = objc_msgSend(v51, "hf_prettyDescription");
    v53 = objc_msgSend(*(id *)(a1 + 32), "hf_walletKeyAccessories");
    uint64_t v54 = [v53 count];
    BOOL v66 = v47;
    uint64_t v55 = (void *)MEMORY[0x1E4F2E4F8];
    uint64_t v56 = objc_msgSend(*(id *)(a1 + 32), "hf_walletKeyAccessories");
    v57 = objc_msgSend(v55, "hf_minimumDescriptionsOfAccessories:", v56);
    *(_DWORD *)buf = 136316162;
    v85 = "-[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:]_block_invoke";
    __int16 v86 = 2112;
    *(void *)v87 = v50;
    *(_WORD *)&v87[8] = 2112;
    *(void *)v88 = v52;
    *(_WORD *)&v88[8] = 2048;
    *(void *)&v88[10] = v54;
    *(_WORD *)&v88[18] = 2112;
    *(void *)&v88[20] = v57;
    _os_log_impl(&dword_1BE345000, v49, OS_LOG_TYPE_DEFAULT, "(%s) home %@ | user %@ | hf_walletKeyAccessories.count = %ld | walletKeyAccessories = %@", buf, 0x34u);

    v48 = v67;
    BOOL v47 = v66;
  }

  if (v47)
  {
    v58 = objc_msgSend(*(id *)(a1 + 32), "hf_hasWalletKeyCompatibleDevice");
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __67__HUSetupBannerItem__determineRequiredLockAccessorySetupReminders___block_invoke_261;
    v70[3] = &unk_1E638DE98;
    id v71 = v45;
    v59 = [v58 flatMap:v70];
  }
  else
  {
    v59 = (*((void (**)(void *, void, void))v45 + 2))(v45, 0, 0);
  }

  return v59;
}

id __67__HUSetupBannerItem__determineRequiredLockAccessorySetupReminders___block_invoke_253(uint64_t a1, int a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v41 = a3;
  if (a2)
  {
    if (*(unsigned char *)(a1 + 48) && (objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingWalletKey") & 1) != 0
      || *(unsigned char *)(a1 + 49))
    {
      int v5 = [*(id *)(a1 + 32) hasOnboardedForWalletKey] ^ 1;
    }
    else
    {
      int v5 = 0;
    }
    int v6 = MGGetBoolAnswer();
    if ([*(id *)(a1 + 32) hasOnboardedForWalletKey] && !*(unsigned char *)(a1 + 50))
    {
      int v7 = *(unsigned char *)(a1 + 51) ? 0 : v6;
      if (v7 == 1)
      {
        int v8 = _os_feature_enabled_impl();
        int v6 = 1;
        goto LABEL_16;
      }
    }
  }
  else
  {
    int v6 = MGGetBoolAnswer();
    int v5 = 0;
  }
  int v8 = 0;
LABEL_16:
  uint64_t v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [*(id *)(a1 + 32) hasOnboardedForWalletKey];
    int v11 = *(unsigned __int8 *)(a1 + 50);
    int v12 = *(unsigned __int8 *)(a1 + 51);
    *(_DWORD *)buf = 136316674;
    int v44 = "-[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:]_block_invoke";
    __int16 v45 = 1024;
    *(_DWORD *)int v46 = v8;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = a2;
    LOWORD(v47) = 1024;
    *(_DWORD *)((char *)&v47 + 2) = v10;
    HIWORD(v47) = 1024;
    *(_DWORD *)v48 = v11;
    *(_WORD *)&v48[4] = 1024;
    *(_DWORD *)&v48[6] = v12;
    __int16 v49 = 1024;
    LODWORD(v50) = v6;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "(%s) needsWalletKeyUWBUnlockUserOnboardingSetup = %{BOOL}d because isEligibleForWalletKeySetup = %{BOOL}d. home.hasOnboardedForWalletKey = %{BOOL}d. userHasDismissedWalletKeyUWBUnlockOnboarding = %{BOOL}d. shouldHideWalletKeyUWBBanner = %{BOOL}d. deviceSupportsUWB = %{BOOL}d", buf, 0x30u);
  }

  BOOL v13 = a2
     && [*(id *)(a1 + 32) hasOnboardedForWalletKey]
     && !*(unsigned char *)(a1 + 52)
     && *(unsigned char *)(a1 + 53) == 0;
  if (*(unsigned char *)(a1 + 54)) {
    char v14 = v5;
  }
  else {
    char v14 = 0;
  }
  if (v14)
  {
    v15 = &HFAccessorySetupFlowTypeLockAccessFirmwareUpdateAll;
LABEL_38:
    id v19 = *v15;
    goto LABEL_39;
  }
  BOOL v16 = *(unsigned char *)(a1 + 55) != 0;
  char v17 = v16 & (v8 | v13);
  if ((v16 & (v8 | v13)) != 0) {
    v15 = &HFAccessorySetupFlowTypeLockAccessAll;
  }
  else {
    v15 = &HFAccessorySetupFlowTypeLockAccessFirmwareUpdatePinCode;
  }
  if (*(unsigned char *)(a1 + 54) || (v17 & 1) != 0) {
    goto LABEL_38;
  }
  if (*(unsigned char *)(a1 + 55)) {
    char v18 = 1;
  }
  else {
    char v18 = v5;
  }
  v15 = &HFAccessorySetupFlowTypeLockAccessFirmwareUpdateWalletKey;
  if (*(unsigned char *)(a1 + 55)) {
    v15 = &HFAccessorySetupFlowTypeLockAccessPinCode;
  }
  if (v18) {
    goto LABEL_38;
  }
  if (v8)
  {
    int v35 = _os_feature_enabled_impl();
    v15 = &HFAccessorySetupFlowTypeLockAccessWalletKey;
    if (v35) {
      v15 = &HFAccessorySetupFlowTypeLockAccessWalletKeyUWB;
    }
    if ((v13 | v35)) {
      goto LABEL_38;
    }
  }
  else if (v13)
  {
    v15 = &HFAccessorySetupFlowTypeLockAccessWalletKey;
    goto LABEL_38;
  }
  id v19 = 0;
LABEL_39:
  int v20 = HFLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = [*(id *)(a1 + 32) name];
    [*(id *)(a1 + 32) uniqueIdentifier];
    v21 = uint64_t v40 = v19;
    id v39 = [*(id *)(a1 + 40) user];
    v22 = [v39 name];
    int v38 = [*(id *)(a1 + 40) user];
    id v23 = [v38 uniqueIdentifier];
    int v24 = [*(id *)(a1 + 32) hasOnboardedForWalletKey];
    int v25 = *(unsigned __int8 *)(a1 + 52);
    int v36 = *(unsigned __int8 *)(a1 + 56);
    int v26 = objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingWalletKey");
    int v27 = *(unsigned __int8 *)(a1 + 53);
    char v28 = &stru_1F18F92B8;
    *(_DWORD *)buf = 136318466;
    if (v41) {
      char v28 = v41;
    }
    int v44 = "-[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:]_block_invoke";
    __int16 v45 = 2112;
    *(void *)int v46 = v37;
    *(_WORD *)&v46[8] = 2112;
    BOOL v47 = v21;
    *(_WORD *)v48 = 2112;
    *(void *)&v48[2] = v22;
    __int16 v49 = 2112;
    v50 = v23;
    __int16 v51 = 1024;
    int v52 = v5;
    __int16 v53 = 1024;
    BOOL v54 = v13;
    __int16 v55 = 1024;
    int v56 = a2;
    __int16 v57 = 1024;
    int v58 = v24;
    __int16 v59 = 1024;
    int v60 = v25;
    __int16 v61 = 1024;
    int v62 = v36;
    __int16 v63 = 1024;
    int v64 = v26;
    __int16 v65 = 1024;
    int v66 = v27;
    __int16 v67 = 2112;
    id v68 = v28;
    _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "(%s) home <Name:%@, uniqueIdentifier:%@> | user <Name:%@, uniqueIdentifier:%@> | needsWalletKeyFirmwareUpgradeSetup=%{BOOL}d | needsWalletKeyExpressModeUserOnboardingSetup=%{BOOL}d | eligibleForWalletKeySetup=%{BOOL}d | homeHasOnboarded=%{BOOL}d | userHasDismissedWalletKeyExpressModeOnboarding=%{BOOL}d | is_iPhone=%{BOOL}d | hasHomeHubSupportingWalletKey=%{BOOL}d | shouldHideWalletKeyExpressModeBanner=%{BOOL}d | %@", buf, 0x6Eu);

    id v19 = v40;
  }

  v29 = (void *)MEMORY[0x1E4F7A0D8];
  if (v19)
  {
    uint64_t v30 = [HUAccessorySetupFlow alloc];
    __int16 v31 = [(HUAccessorySetupFlow *)v30 initWithType:v19 homeKitObjects:MEMORY[0x1E4F1CBF0]];
    int v42 = v31;
    uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
    int v33 = [v29 futureWithResult:v32];
  }
  else
  {
    int v33 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CBF0]];
  }

  return v33;
}

id __63__HUSetupBannerItem__determineRequiredAccessorySetupReminders___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) addObjectsFromArray:a2];
  id v3 = [*(id *)(a1 + 40) home];
  int v4 = objc_msgSend(v3, "hf_currentUserIsRestrictedGuest");

  if (v4)
  {
    int v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(void **)(a1 + 32);
      int v31 = 136315394;
      uint64_t v32 = "-[HUSetupBannerItem _determineRequiredAccessorySetupReminders:]_block_invoke";
      __int16 v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s) Current user is restricted guest. Only lock related banners should be displayed. accessorySetupFlows = %@", (uint8_t *)&v31, 0x16u);
    }

    int v7 = (void *)MEMORY[0x1E4F7A0D8];
    int v8 = (void *)[*(id *)(a1 + 32) copy];
    uint64_t v9 = [v7 futureWithResult:v8];
    goto LABEL_21;
  }
  int v10 = [*(id *)(a1 + 40) home];
  int v11 = [v10 accessories];
  int v8 = objc_msgSend(v11, "na_filter:", &__block_literal_global_243);

  int v12 = [*(id *)(a1 + 40) home];
  if (![(HUAccessorySetupFlow *)v12 hf_currentUserIsAdministrator]) {
    goto LABEL_8;
  }
  uint64_t v13 = [v8 count];

  if (v13)
  {
    char v14 = [HUAccessorySetupFlow alloc];
    int v12 = [(HUAccessorySetupFlow *)v14 initWithType:HFAccessorySetupFlowTypeResume homeKitObjects:v8];
    [*(id *)(a1 + 32) addObject:v12];
LABEL_8:
  }
  v15 = [*(id *)(a1 + 40) home];
  int v16 = [*(id *)(a1 + 40) hasDismissedAudioAnalysisOnboardingOnThisDevice];
  char v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    char v18 = *(const char **)(a1 + 48);
    id v19 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v31 = 138413314;
    uint64_t v32 = v18;
    __int16 v33 = 2112;
    v34 = v19;
    __int16 v35 = 1024;
    int v36 = objc_msgSend(v15, "hf_hasAtleastOneSafetyAndSecuritySupportedAccessory");
    __int16 v37 = 1024;
    int v38 = [v15 didOnboardAudioAnalysis];
    __int16 v39 = 1024;
    int v40 = v16;
    _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ Determing whether to show safety and security banner... hasAtleastOneSafetyAndSecuritySupportedAccessory=%{BOOL}d | didOnboardAudioAnalysis=%{BOOL}d | hasDismissedAudioAnalysisOnboardingOnThisDevice=%{BOOL}d", (uint8_t *)&v31, 0x28u);
  }
  if (objc_msgSend(v15, "hf_hasAtleastOneSafetyAndSecuritySupportedAccessory")
    && objc_msgSend(v15, "hf_currentUserIsAdministrator")
    && ([v15 didOnboardAudioAnalysis] | v16) != 1
    || HFForceSafetyAndSecurityOnboarding())
  {
    int v20 = objc_msgSend(v15, "hf_safetyAndSecuritySupportedAccessories");
    int v21 = [HUAccessorySetupFlow alloc];
    v22 = [(HUAccessorySetupFlow *)v21 initWithType:HFAccessorySetupFlowTypeSafetyAndSecurity homeKitObjects:v20];
    [*(id *)(a1 + 32) addObject:v22];
  }
  id v23 = objc_msgSend(v15, "hf_siriEndpointCapableAccessoriesToOnboard");
  int v24 = [MEMORY[0x1E4F68ED0] sharedHandler];
  int v25 = [v24 isAccessorySetupActive];

  if (([MEMORY[0x1E4F69758] isAMac] & 1) == 0
    && ((objc_msgSend(v15, "hf_currentUserIsAdministrator") ^ 1 | v25) & 1) == 0
    && [v23 count])
  {
    int v26 = [HUAccessorySetupFlow alloc];
    int v27 = [(HUAccessorySetupFlow *)v26 initWithType:HFAccessorySetupFlowTypeSiriEndpoint homeKitObjects:v23];
    [*(id *)(a1 + 32) addObject:v27];
  }
  char v28 = (void *)MEMORY[0x1E4F7A0D8];
  v29 = (void *)[*(id *)(a1 + 32) copy];
  uint64_t v9 = [v28 futureWithResult:v29];

LABEL_21:

  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  int v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    int v7 = (void *)MEMORY[0x1E4F7A0D8];
    int v8 = (void *)MEMORY[0x1E4F69228];
    uint64_t v9 = *MEMORY[0x1E4F68CA8];
    v22[0] = *MEMORY[0x1E4F68B10];
    v22[1] = v9;
    v23[0] = MEMORY[0x1E4F1CC38];
    v23[1] = MEMORY[0x1E4F1CC38];
    int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v11 = [v8 outcomeWithResults:v10];
    int v12 = [v7 futureWithResult:v11];
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F69710]);
    char v14 = [(HUBannerItem *)self home];
    v15 = [(HUBannerItem *)self home];
    int v16 = [v15 currentUser];
    char v17 = (void *)[v13 initWithHome:v14 user:v16 nameStyle:0];

    int v10 = [(HUSetupBannerItem *)self _determineRequiredAccessorySetupReminders:v17];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke;
    v19[3] = &unk_1E638D0F8;
    v19[4] = self;
    id v20 = v17;
    SEL v21 = a2;
    id v11 = v17;
    int v12 = [v10 flatMap:v19];
  }

  return v12;
}

- (id)_determineRequiredAccessorySetupReminders:(id)a3
{
  id v5 = a3;
  if ([MEMORY[0x1E4F69758] supportsAccessorySetup])
  {
    int v6 = [MEMORY[0x1E4F1CA48] array];
    int v7 = [(HUSetupBannerItem *)self _determineRequiredLockAccessorySetupReminders:v5];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__HUSetupBannerItem__determineRequiredAccessorySetupReminders___block_invoke;
    v13[3] = &unk_1E638DDF8;
    id v14 = v6;
    id v15 = v5;
    int v16 = self;
    SEL v17 = a2;
    id v8 = v6;
    uint64_t v9 = [v7 flatMap:v13];
  }
  else
  {
    int v10 = (void *)MEMORY[0x1E4F7A0D8];
    id v11 = objc_opt_new();
    uint64_t v9 = [v10 futureWithResult:v11];
  }

  return v9;
}

id __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) _determineRequiredOnboardingReminders:*(void *)(a1 + 40)];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke_2;
  v10[3] = &unk_1E638DDF8;
  v10[4] = *(void *)(a1 + 32);
  id v11 = v3;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v9;
  long long v12 = v9;
  id v6 = v3;
  int v7 = [v4 flatMap:v10];

  return v7;
}

- (id)_determineRequiredOnboardingReminders:(id)a3
{
  id v5 = a3;
  id v6 = [(HUBannerItem *)self home];
  int v7 = +[HUHomeFeatureOnboardingUtilities atLeastOneHomePodHasLanguageSettingsForHomeFuture:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke;
  v11[3] = &unk_1E638DE48;
  id v12 = v5;
  id v13 = self;
  SEL v14 = a2;
  id v8 = v5;
  long long v9 = [v7 flatMap:v11];

  return v9;
}

void __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = objc_opt_new();
  id v5 = [*(id *)(a1 + 32) home];
  if (objc_msgSend(v5, "hf_hasHomePods"))
  {
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) home];
    int v7 = objc_msgSend(v6, "hf_hasRMVCapableAppleTV");

    if (!v7) {
      goto LABEL_37;
    }
  }
  if ([*(id *)(a1 + 32) hasDismissedVoiceProfileOnboarding]
    && ([*(id *)(a1 + 32) hasDismissedIdentifyVoiceReminderBanner] & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 32) home];
    if (!objc_msgSend(v8, "hf_hasRMVCapableAppleTV"))
    {
      long long v9 = [*(id *)(a1 + 32) home];
      if (objc_msgSend(v9, "hf_hasHomePods"))
      {
        uint64_t v10 = *(void *)(a1 + 40);

        if (!v10)
        {
          id v11 = HFLogForCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = *(void **)(a1 + 48);
            id v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
            int v36 = 138412546;
            __int16 v37 = v12;
            __int16 v38 = 2112;
            __int16 v39 = v13;
            _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Supressing reminder banner for Voice ID until language settings sync", (uint8_t *)&v36, 0x16u);
          }
          int v14 = 0;
LABEL_15:
          id v15 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
          int v16 = HFLogForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            SEL v17 = *(void **)(a1 + 48);
            char v18 = NSStringFromSelector(*(SEL *)(a1 + 56));
            uint64_t v19 = [v15 count];
            int v36 = 138413058;
            __int16 v37 = v17;
            __int16 v38 = 2112;
            __int16 v39 = v18;
            __int16 v40 = 2048;
            uint64_t v41 = v19;
            __int16 v42 = 2112;
            int v43 = v15;
            _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ (%lu) supported voice recognition languages %@", (uint8_t *)&v36, 0x2Au);
          }
          if (!v15)
          {
            id v20 = HFLogForCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              __int16 v35 = NSStringFromSelector(*(SEL *)(a1 + 56));
              int v36 = 138412290;
              __int16 v37 = v35;
              _os_log_error_impl(&dword_1BE345000, v20, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", (uint8_t *)&v36, 0xCu);
            }
            int v14 = 0;
          }
          SEL v21 = [*(id *)(a1 + 32) home];
          if ((objc_msgSend(v21, "hf_hasRMVCapableAppleTV") & 1) == 0)
          {
            v22 = [*(id *)(a1 + 32) home];
            if (objc_msgSend(v22, "hf_hasHomePods"))
            {
              id v23 = [*(id *)(a1 + 32) home];
              BOOL v24 = +[HUHomeFeatureOnboardingUtilities home:v23 hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:v15];

              if (!v24)
              {
                int v25 = HFLogForCategory();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  int v26 = *(void **)(a1 + 48);
                  int v27 = NSStringFromSelector(*(SEL *)(a1 + 56));
                  int v36 = 138412546;
                  __int16 v37 = v26;
                  __int16 v38 = 2112;
                  __int16 v39 = v27;
                  _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@ Supressing reminder banner for Voice ID because no HomePods in this home are on a supported language.", (uint8_t *)&v36, 0x16u);
                }
                if (![*(id *)(a1 + 32) isIdentifyVoiceEnabled]) {
                  goto LABEL_36;
                }
                goto LABEL_31;
              }
LABEL_30:
              if (([*(id *)(a1 + 32) isIdentifyVoiceEnabled] & 1) == 0)
              {
                if (v14) {
                  [v4 addObject:*MEMORY[0x1E4F684B8]];
                }
                goto LABEL_36;
              }
LABEL_31:
              char v28 = HFLogForCategory();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                v34 = NSStringFromSelector(*(SEL *)(a1 + 56));
                int v36 = 138412290;
                __int16 v37 = v34;
                _os_log_error_impl(&dword_1BE345000, v28, OS_LOG_TYPE_ERROR, "%@ Voice Rec is on but Reminder Banner has not been marked dismissed (This shouldn't happen, likey radar://58773131). Fixing.", (uint8_t *)&v36, 0xCu);
              }
              id v29 = (id)[*(id *)(a1 + 32) setDismissIdentifyVoiceReminderBanner:1];
LABEL_36:

              goto LABEL_37;
            }
          }
          goto LABEL_30;
        }
LABEL_14:
        int v14 = 1;
        goto LABEL_15;
      }
    }
    goto LABEL_14;
  }
LABEL_37:
  uint64_t v30 = [*(id *)(a1 + 32) home];
  int v31 = objc_msgSend(v30, "hf_hasAppleTVs");

  if (v31
    && [*(id *)(a1 + 32) hasDismissedTVViewingProfilesOnboarding]
    && ([*(id *)(a1 + 32) hasDismissedTVViewingProfilesReminderBanner] & 1) == 0)
  {
    [v4 addObject:*MEMORY[0x1E4F684D8]];
  }
  uint64_t v32 = [*(id *)(a1 + 32) home];
  int v33 = objc_msgSend(v32, "hf_hasSecureRecordingCameras");

  if (v33
    && [*(id *)(a1 + 32) hasDismissedCameraRecordingOnboarding]
    && ([*(id *)(a1 + 32) hasDismissedCameraRecordingReminderBanner] & 1) == 0)
  {
    [v4 addObject:*MEMORY[0x1E4F68498]];
  }
  [v3 finishWithResult:v4];
}

id __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1E4F7A0D8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_2;
  v14[3] = &unk_1E638D120;
  id v15 = *(id *)(a1 + 32);
  id v16 = v3;
  long long v17 = *(_OWORD *)(a1 + 40);
  id v5 = v3;
  id v6 = [v4 futureWithBlock:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_232;
  v12[3] = &unk_1E638DE20;
  id v13 = *(id *)(a1 + 32);
  int v7 = [v6 flatMap:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_3;
  v10[3] = &unk_1E638DE20;
  id v11 = *(id *)(a1 + 32);
  id v8 = [v7 flatMap:v10];

  return v8;
}

id __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) home];
  id v5 = +[HUUtilityOnboardingFlow needsOnboardingForHome:v4 options:MEMORY[0x1E4F1CC08]];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_4;
  v9[3] = &unk_1E6385648;
  id v10 = v3;
  id v6 = v3;
  int v7 = [v5 flatMap:v9];

  return v7;
}

id __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_232(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v12 = @"OnboardingDisplayOption_OnboardingFromUserInput";
  v13[0] = MEMORY[0x1E4F1CC38];
  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v5 = [*(id *)(a1 + 32) home];
  id v6 = +[HUNaturalLightingOnboardingFlow needsOnboardingForHome:v5 options:v4];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_2_234;
  v10[3] = &unk_1E6385648;
  id v11 = v3;
  id v7 = v3;
  id v8 = [v6 flatMap:v10];

  return v8;
}

uint64_t __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke_54(uint64_t a1, void *a2)
{
  return [a2 supportsAccessCodes];
}

uint64_t __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke_2_65(uint64_t a1, void *a2)
{
  return [a2 supportsAccessCodes];
}

uint64_t __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke_226(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) safeSetObject:a2 forKey:*MEMORY[0x1E4F689E8]];
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v4 = *(void *)(a1 + 32);

  return [v3 futureWithResult:v4];
}

id __67__HUSetupBannerItem__determineRequiredLockAccessorySetupReminders___block_invoke_261(uint64_t a1, void *a2)
{
  id v3 = NSString;
  id v4 = a2;
  id v5 = objc_msgSend(v3, "stringWithFormat:", @" | hasWalletKeyCompatible iPhone or paired watch = %{BOOL}d", objc_msgSend(v4, "BOOLValue"));
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [v4 BOOLValue];

  id v8 = (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v5);

  return v8;
}

- (id)_namesOfAccessoriesNeedingNaturalLightingOnboarding
{
  id v3 = [(HUBannerItem *)self home];
  id v4 = objc_msgSend(v3, "hf_allLightProfilesSupportingNaturalLighting");
  id v5 = objc_msgSend(v4, "na_flatMap:", &__block_literal_global_268);

  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__HUSetupBannerItem__namesOfAccessoriesNeedingNaturalLightingOnboarding__block_invoke_2;
  v11[3] = &unk_1E6388C70;
  void v11[4] = self;
  uint64_t v7 = objc_msgSend(v6, "na_map:", v11);

  id v8 = [v7 allObjects];
  long long v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_272);

  return v9;
}

uint64_t __72__HUSetupBannerItem__namesOfAccessoriesNeedingNaturalLightingOnboarding__block_invoke(uint64_t a1, void *a2)
{
  return [a2 services];
}

id __72__HUSetupBannerItem__namesOfAccessoriesNeedingNaturalLightingOnboarding__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 accessory];
  int v5 = objc_msgSend(v4, "hf_showAsAccessoryTile");

  if (v5)
  {
    id v6 = [v3 accessory];
  }
  else
  {
    if (objc_msgSend(v3, "hf_isInGroup"))
    {
      uint64_t v7 = [*(id *)(a1 + 32) home];
      id v8 = objc_msgSend(v7, "hf_serviceGroupsForService:", v3);
      long long v9 = [v8 firstObject];

      goto LABEL_7;
    }
    id v6 = v3;
  }
  long long v9 = v6;
LABEL_7:

  return v9;
}

uint64_t __72__HUSetupBannerItem__namesOfAccessoriesNeedingNaturalLightingOnboarding__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_displayName");
}

@end