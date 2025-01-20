@interface BMRemoteSQLStoreManager
- (BMRemoteSQLStoreManager)initWithURL:(id)a3;
- (BOOL)hasReadWriteAccessToURL:(id)a3;
- (BOOL)remoteOnly;
- (id)deleteRowsDerivedFromStream:(id)a3 eventIdentifier:(id)a4;
- (void)setRemoteOnly:(BOOL)a3;
@end

@implementation BMRemoteSQLStoreManager

- (BMRemoteSQLStoreManager)initWithURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BMRemoteSQLStoreManager;
  v3 = [(BMSQLStoreManager *)&v6 initWithURL:a3];
  v4 = v3;
  if (v3) {
    [(BMRemoteSQLStoreManager *)v3 setRemoteOnly:0];
  }
  return v4;
}

- (BOOL)hasReadWriteAccessToURL:(id)a3
{
  id v3 = a3;
  if (hasReadWriteAccessToURL__onceToken != -1) {
    dispatch_once(&hasReadWriteAccessToURL__onceToken, &__block_literal_global);
  }
  if (hasReadWriteAccessToURL__isSandboxed)
  {
    id v4 = [v3 path];
    [v4 UTF8String];
    BOOL v5 = sandbox_check() == 0;
  }
  else
  {
    objc_super v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B87BE000, v6, OS_LOG_TYPE_INFO, "Process not sandboxed, skipping sandbox check", buf, 2u);
    }

    BOOL v5 = 1;
  }

  return v5;
}

uint64_t __51__BMRemoteSQLStoreManager_hasReadWriteAccessToURL___block_invoke()
{
  hasReadWriteAccessToURL__pid = getpid();
  uint64_t result = sandbox_check();
  hasReadWriteAccessToURL__isSandboxed = result != 0;
  return result;
}

- (id)deleteRowsDerivedFromStream:(id)a3 eventIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(BMRemoteSQLStoreManager *)self remoteOnly]
    || ([(BMSQLStore *)self dbURL],
        v8 = objc_claimAutoreleasedReturnValue(),
        BOOL v9 = [(BMRemoteSQLStoreManager *)self hasReadWriteAccessToURL:v8],
        v8,
        !v9))
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BMRemoteSQLStoreManager deleteRowsDerivedFromStream:eventIdentifier:](self, v11);
    }

    v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BMRemoteSQLStoreManager;
    v10 = [(BMSQLStoreManager *)&v13 deleteRowsDerivedFromStream:v6 eventIdentifier:v7];
  }

  return v10;
}

- (BOOL)remoteOnly
{
  return self->_remoteOnly;
}

- (void)setRemoteOnly:(BOOL)a3
{
  self->_remoteOnly = a3;
}

- (void)deleteRowsDerivedFromStream:(void *)a1 eventIdentifier:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 dbURL];
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_fault_impl(&dword_1B87BE000, a2, OS_LOG_TYPE_FAULT, "Unable to delete derived data - biomed does not have access to %@", (uint8_t *)&v4, 0xCu);
}

@end