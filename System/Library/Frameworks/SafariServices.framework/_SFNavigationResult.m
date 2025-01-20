@interface _SFNavigationResult
+ (id)resultOfLoadingRequest:(id)a3 isMainFrame:(BOOL)a4 disallowRedirectToExternalApps:(BOOL)a5 preferredApplicationBundleIdentifier:(id)a6 redirectDecisionHandler:(id)a7;
+ (id)resultOfType:(int64_t)a3 withURL:(id)a4;
+ (id)resultWithAppLink:(id)a3;
+ (id)resultWithRedirectToExternalURL:(id)a3 preferredApplicationBundleIdentifier:(id)a4;
+ (void)determineResultOfLoadingRequest:(id)a3 isMainFrame:(BOOL)a4 disallowRedirectToExternalApps:(BOOL)a5 preferredApplicationBundleIdentifier:(id)a6 redirectDecisionHandler:(id)a7 completionHandler:(id)a8;
- (BOOL)appliesOneTimeUserInitiatedActionPolicy;
- (BOOL)isRedirectToAppleServices;
- (BOOL)loadWasUserDriven;
- (BOOL)shouldPromptWithPolicy:(int64_t)a3 telephonyNavigationPolicy:(id)a4 userAction:(id)a5 inBackgroundOrPrivateBrowsing:(BOOL)a6 inLockdownMode:(BOOL)a7;
- (LSApplicationProxy)externalApplication;
- (NSURL)URL;
- (WBSAppLink)appLink;
- (id)_initWithType:(int64_t)a3 URL:(id)a4 externalApplication:(id)a5 appLink:(id)a6;
- (int64_t)externalApplicationCategory;
- (int64_t)type;
- (void)setLoadWasUserDriven:(BOOL)a3;
@end

@implementation _SFNavigationResult

- (id)_initWithType:(int64_t)a3 URL:(id)a4 externalApplication:(id)a5 appLink:(id)a6
{
  v10 = (NSURL *)a4;
  v11 = (LSApplicationProxy *)a5;
  v12 = (WBSAppLink *)a6;
  v21.receiver = self;
  v21.super_class = (Class)_SFNavigationResult;
  v13 = [(_SFNavigationResult *)&v21 init];
  externalApplication = v13->_externalApplication;
  v13->_externalApplication = v11;
  v15 = v11;

  if (a3 == 3) {
    uint64_t v16 = categoryForURL(v10);
  }
  else {
    uint64_t v16 = 0;
  }
  v13->_externalApplicationCategory = v16;
  v13->_type = a3;
  URL = v13->_URL;
  v13->_URL = v10;
  v18 = v10;

  appLink = v13->_appLink;
  v13->_appLink = v12;

  return v13;
}

- (BOOL)appliesOneTimeUserInitiatedActionPolicy
{
  return self->_externalApplicationCategory == 2;
}

- (BOOL)isRedirectToAppleServices
{
  v2 = [(LSApplicationProxy *)self->_externalApplication bundleIdentifier];
  if (v2) {
    char v3 = [&unk_1EFBDF9D0 containsObject:v2];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)shouldPromptWithPolicy:(int64_t)a3 telephonyNavigationPolicy:(id)a4 userAction:(id)a5 inBackgroundOrPrivateBrowsing:(BOOL)a6 inLockdownMode:(BOOL)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  v14 = [(LSApplicationProxy *)self->_externalApplication bundleIdentifier];
  char v15 = [v14 hasPrefix:@"com.apple."];

  if (v12) {
    int v16 = [v12 policyAppliesToURL:self->_URL];
  }
  else {
    int v16 = 0;
  }
  switch(a3)
  {
    case 3:
      if (self->_externalApplication) {
        char v18 = v16;
      }
      else {
        char v18 = 1;
      }
      char v17 = v18 ^ 1;
      if ((v18 & 1) == 0 && !v8 && !a7)
      {
        if (([(NSURL *)self->_URL safari_hasScheme:@"icloud-sharing"] & 1) != 0
          || ([(NSURL *)self->_URL safari_hasScheme:@"com.apple.tv"] & 1) != 0)
        {
          goto LABEL_16;
        }
        if ([(_SFNavigationResult *)self isRedirectToAppleServices])
        {
          char v20 = [(NSURL *)self->_URL safari_hasScheme:@"itms-apps"];
          goto LABEL_26;
        }
LABEL_27:
        char v17 = 1;
      }
      break;
    case 2:
      char v17 = v16 ^ 1;
      if (((v16 | v8) & 1) == 0 && !a7)
      {
        if (![(_SFNavigationResult *)self appliesOneTimeUserInitiatedActionPolicy])
        {
          char v17 = v15 ^ 1;
          break;
        }
        if (v13)
        {
          char v20 = [v13 isConsumed];
LABEL_26:
          char v17 = v20;
          break;
        }
        goto LABEL_27;
      }
      break;
    case 1:
      char v17 = (self->_externalApplication != 0) & ~(_BYTE)v16 & a7 | v15 ^ 1;
      break;
    default:
LABEL_16:
      char v17 = 0;
      break;
  }

  return v17;
}

+ (id)resultOfType:(int64_t)a3 withURL:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) _initWithType:a3 URL:v6 externalApplication:0 appLink:0];

  return v7;
}

+ (id)resultWithRedirectToExternalURL:(id)a3 preferredApplicationBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v9 = [v8 applicationsAvailableForOpeningURL:v6];

  if ([v9 count])
  {
    if (!v7) {
      goto LABEL_4;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __92___SFNavigationResult_resultWithRedirectToExternalURL_preferredApplicationBundleIdentifier___block_invoke;
    v13[3] = &unk_1E5C78230;
    id v14 = v7;
    v10 = objc_msgSend(v9, "safari_firstObjectPassingTest:", v13);

    if (!v10)
    {
LABEL_4:
      v10 = [v9 objectAtIndexedSubscript:0];
    }
    v11 = (void *)[objc_alloc((Class)a1) _initWithType:3 URL:v6 externalApplication:v10 appLink:0];
  }
  else
  {
    v11 = [a1 resultOfType:0 withURL:v6];
  }

  return v11;
}

+ (id)resultWithAppLink:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [v4 url];
  id v7 = [v4 synchronousTargetApplicationProxy];
  BOOL v8 = (void *)[v5 _initWithType:3 URL:v6 externalApplication:v7 appLink:v4];

  return v8;
}

+ (id)resultOfLoadingRequest:(id)a3 isMainFrame:(BOOL)a4 disallowRedirectToExternalApps:(BOOL)a5 preferredApplicationBundleIdentifier:(id)a6 redirectDecisionHandler:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a6;
  id v13 = (uint64_t (**)(id, void *))a7;
  id v14 = [v11 URL];
  char v15 = v14;
  if (v10 && !v9)
  {
    if (objc_msgSend(v14, "safari_hasFeedScheme"))
    {
      int v16 = +[_SFNavigationResult resultWithRedirectToExternalURL:v15 preferredApplicationBundleIdentifier:v12];
      goto LABEL_49;
    }
    if (v15)
    {
      char v17 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      char v18 = [v17 URLOverrideForURL:v15];
    }
    else
    {
      v19 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        +[_SFNavigationResult resultOfLoadingRequest:isMainFrame:disallowRedirectToExternalApps:preferredApplicationBundleIdentifier:redirectDecisionHandler:](v19);
      }
      char v18 = 0;
    }
    char v20 = [v18 scheme];
    objc_super v21 = [v15 scheme];
    if ([v20 caseInsensitiveCompare:v21])
    {
      v22 = [v18 scheme];
      if ([v22 caseInsensitiveCompare:@"fb"])
      {
        int IsPad = _SFDeviceIsPad();
        char v24 = IsPad;
        if (IsPad
          && ([v18 scheme],
              v42 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v42, "safari_isCaseInsensitiveEqualToString:", @"maps")))
        {
          v25 = [v15 host];
          if (objc_msgSend(v25, "safari_isCaseInsensitiveEqualToString:", @"maps.apple.com"))
          {
            v41 = v25;
            v26 = [v15 path];
            if (objc_msgSend(v26, "safari_hasPrefix:", @"/place"))
            {
              char v43 = 0;
            }
            else if (v13)
            {
              char v43 = v13[2](v13, v18);
            }
            else
            {
              char v43 = 1;
            }

            v25 = v41;
          }
          else if (v13)
          {
            char v43 = v13[2](v13, v18);
          }
          else
          {
            char v43 = 1;
          }

          v27 = v42;
        }
        else
        {
          if (v13) {
            char v43 = v13[2](v13, v18);
          }
          else {
            char v43 = 1;
          }
          v27 = v42;
          if ((v24 & 1) == 0)
          {
LABEL_33:

            if (v43)
            {
              v28 = v18;
              id v29 = 0;
LABEL_35:
              uint64_t v30 = +[_SFNavigationResult resultWithRedirectToExternalURL:v28 preferredApplicationBundleIdentifier:v29];
LABEL_47:
              int v16 = (void *)v30;
              goto LABEL_48;
            }
            goto LABEL_36;
          }
        }

        goto LABEL_33;
      }
    }
LABEL_36:
  }
  char v18 = [v15 radarWebURL];
  if (!v18)
  {
    if ([MEMORY[0x1E4F46740] _canHandleRequest:v11]
      || ([v11 URL],
          v33 = objc_claimAutoreleasedReturnValue(),
          int v34 = objc_msgSend(v33, "safari_isSafariWebExtensionURL"),
          v33,
          v34))
    {
LABEL_44:
      uint64_t v31 = 1;
LABEL_45:
      v32 = v15;
      goto LABEL_46;
    }
    if (!objc_msgSend(v15, "safari_isXWebSearchURL"))
    {
      if (categoryForURL(v15) == 1)
      {
        v36 = objc_msgSend(v15, "safari_originalDataAsString");
        unint64_t v37 = [v36 length];

        if (v37 >= 0x3E9)
        {
          uint64_t v31 = 0;
          goto LABEL_45;
        }
        if ([v15 isFaceTimeMultiwayURL])
        {
          v38 = (void *)[objc_alloc(MEMORY[0x1E4FADBE8]) initWithURL:v15];
          v39 = v38;
          if (!v38)
          {
            int v16 = +[_SFNavigationResult resultOfType:0 withURL:v15];
            goto LABEL_67;
          }
          [v38 setShowUIPrompt:1];
LABEL_60:
          v40 = [v39 URL];
          int v16 = +[_SFNavigationResult resultWithRedirectToExternalURL:v40 preferredApplicationBundleIdentifier:0];

LABEL_67:
          goto LABEL_48;
        }
        v39 = (void *)[objc_alloc(MEMORY[0x1E4FADBC0]) initWithURL:v15];
        [v39 setShowUIPrompt:1];
        if ([v39 isValid]) {
          goto LABEL_60;
        }
      }
      if (!v9)
      {
        if (!objc_msgSend(v15, "safari_isMarketplaceKitURL"))
        {
          v28 = v15;
          id v29 = v12;
          goto LABEL_35;
        }
        goto LABEL_44;
      }
    }
    uint64_t v31 = 0;
    v32 = 0;
    goto LABEL_46;
  }
  if (v9)
  {
LABEL_41:
    uint64_t v31 = 2;
    v32 = v18;
LABEL_46:
    uint64_t v30 = +[_SFNavigationResult resultOfType:v31 withURL:v32];
    goto LABEL_47;
  }
  int v16 = +[_SFNavigationResult resultWithRedirectToExternalURL:v15 preferredApplicationBundleIdentifier:0];
  if ([v16 type] != 3)
  {

    goto LABEL_41;
  }
LABEL_48:

LABEL_49:

  return v16;
}

+ (void)determineResultOfLoadingRequest:(id)a3 isMainFrame:(BOOL)a4 disallowRedirectToExternalApps:(BOOL)a5 preferredApplicationBundleIdentifier:(id)a6 redirectDecisionHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__13;
  v29[4] = __Block_byref_object_dispose__13;
  id v30 = (id)MEMORY[0x1AD0C36A0](a8);
  if (navigationResultQueue_onceToken != -1) {
    dispatch_once(&navigationResultQueue_onceToken, &__block_literal_global_61);
  }
  char v17 = navigationResultQueue_navigationResultQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __177___SFNavigationResult_determineResultOfLoadingRequest_isMainFrame_disallowRedirectToExternalApps_preferredApplicationBundleIdentifier_redirectDecisionHandler_completionHandler___block_invoke;
  v21[3] = &unk_1E5C78258;
  BOOL v27 = a4;
  BOOL v28 = a5;
  id v22 = v14;
  id v23 = v15;
  id v24 = v16;
  v25 = v29;
  id v26 = a1;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(v17, v21);

  _Block_object_dispose(v29, 8);
}

- (LSApplicationProxy)externalApplication
{
  return self->_externalApplication;
}

- (int64_t)externalApplicationCategory
{
  return self->_externalApplicationCategory;
}

- (int64_t)type
{
  return self->_type;
}

- (NSURL)URL
{
  return self->_URL;
}

- (WBSAppLink)appLink
{
  return self->_appLink;
}

- (BOOL)loadWasUserDriven
{
  return self->_loadWasUserDriven;
}

- (void)setLoadWasUserDriven:(BOOL)a3
{
  self->_loadWasUserDriven = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLink, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_externalApplication, 0);
}

+ (void)resultOfLoadingRequest:(os_log_t)log isMainFrame:disallowRedirectToExternalApps:preferredApplicationBundleIdentifier:redirectDecisionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A690B000, log, OS_LOG_TYPE_FAULT, "Attempting to create _SFNavigationResult app redirect URL with nil input URL, which would crash", v1, 2u);
}

@end