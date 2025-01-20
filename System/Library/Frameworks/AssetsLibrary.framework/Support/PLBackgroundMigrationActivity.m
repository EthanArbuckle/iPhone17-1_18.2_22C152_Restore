@interface PLBackgroundMigrationActivity
+ (id)_backgroundMigrationUniqueID:(const char *)a3;
+ (id)_criteriaForBackgroundMigration;
+ (void)installBackgroundMigrationActivity:(id)a3;
+ (void)registerIncompleteBackgroundMigrationActivity;
- (BOOL)_runTask;
- (PLBackgroundMigrationActivity)initWithLibraryBundle:(id)a3 xpcActivity:(id)a4 description:(id)a5;
- (void)_runBackgroundMigrationActions;
@end

@implementation PLBackgroundMigrationActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

- (void)_runBackgroundMigrationActions
{
  v3 = PLBackendGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "running background migration tasks...", (uint8_t *)&v6, 2u);
  }

  if ([(PLBackgroundMigrationActivity *)self _runTask])
  {
    v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      transaction = self->_transaction;
      int v6 = 138412290;
      v7 = transaction;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Done background migrating: %@", (uint8_t *)&v6, 0xCu);
    }

    xpc_activity_set_state(self->_xpcActivity, 5);
  }
}

- (BOOL)_runTask
{
  v3 = +[PLFileBackedLogger setupWithLibraryIdentifier:0 type:1];
  v4 = v3;
  bundle = self->_bundle;
  if (bundle)
  {
    id v24 = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000D240;
    v22[3] = &unk_10002CE70;
    v22[4] = self;
    id v6 = v3;
    id v23 = v6;
    id v7 = +[PLBackgroundModelMigration migrateBackgroundActionsWithPhotoLibraryBundle:bundle logger:v6 error:&v24 continuationHandler:v22];
    id v8 = v24;
    if (v7 == (id)3)
    {
      v9 = PLMigrationGetLog();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (v10)
      {
        if (v6)
        {
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          *(_OWORD *)buf = 0u;
          long long v28 = 0u;
          v11 = PLMigrationGetLog();
          os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
          int v25 = 138412290;
          id v26 = v8;
          LODWORD(v21) = 12;
          v12 = (uint8_t *)_os_log_send_and_compose_impl();

          objc_msgSend(v6, "logWithMessage:fromCodeLocation:type:", v12, "PLBackgroundMigrationActivity.m", 57, 16, &v25, v21);
          if (v12 != buf) {
            free(v12);
          }
        }
        else
        {
          v19 = PLMigrationGetLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v8;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to perform background migration tasks. Setting activity to DEFER. Error: %@", buf, 0xCu);
          }
        }
      }
      xpc_activity_set_state(self->_xpcActivity, 3);
    }

    BOOL v18 = v7 == (id)1;
  }
  else
  {
    v13 = PLMigrationGetLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      if (v4)
      {
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        *(_OWORD *)buf = 0u;
        long long v28 = 0u;
        v15 = PLMigrationGetLog();
        os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
        LOWORD(v25) = 0;
        LODWORD(v21) = 2;
        v16 = (uint8_t *)_os_log_send_and_compose_impl();

        objc_msgSend(v4, "logWithMessage:fromCodeLocation:type:", v16, "PLBackgroundMigrationActivity.m", 65, 16, &v25, v21);
        if (v16 != buf) {
          free(v16);
        }
      }
      else
      {
        v17 = PLMigrationGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Missing bundle for background migration actions", buf, 2u);
        }
      }
    }
    BOOL v18 = 0;
  }
  [v4 close];

  return v18;
}

- (PLBackgroundMigrationActivity)initWithLibraryBundle:(id)a3 xpcActivity:(id)a4 description:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PLBackgroundMigrationActivity;
  v12 = [(PLBackgroundMigrationActivity *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundle, a3);
    objc_storeStrong((id *)&v13->_xpcActivity, a4);
    uint64_t v14 = +[PLXPCTransaction transaction:](PLXPCTransaction, "transaction:", [v11 UTF8String]);
    transaction = v13->_transaction;
    v13->_transaction = (PLXPCTransaction *)v14;
  }
  return v13;
}

+ (void)installBackgroundMigrationActivity:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_backgroundMigrationUniqueID:", objc_msgSend(v4, "fileSystemRepresentation"));
  if (v5)
  {
    id v6 = +[NSString stringWithFormat:@"com.apple.%s.migration.%@", "assetsd", v5];
    id v7 = +[NSString stringWithFormat:@"BackgroundMigrationTasks: Migrate library: %@", v5];
    PLRegisterBackgroundMigrationLibraryURL();
    id v8 = v6;
    id v9 = (const char *)[v8 UTF8String];
    id v10 = [a1 _criteriaForBackgroundMigration];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000D660;
    handler[3] = &unk_10002CE98;
    id v14 = v4;
    id v15 = v7;
    id v16 = v8;
    id v11 = v8;
    id v12 = v7;
    xpc_activity_register(v9, v10, handler);
  }
}

+ (void)registerIncompleteBackgroundMigrationActivity
{
  v2 = PLRegisteredBackgroundMigrationPaths();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = +[NSURL fileURLWithPath:*(void *)(*((void *)&v8 + 1) + 8 * (void)v6) isDirectory:1];
        +[PLBackgroundMigrationActivity installBackgroundMigrationActivity:v7];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

+ (id)_backgroundMigrationUniqueID:(const char *)a3
{
  memset(&v9, 0, sizeof(v9));
  if (stat(a3, &v9))
  {
    id v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = *__error();
      uint64_t v5 = __error();
      id v6 = strerror(*v5);
      *(_DWORD *)buf = 67109378;
      int v11 = v4;
      __int16 v12 = 2080;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to obtain uniqueID for background migration registration. Error: [%d] %s", buf, 0x12u);
    }

    id v7 = 0;
  }
  else
  {
    id v7 = +[NSString stringWithFormat:@"%d.%llu", v9.st_dev, v9.st_ino];
  }

  return v7;
}

+ (id)_criteriaForBackgroundMigration
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_GROUP_NAME, "com.apple.assetsd.backgroundmigrations");
  xpc_dictionary_set_uint64(v2, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1uLL);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);

  return v2;
}

@end