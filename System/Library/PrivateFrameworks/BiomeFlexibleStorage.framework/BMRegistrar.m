@interface BMRegistrar
+ (id)centralRegistrar;
+ (id)managedStreamIdentifiers;
+ (id)migrations;
+ (void)managedStreamIdentifiers;
- (BMRegistrar)init;
- (BMRegistrar)initWithRegistrarURL:(id)a3;
- (BOOL)propagateDeletionOfEvents:(id)a3;
- (BOOL)propagateDeletionOfEventsInStream:(id)a3 withIdentifiers:(id)a4;
- (BOOL)registerClientWithBundleID:(id)a3 databaseURL:(id)a4 source:(id)a5;
- (NSDictionary)registeredClientsByStream;
- (NSDictionary)streamRegistrationCounts;
- (id)registrationsForStream:(id)a3;
- (void)registerSiriRemembersClients;
@end

@implementation BMRegistrar

- (NSDictionary)streamRegistrationCounts
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(BMSQLStore *)self db];
  v5 = [v4 executeQuery:@"SELECT s.stream_name, count(r.client_bundle) FROM SOURCE_STREAMS s, BFS_MANAGED_DBS r WHERE s.rowid=r.source_streams_rowid GROUP BY s.stream_name"];

  if ([v5 next])
  {
    do
    {
      v6 = [v5 stringForColumnIndex:0];
      v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "intForColumnIndex:", 1));
      if (v6) {
        [v3 setObject:v7 forKeyedSubscript:v6];
      }
    }
    while (([v5 next] & 1) != 0);
  }
  v8 = (void *)[v3 copy];

  return (NSDictionary *)v8;
}

+ (id)migrations
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  [v2 addObject:@"CREATE TABLE BFS_MANAGED_DBS( client_bundle TEXT NOT NULL, db_path TEXT NOT NULL, source_streams_rowid INTEGER, registration_date INTEGER(4) DEFAULT (strftime('%s','now')), last_communication_date INTEGER(4) DEFAULT (strftime('%s','now')), PRIMARY KEY (client_bundle, db_path, source_streams_rowid)); CREATE INDEX client_idx ON BFS_MANAGED_DBS (client_bundle); CREATE INDEX source_idx ON BFS_MANAGED_DBS (source_streams_rowid); "];
  [v2 addObject:@"CREATE TABLE SOURCE_STREAMS( stream_name TEXT PRIMARY KEY ON CONFLICT IGNORE);"];
  v3 = (void *)[v2 copy];

  return v3;
}

- (BMRegistrar)initWithRegistrarURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4FB28]);
  id v6 = objc_alloc(MEMORY[0x1E4F4FB98]);
  v7 = (void *)[v6 initWithType:5 name:*MEMORY[0x1E4F4FAC0]];
  id v24 = 0;
  v8 = [v5 requestAccessToResource:v7 mode:3 error:&v24];
  id v9 = v24;
  if (!v8)
  {
    v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v9;
      _os_log_impl(&dword_1B87BE000, v15, OS_LOG_TYPE_INFO, "Not creating BMRegistrar because we are unable to access BFS storage directory %@", buf, 0xCu);
    }

    goto LABEL_16;
  }
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  v11 = [v4 URLByDeletingLastPathComponent];
  id v23 = v9;
  [v10 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v23];
  id v12 = v23;

  if (v12)
  {
    v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BMRegistrar initWithRegistrarURL:]((uint64_t)v12, v13);
    }

    v14 = 0;
    id v9 = v12;
    goto LABEL_17;
  }
  v16 = [MEMORY[0x1E4F4FB80] current];
  uint64_t v17 = [v16 BOOLForEntitlement:@"com.apple.private.security.storage.SiriInference"];

  if ((v17 & 1) == 0)
  {
    v20 = __biome_log_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B87BE000, v20, OS_LOG_TYPE_INFO, "Not creating BMRegistrar because calling process is missing SiriInference entitlement", buf, 2u);
    }

    id v9 = 0;
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  v22.receiver = self;
  v22.super_class = (Class)BMRegistrar;
  v18 = [(BMSQLStore *)&v22 initWithURL:v4];
  v19 = v18;
  if (v18) {
    objc_storeStrong((id *)&v18->_accessAssertion, v8);
  }
  [(BMRegistrar *)v19 registerSiriRemembersClients];
  self = v19;
  id v9 = 0;
  v14 = self;
LABEL_17:

  return v14;
}

- (void)registerSiriRemembersClients
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__BMRegistrar_registerSiriRemembersClients__block_invoke;
  block[3] = &unk_1E617A278;
  block[4] = self;
  if (registerSiriRemembersClients_onceToken != -1) {
    dispatch_once(&registerSiriRemembersClients_onceToken, block);
  }
}

+ (id)managedStreamIdentifiers
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v2 = (id *)getBMAppIntentIdentifierSymbolLoc_ptr;
  uint64_t v20 = getBMAppIntentIdentifierSymbolLoc_ptr;
  if (!getBMAppIntentIdentifierSymbolLoc_ptr)
  {
    v3 = (void *)BiomeLibraryLibrary();
    v18[3] = (uint64_t)dlsym(v3, "BMAppIntentIdentifier");
    getBMAppIntentIdentifierSymbolLoc_ptr = v18[3];
    v2 = (id *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v2) {
    +[BMRegistrar managedStreamIdentifiers]();
  }
  id v4 = *v2;
  v21[0] = v4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  id v5 = (id *)getBMSiriRemembersInteractionHistoryIdentifierSymbolLoc_ptr;
  uint64_t v20 = getBMSiriRemembersInteractionHistoryIdentifierSymbolLoc_ptr;
  if (!getBMSiriRemembersInteractionHistoryIdentifierSymbolLoc_ptr)
  {
    id v6 = (void *)BiomeLibraryLibrary();
    v18[3] = (uint64_t)dlsym(v6, "BMSiriRemembersInteractionHistoryIdentifier");
    getBMSiriRemembersInteractionHistoryIdentifierSymbolLoc_ptr = v18[3];
    id v5 = (id *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v5) {
    +[BMRegistrar managedStreamIdentifiers]();
  }
  id v7 = *v5;
  v21[1] = v7;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v8 = (id *)getBMSiriRemembersMessageHistoryIdentifierSymbolLoc_ptr;
  uint64_t v20 = getBMSiriRemembersMessageHistoryIdentifierSymbolLoc_ptr;
  if (!getBMSiriRemembersMessageHistoryIdentifierSymbolLoc_ptr)
  {
    id v9 = (void *)BiomeLibraryLibrary();
    v18[3] = (uint64_t)dlsym(v9, "BMSiriRemembersMessageHistoryIdentifier");
    getBMSiriRemembersMessageHistoryIdentifierSymbolLoc_ptr = v18[3];
    v8 = (id *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v8) {
    +[BMRegistrar managedStreamIdentifiers]();
  }
  id v10 = *v8;
  v21[2] = v10;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v11 = (id *)getBMSiriRemembersCallHistoryIdentifierSymbolLoc_ptr;
  uint64_t v20 = getBMSiriRemembersCallHistoryIdentifierSymbolLoc_ptr;
  if (!getBMSiriRemembersCallHistoryIdentifierSymbolLoc_ptr)
  {
    id v12 = (void *)BiomeLibraryLibrary();
    v18[3] = (uint64_t)dlsym(v12, "BMSiriRemembersCallHistoryIdentifier");
    getBMSiriRemembersCallHistoryIdentifierSymbolLoc_ptr = v18[3];
    v11 = (id *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v11) {
    +[BMRegistrar managedStreamIdentifiers].cold.4();
  }
  id v22 = *v11;
  v13 = (void *)MEMORY[0x1E4F1C978];
  id v14 = v22;
  v15 = [v13 arrayWithObjects:v21 count:4];

  return v15;
}

+ (id)centralRegistrar
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BMRegistrar)init
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [MEMORY[0x1E4F4FB78] localFlexibleStorageDirectory];
  id v5 = [v3 fileURLWithPath:v4];
  id v6 = [v5 URLByAppendingPathComponent:@"registrations.db"];

  id v7 = [(BMRegistrar *)self initWithRegistrarURL:v6];
  return v7;
}

- (void).cxx_destruct
{
}

- (BOOL)registerClientWithBundleID:(id)a3 databaseURL:(id)a4 source:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(BMSQLStore *)self db];
  [v11 startSavePointWithName:@"registerClient" error:0];

  id v12 = [(BMSQLStore *)self db];
  v13 = [v10 identifier];
  int v14 = objc_msgSend(v12, "executeUpdate:", @"INSERT INTO SOURCE_STREAMS (stream_name) VALUES (?)", v13);

  if (!v14) {
    goto LABEL_4;
  }
  v15 = [(BMSQLStore *)self db];
  v16 = [v10 identifier];
  uint64_t v17 = objc_msgSend(v15, "executeQuery:", @"SELECT rowid FROM SOURCE_STREAMS WHERE stream_name == ?", v16);

  if ([v17 next])
  {
    uint64_t v18 = [v17 longForColumnIndex:0];
    uint64_t v19 = [(BMSQLStore *)self db];
    uint64_t v20 = [v9 path];
    v21 = [NSNumber numberWithLong:v18];
    int v22 = [v19 executeUpdate:@"INSERT INTO BFS_MANAGED_DBS (client_bundle, db_path, source_streams_rowid) VALUES (?,?,?) ON CONFLICT(client_bundle, db_path, source_streams_rowid) DO UPDATE SET last_communication_date=strftime('%s','now')", v8, v20, v21];

    if (!v22)
    {
LABEL_4:
      uint64_t v23 = __biome_log_for_category();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        v30 = [v10 identifier];
        v31 = [(BMSQLStore *)self db];
        v32 = [v31 lastError];
        *(_DWORD *)buf = 138412802;
        id v34 = v8;
        __int16 v35 = 2112;
        v36 = v30;
        __int16 v37 = 2112;
        v38 = v32;
        _os_log_fault_impl(&dword_1B87BE000, v23, OS_LOG_TYPE_FAULT, "Failed to put %@ under management for stream %@. %@", buf, 0x20u);
      }
      id v24 = [(BMSQLStore *)self db];
      [v24 rollbackToSavePointWithName:@"registerClient" error:0];
      BOOL v25 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    id v26 = __biome_log_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      -[BMRegistrar registerClientWithBundleID:databaseURL:source:](v10, v26);
    }
  }
  uint64_t v27 = [(BMSQLStore *)self db];
  [v27 releaseSavePointWithName:@"registerClient" error:0];

  id v24 = __biome_log_for_category();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [v10 identifier];
    *(_DWORD *)buf = 138412546;
    id v34 = v8;
    __int16 v35 = 2112;
    v36 = v28;
    _os_log_impl(&dword_1B87BE000, v24, OS_LOG_TYPE_DEFAULT, "Registered client %@ for stream %@", buf, 0x16u);
  }
  BOOL v25 = 1;
LABEL_13:

  return v25;
}

void __43__BMRegistrar_registerSiriRemembersClients__block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CB10];
  id v2 = [@"/var/mobile/Library/com.apple.siri.inference/siriremembers.sqlite3" stringByStandardizingPath];
  v29 = [v1 fileURLWithPath:v2];

  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [@"/var/mobile/Library/com.apple.siri.inference/siriremembers2.sqlite3" stringByStandardizingPath];
  v28 = [v3 fileURLWithPath:v4];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = [(id)objc_opt_class() managedStreamIdentifiers];
  uint64_t v30 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v30)
  {
    uint64_t v27 = *(void *)v42;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v42 != v27)
        {
          uint64_t v6 = v5;
          objc_enumerationMutation(obj);
          uint64_t v5 = v6;
        }
        uint64_t v31 = v5;
        uint64_t v7 = *(void *)(*((void *)&v41 + 1) + 8 * v5);
        id v8 = [*(id *)(a1 + 32) registrationsForStream:v7];
        id v9 = objc_opt_new();
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v10 = v8;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v51 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v38 != v12) {
                objc_enumerationMutation(v10);
              }
              int v14 = [*(id *)(*((void *)&v37 + 1) + 8 * i) databaseURL];
              [v9 addObject:v14];
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v51 count:16];
          }
          while (v11);
        }

        v15 = __biome_log_for_category();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v9;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v7;
          _os_log_debug_impl(&dword_1B87BE000, v15, OS_LOG_TYPE_DEBUG, "SiriRemembers has current registrations: %@ for stream: %@", buf, 0x16u);
        }

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v49[0] = v29;
        v49[1] = v28;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v50 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v34 != v18) {
                objc_enumerationMutation(v16);
              }
              uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * j);
              if (([v9 containsObject:v20] & 1) == 0)
              {
                v21 = __biome_log_for_category();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v7;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v20;
                  _os_log_impl(&dword_1B87BE000, v21, OS_LOG_TYPE_DEFAULT, "Injecting SiriRemembers BFS registration for stream: %@, url: %@", buf, 0x16u);
                }

                int v22 = *(void **)(a1 + 32);
                uint64_t v45 = 0;
                v46 = &v45;
                uint64_t v47 = 0x2050000000;
                uint64_t v23 = (void *)getBMSourceClass_softClass;
                uint64_t v48 = getBMSourceClass_softClass;
                if (!getBMSourceClass_softClass)
                {
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __getBMSourceClass_block_invoke;
                  v54 = &unk_1E617A2C8;
                  v55 = &v45;
                  __getBMSourceClass_block_invoke((uint64_t)buf);
                  uint64_t v23 = (void *)v46[3];
                }
                id v24 = v23;
                _Block_object_dispose(&v45, 8);
                BOOL v25 = (void *)[[v24 alloc] initWithIdentifier:v7];
                [v22 registerClientWithBundleID:@"com.apple.siriinferenced" databaseURL:v20 source:v25];
              }
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v50 count:16];
          }
          while (v17);
        }

        uint64_t v5 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
    }
    while (v30);
  }
}

- (NSDictionary)registeredClientsByStream
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(BMSQLStore *)self db];
  uint64_t v5 = [v4 executeQuery:@"SELECT s.stream_name, r.client_bundle FROM SOURCE_STREAMS s, BFS_MANAGED_DBS r WHERE s.rowid=r.source_streams_rowid"];

  if ([v5 next])
  {
    do
    {
      uint64_t v6 = [v5 stringForColumnIndex:0];
      uint64_t v7 = [v5 stringForColumnIndex:1];
      id v8 = [v3 objectForKeyedSubscript:v6];

      if (!v8)
      {
        id v9 = [MEMORY[0x1E4F1CA48] array];
        [v3 setObject:v9 forKeyedSubscript:v6];
      }
      id v10 = [v3 objectForKeyedSubscript:v6];
      [v10 addObject:v7];
    }
    while (([v5 next] & 1) != 0);
  }
  uint64_t v11 = (void *)[v3 copy];

  return (NSDictionary *)v11;
}

- (id)registrationsForStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(BMSQLStore *)self db];
  uint64_t v7 = [v6 executeQuery:@"SELECT r.client_bundle, r.db_path, r.registration_date, r.last_communication_date FROM SOURCE_STREAMS s, BFS_MANAGED_DBS r WHERE s.stream_name = ? AND s.rowid=r.source_streams_rowid", v4];

  if ([v7 next])
  {
    do
    {
      id v8 = objc_alloc_init(_BMRegistrarRegistration);
      [(_BMRegistrarRegistration *)v8 setSourceStreamID:v4];
      id v9 = [v7 stringForColumnIndex:0];
      [(_BMRegistrarRegistration *)v8 setBundleID:v9];

      id v10 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v11 = [v7 stringForColumnIndex:1];
      uint64_t v12 = [v10 fileURLWithPath:v11];
      [(_BMRegistrarRegistration *)v8 setDatabaseURL:v12];

      v13 = [v7 dateForColumnIndex:2];
      [(_BMRegistrarRegistration *)v8 setRegistrationDate:v13];

      int v14 = [v7 dateForColumnIndex:3];
      [(_BMRegistrarRegistration *)v8 setLastCommunicationDate:v14];

      [v5 addObject:v8];
    }
    while (([v7 next] & 1) != 0);
  }
  v15 = (void *)[v5 copy];

  return v15;
}

- (BOOL)propagateDeletionOfEvents:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v38 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v65 objects:v79 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v66 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(MEMORY[0x1E4F4FB88], "streamIdentifierForStream:", objc_msgSend((id)objc_opt_class(), "stream"));
          uint64_t v12 = [v10 identifier];
          v13 = [v4 objectForKeyedSubscript:v11];

          if (v13)
          {
            int v14 = [v4 objectForKeyedSubscript:v11];
            [v14 addObject:v12];
          }
          else
          {
            v78 = v12;
            int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
            v15 = (void *)[v14 mutableCopy];
            [v4 setObject:v15 forKeyedSubscript:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v65 objects:v79 count:16];
      }
      while (v7);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    obuint64_t j = v4;
    uint64_t v41 = [obj countByEnumeratingWithState:&v61 objects:v77 count:16];
    if (v41)
    {
      uint64_t v39 = *(void *)v62;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v62 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v61 + 1) + 8 * j);
          uint64_t v18 = [(BMRegistrar *)self registrationsForStream:v17];
          if ([v18 count])
          {
            uint64_t v44 = j;
            uint64_t v19 = [obj objectForKeyedSubscript:v17];
            uint64_t v20 = __biome_log_for_category();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v70 = v17;
              __int16 v71 = 2112;
              uint64_t v72 = v19;
              _os_log_impl(&dword_1B87BE000, v20, OS_LOG_TYPE_DEFAULT, "Handling deletions in stream %@: %@", buf, 0x16u);
            }
            long long v42 = v19;

            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v43 = v18;
            id v45 = v18;
            uint64_t v48 = [v45 countByEnumeratingWithState:&v57 objects:v76 count:16];
            if (v48)
            {
              uint64_t v46 = *(void *)v58;
              do
              {
                uint64_t v21 = 0;
                do
                {
                  if (*(void *)v58 != v46) {
                    objc_enumerationMutation(v45);
                  }
                  uint64_t v50 = v21;
                  int v22 = *(void **)(*((void *)&v57 + 1) + 8 * v21);
                  context = (void *)MEMORY[0x1BA9C16F0]();
                  uint64_t v23 = [BMRemoteSQLStoreManager alloc];
                  v51 = v22;
                  id v24 = [v22 databaseURL];
                  BOOL v25 = [(BMRemoteSQLStoreManager *)v23 initWithURL:v24];

                  long long v55 = 0u;
                  long long v56 = 0u;
                  long long v53 = 0u;
                  long long v54 = 0u;
                  id v52 = [obj objectForKeyedSubscript:v17];
                  uint64_t v26 = [v52 countByEnumeratingWithState:&v53 objects:v75 count:16];
                  if (v26)
                  {
                    uint64_t v27 = v26;
                    uint64_t v28 = *(void *)v54;
                    do
                    {
                      for (uint64_t k = 0; k != v27; ++k)
                      {
                        if (*(void *)v54 != v28) {
                          objc_enumerationMutation(v52);
                        }
                        uint64_t v30 = [(BMRemoteSQLStoreManager *)v25 deleteRowsDerivedFromStream:v17 eventIdentifier:*(void *)(*((void *)&v53 + 1) + 8 * k)];
                        uint64_t v31 = [v30 objectForKeyedSubscript:v17];

                        if (v31)
                        {
                          v32 = __biome_log_for_category();
                          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                          {
                            long long v33 = [v30 objectForKeyedSubscript:v17];
                            long long v34 = [v51 bundleID];
                            long long v35 = [v51 databaseURL];
                            *(_DWORD *)buf = 138412802;
                            v70 = v33;
                            __int16 v71 = 2112;
                            uint64_t v72 = (uint64_t)v34;
                            __int16 v73 = 2112;
                            v74 = v35;
                            _os_log_impl(&dword_1B87BE000, v32, OS_LOG_TYPE_INFO, "Deleted %@ rows on behalf of %@ from %@.", buf, 0x20u);
                          }
                        }
                      }
                      uint64_t v27 = [v52 countByEnumeratingWithState:&v53 objects:v75 count:16];
                    }
                    while (v27);
                  }

                  uint64_t v21 = v50 + 1;
                }
                while (v50 + 1 != v48);
                uint64_t v48 = [v45 countByEnumeratingWithState:&v57 objects:v76 count:16];
              }
              while (v48);
            }

            uint64_t v18 = v43;
            uint64_t j = v44;
            long long v36 = v42;
          }
          else
          {
            long long v36 = __biome_log_for_category();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v70 = v17;
              _os_log_impl(&dword_1B87BE000, v36, OS_LOG_TYPE_DEFAULT, "Ignoring deletions from stream %@ because no relevant registrations exist.", buf, 0xCu);
            }
          }
        }
        uint64_t v41 = [obj countByEnumeratingWithState:&v61 objects:v77 count:16];
      }
      while (v41);
    }

    id v3 = v38;
  }

  return 1;
}

- (BOOL)propagateDeletionOfEventsInStream:(id)a3 withIdentifiers:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    uint64_t v8 = [(BMRegistrar *)self registrationsForStream:v6];
    uint64_t v9 = [v8 count];
    log = __biome_log_for_category();
    BOOL v10 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v10)
      {
        *(_DWORD *)buf = 138412546;
        id v38 = v6;
        __int16 v39 = 2112;
        id v40 = v7;
        _os_log_impl(&dword_1B87BE000, log, OS_LOG_TYPE_DEFAULT, "Handling deletions in stream %@: %@", buf, 0x16u);
      }

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      log = v8;
      uint64_t v11 = [log countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v30 = v8;
        uint64_t v13 = *(void *)v34;
        unint64_t v14 = 0x1E617A000uLL;
        id v31 = v6;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v34 != v13) {
              objc_enumerationMutation(log);
            }
            v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            id v17 = objc_alloc(*(Class *)(v14 + 336));
            uint64_t v18 = [v16 databaseURL];
            uint64_t v19 = (void *)[v17 initWithURL:v18];

            uint64_t v20 = [v19 deleteRowsDerivedFromStream:v6 eventIdentifiers:v7];
            uint64_t v21 = [v20 objectForKeyedSubscript:v6];

            if (v21)
            {
              int v22 = __biome_log_for_category();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                [v20 objectForKeyedSubscript:v6];
                uint64_t v23 = v13;
                v25 = id v24 = v7;
                [v16 bundleID];
                v27 = uint64_t v26 = v12;
                uint64_t v28 = [v16 databaseURL];
                *(_DWORD *)buf = 138412802;
                id v38 = v25;
                __int16 v39 = 2112;
                id v40 = v27;
                __int16 v41 = 2112;
                long long v42 = v28;
                _os_log_impl(&dword_1B87BE000, v22, OS_LOG_TYPE_INFO, "Deleted %@ rows on behalf of %@ from %@.", buf, 0x20u);

                uint64_t v12 = v26;
                id v7 = v24;
                uint64_t v13 = v23;
                unint64_t v14 = 0x1E617A000;
                id v6 = v31;
              }
            }
          }
          uint64_t v12 = [log countByEnumeratingWithState:&v33 objects:v43 count:16];
        }
        while (v12);
        uint64_t v8 = v30;
      }
    }
    else if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v6;
      _os_log_impl(&dword_1B87BE000, log, OS_LOG_TYPE_DEFAULT, "Ignoring deletions from stream %@ because no relevant registrations exist.", buf, 0xCu);
    }
  }
  return 1;
}

+ (void)managedStreamIdentifiers
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getBMSiriRemembersCallHistoryIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMRegistrar.m", 31, @"%s", dlerror());

  __break(1u);
}

- (void)initWithRegistrarURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B87BE000, a2, OS_LOG_TYPE_ERROR, "Failed to create BFS storage directory with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)registerClientWithBundleID:(void *)a1 databaseURL:(NSObject *)a2 source:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 identifier];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_fault_impl(&dword_1B87BE000, a2, OS_LOG_TYPE_FAULT, "Unable to get rowid for stream %@", (uint8_t *)&v4, 0xCu);
}

@end