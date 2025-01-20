@interface ASCAppLaunchTrampoline
+ (OS_os_log)log;
- (ASCAppLaunchTrampoline)init;
- (ASCAppLaunchTrampoline)initWithWorkspace:(id)a3;
- (ASCAppLaunchTrampolineWorkspace)workspace;
- (id)handleURL:(id)a3;
- (id)handleURL:(id)a3 workspace:(id)a4;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5 workspace:(id)a6;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 workspace:(id)a5;
- (id)productPageURLForAdamId:(id)a3 deeplink:(id)a4 eventId:(id)a5 encodedMetrics:(id)a6 sourceApplication:(id)a7;
- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4;
- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4 encodedMetrics:(id)a5;
- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4 encodedMetrics:(id)a5 sourceApplication:(id)a6;
@end

@implementation ASCAppLaunchTrampoline

+ (OS_os_log)log
{
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)log_log_0;

  return (OS_os_log *)v2;
}

uint64_t __29__ASCAppLaunchTrampoline_log__block_invoke()
{
  log_log_0 = (uint64_t)os_log_create("com.apple.AppStoreComponents", "ASCAppLaunchTrampoline");

  return MEMORY[0x1F41817F8]();
}

- (ASCAppLaunchTrampoline)init
{
  v3 = +[ASCWorkspace sharedWorkspace];
  v4 = [(ASCAppLaunchTrampoline *)self initWithWorkspace:v3];

  return v4;
}

- (ASCAppLaunchTrampoline)initWithWorkspace:(id)a3
{
  id v5 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v9.receiver = self;
  v9.super_class = (Class)ASCAppLaunchTrampoline;
  v6 = [(ASCAppLaunchTrampoline *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_workspace, a3);
  }

  return v7;
}

- (id)handleURL:(id)a3
{
  return [(ASCAppLaunchTrampoline *)self handleURL:a3 workspace:self->_workspace];
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4
{
  return [(ASCAppLaunchTrampoline *)self openApplicationWithBundleIdentifier:a3 payloadURL:a4 workspace:self->_workspace];
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5
{
  return [(ASCAppLaunchTrampoline *)self openApplicationWithBundleIdentifier:a3 payloadURL:a4 universalLinkRequired:a5 workspace:self->_workspace];
}

- (id)handleURL:(id)a3 workspace:(id)a4
{
  v109[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v78 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F4DDB0]);
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v5 resolvingAgainstBaseURL:1];
  v77 = v7;
  if (_os_feature_enabled_impl())
  {
    v8 = [v5 host];
    objc_super v9 = [v8 lowercaseString];
    int v10 = [v9 isEqualToString:@"restoreappstore"];

    if (v10)
    {
      v11 = +[ASCAppLaunchTrampoline log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C2B8D000, v11, OS_LOG_TYPE_INFO, "Received request to install app store", buf, 2u);
      }

      v12 = +[ASCUtilities shared];
      id v13 = [v12 restoreAppStore];

      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke;
      v100[3] = &unk_1E645D710;
      id v14 = v6;
      id v101 = v14;
      [v13 addSuccessBlock:v100];
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_12;
      v98[3] = &unk_1E645D738;
      id v15 = v14;
      id v99 = v15;
      [v13 addErrorBlock:v98];
      id v16 = v15;

      v17 = v101;
      goto LABEL_60;
    }
  }
  if (!v7
    || ([v7 queryItems],
        v18 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = [v18 count],
        v18,
        !v19))
  {
    v59 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v108 = *MEMORY[0x1E4F28568];
    v109[0] = @"Failed while parsing input URL, URL components was nil or empty.";
    v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:&v108 count:1];
    v61 = v59;
    uint64_t v62 = 0;
LABEL_52:
    id v13 = [v61 errorWithDomain:@"ASCAppLaunchTrampolineErrorDomain" code:v62 userInfo:v60];

    [v6 finishWithError:v13];
    id v64 = v6;
    goto LABEL_61;
  }
  v20 = [v5 host];
  v21 = [v20 lowercaseString];
  char v22 = [v21 isEqualToString:@"launchapp"];

  if ((v22 & 1) == 0)
  {
    v63 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v106 = *MEMORY[0x1E4F28568];
    v107 = @"Received URL unsuitable for app launch trampoline.";
    v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
    v61 = v63;
    uint64_t v62 = 1;
    goto LABEL_52;
  }
  v75 = v6;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v23 = [v7 queryItems];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v94 objects:v105 count:16];
  if (!v24)
  {

    id v79 = 0;
    id v80 = 0;
    id v81 = 0;
    id v82 = 0;
    v83 = 0;
    id v13 = 0;
    goto LABEL_55;
  }
  uint64_t v25 = v24;
  id v74 = v5;
  id v13 = 0;
  id v82 = 0;
  v83 = 0;
  id v80 = 0;
  id v81 = 0;
  id v79 = 0;
  uint64_t v26 = *(void *)v95;
  do
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v95 != v26) {
        objc_enumerationMutation(v23);
      }
      v28 = *(void **)(*((void *)&v94 + 1) + 8 * i);
      v29 = [v28 name];
      v30 = [v29 lowercaseString];
      if ([v30 isEqualToString:@"appid"])
      {
        v31 = [v28 value];

        if (v31)
        {
          id v32 = v28;

          id v13 = v32;
          continue;
        }
      }
      else
      {
      }
      v33 = [v28 name];
      v34 = [v33 lowercaseString];
      if ([v34 isEqualToString:@"bundleid"])
      {
        v35 = [v28 value];

        if (v35)
        {
          id v36 = v28;

          v83 = v36;
          continue;
        }
      }
      else
      {
      }
      v37 = [v28 name];
      v38 = [v37 lowercaseString];
      if ([v38 isEqualToString:@"deeplink"])
      {
        v39 = [v28 value];

        if (v39)
        {
          id v40 = v28;

          id v82 = v40;
          continue;
        }
      }
      else
      {
      }
      v41 = [v28 name];
      v42 = [v41 lowercaseString];
      if ([v42 isEqualToString:@"eventid"])
      {
        v43 = [v28 value];

        if (v43)
        {
          id v44 = v28;

          id v80 = v44;
          continue;
        }
      }
      else
      {
      }
      v45 = [v28 name];
      v46 = [v45 lowercaseString];
      if ([v46 isEqualToString:@"trampolinemetrics"])
      {
        v47 = [v28 value];

        if (v47)
        {
          id v48 = v28;

          id v81 = v48;
          continue;
        }
      }
      else
      {
      }
      v49 = [v28 name];
      v50 = [v49 lowercaseString];
      if ([v50 isEqualToString:@"sourceapplication"])
      {
        v51 = [v28 value];

        if (v51)
        {
          id v52 = v28;

          id v79 = v52;
          continue;
        }
      }
      else
      {
      }
      v53 = [v28 name];
      v54 = [v53 lowercaseString];
      if ([v54 isEqualToString:@"metrics"])
      {
        v55 = [v28 value];

        if (v55 && !v81) {
          id v81 = v28;
        }
      }
      else
      {
      }
    }
    uint64_t v25 = [v23 countByEnumeratingWithState:&v94 objects:v105 count:16];
  }
  while (v25);

  if (!v13)
  {
    id v5 = v74;
    id v6 = v75;
    goto LABEL_55;
  }
  id v5 = v74;
  id v6 = v75;
  if (!v83)
  {
LABEL_55:
    v65 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v103 = *MEMORY[0x1E4F28568];
    v104 = @"Missing required parameters for app launch.";
    v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
    v56 = [v65 errorWithDomain:@"ASCAppLaunchTrampolineErrorDomain" code:2 userInfo:v66];

    [v6 finishWithError:v56];
    id v67 = v6;
    goto LABEL_59;
  }
  v56 = [v82 value];

  if (v56)
  {
    v57 = [v82 value];
    v58 = [v57 stringByRemovingPercentEncoding];

    if (v58)
    {
      v56 = [MEMORY[0x1E4F1CB10] URLWithString:v58];
    }
    else
    {
      v56 = 0;
    }
  }
  v68 = [v83 value];
  v69 = [v78 openApplicationWithBundleIdentifier:v68 payloadURL:v56];

  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_50;
  v92[3] = &unk_1E645D710;
  id v70 = v75;
  id v93 = v70;
  [v69 addSuccessBlock:v92];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_2;
  v84[3] = &unk_1E645D788;
  v84[4] = self;
  id v13 = v13;
  id v85 = v13;
  id v82 = v82;
  id v86 = v82;
  id v80 = v80;
  id v87 = v80;
  id v81 = v81;
  id v88 = v81;
  id v79 = v79;
  id v89 = v79;
  id v71 = v70;
  id v90 = v71;
  id v91 = v78;
  [v69 addErrorBlock:v84];
  id v72 = v71;

LABEL_59:
  v17 = v83;
LABEL_60:

LABEL_61:

  return v6;
}

void __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke(uint64_t a1)
{
  v2 = +[ASCAppLaunchTrampoline log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C2B8D000, v2, OS_LOG_TYPE_INFO, "Successfully initiated App Store reinstall", v5, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = [NSNumber numberWithInt:1];
  [v3 finishWithResult:v4];
}

void __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[ASCAppLaunchTrampoline log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_12_cold_1((uint64_t)v3, v4);
  }

  [*(id *)(a1 + 32) finishWithError:v3];
}

void __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_50(uint64_t a1)
{
  id v2 = [NSNumber numberWithInt:0];
  [*(id *)(a1 + 32) finishWithResult:v2];
}

void __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[ASCAppLaunchTrampoline log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v3;
    _os_log_impl(&dword_1C2B8D000, v4, OS_LOG_TYPE_INFO, "Unable to open application, reason %{public}@. Attempting to open product page URL", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) value];
  v7 = [*(id *)(a1 + 48) value];
  v8 = [*(id *)(a1 + 56) value];
  objc_super v9 = [*(id *)(a1 + 64) value];
  int v10 = [*(id *)(a1 + 72) value];
  v11 = [v5 productPageURLForAdamId:v6 deeplink:v7 eventId:v8 encodedMetrics:v9 sourceApplication:v10];

  if (v11)
  {
    v12 = [*(id *)(a1 + 88) openProductURL:v11];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_54;
    v15[3] = &unk_1E645D760;
    id v16 = *(id *)(a1 + 80);
    [v12 addFinishBlock:v15];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18 = @"Failed to construct product page URL.";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v12 = [v13 errorWithDomain:@"ASCAppLaunchTrampolineErrorDomain" code:3 userInfo:v14];

    [*(id *)(a1 + 80) finishWithError:v12];
  }
}

void __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_54(uint64_t a1, int a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [NSNumber numberWithInt:1];
    [*(id *)(a1 + 32) finishWithResult:v6];
  }
  else
  {
    v7 = +[ASCAppLaunchTrampoline log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_54_cold_1((uint64_t)v5, v7);
    }

    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"Failed to open product page.";
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v6 = [v8 errorWithDomain:@"ASCAppLaunchTrampolineErrorDomain" code:4 userInfo:v9];

    [*(id *)(a1 + 32) finishWithError:v6];
  }
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 workspace:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F4DDB0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v7);
  v12 = [v8 openApplicationWithBundleIdentifier:v10 payloadURL:v9];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_workspace___block_invoke;
  v20[3] = &unk_1E645D710;
  id v13 = v11;
  id v21 = v13;
  [v12 addSuccessBlock:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_workspace___block_invoke_2;
  v18[3] = &unk_1E645D738;
  id v14 = v13;
  id v19 = v14;
  [v12 addErrorBlock:v18];
  id v15 = v19;
  id v16 = v14;

  return v16;
}

void __83__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_workspace___block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithInt:0];
  [*(id *)(a1 + 32) finishWithResult:v2];
}

void __83__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_workspace___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v6[0] = @"Failed to open app.";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  v4 = [v2 errorWithDomain:@"ASCAppLaunchTrampolineErrorDomain" code:5 userInfo:v3];

  [*(id *)(a1 + 32) finishWithError:v4];
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5 workspace:(id)a6
{
  BOOL v6 = a5;
  id v9 = (objc_class *)MEMORY[0x1E4F4DDB0];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(v9);
  id v14 = [v10 openApplicationWithBundleIdentifier:v12 payloadURL:v11 universalLinkRequired:v6];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __105__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired_workspace___block_invoke;
  v22[3] = &unk_1E645D710;
  id v15 = v13;
  id v23 = v15;
  [v14 addSuccessBlock:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __105__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired_workspace___block_invoke_2;
  v20[3] = &unk_1E645D738;
  id v16 = v15;
  id v21 = v16;
  [v14 addErrorBlock:v20];
  uint64_t v17 = v21;
  id v18 = v16;

  return v18;
}

void __105__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired_workspace___block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithInt:0];
  [*(id *)(a1 + 32) finishWithResult:v2];
}

void __105__ASCAppLaunchTrampoline_openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired_workspace___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v6[0] = @"Failed to open app.";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  v4 = [v2 errorWithDomain:@"ASCAppLaunchTrampolineErrorDomain" code:5 userInfo:v3];

  [*(id *)(a1 + 32) finishWithError:v4];
}

- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4
{
  return [(ASCAppLaunchTrampoline *)self productPageURLForAdamId:a3 eventId:a4 encodedMetrics:0];
}

- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4 encodedMetrics:(id)a5
{
  return [(ASCAppLaunchTrampoline *)self productPageURLForAdamId:a3 eventId:a4 encodedMetrics:a5 sourceApplication:0];
}

- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4 encodedMetrics:(id)a5 sourceApplication:(id)a6
{
  return [(ASCAppLaunchTrampoline *)self productPageURLForAdamId:a3 deeplink:0 eventId:a4 encodedMetrics:a5 sourceApplication:a6];
}

- (id)productPageURLForAdamId:(id)a3 deeplink:(id)a4 eventId:(id)a5 encodedMetrics:(id)a6 sourceApplication:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = [[ASCAdamID alloc] initWithStringValue:v15];

  uint64_t v17 = +[ASCLockupProductDetails URLForLockupID:v16 ofKind:@"app" withOfferFlags:0];
  if (v17 && (v11 || v12 || v13))
  {
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v17 resolvingAgainstBaseURL:0];
    id v19 = [v18 queryItems];
    id v20 = (id)[v19 mutableCopy];

    if (!v20) {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    if (v11)
    {
      id v21 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"deeplink" value:v11];
      [v20 addObject:v21];
    }
    if (v12)
    {
      char v22 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"eventid" value:v12];
      [v20 addObject:v22];
    }
    if (v13)
    {
      id v23 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"trampolineMetrics" value:v13];
      [v20 addObject:v23];
    }
    if (v14)
    {
      uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"sourceApplication" value:v14];
      [v20 addObject:v24];
    }
    [v18 setQueryItems:v20];
    uint64_t v25 = [v18 URL];

    uint64_t v17 = (void *)v25;
  }

  return v17;
}

- (ASCAppLaunchTrampolineWorkspace)workspace
{
  return self->_workspace;
}

- (void).cxx_destruct
{
}

void __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_12_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2B8D000, a2, OS_LOG_TYPE_ERROR, "Failed to initiate App Store reinstall with: %@", (uint8_t *)&v2, 0xCu);
}

void __46__ASCAppLaunchTrampoline_handleURL_workspace___block_invoke_54_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2B8D000, a2, OS_LOG_TYPE_ERROR, "Unable to open product page, reason %{public}@", (uint8_t *)&v2, 0xCu);
}

@end