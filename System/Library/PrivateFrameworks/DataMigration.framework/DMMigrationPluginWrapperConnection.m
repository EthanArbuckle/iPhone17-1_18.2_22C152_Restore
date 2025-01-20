@interface DMMigrationPluginWrapperConnection
+ (id)connection;
- (BOOL)didReceivePid;
- (DMMigrationPluginWrapperConnection)init;
- (int)_pid;
- (void)handleMessage:(id)a3;
- (void)invalidate;
- (void)resume;
- (void)runPluginAtPath:(id)a3 withIdentifier:(id)a4 parameters:(id)a5 completion:(id)a6;
@end

@implementation DMMigrationPluginWrapperConnection

+ (id)connection
{
  v2 = objc_alloc_init(DMMigrationPluginWrapperConnection);

  return v2;
}

- (DMMigrationPluginWrapperConnection)init
{
  v9.receiver = self;
  v9.super_class = (Class)DMMigrationPluginWrapperConnection;
  v2 = [(DMMigrationPluginWrapperConnection *)&v9 init];
  if (v2)
  {
    v3 = [[DMXPCConnection alloc] initWithServiceName:@"com.apple.migrationpluginwrapper"];
    connection = v2->_connection;
    v2->_connection = v3;

    v2->_didReceivePid = 0;
    objc_initWeak(&location, v2);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__DMMigrationPluginWrapperConnection_init__block_invoke;
    v6[3] = &unk_1E6C1E120;
    objc_copyWeak(&v7, &location);
    [(DMXPCConnection *)v2->_connection setMessageHandler:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __42__DMMigrationPluginWrapperConnection_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleMessage:v3];
}

- (void)resume
{
}

- (void)invalidate
{
}

- (BOOL)didReceivePid
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL didReceivePid = v2->_didReceivePid;
  objc_sync_exit(v2);

  return didReceivePid;
}

- (int)_pid
{
  v2 = [(DMXPCConnection *)self->_connection connection];
  pid_t pid = xpc_connection_get_pid(v2);

  return pid;
}

- (void)runPluginAtPath:(id)a3 withIdentifier:(id)a4 parameters:(id)a5 completion:(id)a6
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = (void (**)(id, BOOL, void *))a6;
  id v12 = a4;
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v13, "msgID", 0);
  id v14 = v9;
  xpc_dictionary_set_string(v13, "pluginPath", (const char *)[v14 UTF8String]);
  id v15 = v12;
  v16 = (const char *)[v15 UTF8String];

  xpc_dictionary_set_string(v13, "pluginIdentifier", v16);
  v17 = +[DMEnvironment sharedInstance];
  LODWORD(v16) = [v17 suppressMigrationPluginWrapperExitMarkerPref];

  if (v16) {
    xpc_dictionary_set_BOOL(v13, (const char *)[@"DMSuppressMigrationPluginWrapperExit" UTF8String], 1);
  }
  v18 = +[DMEnvironment sharedInstance];
  int v19 = [v18 testMigrationInfrastructureOnly];

  if (v19) {
    xpc_dictionary_set_BOOL(v13, "testMigrationInfrastructureOnly", 1);
  }
  v20 = [v10 dispositionSupersetOfContext];
  unsigned int v21 = +[DMUserDataDispositionManager dispositionFlagsFromDispositionDict:v20];

  xpc_dictionary_set_uint64(v13, "userDataDisposition", v21);
  v22 = [v10 dispositionSupersetOfContext];
  v23 = [v22 objectForKeyedSubscript:@"RestoredBackupBuildVersion"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    xpc_dictionary_set_string(v13, (const char *)[@"RestoredBackupBuildVersion" UTF8String], (const char *)objc_msgSend(v23, "UTF8String"));
  }
  v24 = [v10 dispositionSupersetOfContext];
  v25 = [v24 objectForKeyedSubscript:@"RestoredBackupProductType"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    xpc_dictionary_set_string(v13, (const char *)[@"RestoredBackupProductType" UTF8String], (const char *)objc_msgSend(v25, "UTF8String"));
  }
  v26 = [v10 dispositionSupersetOfContext];
  v27 = [v26 objectForKeyedSubscript:@"RestoredBackupDeviceName"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    xpc_dictionary_set_string(v13, (const char *)[@"RestoredBackupDeviceName" UTF8String], (const char *)objc_msgSend(v27, "UTF8String"));
  }
  v28 = (const char *)[@"SyntheticDidUpgrade" UTF8String];
  v29 = [v10 dispositionSupersetOfContext];
  v30 = [v29 objectForKeyedSubscript:@"SyntheticDidUpgrade"];
  xpc_dictionary_set_BOOL(v13, v28, [v30 BOOLValue]);

  v31 = (const char *)[@"DidRestoreFromBackup" UTF8String];
  v32 = [v10 dispositionSupersetOfContext];
  v33 = [v32 objectForKeyedSubscript:@"DidRestoreFromBackup"];
  xpc_dictionary_set_BOOL(v13, v31, [v33 BOOLValue]);

  v34 = (const char *)[@"DidMigrateBackupFromDifferentDevice" UTF8String];
  v35 = [v10 dispositionSupersetOfContext];
  v36 = [v35 objectForKeyedSubscript:@"DidMigrateBackupFromDifferentDevice"];
  xpc_dictionary_set_BOOL(v13, v34, [v36 BOOLValue]);

  v37 = (const char *)[@"DidRestoreFromCloudBackup" UTF8String];
  v38 = [v10 dispositionSupersetOfContext];
  v39 = [v38 objectForKeyedSubscript:@"DidRestoreFromCloudBackup"];
  xpc_dictionary_set_BOOL(v13, v37, [v39 BOOLValue]);

  v40 = (const char *)[@"ShouldPreserveSettingsAfterRestore" UTF8String];
  v41 = [v10 dispositionSupersetOfContext];
  v42 = [v41 objectForKeyedSubscript:@"ShouldPreserveSettingsAfterRestore"];
  xpc_dictionary_set_BOOL(v13, v40, [v42 BOOLValue]);

  v43 = (const char *)[@"WasPasscodeSetInBackup" UTF8String];
  v44 = [v10 dispositionSupersetOfContext];
  v45 = [v44 objectForKeyedSubscript:@"WasPasscodeSetInBackup"];
  xpc_dictionary_set_BOOL(v13, v43, [v45 BOOLValue]);

  v46 = (const char *)[@"RestoredBackupIsMegaBackup" UTF8String];
  v47 = [v10 dispositionSupersetOfContext];
  v48 = [v47 objectForKeyedSubscript:@"RestoredBackupIsMegaBackup"];
  xpc_dictionary_set_BOOL(v13, v46, [v48 BOOLValue]);

  v49 = [v10 backupDeviceUUID];
  uint64_t v50 = [v49 length];

  if (v50)
  {
    id v51 = [v10 backupDeviceUUID];
    xpc_dictionary_set_string(v13, "backupDeviceUUID", (const char *)[v51 UTF8String]);
  }
  _DMLogFunc(v58, 7, @"DMMigrationPluginWrapperConnection will sendMessageSync:");
  v52 = [(DMXPCConnection *)self->_connection sendMessageSync:v13];
  if (MEMORY[0x1E01944D0]() == MEMORY[0x1E4F145A8])
  {
    string = xpc_dictionary_get_string(v52, (const char *)*MEMORY[0x1E4F14530]);
    _DMLogFunc(v58, 6, @"MigrationPluginWrapper -runPluginAtPath: %@ withParameters: XPC error: %s");
    v55 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v60 = *MEMORY[0x1E4F28568];
    v61[0] = @"migrationpluginwrapper xpc error";
    v56 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1, v14, string);
    v54 = [v55 errorWithDomain:@"com.apple.datamigrator" code:0 userInfo:v56];

    BOOL v53 = 0;
  }
  else
  {
    BOOL v53 = xpc_dictionary_get_BOOL(v52, "migrationResult");
    v54 = 0;
  }
  v11[2](v11, v53, v54);
}

- (void)handleMessage:(id)a3
{
  xpc_object_t xdict = a3;
  if (!xpc_dictionary_get_int64(xdict, "msgID"))
  {
    v5 = self;
    objc_sync_enter(v5);
    v5->_BOOL didReceivePid = 1;
    objc_sync_exit(v5);

    int64_t int64 = xpc_dictionary_get_int64(xdict, "pid");
    id v7 = [NSNumber numberWithLongLong:0];
    v8 = [NSNumber numberWithInt:int64];
    id v9 = objc_msgSend(NSNumber, "numberWithInt:", -[DMMigrationPluginWrapperConnection _pid](v5, "_pid"));
    _DMLogFunc(v3, 7, @"DMMigrationPluginWrapperConnection handling event %p msgID %@ containing pid %@ from peer pid %@");
  }
}

- (void).cxx_destruct
{
}

@end