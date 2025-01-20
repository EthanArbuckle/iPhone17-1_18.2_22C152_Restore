@interface HUServiceDetailsCameraStatusLightItem
- (BOOL)_canReadWriteAccessModeIndicator;
- (HUServiceDetailsCameraSettingsReaderWriter)settingsReaderWriter;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)cameraSettings;
- (id)characteristicForSettings:(id)a3;
- (id)characteristicValueManager;
- (id)itemTitle;
- (id)itemTitleLocalizationKey;
- (id)transactionReason;
- (id)updateUserSettingsWithValue:(BOOL)a3;
- (void)setSettingsReaderWriter:(id)a3;
@end

@implementation HUServiceDetailsCameraStatusLightItem

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
  if ([(HUServiceDetailsCameraStatusLightItem *)self _canReadWriteAccessModeIndicator])
  {
    v5 = [(HUServiceDetailsCameraStatusLightItem *)self settingsReaderWriter];
    v6 = [v5 readWithOptions:v4];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F7A0D8];
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
  if ([(HUServiceDetailsCameraStatusLightItem *)self _canReadWriteAccessModeIndicator])
  {
    v5 = [(HUServiceDetailsCameraStatusLightItem *)self settingsReaderWriter];
    v6 = [v5 updateUserSettingsWithValue:v3];
  }
  else
  {
    v6 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v6;
}

- (BOOL)_canReadWriteAccessModeIndicator
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

  if (v5)
  {
    v6 = [v5 profile];
    v7 = [v6 userSettings];
    unint64_t v8 = ((unint64_t)[v7 supportedFeatures] >> 4) & 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)transactionReason
{
  return @"HUCameraStatusLight-Toggle";
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

  v6 = [v5 profile];

  v7 = [v6 userSettings];

  return v7;
}

- (id)characteristicForSettings:(id)a3
{
  return (id)[a3 accessModeIndicatorEnabledCharacteristic];
}

- (id)itemTitleLocalizationKey
{
  return @"HUCameraStatusLightSwitchTitle";
}

- (id)itemTitle
{
  v2 = [(HUServiceDetailsCameraStatusLightItem *)self itemTitleLocalizationKey];
  BOOL v3 = _HULocalizedStringWithDefaultValue(v2, v2, 1);

  return v3;
}

- (id)characteristicValueManager
{
  v2 = [(HUServiceDetailsAbstractItem *)self home];
  BOOL v3 = objc_msgSend(v2, "hf_characteristicValueManager");

  return v3;
}

- (void)setSettingsReaderWriter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end