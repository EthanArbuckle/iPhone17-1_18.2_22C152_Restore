@interface PLExcessiveDatabaseSizeMaintenanceTask
- (BOOL)isHistorySizeExcessiveWithPathManager:(id)a3;
- (BOOL)isOrphanedSceneClassificationsCountExcessiveWithPathManager:(id)a3;
- (BOOL)runTaskWithTransaction:(id)a3;
- (id)isHistorySizeExcessiveWithPathManager:(id)a3 error:(id *)a4;
- (void)_forceRebuildWithReason:(int64_t)a3 pathManager:(id)a4 transaction:(id)a5;
@end

@implementation PLExcessiveDatabaseSizeMaintenanceTask

- (BOOL)isOrphanedSceneClassificationsCountExcessiveWithPathManager:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  [(PLMaintenanceTask *)self photoLibrary];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014BC0;
  v9[3] = &unk_10002D198;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v5;
  v12 = &v13;
  id v6 = v4;
  id v11 = v6;
  [v5 performBlockAndWait:v9];
  char v7 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)isHistorySizeExcessiveWithPathManager:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (PLHasInternalDiagnostics())
  {
    char v7 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v8 = [v7 BOOLForKey:@"PLTriggerExcessiveHistorySizeRebuild"];

    if (v8)
    {
      v9 = &__kCFBooleanTrue;
      goto LABEL_27;
    }
  }
  id v10 = [v6 photosDatabasePath];
  if (!v10)
  {
    NSErrorUserInfoKey v53 = NSDebugDescriptionErrorKey;
    CFStringRef v54 = @"databasePath is nil while checking for excessive history size";
    v25 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    id v13 = +[NSError errorWithDomain:PLPhotosErrorDomain code:46518 userInfo:v25];

    if (a4)
    {
      id v13 = v13;
      v9 = 0;
      *a4 = v13;
    }
    else
    {
      v9 = 0;
    }
    goto LABEL_26;
  }
  id v11 = +[NSURL fileURLWithPath:v10 isDirectory:0];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_1000152DC;
  v45 = sub_1000152EC;
  id v46 = 0;
  id v40 = 0;
  id obj = 0;
  unsigned int v12 = [v11 getResourceValue:&v40 forKey:NSURLFileSizeKey error:&obj];
  id v13 = v40;
  objc_storeStrong(&v46, obj);
  if (!v12)
  {
    id v26 = (id)v42[5];
LABEL_18:
    if (a4)
    {
      id v26 = v26;
      v9 = 0;
      *a4 = v26;
    }
    else
    {
      v9 = 0;
    }
    goto LABEL_25;
  }
  if ((unint64_t)[v13 unsignedLongLongValue] > 0x140000000)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0;
    v14 = [(PLMaintenanceTask *)self photoLibrary];
    uint64_t v15 = [v14 managedObjectContext];

    char v16 = [(PLMaintenanceTask *)self photoLibrary];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000152F4;
    v31[3] = &unk_10002D1C0;
    id v17 = v15;
    id v32 = v17;
    v33 = &v35;
    v34 = &v41;
    [v16 performBlockAndWait:v31];

    unint64_t v18 = v36[3];
    if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_23;
    }
    if (v18 <= 1) {
      unint64_t v18 = 1;
    }
    v36[3] = v18;
    v19 = [(PLMaintenanceTask *)self photoLibrary];
    v20 = (id *)(v42 + 5);
    id v30 = (id)v42[5];
    uint64_t v21 = (uint64_t)+[PLPersistentHistoryUtilities fetchApproximateHistoryRecordCountInLibrary:v19 error:&v30];
    objc_storeStrong(v20, v30);

    if (v21 < 1)
    {
LABEL_23:
      v9 = 0;
    }
    else
    {
      unint64_t v22 = 10000 * v36[3];
      v9 = +[NSNumber numberWithBool:v21 >= v22];
      if (v21 >= v22)
      {
        v23 = PLBackendGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = v36[3];
          v29 = [v6 libraryURL];
          v24 = +[PLFilePathDescription descriptionWithFileURL:v29];
          *(_DWORD *)buf = 134218498;
          uint64_t v48 = v21;
          __int16 v49 = 2048;
          uint64_t v50 = v28;
          __int16 v51 = 2112;
          v52 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Maintenance task: Excessive history found with history count: %llu, asset count: %llu in library URL: %@", buf, 0x20u);
        }
      }
    }

    _Block_object_dispose(&v35, 8);
    id v26 = (id)v42[5];
    if (v9) {
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  id v26 = (id)v42[5];
  v9 = &__kCFBooleanFalse;
LABEL_25:

  _Block_object_dispose(&v41, 8);
LABEL_26:

LABEL_27:

  return v9;
}

- (BOOL)isHistorySizeExcessiveWithPathManager:(id)a3
{
  id v4 = a3;
  id v12 = 0;
  id v5 = [(PLExcessiveDatabaseSizeMaintenanceTask *)self isHistorySizeExcessiveWithPathManager:v4 error:&v12];
  id v6 = v12;
  if (v5)
  {
    unsigned __int8 v7 = [v5 BOOLValue];
  }
  else
  {
    unsigned __int8 v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [v4 libraryURL];
      id v10 = +[PLFilePathDescription descriptionWithFileURL:v9];
      *(_DWORD *)buf = 138412546;
      v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Maintenance task: Failed to determine history size for library URL %@. Error: %@", buf, 0x16u);
    }
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)_forceRebuildWithReason:(int64_t)a3 pathManager:(id)a4 transaction:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (+[PLRebuildJournalManager isEnabledWithPathManager:v8 error:0])
  {
    id v10 = [(PLMaintenanceTask *)self libraryServicesManager];
    id v11 = [v10 rebuildJournalManager];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000156B4;
    v15[3] = &unk_10002D170;
    id v16 = v8;
    int64_t v18 = a3;
    id v17 = v9;
    [v11 snapshotJournalsForPayloadClassIDs:0 withCompletionHandler:v15];

    id v12 = v16;
  }
  else
  {
    [v8 setSqliteErrorForRebuildReason:a3 allowsExit:0];
    id v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v8 libraryURL];
      v14 = +[PLFilePathDescription descriptionWithFileURL:v13];
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Maintenance task: Added rebuild flag for excessive persistent history size for library URL: %@", buf, 0xCu);
    }
  }
}

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(PLMaintenanceTask *)self photoLibrary];
  id v6 = [v5 pathManager];

  if (v6)
  {
    if (([v6 sqliteErrorIndicatorFileExists] & 1) == 0)
    {
      if ([(PLExcessiveDatabaseSizeMaintenanceTask *)self isHistorySizeExcessiveWithPathManager:v6])
      {
        unsigned __int8 v7 = self;
        uint64_t v8 = 16;
LABEL_10:
        [(PLExcessiveDatabaseSizeMaintenanceTask *)v7 _forceRebuildWithReason:v8 pathManager:v6 transaction:v4];
        goto LABEL_11;
      }
      if ([(PLExcessiveDatabaseSizeMaintenanceTask *)self isOrphanedSceneClassificationsCountExcessiveWithPathManager:v6])
      {
        unsigned __int8 v7 = self;
        uint64_t v8 = 20;
        goto LABEL_10;
      }
    }
  }
  else
  {
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Maintenance task: Failed to get path manager", v11, 2u);
    }
  }
LABEL_11:

  return v6 != 0;
}

@end