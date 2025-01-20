@interface HMHome(HFUserNotificationTopics)
+ (id)_hf_groupedServiceTypeTopics;
+ (id)_hf_standaloneTopicNameLocalizationKeyForPrimaryServiceType:()HFUserNotificationTopics;
- (id)_hf_accessoryTopics:()HFUserNotificationTopics;
- (id)hf_allObjectsAffectedByServiceTopic:()HFUserNotificationTopics;
- (id)hf_applianceAccessories;
- (id)hf_cameraProfilesAffectedByServiceTopic:()HFUserNotificationTopics;
- (id)hf_safetyAndSecurityAccessoriesAffectedByServiceTopic:()HFUserNotificationTopics;
- (id)hf_servicesAffectedByServiceTopic:()HFUserNotificationTopics;
- (id)hf_userNotificationServiceTopics;
- (id)hf_userNotificationTopicForCameraProfile:()HFUserNotificationTopics;
- (id)hf_userNotificationTopicForObject:()HFUserNotificationTopics;
- (id)hf_userNotificationTopicForService:()HFUserNotificationTopics;
- (id)hf_vacuumAccessoriesAffectedByServiceTopic:()HFUserNotificationTopics;
@end

@implementation HMHome(HFUserNotificationTopics)

+ (id)_hf_groupedServiceTypeTopics
{
  if (qword_26AB2F520 != -1) {
    dispatch_once(&qword_26AB2F520, &__block_literal_global_213);
  }
  v0 = (void *)qword_26AB2F528;
  return v0;
}

+ (id)_hf_standaloneTopicNameLocalizationKeyForPrimaryServiceType:()HFUserNotificationTopics
{
  id v3 = a3;
  if (qword_26AB2F570 != -1) {
    dispatch_once(&qword_26AB2F570, &__block_literal_global_254_0);
  }
  id v4 = (id)qword_26AB2F578;
  v5 = [v4 objectForKeyedSubscript:v3];

  v6 = [NSString stringWithFormat:@"HFUserNotificationServiceTopicName_%@", v5];

  return v6;
}

- (id)_hf_accessoryTopics:()HFUserNotificationTopics
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v5 = objc_opt_new();
  if (a3)
  {
    v6 = [a1 accessories];
    int v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_264);

    if (v7)
    {
      v8 = +[HFUserNotificationServiceTopic _cameraTopic];
      objc_msgSend(v5, "na_safeAddObject:", v8);
    }
    v9 = objc_msgSend(a1, "hf_applianceAccessories");
    char v10 = objc_msgSend(v9, "hmf_isEmpty");

    if (_os_feature_enabled_impl())
    {
      if (v10) {
        goto LABEL_12;
      }
LABEL_11:
      v12 = +[HFUserNotificationServiceTopic _applianceTopic];
      objc_msgSend(v5, "na_safeAddObject:", v12);

      goto LABEL_12;
    }
    if (HM_FEATURE_RVC_DEFAULTS_ENABLED()) {
      char v11 = v10;
    }
    else {
      char v11 = 1;
    }
    if ((v11 & 1) == 0) {
      goto LABEL_11;
    }
  }
LABEL_12:
  if (objc_msgSend(a1, "hf_shouldShowAnnounceFeatureForThisHome"))
  {
    v13 = +[HFUserNotificationServiceTopic _announceTopic];
    objc_msgSend(v5, "na_safeAddObject:", v13);
  }
  v14 = +[HFHomeKitDispatcher sharedDispatcher];
  v15 = [v14 homeManager];
  int v16 = [v15 hasOptedToHH2];

  v17 = HFLogForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = objc_msgSend(a1, "hf_canUpdateToHH2");
    int v19 = objc_msgSend(a1, "hf_hasHomePods");
    int v20 = objc_msgSend(a1, "hf_hasAtleastOneSafetyAndSecuritySupportedAccessory");
    v21 = +[HFHomeKitDispatcher sharedDispatcher];
    v22 = [v21 homeManager];
    int v27 = 138413570;
    v28 = a1;
    __int16 v29 = 1024;
    int v30 = v18;
    __int16 v31 = 1024;
    int v32 = v16;
    __int16 v33 = 1024;
    int v34 = v19;
    __int16 v35 = 1024;
    int v36 = v20;
    __int16 v37 = 1024;
    int v38 = [v22 homeSafetySecurityEnabled];
    _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "Home:%@ canUpdateToHH2:%{BOOL}d hasOptedToHH2:%{BOOL}d hasHomePods:%{BOOL}d hasAtleastOneSafetyAndSecuritySupportedAccessory = %{BOOL}d, homeSafetySecurityEnabled = %{BOOL}d ", (uint8_t *)&v27, 0x2Au);
  }
  if (objc_msgSend(a1, "hf_hasHomePods") && objc_msgSend(a1, "hf_canUpdateToHH2"))
  {
    int v23 = objc_msgSend(a1, "hf_canEnableAudioAnalysisAfterHH2Upgrade");
    if (!v16) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  int v23 = 0;
  if (v16) {
LABEL_21:
  }
    int v16 = objc_msgSend(a1, "hf_hasAtleastOneAudioAnalysisSupportedAccessory");
LABEL_22:
  int v24 = objc_msgSend(a1, "hf_shouldShowActivityLogSetting");
  if (((v23 | v16) & 1) != 0 || v24)
  {
    v25 = +[HFUserNotificationServiceTopic _safetyAndSecurityTopic];
    objc_msgSend(v5, "na_safeAddObject:", v25);
  }
  return v5;
}

- (id)hf_userNotificationServiceTopics
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 homeManager];
  int v5 = [v4 hasOptedToHH2];

  if (v5)
  {
    v6 = [a1 residentDevices];
    BOOL v7 = [v6 count] != 0;
  }
  else
  {
    BOOL v7 = 1;
  }
  v8 = HFLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v30 = "-[HMHome(HFUserNotificationTopics) hf_userNotificationServiceTopics]";
    __int16 v31 = 1024;
    int v32 = v5;
    __int16 v33 = 1024;
    BOOL v34 = v7;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%s hasOptedToHH2 = %{BOOL}d, shouldShowNotificationsItem = %{BOOL}d ", buf, 0x18u);
  }

  if (v7)
  {
    v9 = [a1 accessories];
    char v10 = objc_msgSend(v9, "na_flatMap:", &__block_literal_global_270_0);
    char v11 = objc_msgSend(v10, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_276);

    v12 = objc_msgSend((id)objc_opt_class(), "_hf_groupedServiceTypeTopics");
    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __68__HMHome_HFUserNotificationTopics__hf_userNotificationServiceTopics__block_invoke_4;
    v26 = &unk_2640979C8;
    id v27 = v12;
    v28 = a1;
    id v14 = v12;
    v15 = objc_msgSend(v11, "na_dictionaryByMappingValues:", &v23);
    int v16 = objc_msgSend(v15, "allValues", v23, v24, v25, v26);
    v17 = [v13 setWithArray:v16];

    int v18 = [v17 allObjects];
    [v2 addObjectsFromArray:v18];
  }
  int v19 = objc_msgSend(a1, "_hf_accessoryTopics:", v7);
  [v2 addObjectsFromArray:v19];

  int v20 = objc_msgSend(a1, "hf_energyManager");
  LODWORD(v19) = [v20 effectiveGridForecastAvailable];

  if (v19)
  {
    v21 = +[HFUserNotificationServiceTopic _energyTopic];
    objc_msgSend(v2, "na_safeAddObject:", v21);
  }
  return v2;
}

- (id)hf_userNotificationTopicForService:()HFUserNotificationTopics
{
  id v4 = a3;
  int v5 = objc_msgSend(v4, "hf_userNotificationSettings");

  if (v5)
  {
    v6 = objc_msgSend(a1, "hf_userNotificationServiceTopics");
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __71__HMHome_HFUserNotificationTopics__hf_userNotificationTopicForService___block_invoke;
    v9[3] = &unk_2640979A0;
    id v10 = v4;
    BOOL v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", v9);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)hf_userNotificationTopicForCameraProfile:()HFUserNotificationTopics
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hf_userNotificationSettings");
  if (v5
    && (v6 = (void *)v5,
        [v4 accessory],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = objc_msgSend(v7, "hf_isNotificationSupportedCamera"),
        v7,
        v6,
        v8))
  {
    v9 = [v4 accessory];
    id v10 = [v9 category];
    char v11 = [v10 categoryType];

    v12 = objc_msgSend(a1, "hf_userNotificationServiceTopics");
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __77__HMHome_HFUserNotificationTopics__hf_userNotificationTopicForCameraProfile___block_invoke;
    v16[3] = &unk_2640979A0;
    id v17 = v11;
    id v13 = v11;
    id v14 = objc_msgSend(v12, "na_firstObjectPassingTest:", v16);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)hf_userNotificationTopicForObject:()HFUserNotificationTopics
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    int v8 = objc_msgSend(a1, "hf_userNotificationTopicForService:", v7);
  }
  else
  {
    objc_opt_class();
    id v9 = v5;
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      int v8 = objc_msgSend(a1, "hf_userNotificationTopicForCameraProfile:", v11);
    }
    else
    {
      NSLog(&cfstr_UnexpectedObje.isa, v9);
      int v8 = 0;
    }
  }
  return v8;
}

- (id)hf_servicesAffectedByServiceTopic:()HFUserNotificationTopics
{
  id v4 = a3;
  id v5 = [a1 accessories];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__HMHome_HFUserNotificationTopics__hf_servicesAffectedByServiceTopic___block_invoke;
  v9[3] = &unk_264094DC0;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_flatMap:", v9);

  return v7;
}

- (id)hf_cameraProfilesAffectedByServiceTopic:()HFUserNotificationTopics
{
  id v4 = a3;
  id v5 = [a1 accessories];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__HMHome_HFUserNotificationTopics__hf_cameraProfilesAffectedByServiceTopic___block_invoke;
  v9[3] = &unk_264094DC0;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_flatMap:", v9);

  return v7;
}

- (id)hf_safetyAndSecurityAccessoriesAffectedByServiceTopic:()HFUserNotificationTopics
{
  id v4 = a3;
  id v5 = [a1 accessories];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __90__HMHome_HFUserNotificationTopics__hf_safetyAndSecurityAccessoriesAffectedByServiceTopic___block_invoke;
  v9[3] = &unk_26408D968;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_filter:", v9);

  return v7;
}

- (id)hf_vacuumAccessoriesAffectedByServiceTopic:()HFUserNotificationTopics
{
  id v4 = [a3 topicName];
  id v5 = _HFLocalizedStringWithDefaultValue(@"HFUserNotificationServiceTopicName_Appliances", @"HFUserNotificationServiceTopicName_Appliances", 1);

  if (v4 == v5)
  {
    id v6 = objc_msgSend(a1, "hf_applianceAccessories");
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }
  return v6;
}

- (id)hf_applianceAccessories
{
  if ((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED())
  {
    v2 = [a1 accessories];
    id v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_289_0);
  }
  else
  {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (id)hf_allObjectsAffectedByServiceTopic:()HFUserNotificationTopics
{
  v12[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(a1, "hf_servicesAffectedByServiceTopic:", v4);
  v12[0] = v5;
  id v6 = objc_msgSend(a1, "hf_cameraProfilesAffectedByServiceTopic:", v4);
  v12[1] = v6;
  id v7 = objc_msgSend(a1, "hf_safetyAndSecurityAccessoriesAffectedByServiceTopic:", v4);
  v12[2] = v7;
  int v8 = objc_msgSend(a1, "hf_vacuumAccessoriesAffectedByServiceTopic:", v4);

  v12[3] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];
  id v10 = objc_msgSend(v9, "na_arrayByFlattening");

  return v10;
}

@end