@interface HUHomeFeatureOnboarder
- (HMHome)home;
- (HUHomeFeatureOnboarder)initWithFeatures:(id)a3 home:(id)a4 devices:(id)a5 usageOptions:(id)a6;
- (HUHomeFeatureOnboarder)initWithFeatures:(id)a3 home:(id)a4 usageOptions:(id)a5;
- (HUHomeFeatureOnboarder)initWithGroupedFeatures:(id)a3 home:(id)a4 usageOptions:(id)a5;
- (NSSet)devices;
- (id)_subclass_buildAllFlowGroupsFromFeatureGroups:(id)a3 usageOptions:(id)a4;
- (id)getPostProcessingFlowsForResults:(id)a3;
- (void)setDevices:(id)a3;
- (void)setHome:(id)a3;
@end

@implementation HUHomeFeatureOnboarder

- (HUHomeFeatureOnboarder)initWithFeatures:(id)a3 home:(id)a4 devices:(id)a5 usageOptions:(id)a6
{
  objc_storeStrong((id *)&self->_devices, a5);
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObject:v14];

  v16 = [(HUHomeFeatureOnboarder *)self initWithGroupedFeatures:v15 home:v13 usageOptions:v12];
  return v16;
}

- (HUHomeFeatureOnboarder)initWithFeatures:(id)a3 home:(id)a4 usageOptions:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 arrayWithObject:a3];
  id v12 = [(HUHomeFeatureOnboarder *)self initWithGroupedFeatures:v11 home:v10 usageOptions:v9];

  return v12;
}

- (HUHomeFeatureOnboarder)initWithGroupedFeatures:(id)a3 home:(id)a4 usageOptions:(id)a5
{
  objc_storeStrong((id *)&self->_home, a4);
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUHomeFeatureOnboarder;
  id v12 = [(HUFeatureOnboarder *)&v14 initWithGroupedFeatures:v11 usageOptions:v10];

  return v12;
}

- (id)_subclass_buildAllFlowGroupsFromFeatureGroups:(id)a3 usageOptions:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if (![v8 count])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HUHomeFeatureOnboarder.m", 124, @"Invalid parameter not satisfying: %@", @"featureGroups.count != 0" object file lineNumber description];
  }
  id v9 = [MEMORY[0x1E4F1CA48] array];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__HUHomeFeatureOnboarder__subclass_buildAllFlowGroupsFromFeatureGroups_usageOptions___block_invoke;
  v16[3] = &unk_1E638C718;
  SEL v19 = a2;
  v16[4] = self;
  id v17 = v7;
  id v10 = v9;
  id v18 = v10;
  id v11 = v7;
  objc_msgSend(v8, "na_each:", v16);

  id v12 = v18;
  id v13 = v10;

  return v13;
}

void __85__HUHomeFeatureOnboarder__subclass_buildAllFlowGroupsFromFeatureGroups_usageOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 count])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"HUHomeFeatureOnboarder.m", 131, @"Invalid parameter not satisfying: %@", @"currentFeatureGroup.count != 0" object file lineNumber description];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__HUHomeFeatureOnboarder__subclass_buildAllFlowGroupsFromFeatureGroups_usageOptions___block_invoke_2;
  v9[3] = &unk_1E638C6F0;
  v4 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 56);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = objc_msgSend(v3, "na_map:", v9);
  [*(id *)(a1 + 48) addObject:v7];
}

HUHomeHubMigrationOnboardingFlow *__85__HUHomeFeatureOnboarder__subclass_buildAllFlowGroupsFromFeatureGroups_usageOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  switch([v3 unsignedIntegerValue])
  {
    case 0:
      v4 = [HUSwitchHomesWelcomeOnboardingFlow alloc];
      id v5 = [*(id *)(a1 + 32) home];
      uint64_t v6 = [(HUSwitchHomesWelcomeOnboardingFlow *)v4 initWithHome:v5];
      goto LABEL_17;
    case 1:
      id v8 = HULanguageSetupOnboardingFlow;
      goto LABEL_16;
    case 2:
      id v8 = HUVoiceProfileOnboardingFlow;
      goto LABEL_16;
    case 3:
      id v8 = HUPersonalRequestsOnboardingFlow;
      goto LABEL_16;
    case 4:
      id v8 = HUAnnounceOnboardingFlow;
      goto LABEL_16;
    case 5:
      id v8 = HUHomeTheaterOnboardingFlow;
      goto LABEL_16;
    case 6:
      id v8 = HUTVViewingProfilesOnboardingFlow;
      goto LABEL_16;
    case 7:
      id v8 = HUNaturalLightingOnboardingFlow;
      goto LABEL_16;
    case 8:
      id v8 = HUCameraRecordingOnboardingFlow;
      goto LABEL_16;
    case 9:
      id v8 = HUAccessoryFirmwareUpdateOnboardingFlow;
      goto LABEL_16;
    case 10:
      id v8 = HULocationServicesOnboardingFlow;
      goto LABEL_16;
    case 11:
      id v9 = [HUHomeHubMigrationOnboardingFlow alloc];
      uint64_t v10 = *(void *)(a1 + 40);
      id v5 = [*(id *)(a1 + 32) home];
      uint64_t v11 = [*(id *)(a1 + 32) devices];
      id v7 = [(HUHomeHubMigrationOnboardingFlow *)v9 initWithUsageOptions:v10 home:v5 devices:v11];

      break;
    case 12:
      id v8 = HUUtilityOnboardingFlow;
LABEL_16:
      id v12 = [v8 alloc];
      uint64_t v13 = *(void *)(a1 + 40);
      id v5 = [*(id *)(a1 + 32) home];
      uint64_t v6 = [v12 initWithUsageOptions:v13 home:v5];
LABEL_17:
      id v7 = (HUHomeHubMigrationOnboardingFlow *)v6;
      break;
    default:
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"HUHomeFeatureOnboarder.m", 194, @"Couldn't find a feature flow for %@", v3 object file lineNumber description];
      id v7 = 0;
      break;
  }

  return v7;
}

- (id)getPostProcessingFlowsForResults:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(HUHomeFeatureOnboarder *)self home];
  unint64_t v7 = +[HUHomeFeatureOnboardingUtilities home:v6 checkForOwnerUpgradeRequirementsFromResults:v5];

  if (HFForceOwnerMustUpgradeOnboarding())
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromSelector(a2);
      int v39 = 138412802;
      v40 = self;
      __int16 v41 = 2112;
      v42 = v9;
      __int16 v43 = 2048;
      unint64_t v44 = v7;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Forcing Owner Upgrade requirements %lu", (uint8_t *)&v39, 0x20u);
    }
    unint64_t v7 = 3;
  }
  else if (!v7)
  {
    id v12 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = NSStringFromSelector(a2);
    int v39 = 138412802;
    v40 = self;
    __int16 v41 = 2112;
    v42 = v11;
    __int16 v43 = 2048;
    unint64_t v44 = v7;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Owner Upgrade requirements %lu", (uint8_t *)&v39, 0x20u);
  }
  id v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v13 = [HUOwnerMustUpgradeOnboardingFlow alloc];
  objc_super v14 = [(HUHomeFeatureOnboarder *)self home];
  v15 = [(HUOwnerMustUpgradeOnboardingFlow *)v13 initWithUpgradeRequirements:v7 home:v14];
  objc_msgSend(v12, "na_safeAddObject:", v15);

LABEL_9:
  v16 = [(HUHomeFeatureOnboarder *)self home];
  unint64_t v17 = +[HUHomeFeatureOnboardingUtilities home:v16 checkForMultiUserDeviceUpgradeRequirements:v5];

  if (HKForceDevicesNeedUpgrade())
  {
    id v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      SEL v19 = NSStringFromSelector(a2);
      int v39 = 138412802;
      v40 = self;
      __int16 v41 = 2112;
      v42 = v19;
      __int16 v43 = 2048;
      unint64_t v44 = v17;
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ Forcing Multi User Device Upgrade requirements %lu", (uint8_t *)&v39, 0x20u);
    }
    unint64_t v17 = 3;
  }
  else if (!v17)
  {
    goto LABEL_19;
  }
  v20 = HFLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = NSStringFromSelector(a2);
    int v39 = 138412802;
    v40 = self;
    __int16 v41 = 2112;
    v42 = v21;
    __int16 v43 = 2048;
    unint64_t v44 = v17;
    _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "%@:%@ Upgrade Multi User Devices requirements %lu", (uint8_t *)&v39, 0x20u);
  }
  if (!v12)
  {
    id v12 = [MEMORY[0x1E4F1CA48] array];
  }
  v22 = [HUUpgradeMultiUserDevicesOnboardingFlow alloc];
  v23 = [(HUHomeFeatureOnboarder *)self home];
  v24 = [(HUUpgradeMultiUserDevicesOnboardingFlow *)v22 initWithUpgradeRequirements:v17 home:v23];
  objc_msgSend(v12, "na_safeAddObject:", v24);

LABEL_19:
  v25 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
  if (v25)
  {
    if (!+[HUHomeFeatureOnboardingUtilities hasUserSaidYesToVoiceIdentificationInResults:v5])goto LABEL_30; {
    if (!v12)
    }
    {
      id v12 = [MEMORY[0x1E4F1CA48] array];
    }
    v26 = [(HUHomeFeatureOnboarder *)self home];
    v27 = +[HUHomeFeatureOnboardingUtilities analyzeHomeAssistantDevicesForSupportedVoiceRecognitionLanguages:v25 home:v26];

    v28 = [v27 objectForKeyedSubscript:@"languageMismatch"];
    v29 = HFLogForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = NSStringFromSelector(a2);
      uint64_t v31 = [(HUHomeFeatureOnboarder *)v28 count];
      int v39 = 138412802;
      v40 = self;
      __int16 v41 = 2112;
      v42 = v30;
      __int16 v43 = 2048;
      unint64_t v44 = v31;
      _os_log_impl(&dword_1BE345000, v29, OS_LOG_TYPE_DEFAULT, "%@:%@ Found %lu HomePods with unsupported languages", (uint8_t *)&v39, 0x20u);
    }
    if ([(HUHomeFeatureOnboarder *)v28 count])
    {
      v32 = [HUHomeAssistantDevicesUnsupportedLanguageFlow alloc];
      v33 = [(HUHomeFeatureOnboarder *)self home];
      v34 = [(HUHomeAssistantDevicesUnsupportedLanguageFlow *)v32 initWithHomeAssistantDevicesHavingLanguageMismatch:v28 home:v33];
      objc_msgSend(v12, "na_safeAddObject:", v34);
    }
  }
  else
  {
    v27 = HFLogForCategory();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    NSStringFromSelector(a2);
    v28 = (HUHomeFeatureOnboarder *)objc_claimAutoreleasedReturnValue();
    int v39 = 138412290;
    v40 = v28;
    _os_log_error_impl(&dword_1BE345000, v27, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", (uint8_t *)&v39, 0xCu);
  }

LABEL_29:
LABEL_30:
  v35 = HFLogForCategory();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = NSStringFromSelector(a2);
    uint64_t v37 = [v12 count];
    int v39 = 138413058;
    v40 = self;
    __int16 v41 = 2112;
    v42 = v36;
    __int16 v43 = 2048;
    unint64_t v44 = v37;
    __int16 v45 = 2112;
    v46 = v12;
    _os_log_impl(&dword_1BE345000, v35, OS_LOG_TYPE_DEFAULT, "%@:%@ postProcessingFlowGroup has %lu flows: %@", (uint8_t *)&v39, 0x2Au);
  }

  return v12;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end