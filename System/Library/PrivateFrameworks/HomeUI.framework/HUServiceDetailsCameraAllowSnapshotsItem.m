@interface HUServiceDetailsCameraAllowSnapshotsItem
- (BOOL)_canReadWriteHMCameraSnapshotsControl;
- (BOOL)shouldBeHidden;
- (HMCameraUserSettings)cameraUserSettings;
- (HUServiceDetailsCameraAllowSnapshotsItem)initWithSourceServiceItem:(id)a3 home:(id)a4 shouldBeHidden:(BOOL)a5;
- (HUServiceDetailsCameraSettingsReaderWriter)settingsReaderWriter;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)cameraSettings;
- (id)characteristicForSettings:(id)a3;
- (id)characteristicValueManager;
- (id)itemTitle;
- (id)itemTitleLocalizationKey;
- (id)transactionReason;
- (id)updateUserSettingsWithValue:(BOOL)a3;
- (void)setCameraUserSettings:(id)a3;
- (void)setSettingsReaderWriter:(id)a3;
- (void)setShouldBeHidden:(BOOL)a3;
@end

@implementation HUServiceDetailsCameraAllowSnapshotsItem

- (HUServiceDetailsCameraAllowSnapshotsItem)initWithSourceServiceItem:(id)a3 home:(id)a4 shouldBeHidden:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)HUServiceDetailsCameraAllowSnapshotsItem;
  result = [(HUServiceDetailsAbstractItem *)&v7 initWithSourceServiceItem:a3 home:a4];
  if (result) {
    result->_shouldBeHidden = a5;
  }
  return result;
}

- (HUServiceDetailsCameraSettingsReaderWriter)settingsReaderWriter
{
  settingsReaderWriter = self->_settingsReaderWriter;
  if (!settingsReaderWriter)
  {
    v4 = [[HUServiceDetailsCameraSettingsReaderWriter alloc] initWithConfigurator:self];
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
  if ([(HUServiceDetailsCameraAllowSnapshotsItem *)self _canReadWriteHMCameraSnapshotsControl])
  {
    v5 = [(HUServiceDetailsCameraAllowSnapshotsItem *)self settingsReaderWriter];
    v6 = [v5 readWithOptions:v4];
  }
  else
  {
    objc_super v7 = (void *)MEMORY[0x1E4F7A0D8];
    v8 = (void *)MEMORY[0x1E4F69228];
    uint64_t v12 = *MEMORY[0x1E4F68B10];
    v13[0] = MEMORY[0x1E4F1CC38];
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v10 = [v8 outcomeWithResults:v9];
    v6 = [v7 futureWithResult:v10];
  }

  return v6;
}

- (id)updateUserSettingsWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HUServiceDetailsCameraAllowSnapshotsItem *)self _canReadWriteHMCameraSnapshotsControl])
  {
    v5 = [(HUServiceDetailsCameraAllowSnapshotsItem *)self settingsReaderWriter];
    v6 = [v5 updateUserSettingsWithValue:v3];
  }
  else
  {
    v6 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v6;
}

- (BOOL)_canReadWriteHMCameraSnapshotsControl
{
  objc_opt_class();
  BOOL v3 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  BOOL v6 = [(HUServiceDetailsCameraAllowSnapshotsItem *)self shouldBeHidden];
  LOBYTE(self) = 0;
  if (!v6 && v5)
  {
    objc_super v7 = [v5 profile];
    v8 = [v7 userSettings];
    self = (HUServiceDetailsCameraAllowSnapshotsItem *)(((unint64_t)[v8 supportedFeatures] >> 5) & 1);
  }
  return (char)self;
}

- (id)transactionReason
{
  return @"HUSnapshotsAllowed-Toggle";
}

- (id)cameraSettings
{
  objc_opt_class();
  BOOL v3 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  BOOL v6 = [v5 profile];

  objc_super v7 = [v6 userSettings];

  return v7;
}

- (id)characteristicForSettings:(id)a3
{
  return (id)[a3 snapshotsAllowedCharacteristic];
}

- (id)itemTitleLocalizationKey
{
  return @"HUStatusAndNotificationsAllowSnapshotsInNotifications";
}

- (id)itemTitle
{
  v2 = [(HUServiceDetailsCameraAllowSnapshotsItem *)self itemTitleLocalizationKey];
  BOOL v3 = _HULocalizedStringWithDefaultValue(v2, v2, 1);

  return v3;
}

- (id)characteristicValueManager
{
  v2 = [(HUServiceDetailsAbstractItem *)self home];
  BOOL v3 = objc_msgSend(v2, "hf_characteristicValueManager");

  return v3;
}

- (HMCameraUserSettings)cameraUserSettings
{
  return self->_cameraUserSettings;
}

- (void)setCameraUserSettings:(id)a3
{
}

- (void)setSettingsReaderWriter:(id)a3
{
}

- (BOOL)shouldBeHidden
{
  return self->_shouldBeHidden;
}

- (void)setShouldBeHidden:(BOOL)a3
{
  self->_shouldBeHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsReaderWriter, 0);

  objc_storeStrong((id *)&self->_cameraUserSettings, 0);
}

@end