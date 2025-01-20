@interface MADDeferredProcessingBackgroundSystemTask
+ (unint64_t)taskID;
- (void)executeWith:(id)a3 completionHandler:(id)a4;
- (void)registerTask;
@end

@implementation MADDeferredProcessingBackgroundSystemTask

+ (unint64_t)taskID
{
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v2 = VCPLogInstance();
    os_log_type_t v3 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v2, v3))
    {
      v4 = [(id)objc_opt_class() identifier];
      int v6 = 138412290;
      v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "[%@] taskID is not implemented in subclass. Scheduling history will not be recorded", (uint8_t *)&v6, 0xCu);
    }
  }
  return 0;
}

- (void)executeWith:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() identifier];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_1001101C8;
  v43 = sub_1001101D8;
  id v44 = +[NSDate date];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_1001101C8;
  v37 = sub_1001101D8;
  id v38 = objc_alloc_init((Class)VCPTimeMeasurement);
  [(id)v34[5] start];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_1001101C8;
  v31[4] = sub_1001101D8;
  VCPTransactionWithName((uint64_t)v8);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1001101E0;
  v29[3] = &unk_10021BEF0;
  id v9 = v8;
  id v30 = v9;
  v10 = objc_retainBlock(v29);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001102C0;
  v22[3] = &unk_10021E2E8;
  v26 = &v33;
  id v11 = v9;
  id v23 = v11;
  v24 = self;
  v27 = &v39;
  v28 = v31;
  id v12 = v7;
  id v25 = v12;
  v13 = objc_retainBlock(v22);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001105A8;
  v20[3] = &unk_10021BF40;
  id v14 = v6;
  id v21 = v14;
  v15 = objc_retainBlock(v20);
  if ([(id)objc_opt_class() taskID])
  {
    +[PHPhotoLibrary enableMultiLibraryMode];
    v17 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
    v18 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v17];

    if (v18)
    {
      id v19 = [(id)objc_opt_class() taskID];
      [v18 storeSchedulingHistoryForActivityID:v19 andStartTime:v40[5]];
      objc_msgSend(v18, "purgeExcessiveSchedulingRecordsForActivityID:", objc_msgSend((id)objc_opt_class(), "taskID"));
      [v18 commit];
    }
  }
  [(MADBackgroundSystemTask *)self executeWithCancelBlock:v15 progressHandler:v10 completionHandler:v13];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

- (void)registerTask
{
  os_log_type_t v3 = [(id)objc_opt_class() identifier];
  +[NSString stringWithFormat:@"[%@][%@][Deferred]", objc_opt_class(), v3];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100110854;
  v11[3] = &unk_10021E338;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v4;
  v13 = self;
  v5 = objc_retainBlock(v11);
  if (v3)
  {
    id v6 = +[BGSystemTaskScheduler sharedScheduler];
    unsigned int v7 = [v6 registerForTaskWithIdentifier:v3 usingQueue:0 launchHandler:v5];

    if (v7)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v8 = VCPLogInstance();
        os_log_type_t v9 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v8, v9))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v4;
          v10 = "%@ Successfully registered";
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v8, v9, v10, buf, 0xCu);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v8 = VCPLogInstance();
      os_log_type_t v9 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v4;
        v10 = "%@ Attempt re-registering";
        goto LABEL_12;
      }
      goto LABEL_13;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      v10 = "%@ Invalid identifier";
      goto LABEL_12;
    }
LABEL_13:
  }
}

@end