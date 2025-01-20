@interface PLDeletePersistentHistoryMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
- (int64_t)daysOfHistoryToKeep;
- (int64_t)historyPercentThreshold;
- (void)deletePersistentHistoryWithContext:(id)a3;
@end

@implementation PLDeletePersistentHistoryMaintenanceTask

- (int64_t)historyPercentThreshold
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:@"persistentHistoryPercentThreshold"];

  if (!v3) {
    return 60;
  }
  v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Delete Persistent History: Overriding persistent history percent threshold from user defaults: %zd", (uint8_t *)&v6, 0xCu);
  }

  return (int64_t)v3;
}

- (int64_t)daysOfHistoryToKeep
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:@"persistentHistoryDaysToKeep"];

  if (!v3) {
    return 182;
  }
  v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Delete Persistent History: Overriding persistent history days to keep from user defaults: %zd", (uint8_t *)&v6, 0xCu);
  }

  return (int64_t)v3;
}

- (void)deletePersistentHistoryWithContext:(id)a3
{
  id v4 = a3;
  v5 = +[PLPersistentHistoryUtilities oldestTransactionWithContext:v4];
  int v6 = +[PLPersistentHistoryUtilities newestTransactionWithContext:v4];
  if (v6)
  {
    int64_t v7 = [(PLDeletePersistentHistoryMaintenanceTask *)self daysOfHistoryToKeep];
    v8 = [v6 timestamp];
    v9 = +[NSDate dateWithTimeInterval:v8 sinceDate:(double)-v7 * 86400.0];

    int64_t v10 = [(PLDeletePersistentHistoryMaintenanceTask *)self historyPercentThreshold];
    v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = PLDateToISO8160StringWithLocalTimeZone();
      [v9 timeIntervalSinceNow];
      double v14 = v13;
      v15 = objc_msgSend(v5, "_pl_prettyDescription");
      objc_msgSend(v6, "_pl_prettyDescription");
      v17 = v16 = v5;
      *(_DWORD *)buf = 138413570;
      int64_t v32 = (int64_t)v12;
      __int16 v33 = 2048;
      double v34 = v14;
      __int16 v35 = 2048;
      int64_t v36 = v7;
      __int16 v37 = 2048;
      int64_t v38 = v10;
      __int16 v39 = 2112;
      v40 = v15;
      __int16 v41 = 2112;
      v42 = v17;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Delete Persistent History: Will delete before date %@ (%.1fs) (keeping %zd days before newest tx) when history percentage is > %zd%%, oldest and newest transactions:\n%@...\n%@", buf, 0x3Eu);

      v5 = v16;
    }

    +[NSDate timeIntervalSinceReferenceDate];
    double v19 = v18;
    id v30 = 0;
    unsigned int v20 = +[PLPersistentHistoryUtilities deleteHistoryBeforeDate:v9 whenHistoryPercentageOfStoreIsGreaterThan:v10 withContext:v4 error:&v30];
    id v21 = v30;
    +[NSDate timeIntervalSinceReferenceDate];
    if (v20)
    {
      double v23 = v22;
      [v4 reset];
      v24 = +[PLPersistentHistoryUtilities oldestTransactionWithContext:v4];
      v25 = [v24 transactionNumber];
      v26 = [v5 transactionNumber];
      v27 = PLBackendGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        int64_t v28 = v25 - v26;
        v29 = [v24 _pl_prettyDescription];
        *(_DWORD *)buf = 134218498;
        int64_t v32 = v28;
        __int16 v33 = 2048;
        double v34 = v23 - v19;
        __int16 v35 = 2112;
        int64_t v36 = (int64_t)v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Delete Persistent History: Successfully deleted %llu transaction(s) in %.1fs. Current oldest transaction:\n%@", buf, 0x20u);
      }
    }
    else
    {
      v24 = PLBackendGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v32 = (int64_t)v21;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Delete Persistent History: Failed to delete persistent history: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Delete Persistent History: Not deleting any history because there are no transactions", buf, 2u);
    }
  }
}

- (BOOL)runTaskWithTransaction:(id)a3
{
  [(PLMaintenanceTask *)self photoLibrary];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000136CC;
  v6[3] = &unk_10002D4B0;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = self;
  id v4 = v7;
  [v4 performTransactionAndWait:v6];

  return 1;
}

@end