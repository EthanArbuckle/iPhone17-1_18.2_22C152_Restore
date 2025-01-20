@interface AKPrivateEmailStoreMigrator
- (id)storeName;
- (unint64_t)currentSchemaVersion;
- (void)_buildSchemaVersion1;
- (void)_migrateToSchemaVersion2;
- (void)_migrateToSchemaVersion3;
- (void)_migrateToSchemaVersion4;
- (void)_migrateToSchemaVersion5;
- (void)migrateSchemaFromVersion:(unint64_t)a3;
@end

@implementation AKPrivateEmailStoreMigrator

- (id)storeName
{
  return @"PrivateEmail";
}

- (unint64_t)currentSchemaVersion
{
  return 5;
}

- (void)migrateSchemaFromVersion:(unint64_t)a3
{
  v5 = _AKLogHme();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(AKPrivateEmailStoreMigrator *)self storeName];
    int v7 = 138412546;
    v8 = v6;
    __int16 v9 = 1024;
    int v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Database Migration requested from version: %i", (uint8_t *)&v7, 0x12u);
  }
  switch(a3)
  {
    case 0uLL:
      [(AKPrivateEmailStoreMigrator *)self _buildSchemaVersion1];
      goto LABEL_5;
    case 1uLL:
LABEL_5:
      [(AKPrivateEmailStoreMigrator *)self _migrateToSchemaVersion2];
      goto LABEL_6;
    case 2uLL:
LABEL_6:
      [(AKPrivateEmailStoreMigrator *)self _migrateToSchemaVersion3];
      goto LABEL_7;
    case 3uLL:
LABEL_7:
      [(AKPrivateEmailStoreMigrator *)self _migrateToSchemaVersion4];
      goto LABEL_8;
    case 4uLL:
LABEL_8:
      [(AKPrivateEmailStoreMigrator *)self _migrateToSchemaVersion5];
      break;
    default:
      return;
  }
}

- (void)_buildSchemaVersion1
{
  v3 = _AKLogHme();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(AKPrivateEmailStoreMigrator *)self storeName];
    *(_DWORD *)buf = 138412290;
    int v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Building %@ database with schema version: 1", buf, 0xCu);
  }
  v5 = [(AKStoreMigrator *)self executor];
  [v5 performQuery:@"CREATE TABLE IF NOT EXISTS emails (client_key TEXT PRIMARY KEY, email TEXT);"];

  v6 = [(AKStoreMigrator *)self executor];
  [v6 performQuery:@"CREATE TABLE IF NOT EXISTS version (privateEmailListVersion TEXT PRIMARY KEY, db_version INTEGER);"];

  int v7 = [(AKStoreMigrator *)self executor];
  v8 = +[NSString stringWithFormat:@"INSERT OR REPLACE INTO version (privateEmailListVersion, db_version) VALUES('%@', '%i')", AKPrivateEmailInitialVersion, 1];
  [v7 performInsertQuery:v8];
}

- (void)_migrateToSchemaVersion2
{
  v3 = _AKLogHme();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(AKPrivateEmailStoreMigrator *)self storeName];
    *(_DWORD *)buf = 138412290;
    __int16 v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Migrating %@ database to schema version: 2", buf, 0xCu);
  }
  v5 = [(AKStoreMigrator *)self executor];
  [v5 performQuery:@"ALTER TABLE version ADD COLUMN protocol_version INTEGER"];

  v6 = [(AKStoreMigrator *)self executor];
  int v7 = +[NSString stringWithFormat:@"UPDATE version SET protocol_version = %i,db_version = %i", AKPrivateEmailInitialProtocolVersion, 2];
  [v6 performQuery:v7];
}

- (void)_migrateToSchemaVersion3
{
  v3 = _AKLogHme();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(AKPrivateEmailStoreMigrator *)self storeName];
    *(_DWORD *)buf = 138412290;
    v45 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Migrating %@ database to schema version: 3", buf, 0xCu);
  }
  v5 = +[NSMutableSet set];
  uint64_t v6 = +[NSString stringWithFormat:@"SELECT client_key FROM emails;"];
  int v7 = [(AKStoreMigrator *)self executor];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000451A4;
  v40[3] = &unk_100228370;
  id v8 = v5;
  id v41 = v8;
  v30 = (void *)v6;
  [v7 performQuery:v6 rowHandler:v40];

  __int16 v9 = +[NSMutableSet set];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v37;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        v16 = +[AKStoreUtils hash:v15];
        if ([v10 containsObject:v16]) {
          [v9 addObject:v15];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = v9;
    id v18 = [v17 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v33;
      id obj = v17;
      while (2)
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * (void)j);
          v23 = self;
          v24 = [(AKStoreMigrator *)self executor];
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"DELETE FROM emails WHERE client_key = '%@';",
          v25 = v22);
          unsigned __int8 v26 = [v24 performQuery:v25];

          if ((v26 & 1) == 0)
          {
            v28 = _AKLogHme();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              sub_10018229C(v22, v28);
            }
            v29 = v30;
            v27 = obj;
            goto LABEL_26;
          }
          self = v23;
        }
        id v17 = obj;
        id v19 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
  }
  v27 = [(AKStoreMigrator *)self executor];
  v28 = +[NSString stringWithFormat:@"UPDATE version SET protocol_version = %i,db_version = %i", AKPrivateEmailProtocolVersion2, 3];
  [v27 performQuery:v28];
  v29 = v30;
LABEL_26:
}

- (void)_migrateToSchemaVersion4
{
  v3 = _AKLogHme();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(AKPrivateEmailStoreMigrator *)self storeName];
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Migrating %@ database to schema version: 4", buf, 0xCu);
  }
  v5 = [(AKStoreMigrator *)self executor];
  [v5 performQuery:@"PRAGMA foreign_keys=off"];
  [v5 performQuery:@"ALTER TABLE emails RENAME TO emails_orig"];
  [v5 performQuery:@"CREATE TABLE emails AS SELECT * FROM emails_orig"];
  [v5 performQuery:@"ALTER TABLE emails ADD COLUMN bundle_id TEXT"];
  [v5 performQuery:@"CREATE INDEX client_bundle_idx ON emails(client_key,bundle_id)"];
  [v5 performQuery:@"DROP TABLE emails_orig"];
  [v5 performQuery:@"PRAGMA foreign_keys=on"];
  uint64_t v6 = +[NSString stringWithFormat:@"UPDATE version SET db_version = %i", 4];
  [v5 performQuery:v6];
}

- (void)_migrateToSchemaVersion5
{
  v3 = _AKLogHme();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(AKPrivateEmailStoreMigrator *)self storeName];
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Migrating %@ database to schema version: 5", buf, 0xCu);
  }
  v5 = [(AKStoreMigrator *)self executor];
  [v5 performQuery:@"PRAGMA foreign_keys=off"];
  [v5 performQuery:@"ALTER TABLE emails RENAME TO emails_v4"];
  [v5 performQuery:@"CREATE TABLE emails (client_key TEXT PRIMARY KEY, email TEXT)"];
  [v5 performQuery:@"INSERT INTO emails (client_key,email) SELECT client_key,email FROM emails_v4"];
  [v5 performQuery:@"DROP TABLE emails_v4"];
  [v5 performQuery:@"PRAGMA foreign_keys=on"];
  uint64_t v6 = +[NSString stringWithFormat:@"UPDATE version SET db_version = %i", 5];
  [v5 performQuery:v6];
}

- (void).cxx_destruct
{
}

@end