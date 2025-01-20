@interface CADDatabaseSingleConnectionProvider
- (BOOL)performWithConfiguration:(id)a3 priority:(unint64_t)a4 databaseID:(int)a5 block:(id)a6;
- (CADDatabaseSingleConnectionProvider)initWithConfiguration:(id)a3;
- (id)_databases;
- (int)databaseRestoreGeneration;
- (void)_closeDatabases;
- (void)_databaseRestoreGenerationChanged:(int)a3;
- (void)_prepareDatabase:(CalDatabase *)a3 withConfiguration:(id)a4;
- (void)addCreatedAuxDatabase:(CalDatabase *)a3;
- (void)addDelegate:(id)a3;
- (void)closeDatabases;
- (void)database:(CalDatabase *)a3 restoreGenerationChangedExternally:(int)a4;
- (void)databaseRestoreGenerationChanged:(int)a3;
- (void)dealloc;
- (void)performWithAllDatabasesWithConfiguration:(id)a3 priority:(unint64_t)a4 block:(id)a5;
- (void)removeDelegate:(id)a3;
- (void)reportIntegrityErrors:(id)a3;
- (void)validateAuxDatabases;
@end

@implementation CADDatabaseSingleConnectionProvider

- (CADDatabaseSingleConnectionProvider)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADDatabaseSingleConnectionProvider;
  v6 = [(CADDatabaseSingleConnectionProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_initOptions, a3);
  }

  return v7;
}

- (void)dealloc
{
  [MEMORY[0x1E4F57460] cleanupDeallocatedClients];
  v3.receiver = self;
  v3.super_class = (Class)CADDatabaseSingleConnectionProvider;
  [(CADDatabaseSingleConnectionProvider *)&v3 dealloc];
}

- (void)_prepareDatabase:(CalDatabase *)a3 withConfiguration:(id)a4
{
  id v4 = a4;
  id v5 = [v4 clientIdentifier];
  CalDatabaseSetClientIdentifier();

  v6 = [v4 clientName];
  CalDatabaseSetClientName();

  [v4 inMemoryChangeTrackingClientID];
  CalDatabaseSetInMemoryChangeTrackingID();
}

- (BOOL)performWithConfiguration:(id)a3 priority:(unint64_t)a4 databaseID:(int)a5 block:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  v10 = (void (**)(id, void *))a6;
  os_unfair_lock_lock(&self->_lock);
  v11 = [(CADDatabaseSingleConnectionProvider *)self _databases];
  v12 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
  v13 = [v11 objectForKeyedSubscript:v12];

  if (v13)
  {
    CFRetain(v13);
    os_unfair_lock_unlock(&self->_lock);
    [(CADDatabaseSingleConnectionProvider *)self _prepareDatabase:v13 withConfiguration:v9];
    v10[2](v10, v13);
    CFRelease(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  return v13 != 0;
}

- (void)performWithAllDatabasesWithConfiguration:(id)a3 priority:(unint64_t)a4 block:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, uint64_t, void *, unsigned char *))a5;
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(CADDatabaseSingleConnectionProvider *)self _databases];
  v10 = (void *)[v9 copy];

  os_unfair_lock_unlock(&self->_lock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v21 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
      uint64_t v17 = [v16 intValue];
      v18 = [v11 objectForKeyedSubscript:v16];

      [(CADDatabaseSingleConnectionProvider *)self _prepareDatabase:v18 withConfiguration:v7];
      char v19 = 0;
      v8[2](v8, v17, v18, &v19);
      if (v19) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v13) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (int)databaseRestoreGeneration
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(CADDatabaseSingleConnectionProvider *)v2 _databases];
  LODWORD(v2) = v2->_databaseRestoreGeneration;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (void)_databaseRestoreGenerationChanged:(int)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_DEFAULT, "Database restore generation changed to %d", (uint8_t *)v6, 8u);
  }
  self->_databaseRestoreGeneration = a3;
}

- (void)databaseRestoreGenerationChanged:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(CADDatabaseSingleConnectionProvider *)self _databaseRestoreGenerationChanged:v3];
  os_unfair_lock_unlock(p_lock);
}

- (void)addCreatedAuxDatabase:(CalDatabase *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_databases)
  {
    uint64_t AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
    databases = self->_databases;
    v8 = [MEMORY[0x1E4F28ED0] numberWithInt:AuxilliaryDatabaseID];
    id v9 = [(NSMutableDictionary *)databases objectForKeyedSubscript:v8];

    if (v9)
    {
      v10 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
      {
        v16[0] = 67109120;
        v16[1] = AuxilliaryDatabaseID;
        _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_INFO, "Ignoring attempt to add a database already known to the connection (id = %d)", (uint8_t *)v16, 8u);
      }
    }
    else
    {
      uint64_t v12 = self->_databases;
      uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithInt:AuxilliaryDatabaseID];
      [(NSMutableDictionary *)v12 setObject:a3 forKeyedSubscript:v13];

      uint64_t v14 = (void *)MEMORY[0x1E4F57460];
      uint64_t v15 = [(NSMutableDictionary *)self->_databases allValues];
      [v14 setInterestedDatabases:v15 forContext:self];
    }
  }
  else
  {
    id v11 = [(CADDatabaseSingleConnectionProvider *)self _databases];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)validateAuxDatabases
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  databases = self->_databases;
  if (databases)
  {
    id v5 = [MEMORY[0x1E4F28ED0] numberWithInt:*MEMORY[0x1E4F574B8]];
    [(NSMutableDictionary *)databases objectForKeyedSubscript:v5];

    if (CalDatabaseGetAuxDatabaseChangesSequence() != self->_auxDatabaseSequence) {
      [(CADDatabaseSingleConnectionProvider *)self _closeDatabases];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)_databases
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  databases = self->_databases;
  if (!databases)
  {
    id v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      initOptions = self->_initOptions;
      *(_DWORD *)buf = 138412290;
      *(void *)v56 = initOptions;
      _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_DEBUG, "Creating database with options [%@]", buf, 0xCu);
    }
    id v6 = objc_alloc(MEMORY[0x1E4F57468]);
    uint64_t v7 = [(CADDatabaseInitializationOptions *)self->_initOptions databaseDirectory];
    v8 = (void *)[v6 initWithDirectoryURL:v7];

    objc_msgSend(v8, "setOptions:", -[CADDatabaseInitializationOptions databaseInitOptions](self->_initOptions, "databaseInitOptions"));
    id v9 = [(CADDatabaseInitializationOptions *)self->_initOptions calendarDataContainerProvider];
    if (v9) {
      [v8 setDataContainerProvider:v9];
    }
    uint64_t v10 = CalDatabaseCreateWithConfiguration();
    if (v10)
    {
      id v11 = (const void *)v10;
      v44 = v9;
      v45 = v8;
      self->_auxDatabaseSequence = CalDatabaseGetAuxDatabaseChangesSequence();
      uint64_t v12 = (void *)CalDatabaseCopyAllAuxDatabases();
      uint64_t v13 = [v12 count];
      uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v13 + 1];
      uint64_t v15 = self->_databases;
      self->_databases = v14;

      v16 = self->_databases;
      uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithInt:*MEMORY[0x1E4F574B8]];
      [(NSMutableDictionary *)v16 setObject:v11 forKeyedSubscript:v17];

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v18 = v12;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v50 objects:v57 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v51 != v21) {
              objc_enumerationMutation(v18);
            }
            [(CADDatabaseInitializationOptions *)self->_initOptions databaseInitOptions];
            uint64_t v23 = CalDatabaseCreateWithAuxDatabaseRef();
            if (v23)
            {
              v24 = (const void *)v23;
              uint64_t v25 = self->_databases;
              v26 = [MEMORY[0x1E4F28ED0] numberWithInt:CalDatabaseGetAuxilliaryDatabaseID()];
              [(NSMutableDictionary *)v25 setObject:v24 forKeyedSubscript:v26];

              CFRelease(v24);
            }
            else
            {
              v27 = (void *)CADLogHandle;
              if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
              {
                v28 = v27;
                int UID = CalAuxDatabaseGetUID();
                v30 = [(CADDatabaseInitializationOptions *)self->_initOptions databaseDirectory];
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v56 = UID;
                *(_WORD *)&v56[4] = 2112;
                *(void *)&v56[6] = v30;
                _os_log_impl(&dword_1BBC88000, v28, OS_LOG_TYPE_ERROR, "Unable to create auxiliary database %i with main database path %@", buf, 0x12u);
              }
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v50 objects:v57 count:16];
        }
        while (v20);
      }

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v31 = self->_databases;
      uint64_t v32 = [(NSMutableDictionary *)v31 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v47;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v47 != v34) {
              objc_enumerationMutation(v31);
            }
            -[NSMutableDictionary objectForKeyedSubscript:](self->_databases, "objectForKeyedSubscript:", *(void *)(*((void *)&v46 + 1) + 8 * j), v44, v45);

            [(CADDatabaseInitializationOptions *)self->_initOptions unitTesting];
            CalDatabaseSetIsUnitTesting();
            if ([(CADDatabaseInitializationOptions *)self->_initOptions unitTesting]) {
              CalDatabaseSetIntegrityErrorReportingDelegate();
            }
            [(CADDatabaseInitializationOptions *)self->_initOptions enablePropertyModificationLogging];
            CalDatabaseSetPropertyModificationLoggingEnabled();
          }
          uint64_t v33 = [(NSMutableDictionary *)v31 countByEnumeratingWithState:&v46 objects:v54 count:16];
        }
        while (v33);
      }

      self->_databaseRestoreGeneration = CalDatabaseSetRestoreGenerationChangedDelegate();
      v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v36 addObserver:self selector:sel_handleDatabaseChangedExternally name:*MEMORY[0x1E4F574F0] object:v11];

      CFRelease(v11);
      v37 = (void *)MEMORY[0x1E4F57460];
      v38 = [(NSMutableDictionary *)self->_databases allValues];
      [v37 setInterestedDatabases:v38 forContext:self];

      id v9 = v44;
      v8 = v45;
    }
    else
    {
      v39 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v40 = self->_initOptions;
        v41 = v39;
        v42 = [(CADDatabaseInitializationOptions *)v40 databaseDirectory];
        *(_DWORD *)buf = 138412290;
        *(void *)v56 = v42;
        _os_log_impl(&dword_1BBC88000, v41, OS_LOG_TYPE_ERROR, "Unable to create main database for path %@", buf, 0xCu);
      }
    }

    databases = self->_databases;
  }
  return databases;
}

- (void)closeDatabases
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_databases)
  {
    id v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_DEBUG, "Closing the databases prematurely because we were explicitly asked to.", v5, 2u);
    }
    [(CADDatabaseSingleConnectionProvider *)self _closeDatabases];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_closeDatabases
{
  os_unfair_lock_assert_owner(&self->_lock);
  databases = self->_databases;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInt:*MEMORY[0x1E4F574B8]];
  id v5 = [(NSMutableDictionary *)databases objectForKeyedSubscript:v4];

  if (v5) {
    CalDatabaseClearRestoreGenerationChangedDelegate();
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F574F0] object:0];

  uint64_t v7 = self->_databases;
  self->_databases = 0;
}

- (void)reportIntegrityErrors:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained reportIntegrityErrors:v4];
}

- (void)database:(CalDatabase *)a3 restoreGenerationChangedExternally:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  databases = self->_databases;
  id v9 = [MEMORY[0x1E4F28ED0] numberWithInt:*MEMORY[0x1E4F574B8]];
  uint64_t v10 = [(NSMutableDictionary *)databases objectForKeyedSubscript:v9];

  if (v10 == a3)
  {
    [(CADDatabaseSingleConnectionProvider *)self _databaseRestoreGenerationChanged:v4];
    os_unfair_lock_unlock(p_lock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained restoreGenerationChangedExternally];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)addDelegate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained != v4)
    {
      v8 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412546;
        uint64_t v10 = v7;
        __int16 v11 = 2112;
        id v12 = v4;
        _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_ERROR, "Only a single delegate is supported by single connection pools. Current delegate = %@, new delegate = %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  else
  {
    objc_storeWeak((id *)p_delegate, v4);
  }
}

- (void)removeDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained == v4)
  {
    objc_storeWeak((id *)p_delegate, 0);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_databases, 0);
  objc_storeStrong((id *)&self->_initOptions, 0);
}

@end