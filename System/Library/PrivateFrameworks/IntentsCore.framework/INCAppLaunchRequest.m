@interface INCAppLaunchRequest
+ (id)removeDenyListedApplicationProxies:(id)a3;
+ (id)specialElementIdentifierForBundleIdentifier:(id)a3;
+ (void)initialize;
- (BOOL)_retainsSiri;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupportedInCarPlay;
- (BOOL)retainsSiri;
- (INCAppLaunchRequest)initWithAudioCallIntentForCarousel:(id)a3 error:(id *)p_isa;
- (INCAppLaunchRequest)initWithBundleIdentifier:(id)a3 options:(id)a4 URL:(id)a5 userActivity:(id)a6;
- (INCAppLaunchRequest)initWithBundleIdentifier:(id)a3 options:(id)a4 URL:(id)a5 userActivity:(id)a6 retainsSiri:(BOOL)a7;
- (INCAppLaunchRequest)initWithIntent:(id)a3 userActivity:(id)a4 inBackground:(BOOL)a5 error:(id *)a6;
- (INCAppLaunchRequest)initWithIntent:(id)a3 userActivity:(id)a4 inBackground:(BOOL)a5 retainsSiri:(BOOL)a6 error:(id *)a7;
- (INCAppLaunchRequest)initWithInteraction:(id)a3 userActivity:(id)a4 inBackground:(BOOL)a5 error:(id *)a6;
- (INCAppLaunchRequest)initWithInteraction:(id)a3 userActivity:(id)a4 inBackground:(BOOL)a5 retainsSiri:(BOOL)a6 error:(id *)a7;
- (INCAppLaunchRequest)initWithURL:(id)a3 error:(id *)a4;
- (NSDictionary)options;
- (NSString)bundleIdentifier;
- (NSURL)URL;
- (NSUserActivity)userActivity;
- (id)URLOverrideForURL:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)observeForAppLaunchWithTimeout:(double)a3 completionHandler:(id)a4;
- (void)performWithCompletionHandler:(id)a3;
- (void)performWithService:(id)a3 retainsSiri:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation INCAppLaunchRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (BOOL)retainsSiri
{
  return self->_retainsSiri;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)observeForAppLaunchWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(INCDisplayLayoutMonitor);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__849;
  v27[4] = __Block_byref_object_dispose__850;
  id v8 = objc_alloc(MEMORY[0x1E4F30840]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__INCAppLaunchRequest_observeForAppLaunchWithTimeout_completionHandler___block_invoke;
  v24[3] = &unk_1E62BBB28;
  v9 = v7;
  v25 = v9;
  id v10 = v6;
  id v26 = v10;
  id v28 = (id)[v8 initWithTimeoutInterval:v24 timeoutHandler:a3];
  v11 = objc_opt_class();
  v12 = [(INCAppLaunchRequest *)self bundleIdentifier];
  v13 = [v11 specialElementIdentifierForBundleIdentifier:v12];

  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __72__INCAppLaunchRequest_observeForAppLaunchWithTimeout_completionHandler___block_invoke_2;
  v19 = &unk_1E62BBB50;
  v20 = self;
  id v14 = v13;
  id v21 = v14;
  id v15 = v10;
  id v22 = v15;
  v23 = v27;
  [(INCDisplayLayoutMonitor *)v9 setTransitionHandler:&v16];
  [(INCDisplayLayoutMonitor *)v9 resume];

  _Block_object_dispose(v27, 8);
}

uint64_t __72__INCAppLaunchRequest_observeForAppLaunchWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __72__INCAppLaunchRequest_observeForAppLaunchWithTimeout_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc((Class)getCARSessionStatusClass_851()) initAndWaitUntilSessionUpdated];
  v9 = [v8 currentSession];

  if (!v9
    || ![*(id *)(a1 + 32) isSupportedInCarPlay]
    || [v6 isCarDisplay])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = [v7 elements];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      id v19 = v6;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v16 = [v15 identifier];
          if ([v16 isEqualToString:*(void *)(a1 + 40)])
          {

LABEL_15:
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) cancel];
            id v6 = v19;
            goto LABEL_16;
          }
          uint64_t v17 = [v15 bundleIdentifier];
          int v18 = [v17 isEqualToString:*(void *)(a1 + 40)];

          if (v18) {
            goto LABEL_15;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        id v6 = v19;
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
}

- (void)performWithService:(id)a3 retainsSiri:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(INCAppLaunchRequest *)self options];
  uint64_t v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [(INCAppLaunchRequest *)self userActivity];
  id v28 = [(INCAppLaunchRequest *)self URL];
  if (v12)
  {
    id v32 = 0;
    uint64_t v13 = INCSerializeNSUserActivity(v12, &v32);
    id v27 = v32;
    if (v13)
    {
      v38 = &unk_1F162FA80;
      v39 = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2050000000;
      id v15 = (void *)getUIActivityContinuationActionClass_softClass;
      uint64_t v36 = getUIActivityContinuationActionClass_softClass;
      if (!getUIActivityContinuationActionClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getUIActivityContinuationActionClass_block_invoke;
        v41 = &unk_1E62BBC68;
        v42 = &v33;
        __getUIActivityContinuationActionClass_block_invoke((uint64_t)buf);
        id v15 = (void *)v34[3];
      }
      uint64_t v16 = v15;
      _Block_object_dispose(&v33, 8);
      uint64_t v17 = (void *)[[v16 alloc] initWithSettings:v14];
      v37 = v17;
      int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      [v11 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F625E0]];
    }
    else
    {
      id v19 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[INCAppLaunchRequest performWithService:retainsSiri:completionHandler:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v27;
        _os_log_error_impl(&dword_1BC57D000, v19, OS_LOG_TYPE_ERROR, "%s Failed to serialize user activity: %{public}@", buf, 0x16u);
      }
    }
  }
  else if (v28)
  {
    [v11 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F62678]];
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F626A0], v27);
  [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F62688]];
  long long v20 = [NSNumber numberWithBool:v6];
  [v11 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4FA70E8]];

  long long v21 = [(INCAppLaunchRequest *)self userActivity];
  long long v22 = [v21 interaction];

  long long v23 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v11];
  v24 = [(INCAppLaunchRequest *)self bundleIdentifier];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __72__INCAppLaunchRequest_performWithService_retainsSiri_completionHandler___block_invoke;
  v29[3] = &unk_1E62BBB00;
  id v30 = v22;
  id v31 = v9;
  id v25 = v9;
  id v26 = v22;
  [v8 openApplication:v24 withOptions:v23 completion:v29];
}

void __72__INCAppLaunchRequest_performWithService_retainsSiri_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 auditToken];
    id v9 = v8;
    if (v8) {
      [v8 realToken];
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    objc_msgSend(v7, "inc_associateFileURLsWithAuditToken:", v11);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, v6 == 0, v6);
  }
}

- (void)performWithCompletionHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
  id v6 = (void *)[objc_alloc((Class)getCARSessionStatusClass_851()) initAndWaitUntilSessionUpdated];
  id v7 = [v6 currentSession];

  if (!v7 || ![(INCAppLaunchRequest *)self isSupportedInCarPlay]) {
    goto LABEL_11;
  }
  id v14 = 0;
  if (!CarPlayServicesLibraryCore_frameworkLibrary_858)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v16 = __CarPlayServicesLibraryCore_block_invoke_859;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0l;
    int v18 = &v14;
    long long v19 = xmmword_1E62BBBB8;
    uint64_t v20 = 0;
    CarPlayServicesLibraryCore_frameworkLibrary_858 = _sl_dlopen();
    id v8 = v14;
    if (CarPlayServicesLibraryCore_frameworkLibrary_858)
    {
      if (!v14) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v13 = v14;
      id v8 = (void *)abort_report_np();
    }
    free(v8);
  }
LABEL_6:
  id v9 = objc_msgSend(MEMORY[0x1E4F629E0], "dashboardService", v13);
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;

    id v5 = v11;
  }
  else
  {
    uint64_t v12 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[INCAppLaunchRequest performWithCompletionHandler:]";
      _os_log_error_impl(&dword_1BC57D000, v12, OS_LOG_TYPE_ERROR, "%s Failed to get the CarPlay dashboard service (is the process properly entitled?). Falling back to the default service.", (uint8_t *)&buf, 0xCu);
    }
  }

LABEL_11:
  [(INCAppLaunchRequest *)self performWithService:v5 retainsSiri:[(INCAppLaunchRequest *)self retainsSiri] completionHandler:v4];
}

- (BOOL)isSupportedInCarPlay
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v3 = (void *)getGEOCountryConfigurationClass_softClass;
  uint64_t v24 = getGEOCountryConfigurationClass_softClass;
  if (!getGEOCountryConfigurationClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    id v26 = __getGEOCountryConfigurationClass_block_invoke;
    id v27 = &unk_1E62BBC68;
    id v28 = &v21;
    __getGEOCountryConfigurationClass_block_invoke((uint64_t)&buf);
    v3 = (void *)v22[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v21, 8);
  id v5 = objc_msgSend(v4, "sharedConfiguration", v21);
  if (v5)
  {
    id v6 = [(INCAppLaunchRequest *)self bundleIdentifier];
    id v7 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v6];
    id v8 = [v7 appState];
    LODWORD(v9) = [v8 isInstalled];

    if (!v9)
    {
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x2050000000;
    uint64_t v10 = (void *)getCRCarPlayAppPolicyEvaluatorClass_softClass;
    uint64_t v24 = getCRCarPlayAppPolicyEvaluatorClass_softClass;
    if (!getCRCarPlayAppPolicyEvaluatorClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      id v26 = __getCRCarPlayAppPolicyEvaluatorClass_block_invoke;
      id v27 = &unk_1E62BBC68;
      id v28 = &v21;
      __getCRCarPlayAppPolicyEvaluatorClass_block_invoke((uint64_t)&buf);
      uint64_t v10 = (void *)v22[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v21, 8);
    id v12 = objc_alloc_init(v11);
    objc_msgSend(v12, "setGeoSupported:", objc_msgSend(v5, "currentCountrySupportsCarIntegration", v21));
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x2050000000;
    uint64_t v13 = (void *)getCRCarPlayAppDeclarationClass_softClass;
    uint64_t v24 = getCRCarPlayAppDeclarationClass_softClass;
    if (!getCRCarPlayAppDeclarationClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      id v26 = __getCRCarPlayAppDeclarationClass_block_invoke;
      id v27 = &unk_1E62BBC68;
      id v28 = &v21;
      __getCRCarPlayAppDeclarationClass_block_invoke((uint64_t)&buf);
      uint64_t v13 = (void *)v22[3];
    }
    id v9 = v13;
    _Block_object_dispose(&v21, 8);
    id v14 = objc_msgSend(v9, "declarationForAppProxy:", v7, v21);
    id v15 = [v12 effectivePolicyForAppDeclaration:v14];
    LOBYTE(v9) = [v15 isCarPlaySupported];
    uint64_t v16 = [(INCAppLaunchRequest *)self URL];
    if (v16)
    {
    }
    else
    {
      int v18 = [(INCAppLaunchRequest *)self userActivity];
      BOOL v19 = v18 == 0;

      if (v19)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    LOBYTE(v9) = [v15 canDisplayOnCarScreen];
    goto LABEL_16;
  }
  uint64_t v17 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[INCAppLaunchRequest isSupportedInCarPlay]";
    _os_log_error_impl(&dword_1BC57D000, v17, OS_LOG_TYPE_ERROR, "%s Failed to get the GEOCountryConfiguration, falling back to the default service", (uint8_t *)&buf, 0xCu);
  }
  LOBYTE(v9) = 0;
LABEL_18:

  return (char)v9;
}

- (id)URLOverrideForURL:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 scheme];
  if ([v4 isEqualToString:@"https"])
  {
  }
  else
  {
    id v5 = [v3 scheme];
    int v6 = [v5 isEqualToString:@"http"];

    if (!v6) {
      goto LABEL_6;
    }
  }
  id v7 = [v3 host];
  int v8 = [v7 isEqualToString:@"facetime.apple.com"];

  if (v8)
  {
    id v9 = objc_opt_new();
    [v9 setScheme:@"facetime-open-link"];
    id v10 = objc_alloc(MEMORY[0x1E4F290C8]);
    id v11 = [v3 absoluteString];
    id v12 = (void *)[v10 initWithName:@"link" value:v11];
    v16[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v9 setQueryItems:v13];

    id v14 = [v9 URL];

    goto LABEL_7;
  }
LABEL_6:
  id v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INCAppLaunchRequest *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([(NSString *)self->_bundleIdentifier isEqual:v5->_bundleIdentifier]
        && [(NSDictionary *)self->_options isEqual:v5->_options]
        && ((URL = self->_URL, URL == v5->_URL) || -[NSURL isEqual:](URL, "isEqual:")))
      {
        userActivity = self->_userActivity;
        if (userActivity == v5->_userActivity) {
          char v8 = 1;
        }
        else {
          char v8 = -[NSUserActivity isEqual:](userActivity, "isEqual:");
        }
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
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleIdentifier hash];
  uint64_t v4 = [(NSDictionary *)self->_options hash] ^ v3;
  uint64_t v5 = [(NSURL *)self->_URL hash];
  return v4 ^ v5 ^ [(NSUserActivity *)self->_userActivity hash];
}

- (id)description
{
  NSUInteger v3 = (void *)[[NSString alloc] initWithFormat:@" {\n    bundleIdentifier = %@,\n    options = %@,\n    URL = %@,\n    userActivity = %@\n}", self->_bundleIdentifier, self->_options, self->_URL, self->_userActivity];
  v7.receiver = self;
  v7.super_class = (Class)INCAppLaunchRequest;
  uint64_t v4 = [(INCAppLaunchRequest *)&v7 description];
  uint64_t v5 = [v4 stringByAppendingString:v3];

  return v5;
}

- (BOOL)_retainsSiri
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (uint64_t (*)(void))getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr_865;
  id v10 = getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr_865;
  if (!getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr_865)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke_866;
    v6[3] = &unk_1E62BBC68;
    v6[4] = &v7;
    __getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke_866((uint64_t)v6);
    v2 = (uint64_t (*)(void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    dlerror();
    uint64_t v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v4);
  }
  int v3 = v2();
  if (v3) {
    LOBYTE(v3) = _os_feature_enabled_impl();
  }
  return v3;
}

- (INCAppLaunchRequest)initWithBundleIdentifier:(id)a3 options:(id)a4 URL:(id)a5 userActivity:(id)a6 retainsSiri:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)INCAppLaunchRequest;
  uint64_t v16 = [(INCAppLaunchRequest *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    bundleIdentifier = v16->_bundleIdentifier;
    v16->_bundleIdentifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    uint64_t v20 = (void *)v19;
    if (v19) {
      uint64_t v21 = (void *)v19;
    }
    else {
      uint64_t v21 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v16->_options, v21);

    uint64_t v22 = [v14 copy];
    URL = v16->_URL;
    v16->_URL = (NSURL *)v22;

    objc_storeStrong((id *)&v16->_userActivity, a6);
    v16->_retainsSiruint64_t i = a7;
    uint64_t v24 = v16;
  }

  return v16;
}

- (INCAppLaunchRequest)initWithBundleIdentifier:(id)a3 options:(id)a4 URL:(id)a5 userActivity:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(INCAppLaunchRequest *)self initWithBundleIdentifier:v13 options:v12 URL:v11 userActivity:v10 retainsSiri:[(INCAppLaunchRequest *)self _retainsSiri]];

  return v14;
}

- (INCAppLaunchRequest)initWithURL:(id)a3 error:(id *)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  char v8 = [v7 URLOverrideForURL:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;

    id v6 = v10;
  }
  id v11 = [(INCAppLaunchRequest *)self URLOverrideForURL:v6];

  if (v11)
  {
    id v12 = v11;

    id v6 = v12;
  }
  id v39 = 0;
  id v13 = [MEMORY[0x1E4F22398] appLinksWithURL:v6 limit:2 error:&v39];
  id v14 = v39;
  if ([v13 count])
  {
    id v15 = [v13 firstObject];
    if ((unint64_t)[v13 count] >= 2)
    {
      uint64_t v16 = (void *)*MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = v16;
        id v30 = [v15 targetApplicationProxy];
        id v31 = [v30 bundleIdentifier];
        *(_DWORD *)long long buf = 136315394;
        v41 = "-[INCAppLaunchRequest initWithURL:error:]";
        __int16 v42 = 2114;
        id v43 = v31;
        _os_log_error_impl(&dword_1BC57D000, v29, OS_LOG_TYPE_ERROR, "%s Multiple app links are available to handle the URL, picking the first one: %{public}@", buf, 0x16u);
      }
    }
    uint64_t v17 = [v15 targetApplicationProxy];
    int v18 = [v17 bundleIdentifier];
    uint64_t v19 = [v15 URL];
    self = [(INCAppLaunchRequest *)self initWithBundleIdentifier:v18 options:0 URL:v19 userActivity:0];

    uint64_t v20 = self;
    goto LABEL_21;
  }
  if (v14)
  {
    uint64_t v21 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      v41 = "-[INCAppLaunchRequest initWithURL:error:]";
      __int16 v42 = 2112;
      id v43 = v14;
      _os_log_error_impl(&dword_1BC57D000, v21, OS_LOG_TYPE_ERROR, "%s Failed to get app links for URL: %@", buf, 0x16u);
    }
  }
  uint64_t v22 = [v7 applicationsAvailableForOpeningURL:v6];
  id v15 = +[INCAppLaunchRequest removeDenyListedApplicationProxies:v22];

  if ([v15 count])
  {
    uint64_t v17 = [v15 firstObject];
    if ((unint64_t)[v15 count] >= 2)
    {
      uint64_t v23 = (void *)*MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
      {
        log = v23;
        uint64_t v36 = [v6 scheme];
        v34 = [v17 bundleIdentifier];
        *(_DWORD *)long long buf = 136315650;
        v41 = "-[INCAppLaunchRequest initWithURL:error:]";
        __int16 v42 = 2114;
        id v43 = v36;
        __int16 v44 = 2114;
        v45 = v34;
        _os_log_error_impl(&dword_1BC57D000, log, OS_LOG_TYPE_ERROR, "%s Multiple applications are available to handle the \"%{public}@\" scheme, picking the first one: %{public}@", buf, 0x20u);
      }
    }
    int v18 = [v17 bundleIdentifier];
    self = [(INCAppLaunchRequest *)self initWithBundleIdentifier:v18 options:0 URL:v6 userActivity:0];
    uint64_t v20 = self;
    goto LABEL_21;
  }
  uint64_t v24 = (void *)*MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
  {
    id v32 = v24;
    uint64_t v33 = [v6 scheme];
    *(_DWORD *)long long buf = 136315394;
    v41 = "-[INCAppLaunchRequest initWithURL:error:]";
    __int16 v42 = 2114;
    id v43 = v33;
    _os_log_error_impl(&dword_1BC57D000, v32, OS_LOG_TYPE_ERROR, "%s No applications are available to handle the \"%{public}@\" scheme", buf, 0x16u);

    if (a4) {
      goto LABEL_20;
    }
LABEL_24:
    uint64_t v20 = 0;
    goto LABEL_22;
  }
  if (!a4) {
    goto LABEL_24;
  }
LABEL_20:
  id v25 = NSString;
  [v6 scheme];
  objc_super v26 = loga = (os_log_t)a4;
  uint64_t v17 = [v25 stringWithFormat:@"No applications are available to handle the %@ scheme", v26];

  uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v27 = *MEMORY[0x1E4F300D0];
  uint64_t v46 = *MEMORY[0x1E4F28228];
  v47[0] = v17;
  int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
  [v35 errorWithDomain:v27 code:2005 userInfo:v18];
  uint64_t v20 = 0;
  loga->isa = (Class)(id)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_22:
  return v20;
}

- (INCAppLaunchRequest)initWithAudioCallIntentForCarousel:(id)a3 error:(id *)p_isa
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 contacts];
  char v8 = [v7 firstObject];

  uint64_t v9 = [v8 personHandle];
  id v10 = v9;
  if (!v9)
  {
    uint64_t v19 = (void *)*MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = v19;
      id v25 = [v6 _className];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v29 = "-[INCAppLaunchRequest initWithAudioCallIntentForCarousel:error:]";
      __int16 v30 = 2114;
      id v31 = v25;
      _os_log_error_impl(&dword_1BC57D000, v24, OS_LOG_TYPE_ERROR, "%s %{public}@ is missing a personHandle to call", buf, 0x16u);

      if (!p_isa) {
        goto LABEL_9;
      }
    }
    else if (!p_isa)
    {
      goto LABEL_9;
    }
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F300D0];
    uint64_t v26 = *MEMORY[0x1E4F28228];
    uint64_t v27 = @"Missing personHandle from INStartAudioCallIntent";
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    *p_isa = [v20 errorWithDomain:v21 code:3002 userInfo:v22];

    p_isa = 0;
    goto LABEL_9;
  }
  id v11 = [v9 value];
  id v12 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  id v13 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v12];

  uint64_t v14 = [v6 preferredCallProvider];
  id v15 = (void *)MEMORY[0x1E4F1CB10];
  if (v14 == 2) {
    uint64_t v16 = @"facetime://%@";
  }
  else {
    uint64_t v16 = @"tel://%@";
  }
  uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", v16, v13);
  int v18 = [v15 URLWithString:v17];

  self = [(INCAppLaunchRequest *)self initWithBundleIdentifier:@"com.apple.Carousel" options:0 URL:v18 userActivity:0];
  p_isa = (id *)&self->super.isa;
LABEL_9:

  return (INCAppLaunchRequest *)p_isa;
}

- (INCAppLaunchRequest)initWithIntent:(id)a3 userActivity:(id)a4 inBackground:(BOOL)a5 retainsSiri:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = [v13 userInfo];
  id v15 = [v14 objectForKey:*MEMORY[0x1E4F30888]];

  if (v15)
  {
    self = [(INCAppLaunchRequest *)self initWithURL:v15 error:a7];
    uint64_t v16 = self;
  }
  else
  {
    uint64_t v17 = objc_msgSend(v12, "_intents_bundleIdForLaunching");
    if (v17)
    {
      id v18 = v12;
      if (v18)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v19 = v18;
        }
        else {
          uint64_t v19 = 0;
        }
      }
      else
      {
        uint64_t v19 = 0;
      }
      id v21 = v19;

      if ([v17 isEqualToString:@"com.apple.Carousel"] && v21)
      {
        self = [(INCAppLaunchRequest *)self initWithAudioCallIntentForCarousel:v21 error:a7];
      }
      else
      {
        if (!v13)
        {
          uint64_t v22 = *MEMORY[0x1E4F30240];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315394;
            id v31 = "-[INCAppLaunchRequest initWithIntent:userActivity:inBackground:retainsSiri:error:]";
            __int16 v32 = 2114;
            uint64_t v33 = self;
            _os_log_error_impl(&dword_1BC57D000, v22, OS_LOG_TYPE_ERROR, "%s %{public}@ was not given a user activity, making one", buf, 0x16u);
          }
          id v13 = (id)[objc_alloc(MEMORY[0x1E4F22488]) _initWithIntent:v18];
        }
        objc_msgSend(v13, "_setExecutionContext:", objc_msgSend(v18, "_executionContext"));
        uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", v9, *MEMORY[0x1E4F22360]);
        uint64_t v29 = v23;
        uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];

        self = [(INCAppLaunchRequest *)self initWithBundleIdentifier:v17 options:v24 URL:0 userActivity:v13 retainsSiri:v8];
      }

      uint64_t v16 = self;
    }
    else
    {
      uint64_t v20 = (void *)*MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = v20;
        uint64_t v27 = [v12 _className];
        *(_DWORD *)long long buf = 136315650;
        id v31 = "-[INCAppLaunchRequest initWithIntent:userActivity:inBackground:retainsSiri:error:]";
        __int16 v32 = 2114;
        uint64_t v33 = self;
        __int16 v34 = 2114;
        uint64_t v35 = v27;
        _os_log_error_impl(&dword_1BC57D000, v26, OS_LOG_TYPE_ERROR, "%s %{public}@ was given a %{public}@ without a bundle identifier to launch", buf, 0x20u);
      }
      uint64_t v16 = 0;
    }
  }
  return v16;
}

- (INCAppLaunchRequest)initWithIntent:(id)a3 userActivity:(id)a4 inBackground:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(INCAppLaunchRequest *)self initWithIntent:v11 userActivity:v10 inBackground:v7 retainsSiri:[(INCAppLaunchRequest *)self _retainsSiri] error:a6];

  return v12;
}

- (INCAppLaunchRequest)initWithInteraction:(id)a3 userActivity:(id)a4 inBackground:(BOOL)a5 retainsSiri:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (v13) {
    goto LABEL_4;
  }
  uint64_t v14 = [v12 intent];
  if (v14)
  {
    id v15 = (void *)v14;
    id v16 = objc_alloc(MEMORY[0x1E4F22488]);
    uint64_t v17 = [v15 _className];
    id v13 = (id)[v16 initWithActivityType:v17];

LABEL_4:
    id v30 = 0;
    id v31 = v13;
    id v18 = INCUnderlyingInteractionFromInteraction(v12, &v31, &v30);
    id v19 = v31;

    id v20 = v30;
    id v21 = [v18 intent];
    [v19 _setInteraction:v18 donate:0];
    uint64_t v22 = v21;
    if (v21 || (uint64_t v22 = v20) != 0)
    {
      id v23 = v22;
    }
    else
    {
      id v23 = [v12 intent];
    }
    uint64_t v24 = v23;
    self = [(INCAppLaunchRequest *)self initWithIntent:v23 userActivity:v19 inBackground:v9 retainsSiri:v8 error:a7];

    id v25 = self;
    goto LABEL_8;
  }
  uint64_t v27 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v35 = "-[INCAppLaunchRequest initWithInteraction:userActivity:inBackground:retainsSiri:error:]";
    __int16 v36 = 2112;
    id v37 = v12;
    _os_log_fault_impl(&dword_1BC57D000, v27, OS_LOG_TYPE_FAULT, "%s No intent was provided in the interaction: %@", buf, 0x16u);
  }
  uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v29 = *MEMORY[0x1E4F1C3B8];
  uint64_t v32 = *MEMORY[0x1E4F28568];
  uint64_t v33 = @"No intent was provided in the interaction.";
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  [v28 errorWithDomain:v29 code:0 userInfo:v19];
  id v25 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v25;
}

- (INCAppLaunchRequest)initWithInteraction:(id)a3 userActivity:(id)a4 inBackground:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(INCAppLaunchRequest *)self initWithInteraction:v11 userActivity:v10 inBackground:v7 retainsSiri:[(INCAppLaunchRequest *)self _retainsSiri] error:a6];

  return v12;
}

+ (id)removeDenyListedApplicationProxies:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)[v3 mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "bundleIdentifier", (void)v15);
        int v12 = [&unk_1F162FAC0 containsObject:v11];

        if (v12) {
          [v4 removeObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = (void *)[v4 copy];
  return v13;
}

+ (id)specialElementIdentifierForBundleIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [&unk_1F162FA98 objectForKey:v3];
  id v5 = v4;
  if (!v4) {
    uint64_t v4 = v3;
  }
  id v6 = v4;

  return v6;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    INLogInitIfNeeded();
  }
}

@end