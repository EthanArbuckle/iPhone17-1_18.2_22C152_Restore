@interface CADDatabaseConnectionPool
- (BOOL)performASAPWithConfiguration:(id)a3 databaseID:(int)a4 block:(id)a5;
- (BOOL)performWithConfiguration:(id)a3 priority:(unint64_t)a4 databaseID:(int)a5 block:(id)a6;
- (CADDatabaseConnectionPool)initWithOptions:(id)a3 manager:(id)a4;
- (id)_openDatabases;
- (id)_pools;
- (id)createConnectionForPool:(id)a3;
- (int)databaseRestoreGeneration;
- (unint64_t)numberOfClients;
- (void)_checkGenerationAndAuxDatabaseSequence:(BOOL *)a3;
- (void)addClient:(id)a3;
- (void)addCreatedAuxDatabase:(CalDatabase *)a3;
- (void)addDelegate:(id)a3;
- (void)databaseChangedExternally:(id)a3 auxDatabaseID:(int)a4;
- (void)dealloc;
- (void)forEachDelegate:(id)a3;
- (void)notifyDelegatesGenerationChanged;
- (void)performWithAllDatabasesWithConfiguration:(id)a3 priority:(unint64_t)a4 block:(id)a5;
- (void)prepareDatabase:(CalDatabase *)a3 forUseWithConfiguration:(id)a4;
- (void)purgeConnectionsLastUsedPriorTo:(unint64_t)a3 stats:(id *)a4;
- (void)removeClient:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)reportIntegrityErrors:(id)a3;
- (void)setupDatabase:(CalDatabase *)a3;
@end

@implementation CADDatabaseConnectionPool

- (BOOL)performWithConfiguration:(id)a3 priority:(unint64_t)a4 databaseID:(int)a5 block:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a6;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  if (a4 && !dispatch_workloop_is_current())
  {
    lowPriorityTasks = self->_lowPriorityTasks;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__CADDatabaseConnectionPool_performWithConfiguration_priority_databaseID_block___block_invoke;
    block[3] = &unk_1E624E8F0;
    v18 = &v20;
    block[4] = self;
    id v16 = v10;
    int v19 = v7;
    id v17 = v11;
    dispatch_async_and_wait(lowPriorityTasks, block);

    BOOL v12 = *((unsigned char *)v21 + 24) != 0;
  }
  else
  {
    BOOL v12 = [(CADDatabaseConnectionPool *)self performASAPWithConfiguration:v10 databaseID:v7 block:v11];
    *((unsigned char *)v21 + 24) = v12;
  }
  _Block_object_dispose(&v20, 8);

  return v12;
}

- (BOOL)performASAPWithConfiguration:(id)a3 databaseID:(int)a4 block:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(void, uint64_t))a5;
  os_unfair_lock_lock(&self->_lock);
  int v10 = *MEMORY[0x1E4F574B8];
  if (*MEMORY[0x1E4F574B8] == v6)
  {
    buf[0] = 0;
    [(CADDatabaseConnectionPool *)self _checkGenerationAndAuxDatabaseSequence:buf];
    if (buf[0])
    {
      os_unfair_lock_unlock(&self->_lock);
      [(CADDatabaseConnectionPool *)self notifyDelegatesGenerationChanged];
      os_unfair_lock_lock(&self->_lock);
    }
  }
  id v11 = [(CADDatabaseConnectionPool *)self _pools];
  BOOL v12 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
  v13 = [v11 objectForKeyedSubscript:v12];

  if (!v13)
  {
    os_unfair_lock_unlock(&self->_lock);
LABEL_12:
    BOOL v20 = 0;
    goto LABEL_23;
  }
  v26 = v9;
  id v14 = v8;
  v15 = [v13 connections];
  id v16 = [v15 lastObject];

  if (v16)
  {
    id v17 = [v13 connections];
    [v17 removeLastObject];
  }
  unint64_t v18 = [v13 lastChangeTimestamp];
  os_unfair_lock_unlock(&self->_lock);
  if (v16)
  {
    uint64_t v19 = [v16 database];
    if (v18 > CalDatabaseGetLastCacheInvalidationTimestamp()) {
      CalDatabaseReset();
    }
    id v8 = v14;
    goto LABEL_15;
  }
  v21 = [(CADDatabaseConnectionPool *)self createConnectionForPool:v13];
  id v8 = v14;
  if (!v21)
  {
    v25 = CADLogHandle;
    v9 = v26;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v28 = v6;
      _os_log_impl(&dword_1BBC88000, v25, OS_LOG_TYPE_ERROR, "Unable to create database connection for database ID %i", buf, 8u);
    }
    goto LABEL_12;
  }
  id v16 = v21;
  uint64_t v19 = [v21 database];
LABEL_15:
  v9 = v26;
  if (v8) {
    [(CADDatabaseConnectionPool *)self prepareDatabase:v19 forUseWithConfiguration:v8];
  }
  v26[2](v26, v19);
  uint64_t v22 = CalDatabaseCountCachedRecords();
  buf[0] = 0;
  if (v22 <= 60000)
  {
    os_unfair_lock_lock(&self->_lock);
    [v13 _returnConnectionToPool:v16];
    if (v10 == v6) {
      [(CADDatabaseConnectionPool *)self _checkGenerationAndAuxDatabaseSequence:buf];
    }
    os_unfair_lock_unlock(&self->_lock);
    if (buf[0]) {
      [(CADDatabaseConnectionPool *)self notifyDelegatesGenerationChanged];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  [WeakRetained schedulePurge];

  BOOL v20 = 1;
LABEL_23:

  return v20;
}

- (void)_checkGenerationAndAuxDatabaseSequence:(BOOL *)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_needCheckAuxDatabaseSequenceAndRestoreGeneration)
  {
    pools = self->_pools;
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:*MEMORY[0x1E4F574B8]];
    uint64_t v7 = [(NSMutableDictionary *)pools objectForKeyedSubscript:v6];

    id v8 = [v7 connections];
    v9 = [v8 lastObject];

    if (!v9)
    {
      uint64_t v10 = [(CADDatabaseConnectionPool *)self createConnectionForPool:v7];
      if (!v10)
      {
        id v16 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v17 = 0;
          _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_ERROR, "Could not open a connection to the Calendar database. Unable to perform generation check.", v17, 2u);
        }
        goto LABEL_12;
      }
      v9 = (void *)v10;
      [v7 _returnConnectionToPool:v10];
    }
    [v9 database];
    if (a3)
    {
      int databaseRestoreGeneration = self->_databaseRestoreGeneration;
      int RestoreGeneration = CalDatabaseGetRestoreGeneration();
      self->_int databaseRestoreGeneration = RestoreGeneration;
      *a3 = databaseRestoreGeneration != RestoreGeneration;
    }
    if (CalDatabaseGetAuxDatabaseChangesSequence() != self->_auxDatabaseSequence)
    {
      v13 = self->_pools;
      self->_pools = 0;

      if (a3)
      {
        if (!*a3)
        {
          int v14 = self->_databaseRestoreGeneration;
          id v15 = [(CADDatabaseConnectionPool *)self _pools];
          *a3 = self->_databaseRestoreGeneration != v14;
        }
      }
    }
    self->_needCheckAuxDatabaseSequenceAndint RestoreGeneration = 0;

LABEL_12:
  }
}

- (id)_pools
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  pools = self->_pools;
  if (!pools)
  {
    v4 = [(CADDatabaseConnectionPool *)self _openDatabases];
    v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v6 = self->_pools;
    self->_pools = v5;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
          uint64_t AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
          v13 = CalDatabaseCopyInitializationConfiguration();
          int v14 = [[CADSeparatedDatabasePool alloc] initWithConfig:v13 databaseID:AuxilliaryDatabaseID];
          id v15 = [[CADPooledConnection alloc] initWithDatabase:v11];
          [(CADSeparatedDatabasePool *)v14 _returnConnectionToPool:v15];
          id v16 = self->_pools;
          id v17 = [MEMORY[0x1E4F28ED0] numberWithInt:AuxilliaryDatabaseID];
          [(NSMutableDictionary *)v16 setObject:v14 forKeyedSubscript:v17];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    pools = self->_pools;
  }
  return pools;
}

- (void)prepareDatabase:(CalDatabase *)a3 forUseWithConfiguration:(id)a4
{
  id v4 = a4;
  v5 = [v4 clientName];
  CalDatabaseSetClientName();

  uint64_t v6 = [v4 clientIdentifier];
  CalDatabaseSetClientIdentifier();

  [v4 inMemoryChangeTrackingClientID];
  CalDatabaseSetInMemoryChangeTrackingID();
  [v4 enablePropertyModificationLogging];

  CalDatabaseSetPropertyModificationLoggingEnabled();
}

uint64_t __85__CADDatabaseConnectionPool_performWithAllDatabasesWithConfiguration_priority_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48), a2, *(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (id)createConnectionForPool:(id)a3
{
  id v4 = a3;
  v5 = [v4 config];
  uint64_t v6 = (const void *)CalDatabaseCreateWithConfiguration();

  if (v6)
  {
    [v4 databaseID];
    CalDatabaseSetAuxilliaryDatabaseID();
    [(CADDatabaseConnectionPool *)self setupDatabase:v6];
    uint64_t v7 = [[CADPooledConnection alloc] initWithDatabase:v6];
    CFRelease(v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)performWithAllDatabasesWithConfiguration:(id)a3 priority:(unint64_t)a4 block:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = [(CADDatabaseConnectionPool *)self _pools];
  uint64_t v11 = [v10 allKeys];

  os_unfair_lock_unlock(&self->_lock);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = [*(id *)(*((void *)&v26 + 1) + 8 * v14) intValue];
      uint64_t v22 = 0;
      long long v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __85__CADDatabaseConnectionPool_performWithAllDatabasesWithConfiguration_priority_block___block_invoke;
      v18[3] = &unk_1E624E918;
      id v16 = v9;
      int v21 = v15;
      id v19 = v16;
      long long v20 = &v22;
      [(CADDatabaseConnectionPool *)self performWithConfiguration:v8 priority:a4 databaseID:v15 block:v18];
      LOBYTE(v15) = *((unsigned char *)v23 + 24) == 0;

      _Block_object_dispose(&v22, 8);
      if ((v15 & 1) == 0) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)addClient:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_clients addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)setupDatabase:(CalDatabase *)a3
{
  [(CADDatabaseInitializationOptions *)self->_initOptions unitTesting];
  CalDatabaseSetIsUnitTesting();
  if ([(CADDatabaseInitializationOptions *)self->_initOptions unitTesting]) {
    CalDatabaseSetIntegrityErrorReportingDelegate();
  }
  [(CADDatabaseInitializationOptions *)self->_initOptions enablePropertyModificationLogging];
  CalDatabaseSetPropertyModificationLoggingEnabled();
}

- (int)databaseRestoreGeneration
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(CADDatabaseConnectionPool *)v2 _pools];
  LODWORD(v2) = v2->_databaseRestoreGeneration;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (void)addDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_delegates addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

uint64_t __80__CADDatabaseConnectionPool_performWithConfiguration_priority_databaseID_block___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) performASAPWithConfiguration:*(void *)(a1 + 40) databaseID:*(unsigned int *)(a1 + 64) block:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (CADDatabaseConnectionPool)initWithOptions:(id)a3 manager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CADDatabaseConnectionPool;
  id v9 = [(CADDatabaseConnectionPool *)&v18 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    dispatch_workloop_t v11 = dispatch_workloop_create("com.apple.calendar.daemon.low_priority");
    lowPriorityTasks = v10->_lowPriorityTasks;
    v10->_lowPriorityTasks = (OS_dispatch_workloop *)v11;

    objc_storeStrong((id *)&v10->_initOptions, a3);
    objc_storeWeak((id *)&v10->_manager, v8);
    uint64_t v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    clients = v10->_clients;
    v10->_clients = (NSHashTable *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v10->_delegates;
    v10->_delegates = (NSHashTable *)v15;
  }
  return v10;
}

- (void)dealloc
{
  [MEMORY[0x1E4F57460] cleanupDeallocatedClients];
  v3.receiver = self;
  v3.super_class = (Class)CADDatabaseConnectionPool;
  [(CADDatabaseConnectionPool *)&v3 dealloc];
}

- (void)addCreatedAuxDatabase:(CalDatabase *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  os_unfair_lock_lock(&self->_lock);
  if (self->_pools)
  {
    uint64_t v6 = [[CADPooledConnection alloc] initWithDatabase:a3];
    [(CADDatabaseConnectionPool *)self setupDatabase:a3];
    pools = self->_pools;
    id v8 = [MEMORY[0x1E4F28ED0] numberWithInt:AuxilliaryDatabaseID];
    id v9 = [(NSMutableDictionary *)pools objectForKeyedSubscript:v8];

    if (!v9)
    {
      uint64_t v10 = CalDatabaseCopyInitializationConfiguration();
      id v9 = [[CADSeparatedDatabasePool alloc] initWithConfig:v10 databaseID:AuxilliaryDatabaseID];
      dispatch_workloop_t v11 = self->_pools;
      uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithInt:AuxilliaryDatabaseID];
      [(NSMutableDictionary *)v11 setObject:v9 forKeyedSubscript:v12];
    }
    long long v23 = v9;
    uint64_t v24 = v6;
    [(CADSeparatedDatabasePool *)v9 _returnConnectionToPool:v6];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableDictionary count](self->_pools, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v14 = self->_pools;
    uint64_t v15 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          long long v20 = [(NSMutableDictionary *)self->_pools objectForKeyedSubscript:v19];
          int v21 = [v20 databasePath];
          if (v21)
          {
            [v13 addObject:v21];
          }
          else
          {
            uint64_t v22 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v30 = v19;
              _os_log_impl(&dword_1BBC88000, v22, OS_LOG_TYPE_ERROR, "Unexpectedly encountered nil path for database with id %{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v16 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v16);
    }

    [MEMORY[0x1E4F57460] setInterestedDatabasePaths:v13 forContext:self];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)removeDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_delegates removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)databaseChangedExternally:(id)a3 auxDatabaseID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v4 != -1)
  {
    pools = self->_pools;
    id v8 = [MEMORY[0x1E4F28ED0] numberWithInt:v4];
    id v9 = [(NSMutableDictionary *)pools objectForKeyedSubscript:v8];

    uint64_t v10 = [(NSMutableDictionary *)v9 databasePath];
    int v11 = [v6 isEqualToString:v10];

    if (v11)
    {
      uint64_t v12 = v9;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = self->_pools;
  uint64_t v13 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v13)
  {
LABEL_12:
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v25;
LABEL_6:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v25 != v15) {
      objc_enumerationMutation(v9);
    }
    uint64_t v12 = [(NSMutableDictionary *)self->_pools objectForKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * v16)];
    uint64_t v17 = [(NSMutableDictionary *)v12 databasePath];
    char v18 = [v6 isEqualToString:v17];

    if (v18) {
      break;
    }

    if (v14 == ++v16)
    {
      uint64_t v14 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
LABEL_13:

  if (v12)
  {
    [(NSMutableDictionary *)v12 setLastChangeTimestamp:CalMonotonicTime()];
    int v19 = [(NSMutableDictionary *)v12 databaseID];
    int v20 = *MEMORY[0x1E4F574B8];
    int v21 = [(NSMutableDictionary *)v12 connections];
    uint64_t v22 = [v21 count];

    char v23 = 0;
    if (v19 == v20)
    {
      self->_needCheckAuxDatabaseSequenceAndint RestoreGeneration = 1;
      if (v22) {
        [(CADDatabaseConnectionPool *)self _checkGenerationAndAuxDatabaseSequence:&v23];
      }
    }
  }
  else
  {
    char v23 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v23) {
    [(CADDatabaseConnectionPool *)self notifyDelegatesGenerationChanged];
  }
}

- (id)_openDatabases
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  objc_super v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    initOptions = self->_initOptions;
    *(_DWORD *)buf = 138412290;
    *(void *)v47 = initOptions;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_DEBUG, "Creating database with options [%@]", buf, 0xCu);
  }
  id v5 = objc_alloc(MEMORY[0x1E4F57468]);
  id v6 = [(CADDatabaseInitializationOptions *)self->_initOptions databaseDirectory];
  id v7 = (void *)[v5 initWithDirectoryURL:v6];

  objc_msgSend(v7, "setOptions:", -[CADDatabaseInitializationOptions databaseInitOptions](self->_initOptions, "databaseInitOptions"));
  id v8 = [(CADDatabaseInitializationOptions *)self->_initOptions calendarDataContainerProvider];
  if (v8) {
    [v7 setDataContainerProvider:v8];
  }
  uint64_t v9 = CalDatabaseCreateWithConfiguration();
  if (v9)
  {
    uint64_t v10 = (const void *)v9;
    v35 = v8;
    v36 = v7;
    self->_auxDatabaseSequence = CalDatabaseGetAuxDatabaseChangesSequence();
    self->_int databaseRestoreGeneration = CalDatabaseGetRestoreGeneration();
    int v11 = (void *)CalDatabaseCopyAllAuxDatabases();
    uint64_t v12 = [v11 count];
    uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v12 + 1];
    [v13 addObject:v10];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(v14);
          }
          [(CADDatabaseInitializationOptions *)self->_initOptions databaseInitOptions];
          uint64_t v19 = CalDatabaseCreateWithAuxDatabaseRef();
          if (v19)
          {
            int v20 = (const void *)v19;
            [v13 addObject:v19];
            CFRelease(v20);
          }
          else
          {
            int v21 = (void *)CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
            {
              uint64_t v22 = v21;
              int UID = CalAuxDatabaseGetUID();
              long long v24 = [(CADDatabaseInitializationOptions *)self->_initOptions databaseDirectory];
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v47 = UID;
              *(_WORD *)&v47[4] = 2112;
              *(void *)&v47[6] = v24;
              _os_log_impl(&dword_1BBC88000, v22, OS_LOG_TYPE_ERROR, "Unable to create auxiliary database %i with main database path %@", buf, 0x12u);
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v16);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v25 = v13;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v38 != v28) {
            objc_enumerationMutation(v25);
          }
          -[CADDatabaseConnectionPool setupDatabase:](self, "setupDatabase:", *(void *)(*((void *)&v37 + 1) + 8 * j), v35, v36);
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v27);
    }

    CFRelease(v10);
    [MEMORY[0x1E4F57460] setInterestedDatabases:v25 forContext:self];

    id v8 = v35;
    id v7 = v36;
  }
  else
  {
    uint64_t v30 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = self->_initOptions;
      uint64_t v32 = v30;
      v33 = [(CADDatabaseInitializationOptions *)v31 databaseDirectory];
      *(_DWORD *)buf = 138412290;
      *(void *)v47 = v33;
      _os_log_impl(&dword_1BBC88000, v32, OS_LOG_TYPE_ERROR, "Unable to create main database for path %@", buf, 0xCu);
    }
    id v25 = 0;
  }

  return v25;
}

- (void)forEachDelegate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSHashTable *)self->_delegates allObjects];
  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)notifyDelegatesGenerationChanged
{
}

uint64_t __61__CADDatabaseConnectionPool_notifyDelegatesGenerationChanged__block_invoke(uint64_t a1, void *a2)
{
  return [a2 restoreGenerationChangedExternally];
}

- (void)removeClient:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_clients removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)numberOfClients
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_clients;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = v4;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        --v7;
      }
      while (v7);
      v5 += v4;
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)reportIntegrityErrors:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__CADDatabaseConnectionPool_reportIntegrityErrors___block_invoke;
  v6[3] = &unk_1E624E960;
  id v7 = v4;
  id v5 = v4;
  [(CADDatabaseConnectionPool *)self forEachDelegate:v6];
}

uint64_t __51__CADDatabaseConnectionPool_reportIntegrityErrors___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reportIntegrityErrors:*(void *)(a1 + 32)];
}

- (void)purgeConnectionsLastUsedPriorTo:(unint64_t)a3 stats:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = self->_pools;
  uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pools, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * v12), (void)v14);
        [v13 purgeConnectionsLastUsedPriorTo:a3 stats:a4];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_pools, 0);
  objc_storeStrong((id *)&self->_lowPriorityTasks, 0);
  objc_storeStrong((id *)&self->_initOptions, 0);
  objc_destroyWeak((id *)&self->_manager);
}

@end