@interface HFMediaServiceManager
+ (id)sharedManager;
- (BOOL)_isReadRequestInFlightForHome:(id)a3;
- (BOOL)isRefreshNeededForHome:(id)a3;
- (HFMediaServiceManager)init;
- (NSHashTable)observers;
- (NSMutableDictionary)homeIdentifierToDefaultServiceMapping;
- (NSMutableDictionary)homeIdentifierToMediaServicesMapping;
- (NSMutableDictionary)homeIdentifierToReadRequestInFlightMapping;
- (NSMutableDictionary)homeIdentifierToRefreshNeededMapping;
- (id)_defaultMediaServiceForHome:(id)a3;
- (id)_fetchDefaultMediaServiceForHome:(id)a3;
- (id)_mediaServicesForHome:(id)a3;
- (id)defaultMediaServiceForHome:(id)a3;
- (id)fetchMediaServicesForHome:(id)a3;
- (id)mediaServicesForHome:(id)a3;
- (id)removeMediaService:(id)a3 forHome:(id)a4;
- (id)updateDefaultMediaService:(id)a3 forHome:(id)a4;
- (id)updateProperty:(id)a3 forHome:(id)a4 withOptions:(id)a5;
- (void)_dispatchMessageToObserversWithBlock:(id)a3;
- (void)addMediaServiceManagerObserver:(id)a3;
- (void)removeMediaServiceManagerObserver:(id)a3;
- (void)setHomeIdentifierToDefaultServiceMapping:(id)a3;
- (void)setHomeIdentifierToMediaServicesMapping:(id)a3;
- (void)setHomeIdentifierToReadRequestInFlightMapping:(id)a3;
- (void)setHomeIdentifierToRefreshNeededMapping:(id)a3;
- (void)setObservers:(id)a3;
- (void)warmup;
@end

@implementation HFMediaServiceManager

- (id)mediaServicesForHome:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFMediaServiceManager *)self _mediaServicesForHome:v4];
  v6 = HFLogForCategory(0xCuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = v5;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Found cached media services %@ for home %@", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (id)_mediaServicesForHome:(id)a3
{
  id v4 = a3;
  v5 = [(HFMediaServiceManager *)self homeIdentifierToMediaServicesMapping];
  v6 = [v4 uniqueIdentifier];

  v7 = [v6 UUIDString];
  int v8 = [v5 objectForKey:v7];

  return v8;
}

- (NSMutableDictionary)homeIdentifierToMediaServicesMapping
{
  return self->_homeIdentifierToMediaServicesMapping;
}

- (void)warmup
{
  v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 homeFuture];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__HFMediaServiceManager_warmup__block_invoke;
  v6[3] = &unk_26409B3C8;
  v6[4] = self;
  id v5 = (id)[v4 addSuccessBlock:v6];
}

void __31__HFMediaServiceManager_warmup__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(v4, "hf_hasHomePods")) {
    id v3 = (id)[*(id *)(a1 + 32) fetchMediaServicesForHome:v4];
  }
}

uint64_t __38__HFMediaServiceManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = _MergedGlobals_326;
  _MergedGlobals_326 = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (HFMediaServiceManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)HFMediaServiceManager;
  uint64_t v2 = [(HFMediaServiceManager *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    homeIdentifierToMediaServicesMapping = v2->_homeIdentifierToMediaServicesMapping;
    v2->_homeIdentifierToMediaServicesMapping = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    homeIdentifierToDefaultServiceMapping = v2->_homeIdentifierToDefaultServiceMapping;
    v2->_homeIdentifierToDefaultServiceMapping = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    homeIdentifierToReadRequestInFlightMapping = v2->_homeIdentifierToReadRequestInFlightMapping;
    v2->_homeIdentifierToReadRequestInFlightMapping = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    homeIdentifierToRefreshNeededMapping = v2->_homeIdentifierToRefreshNeededMapping;
    v2->_homeIdentifierToRefreshNeededMapping = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v11;
  }
  return v2;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HFMediaServiceManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26AB2FEA8 != -1) {
    dispatch_once(&qword_26AB2FEA8, block);
  }
  uint64_t v2 = (void *)_MergedGlobals_326;
  return v2;
}

- (void)addMediaServiceManagerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMediaServiceManager *)self observers];
  [v5 addObject:v4];
}

- (void)removeMediaServiceManagerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMediaServiceManager *)self observers];
  [v5 removeObject:v4];
}

- (id)defaultMediaServiceForHome:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFMediaServiceManager *)self _defaultMediaServiceForHome:v4];
  v6 = HFLogForCategory(0xCuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Found cached default media service %@ for home %@", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (id)fetchMediaServicesForHome:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = HFLogForCategory(0xCuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v32 = v7;
    __int16 v33 = 2112;
    id v34 = v5;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "%@ Fetching media services for home %@", buf, 0x16u);
  }
  if (v5)
  {
    BOOL v8 = [(HFMediaServiceManager *)self _isReadRequestInFlightForHome:v5];
    uint64_t v9 = HFLogForCategory(0xCuLL);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        id v11 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        v32 = v11;
        _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "%@ Read request already in-flight. Returning cached results.", buf, 0xCu);
      }
      uint64_t v12 = (void *)MEMORY[0x263F58190];
      v13 = [(HFMediaServiceManager *)self _mediaServicesForHome:v5];
      objc_super v14 = [v12 futureWithResult:v13];
    }
    else
    {
      if (v10)
      {
        v18 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v32 = v18;
        __int16 v33 = 2112;
        id v34 = v5;
        _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "%@ Will fetch media services for home %@ from MediaServiceConfigurationClass", buf, 0x16u);
      }
      v19 = [(HFMediaServiceManager *)self homeIdentifierToReadRequestInFlightMapping];
      v20 = [v5 uniqueIdentifier];
      v21 = [v20 UUIDString];
      objc_msgSend(v19, "na_safeSetObject:forKey:", MEMORY[0x263EFFA88], v21);

      objc_initWeak((id *)buf, self);
      v22 = (void *)MEMORY[0x263F58190];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke;
      v28[3] = &unk_26408FC88;
      objc_copyWeak(v30, (id *)buf);
      id v29 = v5;
      v30[1] = (id)a2;
      v23 = [MEMORY[0x263F581B8] globalAsyncScheduler];
      v24 = [v22 futureWithBlock:v28 scheduler:v23];
      v25 = [MEMORY[0x263F581B8] mainThreadScheduler];
      objc_super v14 = [v24 reschedule:v25];

      objc_destroyWeak(v30);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v15 = HFLogForCategory(0xCuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v27 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v32 = v27;
      _os_log_error_impl(&dword_20B986000, v15, OS_LOG_TYPE_ERROR, "%@ Cannot fetch media services without a home", buf, 0xCu);
    }
    v16 = (void *)MEMORY[0x263F58190];
    v17 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    objc_super v14 = [v16 futureWithError:v17];
  }
  return v14;
}

void __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [getMediaServiceConfigurationClass() sharedInstance];
  uint64_t v6 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke_2;
  v10[3] = &unk_26409C608;
  objc_copyWeak(v13, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  BOOL v8 = *(void **)(a1 + 48);
  id v11 = v7;
  v13[1] = v8;
  id v9 = v3;
  id v12 = v9;
  [v5 getAvailableServices:v6 completion:v10];

  objc_destroyWeak(v13);
}

void __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v8 = WeakRetained;
  if (v6)
  {
    id v9 = [WeakRetained homeIdentifierToReadRequestInFlightMapping];
    BOOL v10 = [*(id *)(a1 + 32) uniqueIdentifier];
    id v11 = [v10 UUIDString];
    objc_msgSend(v9, "na_safeSetObject:forKey:", MEMORY[0x263EFFA80], v11);

    id v12 = HFLogForCategory(0xCuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "%@ Failed to fetch media services with error %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithError:v6];
  }
  else
  {
    v13 = [WeakRetained _fetchDefaultMediaServiceForHome:*(void *)(a1 + 32)];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke_6;
    v18[3] = &unk_26409C5E0;
    v18[4] = v8;
    id v19 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 56);
    id v20 = v14;
    uint64_t v22 = v15;
    id v21 = v5;
    id v16 = (id)[v13 addCompletionBlock:v18];
  }
}

void __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) homeIdentifierToReadRequestInFlightMapping];
  id v6 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v7 = [v6 UUIDString];
  objc_msgSend(v5, "na_safeSetObject:forKey:", MEMORY[0x263EFFA80], v7);

  if (v4)
  {
    [*(id *)(a1 + 48) finishWithError:v4];
  }
  else
  {
    BOOL v8 = [*(id *)(a1 + 32) homeIdentifierToRefreshNeededMapping];
    id v9 = [*(id *)(a1 + 40) uniqueIdentifier];
    BOOL v10 = [v9 UUIDString];
    objc_msgSend(v8, "na_safeSetObject:forKey:", MEMORY[0x263EFFA80], v10);

    id v11 = HFLogForCategory(0xCuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v13 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "%@ Successfully fetched media services %@", buf, 0x16u);
    }
    id v14 = [*(id *)(a1 + 32) homeIdentifierToMediaServicesMapping];
    uint64_t v15 = *(void *)(a1 + 56);
    id v16 = [*(id *)(a1 + 40) uniqueIdentifier];
    v17 = [v16 UUIDString];
    objc_msgSend(v14, "na_safeSetObject:forKey:", v15, v17);

    v18 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke_7;
    v19[3] = &unk_26409C5B8;
    id v20 = *(id *)(a1 + 56);
    [v18 _dispatchMessageToObserversWithBlock:v19];
    [*(id *)(a1 + 48) finishWithResult:*(void *)(a1 + 56)];
  }
}

void __51__HFMediaServiceManager_fetchMediaServicesForHome___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 mediaServicesDidUpdate:*(void *)(a1 + 32)];
  }
}

- (id)removeMediaService:(id)a3 forHome:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = HFLogForCategory(0xCuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Removing media service %@ for home %@", buf, 0x16u);
  }

  id v9 = (void *)MEMORY[0x263F58190];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __52__HFMediaServiceManager_removeMediaService_forHome___block_invoke;
  v18[3] = &unk_264098950;
  id v19 = v6;
  id v20 = v7;
  id v21 = self;
  BOOL v10 = (void *)MEMORY[0x263F581B8];
  id v11 = v7;
  id v12 = v6;
  uint64_t v13 = [v10 globalAsyncScheduler];
  id v14 = [v9 futureWithBlock:v18 scheduler:v13];
  uint64_t v15 = [MEMORY[0x263F581B8] mainThreadScheduler];
  id v16 = [v14 reschedule:v15];

  return v16;
}

void __52__HFMediaServiceManager_removeMediaService_forHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [getMediaServiceConfigurationClass() sharedInstance];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__HFMediaServiceManager_removeMediaService_forHome___block_invoke_2;
  v10[3] = &unk_26409C630;
  id v11 = v5;
  id v12 = v3;
  int8x16_t v9 = *(int8x16_t *)(a1 + 40);
  id v7 = (id)v9.i64[0];
  int8x16_t v13 = vextq_s8(v9, v9, 8uLL);
  id v8 = v3;
  [v4 removeServiceFromHome:v11 fromHome:v6 completion:v10];
}

void __52__HFMediaServiceManager_removeMediaService_forHome___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory(0xCuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v12 = a1[4];
      *(_DWORD *)buf = 138412546;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Failed to remove media service %@ with error %@", buf, 0x16u);
    }

    [a1[5] finishWithError:v4];
  }
  else
  {
    uint64_t v6 = [a1[6] homeIdentifierToRefreshNeededMapping];
    id v7 = [a1[7] uniqueIdentifier];
    id v8 = [v7 UUIDString];
    objc_msgSend(v6, "na_safeSetObject:forKey:", MEMORY[0x263EFFA88], v8);

    int8x16_t v9 = HFLogForCategory(0xCuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = a1[4];
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Successfully removed media service %@", buf, 0xCu);
    }

    id v11 = a1[6];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    id v13[2] = __52__HFMediaServiceManager_removeMediaService_forHome___block_invoke_15;
    v13[3] = &unk_26409C5B8;
    id v14 = a1[4];
    [v11 _dispatchMessageToObserversWithBlock:v13];
    [a1[5] finishWithNoResult];
  }
}

void __52__HFMediaServiceManager_removeMediaService_forHome___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 mediaServiceRemoved:*(void *)(a1 + 32)];
  }
}

- (id)updateDefaultMediaService:(id)a3 forHome:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory(0xCuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Updating default media service to %@ for home %@", buf, 0x16u);
  }

  int8x16_t v9 = (void *)MEMORY[0x263F58190];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __59__HFMediaServiceManager_updateDefaultMediaService_forHome___block_invoke;
  v18[3] = &unk_264098950;
  id v19 = v6;
  id v20 = v7;
  id v21 = self;
  id v10 = (void *)MEMORY[0x263F581B8];
  id v11 = v7;
  id v12 = v6;
  int8x16_t v13 = [v10 globalAsyncScheduler];
  id v14 = [v9 futureWithBlock:v18 scheduler:v13];
  uint64_t v15 = [MEMORY[0x263F581B8] mainThreadScheduler];
  id v16 = [v14 reschedule:v15];

  return v16;
}

void __59__HFMediaServiceManager_updateDefaultMediaService_forHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [getMediaServiceConfigurationClass() sharedInstance];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__HFMediaServiceManager_updateDefaultMediaService_forHome___block_invoke_2;
  v10[3] = &unk_26409C630;
  id v11 = v5;
  id v12 = v3;
  int8x16_t v9 = *(int8x16_t *)(a1 + 40);
  id v7 = (id)v9.i64[0];
  int8x16_t v13 = vextq_s8(v9, v9, 8uLL);
  id v8 = v3;
  [v4 updateDefaultMediaService:v11 forHome:v6 completion:v10];
}

void __59__HFMediaServiceManager_updateDefaultMediaService_forHome___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory(0xCuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v12 = a1[4];
      *(_DWORD *)buf = 138412546;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Failed to update default media service to %@ with error %@", buf, 0x16u);
    }

    [a1[5] finishWithError:v4];
  }
  else
  {
    uint64_t v6 = [a1[6] homeIdentifierToRefreshNeededMapping];
    id v7 = [a1[7] uniqueIdentifier];
    id v8 = [v7 UUIDString];
    objc_msgSend(v6, "na_safeSetObject:forKey:", MEMORY[0x263EFFA88], v8);

    int8x16_t v9 = HFLogForCategory(0xCuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = a1[4];
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Successfully updated default media service to %@", buf, 0xCu);
    }

    id v11 = a1[6];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    id v13[2] = __59__HFMediaServiceManager_updateDefaultMediaService_forHome___block_invoke_19;
    v13[3] = &unk_26409C5B8;
    id v14 = a1[4];
    [v11 _dispatchMessageToObserversWithBlock:v13];
    [a1[5] finishWithNoResult];
  }
}

void __59__HFMediaServiceManager_updateDefaultMediaService_forHome___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 defaultMediaServiceDidUpdate:*(void *)(a1 + 32)];
  }
}

- (id)updateProperty:(id)a3 forHome:(id)a4 withOptions:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = HFLogForCategory(0xCuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Updating properties %@ for media service %@ for home %@", buf, 0x20u);
  }

  id v12 = (void *)MEMORY[0x263F58190];
  uint64_t v22 = MEMORY[0x263EF8330];
  id v23 = v8;
  id v24 = v9;
  id v25 = v10;
  uint64_t v26 = self;
  int8x16_t v13 = (void *)MEMORY[0x263F581B8];
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  __int16 v17 = objc_msgSend(v13, "globalAsyncScheduler", v22, 3221225472, __60__HFMediaServiceManager_updateProperty_forHome_withOptions___block_invoke, &unk_264097100);
  id v18 = [v12 futureWithBlock:&v22 scheduler:v17];
  uint64_t v19 = [MEMORY[0x263F581B8] mainThreadScheduler];
  id v20 = [v18 reschedule:v19];

  return v20;
}

void __60__HFMediaServiceManager_updateProperty_forHome_withOptions___block_invoke(uint64_t *a1, void *a2)
{
  id v3 = a2;
  id v4 = [getMediaServiceConfigurationClass() sharedInstance];
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[5];
  id v7 = (void *)a1[6];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HFMediaServiceManager_updateProperty_forHome_withOptions___block_invoke_2;
  v9[3] = &unk_26409C658;
  id v10 = v7;
  id v11 = (id)a1[4];
  id v12 = v3;
  uint64_t v13 = a1[7];
  id v14 = (id)a1[5];
  id v8 = v3;
  [v4 updateProperty:v5 forHome:v6 withOptions:v10 completion:v9];
}

void __60__HFMediaServiceManager_updateProperty_forHome_withOptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = HFLogForCategory(0xCuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Failed to update properties %@ for media service %@ with error %@", buf, 0x20u);
    }

    [*(id *)(a1 + 48) finishWithError:v4];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 56) homeIdentifierToRefreshNeededMapping];
    id v7 = [*(id *)(a1 + 64) uniqueIdentifier];
    id v8 = [v7 UUIDString];
    objc_msgSend(v6, "na_safeSetObject:forKey:", MEMORY[0x263EFFA88], v8);

    id v9 = HFLogForCategory(0xCuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v10;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Successfully updated media service %@", buf, 0xCu);
    }

    id v11 = *(void **)(a1 + 56);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60__HFMediaServiceManager_updateProperty_forHome_withOptions___block_invoke_22;
    v14[3] = &unk_26409C5B8;
    id v15 = *(id *)(a1 + 40);
    [v11 _dispatchMessageToObserversWithBlock:v14];
    [*(id *)(a1 + 48) finishWithNoResult];
  }
}

void __60__HFMediaServiceManager_updateProperty_forHome_withOptions___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 mediaServiceDidUpdate:*(void *)(a1 + 32)];
  }
}

- (id)_fetchDefaultMediaServiceForHome:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HFLogForCategory(0xCuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Fetching default media service for home %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v6 = (void *)MEMORY[0x263F58190];
  uint64_t v11 = MEMORY[0x263EF8330];
  objc_copyWeak(&v13, (id *)buf);
  id v7 = v4;
  id v12 = v7;
  id v8 = objc_msgSend(MEMORY[0x263F581B8], "globalAsyncScheduler", v11, 3221225472, __58__HFMediaServiceManager__fetchDefaultMediaServiceForHome___block_invoke, &unk_264092510);
  id v9 = [v6 futureWithBlock:&v11 scheduler:v8];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

  return v9;
}

void __58__HFMediaServiceManager__fetchDefaultMediaServiceForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [getMediaServiceConfigurationClass() sharedInstance];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__HFMediaServiceManager__fetchDefaultMediaServiceForHome___block_invoke_2;
  v8[3] = &unk_26409C680;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v7 = v3;
  id v9 = v7;
  id v10 = *(id *)(a1 + 32);
  [v5 getDefaultMediaService:v6 completion:v8];

  objc_destroyWeak(&v11);
}

void __58__HFMediaServiceManager__fetchDefaultMediaServiceForHome___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v8 = HFLogForCategory(0xCuLL);
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch default media service with error %@", (uint8_t *)&v15, 0xCu);
    }

    [a1[4] finishWithError:v6];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Successfully fetched default media service %@", (uint8_t *)&v15, 0xCu);
    }

    id v10 = [WeakRetained homeIdentifierToDefaultServiceMapping];
    id v11 = [a1[5] uniqueIdentifier];
    id v12 = [v11 UUIDString];
    objc_msgSend(v10, "na_safeSetObject:forKey:", v5, v12);

    id v13 = a1[4];
    id v14 = [WeakRetained _defaultMediaServiceForHome:a1[5]];
    [v13 finishWithResult:v14];
  }
}

- (id)_defaultMediaServiceForHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMediaServiceManager *)self homeIdentifierToDefaultServiceMapping];
  id v6 = [v4 uniqueIdentifier];

  id v7 = [v6 UUIDString];
  id v8 = [v5 objectForKey:v7];

  return v8;
}

- (BOOL)_isReadRequestInFlightForHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMediaServiceManager *)self homeIdentifierToReadRequestInFlightMapping];
  id v6 = [v4 uniqueIdentifier];

  id v7 = [v6 UUIDString];
  id v8 = objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v7, &__block_literal_global_231);
  char v9 = [v8 BOOLValue];

  return v9;
}

uint64_t __55__HFMediaServiceManager__isReadRequestInFlightForHome___block_invoke()
{
  return MEMORY[0x263EFFA80];
}

- (BOOL)isRefreshNeededForHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMediaServiceManager *)self homeIdentifierToRefreshNeededMapping];
  id v6 = [v4 uniqueIdentifier];

  id v7 = [v6 UUIDString];
  id v8 = objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v7, &__block_literal_global_27_16);
  char v9 = [v8 BOOLValue];

  return v9;
}

uint64_t __48__HFMediaServiceManager_isRefreshNeededForHome___block_invoke()
{
  return MEMORY[0x263EFFA80];
}

- (void)_dispatchMessageToObserversWithBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(HFMediaServiceManager *)self observers];
  id v6 = [v5 allObjects];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    id v10 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __62__HFMediaServiceManager__dispatchMessageToObserversWithBlock___block_invoke;
        v14[3] = &unk_26408DF88;
        id v13 = v4;
        void v14[4] = v12;
        id v15 = v13;
        dispatch_async(v10, v14);

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

uint64_t __62__HFMediaServiceManager__dispatchMessageToObserversWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setHomeIdentifierToMediaServicesMapping:(id)a3
{
}

- (NSMutableDictionary)homeIdentifierToDefaultServiceMapping
{
  return self->_homeIdentifierToDefaultServiceMapping;
}

- (void)setHomeIdentifierToDefaultServiceMapping:(id)a3
{
}

- (NSMutableDictionary)homeIdentifierToReadRequestInFlightMapping
{
  return self->_homeIdentifierToReadRequestInFlightMapping;
}

- (void)setHomeIdentifierToReadRequestInFlightMapping:(id)a3
{
}

- (NSMutableDictionary)homeIdentifierToRefreshNeededMapping
{
  return self->_homeIdentifierToRefreshNeededMapping;
}

- (void)setHomeIdentifierToRefreshNeededMapping:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_homeIdentifierToRefreshNeededMapping, 0);
  objc_storeStrong((id *)&self->_homeIdentifierToReadRequestInFlightMapping, 0);
  objc_storeStrong((id *)&self->_homeIdentifierToDefaultServiceMapping, 0);
  objc_storeStrong((id *)&self->_homeIdentifierToMediaServicesMapping, 0);
}

@end