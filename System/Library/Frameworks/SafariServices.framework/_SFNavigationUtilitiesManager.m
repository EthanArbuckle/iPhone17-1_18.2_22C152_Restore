@interface _SFNavigationUtilitiesManager
+ (id)_sharedUserAgentQuirksManager;
- (BOOL)_shouldOverrideUserAgentSettingForFacebookAuthURL:(id)a3;
- (BOOL)isContentBlockersPerSiteSettingEnabled;
- (WBSUserDefinedContentBlockerManager)userDefinedContentBlockerManager;
- (_SFBrowserDocument)browserDocument;
- (_SFNavigationUtilitiesManager)initWithPerSitePreferencesVendor:(id)a3;
- (_SFReloadOptionsController)reloadOptionsController;
- (int64_t)persona;
- (void)_applyAutoplayQuirksToWebsitePolicies:(id)a3 desktopSiteSetting:(int64_t)a4;
- (void)setBrowserDocument:(id)a3;
- (void)setPersona:(int64_t)a3;
- (void)setReloadOptionsController:(id)a3;
- (void)setUserDefinedContentBlockerManager:(id)a3;
- (void)websitePoliciesForURL:(id)a3 isForMainFrameNavigation:(BOOL)a4 navigationType:(int64_t)a5 completionHandler:(id)a6;
@end

@implementation _SFNavigationUtilitiesManager

- (void)setReloadOptionsController:(id)a3
{
}

- (void)setUserDefinedContentBlockerManager:(id)a3
{
}

- (void)setBrowserDocument:(id)a3
{
}

- (_SFNavigationUtilitiesManager)initWithPerSitePreferencesVendor:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFNavigationUtilitiesManager;
  v6 = [(_SFNavigationUtilitiesManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_preferencesVendor, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)_sharedUserAgentQuirksManager
{
  if (_sharedUserAgentQuirksManager_onceToken != -1) {
    dispatch_once(&_sharedUserAgentQuirksManager_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)_sharedUserAgentQuirksManager_quirksManager;

  return v2;
}

- (void)_applyAutoplayQuirksToWebsitePolicies:(id)a3 desktopSiteSetting:(int64_t)a4
{
  id v17 = a3;
  cachedPlayingPauseQuirkEnabled = self->_cachedPlayingPauseQuirkEnabled;
  if (!cachedPlayingPauseQuirkEnabled)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    objc_msgSend(v7, "safari_numberForKey:", *MEMORY[0x1E4F788B0]);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->_cachedPlayingPauseQuirkEnabled;
    self->_cachedPlayingPauseQuirkEnabled = v8;

    cachedPlayingPauseQuirkEnabled = self->_cachedPlayingPauseQuirkEnabled;
  }
  BOOL v10 = [(NSNumber *)cachedPlayingPauseQuirkEnabled BOOLValue];
  cachedPerDocumentAutoplayBehaviorQuirkEnabled = self->_cachedPerDocumentAutoplayBehaviorQuirkEnabled;
  if (!cachedPerDocumentAutoplayBehaviorQuirkEnabled)
  {
    v12 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    objc_msgSend(v12, "safari_numberForKey:", *MEMORY[0x1E4F78998]);
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = self->_cachedPerDocumentAutoplayBehaviorQuirkEnabled;
    self->_cachedPerDocumentAutoplayBehaviorQuirkEnabled = v13;

    cachedPerDocumentAutoplayBehaviorQuirkEnabled = self->_cachedPerDocumentAutoplayBehaviorQuirkEnabled;
  }
  uint64_t v15 = a4 == 1 || v10;
  if ([(NSNumber *)cachedPerDocumentAutoplayBehaviorQuirkEnabled BOOLValue]) {
    uint64_t v16 = v15 | 8;
  }
  else {
    uint64_t v16 = v15;
  }
  [v17 _setAllowedAutoplayQuirks:v16];
}

- (void)websitePoliciesForURL:(id)a3 isForMainFrameNavigation:(BOOL)a4 navigationType:(int64_t)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v9 = a3;
  id v10 = a6;
  id v11 = objc_alloc_init(MEMORY[0x1E4F46700]);
  v12 = [(_SFNavigationUtilitiesManager *)self reloadOptionsController];
  if (v12) {
    BOOL v13 = v7;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13 && _SFDeviceSupportsDesktopSitesByDefault()) {
    [(_SFNavigationUtilitiesManager *)self _applyAutoplayQuirksToWebsitePolicies:v11 desktopSiteSetting:1];
  }
  v14 = objc_msgSend(v9, "safari_userVisibleHostWithoutWWWSubdomain");
  if ([v14 length])
  {
    v33 = v10;
    uint64_t v15 = dispatch_group_create();
    uint64_t v16 = v15;
    if (v13)
    {
      dispatch_group_enter(v15);
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke;
      v59[3] = &unk_1E5C76AC8;
      v59[4] = self;
      id v60 = v9;
      id v61 = v11;
      v62 = v16;
      [v12 customUserAgentSettingForMainFrameURL:v60 withTimeout:v59 completionHandler:0.02];
    }
    v32 = v12;
    id v17 = [v9 host];
    uint64_t v18 = [(_SFNavigationUtilitiesManager *)self userDefinedContentBlockerManager];
    v19 = (void *)v18;
    if (v7
      && v18
      && [v17 length]
      && [MEMORY[0x1E4F98AF8] isScribbleEnabled])
    {
      dispatch_group_enter(v16);
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_4;
      v56[3] = &unk_1E5C76AF0;
      v56[4] = self;
      id v57 = v11;
      v58 = v16;
      [v19 getAllPaintingAvoidanceSelectorsThatApplyToHost:v17 completionHandler:v56];
    }
    v31 = v19;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_5;
    v50[3] = &unk_1E5C76B18;
    id v21 = v14;
    CFAbsoluteTime v55 = Current;
    id v51 = v21;
    v52 = self;
    id v22 = v11;
    id v53 = v22;
    v23 = v16;
    v54 = v23;
    v24 = (void *)MEMORY[0x1AD0C36A0](v50);
    dispatch_group_enter(v23);
    v25 = [(_SFPerSitePreferencesVendor *)self->_preferencesVendor contentBlockersPreferenceManager];
    [v25 getContentBlockersEnabledStateForDomain:v21 withTimeout:1 fallbackEnabledState:v24 completionHandler:0.02];

    if ([MEMORY[0x1E4F98F60] isLockdownModeEnabledForSafari])
    {
      dispatch_group_enter(v23);
      v26 = [(_SFPerSitePreferencesVendor *)self->_preferencesVendor lockdownModePreferenceManager];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_19;
      v47[3] = &unk_1E5C74660;
      v47[4] = self;
      id v48 = v22;
      v49 = v23;
      [v26 getLockdownModeEnabledForDomain:v21 withTimeout:1 fallbackEnabledState:v47 usingBlock:0.02];
    }
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    char v46 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = __Block_byref_object_copy__7;
    v43[4] = __Block_byref_object_dispose__7;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_20;
    v39[3] = &unk_1E5C76B40;
    v42 = v45;
    v39[4] = self;
    id v41 = v33;
    id v40 = v22;
    id v44 = (id)MEMORY[0x1AD0C36A0](v39);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_2_21;
    block[3] = &unk_1E5C723B0;
    block[4] = v43;
    dispatch_block_t v27 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    v28 = MEMORY[0x1E4F14428];
    dispatch_group_notify(v23, MEMORY[0x1E4F14428], v27);
    dispatch_time_t v29 = dispatch_time(0, 20000000);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __113___SFNavigationUtilitiesManager_websitePoliciesForURL_isForMainFrameNavigation_navigationType_completionHandler___block_invoke_3_22;
    v34[3] = &unk_1E5C76B68;
    v36 = v45;
    v37 = v43;
    id v35 = v27;
    id v30 = v27;
    dispatch_after(v29, v28, v34);

    id v10 = v33;
    _Block_object_dispose(v43, 8);

    _Block_object_dispose(v45, 8);
    v12 = v32;
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v11);
  }
}

- (BOOL)_shouldOverrideUserAgentSettingForFacebookAuthURL:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_persona == 1)
  {
    v6 = [v4 host];
    if (objc_msgSend(v6, "safari_isCaseInsensitiveEqualToString:", @"m.facebook.com"))
    {
      BOOL v7 = [v5 path];
      char v8 = [v7 hasSuffix:@"/dialog/oauth"];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (_SFReloadOptionsController)reloadOptionsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reloadOptionsController);

  return (_SFReloadOptionsController *)WeakRetained;
}

- (int64_t)persona
{
  return self->_persona;
}

- (void)setPersona:(int64_t)a3
{
  self->_persona = a3;
}

- (_SFBrowserDocument)browserDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserDocument);

  return (_SFBrowserDocument *)WeakRetained;
}

- (WBSUserDefinedContentBlockerManager)userDefinedContentBlockerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userDefinedContentBlockerManager);

  return (WBSUserDefinedContentBlockerManager *)WeakRetained;
}

- (BOOL)isContentBlockersPerSiteSettingEnabled
{
  return self->_isContentBlockersPerSiteSettingEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userDefinedContentBlockerManager);
  objc_destroyWeak((id *)&self->_browserDocument);
  objc_destroyWeak((id *)&self->_reloadOptionsController);
  objc_storeStrong((id *)&self->_cachedPerDocumentAutoplayBehaviorQuirkEnabled, 0);
  objc_storeStrong((id *)&self->_cachedPlayingPauseQuirkEnabled, 0);

  objc_storeStrong((id *)&self->_preferencesVendor, 0);
}

@end