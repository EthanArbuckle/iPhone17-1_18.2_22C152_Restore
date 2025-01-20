@interface AKAuthorizationStoreMigrator
- (id)storeName;
- (unint64_t)currentSchemaVersion;
- (void)_buildSchemaVersion1;
- (void)_createV2Database;
- (void)_createV3Database;
- (void)_createV4Database;
- (void)_createV5Database;
- (void)_createV6Database;
- (void)_createV7Database;
- (void)_performInsertQueryIntoVersion:(unint64_t)a3;
- (void)_upgradeToSchemaVersion2;
- (void)_upgradeToSchemaVersion3;
- (void)_upgradeToSchemaVersion4;
- (void)_upgradeToSchemaVersion5;
- (void)_upgradeToSchemaVersion6;
- (void)_upgradeToSchemaVersion7;
- (void)_upgradeToSchemaVersion8;
- (void)migrateSchemaFromVersion:(unint64_t)a3;
@end

@implementation AKAuthorizationStoreMigrator

- (id)storeName
{
  return @"Authorization";
}

- (unint64_t)currentSchemaVersion
{
  return 8;
}

- (void)migrateSchemaFromVersion:(unint64_t)a3
{
  v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(AKAuthorizationStoreMigrator *)self storeName];
    int v7 = 138412546;
    v8 = v6;
    __int16 v9 = 1024;
    int v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Database Migration requested from version: %i", (uint8_t *)&v7, 0x12u);
  }
  switch(a3)
  {
    case 0uLL:
      [(AKAuthorizationStoreMigrator *)self _buildSchemaVersion1];
      goto LABEL_5;
    case 1uLL:
    case 2uLL:
LABEL_5:
      [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion2];
      [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion3];
      goto LABEL_6;
    case 3uLL:
LABEL_6:
      [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion4];
      goto LABEL_7;
    case 4uLL:
LABEL_7:
      [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion5];
      goto LABEL_8;
    case 5uLL:
LABEL_8:
      [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion6];
      goto LABEL_9;
    case 6uLL:
LABEL_9:
      [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion7];
      goto LABEL_10;
    case 7uLL:
LABEL_10:
      [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion8];
      break;
    default:
      return;
  }
}

- (void)_buildSchemaVersion1
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Building database with schema version: 1", v7, 2u);
  }

  v4 = [(AKStoreMigrator *)self executor];
  [v4 performQuery:@"CREATE TABLE IF NOT EXISTS authorized_teams (team_id TEXT PRIMARY KEY, uid TEXT, authorizedAppListVersion TEXT);"];

  v5 = [(AKStoreMigrator *)self executor];
  [v5 performQuery:@"CREATE TABLE IF NOT EXISTS authorized_applications (client_id TEXT PRIMARY KEY, team_id TEXT, scopes TEXT, credential_state INTEGER);"];

  v6 = [(AKStoreMigrator *)self executor];
  [v6 performQuery:@"CREATE TABLE IF NOT EXISTS version (authorizedAppListVersion TEXT PRIMARY KEY);"];
}

- (void)_upgradeToSchemaVersion2
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Upgrading database to schema version: 2", v7, 2u);
  }

  v4 = [(AKStoreMigrator *)self executor];
  [v4 performQuery:@"ALTER TABLE version ADD COLUMN db_version INTEGER;"];

  v5 = [(AKStoreMigrator *)self executor];
  [v5 performQuery:@"ALTER TABLE authorized_applications ADD COLUMN authorizedAppListVersion TEXT"];

  v6 = [(AKStoreMigrator *)self executor];
  [v6 performInsertQuery:@"UPDATE version SET authorizedAppListVersion = 'TEMPORARY';"];

  [(AKAuthorizationStoreMigrator *)self _performInsertQueryIntoVersion:2];
}

- (void)_upgradeToSchemaVersion3
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Upgrading database to schema version: 3", v6, 2u);
  }

  v4 = [(AKStoreMigrator *)self executor];
  [v4 performQuery:@"ALTER TABLE authorized_applications ADD COLUMN transfer_state TEXT"];

  v5 = [(AKStoreMigrator *)self executor];
  [v5 performQuery:@"ALTER TABLE authorized_applications ADD COLUMN primary_client_id TEXT"];

  [(AKAuthorizationStoreMigrator *)self _performInsertQueryIntoVersion:3];
}

- (void)_upgradeToSchemaVersion4
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Upgrading database to schema version: 4", v7, 2u);
  }

  v4 = [(AKStoreMigrator *)self executor];
  [v4 performQuery:@"ALTER TABLE authorized_applications ADD COLUMN origin TEXT;"];

  v5 = [(AKStoreMigrator *)self executor];
  [v5 performQuery:@"DROP TABLE IF EXISTS version;"];

  v6 = [(AKStoreMigrator *)self executor];
  [v6 performQuery:@"CREATE TABLE IF NOT EXISTS version (authorizedAppListVersion TEXT PRIMARY KEY, db_version INTEGER);"];

  [(AKAuthorizationStoreMigrator *)self _performInsertQueryIntoVersion:4];
}

- (void)_upgradeToSchemaVersion5
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Upgrading database to schema version: 5", v7, 2u);
  }

  v4 = [(AKStoreMigrator *)self executor];
  [v4 performQuery:@"CREATE TABLE IF NOT EXISTS authorized_primary_applications (client_id TEXT PRIMARY KEY, app_name TEXT, app_developer_name TEXT, has_eula BOOL, privacy_url TEXT);"];

  v5 = [(AKStoreMigrator *)self executor];
  [v5 performQuery:@"ALTER TABLE authorized_applications ADD COLUMN creation_date INTEGER NOT NULL DEFAULT 0"];

  v6 = [(AKStoreMigrator *)self executor];
  [v6 performQuery:@"ALTER TABLE authorized_teams ADD COLUMN private_email TEXT;"];

  [(AKAuthorizationStoreMigrator *)self _performInsertQueryIntoVersion:5];
}

- (void)_upgradeToSchemaVersion6
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Upgrading database to schema version: 6", buf, 2u);
  }

  v4 = [(AKStoreMigrator *)self executor];
  [v4 performQuery:@"DROP TABLE IF EXISTS authorized_primary_applications;"];

  v5 = [(AKStoreMigrator *)self executor];
  [v5 performQuery:@"CREATE TABLE IF NOT EXISTS authorized_primary_applications (client_id TEXT PRIMARY KEY, app_name TEXT, app_developer_name TEXT);"];

  [(AKAuthorizationStoreMigrator *)self _performInsertQueryIntoVersion:6];
  v6 = [(AKStoreMigrator *)self executor];
  int v7 = +[NSString stringWithFormat:@"DELETE FROM version where db_version != %i", 6];
  [v6 performQuery:v7];
}

- (void)_upgradeToSchemaVersion7
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Upgrading database to schema version: 7", buf, 2u);
  }

  v4 = [(AKStoreMigrator *)self executor];
  [v4 performQuery:@"ALTER TABLE authorized_applications ADD COLUMN client_name TEXT;"];

  [(AKAuthorizationStoreMigrator *)self _performInsertQueryIntoVersion:7];
  v5 = [(AKStoreMigrator *)self executor];
  v6 = +[NSString stringWithFormat:@"DELETE FROM version where db_version != %i", 7];
  [v5 performQuery:v6];
}

- (void)_upgradeToSchemaVersion8
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Upgrading database to schema version: 8", buf, 2u);
  }

  v4 = [(AKStoreMigrator *)self executor];
  [v4 performQuery:@"ALTER TABLE authorized_primary_applications ADD COLUMN adam_id TEXT;"];

  [(AKAuthorizationStoreMigrator *)self _performInsertQueryIntoVersion:8];
  v5 = [(AKStoreMigrator *)self executor];
  v6 = +[NSString stringWithFormat:@"DELETE FROM version where db_version != %i", 8];
  [v5 performQuery:v6];
}

- (void)_performInsertQueryIntoVersion:(unint64_t)a3
{
  id v5 = [(AKStoreMigrator *)self executor];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"INSERT OR REPLACE INTO version (authorizedAppListVersion, db_version) values ('TEMPORARY', '%i');",
  v4 = a3);
  [v5 performInsertQuery:v4];
}

- (void)_createV2Database
{
  [(AKAuthorizationStoreMigrator *)self _buildSchemaVersion1];

  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion2];
}

- (void)_createV3Database
{
  [(AKAuthorizationStoreMigrator *)self _buildSchemaVersion1];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion2];

  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion3];
}

- (void)_createV4Database
{
  [(AKAuthorizationStoreMigrator *)self _buildSchemaVersion1];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion2];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion3];

  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion4];
}

- (void)_createV5Database
{
  [(AKAuthorizationStoreMigrator *)self _buildSchemaVersion1];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion2];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion3];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion4];

  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion5];
}

- (void)_createV6Database
{
  [(AKAuthorizationStoreMigrator *)self _buildSchemaVersion1];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion2];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion3];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion4];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion5];

  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion6];
}

- (void)_createV7Database
{
  [(AKAuthorizationStoreMigrator *)self _buildSchemaVersion1];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion2];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion3];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion4];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion5];
  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion6];

  [(AKAuthorizationStoreMigrator *)self _upgradeToSchemaVersion7];
}

@end