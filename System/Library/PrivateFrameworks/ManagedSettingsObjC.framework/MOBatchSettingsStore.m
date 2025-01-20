@interface MOBatchSettingsStore
+ (id)storeWithName:(id)a3 sharedContainer:(id)a4;
- (BOOL)active;
- (BOOL)fullReplacement;
- (BOOL)syncToWatch;
- (MOBatchSettingsStore)initWithName:(id)a3 sharedContainer:(id)a4;
- (NSMutableDictionary)updatedProperties;
- (NSMutableDictionary)updatedSettings;
- (NSMutableSet)removedSettings;
- (NSObject)connectionLock;
- (NSObject)settingsLock;
- (NSString)container;
- (NSString)name;
- (NSUUID)persistenceRecordIdentifier;
- (NSXPCConnection)currentConnection;
- (NSXPCConnection)xpcConnection;
- (id)getCurrentSettings;
- (id)getCurrentStoreProperties;
- (id)valueForSetting:(id)a3 inGroup:(id)a4;
- (void)clearAllSettings;
- (void)clearCurrentConnectionAndInvalidate:(BOOL)a3;
- (void)commitChanges;
- (void)dealloc;
- (void)deleteStore;
- (void)removeValueForSetting:(id)a3 inGroup:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setContainer:(id)a3;
- (void)setCurrentConnection:(id)a3;
- (void)setFullReplacement:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPersistenceRecordIdentifier:(id)a3;
- (void)setRemovedSettings:(id)a3;
- (void)setSyncToWatch:(BOOL)a3;
- (void)setUpdatedProperties:(id)a3;
- (void)setUpdatedSettings:(id)a3;
- (void)setValue:(id)a3 forSetting:(id)a4 inGroup:(id)a5;
@end

@implementation MOBatchSettingsStore

- (MOBatchSettingsStore)initWithName:(id)a3 sharedContainer:(id)a4
{
  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  v26.receiver = self;
  v26.super_class = (Class)MOBatchSettingsStore;
  v8 = [(MOSettingsStore *)&v26 initStore];
  name = v8->_name;
  v8->_name = v6;
  v10 = v6;

  container = v8->_container;
  v8->_container = v7;
  v12 = v7;

  persistenceRecordIdentifier = v8->_persistenceRecordIdentifier;
  v8->_persistenceRecordIdentifier = 0;

  uint64_t v14 = objc_opt_new();
  updatedSettings = v8->_updatedSettings;
  v8->_updatedSettings = (NSMutableDictionary *)v14;

  uint64_t v16 = objc_opt_new();
  removedSettings = v8->_removedSettings;
  v8->_removedSettings = (NSMutableSet *)v16;

  uint64_t v18 = objc_opt_new();
  updatedProperties = v8->_updatedProperties;
  v8->_updatedProperties = (NSMutableDictionary *)v18;

  uint64_t v20 = objc_opt_new();
  settingsLock = v8->_settingsLock;
  v8->_settingsLock = v20;

  v8->_fullReplacement = 0;
  currentConnection = v8->_currentConnection;
  v8->_currentConnection = 0;

  uint64_t v23 = objc_opt_new();
  connectionLock = v8->_connectionLock;
  v8->_connectionLock = v23;

  return v8;
}

+ (id)storeWithName:(id)a3 sharedContainer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v6 sharedContainer:v5];

  return v7;
}

- (void)dealloc
{
  [(MOBatchSettingsStore *)self clearCurrentConnectionAndInvalidate:1];
  v3.receiver = self;
  v3.super_class = (Class)MOBatchSettingsStore;
  [(MOBatchSettingsStore *)&v3 dealloc];
}

- (NSXPCConnection)xpcConnection
{
  objc_super v3 = self->_connectionLock;
  objc_sync_enter(v3);
  p_currentConnection = &self->_currentConnection;
  currentConnection = self->_currentConnection;
  if (!currentConnection)
  {
    id v6 = +[MOManagedSettingsAgentConnection newConnection];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__MOBatchSettingsStore_xpcConnection__block_invoke;
    v11[3] = &unk_1E61CBE28;
    objc_copyWeak(&v12, &location);
    [v6 setInterruptionHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__MOBatchSettingsStore_xpcConnection__block_invoke_2;
    v9[3] = &unk_1E61CBE28;
    objc_copyWeak(&v10, &location);
    [v6 setInvalidationHandler:v9];
    objc_storeStrong((id *)p_currentConnection, v6);
    [v6 activate];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

    currentConnection = *p_currentConnection;
  }
  v7 = currentConnection;
  objc_sync_exit(v3);

  return v7;
}

void __37__MOBatchSettingsStore_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained clearCurrentConnectionAndInvalidate:1];
}

void __37__MOBatchSettingsStore_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained clearCurrentConnectionAndInvalidate:0];
}

- (void)clearCurrentConnectionAndInvalidate:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self->_connectionLock;
  objc_sync_enter(obj);
  if (v3)
  {
    [(NSXPCConnection *)self->_currentConnection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_currentConnection invalidate];
  }
  currentConnection = self->_currentConnection;
  self->_currentConnection = 0;

  objc_sync_exit(obj);
}

- (BOOL)active
{
  BOOL v3 = self->_settingsLock;
  objc_sync_enter(v3);
  p_updatedProperties = &self->_updatedProperties;
  id v5 = [(NSMutableDictionary *)self->_updatedProperties objectForKeyedSubscript:@"active"];
  id v6 = v5;
  if (!v5)
  {
    v8 = [(MOBatchSettingsStore *)self getCurrentStoreProperties];
    v9 = (void *)[v8 mutableCopy];

    if (v9)
    {
      [v9 addEntriesFromDictionary:*p_updatedProperties];
      objc_storeStrong((id *)p_updatedProperties, v9);
      id v10 = [(NSMutableDictionary *)*p_updatedProperties objectForKeyedSubscript:@"active"];
      id v6 = v10;
      if (v10)
      {
        char v7 = [v10 BOOLValue];
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      id v6 = 0;
    }
    char v7 = 1;
    goto LABEL_8;
  }
  char v7 = [v5 BOOLValue];
LABEL_9:

  objc_sync_exit(v3);
  return v7;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self->_settingsLock;
  objc_sync_enter(obj);
  id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [(NSMutableDictionary *)self->_updatedProperties setObject:v5 forKeyedSubscript:@"active"];

  objc_sync_exit(obj);
}

- (BOOL)syncToWatch
{
  BOOL v3 = self->_settingsLock;
  objc_sync_enter(v3);
  p_updatedProperties = &self->_updatedProperties;
  id v5 = [(NSMutableDictionary *)self->_updatedProperties objectForKeyedSubscript:@"syncToWatch"];
  id v6 = v5;
  if (!v5)
  {
    v8 = [(MOBatchSettingsStore *)self getCurrentStoreProperties];
    v9 = (void *)[v8 mutableCopy];

    if (v9)
    {
      [v9 addEntriesFromDictionary:*p_updatedProperties];
      objc_storeStrong((id *)p_updatedProperties, v9);
      id v10 = [(NSMutableDictionary *)*p_updatedProperties objectForKeyedSubscript:@"syncToWatch"];
      id v6 = v10;
      if (v10)
      {
        char v7 = [v10 BOOLValue];
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      id v6 = 0;
    }
    char v7 = 0;
    goto LABEL_8;
  }
  char v7 = [v5 BOOLValue];
LABEL_9:

  objc_sync_exit(v3);
  return v7;
}

- (void)setSyncToWatch:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self->_settingsLock;
  objc_sync_enter(obj);
  id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [(NSMutableDictionary *)self->_updatedProperties setObject:v5 forKeyedSubscript:@"syncToWatch"];

  objc_sync_exit(obj);
}

- (void)clearAllSettings
{
  obj = self->_settingsLock;
  objc_sync_enter(obj);
  if (!self->_fullReplacement)
  {
    self->_fullReplacement = 1;
    [(NSMutableSet *)self->_removedSettings removeAllObjects];
  }
  [(NSMutableDictionary *)self->_updatedSettings removeAllObjects];
  objc_sync_exit(obj);
}

- (void)deleteStore
{
  obj = self->_settingsLock;
  objc_sync_enter(obj);
  if (!self->_fullReplacement)
  {
    self->_fullReplacement = 1;
    [(NSMutableSet *)self->_removedSettings removeAllObjects];
  }
  [(NSMutableDictionary *)self->_updatedSettings removeAllObjects];
  [(NSMutableDictionary *)self->_updatedProperties setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"active"];
  [(NSMutableDictionary *)self->_updatedProperties setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"syncToWatch"];
  objc_sync_exit(obj);
}

- (id)getCurrentStoreProperties
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  BOOL v3 = [(MOBatchSettingsStore *)self xpcConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke;
  v6[3] = &unk_1E61CC038;
  v6[4] = self;
  v6[5] = &v7;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v3 withRetryCount:1 proxyHandler:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[MOLogger store];
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) container];
      id v10 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138543618;
      v22 = v9;
      __int16 v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Getting current store properties from store with container “%{public}@” and name “%{public}@”", buf, 0x16u);
    }
    v8 = [*(id *)(a1 + 32) persistenceRecordIdentifier];
    v11 = [*(id *)(a1 + 32) container];
    id v12 = [*(id *)(a1 + 32) name];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_9;
    v19[3] = &unk_1E61CC010;
    long long v20 = *(_OWORD *)(a1 + 32);
    [v5 getStorePropertiesForRecordIdentifier:v8 storeContainer:v11 storeName:v12 replyHandler:v19];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_cold_1((uint64_t)v6, v8, v13, v14, v15, v16, v17, v18);
  }
}

void __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = +[MOLogger store];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_9_cold_2();
    }
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    v8 = +[MOLogger store];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) container];
      id v10 = [*(id *)(a1 + 32) name];
      int v11 = 138543874;
      id v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Successfully got current store properties from store with container “%{public}@” and name “%{public}@”. Value: %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  else
  {
    v8 = +[MOLogger store];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_9_cold_1(a1);
    }
  }
}

- (id)getCurrentSettings
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1;
  int v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  BOOL v3 = [(MOBatchSettingsStore *)self xpcConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MOBatchSettingsStore_getCurrentSettings__block_invoke;
  v6[3] = &unk_1E61CC038;
  v6[4] = self;
  v6[5] = &v7;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v3 withRetryCount:1 proxyHandler:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__MOBatchSettingsStore_getCurrentSettings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[MOLogger store];
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) container];
      id v10 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138543618;
      v22 = v9;
      __int16 v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Gettting current settings for store with container “%{public}@” and name “%{public}@”", buf, 0x16u);
    }
    v8 = [*(id *)(a1 + 32) persistenceRecordIdentifier];
    int v11 = [*(id *)(a1 + 32) container];
    id v12 = [*(id *)(a1 + 32) name];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __42__MOBatchSettingsStore_getCurrentSettings__block_invoke_12;
    v19[3] = &unk_1E61CC010;
    long long v20 = *(_OWORD *)(a1 + 32);
    [v5 getAllSettingsForRecordIdentifier:v8 storeContainer:v11 storeName:v12 replyHandler:v19];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_cold_1((uint64_t)v6, v8, v13, v14, v15, v16, v17, v18);
  }
}

void __42__MOBatchSettingsStore_getCurrentSettings__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = +[MOLogger store];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __42__MOBatchSettingsStore_getCurrentSettings__block_invoke_12_cold_2();
    }
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    v8 = +[MOLogger store];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) container];
      id v10 = [*(id *)(a1 + 32) name];
      int v11 = 138543618;
      id v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Successfully got current settings for store with container “%{public}@” and name “%{public}@”", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    v8 = +[MOLogger store];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __42__MOBatchSettingsStore_getCurrentSettings__block_invoke_12_cold_1(a1);
    }
  }
}

- (void)commitChanges
{
  BOOL v3 = [(MOBatchSettingsStore *)self xpcConnection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__MOBatchSettingsStore_commitChanges__block_invoke;
  v4[3] = &unk_1E61CC088;
  v4[4] = self;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v3 withRetryCount:1 proxyHandler:v4];
}

void __37__MOBatchSettingsStore_commitChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MOLogger store];
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) container];
      id v10 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138543618;
      v39 = v9;
      __int16 v40 = 2114;
      v41 = v10;
      _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Updating store with container “%{public}@” and name “%{public}@”", buf, 0x16u);
    }
    int v11 = *(void **)(a1 + 32);
    id v12 = [v11 updatedSettings];
    int v13 = [v11 hasSensitiveDataInSettings:v12];

    uint64_t v14 = +[MOLogger store];
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        uint64_t v16 = [*(id *)(a1 + 32) updatedSettings];
        *(_DWORD *)buf = 138412290;
        v39 = v16;
        uint64_t v17 = "NewSettings: %@";
LABEL_11:
        _os_log_impl(&dword_1B8ED1000, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
      }
    }
    else if (v15)
    {
      uint64_t v16 = [*(id *)(a1 + 32) updatedSettings];
      *(_DWORD *)buf = 138543362;
      v39 = v16;
      uint64_t v17 = "NewSettings: %{public}@";
      goto LABEL_11;
    }

    v24 = +[MOLogger store];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [*(id *)(a1 + 32) removedSettings];
      *(_DWORD *)buf = 138543362;
      v39 = v25;
      _os_log_impl(&dword_1B8ED1000, v24, OS_LOG_TYPE_DEFAULT, "RemovedSettings: %{public}@", buf, 0xCu);
    }
    objc_super v26 = +[MOLogger store];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [*(id *)(a1 + 32) updatedProperties];
      *(_DWORD *)buf = 138543362;
      v39 = v27;
      _os_log_impl(&dword_1B8ED1000, v26, OS_LOG_TYPE_DEFAULT, "NewProperties: %{public}@", buf, 0xCu);
    }
    v28 = +[MOLogger store];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = [*(id *)(a1 + 32) fullReplacement];
      v30 = @"No";
      if (v29) {
        v30 = @"Yes";
      }
      *(_DWORD *)buf = 138543362;
      v39 = v30;
      _os_log_impl(&dword_1B8ED1000, v28, OS_LOG_TYPE_DEFAULT, "FullReplacement: %{public}@", buf, 0xCu);
    }

    v8 = [*(id *)(a1 + 32) updatedSettings];
    v31 = [*(id *)(a1 + 32) removedSettings];
    v32 = [*(id *)(a1 + 32) updatedProperties];
    uint64_t v33 = [*(id *)(a1 + 32) fullReplacement];
    v34 = [*(id *)(a1 + 32) persistenceRecordIdentifier];
    v35 = [*(id *)(a1 + 32) container];
    v36 = [*(id *)(a1 + 32) name];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __37__MOBatchSettingsStore_commitChanges__block_invoke_17;
    v37[3] = &unk_1E61CC060;
    v37[4] = *(void *)(a1 + 32);
    [v5 updateStoreWithNewSettings:v8 removedSettings:v31 newProperties:v32 fullReplacement:v33 recordIdentifier:v34 storeContainer:v35 storeName:v36 replyHandler:v37];

    goto LABEL_21;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_cold_1((uint64_t)v6, v8, v18, v19, v20, v21, v22, v23);
  }
LABEL_21:
}

void __37__MOBatchSettingsStore_commitChanges__block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[MOLogger store];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __37__MOBatchSettingsStore_commitChanges__block_invoke_17_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setPersistenceRecordIdentifier:a2];
    id v6 = +[MOLogger store];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) container];
      v8 = [*(id *)(a1 + 32) name];
      int v9 = 138543618;
      id v10 = v7;
      __int16 v11 = 2114;
      id v12 = v8;
      _os_log_impl(&dword_1B8ED1000, v6, OS_LOG_TYPE_DEFAULT, "Successfully updated store with container “%{public}@” and name “%{public}@”", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (id)valueForSetting:(id)a3 inGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MOSettingsStore *)self settingKeyFromSetting:v6 group:v7];
  int v9 = self->_settingsLock;
  objc_sync_enter(v9);
  p_updatedSettings = &self->_updatedSettings;
  __int16 v11 = [(NSMutableDictionary *)self->_updatedSettings objectForKeyedSubscript:v8];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else if (self->_fullReplacement)
  {
    id v13 = 0;
  }
  else
  {
    uint64_t v14 = [(MOBatchSettingsStore *)self getCurrentSettings];
    BOOL v15 = (void *)[v14 mutableCopy];

    if (v15)
    {
      [v15 addEntriesFromDictionary:*p_updatedSettings];
      objc_storeStrong((id *)&self->_updatedSettings, v15);
      self->_fullReplacement = 1;
      id v13 = [(NSMutableDictionary *)*p_updatedSettings objectForKeyedSubscript:v8];
    }
    else
    {
      id v13 = 0;
    }
  }
  objc_sync_exit(v9);

  return v13;
}

- (void)setValue:(id)a3 forSetting:(id)a4 inGroup:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MOSettingsStore *)self settingKeyFromSetting:v8 group:v9];
  __int16 v11 = self->_settingsLock;
  objc_sync_enter(v11);
  [(NSMutableDictionary *)self->_updatedSettings setObject:v12 forKeyedSubscript:v10];
  if (!self->_fullReplacement) {
    [(NSMutableSet *)self->_removedSettings removeObject:v10];
  }
  objc_sync_exit(v11);
}

- (void)removeValueForSetting:(id)a3 inGroup:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(MOSettingsStore *)self settingKeyFromSetting:v9 group:v6];
  id v8 = self->_settingsLock;
  objc_sync_enter(v8);
  [(NSMutableDictionary *)self->_updatedSettings setObject:0 forKeyedSubscript:v7];
  if (!self->_fullReplacement) {
    [(NSMutableSet *)self->_removedSettings addObject:v7];
  }
  objc_sync_exit(v8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSUUID)persistenceRecordIdentifier
{
  return self->_persistenceRecordIdentifier;
}

- (void)setPersistenceRecordIdentifier:(id)a3
{
}

- (NSMutableDictionary)updatedSettings
{
  return self->_updatedSettings;
}

- (void)setUpdatedSettings:(id)a3
{
}

- (NSMutableSet)removedSettings
{
  return self->_removedSettings;
}

- (void)setRemovedSettings:(id)a3
{
}

- (NSMutableDictionary)updatedProperties
{
  return self->_updatedProperties;
}

- (void)setUpdatedProperties:(id)a3
{
}

- (NSObject)settingsLock
{
  return self->_settingsLock;
}

- (BOOL)fullReplacement
{
  return self->_fullReplacement;
}

- (void)setFullReplacement:(BOOL)a3
{
  self->_fullReplacement = a3;
}

- (NSXPCConnection)currentConnection
{
  return self->_currentConnection;
}

- (void)setCurrentConnection:(id)a3
{
}

- (NSObject)connectionLock
{
  return self->_connectionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_currentConnection, 0);
  objc_storeStrong((id *)&self->_settingsLock, 0);
  objc_storeStrong((id *)&self->_updatedProperties, 0);
  objc_storeStrong((id *)&self->_removedSettings, 0);
  objc_storeStrong((id *)&self->_updatedSettings, 0);
  objc_storeStrong((id *)&self->_persistenceRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_9_cold_1(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) container];
  BOOL v3 = [*(id *)(a1 + 32) name];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1B8ED1000, v4, v5, "Unable to get current store properties from store with container “%{public}@” and name “%{public}@”. Error: Unknown", v6, v7, v8, v9, v10);
}

void __49__MOBatchSettingsStore_getCurrentStoreProperties__block_invoke_9_cold_2()
{
  OUTLINED_FUNCTION_3();
  v2 = [*(id *)(v1 + 32) container];
  BOOL v3 = [*(id *)(v0 + 32) name];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1B8ED1000, v4, v5, "Unable to get current store properties from store with container “%{public}@” and name “%{public}@”. Error: %{public}@", v6, v7, v8, v9, v10);
}

void __42__MOBatchSettingsStore_getCurrentSettings__block_invoke_12_cold_1(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) container];
  BOOL v3 = [*(id *)(a1 + 32) name];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1B8ED1000, v4, v5, "Unable to get current settings from store with container “%{public}@” and name “%{public}@”. Error: Unknown", v6, v7, v8, v9, v10);
}

void __42__MOBatchSettingsStore_getCurrentSettings__block_invoke_12_cold_2()
{
  OUTLINED_FUNCTION_3();
  v2 = [*(id *)(v1 + 32) container];
  BOOL v3 = [*(id *)(v0 + 32) name];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1B8ED1000, v4, v5, "Unable to get current settings for store with container “%{public}@” and name “%{public}@.” Error: %{public}@", v6, v7, v8, v9, v10);
}

void __37__MOBatchSettingsStore_commitChanges__block_invoke_17_cold_1()
{
  OUTLINED_FUNCTION_3();
  v2 = [*(id *)(v1 + 32) container];
  BOOL v3 = [*(id *)(v0 + 32) name];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1B8ED1000, v4, v5, "Unable to update store with container “%{public}@” and name “%{public}@.” Error: %{public}@", v6, v7, v8, v9, v10);
}

@end