@interface CPLConfiguration
- (BOOL)allowsLocalConflictResolution;
- (BOOL)allowsLocalConflictResolutionWhenOverQuota;
- (BOOL)isComputeStateTaskUploadEnabled;
- (CPLConfiguration)initWithClientLibraryBaseURL:(id)a3;
- (CPLConfiguration)initWithClientLibraryBaseURL:(id)a3 configurationURL:(id)a4 minUpdateInterval:(double)a5 updateIntervalKey:(id)a6;
- (CPLConfiguration)initWithClientLibraryBaseURL:(id)a3 minUpdateInterval:(double)a4 updateIntervalKey:(id)a5;
- (CPLConfigurationDictionary)configurationDictionary;
- (NSDate)lastUpdateDate;
- (NSString)updateIntervalKey;
- (NSURL)clientLibraryBaseURL;
- (NSURL)configurationURL;
- (double)minUpdateInterval;
- (id)configurationDictionaryUniquifier;
- (id)valueForKey:(id)a3;
- (int64_t)maximumComputeStatesToUploadPerBatch;
- (void)_load;
- (void)_save;
- (void)_updateConfigurationDictionary:(id)a3;
- (void)check;
- (void)configurationFetcher:(id)a3 didUpdateConfigurationDictionary:(id)a4 configurationHasChanged:(BOOL)a5;
- (void)disableConfigurationFetching;
- (void)invalidate;
- (void)refetchFromDisk;
- (void)setAllowsLocalConflictResolutionWhenOverQuota:(BOOL)a3;
- (void)setConfigurationDictionaryUniquifier:(id)a3;
- (void)setIsComputeStateTaskUploadEnabled:(BOOL)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)updateConfigurationDictionary:(id)a3;
@end

@implementation CPLConfiguration

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configurationDictionaryUniquifier, 0);
  objc_storeStrong((id *)&self->_updateIntervalKey, 0);
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_configurationFetcher, 0);
  objc_storeStrong((id *)&self->_configurationFileURL, 0);
  objc_storeStrong((id *)&self->_configurationDictionary, 0);
}

- (void)setConfigurationDictionaryUniquifier:(id)a3
{
}

- (id)configurationDictionaryUniquifier
{
  return self->_configurationDictionaryUniquifier;
}

- (NSString)updateIntervalKey
{
  return self->_updateIntervalKey;
}

- (double)minUpdateInterval
{
  return self->_minUpdateInterval;
}

- (NSURL)configurationURL
{
  return self->_configurationURL;
}

- (NSDate)lastUpdateDate
{
  v2 = [(CPLConfiguration *)self configurationDictionary];
  v3 = [v2 lastUpdateDate];

  return (NSDate *)v3;
}

- (void)invalidate
{
  lock = self->_lock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CPLConfiguration_invalidate__block_invoke;
  block[3] = &unk_1E60A5DD8;
  block[4] = self;
  dispatch_sync(lock, block);
}

void __30__CPLConfiguration_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __36__CPLConfiguration_setValue_forKey___block_invoke;
  v14[3] = &unk_1E60A6660;
  v14[4] = self;
  id v15 = v7;
  id v16 = v6;
  v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_9470;
  block[3] = &unk_1E60A6978;
  id v18 = v9;
  v10 = lock;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __36__CPLConfiguration_setValue_forKey___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _load];
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 8) copyConfigurationDictionaryWithUpdatedKey:*(void *)(a1 + 40) value:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _updateConfigurationDictionary:v2];
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  dispatch_block_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__9387;
  id v16 = __Block_byref_object_dispose__9388;
  id v17 = 0;
  lock = self->_lock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__CPLConfiguration_valueForKey___block_invoke;
  block[3] = &unk_1E60AA830;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(lock, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __32__CPLConfiguration_valueForKey___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _load];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)refetchFromDisk
{
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__CPLConfiguration_refetchFromDisk__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_9470;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = lock;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __35__CPLConfiguration_refetchFromDisk__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void)updateConfigurationDictionary:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CPLConfiguration_updateConfigurationDictionary___block_invoke;
  v7[3] = &unk_1E60A6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, v7);
}

uint64_t __50__CPLConfiguration_updateConfigurationDictionary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateConfigurationDictionary:*(void *)(a1 + 40)];
}

- (CPLConfigurationDictionary)configurationDictionary
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9387;
  id v10 = __Block_byref_object_dispose__9388;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__CPLConfiguration_configurationDictionary__block_invoke;
  v5[3] = &unk_1E60AA7E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CPLConfigurationDictionary *)v3;
}

void __43__CPLConfiguration_configurationDictionary__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _load];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (void)_updateConfigurationDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  dispatch_block_t v5 = [(CPLConfigurationDictionary *)self->_configurationDictionary lastUpdateDate];
  configurationDictionaryUniquifier = (void (**)(id, id))self->_configurationDictionaryUniquifier;
  if (configurationDictionaryUniquifier)
  {
    configurationDictionaryUniquifier[2](configurationDictionaryUniquifier, v4);
    id v7 = (CPLConfigurationDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = (CPLConfigurationDictionary *)v4;
  }
  configurationDictionary = self->_configurationDictionary;
  self->_configurationDictionary = v7;

  if (!_CPLSilentLogging)
  {
    v9 = __CPLConfigurationOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = self->_configurationDictionary;
      id v11 = [(NSURL *)self->_configurationFileURL path];
      if (v5)
      {
        uint64_t v12 = +[CPLDateFormatter stringFromDateAgo:v5 now:0];
      }
      else
      {
        uint64_t v12 = @"never";
      }
      int v13 = 134218498;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v11;
      __int16 v17 = 2114;
      id v18 = v12;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Updated configuration %p at %@. Last update was %{public}@", (uint8_t *)&v13, 0x20u);
      if (v5) {
    }
      }
  }
  [(CPLConfiguration *)self _save];
}

- (void)_load
{
  uint64_t v3 = (uint64_t)self;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (!*(void *)(v3 + 8))
  {
    id v4 = [CPLConfigurationDictionary alloc];
    uint64_t v5 = *(void *)(v3 + 16);
    uint64_t v6 = *(void *)(v3 + 72);
    double v7 = *(double *)(v3 + 64);
    id v33 = 0;
    uint64_t v8 = [(CPLConfigurationDictionary *)v4 initWithContentsOfURL:v5 refreshIntervalKey:v6 minRefreshInterval:&v33 error:v7];
    id v9 = v33;
    id v10 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = v8;

    if (*(void *)(v3 + 8))
    {
      uint64_t v11 = *(void *)(v3 + 80);
      if (v11)
      {
        uint64_t v12 = (*(void (**)(void))(v11 + 16))();
        int v13 = *(void **)(v3 + 8);
        *(void *)(v3 + 8) = v12;

        if (!*(void *)(v3 + 8))
        {
          if (!_CPLSilentLogging)
          {
            v30 = __CPLGenericOSLogDomain();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B4CAC000, v30, OS_LOG_TYPE_ERROR, "Uniquifying configuration dictionary returned a nil value", buf, 2u);
            }
          }
          v31 = [MEMORY[0x1E4F28B00] currentHandler];
          v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLConfiguration.m"];
          [v31 handleFailureInMethod:a2 object:v3 file:v32 lineNumber:209 description:@"Uniquifying configuration dictionary returned a nil value"];

          abort();
        }
      }
      if (_CPLSilentLogging) {
        goto LABEL_24;
      }
      uint64_t v14 = __CPLConfigurationOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = *(void **)(v3 + 8);
        id v16 = [*(id *)(v3 + 16) path];
        __int16 v17 = [*(id *)(v3 + 8) lastUpdateDate];
        if (v17)
        {
          uint64_t v3 = [*(id *)(v3 + 8) lastUpdateDate];
          id v18 = +[CPLDateFormatter stringFromDateAgo:v3 now:0];
        }
        else
        {
          id v18 = @"never";
        }
        *(_DWORD *)buf = 134218498;
        v35 = v15;
        __int16 v36 = 2112;
        id v37 = v16;
        __int16 v38 = 2114;
        v39 = v18;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Loaded configuration %p at %@. Last update was %{public}@", buf, 0x20u);
        if (v17)
        {
        }
      }
LABEL_23:

LABEL_24:
      return;
    }
    uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v20 = [v19 cplIsFileDoesNotExistError:v9];

    if (v20)
    {
      if (!_CPLSilentLogging)
      {
        v21 = __CPLConfigurationOSLogDomain();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = [*(id *)(v3 + 16) path];
          *(_DWORD *)buf = 138412290;
          v35 = v22;
          v23 = "Configuration does not exist at %@ - will use built-in one";
          v24 = v21;
          os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
          uint32_t v26 = 12;
LABEL_16:
          _os_log_impl(&dword_1B4CAC000, v24, v25, v23, buf, v26);

          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else if (!_CPLSilentLogging)
    {
      v21 = __CPLConfigurationOSLogDomain();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = [*(id *)(v3 + 16) path];
        *(_DWORD *)buf = 138412546;
        v35 = v22;
        __int16 v36 = 2112;
        id v37 = v9;
        v23 = "Failed to load saved configuration at %@ - will use built-in one: %@";
        v24 = v21;
        os_log_type_t v25 = OS_LOG_TYPE_ERROR;
        uint32_t v26 = 22;
        goto LABEL_16;
      }
LABEL_17:
    }
    v27 = [CPLConfigurationDictionary alloc];
    uint64_t v14 = [*(id *)(v3 + 56) lastPathComponent];
    uint64_t v28 = [(CPLConfigurationDictionary *)v27 initWithConfigurationName:v14 refreshIntervalKey:*(void *)(v3 + 72) minRefreshInterval:*(double *)(v3 + 64)];
    v29 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = v28;

    goto LABEL_23;
  }
}

- (void)_save
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  uint64_t v3 = [(CPLConfigurationDictionary *)self->_configurationDictionary lastUpdateDate];

  if (v3)
  {
    configurationDictionary = self->_configurationDictionary;
    configurationFileURL = self->_configurationFileURL;
    id v15 = 0;
    BOOL v6 = [(CPLConfigurationDictionary *)configurationDictionary writeToURL:configurationFileURL error:&v15];
    double v7 = v15;
    if (v6)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v8 = __CPLConfigurationOSLogDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [(NSURL *)self->_configurationFileURL path];
          *(_DWORD *)buf = 138412290;
          __int16 v17 = v9;
          id v10 = "Wrote configuration to %@";
          uint64_t v11 = v8;
          os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
          uint32_t v13 = 12;
LABEL_12:
          _os_log_impl(&dword_1B4CAC000, v11, v12, v10, buf, v13);

          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else if (!_CPLSilentLogging)
    {
      uint64_t v8 = __CPLConfigurationOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = [(NSURL *)self->_configurationFileURL path];
        *(_DWORD *)buf = 138412546;
        __int16 v17 = v9;
        __int16 v18 = 2112;
        uint64_t v19 = v7;
        id v10 = "Failed to write configuration to %@: %@";
        uint64_t v11 = v8;
        os_log_type_t v12 = OS_LOG_TYPE_ERROR;
        uint32_t v13 = 22;
        goto LABEL_12;
      }
LABEL_13:
    }
  }
  else
  {
    if (_CPLSilentLogging) {
      return;
    }
    double v7 = __CPLConfigurationOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(NSURL *)self->_configurationFileURL path];
      *(_DWORD *)buf = 138412290;
      __int16 v17 = v14;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Not saving built-in configuration to %@", buf, 0xCu);
    }
  }
}

- (void)configurationFetcher:(id)a3 didUpdateConfigurationDictionary:(id)a4 configurationHasChanged:(BOOL)a5
{
  id v11 = a4;
  lock = self->_lock;
  uint64_t v8 = (CPLConfigurationFetcher *)a3;
  dispatch_assert_queue_V2(lock);
  configurationFetcher = self->_configurationFetcher;

  if (configurationFetcher == v8)
  {
    [(CPLConfiguration *)self _updateConfigurationDictionary:v11];
    id v10 = self->_configurationFetcher;
    self->_configurationFetcher = 0;
  }
}

- (void)check
{
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__CPLConfiguration_check__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  uint64_t v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_9470;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = lock;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __25__CPLConfiguration_check__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 48) && !*(void *)(result + 80))
  {
    [(id)result _load];
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) isStale];
    if (result)
    {
      if (*(void *)(*(void *)(a1 + 32) + 32))
      {
        uint64_t v3 = [[CPLConfigurationFetcher alloc] initWithConfigurationURL:*(void *)(*(void *)(a1 + 32) + 56) delegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 40)];
        uint64_t v4 = *(void *)(a1 + 32);
        dispatch_block_t v5 = *(void **)(v4 + 32);
        *(void *)(v4 + 32) = v3;
      }
      if (!_CPLSilentLogging)
      {
        BOOL v6 = __CPLConfigurationOSLogDomain();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          double v7 = [*(id *)(*(void *)(a1 + 32) + 16) path];
          int v8 = 138412290;
          id v9 = v7;
          _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Configuration at %@ will be fetched now", (uint8_t *)&v8, 0xCu);
        }
      }
      return [*(id *)(*(void *)(a1 + 32) + 32) fetchConfigurationDictionary:*(void *)(*(void *)(a1 + 32) + 8)];
    }
  }
  return result;
}

- (void)disableConfigurationFetching
{
  self->_disableConfigurationFetching = 1;
}

- (NSURL)clientLibraryBaseURL
{
  return [(NSURL *)self->_configurationFileURL URLByDeletingLastPathComponent];
}

- (CPLConfiguration)initWithClientLibraryBaseURL:(id)a3
{
  return [(CPLConfiguration *)self initWithClientLibraryBaseURL:a3 minUpdateInterval:@"refresh.interval.seconds" updateIntervalKey:43200.0];
}

- (CPLConfiguration)initWithClientLibraryBaseURL:(id)a3 minUpdateInterval:(double)a4 updateIntervalKey:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = _CPLConfigurationDefaultURL();
  id v11 = [(CPLConfiguration *)self initWithClientLibraryBaseURL:v9 configurationURL:v10 minUpdateInterval:v8 updateIntervalKey:a4];

  return v11;
}

- (CPLConfiguration)initWithClientLibraryBaseURL:(id)a3 configurationURL:(id)a4 minUpdateInterval:(double)a5 updateIntervalKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CPLConfiguration;
  uint32_t v13 = [(CPLConfiguration *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v11 lastPathComponent];
    uint64_t v15 = [v10 URLByAppendingPathComponent:v14 isDirectory:0];
    configurationFileURL = v13->_configurationFileURL;
    v13->_configurationFileURL = (NSURL *)v15;

    uint64_t v17 = [v11 copy];
    configurationURL = v13->_configurationURL;
    v13->_configurationURL = (NSURL *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.cpl.configuration", 0);
    lock = v13->_lock;
    v13->_lock = (OS_dispatch_queue *)v19;

    v13->_minUpdateInterval = a5;
    objc_storeStrong((id *)&v13->_updateIntervalKey, a6);
  }
  return v13;
}

- (BOOL)allowsLocalConflictResolution
{
  return 0;
}

- (void)setIsComputeStateTaskUploadEnabled:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 3;
  }
  id v5 = [NSNumber numberWithInteger:v4];
  [(CPLConfiguration *)self setValue:v5 forKey:@"compute-state.upload-task"];
}

- (BOOL)isComputeStateTaskUploadEnabled
{
  uint64_t v2 = [(CPLConfiguration *)self valueForKey:@"compute-state.upload-task"];
  BOOL v3 = [v2 integerValue] < 3;

  return v3;
}

- (int64_t)maximumComputeStatesToUploadPerBatch
{
  uint64_t v2 = [(CPLConfiguration *)self valueForKey:@"max.num.computeStatesToUploadPerBatch"];
  BOOL v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 350;
  }

  return v4;
}

- (void)setAllowsLocalConflictResolutionWhenOverQuota:(BOOL)a3
{
  id v4 = [NSNumber numberWithInt:a3];
  [(CPLConfiguration *)self setValue:v4 forKey:@"over-quota.local-conflict-resolution"];
}

- (BOOL)allowsLocalConflictResolutionWhenOverQuota
{
  uint64_t v2 = [(CPLConfiguration *)self valueForKey:@"over-quota.local-conflict-resolution"];
  BOOL v3 = !v2 || (objc_opt_respondsToSelector() & 1) == 0 || [v2 integerValue] == 1;

  return v3;
}

@end