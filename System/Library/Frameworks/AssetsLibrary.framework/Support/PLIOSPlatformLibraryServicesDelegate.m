@interface PLIOSPlatformLibraryServicesDelegate
- (id)commonBuiltInOperations;
- (id)systemLibraryBuiltInOperations;
- (int64_t)requiredStateForFileSystemImportOperation;
- (void)_abortWithMigrationFailureError:(id)a3;
- (void)_abortWithMigrationFailureReasonEACCES;
- (void)_abortWithMigrationFailureReasonENOSPC;
@end

@implementation PLIOSPlatformLibraryServicesDelegate

- (id)commonBuiltInOperations
{
  v3 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  uint64_t v4 = PLiOSPlatformLibraryServicesOperationNameWaitForFirstUnlock;
  v38 = [v3 preRunningProgress];
  v37 = +[PLLibraryServicesOperation operationWithName:v4 requiredState:2 parentProgress:v38 execution:&stru_10002CCF8];
  v56[0] = v37;
  uint64_t v5 = PLiOSPlatformLibraryServicesOperationNameMigrateOrRebuild;
  v36 = [v3 preRunningProgress];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100006C38;
  v53[3] = &unk_10002D4B0;
  id v6 = v3;
  id v54 = v6;
  v55 = self;
  v35 = +[PLLibraryServicesOperation operationWithName:v5 requiredState:4 parentProgress:v36 execution:v53];
  v56[1] = v35;
  uint64_t v7 = PLiOSPlatformLibraryServicesOperationNameInitCPLManager;
  v34 = [v6 preRunningProgress];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10000717C;
  v51[3] = &unk_10002D400;
  id v8 = v6;
  id v52 = v8;
  v33 = +[PLLibraryServicesOperation operationWithName:v7 requiredState:5 parentProgress:v34 execution:v51];
  v56[2] = v33;
  uint64_t v9 = PLLibraryServicesOperationNameBackupExclusionAttribute;
  v32 = [v8 preRunningProgress];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000071AC;
  v49[3] = &unk_10002D400;
  id v10 = v8;
  id v50 = v10;
  v11 = +[PLLibraryServicesOperation operationWithName:v9 requiredState:5 parentProgress:v32 execution:v49];
  v56[3] = v11;
  v39 = self;
  v12 = [(PLPlatformLibraryServicesDelegate *)self operationForLocaleChangeCheck];
  v56[4] = v12;
  uint64_t v13 = PLiOSPlatformLibraryServicesOperationNameDuplicateMergeCrashRecovery;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100007254;
  v47[3] = &unk_10002D400;
  id v14 = v10;
  id v48 = v14;
  v15 = +[PLLibraryServicesOperation operationWithName:v13 requiredState:6 parentProgress:0 execution:v47];
  v56[5] = v15;
  uint64_t v16 = PLiOSPlatformLibraryServicesOperationNameAssetCreationRecovery;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000072AC;
  v45[3] = &unk_10002D400;
  id v17 = v14;
  id v46 = v17;
  v18 = +[PLLibraryServicesOperation operationWithName:v16 requiredState:7 parentProgress:0 execution:v45];
  v56[6] = v18;
  uint64_t v19 = PLiOSPlatformLibraryServicesOperationNameRegisterBackgroundJobService;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100007304;
  v43[3] = &unk_10002D400;
  id v20 = v17;
  id v44 = v20;
  v21 = +[PLLibraryServicesOperation operationWithName:v19 requiredState:7 parentProgress:0 execution:v43];
  v56[7] = v21;
  uint64_t v22 = PLiOSPlatformLibraryServicesOperationNameInitCacheDeleteSupport;
  v23 = [v20 preRunningProgress];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100007370;
  v41[3] = &unk_10002D400;
  id v24 = v20;
  id v42 = v24;
  v25 = +[PLLibraryServicesOperation operationWithName:v22 requiredState:7 parentProgress:v23 execution:v41];
  v56[8] = v25;
  v26 = +[NSArray arrayWithObjects:v56 count:9];

  if (PLIsChinaSKU())
  {
    v27 = [(PLPlatformLibraryServicesDelegate *)v39 operationForGreenTeaContactsAuthorizationCheck];
    uint64_t v28 = [v26 arrayByAddingObject:v27];

    v26 = (void *)v28;
  }
  v40.receiver = v39;
  v40.super_class = (Class)PLIOSPlatformLibraryServicesDelegate;
  v29 = [(PLPlatformLibraryServicesDelegate *)&v40 commonBuiltInOperations];
  v30 = [v29 arrayByAddingObjectsFromArray:v26];

  return v30;
}

- (void)_abortWithMigrationFailureError:(id)a3
{
  id v4 = a3;
  if (PLIsErrorSQLiteDiskFull()) {
    [(PLIOSPlatformLibraryServicesDelegate *)self _abortWithMigrationFailureReasonENOSPC];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v24 = v4;
  uint64_t v5 = PLTopLevelErrorAndAllUnderlyingErrors();
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v11 = [v10 domain];
        unsigned int v12 = [v11 isEqualToString:NSCocoaErrorDomain];

        if (!v12)
        {
          id v14 = [v10 domain];
          unsigned int v15 = [v14 isEqualToString:NSPOSIXErrorDomain];

          if (!v15) {
            continue;
          }
          id v16 = [v10 code];
          if (v16 != (id)28)
          {
            if (v16 != (id)13) {
              continue;
            }
LABEL_15:
            [(PLIOSPlatformLibraryServicesDelegate *)self _abortWithMigrationFailureReasonEACCES];
            continue;
          }
LABEL_16:
          [(PLIOSPlatformLibraryServicesDelegate *)self _abortWithMigrationFailureReasonENOSPC];
          continue;
        }
        id v13 = [v10 code];
        if (v13 == (id)640) {
          goto LABEL_16;
        }
        if (v13 == (id)513) {
          goto LABEL_15;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v7);
  }

  id v17 = PLMigrationGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v24;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Database migration failed: %@", buf, 0xCu);
  }

  v18 = [v24 userInfo];
  uint64_t v19 = [v18 objectForKeyedSubscript:NSDebugDescriptionErrorKey];
  id v20 = (void *)v19;
  if (v19) {
    v21 = (void *)v19;
  }
  else {
    v21 = v24;
  }
  uint64_t v22 = +[NSString stringWithFormat:@"Cannot create persistent store: %@", v21];

  id v23 = v22;
  [v23 UTF8String];
  PLAbortWithReason();
}

- (void)_abortWithMigrationFailureReasonENOSPC
{
  v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (void)_abortWithMigrationFailureReasonEACCES
{
  v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSStringFromSelector(a2);
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  __break(1u);
}

- (id)systemLibraryBuiltInOperations
{
  v3 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  uint64_t v4 = PLiOSPlatformLibraryServicesOperationNameWaitDataMigrationCheckpoint;
  long long v25 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  id v24 = [v25 preRunningProgress];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100007B20;
  v36[3] = &unk_10002D400;
  id v5 = v3;
  id v37 = v5;
  id v6 = +[PLLibraryServicesOperation operationWithName:v4 requiredState:3 parentProgress:v24 execution:v36];
  v38[0] = v6;
  uint64_t v7 = PLiOSPlatformLibraryServicesOperationNamePrepareOTARestore;
  uint64_t v8 = [v5 preRunningProgress];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100007BCC;
  v33[3] = &unk_10002D4B0;
  id v9 = v5;
  id v34 = v9;
  v35 = self;
  id v10 = +[PLLibraryServicesOperation operationWithName:v7 requiredState:5 parentProgress:v8 execution:v33];
  v38[1] = v10;
  uint64_t v11 = PLiOSPlatformLibraryServicesOperationNameCameraIngestRecovery;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100007C88;
  v31[3] = &unk_10002D400;
  id v12 = v9;
  id v32 = v12;
  id v13 = +[PLLibraryServicesOperation operationWithName:v11 requiredState:7 parentProgress:0 execution:v31];
  v38[2] = v13;
  uint64_t v14 = PLiOSPlatformLibraryServicesOperationNameBuildQuickActionItems;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100007CF4;
  v29[3] = &unk_10002D400;
  id v15 = v12;
  id v30 = v15;
  id v16 = +[PLLibraryServicesOperation operationWithName:v14 requiredState:7 parentProgress:0 execution:v29];
  v38[3] = v16;
  uint64_t v17 = PLiOSPlatformLibraryServicesOperationNameInitializePhotoStream;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100007DE0;
  v27[3] = &unk_10002D4B0;
  v27[4] = self;
  id v28 = v15;
  id v18 = v15;
  uint64_t v19 = +[PLLibraryServicesOperation operationWithName:v17 requiredState:7 parentProgress:0 execution:v27];
  v38[4] = v19;
  id v20 = +[NSArray arrayWithObjects:v38 count:5];

  v26.receiver = self;
  v26.super_class = (Class)PLIOSPlatformLibraryServicesDelegate;
  v21 = [(PLPlatformLibraryServicesDelegate *)&v26 systemLibraryBuiltInOperations];
  uint64_t v22 = [v21 arrayByAddingObjectsFromArray:v20];

  return v22;
}

- (int64_t)requiredStateForFileSystemImportOperation
{
  v7.receiver = self;
  v7.super_class = (Class)PLIOSPlatformLibraryServicesDelegate;
  id v3 = [(PLPlatformLibraryServicesDelegate *)&v7 requiredStateForFileSystemImportOperation];
  uint64_t v4 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  unsigned __int8 v5 = [v4 createOptions];

  if ((v5 & 8) != 0) {
    return 6;
  }
  else {
    return (int64_t)v3;
  }
}

@end