@interface AXAudiogramIngestionAssetPolicy
- (AXAudiogramIngestionAssetPolicy)init;
- (BOOL)_assetsUsedInLastSixMonths;
- (BOOL)shouldCopyLocally;
- (BOOL)shouldUseProductionServerForInternalBuilds;
- (id)assetType;
- (id)assetsToPurgeFromInstalledAssets:(id)a3;
- (id)downloadOptionsForOperation:(unint64_t)a3 userInitiated:(BOOL)a4;
- (id)launchActivityIdentifier;
- (id)maxSupportedFormatVersion;
- (id)minSupportedFormatVersion;
- (uint64_t)init;
@end

@implementation AXAudiogramIngestionAssetPolicy

- (id)assetType
{
  return @"com.apple.MobileAsset.AudiogramAssets";
}

- (id)launchActivityIdentifier
{
  return @"com.apple.ax.AudiogramAssets.LaunchActivity";
}

- (BOOL)shouldCopyLocally
{
  return 1;
}

- (id)maxSupportedFormatVersion
{
  if (_os_feature_enabled_impl()) {
    return &unk_1F3680BD8;
  }
  else {
    return &unk_1F3680BF0;
  }
}

- (id)minSupportedFormatVersion
{
  if (_os_feature_enabled_impl()) {
    return &unk_1F3680BD8;
  }
  else {
    return &unk_1F3680BF0;
  }
}

- (BOOL)shouldUseProductionServerForInternalBuilds
{
  return 1;
}

- (id)downloadOptionsForOperation:(unint64_t)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)AXAudiogramIngestionAssetPolicy;
  v5 = -[AXAssetPolicy downloadOptionsForOperation:userInitiated:](&v7, sel_downloadOptionsForOperation_userInitiated_, a3);
  [v5 setAllowsCellularAccess:v4];
  return v5;
}

- (id)assetsToPurgeFromInstalledAssets:(id)a3
{
  id v4 = a3;
  if ([(AXAudiogramIngestionAssetPolicy *)self _assetsUsedInLastSixMonths])
  {
    v9.receiver = self;
    v9.super_class = (Class)AXAudiogramIngestionAssetPolicy;
    id v5 = [(AXAssetPolicy *)&v9 assetsToPurgeFromInstalledAssets:v4];
  }
  else
  {
    v6 = AXLogAudiogram();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC53F000, v6, OS_LOG_TYPE_DEFAULT, "Audiogram Ingestion assets have been unused for 6 months. Purging all installed assets", buf, 2u);
    }

    id v5 = v4;
  }
  objc_super v7 = v5;

  return v7;
}

- (BOOL)_assetsUsedInLastSixMonths
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v2 = (void *)getAXSettingsClass_softClass;
  uint64_t v12 = getAXSettingsClass_softClass;
  if (!getAXSettingsClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getAXSettingsClass_block_invoke;
    v8[3] = &unk_1E6C41EC8;
    v8[4] = &v9;
    __getAXSettingsClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  id v4 = [v3 sharedInstance];
  [v4 audiogramIngestionLastModelAccess];
  double v6 = v5;

  return CFAbsoluteTimeGetCurrent() - v6 < 15724800.0;
}

- (AXAudiogramIngestionAssetPolicy)init
{
  v13.receiver = self;
  v13.super_class = (Class)AXAudiogramIngestionAssetPolicy;
  v2 = [(AXAssetPolicy *)&v13 init];
  if (v2 && _os_feature_enabled_impl() && os_variant_has_internal_ui())
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    id v3 = (void (*)(__CFString *, void))getASServerURLForAssetTypeSymbolLoc_ptr;
    v22 = getASServerURLForAssetTypeSymbolLoc_ptr;
    if (!getASServerURLForAssetTypeSymbolLoc_ptr)
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __getASServerURLForAssetTypeSymbolLoc_block_invoke;
      v17 = &unk_1E6C41EC8;
      v18 = &v19;
      id v4 = (void *)MobileAssetLibrary();
      double v5 = dlsym(v4, "ASServerURLForAssetType");
      *(void *)(v18[1] + 24) = v5;
      getASServerURLForAssetTypeSymbolLoc_ptr = *(_UNKNOWN **)(v18[1] + 24);
      id v3 = (void (*)(__CFString *, void))v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (v3)
    {
      double v6 = v3(@"com.apple.MobileAsset.AudiogramAssets", 0);
      objc_super v7 = [v6 absoluteString];

      if (![v7 isEqualToString:@"https://mesu.apple.com/assets/"])
      {
LABEL_12:

        return v2;
      }
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      v8 = (void (*)(__CFString *, __CFString *))getMASetServerUrlOverrideSymbolLoc_ptr;
      v22 = getMASetServerUrlOverrideSymbolLoc_ptr;
      if (!getMASetServerUrlOverrideSymbolLoc_ptr)
      {
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        v16 = __getMASetServerUrlOverrideSymbolLoc_block_invoke;
        v17 = &unk_1E6C41EC8;
        v18 = &v19;
        uint64_t v9 = (void *)MobileAssetLibrary();
        v10 = dlsym(v9, "MASetServerUrlOverride");
        *(void *)(v18[1] + 24) = v10;
        getMASetServerUrlOverrideSymbolLoc_ptr = *(_UNKNOWN **)(v18[1] + 24);
        v8 = (void (*)(__CFString *, __CFString *))v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (v8)
      {
        v8(@"com.apple.MobileAsset.AudiogramAssets", @"https://basejumper.apple.com/livability/Crystal");
        goto LABEL_12;
      }
    }
    else
    {
      -[AXAudiogramIngestionAssetPolicy init]();
    }
    uint64_t v12 = (_Unwind_Exception *)-[AXAudiogramIngestionAssetPolicy init]();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v12);
  }
  return v2;
}

- (uint64_t)init
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getAXSettingsClass_block_invoke_cold_1(v0);
}

@end