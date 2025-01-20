@interface DEExtension
- (BOOL)adoptsExtensionTrackerFlow;
- (BOOL)allowUserAttachmentSelection;
- (BOOL)checkAndTeardown;
- (BOOL)isFetchingExtensionHostContext;
- (BOOL)isLoggingEnabled;
- (BOOL)requiresDataClassBAccessToRun;
- (Class)extensionTrackerClass;
- (DEExtension)initWithNSExtension:(id)a3;
- (DEExtensionHostContext)context;
- (NSExtension)extension;
- (NSMutableArray)contextFetchHandlers;
- (NSNumber)cachedRequiresDataClassBAccessToRun;
- (NSString)attachmentsName;
- (NSString)identifier;
- (NSString)loggingConsent;
- (OS_dispatch_queue)serialQueue;
- (id)_fileContentsFromPlistWithKey:(id)a3 localization:(id)a4;
- (id)_localizedStringFromPlistWithKey:(id)a3 localization:(id)a4;
- (id)_localizedTextFromLocalizedStringKey:(id)a3 fallbackFileContentsKey:(id)a4 localization:(id)a5;
- (id)localizedConsentTextWithLocalization:(id)a3;
- (id)localizedDataCollectedExplanationWithLocalization:(id)a3;
- (id)localizedDataCollectedSummaryWithLocalization:(id)a3;
- (id)loggingProfileURLsFromExtension;
- (int64_t)callCount;
- (void)accessBundleWithSynchronousHandler:(id)a3;
- (void)annotatedAttachmentsForParameters:(id)a3 andHandler:(id)a4;
- (void)attachmentListWithHandler:(id)a3;
- (void)attachmentsForParameters:(id)a3 andHandler:(id)a4;
- (void)attachmentsForParameters:(id)a3 withProgressHandler:(id)a4 andHandler:(id)a5;
- (void)createExtensionHostContextCompletion:(id)a3;
- (void)dealloc;
- (void)endUsingExtension;
- (void)installLoggingProfileWithSessionID:(id)a3;
- (void)loggingProfileURLsFromExtension;
- (void)performWithHostContext:(id)a3;
- (void)removeLoggingProfileWithSessionID:(id)a3;
- (void)setAdoptsExtensionTrackerFlow:(BOOL)a3;
- (void)setAllowUserAttachmentSelection:(BOOL)a3;
- (void)setAttachmentsName:(id)a3;
- (void)setCachedRequiresDataClassBAccessToRun:(id)a3;
- (void)setCallCount:(int64_t)a3;
- (void)setContext:(id)a3;
- (void)setContextFetchHandlers:(id)a3;
- (void)setExtension:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsFetchingExtensionHostContext:(BOOL)a3;
- (void)setLoggingConsent:(id)a3;
- (void)setupWithParameters:(id)a3 session:(id)a4;
- (void)setupWithParameters:(id)a3 session:(id)a4 expirationDate:(id)a5;
- (void)teardownWithParameters:(id)a3 session:(id)a4;
@end

@implementation DEExtension

- (DEExtension)initWithNSExtension:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DEExtension;
  v6 = [(DEExtension *)&v19 init];
  if (v6)
  {
    v7 = [v5 attributes];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"DEAttachmentsName"];
    v9 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v8;

    objc_storeStrong((id *)v6 + 7, a3);
    uint64_t v10 = [v5 identifier];
    v11 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v10;

    v12 = [v5 attributes];
    v13 = [v12 objectForKeyedSubscript:@"DEAttachmentsAllowUserSelection"];

    v6[8] = [v13 BOOLValue];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    v15 = (void *)*((void *)v6 + 8);
    *((void *)v6 + 8) = v14;

    *(_WORD *)(v6 + 9) = 0;
    *((void *)v6 + 9) = 0;
    [*((id *)v6 + 7) setRequestCompletionBlock:&__block_literal_global_1];
    [*((id *)v6 + 7) setRequestCancellationBlock:&__block_literal_global_77];
    v16 = Log_0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[DEExtension initWithNSExtension:](v5);
    }

    v17 = Log_0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[DEExtension initWithNSExtension:](v5);
    }
  }
  return (DEExtension *)v6;
}

void __35__DEExtension_initWithNSExtension___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = Log_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1A7E51000, v6, OS_LOG_TYPE_INFO, "%@ completed request - items: %@", (uint8_t *)&v7, 0x16u);
  }
}

void __35__DEExtension_initWithNSExtension___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = Log_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = [v5 localizedDescription];
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1A7E51000, v6, OS_LOG_TYPE_INFO, "%@ cancelled request - error: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (BOOL)isLoggingEnabled
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = [(DEExtension *)self extension];
  v3 = [v2 attributes];
  id v4 = [v3 objectForKeyedSubscript:@"DEAttachmentsLoggingEnabled"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 BOOLValue]) {
      goto LABEL_3;
    }
    uint64_t v11 = Log_0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "Logging is disabled in plist";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEqualToString:@"DEAttachmentsLoggingInternal"])
    {
      if (MGGetBoolAnswer())
      {
        v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        int v7 = [v6 valueForKey:@"RCInternalMode"];
        if (![v7 integerValue])
        {

          goto LABEL_3;
        }
        int v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        id v9 = [v8 valueForKey:@"RCInternalMode"];
        uint64_t v10 = [v9 integerValue];

        if (v10 == 2)
        {
LABEL_3:
          BOOL v5 = 1;
          goto LABEL_38;
        }
      }
      uint64_t v11 = Log_0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v12 = "Logging disabled. Requires internal install";
LABEL_36:
        _os_log_impl(&dword_1A7E51000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      }
    }
    else
    {
      uint64_t v11 = Log_0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v12 = "Logging disabled. Misconfigured plist (1)";
        goto LABEL_36;
      }
    }
LABEL_37:

    BOOL v5 = 0;
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = Log_0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "Logging disabled. Misconfigured plist (2)";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  id v13 = v4;
  uint64_t v14 = [v13 allKeys];
  v15 = [v14 firstObject];

  CFStringRef v16 = v15;
  CFPreferencesAppSynchronize(v16);
  v34 = (__CFString *)v16;
  v17 = [v13 objectForKeyedSubscript:v16];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v18 = [v17 allKeys];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    id v32 = v13;
    v33 = v4;
    char v21 = 0;
    uint64_t v22 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v25 = objc_msgSend(v17, "objectForKeyedSubscript:", v24, v32, v33);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          Boolean keyExistsAndHasValidFormat = 0;
          CFStringRef v26 = v24;
          CFStringRef v27 = v34;
          if (CFPreferencesGetAppBooleanValue(v26, v27, &keyExistsAndHasValidFormat)) {
            BOOL v28 = keyExistsAndHasValidFormat == 0;
          }
          else {
            BOOL v28 = 1;
          }
          int v29 = !v28;
          if ([v25 BOOLValue] != v29)
          {
            v31 = Log_0();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              CFStringRef v41 = v27;
              __int16 v42 = 2114;
              CFStringRef v43 = v26;
              _os_log_impl(&dword_1A7E51000, v31, OS_LOG_TYPE_DEFAULT, "Logging is disabled per domain [%{public}@] key [%{public}@]", buf, 0x16u);
            }

            id v13 = v32;
            id v4 = v33;
            goto LABEL_45;
          }
          char v21 = 1;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v20) {
        continue;
      }
      break;
    }

    id v13 = v32;
    id v4 = v33;
    if (v21)
    {
      BOOL v5 = 1;
      goto LABEL_46;
    }
  }
  else
  {
  }
  v18 = Log_0();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7E51000, v18, OS_LOG_TYPE_DEFAULT, "Logging is disabled per domain preference", buf, 2u);
  }
LABEL_45:

  BOOL v5 = 0;
LABEL_46:

LABEL_38:
  return v5;
}

- (void)endUsingExtension
{
  objc_initWeak(&location, self);
  v3 = [(DEExtension *)self serialQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__DEExtension_endUsingExtension__block_invoke;
  v4[3] = &unk_1E5D2FF08;
  objc_copyWeak(&v5, &location);
  dispatch_sync(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__DEExtension_endUsingExtension__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained context];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = v4;
  if (v3)
  {
    char v6 = [v4 adoptsExtensionTrackerFlow];

    if (v6) {
      goto LABEL_6;
    }
    id v7 = objc_loadWeakRetained(v1);
    uint64_t v8 = [v7 callCount] - 1;
    id v9 = objc_loadWeakRetained(v1);
    [v9 setCallCount:v8];

    id v10 = objc_loadWeakRetained(v1);
    uint64_t v11 = [v10 callCount];

    if (v11 < 1)
    {
LABEL_6:
      v17 = Log_0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = objc_loadWeakRetained(v1);
        uint64_t v19 = [v18 extension];
        uint64_t v20 = [v19 identifier];
        int v28 = 138543362;
        int v29 = v20;
        _os_log_impl(&dword_1A7E51000, v17, OS_LOG_TYPE_DEFAULT, "Ending using extension %{public}@", (uint8_t *)&v28, 0xCu);
      }
      id v21 = objc_loadWeakRetained(v1);
      uint64_t v22 = [v21 context];
      uint64_t v12 = [v22 _UUID];

      if (v12)
      {
        id v23 = objc_loadWeakRetained(v1);
        v24 = [v23 extension];
        [v24 cancelExtensionRequestWithIdentifier:v12];

        id v25 = objc_loadWeakRetained(v1);
        [v25 setContext:0];
      }
    }
    else
    {
      uint64_t v12 = Log_0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = objc_loadWeakRetained(v1);
        uint64_t v14 = [v13 extension];
        v15 = [v14 identifier];
        id v16 = objc_loadWeakRetained(v1);
        int v28 = 138543618;
        int v29 = v15;
        __int16 v30 = 2048;
        uint64_t v31 = [v16 callCount];
        _os_log_impl(&dword_1A7E51000, v12, OS_LOG_TYPE_DEFAULT, "[Legacy] Extension %{public}@ is done, but there's [%ld] other executions in flight.", (uint8_t *)&v28, 0x16u);
      }
    }
  }
  else
  {
    int v26 = [v4 isFetchingExtensionHostContext];

    if (v26)
    {
      CFStringRef v27 = Log_0();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __32__DEExtension_endUsingExtension__block_invoke_cold_2(v1, v27);
      }
    }
    uint64_t v12 = Log_0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __32__DEExtension_endUsingExtension__block_invoke_cold_1(v1, v12);
    }
  }
}

- (void)createExtensionHostContextCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(DEExtension *)self extension];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__DEExtension_createExtensionHostContextCompletion___block_invoke;
  v7[3] = &unk_1E5D301B8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 beginExtensionRequestWithInputItems:MEMORY[0x1E4F1CBF0] completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__DEExtension_createExtensionHostContextCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = [WeakRetained extension];
    id v9 = [v8 _extensionContextForUUID:v5];
    id v10 = objc_loadWeakRetained((id *)(a1 + 40));
    [v10 setContext:v9];

    id v11 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v12 = [v11 context];

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)(a1 + 40));
      uint64_t v14 = [v13 context];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        id v16 = Log_0();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __52__DEExtension_createExtensionHostContextCompletion___block_invoke_cold_3((id *)(a1 + 40), v16);
        }

        id v17 = objc_loadWeakRetained((id *)(a1 + 40));
        [v17 setContext:0];
      }
      id v18 = objc_loadWeakRetained((id *)(a1 + 40));
      uint64_t v19 = [v18 context];
      uint64_t v20 = [v19 _auxiliaryConnection];
      id v21 = [v20 valueForEntitlement:@"com.apple.DiagnosticExtensions.extension"];

      if (!v21)
      {
        uint64_t v22 = Log_0();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          __52__DEExtension_createExtensionHostContextCompletion___block_invoke_cold_2(v22);
        }

        id v23 = objc_loadWeakRetained((id *)(a1 + 40));
        [v23 setContext:0];
      }
    }
  }
  if (v6)
  {
    v24 = Log_0();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __52__DEExtension_createExtensionHostContextCompletion___block_invoke_cold_1(v6, v24);
    }
  }
  id v25 = objc_loadWeakRetained((id *)(a1 + 40));
  int v26 = [v25 extension];
  CFStringRef v27 = [v26 identifier];

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __52__DEExtension_createExtensionHostContextCompletion___block_invoke_90;
  v38[3] = &unk_1E5D30168;
  id v28 = v27;
  id v39 = v28;
  objc_copyWeak(&v40, (id *)(a1 + 40));
  id v29 = objc_loadWeakRetained((id *)(a1 + 40));
  __int16 v30 = [v29 context];
  uint64_t v31 = [v30 _auxiliaryConnection];
  [v31 setInvalidationHandler:v38];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __52__DEExtension_createExtensionHostContextCompletion___block_invoke_91;
  v36[3] = &unk_1E5D30190;
  id v32 = v28;
  id v37 = v32;
  id v33 = objc_loadWeakRetained((id *)(a1 + 40));
  v34 = [v33 context];
  v35 = [v34 _auxiliaryConnection];
  [v35 setInterruptionHandler:v36];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_destroyWeak(&v40);
}

void __52__DEExtension_createExtensionHostContextCompletion___block_invoke_90(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = Log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A7E51000, v2, OS_LOG_TYPE_INFO, "Connection was invalidated for extension [%{public}@]", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setContext:0];
}

void __52__DEExtension_createExtensionHostContextCompletion___block_invoke_91(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = Log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A7E51000, v2, OS_LOG_TYPE_INFO, "Connection was interrupted for extension [%{public}@]", (uint8_t *)&v4, 0xCu);
  }
}

- (OS_dispatch_queue)serialQueue
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_serialQueue)
  {
    uint64_t v3 = [(DEExtension *)v2 identifier];
    id v4 = [v3 stringByAppendingString:@".serialQueue"];
    dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;
  }
  objc_sync_exit(v2);

  uint64_t v7 = v2->_serialQueue;
  return v7;
}

- (void)performWithHostContext:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = dispatch_get_global_queue(25, 0);
  objc_initWeak(&location, self);
  uint64_t v6 = [(DEExtension *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__DEExtension_performWithHostContext___block_invoke;
  block[3] = &unk_1E5D30258;
  objc_copyWeak(&v12, &location);
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __38__DEExtension_performWithHostContext___block_invoke(id *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v4 = [WeakRetained context];

  if (v4)
  {
    dispatch_queue_t v5 = Log_0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [a1[4] context];
      id v7 = [a1[4] identifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = (uint64_t)v6;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_impl(&dword_1A7E51000, v5, OS_LOG_TYPE_DEFAULT, "performWithHostContext - Firing handler for existing context: [%{public}@], DE [%{public}@]", buf, 0x16u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__DEExtension_performWithHostContext___block_invoke_95;
    block[3] = &unk_1E5D301E0;
    id v8 = a1[5];
    id v27 = a1[6];
    objc_copyWeak(&v28, v2);
    dispatch_async(v8, block);
    objc_destroyWeak(&v28);
  }
  else
  {
    id v9 = objc_loadWeakRetained(v2);
    int v10 = [v9 isFetchingExtensionHostContext];

    id v11 = Log_0();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7E51000, v11, OS_LOG_TYPE_DEFAULT, "performWithHostContext - Is fetching context, will store handler.", buf, 2u);
      }

      id v13 = objc_loadWeakRetained(v2);
      uint64_t v14 = [v13 contextFetchHandlers];
      v15 = (void *)MEMORY[0x1AD0DC9D0](a1[6]);
      [v14 addObject:v15];

      id v16 = Log_0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = objc_loadWeakRetained(v2);
        id v18 = [v17 contextFetchHandlers];
        uint64_t v19 = [v18 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v30 = v19;
        _os_log_impl(&dword_1A7E51000, v16, OS_LOG_TYPE_INFO, "performWithHostContext - Stored context fetch handlers [%lu]", buf, 0xCu);
      }
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7E51000, v11, OS_LOG_TYPE_DEFAULT, "performWithHostContext - Will create extension host.", buf, 2u);
      }

      id v20 = objc_loadWeakRetained(v2);
      [v20 setIsFetchingExtensionHostContext:1];

      id v21 = objc_loadWeakRetained(v2);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __38__DEExtension_performWithHostContext___block_invoke_96;
      v22[3] = &unk_1E5D30230;
      v22[4] = a1[4];
      objc_copyWeak(&v25, v2);
      id v23 = a1[5];
      id v24 = a1[6];
      [v21 createExtensionHostContextCompletion:v22];

      objc_destroyWeak(&v25);
    }
  }
}

void __38__DEExtension_performWithHostContext___block_invoke_95(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained context];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void __38__DEExtension_performWithHostContext___block_invoke_96(id *a1)
{
  v2 = [a1[4] serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__DEExtension_performWithHostContext___block_invoke_2;
  block[3] = &unk_1E5D30208;
  objc_copyWeak(&v6, a1 + 7);
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __38__DEExtension_performWithHostContext___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id location = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setIsFetchingExtensionHostContext:0];

  v2 = Log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_loadWeakRetained(location);
    id v4 = [v3 context];
    id v5 = objc_loadWeakRetained(location);
    id v6 = [v5 identifier];
    *(_DWORD *)buf = 138543618;
    id v32 = v4;
    __int16 v33 = 2114;
    v34 = v6;
    _os_log_impl(&dword_1A7E51000, v2, OS_LOG_TYPE_DEFAULT, "performWithHostContext - Created extension host: [%{public}@] for [%{public}@]", buf, 0x16u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__DEExtension_performWithHostContext___block_invoke_97;
  block[3] = &unk_1E5D301E0;
  id v7 = *(NSObject **)(a1 + 32);
  id v28 = *(id *)(a1 + 40);
  objc_copyWeak(&v29, location);
  dispatch_async(v7, block);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = objc_loadWeakRetained(location);
  id v9 = [v8 contextFetchHandlers];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v15 = Log_0();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7E51000, v15, OS_LOG_TYPE_DEFAULT, "performWithHostContext - Executing stored context fetch handler", buf, 2u);
        }

        id v16 = *(NSObject **)(a1 + 32);
        v21[0] = v12;
        v21[1] = 3221225472;
        v21[2] = __38__DEExtension_performWithHostContext___block_invoke_98;
        v21[3] = &unk_1E5D301E0;
        v21[4] = v14;
        objc_copyWeak(&v22, location);
        dispatch_async(v16, v21);
        objc_destroyWeak(&v22);
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v10);
  }

  id v17 = objc_loadWeakRetained(location);
  id v18 = [v17 contextFetchHandlers];
  [v18 removeAllObjects];

  objc_destroyWeak(&v29);
}

void __38__DEExtension_performWithHostContext___block_invoke_97(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained context];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void __38__DEExtension_performWithHostContext___block_invoke_98(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained context];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

- (void)attachmentListWithHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__DEExtension_attachmentListWithHandler___block_invoke;
  v6[3] = &unk_1E5D302A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(DEExtension *)self performWithHostContext:v6];
}

void __41__DEExtension_attachmentListWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && [*(id *)(a1 + 32) isLoggingEnabled])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__DEExtension_attachmentListWithHandler___block_invoke_2;
    v5[3] = &unk_1E5D30280;
    id v6 = *(id *)(a1 + 40);
    [v3 attachmentListWithHandler:v5];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    }
  }
}

uint64_t __41__DEExtension_attachmentListWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)attachmentsForParameters:(id)a3 andHandler:(id)a4
{
}

- (void)annotatedAttachmentsForParameters:(id)a3 andHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__DEExtension_annotatedAttachmentsForParameters_andHandler___block_invoke;
  v10[3] = &unk_1E5D302D0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(DEExtension *)self performWithHostContext:v10];
}

void __60__DEExtension_annotatedAttachmentsForParameters_andHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && [*(id *)(a1 + 32) isLoggingEnabled])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__DEExtension_annotatedAttachmentsForParameters_andHandler___block_invoke_2;
    v6[3] = &unk_1E5D300D8;
    uint64_t v4 = *(void *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    [v3 annotatedAttachmentsForParameters:v4 withHandler:v6];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
}

uint64_t __60__DEExtension_annotatedAttachmentsForParameters_andHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)attachmentsForParameters:(id)a3 withProgressHandler:(id)a4 andHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(DEExtension *)self adoptsExtensionTrackerFlow])
  {
    id v11 = [(DEExtension *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__DEExtension_attachmentsForParameters_withProgressHandler_andHandler___block_invoke;
    block[3] = &unk_1E5D30190;
    void block[4] = self;
    dispatch_sync(v11, block);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__DEExtension_attachmentsForParameters_withProgressHandler_andHandler___block_invoke_102;
  v15[3] = &unk_1E5D30320;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(DEExtension *)self performWithHostContext:v15];
}

void __71__DEExtension_attachmentsForParameters_withProgressHandler_andHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "setCallCount:", objc_msgSend(*(id *)(a1 + 32), "callCount") + 1);
  v2 = Log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) callCount];
    uint64_t v4 = [*(id *)(a1 + 32) identifier];
    int v5 = 134218242;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    id v8 = v4;
    _os_log_impl(&dword_1A7E51000, v2, OS_LOG_TYPE_INFO, "[Legacy] attachmentsForParameters:withProgressHandler was called [%ld] times for [%{public}@].", (uint8_t *)&v5, 0x16u);
  }
}

void __71__DEExtension_attachmentsForParameters_withProgressHandler_andHandler___block_invoke_102(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && [*(id *)(a1 + 32) isLoggingEnabled])
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__DEExtension_attachmentsForParameters_withProgressHandler_andHandler___block_invoke_2;
    v8[3] = &unk_1E5D302F8;
    id v6 = *(id *)(a1 + 56);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v6;
    [v3 attachmentsForParameters:v4 withProgressHandler:v5 withHandler:v8];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
}

void __71__DEExtension_attachmentsForParameters_withProgressHandler_andHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  if (([*(id *)(a1 + 32) adoptsExtensionTrackerFlow] & 1) == 0)
  {
    uint64_t v5 = Log_0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1A7E51000, v5, OS_LOG_TYPE_INFO, "Host is using legacy DE flow without setup/teardown; ending extension.",
        v6,
        2u);
    }

    [*(id *)(a1 + 32) endUsingExtension];
  }
}

- (void)setupWithParameters:(id)a3 session:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 date];
  id v10 = [v9 dateByAddingTimeInterval:7200.0];

  [(DEExtension *)self setupWithParameters:v8 session:v7 expirationDate:v10];
}

- (void)setupWithParameters:(id)a3 session:(id)a4 expirationDate:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = Log_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(DEExtension *)self identifier];
    *(_DWORD *)buf = 136316162;
    id v22 = "-[DEExtension setupWithParameters:session:expirationDate:]";
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    long long v26 = v12;
    __int16 v27 = 2114;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl(&dword_1A7E51000, v11, OS_LOG_TYPE_DEFAULT, "%s, parameters:%@, identifier:%@, sessionID:%{public}@, date:%@", buf, 0x34u);
  }
  [(DEExtension *)self setAdoptsExtensionTrackerFlow:1];
  id v13 = [(DEExtension *)self extensionTrackerClass];
  id v14 = [(DEExtension *)self identifier];
  int v15 = [(objc_class *)v13 shouldSetupWithIdentifier:v14 session:v9 expirationDate:v10];

  id v16 = Log_0();
  id v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7E51000, v17, OS_LOG_TYPE_DEFAULT, "DEExtension: Start setupForParameters:", buf, 2u);
    }

    [(DEExtension *)self installLoggingProfileWithSessionID:v9];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58__DEExtension_setupWithParameters_session_expirationDate___block_invoke;
    v19[3] = &unk_1E5D30348;
    id v20 = v8;
    [(DEExtension *)self performWithHostContext:v19];
    id v17 = v20;
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v18 = [(DEExtension *)self identifier];
    *(_DWORD *)buf = 138412546;
    id v22 = v18;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_1A7E51000, v17, OS_LOG_TYPE_INFO, "DEExtension: already called setup method for %@, %@", buf, 0x16u);
  }
}

uint64_t __58__DEExtension_setupWithParameters_session_expirationDate___block_invoke(uint64_t result, void *a2)
{
  if (a2) {
    return [a2 setupForParameters:*(void *)(result + 32) withHandler:&__block_literal_global_105];
  }
  return result;
}

void __58__DEExtension_setupWithParameters_session_expirationDate___block_invoke_2()
{
  v0 = Log_0();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1A7E51000, v0, OS_LOG_TYPE_DEFAULT, "DEExtension: Done setupForParameters:", v1, 2u);
  }
}

- (void)teardownWithParameters:(id)a3 session:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = Log_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(DEExtension *)self identifier];
    *(_DWORD *)buf = 136315906;
    id v20 = "-[DEExtension teardownWithParameters:session:]";
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2114;
    id v26 = v7;
    _os_log_impl(&dword_1A7E51000, v8, OS_LOG_TYPE_DEFAULT, "%s parameters:%@, identifier:%@, sessionID:%{public}@", buf, 0x2Au);
  }
  id v10 = [(DEExtension *)self extensionTrackerClass];
  id v11 = [(DEExtension *)self identifier];
  int v12 = [(objc_class *)v10 shouldTeardownWithIdentifier:v11 session:v7];

  id v13 = Log_0();
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7E51000, v14, OS_LOG_TYPE_DEFAULT, "DEExtension: Start teardownWithParameters:", buf, 2u);
    }

    [(DEExtension *)self removeLoggingProfileWithSessionID:v7];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __46__DEExtension_teardownWithParameters_session___block_invoke;
    v16[3] = &unk_1E5D30370;
    id v17 = v6;
    id v18 = self;
    [(DEExtension *)self performWithHostContext:v16];
    id v14 = v17;
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v15 = [(DEExtension *)self identifier];
    *(_DWORD *)buf = 138412546;
    id v20 = v15;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1A7E51000, v14, OS_LOG_TYPE_INFO, "DEExtension is still needed. Teardown method is not called for %@, %@", buf, 0x16u);
  }
}

uint64_t __46__DEExtension_teardownWithParameters_session___block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __46__DEExtension_teardownWithParameters_session___block_invoke_2;
    v3[3] = &unk_1E5D30190;
    uint64_t v2 = *(void *)(result + 32);
    v3[4] = *(void *)(result + 40);
    return [a2 teardownForParameters:v2 withHandler:v3];
  }
  return result;
}

uint64_t __46__DEExtension_teardownWithParameters_session___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = Log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A7E51000, v2, OS_LOG_TYPE_DEFAULT, "DEExtension: Done teardownWithParameters:", v4, 2u);
  }

  return [*(id *)(a1 + 32) endUsingExtension];
}

- (BOOL)checkAndTeardown
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = Log_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[DEExtension checkAndTeardown]";
    _os_log_impl(&dword_1A7E51000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__DEExtension_checkAndTeardown__block_invoke;
  v9[3] = &unk_1E5D30410;
  v9[4] = self;
  p_long long buf = &buf;
  uint64_t v5 = v4;
  id v10 = v5;
  [(DEExtension *)self performWithHostContext:v9];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  BOOL v7 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v7;
}

void __31__DEExtension_checkAndTeardown__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __31__DEExtension_checkAndTeardown__block_invoke_2;
    v6[3] = &unk_1E5D303E8;
    uint64_t v5 = (void *)a1[5];
    uint64_t v4 = a1[6];
    void v6[4] = a1[4];
    uint64_t v9 = v4;
    id v7 = v5;
    id v8 = v3;
    [v8 isExtensionEnhancedLoggingStateOnWithHandler:v6];
  }
}

void __31__DEExtension_checkAndTeardown__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = Log_0();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v19 = v6;
      _os_log_impl(&dword_1A7E51000, v4, OS_LOG_TYPE_DEFAULT, "DEExtension: %@ is NOT off. Will try to tear it down.", buf, 0xCu);
    }

    id v7 = *(void **)(a1 + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __31__DEExtension_checkAndTeardown__block_invoke_106;
    v13[3] = &unk_1E5D303C0;
    id v8 = v7;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    id v14 = v8;
    uint64_t v15 = v9;
    uint64_t v17 = *(void *)(a1 + 56);
    id v16 = v10;
    [v8 teardownForParameters:MEMORY[0x1E4F1CC08] withHandler:v13];
  }
  else
  {
    char v11 = a2 ^ 1;
    if (v5)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1A7E51000, v4, OS_LOG_TYPE_DEFAULT, "DEExtension: %@ is already off.", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v11;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

void __31__DEExtension_checkAndTeardown__block_invoke_106(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__DEExtension_checkAndTeardown__block_invoke_2_107;
  v4[3] = &unk_1E5D30398;
  uint64_t v1 = *(void **)(a1 + 32);
  void v4[4] = *(void *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 48);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 isExtensionEnhancedLoggingStateOnWithHandler:v4];
}

intptr_t __31__DEExtension_checkAndTeardown__block_invoke_2_107(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = Log_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    long long v5 = @"OFF";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      long long v5 = @"ON";
    }
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    char v11 = v5;
    _os_log_impl(&dword_1A7E51000, v4, OS_LOG_TYPE_DEFAULT, "DEExtension: Final %@ EnhancedLoggingState is %@.", (uint8_t *)&v8, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 ^ 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)dealloc
{
  long long v3 = [(DEExtension *)self context];

  if (v3)
  {
    [(DEExtension *)self setCallCount:1];
    [(DEExtension *)self endUsingExtension];
  }
  v4.receiver = self;
  v4.super_class = (Class)DEExtension;
  [(DEExtension *)&v4 dealloc];
}

- (BOOL)requiresDataClassBAccessToRun
{
  long long v3 = [(DEExtension *)self cachedRequiresDataClassBAccessToRun];

  if (v3)
  {
    objc_super v4 = [(DEExtension *)self cachedRequiresDataClassBAccessToRun];
    char v5 = [v4 BOOLValue];

    return v5;
  }
  else
  {
    uint64_t v10 = 0;
    char v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__DEExtension_requiresDataClassBAccessToRun__block_invoke;
    v9[3] = &unk_1E5D30438;
    v9[4] = &v10;
    [(DEExtension *)self accessBundleWithSynchronousHandler:v9];
    id v7 = [MEMORY[0x1E4F28ED0] numberWithBool:*((unsigned __int8 *)v11 + 24)];
    [(DEExtension *)self setCachedRequiresDataClassBAccessToRun:v7];

    char v8 = *((unsigned char *)v11 + 24);
    _Block_object_dispose(&v10, 8);
    return v8;
  }
}

void __44__DEExtension_requiresDataClassBAccessToRun__block_invoke(uint64_t a1, void *a2)
{
  long long v3 = [a2 infoDictionary];
  id v4 = [v3 valueForKey:@"DERequiresClassBDataClass"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 BOOLValue];
  }
}

- (void)accessBundleWithSynchronousHandler:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  char v5 = [(DEExtension *)self extension];
  uint64_t v6 = [v5 _plugIn];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__0;
  uint64_t v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  id v7 = [MEMORY[0x1E4F91488] defaultHost];
  v22[0] = v6;
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__DEExtension_accessBundleWithSynchronousHandler___block_invoke;
  v15[3] = &unk_1E5D30460;
  v15[4] = self;
  void v15[5] = &v16;
  [v7 accessPlugIns:v8 synchronously:1 flags:0 extensions:v15];

  if (v17[5])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [ (id) v17[5] UTF8String];
      if (sandbox_extension_consume() == -1)
      {
        uint64_t v9 = Log_0();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          [(DEExtension *)self identifier];
          objc_claimAutoreleasedReturnValue();
          -[DEExtension accessBundleWithSynchronousHandler:]();
        }
      }
      else
      {
        uint64_t v9 = v6;
        uint64_t v10 = (void *)MEMORY[0x1E4F28B50];
        char v11 = [v9 url];
        uint64_t v12 = [v10 bundleWithURL:v11];

        if (v12)
        {
          v4[2](v4, v12);
        }
        else
        {
          id v14 = Log_0();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            [(DEExtension *)self identifier];
            objc_claimAutoreleasedReturnValue();
            -[DEExtension accessBundleWithSynchronousHandler:]();
          }
        }
        sandbox_extension_release();
      }
    }
    else
    {
      uint64_t v9 = Log_0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        char v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        objc_claimAutoreleasedReturnValue();
        -[DEExtension accessBundleWithSynchronousHandler:].cold.4();
      }
    }
  }
  else
  {
    uint64_t v9 = Log_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(DEExtension *)self identifier];
      objc_claimAutoreleasedReturnValue();
      -[DEExtension accessBundleWithSynchronousHandler:]();
    }
  }

  _Block_object_dispose(&v16, 8);
}

void __50__DEExtension_accessBundleWithSynchronousHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 firstObject];

  if (v4)
  {
    char v5 = Log_0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __50__DEExtension_accessBundleWithSynchronousHandler___block_invoke_cold_1(a1);
    }
  }
  uint64_t v6 = [v3 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)localizedConsentTextWithLocalization:(id)a3
{
  return [(DEExtension *)self _localizedTextFromLocalizedStringKey:@"DELocalizedConsentText" fallbackFileContentsKey:@"DELocalizedConsentFilename" localization:a3];
}

- (id)localizedDataCollectedExplanationWithLocalization:(id)a3
{
  return [(DEExtension *)self _localizedTextFromLocalizedStringKey:@"DELocalizedDataCollectedExplanationText" fallbackFileContentsKey:@"DELocalizedDataCollectedExplanationFilename" localization:a3];
}

- (id)localizedDataCollectedSummaryWithLocalization:(id)a3
{
  return [(DEExtension *)self _localizedTextFromLocalizedStringKey:@"DELocalizedDataCollectedSummaryText" fallbackFileContentsKey:0 localization:a3];
}

- (id)_localizedTextFromLocalizedStringKey:(id)a3 fallbackFileContentsKey:(id)a4 localization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [(DEExtension *)self _localizedStringFromPlistWithKey:v8 localization:v10];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
LABEL_7:
    uint64_t v15 = v13;
    goto LABEL_8;
  }
  if (v9)
  {
    id v14 = Log_0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[DEExtension _localizedTextFromLocalizedStringKey:fallbackFileContentsKey:localization:]();
    }

    id v13 = [(DEExtension *)self _fileContentsFromPlistWithKey:v9 localization:v10];
    goto LABEL_7;
  }
  uint64_t v15 = 0;
LABEL_8:

  return v15;
}

- (id)_fileContentsFromPlistWithKey:(id)a3 localization:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__0;
  uint64_t v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__DEExtension__fileContentsFromPlistWithKey_localization___block_invoke;
  v12[3] = &unk_1E5D30488;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  uint64_t v15 = &v16;
  [(DEExtension *)self accessBundleWithSynchronousHandler:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __58__DEExtension__fileContentsFromPlistWithKey_localization___block_invoke(void *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 infoDictionary];
  char v5 = [v4 valueForKey:a1[4]];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
    id v7 = [v6 URLByDeletingPathExtension];
    id v8 = [v7 lastPathComponent];

    id v9 = [v6 pathExtension];
    id v10 = [v3 URLForResource:v8 withExtension:v9 subdirectory:0 localization:a1[5]];
    if (!v10)
    {
      char v11 = Log_0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = a1[4];
        uint64_t v13 = a1[5];
        *(_DWORD *)long long buf = 138544386;
        uint64_t v23 = v12;
        __int16 v24 = 2114;
        __int16 v25 = v6;
        __int16 v26 = 2114;
        id v27 = v8;
        __int16 v28 = 2114;
        __int16 v29 = v9;
        __int16 v30 = 2114;
        uint64_t v31 = v13;
        _os_log_impl(&dword_1A7E51000, v11, OS_LOG_TYPE_DEFAULT, "Cannot read file contents for key [%{public}@]: url [%{public}@] fileName [%{public}@] extension [%{public}@] localization [%{public}@]", buf, 0x34u);
      }

      id v10 = [v3 URLForResource:v8 withExtension:v9 subdirectory:0];
    }
    id v21 = 0;
    id v14 = [NSString stringWithContentsOfURL:v10 encoding:4 error:&v21];
    id v15 = v21;
    if (v15)
    {
      uint64_t v16 = Log_0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = a1[4];
        uint64_t v18 = (void *)a1[5];
        *(_DWORD *)long long buf = 138543874;
        uint64_t v23 = v17;
        __int16 v24 = 2114;
        __int16 v25 = v18;
        __int16 v26 = 2114;
        id v27 = v15;
        _os_log_error_impl(&dword_1A7E51000, v16, OS_LOG_TYPE_ERROR, "Cannot read file contents for key [%{public}@]: localization [%{public}@] error [%{public}@]", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v19 = *(void *)(a1[6] + 8);
      id v20 = v14;
      uint64_t v16 = *(NSObject **)(v19 + 40);
      *(void *)(v19 + 40) = v20;
    }
  }
}

- (id)_localizedStringFromPlistWithKey:(id)a3 localization:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__0;
  id v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__DEExtension__localizedStringFromPlistWithKey_localization___block_invoke;
  v12[3] = &unk_1E5D30488;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v15 = &v16;
  [(DEExtension *)self accessBundleWithSynchronousHandler:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __61__DEExtension__localizedStringFromPlistWithKey_localization___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1 + 4;
  char v5 = [v3 localizedStringForKey:a1[4] value:&stru_1EFE4F440 table:@"InfoPlist" localization:a1[5]];
  if (![v5 length] || objc_msgSend(v5, "isEqualToString:", *v4))
  {
    id v6 = Log_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __61__DEExtension__localizedStringFromPlistWithKey_localization___block_invoke_cold_1(a1 + 4, a1 + 5, v6);
    }

    id v7 = [v3 infoDictionary];
    uint64_t v8 = [v7 valueForKey:*v4];

    char v5 = (void *)v8;
  }
  if ([v5 length]) {
    id v9 = v5;
  }
  else {
    id v9 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v9);
}

- (Class)extensionTrackerClass
{
  return (Class)objc_opt_class();
}

- (void)installLoggingProfileWithSessionID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(DEExtension *)self loggingProfileURLsFromExtension];
  if (v5)
  {
    id v15 = 0;
    id v6 = +[DELoggingPreferences combinedLoggingPayloadForURLs:v5 error:&v15];
    id v7 = v15;
    if (v7)
    {
      id v8 = v7;
      id v9 = Log_0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [(DEExtension *)self identifier];
        *(_DWORD *)long long buf = 138543874;
        id v17 = v4;
        __int16 v18 = 2114;
        uint64_t v19 = v10;
        __int16 v20 = 2114;
        id v21 = v8;
        char v11 = "Error loading logging preference for sessionID [%{public}@] extension [%{public}@] : [%{public}@]";
LABEL_8:
        _os_log_error_impl(&dword_1A7E51000, v9, OS_LOG_TYPE_ERROR, v11, buf, 0x20u);
      }
    }
    else
    {
      uint64_t v12 = [(DEExtension *)self identifier];
      id v14 = 0;
      +[DELoggingPreferences installLoggingProfile:v6 sessionIdentifier:v4 extensionIdentifier:v12 error:&v14];
      id v8 = v14;

      id v13 = Log_0();
      id v9 = v13;
      if (!v8)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          id v17 = v6;
          _os_log_impl(&dword_1A7E51000, v9, OS_LOG_TYPE_DEFAULT, "Installed logging preference payload [%{public}@]", buf, 0xCu);
        }
        id v8 = 0;
        goto LABEL_12;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v10 = [(DEExtension *)self identifier];
        *(_DWORD *)long long buf = 138543874;
        id v17 = v4;
        __int16 v18 = 2114;
        uint64_t v19 = v10;
        __int16 v20 = 2114;
        id v21 = v8;
        char v11 = "Error installing logging preference for sessionID [%{public}@] extension [%{public}@] : [%{public}@]";
        goto LABEL_8;
      }
    }
LABEL_12:
  }
}

- (void)removeLoggingProfileWithSessionID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(DEExtension *)self identifier];
  id v10 = 0;
  id v6 = +[DELoggingPreferences removeLoggingProfileForSessionIdentifier:v4 extensionIdentifier:v5 error:&v10];
  id v7 = v10;

  if (v7)
  {
    id v8 = Log_0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(DEExtension *)self identifier];
      *(_DWORD *)long long buf = 138543874;
      id v12 = v4;
      __int16 v13 = 2114;
      id v14 = v9;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_error_impl(&dword_1A7E51000, v8, OS_LOG_TYPE_ERROR, "Error removing logging preference for sessionID [%{public}@] extension [%{public}@] : [%{public}@]", buf, 0x20u);
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_5;
    }
    id v8 = Log_0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_1A7E51000, v8, OS_LOG_TYPE_DEFAULT, "Removed payload [%{public}@]", buf, 0xCu);
    }
  }

LABEL_5:
}

- (id)loggingProfileURLsFromExtension
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = [(DEExtension *)self extension];
  id v3 = [v2 _plugIn];

  id v4 = (void *)MEMORY[0x1E4F28B50];
  char v5 = [v3 url];
  id v6 = [v4 bundleWithURL:v5];

  id v7 = [v6 infoDictionary];
  id v8 = [v7 valueForKey:@"DELoggingPreferenceSubsystems"];

  if (!v8)
  {
    id v9 = Log_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[DEExtension loggingProfileURLsFromExtension](v9);
    }
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = Log_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(DEExtension *)v9 loggingProfileURLsFromExtension];
    }
    goto LABEL_24;
  }
  if (![v8 count])
  {
    id v9 = Log_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v31 = @"DELoggingPreferenceSubsystems";
      _os_log_impl(&dword_1A7E51000, v9, OS_LOG_TYPE_INFO, "%{public}@ is empty.", buf, 0xCu);
    }
LABEL_24:
    uint64_t v19 = 0;
    goto LABEL_25;
  }
  uint64_t v23 = v3;
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = [v6 URLForResource:v15 withExtension:@"plist" subdirectory:0];
          uint64_t v17 = Log_0();
          __int16 v18 = v17;
          if (!v16)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[DEExtension loggingProfileURLsFromExtension]();
            }

            goto LABEL_33;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            [(DEExtension *)(uint64_t)v28 loggingProfileURLsFromExtension];
          }

          [v9 addObject:v16];
        }
        else
        {
          id v16 = Log_0();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            [(DEExtension *)(uint64_t)buf loggingProfileURLsFromExtension];
          }
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if ([v9 count])
  {
    uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithSet:v9];
  }
  else
  {
LABEL_33:
    uint64_t v19 = 0;
  }
  id v3 = v23;
LABEL_25:

  return v19;
}

- (NSString)attachmentsName
{
  return self->_attachmentsName;
}

- (void)setAttachmentsName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (DEExtensionHostContext)context
{
  return (DEExtensionHostContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContext:(id)a3
{
}

- (BOOL)allowUserAttachmentSelection
{
  return self->_allowUserAttachmentSelection;
}

- (void)setAllowUserAttachmentSelection:(BOOL)a3
{
  self->_allowUserAttachmentSelection = a3;
}

- (NSString)loggingConsent
{
  return self->_loggingConsent;
}

- (void)setLoggingConsent:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (NSMutableArray)contextFetchHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContextFetchHandlers:(id)a3
{
}

- (BOOL)isFetchingExtensionHostContext
{
  return self->_isFetchingExtensionHostContext;
}

- (void)setIsFetchingExtensionHostContext:(BOOL)a3
{
  self->_isFetchingExtensionHostContext = a3;
}

- (BOOL)adoptsExtensionTrackerFlow
{
  return self->_adoptsExtensionTrackerFlow;
}

- (void)setAdoptsExtensionTrackerFlow:(BOOL)a3
{
  self->_adoptsExtensionTrackerFlow = a3;
}

- (int64_t)callCount
{
  return self->_callCount;
}

- (void)setCallCount:(int64_t)a3
{
  self->_callCount = a3;
}

- (NSNumber)cachedRequiresDataClassBAccessToRun
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCachedRequiresDataClassBAccessToRun:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRequiresDataClassBAccessToRun, 0);
  objc_storeStrong((id *)&self->_contextFetchHandlers, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_loggingConsent, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_attachmentsName, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)initWithNSExtension:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7E51000, v2, v3, "Extension identifier: %@", v4, v5, v6, v7, v8);
}

- (void)initWithNSExtension:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 attributes];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7E51000, v2, v3, "Extension attributes: %@", v4, v5, v6, v7, v8);
}

void __32__DEExtension_endUsingExtension__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v4 = [WeakRetained extension];
  uint64_t v5 = [v4 identifier];
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_1A7E51000, a2, OS_LOG_TYPE_FAULT, "Tried to end using extension %{public}@, but there's no context.", v6, 0xCu);
}

void __32__DEExtension_endUsingExtension__block_invoke_cold_2(id *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v4 = [WeakRetained extension];
  uint64_t v5 = [v4 identifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7E51000, a2, v6, "A context is being created, but the extension %{public}@ is being shut down. This is an error.", v7);
}

void __52__DEExtension_createExtensionHostContextCompletion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7E51000, a2, v4, "DEExtension beginRequest error: %@", v5);
}

void __52__DEExtension_createExtensionHostContextCompletion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A7E51000, log, OS_LOG_TYPE_ERROR, "Failed entitlement check", v1, 2u);
}

void __52__DEExtension_createExtensionHostContextCompletion___block_invoke_cold_3(id *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v4 = [WeakRetained context];
  objc_opt_class();
  OUTLINED_FUNCTION_0_1();
  id v6 = v5;
  OUTLINED_FUNCTION_0_3(&dword_1A7E51000, a2, v7, "Host Context is the wrong kind of class: %@", v8);
}

- (void)accessBundleWithSynchronousHandler:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A7E51000, v3, (uint64_t)v3, "Failed to get extension token for [%{public}@]: Token is nil", v4);
}

- (void)accessBundleWithSynchronousHandler:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A7E51000, v3, (uint64_t)v3, "Failed to consume extension token for [%{public}@]", v4);
}

- (void)accessBundleWithSynchronousHandler:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A7E51000, v3, (uint64_t)v3, "Plugin url is nil for [%{public}@]", v4);
}

- (void)accessBundleWithSynchronousHandler:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A7E51000, v3, (uint64_t)v3, "Failed to get extension token for [%{public}@]: Unknown token kind", v4);
}

void __50__DEExtension_accessBundleWithSynchronousHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) identifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7E51000, v2, v3, "Got sandbox extension token for [%{public}@].", v4, v5, v6, v7, v8);
}

- (void)_localizedTextFromLocalizedStringKey:fallbackFileContentsKey:localization:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_1A7E51000, v0, v1, "Could not find [%{public}@] for any localization. Falling back to value in file for [%{public}@] plist key");
}

void __61__DEExtension__localizedStringFromPlistWithKey_localization___block_invoke_cold_1(void *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_3_0(&dword_1A7E51000, (uint64_t)a2, a3, "Could not find [%{public}@] for localization [%{public}@]. Falling back to value in plist value", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)loggingProfileURLsFromExtension
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = @"DELoggingPreferenceSubsystems";
  OUTLINED_FUNCTION_0_3(&dword_1A7E51000, a1, a3, "%{public}@ does not contain an array of strings. Cannot load subsystems.", (uint8_t *)&v3);
}

@end