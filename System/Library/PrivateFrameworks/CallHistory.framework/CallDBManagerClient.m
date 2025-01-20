@interface CallDBManagerClient
- (BOOL)validatePermDatabase;
- (BOOL)validateTempDatabase;
- (BOOL)willMoveCallsFromTempDatabase;
- (NSXPCConnection)helperConnection;
- (id)permDBLocation:(unsigned __int8 *)a3;
- (id)syncHelperReadyNotificationRef;
- (id)tempDBLocation:(unsigned __int8 *)a3;
- (void)createHelperConnection;
- (void)createPermanent;
- (void)createTemporary;
- (void)handlePermanentCreated;
- (void)moveCallsFromTempDatabase;
- (void)pokeSyncHelperToInitDB;
- (void)setHelperConnection:(id)a3;
- (void)setSyncHelperReadyNotificationRef:(id)a3;
- (void)willMoveCallsFromTempDatabase;
@end

@implementation CallDBManagerClient

- (id)tempDBLocation:(unsigned __int8 *)a3
{
  return +[CallDBManager getDBLocationIsSandboxed:1 isTemporary:1 error:a3];
}

- (void)createPermanent
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "MetaInfo says permanent database should be initialized but looks like not", v2, v3, v4, v5, v6);
}

- (id)permDBLocation:(unsigned __int8 *)a3
{
  return +[CallDBManager getDBLocationIsSandboxed:1 isTemporary:0 error:a3];
}

- (void)handlePermanentCreated
{
  if (![(CallDBManager *)self dataStoreType]) {
    [(CallDBManager *)self setNotifyDataStoreChangeReason:2];
  }
  v4.receiver = self;
  v4.super_class = (Class)CallDBManagerClient;
  [(CallDBManager *)&v4 handlePermanentCreated];
  uint64_t v3 = [(CallDBManagerClient *)self helperConnection];
  [v3 invalidate];
}

- (void)moveCallsFromTempDatabase
{
  if ([(CallDBManagerClient *)self willMoveCallsFromTempDatabase])
  {
    [(CallDBManagerClient *)self createHelperConnection];
    id v4 = [(CallDBManagerClient *)self helperConnection];
    uint64_t v3 = [v4 remoteObjectProxy];
    [v3 moveCallsFromTempDatabase];
  }
}

- (BOOL)willMoveCallsFromTempDatabase
{
  uint64_t v2 = [(CallDBManagerClient *)self tempDBLocation:0];
  if (v2)
  {
    uint64_t v3 = [CallDBMetaInfo alloc];
    id v4 = [v2 URLByDeletingLastPathComponent];
    uint64_t v5 = [(CallDBMetaInfo *)v3 initWithURL:v4];

    if ([v5 readDatabaseVersion:1] == 37)
    {
      uint8_t v6 = +[CallDBManager modelURL];
      v7 = +[DBManager instanceWithModelURL:v6];
      if ([v7 addDataStoreAtLocation:v2 isEncrypted:0])
      {
        v8 = [v7 createManagedObjectContext];
        v9 = +[DBManager entityDescriptionHavingName:@"CallRecord" forContext:v8];
        if (v9)
        {
          v10 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
          [v10 setEntity:v9];
          uint64_t v21 = 0;
          v11 = [v8 executeFetchRequest:v10 error:&v21];
          v12 = v11;
          if (v21)
          {
            v13 = +[CHLogServer sharedInstance];
            v14 = [v13 logHandleForDomain:"ch.calldbm"];

            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              -[CallDBManagerClient willMoveCallsFromTempDatabase]();
            }

            BOOL v15 = 0;
          }
          else
          {
            BOOL v15 = [v11 count] != 0;
          }
        }
        else
        {
          v19 = +[CHLogServer sharedInstance];
          v10 = [v19 logHandleForDomain:"ch.calldbm"];

          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            [(CallDBManagerClient *)@"CallRecord" willMoveCallsFromTempDatabase];
          }
          BOOL v15 = 0;
        }
      }
      else
      {
        v18 = +[CHLogServer sharedInstance];
        v8 = [v18 logHandleForDomain:"ch.calldbm"];

        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(CallDBManagerClient *)(uint64_t)v2 willMoveCallsFromTempDatabase];
        }
        BOOL v15 = 0;
      }
    }
    else
    {
      v17 = +[CHLogServer sharedInstance];
      uint8_t v6 = [v17 logHandleForDomain:"ch.calldbm"];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, "Temporary data store not used, nothing to move", buf, 2u);
      }
      BOOL v15 = 0;
    }
  }
  else
  {
    v16 = +[CHLogServer sharedInstance];
    uint64_t v5 = [v16 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CallDBManagerClient willMoveCallsFromTempDatabase]();
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (NSXPCConnection)helperConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)createHelperConnection
{
  uint64_t v3 = [(CallDBManagerClient *)self helperConnection];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v5 = (void *)[v4 initWithMachServiceName:kSyncHelperServiceIdentifier options:0];
    [(CallDBManagerClient *)self setHelperConnection:v5];

    uint8_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F12BB3C0];
    v7 = [(CallDBManagerClient *)self helperConnection];
    [v7 setRemoteObjectInterface:v6];

    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__CallDBManagerClient_createHelperConnection__block_invoke;
    v13[3] = &unk_1E61C7610;
    objc_copyWeak(&v14, &location);
    v8 = [(CallDBManagerClient *)self helperConnection];
    [v8 setInterruptionHandler:v13];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__CallDBManagerClient_createHelperConnection__block_invoke_61;
    v11[3] = &unk_1E61C7610;
    objc_copyWeak(&v12, &location);
    v9 = [(CallDBManagerClient *)self helperConnection];
    [v9 setInvalidationHandler:v11];

    v10 = [(CallDBManagerClient *)self helperConnection];
    [v10 resume];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __45__CallDBManagerClient_createHelperConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[CHLogServer sharedInstance];
  uint64_t v3 = [v2 logHandleForDomain:"ch.calldbm"];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45__CallDBManagerClient_createHelperConnection__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    objc_sync_enter(v6);
    [v6 createDataStore];
    [v6 moveCallsFromTempDatabase];
    objc_sync_exit(v6);
  }
}

void __45__CallDBManagerClient_createHelperConnection__block_invoke_61(uint64_t a1)
{
  uint64_t v2 = +[CHLogServer sharedInstance];
  uint64_t v3 = [v2 logHandleForDomain:"ch.calldbm"];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45__CallDBManagerClient_createHelperConnection__block_invoke_61_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    objc_sync_enter(v6);
    [v6 setHelperConnection:0];
    objc_sync_exit(v6);
  }
}

- (void)createTemporary
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "MetaInfo says temporary database should be initialized but looks like not", v2, v3, v4, v5, v6);
}

- (BOOL)validatePermDatabase
{
  char v8 = 0;
  uint64_t v2 = [(CallDBManagerClient *)self permDBLocation:&v8];
  BOOL v3 = 0;
  if (!v8)
  {
    uint64_t v4 = [CallDBMetaInfo alloc];
    uint64_t v5 = [v2 URLByDeletingLastPathComponent];
    uint8_t v6 = [(CallDBMetaInfo *)v4 initWithURL:v5];

    BOOL v3 = [(CallDBMetaInfo *)v6 validateInfo:0];
  }

  return v3;
}

- (BOOL)validateTempDatabase
{
  char v8 = 0;
  uint64_t v2 = [(CallDBManagerClient *)self tempDBLocation:&v8];
  BOOL v3 = 0;
  if (!v8)
  {
    uint64_t v4 = [CallDBMetaInfo alloc];
    uint64_t v5 = [v2 URLByDeletingLastPathComponent];
    uint8_t v6 = [(CallDBMetaInfo *)v4 initWithURL:v5];

    BOOL v3 = [(CallDBMetaInfo *)v6 validateInfo:1];
  }

  return v3;
}

- (void)pokeSyncHelperToInitDB
{
  [(CallDBManagerClient *)self createHelperConnection];
  BOOL v3 = +[CHLogServer sharedInstance];
  uint64_t v4 = [v3 logHandleForDomain:"ch.calldbm"];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B8E4A000, v4, OS_LOG_TYPE_DEFAULT, "Poking sync helper to initialize data store", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  uint64_t v5 = [(CallDBManagerClient *)self helperConnection];
  uint8_t v6 = [v5 remoteObjectProxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__CallDBManagerClient_pokeSyncHelperToInitDB__block_invoke;
  v7[3] = &unk_1E61C7638;
  objc_copyWeak(&v8, buf);
  [v6 bootUp:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

void __45__CallDBManagerClient_pokeSyncHelperToInitDB__block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[CHLogServer sharedInstance];
  uint64_t v5 = [v4 logHandleForDomain:"ch.calldbm"];

  uint8_t v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = getBootUpResultAsString(a2);
    int v15 = 138543362;
    v16 = v7;
    _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, "Boot up result: %{public}@", (uint8_t *)&v15, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (!a2)
  {
    id v11 = WeakRetained;
    objc_sync_enter(v11);
    if (([v11 shouldCreateTemporary] & 1) == 0) {
      goto LABEL_16;
    }
    if ([v11 validatePermDatabase])
    {
      [v11 createTemporary];
      goto LABEL_16;
    }
    id v14 = +[CHLogServer sharedInstance];
    v13 = [v14 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __45__CallDBManagerClient_pokeSyncHelperToInitDB__block_invoke_cold_2();
    }
    goto LABEL_15;
  }
  if (a2 == 1)
  {
    id v10 = WeakRetained;
    objc_sync_enter(v10);
    if (([v10 shouldCreatePermanent] & 1) == 0)
    {
LABEL_16:
      objc_sync_exit(v9);

      goto LABEL_17;
    }
    if ([v10 validatePermDatabase])
    {
      [v10 createPermanent];
      goto LABEL_16;
    }
    id v12 = +[CHLogServer sharedInstance];
    v13 = [v12 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __45__CallDBManagerClient_pokeSyncHelperToInitDB__block_invoke_cold_1();
    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:
}

- (void)setHelperConnection:(id)a3
{
}

- (id)syncHelperReadyNotificationRef
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setSyncHelperReadyNotificationRef:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_syncHelperReadyNotificationRef, 0);
  objc_storeStrong((id *)&self->_helperConnection, 0);
}

- (void)willMoveCallsFromTempDatabase
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B8E4A000, a2, OS_LOG_TYPE_ERROR, "Failed to add data store at location: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __45__CallDBManagerClient_createHelperConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Connection to Synchelper interrupted", v2, v3, v4, v5, v6);
}

void __45__CallDBManagerClient_createHelperConnection__block_invoke_61_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Connection to Synchelper invalidated", v2, v3, v4, v5, v6);
}

void __45__CallDBManagerClient_pokeSyncHelperToInitDB__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Permanent database state in client is out of sync with the server.", v2, v3, v4, v5, v6);
}

void __45__CallDBManagerClient_pokeSyncHelperToInitDB__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Temporary database state in client is out of sync with the server.", v2, v3, v4, v5, v6);
}

@end