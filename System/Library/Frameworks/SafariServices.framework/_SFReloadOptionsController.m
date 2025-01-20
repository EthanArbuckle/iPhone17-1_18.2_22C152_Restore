@interface _SFReloadOptionsController
- (BOOL)_updateSettingSource:(unint64_t)a3 domain:(id)a4;
- (BOOL)loadedUsingDesktopUserAgent;
- (BOOL)supportsAdvancedPrivacyProtections;
- (BOOL)tryUsingMobileIfPossible;
- (_SFInjectedJavaScriptController)activityJSController;
- (_SFReloadOptionsController)init;
- (_SFReloadOptionsController)initWithWebView:(id)a3 activityJSController:(id)a4 perSitePreferenceManager:(id)a5;
- (id)customNavigatorPlatformForSetting:(int64_t)a3;
- (id)customUserAgentForSetting:(int64_t)a3;
- (int64_t)effectiveContentMode;
- (void)_loadPerSitePreferences;
- (void)_overrideSettingIfNeeded:(int64_t)a3 source:(unint64_t)a4 domain:(id)a5 completion:(id)a6;
- (void)_requestDesktopSiteWithFallbackURL:(id)a3;
- (void)_requestStandardSiteWithURL:(id)a3;
- (void)customUserAgentSettingForMainFrameURL:(id)a3 withTimeout:(double)a4 completionHandler:(id)a5;
- (void)didMarkURLAsNeedingDesktopUserAgent:(id)a3;
- (void)didMarkURLAsNeedingStandardUserAgent:(id)a3;
- (void)didSetRequestDesktopSiteDefaultValue:(int64_t)a3;
- (void)didSetRequestDesktopSitePerSitePreferencesValues:(id)a3;
- (void)didUpdateRequestDesktopSiteDefaultValue:(int64_t)a3;
- (void)didUpdateRequestDesktopSitePerSitePreference:(id)a3;
- (void)invalidate;
- (void)logCompletedPageloadToDifferentialPrivacy:(id)a3;
- (void)requestDesktopSite;
- (void)requestDesktopSiteWithURL:(id)a3;
- (void)requestStandardSite;
- (void)setEffectiveContentMode:(int64_t)a3;
- (void)setSupportsAdvancedPrivacyProtections:(BOOL)a3;
- (void)setTryUsingMobileIfPossible:(BOOL)a3;
@end

@implementation _SFReloadOptionsController

- (void)setTryUsingMobileIfPossible:(BOOL)a3
{
  self->_tryUsingMobileIfPossible = a3;
}

- (void)didUpdateRequestDesktopSitePerSitePreference:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = (NSDictionary *)a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFReloadOptionsController didUpdateRequestDesktopSitePerSitePreference:](v5);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v7 = [WeakRetained URL];
  v8 = objc_msgSend(v7, "safari_userVisibleHostWithoutWWWSubdomain");
  v9 = [(NSDictionary *)self->_perSitePreferenceValues objectForKeyedSubscript:v8];
  v10 = [(NSDictionary *)v4 objectForKeyedSubscript:v8];
  if ((WBSIsEqual() & 1) == 0)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = v11;
      v14 = _SFStringFromRequestDesktopSiteSetting(v9);
      v15 = _SFStringFromRequestDesktopSiteSetting(v10);
      int v16 = 138478339;
      v17 = v8;
      __int16 v18 = 2114;
      v19 = v14;
      __int16 v20 = 2114;
      v21 = v15;
      _os_log_debug_impl(&dword_1A690B000, v13, OS_LOG_TYPE_DEBUG, "Request Desktop Website setting for domain '%{private}@' changed from %{public}@ to %{public}@; reloading web view",
        (uint8_t *)&v16,
        0x20u);
    }
    if ([v10 BOOLValue]) {
      [(_SFReloadOptionsController *)self _requestDesktopSiteWithFallbackURL:v7];
    }
    else {
      [(_SFReloadOptionsController *)self _requestStandardSiteWithURL:v7];
    }
  }
  perSitePreferenceValues = self->_perSitePreferenceValues;
  self->_perSitePreferenceValues = v4;
}

- (BOOL)loadedUsingDesktopUserAgent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v4 = [WeakRetained URL];

  domainToUserAgentPolicyMap = self->_domainToUserAgentPolicyMap;
  v6 = objc_msgSend(v4, "safari_highLevelDomainFromHostFallingBackToHostOrAbsoluteString");
  v7 = [(NSMutableDictionary *)domainToUserAgentPolicyMap objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 integerValue];

  if (v8)
  {
    BOOL v9 = v8 == 1;
  }
  else
  {
    v10 = objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");
    if ([(NSMutableSet *)self->_domainsOverridenAsMobile containsObject:v10])
    {
      BOOL v9 = 0;
    }
    else
    {
      v11 = [(NSDictionary *)self->_perSitePreferenceValues objectForKeyedSubscript:v10];
      v12 = v11;
      if (v11)
      {
        BOOL v9 = [v11 integerValue] == 1;
      }
      else
      {
        int64_t effectiveContentMode = self->_effectiveContentMode;
        BOOL v9 = [(NSNumber *)self->_requestDesktopSiteDefaultValue integerValue] == 1
          && effectiveContentMode != 1;
      }
    }
  }

  return v9;
}

- (void)setSupportsAdvancedPrivacyProtections:(BOOL)a3
{
  self->_supportsAdvancedPrivacyProtections = a3;
}

- (void)didUpdateRequestDesktopSiteDefaultValue:(int64_t)a3
{
  v5 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFReloadOptionsController didUpdateRequestDesktopSiteDefaultValue:](v5, a3);
  }
  v6 = [NSNumber numberWithInteger:a3];
  requestDesktopSiteDefaultValue = self->_requestDesktopSiteDefaultValue;
  self->_requestDesktopSiteDefaultValue = v6;
}

- (_SFReloadOptionsController)initWithWebView:(id)a3 activityJSController:(id)a4 perSitePreferenceManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_SFReloadOptionsController;
  v11 = [(_SFReloadOptionsController *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_webView, v8);
    objc_storeStrong((id *)&v12->_activityJSController, a4);
    objc_storeStrong((id *)&v12->_perSitePreferenceManager, a5);
    [(_SFRequestDesktopSitePreferenceManager *)v12->_perSitePreferenceManager addRequestDesktopSitePerSitePreferenceObserver:v12];
    [(_SFReloadOptionsController *)v12 _loadPerSitePreferences];
    v13 = v12;
  }

  return v12;
}

- (void)_loadPerSitePreferences
{
  objc_initWeak(&location, self);
  perSitePreferenceManager = self->_perSitePreferenceManager;
  v4 = [(_SFRequestDesktopSitePreferenceManager *)perSitePreferenceManager requestDesktopSitePreference];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke;
  v8[3] = &unk_1E5C75D80;
  objc_copyWeak(&v9, &location);
  [(_SFRequestDesktopSitePreferenceManager *)perSitePreferenceManager getDefaultPreferenceValueForPreference:v4 completionHandler:v8];

  v5 = self->_perSitePreferenceManager;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53___SFReloadOptionsController__loadPerSitePreferences__block_invoke_3;
  v6[3] = &unk_1E5C73AE8;
  objc_copyWeak(&v7, &location);
  [(_SFRequestDesktopSitePreferenceManager *)v5 getAllRequestDesktopSitePerSitePreferenceValues:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (_SFReloadOptionsController)init
{
  return [(_SFReloadOptionsController *)self initWithWebView:0 activityJSController:0 perSitePreferenceManager:0];
}

- (void)invalidate
{
}

- (BOOL)_updateSettingSource:(unint64_t)a3 domain:(id)a4
{
  id v6 = a4;
  if (!self->_tryUsingMobileIfPossible)
  {
    [(NSMutableSet *)self->_domainsOverridenAsMobile removeObject:v6];
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }
  domainsOverridenAsMobile = self->_domainsOverridenAsMobile;
  if (!domainsOverridenAsMobile)
  {
    id v8 = [MEMORY[0x1E4F1CA80] set];
    id v9 = self->_domainsOverridenAsMobile;
    self->_domainsOverridenAsMobile = v8;

    domainsOverridenAsMobile = self->_domainsOverridenAsMobile;
  }
  [(NSMutableSet *)domainsOverridenAsMobile addObject:v6];
  BOOL v10 = 1;
LABEL_8:

  return v10;
}

- (void)_overrideSettingIfNeeded:(int64_t)a3 source:(unint64_t)a4 domain:(id)a5 completion:(id)a6
{
  id v16 = a5;
  BOOL v10 = a6;
  v11 = v10;
  if (a3)
  {
    BOOL v12 = [(_SFReloadOptionsController *)self _updateSettingSource:a4 domain:v16];
    v13 = (void (*)(void *, int64_t, unint64_t))v11[2];
    if (v12)
    {
      BOOL v10 = v11;
      int64_t v14 = 0;
      unint64_t v15 = 3;
      goto LABEL_7;
    }
    BOOL v10 = v11;
    int64_t v14 = a3;
  }
  else
  {
    v13 = (void (*)(void *, int64_t, unint64_t))v10[2];
    int64_t v14 = 0;
  }
  unint64_t v15 = a4;
LABEL_7:
  v13(v10, v14, v15);
}

- (void)customUserAgentSettingForMainFrameURL:(id)a3 withTimeout:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(NSMutableDictionary *)self->_domainToUserAgentPolicyMap count])
  {
    objc_msgSend(v8, "safari_highLevelDomainFromHostFallingBackToHostOrAbsoluteString");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = [(NSMutableDictionary *)self->_domainToUserAgentPolicyMap objectForKeyedSubscript:v10];
    uint64_t v12 = [v11 integerValue];

    v13 = WBS_LOG_CHANNEL_PREFIXRequestDesktopSite();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[_SFReloadOptionsController customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:].cold.6();
      if (v12) {
        goto LABEL_4;
      }
    }
    else if (v12)
    {
LABEL_4:
      [(_SFReloadOptionsController *)self _overrideSettingIfNeeded:v12 == 1 source:1 domain:v10 completion:v9];
      goto LABEL_26;
    }
  }
  objc_msgSend(v8, "safari_userVisibleHostWithoutWWWSubdomain");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_perSitePreferenceValues)
  {
    int64_t v14 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[_SFReloadOptionsController customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:].cold.5(v14);
    }
    unint64_t v15 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[_SFReloadOptionsController customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:].cold.4();
    }
    id v16 = [(NSDictionary *)self->_perSitePreferenceValues objectForKeyedSubscript:v10];
    if (v16)
    {
      v17 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[_SFReloadOptionsController customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:](v17);
      }
      uint64_t v18 = [v16 integerValue];
      v19 = self;
      uint64_t v20 = 2;
LABEL_20:
      [(_SFReloadOptionsController *)v19 _overrideSettingIfNeeded:v18 source:v20 domain:v10 completion:v9];

      goto LABEL_26;
    }
    if (self->_requestDesktopSiteDefaultValue)
    {
      v21 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[_SFReloadOptionsController customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:]((uint64_t)&self->_requestDesktopSiteDefaultValue, v21);
      }
      uint64_t v18 = [(NSNumber *)self->_requestDesktopSiteDefaultValue integerValue];
      v19 = self;
      uint64_t v20 = 0;
      goto LABEL_20;
    }
  }
  uint64_t v22 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A690B000, v22, OS_LOG_TYPE_INFO, "Request Desktop Website per site preferences haven't been cached yet, falling back to fetching the preference directly", buf, 2u);
  }
  v23 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[_SFReloadOptionsController customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:]();
  }
  perSitePreferenceManager = self->_perSitePreferenceManager;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __98___SFReloadOptionsController_customUserAgentSettingForMainFrameURL_withTimeout_completionHandler___block_invoke;
  v25[3] = &unk_1E5C777E8;
  v25[4] = self;
  id v10 = v10;
  id v26 = v10;
  id v27 = v9;
  [(_SFRequestDesktopSitePreferenceManager *)perSitePreferenceManager getRequestDesktopSitePreferenceForDomain:v10 withTimeout:v25 completionHandler:a4];

LABEL_26:
}

- (id)customUserAgentForSetting:(int64_t)a3
{
  v5 = _SFCustomUserAgentStringIfNeeded();
  id v6 = WBS_LOG_CHANNEL_PREFIXRequestDesktopSite();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      -[_SFReloadOptionsController customUserAgentForSetting:](v6);
    }
    id v8 = v5;
    goto LABEL_11;
  }
  if (v7) {
    -[_SFReloadOptionsController customUserAgentForSetting:](v6, a3);
  }
  if (a3 == 1)
  {
    _SFMacSafariUserAgentString();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    id v9 = v8;
    goto LABEL_12;
  }
  if (self->_tryUsingMobileIfPossible)
  {
    _SFIPhoneSafariUserAgentString();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  id v9 = 0;
LABEL_12:

  return v9;
}

- (id)customNavigatorPlatformForSetting:(int64_t)a3
{
  if (a3 == 1) {
    return @"MacIntel";
  }
  else {
    return 0;
  }
}

- (void)requestDesktopSite
{
}

- (void)_requestDesktopSiteWithFallbackURL:(id)a3
{
  id v4 = a3;
  id v5 = [NSString alloc];
  id v6 = (void *)[v5 initWithBytesNoCopy:requestDesktopSiteUIActivitySource length:requestDesktopSiteUIActivitySourceLength encoding:4 freeWhenDone:0];
  activityJSController = self->_activityJSController;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65___SFReloadOptionsController__requestDesktopSiteWithFallbackURL___block_invoke;
  v9[3] = &unk_1E5C77810;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(_SFInjectedJavaScriptController *)activityJSController runJavaScriptForActivity:0 withScript:v6 object:@"DesktopSiteDataFinderJS" invokeMethod:@"desktopSiteData" completionHandler:v9];
}

- (void)requestDesktopSiteWithURL:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    BOOL v7 = [WeakRetained backForwardList];
    id v8 = [v7 currentItem];
    id v5 = [v8 initialURL];

    if (!v5) {
      goto LABEL_9;
    }
  }
  if (!self->_domainToUserAgentPolicyMap)
  {
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
    domainToUserAgentPolicyMap = self->_domainToUserAgentPolicyMap;
    self->_domainToUserAgentPolicyMap = v9;
  }
  v11 = objc_msgSend(v5, "safari_highLevelDomainFromHostFallingBackToHostOrAbsoluteString");
  if (v11)
  {
    [(NSMutableDictionary *)self->_domainToUserAgentPolicyMap setObject:&unk_1EFBDEFF8 forKeyedSubscript:v11];
    [(_SFReloadOptionsController *)self didMarkURLAsNeedingDesktopUserAgent:v5];
  }

LABEL_9:
}

- (void)_requestStandardSiteWithURL:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4) {
    goto LABEL_13;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v6 = [WeakRetained backForwardList];
  BOOL v7 = [v6 currentItem];
  id v4 = [v7 initialURL];

  if (v4)
  {
LABEL_13:
    if (!self->_domainToUserAgentPolicyMap)
    {
      id v8 = [MEMORY[0x1E4F1CA60] dictionary];
      domainToUserAgentPolicyMap = self->_domainToUserAgentPolicyMap;
      self->_domainToUserAgentPolicyMap = v8;
    }
    id v10 = objc_msgSend(v4, "safari_highLevelDomainFromHostFallingBackToHostOrAbsoluteString");
    v11 = objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");
    if (v10)
    {
      [(NSMutableDictionary *)self->_domainToUserAgentPolicyMap setObject:&unk_1EFBDF010 forKeyedSubscript:v10];
      [(_SFReloadOptionsController *)self didMarkURLAsNeedingStandardUserAgent:v4];
    }
  }
}

- (void)requestStandardSite
{
}

- (void)didMarkURLAsNeedingDesktopUserAgent:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", a3);
  objc_msgSend(v4, "safari_requestBySettingAdvancedPrivacyProtectionsFlagIsEnabled:", self->_supportsAdvancedPrivacyProtections);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v6 = (id)[WeakRetained loadRequest:v7];
}

- (void)didMarkURLAsNeedingStandardUserAgent:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", a3);
  objc_msgSend(v4, "safari_requestBySettingAdvancedPrivacyProtectionsFlagIsEnabled:", self->_supportsAdvancedPrivacyProtections);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v6 = (id)[WeakRetained loadRequest:v7];
}

- (void)didSetRequestDesktopSiteDefaultValue:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  requestDesktopSiteDefaultValue = self->_requestDesktopSiteDefaultValue;
  self->_requestDesktopSiteDefaultValue = v4;
}

- (void)didSetRequestDesktopSitePerSitePreferencesValues:(id)a3
{
  id v4 = (NSDictionary *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v5 = [WeakRetained URL];
  id v6 = objc_msgSend(v5, "safari_userVisibleHostWithoutWWWSubdomain");
  id v7 = [(NSDictionary *)self->_perSitePreferenceValues objectForKeyedSubscript:v6];
  id v8 = [(NSDictionary *)v4 objectForKeyedSubscript:v6];
  if ((WBSIsEqual() & 1) == 0)
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", v5);
    id v10 = (id)[WeakRetained loadRequest:v9];
  }
  perSitePreferenceValues = self->_perSitePreferenceValues;
  self->_perSitePreferenceValues = v4;
}

- (void)logCompletedPageloadToDifferentialPrivacy:(id)a3
{
  id v7 = a3;
  int v4 = _SFDeviceSupportsDesktopSitesByDefault();
  id v5 = v7;
  if (v4)
  {
    id v6 = objc_msgSend(v7, "safari_userVisibleHostWithoutWWWSubdomain");
    if ([v6 length])
    {
      [(_SFReloadOptionsController *)self loadedUsingDesktopUserAgent];
      WBSLogWithDifferentialPrivacy();
    }

    id v5 = v7;
  }
}

- (_SFInjectedJavaScriptController)activityJSController
{
  return self->_activityJSController;
}

- (BOOL)tryUsingMobileIfPossible
{
  return self->_tryUsingMobileIfPossible;
}

- (int64_t)effectiveContentMode
{
  return self->_effectiveContentMode;
}

- (void)setEffectiveContentMode:(int64_t)a3
{
  self->_int64_t effectiveContentMode = a3;
}

- (BOOL)supportsAdvancedPrivacyProtections
{
  return self->_supportsAdvancedPrivacyProtections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityJSController, 0);
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_domainsOverridenAsMobile, 0);
  objc_storeStrong((id *)&self->_domainToUserAgentPolicyMap, 0);
  objc_storeStrong((id *)&self->_requestDesktopSiteDefaultValue, 0);
  objc_storeStrong((id *)&self->_perSitePreferenceValues, 0);

  objc_storeStrong((id *)&self->_perSitePreferenceManager, 0);
}

- (void)didUpdateRequestDesktopSiteDefaultValue:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = NSNumber;
  int v4 = a1;
  id v5 = [v3 numberWithInteger:a2];
  id v6 = _SFStringFromRequestDesktopSiteSetting(v5);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_1A690B000, v4, v7, "Updating Request Desktop Website cached default value to %{public}@", v8);
}

- (void)didUpdateRequestDesktopSitePerSitePreference:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_2() count];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_1A690B000, v1, v3, "Updating Request Desktop Website cached mappings with %lu values", v4);
}

- (void)customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_1A690B000, v0, v1, "Fetching stored preference for domain '%{private}@'", v2);
}

- (void)customUserAgentSettingForMainFrameURL:(uint64_t)a1 withTimeout:(void *)a2 completionHandler:.cold.2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = (void *)OUTLINED_FUNCTION_2();
  uint64_t v5 = _SFStringFromRequestDesktopSiteSetting(v4);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_1A690B000, v2, v6, "In-memory cache didn't have value for domain, using cached default value: %{public}@", v7);
}

- (void)customUserAgentSettingForMainFrameURL:(void *)a1 withTimeout:completionHandler:.cold.3(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  int v4 = _SFStringFromRequestDesktopSiteSetting(v3);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_1A690B000, v1, v5, "Found Request Desktop Website in-memory cache value of %{public}@", v6);
}

- (void)customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:.cold.4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_1A690B000, v0, v1, "Checking in-memory cache of Request Desktop Website per site preferences for domain '%{private}@'", v2);
}

- (void)customUserAgentSettingForMainFrameURL:(os_log_t)log withTimeout:completionHandler:.cold.5(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A690B000, log, OS_LOG_TYPE_DEBUG, "Checking in-memory cache of Request Desktop Website per site preferences", v1, 2u);
}

- (void)customUserAgentSettingForMainFrameURL:withTimeout:completionHandler:.cold.6()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A690B000, v1, OS_LOG_TYPE_DEBUG, "Manual Request Desktop Website mapping for domain '%{private}@' gave value '%ld'", v2, 0x16u);
}

- (void)customUserAgentForSetting:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  __int16 v3 = NSNumber;
  uint64_t v4 = a1;
  uint64_t v5 = [v3 numberWithInteger:a2];
  uint64_t v6 = _SFStringFromRequestDesktopSiteSetting(v5);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_1A690B000, v4, v7, "Using Request Desktop Website setting %{public}@", v8);
}

- (void)customUserAgentForSetting:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1A690B000, log, OS_LOG_TYPE_DEBUG, "Using custom user agent string", v1, 2u);
}

@end