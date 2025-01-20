@interface AnalyticsWorkspace
+ (AnalyticsWorkspace)workspaceWithName:(id)a3 atPath:(id)a4 objectModelName:(id)a5 objectModelBundle:(id)a6 useReadOnly:(BOOL)a7;
+ (AnalyticsWorkspace)workspaceWithName:(id)a3 atPath:(id)a4 useReadOnly:(BOOL)a5;
+ (id)defaultWorkspace;
+ (void)initialize;
- (AnalyticsWorkspaceHealthDelegate)healthDelegate;
- (BOOL)_primePath:(id)a3;
- (BOOL)canCloneObjectsOfType:(id)a3;
- (BOOL)forceDeleteFile;
- (BOOL)forceDestroyPersistentStore;
- (BOOL)forceIntegrityCheck;
- (BOOL)integrityCheckFailed;
- (BOOL)persistent;
- (BOOL)save;
- (BOOL)setCustomPersistenceProperties:(id)a3;
- (NSBundle)objectModelResidentBundle;
- (NSError)persistentStoreError;
- (NSManagedObjectContext)mainObjectContext;
- (NSManagedObjectModel)objectModel;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSString)objectModelName;
- (NSXPCConnection)connection;
- (id)_cloneInternal:(id)a3 intoWorkspace:(id)a4 ancestry:(id)a5 iteration:(unint64_t)a6 mustFail:(BOOL *)a7;
- (id)_initWithName:(id)a3 inMemory:(BOOL)a4 useReadOnly:(BOOL)a5 customModelName:(id)a6 loadModelFromBundle:(id)a7;
- (id)cloneObject:(id)a3 intoWorkspace:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createNewContext;
- (id)initInMemoryWorkspaceWithName:(id)a3 customModelName:(id)a4 objectModelBundle:(id)a5;
- (id)initWorkspaceWithName:(id)a3 atPath:(id)a4 objectModelName:(id)a5 objectModelBundle:(id)a6 useReadOnly:(BOOL)a7;
- (id)initWorkspaceWithName:(id)a3 atPath:(id)a4 useReadOnly:(BOOL)a5;
- (id)resetCompletionBlock;
- (void)dealloc;
- (void)enumerateResidentObjectsOfType:(id)a3 usingBlock:(id)a4;
- (void)reset;
- (void)setForceDeleteFile:(BOOL)a3;
- (void)setForceDestroyPersistentStore:(BOOL)a3;
- (void)setForceIntegrityCheck:(BOOL)a3;
- (void)setHealthDelegate:(id)a3;
- (void)setObjectModelName:(id)a3;
- (void)setObjectModelResidentBundle:(id)a3;
- (void)setPersistentStoreError:(id)a3;
- (void)setResetCompletionBlock:(id)a3;
@end

@implementation AnalyticsWorkspace

+ (void)initialize
{
  registry = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);

  MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  connection = self->__connection;
  if (connection)
  {
    [(NSXPCConnection *)connection invalidate];
    v4 = self->__connection;
    self->__connection = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AnalyticsWorkspace;
  [(AnalyticsWorkspace *)&v5 dealloc];
}

- (id)_initWithName:(id)a3 inMemory:(BOOL)a4 useReadOnly:(BOOL)a5 customModelName:(id)a6 loadModelFromBundle:(id)a7
{
  BOOL v10 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v13 = a3;
  v14 = (__CFString *)a6;
  id v15 = a7;
  v31.receiver = self;
  v31.super_class = (Class)AnalyticsWorkspace;
  v16 = [(AnalyticsWorkspace *)&v31 init];
  if (v16)
  {
    id v30 = v13;
    uint64_t v17 = [(__CFString *)v14 length];
    v18 = (id *)MEMORY[0x263EFF000];
    if (!v10) {
      v18 = (id *)MEMORY[0x263EFF168];
    }
    id v19 = *v18;
    v20 = (id *)MEMORY[0x263F08098];
    if (!v17) {
      v20 = (id *)MEMORY[0x263F080B0];
    }
    id v21 = *v20;
    v22 = objectanalyticsHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = @"DAEMON";
      if (!v17) {
        v23 = @"LEGACY";
      }
      *(_DWORD *)buf = 138412290;
      v33 = v23;
      _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_DEFAULT, "AnalyticsWorkspace is running in %@ MODE", buf, 0xCu);
    }

    id v24 = v19;
    id v25 = v21;
    objc_storeStrong((id *)&v16->storeKind, v19);
    objc_storeStrong((id *)&v16->storeProt, v21);
    objc_storeStrong((id *)&v16->backingStore, a3);
    v16->readOnly = a5;
    v16->pathKnownToFail = 0;
    if (v17) {
      v26 = v14;
    }
    else {
      v26 = @"SymptomAnalyticsLegacy";
    }
    objc_storeStrong((id *)&v16->_objectModelName, v26);
    if (v15)
    {
      v27 = (NSBundle *)v15;
    }
    else
    {
      v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    }
    objectModelResidentBundle = v16->_objectModelResidentBundle;
    v16->_objectModelResidentBundle = v27;

    v16->__persistent = 1;
    id v13 = v30;
  }

  return v16;
}

- (id)initInMemoryWorkspaceWithName:(id)a3 customModelName:(id)a4 objectModelBundle:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[AnalyticsWorkspace alloc] _initWithName:v10 inMemory:1 useReadOnly:0 customModelName:v9 loadModelFromBundle:v8];

  return v11;
}

+ (AnalyticsWorkspace)workspaceWithName:(id)a3 atPath:(id)a4 useReadOnly:(BOOL)a5
{
  return +[AnalyticsWorkspace workspaceWithName:a3 atPath:a4 objectModelName:0 objectModelBundle:0 useReadOnly:a5];
}

+ (AnalyticsWorkspace)workspaceWithName:(id)a3 atPath:(id)a4 objectModelName:(id)a5 objectModelBundle:(id)a6 useReadOnly:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v20 = 0;
  int v15 = assembleFullName(v11, v12, &v20);
  id v16 = v20;
  id v17 = 0;
  if (v15)
  {
    id v18 = (id)registry;
    objc_sync_enter(v18);
    id v17 = [(id)registry objectForKey:v16];
    if (!v17)
    {
      id v17 = [[AnalyticsWorkspace alloc] _initWithName:v16 inMemory:0 useReadOnly:v7 customModelName:v13 loadModelFromBundle:v14];
      [(id)registry setObject:v17 forKey:v16];
    }
    objc_sync_exit(v18);
  }

  return (AnalyticsWorkspace *)v17;
}

+ (id)defaultWorkspace
{
  return +[AnalyticsWorkspace workspaceWithName:0 atPath:0 useReadOnly:0];
}

- (id)initWorkspaceWithName:(id)a3 atPath:(id)a4 useReadOnly:(BOOL)a5
{
  return [(AnalyticsWorkspace *)self initWorkspaceWithName:a3 atPath:a4 objectModelName:0 objectModelBundle:0 useReadOnly:a5];
}

- (id)initWorkspaceWithName:(id)a3 atPath:(id)a4 objectModelName:(id)a5 objectModelBundle:(id)a6 useReadOnly:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a5;
  id v13 = a6;
  id v18 = 0;
  int v14 = assembleFullName(a3, a4, &v18);
  id v15 = v18;
  if (v14)
  {
    self = (AnalyticsWorkspace *)[(AnalyticsWorkspace *)self _initWithName:v15 inMemory:0 useReadOnly:v7 customModelName:v12 loadModelFromBundle:v13];
    id v16 = self;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (BOOL)setCustomPersistenceProperties:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"PersistentWorkspace"];
  if (!v4) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v7 = objectanalyticsHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = 0;
      id v8 = "Invalid value for persistent key";
      id v9 = (uint8_t *)&v11;
LABEL_11:
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
    }
LABEL_12:

LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  char v5 = [v4 BOOLValue];
  if ((v5 & 1) == 0 && (self->__persistentStoreCoordinator || self->__mainObjectContext))
  {
    BOOL v7 = objectanalyticsHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v8 = "Requesting non-persistent but the workspace already has a PersistentStoreCoordinator and/or a MainObjectContext";
      id v9 = buf;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  self->__persistent = v5;
  BOOL v6 = 1;
LABEL_14:

  return v6;
}

- (NSManagedObjectModel)objectModel
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (self->__persistent)
  {
    p_objectModel = &self->__objectModel;
    objectModel = self->__objectModel;
    if (objectModel)
    {
      char v5 = objectModel;
    }
    else
    {
      BOOL v6 = objectanalyticsHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [(AnalyticsWorkspace *)self objectModelName];
        uint64_t v8 = [v7 UTF8String];
        id v9 = [(AnalyticsWorkspace *)self objectModelResidentBundle];
        id v10 = [v9 bundlePath];
        int v22 = 136315394;
        uint64_t v23 = v8;
        __int16 v24 = 2080;
        uint64_t v25 = [v10 UTF8String];
        _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "Loading object model %s.momd from bundle at %s", (uint8_t *)&v22, 0x16u);
      }
      __int16 v11 = [(AnalyticsWorkspace *)self objectModelResidentBundle];
      id v12 = [(AnalyticsWorkspace *)self objectModelName];
      id v13 = [v11 pathForResource:v12 ofType:@"momd"];

      if (v13)
      {
        int v14 = [NSURL fileURLWithPath:v13];
        id v15 = (void *)[objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v14];
        objc_storeStrong((id *)p_objectModel, v15);
        id v16 = objectanalyticsHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 138412290;
          uint64_t v23 = (uint64_t)v14;
          _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_DEFAULT, "Loaded object model from URL %@", (uint8_t *)&v22, 0xCu);
        }
      }
      else
      {
        int v14 = objectanalyticsHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v17 = [(AnalyticsWorkspace *)self objectModelName];
          int v22 = 138412290;
          uint64_t v23 = (uint64_t)v17;
          _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_ERROR, "Did not find path for object model %@", (uint8_t *)&v22, 0xCu);
        }
        id v15 = 0;
      }

      id v18 = *p_objectModel;
      if (!*p_objectModel)
      {
        id v19 = objectanalyticsHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v20 = [(AnalyticsWorkspace *)self objectModelName];
          int v22 = 138412290;
          uint64_t v23 = (uint64_t)v20;
          _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_ERROR, "Couldn't match expected object model %@", (uint8_t *)&v22, 0xCu);
        }
        id v18 = *p_objectModel;
      }
      char v5 = v18;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v3 = (id)registry;
  objc_sync_enter(v3);
  if (!self->__persistent) {
    goto LABEL_53;
  }
  persistentStoreCoordinator = self->__persistentStoreCoordinator;
  if (persistentStoreCoordinator)
  {
LABEL_51:
    id v30 = persistentStoreCoordinator;
    goto LABEL_54;
  }
  location = (id *)&self->__persistentStoreCoordinator;
  if (!self->__connection
    && self->storeKind != (NSString *)*MEMORY[0x263EFF000]
    && ![(AnalyticsWorkspace *)self _primePath:self->backingStore])
  {
    BOOL v6 = 0;
LABEL_50:

    persistentStoreCoordinator = (NSPersistentStoreCoordinator *)*location;
    goto LABEL_51;
  }
  v70 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->__connection)
  {
    char v5 = 0;
    v69 = 0;
  }
  else
  {
    id v7 = objectanalyticsHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      backingStore = self->backingStore;
      id v9 = "-only";
      if (!self->readOnly) {
        id v9 = "/write";
      }
      *(_DWORD *)buf = 138412546;
      v78 = (NSError *)backingStore;
      __int16 v79 = 2080;
      v80 = v9;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "opening backingstore %@, read%s", buf, 0x16u);
    }

    v69 = [NSURL fileURLWithPath:self->backingStore];
    [v70 addEntriesFromDictionary:&unk_26BDF53A8];
    id v10 = NSDictionary;
    storeProt = self->storeProt;
    id v12 = [NSNumber numberWithBool:1];
    id v13 = [NSNumber numberWithBool:1];
    if (self->readOnly) {
      [NSNumber numberWithBool:1];
    }
    else {
    int v14 = [MEMORY[0x263EFF9D0] null];
    }
    BOOL readOnly = self->readOnly;
    if (self->readOnly)
    {
      id v16 = (void *)*MEMORY[0x263EFF138];
    }
    else
    {
      id v16 = [MEMORY[0x263EFF9D0] null];
    }
    char v5 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v70, *MEMORY[0x263EFF160], storeProt, *MEMORY[0x263EFF0E0], v12, *MEMORY[0x263EFF070], v13, *MEMORY[0x263EFF008], v14, v16, 0);
    if (!readOnly) {
  }
    }
  id v17 = [(AnalyticsWorkspace *)self objectModel];
  if (v17)
  {
    self->_integrityCheckFailed = 0;
    id v18 = objc_alloc(MEMORY[0x263EFF320]);
    id v19 = [(AnalyticsWorkspace *)self objectModel];
    BOOL v6 = (void *)[v18 initWithManagedObjectModel:v19];

    if (v6)
    {
      if (self->_forceIntegrityCheck)
      {
        id v20 = objectanalyticsHandle();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_37;
        }
        *(_WORD *)buf = 0;
        id v21 = "DATA INTEGRITY: forceIntegrityCheck is true";
        int v22 = v20;
        os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      }
      else
      {
        id v20 = objectanalyticsHandle();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_37;
        }
        *(_WORD *)buf = 0;
        id v21 = "forceIntegrityCheck is false";
        int v22 = v20;
        os_log_type_t v23 = OS_LOG_TYPE_DEBUG;
      }
      _os_log_impl(&dword_209DBA000, v22, v23, v21, buf, 2u);
LABEL_37:

      if (self->_forceIntegrityCheck)
      {
        v28 = 0;
        BOOL forceIntegrityCheck = 1;
        goto LABEL_46;
      }
      if (self->_forceDestroyPersistentStore)
      {
        v28 = 0;
      }
      else
      {
        if (self->_forceDeleteFile)
        {
          v28 = 0;
        }
        else
        {
          storeKind = self->storeKind;
          id v76 = 0;
          v38 = [v6 addPersistentStoreWithType:storeKind configuration:0 URL:v69 options:v5 error:&v76];
          v28 = (NSError *)v76;

          if (!v38)
          {
            v46 = objectanalyticsHandle();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v78 = v28;
              _os_log_impl(&dword_209DBA000, v46, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: addPersistentStoreWithType failed because %@. Will check integrity.", buf, 0xCu);
            }

            BOOL forceIntegrityCheck = 1;
            self->_BOOL forceIntegrityCheck = 1;
            goto LABEL_46;
          }
          objc_storeStrong(location, v6);
          BOOL forceIntegrityCheck = self->_forceIntegrityCheck;
          if (self->_forceIntegrityCheck)
          {
LABEL_46:
            if (!self->__connection && !self->readOnly && self->storeKind != (NSString *)*MEMORY[0x263EFF000])
            {
              BOOL forceDestroyPersistentStore = self->_forceDestroyPersistentStore;
              BOOL forceDeleteFile = self->_forceDeleteFile;
              *(_WORD *)&self->_BOOL forceIntegrityCheck = 0;
              self->_BOOL forceDeleteFile = 0;
              if (forceDeleteFile)
              {
                uint64_t v34 = objectanalyticsHandle();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_209DBA000, v34, OS_LOG_TYPE_ERROR, "DATA LOSS: Have been instructed to delete persistent store.", buf, 2u);
                }

                v35 = [MEMORY[0x263F08850] defaultManager];
                v73 = v28;
                uint64_t v36 = [v35 removeItemAtURL:v69 error:&v73];
                v27 = v73;

                if (objc_opt_respondsToSelector()) {
                  [(AnalyticsWorkspaceHealthDelegate *)self->_healthDelegate deleteDatabaseCompleted:v36 error:v27];
                }
                goto LABEL_49;
              }
              if (forceDestroyPersistentStore)
              {
                v39 = objectanalyticsHandle();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_209DBA000, v39, OS_LOG_TYPE_ERROR, "DATA LOSS: Have been instructed to destroy persistent store.", buf, 2u);
                }

                v27 = v28;
LABEL_70:
                if (objc_opt_respondsToSelector()) {
                  [(AnalyticsWorkspaceHealthDelegate *)self->_healthDelegate destroyPersistentStoreStarted];
                }
                uint64_t v40 = *MEMORY[0x263EFF168];
                v72 = v27;
                uint64_t v41 = [v6 _destroyPersistentStoreAtURL:v69 withType:v40 options:0 error:&v72];
                v42 = v72;

                if (objc_opt_respondsToSelector()) {
                  [(AnalyticsWorkspaceHealthDelegate *)self->_healthDelegate destroyPersistentStoreCompleted:v41 error:v42];
                }
                if (v41)
                {
                  v43 = self->storeKind;
                  v71 = v42;
                  v44 = [v6 addPersistentStoreWithType:v43 configuration:0 URL:v69 options:v5 error:&v71];
                  v27 = v71;

                  if (v44)
                  {
                    objc_storeStrong(location, v6);
                    persistentStoreError = self->_persistentStoreError;
                    self->_persistentStoreError = 0;
                  }
                  else
                  {
                    v54 = objectanalyticsHandle();
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v78 = v27;
                      _os_log_impl(&dword_209DBA000, v54, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: Persisting fatal failure to recover incompatibility by creating new sqlite files : %@", buf, 0xCu);
                    }

                    if (v27)
                    {
                      v55 = v27;
                      v27 = v55;
                    }
                    else
                    {
                      v55 = [MEMORY[0x263F087E8] errorWithDomain:@"SymptomsErrorDomain" code:3203 userInfo:0];
                      v27 = 0;
                    }
                    persistentStoreError = self->_persistentStoreError;
                    self->_persistentStoreError = v55;
                  }
                }
                else
                {
                  v52 = objectanalyticsHandle();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v78 = v42;
                    _os_log_impl(&dword_209DBA000, v52, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: Fatal failure to remove incompatible sqlite files: %@", buf, 0xCu);
                  }

                  v53 = [MEMORY[0x263F087E8] errorWithDomain:@"SymptomsErrorDomain" code:3204 userInfo:0];
                  persistentStoreError = self->_persistentStoreError;
                  self->_persistentStoreError = v53;
                  v27 = v42;
                }

                goto LABEL_49;
              }
              if (forceIntegrityCheck)
              {
                if (objc_opt_respondsToSelector()) {
                  [(AnalyticsWorkspaceHealthDelegate *)self->_healthDelegate integrityCheckStarted];
                }
                [v70 setObject:@"YES" forKeyedSubscript:@"integrity_check"];
                v47 = self->storeKind;
                v75 = v28;
                v48 = [v6 addPersistentStoreWithType:v47 configuration:0 URL:v69 options:v5 error:&v75];
                v27 = v75;

                if (v48)
                {
                  objc_storeStrong(location, v6);
                  v49 = objectanalyticsHandle();
                  char v50 = 1;
                  if (!os_log_type_enabled(v49, OS_LOG_TYPE_INFO)) {
                    goto LABEL_119;
                  }
                  *(_WORD *)buf = 0;
                  v51 = "DATA INTEGRITY: Integrity check passed";
                  goto LABEL_86;
                }
                v56 = objectanalyticsHandle();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_209DBA000, v56, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: Integrity check failed", buf, 2u);
                }

                self->_integrityCheckFailed = 1;
                uint64_t v57 = [(NSError *)v27 code];
                char v58 = isDBFileCorrupted(v27, 0);
                if ((unint64_t)(v57 - 134000) < 0x15) {
                  char v59 = 1;
                }
                else {
                  char v59 = v58;
                }
                if ((v59 & 1) == 0 && (unint64_t)(v57 - 134100) > 0x46)
                {
                  v60 = [(NSError *)v27 domain];
                  if ([v60 isEqualToString:*MEMORY[0x263EFF150]])
                  {
                    BOOL v61 = [(NSError *)v27 code] == 13;

                    if (v61)
                    {
                      v49 = objectanalyticsHandle();
                      char v50 = 1;
                      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        v51 = "DATA INTEGRITY WARNING: The disk is full";
LABEL_86:
                        _os_log_impl(&dword_209DBA000, v49, OS_LOG_TYPE_INFO, v51, buf, 2u);
                      }
LABEL_119:

                      if (objc_opt_respondsToSelector()) {
                        [(AnalyticsWorkspaceHealthDelegate *)self->_healthDelegate integrityCheckCompleted:!self->_integrityCheckFailed error:v27];
                      }
                      if (v50) {
                        goto LABEL_49;
                      }
                      goto LABEL_70;
                    }
                  }
                  else
                  {
                  }
                  v62 = objectanalyticsHandle();
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v78 = v27;
                    _os_log_impl(&dword_209DBA000, v62, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: Error while creating persistent store: %@", buf, 0xCu);
                  }

                  v63 = self->storeKind;
                  v74 = v27;
                  v49 = [MEMORY[0x263EFF320] metadataForPersistentStoreOfType:v63 URL:v69 options:v5 error:&v74];
                  v64 = v74;

                  if (v49)
                  {
                    v65 = [(AnalyticsWorkspace *)self objectModel];
                    int v66 = [v65 isConfiguration:0 compatibleWithStoreMetadata:v49];

                    v67 = objectanalyticsHandle();
                    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      v78 = (NSError *)v49;
                      __int16 v79 = 1024;
                      LODWORD(v80) = v66;
                      _os_log_impl(&dword_209DBA000, v67, OS_LOG_TYPE_INFO, "DATA INTEGRITY WARNING: metadata %@, compat %d", buf, 0x12u);
                    }
                  }
                  char v50 = 1;
                  v27 = v64;
                  goto LABEL_119;
                }
                v49 = objectanalyticsHandle();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v27;
                  _os_log_impl(&dword_209DBA000, v49, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: DB content truncated due to model incompatibility or corruption. PSC creation failed with: %@", buf, 0xCu);
                }
                char v50 = 0;
                goto LABEL_119;
              }
            }
            goto LABEL_48;
          }
        }
        if (!self->_forceDestroyPersistentStore && !self->_forceDeleteFile)
        {
LABEL_48:
          v27 = v28;
          goto LABEL_49;
        }
      }
      BOOL forceIntegrityCheck = 0;
      goto LABEL_46;
    }
    uint64_t v26 = objectanalyticsHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: Fatal error while allocating persistent store", buf, 2u);
    }

    uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:@"SymptomsErrorDomain" code:3202 userInfo:0];
  }
  else
  {
    __int16 v24 = objectanalyticsHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: Unable to load the object model", buf, 2u);
    }

    uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:@"SymptomsErrorDomain" code:3201 userInfo:0];
  }
  BOOL v6 = 0;
  v27 = self->_persistentStoreError;
  self->_persistentStoreError = v25;
LABEL_49:

  if (v17) {
    goto LABEL_50;
  }

LABEL_53:
  id v30 = 0;
LABEL_54:
  objc_sync_exit(v3);

  return v30;
}

- (NSManagedObjectContext)mainObjectContext
{
  if (self->__persistent)
  {
    mainObjectContext = self->__mainObjectContext;
    if (mainObjectContext)
    {
      v4 = mainObjectContext;
    }
    else
    {
      char v5 = [(AnalyticsWorkspace *)self persistentStoreCoordinator];
      BOOL v6 = self->__mainObjectContext;
      if (v5 && !v6)
      {
        id v7 = objc_alloc(MEMORY[0x263EFF288]);
        uint64_t v8 = (NSManagedObjectContext *)[v7 initWithConcurrencyType:*MEMORY[0x263EFF360]];
        id v9 = self->__mainObjectContext;
        self->__mainObjectContext = v8;

        [(NSManagedObjectContext *)self->__mainObjectContext setMergePolicy:*MEMORY[0x263EFF068]];
        [(NSManagedObjectContext *)self->__mainObjectContext setPersistentStoreCoordinator:v5];
        [(NSManagedObjectContext *)self->__mainObjectContext setUndoManager:0];
        BOOL v6 = self->__mainObjectContext;
      }
      v4 = v6;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)createNewContext
{
  if (self->__persistent)
  {
    v2 = [(AnalyticsWorkspace *)self persistentStoreCoordinator];
    if (v2)
    {
      id v3 = objc_alloc(MEMORY[0x263EFF288]);
      v4 = (void *)[v3 initWithConcurrencyType:*MEMORY[0x263EFF360]];
      char v5 = v4;
      if (v4)
      {
        [v4 setMergePolicy:*MEMORY[0x263EFF068]];
        [v5 setPersistentStoreCoordinator:v2];
        [v5 setUndoManager:0];
      }
    }
    else
    {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(AnalyticsWorkspace *)self createNewContext];
  if (v4 || !self->__persistent)
  {
    char v5 = objc_alloc_init(AnalyticsWorkspace);
    objc_storeStrong((id *)&v5->backingStore, self->backingStore);
    objc_storeStrong((id *)&v5->storeKind, self->storeKind);
    objc_storeStrong((id *)&v5->_objectModelName, self->_objectModelName);
    objc_storeStrong((id *)&v5->_objectModelResidentBundle, self->_objectModelResidentBundle);
    objc_storeStrong((id *)&v5->storeProt, self->storeProt);
    uint64_t v6 = [(AnalyticsWorkspace *)self persistentStoreCoordinator];
    persistentStoreCoordinator = v5->__persistentStoreCoordinator;
    v5->__persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v6;

    objc_storeStrong((id *)&v5->__mainObjectContext, v4);
    uint64_t v8 = [(AnalyticsWorkspace *)self objectModel];
    objectModel = v5->__objectModel;
    v5->__objectModel = (NSManagedObjectModel *)v8;

    uint64_t v10 = [(AnalyticsWorkspace *)self connection];
    connection = v5->__connection;
    v5->__connection = (NSXPCConnection *)v10;

    v5->__persistent = [(AnalyticsWorkspace *)self persistent];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)resetCompletionBlock
{
  v2 = _Block_copy(self->__resetCompletionBlock);

  return v2;
}

- (void)setResetCompletionBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = _Block_copy(self->__resetCompletionBlock);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__AnalyticsWorkspace_setResetCompletionBlock___block_invoke;
    v9[3] = &unk_263FC2CF8;
    id v10 = v5;
    id v11 = v4;
    id v6 = v5;
    id v7 = _Block_copy(v9);
    id resetCompletionBlock = self->__resetCompletionBlock;
    self->__id resetCompletionBlock = v7;
  }
}

uint64_t __46__AnalyticsWorkspace_setResetCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)reset
{
  if (self->__persistent)
  {
    id v3 = [(AnalyticsWorkspace *)self mainObjectContext];
    [v3 reset];
  }
  id v4 = [(AnalyticsWorkspace *)self resetCompletionBlock];
  if (v4)
  {
    char v5 = v4;
    v4[2]();
    id v4 = v5;
  }
}

- (BOOL)save
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!self->__persistent) {
    return 0;
  }
  id v3 = [(AnalyticsWorkspace *)self persistentStoreCoordinator];

  if (!v3) {
    return 0;
  }
  id v4 = [(AnalyticsWorkspace *)self mainObjectContext];
  int v5 = [v4 hasChanges];

  if (v5)
  {
    id v6 = [(AnalyticsWorkspace *)self mainObjectContext];
    id v16 = 0;
    char v7 = [v6 save:&v16];
    id v8 = v16;

    if ((v7 & 1) == 0)
    {
      id v9 = objectanalyticsHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [v8 localizedDescription];
        uint64_t v11 = [v10 UTF8String];
        id v12 = [v8 userInfo];
        id v13 = [v12 description];
        uint64_t v14 = [v13 UTF8String];
        *(_DWORD *)buf = 136315394;
        uint64_t v18 = v11;
        __int16 v19 = 2080;
        uint64_t v20 = v14;
        _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "Error while saving: %s\n%s", buf, 0x16u);
      }
    }
  }
  return 1;
}

- (BOOL)canCloneObjectsOfType:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!self->__persistent) {
    return 0;
  }
  id v3 = [a3 relationshipsByName];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(v3, "allValues", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) isToMany])
        {
          BOOL v9 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (void)enumerateResidentObjectsOfType:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AnalyticsWorkspace *)self mainObjectContext];
  BOOL v9 = [v8 registeredObjects];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__AnalyticsWorkspace_enumerateResidentObjectsOfType_usingBlock___block_invoke;
  v12[3] = &unk_263FC2D20;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [v9 enumerateObjectsUsingBlock:v12];
}

void __64__AnalyticsWorkspace_enumerateResidentObjectsOfType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(void *)(a1 + 40))
  {
    if ([v5 isUpdated])
    {
      id v3 = [v5 entity];
      int v4 = [v3 isEqual:*(void *)(a1 + 32)];

      if (v4) {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
  }
}

- (id)cloneObject:(id)a3 intoWorkspace:(id)a4
{
  char v12 = 0;
  id v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = (void *)[[v6 alloc] initWithCapacity:5];
  id v10 = [(AnalyticsWorkspace *)self _cloneInternal:v8 intoWorkspace:v7 ancestry:v9 iteration:0 mustFail:&v12];

  return v10;
}

- (id)_cloneInternal:(id)a3 intoWorkspace:(id)a4 ancestry:(id)a5 iteration:(unint64_t)a6 mustFail:(BOOL *)a7
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v11 mainObjectContext];
  id v14 = [v10 entity];
  v56 = [v14 name];
  if (!v56)
  {
    os_log_type_t v23 = objectanalyticsHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = v14;
      uint64_t v25 = v13;
      id v26 = v12;
      if (v10)
      {
        id v12 = [v10 objectID];
        id v13 = [v12 URIRepresentation];
        a6 = [v13 description];
        v27 = (const char *)[(id)a6 UTF8String];
      }
      else
      {
        v27 = "(no nmo)";
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v66 = (uint64_t)v27;
      _os_log_impl(&dword_209DBA000, v23, OS_LOG_TYPE_ERROR, "Nil entity name for nmo: %s", buf, 0xCu);
      if (v10)
      {
      }
      int v22 = 0;
      id v12 = v26;
      id v13 = v25;
      id v14 = v24;
    }
    else
    {
      int v22 = 0;
    }
    goto LABEL_33;
  }
  if (a6 >= 6)
  {
    id v15 = objectanalyticsHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [v10 objectID];
      id v17 = v16 = v14;
      [v17 URIRepresentation];
      __int16 v19 = v18 = v12;
      [v19 description];
      uint64_t v20 = v13;
      id v21 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315138;
      uint64_t v66 = [v21 UTF8String];
      _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_ERROR, "Too long a chain sequence leading to: %s", buf, 0xCu);

      id v13 = v20;
      id v12 = v18;

      id v14 = v16;
    }
    int v22 = 0;
    os_log_type_t v23 = v15;
LABEL_33:

    goto LABEL_34;
  }
  [v10 objectID];
  v28 = v52 = v14;
  int v22 = [v12 objectForKeyedSubscript:v28];

  id v14 = v52;
  if (!v22)
  {
    int v22 = [MEMORY[0x263EFF240] insertNewObjectForEntityForName:v56 inManagedObjectContext:v13];
    if (v22)
    {
      unint64_t v59 = a6;
      v51 = v13;
      id v55 = v11;
      v29 = [v10 objectID];
      id v54 = v12;
      [v12 setObject:v22 forKey:v29];

      id v30 = [v10 entity];
      objc_super v31 = [v30 attributesByName];
      uint64_t v32 = [v31 allKeys];

      char v50 = (void *)v32;
      [v10 dictionaryWithValuesForKeys:v32];
      v49 = v53 = v22;
      -[NSObject setValuesForKeysWithDictionary:](v22, "setValuesForKeysWithDictionary:");
      v33 = [v10 entity];
      uint64_t v34 = [v33 relationshipsByName];

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v35 = [v34 allKeys];
      uint64_t v36 = [v35 countByEnumeratingWithState:&v60 objects:v64 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v61;
        while (2)
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v61 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v40 = *(void *)(*((void *)&v60 + 1) + 8 * i);
            uint64_t v41 = [v34 valueForKey:v40];
            if (([v41 isToMany] & 1) == 0 && (objc_msgSend(v41, "isTransient") & 1) == 0)
            {
              v42 = v35;
              id v43 = v10;
              v44 = [v10 valueForKey:v40];
              ++v59;
              uint64_t v45 = -[AnalyticsWorkspace _cloneInternal:intoWorkspace:ancestry:iteration:mustFail:](self, "_cloneInternal:intoWorkspace:ancestry:iteration:mustFail:", v44, v55, v54);
              if (!v45)
              {
                *a7 = 1;

                int v22 = 0;
                id v10 = v43;
                os_log_type_t v23 = v53;
                goto LABEL_32;
              }
              v46 = (void *)v45;
              [v53 setValue:v45 forKey:v40];

              id v10 = v43;
              v35 = v42;
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v60 objects:v64 count:16];
          if (v37) {
            continue;
          }
          break;
        }
      }

      os_log_type_t v23 = v53;
      if (*a7) {
        v47 = 0;
      }
      else {
        v47 = v53;
      }
      int v22 = v47;
LABEL_32:

      id v12 = v54;
      id v11 = v55;
      id v13 = v51;
      id v14 = v52;
      goto LABEL_33;
    }
  }
LABEL_34:

  return v22;
}

- (BOOL)_primePath:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->pathKnownToFail) {
    return 0;
  }
  id v5 = [a3 stringByDeletingLastPathComponent];
  id v6 = [MEMORY[0x263F08850] defaultManager];
  char v17 = 0;
  if ([v6 fileExistsAtPath:v5 isDirectory:&v17]) {
    BOOL v7 = v17 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = [NSDictionary dictionaryWithObject:self->storeProt forKey:*MEMORY[0x263F080A8]];
    id v16 = 0;
    [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:v8 error:&v16];
    id v9 = v16;
    BOOL v3 = v9 == 0;
    if (v9)
    {
      id v10 = objectanalyticsHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v9 localizedDescription];
        uint64_t v12 = [v11 UTF8String];
        *(_DWORD *)buf = 136315138;
        uint64_t v19 = v12;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "Error creating directory path: %s", buf, 0xCu);
      }
      id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"SymptomsErrorDomain" code:3101 userInfo:0];
      persistentStoreError = self->_persistentStoreError;
      self->_persistentStoreError = v13;
    }
  }
  else
  {
    BOOL v3 = 1;
  }
  self->pathKnownToFail = !v3;

  return v3;
}

- (BOOL)persistent
{
  return self->__persistent;
}

- (NSXPCConnection)connection
{
  return self->__connection;
}

- (AnalyticsWorkspaceHealthDelegate)healthDelegate
{
  return self->_healthDelegate;
}

- (void)setHealthDelegate:(id)a3
{
}

- (BOOL)forceIntegrityCheck
{
  return self->_forceIntegrityCheck;
}

- (void)setForceIntegrityCheck:(BOOL)a3
{
  self->_BOOL forceIntegrityCheck = a3;
}

- (BOOL)forceDestroyPersistentStore
{
  return self->_forceDestroyPersistentStore;
}

- (void)setForceDestroyPersistentStore:(BOOL)a3
{
  self->_BOOL forceDestroyPersistentStore = a3;
}

- (BOOL)forceDeleteFile
{
  return self->_forceDeleteFile;
}

- (void)setForceDeleteFile:(BOOL)a3
{
  self->_BOOL forceDeleteFile = a3;
}

- (NSString)objectModelName
{
  return self->_objectModelName;
}

- (void)setObjectModelName:(id)a3
{
}

- (NSBundle)objectModelResidentBundle
{
  return self->_objectModelResidentBundle;
}

- (void)setObjectModelResidentBundle:(id)a3
{
}

- (BOOL)integrityCheckFailed
{
  return self->_integrityCheckFailed;
}

- (NSError)persistentStoreError
{
  return self->_persistentStoreError;
}

- (void)setPersistentStoreError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStoreError, 0);
  objc_storeStrong((id *)&self->_objectModelResidentBundle, 0);
  objc_storeStrong((id *)&self->_objectModelName, 0);
  objc_storeStrong((id *)&self->_healthDelegate, 0);
  objc_storeStrong((id *)&self->__connection, 0);
  objc_storeStrong(&self->__resetCompletionBlock, 0);
  objc_storeStrong((id *)&self->__objectModel, 0);
  objc_storeStrong((id *)&self->__mainObjectContext, 0);
  objc_storeStrong((id *)&self->__persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->storeProt, 0);
  objc_storeStrong((id *)&self->storeKind, 0);

  objc_storeStrong((id *)&self->backingStore, 0);
}

@end