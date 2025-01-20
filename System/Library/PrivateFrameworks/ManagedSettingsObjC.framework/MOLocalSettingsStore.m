@interface MOLocalSettingsStore
+ (NSSet)stores;
+ (id)new;
+ (id)storesForSharedContainer:(id)a3;
+ (void)deleteStoresWithStoreNames:(id)a3;
+ (void)deleteStoresWithStoreNames:(id)a3 sharedContainer:(id)a4;
+ (void)deleteStoresWithStoreNames:(id)a3 sharedContainer:(id)a4 recordIdentifier:(id)a5;
- (BOOL)active;
- (BOOL)syncToWatch;
- (MOLocalSettingsStore)init;
- (MOLocalSettingsStore)initWithName:(id)a3;
- (MOLocalSettingsStore)initWithName:(id)a3 sharedContainer:(id)a4;
- (MOLocalSettingsStore)initWithSharedContainer:(id)a3;
- (NSObject)connectionLock;
- (NSString)container;
- (NSString)name;
- (NSUUID)persistenceRecordIdentifier;
- (NSXPCConnection)currentConnection;
- (NSXPCConnection)xpcConnection;
- (id)getStoreProperties;
- (id)valueForSetting:(id)a3 inGroup:(id)a4;
- (void)batchUpdate:(id)a3;
- (void)clearAllSettings;
- (void)clearCurrentConnectionAndInvalidate:(BOOL)a3;
- (void)dealloc;
- (void)deleteStore;
- (void)removeValueForSetting:(id)a3 inGroup:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setContainer:(id)a3;
- (void)setCurrentConnection:(id)a3;
- (void)setName:(id)a3;
- (void)setPersistenceRecordIdentifier:(id)a3;
- (void)setSyncToWatch:(BOOL)a3;
- (void)setValue:(id)a3 forSetting:(id)a4 inGroup:(id)a5;
- (void)updateStoreProperties:(id)a3;
@end

@implementation MOLocalSettingsStore

- (MOLocalSettingsStore)init
{
  v12.receiver = self;
  v12.super_class = (Class)MOLocalSettingsStore;
  v2 = [(MOSettingsStore *)&v12 initStore];
  name = v2->_name;
  v2->_name = (NSString *)@"Default";

  v4 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v5 = [v4 processName];
  container = v2->_container;
  v2->_container = (NSString *)v5;

  persistenceRecordIdentifier = v2->_persistenceRecordIdentifier;
  v2->_persistenceRecordIdentifier = 0;

  currentConnection = v2->_currentConnection;
  v2->_currentConnection = 0;

  uint64_t v9 = objc_opt_new();
  connectionLock = v2->_connectionLock;
  v2->_connectionLock = v9;

  return v2;
}

+ (id)new
{
  return (id)MEMORY[0x1F4181648](a1, a2);
}

- (MOLocalSettingsStore)initWithName:(id)a3
{
  v4 = (NSString *)a3;
  uint64_t v5 = [(MOLocalSettingsStore *)self init];
  name = v5->_name;
  v5->_name = v4;

  return v5;
}

- (MOLocalSettingsStore)initWithSharedContainer:(id)a3
{
  v4 = (NSString *)a3;
  uint64_t v5 = [(MOLocalSettingsStore *)self init];
  container = v5->_container;
  v5->_container = v4;

  return v5;
}

- (MOLocalSettingsStore)initWithName:(id)a3 sharedContainer:(id)a4
{
  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  v8 = [(MOLocalSettingsStore *)self init];
  name = v8->_name;
  v8->_name = v6;
  v10 = v6;

  container = v8->_container;
  v8->_container = v7;

  return v8;
}

- (void)dealloc
{
  [(MOLocalSettingsStore *)self clearCurrentConnectionAndInvalidate:1];
  v3.receiver = self;
  v3.super_class = (Class)MOLocalSettingsStore;
  [(MOLocalSettingsStore *)&v3 dealloc];
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
    v11[2] = __37__MOLocalSettingsStore_xpcConnection__block_invoke;
    v11[3] = &unk_1E61CBE28;
    objc_copyWeak(&v12, &location);
    [v6 setInterruptionHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__MOLocalSettingsStore_xpcConnection__block_invoke_2;
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

void __37__MOLocalSettingsStore_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained clearCurrentConnectionAndInvalidate:1];
}

void __37__MOLocalSettingsStore_xpcConnection__block_invoke_2(uint64_t a1)
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
  v2 = [(MOLocalSettingsStore *)self getStoreProperties];
  BOOL v3 = [v2 objectForKeyedSubscript:@"active"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setActive:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"active";
  char v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  v7[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(MOLocalSettingsStore *)self updateStoreProperties:v5];
}

- (BOOL)syncToWatch
{
  v2 = [(MOLocalSettingsStore *)self getStoreProperties];
  BOOL v3 = [v2 objectForKeyedSubscript:@"syncToWatch"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setSyncToWatch:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"syncToWatch";
  char v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  v7[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(MOLocalSettingsStore *)self updateStoreProperties:v5];
}

- (id)getStoreProperties
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  id v12 = (id)MEMORY[0x1E4F1CC08];
  BOOL v3 = [(MOLocalSettingsStore *)self xpcConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MOLocalSettingsStore_getStoreProperties__block_invoke;
  v6[3] = &unk_1E61CC038;
  v6[4] = self;
  v6[5] = &v7;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v3 withRetryCount:1 proxyHandler:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__MOLocalSettingsStore_getStoreProperties__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
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
      v16 = v9;
      __int16 v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Getting store properties from store with container “%{public}@” and name “%{public}@”", buf, 0x16u);
    }
    v8 = [*(id *)(a1 + 32) persistenceRecordIdentifier];
    v11 = [*(id *)(a1 + 32) container];
    id v12 = [*(id *)(a1 + 32) name];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__MOLocalSettingsStore_getStoreProperties__block_invoke_10;
    v13[3] = &unk_1E61CC010;
    long long v14 = *(_OWORD *)(a1 + 32);
    [v5 getStorePropertiesForRecordIdentifier:v8 storeContainer:v11 storeName:v12 replyHandler:v13];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
  }
}

void __42__MOLocalSettingsStore_getStoreProperties__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = +[MOLogger store];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __42__MOLocalSettingsStore_getStoreProperties__block_invoke_10_cold_2();
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
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v12 = 138543874;
      v13 = v9;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Successfully got store properties from store with container “%{public}@” and name “%{public}@”. Value: %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    v8 = +[MOLogger store];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __42__MOLocalSettingsStore_getStoreProperties__block_invoke_10_cold_1(a1, v8);
    }
  }
}

- (void)updateStoreProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(MOLocalSettingsStore *)self xpcConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __46__MOLocalSettingsStore_updateStoreProperties___block_invoke;
  v7[3] = &unk_1E61CC400;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v5 withRetryCount:1 proxyHandler:v7];
}

void __46__MOLocalSettingsStore_updateStoreProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MOLogger store];
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = [*(id *)(a1 + 40) container];
      uint64_t v11 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v9;
      __int16 v23 = 2114;
      v24 = v10;
      __int16 v25 = 2114;
      v26 = v11;
      _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Updating store properties to “%{public}@” in store with container “%{public}@” and name “%{public}@”", buf, 0x20u);
    }
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = [*(id *)(a1 + 40) persistenceRecordIdentifier];
    __int16 v14 = [*(id *)(a1 + 40) container];
    v15 = [*(id *)(a1 + 40) name];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__MOLocalSettingsStore_updateStoreProperties___block_invoke_13;
    v18[3] = &unk_1E61CC3D8;
    __int16 v16 = *(id *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v19 = v16;
    uint64_t v20 = v17;
    [v5 updateStoreProperties:v12 recordIdentifier:v13 storeContainer:v14 storeName:v15 replyHandler:v18];

    id v8 = v19;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
  }
}

void __46__MOLocalSettingsStore_updateStoreProperties___block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[MOLogger store];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__MOLocalSettingsStore_updateStoreProperties___block_invoke_13_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 40) setPersistenceRecordIdentifier:a2];
    id v6 = +[MOLogger store];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = [*(id *)(a1 + 40) container];
      uint64_t v9 = [*(id *)(a1 + 40) name];
      int v10 = 138543874;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      v13 = v8;
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1B8ED1000, v6, OS_LOG_TYPE_DEFAULT, "Successfully updated store properties to “%{public}@” in store with container “%{public}@” and name “%{public}@”", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)clearAllSettings
{
  BOOL v3 = [(MOLocalSettingsStore *)self xpcConnection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__MOLocalSettingsStore_clearAllSettings__block_invoke;
  v4[3] = &unk_1E61CC088;
  v4[4] = self;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v3 withRetryCount:1 proxyHandler:v4];
}

void __40__MOLocalSettingsStore_clearAllSettings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[MOLogger store];
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) container];
      int v10 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Clearing all settings from store with container “%{public}@” and name “%{public}@”", buf, 0x16u);
    }
    id v8 = [*(id *)(a1 + 32) persistenceRecordIdentifier];
    uint64_t v11 = [*(id *)(a1 + 32) container];
    __int16 v12 = [*(id *)(a1 + 32) name];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40__MOLocalSettingsStore_clearAllSettings__block_invoke_15;
    v13[3] = &unk_1E61CC060;
    void v13[4] = *(void *)(a1 + 32);
    [v5 clearAllSettingsForRecordIdentifier:v8 storeContainer:v11 storeName:v12 replyHandler:v13];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
  }
}

void __40__MOLocalSettingsStore_clearAllSettings__block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[MOLogger store];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __40__MOLocalSettingsStore_clearAllSettings__block_invoke_15_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setPersistenceRecordIdentifier:a2];
    id v6 = +[MOLogger store];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) container];
      id v8 = [*(id *)(a1 + 32) name];
      int v9 = 138543618;
      int v10 = v7;
      __int16 v11 = 2114;
      __int16 v12 = v8;
      _os_log_impl(&dword_1B8ED1000, v6, OS_LOG_TYPE_DEFAULT, "Successfully cleared all settings from store with container “%{public}@” and name “%{public}@”", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)deleteStore
{
  v10[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_class();
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [(MOLocalSettingsStore *)self name];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v7 = [v4 setWithArray:v6];
  id v8 = [(MOLocalSettingsStore *)self container];
  int v9 = [(MOLocalSettingsStore *)self persistenceRecordIdentifier];
  [v3 deleteStoresWithStoreNames:v7 sharedContainer:v8 recordIdentifier:v9];
}

+ (void)deleteStoresWithStoreNames:(id)a3
{
}

+ (void)deleteStoresWithStoreNames:(id)a3 sharedContainer:(id)a4
{
}

+ (void)deleteStoresWithStoreNames:(id)a3 sharedContainer:(id)a4 recordIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = +[MOManagedSettingsAgentConnection oneTimeConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__MOLocalSettingsStore_deleteStoresWithStoreNames_sharedContainer_recordIdentifier___block_invoke;
  v15[3] = &unk_1E61CC450;
  id v16 = v8;
  id v17 = v7;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v7;
  id v14 = v8;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v11 withRetryCount:1 proxyHandler:v15];
}

void __84__MOLocalSettingsStore_deleteStoresWithStoreNames_sharedContainer_recordIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      int v10 = [MEMORY[0x1E4F28F80] processInfo];
      id v8 = [v10 processName];
    }
    id v11 = +[MOLogger store];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl(&dword_1B8ED1000, v11, OS_LOG_TYPE_DEFAULT, "Deleting stores “%{public}@” from container “%{public}@”", buf, 0x16u);
    }

    id v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__MOLocalSettingsStore_deleteStoresWithStoreNames_sharedContainer_recordIdentifier___block_invoke_18;
    v15[3] = &unk_1E61CC428;
    id v16 = v13;
    id v17 = v8;
    id v18 = *(id *)(a1 + 56);
    id v9 = v8;
    [v5 deleteStores:v16 recordIdentifier:v14 storeContainer:v9 replyHandler:v15];
  }
  else
  {
    id v9 = +[MOLogger store];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
    }
  }
}

void __84__MOLocalSettingsStore_deleteStoresWithStoreNames_sharedContainer_recordIdentifier___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[MOLogger store];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __84__MOLocalSettingsStore_deleteStoresWithStoreNames_sharedContainer_recordIdentifier___block_invoke_18_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1B8ED1000, v6, OS_LOG_TYPE_DEFAULT, "Successfully deleted stores “%{public}@” from container “%{public}@”", (uint8_t *)&v9, 0x16u);
  }

  [*(id *)(a1 + 48) invalidate];
}

- (void)batchUpdate:(id)a3
{
  name = self->_name;
  container = self->_container;
  id v5 = (void (**)(id, id))a3;
  id v6 = +[MOBatchSettingsStore storeWithName:name sharedContainer:container];
  v5[2](v5, v6);

  [v6 commitChanges];
}

+ (NSSet)stores
{
  return (NSSet *)[a1 storesForSharedContainer:0];
}

+ (id)storesForSharedContainer:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__2;
  id v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  id v4 = +[MOManagedSettingsAgentConnection oneTimeConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__MOLocalSettingsStore_storesForSharedContainer___block_invoke;
  v9[3] = &unk_1E61CBFB8;
  id v5 = v3;
  id v10 = v5;
  uint64_t v12 = &v13;
  id v6 = v4;
  id v11 = v6;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v6 withRetryCount:1 proxyHandler:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __49__MOLocalSettingsStore_storesForSharedContainer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      id v10 = [MEMORY[0x1E4F28F80] processInfo];
      id v8 = [v10 processName];
    }
    id v11 = +[MOLogger store];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v8;
      _os_log_impl(&dword_1B8ED1000, v11, OS_LOG_TYPE_DEFAULT, "Getting stores for container “%{public}@”", buf, 0xCu);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__MOLocalSettingsStore_storesForSharedContainer___block_invoke_20;
    v14[3] = &unk_1E61CBF90;
    id v15 = v8;
    long long v13 = *(_OWORD *)(a1 + 40);
    id v12 = (id)v13;
    long long v16 = v13;
    int v9 = v8;
    [v5 storeNamesForRecordIdentifier:0 storeContainer:v9 replyHandler:v14];
  }
  else
  {
    int v9 = +[MOLogger store];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
    }
  }
}

void __49__MOLocalSettingsStore_storesForSharedContainer___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MOLogger store];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __49__MOLocalSettingsStore_storesForSharedContainer___block_invoke_20_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138543618;
      id v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Successfully got stores “%{public}@” from container “%{public}@”", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = v5;
    id v8 = *(NSObject **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }

  [*(id *)(a1 + 40) invalidate];
}

- (id)valueForSetting:(id)a3 inGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOSettingsStore *)self settingKeyFromSetting:v6 group:v7];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__2;
  __int16 v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  uint64_t v9 = [(MOLocalSettingsStore *)self xpcConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__MOLocalSettingsStore_valueForSetting_inGroup___block_invoke;
  v13[3] = &unk_1E61CC4A0;
  id v10 = v8;
  id v14 = v10;
  uint64_t v15 = self;
  uint64_t v16 = &v17;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v9 withRetryCount:1 proxyHandler:v13];

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __48__MOLocalSettingsStore_valueForSetting_inGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MOLogger store];
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = [*(id *)(a1 + 40) container];
      id v11 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      id v22 = v10;
      __int16 v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Getting “%{public}@” from store with container “%{public}@” and name “%{public}@”", buf, 0x20u);
    }
    int v12 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
    id v13 = [*(id *)(a1 + 40) persistenceRecordIdentifier];
    id v14 = [*(id *)(a1 + 40) container];
    uint64_t v15 = [*(id *)(a1 + 40) name];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__MOLocalSettingsStore_valueForSetting_inGroup___block_invoke_22;
    v16[3] = &unk_1E61CC478;
    uint64_t v17 = *(id *)(a1 + 32);
    long long v18 = *(_OWORD *)(a1 + 40);
    [v5 getValuesForSettingNames:v12 recordIdentifier:v13 storeContainer:v14 storeName:v15 replyHandler:v16];

    id v8 = v17;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
  }
}

void __48__MOLocalSettingsStore_valueForSetting_inGroup___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v7 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v10 = [*(id *)(a1 + 40) metadataForSettingKey:*(void *)(a1 + 32)];
    int v11 = [v10 isPrivacySensitive];

    id v6 = +[MOLogger store];
    BOOL v12 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (!v12) {
        goto LABEL_10;
      }
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = [*(id *)(a1 + 40) container];
      uint64_t v15 = [*(id *)(a1 + 40) name];
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v20 = 138544130;
      uint64_t v21 = v13;
      __int16 v22 = 2114;
      __int16 v23 = v14;
      __int16 v24 = 2114;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      uint64_t v17 = "Successfully got “%{public}@” from store with container “%{public}@” and name “%{public}@.” Value: %@";
    }
    else
    {
      if (!v12) {
        goto LABEL_10;
      }
      uint64_t v18 = *(void *)(a1 + 32);
      id v14 = [*(id *)(a1 + 40) container];
      uint64_t v15 = [*(id *)(a1 + 40) name];
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v20 = 138544130;
      uint64_t v21 = v18;
      __int16 v22 = 2114;
      __int16 v23 = v14;
      __int16 v24 = 2114;
      uint64_t v25 = v15;
      __int16 v26 = 2114;
      uint64_t v27 = v19;
      uint64_t v17 = "Successfully got “%{public}@” from store with container “%{public}@” and name “%{public}@.” Value: %{public}@";
    }
    _os_log_impl(&dword_1B8ED1000, v6, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v20, 0x2Au);

    goto LABEL_10;
  }
  id v6 = +[MOLogger store];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __48__MOLocalSettingsStore_valueForSetting_inGroup___block_invoke_22_cold_1();
  }
LABEL_10:
}

- (void)setValue:(id)a3 forSetting:(id)a4 inGroup:(id)a5
{
  id v8 = a3;
  uint64_t v9 = [(MOSettingsStore *)self settingKeyFromSetting:a4 group:a5];
  id v10 = [(MOLocalSettingsStore *)self xpcConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__MOLocalSettingsStore_setValue_forSetting_inGroup___block_invoke;
  v13[3] = &unk_1E61CC4F0;
  void v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v10 withRetryCount:1 proxyHandler:v13];
}

void __52__MOLocalSettingsStore_setValue_forSetting_inGroup___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [a1[4] metadataForSettingKey:a1[5]];
    int v8 = [v7 isPrivacySensitive];

    uint64_t v9 = +[MOLogger store];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        id v12 = a1[5];
        id v11 = a1[6];
        uint64_t v13 = [a1[4] container];
        id v14 = [a1[4] name];
        *(_DWORD *)buf = 138544130;
        id v34 = v12;
        __int16 v35 = 2112;
        id v36 = v11;
        __int16 v37 = 2114;
        v38 = v13;
        __int16 v39 = 2114;
        v40 = v14;
        id v15 = "Setting “%{public}@” to “%@” from store with container “%{public}@” and name “%{public}@”";
LABEL_9:
        _os_log_impl(&dword_1B8ED1000, v9, OS_LOG_TYPE_DEFAULT, v15, buf, 0x2Au);
      }
    }
    else if (v10)
    {
      id v18 = a1[5];
      id v17 = a1[6];
      uint64_t v13 = [a1[4] container];
      id v14 = [a1[4] name];
      *(_DWORD *)buf = 138544130;
      id v34 = v18;
      __int16 v35 = 2114;
      id v36 = v17;
      __int16 v37 = 2114;
      v38 = v13;
      __int16 v39 = 2114;
      v40 = v14;
      id v15 = "Setting “%{public}@” to “%{public}@” from store with container “%{public}@” and name “%{public}@”";
      goto LABEL_9;
    }

    id v19 = a1[6];
    id v31 = a1[5];
    id v32 = v19;
    int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    uint64_t v21 = [a1[4] persistenceRecordIdentifier];
    __int16 v22 = [a1[4] container];
    __int16 v23 = [a1[4] name];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __52__MOLocalSettingsStore_setValue_forSetting_inGroup___block_invoke_23;
    v26[3] = &unk_1E61CC4C8;
    __int16 v24 = a1[5];
    id v25 = a1[4];
    uint64_t v27 = v24;
    id v28 = v25;
    char v30 = v8;
    id v29 = a1[6];
    [v5 setValues:v20 recordIdentifier:v21 storeContainer:v22 storeName:v23 replyHandler:v26];

    uint64_t v16 = v27;
    goto LABEL_11;
  }
  uint64_t v16 = +[MOLogger store];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
  }
LABEL_11:
}

void __52__MOLocalSettingsStore_setValue_forSetting_inGroup___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    [*(id *)(a1 + 40) setPersistenceRecordIdentifier:a2];
    int v7 = *(unsigned __int8 *)(a1 + 56);
    id v6 = +[MOLogger store];
    BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v8) {
        goto LABEL_10;
      }
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = [*(id *)(a1 + 40) container];
      id v12 = [*(id *)(a1 + 40) name];
      int v16 = 138544130;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      __int16 v20 = 2114;
      uint64_t v21 = v11;
      __int16 v22 = 2114;
      __int16 v23 = v12;
      uint64_t v13 = "Successfully set “%{public}@” to “%@” from store with container “%{public}@” and name “%{public}@”";
    }
    else
    {
      if (!v8) {
        goto LABEL_10;
      }
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 32);
      id v11 = [*(id *)(a1 + 40) container];
      id v12 = [*(id *)(a1 + 40) name];
      int v16 = 138544130;
      uint64_t v17 = v15;
      __int16 v18 = 2114;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      uint64_t v21 = v11;
      __int16 v22 = 2114;
      __int16 v23 = v12;
      uint64_t v13 = "Successfully set “%{public}@” to “%{public}@” from store with container “%{public}@” and name “%{public}@”";
    }
    _os_log_impl(&dword_1B8ED1000, v6, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0x2Au);

    goto LABEL_10;
  }
  id v6 = +[MOLogger store];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __52__MOLocalSettingsStore_setValue_forSetting_inGroup___block_invoke_23_cold_1();
  }
LABEL_10:
}

- (void)removeValueForSetting:(id)a3 inGroup:(id)a4
{
  id v5 = [(MOSettingsStore *)self settingKeyFromSetting:a3 group:a4];
  id v6 = [(MOLocalSettingsStore *)self xpcConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__MOLocalSettingsStore_removeValueForSetting_inGroup___block_invoke;
  v8[3] = &unk_1E61CC400;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v6 withRetryCount:1 proxyHandler:v8];
}

void __54__MOLocalSettingsStore_removeValueForSetting_inGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MOLogger store];
  BOOL v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = [*(id *)(a1 + 40) container];
      id v11 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v9;
      __int16 v23 = 2114;
      uint64_t v24 = v10;
      __int16 v25 = 2114;
      __int16 v26 = v11;
      _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Deleting “%{public}@” from store with container “%{public}@” and name “%{public}@”", buf, 0x20u);
    }
    id v12 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
    uint64_t v13 = [*(id *)(a1 + 40) persistenceRecordIdentifier];
    uint64_t v14 = [*(id *)(a1 + 40) container];
    uint64_t v15 = [*(id *)(a1 + 40) name];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__MOLocalSettingsStore_removeValueForSetting_inGroup___block_invoke_24;
    v18[3] = &unk_1E61CC3D8;
    int v16 = *(id *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v19 = v16;
    uint64_t v20 = v17;
    [v5 removeValuesForSettingNames:v12 recordIdentifier:v13 storeContainer:v14 storeName:v15 replyHandler:v18];

    BOOL v8 = v19;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1();
  }
}

void __54__MOLocalSettingsStore_removeValueForSetting_inGroup___block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[MOLogger store];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __54__MOLocalSettingsStore_removeValueForSetting_inGroup___block_invoke_24_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 40) setPersistenceRecordIdentifier:a2];
    id v6 = +[MOLogger store];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      BOOL v8 = [*(id *)(a1 + 40) container];
      uint64_t v9 = [*(id *)(a1 + 40) name];
      int v10 = 138543874;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1B8ED1000, v6, OS_LOG_TYPE_DEFAULT, "Successfully deleted “%{public}@” from store with container “%{public}@” and name “%{public}@”", (uint8_t *)&v10, 0x20u);
    }
  }
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
  objc_storeStrong((id *)&self->_persistenceRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __42__MOLocalSettingsStore_getStoreProperties__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1B8ED1000, v0, v1, "Unable to obtain remote object proxy. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __42__MOLocalSettingsStore_getStoreProperties__block_invoke_10_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) container];
  uint64_t v5 = [*(id *)(a1 + 32) name];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1B8ED1000, a2, OS_LOG_TYPE_ERROR, "Unable to get store properties from store with container “%{public}@” and name “%{public}@”. Error: Unknown", (uint8_t *)&v6, 0x16u);
}

void __42__MOLocalSettingsStore_getStoreProperties__block_invoke_10_cold_2()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = [*(id *)(v1 + 32) container];
  uint64_t v3 = [*(id *)(v0 + 32) name];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1B8ED1000, v4, v5, "Unable to get store properties from store with container “%{public}@” and name “%{public}@”. Error: %{public}@", v6, v7, v8, v9, v10);
}

void __46__MOLocalSettingsStore_updateStoreProperties___block_invoke_13_cold_1()
{
  OUTLINED_FUNCTION_3();
  [(id)OUTLINED_FUNCTION_6(v1) container];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_8() name];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1B8ED1000, v3, v4, "Unable to update store properties to “%{public}@” in store with container “%{public}@” and name “%{public}@”. Error: %{public}@", v5, v6, v7, v8, v9);
}

void __40__MOLocalSettingsStore_clearAllSettings__block_invoke_15_cold_1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = [*(id *)(v1 + 32) container];
  uint64_t v3 = [*(id *)(v0 + 32) name];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1B8ED1000, v4, v5, "Unable to clear all settings from store with container “%{public}@” and name “%{public}@.” Error: %{public}@", v6, v7, v8, v9, v10);
}

void __84__MOLocalSettingsStore_deleteStoresWithStoreNames_sharedContainer_recordIdentifier___block_invoke_18_cold_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_9();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_1B8ED1000, v3, OS_LOG_TYPE_ERROR, "Unable to delete stores “%{public}@” from container “%{public}@.” Error: %{public}@", v4, 0x20u);
}

void __49__MOLocalSettingsStore_storesForSharedContainer___block_invoke_20_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_9();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1B8ED1000, v1, OS_LOG_TYPE_ERROR, "Unable to get stores for container “%{public}@.” Error: %{public}@", v2, 0x16u);
}

void __48__MOLocalSettingsStore_valueForSetting_inGroup___block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_3();
  [(id)OUTLINED_FUNCTION_6(v1) container];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_8() name];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1B8ED1000, v3, v4, "Unable to get “%{public}@” from store with container “%{public}@” and name “%{public}@.” Error: %{public}@", v5, v6, v7, v8, v9);
}

void __52__MOLocalSettingsStore_setValue_forSetting_inGroup___block_invoke_23_cold_1()
{
  OUTLINED_FUNCTION_3();
  [(id)OUTLINED_FUNCTION_6(v1) container];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_8() name];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1B8ED1000, v3, v4, "Unable to set “%{public}@” from store with container “%{public}@” and name “%{public}@.” Error: %{public}@", v5, v6, v7, v8, v9);
}

void __54__MOLocalSettingsStore_removeValueForSetting_inGroup___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_3();
  [(id)OUTLINED_FUNCTION_6(v1) container];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_8() name];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1B8ED1000, v3, v4, "Unable to delete “%{public}@” from store with container “%{public}@” and name “%{public}@.” Error: %{public}@", v5, v6, v7, v8, v9);
}

@end