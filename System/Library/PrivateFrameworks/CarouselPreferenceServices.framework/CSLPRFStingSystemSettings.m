@interface CSLPRFStingSystemSettings
- (CSLPRFStingSystemSettings)init;
- (CSLPRFTwoWaySyncSettingDelegate)delegate;
- (id)read;
- (void)setDelegate:(id)a3;
- (void)twoWaySyncSettingDidUpdate:(id)a3;
- (void)write:(id)a3;
@end

@implementation CSLPRFStingSystemSettings

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stingSystemSettings, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CSLPRFTwoWaySyncSettingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLPRFTwoWaySyncSettingDelegate *)WeakRetained;
}

- (void)twoWaySyncSettingDidUpdate:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = @"StingSystemSettings";
    _os_log_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_DEFAULT, "supported sting action settings changed (%@)", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained twoWaySyncSettingDidUpdate:v4];
}

- (void)write:(id)a3
{
  stingSystemSettings = self->_stingSystemSettings;
  id v4 = [a3 toExportData];
  [(CSLPRFTwoWaySyncSetting *)stingSystemSettings setValue:v4];
}

- (id)read
{
  v2 = [(CSLPRFTwoWaySyncSetting *)self->_stingSystemSettings value];
  v3 = +[CSLPRFStingSettingsModelData fromExportData:v2];

  return v3;
}

- (CSLPRFStingSystemSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSLPRFStingSystemSettings;
  v2 = [(CSLPRFStingSystemSettings *)&v6 init];
  if (v2)
  {
    v3 = [[CSLPRFTwoWaySyncSetting alloc] initWithKey:@"StingSystemSettings" defaultValue:0 notification:"CSLPRFStingConfigurationChangedNotification"];
    stingSystemSettings = v2->_stingSystemSettings;
    v2->_stingSystemSettings = v3;

    [(CSLPRFTwoWaySyncSetting *)v2->_stingSystemSettings setDelegate:v2];
  }
  return v2;
}

@end