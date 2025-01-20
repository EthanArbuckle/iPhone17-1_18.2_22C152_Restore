@interface PLLibraryRepairSupportRegistration
+ (BOOL)_shouldSuppressPeriodicMaintenanceTasks;
+ (int64_t)checkLibraryIsReadyForProcessing:(id)a3 libraryBundle:(id *)a4;
+ (void)_enqueueDrawAssetPersonEdgesOperationWithLSM:(id)a3 library:(id)a4 serverTransaction:(id)a5;
+ (void)_enqueueSocialGroupAssetContainmentOperationWithLSM:(id)a3 library:(id)a4 serverTransaction:(id)a5;
+ (void)_enqueueSocialGroupDeduplicationOperationWithLSM:(id)a3 library:(id)a4 serverTransaction:(id)a5;
+ (void)enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:(id)a3;
+ (void)installPeriodicMaintenanceActivity;
+ (void)registerXPCActivityHandler:(const char *)a3 description:(id)a4 executionBlock:(id)a5;
@end

@implementation PLLibraryRepairSupportRegistration

+ (void)_enqueueSocialGroupAssetContainmentOperationWithLSM:(id)a3 library:(id)a4 serverTransaction:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = PLLibraryServicesOperationNameCrashRecoverySocialGroupAssetContainment;
  v9 = [v6 preRunningProgress];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100010AE8;
  v16 = &unk_10002D4B0;
  id v17 = v6;
  id v18 = v7;
  id v10 = v7;
  id v11 = v6;
  v12 = +[PLLibraryServicesOperation operationWithName:v8 requiredState:7 parentProgress:v9 execution:&v13];

  objc_msgSend(v11, "enqueueOperation:error:", v12, 0, v13, v14, v15, v16);
}

+ (void)_enqueueDrawAssetPersonEdgesOperationWithLSM:(id)a3 library:(id)a4 serverTransaction:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = PLLibraryServicesOperationNameCrashRecoveryDrawAssetPersonEdges;
  id v11 = [v7 preRunningProgress];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100010E60;
  v16[3] = &unk_10002D2A0;
  id v17 = v8;
  id v18 = v7;
  id v19 = v9;
  id v12 = v9;
  id v13 = v7;
  id v14 = v8;
  v15 = +[PLLibraryServicesOperation operationWithName:v10 requiredState:7 parentProgress:v11 execution:v16];

  [v13 enqueueOperation:v15 error:0];
}

+ (void)_enqueueSocialGroupDeduplicationOperationWithLSM:(id)a3 library:(id)a4 serverTransaction:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = PLLibraryServicesOperationNameCrashRecoverySocialGroupDeduplication;
  id v9 = [v6 preRunningProgress];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_1000110D0;
  v16 = &unk_10002D4B0;
  id v17 = v6;
  id v18 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = +[PLLibraryServicesOperation operationWithName:v8 requiredState:7 parentProgress:v9 execution:&v13];

  objc_msgSend(v11, "enqueueOperation:error:", v12, 0, v13, v14, v15, v16);
}

+ (void)enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:(id)a3
{
  id v4 = a3;
  v5 = [v4 pathManager];
  id v6 = [v4 databaseContext];
  id v7 = [v6 newShortLivedLibraryWithName:"+[PLLibraryRepairSupportRegistration enqueueOutstandingTransactionCrashRecoveryOperationsIfNecessary:]"];

  uint64_t v8 = [v7 globalValues];
  unsigned __int8 v9 = [v8 didImportFileSystemAssets];

  id v10 = PLClientServerTransactionsGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Enqueuing outstanding transactions", buf, 2u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011394;
  v14[3] = &unk_10002D038;
  id v15 = v5;
  id v16 = v4;
  char v19 = v9 ^ 1;
  id v17 = v7;
  id v18 = a1;
  id v11 = v7;
  id v12 = v4;
  id v13 = v5;
  [v12 registerOutstandingTransactionsHandler:v14];
}

+ (void)installPeriodicMaintenanceActivity
{
  v3 = PLBackendGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering periodic maintenance task activity", buf, 2u);
  }

  [a1 registerXPCActivityHandler:"com.apple.assetsd.periodicmaintenance" description:@"MaintenanceTasks: Repair library" executionBlock:&stru_10002CFC8];
  id v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Registering periodic curated library processing activity", v5, 2u);
  }

  [a1 registerXPCActivityHandler:"com.apple.assetsd.curatedlibraryprocessing" description:@"CuratedLibraryMaintenanceTasks: Repair library" executionBlock:&stru_10002CFE8];
  +[PLBackgroundMigrationActivity registerIncompleteBackgroundMigrationActivity];
}

+ (int64_t)checkLibraryIsReadyForProcessing:(id)a3 libraryBundle:(id *)a4
{
  v5 = (__CFString *)a3;
  id v6 = +[PLLibraryBookmarkManager sharedBookmarkManager];
  id v42 = 0;
  id v7 = [v6 URLFromClientLibraryURL:v5 sandboxExtension:0 error:&v42];
  id v8 = v42;
  if (v7)
  {
    int64_t v9 = 6;
  }
  else
  {
    id v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v5;
      __int16 v45 = 2112;
      id v46 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error getting SSB for libraryURL %@. Error: %@", buf, 0x16u);
    }

    int64_t v9 = 0;
  }
  id v11 = PLBackendGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "accessibleLibraryURL: %@", buf, 0xCu);
  }

  if (v7)
  {
    id v12 = +[PLPhotoLibraryBundleController sharedBundleController];
    id v13 = [v12 openBundleAtLibraryURL:v7];

    if (!v13)
    {
      uint64_t v14 = PLBackendGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No libraryBundle for %@", buf, 0xCu);
      }

      id v13 = 0;
      int64_t v9 = 1;
    }
  }
  else
  {
    id v13 = 0;
  }
  id v15 = PLBackendGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "libraryBundle: %@", buf, 0xCu);
  }

  if (v13)
  {
    if ((+[PLPhotoLibraryPathManager isSystemPhotoLibraryURL:v7] & 1) == 0)
    {
      id v16 = objc_alloc((Class)PLModelMigrator);
      [(__CFString *)v13 pathManager];
      v18 = id v17 = v8;
      id v19 = [v16 initWithPathManager:v18];
      unsigned int v20 = [v19 isPhotoLibraryDatabaseReadyForOpen:0];

      id v8 = v17;
      if (!v20)
      {
        v22 = PLBackendGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v7;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Photo library database at %@ is not ready for maintenance tasks", buf, 0xCu);
        }
        v21 = 0;
        int64_t v9 = 5;
        goto LABEL_44;
      }
    }
    v21 = [(__CFString *)v13 libraryServicesManager];
    if (!v21)
    {
      v22 = PLBackendGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v13;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "No libraryServicesManager for library bundle %@", buf, 0xCu);
      }
      v21 = 0;
      int64_t v9 = 2;
      goto LABEL_44;
    }
  }
  else
  {
    v21 = 0;
  }
  if (v9 != 6) {
    goto LABEL_45;
  }
  v40 = a4;
  id v23 = [objc_alloc((Class)PLPhotoLibraryOpener) initWithLibraryServicesManager:v21 reportInProgressUpgrades:0];
  id v41 = 0;
  unsigned int v24 = [v23 openPhotoLibraryDatabaseWithAutoUpgrade:0 autoCreate:0 error:&v41];
  id v38 = v41;
  if (v24)
  {
    int64_t v9 = 6;
  }
  else
  {
    v25 = PLBackendGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v7;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Photo library database at %@ cannot be opened", buf, 0xCu);
    }

    int64_t v9 = 4;
  }
  v26 = PLBackendGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v27 = @"NO";
    if (v24) {
      v27 = @"YES";
    }
    id v37 = v23;
    id v28 = v8;
    v29 = v5;
    v30 = v6;
    v31 = v27;
    *(_DWORD *)buf = 138412290;
    v44 = v31;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Maintain library: open database: %@", buf, 0xCu);

    id v6 = v30;
    v5 = v29;
    id v8 = v28;
    id v23 = v37;
  }

  if (!v24)
  {
    a4 = v40;
    goto LABEL_45;
  }
  id v39 = v8;
  v32 = v6;
  v33 = [(__CFString *)v13 libraryServicesManager];
  v34 = [v33 cplReadiness];
  unsigned __int8 v35 = [v34 isReadyForCloudPhotoLibraryWithStatus:0];

  if (v35)
  {
    int64_t v9 = 6;
    id v6 = v32;
    id v8 = v39;
    a4 = v40;
    goto LABEL_45;
  }
  v22 = PLBackendGetLog();
  id v6 = v32;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v7;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Photo library at %@ is currently not ready", buf, 0xCu);
  }
  int64_t v9 = 3;
  id v8 = v39;
  a4 = v40;
LABEL_44:

LABEL_45:
  if (a4) {
    *a4 = v13;
  }

  return v9;
}

+ (void)registerXPCActivityHandler:(const char *)a3 description:(id)a4 executionBlock:(id)a5
{
  id v8 = a4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100012E38;
  handler[3] = &unk_10002CF88;
  id v13 = a5;
  id v14 = a1;
  id v12 = v8;
  id v9 = v13;
  id v10 = v8;
  xpc_activity_register(a3, XPC_ACTIVITY_CHECK_IN, handler);
}

+ (BOOL)_shouldSuppressPeriodicMaintenanceTasks
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobileslideshow"];
  unsigned int v3 = [v2 BOOLForKey:@"com.apple.Photos.SuppressMaintenanceTasks"];
  if (v3)
  {
    id v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      CFStringRef v7 = @"com.apple.Photos.SuppressMaintenanceTasks";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MaintenanceTasks: Repair library disabled by user default %@.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

@end