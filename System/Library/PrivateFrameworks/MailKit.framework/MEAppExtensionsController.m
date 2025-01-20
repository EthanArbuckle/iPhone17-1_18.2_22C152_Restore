@interface MEAppExtensionsController
+ (id)_emailExtensionAttributeDictionary;
+ (id)log;
+ (id)sharedInstance;
- (BOOL)_extension:(id)a3 matchesCapabilities:(id)a4;
- (BOOL)_extension:(id)a3 matchesCriteria:(id)a4;
- (BOOL)_extension:(id)a3 matchesOldCriteria:(id)a4;
- (BOOL)hasSecurityExtensionsEnabled;
- (EFCancelable)stateCaptureCancelable;
- (MEAppExtensionsController)init;
- (NSArray)previouslyEnabledExtensionIdentifiers;
- (NSDictionary)extensionsByIdentifier;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)stateCaptureQueue;
- (id)_extensionsNewlyMatchingFromNewExtensions:(id)a3 currentExtensions:(id)a4 forCriteria:(id)a5;
- (id)_extensionsNoLongerMatchingFromNewExtensions:(id)a3 currentExtensions:(id)a4 forCriteria:(id)a5;
- (id)_remoteEmailExtensionsForExtensions:(id)a3 enabledOnly:(BOOL)a4;
- (id)extensionForIdentifier:(id)a3;
- (void)_logExtensionsStateWithReason:(id)a3;
- (void)_startMatchingExtensions;
- (void)_stopMatchingExtensions;
- (void)dealloc;
- (void)registerMailAppExtensionsObserver:(id)a3 capabilities:(id)a4 includeDisabled:(BOOL)a5 completion:(id)a6;
- (void)setExtensionsByIdentifier:(id)a3;
- (void)setPreviouslyEnabledExtensionIdentifiers:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation MEAppExtensionsController

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__MEAppExtensionsController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v2 = (void *)log_log;
  return v2;
}

void __32__MEAppExtensionsController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sIntance;
  return v2;
}

void __43__MEAppExtensionsController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MEAppExtensionsController);
  os_log_t v1 = (void *)sharedInstance_sIntance;
  sharedInstance_sIntance = (uint64_t)v0;
}

+ (id)_emailExtensionAttributeDictionary
{
  if (_emailExtensionAttributeDictionary_onceToken != -1) {
    dispatch_once(&_emailExtensionAttributeDictionary_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)_emailExtensionAttributeDictionary_sMatchDictionary;
  return v2;
}

void __63__MEAppExtensionsController__emailExtensionAttributeDictionary__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F5E740];
  v3[0] = @"com.apple.email.extension";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  os_log_t v1 = (void *)_emailExtensionAttributeDictionary_sMatchDictionary;
  _emailExtensionAttributeDictionary_sMatchDictionary = v0;
}

- (MEAppExtensionsController)init
{
  v16.receiver = self;
  v16.super_class = (Class)MEAppExtensionsController;
  uint64_t v2 = [(MEAppExtensionsController *)&v16 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.email.extension.remoteExtensionLoader", v3);
    [(MEAppExtensionsController *)v2 setQueue:v4];

    uint64_t v5 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.email.MEAppExtensionsController.stateCaptureQueue", v8);
    stateCaptureQueue = v2->_stateCaptureQueue;
    v2->_stateCaptureQueue = (OS_dispatch_queue *)v9;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    objc_copyWeak(&v14, &location);
    uint64_t v11 = EFLogRegisterStateCaptureBlock();
    stateCaptureCancelable = v2->_stateCaptureCancelable;
    v2->_stateCaptureCancelable = (EFCancelable *)v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __33__MEAppExtensionsController_init__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
  id v2 = *((id *)WeakRetained + 4);
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        dispatch_queue_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "ef_publicDescription", (void)v14);
        [v3 addObject:v10];

        if ([v9 isEnabled])
        {
          uint64_t v11 = objc_msgSend(v9, "ef_publicDescription");
          [v4 addObject:v11];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  v18[0] = @"All Extensions";
  v18[1] = @"Enabled Extensions";
  v19[0] = v3;
  v19[1] = v4;
  v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v12;
}

- (void)dealloc
{
  [(MEAppExtensionsController *)self _stopMatchingExtensions];
  [(EFCancelable *)self->_stateCaptureCancelable cancel];
  v3.receiver = self;
  v3.super_class = (Class)MEAppExtensionsController;
  [(MEAppExtensionsController *)&v3 dealloc];
}

- (void)registerMailAppExtensionsObserver:(id)a3 capabilities:(id)a4 includeDisabled:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [[MEMailAppExtensionObserverCriteria alloc] initWithCapabilities:v11 includeDisabled:v7];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v15 = [(NSMapTable *)self->_observers objectForKey:v10];

  if (v15)
  {
    BOOL areRemoteExtensionsFetched = self->_areRemoteExtensionsFetched;
    os_unfair_lock_unlock(p_lock);
    long long v17 = [MEMORY[0x263F087E8] errorWithDomain:@"MEMailExtensionErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, void, void, BOOL, void *))v12 + 2))(v12, 0, 0, areRemoteExtensionsFetched, v17);
  }
  else
  {
    [(NSMapTable *)self->_observers setObject:v13 forKey:v10];
    BOOL v18 = self->_areRemoteExtensionsFetched;
    os_unfair_lock_unlock(&self->_lock);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    id v19 = objc_alloc_init(MEMORY[0x263F3B350]);
    id from = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&from, self);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __103__MEAppExtensionsController_registerMailAppExtensionsObserver_capabilities_includeDisabled_completion___block_invoke;
    v24[3] = &unk_264282FF0;
    objc_copyWeak(&v25, &from);
    objc_copyWeak(&v26, &location);
    [v19 addCancelationBlock:v24];
    os_unfair_lock_lock(&self->_lock);
    v20 = self->_allRemoteExtensions;
    if (!self->_extensionMatchingContext) {
      [(MEAppExtensionsController *)self _startMatchingExtensions];
    }
    os_unfair_lock_unlock(&self->_lock);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __103__MEAppExtensionsController_registerMailAppExtensionsObserver_capabilities_includeDisabled_completion___block_invoke_2;
    v22[3] = &unk_264283018;
    v22[4] = self;
    v23 = v13;
    uint64_t v21 = [(NSArray *)v20 ef_filter:v22];
    (*((void (**)(id, id, void *, BOOL, void))v12 + 2))(v12, v19, v21, v18, 0);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&from);

    objc_destroyWeak(&location);
  }
}

void __103__MEAppExtensionsController_registerMailAppExtensionsObserver_capabilities_includeDisabled_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
  id v2 = (void *)*((void *)WeakRetained + 1);
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v2 removeObjectForKey:v3];

  if (![*((id *)WeakRetained + 1) count]) {
    [WeakRetained _stopMatchingExtensions];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
}

uint64_t __103__MEAppExtensionsController_registerMailAppExtensionsObserver_capabilities_includeDisabled_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _extension:a2 matchesCriteria:*(void *)(a1 + 40)];
}

- (id)extensionForIdentifier:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = self->_allRemoteExtensions;
  os_unfair_lock_unlock(p_lock);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__MEAppExtensionsController_extensionForIdentifier___block_invoke;
  v10[3] = &unk_264283040;
  id v11 = v4;
  id v7 = v4;
  v8 = [(NSArray *)v6 ef_firstObjectPassingTest:v10];

  return v8;
}

uint64_t __52__MEAppExtensionsController_extensionForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 extensionID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)hasSecurityExtensionsEnabled
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = self->_allRemoteExtensions;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v2;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "isEnabled", (void)v11))
        {
          v8 = [v7 capabilities];
          char v9 = [v8 containsObject:@"MEMessageSecurityHandler"];

          if (v9)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)_startMatchingExtensions
{
  id v3 = (void *)MEMORY[0x263F08800];
  uint64_t v4 = +[MEAppExtensionsController _emailExtensionAttributeDictionary];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__MEAppExtensionsController__startMatchingExtensions__block_invoke;
  v7[3] = &unk_2642830B0;
  v7[4] = self;
  uint64_t v5 = [v3 beginMatchingExtensionsWithAttributes:v4 completion:v7];
  id extensionMatchingContext = self->_extensionMatchingContext;
  self->_id extensionMatchingContext = v5;
}

void __53__MEAppExtensionsController__startMatchingExtensions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__MEAppExtensionsController__startMatchingExtensions__block_invoke_2;
  block[3] = &unk_264283088;
  objc_copyWeak(&v8, &location);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __53__MEAppExtensionsController__startMatchingExtensions__block_invoke_2(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v29 = *((id *)WeakRetained + 4);
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v29;
  uint64_t v3 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v44 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v7 = objc_msgSend(v6, "extensionID", v29);
        [v2 setObject:v6 forKeyedSubscript:v7];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v3);
  }

  id v8 = [WeakRetained _remoteEmailExtensionsForExtensions:*(void *)(a1 + 32) enabledOnly:0];
  id v30 = [v8 allValues];

  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v33 = v30;
  uint64_t v10 = [v33 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v33);
        }
        long long v13 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        long long v14 = objc_msgSend(v13, "extensionID", v29);
        [v9 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v10 = [v33 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v10);
  }

  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
  objc_storeStrong((id *)WeakRetained + 4, v30);
  long long v15 = WeakRetained;
  uint64_t v16 = (void *)[*((id *)WeakRetained + 1) copy];
  *((unsigned char *)WeakRetained + 40) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v31 = [v16 keyEnumerator];
  uint64_t v17 = [v31 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v31);
        }
        v20 = *(void **)(*((void *)&v35 + 1) + 8 * k);
        uint64_t v21 = objc_msgSend(v16, "objectForKey:", v20, v29);
        v22 = [v15 _extensionsNewlyMatchingFromNewExtensions:v9 currentExtensions:v2 forCriteria:v21];
        v23 = [v15 _extensionsNoLongerMatchingFromNewExtensions:v9 currentExtensions:v2 forCriteria:v21];
        [v20 extensionsMatched:v22];
        if ([v23 count]) {
          [v20 extensionsNoLongerMatching:v23];
        }

        long long v15 = WeakRetained;
      }
      uint64_t v17 = [v31 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v17);
  }

  uint64_t v24 = objc_msgSend(v33, "ef_compactMap:", &__block_literal_global_51);
  id v25 = (void *)*((void *)WeakRetained + 8);
  *((void *)WeakRetained + 8) = v24;

  id v26 = @"processing updates";
  if (!v29) {
    id v26 = @"startup";
  }
  v27 = v26;
  [WeakRetained _logExtensionsStateWithReason:v27];
  v28 = [MEMORY[0x263F08A00] defaultCenter];
  [v28 postNotificationName:@"MEMailAppExtensionsEnabledStateChanged" object:WeakRetained];
}

id __53__MEAppExtensionsController__startMatchingExtensions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEnabled])
  {
    uint64_t v3 = [v2 extensionID];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_extensionsNewlyMatchingFromNewExtensions:(id)a3 currentExtensions:(id)a4 forCriteria:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v21 = a4;
  id v8 = a5;
  char v9 = [v8 includeDisabled];
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = [v19 allValues];
  uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (-[MEAppExtensionsController _extension:matchesCriteria:](self, "_extension:matchesCriteria:", v13, v8, v19))
        {
          long long v14 = [v13 extensionID];
          long long v15 = [v21 objectForKeyedSubscript:v14];

          if (v9)
          {
            if (!v15) {
              goto LABEL_12;
            }
          }
          else if ([v13 isEnabled])
          {
            previouslyEnabledExtensionIdentifiers = self->_previouslyEnabledExtensionIdentifiers;
            uint64_t v17 = [v13 extensionID];
            LOBYTE(previouslyEnabledExtensionIdentifiers) = [(NSArray *)previouslyEnabledExtensionIdentifiers containsObject:v17];

            if ((previouslyEnabledExtensionIdentifiers & 1) == 0) {
LABEL_12:
            }
              [v20 addObject:v13];
          }

          continue;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  return v20;
}

- (id)_extensionsNoLongerMatchingFromNewExtensions:(id)a3 currentExtensions:(id)a4 forCriteria:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v19 = a4;
  id v9 = a5;
  char v21 = [v9 includeDisabled];
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = [v19 allValues];
  uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "extensionID", v19);
        long long v15 = [v8 objectForKeyedSubscript:v14];

        if (![(MEAppExtensionsController *)self _extension:v15 matchesCriteria:v9]
          && [(MEAppExtensionsController *)self _extension:v13 matchesOldCriteria:v9])
        {
          if (v21)
          {
            if (v15) {
              goto LABEL_14;
            }
LABEL_13:
            [v20 addObject:v13];
            goto LABEL_14;
          }
          if (([v15 isEnabled] & 1) == 0)
          {
            previouslyEnabledExtensionIdentifiers = self->_previouslyEnabledExtensionIdentifiers;
            uint64_t v17 = [v15 extensionID];
            LOBYTE(previouslyEnabledExtensionIdentifiers) = [(NSArray *)previouslyEnabledExtensionIdentifiers containsObject:v17];

            if (previouslyEnabledExtensionIdentifiers) {
              goto LABEL_13;
            }
          }
        }
LABEL_14:
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  return v20;
}

- (BOOL)_extension:(id)a3 matchesOldCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 includeDisabled] & 1) != 0
    || (previouslyEnabledExtensionIdentifiers = self->_previouslyEnabledExtensionIdentifiers,
        [v6 extensionID],
        id v9 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(previouslyEnabledExtensionIdentifiers) = [(NSArray *)previouslyEnabledExtensionIdentifiers containsObject:v9], v9, (previouslyEnabledExtensionIdentifiers & 1) != 0))
  {
    uint64_t v10 = [v7 capabilities];
    BOOL v11 = [(MEAppExtensionsController *)self _extension:v6 matchesCapabilities:v10];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_extension:(id)a3 matchesCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 includeDisabled] & 1) != 0 || (objc_msgSend(v6, "isEnabled"))
  {
    id v8 = [v7 capabilities];
    BOOL v9 = [(MEAppExtensionsController *)self _extension:v6 matchesCapabilities:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_extension:(id)a3 matchesCapabilities:(id)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:a4];
  id v7 = (void *)MEMORY[0x263EFFA08];
  id v8 = [v5 capabilities];
  BOOL v9 = [v7 setWithArray:v8];

  LOBYTE(v8) = [v6 intersectsSet:v9];
  return (char)v8;
}

- (void)_stopMatchingExtensions
{
}

- (id)_remoteEmailExtensionsForExtensions:(id)a3 enabledOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v21, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v21;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    int v8 = !v4;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        BOOL v11 = [v10 identifier];
        long long v12 = [v10 _plugIn];
        unsigned __int8 v13 = [v12 userElection];

        if ((([v10 optedIn] | v8) & 1) != 0 || v13 < 2uLL)
        {
          long long v14 = [v10 _plugIn];
          long long v15 = [[MERemoteExtension alloc] initWithExtension:v10];
          uint64_t v16 = [v14 identifier];
          [v22 setObject:v15 forKeyedSubscript:v16];

          uint64_t v17 = +[MEAppExtensionsController log];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v28 = (uint64_t)v11;
            _os_log_impl(&dword_2164DB000, v17, OS_LOG_TYPE_DEFAULT, "Found email extension with identifier:%@", buf, 0xCu);
          }
        }
        else
        {
          long long v14 = +[MEAppExtensionsController log];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v28 = (uint64_t)v11;
            __int16 v29 = 2080;
            id v30 = "NO";
            __int16 v31 = 2048;
            uint64_t v32 = v13;
            _os_log_debug_impl(&dword_2164DB000, v14, OS_LOG_TYPE_DEBUG, "Skipping extension:%@, optedIn:%s, election:%ld", buf, 0x20u);
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v6);
  }

  uint64_t v18 = +[MEAppExtensionsController log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v22 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v28 = v19;
    _os_log_impl(&dword_2164DB000, v18, OS_LOG_TYPE_DEFAULT, "Found %lu email extensions", buf, 0xCu);
  }

  return v22;
}

- (void)_logExtensionsStateWithReason:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v8 = self->_allRemoteExtensions;
  os_unfair_lock_unlock(p_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v9 = v8;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        unsigned __int8 v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "ef_publicDescription", (void)v17);
        [v5 addObject:v14];

        if ([v13 isEnabled])
        {
          long long v15 = objc_msgSend(v13, "ef_publicDescription");
          [v6 addObject:v15];
        }
      }
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v10);
  }

  uint64_t v16 = MEMailExtensionsLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v22 = v4;
    __int16 v23 = 2114;
    id v24 = v6;
    __int16 v25 = 2114;
    id v26 = v5;
    _os_log_impl(&dword_2164DB000, v16, OS_LOG_TYPE_DEFAULT, "Current Mail Extensions for %{public}@ - \nEnabled Extensions - %{public}@\nAll Extensions %{public}@", buf, 0x20u);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDictionary)extensionsByIdentifier
{
  return self->_extensionsByIdentifier;
}

- (void)setExtensionsByIdentifier:(id)a3
{
}

- (NSArray)previouslyEnabledExtensionIdentifiers
{
  return self->_previouslyEnabledExtensionIdentifiers;
}

- (void)setPreviouslyEnabledExtensionIdentifiers:(id)a3
{
}

- (OS_dispatch_queue)stateCaptureQueue
{
  return self->_stateCaptureQueue;
}

- (EFCancelable)stateCaptureCancelable
{
  return self->_stateCaptureCancelable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureCancelable, 0);
  objc_storeStrong((id *)&self->_stateCaptureQueue, 0);
  objc_storeStrong((id *)&self->_previouslyEnabledExtensionIdentifiers, 0);
  objc_storeStrong((id *)&self->_extensionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_allRemoteExtensions, 0);
  objc_storeStrong(&self->_extensionMatchingContext, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end