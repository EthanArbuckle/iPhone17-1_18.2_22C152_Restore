@interface HMELastEventStore
- (BOOL)_executeInsertWithStatement:(uint64_t)a3 query:(void *)a4 key:(void *)a5 value:(void *)a6 eventSource:(int)a7 eventTimestamp:(int)a8 eventCachePolicy:(double)a9 eventCombineType:(int)a10 eventQOS:(unsigned char *)a11 outDidChangeRow:(void *)a12 error:;
- (BOOL)_executeSelectEventByKeyStatementWithKey:(uint64_t)a3 outResult:(void *)a4 error:;
- (BOOL)_prepare:(sqlite3_stmt *)a3 preparedStatement:(void *)a4 error:;
- (BOOL)startup;
- (BOOL)useWal;
- (BOOL)writer:(id)a3 saveEventIfAllowed:(id)a4 topic:(id)a5;
- (BOOL)writer:(id)a3 saveEventIfDifferent:(id)a4 topic:(id)a5;
- (HMELastEventStore)initWithFileName:(id)a3;
- (HMELastEventStore)initWithFileName:(id)a3 useWal:(BOOL)a4;
- (NSString)fileName;
- (NSString)integrityCheckError;
- (NSString)readJournalMode;
- (id)_errorFromSqlContext:(sqlite3 *)a1 statement:(uint64_t)a2;
- (id)eventsForTopicFilters:(id)a3;
- (id)eventsForTopicFilters:(id)a3 sinceReferenceTimestamp:(double)a4;
- (id)initInMemoryStore;
- (id)lastEventForTopic:(id)a3;
- (uint64_t)_cleanupResetRecreateAndRestartAfterIntegrityError;
- (uint64_t)_doesCachePolicyAllowSaveForEvent:(uint64_t)a1;
- (uint64_t)_startupWithRepair:(void *)a1;
- (void)dealloc;
- (void)resetBeforeReferenceTimestamp:(double)a3;
- (void)resetEventStore;
- (void)resetTopic:(id)a3;
- (void)resetWildcardTopics:(id)a3;
- (void)setIntegrityCheckError:(id)a3;
- (void)setReadJournalMode:(id)a3;
- (void)writer:(id)a3 saveEvent:(id)a4 topic:(id)a5;
@end

@implementation HMELastEventStore

- (HMELastEventStore)initWithFileName:(id)a3
{
  return [(HMELastEventStore *)self initWithFileName:a3 useWal:1];
}

- (id)initInMemoryStore
{
  return [(HMELastEventStore *)self initWithFileName:@":memory:"];
}

- (BOOL)startup
{
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Starting up last event store", v7, 2u);
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  char v5 = -[HMELastEventStore _startupWithRepair:](self, 0);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (uint64_t)_startupWithRepair:(void *)a1
{
  uint64_t v2 = (uint64_t)a1;
  *(void *)&v73[13] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return v2;
  }
  [a1 setReadJournalMode:0];
  [(id)v2 setIntegrityCheckError:0];
  id v4 = [(id)v2 fileName];
  char v5 = (sqlite3 **)(v2 + 16);
  int v6 = sqlite3_open_v2((const char *)[v4 UTF8String], (sqlite3 **)(v2 + 16), 6, 0);

  if (!v6)
  {
    v9 = [(id)v2 fileName];
    int v10 = [v9 isEqualToString:@":memory:"];

    if ((v10 & 1) == 0)
    {
      LOBYTE(value) = -1;
      id v11 = [(id)v2 fileName];
      int v12 = setxattr((const char *)[v11 UTF8String], "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0);

      if (v12 < 0)
      {
        v16 = *(NSObject **)(v2 + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = v16;
          v18 = [(id)v2 fileName];
          int v19 = *__error();
          v20 = __error();
          v21 = strerror(*v20);
          *(_DWORD *)buf = 138412802;
          v71 = v18;
          __int16 v72 = 1024;
          *(_DWORD *)v73 = v19;
          v73[2] = 2080;
          *(void *)&v73[3] = v21;
          _os_log_error_impl(&dword_19D557000, v17, OS_LOG_TYPE_ERROR, "Could not set RunningBoard file lock exception attribute at %@: [%i] %s", buf, 0x1Cu);
        }
        return 0;
      }
    }
    value = 0;
    if ([(id)v2 useWal])
    {
      if (sqlite3_exec(*(sqlite3 **)(v2 + 16), "pragma journal_mode;",
             (int (__cdecl *)(void *, int, char **, char **))pragmaCallback,
             (void *)v2,
             &value))
      {
        v13 = [NSString stringWithCString:value encoding:4];
        v14 = *(NSObject **)(v2 + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v71 = v13;
          _os_log_error_impl(&dword_19D557000, v14, OS_LOG_TYPE_ERROR, "Unable to read journal_mode %@", buf, 0xCu);
          if (a2) {
            goto LABEL_12;
          }
        }
        else if (a2)
        {
LABEL_12:
          v15 = *(NSObject **)(v2 + 8);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_19D557000, v15, OS_LOG_TYPE_ERROR, "Already attempted repair, fail.", buf, 2u);
          }
          sqlite3_close_v2(*v5);
          uint64_t v2 = 0;
          *char v5 = 0;
LABEL_66:

          return v2;
        }
        if (sqlite3_exec(*(sqlite3 **)(v2 + 16), "pragma integrity_check;",
               (int (__cdecl *)(void *, int, char **, char **))integrityCheckCallback,
               (void *)v2,
               &value))
        {
          uint64_t v52 = [NSString stringWithCString:value encoding:4];

          v53 = *(NSObject **)(v2 + 8);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v71 = (void *)v52;
            _os_log_error_impl(&dword_19D557000, v53, OS_LOG_TYPE_ERROR, "Could not perform integrity check failed %@", buf, 0xCu);
          }
          sqlite3_close_v2(*(sqlite3 **)(v2 + 16));
          *(void *)(v2 + 16) = 0;
          uint64_t v2 = -[HMELastEventStore _cleanupResetRecreateAndRestartAfterIntegrityError]((void *)v2);
          v13 = (void *)v52;
        }
        else
        {
          v54 = [(id)v2 integrityCheckError];

          if (v54)
          {
            uint64_t v2 = -[HMELastEventStore _cleanupResetRecreateAndRestartAfterIntegrityError]((void *)v2);
          }
          else
          {
            v55 = *(NSObject **)(v2 + 8);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19D557000, v55, OS_LOG_TYPE_ERROR, "Unable to read journal mode but no integrity error, fail.", buf, 2u);
            }
            uint64_t v2 = 0;
          }
        }
        goto LABEL_66;
      }
      uint64_t v22 = [(id)v2 readJournalMode];
      if (!v22)
      {
        [(id)v2 useWal];
        goto LABEL_39;
      }
      v23 = (void *)v22;
      v24 = [(id)v2 readJournalMode];
      v25 = [v24 lowercaseString];
      char v26 = [v25 isEqualToString:@"wal"];

      if (v26 & 1) != 0 || (a2)
      {
LABEL_31:
        int v34 = [(id)v2 useWal];
        if ((v26 & 1) == 0 && v34)
        {
          if (sqlite3_exec(*v5, "pragma journal_mode=wal;", 0, 0, &value))
          {
            v27 = [NSString stringWithCString:value encoding:4];
            v35 = *(NSObject **)(v2 + 8);
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
LABEL_35:
              sqlite3_close_v2(*v5);
              *char v5 = 0;

              return 0;
            }
            *(_DWORD *)buf = 138412290;
            v71 = v27;
            v59 = "Setting WAL failed %@";
LABEL_76:
            _os_log_error_impl(&dword_19D557000, v35, OS_LOG_TYPE_ERROR, v59, buf, 0xCu);
            goto LABEL_35;
          }
          v36 = *(NSObject **)(v2 + 8);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D557000, v36, OS_LOG_TYPE_DEFAULT, "Successfully set WAL Mode.", buf, 2u);
          }
        }
LABEL_39:
        v37 = [NSString stringWithFormat:@"PRAGMA cache_size = %@", &unk_1EEF0C428];;
        v38 = *v5;
        id v39 = v37;
        if (sqlite3_exec(v38, (const char *)[v39 UTF8String], 0, 0, &value))
        {
          id v40 = [NSString stringWithCString:value encoding:4];
          v41 = *(NSObject **)(v2 + 8);
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
LABEL_41:
            uint64_t v2 = 0;
LABEL_48:

            return v2;
          }
          *(_DWORD *)buf = 138412546;
          v71 = &unk_1EEF0C428;
          __int16 v72 = 2112;
          *(void *)v73 = v40;
          v56 = "Unable to set hme sqlite cache size to %@, %@";
          v57 = v41;
          uint32_t v58 = 22;
LABEL_68:
          _os_log_error_impl(&dword_19D557000, v57, OS_LOG_TYPE_ERROR, v56, buf, v58);
          goto LABEL_41;
        }
        if (sqlite3_exec(*v5, "CREATE TABLE IF NOT EXISTS eventstore (id integer primary key autoincrement, key string not null unique, value blob not null, m_source string not null, m_timestamp double not null, m_cachepolicy integer not null, m_combinetype not null, m_qos integer not null);",
               0,
               0,
               &value))
        {
          id v40 = [NSString stringWithCString:value encoding:4];
          v42 = *(NSObject **)(v2 + 8);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v40;
            v43 = "Unable to create eventstore table %@";
LABEL_83:
            _os_log_error_impl(&dword_19D557000, v42, OS_LOG_TYPE_ERROR, v43, buf, 0xCu);
            goto LABEL_47;
          }
          goto LABEL_47;
        }
        if (sqlite3_exec(*v5, "CREATE INDEX IF NOT EXISTS eventstore_key_index on eventstore (key);", 0, 0, &value))
        {
          id v40 = [NSString stringWithCString:value encoding:4];
          v42 = *(NSObject **)(v2 + 8);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v40;
            v43 = "Unable to create index %@";
            goto LABEL_83;
          }
LABEL_47:
          sqlite3_close_v2(*v5);
          uint64_t v2 = 0;
          *char v5 = 0;
          goto LABEL_48;
        }
        id v68 = 0;
        BOOL v44 = -[HMELastEventStore _prepare:preparedStatement:error:](v2, "replace into eventstore (key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos) values (?1, ?2, ?3, ?4, ?5, ?6, ?7);",
                (sqlite3_stmt **)(v2 + 24),
                &v68);
        id v45 = v68;
        id v40 = v45;
        if (v44)
        {
          id v67 = v45;
          BOOL v46 = -[HMELastEventStore _prepare:preparedStatement:error:](v2, "select key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos from eventstore where key = ?1;",
                  (sqlite3_stmt **)(v2 + 40),
                  &v67);
          id v47 = v67;

          if (!v46)
          {
            v61 = *(NSObject **)(v2 + 8);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v71 = v47;
              v62 = "Unable to prepare select event statement error: %@";
LABEL_79:
              _os_log_error_impl(&dword_19D557000, v61, OS_LOG_TYPE_ERROR, v62, buf, 0xCu);
            }
LABEL_85:
            uint64_t v2 = 0;
            goto LABEL_86;
          }
          id v66 = v47;
          BOOL v48 = -[HMELastEventStore _prepare:preparedStatement:error:](v2, "delete from eventstore where key = ?1;",
                  (sqlite3_stmt **)(v2 + 48),
                  &v66);
          id v40 = v66;

          if (v48)
          {
            id v65 = v40;
            BOOL v49 = -[HMELastEventStore _prepare:preparedStatement:error:](v2, "delete from eventstore where key like '%' || ?1 || '%';",
                    (sqlite3_stmt **)(v2 + 56),
                    &v65);
            id v47 = v65;

            if (!v49)
            {
              v61 = *(NSObject **)(v2 + 8);
              if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                goto LABEL_85;
              }
              *(_DWORD *)buf = 138412290;
              v71 = v47;
              v62 = "Unable to prepare delete event like statement error: %@";
              goto LABEL_79;
            }
            id v64 = v47;
            BOOL v50 = -[HMELastEventStore _prepare:preparedStatement:error:](v2, "delete from eventstore where m_timestamp < ?1;",
                    (sqlite3_stmt **)(v2 + 64),
                    &v64);
            id v40 = v64;

            if (v50)
            {
              id v63 = v40;
              BOOL v51 = -[HMELastEventStore _prepare:preparedStatement:error:](v2, "insert into eventstore (key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos) values (?1, ?2, ?3, ?4, ?5, ?6, ?7) on conflict(key) do update set value=excluded.value, m_source = excluded.m_source, m_timestamp = excluded.m_timestamp, m_cachepolicy = excluded.m_cachepolicy, m_combinetype = excluded.m_combinetype, m_qos = excluded.m_qos where (excluded.m_timestamp > eventstore.m_timestamp OR excluded.m_source != eventstore.m_source);",
                      (sqlite3_stmt **)(v2 + 32),
                      &v63);
              id v47 = v63;

              if (v51)
              {
                uint64_t v2 = 1;
LABEL_86:
                id v40 = v47;
                goto LABEL_48;
              }
              v61 = *(NSObject **)(v2 + 8);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v71 = v47;
                v62 = "Unable to prepare insert if most recent event statement: %@";
                goto LABEL_79;
              }
              goto LABEL_85;
            }
            v60 = *(NSObject **)(v2 + 8);
            if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
              goto LABEL_41;
            }
            *(_DWORD *)buf = 138412290;
            v71 = v40;
            v56 = "Unable to prepare delete before timestamp statement error: %@";
          }
          else
          {
            v60 = *(NSObject **)(v2 + 8);
            if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
              goto LABEL_41;
            }
            *(_DWORD *)buf = 138412290;
            v71 = v40;
            v56 = "Unable to prepare delete event statement error: %@";
          }
        }
        else
        {
          v60 = *(NSObject **)(v2 + 8);
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            goto LABEL_41;
          }
          *(_DWORD *)buf = 138412290;
          v71 = v40;
          v56 = "Unable to prepare insert statement error: %@";
        }
        v57 = v60;
        uint32_t v58 = 12;
        goto LABEL_68;
      }
      if (sqlite3_exec(*(sqlite3 **)(v2 + 16), "pragma integrity_check;",
             (int (__cdecl *)(void *, int, char **, char **))integrityCheckCallback,
             (void *)v2,
             &value))
      {
        if (value)
        {
          v27 = [NSString stringWithCString:value encoding:4];
        }
        else
        {
          v27 = 0;
        }
        v35 = *(NSObject **)(v2 + 8);
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          goto LABEL_35;
        }
        *(_DWORD *)buf = 138412290;
        v71 = v27;
        v59 = "Integrity check failed %@";
        goto LABEL_76;
      }
      v33 = [(id)v2 integrityCheckError];

      if (v33) {
        return -[HMELastEventStore _cleanupResetRecreateAndRestartAfterIntegrityError]((void *)v2);
      }
    }
    char v26 = 0;
    goto LABEL_31;
  }
  v7 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v28 = v7;
    v29 = [(id)v2 fileName];
    int v30 = [v29 isEqualToString:@":memory:"];

    if (v30) {
      v31 = @"in memory";
    }
    else {
      v31 = @"on disk";
    }
    v32 = [(id)v2 fileName];
    *(_DWORD *)buf = 138412546;
    v71 = v31;
    __int16 v72 = 2112;
    *(void *)v73 = v32;
    _os_log_error_impl(&dword_19D557000, v28, OS_LOG_TYPE_ERROR, "Unable to open %@ sqlite DB (%@)", buf, 0x16u);
  }
  sqlite3_close_v2(*v5);
  uint64_t v2 = 0;
  *char v5 = 0;
  return v2;
}

- (BOOL)_prepare:(sqlite3_stmt *)a3 preparedStatement:(void *)a4 error:
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 72));
  int v8 = sqlite3_prepare_v2(*(sqlite3 **)(a1 + 16), a2, -1, a3, 0);
  BOOL result = v8 == 0;
  if (a4)
  {
    if (v8)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), (uint64_t)a2);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a4 = v10;
    }
  }
  return result;
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)readJournalMode
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)useWal
{
  return self->_useWal;
}

- (void)setReadJournalMode:(id)a3
{
}

- (void)setIntegrityCheckError:(id)a3
{
}

- (HMELastEventStore)initWithFileName:(id)a3 useWal:(BOOL)a4
{
  int v6 = (NSString *)a3;
  v12.receiver = self;
  v12.super_class = (Class)HMELastEventStore;
  v7 = [(HMELastEventStore *)&v12 init];
  os_log_t v8 = os_log_create("com.apple.HomeKitEventRouter", "HMELastEventStore");
  logger = v7->_logger;
  v7->_logger = (OS_os_log *)v8;

  v7->_lock._os_unfair_lock_opaque = 0;
  fileName = v7->_fileName;
  v7->_fileName = v6;

  v7->_useWal = a4;
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_integrityCheckError, 0);
  objc_storeStrong((id *)&self->_readJournalMode, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (NSString)integrityCheckError
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)writer:(id)a3 saveEventIfDifferent:(id)a4 topic:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (!-[HMELastEventStore _doesCachePolicyAllowSaveForEvent:]((uint64_t)self, v7))
  {
LABEL_8:
    BOOL v26 = 0;
    goto LABEL_12;
  }
  replaceEventIfMoreRecentOrDifferentSourcePreparedStatement = self->replaceEventIfMoreRecentOrDifferentSourcePreparedStatement;
  if (!replaceEventIfMoreRecentOrDifferentSourcePreparedStatement)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v8;
      _os_log_error_impl(&dword_19D557000, logger, OS_LOG_TYPE_ERROR, "Error executing insert statement topic: %@, replaceEventIfMoreRecentOrDifferentSourcePreparedStatement is nil", buf, 0xCu);
    }
    goto LABEL_8;
  }
  unsigned __int8 v33 = 0;
  id v10 = [v7 encodedData];
  int v30 = [v7 eventMetadata];
  v28 = [v30 source];
  v29 = [v7 eventMetadata];
  [v29 intervalSinceReferenceDate];
  double v12 = v11;
  v13 = [v7 eventMetadata];
  int v14 = [v13 rawCachePolicy];
  v15 = [v7 eventMetadata];
  int v16 = [v15 rawCombineType];
  v17 = [v7 eventMetadata];
  id v31 = v8;
  id v32 = 0;
  BOOL v18 = -[HMELastEventStore _executeInsertWithStatement:query:key:value:eventSource:eventTimestamp:eventCachePolicy:eventCombineType:eventQOS:outDidChangeRow:error:]((uint64_t)self, replaceEventIfMoreRecentOrDifferentSourcePreparedStatement, (uint64_t)"insert into eventstore (key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos) values (?1, ?2, ?3, ?4, ?5, ?6, ?7) on conflict(key) do update set value=excluded.value, m_source = excluded.m_source, m_timestamp = excluded.m_timestamp, m_cachepolicy = excluded.m_cachepolicy, m_combinetype = excluded.m_combinetype, m_qos = excluded.m_qos where (excluded.m_timestamp > eventstore.m_timestamp OR excluded.m_source != eventstore.m_source);",
          v8,
          v10,
          v28,
          v14,
          v16,
          v12,
          [v17 rawQOS],
          &v33,
          &v32);
  id v19 = v32;

  v20 = self->_logger;
  if (v18)
  {
    id v8 = v31;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = NSNumber;
      uint64_t v22 = v33;
      v23 = v20;
      v24 = [v21 numberWithBool:v22];
      *(_DWORD *)buf = 138412546;
      id v35 = v31;
      __int16 v36 = 2112;
      id v37 = v24;
      _os_log_impl(&dword_19D557000, v23, OS_LOG_TYPE_DEFAULT, "Processed save request for topic: %@, didChange: %@", buf, 0x16u);
    }
  }
  else
  {
    id v8 = v31;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v35 = v31;
      __int16 v36 = 2112;
      id v37 = v19;
      _os_log_error_impl(&dword_19D557000, v20, OS_LOG_TYPE_ERROR, "Error executing insert statement topic: %@, error: %@", buf, 0x16u);
    }
  }
  BOOL v26 = v33 != 0;

LABEL_12:
  return v26;
}

- (uint64_t)_doesCachePolicyAllowSaveForEvent:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    char v5 = [v3 eventMetadata];
    uint64_t v6 = [v5 cachePolicy];

    if (v6 == 2)
    {
      a1 = 1;
      goto LABEL_8;
    }
    if (v6) {
      goto LABEL_6;
    }
    id v7 = *(NSObject **)(a1 + 8);
    a1 = 0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = NSNumber;
      v9 = v7;
      id v10 = [v4 eventMetadata];
      double v11 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v10, "rawCachePolicy"));
      int v13 = 138412290;
      int v14 = v11;
      _os_log_impl(&dword_19D557000, v9, OS_LOG_TYPE_DEFAULT, "Unrecognized cache policy, will not cache. %@", (uint8_t *)&v13, 0xCu);

LABEL_6:
      a1 = 0;
    }
  }
LABEL_8:

  return a1;
}

- (BOOL)_executeInsertWithStatement:(uint64_t)a3 query:(void *)a4 key:(void *)a5 value:(void *)a6 eventSource:(int)a7 eventTimestamp:(int)a8 eventCachePolicy:(double)a9 eventCombineType:(int)a10 eventQOS:(unsigned char *)a11 outDidChangeRow:(void *)a12 error:
{
  id v19 = a4;
  id v20 = a5;
  id v26 = a6;
  if (!a1)
  {
    BOOL v22 = 0;
    goto LABEL_26;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if (!sqlite3_bind_text(a2, 1, (const char *)[v19 UTF8String], -1, 0))
  {
    id v21 = v20;
    if (!sqlite3_bind_blob64(a2, 2, (const void *)[v21 bytes], objc_msgSend(v21, "length"), 0)
      && !sqlite3_bind_text(a2, 3, (const char *)[v26 UTF8String], -1, 0)
      && !sqlite3_bind_double(a2, 4, a9)
      && !sqlite3_bind_int(a2, 5, a7)
      && !sqlite3_bind_int(a2, 6, a8)
      && !sqlite3_bind_int(a2, 7, a10))
    {
      int v23 = sqlite3_step(a2);
      BOOL v22 = v23 == 101;
      if (v23 == 101)
      {
        if (sqlite3_changes(*(sqlite3 **)(a1 + 16)) >= 1) {
          *a11 = 1;
        }
      }
      else if (a12)
      {
        -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), 0);
        *a12 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (sqlite3_clear_bindings(a2))
      {
        if (a12 && !*a12)
        {
          -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), a3);
          BOOL v22 = 0;
          *a12 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v22 = 0;
        }
      }
      if (!sqlite3_reset(a2)) {
        goto LABEL_25;
      }
      if (a12 && !*a12) {
        goto LABEL_10;
      }
LABEL_24:
      BOOL v22 = 0;
      goto LABEL_25;
    }
  }
  if (!a12) {
    goto LABEL_24;
  }
LABEL_10:
  -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), a3);
  BOOL v22 = 0;
  *a12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
LABEL_26:

  return v22;
}

- (id)_errorFromSqlContext:(sqlite3 *)a1 statement:(uint64_t)a2
{
  v13[4] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  v12[0] = @"code";
  char v5 = [NSNumber numberWithInt:sqlite3_errcode(a1)];
  v13[0] = v5;
  v12[1] = @"extendedCode";
  uint64_t v6 = [NSNumber numberWithInt:sqlite3_extended_errcode(a1)];
  v13[1] = v6;
  v12[2] = @"text";
  id v7 = [NSString stringWithUTF8String:sqlite3_errmsg(a1)];
  v13[2] = v7;
  v12[3] = @"command";
  if (a2)
  {
    id v8 = [NSString stringWithUTF8String:a2];
  }
  else
  {
    id v8 = &stru_1EEF095E0;
  }
  v13[3] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  id v10 = [v4 errorWithDomain:@"HMEErrorDomain" code:5 userInfo:v9];

  if (a2) {
  return v10;
  }
}

- (BOOL)writer:(id)a3 saveEventIfAllowed:(id)a4 topic:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = -[HMELastEventStore _doesCachePolicyAllowSaveForEvent:]((uint64_t)self, v9);
  if (v11) {
    [(HMELastEventStore *)self writer:v8 saveEvent:v9 topic:v10];
  }

  return v11;
}

- (void)writer:(id)a3 saveEvent:(id)a4 topic:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  insertEventPreparedStatement = self->insertEventPreparedStatement;
  if (insertEventPreparedStatement)
  {
    id v26 = v8;
    v24 = [v9 encodedData];
    v25 = [v9 eventMetadata];
    int v23 = [v25 source];
    double v12 = [v9 eventMetadata];
    [v12 intervalSinceReferenceDate];
    double v14 = v13;
    uint64_t v15 = [v9 eventMetadata];
    int v16 = [v15 rawCachePolicy];
    v17 = [v9 eventMetadata];
    int v18 = [v17 rawCombineType];
    id v19 = [v9 eventMetadata];
    id v27 = 0;
    LOBYTE(v16) = -[HMELastEventStore _executeInsertWithStatement:query:key:value:eventSource:eventTimestamp:eventCachePolicy:eventCombineType:eventQOS:outDidChangeRow:error:]((uint64_t)self, insertEventPreparedStatement, (uint64_t)"replace into eventstore (key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos) values (?1, ?2, ?3, ?4, ?5, ?6, ?7);",
                    v10,
                    v24,
                    v23,
                    v16,
                    v18,
                    v14,
                    [v19 rawQOS],
                    &v28,
                    &v27);
    id v20 = v27;

    logger = self->_logger;
    if (v16)
    {
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v10;
        _os_log_impl(&dword_19D557000, logger, OS_LOG_TYPE_DEFAULT, "Saved event for topic: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v10;
      __int16 v31 = 2112;
      id v32 = v20;
      _os_log_error_impl(&dword_19D557000, logger, OS_LOG_TYPE_ERROR, "Error executing insert statement topic: %@, error: %@", buf, 0x16u);
    }

    id v8 = v26;
  }
  else
  {
    BOOL v22 = self->_logger;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v10;
      _os_log_error_impl(&dword_19D557000, v22, OS_LOG_TYPE_ERROR, "Error executing insert statement topic: %@, insertEventPreparedStatement is nil", buf, 0xCu);
    }
  }
}

- (void)resetWildcardTopics:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self)
  {
LABEL_7:
    id v7 = 0;
    goto LABEL_8;
  }
  if (!self->deleteEventByKeyLikePreparedStatement)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_error_impl(&dword_19D557000, logger, OS_LOG_TYPE_ERROR, "Error executing delete statement key: %@, deleteEventByKeyLikePreparedStatement is nil", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_7;
  }
  os_unfair_lock_lock(&self->_lock);
  deleteEventByKeyLikePreparedStatement = self->deleteEventByKeyLikePreparedStatement;
  id v6 = v4;
  if (sqlite3_bind_text(deleteEventByKeyLikePreparedStatement, 1, (const char *)[v6 UTF8String], -1, 0))
  {
    -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key like '%' || ?1 || '%';");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
LABEL_8:

    id v9 = v7;
LABEL_9:
    id v10 = self->_logger;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_error_impl(&dword_19D557000, v10, OS_LOG_TYPE_ERROR, "Error executing delete like statement topicSubstring:%@ error:%@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_11;
  }
  int v11 = sqlite3_step(self->deleteEventByKeyLikePreparedStatement);
  if (v11 == 101)
  {
    id v12 = 0;
  }
  else
  {
    -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key like '%' || ?1 || '%';");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  int v13 = sqlite3_clear_bindings(self->deleteEventByKeyLikePreparedStatement);
  BOOL v15 = v11 == 101 && v13 == 0;
  if (v13)
  {
    if (!v12)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key like '%' || ?1 || '%';");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v15 = 0;
  }
  if (sqlite3_reset(self->deleteEventByKeyLikePreparedStatement))
  {
    if (!v12)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key like '%' || ?1 || '%';");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v15 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);

  id v9 = v12;
  if (!v15) {
    goto LABEL_9;
  }
LABEL_11:
}

- (void)resetTopic:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self)
  {
LABEL_7:
    id v7 = 0;
    goto LABEL_8;
  }
  if (!self->deleteEventByKeyPreparedStatement)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_error_impl(&dword_19D557000, logger, OS_LOG_TYPE_ERROR, "Error executing delete statement key: %@, deleteEventByKeyPreparedStatement is nil", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_7;
  }
  os_unfair_lock_lock(&self->_lock);
  deleteEventByKeyPreparedStatement = self->deleteEventByKeyPreparedStatement;
  id v6 = v4;
  if (sqlite3_bind_text(deleteEventByKeyPreparedStatement, 1, (const char *)[v6 UTF8String], -1, 0))
  {
    -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key = ?1;");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
LABEL_8:

    id v9 = v7;
LABEL_9:
    id v10 = self->_logger;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_error_impl(&dword_19D557000, v10, OS_LOG_TYPE_ERROR, "Error executing delete statement topic:%@ error:%@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_11;
  }
  int v11 = sqlite3_step(self->deleteEventByKeyPreparedStatement);
  if (v11 == 101)
  {
    id v12 = 0;
  }
  else
  {
    -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key = ?1;");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  int v13 = sqlite3_clear_bindings(self->deleteEventByKeyPreparedStatement);
  BOOL v15 = v11 == 101 && v13 == 0;
  if (v13)
  {
    if (!v12)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key = ?1;");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v15 = 0;
  }
  if (sqlite3_reset(self->deleteEventByKeyPreparedStatement))
  {
    if (!v12)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where key = ?1;");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v15 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);

  id v9 = v12;
  if (!v15) {
    goto LABEL_9;
  }
LABEL_11:
}

- (void)resetBeforeReferenceTimestamp:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self)
  {
LABEL_7:
    id v5 = 0;
    goto LABEL_8;
  }
  if (!self->deleteBeforeTimestampPreparedStatement)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      int v14 = 134217984;
      double v15 = a3;
      _os_log_error_impl(&dword_19D557000, logger, OS_LOG_TYPE_ERROR, "Error executing delete statement timestamp: %f, deleteBeforeTimestampPreparedStatement is nil", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_7;
  }
  os_unfair_lock_lock(&self->_lock);
  if (sqlite3_bind_double(self->deleteBeforeTimestampPreparedStatement, 1, a3))
  {
    -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where m_timestamp < ?1;");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
LABEL_8:
    id v7 = v5;
LABEL_9:
    id v8 = self->_logger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      double v15 = *(double *)&v7;
      _os_log_error_impl(&dword_19D557000, v8, OS_LOG_TYPE_ERROR, "Error executing delete statement %@", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_11;
  }
  int v9 = sqlite3_step(self->deleteBeforeTimestampPreparedStatement);
  if (v9 == 101)
  {
    id v10 = 0;
  }
  else
  {
    -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  int v11 = sqlite3_clear_bindings(self->deleteBeforeTimestampPreparedStatement);
  BOOL v13 = v9 == 101 && v11 == 0;
  if (v11)
  {
    if (!v10)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where m_timestamp < ?1;");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v13 = 0;
  }
  if (sqlite3_reset(self->deleteBeforeTimestampPreparedStatement))
  {
    if (!v10)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](self->_db, (uint64_t)"delete from eventstore where m_timestamp < ?1;");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v13 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  id v7 = v10;
  if (!v13) {
    goto LABEL_9;
  }
LABEL_11:
}

- (id)lastEventForTopic:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = 0;
  id v18 = 0;
  id v15 = 0;
  BOOL v5 = -[HMELastEventStore _executeSelectEventByKeyStatementWithKey:outResult:error:]((uint64_t)self, v4, (uint64_t)&v16, &v15);
  id v6 = v15;
  if (v5)
  {
    id v7 = v17;
    if (v17)
    {
      id v8 = [HMEEventMetadata alloc];
      id v9 = [(HMEEventMetadata *)v8 _initWithSource:v18 rawCachePolicy:v20 rawCombineType:v21 rawQos:v22 timestamp:v19];
      id v10 = [[HMEEvent alloc] initWithEventData:v7 metadata:v9];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v4;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_error_impl(&dword_19D557000, logger, OS_LOG_TYPE_ERROR, "Error executing select for topic: %@, error: %@", buf, 0x16u);
    }
    id v10 = 0;
    id v7 = v17;
  }
  id v12 = v16;
  BOOL v13 = v10;

  return v13;
}

- (BOOL)_executeSelectEventByKeyStatementWithKey:(uint64_t)a3 outResult:(void *)a4 error:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (!a1)
  {
LABEL_9:
    BOOL v9 = 0;
    goto LABEL_32;
  }
  if (!*(void *)(a1 + 40))
  {
    id v8 = *(NSObject **)(a1 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138412290;
      id v22 = v7;
      _os_log_error_impl(&dword_19D557000, v8, OS_LOG_TYPE_ERROR, "Error executing select statement key: %@, selectEventByKeyPreparedStatement is nil", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_9;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 1, (const char *)[v7 UTF8String], -1, 0))
  {
    if (a4)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), (uint64_t)"select key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos from eventstore where key = ?1;");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    goto LABEL_9;
  }
  int v10 = sqlite3_step(*(sqlite3_stmt **)(a1 + 40));
  if (v10 == 100)
  {
    uint64_t v11 = NSStringFromSQLiteStatement(*(sqlite3_stmt **)(a1 + 40), 0);
    id v12 = *(void **)a3;
    *(void *)a3 = v11;

    BOOL v13 = *(sqlite3_stmt **)(a1 + 40);
    int v14 = sqlite3_column_blob(v13, 1);
    if (v14)
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v14, sqlite3_column_bytes(v13, 1));
    }
    else if (sqlite3_column_type(v13, 1) == 5)
    {
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9B8] data];
    }
    uint64_t v16 = *(void **)(a3 + 8);
    *(void *)(a3 + 8) = v15;

    uint64_t v17 = NSStringFromSQLiteStatement(*(sqlite3_stmt **)(a1 + 40), 2);
    id v18 = *(void **)(a3 + 16);
    *(void *)(a3 + 16) = v17;

    *(double *)(a3 + 24) = sqlite3_column_double(*(sqlite3_stmt **)(a1 + 40), 3);
    *(_DWORD *)(a3 + 32) = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 40), 4);
    *(_DWORD *)(a3 + 36) = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 40), 5);
    *(_DWORD *)(a3 + 40) = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 40), 6);
    int v10 = sqlite3_step(*(sqlite3_stmt **)(a1 + 40));
  }
  BOOL v9 = v10 == 101;
  if (v10 != 101)
  {
    double v19 = *(NSObject **)(a1 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_error_impl(&dword_19D557000, v19, OS_LOG_TYPE_ERROR, "Unexpected status when performing select query", (uint8_t *)&v21, 2u);
      if (!a4) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    if (a4)
    {
LABEL_20:
      -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), (uint64_t)"select key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos from eventstore where key = ?1;");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_21:
  if (sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40)))
  {
    if (a4 && !*a4)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), (uint64_t)"select key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos from eventstore where key = ?1;");
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  if (sqlite3_reset(*(sqlite3_stmt **)(a1 + 40)))
  {
    if (a4 && !*a4)
    {
      -[HMELastEventStore _errorFromSqlContext:statement:](*(sqlite3 **)(a1 + 16), (uint64_t)"select key, value, m_source, m_timestamp, m_cachepolicy, m_combinetype, m_qos from eventstore where key = ?1;");
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
LABEL_32:

  return v9;
}

- (id)eventsForTopicFilters:(id)a3
{
  return [(HMELastEventStore *)self eventsForTopicFilters:a3 sinceReferenceTimestamp:0.0];
}

- (id)eventsForTopicFilters:(id)a3 sinceReferenceTimestamp:(double)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v21 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v23 = 0;
        id v24 = 0;
        id v25 = 0;
        id v22 = 0;
        BOOL v12 = -[HMELastEventStore _executeSelectEventByKeyStatementWithKey:outResult:error:]((uint64_t)self, v11, (uint64_t)&v23, &v22);
        id v13 = v22;
        if (v12)
        {
          int v14 = v24;
          if (v24)
          {
            double v15 = v26;
            if (v26 >= a4)
            {
              uint64_t v16 = [HMEEventMetadata alloc];
              id v17 = [(HMEEventMetadata *)v16 _initWithSource:v25 rawCachePolicy:v27 rawCombineType:v28 rawQos:v29 timestamp:v15];
              id v18 = [[HMEEvent alloc] initWithEventData:v14 metadata:v17];
              [v21 setObject:v18 forKeyedSubscript:v11];
            }
          }
        }
        else
        {
          logger = self->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v35 = v11;
            __int16 v36 = 2112;
            id v37 = v13;
            _os_log_error_impl(&dword_19D557000, logger, OS_LOG_TYPE_ERROR, "Error executing select for topic: %@, error: %@", buf, 0x16u);
          }
          int v14 = v24;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v8);
  }

  return v21;
}

- (void)resetEventStore
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  errmsg = 0;
  if (sqlite3_exec(self->_db, "DELETE FROM eventstore;", 0, 0, &errmsg))
  {
    id v4 = [NSString stringWithCString:errmsg encoding:4];
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = v4;
      _os_log_error_impl(&dword_19D557000, logger, OS_LOG_TYPE_ERROR, "Unable to reset events in sqlite DB %@", buf, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (uint64_t)_cleanupResetRecreateAndRestartAfterIntegrityError
{
  uint64_t v2 = (sqlite3 *)a1[2];
  if (v2)
  {
    sqlite3_close_v2(v2);
    a1[2] = 0;
  }
  id v3 = a1[1];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D557000, v3, OS_LOG_TYPE_DEFAULT, "Recreating database on integrity check failure.", buf, 2u);
  }
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v5 = [a1 fileName];
  id v12 = 0;
  int v6 = [v4 removeItemAtPath:v5 error:&v12];
  id v7 = v12;

  if (v6)
  {
    uint64_t v8 = a1[1];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_19D557000, v8, OS_LOG_TYPE_DEFAULT, "Restart after DB removal.", v11, 2u);
    }
    uint64_t v9 = -[HMELastEventStore _startupWithRepair:](a1, 1);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  insertEventPreparedStatement = self->insertEventPreparedStatement;
  if (insertEventPreparedStatement)
  {
    sqlite3_finalize(insertEventPreparedStatement);
    self->insertEventPreparedStatement = 0;
  }
  replaceEventIfMoreRecentOrDifferentSourcePreparedStatement = self->replaceEventIfMoreRecentOrDifferentSourcePreparedStatement;
  if (replaceEventIfMoreRecentOrDifferentSourcePreparedStatement)
  {
    sqlite3_finalize(replaceEventIfMoreRecentOrDifferentSourcePreparedStatement);
    self->replaceEventIfMoreRecentOrDifferentSourcePreparedStatement = 0;
  }
  selectEventByKeyPreparedStatement = self->selectEventByKeyPreparedStatement;
  if (selectEventByKeyPreparedStatement)
  {
    sqlite3_finalize(selectEventByKeyPreparedStatement);
    self->selectEventByKeyPreparedStatement = 0;
  }
  deleteEventByKeyPreparedStatement = self->deleteEventByKeyPreparedStatement;
  if (deleteEventByKeyPreparedStatement)
  {
    sqlite3_finalize(deleteEventByKeyPreparedStatement);
    self->deleteEventByKeyPreparedStatement = 0;
  }
  deleteEventByKeyLikePreparedStatement = self->deleteEventByKeyLikePreparedStatement;
  if (deleteEventByKeyLikePreparedStatement)
  {
    sqlite3_finalize(deleteEventByKeyLikePreparedStatement);
    self->deleteEventByKeyLikePreparedStatement = 0;
  }
  deleteBeforeTimestampPreparedStatement = self->deleteBeforeTimestampPreparedStatement;
  if (deleteBeforeTimestampPreparedStatement)
  {
    sqlite3_finalize(deleteBeforeTimestampPreparedStatement);
    self->deleteBeforeTimestampPreparedStatement = 0;
  }
  db = self->_db;
  if (db)
  {
    sqlite3_close_v2(db);
    self->_db = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)HMELastEventStore;
  [(HMELastEventStore *)&v10 dealloc];
}

@end