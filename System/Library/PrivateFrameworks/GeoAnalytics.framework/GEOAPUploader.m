@interface GEOAPUploader
- (BOOL)_debugUploadCountersEnabled;
- (BOOL)_startTaskForFile:(id)a3 taskDescription:(id)a4 analyticSessionType:(int)a5 apURLsessionConfigType:(int)a6 ttl:(double)a7;
- (GEOAPUploader)init;
- (id)_additionalHTTPHeadersForAnalyticSessionType:(int)a3;
- (id)_sessionForType:(int)a3;
- (id)_urlForAnalyticSessionType:(int)a3;
- (id)_urlForBatchId:(unint64_t)a3;
- (id)filePathForTaskDescription:(id)a3;
- (id)fileURLForTaskDescription:(id)a3;
- (id)persistence;
- (id)tempFilePathForTaskDescription;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_clearExpired;
- (void)_clearUploadTimer;
- (void)_setupBackgroundTask;
- (void)_startUploadTimer;
- (void)_submitBatchForUploadWithBatchId:(unint64_t)a3;
- (void)_submitBatchesForUpload;
@end

@implementation GEOAPUploader

- (id)persistence
{
  if (qword_100033E08 != -1) {
    dispatch_once(&qword_100033E08, &stru_100028B80);
  }
  v2 = (void *)qword_100033E00;
  return v2;
}

- (GEOAPUploader)init
{
  v10.receiver = self;
  v10.super_class = (Class)GEOAPUploader;
  v2 = [(GEOAPUploader *)&v10 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos();
    uploadQueue = v2->_uploadQueue;
    v2->_uploadQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_uploadQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E174;
    block[3] = &unk_1000288E8;
    v6 = v2;
    v9 = v6;
    dispatch_async(v5, block);
    [(GEOAPUploader *)v6 _setupBackgroundTask];
  }
  return v2;
}

- (void)_setupBackgroundTask
{
  if (sub_10000559C())
  {
    uint64_t v3 = [sub_1000057B0() sharedScheduler];
    geo_dispatch_queue_create_with_qos();
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000E760;
    v6[3] = &unk_100028BA8;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = v4;
    v8 = self;
    if (([v3 registerForTaskWithIdentifier:@"com.apple.geo.analytics" usingQueue:v4 launchHandler:v6] & 1) == 0)
    {
      v5 = sub_1000051A4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v10 = @"com.apple.geo.analytics";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "BGSystemTaskScheduler failed to register '%@'", buf, 0xCu);
      }
    }
  }
}

- (BOOL)_debugUploadCountersEnabled
{
  v2 = +[GEOPlatform sharedPlatform];
  if ([v2 isInternalInstall]) {
    char BOOL = GEOConfigGetBOOL();
  }
  else {
    char BOOL = 0;
  }

  return BOOL;
}

- (void)_startUploadTimer
{
  uint64_t UInteger = GEOConfigGetUInteger();
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * UInteger);
  dispatch_source_set_timer((dispatch_source_t)self->_uploadTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v5 = sub_1000051A4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    uint64_t v7 = UInteger;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "upload holddown timer set to fire in %lld seconds", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_clearUploadTimer
{
  dispatch_source_set_timer((dispatch_source_t)self->_uploadTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  v2 = sub_1000051A4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "upload holddown timer was cleared", v3, 2u);
  }
}

- (void)_clearExpired
{
  id v2 = [(GEOAPUploader *)self persistence];
  [v2 clearExpiredLogMsgsWithResultBlock:&stru_100028BE8];
}

- (void)_submitBatchesForUpload
{
  [(GEOAPUploader *)self _clearUploadTimer];
  uint64_t v3 = sub_10000CCA8();
  BOOL v4 = sub_10000D148((BOOL)v3);

  if (!v4)
  {
    v5 = [(GEOAPUploader *)self persistence];
    int v6 = [v5 selectBatchIdsForBatchUpload];

    id v7 = [v6 count];
    v8 = sub_1000051A4();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        id v20 = [v6 count];
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%lu analytic types ready for upload", buf, 0xCu);
      }

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v9);
            }
            -[GEOAPUploader _submitBatchForUploadWithBatchId:](self, "_submitBatchForUploadWithBatchId:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "unsignedLongLongValue", (void)v14));
          }
          id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v11);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "nothing available for upload", buf, 2u);
    }
  }
}

- (void)_submitBatchForUploadWithBatchId:(unint64_t)a3
{
  v5 = -[GEOAPUploader _urlForBatchId:](self, "_urlForBatchId:");
  if (v5)
  {
    uint64_t v83 = 0;
    v84 = &v83;
    uint64_t v85 = 0x2020000000;
    uint64_t v86 = 0;
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x2020000000;
    uint64_t v82 = 0;
    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x2020000000;
    uint64_t v78 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v98 = 0x3032000000;
    v99 = sub_10000FA4C;
    v100 = sub_10000FA5C;
    id v101 = 0;
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x3032000000;
    v72 = sub_10000FA4C;
    v73 = sub_10000FA5C;
    id v74 = 0;
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2020000000;
    char v68 = 0;
    int v6 = +[NSUUID UUID];
    id v7 = [v6 UUIDString];

    uint64_t v8 = GEOBatchUploadPolicyType();
    uint64_t v9 = GEOBatchLogMessageType();
    int v10 = GEOBatchOpaqueAppID();
    id v11 = sub_1000051A4();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_45;
    }
    if ((int)v9 <= 11999)
    {
      uint64_t v12 = @"LOG_MESSAGE_TYPE_UNKNOWN";
      switch((int)v9)
      {
        case 0:
          goto LABEL_41;
        case 1:
          uint64_t v12 = @"DEBUGLOG";
          break;
        case 2:
          uint64_t v12 = @"CURATED_COLLECTION_SESSION";
          break;
        case 3:
          uint64_t v12 = @"FIFTEEN_MONTH_SESSION";
          break;
        case 4:
          uint64_t v12 = @"PRESSURE_DATA_SESSION";
          break;
        case 5:
          uint64_t v12 = @"POI_BUSYNESS_DATA_SESSION";
          break;
        case 6:
          uint64_t v12 = @"FIFTEEN_MONTH_USER_SESSION";
          break;
        case 7:
          uint64_t v12 = @"NETWORK_SELECTION_HARVEST_SESSION";
          break;
        default:
          if (v9 == 10000)
          {
            uint64_t v12 = @"USAGE";
          }
          else
          {
            if (v9 != 11000) {
              goto LABEL_29;
            }
            uint64_t v12 = @"SHORT_SESSION_USAGE";
          }
          break;
      }
      goto LABEL_41;
    }
    if ((int)v9 > 29999)
    {
      switch((int)v9)
      {
        case 50000:
          uint64_t v12 = @"REALTIME_TRAFFIC_PROBE";
          break;
        case 50001:
          uint64_t v12 = @"BATCH_TRAFFIC_PROBE";
          break;
        case 50002:
          uint64_t v12 = @"WIFI_CONNECTION_QUALITY_PROBE_COLLECTION";
          break;
        case 50003:
          uint64_t v12 = @"LOG_DISCARD_EVENT";
          break;
        default:
          if (v9 == 30000)
          {
            uint64_t v12 = @"NAVIGATION_TRACE";
          }
          else
          {
            if (v9 != 40000) {
              goto LABEL_29;
            }
            uint64_t v12 = @"TELEMETRY";
          }
          break;
      }
      goto LABEL_41;
    }
    if ((int)v9 <= 13999)
    {
      if (v9 == 12000)
      {
        uint64_t v12 = @"LONG_SESSION_USAGE";
        goto LABEL_41;
      }
      if (v9 == 13000)
      {
        uint64_t v12 = @"SESSIONLESS_USAGE";
        goto LABEL_41;
      }
    }
    else
    {
      switch(v9)
      {
        case 0x36B0:
          uint64_t v12 = @"LONG_SESSION_LOG_FRAMEWORK_USAGE";
          goto LABEL_41;
        case 0x3A98:
          uint64_t v12 = @"COHORTS_SESSION_USAGE";
          goto LABEL_41;
        case 0x4E20:
          uint64_t v12 = @"PERFORMANCE";
LABEL_41:
          long long v14 = v12;
          if (v8 >= 0xC)
          {
            long long v15 = +[NSString stringWithFormat:@"(unknown: %i)", v8];
          }
          else
          {
            long long v15 = *(&off_100028D38 + (int)v8);
          }
          *(_DWORD *)v87 = 138413314;
          v88 = v7;
          __int16 v89 = 2048;
          unint64_t v90 = a3;
          __int16 v91 = 2112;
          v92 = v14;
          __int16 v93 = 2112;
          v94 = v15;
          __int16 v95 = 1024;
          int v96 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "(%@) upload requested for batch id %llu / message Type : %@, upload policy : %@, opaqueId : %u", v87, 0x30u);

LABEL_45:
          long long v16 = +[GEOAPUploadPolicies sharedPolicies];
          long long v17 = [v16 uploadPolicyForUploadPolicyType:v8];

          if (v8 >= 0xC)
          {
            v37 = +[NSString stringWithFormat:@"(unknown: %i)", v8];
          }
          else
          {
            v37 = *(&off_100028D38 + (int)v8);
          }
          v18 = [v17 uploadStages];
          v39 = [v18 firstObject];

          v19 = [v39 urlSessionConfig];
          id v38 = [v19 type];

          if (v38 >= 7)
          {
            v36 = +[NSString stringWithFormat:@"(unknown: %i)", v38];
          }
          else
          {
            v36 = *(&off_100028E38 + (int)v38);
          }
          [v39 ttl];
          uint64_t v21 = v20;
          id v22 = sub_10000D1F0([GEOAPUploadFileWriter alloc], a3);
          v23 = v22;
          if (!v22)
          {
            v31 = sub_1000051A4();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v87 = 138412546;
              v88 = v7;
              __int16 v89 = 2048;
              unint64_t v90 = a3;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "(%@) unable to create upload file writer for batch id %llu; unable to upload right now",
                v87,
                0x16u);
            }
            goto LABEL_65;
          }
          v35 = v22;
          v24 = +[GEOReferenceTimeManager sharedManager];
          v25 = [v24 bestReferenceDate];

          v26 = [(GEOAPUploader *)self persistence];
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_10000FA64;
          v55[3] = &unk_100028C38;
          v34 = v25;
          v56 = v34;
          v59 = &v79;
          v60 = &v75;
          v61 = &v83;
          p_long long buf = &buf;
          v63 = &v69;
          id v57 = v35;
          id v58 = v7;
          unint64_t v64 = a3;
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_10000FC34;
          v40[3] = &unk_100028C60;
          v46 = &v75;
          v47 = &buf;
          uint64_t v52 = v21;
          id v27 = v58;
          id v41 = v27;
          id v42 = v36;
          id v43 = v37;
          v48 = &v83;
          v49 = &v69;
          unint64_t v53 = a3;
          int v54 = (int)v38;
          id v44 = v57;
          v45 = self;
          v50 = &v65;
          v51 = &v79;
          [v26 selectLogMsgsForBatchUploadWithBatchId:a3 visitorBlock:v55 completionBlock:v40];

          unsigned int v28 = [(GEOAPUploader *)self _debugUploadCountersEnabled];
          v29 = v76;
          if (v28 && v76[3])
          {
            v23 = v35;
            if (*((unsigned char *)v66 + 24))
            {
              v30 = +[GEOAPDebugPersistence sharedInstance];
              LODWORD(v33) = 1;
              [v30 addInflightUploadWithBatchUUID:v27 createTime:v70[5] sessionType:GEOBatchAnalyticsSessionType() eventCount:*((unsigned int *)v76 + 6) uploadSize:*((unsigned int *)v84 + 6) uploadPolicy:v38 stageNum:v33];

              v23 = v35;
              v29 = v76;
            }
          }
          else
          {
            v23 = v35;
          }
          if (v29[3])
          {
            if (!*((unsigned char *)v66 + 24)) {
              goto LABEL_63;
            }
          }
          else if (v80[3])
          {
LABEL_63:
            v32 = [(GEOAPUploader *)self persistence];
            [v32 clearPendingLogMsgElemsForBatchUploadWithBatchId:a3];

            v23 = v35;
          }

          v31 = v34;
LABEL_65:

          _Block_object_dispose(&v65, 8);
          _Block_object_dispose(&v69, 8);

          _Block_object_dispose(&buf, 8);
          _Block_object_dispose(&v75, 8);
          _Block_object_dispose(&v79, 8);
          _Block_object_dispose(&v83, 8);
          goto LABEL_66;
      }
    }
LABEL_29:
    uint64_t v12 = +[NSString stringWithFormat:@"(unknown: %i)", v9];
    goto LABEL_41;
  }
  v13 = sub_1000051A4();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "No URL for batch id %llu; unable to upload right now",
      (uint8_t *)&buf,
      0xCu);
  }

LABEL_66:
}

- (id)tempFilePathForTaskDescription
{
  id v2 = +[GEOAPUtils GEOAPCachePath];
  id v3 = objc_alloc_init((Class)NSUUID);
  BOOL v4 = [v3 UUIDString];
  v5 = [v2 stringByAppendingPathComponent:v4];

  return v5;
}

- (id)filePathForTaskDescription:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[GEOAPUtils GEOAPCachePath];
  v5 = [v4 stringByAppendingPathComponent:v3];

  return v5;
}

- (id)fileURLForTaskDescription:(id)a3
{
  id v3 = [(GEOAPUploader *)self filePathForTaskDescription:a3];
  BOOL v4 = +[NSURL fileURLWithPath:v3];

  return v4;
}

- (id)_sessionForType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  sessionCache = self->_sessionCache;
  int v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  id v7 = [(NSCache *)sessionCache objectForKey:v6];

  if (!v7)
  {
    if (v3 >= 7)
    {
      uint64_t v8 = +[NSString stringWithFormat:@"(unknown: %i)", v3];
    }
    else
    {
      uint64_t v8 = *(&off_100028E38 + (int)v3);
    }
    uint64_t v9 = +[NSString stringWithFormat:@"com.apple.geo.analytics.%@", v8];

    int v10 = +[GEOAPURLSessionConfig configForURLSessionConfigType:v3];
    id v11 = +[GEOPlatform sharedPlatform];
    if ([v11 isInternalInstall]) {
      char BOOL = GEOConfigGetBOOL();
    }
    else {
      char BOOL = 0;
    }

    v13 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:v9];
    objc_msgSend(v13, "set_allowsTLSSessionTickets:", GEOConfigGetBOOL());
    if (BOOL)
    {
      uint64_t v14 = 1;
      objc_msgSend(v13, "set_allowsExpensiveAccess:", 1);
    }
    else
    {
      objc_msgSend(v13, "set_allowsExpensiveAccess:", objc_msgSend(v10, "requireWifi") ^ 1);
      uint64_t v14 = [v10 requireWifi] ^ 1;
    }
    [v13 setAllowsCellularAccess:v14];
    objc_msgSend(v13, "set_requiresPowerPluggedIn:", objc_msgSend(v10, "requirePower"));
    objc_msgSend(v13, "setDiscretionary:", objc_msgSend(v10, "discretionary"));
    [v13 setAllowsConstrainedNetworkAccess:GEOConfigGetBOOL()];
    [v13 setSessionSendsLaunchEvents:1];

    id v7 = +[NSURLSession sessionWithConfiguration:v13 delegate:self delegateQueue:0];
    long long v15 = self->_sessionCache;
    long long v16 = +[NSNumber numberWithInt:v3];
    [(NSCache *)v15 setObject:v7 forKey:v16 cost:1];
  }
  return v7;
}

- (BOOL)_startTaskForFile:(id)a3 taskDescription:(id)a4 analyticSessionType:(int)a5 apURLsessionConfigType:(int)a6 ttl:(double)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v23 = a3;
  id v25 = a4;
  uint64_t v12 = [(GEOAPUploader *)self _urlForAnalyticSessionType:v9];
  v13 = +[NSMutableURLRequest requestWithURL:v12];
  [v13 setHTTPMethod:@"POST"];
  uint64_t v14 = [(GEOAPUploader *)self _additionalHTTPHeadersForAnalyticSessionType:v9];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v27;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v19 = objc_msgSend(v14, "objectForKeyedSubscript:", v18, v23);
        [v13 addValue:v19 forHTTPHeaderField:v18];
      }
      id v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }
  uint64_t v20 = -[GEOAPUploader _sessionForType:](self, "_sessionForType:", v8, v23);
  uint64_t v21 = [v20 uploadTaskWithRequest:v13 fromFile:v24];
  [v21 setTaskDescription:v25];
  objc_msgSend(v21, "set_timeoutIntervalForResource:", a7);
  [v21 resume];

  return 1;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uploadQueue = self->_uploadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000107A0;
  block[3] = &unk_100028CD8;
  id v13 = v8;
  id v14 = v7;
  id v15 = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync(uploadQueue, block);
}

- (id)_urlForBatchId:(unint64_t)a3
{
  uint64_t v4 = GEOBatchAnalyticsSessionType();
  return [(GEOAPUploader *)self _urlForAnalyticSessionType:v4];
}

- (id)_urlForAnalyticSessionType:(int)a3
{
  uint64_t v3 = 0;
  switch(a3)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 19:
      uint64_t v3 = GEOGetURL();
      break;
    case 9:
      uint64_t v4 = GEOConfigGetString();
      uint64_t v3 = +[NSURL URLWithString:v4];

      break;
    default:
      break;
  }
  return v3;
}

- (id)_additionalHTTPHeadersForAnalyticSessionType:(int)a3
{
  uint64_t v4 = +[GEOPlatform sharedPlatform];
  unsigned int v5 = [v4 isInternalInstall];

  if (v5)
  {
    int v6 = +[NSMutableDictionary dictionary];
    id v7 = +[NSUUID UUID];
    id v8 = [v7 UUIDString];
    [v6 setObject:v8 forKeyedSubscript:@"X-uuid"];

    if (a3 != 12) {
      goto LABEL_9;
    }
    if (v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a3 == 12)
  {
LABEL_6:
    int v6 = +[NSMutableDictionary dictionary];
LABEL_7:
    uint64_t v9 = +[GEOPlatform sharedPlatform];
    id v10 = [v9 osAndBuildVersion];
    [v6 setObject:v10 forKeyedSubscript:@"X-os-version"];

    goto LABEL_9;
  }
  int v6 = 0;
LABEL_9:
  if ([v6 count]) {
    id v11 = [v6 copy];
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionCache, 0);
  objc_storeStrong((id *)&self->_uploadTimer, 0);
  objc_storeStrong((id *)&self->_uploadQueue, 0);
}

@end