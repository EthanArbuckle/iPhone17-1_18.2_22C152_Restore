@interface AAFAnalyticsEventSecurity
+ (BOOL)isAAAFoundationAvailable;
+ (BOOL)isAuthKitAvailable;
+ (id)fetchDeviceSessionIDFromAuthKit:(id)a3;
- (AAFAnalyticsEvent)event;
- (AAFAnalyticsEventSecurity)initWithCKKSMetrics:(id)a3 altDSID:(id)a4 eventName:(id)a5 testsAreEnabled:(BOOL)a6 category:(id)a7 sendMetric:(BOOL)a8;
- (AAFAnalyticsEventSecurity)initWithKeychainCircleMetrics:(id)a3 altDSID:(id)a4 eventName:(id)a5 category:(id)a6;
- (AAFAnalyticsEventSecurity)initWithKeychainCircleMetrics:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 eventName:(id)a7 testsAreEnabled:(BOOL)a8 canSendMetrics:(BOOL)a9 category:(id)a10;
- (BOOL)areTestsEnabled;
- (BOOL)canSendMetrics;
- (BOOL)isAAAFoundationAvailable;
- (BOOL)isAuthKitAvailable;
- (BOOL)permittedToSendMetrics;
- (OS_dispatch_queue)queue;
- (void)addMetrics:(id)a3;
- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3;
- (void)setAreTestsEnabled:(BOOL)a3;
- (void)setCanSendMetrics:(BOOL)a3;
- (void)setEvent:(id)a3;
- (void)setIsAAAFoundationAvailable:(BOOL)a3;
- (void)setIsAuthKitAvailable:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation AAFAnalyticsEventSecurity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setIsAuthKitAvailable:(BOOL)a3
{
  self->_isAuthKitAvailable = a3;
}

- (BOOL)isAuthKitAvailable
{
  return self->_isAuthKitAvailable;
}

- (void)setIsAAAFoundationAvailable:(BOOL)a3
{
  self->_isAAAFoundationAvailable = a3;
}

- (BOOL)isAAAFoundationAvailable
{
  return self->_isAAAFoundationAvailable;
}

- (void)setCanSendMetrics:(BOOL)a3
{
  self->_canSendMetrics = a3;
}

- (BOOL)canSendMetrics
{
  return self->_canSendMetrics;
}

- (void)setAreTestsEnabled:(BOOL)a3
{
  self->_areTestsEnabled = a3;
}

- (BOOL)areTestsEnabled
{
  return self->_areTestsEnabled;
}

- (void)setEvent:(id)a3
{
}

- (AAFAnalyticsEvent)event
{
  return (AAFAnalyticsEvent *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)addMetrics:(id)a3
{
  id v4 = a3;
  if ([(AAFAnalyticsEventSecurity *)self permittedToSendMetrics])
  {
    v5 = [(AAFAnalyticsEventSecurity *)self queue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__AAFAnalyticsEventSecurity_addMetrics___block_invoke;
    v6[3] = &unk_264315050;
    id v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);
  }
}

void __40__AAFAnalyticsEventSecurity_addMetrics___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
        v9 = [*(id *)(a1 + 40) event];
        [v9 setObject:v8 forKeyedSubscript:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3
{
  id v4 = a3;
  if ([(AAFAnalyticsEventSecurity *)self permittedToSendMetrics])
  {
    uint64_t v5 = [(AAFAnalyticsEventSecurity *)self queue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __75__AAFAnalyticsEventSecurity_populateUnderlyingErrorsStartingWithRootError___block_invoke;
    v6[3] = &unk_264315050;
    void v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

void __75__AAFAnalyticsEventSecurity_populateUnderlyingErrorsStartingWithRootError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) event];
  [v2 populateUnderlyingErrorsStartingWithRootError:*(void *)(a1 + 40)];
}

- (AAFAnalyticsEventSecurity)initWithKeychainCircleMetrics:(id)a3 altDSID:(id)a4 eventName:(id)a5 category:(id)a6
{
  LOBYTE(v7) = 1;
  return [(AAFAnalyticsEventSecurity *)self initWithKeychainCircleMetrics:a3 altDSID:a4 flowID:0 deviceSessionID:0 eventName:a5 testsAreEnabled:0 canSendMetrics:v7 category:a6];
}

- (AAFAnalyticsEventSecurity)initWithCKKSMetrics:(id)a3 altDSID:(id)a4 eventName:(id)a5 testsAreEnabled:(BOOL)a6 category:(id)a7 sendMetric:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return [(AAFAnalyticsEventSecurity *)self initWithKeychainCircleMetrics:a3 altDSID:a4 flowID:0 deviceSessionID:0 eventName:a5 testsAreEnabled:a6 canSendMetrics:v9 category:a7];
}

- (AAFAnalyticsEventSecurity)initWithKeychainCircleMetrics:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 eventName:(id)a7 testsAreEnabled:(BOOL)a8 canSendMetrics:(BOOL)a9 category:(id)a10
{
  BOOL v10 = a8;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v39 = a4;
  id v42 = a5;
  id v17 = a6;
  id v40 = a7;
  id v41 = a10;
  if (+[AAFAnalyticsEventSecurity isAAAFoundationAvailable](AAFAnalyticsEventSecurity, "isAAAFoundationAvailable")&& +[AAFAnalyticsEventSecurity isAuthKitAvailable]&& a9&& !v10)
  {
    v47.receiver = self;
    v47.super_class = (Class)AAFAnalyticsEventSecurity;
    v18 = [(AAFAnalyticsEventSecurity *)&v47 init];
    if (v18)
    {
      v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v20 = dispatch_queue_create("com.apple.security.aafanalyticsevent.queue", v19);
      queue = v18->_queue;
      v18->_queue = (OS_dispatch_queue *)v20;

      v18->_areTestsEnabled = 0;
      v18->_canSendMetrics = a9;
      *(_WORD *)&v18->_isAAAFoundationAvailable = 257;
      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x2050000000;
      v22 = (void *)getAAFAnalyticsEventClass_softClass;
      uint64_t v57 = getAAFAnalyticsEventClass_softClass;
      if (!getAAFAnalyticsEventClass_softClass)
      {
        uint64_t v49 = MEMORY[0x263EF8330];
        uint64_t v50 = 3221225472;
        v51 = __getAAFAnalyticsEventClass_block_invoke;
        v52 = &unk_2643150C8;
        v53 = &v54;
        __getAAFAnalyticsEventClass_block_invoke((uint64_t)&v49);
        v22 = (void *)v55[3];
      }
      v23 = v22;
      _Block_object_dispose(&v54, 8);
      v24 = (void *)[[v23 alloc] initWithEventName:v40 eventCategory:v41 initData:0];
      if (v42 && ([v42 isEqualToString:&stru_26C972770] & 1) == 0)
      {
        uint64_t v54 = 0;
        v55 = &v54;
        uint64_t v56 = 0x2020000000;
        v25 = (void *)getkAAFFlowIdSymbolLoc_ptr;
        uint64_t v57 = getkAAFFlowIdSymbolLoc_ptr;
        if (!getkAAFFlowIdSymbolLoc_ptr)
        {
          uint64_t v49 = MEMORY[0x263EF8330];
          uint64_t v50 = 3221225472;
          v51 = __getkAAFFlowIdSymbolLoc_block_invoke;
          v52 = &unk_2643150C8;
          v53 = &v54;
          v26 = (void *)AAAFoundationLibrary_1113();
          v27 = dlsym(v26, "kAAFFlowId");
          *(void *)(v53[1] + 24) = v27;
          getkAAFFlowIdSymbolLoc_ptr = *(void *)(v53[1] + 24);
          v25 = (void *)v55[3];
        }
        _Block_object_dispose(&v54, 8);
        if (!v25)
        {
          dlerror();
          abort_report_np();
          __break(1u);
        }
        [v24 setObject:v42 forKeyedSubscript:*v25];
      }
      if (v17 && ([v17 isEqualToString:&stru_26C972770] & 1) == 0)
      {
        v28 = getkAAFDeviceSessionId();
        [v24 setObject:v17 forKeyedSubscript:v28];
      }
      else
      {
        v28 = +[AAFAnalyticsEventSecurity fetchDeviceSessionIDFromAuthKit:v39];
        v29 = getkAAFDeviceSessionId();
        [v24 setObject:v28 forKeyedSubscript:v29];
      }
      if (v16)
      {
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        v30 = [v16 allKeys];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v58 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v44 != v32) {
                objc_enumerationMutation(v30);
              }
              uint64_t v34 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              v35 = [v16 objectForKeyedSubscript:v34];
              [v24 setObject:v35 forKeyedSubscript:v34];
            }
            uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v58 count:16];
          }
          while (v31);
        }
      }
      event = v18->_event;
      v18->_event = (AAFAnalyticsEvent *)v24;
    }
  }
  else
  {
    v48.receiver = self;
    v48.super_class = (Class)AAFAnalyticsEventSecurity;
    v18 = [(AAFAnalyticsEventSecurity *)&v48 init];
    if (v18)
    {
      v18->_isAAAFoundationAvailable = +[AAFAnalyticsEventSecurity isAAAFoundationAvailable];
      v18->_isAuthKitAvailable = +[AAFAnalyticsEventSecurity isAuthKitAvailable];
      v18->_areTestsEnabled = v10;
      v18->_canSendMetrics = a9;
    }
  }
  v37 = v18;

  return v37;
}

- (BOOL)permittedToSendMetrics
{
  if (![(AAFAnalyticsEventSecurity *)self isAAAFoundationAvailable]
    || ![(AAFAnalyticsEventSecurity *)self isAuthKitAvailable]
    || [(AAFAnalyticsEventSecurity *)self areTestsEnabled])
  {
    return 0;
  }
  return [(AAFAnalyticsEventSecurity *)self canSendMetrics];
}

+ (id)fetchDeviceSessionIDFromAuthKit:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2050000000;
  id v4 = (void *)getAKAccountManagerClass_softClass;
  uint64_t v17 = getAKAccountManagerClass_softClass;
  if (!getAKAccountManagerClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v19 = __getAKAccountManagerClass_block_invoke;
    dispatch_queue_t v20 = &unk_2643150C8;
    v21 = &v14;
    __getAKAccountManagerClass_block_invoke((uint64_t)&buf);
    id v4 = (void *)v15[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v14, 8);
  v6 = [v5 sharedInstance];
  uint64_t v7 = v6;
  if (v3)
  {
    id v13 = 0;
    v8 = [v6 authKitAccountWithAltDSID:v3 error:&v13];
    id v9 = v13;
    if (v9)
    {
      BOOL v10 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_218274000, v10, OS_LOG_TYPE_DEFAULT, "authKitAccountWithAltDSID returned error: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else
  {
    v8 = [v6 primaryAuthKitAccount];
  }
  if ([v7 accountAccessTelemetryOptInForAccount:v8])
  {
    long long v11 = [v7 telemetryDeviceSessionIDForAccount:v8];
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

+ (BOOL)isAuthKitAvailable
{
  if (isAuthKitAvailable_onceToken != -1) {
    dispatch_once(&isAuthKitAvailable_onceToken, &__block_literal_global_25);
  }
  return isAuthKitAvailable_available;
}

void __47__AAFAnalyticsEventSecurity_isAuthKitAvailable__block_invoke()
{
  if (AuthKitLibraryCore())
  {
    isAuthKitAvailable_available = 1;
  }
  else
  {
    v0 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_218274000, v0, OS_LOG_TYPE_DEFAULT, "aafanalyticsevent-security: failed to softlink AuthKit", v1, 2u);
    }
  }
}

+ (BOOL)isAAAFoundationAvailable
{
  if (isAAAFoundationAvailable_onceToken != -1) {
    dispatch_once(&isAAAFoundationAvailable_onceToken, &__block_literal_global_1131);
  }
  return isAAAFoundationAvailable_available;
}

void __53__AAFAnalyticsEventSecurity_isAAAFoundationAvailable__block_invoke()
{
  if (AAAFoundationLibraryCore())
  {
    isAAAFoundationAvailable_available = 1;
  }
  else
  {
    v0 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_218274000, v0, OS_LOG_TYPE_DEFAULT, "aafanalyticsevent-security: failed to softlink AAAFoundation", v1, 2u);
    }
  }
}

@end