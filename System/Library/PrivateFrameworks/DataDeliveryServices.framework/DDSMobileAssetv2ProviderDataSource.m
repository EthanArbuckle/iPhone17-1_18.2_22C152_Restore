@interface DDSMobileAssetv2ProviderDataSource
- (id)maAssetQueryForDDSAssetQuery:(id)a3 compatabilityVersion:(int64_t)a4 platformVersion:(id)a5 internalInstall:(BOOL)a6;
- (int64_t)linguisticAssetCompatabilityVersion;
- (int64_t)mecabraDictionaryRapidUpdatesAssetCompatabilityVersion;
@end

@implementation DDSMobileAssetv2ProviderDataSource

- (id)maAssetQueryForDDSAssetQuery:(id)a3 compatabilityVersion:(int64_t)a4 platformVersion:(id)a5 internalInstall:(BOOL)a6
{
  return +[DDSMobileAssetv2QueryAdapter maAssetQueryForddsAssetQuery:a3 compatiblilityVersion:a4 platformVersion:a5 internalInstall:a6];
}

- (int64_t)linguisticAssetCompatabilityVersion
{
  if (linguisticAssetCompatabilityVersion_onceToken_0 != -1) {
    dispatch_once(&linguisticAssetCompatabilityVersion_onceToken_0, &__block_literal_global_6);
  }
  return linguisticAssetCompatabilityVersion_supportedCompatibilityVersion_0;
}

void __73__DDSMobileAssetv2ProviderDataSource_linguisticAssetCompatabilityVersion__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  linguisticAssetCompatabilityVersion_supportedCompatibilityVersion_0 = (uint64_t)DDSReadCompatabilityVersionFromFile(@"Info.plist");
  v0 = DefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 134217984;
    uint64_t v2 = linguisticAssetCompatabilityVersion_supportedCompatibilityVersion_0;
    _os_log_impl(&dword_1E41D6000, v0, OS_LOG_TYPE_DEFAULT, "Supported compatibility version for LinguisticData assets = %ld", (uint8_t *)&v1, 0xCu);
  }
}

- (int64_t)mecabraDictionaryRapidUpdatesAssetCompatabilityVersion
{
  if (mecabraDictionaryRapidUpdatesAssetCompatabilityVersion_onceToken != -1) {
    dispatch_once(&mecabraDictionaryRapidUpdatesAssetCompatabilityVersion_onceToken, &__block_literal_global_273);
  }
  return mecabraDictionaryRapidUpdatesAssetCompatabilityVersion_mecabraAssetsCompatibilityVersion;
}

void __92__DDSMobileAssetv2ProviderDataSource_mecabraDictionaryRapidUpdatesAssetCompatabilityVersion__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  mecabraDictionaryRapidUpdatesAssetCompatabilityVersion_mecabraAssetsCompatibilityVersion = (uint64_t)DDSReadCompatabilityVersionFromFile(@"MecabraDictionaryRapidUpdates_Info.plist");
  v0 = DefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 134217984;
    uint64_t v2 = mecabraDictionaryRapidUpdatesAssetCompatabilityVersion_mecabraAssetsCompatibilityVersion;
    _os_log_impl(&dword_1E41D6000, v0, OS_LOG_TYPE_DEFAULT, "Supported compatibility version for MecabraDictionaryRapidUpdates assets = %ld", (uint8_t *)&v1, 0xCu);
  }
}

@end