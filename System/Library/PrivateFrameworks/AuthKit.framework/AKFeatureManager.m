@interface AKFeatureManager
+ (BOOL)isEasyDependentSignInEnabled;
+ (BOOL)isEnforceMDMPolicyEnabled;
+ (BOOL)isProxAuthEnabled;
+ (BOOL)isProxForAuthkitEnabled;
+ (BOOL)isYorktownEnabled;
+ (id)sharedManager;
- (AKFeatureManager)init;
- (BOOL)backgroundiCloudSignInEnabled;
- (BOOL)isAABrandingEnabled;
- (BOOL)isADPExpansionViaCFUEnabled;
- (BOOL)isAppleIDPasskeyFeatureEnabled;
- (BOOL)isAppleIDSessionTelemetryEnabled;
- (BOOL)isAuthenticatedRequestSerializationEnabled;
- (BOOL)isBAASupportedForVirtualMachines;
- (BOOL)isBackgroundiCloudSignInEnabled;
- (BOOL)isChildPasscodeEnabled;
- (BOOL)isConvertToMAIDEnabled;
- (BOOL)isDTOEnabled;
- (BOOL)isDeviceListCacheEnableDryMode;
- (BOOL)isDeviceListCacheEnabled;
- (BOOL)isForgotPasswordNativeTakeoverEnabled;
- (BOOL)isHawksbillEnabled;
- (BOOL)isLisbonAvailable;
- (BOOL)isPltUpgradeEnabled;
- (BOOL)isSignInSecurityRedesignEnabled;
- (BOOL)isSilentAuthenticationRequestSerializationEnabled;
- (BOOL)isSimpleProfilesEnabled;
- (BOOL)isSiwaCredentialSharingEnabled;
- (BOOL)isSiwaInPasswordsFeatureEnabled;
- (BOOL)isTiburonU13Enabled;
- (BOOL)isTokenCacheEnabled;
- (BOOL)isTokenCreationTimeEnabled;
- (BOOL)isUplevelSignInWithAppleEnabled;
- (void)init;
@end

@implementation AKFeatureManager

- (BOOL)isBAASupportedForVirtualMachines
{
  return self->_baaSupportedForVirtualMachines;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_34);
  }
  v2 = (void *)sharedManager_sharedManager;

  return v2;
}

uint64_t __33__AKFeatureManager_sharedManager__block_invoke()
{
  sharedManager_sharedManager = objc_alloc_init(AKFeatureManager);

  return MEMORY[0x1F41817F8]();
}

- (AKFeatureManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)AKFeatureManager;
  v2 = [(AKFeatureManager *)&v25 init];
  if (v2)
  {
    v2->_cachedIsLisbonAvailable = _os_feature_enabled_impl();
    v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init]0();
    }

    v2->_cachedIsAppleIDPasskeyFeatureEnabled = _os_feature_enabled_impl();
    v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init]9();
    }

    v2->_cachedIsTiburonU13Enabled = _os_feature_enabled_impl();
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init]8();
    }

    v2->_cachedIsHawksbillEnabled = _os_feature_enabled_impl();
    v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init]7();
    }

    v2->_cachedIsChildPasscodeEnabled = _os_feature_enabled_impl();
    v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init]6();
    }

    v2->_cachedIsDTOEnabled = _os_feature_enabled_impl();
    v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init]5();
    }

    v2->_cachedIsForgotPasswordNativeTakeoverEnabled = _os_feature_enabled_impl();
    v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init]4();
    }

    v2->_appleIDSessionTelemetryEnabled = _os_feature_enabled_impl();
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init]3();
    }

    v2->_cachedIsDeviceListCacheEnabled = _os_feature_enabled_impl();
    v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init]2();
    }

    v2->_cacheIsDeviceListCacheEnableDryMode = _os_feature_enabled_impl();
    v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init]1();
    }

    v2->_cachedSiwaCredentialSharingEnabled = _os_feature_enabled_impl();
    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init]0();
    }

    v2->_cachedIsSiwaInPasswordsFeatureEnabled = _os_feature_enabled_impl();
    v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init].cold.9();
    }

    v2->_cachedIsConvertToMAIDEnabled = _os_feature_enabled_impl();
    v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init].cold.8();
    }

    v2->_cachedPltUpgradeEnabled = _os_feature_enabled_impl();
    v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init].cold.7();
    }

    v2->_cachedAuthenticatedRequestSerializationEnabled = _os_feature_enabled_impl();
    v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init].cold.6();
    }

    v2->_cachedSilentAuthenticationRequestSerializationEnabled = _os_feature_enabled_impl();
    v18 = _AKLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init].cold.5();
    }

    v2->_cachedAABrandingEnabled = _os_feature_enabled_impl();
    v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init].cold.4();
    }

    v2->_adpExpansionViaCFUEnabled = _os_feature_enabled_impl();
    v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init]();
    }

    v2->_baaSupportedForVirtualMachines = _os_feature_enabled_impl();
    v21 = _AKLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init]();
    }

    v2->_cachedSignInSecurityRedesignEnabled = _os_feature_enabled_impl();
    v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[AKFeatureManager init]();
    }

    v23 = v2;
  }

  return v2;
}

- (BOOL)isLisbonAvailable
{
  return self->_cachedIsLisbonAvailable;
}

+ (BOOL)isProxAuthEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isProxForAuthkitEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isAppleIDPasskeyFeatureEnabled
{
  return self->_cachedIsAppleIDPasskeyFeatureEnabled;
}

+ (BOOL)isYorktownEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isTiburonU13Enabled
{
  return self->_cachedIsTiburonU13Enabled;
}

- (BOOL)isHawksbillEnabled
{
  return self->_cachedIsHawksbillEnabled;
}

+ (BOOL)isEnforceMDMPolicyEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isChildPasscodeEnabled
{
  return self->_cachedIsChildPasscodeEnabled;
}

- (BOOL)isDTOEnabled
{
  return self->_cachedIsDTOEnabled;
}

- (BOOL)isForgotPasswordNativeTakeoverEnabled
{
  return self->_cachedIsForgotPasswordNativeTakeoverEnabled;
}

+ (BOOL)isEasyDependentSignInEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isDeviceListCacheEnabled
{
  return self->_cachedIsDeviceListCacheEnabled;
}

- (BOOL)isDeviceListCacheEnableDryMode
{
  return self->_cacheIsDeviceListCacheEnableDryMode;
}

- (BOOL)backgroundiCloudSignInEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isSimpleProfilesEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isTokenCacheEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isSiwaCredentialSharingEnabled
{
  return self->_cachedSiwaCredentialSharingEnabled;
}

- (BOOL)isSiwaInPasswordsFeatureEnabled
{
  return self->_cachedIsSiwaInPasswordsFeatureEnabled;
}

- (BOOL)isConvertToMAIDEnabled
{
  return self->_cachedIsConvertToMAIDEnabled;
}

- (BOOL)isTokenCreationTimeEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isPltUpgradeEnabled
{
  return self->_cachedPltUpgradeEnabled;
}

- (BOOL)isAuthenticatedRequestSerializationEnabled
{
  return self->_cachedAuthenticatedRequestSerializationEnabled;
}

- (BOOL)isSilentAuthenticationRequestSerializationEnabled
{
  return ([MEMORY[0x1E4F46FF0] deviceIsAudioAccessory] & 1) != 0
      || self->_cachedSilentAuthenticationRequestSerializationEnabled;
}

- (BOOL)isAABrandingEnabled
{
  return self->_cachedAABrandingEnabled;
}

- (BOOL)isADPExpansionViaCFUEnabled
{
  return self->_adpExpansionViaCFUEnabled;
}

- (BOOL)isSignInSecurityRedesignEnabled
{
  return self->_cachedSignInSecurityRedesignEnabled;
}

- (BOOL)isAppleIDSessionTelemetryEnabled
{
  return self->_appleIDSessionTelemetryEnabled;
}

- (BOOL)isBackgroundiCloudSignInEnabled
{
  return self->_backgroundiCloudSignInEnabled;
}

- (BOOL)isUplevelSignInWithAppleEnabled
{
  return self->_uplevelSignInWithAppleEnabled;
}

- (void)init
{
  OUTLINED_FUNCTION_1_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Feature Lisbon is supported. Is Lisbon available - %@", v2, v3, v4, v5, v6);
}

@end