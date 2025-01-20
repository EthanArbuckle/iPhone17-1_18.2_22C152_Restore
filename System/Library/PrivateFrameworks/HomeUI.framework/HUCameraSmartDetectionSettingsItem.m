@interface HUCameraSmartDetectionSettingsItem
- (BOOL)_isHiddenForCurrentsignificantEventConfiguration:(id)a3;
- (HFCameraSignificantEventConfiguration)significantEventConfiguration;
- (HUCameraSmartDetectionSettingsItem)initWithSignificantEventConfiguration:(id)a3 cameraProfiles:(id)a4 settingsContext:(unint64_t)a5;
- (NSSet)cameraProfiles;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)settingsContext;
@end

@implementation HUCameraSmartDetectionSettingsItem

- (HUCameraSmartDetectionSettingsItem)initWithSignificantEventConfiguration:(id)a3 cameraProfiles:(id)a4 settingsContext:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUCameraSmartDetectionSettingsItem;
  v10 = [(HUCameraSmartDetectionSettingsItem *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    significantEventConfiguration = v10->_significantEventConfiguration;
    v10->_significantEventConfiguration = (HFCameraSignificantEventConfiguration *)v11;

    uint64_t v13 = [v9 copy];
    cameraProfiles = v10->_cameraProfiles;
    v10->_cameraProfiles = (NSSet *)v13;

    v10->_settingsContext = a5;
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v42[10] = *MEMORY[0x1E4F143B8];
  if (![(HUCameraSmartDetectionSettingsItem *)self settingsContext])
  {
    v7 = (void *)MEMORY[0x1E4F68FD8];
    v5 = [(HUCameraSmartDetectionSettingsItem *)self cameraProfiles];
    uint64_t v6 = [v7 configurationForCameraProfilesRecordingSettings:v5];
    goto LABEL_5;
  }
  if ([(HUCameraSmartDetectionSettingsItem *)self settingsContext] == 1)
  {
    v4 = (void *)MEMORY[0x1E4F68FD8];
    v5 = [(HUCameraSmartDetectionSettingsItem *)self cameraProfiles];
    uint64_t v6 = [v4 configurationForCameraProfilesNotificationSettings:v5];
LABEL_5:
    id v8 = (void *)v6;

    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  BOOL v9 = [(HUCameraSmartDetectionSettingsItem *)self _isHiddenForCurrentsignificantEventConfiguration:v8];
  v41[0] = *MEMORY[0x1E4F68AB8];
  v39 = [(HUCameraSmartDetectionSettingsItem *)self significantEventConfiguration];
  v38 = [v39 localizedDescription];
  v42[0] = v38;
  v41[1] = *MEMORY[0x1E4F68AC0];
  v37 = [(HUCameraSmartDetectionSettingsItem *)self significantEventConfiguration];
  v36 = [v37 localizationKey];
  v42[1] = v36;
  v41[2] = *MEMORY[0x1E4F68BC0];
  v10 = NSNumber;
  [(HUCameraSmartDetectionSettingsItem *)self significantEventConfiguration];
  v35 = v40 = v8;
  objc_msgSend(v8, "containsConfiguration:");
  v34 = [v10 numberWithInteger:HFPrimaryStateFromBOOL()];
  v42[2] = v34;
  v41[3] = *MEMORY[0x1E4F68B10];
  v33 = [NSNumber numberWithBool:v9];
  v42[3] = v33;
  v41[4] = *MEMORY[0x1E4F68900];
  v32 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v42[4] = v32;
  v41[5] = *MEMORY[0x1E4F68908];
  v31 = [(HUCameraSmartDetectionSettingsItem *)self cameraProfiles];
  v42[5] = v31;
  v41[6] = @"HUCameraSettingResultKey";
  uint64_t v11 = [(HUCameraSmartDetectionSettingsItem *)self significantEventConfiguration];
  v42[6] = v11;
  v41[7] = *MEMORY[0x1E4F68B48];
  v12 = NSNumber;
  uint64_t v13 = [(HUCameraSmartDetectionSettingsItem *)self significantEventConfiguration];
  v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "hash"));
  v42[7] = v14;
  v41[8] = *MEMORY[0x1E4F68A08];
  unint64_t v15 = [(HUCameraSmartDetectionSettingsItem *)self settingsContext];
  objc_super v16 = NSNumber;
  v17 = [(HUCameraSmartDetectionSettingsItem *)self cameraProfiles];
  v18 = [v17 anyObject];
  v19 = [v18 accessory];
  v20 = [v19 home];
  v21 = v20;
  if (v15 == 1) {
    int v22 = [v20 areBulletinNotificationsSupported];
  }
  else {
    int v22 = objc_msgSend(v20, "hf_currentUserIsAdministrator");
  }
  v23 = [v16 numberWithInt:v22 ^ 1u];
  v42[8] = v23;
  v41[9] = *MEMORY[0x1E4F68A70];
  unint64_t v24 = [(HUCameraSmartDetectionSettingsItem *)self settingsContext];
  uint64_t v25 = MEMORY[0x1E4F1CC38];
  if (v24 == 1) {
    uint64_t v25 = MEMORY[0x1E4F1CC28];
  }
  v42[9] = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:10];

  v27 = (void *)MEMORY[0x1E4F7A0D8];
  v28 = [MEMORY[0x1E4F69228] outcomeWithResults:v26];
  v29 = [v27 futureWithResult:v28];

  return v29;
}

- (BOOL)_isHiddenForCurrentsignificantEventConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(HUCameraSmartDetectionSettingsItem *)self cameraProfiles];
  uint64_t v6 = [v5 anyObject];
  v7 = [v6 accessory];
  id v8 = [v7 home];
  BOOL v9 = [v8 personManagerSettings];

  int v10 = [v9 isFaceClassificationEnabled];
  if ([v4 eventTypes]) {
    goto LABEL_9;
  }
  if (![v4 eventTypes]) {
    goto LABEL_9;
  }
  if ([(HUCameraSmartDetectionSettingsItem *)self settingsContext] != 1) {
    goto LABEL_10;
  }
  if (!_os_feature_enabled_impl()) {
    goto LABEL_10;
  }
  if ([(HUCameraSmartDetectionSettingsItem *)self settingsContext] != 1) {
    goto LABEL_10;
  }
  uint64_t v11 = [(HUCameraSmartDetectionSettingsItem *)self significantEventConfiguration];
  uint64_t v12 = [v11 eventTypes];

  if (v12 != 2) {
    goto LABEL_10;
  }
  uint64_t v13 = [(HUCameraSmartDetectionSettingsItem *)self significantEventConfiguration];
  int v14 = [v13 isFaceDetectionConfiguration];

  if ((v14 ^ 1 | v10) != 1
    || ([(HUCameraSmartDetectionSettingsItem *)self significantEventConfiguration],
        unint64_t v15 = objc_claimAutoreleasedReturnValue(),
        char v16 = v10 & ~[v15 isFaceDetectionConfiguration],
        v15,
        (v16 & 1) != 0))
  {
LABEL_9:
    BOOL v17 = 1;
  }
  else
  {
LABEL_10:
    BOOL v17 = 0;
  }

  return v17;
}

- (HFCameraSignificantEventConfiguration)significantEventConfiguration
{
  return self->_significantEventConfiguration;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (unint64_t)settingsContext
{
  return self->_settingsContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfiles, 0);

  objc_storeStrong((id *)&self->_significantEventConfiguration, 0);
}

@end