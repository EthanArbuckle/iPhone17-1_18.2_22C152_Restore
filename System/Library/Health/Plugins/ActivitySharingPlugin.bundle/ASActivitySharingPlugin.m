@interface ASActivitySharingPlugin
- (ASActivitySharingPlugin)init;
- (NSString)pluginIdentifier;
- (NSString)schemaName;
- (id)_createTableSQLStringForCompetitionLists;
- (id)_dropTableSQLStringForCompetitionLists;
- (id)_dropTableSQLStringForCompetitions;
- (id)databaseEntitiesForProtectionClass:(int64_t)a3;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)taskServerClasses;
- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3;
- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4;
@end

@implementation ASActivitySharingPlugin

- (ASActivitySharingPlugin)init
{
  ASLoggingInitialize();
  v3 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_241DD4000, v3, OS_LOG_TYPE_DEFAULT, "Activity Sharing plugin loaded.", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)ASActivitySharingPlugin;
  return [(ASActivitySharingPlugin *)&v5 init];
}

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F23D70];
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)extensionForProfile:(id)a3
{
  id v3 = a3;
  v4 = [v3 daemon];
  objc_super v5 = [v4 behavior];
  char v6 = [v5 supportsActivitySharing];

  if ((v6 & 1) == 0)
  {
    ASLoggingInitialize();
    v11 = *MEMORY[0x263F23AC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
      sub_241DD6D7C(v11);
    }
    goto LABEL_10;
  }
  uint64_t v7 = [v3 profileType];
  ASLoggingInitialize();
  v8 = *MEMORY[0x263F23AC0];
  v9 = *MEMORY[0x263F23AC0];
  if (v7 != 1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_241DD6D38(v8);
    }
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_241DD4000, v8, OS_LOG_TYPE_DEFAULT, "Health Daemon supports Activity Sharing, creating profile extension.", v13, 2u);
  }
  v10 = (void *)[objc_alloc(MEMORY[0x263F240A0]) initWithProfile:v3];
LABEL_11:

  return v10;
}

- (id)taskServerClasses
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (ASActivitySharingDaemonEnabled())
  {
    uint64_t v9 = objc_opt_class();
    v2 = (void *)MEMORY[0x263EFF8C0];
    id v3 = &v9;
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v2 = (void *)MEMORY[0x263EFF8C0];
    id v3 = &v7;
    uint64_t v4 = 2;
  }
  objc_super v5 = objc_msgSend(v2, "arrayWithObjects:count:", v3, v4, v7, v8, v9, v10);

  return v5;
}

- (NSString)schemaName
{
  return (NSString *)(id)*MEMORY[0x263F23C58];
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  if (a3 == 2) {
    return 5;
  }
  else {
    return 1;
  }
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  v5[2] = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    v5[0] = objc_opt_class();
    v5[1] = objc_opt_class();
    id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  }
  else
  {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }

  return v3;
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  if (a3 == 2)
  {
    v13[5] = v7;
    v13[6] = v6;
    v13[11] = v4;
    v13[12] = v5;
    uint64_t v9 = *MEMORY[0x263F23C58];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_241DD6348;
    v13[3] = &unk_2650F91A8;
    v13[4] = self;
    id v10 = a4;
    [v10 addMigrationForSchema:v9 toVersion:1 foreignKeyStatus:0 handler:v13];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_241DD6548;
    v12[3] = &unk_2650F91A8;
    v12[4] = self;
    [v10 addMigrationForSchema:v9 toVersion:2 foreignKeyStatus:0 handler:v12];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_241DD6758;
    v11[3] = &unk_2650F91A8;
    v11[4] = self;
    [v10 addMigrationForSchema:v9 toVersion:3 foreignKeyStatus:0 handler:v11];
    [v10 addMigrationForSchema:v9 toVersion:4 foreignKeyStatus:0 handler:&unk_26F5D8AE0];
    [v10 addMigrationForSchema:v9 toVersion:5 foreignKeyStatus:0 handler:&unk_26F5D8B00];
  }
}

- (id)_createTableSQLStringForCompetitionLists
{
  return (id)[NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@_%@             (%@ INTEGER PRIMARY KEY AUTOINCREMENT, %@ BLOB, %@ INTEGER, %@ BLOB, %@ INTEGER, UNIQUE(%@, %@))", *MEMORY[0x263F23C58], *MEMORY[0x263F23C48], *MEMORY[0x263F43488], *MEMORY[0x263F24050], *MEMORY[0x263F24060], *MEMORY[0x263F24048], *MEMORY[0x263F24058], *MEMORY[0x263F24050], *MEMORY[0x263F24060]];
}

- (id)_dropTableSQLStringForCompetitions
{
  return (id)[NSString stringWithFormat:@"DROP TABLE IF EXISTS %@_%@", *MEMORY[0x263F23C58], *MEMORY[0x263F23C50]];
}

- (id)_dropTableSQLStringForCompetitionLists
{
  return (id)[NSString stringWithFormat:@"DROP TABLE IF EXISTS %@_%@", *MEMORY[0x263F23C58], *MEMORY[0x263F23C48]];
}

@end