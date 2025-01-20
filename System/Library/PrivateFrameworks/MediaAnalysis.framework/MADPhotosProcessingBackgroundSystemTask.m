@interface MADPhotosProcessingBackgroundSystemTask
+ (BOOL)enabled;
+ (BOOL)enabledByDefault;
+ (BOOL)frequentProgressReporting;
+ (NSString)identifier;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
+ (void)reportProgressForTasks:(id)a3 cancelOrExtendTimeoutBlock:(id)a4;
+ (void)unimplementedExceptionForMethodName:(id)a3;
- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5;
@end

@implementation MADPhotosProcessingBackgroundSystemTask

+ (BOOL)enabled
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DBC8;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_1002523F8 != -1) {
    dispatch_once(&qword_1002523F8, block);
  }
  return byte_1002523F0;
}

+ (BOOL)frequentProgressReporting
{
  if (qword_100252400 != -1) {
    dispatch_once(&qword_100252400, &stru_100219BE8);
  }
  return 0;
}

+ (void)reportProgressForTasks:(id)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  id v6 = a3;
  v7 = (unsigned int (**)(void))a4;
  v8 = +[VCPPhotoLibraryManager sharedManager];
  v9 = [v8 allPhotoLibraries];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v10 = v9;
  id v31 = [v10 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v31)
  {
    uint64_t v11 = *(void *)v40;
    uint64_t v30 = *(void *)v40;
    id v27 = a1;
    id v28 = v6;
    id v26 = v10;
    os_log_type_t type = VCPLogToOSLogType[5];
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v10);
        }
        v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ([v13 isSystemPhotoLibrary])
        {
          if (![a1 frequentProgressReporting])
          {
            +[MADProgressManager requestProgressUpdateForTasks:v6];
            v24 = +[MADProgressReporterBackgroundSystemTask sharedTask];
            id v33 = 0;
            [v24 submitTask:&v33];
            id v22 = v33;

            if (v22 && (int)MediaAnalysisLogLevel() >= 5)
            {
              v23 = VCPLogInstance();
              if (os_log_type_enabled(v23, type)) {
                goto LABEL_24;
              }
              goto LABEL_25;
            }
LABEL_26:

            goto LABEL_27;
          }
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v14 = v6;
          id v15 = [v14 countByEnumeratingWithState:&v35 objects:v47 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v36;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v36 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
                +[MADProgressManager updateProgressForTask:photoLibrary:reuseCachedValue:cancelOrExtendTimeoutBlock:](MADProgressManager, "updateProgressForTask:photoLibrary:reuseCachedValue:cancelOrExtendTimeoutBlock:", [v19 unsignedIntegerValue], v13, 0, v7);
              }
              id v16 = [v14 countByEnumeratingWithState:&v35 objects:v47 count:16];
            }
            while (v16);
          }

          a1 = v27;
          id v6 = v28;
          id v10 = v26;
          uint64_t v11 = v30;
          if (v7 && v7[2](v7))
          {
            +[MADProgressManager requestProgressUpdateForTasks:v14];
            v21 = +[MADProgressReporterBackgroundSystemTask sharedTask];
            id v34 = 0;
            [v21 submitTask:&v34];
            id v22 = v34;

            if (v22 && (int)MediaAnalysisLogLevel() >= 5)
            {
              v23 = VCPLogInstance();
              if (os_log_type_enabled(v23, type))
              {
LABEL_24:
                v25 = [a1 identifier];
                *(_DWORD *)buf = 138412546;
                id v44 = a1;
                __int16 v45 = 2112;
                v46 = v25;
                _os_log_impl((void *)&_mh_execute_header, v23, type, "[%@][%@] Failed to request workload progress report task", buf, 0x16u);
              }
LABEL_25:

              uint64_t v11 = v30;
            }
            goto LABEL_26;
          }
        }
LABEL_27:
        MediaAnalysisDaemonReleaseSharedDataStores(v13);
      }
      id v31 = [v10 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v31);
  }
}

- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5
{
  id v46 = a3;
  id v47 = a4;
  id v8 = a5;
  v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  uint64_t v11 = [(id)objc_opt_class() identifier];
  v12 = +[NSString stringWithFormat:@"[%@][%@]", v10, v11];

  if ([(id)objc_opt_class() enabled])
  {
    v13 = +[NSDate now];
    if (VCPIsRemoteIOSTask())
    {
      id v14 = 0;
    }
    else
    {
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_10000E858;
      v64[3] = &unk_100219C10;
      id v65 = v12;
      v66 = self;
      id v67 = v13;
      id v14 = +[VCPTimer timerWithIntervalSeconds:60 isOneShot:0 andBlock:v64];
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v73 = 0x3032000000;
    v74 = sub_10000E93C;
    v75 = sub_10000E94C;
    uint64_t v17 = [(id)objc_opt_class() identifier];
    VCPTransactionWithName((uint64_t)v17);
    id v76 = (id)objc_claimAutoreleasedReturnValue();

    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10000E954;
    v62[3] = &unk_1002196F0;
    id v18 = v12;
    id v63 = v18;
    v43 = objc_retainBlock(v62);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10000EA34;
    v60[3] = &unk_1002198A8;
    id v19 = v47;
    id v61 = v19;
    __int16 v45 = objc_retainBlock(v60);
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10000EA44;
    v52[3] = &unk_100219C38;
    id v42 = v13;
    id v53 = v42;
    id v39 = v18;
    id v54 = v39;
    id v40 = v14;
    id v55 = v40;
    v56 = self;
    p_long long buf = &buf;
    id v57 = v19;
    id v20 = v8;
    id v58 = v20;
    v21 = objc_retainBlock(v52);
    id v22 = +[VCPPhotoLibraryManager sharedManager];
    id v44 = [v22 allPhotoLibraries];

    v23 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
    v24 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v23];

    if ([v24 hasOutstandingTransactions])
    {
      v25 = VCPLogInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        id v37 = (id)objc_opt_class();
        unsigned int v38 = [(id)objc_opt_class() taskID];
        *(_DWORD *)v68 = 138412546;
        id v69 = v37;
        __int16 v70 = 1024;
        unsigned int v71 = v38;
        _os_log_fault_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "[%@] Error: Outstanding MAD database transcations detected before launching the task %u!", v68, 0x12u);
      }
    }
    if (VCPIsRemoteIOSTask())
    {
      id v26 = [(id)objc_opt_class() taskID];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_10000EDA0;
      v50[3] = &unk_1002196A0;
      v51 = v21;
      id v27 = +[VCPMADRemoteActivityTask taskWithActivityType:v26 andCompletionHandler:v50];
      [v27 setCancelBlock:v45];
      id v28 = (id *)&v51;
    }
    else
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10000EDE8;
      v48[3] = &unk_100219C60;
      v49 = v21;
      v29 = objc_retainBlock(v48);
      id v27 = [(id)objc_opt_class() taskWithPhotoLibraries:v44 cancelBlock:v45 progressHandler:v43 andCompletionHandler:v29];
      uint64_t v30 = +[VCPMADQoSManager sharedManager];
      [v30 enable];

      objc_msgSend(v24, "storeSchedulingHistoryForActivityID:andStartTime:", objc_msgSend((id)objc_opt_class(), "taskID"), v42);
      objc_msgSend(v24, "purgeExcessiveSchedulingRecordsForActivityID:", objc_msgSend((id)objc_opt_class(), "taskID"));

      id v28 = (id *)&v49;
    }

    [v24 commit];
    id v31 = +[VCPMADTaskScheduler sharedInstance];
    BOOL v32 = [v31 addBackgroundTask:v27 withQoS:17] == 0;

    if (v32)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        long long v35 = VCPLogInstance();
        os_log_type_t v36 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v35, v36))
        {
          *(_DWORD *)v68 = 138412290;
          id v69 = v39;
          _os_log_impl((void *)&_mh_execute_header, v35, v36, "%@ Failed to submit background task to task scheduler; prepare to reschedule",
            v68,
            0xCu);
        }
      }
      (*((void (**)(id, uint64_t))v20 + 2))(v20, 4294967168);
    }
    else if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v33 = VCPLogInstance();
      os_log_type_t v34 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v33, v34))
      {
        *(_DWORD *)v68 = 138412290;
        id v69 = v39;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "%@ Successfully submitted background task to task scheduler.", v68, 0xCu);
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v15, v16))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ BackgroundSystemTask disabled; quitting background processing",
          (uint8_t *)&buf,
          0xCu);
      }
    }
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

+ (void)unimplementedExceptionForMethodName:(id)a3
{
  +[NSString stringWithFormat:@"[MADPhotosProcessingBackgroundSystemTask %@] should not be called", a3];
  id v3 = +[NSException exceptionWithName:@"NotImplementedException" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
  objc_exception_throw(v3);
}

+ (NSString)identifier
{
  return 0;
}

+ (BOOL)enabledByDefault
{
  return 0;
}

+ (unint64_t)taskID
{
  return 0;
}

+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  return 0;
}

@end