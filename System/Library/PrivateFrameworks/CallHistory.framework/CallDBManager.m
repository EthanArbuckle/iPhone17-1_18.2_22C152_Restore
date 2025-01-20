@interface CallDBManager
+ (id)dataStoreName;
+ (id)getDBLocationIsSandboxed:(BOOL)a3 isTemporary:(BOOL)a4 error:(unsigned __int8 *)a5;
+ (id)modelURL;
+ (void)modelURL;
- (BOOL)notifyDataStoreChanged;
- (BOOL)shouldCreatePermanent;
- (BOOL)shouldCreateTemporary;
- (CHDeviceObserver)deviceObserver;
- (CallDBManager)init;
- (CallDBManager)initWithDeviceObserver:(id)a3;
- (DBManager)dbManager;
- (id)createManagedObjectContext;
- (id)permDBLocation:(unsigned __int8 *)a3;
- (id)tempDBLocation:(unsigned __int8 *)a3;
- (unsigned)dataStoreType;
- (unsigned)notifyDataStoreChangeReason;
- (void)createDataStore;
- (void)createPermanent;
- (void)createTemporary;
- (void)didChangeBootLockEnabledForDeviceObserver:(id)a3;
- (void)handlePermanentCreated;
- (void)handleTemporaryCreated;
- (void)moveCallsFromTempDatabase;
- (void)setDataStoreType:(unsigned __int8)a3;
- (void)setDbManager:(id)a3;
- (void)setDeviceObserver:(id)a3;
- (void)setNotifyDataStoreChangeReason:(unsigned __int8)a3;
@end

@implementation CallDBManager

uint64_t __32__CallDBManager_createDataStore__block_invoke_42(uint64_t a1)
{
  return [*(id *)(a1 + 32) createPermanent];
}

- (BOOL)notifyDataStoreChanged
{
  v2 = self;
  objc_sync_enter(v2);
  int v3 = [(CallDBManager *)v2 dataStoreType];
  if (v3)
  {
    if (v3 != 1)
    {
      BOOL v5 = 0;
      goto LABEL_11;
    }
    if (![(CallDBManager *)v2 notifyDataStoreChangeReason])
    {
      BOOL v5 = 1;
      goto LABEL_11;
    }
    BOOL v4 = [(CallDBManager *)v2 notifyDataStoreChangeReason] == 2;
  }
  else
  {
    BOOL v4 = [(CallDBManager *)v2 notifyDataStoreChangeReason] == 1;
  }
  BOOL v5 = v4;
LABEL_11:
  objc_sync_exit(v2);

  return v5;
}

- (unsigned)notifyDataStoreChangeReason
{
  return self->_notifyDataStoreChangeReason;
}

- (CallDBManager)init
{
  int v3 = objc_alloc_init(CHDeviceObserver);
  BOOL v4 = [(CallDBManager *)self initWithDeviceObserver:v3];

  return v4;
}

- (CallDBManager)initWithDeviceObserver:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CallDBManager;
  v6 = [(CallDBManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_dataStoreType = 2;
    v8 = +[CallDBManager modelURL];
    uint64_t v9 = +[DBManager instanceWithModelURL:v8];
    dbManager = v7->_dbManager;
    v7->_dbManager = (DBManager *)v9;

    v7->_notifyDataStoreChangeReason = 3;
    if ([v5 isBootLockEnabled])
    {
      objc_storeStrong((id *)&v7->_deviceObserver, a3);
      [(CHDelegateManager *)v7->_deviceObserver addDelegate:v7 queue:MEMORY[0x1E4F14428]];
    }
  }

  return v7;
}

- (void)handlePermanentCreated
{
  int v3 = [(CallDBManager *)self dbManager];
  BOOL v4 = [(CallDBManager *)self tempDBLocation:0];
  [v3 removeDataStoreAtLocation:v4];

  [(CallDBManager *)self setDataStoreType:1];
  [(CallDBManager *)self moveCallsFromTempDatabase];
}

+ (id)getDBLocationIsSandboxed:(BOOL)a3 isTemporary:(BOOL)a4 error:(unsigned __int8 *)a5
{
  BOOL v5 = a4;
  if (a3) {
    getAppSupportDirSandboxed(@"CallHistoryDB", a5);
  }
  else {
  v6 = getAppSupportDir(a1, a2, a3, a4, a5);
  }
  if (v6)
  {
    v7 = @"CallHistory";
    if (v5) {
      v7 = @"CallHistoryTemp";
    }
    v8 = [NSString stringWithFormat:@"%@/%@.%@", @"CallHistoryDB", v7, @"storedata"];
    uint64_t v9 = [v6 URLByAppendingPathComponent:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

+ (id)modelURL
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 URLForResource:@"CallHistory" withExtension:@"momd"];
  }
  else
  {
    BOOL v5 = +[CHLogServer sharedInstance];
    v6 = [v5 logHandleForDomain:"ch.calldbm"];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[CallDBManager modelURL](v6);
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (void)setDataStoreType:(unsigned __int8)a3
{
  self->_dataStoreType = a3;
}

- (void)createDataStore
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  int v3 = [(CallDBManager *)v2 deviceObserver];
  int v4 = [v3 isBootLockEnabled];

  if (v4)
  {
    if ([(CallDBManager *)v2 shouldCreateTemporary])
    {
      BOOL v5 = [(CallDBManager *)v2 dbManager];
      v6 = [v5 fPersistentStoreCoordinator];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __32__CallDBManager_createDataStore__block_invoke;
      v17[3] = &unk_1E61C74A8;
      v17[4] = v2;
      [v6 performBlockAndWait:v17];

      v7 = +[CHLogServer sharedInstance];
      v8 = [v7 logHandleForDomain:"ch.calldbm"];

      uint64_t v9 = v8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = getBoolAsString([(CallDBManager *)v2 dataStoreType] == 0);
        *(_DWORD *)buf = 138543362;
        v19 = v10;
        _os_log_impl(&dword_1B8E4A000, v9, OS_LOG_TYPE_DEFAULT, "Initialized temporary data store: %{public}@", buf, 0xCu);
      }
LABEL_8:
    }
  }
  else if ([(CallDBManager *)v2 shouldCreatePermanent])
  {
    v11 = [(CallDBManager *)v2 dbManager];
    objc_super v12 = [v11 fPersistentStoreCoordinator];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __32__CallDBManager_createDataStore__block_invoke_42;
    v16[3] = &unk_1E61C74A8;
    v16[4] = v2;
    [v12 performBlockAndWait:v16];

    v13 = +[CHLogServer sharedInstance];
    v14 = [v13 logHandleForDomain:"ch.calldbm"];

    uint64_t v9 = v14;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = getBoolAsString([(CallDBManager *)v2 dataStoreType] == 1);
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      _os_log_impl(&dword_1B8E4A000, v9, OS_LOG_TYPE_DEFAULT, "Initialized permanent data store: %{public}@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  objc_sync_exit(v2);
}

- (id)createManagedObjectContext
{
  v2 = [(CallDBManager *)self dbManager];
  int v3 = [v2 createManagedObjectContext];

  return v3;
}

- (DBManager)dbManager
{
  return self->_dbManager;
}

- (BOOL)shouldCreatePermanent
{
  return ![(CallDBManager *)self dataStoreType]
      || [(CallDBManager *)self dataStoreType] == 2;
}

- (unsigned)dataStoreType
{
  return self->_dataStoreType;
}

- (CHDeviceObserver)deviceObserver
{
  return self->_deviceObserver;
}

uint64_t __32__CallDBManager_createDataStore__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) createTemporary];
}

- (void)createPermanent
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B8E4A000, v2, v3, "%{public}@ in a subclass is not overridden", v4, v5, v6, v7, v8);
}

- (BOOL)shouldCreateTemporary
{
  return [(CallDBManager *)self dataStoreType] == 2;
}

- (void)createTemporary
{
  uint64_t v3 = +[CHLogServer sharedInstance];
  uint64_t v4 = [v3 logHandleForDomain:"ch.calldbm"];

  uint64_t v5 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CallDBManager createPermanent](a2);
  }
}

- (id)tempDBLocation:(unsigned __int8 *)a3
{
  uint64_t v4 = +[CHLogServer sharedInstance];
  uint64_t v5 = [v4 logHandleForDomain:"ch.calldbm"];

  uint64_t v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[CallDBManager createPermanent](a2);
  }

  return 0;
}

- (id)permDBLocation:(unsigned __int8 *)a3
{
  uint64_t v4 = +[CHLogServer sharedInstance];
  uint64_t v5 = [v4 logHandleForDomain:"ch.calldbm"];

  uint64_t v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[CallDBManager createPermanent](a2);
  }

  return 0;
}

- (void)moveCallsFromTempDatabase
{
  uint64_t v3 = +[CHLogServer sharedInstance];
  uint64_t v4 = [v3 logHandleForDomain:"ch.calldbm"];

  uint64_t v5 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CallDBManager createPermanent](a2);
  }
}

+ (id)dataStoreName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"CallHistory", @"storedata"];
}

- (void)handleTemporaryCreated
{
}

- (void)didChangeBootLockEnabledForDeviceObserver:(id)a3
{
  id v7 = a3;
  [(CallDBManager *)self createDataStore];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(CallDBManager *)v4 deviceObserver];
  char v6 = [v5 isBootLockEnabled];

  if ((v6 & 1) == 0) {
    [(CallDBManager *)v4 setDeviceObserver:0];
  }
  objc_sync_exit(v4);
}

- (void)setDbManager:(id)a3
{
}

- (void)setNotifyDataStoreChangeReason:(unsigned __int8)a3
{
  self->_notifyDataStoreChangeReason = a3;
}

- (void)setDeviceObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceObserver, 0);
  objc_storeStrong((id *)&self->_dbManager, 0);
}

+ (void)modelURL
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B8E4A000, log, OS_LOG_TYPE_ERROR, "Bundle location not found", v1, 2u);
}

@end