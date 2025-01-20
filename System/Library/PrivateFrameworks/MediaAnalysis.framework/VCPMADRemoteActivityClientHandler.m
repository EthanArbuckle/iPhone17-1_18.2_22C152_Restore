@interface VCPMADRemoteActivityClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
+ (id)serviceName;
+ (void)notifyServicePID;
- (VCPMADRemoteActivityClientHandler)initWithXPCConnection:(id)a3;
- (void)cancelActivity;
- (void)handleLostConnection;
- (void)startActivityWithType:(unint64_t)a3 andReply:(id)a4;
- (void)wakeWithReply:(id)a3;
@end

@implementation VCPMADRemoteActivityClientHandler

+ (id)serviceName
{
  return @"com.apple.mediaanalysisd.service.activity";
}

- (VCPMADRemoteActivityClientHandler)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VCPMADRemoteActivityClientHandler;
  v6 = [(VCPMADRemoteActivityClientHandler *)&v21 init];
  v7 = v6;
  if (v6)
  {
    p_connection = (id *)&v6->_connection;
    objc_storeStrong((id *)&v6->_connection, a3);
    objc_initWeak(&location, v7);
    [*p_connection setExportedObject:v7];
    id v9 = *p_connection;
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPMADRemoteActivityServerProtocol];
    [v9 setExportedInterface:v10];

    id v11 = *p_connection;
    v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPMADRemoteActivityClientProtocol];
    [v11 setRemoteObjectInterface:v12];

    id v13 = *p_connection;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000F23C4;
    v18[3] = &unk_1002198D0;
    objc_copyWeak(&v19, &location);
    [v13 setInterruptionHandler:v18];
    id v14 = *p_connection;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000F247C;
    v16[3] = &unk_1002198D0;
    objc_copyWeak(&v17, &location);
    [v14 setInvalidationHandler:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v7;
}

+ (id)clientHandlerWithXPCConnection:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithXPCConnection:v3];

  return v4;
}

- (void)handleLostConnection
{
  p_taskID = &self->_taskID;
  if (atomic_load(&self->_taskID.__a_.__a_value))
  {
    id v5 = +[VCPMADTaskScheduler sharedInstance];
    uint64_t v6 = atomic_load(&p_taskID->__a_.__a_value);
    id v7 = v5;
    [v5 cancelTaskWithID:v6];
  }
  id v8 = +[VCPClientManager sharedManager];
  [v8 removeClientHandler:self];
}

+ (void)notifyServicePID
{
  if (qword_100252728 != -1) {
    dispatch_once(&qword_100252728, &stru_10021DD60);
  }
  if (dword_100252730)
  {
    pid_t v2 = getpid();
    uint32_t v3 = notify_set_state(dword_100252730, v2);
    if (v3)
    {
      uint32_t v4 = v3;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v5 = VCPLogInstance();
        os_log_type_t v6 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v5, v6))
        {
          int v9 = 67109376;
          pid_t v10 = v2;
          __int16 v11 = 1024;
          uint32_t v12 = v4;
          _os_log_impl((void *)&_mh_execute_header, v5, v6, "[BG Service] Failed to set service pid (%d) state (%d)", (uint8_t *)&v9, 0xEu);
        }
      }
    }
    notify_post((const char *)[@"com.apple.mediaanalysisd.serviceProcessID" UTF8String]);
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v7, v8))
      {
        int v9 = 67109120;
        pid_t v10 = v2;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "[BG Service] Notify service pid: %d", (uint8_t *)&v9, 8u);
      }
    }
  }
}

- (void)startActivityWithType:(unint64_t)a3 andReply:(id)a4
{
  os_log_type_t v6 = (void (**)(id, void *))a4;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[BG Service] Request to start activity (%d)", buf, 8u);
    }
  }
  if (atomic_load(&self->_taskID.__a_.__a_value))
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      pid_t v10 = VCPLogInstance();
      os_log_type_t v11 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v10, v11))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "[BG Service] Activity already started; dropping request",
          buf,
          2u);
      }
    }
    NSErrorUserInfoKey v97 = NSLocalizedDescriptionKey;
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Activity already started; dropping request (%d)",
    uint32_t v12 = a3);
    v98 = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
    id v14 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v13];
    v6[2](v6, v14);

    goto LABEL_54;
  }
  xpc_transaction_exit_clean();
  [(id)objc_opt_class() notifyServicePID];
  v15 = +[VCPPhotoLibraryManager sharedManager];
  uint32_t v12 = [v15 allPhotoLibraries];

  if ([v12 count])
  {
    *(void *)buf = 0;
    v92 = buf;
    uint64_t v93 = 0x3032000000;
    v94 = sub_1000F3990;
    v95 = sub_1000F39A0;
    id v96 = 0;
    +[NSDate now];
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_1000F39A8;
    v74[3] = &unk_10021A3E0;
    unint64_t v76 = a3;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v75 = v16;
    id v17 = +[VCPTimer timerWithIntervalSeconds:60 isOneShot:0 andBlock:v74];
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_1000F3A44;
    v68[3] = &unk_10021DD88;
    v72 = buf;
    v68[4] = self;
    id v18 = v16;
    id v69 = v18;
    id v47 = v17;
    id v70 = v47;
    unint64_t v73 = a3;
    id v19 = v6;
    v71 = v19;
    v49 = objc_retainBlock(v68);
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x3032000000;
    v66[3] = sub_1000F3990;
    v66[4] = sub_1000F39A0;
    id v67 = +[NSDate distantPast];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_1000F3E14;
    v62[3] = &unk_10021DDB0;
    v62[4] = self;
    unint64_t v65 = a3;
    id v20 = v18;
    id v63 = v20;
    v64 = v66;
    v48 = objc_retainBlock(v62);
    switch(a3)
    {
      case 1uLL:
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_1000F3F4C;
        v59[3] = &unk_10021BEF0;
        v59[4] = self;
        uint64_t v21 = +[VCPLibraryProcessingTask taskWithPhotoLibraries:v12 andOptions:&__NSDictionary0__struct andProgressHandler:v59 andCompletionHandler:v49 andCancelBlock:&stru_10021DE50];
        goto LABEL_40;
      case 2uLL:
        if (VCPMADUnifiedBackgroundProcessing())
        {
          CFStringRef v89 = @"SkipSyncGallery";
          v90 = &__kCFBooleanTrue;
          v30 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
          v24 = +[MADUnifiedProcessingTask taskWithCancelBlock:&stru_10021DDD0 options:v30 progressHandler:v48 andCompletionHandler:v49];

          goto LABEL_41;
        }
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_1000F3F04;
        v61[3] = &unk_10021BEF0;
        v61[4] = self;
        uint64_t v21 = +[VCPMADSceneLibraryProcessingTask taskWithPhotoLibraries:v12 cancelBlock:&stru_10021DDF0 progressHandler:v61 andCompletionHandler:v49];
        goto LABEL_40;
      case 3uLL:
        if (VCPMADUnifiedBackgroundProcessing())
        {
          CFStringRef v87 = @"SkipSyncGallery";
          v88 = &__kCFBooleanFalse;
          v31 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
          v24 = +[MADUnifiedProcessingTask taskWithCancelBlock:&stru_10021DE10 options:v31 progressHandler:v48 andCompletionHandler:v49];

          goto LABEL_41;
        }
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_1000F3F28;
        v60[3] = &unk_10021BEF0;
        v60[4] = self;
        uint64_t v21 = +[VCPFaceLibraryProcessingTask taskWithPhotoLibraries:v12 andOptions:0 andProgressHandler:v60 andCompletionHandler:v49 andCancelBlock:&stru_10021DE30];
        goto LABEL_40;
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xBuLL:
        goto LABEL_22;
      case 0xAuLL:
        if (VCPMADUnifiedBackgroundProcessing())
        {
          CFStringRef v85 = @"SkipSyncGallery";
          v86 = &__kCFBooleanTrue;
          v32 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
          v24 = +[MADUnifiedProcessingTask taskWithCancelBlock:&stru_10021DE70 options:v32 progressHandler:v48 andCompletionHandler:v49];

          goto LABEL_41;
        }
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_1000F3F80;
        v58[3] = &unk_10021BEF0;
        v58[4] = self;
        uint64_t v21 = +[VCPMADOCRLibraryProcessingTask taskWithPhotoLibraries:v12 cancelBlock:&stru_10021DE90 progressHandler:v58 andCompletionHandler:v49];
        goto LABEL_40;
      case 0xCuLL:
        if (VCPMADUnifiedBackgroundProcessing())
        {
          CFStringRef v83 = @"SkipSyncGallery";
          v84 = &__kCFBooleanTrue;
          v33 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
          v24 = +[MADUnifiedProcessingTask taskWithCancelBlock:&stru_10021DED0 options:v33 progressHandler:v48 andCompletionHandler:v49];

          goto LABEL_41;
        }
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472;
        v54[2] = sub_1000F4044;
        v54[3] = &unk_10021BEF0;
        v54[4] = self;
        uint64_t v21 = +[VCPMADVisualSearchLibraryProcessingTask taskWithPhotoLibraries:v12 cancelBlock:&stru_10021DEF0 progressHandler:v54 andCompletionHandler:v49];
        goto LABEL_40;
      default:
        if (a3 == 16)
        {
          v53[0] = _NSConcreteStackBlock;
          v53[1] = 3221225472;
          v53[2] = sub_1000F4060;
          v53[3] = &unk_10021BEF0;
          v53[4] = self;
          uint64_t v21 = +[VCPMADPECSingleRequestProcessingTask taskWithPhotoLibraries:v12 progressHandler:v53 completionHandler:v49 cancelBlock:&stru_10021DF10];
LABEL_40:
          v24 = (void *)v21;
          goto LABEL_41;
        }
        if (a3 == 256)
        {
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_1000F3FA4;
          v57[3] = &unk_10021BEF0;
          v57[4] = self;
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_1000F3FC0;
          v55[3] = &unk_10021AD08;
          v56 = v49;
          v24 = +[MADProgressReporterProcessingTask taskWithCancelBlock:&stru_10021DEB0 progressHandler:v57 completionHandler:v55];

LABEL_41:
          if (v24)
          {
            v52[0] = _NSConcreteStackBlock;
            v52[1] = 3221225472;
            v52[2] = sub_1000F4084;
            v52[3] = &unk_100219FC8;
            v52[4] = self;
            uint64_t v34 = +[VCPTimer timerWithIntervalSeconds:10 isOneShot:0 andBlock:v52];
            v35 = (void *)*((void *)v92 + 5);
            *((void *)v92 + 5) = v34;

            v36 = +[VCPMADQoSManager sharedManager];
            [v36 enable];

            v37 = +[PHPhotoLibrary vcp_defaultPhotoLibrary];
            v38 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v37];

            [v38 storeSchedulingHistoryForActivityID:a3 andStartTime:v20];
            [v38 purgeExcessiveSchedulingRecordsForActivityID:a3];
            [v38 commit];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000F410C;
            block[3] = &unk_100219D70;
            block[4] = self;
            id v27 = v24;
            id v51 = v27;
            v39 = (void (**)(void))dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
            v39[2]();

            unsigned int v40 = atomic_load(&self->_taskID.__a_.__a_value);
            if (!v40 && (int)MediaAnalysisLogLevel() >= 4)
            {
              v41 = VCPLogInstance();
              os_log_type_t v42 = VCPLogToOSLogType[4];
              if (os_log_type_enabled(v41, v42))
              {
                *(_DWORD *)v81 = 67109120;
                int v82 = a3;
                _os_log_impl((void *)&_mh_execute_header, v41, v42, "[BG Service] Failed to schedule task (%d)", v81, 8u);
              }
            }
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v43 = VCPLogInstance();
              os_log_type_t v44 = VCPLogToOSLogType[4];
              if (os_log_type_enabled(v43, v44))
              {
                *(_DWORD *)v81 = 67109120;
                int v82 = a3;
                _os_log_impl((void *)&_mh_execute_header, v43, v44, "[BG Service] Failed to create activity (%d)", v81, 8u);
              }
            }
            NSErrorUserInfoKey v77 = NSLocalizedDescriptionKey;
            id v27 = +[NSString stringWithFormat:@"Failed to create activity (%d)", a3];
            id v78 = v27;
            v45 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
            v46 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v45];
            v19[2](v19, v46);
          }
          goto LABEL_53;
        }
LABEL_22:
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v25 = VCPLogInstance();
          os_log_type_t v26 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v25, v26))
          {
            *(_DWORD *)v81 = 67109120;
            int v82 = a3;
            _os_log_impl((void *)&_mh_execute_header, v25, v26, "[BG Service] Invalid activity type (%d) requested", v81, 8u);
          }
        }
        NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
        id v27 = +[NSString stringWithFormat:@"Invalid activity type (%d) requested", a3];
        id v80 = v27;
        v28 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        v29 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v28];
        v19[2](v19, v29);

LABEL_53:
        _Block_object_dispose(v66, 8);

        _Block_object_dispose(buf, 8);
        break;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v22, v23))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "[BG Service] No PhotoLibrary present; quitting processing",
          buf,
          2u);
      }
    }
    v6[2](v6, 0);
  }
LABEL_54:
}

- (void)cancelActivity
{
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint32_t v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[BG Service] Request to cancel processing", buf, 2u);
    }
  }
  uint64_t v5 = atomic_load(&self->_taskID.__a_.__a_value);
  if (v5)
  {
    os_log_type_t v6 = +[VCPMADTaskScheduler sharedInstance];
    [v6 cancelTaskWithID:v5];
LABEL_7:

    return;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    os_log_type_t v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)os_log_type_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[BG Service] No active task; cannot cancel", v8, 2u);
    }
    goto LABEL_7;
  }
}

- (void)wakeWithReply:(id)a3
{
  uint32_t v3 = (void (**)(id, void))a3;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    os_log_type_t v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)os_log_type_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "[BG Service] Wake request", v7, 2u);
    }
  }
  uint64_t v6 = getpid();
  v3[2](v3, v6);
}

- (void).cxx_destruct
{
}

@end