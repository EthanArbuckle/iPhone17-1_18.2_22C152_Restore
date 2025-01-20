@interface CPLEngineScopedTask
- (BOOL)checkScopeIsValidInTransaction:(id)a3;
- (BOOL)isScopeValidInTransaction:(id)a3;
- (CPLEngineScope)scope;
- (CPLEngineScopedTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7;
- (CPLEngineStore)store;
- (NSData)transportScope;
- (NSString)clientCacheIdentifier;
- (id)scopesForTask;
@end

@implementation CPLEngineScopedTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_transportScope, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_clientCacheIdentifier, 0);
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (NSData)transportScope
{
  return self->_transportScope;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (NSString)clientCacheIdentifier
{
  return self->_clientCacheIdentifier;
}

- (id)scopesForTask
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(CPLEngineScopedTask *)self scope];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 error];

  if (v5)
  {
LABEL_15:
    BOOL v11 = 0;
    goto LABEL_16;
  }
  v6 = [(CPLEngineSyncTask *)self session];
  int v7 = [v6 shouldDefer];

  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      v8 = __CPLTaskOSLogDomain_14840();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 138412290;
        *(void *)&v15[4] = objc_opt_class();
        id v9 = *(id *)&v15[4];
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Session for %@ has been deferred", v15, 0xCu);
      }
    }
    v10 = +[CPLErrors sessionHasBeenDeferredError];
    [v4 setError:v10];

    goto LABEL_15;
  }
  if (![(CPLEngineScopedTask *)self isScopeValidInTransaction:v4])
  {
    if (!_CPLSilentLogging)
    {
      v12 = __CPLTaskOSLogDomain_14840();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [(CPLEngineScopedTask *)self scope];
        *(_DWORD *)v15 = 138412290;
        *(void *)&v15[4] = v13;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "%@ is not valid anymore - stopping here", v15, 0xCu);
      }
    }
    [(CPLEngineSyncTask *)self cancel];
    goto LABEL_15;
  }
  BOOL v11 = 1;
LABEL_16:

  return v11;
}

- (BOOL)isScopeValidInTransaction:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = self->_clientCacheIdentifier;
  v5 = [(CPLEngineStore *)self->_store clientCacheIdentifier];
  unint64_t v6 = (unint64_t)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {

    if (!(v4 | v6))
    {
LABEL_12:
      v12 = [(CPLEngineStore *)self->_store scopes];
      v8 = [v12 validLocalScopeIndexes];

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v13 = [(CPLEngineScopedTask *)self scopesForTask];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v39 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v30;
LABEL_14:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(CPLEngineScope **)(*((void *)&v29 + 1) + 8 * v17);
          if (([v8 containsIndex:[(CPLEngineScope *)v18 localIndex]] & 1) == 0) {
            break;
          }
          if (v15 == ++v17)
          {
            uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v39 count:16];
            if (v15) {
              goto LABEL_14;
            }
            goto LABEL_20;
          }
        }
        if (v18 == self->_scope)
        {
          if (!_CPLSilentLogging)
          {
            v19 = __CPLTaskOSLogDomain_14840();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              scope = self->_scope;
              v27 = (CPLEngineScope *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              id v34 = scope;
              __int16 v35 = 2112;
              v36 = v27;
              v22 = v27;
              v23 = "Scope %@ is invalid, stopping %@ now";
              v24 = v19;
              uint32_t v25 = 22;
              goto LABEL_28;
            }
LABEL_29:
          }
        }
        else if (!_CPLSilentLogging)
        {
          v19 = __CPLTaskOSLogDomain_14840();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = self->_scope;
            v21 = objc_opt_class();
            *(_DWORD *)buf = 138412802;
            id v34 = v18;
            __int16 v35 = 2112;
            v36 = v20;
            __int16 v37 = 2112;
            v38 = v21;
            v22 = v21;
            v23 = "Scope %@ (associated with %@) is invalid, stopping %@ now";
            v24 = v19;
            uint32_t v25 = 32;
LABEL_28:
            _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);

            goto LABEL_29;
          }
          goto LABEL_29;
        }
        BOOL v10 = 0;
        goto LABEL_31;
      }
LABEL_20:
      BOOL v10 = 1;
LABEL_31:

      goto LABEL_32;
    }
  }
  else
  {
    char v11 = [(id)v4 isEqual:v5];

    if (v11) {
      goto LABEL_12;
    }
  }
  if (_CPLSilentLogging) {
    return 0;
  }
  v8 = __CPLTaskOSLogDomain_14840();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = (id)objc_opt_class();
    id v9 = v34;
    _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Client cache has been reset. Stopping %@ for now", buf, 0xCu);
  }
  BOOL v10 = 0;
LABEL_32:

  return v10;
}

- (CPLEngineScopedTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CPLEngineScopedTask;
  uint64_t v16 = [(CPLEngineSyncTask *)&v23 initWithEngineLibrary:v12 session:a4];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_scope, a6);
    objc_storeStrong((id *)&v17->_transportScope, a7);
    uint64_t v18 = [v12 store];
    store = v17->_store;
    v17->_store = (CPLEngineStore *)v18;

    uint64_t v20 = [v13 copy];
    clientCacheIdentifier = v17->_clientCacheIdentifier;
    v17->_clientCacheIdentifier = (NSString *)v20;
  }
  return v17;
}

@end