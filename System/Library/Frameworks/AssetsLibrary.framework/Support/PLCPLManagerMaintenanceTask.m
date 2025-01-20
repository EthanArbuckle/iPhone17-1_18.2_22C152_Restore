@interface PLCPLManagerMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
- (void)_reportLibraryStatsWithCPLManager:(id)a3;
- (void)_reportPhotoStateWithCPLManager:(id)a3;
@end

@implementation PLCPLManagerMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_10000DEE4;
  v23 = sub_10000DEF4;
  id v24 = 0;
  v5 = [(PLMaintenanceTask *)self libraryServicesManager];
  unsigned int v6 = [v5 isSystemPhotoLibrary];

  if (v6)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000DEFC;
    v18[3] = &unk_10002D550;
    v18[4] = self;
    v18[5] = &v19;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v18);
  }
  [(id)v20[5] startAssetRecoveryWithTransaction:v4];
  if (v20[5])
  {
    v7 = PLReportiCPLState();
    if ([v7 count])
    {
      v8 = PLBackendGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Reporting iCPL state %@", buf, 0xCu);
      }

      [(id)v20[5] reportMiscInformation:v7];
      PLFinishReportiCPLState();
    }
    v9 = [(PLMaintenanceTask *)self photoLibrary];
    unsigned int v10 = [v9 isCloudPhotoLibraryEnabled];

    if (v10)
    {
      v11 = PLBackendGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "starting automatic prefetching/pruning during periodic maintenance", buf, 2u);
      }

      [(id)v20[5] startAutomaticPrefetchOrPrune];
    }
    v12 = +[NSUserDefaults standardUserDefaults];
    v13 = [v12 objectForKey:@"PLDeviceDataFeedbackDate"];

    if (!v13 || ([v13 timeIntervalSinceNow], fabs(v14) > 604800.0))
    {
      v15 = PLBackendGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "starting library stats reporting during periodic maintenance", buf, 2u);
      }

      [(PLCPLManagerMaintenanceTask *)self _reportLibraryStatsWithCPLManager:v20[5]];
      v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "starting photo state reporting during periodic maintenance", buf, 2u);
      }

      [(PLCPLManagerMaintenanceTask *)self _reportPhotoStateWithCPLManager:v20[5]];
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_21;
    }
    v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "No cplManager to perform periodic maintenance job", buf, 2u);
    }
  }

LABEL_21:
  _Block_object_dispose(&v19, 8);

  return 1;
}

- (void)_reportPhotoStateWithCPLManager:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:@"YES" forKey:CPLMiscInformationAppendCPLReport];
  v5 = +[PLAccountStore pl_sharedAccountStore];
  unsigned int v6 = [v5 cachedPrimaryAppleAccount];

  if ([v6 isEnabledForDataclass:kAccountDataclassSharedStreams]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  [v4 setObject:v7 forKey:@"SharedStreamsEnabled"];
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v8 = (void *)qword_100034E60;
  uint64_t v16 = qword_100034E60;
  if (!qword_100034E60)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v18 = sub_10000E1B8;
    uint64_t v19 = &unk_10002D3A0;
    v20 = &v13;
    sub_10000E1B8((uint64_t)&buf);
    v8 = (void *)v14[3];
  }
  v9 = v8;
  _Block_object_dispose(&v13, 8);
  id v10 = objc_alloc_init(v9);
  CFStringRef v11 = @"NO";
  if (objc_msgSend(v10, "isBackupEnabled", v13)
    && [v10 isBackupEnabledForDomainName:@"CameraRollDomain"])
  {
    CFStringRef v11 = @"YES";
  }
  [v4 setObject:v11 forKey:@"PhotosInBackup"];
  v12 = PLBackendGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Reporting photo state: %@", (uint8_t *)&buf, 0xCu);
  }

  [v3 reportMiscInformation:v4];
}

- (void)_reportLibraryStatsWithCPLManager:(id)a3
{
  id v32 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v6 = PLBackendGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Library statistics logging: starting asset enumeration...", buf, 2u);
  }

  id v7 = objc_alloc((Class)PLLibraryContentsEnumerator);
  v8 = [(PLMaintenanceTask *)self photoLibrary];
  v9 = [v8 managedObjectContext];
  id v10 = [v7 initWithSourceManagedObjectContext:v9 concurrent:0];

  id v48 = 0;
  CFStringRef v11 = (void *)PLCreateShortLivedSyndicationPhotoLibrary();
  id v30 = v48;
  if (v11)
  {
    id v12 = objc_alloc((Class)PLLibraryContentsEnumerator);
    uint64_t v13 = objc_msgSend(v11, "managedObjectContext", v30);
    id v14 = [v12 initWithSourceManagedObjectContext:v13 concurrent:0];
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v15 = [(PLMaintenanceTask *)self photoLibrary];
  id v16 = [v15 isCloudPhotoLibraryEnabled];

  v17 = +[NSDate date];
  +[PLAggdLogging configureEnumeratorForLibrarySizeLogging:v10 cloudPhotoLibraryEnabled:v16 dataForCA:v4 dataForCK:v5];
  +[PLAggdLogging configureEnumeratorForHyperionLocalResourcesLogging:v10 cloudPhotoLibraryEnabled:v16 dataForCA:v4 dataForCK:v5];
  v18 = [(PLMaintenanceTask *)self libraryServicesManager];
  +[PLAggdLogging configureEnumeratorForLibrarySummaryForLibraryEnumerator:v10 withSyndicationLibraryEnumerator:v14 cloudPhotoLibraryEnabled:v16 dataForCA:v4 libraryServicesManager:v18];

  *(void *)long long buf = 0;
  v43 = buf;
  uint64_t v44 = 0x3032000000;
  v45 = sub_10000DEE4;
  v46 = sub_10000DEF4;
  id v47 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v19 = +[PLConcurrencyLimiter sharedLimiter];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000E940;
  v33[3] = &unk_10002CEC0;
  v36 = &v38;
  id v20 = v10;
  id v34 = v20;
  v37 = buf;
  id v21 = v14;
  id v35 = v21;
  [v19 sync:v33 identifyingBlock:0 library:0];

  v22 = +[NSDate date];
  [v22 timeIntervalSinceDate:v17];
  id v24 = v23;

  if (*((unsigned char *)v39 + 24))
  {
    PLSendCoreAnalyticEvent();
    v25 = PLBackendGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v49 = 134217984;
      id v50 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Library statistics logging: finished in %g secs.", v49, 0xCu);
    }

    v26 = PLBackendGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v49 = 138412290;
      id v50 = v5;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Reporting device data: %@", v49, 0xCu);
    }

    [v32 reportMiscInformation:v5];
    v27 = +[NSUserDefaults standardUserDefaults];
    v28 = +[NSDate date];
    [v27 setObject:v28 forKey:@"PLDeviceDataFeedbackDate"];
  }
  else
  {
    v27 = PLBackendGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)*((void *)v43 + 5);
      *(_DWORD *)v49 = 138412290;
      id v50 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to enumerate assets library statistics logging: %@", v49, 0xCu);
    }
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(buf, 8);
}

@end