@interface AssetSession
+ (id)defaultSession;
+ (void)obliterateBackgroundSessionsAndHandleEventStream;
- (AssetSession)init;
- (AssetSession)initWithConfiguration:(id)a3;
- (NSURLSessionConfiguration)configuration;
- (id)_findSessionUsingTaskInfo:(id)a3 withProperties:(id)a4;
- (id)assetPromiseWithRequest:(id)a3;
- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_completeNetworkActivityWithReason:(int)a3 usingTaskInfo:(id)a4;
- (void)_finishPromiseUsingTaskInfo:(id)a3;
- (void)_prepareDataConsumerUsingTaskInfo:(id)a3;
- (void)_prepareRequestUsingTaskInfo:(id)a3;
- (void)_reportMetricsForTaskInfo:(id)a3 withCompletionError:(id)a4;
- (void)_retryTaskUsingTaskInfo:(id)a3;
- (void)_startNetworkActivityUsingTaskInfo:(id)a3 withTask:(id)a4;
- (void)_startTaskUsingTaskInfo:(id)a3 withRequest:(id)a4;
@end

@implementation AssetSession

+ (id)defaultSession
{
  if (qword_10039FF90 != -1) {
    dispatch_once(&qword_10039FF90, &stru_100359840);
  }
  v2 = (void *)qword_10039FF98;

  return v2;
}

- (AssetSession)init
{
  v11.receiver = self;
  v11.super_class = (Class)AssetSession;
  v2 = [(AssetSession *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.storekit.AssetSession", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = v6;

    [(NSOperationQueue *)v2->_delegateQueue setUnderlyingQueue:v2->_dispatchQueue];
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sessions = v2->_sessions;
    v2->_sessions = v8;
  }
  return v2;
}

- (AssetSession)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(AssetSession *)self init];
  if (v5)
  {
    uint64_t v6 = +[NSURLSession sessionWithConfiguration:v4 delegate:v5 delegateQueue:v5->_delegateQueue];
    session = v5->_session;
    v5->_session = (NSURLSession *)v6;
  }
  return v5;
}

- (NSURLSessionConfiguration)configuration
{
  return [(NSURLSession *)self->_session configuration];
}

+ (void)obliterateBackgroundSessionsAndHandleEventStream
{
  v2 = (const char *)kNSURLSessionLaunchOnDemandNotificationName;
  v3 = dispatch_get_global_queue(17, 0);
  xpc_set_event_stream_handler(v2, v3, &stru_100359880);

  +[NSURLSession _obliterateAllBackgroundSessionsWithCompletionHandler:&stru_1003598A0];
}

- (id)assetPromiseWithRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = (AssetRequestProperties *)[v4 copyRequestProperties];
  }
  else {
    v5 = objc_alloc_init(AssetRequestProperties);
  }
  uint64_t v6 = v5;
  v7 = objc_alloc_init(AssetTaskInfo);
  [(AssetTaskInfo *)v7 setRequest:v4];
  [(AssetTaskInfo *)v7 setProperties:v6];
  v8 = [(AssetRequestProperties *)v6 requestUUID];
  -[AssetTaskInfo setSignpostId:](v7, "setSignpostId:", objc_msgSend(v8, "lib_signpostId"));
  v9 = [(AssetRequestProperties *)v6 logKey];

  if (v9)
  {
    v10 = [(AssetRequestProperties *)v6 logKey];
    objc_super v11 = objc_msgSend(v8, "lib_logUUID");
    v12 = +[NSString stringWithFormat:@"%@/%@", v10, v11];
    [(AssetTaskInfo *)v7 setLogKey:v12];
  }
  else
  {
    v10 = objc_msgSend(v8, "lib_logUUID");
    [(AssetTaskInfo *)v7 setLogKey:v10];
  }

  v13 = +[NSProgress progressWithTotalUnitCount:[(AssetRequestProperties *)v6 expectedContentLength]];
  [(AssetTaskInfo *)v7 setProgress:v13];

  v14 = [AssetPromise alloc];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006FBF4;
  v19[3] = &unk_1003598F0;
  v20 = v7;
  id v21 = v4;
  v22 = self;
  id v15 = v4;
  v16 = v7;
  v17 = [(AssetPromise *)v14 initWithRequestID:v8 promiseBlock:v19];
  [(AssetTaskInfo *)v16 setPromise:v17];

  return v17;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  v8 = +[AssetTaskInfo taskInfoForTask:v6];
  if (v8)
  {
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEBUG))
    {
      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      v9 = off_1003999F8;
      if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEBUG)) {
        sub_1002C781C(v9, v8, v6);
      }
    }
    v10 = [v8 progress];
    objc_msgSend(v10, "setCompletedUnitCount:", (char *)objc_msgSend(v7, "length") + (void)objc_msgSend(v10, "completedUnitCount"));

    objc_super v11 = [v8 promise];
    v12 = [v11 progress];

    if (v12) {
      ((void (**)(void, uint64_t, char *, char *))v12)[2](v12, 1, (char *)[v6 countOfBytesReceived] + (void)objc_msgSend(v8, "requestOffset"), (char *)objc_msgSend(v6, "countOfBytesExpectedToReceive") + (void)objc_msgSend(v8, "requestOffset"));
    }
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    v14 = [v8 properties];
    id v15 = [v14 dataConsumer];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100070388;
    v21[3] = &unk_100359918;
    id v16 = v6;
    id v22 = v16;
    id v17 = v8;
    id v23 = v17;
    v18 = v13;
    v24 = v18;
    [v15 consumeData:v7 withCompletionHandler:v21];
    dispatch_time_t v19 = dispatch_time(0, 300000000000);
    if (dispatch_semaphore_wait(v18, v19))
    {
      v20 = ASDErrorWithDescription();
      [v17 setError:v20];

      [v16 cancel];
    }
  }
  else
  {
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
      sub_1002C77B0();
    }
    [v6 cancel];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (uint64_t)objc_msgSend(v10, "asset_statusCode");
  dispatch_semaphore_t v13 = +[AssetTaskInfo taskInfoForTask:v9];
  if (v13)
  {
    v66 = self;
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    v14 = off_1003999F8;
    id v15 = (char *)[v13 signpostId];
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v16 = (os_signpost_id_t)v15;
      if (os_signpost_enabled((os_log_t)v14))
      {
        id v17 = [v13 logKey];
        *(_DWORD *)buf = 138543618;
        v77 = v17;
        __int16 v78 = 2050;
        uint64_t v79 = v12;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Download/Transfer", " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ", buf, 0x16u);
      }
    }

    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    v18 = off_1003999F8;
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v19 = v18;
      v20 = [v13 logKey];
      *(_DWORD *)buf = 138543618;
      v77 = v20;
      __int16 v78 = 2114;
      uint64_t v79 = (uint64_t)v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received response: %{public}@", buf, 0x16u);
    }
    id v21 = [v13 logKey];
    id v22 = +[KeepAlive keepAliveWithFormat:](KeepAlive, "keepAliveWithFormat:", @"com.apple.storekit.AssetTask:%@-%lu", v21, [v9 taskIdentifier]);
    [v13 setKeepAlive:v22];

    id v23 = objc_msgSend(v10, "asset_cdnUUID");
    v24 = v23;
    if (v23 && [v23 length])
    {
      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      v25 = off_1003999F8;
      if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
      {
        v26 = v25;
        v27 = [v13 logKey];
        *(_DWORD *)buf = 138543874;
        v77 = v27;
        __int16 v78 = 2114;
        uint64_t v79 = (uint64_t)v9;
        __int16 v80 = 2114;
        uint64_t v81 = (uint64_t)v24;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Task: %{public}@ CDNUUID: %{public}@", buf, 0x20u);
      }
    }
    if (v12 > 399)
    {
      switch(v12)
      {
        case 416:
          if (qword_10039FFE8 != -1) {
            dispatch_once(&qword_10039FFE8, &stru_100359AA0);
          }
          v44 = off_1003999F8;
          v45 = (char *)[v13 signpostId];
          if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v46 = (os_signpost_id_t)v45;
            if (os_signpost_enabled((os_log_t)v44))
            {
              v47 = [v13 logKey];
              *(_DWORD *)buf = 138543618;
              v77 = v47;
              __int16 v78 = 2050;
              uint64_t v79 = 416;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v44, OS_SIGNPOST_EVENT, v46, "RequestRange", " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ", buf, 0x16u);
            }
          }

          if (qword_10039FFE8 != -1) {
            dispatch_once(&qword_10039FFE8, &stru_100359AA0);
          }
          if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
            sub_1002C7AC8();
          }
          v48 = [v13 properties];
          v49 = [v48 dataConsumer];

          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472;
          v67[2] = sub_100071C88;
          v67[3] = &unk_100357C90;
          v67[4] = v66;
          id v68 = v13;
          id v69 = v9;
          id v70 = v11;
          [v49 truncateWithCompletionHandler:v67];

          goto LABEL_83;
        case 408:
          if (qword_10039FFE8 != -1) {
            dispatch_once(&qword_10039FFE8, &stru_100359AA0);
          }
          v50 = off_1003999F8;
          v51 = (char *)[v13 signpostId];
          if ((unint64_t)(v51 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v52 = (os_signpost_id_t)v51;
            if (os_signpost_enabled((os_log_t)v50))
            {
              v53 = [v13 logKey];
              *(_DWORD *)buf = 138543618;
              v77 = v53;
              __int16 v78 = 2050;
              uint64_t v79 = 408;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v50, OS_SIGNPOST_EVENT, v52, "RequestTimeout", " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ", buf, 0x16u);
            }
          }

          if (qword_10039FFE8 != -1) {
            dispatch_once(&qword_10039FFE8, &stru_100359AA0);
          }
          if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
            sub_1002C7A28();
          }
          [v13 setAction:1];
          break;
        case 403:
          if (qword_10039FFE8 != -1) {
            dispatch_once(&qword_10039FFE8, &stru_100359AA0);
          }
          v38 = off_1003999F8;
          v39 = (char *)[v13 signpostId];
          if ((unint64_t)(v39 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v40 = (os_signpost_id_t)v39;
            if (os_signpost_enabled((os_log_t)v38))
            {
              v41 = [v13 logKey];
              *(_DWORD *)buf = 138543618;
              v77 = v41;
              __int16 v78 = 2050;
              uint64_t v79 = 403;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v38, OS_SIGNPOST_EVENT, v40, "RequestExpired", " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ", buf, 0x16u);
            }
          }

          if (qword_10039FFE8 != -1) {
            dispatch_once(&qword_10039FFE8, &stru_100359AA0);
          }
          if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
            sub_1002C7988();
          }
          v42 = ASDErrorWithDescription();
          [v13 setError:v42];

          break;
        default:
          if (qword_10039FFE8 != -1) {
            dispatch_once(&qword_10039FFE8, &stru_100359AA0);
          }
          v54 = off_1003999F8;
          v55 = (char *)[v13 signpostId];
          if ((unint64_t)(v55 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v56 = (os_signpost_id_t)v55;
            if (os_signpost_enabled((os_log_t)v54))
            {
              v57 = [v13 logKey];
              *(_DWORD *)buf = 138543618;
              v77 = v57;
              __int16 v78 = 2050;
              uint64_t v79 = v12;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v54, OS_SIGNPOST_EVENT, v56, "RequestStatus", " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ", buf, 0x16u);
            }
          }

          if (qword_10039FFE8 != -1) {
            dispatch_once(&qword_10039FFE8, &stru_100359AA0);
          }
          v58 = off_1003999F8;
          if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR))
          {
            v64 = v58;
            v65 = [v13 logKey];
            *(_DWORD *)buf = 138543874;
            v77 = v65;
            __int16 v78 = 2114;
            uint64_t v79 = (uint64_t)v9;
            __int16 v80 = 2048;
            uint64_t v81 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "[%{public}@] Canceling task: %{public}@ after receiving invalid status code: %ld", buf, 0x20u);
          }
          v60 = v59 = +[NSError errorWithDomain:@"AssetErrorDomain" code:v12 + 1000 userInfo:0];
          v61 = ASDErrorWithUnderlyingErrorAndDescription();
          [v13 setError:v61];

          (*((void (**)(id, void))v11 + 2))(v11, 0);
          goto LABEL_83;
      }
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
    else
    {
      v28 = [v9 currentRequest];
      id v29 = objc_msgSend(v28, "asset_rangeOffset");

      if (!v29 || v12 == 206)
      {
        v43 = [v13 promise];
        v37 = [v43 progress];

        if (v37) {
          v37[2](v37, 0, [v13 requestOffset], (char *)objc_msgSend(v9, "countOfBytesExpectedToReceive") + (void)objc_msgSend(v13, "requestOffset"));
        }
        (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
      }
      else
      {
        if (qword_10039FFE8 != -1) {
          dispatch_once(&qword_10039FFE8, &stru_100359AA0);
        }
        v30 = off_1003999F8;
        v31 = (char *)[v13 signpostId];
        if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v32 = (os_signpost_id_t)v31;
          if (os_signpost_enabled((os_log_t)v30))
          {
            v33 = [v13 logKey];
            *(_DWORD *)buf = 138543618;
            v77 = v33;
            __int16 v78 = 2050;
            uint64_t v79 = v12;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v30, OS_SIGNPOST_EVENT, v32, "ConsumerReset", " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ", buf, 0x16u);
          }
        }

        if (qword_10039FFE8 != -1) {
          dispatch_once(&qword_10039FFE8, &stru_100359AA0);
        }
        v34 = off_1003999F8;
        if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR))
        {
          v62 = v34;
          v63 = [v13 logKey];
          *(_DWORD *)buf = 138543874;
          v77 = v63;
          __int16 v78 = 2114;
          uint64_t v79 = (uint64_t)v9;
          __int16 v80 = 2048;
          uint64_t v81 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "[%{public}@] Resetting data consumer for task: %{public}@ after receiving status code: %ld", buf, 0x20u);
        }
        v35 = [v13 properties];
        v36 = [v35 dataConsumer];

        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        v71[2] = sub_100071400;
        v71[3] = &unk_100357920;
        v71[4] = v66;
        id v72 = v36;
        id v73 = v13;
        id v74 = v9;
        id v75 = v11;
        v37 = v36;
        [v37 truncateWithCompletionHandler:v71];
      }
    }
LABEL_83:

    goto LABEL_84;
  }
  if (qword_10039FFE8 != -1) {
    dispatch_once(&qword_10039FFE8, &stru_100359AA0);
  }
  if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
    sub_1002C791C();
  }
  (*((void (**)(id, void))v11 + 2))(v11, 0);
LABEL_84:
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  v8 = +[AssetTaskInfo taskInfoForTask:v6];
  id v9 = v8;
  if (v8)
  {
    if ([v8 ignoreAssetCache])
    {
      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      id v10 = off_1003999F8;
      if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR))
      {
        id v22 = v10;
        id v23 = [v9 logKey];
        int v26 = 138543874;
        v27 = v23;
        __int16 v28 = 2114;
        id v29 = v6;
        __int16 v30 = 2114;
        id v31 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Retry scheduled for task: %{public}@ error: %{public}@", (uint8_t *)&v26, 0x20u);
      }
      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      id v11 = off_1003999F8;
      uint64_t v12 = (char *)[v9 signpostId];
      if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v13 = (os_signpost_id_t)v12;
        if (os_signpost_enabled((os_log_t)v11))
        {
          v14 = [v9 logKey];
          id v15 = objc_msgSend(v7, "lib_shortDescription");
          int v26 = 138543618;
          v27 = v14;
          __int16 v28 = 2114;
          id v29 = v15;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_SIGNPOST_EVENT, v13, "WillRetry", " uuid=%{public, signpost.description:attribute}@  error=%{public, signpost.description:attribute}@ ", (uint8_t *)&v26, 0x16u);
        }
      }
    }
    else
    {
      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      os_signpost_id_t v16 = off_1003999F8;
      if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR))
      {
        v24 = v16;
        v25 = [v9 logKey];
        int v26 = 138543874;
        v27 = v25;
        __int16 v28 = 2114;
        id v29 = v6;
        __int16 v30 = 2114;
        id v31 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[%{public}@] Canceling task: %{public}@ after cache request failed with error: %{public}@", (uint8_t *)&v26, 0x20u);
      }
      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      id v17 = off_1003999F8;
      v18 = (char *)[v9 signpostId];
      if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v19 = (os_signpost_id_t)v18;
        if (os_signpost_enabled((os_log_t)v17))
        {
          v20 = [v9 logKey];
          id v21 = objc_msgSend(v7, "lib_shortDescription");
          int v26 = 138543618;
          v27 = v20;
          __int16 v28 = 2114;
          id v29 = v21;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_SIGNPOST_EVENT, v19, "CacheFail", " uuid=%{public, signpost.description:attribute}@  error=%{public, signpost.description:attribute}@ ", (uint8_t *)&v26, 0x16u);
        }
      }

      [v9 setAction:1];
      [v9 setIgnoreAssetCache:1];
      id v11 = [v9 task];
      [v11 cancel];
    }
  }
  else
  {
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
      sub_1002C7C1C();
    }
    [v6 cancel];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[AssetTaskInfo taskInfoForTask:v7];
  if (v9)
  {
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    id v10 = off_1003999F8;
    id v11 = (char *)[v9 signpostId];
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = (os_signpost_id_t)v11;
      if (os_signpost_enabled((os_log_t)v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_SIGNPOST_INTERVAL_END, v12, "Download/Transfer", "", buf, 2u);
      }
    }

    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    os_signpost_id_t v13 = off_1003999F8;
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      id v15 = [v9 logKey];
      *(_DWORD *)buf = 138543618;
      __int16 v28 = v15;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed task: %{public}@", buf, 0x16u);
    }
    id v16 = [v9 action];
    if (v8 && !v16)
    {
      if (([v9 ignoreAssetCache] & 1) == 0)
      {
        if (qword_10039FFE8 != -1) {
          dispatch_once(&qword_10039FFE8, &stru_100359AA0);
        }
        if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
          sub_1002C7D10();
        }
        [v9 setIgnoreAssetCache:1];
        [v9 setAction:1];
      }
      id v17 = [v9 error];

      if (!v17) {
        [v9 setError:v8];
      }
      [(AssetSession *)self _completeNetworkActivityWithReason:3 usingTaskInfo:v9];
    }
    v18 = [v9 error];
    [(AssetSession *)self _reportMetricsForTaskInfo:v9 withCompletionError:v18];

    os_signpost_id_t v19 = [v9 properties];
    v20 = [v19 dataConsumer];

    if (v8 && [v9 action] != (id)2)
    {
      [(AssetSession *)self _completeNetworkActivityWithReason:4 usingTaskInfo:v9];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100072938;
      v23[3] = &unk_100358238;
      v23[4] = self;
      id v21 = &v24;
      id v24 = v9;
      [v20 suspendWithCompletionHandler:v23];
    }
    else
    {
      [(AssetSession *)self _completeNetworkActivityWithReason:2 usingTaskInfo:v9];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000727C8;
      v25[3] = &unk_100358238;
      v25[4] = self;
      id v21 = &v26;
      id v26 = v9;
      [v20 finishWithCompletionHandler:v25];
    }
  }
  else
  {
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    id v22 = off_1003999F8;
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
      sub_1002C7C88((uint64_t)v7, (uint64_t)v8, v22);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = +[AssetTaskInfo taskInfoForTask:v6];
  if (v8)
  {
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    id v9 = off_1003999F8;
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_INFO))
    {
      id v10 = v9;
      id v11 = [v8 logKey];
      *(_DWORD *)buf = 138543874;
      id v33 = v11;
      __int16 v34 = 2114;
      double v35 = *(double *)&v6;
      __int16 v36 = 2114;
      id v37 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Collected metrics for task: %{public}@ metrics: %{public}@", buf, 0x20u);
    }
    id v26 = v6;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    os_signpost_id_t v12 = objc_msgSend(v7, "transactionMetrics", v7);
    id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v28;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v16);
          v18 = objc_msgSend(v17, "lib_responseInterval");
          if (v18)
          {
            if (qword_10039FFE8 != -1) {
              dispatch_once(&qword_10039FFE8, &stru_100359AA0);
            }
            os_signpost_id_t v19 = off_1003999F8;
            if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
            {
              v20 = v19;
              id v21 = [v8 logKey];
              double v22 = (double)(uint64_t)[v17 countOfResponseBodyBytesReceived];
              [v18 duration];
              *(_DWORD *)buf = 138543618;
              id v33 = v21;
              __int16 v34 = 2048;
              double v35 = v22 / v23;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Response body bytes received speed: %.0f", buf, 0x16u);
            }
          }

          id v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v14);
    }

    id v7 = v25;
    [v8 setMetrics:v25];
    id v6 = v26;
  }
  else
  {
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    id v24 = off_1003999F8;
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Untracked task: %{public}@ did finish collecting metrics", buf, 0xCu);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void (**)(id, uint64_t, void))a6;
  id v11 = +[AssetTaskInfo taskInfoForTask:v8];
  if (v11)
  {
    os_signpost_id_t v12 = [v9 protectionSpace];
    id v13 = [v12 authenticationMethod];
    if ([v13 isEqualToString:NSURLAuthenticationMethodClientCertificate])
    {
      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      id v14 = off_1003999F8;
      if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = v14;
        id v16 = [v11 logKey];
        *(_DWORD *)buf = 138543362;
        os_signpost_id_t v40 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Using client certificate for authentication challenge", buf, 0xCu);
      }
      v10[2](v10, 1, 0);
    }
    else if ([v13 isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
      CFErrorRef error = 0;
      if (SecTrustEvaluateWithError((SecTrustRef)[v12 serverTrust], &error))
      {
        if (qword_10039FFE8 != -1) {
          dispatch_once(&qword_10039FFE8, &stru_100359AA0);
        }
        id v17 = off_1003999F8;
        if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          os_signpost_id_t v19 = [v11 logKey];
          *(_DWORD *)buf = 138543362;
          os_signpost_id_t v40 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Using server trust for authentication challenge", buf, 0xCu);
        }
        v20 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v12 serverTrust]);
        ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v20);
      }
      else
      {
        if (qword_10039FFE8 != -1) {
          dispatch_once(&qword_10039FFE8, &stru_100359AA0);
        }
        if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
          sub_1002C7F3C();
        }
        v10[2](v10, 2, 0);
      }
      if (error) {
        CFRelease(error);
      }
    }
    else
    {
      id v21 = [v11 properties];
      unsigned __int8 v22 = [v21 allowsAuthentication];

      if (v22)
      {
        if (qword_10039FFE8 != -1) {
          dispatch_once(&qword_10039FFE8, &stru_100359AA0);
        }
        double v23 = off_1003999F8;
        if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = v23;
          v25 = [v11 logKey];
          *(_DWORD *)buf = 138543362;
          os_signpost_id_t v40 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Prompting user for authentication challenge", buf, 0xCu);
        }
        id v26 = [[AuthenticationChallenge alloc] initWithAuthenticationChallenge:v9];
        long long v27 = +[AuthenticationChallengeDialogRequest dialogForAuthenticationChallenge:v26];
        id v28 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v27];
        long long v29 = [v28 present];
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1000733F4;
        v34[3] = &unk_100359A08;
        id v35 = v11;
        __int16 v36 = v26;
        id v37 = v10;
        long long v30 = v26;
        [v29 addFinishBlock:v34];
      }
      else
      {
        if (qword_10039FFE8 != -1) {
          dispatch_once(&qword_10039FFE8, &stru_100359AA0);
        }
        id v31 = off_1003999F8;
        if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
        {
          os_signpost_id_t v32 = v31;
          id v33 = [v11 logKey];
          *(_DWORD *)buf = 138543362;
          os_signpost_id_t v40 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Prompting for authentication is not permitted", buf, 0xCu);
        }
        v10[2](v10, 2, 0);
      }
    }
  }
  else
  {
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
      sub_1002C7ED0();
    }
    v10[2](v10, 2, 0);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void (**)(id, void))a6;
  id v11 = +[AssetTaskInfo taskInfoForTask:v8];
  if (v11)
  {
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    os_signpost_id_t v12 = off_1003999F8;
    id v13 = (char *)[v11 signpostId];
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = (os_signpost_id_t)v13;
      if (os_signpost_enabled((os_log_t)v12))
      {
        uint64_t v15 = [v11 logKey];
        int v21 = 138543362;
        unsigned __int8 v22 = v15;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_SIGNPOST_EVENT, v14, "TaskConnecting", " uuid=%{public, signpost.description:attribute}@ ", (uint8_t *)&v21, 0xCu);
      }
    }

    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    id v16 = off_1003999F8;
    BOOL v17 = os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT);
    id v18 = v9;
    if (v17)
    {
      os_signpost_id_t v19 = v16;
      v20 = [v11 logKey];
      int v21 = 138543618;
      unsigned __int8 v22 = v20;
      __int16 v23 = 2114;
      id v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Task: %{public}@ will send request", (uint8_t *)&v21, 0x16u);

      id v18 = v9;
    }
  }
  else
  {
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
      sub_1002C8064();
    }
    id v18 = 0;
  }
  ((void (**)(id, id))v10)[2](v10, v18);
}

- (void)_completeNetworkActivityWithReason:(int)a3 usingTaskInfo:(id)a4
{
  id v5 = a4;
  id v4 = [v5 networkActivity];
  if (v4)
  {
    nw_activity_complete_with_reason();
    [v5 setNetworkActivity:0];
  }
}

- (id)_findSessionUsingTaskInfo:(id)a3 withProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSURLSessionConfiguration asset_configurationIdentifierUsingProperties:v7];
  [v6 setConfigurationID:v8];
  id v9 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 maximumWatchCellularTransferSize];
  if (v10)
  {
    id v11 = (void *)v10;
    os_signpost_id_t v12 = [v9 maximumWatchCellularTransferSize];
    id v13 = [v12 unsignedLongLongValue];
    id v14 = [v7 expectedContentLength];

    if (v13 < v14)
    {
      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      uint64_t v15 = off_1003999F8;
      if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v15;
        BOOL v17 = [v6 logKey];
        id v18 = [v9 maximumWatchCellularTransferSize];
        *(_DWORD *)buf = 138543874;
        v39 = v17;
        __int16 v40 = 2048;
        v41 = (const char *)[v18 unsignedLongLongValue];
        __int16 v42 = 2048;
        id v43 = [v7 expectedContentLength];
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating new session because download exceeds maximum watch cellular transfer size for existing session (Max: %lld, Download: %lld)", buf, 0x20u);
      }
      goto LABEL_15;
    }
  }
  if (!v9)
  {
LABEL_15:
    id v29 = [v7 discretionaryType];
    if (v29) {
      +[NSURLSessionConfiguration asset_backgroundSessionConfigurationUsingProperties:v7];
    }
    else {
    long long v27 = +[NSURLSessionConfiguration asset_ephemeralSessionConfigurationUsingProperties:v7];
    }
    id v28 = +[NSURLSession sessionWithConfiguration:v27 delegate:self delegateQueue:self->_delegateQueue];
    long long v30 = [v7 maximumWatchCellularTransferSize];
    id v9 = +[CachedURLSession cachedSession:v28 maximumWatchCellularTransferSize:v30];
    [(NSMutableDictionary *)self->_sessions setObject:v9 forKeyedSubscript:v8];

    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    id v31 = off_1003999F8;
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v32 = v31;
      id v33 = [v6 logKey];
      if (v29) {
        __int16 v34 = "background";
      }
      else {
        __int16 v34 = "ephemeral";
      }
      id v35 = [v27 identifier];
      *(_DWORD *)buf = 138544130;
      v39 = v33;
      __int16 v40 = 2080;
      v41 = v34;
      __int16 v42 = 2114;
      id v43 = v35;
      __int16 v44 = 2114;
      v45 = v8;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Created new %s session with identifier: %{public}@ (%{public}@)", buf, 0x2Au);
    }
    goto LABEL_25;
  }
  if (qword_10039FFE8 != -1) {
    dispatch_once(&qword_10039FFE8, &stru_100359AA0);
  }
  os_signpost_id_t v19 = off_1003999F8;
  if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    int v21 = [v6 logKey];
    unsigned __int8 v22 = [v9 session];
    __int16 v23 = [v22 configuration];
    id v24 = [v23 identifier];
    *(_DWORD *)buf = 138543874;
    v39 = v21;
    __int16 v40 = 2114;
    v41 = v24;
    __int16 v42 = 2114;
    id v43 = v8;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Reusing existing session with identifier: %{public}@ (%{public}@)", buf, 0x20u);
  }
  v25 = [v9 session];
  id v26 = [v25 configuration];
  long long v27 = [v26 identifier];

  if (v27)
  {
    id v28 = [v27 stringByAppendingFormat:@" (%@)", v8];
    [v6 setConfigurationID:v28];
LABEL_25:
  }
  __int16 v36 = [v9 session];

  return v36;
}

- (void)_finishPromiseUsingTaskInfo:(id)a3
{
  id v3 = a3;
  if (qword_10039FFE8 != -1) {
    dispatch_once(&qword_10039FFE8, &stru_100359AA0);
  }
  id v4 = off_1003999F8;
  id v5 = (char *)[v3 signpostId];
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = (os_signpost_id_t)v5;
    if (os_signpost_enabled((os_log_t)v4))
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_SIGNPOST_INTERVAL_END, v6, "Download", "", (uint8_t *)&v20, 2u);
    }
  }

  [v3 setKeepAlive:0];
  if (qword_10039FFE8 != -1) {
    dispatch_once(&qword_10039FFE8, &stru_100359AA0);
  }
  id v7 = off_1003999F8;
  if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [v3 logKey];
    int v20 = 138543362;
    int v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finishing asset promise", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v10 = [v3 promise];
  if ([v10 isFinished])
  {
    if (([v10 isCancelled] & 1) == 0)
    {
      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      id v11 = off_1003999F8;
      if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_FAULT)) {
        sub_1002C80D0(v11);
      }
    }
  }
  else
  {
    os_signpost_id_t v12 = objc_alloc_init(AssetResult);
    -[AssetResult setBytesReceived:](v12, "setBytesReceived:", [v3 bytesReceived]);
    id v13 = [v3 properties];
    id v14 = [v13 dataConsumer];
    [(AssetResult *)v12 setDataConsumer:v14];

    uint64_t v15 = [v3 error];
    [(AssetResult *)v12 setError:v15];

    id v16 = [v3 metrics];
    [(AssetResult *)v12 setMetrics:v16];

    [v10 finishWithResult:v12];
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    BOOL v17 = off_1003999F8;
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      os_signpost_id_t v19 = [v3 logKey];
      int v20 = 138543362;
      int v21 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished asset promise", (uint8_t *)&v20, 0xCu);
    }
  }
  +[AssetTaskInfo removeTaskInfo:v3];
}

- (void)_reportMetricsForTaskInfo:(id)a3 withCompletionError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc((Class)AMSMetricsLoadURLContext);
  id v8 = [v5 task];
  id v9 = [v5 metrics];
  id v10 = [v7 initWithTask:v8 metrics:v9];

  id v11 = +[Bag defaultBag];
  [v10 setBag:v11];

  [v10 setError:v6];
  os_signpost_id_t v12 = [v5 session];
  [v10 setSession:v12];

  if (+[AMSMetricsLoadURLEvent shouldCollectMetricsForContext:v10])
  {
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    id v13 = off_1003999F8;
    id v14 = (char *)[v5 signpostId];
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = (os_signpost_id_t)v14;
      if (os_signpost_enabled((os_log_t)v13))
      {
        id v16 = [v5 logKey];
        int v22 = 138543362;
        __int16 v23 = v16;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_SIGNPOST_EVENT, v15, "RecordMetrics", " uuid=%{public, signpost.description:attribute}@ ", (uint8_t *)&v22, 0xCu);
      }
    }

    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    BOOL v17 = off_1003999F8;
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      os_signpost_id_t v19 = [v5 logKey];
      int v22 = 138543362;
      __int16 v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Recording LoadURL Metrics", (uint8_t *)&v22, 0xCu);
    }
    id v20 = [objc_alloc((Class)AMSMetricsLoadURLEvent) initWithContext:v10];
    int v21 = +[AMSMetrics lib_sharedInstanceWithContainerId:@"com.apple.storekitd"];
    [v21 enqueueEvent:v20];
  }
}

- (void)_retryTaskUsingTaskInfo:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (qword_10039FFE8 != -1) {
    dispatch_once(&qword_10039FFE8, &stru_100359AA0);
  }
  id v5 = off_1003999F8;
  id v6 = (char *)[v4 signpostId];
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = (os_signpost_id_t)v6;
    if (os_signpost_enabled((os_log_t)v5))
    {
      id v8 = [v4 logKey];
      *(_DWORD *)buf = 138543362;
      id v18 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_SIGNPOST_EVENT, v7, "Retry", " uuid=%{public, signpost.description:attribute}@ ", buf, 0xCu);
    }
  }

  if (qword_10039FFE8 != -1) {
    dispatch_once(&qword_10039FFE8, &stru_100359AA0);
  }
  id v9 = off_1003999F8;
  if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = [v4 logKey];
    *(_DWORD *)buf = 138543362;
    id v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Retrying request", buf, 0xCu);
  }
  [v4 setAction:0];
  [v4 setError:0];
  [v4 setKeepAlive:0];
  os_signpost_id_t v12 = [v4 properties];
  id v13 = [v12 dataConsumer];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100074768;
  v15[3] = &unk_100358238;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [v13 resetWithCompletionHandler:v15];
}

- (void)_prepareDataConsumerUsingTaskInfo:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 action] == (id)3)
  {
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    id v5 = off_1003999F8;
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
      sub_1002C81F4(v5);
    }
    [(AssetSession *)self _finishPromiseUsingTaskInfo:v4];
  }
  else
  {
    id v6 = [v4 properties];
    os_signpost_id_t v7 = [v6 dataConsumer];

    if (v7)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100074BD4;
      v16[3] = &unk_100359A58;
      v16[4] = self;
      id v17 = v4;
      [v7 prepareWithCompletionHandler:v16];
    }
    else
    {
      id v8 = ASDErrorWithDescription();
      [v4 setError:v8];

      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      id v9 = off_1003999F8;
      id v10 = (char *)[v4 signpostId];
      if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = (os_signpost_id_t)v10;
        if (os_signpost_enabled((os_log_t)v9))
        {
          os_signpost_id_t v12 = [v4 logKey];
          id v13 = [v4 error];
          id v14 = objc_msgSend(v13, "lib_shortDescription");
          *(_DWORD *)buf = 138543618;
          os_signpost_id_t v19 = v12;
          __int16 v20 = 2114;
          int v21 = v14;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_SIGNPOST_EVENT, v11, "ConsumerError", " uuid=%{public, signpost.description:attribute}@  error=%{public, signpost.description:attribute}@ ", buf, 0x16u);
        }
      }

      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      os_signpost_id_t v15 = off_1003999F8;
      if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
        sub_1002C8284(v15);
      }
      [(AssetSession *)self _finishPromiseUsingTaskInfo:v4];
    }
  }
}

- (void)_prepareRequestUsingTaskInfo:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 action] == (id)3)
  {
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    id v5 = off_1003999F8;
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
      sub_1002C81F4(v5);
    }
    [(AssetSession *)self _finishPromiseUsingTaskInfo:v4];
  }
  else
  {
    id v6 = [v4 properties];
    if (([v4 ignoreAssetCache] & 1) != 0
      || ![v6 locateAssetCache])
    {
      [v4 setIgnoreAssetCache:1];
      id v9 = [v4 request];
      [(AssetSession *)self _startTaskUsingTaskInfo:v4 withRequest:v9];
    }
    else
    {
      os_signpost_id_t v7 = [v4 request];
      id v8 = [v7 URL];
      id v10 = v4;
      ACSLocateCachingServer();
    }
  }
}

- (void)_startNetworkActivityUsingTaskInfo:(id)a3 withTask:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  os_signpost_id_t v7 = [v5 properties];
  id v8 = [v7 requestReason];

  switch((unint64_t)v8)
  {
    case 0uLL:
      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      id v13 = off_1003999F8;
      if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
        sub_1002C84E8(v13);
      }
      break;
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      id v9 = (void *)nw_activity_create();
      if (v9)
      {
        if (qword_10039FFE8 != -1) {
          dispatch_once(&qword_10039FFE8, &stru_100359AA0);
        }
        id v10 = off_1003999F8;
        if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_INFO))
        {
          os_signpost_id_t v11 = v10;
          os_signpost_id_t v12 = [v5 logKey];
          int v14 = 138543618;
          os_signpost_id_t v15 = v12;
          __int16 v16 = 2114;
          id v17 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] Activating network activity: %{public}@", (uint8_t *)&v14, 0x16u);
        }
        nw_activity_activate();
        objc_msgSend(v6, "set_nw_activity:", v9);
        [v5 setNetworkActivity:v9];
      }

      break;
    default:
      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
        sub_1002C8444();
      }
      break;
  }
}

- (void)_startTaskUsingTaskInfo:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v6 action] == (id)3)
  {
    if (qword_10039FFE8 != -1) {
      dispatch_once(&qword_10039FFE8, &stru_100359AA0);
    }
    id v8 = off_1003999F8;
    if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
      sub_1002C81F4(v8);
    }
    [(AssetSession *)self _finishPromiseUsingTaskInfo:v6];
  }
  else
  {
    id v9 = [v6 properties];
    id v10 = objc_alloc((Class)NSMutableURLRequest);
    id v11 = v7;
    id v12 = objc_msgSend(v10, "_initWithCFURLRequest:", objc_msgSend(v11, "_CFURLRequest"));
    id v13 = [v12 HTTPUserAgent];

    if (!v13)
    {
      int v14 = +[AMSProcessInfo currentProcess];
      os_signpost_id_t v15 = +[AMSUserAgent userAgentForProcessInfo:v14];
      [v12 setHTTPUserAgent:v15];
    }
    if ([v6 requestOffset]) {
      objc_msgSend(v12, "asset_setRangeOffset:", objc_msgSend(v6, "requestOffset"));
    }
    uint64_t v16 = sub_100025208((uint64_t)[v9 requestReason]);
    if (v16) {
      [v12 setValue:v16 forHTTPHeaderField:@"Apple-Download-Type"];
    }
    if (self->_session) {
      objc_msgSend(v6, "setSession:");
    }
    id v17 = [v6 session];

    if (!v17)
    {
      id v18 = [(AssetSession *)self _findSessionUsingTaskInfo:v6 withProperties:v9];
      [v6 setSession:v18];
    }
    os_signpost_id_t v19 = [v6 session];

    if (v19)
    {
      v65 = (void *)v16;
      __int16 v20 = [v6 session];
      int v21 = [v20 dataTaskWithRequest:v12];

      if (v21)
      {
        [(AssetSession *)self _startNetworkActivityUsingTaskInfo:v6 withTask:v21];
        id v64 = v7;
        if (qword_10039FFE8 != -1) {
          dispatch_once(&qword_10039FFE8, &stru_100359AA0);
        }
        int v22 = off_1003999F8;
        __int16 v23 = (char *)[v6 signpostId];
        if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v24 = (os_signpost_id_t)v23;
          if (os_signpost_enabled((os_log_t)v22))
          {
            v25 = [v6 logKey];
            id v26 = [v11 URL];
            *(_DWORD *)buf = 138543618;
            id v72 = v25;
            __int16 v73 = 2114;
            uint64_t v74 = (uint64_t)v26;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_SIGNPOST_EVENT, v24, "TaskCreated", " uuid=%{public, signpost.description:attribute}@  request=%{public, signpost.description:attribute}@ ", buf, 0x16u);
          }
        }

        if (qword_10039FFE8 != -1) {
          dispatch_once(&qword_10039FFE8, &stru_100359AA0);
        }
        long long v27 = off_1003999F8;
        if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = v27;
          id v29 = [v6 logKey];
          long long v30 = [v6 configurationID];
          id v31 = [v11 URL];
          *(_DWORD *)buf = 138544130;
          id v72 = v29;
          __int16 v73 = 2114;
          uint64_t v74 = (uint64_t)v21;
          __int16 v75 = 2114;
          v76 = v30;
          __int16 v77 = 2114;
          __int16 v78 = v31;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] Created task: %{public}@ in session: %{public}@ for URL: %{public}@ ", buf, 0x2Au);
        }
        +[AssetTaskInfo recordTaskInfo:v6 forTask:v21];
        os_signpost_id_t v32 = [v9 taskPriority];

        if (v32)
        {
          id v33 = [v9 taskPriority];
          objc_msgSend(v21, "set_priority:", objc_msgSend(v33, "longLongValue"));
        }
        else
        {
          if (qword_10039FFE8 != -1) {
            dispatch_once(&qword_10039FFE8, &stru_100359AA0);
          }
          v48 = off_1003999F8;
          if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
            sub_1002C8758(v48);
          }
          LODWORD(v49) = 1137180672;
          [v21 setPriority:v49];
        }
        v50 = [v9 bytesPerSecondLimit];

        if (v50)
        {
          v51 = [v9 bytesPerSecondLimit];
          objc_msgSend(v21, "set_bytesPerSecondLimit:", objc_msgSend(v51, "longLongValue"));
        }
        os_signpost_id_t v52 = [v9 loadingPriority];

        if (v52)
        {
          v53 = [v9 loadingPriority];
          [v53 doubleValue];
          objc_msgSend(v21, "set_loadingPriority:");
        }
        uint64_t v54 = (uint64_t)[v9 qosClass];
        if (!v54)
        {
          if (qword_10039FFE8 != -1) {
            dispatch_once(&qword_10039FFE8, &stru_100359AA0);
          }
          v55 = off_1003999F8;
          if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
            sub_1002C86C8(v55);
          }
          uint64_t v54 = 17;
        }
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_100075F3C;
        v67[3] = &unk_1003599E0;
        id v56 = v6;
        id v68 = v56;
        id v69 = v11;
        id v70 = v21;
        v57 = objc_retainBlock(v67);
        v58 = [v56 properties];
        v59 = [v58 externalID];

        if (v59)
        {
          v60 = +[VoucherStore sharedInstance];
          v61 = [v56 properties];
          v62 = [v61 externalID];
          [v60 usingVoucherForExternalID:v62 applyQOSClass:v54 executeBlock:v57];
        }
        else
        {
          v60 = dispatch_get_global_queue(v54, 0);
          dispatch_async(v60, v57);
        }

        id v7 = v64;
      }
      else
      {
        id v42 = v7;
        if (qword_10039FFE8 != -1) {
          dispatch_once(&qword_10039FFE8, &stru_100359AA0);
        }
        id v43 = off_1003999F8;
        __int16 v44 = (char *)[v6 signpostId];
        if ((unint64_t)(v44 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v45 = (os_signpost_id_t)v44;
          if (os_signpost_enabled((os_log_t)v43))
          {
            v63 = [v6 logKey];
            [v11 URL];
            *(_DWORD *)buf = 138543618;
            id v72 = v63;
            v74 = __int16 v73 = 2114;
            os_signpost_id_t v46 = (void *)v74;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v43, OS_SIGNPOST_EVENT, v45, "TaskError", " uuid=%{public, signpost.description:attribute}@  request=%{public, signpost.description:attribute}@ ", buf, 0x16u);
          }
        }

        if (qword_10039FFE8 != -1) {
          dispatch_once(&qword_10039FFE8, &stru_100359AA0);
        }
        id v7 = v42;
        if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
          sub_1002C8620();
        }
        v47 = +[NSError errorWithDomain:@"AssetErrorDomain" code:5 userInfo:0];
        [v6 setError:v47];

        [(AssetSession *)self _finishPromiseUsingTaskInfo:v6];
      }

      __int16 v34 = v65;
    }
    else
    {
      v66 = v11;
      __int16 v34 = (void *)v16;
      id v35 = v7;
      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      __int16 v36 = off_1003999F8;
      id v37 = (char *)[v6 signpostId];
      if ((unint64_t)(v37 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v38 = (os_signpost_id_t)v37;
        if (os_signpost_enabled((os_log_t)v36))
        {
          v39 = [v6 logKey];
          __int16 v40 = [v66 URL];
          *(_DWORD *)buf = 138543618;
          id v72 = v39;
          __int16 v73 = 2114;
          uint64_t v74 = (uint64_t)v40;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)v36, OS_SIGNPOST_EVENT, v38, "SessionError", " uuid=%{public, signpost.description:attribute}@  request=%{public, signpost.description:attribute}@ ", buf, 0x16u);
        }
      }

      if (qword_10039FFE8 != -1) {
        dispatch_once(&qword_10039FFE8, &stru_100359AA0);
      }
      id v7 = v35;
      if (os_log_type_enabled((os_log_t)off_1003999F8, OS_LOG_TYPE_ERROR)) {
        sub_1002C8578();
      }
      v41 = +[NSError errorWithDomain:@"AssetErrorDomain" code:4 userInfo:0];
      [v6 setError:v41];

      [(AssetSession *)self _finishPromiseUsingTaskInfo:v6];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

@end