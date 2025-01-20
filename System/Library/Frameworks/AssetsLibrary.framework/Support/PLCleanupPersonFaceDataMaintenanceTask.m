@interface PLCleanupPersonFaceDataMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLCleanupPersonFaceDataMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  v5 = [(PLMaintenanceTask *)self photoLibrary];
  unsigned __int8 v6 = [v5 isCloudPhotoLibraryEnabled];

  if ((v6 & 1) == 0)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = sub_1000107F4;
    v26 = sub_100010804;
    id v27 = 0;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = [(PLMaintenanceTask *)self photoLibrary];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001080C;
    v17[3] = &unk_10002D1C0;
    v17[4] = self;
    v17[5] = &v18;
    v17[6] = &v22;
    [v7 performBlockAndWait:v17];

    uint64_t v8 = v19[3];
    if (v8)
    {
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_13:
        _Block_object_dispose(&v18, 8);
        _Block_object_dispose(&v22, 8);

        goto LABEL_14;
      }
      v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = v23[5];
        *(_DWORD *)buf = 138412290;
        v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to fetch count of user library during periodic maintenance: %@", buf, 0xCu);
      }
    }
    else
    {
      v11 = PLBackendGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Deleting all person / face data due to user library contains 0 assets", buf, 2u);
      }

      v12 = [(PLMaintenanceTask *)self photoLibrary];
      id v16 = 0;
      unsigned __int8 v13 = +[PLPerson resetAllInLibrary:v12 error:&v16];
      v9 = v16;

      if ((v13 & 1) == 0)
      {
        v14 = PLBackendGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v9;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Maintenance task to reset persons failed with error: %@", buf, 0xCu);
        }
      }
    }

    goto LABEL_13;
  }
LABEL_14:

  return 1;
}

@end