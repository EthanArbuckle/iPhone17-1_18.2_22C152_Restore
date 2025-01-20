@interface AFManagedStorageConnection
- (id)_connection;
- (id)_managedStoreService;
- (id)_managedStoreServiceWithErrorHandler:(id)a3;
- (id)_synchronousManagedStoreServiceWithErrorHandler:(id)a3;
- (id)dataForKey:(id)a3 inKnowledgeStoreWithName:(id)a4;
- (id)domainObjectForKey:(id)a3;
- (void)_clearConnection;
- (void)dealloc;
- (void)resetKnowledgeStoreWithName:(id)a3;
- (void)setData:(id)a3 forKey:(id)a4 inKnowledgeStoreWithName:(id)a5;
- (void)setDomainObject:(id)a3 forKey:(id)a4;
@end

@implementation AFManagedStorageConnection

- (void).cxx_destruct
{
}

- (void)resetKnowledgeStoreWithName:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    v8 = "-[AFManagedStorageConnection resetKnowledgeStoreWithName:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  v6 = [(AFManagedStorageConnection *)self _synchronousManagedStoreServiceWithErrorHandler:&__block_literal_global_68_19757];
  [v6 resetKnowledgeStoreWithName:v4 completion:&__block_literal_global_71];
}

void __58__AFManagedStorageConnection_resetKnowledgeStoreWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[AFManagedStorageConnection resetKnowledgeStoreWithName:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setData:(id)a3 forKey:(id)a4 inKnowledgeStoreWithName:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    v14 = "-[AFManagedStorageConnection setData:forKey:inKnowledgeStoreWithName:]";
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v13, 0x16u);
  }
  v12 = [(AFManagedStorageConnection *)self _synchronousManagedStoreServiceWithErrorHandler:&__block_literal_global_63];
  [v12 setKnowledgeStoreData:v8 forKey:v9 inStoreWithName:v10 completion:&__block_literal_global_66_19761];
}

void __70__AFManagedStorageConnection_setData_forKey_inKnowledgeStoreWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[AFManagedStorageConnection setData:forKey:inKnowledgeStoreWithName:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (id)dataForKey:(id)a3 inKnowledgeStoreWithName:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[AFManagedStorageConnection dataForKey:inKnowledgeStoreWithName:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v14 = __Block_byref_object_copy__19765;
  __int16 v15 = __Block_byref_object_dispose__19766;
  id v16 = 0;
  id v9 = [(AFManagedStorageConnection *)self _synchronousManagedStoreServiceWithErrorHandler:&__block_literal_global_19767];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__AFManagedStorageConnection_dataForKey_inKnowledgeStoreWithName___block_invoke_60;
  v12[3] = &unk_1E5927DC8;
  v12[4] = buf;
  [v9 getKnowledgeStoreDataForKey:v6 inStoreWithName:v7 completion:v12];

  id v10 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v10;
}

void __66__AFManagedStorageConnection_dataForKey_inKnowledgeStoreWithName___block_invoke_60(uint64_t a1, void *a2)
{
}

void __66__AFManagedStorageConnection_dataForKey_inKnowledgeStoreWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[AFManagedStorageConnection dataForKey:inKnowledgeStoreWithName:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setDomainObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AFManagedStorageConnection *)self _managedStoreService];
  [v8 setManagedStoreObject:v7 forKey:v6];
}

- (id)domainObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__19765;
  id v16 = __Block_byref_object_dispose__19766;
  id v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__AFManagedStorageConnection_domainObjectForKey___block_invoke;
  v10[3] = &unk_1E592C248;
  id v5 = v4;
  id v11 = v5;
  id v6 = [(AFManagedStorageConnection *)self _synchronousManagedStoreServiceWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__AFManagedStorageConnection_domainObjectForKey___block_invoke_58;
  v9[3] = &unk_1E5927DA0;
  v9[4] = &v12;
  [v6 fetchManagedStoreObjectForKey:v5 reply:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__AFManagedStorageConnection_domainObjectForKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[AFManagedStorageConnection domainObjectForKey:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Could not get domain objects for %@: %{public}@", (uint8_t *)&v6, 0x20u);
  }
}

void __49__AFManagedStorageConnection_domainObjectForKey___block_invoke_58(uint64_t a1, void *a2)
{
}

- (id)_synchronousManagedStoreServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AFManagedStorageConnection *)self _connection];
  int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_managedStoreServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AFManagedStorageConnection *)self _connection];
  int v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_managedStoreService
{
  id v2 = [(AFManagedStorageConnection *)self _connection];
  id v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.assistantd.managedstorage" options:0];
    uint64_t v5 = self->_connection;
    self->_connection = v4;

    objc_initWeak(&location, self);
    int v6 = self->_connection;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __41__AFManagedStorageConnection__connection__block_invoke;
    int v13 = &unk_1E592B978;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v6 setInvalidationHandler:&v10];
    id v7 = self->_connection;
    __int16 v8 = objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1EEEE6B88, v10, v11, v12, v13);
    [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __41__AFManagedStorageConnection__connection__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AFManagedStorageConnection__connection__block_invoke_2;
  block[3] = &unk_1E592B978;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __41__AFManagedStorageConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearConnection];
}

- (void)_clearConnection
{
  connection = self->_connection;
  if (connection)
  {
    id v4 = connection;
    uint64_t v5 = self->_connection;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__AFManagedStorageConnection__clearConnection__block_invoke;
    v8[3] = &unk_1E592C678;
    uint64_t v9 = v4;
    int v6 = v4;
    [(NSXPCConnection *)v5 addBarrierBlock:v8];
    id v7 = self->_connection;
    self->_connection = 0;
  }
}

uint64_t __46__AFManagedStorageConnection__clearConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)dealloc
{
  [(AFManagedStorageConnection *)self _clearConnection];
  v3.receiver = self;
  v3.super_class = (Class)AFManagedStorageConnection;
  [(AFManagedStorageConnection *)&v3 dealloc];
}

@end