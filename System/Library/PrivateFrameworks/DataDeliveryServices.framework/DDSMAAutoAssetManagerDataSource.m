@interface DDSMAAutoAssetManagerDataSource
- (BOOL)shouldDownloadAutoAsset;
- (id)supportedAutoAssetSpecifiers;
- (int64_t)linguisticAssetCompatabilityVersion;
@end

@implementation DDSMAAutoAssetManagerDataSource

- (BOOL)shouldDownloadAutoAsset
{
  return MEMORY[0x1F40C9FB0]("TextInputCore", "EnableLinguisticDataAutoAsset");
}

- (int64_t)linguisticAssetCompatabilityVersion
{
  if (linguisticAssetCompatabilityVersion_onceToken != -1) {
    dispatch_once(&linguisticAssetCompatabilityVersion_onceToken, &__block_literal_global_5);
  }
  return linguisticAssetCompatabilityVersion_supportedCompatibilityVersion;
}

void __70__DDSMAAutoAssetManagerDataSource_linguisticAssetCompatabilityVersion__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  linguisticAssetCompatabilityVersion_supportedCompatibilityVersion = (uint64_t)DDSReadCompatabilityVersionFromFile(@"Info.plist");
  v0 = DefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 134217984;
    uint64_t v2 = linguisticAssetCompatabilityVersion_supportedCompatibilityVersion;
    _os_log_impl(&dword_1E41D6000, v0, OS_LOG_TYPE_DEFAULT, "Supported compatibility version for LinguisticData assets = %ld", (uint8_t *)&v1, 0xCu);
  }
}

- (id)supportedAutoAssetSpecifiers
{
  if (supportedAutoAssetSpecifiers_onceToken != -1) {
    dispatch_once(&supportedAutoAssetSpecifiers_onceToken, &__block_literal_global_5);
  }
  uint64_t v2 = (void *)supportedAutoAssetSpecifiers_supportedAutoAssetSpecifiers;
  return v2;
}

void __63__DDSMAAutoAssetManagerDataSource_supportedAutoAssetSpecifiers__block_invoke()
{
  uint64_t v0 = DDSReadSupportedPriorityAssetSpecifiersFromFile(@"Info.plist");
  int v1 = (void *)supportedAutoAssetSpecifiers_supportedAutoAssetSpecifiers;
  supportedAutoAssetSpecifiers_supportedAutoAssetSpecifiers = v0;

  uint64_t v2 = DefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __63__DDSMAAutoAssetManagerDataSource_supportedAutoAssetSpecifiers__block_invoke_cold_1(v2);
  }
}

void __63__DDSMAAutoAssetManagerDataSource_supportedAutoAssetSpecifiers__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = supportedAutoAssetSpecifiers_supportedAutoAssetSpecifiers;
  _os_log_debug_impl(&dword_1E41D6000, log, OS_LOG_TYPE_DEBUG, "Supported auto asset specifiers: %@", (uint8_t *)&v1, 0xCu);
}

@end