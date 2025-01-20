@interface BRCServerPersistedState
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasStateChangesWithResultingState:(id *)a3;
- (BOOL)mangledIDIsPendingMigration:(id)a3;
- (BRCServerChangeState)sharedDatabaseChangeState;
- (BRCServerPersistedState)init;
- (BRCServerPersistedState)initWithCoder:(id)a3;
- (BRCServerPersistedState)initWithState:(id)a3;
- (NSDate)lastSyncDownDate;
- (NSString)description;
- (id)_stateToData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dumpMigrationQueriesForMangledID:(id)a3;
- (id)migrationQueryKeyForMangledID:(id)a3 continuationCursor:(id *)a4;
- (int64_t)nextRank;
- (unint64_t)minLastUsedTime;
- (void)abortMigrationsOfMigrationKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initiateMigrationQueryForMangledIDs:(id)a3 key:(id)a4;
- (void)migrationQueryForMangledID:(id)a3 key:(id)a4 didUpdateWithCursor:(id)a5;
- (void)saveToDB:(id)a3;
- (void)setLastSyncDownDate:(id)a3;
- (void)setMinLastUsedTime:(unint64_t)a3;
- (void)setNextRank:(int64_t)a3;
- (void)setSharedDatabaseChangeState:(id)a3;
- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4;
@end

@implementation BRCServerPersistedState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setNextRank:(int64_t)a3
{
  if (self->_nextRank != a3)
  {
    self->_needsSave = 1;
    self->_nextRank = a3;
  }
}

- (void)setLastSyncDownDate:(id)a3
{
  id v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_lastSyncDownDate, "isEqualToDate:"))
  {
    self->_needsSave = 1;
    objc_storeStrong((id *)&self->_lastSyncDownDate, a3);
  }
}

- (void)setMinLastUsedTime:(unint64_t)a3
{
  if (self->_minLastUsedTime != a3)
  {
    self->_needsSave = 1;
    self->_minLastUsedTime = a3;
  }
}

- (NSString)description
{
  v3 = +[BRCUserDefaults defaultsForMangledID:0];
  v4 = [v3 dumpDateFormatter];

  id v5 = NSString;
  uint64_t v6 = [v4 stringFromDate:self->_lastSyncDownDate];
  v7 = (void *)v6;
  v8 = @"never";
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v9 = [v5 stringWithFormat:@"last-sync:%@ nextRank:%lld minUsedTime:%lld shared-db{%@}", v8, self->_nextRank, self->_minLastUsedTime, self->_sharedDatabaseChangeState];

  return (NSString *)v9;
}

- (BRCServerPersistedState)init
{
  v7.receiver = self;
  v7.super_class = (Class)BRCServerPersistedState;
  v2 = [(BRCServerPersistedState *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_nextRank = 1;
    v4 = objc_alloc_init(BRCServerChangeState);
    sharedDatabaseChangeState = v3->_sharedDatabaseChangeState;
    v3->_sharedDatabaseChangeState = v4;

    v3->_needsSave = 1;
  }
  return v3;
}

- (BRCServerPersistedState)initWithState:(id)a3
{
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCServerPersistedState;
  id v5 = [(BRCServerPersistedState *)&v11 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_nextRank = v4[4];
    objc_super v7 = (void *)v4[6];
    if (v7) {
      v8 = v7;
    }
    else {
      v8 = objc_alloc_init(BRCServerChangeState);
    }
    sharedDatabaseChangeState = v6->_sharedDatabaseChangeState;
    v6->_sharedDatabaseChangeState = v8;

    v6->_minLastUsedTime = v4[7];
    v6->_needsSave = 1;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithState:self];
}

- (BRCServerPersistedState)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCServerPersistedState;
  id v5 = [(BRCServerPersistedState *)&v21 init];
  if (v5)
  {
    v5->_nextRank = [v4 decodeInt64ForKey:@"nextRank"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareDatabase"];
    objc_super v7 = v6;
    if (v6) {
      v8 = v6;
    }
    else {
      v8 = objc_alloc_init(BRCServerChangeState);
    }
    sharedDatabaseChangeState = v5->_sharedDatabaseChangeState;
    v5->_sharedDatabaseChangeState = v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"migrationQuery"];
    pendingMigrations = v5->_pendingMigrations;
    v5->_pendingMigrations = (NSMutableDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lsdDate"];
    lastSyncDownDate = v5->_lastSyncDownDate;
    v5->_lastSyncDownDate = (NSDate *)v18;

    v5->_minLastUsedTime = [v4 decodeInt64ForKey:@"minUsedTime"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t nextRank = self->_nextRank;
  id v5 = a3;
  [v5 encodeInt64:nextRank forKey:@"nextRank"];
  [v5 encodeObject:self->_sharedDatabaseChangeState forKey:@"shareDatabase"];
  [v5 encodeObject:self->_pendingMigrations forKey:@"migrationQuery"];
  [v5 encodeObject:self->_lastSyncDownDate forKey:@"lsdDate"];
  [v5 encodeInt64:self->_minLastUsedTime forKey:@"minUsedTime"];
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  sqlite3_bind_blob(a3, a4, (const void *)[v6 bytes], objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (id)_stateToData
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (BOOL)_hasStateChangesWithResultingState:(id *)a3
{
  if (!a3)
  {
    objc_super v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCClientState hasStateChangesAndClearSaveStatusWithResultingState:]((uint64_t)v7, v8);
    }
  }
  id v5 = [(BRCServerPersistedState *)self _stateToData];
  *a3 = v5;
  if (!self->_needsSave)
  {
    if ([(NSData *)self->_originalServerPersistedState isEqualToData:v5])
    {
      BOOL result = 0;
      *a3 = 0;
      return result;
    }
    id v5 = *a3;
  }
  objc_storeStrong((id *)&self->_originalServerPersistedState, v5);
  self->_needsSave = 1;
  return *a3 != 0;
}

- (void)saveToDB:(id)a3
{
  id v4 = a3;
  id v13 = 0;
  BOOL v5 = [(BRCServerPersistedState *)self _hasStateChangesWithResultingState:&v13];
  id v6 = v13;
  id v7 = v13;
  v8 = v7;
  if (v5)
  {
    if (([v4 execute:@"UPDATE server_state SET state = %@", v7] & 1) == 0)
    {
      abc_report_panic_with_signature();
      uint64_t v9 = [NSString stringWithFormat:@"unable to update the server_state"];
      v10 = brc_bread_crumbs();
      uint64_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        __48__BRCDaemon_listener_shouldAcceptNewConnection___block_invoke_130_cold_1(v9, (uint64_t)v10, v11);
      }

      brc_append_system_info_to_message();
      uint64_t v12 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCServerPersistedState saveToDB:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCServerPersistedState.m", 304, v12);
    }
    objc_storeStrong((id *)&self->_originalServerPersistedState, v6);
    self->_needsSave = 0;
  }
}

- (BOOL)mangledIDIsPendingMigration:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_pendingMigrations objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)initiateMigrationQueryForMangledIDs:(id)a3 key:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v8 = v6;
  uint64_t v9 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * v12);
        pendingMigrations = self->_pendingMigrations;
        if (!pendingMigrations)
        {
          v15 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v16 = self->_pendingMigrations;
          self->_pendingMigrations = v15;

          pendingMigrations = self->_pendingMigrations;
        }
        v17 = [(NSMutableDictionary *)pendingMigrations objectForKeyedSubscript:v13];
        if (!v17)
        {
          uint64_t v18 = self->_pendingMigrations;
          v17 = [MEMORY[0x1E4F1CA60] dictionary];
          [(NSMutableDictionary *)v18 setObject:v17 forKeyedSubscript:v13];
        }
        v19 = [MEMORY[0x1E4F1CA98] null];
        [v17 setObject:v19 forKeyedSubscript:v7];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  self->_needsSave = 1;
  v20 = brc_bread_crumbs();
  objc_super v21 = brc_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[BRCServerPersistedState initiateMigrationQueryForMangledIDs:key:]((uint64_t)self);
  }
}

- (void)abortMigrationsOfMigrationKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pendingMigrations = self->_pendingMigrations;
  if (pendingMigrations)
  {
    id v6 = [(NSMutableDictionary *)pendingMigrations allKeys];
    id v7 = (void *)[v6 copy];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingMigrations, "objectForKeyedSubscript:", v13, (void)v17);
          v15 = v14;
          if (v14)
          {
            [v14 removeObjectForKey:v4];
            if (![v15 count]) {
              [(NSMutableDictionary *)self->_pendingMigrations removeObjectForKey:v13];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    if (![(NSMutableDictionary *)self->_pendingMigrations count])
    {
      uint64_t v16 = self->_pendingMigrations;
      self->_pendingMigrations = 0;
    }
    self->_needsSave = 1;
  }
}

- (id)migrationQueryKeyForMangledID:(id)a3 continuationCursor:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingMigrations, "objectForKeyedSubscript:");
  if (v6)
  {
    v28 = a4;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v7 = +[BRCMigrationQueryOperation allMigrationKeysOrdered];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v8)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(void *)v31;
      *(void *)&long long v9 = 138412546;
      long long v27 = v9;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * v12);
        uint64_t v14 = +[BRCMigrationQueryOperation folderShareAliasesMigrationKey];
        if (([v13 isEqualToString:v14] & 1) == 0) {
          break;
        }
        v15 = +[BRCUserDefaults defaultsForMangledID:v29];
        char v16 = [v15 shouldMigrateFetchShareAliases];

        if (v16) {
          goto LABEL_13;
        }
        long long v17 = brc_bread_crumbs();
        long long v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v27;
          id v35 = v29;
          __int16 v36 = 2112;
          v37 = v17;
          _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring share alias migration key for %@ because the user default is no%@", buf, 0x16u);
        }

LABEL_14:
        if (v10 == ++v12)
        {
          uint64_t v10 = [v7 countByEnumeratingWithState:&v30 objects:v42 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_16;
        }
      }

LABEL_13:
      uint64_t v19 = [v6 objectForKeyedSubscript:v13];
      if (v19)
      {
        uint64_t v22 = (void *)v19;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          uint64_t v22 = 0;
        }
        long long v20 = v22;
        id *v28 = v20;
        long long v23 = brc_bread_crumbs();
        long long v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v26 = prettyPrintQueryCursor(v20);
          *(_DWORD *)buf = 138413058;
          id v35 = v29;
          __int16 v36 = 2112;
          v37 = v13;
          __int16 v38 = 2112;
          v39 = v26;
          __int16 v40 = 2112;
          v41 = v23;
          _os_log_debug_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] pending migration for %@: %@ from cursor:%@%@", buf, 0x2Au);
        }
        id v21 = v13;
        goto LABEL_24;
      }
      goto LABEL_14;
    }
LABEL_16:

    id *v28 = 0;
    id v7 = brc_bread_crumbs();
    long long v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[BRCServerPersistedState migrationQueryKeyForMangledID:continuationCursor:]((uint64_t)v29);
    }
    id v21 = 0;
LABEL_24:
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void)migrationQueryForMangledID:(id)a3 key:(id)a4 didUpdateWithCursor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_pendingMigrations = &self->_pendingMigrations;
  uint64_t v12 = [(NSMutableDictionary *)self->_pendingMigrations objectForKeyedSubscript:v8];
  uint64_t v13 = v12;
  if (v12)
  {
    if (v10)
    {
      [v12 setObject:v10 forKeyedSubscript:v9];
    }
    else
    {
      [v12 removeObjectForKey:v9];
      if (![v13 count])
      {
        [(NSMutableDictionary *)*p_pendingMigrations removeObjectForKey:v8];
        if (![(NSMutableDictionary *)*p_pendingMigrations count])
        {
          char v16 = *p_pendingMigrations;
          *p_pendingMigrations = 0;
        }
      }
    }
    self->_needsSave = 1;
    uint64_t v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCServerPersistedState migrationQueryForMangledID:key:didUpdateWithCursor:](p_pendingMigrations);
    }
  }
  else
  {
    uint64_t v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCServerPersistedState migrationQueryForMangledID:key:didUpdateWithCursor:]((uint64_t)v8);
    }
  }
}

- (id)dumpMigrationQueriesForMangledID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NSMutableDictionary *)self->_pendingMigrations objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28E78] stringWithFormat:@"{"];
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = "";
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __60__BRCServerPersistedState_dumpMigrationQueriesForMangledID___block_invoke;
    uint64_t v12 = &unk_1E699C138;
    id v7 = v6;
    id v13 = v7;
    uint64_t v14 = v15;
    [v5 enumerateKeysAndObjectsUsingBlock:&v9];
    objc_msgSend(v7, "appendString:", @"}", v9, v10, v11, v12);

    _Block_object_dispose(v15, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __60__BRCServerPersistedState_dumpMigrationQueriesForMangledID___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v9 = a3;
  id v10 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = prettyPrintQueryCursor(v11);

  [v7 appendFormat:@"%s%@:%@", v8, v10, v12];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = " ";
  *a4 = 0;
}

- (int64_t)nextRank
{
  return self->_nextRank;
}

- (NSDate)lastSyncDownDate
{
  return self->_lastSyncDownDate;
}

- (BRCServerChangeState)sharedDatabaseChangeState
{
  return (BRCServerChangeState *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSharedDatabaseChangeState:(id)a3
{
}

- (unint64_t)minLastUsedTime
{
  return self->_minLastUsedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDatabaseChangeState, 0);
  objc_storeStrong((id *)&self->_lastSyncDownDate, 0);
  objc_storeStrong((id *)&self->_originalServerPersistedState, 0);
  objc_storeStrong((id *)&self->_pendingMigrations, 0);
}

- (void)initiateMigrationQueryForMangledIDs:(uint64_t)a1 key:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 8);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] pending migrations: %@%@", (void)v3, DWORD2(v3));
}

- (void)migrationQueryKeyForMangledID:(uint64_t)a1 continuationCursor:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] no pending migration for %@%@", (void)v3, DWORD2(v3));
}

- (void)migrationQueryForMangledID:(uint64_t)a1 key:didUpdateWithCursor:.cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_3_1();
  _os_log_fault_impl(&dword_1D353B000, v1, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unknown migration completed for container %@%@", (uint8_t *)&v2, 0x16u);
}

- (void)migrationQueryForMangledID:(void *)a1 key:didUpdateWithCursor:.cold.2(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] pending migrations: %@%@", (void)v3, DWORD2(v3));
}

@end