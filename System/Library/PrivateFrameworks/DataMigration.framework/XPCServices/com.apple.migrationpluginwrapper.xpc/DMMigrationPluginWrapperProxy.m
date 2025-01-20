@interface DMMigrationPluginWrapperProxy
+ (void)_ensureExitAfterThrottlePeriod;
- (DMMigrationPluginWrapperProxy)initWithConnection:(id)a3;
- (void)handleMessage:(id)a3;
@end

@implementation DMMigrationPluginWrapperProxy

- (DMMigrationPluginWrapperProxy)initWithConnection:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DMMigrationPluginWrapperProxy;
  return [(DMMigrationPluginWrapperProxy *)&v4 initWithConnection:a3];
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v4, "msgID");
  uint64_t v6 = OBJC_IVAR___DMXPCConnection__connection;
  uint64_t pid = xpc_connection_get_pid(*(xpc_connection_t *)&self->DMXPCConnection_opaque[OBJC_IVAR___DMXPCConnection__connection]);
  v8 = +[NSNumber numberWithLongLong:int64];
  v37 = +[NSNumber numberWithInt:pid];
  _DMLogFunc();

  if (int64)
  {
    _DMLogFunc();
  }
  else
  {
    if (xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(@"DMSuppressMigrationPluginWrapperExit", "UTF8String", v4, v8, v37)))
    {
      _DMLogFunc();
    }
    else
    {
      +[DMMigrationPluginWrapperProxy _ensureExitAfterThrottlePeriod];
    }
    _DMLogFunc();
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "msgID", 0);
    pid_t v10 = getpid();
    xpc_dictionary_set_int64(v9, "pid", v10);
    v43 = self;
    v45 = v9;
    xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v6], v9);
    v59[0] = @"SyntheticDidUpgrade";
    v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(@"SyntheticDidUpgrade", "UTF8String", v4)));
    v60[0] = v11;
    v59[1] = @"DidRestoreFromBackup";
    v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", xpc_dictionary_get_BOOL(v4, (const char *)[@"DidRestoreFromBackup" UTF8String]));
    v60[1] = v12;
    v59[2] = @"DidMigrateBackupFromDifferentDevice";
    v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", xpc_dictionary_get_BOOL(v4, (const char *)[@"DidMigrateBackupFromDifferentDevice" UTF8String]));
    v60[2] = v13;
    v59[3] = @"DidRestoreFromCloudBackup";
    v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", xpc_dictionary_get_BOOL(v4, (const char *)[@"DidRestoreFromCloudBackup" UTF8String]));
    v60[3] = v14;
    v59[4] = @"ShouldPreserveSettingsAfterRestore";
    v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", xpc_dictionary_get_BOOL(v4, (const char *)[@"ShouldPreserveSettingsAfterRestore" UTF8String]));
    v60[4] = v15;
    v59[5] = @"WasPasscodeSetInBackup";
    v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", xpc_dictionary_get_BOOL(v4, (const char *)[@"WasPasscodeSetInBackup" UTF8String]));
    v60[5] = v16;
    v59[6] = @"RestoredBackupIsMegaBackup";
    v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", xpc_dictionary_get_BOOL(v4, (const char *)[@"RestoredBackupIsMegaBackup" UTF8String]));
    v60[6] = v17;
    v42 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:7];

    string = xpc_dictionary_get_string(v4, (const char *)[@"RestoredBackupBuildVersion" UTF8String]);
    if (string)
    {
      v41 = +[NSString stringWithUTF8String:string];
    }
    else
    {
      v41 = 0;
    }
    v19 = xpc_dictionary_get_string(v4, (const char *)[@"RestoredBackupProductType" UTF8String]);
    if (v19)
    {
      v40 = +[NSString stringWithUTF8String:v19];
    }
    else
    {
      v40 = 0;
    }
    v20 = xpc_dictionary_get_string(v4, (const char *)[@"RestoredBackupDeviceName" UTF8String]);
    if (v20)
    {
      v38 = +[NSString stringWithUTF8String:v20];
    }
    else
    {
      v38 = 0;
    }
    uint64_t int64 = xpc_dictionary_get_uint64(v4, "userDataDisposition");
    v22 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v4, "pluginPath")];
    v23 = [v22 lastPathComponent];
    v24 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v4, "pluginIdentifier")];
    v25 = xpc_dictionary_get_string(v4, "backupDeviceUUID");
    if (v25)
    {
      v26 = +[NSString stringWithUTF8String:v25];
    }
    else
    {
      v26 = 0;
    }
    BOOL v27 = xpc_dictionary_get_BOOL(v4, "testMigrationInfrastructureOnly");
    id v28 = +[NSString stringWithFormat:@"com.apple.migrationpluginwrapper.plugin.%@", v23];
    v29 = dispatch_queue_create((const char *)[v28 UTF8String], 0);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000546C;
    block[3] = &unk_10000C2C8;
    id v47 = v24;
    id v48 = v23;
    id v49 = v22;
    id v50 = v42;
    int v57 = uint64;
    v30 = v24;
    id v51 = v41;
    id v52 = v40;
    BOOL v58 = v27;
    id v53 = v38;
    id v54 = v26;
    id v55 = v4;
    v56 = v43;
    id v44 = v26;
    id v39 = v38;
    id v31 = v40;
    id v32 = v41;
    id v33 = v42;
    id v34 = v22;
    id v35 = v23;
    id v36 = v30;
    dispatch_sync(v29, block);
  }
}

+ (void)_ensureExitAfterThrottlePeriod
{
  if (qword_100015438 != -1) {
    dispatch_once(&qword_100015438, &stru_10000C308);
  }
}

@end