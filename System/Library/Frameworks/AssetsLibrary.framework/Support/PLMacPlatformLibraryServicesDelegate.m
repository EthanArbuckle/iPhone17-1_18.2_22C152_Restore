@interface PLMacPlatformLibraryServicesDelegate
- (BOOL)performedLegacyMigration;
- (id)commonBuiltInOperations;
- (id)systemLibraryBuiltInOperations;
- (void)setPerformedLegacyMigration:(BOOL)a3;
@end

@implementation PLMacPlatformLibraryServicesDelegate

- (void)setPerformedLegacyMigration:(BOOL)a3
{
  self->_performedLegacyMigration = a3;
}

- (BOOL)performedLegacyMigration
{
  return self->_performedLegacyMigration;
}

- (id)commonBuiltInOperations
{
  v3 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  uint64_t v4 = PLMacPlatformLibraryServicesOperationNameCheckFilesystemForSyncRoot;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100019818;
  v51[3] = &unk_10002D400;
  id v5 = v3;
  id v52 = v5;
  v37 = +[PLLibraryServicesOperation operationWithName:v4 requiredState:1 parentProgress:0 execution:v51];
  v53[0] = v37;
  uint64_t v6 = PLMacPlatformLibraryServicesOperationNameMigrateOrRebuild;
  v36 = [v5 preRunningProgress];
  v35 = +[PLLibraryServicesOperation operationWithName:v6 requiredState:4 parentProgress:v36 execution:&stru_10002D440];
  v53[1] = v35;
  uint64_t v7 = PLLibraryServicesOperationNameBackupExclusionAttribute;
  v34 = [v5 preRunningProgress];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100019A64;
  v49[3] = &unk_10002D400;
  id v8 = v5;
  id v50 = v8;
  v33 = +[PLLibraryServicesOperation operationWithName:v7 requiredState:5 parentProgress:v34 execution:v49];
  v53[2] = v33;
  uint64_t v9 = PLMacPlatformLibraryServicesOperationNameInitCPLManager;
  v31 = [v8 preRunningProgress];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100019AB0;
  v47[3] = &unk_10002D400;
  id v10 = v8;
  id v48 = v10;
  v30 = +[PLLibraryServicesOperation operationWithName:v9 requiredState:5 parentProgress:v31 execution:v47];
  v53[3] = v30;
  v11 = [(PLPlatformLibraryServicesDelegate *)self operationForLocaleChangeCheck];
  v53[4] = v11;
  uint64_t v12 = PLMacPlatformLibraryServicesOperationNameDuplicateMergeCrashRecovery;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100019AE0;
  v45[3] = &unk_10002D400;
  id v13 = v10;
  id v46 = v13;
  v14 = +[PLLibraryServicesOperation operationWithName:v12 requiredState:6 parentProgress:0 execution:v45];
  v53[5] = v14;
  uint64_t v15 = PLiOSPlatformLibraryServicesOperationNameAssetCreationRecovery;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100019B38;
  v43[3] = &unk_10002D400;
  id v16 = v13;
  id v44 = v16;
  v17 = +[PLLibraryServicesOperation operationWithName:v15 requiredState:7 parentProgress:0 execution:v43];
  v53[6] = v17;
  v18 = +[PLLibraryServicesOperation operationWithName:PLMacPlatformLibraryServicesOperationNameCleanInvalidSSB requiredState:7 parentProgress:0 execution:&stru_10002D460];
  v53[7] = v18;
  uint64_t v19 = PLMacPlatformLibraryServicesOperationNameRegisterBackgroundJobService;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100019B90;
  v41[3] = &unk_10002D400;
  id v20 = v16;
  id v42 = v20;
  v21 = +[PLLibraryServicesOperation operationWithName:v19 requiredState:7 parentProgress:0 execution:v41];
  v53[8] = v21;
  uint64_t v22 = PLMacPlatformLibraryServicesOperationNameInitCacheDeleteSupport;
  v23 = [v20 preRunningProgress];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100019BFC;
  v39[3] = &unk_10002D400;
  id v40 = v20;
  id v24 = v20;
  v25 = +[PLLibraryServicesOperation operationWithName:v22 requiredState:7 parentProgress:v23 execution:v39];
  v53[9] = v25;
  v26 = +[NSArray arrayWithObjects:v53 count:10];

  v38.receiver = self;
  v38.super_class = (Class)PLMacPlatformLibraryServicesDelegate;
  v27 = [(PLPlatformLibraryServicesDelegate *)&v38 commonBuiltInOperations];
  v28 = [v27 arrayByAddingObjectsFromArray:v26];

  return v28;
}

- (id)systemLibraryBuiltInOperations
{
  v3 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  uint64_t v4 = PLMacPlatformLibraryServicesOperationNameCheckForAutoCreateSPL;
  id v5 = [v3 preRunningProgress];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100019F2C;
  v20[3] = &unk_10002D400;
  id v6 = v3;
  id v21 = v6;
  uint64_t v7 = +[PLLibraryServicesOperation operationWithName:v4 requiredState:3 parentProgress:v5 execution:v20];
  v22[0] = v7;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100019FC4;
  v19[3] = &unk_10002D400;
  v19[4] = self;
  id v8 = +[PLLibraryServicesOperation operationWithName:PLMacPlatformLibraryServicesOperationNameNotifySPLMigrated requiredState:7 parentProgress:0 execution:v19];
  v22[1] = v8;
  uint64_t v9 = PLMacPlatformLibraryServicesOperationNameInitializePhotoStream;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001A010;
  v17[3] = &unk_10002D4B0;
  v17[4] = self;
  id v18 = v6;
  id v10 = v6;
  v11 = +[PLLibraryServicesOperation operationWithName:v9 requiredState:7 parentProgress:0 execution:v17];
  v22[2] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:v22 count:3];

  v16.receiver = self;
  v16.super_class = (Class)PLMacPlatformLibraryServicesDelegate;
  id v13 = [(PLPlatformLibraryServicesDelegate *)&v16 systemLibraryBuiltInOperations];
  v14 = [v13 arrayByAddingObjectsFromArray:v12];

  return v14;
}

@end