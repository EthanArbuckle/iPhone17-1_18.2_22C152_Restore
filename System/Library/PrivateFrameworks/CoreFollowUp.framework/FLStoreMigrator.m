@interface FLStoreMigrator
- (FLSQLiteExecutor)queryExecutor;
- (FLStoreMigrator)initWithExecutor:(id)a3;
- (int64_t)_schemaVersion;
- (void)_createCleanCurrentDatabase;
- (void)_createCurrentDatabaseWithTableSuffix:(id)a3;
- (void)_dropTables;
- (void)_migrateFujitailToCurrent;
- (void)_migrateSchema:(int64_t)a3 toSchema:(int64_t)a4;
- (void)_migrateToCurrentFrom:(int64_t)a3;
- (void)migrateSchemeIfNecessary;
- (void)setQueryExecutor:(id)a3;
@end

@implementation FLStoreMigrator

- (FLStoreMigrator)initWithExecutor:(id)a3
{
  id v5 = a3;
  v6 = [(FLStoreMigrator *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queryExecutor, a3);
  }

  return v7;
}

- (void)migrateSchemeIfNecessary
{
  int64_t v3 = [(FLStoreMigrator *)self _schemaVersion];
  if (v3 != 23)
  {
    [(FLStoreMigrator *)self _migrateSchema:v3 toSchema:23];
  }
}

- (int64_t)_schemaVersion
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queryExecutor = self->_queryExecutor;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F0B8;
  v5[3] = &unk_10001CF00;
  v5[4] = &v6;
  [(FLSQLiteExecutor *)queryExecutor performQuery:@"SELECT value FROM databaseProperties WHERE key='schemaVersion'" rowHandler:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_migrateSchema:(int64_t)a3 toSchema:(int64_t)a4
{
  v7 = _os_activity_create((void *)&_mh_execute_header, "followup/migration", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v8 = _FLLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v13 = a3;
    __int16 v14 = 2048;
    int64_t v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
  }

  [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"pragma foreign_keys=off" rowHandler:0];
  queryExecutor = self->_queryExecutor;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000F2DC;
  v10[3] = &unk_10001CF28;
  v10[4] = self;
  v10[5] = a3;
  [(FLSQLiteExecutor *)queryExecutor performTransactionBlockAndWait:v10];
  [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"pragma foreign_keys=on" rowHandler:0];
  os_activity_scope_leave(&state);
}

- (void)_createCleanCurrentDatabase
{
  [(FLStoreMigrator *)self _dropTables];

  [(FLStoreMigrator *)self _createCurrentDatabaseWithTableSuffix:&stru_10001D348];
}

- (void)_migrateToCurrentFrom:(int64_t)a3
{
  switch(a3)
  {
    case 9:
      v4 = _FLLogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v82 = 9;
        __int16 v83 = 2048;
        uint64_t v84 = 23;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      [(FLStoreMigrator *)self _migrateFujitailToCurrent];
      return;
    case 13:
      id v5 = _FLLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v82 = 13;
        __int16 v83 = 2048;
        uint64_t v84 = 14;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      queryExecutor = self->_queryExecutor;
      v7 = +[NSString stringWithFormat:@"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'", &off_10001DA20];
      [(FLSQLiteExecutor *)queryExecutor performQuery:v7];

      uint64_t v8 = self->_queryExecutor;
      uint64_t v9 = +[NSDate date];
      [v9 timeIntervalSince1970];
      v11 = +[NSString stringWithFormat:@"ALTER TABLE notifications ADD COLUMN creationDate INTEGER NOT NULL DEFAULT (%f)", v10];
      [(FLSQLiteExecutor *)v8 performQuery:v11];

      goto LABEL_8;
    case 14:
LABEL_8:
      v12 = _FLLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v82 = 14;
        __int16 v83 = 2048;
        uint64_t v84 = 15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      int64_t v13 = self->_queryExecutor;
      __int16 v14 = +[NSString stringWithFormat:@"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'", &off_10001DA38];
      [(FLSQLiteExecutor *)v13 performQuery:v14];

      int64_t v15 = self->_queryExecutor;
      v16 = +[NSString stringWithFormat:@"ALTER TABLE notifications ADD COLUMN options BLOB"];
      [(FLSQLiteExecutor *)v15 performQuery:v16];

      goto LABEL_11;
    case 15:
LABEL_11:
      v17 = _FLLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v82 = 15;
        __int16 v83 = 2048;
        uint64_t v84 = 16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v18 = self->_queryExecutor;
      v19 = +[NSString stringWithFormat:@"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'", &off_10001DA50];
      [(FLSQLiteExecutor *)v18 performQuery:v19];

      v20 = self->_queryExecutor;
      v21 = +[NSString stringWithFormat:@"ALTER TABLE items ADD COLUMN target_bundle_identifier TEXT"];
      [(FLSQLiteExecutor *)v20 performQuery:v21];

      v22 = self->_queryExecutor;
      v23 = +[NSString stringWithFormat:@"UPDATE items SET target_bundle_identifier='%@'", FLFollowUpPreferencesBundleIdentifier];
      [(FLSQLiteExecutor *)v22 performQuery:v23];

      goto LABEL_14;
    case 16:
LABEL_14:
      v24 = _FLLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v82 = 16;
        __int16 v83 = 2048;
        uint64_t v84 = 17;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v25 = self->_queryExecutor;
      v26 = +[NSString stringWithFormat:@"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'", &off_10001DA68];
      [(FLSQLiteExecutor *)v25 performQuery:v26];

      v27 = self->_queryExecutor;
      v28 = +[NSString stringWithFormat:@"ALTER TABLE items ADD COLUMN representing_bundle_path TEXT"];
      [(FLSQLiteExecutor *)v27 performQuery:v28];

      v29 = self->_queryExecutor;
      v30 = +[NSString stringWithFormat:@"UPDATE items SET representing_bundle_path=NULL"];
      [(FLSQLiteExecutor *)v29 performQuery:v30];

      v31 = self->_queryExecutor;
      v32 = +[NSString stringWithFormat:@"ALTER TABLE items ADD COLUMN bundle_icon_name TEXT"];
      [(FLSQLiteExecutor *)v31 performQuery:v32];

      v33 = self->_queryExecutor;
      v34 = +[NSString stringWithFormat:@"UPDATE items SET bundle_icon_name=NULL"];
      [(FLSQLiteExecutor *)v33 performQuery:v34];

      v35 = self->_queryExecutor;
      v36 = +[NSString stringWithFormat:@"ALTER TABLE items ADD COLUMN informative_footer_text TEXT"];
      [(FLSQLiteExecutor *)v35 performQuery:v36];

      v37 = self->_queryExecutor;
      v38 = +[NSString stringWithFormat:@"UPDATE items SET informative_footer_text=NULL"];
      [(FLSQLiteExecutor *)v37 performQuery:v38];

      goto LABEL_17;
    case 17:
LABEL_17:
      v39 = _FLLogSystem();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v82 = 17;
        __int16 v83 = 2048;
        uint64_t v84 = 18;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v40 = self->_queryExecutor;
      v41 = +[NSString stringWithFormat:@"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'", &off_10001DA80];
      [(FLSQLiteExecutor *)v40 performQuery:v41];

      v42 = self->_queryExecutor;
      v43 = +[NSString stringWithFormat:@"ALTER TABLE items ADD COLUMN category_identifier TEXT"];
      [(FLSQLiteExecutor *)v42 performQuery:v43];

      v44 = self->_queryExecutor;
      v45 = +[NSString stringWithFormat:@"UPDATE items SET category_identifier='%@'", FLFollowUpNotificationDefaultCategory];
      [(FLSQLiteExecutor *)v44 performQuery:v45];

      goto LABEL_20;
    case 18:
LABEL_20:
      v46 = _FLLogSystem();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v82 = 18;
        __int16 v83 = 2048;
        uint64_t v84 = 19;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v47 = self->_queryExecutor;
      v48 = +[NSString stringWithFormat:@"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'", &off_10001DA98];
      [(FLSQLiteExecutor *)v47 performQuery:v48];

      if (![(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"SELECT representing_bundle_path, bundle_icon_name, informative_footer_text FROM items"])
      {
        [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"ALTER TABLE items ADD COLUMN representing_bundle_path TEXT"];
        [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"UPDATE items SET representing_bundle_path=NULL"];
        [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"ALTER TABLE items ADD COLUMN bundle_icon_name TEXT"];
        [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"UPDATE items SET bundle_icon_name=NULL"];
        [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"ALTER TABLE items ADD COLUMN informative_footer_text TEXT"];
        [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"UPDATE items SET informative_footer_text=NULL"];
      }
      goto LABEL_24;
    case 19:
LABEL_24:
      v49 = _FLLogSystem();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v82 = 19;
        __int16 v83 = 2048;
        uint64_t v84 = 20;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v50 = self->_queryExecutor;
      v51 = +[NSString stringWithFormat:@"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'", &off_10001DAB0];
      [(FLSQLiteExecutor *)v50 performQuery:v51];

      v52 = self->_queryExecutor;
      v53 = +[NSString stringWithFormat:@"ALTER TABLE items ADD COLUMN expiration_date INTEGER"];
      [(FLSQLiteExecutor *)v52 performQuery:v53];

      v54 = self->_queryExecutor;
      v55 = +[NSString stringWithFormat:@"UPDATE items SET expiration_date=NULL"];
      [(FLSQLiteExecutor *)v54 performQuery:v55];

      goto LABEL_27;
    case 20:
LABEL_27:
      v56 = _FLLogSystem();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v82 = 20;
        __int16 v83 = 2048;
        uint64_t v84 = 21;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v57 = self->_queryExecutor;
      v58 = +[NSString stringWithFormat:@"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'", &off_10001DAC8];
      [(FLSQLiteExecutor *)v57 performQuery:v58];

      v59 = self->_queryExecutor;
      v60 = +[NSString stringWithFormat:@"ALTER TABLE notifications ADD COLUMN subtitle_text TEXT"];
      [(FLSQLiteExecutor *)v59 performQuery:v60];

      v61 = self->_queryExecutor;
      v62 = +[NSString stringWithFormat:@"UPDATE notifications SET subtitle_text=NULL"];
      [(FLSQLiteExecutor *)v61 performQuery:v62];

      goto LABEL_30;
    case 21:
LABEL_30:
      v63 = _FLLogSystem();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v82 = 21;
        __int16 v83 = 2048;
        uint64_t v84 = 22;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v64 = self->_queryExecutor;
      v65 = +[NSString stringWithFormat:@"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'", &off_10001DAE0];
      [(FLSQLiteExecutor *)v64 performQuery:v65];

      v66 = self->_queryExecutor;
      v67 = +[NSString stringWithFormat:@"ALTER TABLE items ADD COLUMN account_id TEXT"];
      [(FLSQLiteExecutor *)v66 performQuery:v67];

      v68 = self->_queryExecutor;
      v69 = +[NSString stringWithFormat:@"UPDATE items SET account_id=NULL"];
      [(FLSQLiteExecutor *)v68 performQuery:v69];

      v70 = self->_queryExecutor;
      v71 = +[NSString stringWithFormat:@"ALTER TABLE items ADD COLUMN type_id TEXT"];
      [(FLSQLiteExecutor *)v70 performQuery:v71];

      v72 = self->_queryExecutor;
      v73 = +[NSString stringWithFormat:@"UPDATE items SET type_id=NULL"];
      [(FLSQLiteExecutor *)v72 performQuery:v73];

      goto LABEL_33;
    case 22:
LABEL_33:
      v74 = _FLLogSystem();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v82 = 22;
        __int16 v83 = 2048;
        uint64_t v84 = 23;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Migrating from %lld to %lld", buf, 0x16u);
      }

      v75 = self->_queryExecutor;
      v76 = +[NSString stringWithFormat:@"UPDATE databaseProperties SET value='%@' WHERE key='schemaVersion'", &off_10001DAF8];
      [(FLSQLiteExecutor *)v75 performQuery:v76];

      v77 = self->_queryExecutor;
      v78 = +[NSString stringWithFormat:@"ALTER TABLE items ADD COLUMN collection_id TEXT"];
      [(FLSQLiteExecutor *)v77 performQuery:v78];

      v79 = self->_queryExecutor;
      v80 = +[NSString stringWithFormat:@"UPDATE items SET collection_id=NULL"];
      [(FLSQLiteExecutor *)v79 performQuery:v80];

      break;
    default:
      return;
  }
}

- (void)_migrateFujitailToCurrent
{
  int64_t v3 = [(FLSQLiteExecutor *)self->_queryExecutor database];
  if (sqlite3_create_function_v2(v3, (const char *)[off_100022E10 UTF8String], 1, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_1000100EC, 0, 0, 0))
  {
    v4 = _FLLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000110D4(v4);
    }
  }
  [(FLStoreMigrator *)self _createCurrentDatabaseWithTableSuffix:@"_tmp"];
  queryExecutor = self->_queryExecutor;
  uint64_t v6 = +[NSString stringWithFormat:@"INSERT INTO items_tmp (uuid, title, body, show_in_settings, style, persist_when_activated, persist_when_dismissed, user_info, client_identifier, extension_identifier, group_identifier, target_bundle_identifier, representing_bundle_path, bundle_icon_name, informative_footer_text, category_identifier) SELECT uuid, title, body, show_in_settings, style, persist_when_activated, persist_when_dismissed, user_info, client_identifier, NULL, '%@', '%@', NULL, NULL, NULL, '%@' FROM items", FLGroupIdentifierDevice, FLFollowUpPreferencesBundleIdentifier, FLFollowUpNotificationDefaultCategory];
  [(FLSQLiteExecutor *)queryExecutor performInsertQuery:v6];

  [(FLSQLiteExecutor *)self->_queryExecutor performInsertQuery:@"INSERT INTO actions_tmp (label, url, launch_url, launch_arguments, item_id, action_identifier) SELECT label, url, launch_url, fl_convert_la_userinfo(launch_arguments), item_id, NULL FROM actions"];
  v7 = self->_queryExecutor;
  uint64_t v8 = +[NSDate date];
  [v8 timeIntervalSince1970];
  uint64_t v10 = v9;
  v11 = +[NSDate date];
  [v11 timeIntervalSince1970];
  int64_t v13 = +[NSString stringWithFormat:@"INSERT INTO notifications_tmp (item_id, title, body, unlock_label, relevance_date, activate_action_id, dismiss_action_id, clear_action_id, frequency, creationDate) SELECT item_id, title, body, unlock_label, %f, activate_action_id, dismiss_action_id, clear_action_id, 0, %f from notifications", v10, v12];
  [(FLSQLiteExecutor *)v7 performInsertQuery:v13];

  [(FLStoreMigrator *)self _dropTables];
  [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"ALTER TABLE databaseProperties_tmp RENAME TO databaseProperties"];
  [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"ALTER TABLE notifications_tmp RENAME TO notifications"];
  [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"ALTER TABLE actions_tmp RENAME TO actions"];
  [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"ALTER TABLE items_tmp RENAME TO items"];
}

- (void)_createCurrentDatabaseWithTableSuffix:(id)a3
{
  id v4 = a3;
  id v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100011118(v5);
  }

  queryExecutor = self->_queryExecutor;
  v7 = +[NSString stringWithFormat:@"CREATE TABLE databaseProperties%@ (key TEXT PRIMARY KEY, value TEXT)", v4];
  [(FLSQLiteExecutor *)queryExecutor performQuery:v7];

  uint64_t v8 = +[NSString stringWithFormat:@"INSERT INTO databaseProperties%@ (key, value) VALUES ('schemaVersion', '%@')", v4, &off_10001DAF8];
  [(FLSQLiteExecutor *)self->_queryExecutor performInsertQuery:v8];
  uint64_t v9 = self->_queryExecutor;
  uint64_t v10 = +[NSString stringWithFormat:@"CREATE TABLE notifications%@ (id INTEGER PRIMARY KEY, item_id INTEGER REFERENCES items(id) ON DELETE CASCADE, title TEXT, subtitle_text TEXT, body TEXT, unlock_label TEXT, relevance_date INTEGER, activate_action_id INTEGER REFERENCES actions(id) ON DELETE CASCADE, dismiss_action_id INTEGER REFERENCES actions(id) ON DELETE CASCADE, clear_action_id INTEGER REFERENCES actions(id) ON DELETE CASCADE, frequency INTEGER, creationDate INTEGER, options BLOB)", v4];
  [(FLSQLiteExecutor *)v9 performQuery:v10];

  v11 = self->_queryExecutor;
  uint64_t v12 = +[NSString stringWithFormat:@"CREATE TABLE actions%@ (id INTEGER PRIMARY KEY, item_id INTEGER REFERENCES items(id) ON DELETE CASCADE, label TEXT, url TEXT, launch_url TEXT, launch_arguments BLOB, action_identifier TEXT)", v4];
  [(FLSQLiteExecutor *)v11 performQuery:v12];

  int64_t v13 = self->_queryExecutor;
  __int16 v14 = +[NSString stringWithFormat:@"CREATE TABLE items%@ (id INTEGER PRIMARY KEY, uuid TEXT, client_identifier TEXT, title TEXT, body TEXT, show_in_settings INTEGER, style INTEGER, persist_when_activated INTEGER, persist_when_dismissed INTEGER, user_info BLOB, extension_identifier TEXT, group_identifier TEXT, collection_id TEXT, target_bundle_identifier TEXT, representing_bundle_path TEXT, bundle_icon_name TEXT, informative_footer_text TEXT, category_identifier TEXT, expiration_date INTEGER, account_id TEXT, type_id TEXT, UNIQUE(uuid))", v4];

  [(FLSQLiteExecutor *)v13 performQuery:v14];
}

- (void)_dropTables
{
  int64_t v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10001115C(v3);
  }

  [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"DROP TABLE IF EXISTS databaseProperties"];
  [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"DROP TABLE IF EXISTS notifications"];
  [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"DROP TABLE IF EXISTS actions"];
  [(FLSQLiteExecutor *)self->_queryExecutor performQuery:@"DROP TABLE IF EXISTS items"];
}

- (FLSQLiteExecutor)queryExecutor
{
  return (FLSQLiteExecutor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueryExecutor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end