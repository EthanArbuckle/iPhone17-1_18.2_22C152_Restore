@interface CSLPRFStingConfigurationHistorySetting
- (CSLPRFStingConfigurationHistorySetting)init;
- (id)read;
- (void)write:(id)a3;
@end

@implementation CSLPRFStingConfigurationHistorySetting

- (void).cxx_destruct
{
}

- (void)write:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  stingHistorySetting = self->_stingHistorySetting;
  v6 = [v4 toExportData];
  [(CSLPRFTwoWaySyncSetting *)stingHistorySetting setValue:v6];

  v7 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543619;
    v9 = self;
    __int16 v10 = 2113;
    id v11 = v4;
    _os_log_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ updated to %{private}@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)read
{
  v2 = [(CSLPRFTwoWaySyncSetting *)self->_stingHistorySetting value];
  v3 = +[CSLPRFStingConfigurationHistoryData fromExportData:v2];

  return v3;
}

- (CSLPRFStingConfigurationHistorySetting)init
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CSLPRFStingConfigurationHistorySetting;
  v2 = [(CSLPRFStingConfigurationHistorySetting *)&v8 init];
  if (v2)
  {
    v3 = [[CSLPRFTwoWaySyncSetting alloc] initWithKey:@"StingConfigurationHistorySettings" defaultValue:0 notification:0];
    stingHistorySetting = v2->_stingHistorySetting;
    v2->_stingHistorySetting = v3;

    v5 = [(CSLPRFStingConfigurationHistorySetting *)v2 read];
    v6 = cslprf_sting_settings_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      __int16 v10 = v2;
      __int16 v11 = 2113;
      uint64_t v12 = v5;
      _os_log_impl(&dword_22F4EA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ initialValue %{private}@", buf, 0x16u);
    }
  }
  return v2;
}

@end