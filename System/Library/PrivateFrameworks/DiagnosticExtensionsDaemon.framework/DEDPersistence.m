@interface DEDPersistence
+ (id)sharedInstance;
- (BOOL)canProceedWithDevice:(id)a3;
- (DEDPersistence)init;
- (NSUserDefaults)userDefaults;
- (OS_os_log)log;
- (id)_indexKeyForBugSession:(id)a3;
- (id)_indexKeyForBugSessionIdentifier:(id)a3;
- (id)bugSessionIdentifiers;
- (id)loadSavedBugSessions;
- (id)loadSavedSessionsFromPlist:(id)a3;
- (void)loadSavedBugSessions;
- (void)removeBugSession:(id)a3;
- (void)setLog:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)updateBugSession:(id)a3;
- (void)validateSandboxAccess;
@end

@implementation DEDPersistence

+ (id)sharedInstance
{
  if (sharedInstance_once_3 != -1) {
    dispatch_once(&sharedInstance_once_3, &__block_literal_global_24);
  }
  v2 = (void *)sharedInstance_shared_2;
  return v2;
}

uint64_t __32__DEDPersistence_sharedInstance__block_invoke()
{
  sharedInstance_shared_2 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (BOOL)canProceedWithDevice:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[DEDUtils isInternalInstall])
  {
    v5 = [(DEDPersistence *)self userDefaults];
    v6 = [v5 objectForKey:@"blockDevice"];

    if (v6)
    {
      v7 = [v4 hashingKey];
      if ([v6 isEqualToString:v7])
      {
        v8 = [(DEDPersistence *)self log];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138543362;
          v12 = v7;
          _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "should not proceed with device [%{public}@]", (uint8_t *)&v11, 0xCu);
        }

        BOOL v9 = 0;
        goto LABEL_10;
      }
    }
    BOOL v9 = 1;
LABEL_10:

    goto LABEL_11;
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (DEDPersistence)init
{
  v8.receiver = self;
  v8.super_class = (Class)DEDPersistence;
  v2 = [(DEDPersistence *)&v8 init];
  if (v2)
  {
    v3 = +[DEDConfiguration sharedInstance];
    os_log_t v4 = os_log_create((const char *)[v3 loggingSubsystem], "ded-persist");
    [(DEDPersistence *)v2 setLog:v4];

    uint64_t v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v5;
  }
  return v2;
}

- (id)loadSavedSessionsFromPlist:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  os_log_t v4 = [NSDictionary dictionaryWithContentsOfURL:a3];
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  v6 = [v4 objectForKey:@"sessionIdentifiers"];
  v7 = [v5 setWithArray:v6];
  objc_super v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  v10 = v9;

  v26 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v30;
    *(void *)&long long v12 = 138543362;
    long long v25 = v12;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = -[DEDPersistence _indexKeyForBugSessionIdentifier:](self, "_indexKeyForBugSessionIdentifier:", *(void *)(*((void *)&v29 + 1) + 8 * i), v25);
        v17 = [v4 objectForKey:v16];
        v18 = (void *)MEMORY[0x263F08928];
        v19 = +[DEDBugSession archivedClasses];
        id v28 = 0;
        v20 = [v18 unarchivedObjectOfClasses:v19 fromData:v17 error:&v28];
        id v21 = v28;

        if (v21)
        {
          v22 = [(DEDPersistence *)self log];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            id v34 = v21;
            _os_log_error_impl(&dword_21FE04000, v22, OS_LOG_TYPE_ERROR, "failed to load bug session from plist with error: [%{public}@]", buf, 0xCu);
          }
        }
        else
        {
          [v26 addObject:v20];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v13);
  }

  v23 = [MEMORY[0x263EFF8C0] arrayWithArray:v26];

  return v23;
}

- (id)loadSavedBugSessions
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = [(DEDPersistence *)self bugSessionIdentifiers];
  v18 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        objc_super v8 = [(DEDPersistence *)self _indexKeyForBugSessionIdentifier:*(void *)(*((void *)&v23 + 1) + 8 * v7)];
        id v9 = [(NSUserDefaults *)self->_userDefaults objectForKey:v8];
        v10 = (void *)MEMORY[0x263F08928];
        uint64_t v11 = +[DEDBugSession archivedClasses];
        id v22 = 0;
        long long v12 = [v10 unarchivedObjectOfClasses:v11 fromData:v9 error:&v22];
        id v13 = v22;

        if (v13)
        {
          uint64_t v14 = [(DEDPersistence *)self log];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v28 = v13;
            _os_log_error_impl(&dword_21FE04000, v14, OS_LOG_TYPE_ERROR, "Failed to load Bug Session from disk with error [%{public}@]", buf, 0xCu);
          }
LABEL_9:

          goto LABEL_12;
        }
        if (!v12)
        {
          uint64_t v14 = [(DEDPersistence *)self log];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            [(DEDPersistence *)&v20 loadSavedBugSessions];
          }
          goto LABEL_9;
        }
        [v18 addObject:v12];
LABEL_12:

        ++v7;
      }
      while (v5 != v7);
      uint64_t v15 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
      uint64_t v5 = v15;
    }
    while (v15);
  }

  v16 = [MEMORY[0x263EFF8C0] arrayWithArray:v18];

  return v16;
}

- (void)updateBugSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDPersistence *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDPersistence updateBugSession:](v5);
  }

  id v6 = objc_alloc(MEMORY[0x263EFF9C0]);
  uint64_t v7 = [(DEDPersistence *)self bugSessionIdentifiers];
  objc_super v8 = (void *)[v6 initWithSet:v7];

  id v9 = [v4 identifier];
  [v8 addObject:v9];

  v10 = [(DEDPersistence *)self _indexKeyForBugSession:v4];
  id v16 = 0;
  uint64_t v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v16];

  id v12 = v16;
  if (v12)
  {
    id v13 = [(DEDPersistence *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[DEDPersistence updateBugSession:]((uint64_t)v12, v13);
    }
  }
  userDefaults = self->_userDefaults;
  uint64_t v15 = [v8 allObjects];
  [(NSUserDefaults *)userDefaults setObject:v15 forKey:@"sessionIdentifiers"];

  [(NSUserDefaults *)self->_userDefaults setObject:v11 forKey:v10];
}

- (void)removeBugSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDPersistence *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDPersistence removeBugSession:](v5);
  }

  id v6 = objc_alloc(MEMORY[0x263EFF9C0]);
  uint64_t v7 = [(DEDPersistence *)self bugSessionIdentifiers];
  objc_super v8 = (void *)[v6 initWithSet:v7];

  id v9 = [v4 identifier];
  [v8 removeObject:v9];

  v10 = [(DEDPersistence *)self _indexKeyForBugSession:v4];

  [(NSUserDefaults *)self->_userDefaults removeObjectForKey:v10];
  userDefaults = self->_userDefaults;
  id v12 = [v8 allObjects];
  [(NSUserDefaults *)userDefaults setObject:v12 forKey:@"sessionIdentifiers"];
}

- (id)_indexKeyForBugSession:(id)a3
{
  v3 = NSString;
  id v4 = [a3 identifier];
  uint64_t v5 = [v3 stringWithFormat:@"bugsession:%@", v4];

  return v5;
}

- (id)_indexKeyForBugSessionIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"bugsession:%@", a3];
}

- (id)bugSessionIdentifiers
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"sessionIdentifiers"];
  id v4 = [v2 setWithArray:v3];
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  uint64_t v7 = v6;

  return v7;
}

- (void)validateSandboxAccess
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "CANNOT read/write from user defaults", v1, 2u);
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserDefaults:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)loadSavedBugSessions
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "Failed to load Bug Session from disk with error: Bug Session is nil, no unarchive error", buf, 2u);
}

- (void)updateBugSession:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "failed to archive bug session with error: [%{public}@]", (uint8_t *)&v2, 0xCu);
}

- (void)updateBugSession:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  int v2 = "-[DEDPersistence updateBugSession:]";
  _os_log_debug_impl(&dword_21FE04000, log, OS_LOG_TYPE_DEBUG, "[%{public}s]", (uint8_t *)&v1, 0xCu);
}

- (void)removeBugSession:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  int v2 = "-[DEDPersistence removeBugSession:]";
  _os_log_debug_impl(&dword_21FE04000, log, OS_LOG_TYPE_DEBUG, "[%{public}s]", (uint8_t *)&v1, 0xCu);
}

@end