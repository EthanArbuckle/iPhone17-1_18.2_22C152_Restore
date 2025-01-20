@interface CHDataMigrator
- (BOOL)didMigrateBackupFromDifferentDevice;
- (BOOL)performMigration;
- (BOOL)resetTimersIfNeeded;
- (CHDataMigrator)init;
- (NSUserDefaults)userDefaults;
- (void)removeDatabasesSyncedToGizmo;
- (void)resetCallHistorySyncHelperUserDefaults;
@end

@implementation CHDataMigrator

- (CHDataMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHDataMigrator;
  v2 = [(CHDataMigrator *)&v6 init];
  if (v2)
  {
    v3 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.CallHistorySyncHelper"];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = v3;
  }
  return v2;
}

- (BOOL)didMigrateBackupFromDifferentDevice
{
  if (os_variant_has_internal_diagnostics())
  {
    v3 = [(CHDataMigrator *)self userDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:@"resetCallTimersEnabled"];

    if (v4) {
      return 1;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CHDataMigrator;
  return [(CHDataMigrator *)&v6 didMigrateBackupFromDifferentDevice];
}

- (BOOL)performMigration
{
  [(CHDataMigrator *)self removeDatabasesSyncedToGizmo];
  if ([(CHDataMigrator *)self didRestoreFromBackup]) {
    [(CHDataMigrator *)self resetCallHistorySyncHelperUserDefaults];
  }

  return [(CHDataMigrator *)self resetTimersIfNeeded];
}

- (BOOL)resetTimersIfNeeded
{
  if (![(CHDataMigrator *)self didMigrateBackupFromDifferentDevice]) {
    return 1;
  }
  v2 = +[CHLogServer sharedInstance];
  v3 = [v2 logHandleForDomain:"CallHistoryDataMigrator"];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Requesting reset call timers", buf, 2u);
  }

  id v4 = objc_alloc((Class)NSXPCConnection);
  id v5 = [v4 initWithMachServiceName:kSyncHelperServiceIdentifier options:0];
  objc_super v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SyncProtocol];
  [v5 setRemoteObjectInterface:v6];
  [v5 resume];
  *(void *)buf = 0;
  v15 = buf;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&stru_4170];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_2BBC;
  v13[3] = &unk_4198;
  v13[4] = buf;
  [v7 resetCallTimers:v13];

  v8 = +[CHLogServer sharedInstance];
  v9 = [v8 logHandleForDomain:"CallHistoryDataMigrator"];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v15[24]) {
      CFStringRef v10 = @"successfully";
    }
    else {
      CFStringRef v10 = @"unsuccessfully";
    }
    *(_DWORD *)v18 = 138543362;
    CFStringRef v19 = v10;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Reset call timers request completed %{public}@", v18, 0xCu);
  }

  BOOL v11 = v15[24] != 0;
  _Block_object_dispose(buf, 8);

  return v11;
}

- (void)removeDatabasesSyncedToGizmo
{
  v30 = getMobileUserLibraryDirectoryPath();
  v2 = [v30 URLByAppendingPathComponent:kCallDBDirName];
  v3 = +[NSFileManager defaultManager];
  id v4 = [v2 path];
  id v5 = [v3 contentsOfDirectoryAtPath:v4 error:0];

  v31 = objc_opt_new();
  uint64_t v6 = [@"." stringByAppendingString:kCallHistoryDataStoreExtension];
  v33 = [kCallHistoryDBName stringByAppendingString:v6];
  v29 = (void *)v6;
  v32 = [kCallHistoryTempDBName stringByAppendingString:v6];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v39;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v13 = [v12 pathExtension];
        unsigned __int8 v14 = [v13 isEqualToString:@"plist"];

        if ((v14 & 1) == 0)
        {
          v15 = [v12 pathExtension];
          unsigned __int8 v16 = [v15 hasSuffix:@"shm"];

          if ((v16 & 1) == 0)
          {
            char v17 = [v12 pathExtension];
            unsigned __int8 v18 = [v17 hasSuffix:@"wal"];

            if ((v18 & 1) == 0)
            {
              CFStringRef v19 = [v12 lastPathComponent];
              unsigned __int8 v20 = [v19 isEqualToString:v33];

              if ((v20 & 1) == 0)
              {
                v21 = [v12 lastPathComponent];
                unsigned __int8 v22 = [v21 isEqualToString:v32];

                if ((v22 & 1) == 0) {
                  [v31 addObject:v12];
                }
              }
            }
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v9);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v23 = v31;
  id v24 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v35;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = [v2 URLByAppendingPathComponent:*(void *)(*((void *)&v34 + 1) + 8 * (void)j)];
        +[DBManager destroyDBAtLocation:v28 withModelAtLocation:0];
      }
      id v25 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v25);
  }
}

- (void)resetCallHistorySyncHelperUserDefaults
{
  v2 = [(CHDataMigrator *)self userDefaults];
  v3 = +[CHLogServer sharedInstance];
  id v4 = [v3 logHandleForDomain:"CallHistoryDataMigrator"];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    CFStringRef v8 = @"com.apple.callhistory.cloud-storage";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Removing user defaults related to the legacy iCloud container %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [v2 removeObjectForKey:@"com.apple.callhistory.cloud-storage"];
  id v5 = +[CHLogServer sharedInstance];
  uint64_t v6 = [v5 logHandleForDomain:"CallHistoryDataMigrator"];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    CFStringRef v8 = @"com.apple.callhistory.cloud-storage2";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Removing user defaults related to the current iCloud container %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [v2 removeObjectForKey:@"com.apple.callhistory.cloud-storage2"];
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
}

@end