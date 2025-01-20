@interface IDSServerBagInProcessContentProvider
- (BOOL)isLoading;
- (BOOL)isServerAvailable;
- (IDSServerBagCacheLoader)cacheLoader;
- (IDSServerBagConfig)config;
- (IDSServerBagInProcessContentProvider)initWithConfig:(id)a3 queue:(id)a4;
- (IDSServerBagInProcessContentProvider)initWithConfig:(id)a3 queue:(id)a4 validator:(id)a5 networkLoader:(id)a6 cacheLoader:(id)a7;
- (IDSServerBagNetworkLoader)networkLoader;
- (IDSServerBagRawContents)loadedRawContents;
- (IDSServerBagValidator)validator;
- (NSMutableDictionary)overrideValues;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)clearOverrideValues;
- (id)contentsUpdatedBlock;
- (id)currentLoadedContentsWithError:(id *)a3;
- (id)loadOverrideValuesIfPresent;
- (id)updateContentsIfPossibleShouldForce:(BOOL)a3;
- (id)writeOverrideValues:(id)a3;
- (os_unfair_lock_s)lock;
- (void)setCacheLoader:(id)a3;
- (void)setConfig:(id)a3;
- (void)setContentsUpdatedBlock:(id)a3;
- (void)setLoadedRawContents:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setNetworkLoader:(id)a3;
- (void)setOverrideValues:(id)a3;
- (void)setQueue:(id)a3;
- (void)setValidator:(id)a3;
@end

@implementation IDSServerBagInProcessContentProvider

- (IDSServerBagInProcessContentProvider)initWithConfig:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = sub_19DAFDCEC;
  v33 = &unk_1E5975248;
  id v8 = v7;
  id v34 = v8;
  id v9 = v6;
  id v35 = v9;
  v10 = _Block_copy(&v30);
  v11 = [IDSServerBagNetworkLoader alloc];
  v14 = objc_msgSend_initWithConfig_queue_connectionMonitorBlock_URLSessionCreationBlock_(v11, v12, (uint64_t)v9, v13, v8, &unk_1EEFCD718, v10, v30, v31, v32, v33);
  v15 = [IDSServerBagValidator alloc];
  v18 = objc_msgSend_initWithConfig_(v15, v16, (uint64_t)v9, v17);
  v22 = objc_msgSend_defaultsDomain(v9, v19, v20, v21);

  if (v22)
  {
    v25 = [IDSServerBagCacheLoader alloc];
    v22 = objc_msgSend_initWithConfig_queue_(v25, v26, (uint64_t)v9, v27, v8);
  }
  v28 = (IDSServerBagInProcessContentProvider *)objc_msgSend_initWithConfig_queue_validator_networkLoader_cacheLoader_(self, v23, (uint64_t)v9, v24, v8, v18, v14, v22);

  return v28;
}

- (IDSServerBagInProcessContentProvider)initWithConfig:(id)a3 queue:(id)a4 validator:(id)a5 networkLoader:(id)a6 cacheLoader:(id)a7
{
  id v24 = a3;
  double v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)IDSServerBagInProcessContentProvider;
  double v17 = [(IDSServerBagInProcessContentProvider *)&v30 init];
  v18 = v17;
  if (v17)
  {
    v17->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v17->_config, a3);
    objc_storeStrong((id *)&v18->_queue, a4);
    objc_storeStrong((id *)&v18->_validator, a5);
    objc_storeStrong((id *)&v18->_networkLoader, a6);
    objc_storeStrong((id *)&v18->_cacheLoader, a7);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v18);
    cacheLoader = v18->_cacheLoader;
    if (cacheLoader)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = sub_19DAFDDC8;
      v27[3] = &unk_1E5975290;
      objc_copyWeak(&v28, &location);
      objc_msgSend_setCacheDidReloadBlock_(cacheLoader, v20, (uint64_t)v27, v21, v24);
      objc_destroyWeak(&v28);
    }
    dispatch_time_t v22 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19DAFE0EC;
    block[3] = &unk_1E59752B8;
    objc_copyWeak(&v26, &location);
    dispatch_after(v22, v13, block);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v18;
}

- (void)setContentsUpdatedBlock:(id)a3
{
}

- (id)loadOverrideValuesIfPresent
{
  return (id)objc_msgSend_loadOverrideValuesIfPresent(self->_cacheLoader, a2, v2, v3);
}

- (id)currentLoadedContentsWithError:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  cacheLoader = self->_cacheLoader;
  if (!cacheLoader)
  {
    v19 = 0;
    goto LABEL_18;
  }
  id v42 = 0;
  id v6 = objc_msgSend_loadFromCacheWithError_(cacheLoader, a2, (uint64_t)&v42, v3);
  id v7 = v42;
  v11 = v7;
  if (v6) {
    BOOL v12 = v7 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    validator = self->_validator;
    id v41 = 0;
    v19 = objc_msgSend_trustedContentsFromRawContents_shouldReport_withError_(validator, v8, (uint64_t)v6, v10, 0, &v41);
    double v21 = v41;
    if (v19) {
      BOOL v25 = v21 == 0;
    }
    else {
      BOOL v25 = 0;
    }
    if (v25)
    {
      os_unfair_lock_lock(&self->_lock);
      objc_storeStrong((id *)&self->_loadedRawContents, v6);
      os_unfair_lock_unlock(&self->_lock);
      v36 = objc_msgSend_config(self, v33, v34, v35);
      double v17 = objc_msgSend_logCategory(v36, v37, v38, v39);

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        uint64_t v44 = v40;
        __int16 v45 = 2048;
        v46 = self;
        __int16 v47 = 2112;
        v48 = v19;
        _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "<%@:%p> cache loaded {loadedContents: %@}", buf, 0x20u);
      }
      goto LABEL_17;
    }
    double v17 = v21;
    id v26 = objc_msgSend_config(self, v22, v23, v24);
    objc_super v30 = objc_msgSend_logCategory(v26, v27, v28, v29);

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      uint64_t v44 = v31;
      __int16 v45 = 2048;
      v46 = self;
      __int16 v47 = 2112;
      v48 = v17;
      _os_log_impl(&dword_19D9BE000, v30, OS_LOG_TYPE_DEFAULT, "<%@:%p> cache not validated {cacheValidationError: %@}", buf, 0x20u);
    }
  }
  else
  {
    double v13 = objc_msgSend_config(self, v8, v9, v10);
    double v17 = objc_msgSend_logCategory(v13, v14, v15, v16);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      uint64_t v44 = v18;
      __int16 v45 = 2048;
      v46 = self;
      __int16 v47 = 2112;
      v48 = v11;
      _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "<%@:%p> cache not found {cacheLoadError: %@}", buf, 0x20u);
    }
  }
  v19 = 0;
LABEL_17:

LABEL_18:
  return v19;
}

- (IDSServerBagConfig)config
{
  return self->_config;
}

- (BOOL)isServerAvailable
{
  return objc_msgSend_isServerAvailable(self->_networkLoader, a2, v2, v3);
}

- (BOOL)isLoading
{
  return objc_msgSend_isLoading(self->_networkLoader, a2, v2, v3);
}

- (id)updateContentsIfPossibleShouldForce:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = objc_msgSend_loadDate(self->_loadedRawContents, v6, v7, v8);
  objc_msgSend_timeIntervalSinceNow(v9, v10, v11, v12);
  if (v15 >= 0.0) {
    double v16 = v15;
  }
  else {
    double v16 = -v15;
  }
  objc_msgSend_timeToLive(self->_loadedRawContents, v13, v14, v15);
  double v18 = v17;
  os_unfair_lock_unlock(p_lock);
  int v22 = v16 >= v18 || v3;
  uint64_t v23 = objc_msgSend_networkLoader(self, v19, v20, v21);
  int isLoading = objc_msgSend_isLoading(v23, v24, v25, v26);

  uint64_t v31 = objc_msgSend_config(self, v28, v29, v30);
  double v35 = objc_msgSend_logCategory(v31, v32, v33, v34);

  if (v22 == 1 && isLoading == 0)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = objc_opt_class();
      uint64_t v40 = @"NO";
      *(_DWORD *)buf = 138413570;
      uint64_t v45 = v39;
      __int16 v46 = 2048;
      if (v3) {
        uint64_t v40 = @"YES";
      }
      __int16 v47 = self;
      __int16 v48 = 2112;
      uint64_t v49 = v9;
      __int16 v50 = 2048;
      double v51 = v16;
      __int16 v52 = 2048;
      double v53 = v18;
      __int16 v54 = 2112;
      v55 = v40;
      _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, "<%@:%p> Ready to start loading bag {lastLoad: %@, timeSinceLoad: %f, timeToLive: %f, force: %@}", buf, 0x3Eu);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19DAFE3DC;
    block[3] = &unk_1E5973BA8;
    void block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v37 = objc_opt_class();
      uint64_t v38 = @"NO";
      *(_DWORD *)buf = 138413570;
      uint64_t v45 = v37;
      __int16 v46 = 2048;
      if (v3) {
        uint64_t v38 = @"YES";
      }
      __int16 v47 = self;
      __int16 v48 = 2112;
      uint64_t v49 = v9;
      __int16 v50 = 2048;
      double v51 = v16;
      __int16 v52 = 2048;
      double v53 = v18;
      __int16 v54 = 2112;
      v55 = v38;
      _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_INFO, "<%@:%p> Should not start loading bag {lastLoad: %@, timeSinceLoad: %f, timeToLive: %f, force: %@}", buf, 0x3Eu);
    }
  }
  return 0;
}

- (id)writeOverrideValues:(id)a3
{
  return (id)objc_msgSend_writeOverrideValues_(self->_cacheLoader, a2, (uint64_t)a3, v3);
}

- (id)clearOverrideValues
{
  return (id)objc_msgSend_clearOverrideValues(self->_cacheLoader, a2, v2, v3);
}

- (NSString)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v5, @"<%@:%p; networkLoader: %@; cacheLoader: %@; validator: %@>",
                       *(double *)&self->_networkLoader,
                       v4,
                       self,
                       self->_networkLoader,
                       self->_cacheLoader,
                       self->_validator);
}

- (id)contentsUpdatedBlock
{
  return self->_contentsUpdatedBlock;
}

- (IDSServerBagRawContents)loadedRawContents
{
  return self->_loadedRawContents;
}

- (void)setLoadedRawContents:(id)a3
{
}

- (NSMutableDictionary)overrideValues
{
  return self->_overrideValues;
}

- (void)setOverrideValues:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void)setConfig:(id)a3
{
}

- (IDSServerBagNetworkLoader)networkLoader
{
  return self->_networkLoader;
}

- (void)setNetworkLoader:(id)a3
{
}

- (IDSServerBagCacheLoader)cacheLoader
{
  return self->_cacheLoader;
}

- (void)setCacheLoader:(id)a3
{
}

- (IDSServerBagValidator)validator
{
  return self->_validator;
}

- (void)setValidator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_cacheLoader, 0);
  objc_storeStrong((id *)&self->_networkLoader, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_overrideValues, 0);
  objc_storeStrong((id *)&self->_loadedRawContents, 0);
  objc_storeStrong(&self->_contentsUpdatedBlock, 0);
}

@end