@interface VCFeatureFlagManager
@end

@implementation VCFeatureFlagManager

void __VCFeatureFlagManager_U1AuthTagEnabled_block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v0 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-u-plus-one-auth-tag-enabled", @"uPlusOneAuthTagEnabled", MEMORY[0x1E4F1CC38], 0), "BOOLValue");
  if (VCFeatureFlagManager_UseShortMKI_onceToken != -1) {
    dispatch_once(&VCFeatureFlagManager_UseShortMKI_onceToken, &__block_literal_global_45);
  }
  int v1 = VCFeatureFlagManager_UseShortMKI_result;
  int v2 = _os_feature_enabled_impl();
  if (v1) {
    int v3 = v2;
  }
  else {
    int v3 = 0;
  }
  int v4 = v3 & v0;
  VCFeatureFlagManager_U1AuthTagEnabled_result = v3 & v0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109632;
    v5[1] = v4;
    __int16 v6 = 1024;
    int v7 = v1;
    __int16 v8 = 1024;
    int v9 = v0;
    _os_log_impl(&dword_1E1EA4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "VCFeatureFlagManager: U1AuthTag=%{BOOL}d, shortMKIEnabled=%{BOOL}d, storeBagValue=%{BOOL}d", (uint8_t *)v5, 0x14u);
  }
}

void __VCFeatureFlagManager_SessionBasedMutingEnabled_block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v0 = _os_feature_enabled_impl();
  BOOL v1 = VCFeatureFlagManager_UseAvconferenced();
  VCFeatureFlagManager_SessionBasedMutingEnabled_result = v0 & v1;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109632;
    v2[1] = v0;
    __int16 v3 = 1024;
    BOOL v4 = v1;
    __int16 v5 = 1024;
    int v6 = v0 & v1;
    _os_log_impl(&dword_1E1EA4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "VCFeatureFlagManager: SessionBasedMuting=%{BOOL}d, UseAvconferencedEmbeddedSpecific=%{BOOL}d, result=%{BOOL}d", (uint8_t *)v2, 0x14u);
  }
}

uint64_t __VCFeatureFlagManager_UseAvconferenced_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  VCFeatureFlagManager_UseAvconferenced_flag = result;
  return result;
}

uint64_t __VCFeatureFlagManager_UseOptimizedTelephonyHandovers_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  VCFeatureFlagManager_UseOptimizedTelephonyHandovers_uint64_t result = result;
  return result;
}

BOOL __VCFeatureFlagManager_PreviewMSROptimizationForEmbedded_block_invoke()
{
  BOOL result = (_os_feature_enabled_impl() & 1) != 0
        || VCDefaults_GetBoolValueForKey(@"forceEnablePreviewMSROptimizationForEmbedded", 0);
  VCFeatureFlagManager_PreviewMSROptimizationForEmbedded_BOOL result = result;
  return result;
}

void __VCFeatureFlagManager_SkipNonInfraWiFiAssertion_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = _os_feature_enabled_impl();
  VCFeatureFlagManager_SkipNonInfraWiFiAssertion_BOOL result = v0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_impl(&dword_1E1EA4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SkipNonInfraWiFiAssertion=%d", (uint8_t *)v1, 8u);
  }
}

void __VCFeatureFlagManager_UseShortMKI_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = _os_feature_enabled_impl();
  VCFeatureFlagManager_UseShortMKI_BOOL result = v0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_impl(&dword_1E1EA4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "ShortMKI=%{BOOL}d", (uint8_t *)v1, 8u);
  }
}

void __VCFeatureFlagManager_UseTLE_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = _os_feature_enabled_impl();
  VCFeatureFlagManager_UseTLE_BOOL result = v0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_impl(&dword_1E1EA4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TransportLevelEncryption=%{BOOL}d", (uint8_t *)v1, 8u);
  }
}

uint64_t __VCFeatureFlagManager_UseAnalyzerSpeechAPI_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  VCFeatureFlagManager_UseAnalyzerSpeechAPI_flag = result;
  return result;
}

uint64_t __VCFeatureFlagManager_UseBlockDurationHinting_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  if (result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  VCFeatureFlagManager_UseBlockDurationHinting_flag = result;
  return result;
}

uint64_t __VCFeatureFlagManager_RecordingResiliencyEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  VCFeatureFlagManager_RecordingResiliencyEnabled_flag = result;
  return result;
}

uint64_t __VCFeatureFlagManager_LocalRecordingEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  VCFeatureFlagManager_LocalRecordingEnabled_flag = result;
  return result;
}

uint64_t __VCFeatureFlagManager_CallRecordingEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  VCFeatureFlagManager_CallRecordingEnabled_flag = result;
  return result;
}

uint64_t __VCFeatureFlagManager_FoveationEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  VCFeatureFlagManager_FoveationEnabled_flag = result;
  return result;
}

@end