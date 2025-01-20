@interface SGKeyValueCacheManager
- (SGKeyValueCacheManager)init;
- (SGKeyValueCacheManager)initWithBasePath:(id)a3;
- (id)cacheOfType:(unint64_t)a3;
- (id)initInMemory;
- (void)deleteValueByRecordId:(id)a3;
- (void)deleteValueByRecordIdSet:(id)a3;
- (void)replaceCacheOfType:(unint64_t)a3 block:(id)a4;
@end

@implementation SGKeyValueCacheManager

- (id)cacheOfType:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3 >= 2)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SGKeyValueCacheManager.m", 56, @"Invalid parameter not satisfying: %@", @"cacheType < SGKeyValueCacheTypeCount" object file lineNumber description];
  }
  pthread_mutex_lock(&self->_lock);
  v5 = [(NSMutableArray *)self->_cacheFiles objectAtIndexedSubscript:a3];
  v6 = [MEMORY[0x1E4F1CA98] null];

  if (v5 == v6)
  {
    v8 = (void *)MEMORY[0x1CB79B230]();
    basePath = self->_basePath;
    v10 = (void *)MEMORY[0x1E4F5DA40];
    if (basePath)
    {
      v11 = @"email-to-name.kvcache";
      if (!a3) {
        v11 = @"phone-to-name.kvcache";
      }
      v12 = v11;
      uint64_t v13 = [(NSString *)basePath stringByAppendingPathComponent:v12];
      v7 = [v10 keyValueCacheForPath:v13];

      v5 = (void *)v13;
    }
    else
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F5DA40]) initInMemory];
    }

    if (v7)
    {
      [(NSMutableArray *)self->_cacheFiles setObject:v7 atIndexedSubscript:a3];
    }
    else
    {
      v14 = sgLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v16 = @"email-to-name.kvcache";
        if (!a3) {
          v16 = @"phone-to-name.kvcache";
        }
        v17 = v16;
        v18 = self->_basePath;
        *(_DWORD *)buf = 138412546;
        v22 = v17;
        __int16 v23 = 2112;
        v24 = v18;
        _os_log_fault_impl(&dword_1CA650000, v14, OS_LOG_TYPE_FAULT, "Error opening file %@ at base path: %@", buf, 0x16u);
      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        abort();
      }
    }
  }
  else
  {
    v7 = v5;
  }
  pthread_mutex_unlock(&self->_lock);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheFiles, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
}

- (void)deleteValueByRecordId:(id)a3
{
  id v8 = a3;
  v4 = (void *)MEMORY[0x1CB79B230]();
  v5 = [(SGKeyValueCacheManager *)self cacheOfType:0];
  [v5 deleteValueByRecordId:v8];

  v6 = (void *)MEMORY[0x1CB79B230]();
  v7 = [(SGKeyValueCacheManager *)self cacheOfType:1];
  [v7 deleteValueByRecordId:v8];
}

- (void)deleteValueByRecordIdSet:(id)a3
{
  id v8 = a3;
  v4 = (void *)MEMORY[0x1CB79B230]();
  v5 = [(SGKeyValueCacheManager *)self cacheOfType:0];
  [v5 deleteValueByRecordIdSet:v8];

  v6 = (void *)MEMORY[0x1CB79B230]();
  v7 = [(SGKeyValueCacheManager *)self cacheOfType:1];
  [v7 deleteValueByRecordIdSet:v8];
}

- (void)replaceCacheOfType:(unint64_t)a3 block:(id)a4
{
  v10 = (unsigned int (**)(id, void *))a4;
  if (a3 >= 2)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SGKeyValueCacheManager.m", 78, @"Invalid parameter not satisfying: %@", @"cacheType < SGKeyValueCacheTypeCount" object file lineNumber description];
  }
  v7 = [(SGKeyValueCacheManager *)self cacheOfType:a3];
  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F5DA40]) initTemporaryForOverwritingCache:v7];
    if (v8 && v10[2](v10, v8)) {
      [v8 commitTemporaryFile];
    }
  }
}

- (id)initInMemory
{
  return [(SGKeyValueCacheManager *)self initWithBasePath:0];
}

- (SGKeyValueCacheManager)init
{
  v3 = +[SGPaths suggestionsDirectory];
  v4 = [(SGKeyValueCacheManager *)self initWithBasePath:v3];

  return v4;
}

- (SGKeyValueCacheManager)initWithBasePath:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGKeyValueCacheManager;
  v6 = [(SGKeyValueCacheManager *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_basePath, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    cacheFiles = v7->_cacheFiles;
    v7->_cacheFiles = (NSMutableArray *)v8;

    v10 = v7->_cacheFiles;
    v11 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableArray *)v10 addObject:v11];

    v12 = v7->_cacheFiles;
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableArray *)v12 addObject:v13];

    pthread_mutex_init(&v7->_lock, 0);
  }

  return v7;
}

@end