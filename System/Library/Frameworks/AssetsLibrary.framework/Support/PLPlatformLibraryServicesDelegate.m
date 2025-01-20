@interface PLPlatformLibraryServicesDelegate
+ (Class)platformLibraryServicesDelegateClass;
- (BOOL)shouldSkipFileSystemImportOperation;
- (PLLibraryServicesManager)libraryServicesManager;
- (PLPlatformLibraryServicesDelegate)initWithLibraryServicesManager:(id)a3;
- (id)commonBuiltInOperations;
- (id)logPrefix;
- (id)operationForGreenTeaContactsAuthorizationCheck;
- (id)operationForLocaleChangeCheck;
- (id)operationsForLibraryStateTransition:(int64_t)a3;
- (id)systemLibraryBuiltInOperations;
- (int64_t)migrationType;
- (int64_t)requiredStateForFileSystemImportOperation;
- (void)handleCompletedAllOperationsForLibraryState:(int64_t)a3;
- (void)operationCompletionActivities;
- (void)setMigrationType:(int64_t)a3;
- (void)setShouldSkipFileSystemImportOperation:(BOOL)a3;
@end

@implementation PLPlatformLibraryServicesDelegate

+ (Class)platformLibraryServicesDelegateClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

- (void)setShouldSkipFileSystemImportOperation:(BOOL)a3
{
  self->_shouldSkipFileSystemImportOperation = a3;
}

- (BOOL)shouldSkipFileSystemImportOperation
{
  return self->_shouldSkipFileSystemImportOperation;
}

- (void)setMigrationType:(int64_t)a3
{
  self->_migrationType = a3;
}

- (int64_t)migrationType
{
  return self->_migrationType;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);

  return (PLLibraryServicesManager *)WeakRetained;
}

- (id)logPrefix
{
  v2 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  v3 = [v2 logPrefix];

  return v3;
}

- (void)handleCompletedAllOperationsForLibraryState:(int64_t)a3
{
  uint64_t v5 = 2;
  switch(a3)
  {
    case 1:
      goto LABEL_8;
    case 2:
      uint64_t v5 = 3;
      goto LABEL_8;
    case 3:
      uint64_t v5 = 4;
      goto LABEL_8;
    case 4:
      uint64_t v5 = 5;
      goto LABEL_8;
    case 5:
      uint64_t v5 = 6;
      goto LABEL_8;
    case 6:
      goto LABEL_7;
    case 7:
      [(PLPlatformLibraryServicesDelegate *)self operationCompletionActivities];
LABEL_7:
      uint64_t v5 = 7;
LABEL_8:
      if (v5 != a3)
      {
        v6 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
        id v12 = 0;
        unsigned __int8 v7 = [v6 transitionToState:v5 error:&v12];
        id v8 = v12;

        if ((v7 & 1) == 0)
        {
          v9 = PLLibraryServicesGetLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v10 = [(PLPlatformLibraryServicesDelegate *)self logPrefix];
            v11 = PLStringFromLibraryServicesState();
            *(_DWORD *)buf = 138543874;
            v14 = v10;
            __int16 v15 = 2114;
            v16 = v11;
            __int16 v17 = 2114;
            id v18 = v8;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to perform built-in transition to %{public}@: %{public}@", buf, 0x20u);
          }
        }
      }
      break;
    default:
      return;
  }
}

- (void)operationCompletionActivities
{
  v3 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  v4 = [v3 modelMigrator];
  id v15 = [v4 analyticsEventManager];

  uint64_t v5 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 wellKnownPhotoLibraryIdentifier]);
  uint64_t v7 = PLCoreAnalyticsLibraryEventWellKnownIdentifierKey;
  uint64_t v8 = PLCoreAnalyticsLibraryCreateEvent;
  [v15 setPayloadValue:v6 forKey:PLCoreAnalyticsLibraryEventWellKnownIdentifierKey onlyOnExistingEventWithName:PLCoreAnalyticsLibraryCreateEvent];

  v9 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 wellKnownPhotoLibraryIdentifier]);
  uint64_t v11 = PLCoreAnalyticsLibraryMigrateEvent;
  [v15 setPayloadValue:v10 forKey:v7 onlyOnExistingEventWithName:PLCoreAnalyticsLibraryMigrateEvent];

  id v12 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 wellKnownPhotoLibraryIdentifier]);
  uint64_t v14 = PLCoreAnalyticsLibraryRebuildEvent;
  [v15 setPayloadValue:v13 forKey:v7 onlyOnExistingEventWithName:PLCoreAnalyticsLibraryRebuildEvent];

  [v15 publishEventWithName:v8];
  [v15 publishEventWithName:v11];
  [v15 publishEventWithName:v14];
}

- (id)commonBuiltInOperations
{
  v3 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  uint64_t v4 = PLLibraryServicesOperationNameActivateTCC;
  v54 = [v3 preRunningProgress];
  v53 = +[PLLibraryServicesOperation operationWithName:v4 requiredState:3 parentProgress:v54 execution:&stru_10002D278];
  v82[0] = v53;
  uint64_t v5 = PLLibraryServicesOperationNameCoreAnalyticsSetup;
  v52 = [v3 preRunningProgress];
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100017204;
  v80[3] = &unk_10002D400;
  id v6 = v3;
  id v81 = v6;
  v51 = +[PLLibraryServicesOperation operationWithName:v5 requiredState:3 parentProgress:v52 execution:v80];
  v82[1] = v51;
  uint64_t v7 = PLLibraryServicesOperationNameInitChangeHandling;
  v50 = [v6 preRunningProgress];
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_100017298;
  v78[3] = &unk_10002D400;
  id v8 = v6;
  id v79 = v8;
  v49 = +[PLLibraryServicesOperation operationWithName:v7 requiredState:5 parentProgress:v50 execution:v78];
  v82[2] = v49;
  uint64_t v9 = PLLibraryServicesOperationNameFilesystemImportNotifyEvent;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_1000172A0;
  v76[3] = &unk_10002D400;
  id v10 = v8;
  id v77 = v10;
  v48 = +[PLLibraryServicesOperation operationWithName:v9 requiredState:6 parentProgress:0 execution:v76];
  v82[3] = v48;
  uint64_t v11 = PLLibraryServicesOperationNameCreateSingletonAlbums;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1000172E4;
  v73[3] = &unk_10002D4B0;
  id v12 = v10;
  id v74 = v12;
  v75 = self;
  v45 = +[PLLibraryServicesOperation operationWithName:v11 requiredState:6 parentProgress:0 execution:v73];
  v82[4] = v45;
  uint64_t v13 = PLLibraryServicesOperationNameCrashRecoveryOps;
  v44 = [v12 preRunningProgress];
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_100017490;
  v71[3] = &unk_10002D400;
  id v14 = v12;
  id v72 = v14;
  v43 = +[PLLibraryServicesOperation operationWithName:v13 requiredState:6 parentProgress:v44 execution:v71];
  v82[5] = v43;
  uint64_t v15 = PLLibraryServicesOperationNameUpdateGraphLabels;
  v42 = [v14 preRunningProgress];
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_1000174A4;
  v68[3] = &unk_10002D4B0;
  id v16 = v14;
  id v69 = v16;
  v70 = self;
  v41 = +[PLLibraryServicesOperation operationWithName:v15 requiredState:6 parentProgress:v42 execution:v68];
  v82[6] = v41;
  uint64_t v17 = PLLibraryServicesOperationNameCheckForMediaAnalysisVersionBump;
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_1000175A4;
  v66[3] = &unk_10002D400;
  id v18 = v16;
  id v67 = v18;
  v19 = +[PLLibraryServicesOperation operationWithName:v17 requiredState:6 parentProgress:0 execution:v66];
  v82[7] = v19;
  uint64_t v20 = PLLibraryServicesOperationNameUpdatePADLibraryOpened;
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_100017618;
  v64[3] = &unk_10002D400;
  id v21 = v18;
  id v65 = v21;
  v22 = +[PLLibraryServicesOperation operationWithName:v20 requiredState:7 parentProgress:0 execution:v64];
  v82[8] = v22;
  uint64_t v23 = PLLibraryServicesOperationNameSpaceAttribution;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_1000176CC;
  v60[3] = &unk_10002D2F0;
  id v24 = v21;
  id v61 = v24;
  v62 = self;
  v25 = self;
  SEL v63 = a2;
  v26 = +[PLLibraryServicesOperation operationWithName:v23 requiredState:7 parentProgress:0 execution:v60];
  v82[9] = v26;
  uint64_t v27 = PLLibraryServicesOperationNameThumbnailRebuildReq;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_100017B10;
  v58[3] = &unk_10002D400;
  id v28 = v24;
  id v59 = v28;
  v29 = +[PLLibraryServicesOperation operationWithName:v27 requiredState:7 parentProgress:0 execution:v58];
  v82[10] = v29;
  v30 = v25;
  uint64_t v31 = PLLibraryServicesOperationNameFileSystemImport;
  id v32 = [(PLPlatformLibraryServicesDelegate *)v30 requiredStateForFileSystemImportOperation];
  v33 = [v28 postRunningProgress];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100017C08;
  v56[3] = &unk_10002D4B0;
  v56[4] = v30;
  id v47 = v28;
  id v57 = v47;
  v34 = +[PLLibraryServicesOperation operationWithName:v31 requiredState:v32 parentProgress:v33 execution:v56];
  v82[11] = v34;
  v35 = +[NSArray arrayWithObjects:v82 count:12];

  v36 = [(PLPlatformLibraryServicesDelegate *)v30 libraryServicesManager];
  v37 = [v36 pathManager];
  LODWORD(v34) = +[PLRebuildJournalManager isEnabledWithPathManager:v37 error:0];

  if (v34)
  {
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100017DCC;
    v55[3] = &unk_10002D400;
    v55[4] = v30;
    v38 = +[PLLibraryServicesOperation operationWithName:PLLibraryServicesOperationNameStartJournalManager requiredState:7 parentProgress:0 execution:v55];
    uint64_t v39 = [v35 arrayByAddingObject:v38];

    v35 = (void *)v39;
  }

  return v35;
}

- (id)operationForGreenTeaContactsAuthorizationCheck
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100018900;
  v4[3] = &unk_10002D400;
  v4[4] = self;
  v2 = +[PLLibraryServicesOperation operationWithName:PLLibraryServicesOperationNameGreenTeaContactsAuthorizationChangeCheck requiredState:6 parentProgress:0 execution:v4];

  return v2;
}

- (id)operationForLocaleChangeCheck
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100018AAC;
  v4[3] = &unk_10002D400;
  v4[4] = self;
  v2 = +[PLLibraryServicesOperation operationWithName:PLLibraryServicesOperationNameLocaleChangeCheck requiredState:6 parentProgress:0 execution:v4];

  return v2;
}

- (id)systemLibraryBuiltInOperations
{
  uint64_t v3 = PLLibraryServicesOperationNameCreateConstraintsDirectory;
  uint64_t v4 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  uint64_t v5 = [v4 preRunningProgress];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100018E30;
  v16[3] = &unk_10002D400;
  v16[4] = self;
  id v6 = +[PLLibraryServicesOperation operationWithName:v3 requiredState:3 parentProgress:v5 execution:v16];
  v17[0] = v6;
  uint64_t v7 = PLLibraryServicesOperationNameNotifyLibraryAvailability;
  id v8 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  uint64_t v9 = [v8 preRunningProgress];
  id v10 = +[PLLibraryServicesOperation operationWithName:v7 requiredState:6 parentProgress:v9 execution:&stru_10002D258];
  v17[1] = v10;
  uint64_t v11 = +[NSArray arrayWithObjects:v17 count:2];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100018E74;
  v15[3] = &unk_10002D400;
  v15[4] = self;
  id v12 = +[PLLibraryServicesOperation operationWithName:@"Open syndication library" requiredState:7 parentProgress:0 execution:v15];
  uint64_t v13 = [v11 arrayByAddingObject:v12];

  return v13;
}

- (id)operationsForLibraryStateTransition:(int64_t)a3
{
  uint64_t v3 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_100019174;
  id v18 = sub_100019184;
  id v19 = 0;
  if (a3 == 1)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001918C;
    v13[3] = &unk_10002D238;
    v13[4] = &v14;
    uint64_t v5 = objc_retainBlock(v13);
    id v6 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
    uint64_t v7 = [v6 libraryURL];
    unsigned int v8 = +[PLPhotoLibraryPathManager isSystemPhotoLibraryURL:v7];

    if (v8)
    {
      uint64_t v9 = [(PLPlatformLibraryServicesDelegate *)self systemLibraryBuiltInOperations];
      ((void (*)(void *, void *))v5[2])(v5, v9);
    }
    id v10 = [(PLPlatformLibraryServicesDelegate *)self commonBuiltInOperations];
    ((void (*)(void *, void *))v5[2])(v5, v10);

    uint64_t v3 = (void *)v15[5];
  }
  id v11 = v3;
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (int64_t)requiredStateForFileSystemImportOperation
{
  return 7;
}

- (PLPlatformLibraryServicesDelegate)initWithLibraryServicesManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLPlatformLibraryServicesDelegate *)self init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_libraryServicesManager, v4);
  }

  return v6;
}

@end