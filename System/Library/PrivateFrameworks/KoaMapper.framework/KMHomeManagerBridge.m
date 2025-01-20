@interface KMHomeManagerBridge
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (HMHomeManager)homeManager;
- (KMHomeManagerBridge)init;
- (KMHomeManagerBridge)initWithHomeManager:(id)a3 setupTimeout:(double)a4;
- (OS_dispatch_semaphore)setupSema;
- (double)setupTimeout;
- (id)originAppId;
- (unsigned)cascadeItemType;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation KMHomeManagerBridge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupSema, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_itemMapper, 0);
}

- (double)setupTimeout
{
  return self->_setupTimeout;
}

- (OS_dispatch_semaphore)setupSema
{
  return self->_setupSema;
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v5 = (uint64_t (**)(id, void))a4;
  p_info = &OBJC_METACLASS___RadioListener.info;
  v7 = (void *)KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
  {
    v8 = NSNumber;
    double setupTimeout = self->_setupTimeout;
    v10 = v7;
    v11 = [v8 numberWithDouble:setupTimeout];
    *(_DWORD *)buf = 136315394;
    v56 = "-[KMHomeManagerBridge enumerateItemsWithError:usingBlock:]";
    __int16 v57 = 2112;
    id v58 = v11;
    _os_log_impl(&dword_22475B000, v10, OS_LOG_TYPE_INFO, "%s Waiting up to %@ seconds for home manager setup", buf, 0x16u);
  }
  setupSema = self->_setupSema;
  dispatch_time_t v13 = dispatch_time(0, (uint64_t)(self->_setupTimeout * 1000000000.0));
  if (dispatch_semaphore_wait(setupSema, v13))
  {
    v14 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v56 = "-[KMHomeManagerBridge enumerateItemsWithError:usingBlock:]";
      _os_log_impl(&dword_22475B000, v14, OS_LOG_TYPE_INFO, "%s Timed out waiting for home manager setup", buf, 0xCu);
    }
    BOOL v15 = 0;
  }
  else
  {
    v16 = [(HMHomeManager *)self->_homeManager homes];
    v17 = (void *)KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_DEBUG))
    {
      v35 = NSNumber;
      v36 = v17;
      v37 = objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
      *(_DWORD *)buf = 136315394;
      v56 = "-[KMHomeManagerBridge enumerateItemsWithError:usingBlock:]";
      __int16 v57 = 2112;
      id v58 = v37;
      _os_log_debug_impl(&dword_22475B000, v36, OS_LOG_TYPE_DEBUG, "%s Home manager is ready. homesCount: %@", buf, 0x16u);
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v19)
    {
      id v20 = 0;
      uint64_t v21 = *(void *)v50;
      v41 = v18;
      uint64_t v39 = *(void *)v50;
      while (2)
      {
        uint64_t v22 = 0;
        v23 = v20;
        uint64_t v40 = v19;
        do
        {
          if (*(void *)v50 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void *)(*((void *)&v49 + 1) + 8 * v22);
          context = (void *)MEMORY[0x22A6168F0]();
          itemMapper = self->_itemMapper;
          id v48 = v23;
          v26 = [(KVItemMapper *)itemMapper mapObject:v24 error:&v48];
          id v20 = v48;

          if (!v26)
          {
            v38 = p_info[76];
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v56 = "-[KMHomeManagerBridge enumerateItemsWithError:usingBlock:]";
              __int16 v57 = 2112;
              id v58 = v20;
              _os_log_error_impl(&dword_22475B000, v38, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
            }

            KVSetError();
            BOOL v15 = 0;
            goto LABEL_28;
          }
          id v42 = v20;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v27 = v26;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v53 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v45;
            while (2)
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v45 != v30) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v32 = *(void *)(*((void *)&v44 + 1) + 8 * i);
                v33 = (void *)MEMORY[0x22A6168F0]();
                LODWORD(v32) = v5[2](v5, v32);
                if (!v32)
                {

                  id v18 = v41;

                  BOOL v15 = 0;
                  id v20 = v42;
                  goto LABEL_28;
                }
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v53 count:16];
              if (v29) {
                continue;
              }
              break;
            }
          }

          ++v22;
          id v18 = v41;
          id v20 = v42;
          v23 = v42;
          uint64_t v21 = v39;
          p_info = (__objc2_class_ro **)(&OBJC_METACLASS___RadioListener + 32);
        }
        while (v22 != v40);
        uint64_t v19 = [v41 countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v19) {
          continue;
        }
        break;
      }

      BOOL v15 = 1;
    }
    else
    {
      BOOL v15 = 1;
      id v20 = v18;
    }
LABEL_28:
  }
  return v15;
}

- (id)originAppId
{
  return (id)*MEMORY[0x263F51078];
}

- (unsigned)cascadeItemType
{
  return 7690;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    v6 = "-[KMHomeManagerBridge homeManagerDidUpdateHomes:]";
    _os_log_impl(&dword_22475B000, v4, OS_LOG_TYPE_INFO, "%s homeManagerDidUpdateHomes being invoked", (uint8_t *)&v5, 0xCu);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_setupSema);
}

- (KMHomeManagerBridge)initWithHomeManager:(id)a3 setupTimeout:(double)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)KMHomeManagerBridge;
  v8 = [(KMHomeManagerBridge *)&v23 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_5;
  }
  p_homeManager = &v8->_homeManager;
  objc_storeStrong((id *)&v8->_homeManager, a3);
  if (!*p_homeManager)
  {
    id v18 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[KMHomeManagerBridge initWithHomeManager:setupTimeout:]";
      _os_log_error_impl(&dword_22475B000, v18, OS_LOG_TYPE_ERROR, "%s Cannot initialize KMHomeManagerBridge with nil homeManager", buf, 0xCu);
    }
    goto LABEL_11;
  }
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  setupSema = v9->_setupSema;
  v9->_setupSema = (OS_dispatch_semaphore *)v11;

  v9->_double setupTimeout = a4;
  id v13 = objc_initWeak(&location, v9);
  [(HMHomeManager *)v9->_homeManager setDelegate:v9];

  id v21 = 0;
  uint64_t v14 = [objc_alloc(MEMORY[0x263F510C8]) initWithObjectClass:objc_opt_class() error:&v21];
  id v15 = v21;
  itemMapper = v9->_itemMapper;
  v9->_itemMapper = (KVItemMapper *)v14;

  if (!v9->_itemMapper)
  {
    uint64_t v19 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[KMHomeManagerBridge initWithHomeManager:setupTimeout:]";
      __int16 v26 = 2112;
      id v27 = v15;
      _os_log_error_impl(&dword_22475B000, v19, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }

    objc_destroyWeak(&location);
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }

  objc_destroyWeak(&location);
LABEL_5:
  v17 = v9;
LABEL_12:

  return v17;
}

- (KMHomeManagerBridge)init
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v3 = (void *)getHMMutableHomeManagerConfigurationClass_softClass;
  uint64_t v21 = getHMMutableHomeManagerConfigurationClass_softClass;
  if (!getHMMutableHomeManagerConfigurationClass_softClass)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __getHMMutableHomeManagerConfigurationClass_block_invoke;
    v16 = &unk_2646DBA68;
    v17 = &v18;
    __getHMMutableHomeManagerConfigurationClass_block_invoke((uint64_t)&v13);
    v3 = (void *)v19[3];
  }
  v4 = v3;
  _Block_object_dispose(&v18, 8);
  int v5 = (void *)[[v4 alloc] initWithOptions:1025 cachePolicy:0];
  [v5 setDiscretionary:0];
  v6 = objc_opt_new();
  [v5 setDelegateQueue:v6];

  id v7 = objc_alloc_init(KM_HMFLocationAuthorization);
  [v5 setLocationAuthorization:v7];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v8 = (void *)getHMHomeManagerClass_softClass;
  uint64_t v21 = getHMHomeManagerClass_softClass;
  if (!getHMHomeManagerClass_softClass)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __getHMHomeManagerClass_block_invoke;
    v16 = &unk_2646DBA68;
    v17 = &v18;
    __getHMHomeManagerClass_block_invoke((uint64_t)&v13);
    v8 = (void *)v19[3];
  }
  v9 = v8;
  _Block_object_dispose(&v18, 8);
  v10 = (void *)[[v9 alloc] initWithHomeMangerConfiguration:v5];
  dispatch_semaphore_t v11 = [[KMHomeManagerBridge alloc] initWithHomeManager:v10 setupTimeout:30.0];

  return v11;
}

@end