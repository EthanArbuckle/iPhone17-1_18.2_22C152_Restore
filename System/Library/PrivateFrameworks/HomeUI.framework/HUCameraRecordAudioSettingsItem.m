@interface HUCameraRecordAudioSettingsItem
- (BOOL)_canReadWriteCameraRecordingSettings;
- (HMCameraProfile)cameraProfile;
- (HMHome)home;
- (HUCameraRecordAudioSettingsItem)init;
- (HUCameraRecordAudioSettingsItem)initWithCameraProfile:(id)a3;
- (HUServiceDetailsCameraSettingsReaderWriter)settingsReaderWriter;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)cameraSettings;
- (id)characteristicForSettings:(id)a3;
- (id)characteristicValueManager;
- (id)itemTitle;
- (id)itemTitleLocalizationKey;
- (id)transactionReason;
- (id)updateRecordAudioSettingWithValue:(BOOL)a3;
- (void)setCameraProfile:(id)a3;
- (void)setHome:(id)a3;
- (void)setSettingsReaderWriter:(id)a3;
@end

@implementation HUCameraRecordAudioSettingsItem

- (HUCameraRecordAudioSettingsItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HUCameraRecordAudioSettingsItem.m" lineNumber:23 description:@"Use -initWithSourceServiceItem:"];

  return 0;
}

- (HUCameraRecordAudioSettingsItem)initWithCameraProfile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUCameraRecordAudioSettingsItem;
  v5 = [(HUCameraRecordAudioSettingsItem *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(HUCameraRecordAudioSettingsItem *)v5 setCameraProfile:v4];
    v7 = [v4 accessory];
    v8 = [v7 home];
    [(HUCameraRecordAudioSettingsItem *)v6 setHome:v8];
  }
  return v6;
}

- (HUServiceDetailsCameraSettingsReaderWriter)settingsReaderWriter
{
  settingsReaderWriter = self->_settingsReaderWriter;
  if (!settingsReaderWriter)
  {
    id v4 = [[HUServiceDetailsCameraSettingsReaderWriter alloc] initWithConfigurator:self];
    v5 = self->_settingsReaderWriter;
    self->_settingsReaderWriter = v4;

    settingsReaderWriter = self->_settingsReaderWriter;
  }
  v6 = settingsReaderWriter;

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HUCameraRecordAudioSettingsItem *)self _canReadWriteCameraRecordingSettings])
  {
    v5 = [(HUCameraRecordAudioSettingsItem *)self settingsReaderWriter];
    v6 = [v5 readWithOptions:v4];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F7A0D8];
    v8 = (void *)MEMORY[0x1E4F69228];
    uint64_t v12 = *MEMORY[0x1E4F68B10];
    v13[0] = MEMORY[0x1E4F1CC38];
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    objc_super v10 = [v8 outcomeWithResults:v9];
    v6 = [v7 futureWithResult:v10];
  }

  return v6;
}

- (id)updateRecordAudioSettingWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HUCameraRecordAudioSettingsItem *)self _canReadWriteCameraRecordingSettings])
  {
    v5 = [(HUCameraRecordAudioSettingsItem *)self settingsReaderWriter];
    v6 = [v5 updateUserSettingsWithValue:v3];
  }
  else
  {
    v6 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v6;
}

- (BOOL)_canReadWriteCameraRecordingSettings
{
  v2 = [(HUCameraRecordAudioSettingsItem *)self cameraProfile];
  BOOL v3 = [v2 userSettings];
  unint64_t v4 = ((unint64_t)[v3 supportedFeatures] >> 1) & 1;

  return v4;
}

- (id)transactionReason
{
  return @"HUCameraRecordAudio-Toggle";
}

- (id)cameraSettings
{
  v2 = [(HUCameraRecordAudioSettingsItem *)self cameraProfile];
  BOOL v3 = [v2 userSettings];

  return v3;
}

- (id)characteristicForSettings:(id)a3
{
  return (id)[a3 recordingAudioEnabledCharacteristic];
}

- (id)itemTitleLocalizationKey
{
  return @"HUCameraRecordAudioTitle";
}

- (id)itemTitle
{
  v2 = [(HUCameraRecordAudioSettingsItem *)self itemTitleLocalizationKey];
  BOOL v3 = _HULocalizedStringWithDefaultValue(v2, v2, 1);

  return v3;
}

- (id)characteristicValueManager
{
  v2 = [(HUCameraRecordAudioSettingsItem *)self home];
  BOOL v3 = objc_msgSend(v2, "hf_characteristicValueManager");

  return v3;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void)setSettingsReaderWriter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsReaderWriter, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_cameraProfile, 0);
}

@end