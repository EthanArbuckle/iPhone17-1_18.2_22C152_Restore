@interface PLCSTDataCollectionMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
- (id)generateUuidSelection;
- (id)randomIndexForSampleSize:(unint64_t)a3;
@end

@implementation PLCSTDataCollectionMaintenanceTask

- (id)randomIndexForSampleSize:(unint64_t)a3
{
  id v4 = objc_alloc_init((Class)NSMutableIndexSet);
  v5 = v4;
  if (a3 - 1 > 9)
  {
    if (a3 < 0xB)
    {
      v6 = PLBackendGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Crowd Sourced Themes Stream Collection: SampleSize is set to 0. Skipping randomIndexing", v8, 2u);
      }
    }
    else
    {
      do
        [v5 addIndex:arc4random_uniform(a3)];
      while ((unint64_t)[v5 count] < 0xA);
    }
  }
  else
  {
    objc_msgSend(v4, "addIndexesInRange:", 0, a3);
  }

  return v5;
}

- (id)generateUuidSelection
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10001A7F8;
  v11 = sub_10001A808;
  id v12 = 0;
  v3 = [(PLMaintenanceTask *)self photoLibrary];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001A810;
  v6[3] = &unk_10002D550;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performTransactionAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = [(PLMaintenanceTask *)self libraryServicesManager];
  unsigned int v5 = [v4 isSystemPhotoLibrary];

  if (v5)
  {
    v6 = [(PLCSTDataCollectionMaintenanceTask *)self generateUuidSelection];
    if ([v6 count])
    {
      uint64_t v7 = [(PLMaintenanceTask *)self libraryServicesManager];
      v8 = [v7 pathManager];
      +[PLCrowdSourcedThemesPublisher publishUUIDs:v6 stream:0 pathManager:v8];
    }
    else
    {
      uint64_t v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Crowd Sourced Themes Stream Collection: No assets matching CST criteria", v10, 2u);
      }
    }
  }
  return 1;
}

@end