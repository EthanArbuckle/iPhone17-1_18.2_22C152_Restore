@interface SGQuickResponsesDatabase
+ (id)_openAnotherHandleForPath:(id)a3;
+ (id)_openFreshHandleForPath:(id)a3 inMemory:(BOOL)a4;
- (BOOL)_handleCorruptionWithCheck:(BOOL)a3 path:(id)a4 inMemory:(BOOL)a5;
- (BOOL)_performMigrationsWithPath:(id)a3 inMemory:(BOOL)a4 attemptIteration:(int)a5;
- (_PASSqliteDatabase)db;
- (id)databaseHandle;
- (id)initInDirectory:(id)a3 inMemory:(BOOL)a4 withMigration:(BOOL)a5;
- (id)initInDirectory:(id)a3 inMemory:(BOOL)a4 withMigration:(BOOL)a5 forTools:(BOOL)a6;
- (id)migrations;
- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3;
@end

@implementation SGQuickResponsesDatabase

- (void).cxx_destruct
{
}

- (_PASSqliteDatabase)db
{
  return self->_db;
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return (id)MEMORY[0x263EFFA68];
}

- (id)migrations
{
  v19[7] = *MEMORY[0x263EF8340];
  v17[0] = @"CREATE TABLE responses(   lang_response TEXT PRIMARY KEY,     displayed INTEGER NOT NULL DEFAULT 0,     selected INTEGER NOT NULL DEFAULT 0,     matched INTEGER NOT NULL DEFAULT 0) WITHOUT ROWID";
  v17[1] = @"CREATE TABLE responses_totals(   language TEXT PRIMARY KEY,     opportunities INTEGER NOT NULL DEFAULT 0,     displayed INTEGER NOT NULL DEFAULT 0,     selected INTEGER NOT NULL DEFAULT 0,     matched INTEGER NOT NULL DEFAULT 0,     unmatched INTEGER NOT NULL DEFAULT 0) WITHOUT ROWID";
  v18[0] = &unk_26DB01618;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v19[0] = v2;
  v18[1] = &unk_26DB01630;
  v16 = @"CREATE TABLE messages(   reply TEXT NOT NULL,    language TEXT NOT NULL,     prompt TEXT NOT NULL,     recipient TEXT NOT NULL,     sent_at DOUBLE NOT NULL,     filtering BOOL NOT NULL,     filtered BOOL NOT NULL)";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  v19[1] = v3;
  v18[2] = &unk_26DB01648;
  v15 = @"CREATE TABLE custom_responses(   reply TEXT NOT NULL,     language TEXT NOT NULL,     prompt_embedding BLOB NOT NULL,     decayed_times_used DOUBLE NOT NULL,     first_seen DOUBLE NOT NULL,     last_seen DOUBLE NOT NULL)";
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  v19[2] = v4;
  v18[3] = &unk_26DB01660;
  v14 = @"CREATE TABLE custom_responses_version(   current_version INTEGER NOT NULL,     profanity_locale TEXT NOT NULL)";
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v19[3] = v5;
  v18[4] = &unk_26DB01678;
  v13[0] = @"CREATE TABLE cr_per_recipient_counts(   reply TEXT NOT NULL,     language TEXT NOT NULL,     recipient TEXT NOT NULL,     decayed_times_used DOUBLE NOT NULL, UNIQUE(reply, language, recipient))";
  v13[1] = @"ALTER TABLE custom_responses ADD COLUMN usage_spread DOUBLE NOT NULL DEFAULT 0.0";
  v13[2] = @"UPDATE custom_responses SET usage_spread = (SELECT CAST(u AS FLOAT)/c FROM    (SELECT count(distinct(recipient)) AS u FROM messages WHERE messages.reply=custom_responses.reply AND messages.language=custom_responses.language),    (SELECT count(distinct(recipient)) AS c FROM messages));";
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
  v19[4] = v6;
  v18[5] = &unk_26DB01690;
  v12 = @"CREATE TABLE responses_snapshot(   lang_response TEXT PRIMARY KEY,     displayed INTEGER NOT NULL DEFAULT 0,     selected INTEGER NOT NULL DEFAULT 0,     matched INTEGER NOT NULL DEFAULT 0) WITHOUT ROWID";
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  v19[5] = v7;
  v18[6] = &unk_26DB016A8;
  v11[0] = @"DELETE FROM responses";
  v11[1] = @"DELETE FROM responses_totals";
  v11[2] = @"DELETE FROM responses_snapshot";
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];
  v19[6] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:7];

  return v9;
}

- (id)databaseHandle
{
  return self->_db;
}

- (BOOL)_performMigrationsWithPath:(id)a3 inMemory:(BOOL)a4 attemptIteration:(int)a5
{
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (![(SGQuickResponsesDatabase *)self _handleCorruptionWithCheck:1 path:v8 inMemory:v6])
  {
LABEL_5:
    BOOL v10 = 0;
    goto LABEL_20;
  }
  uint64_t v9 = (a5 + 1);
  if (a5 >= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v19 = a5 + 1;
      _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "SGQuickResponsesDatabase not migrating, too many attempts (%d)", buf, 8u);
    }
    goto LABEL_5;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "SGQuickResponsesDatabase migrating db", buf, 2u);
  }
  id v11 = objc_alloc(MEMORY[0x263F61E20]);
  v17 = self;
  BOOL v10 = 1;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  v13 = (void *)[v11 initWithMigrationObjects:v12];

  switch([v13 migrateDatabases])
  {
    case 0u:
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      v14 = &_os_log_internal;
      v15 = "SGQuickResponsesDatabase could not perform migrations (device locked?), try again later";
      goto LABEL_22;
    case 1u:
      break;
    case 2u:
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      v14 = &_os_log_internal;
      v15 = "SGQuickResponsesDatabase migrations failed, cannot use database";
      goto LABEL_22;
    case 3u:
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      v14 = &_os_log_internal;
      v15 = "SGQuickResponsesDatabase has a future schema version, cannot use database";
      goto LABEL_22;
    case 4u:
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      v14 = &_os_log_internal;
      v15 = "SGQuickResponsesDatabase got unexpected migration result of 'step completed', will not use database";
LABEL_22:
      _os_log_error_impl(&dword_226E32000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
LABEL_18:
      BOOL v10 = 0;
      break;
    case 5u:
    case 6u:
      if (![(SGQuickResponsesDatabase *)self _handleCorruptionWithCheck:0 path:v8 inMemory:v6])goto LABEL_18; {

      }
      BOOL v10 = [(SGQuickResponsesDatabase *)self _performMigrationsWithPath:v8 inMemory:v6 attemptIteration:v9];
      v13 = 0;
      break;
    default:
      goto LABEL_18;
  }

LABEL_20:
  return v10;
}

- (BOOL)_handleCorruptionWithCheck:(BOOL)a3 path:(id)a4 inMemory:(BOOL)a5
{
  BOOL v6 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (a5)
  {
    BOOL v9 = 1;
  }
  else
  {
    BOOL v10 = [MEMORY[0x263F61EA0] corruptionMarkerPathForPath:v8];
    if (v6
      && ([MEMORY[0x263F08850] defaultManager],
          id v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 fileExistsAtPath:v10 isDirectory:0],
          v11,
          !v12))
    {
      BOOL v9 = 1;
    }
    else
    {
      db = self->_db;
      p_db = &self->_db;
      [(_PASSqliteDatabase *)db closePermanently];
      [MEMORY[0x263F61EA0] truncateDatabaseAtPath:v8];
      v15 = [MEMORY[0x263F08850] defaultManager];
      id v21 = 0;
      char v16 = [v15 removeItemAtPath:v10 error:&v21];
      id v17 = v21;

      if ((v16 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = [v17 localizedDescription];
        *(_DWORD *)buf = 138412546;
        v23 = v10;
        __int16 v24 = 2112;
        v25 = v20;
        _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "SGQuickResponsesDatabase failed to remove corruption marker at %@: %@", buf, 0x16u);
      }
      v18 = +[SGQuickResponsesDatabase _openFreshHandleForPath:v8 inMemory:0];
      BOOL v9 = v18 != 0;
      if (v18) {
        objc_storeStrong((id *)p_db, v18);
      }
    }
  }

  return v9;
}

- (id)initInDirectory:(id)a3 inMemory:(BOOL)a4 withMigration:(BOOL)a5 forTools:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SGQuickResponsesDatabase;
  id v11 = [(SGQuickResponsesDatabase *)&v21 init];
  if (!v11) {
    goto LABEL_17;
  }
  int v12 = (void *)MEMORY[0x22A66BDC0]();
  if (!v10)
  {
    id v10 = [MEMORY[0x263F5D480] suggestionsDirectory];
    if (!v10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGQuickResponsesDatabase: Unable to create directory for database", v20, 2u);
      }
      goto LABEL_19;
    }
  }
  v13 = [v10 stringByAppendingPathComponent:@"quickresponses.db"];
  if (v6)
  {
    uint64_t v14 = +[SGQuickResponsesDatabase _openAnotherHandleForPath:v13];
    db = v11->_db;
    v11->_db = (_PASSqliteDatabase *)v14;
  }
  else
  {
    uint64_t v16 = +[SGQuickResponsesDatabase _openFreshHandleForPath:v13 inMemory:v8];
    id v17 = v11->_db;
    v11->_db = (_PASSqliteDatabase *)v16;

    if (!v11->_db)
    {
LABEL_18:

LABEL_19:
      v18 = 0;
      goto LABEL_20;
    }
    if (v7)
    {
      if (![(SGQuickResponsesDatabase *)v11 _performMigrationsWithPath:v13 inMemory:v8 attemptIteration:0])
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v20 = 0;
          _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "SGQuickResponsesDatabase: Migrations failed", v20, 2u);
        }
        goto LABEL_18;
      }
    }
    else
    {
      [(SGQuickResponsesDatabase *)v11 _handleCorruptionWithCheck:1 path:v13 inMemory:v8];
    }
  }
  if (!v11->_db) {
    goto LABEL_18;
  }

LABEL_17:
  v18 = v11;

LABEL_20:
  return v18;
}

- (id)initInDirectory:(id)a3 inMemory:(BOOL)a4 withMigration:(BOOL)a5
{
  return [(SGQuickResponsesDatabase *)self initInDirectory:a3 inMemory:a4 withMigration:a5 forTools:0];
}

+ (id)_openAnotherHandleForPath:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v6 = 0;
  v3 = [MEMORY[0x263F61EA0] sqliteDatabaseWithFilename:a3 contentProtection:3 errorHandler:0 error:&v6];
  id v4 = v6;
  [v3 prepAndRunQuery:@"PRAGMA journal_mode=WAL" onPrep:0 onRow:0 onError:0];
  [v3 prepAndRunQuery:@"PRAGMA synchronous=NORMAL" onPrep:0 onRow:0 onError:0];
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGQuickResponsesDatabase: Unable to open existing database: %@", buf, 0xCu);
  }

  return v3;
}

+ (id)_openFreshHandleForPath:(id)a3 inMemory:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4) {
    [MEMORY[0x263F61EA0] sqliteDatabaseInMemoryWithError:0 errorHandler:0];
  }
  else {
  id v6 = [MEMORY[0x263F61EA0] initializeDatabase:v5 withContentProtection:3 newDatabaseCreated:0 errorHandler:0];
  }
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v8 = 0;
    _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "SGQuickResponsesDatabase: Unable to initialize database.", v8, 2u);
  }

  return v6;
}

@end