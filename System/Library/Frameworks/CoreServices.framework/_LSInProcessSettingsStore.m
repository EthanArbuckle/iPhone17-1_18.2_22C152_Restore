@interface _LSInProcessSettingsStore
- (OS_dispatch_queue)internalQueue;
- (_LSInProcessSettingsStore)init;
- (sqlite3)database;
- (unsigned)_internalQueue_selectUserElectionForIdentifier:(id)a3;
- (unsigned)userElectionForExtensionKey:(id)a3;
- (void)_internalQueue_loadDatabase;
- (void)_internalQueue_purgeDatabase;
- (void)dealloc;
- (void)setDatabase:(sqlite3 *)a3;
@end

@implementation _LSInProcessSettingsStore

- (unsigned)_internalQueue_selectUserElectionForIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  ppStmt = 0;
  if (sqlite3_prepare_v2([(_LSInProcessSettingsStore *)self database], "select userElection from(select identifier, userElection , 0 as legacy from Election UNION SELECT identifier, userElection, 1 as legacy from LegacyElection) where identifier = ? ORDER BY identifier, legacy limit 1", -1, &ppStmt, 0))
  {
    v5 = _LSExtensionsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = sqlite3_errmsg([(_LSInProcessSettingsStore *)self database]);
      -[_LSInProcessSettingsStore _internalQueue_selectUserElectionForIdentifier:]((uint64_t)v6, (uint64_t)v11);
    }
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)[v4 UTF8String], -1, 0);
  }
  if (sqlite3_step(ppStmt) == 100) {
    unsigned __int8 v7 = sqlite3_column_int(ppStmt, 0);
  }
  else {
    unsigned __int8 v7 = 0;
  }
  sqlite3_finalize(ppStmt);
  v8 = _LSExtensionsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_LSInProcessSettingsStore _internalQueue_selectUserElectionForIdentifier:]();
  }

  return v7;
}

- (sqlite3)database
{
  v3 = [(_LSInProcessSettingsStore *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  if (!self->_database) {
    [(_LSInProcessSettingsStore *)self _internalQueue_loadDatabase];
  }
  dbCloseTimer = self->_dbCloseTimer;
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(dbCloseTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  return self->_database;
}

- (void)setDatabase:(sqlite3 *)a3
{
  self->_database = a3;
}

- (unsigned)userElectionForExtensionKey:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  dispatch_time_t v5 = [(_LSInProcessSettingsStore *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___LSInProcessSettingsStore_userElectionForExtensionKey___block_invoke;
  block[3] = &unk_1E522DD10;
  uint64_t v12 = &v13;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync(v5, block);

  unsigned __int8 v7 = _LSExtensionsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_LSInProcessSettingsStore userElectionForExtensionKey:]();
  }

  unsigned __int8 v8 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (_LSInProcessSettingsStore)init
{
  v13.receiver = self;
  v13.super_class = (Class)_LSInProcessSettingsStore;
  id v2 = [(LSSettingsStore *)&v13 _init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.launchservices._LSSettingsInProcessStore", v3);
    dispatch_time_t v5 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v4;

    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v2 + 5));
    unsigned __int8 v7 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v6;

    objc_initWeak(&location, v2);
    unsigned __int8 v8 = *((void *)v2 + 3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __33___LSInProcessSettingsStore_init__block_invoke;
    v10[3] = &unk_1E522F9D0;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v8, v10);
    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 3), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_resume(*((dispatch_object_t *)v2 + 3));
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return (_LSInProcessSettingsStore *)v2;
}

- (void)_internalQueue_purgeDatabase
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_database)
  {
    v3 = _LSExtensionsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)dispatch_queue_t v4 = 0;
      _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_INFO, "Jettisoning elections database", v4, 2u);
    }

    sqlite3_close(self->_database);
    self->_database = 0;
  }
}

- (void)dealloc
{
  database = self->_database;
  if (database)
  {
    sqlite3_close(database);
    self->_database = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_LSInProcessSettingsStore;
  [(_LSInProcessSettingsStore *)&v4 dealloc];
}

- (void)_internalQueue_loadDatabase
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [(id)__LSDefaultsGetSharedInstance() settingsStoreFileURL];
  objc_super v4 = _LSExtensionsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)dispatch_source_t v6 = 138412290;
    *(void *)&v6[4] = v3;
    _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_INFO, "Loading readonly user election database from: '%@'", v6, 0xCu);
  }

  *(void *)dispatch_source_t v6 = 0;
  id v5 = v3;
  sqlite3_open_v2((const char *)[v5 fileSystemRepresentation], (sqlite3 **)v6, 1, 0);
  self->_database = *(sqlite3 **)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);

  objc_storeStrong((id *)&self->_dbCloseTimer, 0);
}

- (void)userElectionForExtensionKey:.cold.1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_10_0(&dword_182959000, v0, v1, "Extension key '%@' user election: %d ");
}

- (void)_internalQueue_selectUserElectionForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_10_0(&dword_182959000, v0, v1, "Identifier: '%@' user election: %d");
}

- (void)_internalQueue_selectUserElectionForIdentifier:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_9_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_2_6(&dword_182959000, v2, v3, "Failed to execute statement: %s\n", v4);
}

@end