@interface AssetSession
- (AssetSession)init;
- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _alternatePathAvailable:(int)a5;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
@end

@implementation AssetSession

- (AssetSession)init
{
  v11.receiver = self;
  v11.super_class = (Class)AssetSession;
  v2 = [(AssetSession *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.AssetSession", v3);
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

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = sub_10023E1CC((uint64_t)AssetTaskInfo, v6);
  v9 = ASDLogHandleForCategory();
  v10 = v9;
  if (v8)
  {
    BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

    if (v11)
    {
      v13 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v33 = objc_getProperty((id)v8, v14, 56, 1);
        v34 = (char *)[v6 countOfBytesReceived] + *(void *)(v8 + 112);
        v35 = (char *)[v6 countOfBytesExpectedToReceive] + *(void *)(v8 + 112);
        *(_DWORD *)buf = 138412802;
        id v41 = v33;
        __int16 v42 = 2048;
        v43 = v34;
        __int16 v44 = 2048;
        v45 = v35;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[%@] %{iec-bytes}lld/%{iec-bytes}lld", buf, 0x20u);
      }
    }
    id v15 = objc_getProperty((id)v8, v12, 80, 1);
    objc_msgSend(v15, "setCompletedUnitCount:", (char *)objc_msgSend(v7, "length") + (void)objc_msgSend(v15, "completedUnitCount"));

    double v16 = *(double *)(v8 + 160);
    *(CFAbsoluteTime *)(v8 + 160) = CFAbsoluteTimeGetCurrent();
    if (v16 > 0.0)
    {
      double v17 = (double)(unint64_t)[v7 length] / (*(double *)(v8 + 160) - v16);
      double v18 = fmin(*(double *)(v8 + 152), v17);
      *(double *)(v8 + 144) = fmax(*(double *)(v8 + 144), v17);
      *(double *)(v8 + 152) = v18;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v8 + 88));
    v20 = [WeakRetained progress];

    if (v20) {
      ((void (**)(void, uint64_t, char *, char *))v20)[2](v20, 1, (char *)[v6 countOfBytesReceived] + *(void *)(v8 + 112), (char *)objc_msgSend(v6, "countOfBytesExpectedToReceive") + *(void *)(v8 + 112));
    }
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
    id Property = objc_getProperty((id)v8, v22, 96, 1);
    v25 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v24, 64, 1);
    }
    id v26 = Property;

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100394650;
    v36[3] = &unk_10052AB90;
    id v27 = v6;
    id v37 = v27;
    id v28 = (id)v8;
    id v38 = v28;
    v29 = v21;
    v39 = v29;
    [v26 consumeData:v7 withCompletionHandler:v36];
    dispatch_time_t v30 = dispatch_time(0, 300000000000);
    if (dispatch_semaphore_wait(v29, v30))
    {
      v31 = ASDErrorWithDescription();
      objc_setProperty_atomic(v28, v32, v31, 40);

      [v27 cancel];
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v41 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Untracked task: %{public}@ canceling after receiving data", buf, 0xCu);
    }

    [v6 cancel];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = sub_10029FEA8((uint64_t)v10);
  uint64_t v13 = sub_10023E1CC((uint64_t)AssetTaskInfo, v9);
  v14 = ASDLogHandleForCategory();
  id v15 = v14;
  if (v13)
  {
    os_signpost_id_t v16 = *(void *)(v13 + 128);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      id v18 = objc_getProperty((id)v13, v17, 56, 1);
      *(_DWORD *)buf = 138543618;
      id v107 = v18;
      __int16 v108 = 2050;
      uint64_t v109 = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Download/Transfer", " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ", buf, 0x16u);
    }
    v19 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = objc_getProperty((id)v13, v20, 56, 1);
      *(_DWORD *)buf = 138412546;
      id v107 = v21;
      __int16 v108 = 2114;
      uint64_t v109 = (uint64_t)v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%@] Received response: %{public}@", buf, 0x16u);
    }
    id v23 = objc_getProperty((id)v13, v22, 56, 1);
    v24 = +[KeepAlive keepAliveWithFormat:](KeepAlive, "keepAliveWithFormat:", @"com.apple.appstored.AssetTask:%@-%lu", v23, [v9 taskIdentifier]);
    objc_setProperty_atomic((id)v13, v25, v24, 48);

    id v26 = sub_1002B29C4(v10);
    id v27 = v26;
    if (v26 && [v26 length])
    {
      id v28 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = objc_getProperty((id)v13, v29, 56, 1);
        *(_DWORD *)buf = 138412802;
        id v107 = v30;
        __int16 v108 = 2114;
        uint64_t v109 = (uint64_t)v9;
        __int16 v110 = 2114;
        uint64_t v111 = (uint64_t)v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[%@] Task: %{public}@ CDNUUID: %{public}@", buf, 0x20u);
      }
    }
    v31 = [v9 _incompleteTaskMetrics];
    objc_setProperty_atomic((id)v13, v32, v31, 64);

    if (v12 > 399)
    {
      switch(v12)
      {
        case 416:
          v58 = ASDLogHandleForCategory();
          v59 = v58;
          os_signpost_id_t v60 = *(void *)(v13 + 128);
          if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
          {
            id v62 = objc_getProperty((id)v13, v61, 56, 1);
            *(_DWORD *)buf = 138543618;
            id v107 = v62;
            __int16 v108 = 2050;
            uint64_t v109 = 416;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_EVENT, v60, "RequestRange", " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ", buf, 0x16u);
          }
          if ((*(unsigned char *)(v13 + 9) & 1) != 0
            || (id v64 = objc_getProperty((id)v13, v63, 56, 1),
                [v64 description],
                v65 = objc_claimAutoreleasedReturnValue(),
                unsigned int v66 = [v65 hasPrefix:@"SYS"],
                v65,
                v64,
                !v66))
          {
            v85 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              id v96 = objc_getProperty((id)v13, v86, 56, 1);
              *(_DWORD *)buf = 138412802;
              id v107 = v96;
              __int16 v108 = 2114;
              uint64_t v109 = (uint64_t)v9;
              __int16 v110 = 2048;
              uint64_t v111 = 416;
              _os_log_error_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "[%@] Truncate and restart task: %{public}@ after receiving status code: %ld", buf, 0x20u);
            }
            id Property = objc_getProperty((id)v13, v87, 96, 1);
            v90 = Property;
            if (Property) {
              id Property = objc_getProperty(Property, v89, 64, 1);
            }
            id v91 = Property;

            v97[0] = _NSConcreteStackBlock;
            v97[1] = 3221225472;
            v97[2] = sub_100395ED0;
            v97[3] = &unk_10052AC30;
            v97[4] = self;
            id v98 = (id)v13;
            id v99 = v9;
            id v100 = v11;
            [v91 truncateWithCompletionHandler:v97];

            goto LABEL_63;
          }
          *(unsigned char *)(v13 + 9) = 1;
          *(void *)(v13 + 16) = 1;
          break;
        case 408:
          v67 = ASDLogHandleForCategory();
          v68 = v67;
          os_signpost_id_t v69 = *(void *)(v13 + 128);
          if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
          {
            id v71 = objc_getProperty((id)v13, v70, 56, 1);
            *(_DWORD *)buf = 138543618;
            id v107 = v71;
            __int16 v108 = 2050;
            uint64_t v109 = 408;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v68, OS_SIGNPOST_EVENT, v69, "RequestTimeout", " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ", buf, 0x16u);
          }
          v72 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            id v94 = objc_getProperty((id)v13, v73, 56, 1);
            *(_DWORD *)buf = 138412802;
            id v107 = v94;
            __int16 v108 = 2114;
            uint64_t v109 = (uint64_t)v9;
            __int16 v110 = 2048;
            uint64_t v111 = 408;
            _os_log_error_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "[%@] Restarting task: %{public}@ after receiving status code: %ld", buf, 0x20u);
          }
          *(void *)(v13 + 16) = 1;
          break;
        case 403:
          v48 = ASDLogHandleForCategory();
          v49 = v48;
          os_signpost_id_t v50 = *(void *)(v13 + 128);
          if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
          {
            id v52 = objc_getProperty((id)v13, v51, 56, 1);
            *(_DWORD *)buf = 138543618;
            id v107 = v52;
            __int16 v108 = 2050;
            uint64_t v109 = 403;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_EVENT, v50, "RequestExpired", " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ", buf, 0x16u);
          }
          v53 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            id v93 = objc_getProperty((id)v13, v54, 56, 1);
            *(_DWORD *)buf = 138412802;
            id v107 = v93;
            __int16 v108 = 2114;
            uint64_t v109 = (uint64_t)v9;
            __int16 v110 = 2048;
            uint64_t v111 = 403;
            _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "[%@] Canceling task: %{public}@ after receiving status code: %ld", buf, 0x20u);
          }
          v55 = ASDErrorWithDescription();
          objc_setProperty_atomic((id)v13, v56, v55, 40);

          break;
        default:
          v74 = ASDLogHandleForCategory();
          v75 = v74;
          os_signpost_id_t v76 = *(void *)(v13 + 128);
          if (v76 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
          {
            id v78 = objc_getProperty((id)v13, v77, 56, 1);
            *(_DWORD *)buf = 138543618;
            id v107 = v78;
            __int16 v108 = 2050;
            uint64_t v109 = v12;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v75, OS_SIGNPOST_EVENT, v76, "RequestStatus", " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ", buf, 0x16u);
          }
          v79 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            id v95 = objc_getProperty((id)v13, v80, 56, 1);
            *(_DWORD *)buf = 138412802;
            id v107 = v95;
            __int16 v108 = 2114;
            uint64_t v109 = (uint64_t)v9;
            __int16 v110 = 2048;
            uint64_t v111 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "[%@] Canceling task: %{public}@ after receiving invalid status code: %ld", buf, 0x20u);
          }
          v82 = v81 = +[NSError errorWithDomain:@"AssetErrorDomain" code:v12 + 1000 userInfo:0];
          v83 = ASDErrorWithUnderlyingErrorAndDescription();
          objc_setProperty_atomic((id)v13, v84, v83, 40);

          (*((void (**)(id, void))v11 + 2))(v11, 0);
          goto LABEL_63;
      }
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
    else
    {
      id v33 = [v9 currentRequest];
      id v34 = sub_1003369E4(v33);

      if (!v34 || v12 == 206)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v13 + 88));
        id v47 = [WeakRetained progress];

        if (v47) {
          (*((void (**)(id, void, void, char *))v47 + 2))(v47, 0, *(void *)(v13 + 112), (char *)[v9 countOfBytesExpectedToReceive] + *(void *)(v13 + 112));
        }
        (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
      }
      else
      {
        v35 = ASDLogHandleForCategory();
        v36 = v35;
        os_signpost_id_t v37 = *(void *)(v13 + 128);
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
        {
          id v39 = objc_getProperty((id)v13, v38, 56, 1);
          *(_DWORD *)buf = 138543618;
          id v107 = v39;
          __int16 v108 = 2050;
          uint64_t v109 = v12;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_EVENT, v37, "ConsumerReset", " uuid=%{public, signpost.description:attribute}@  status=%{public, signpost.description:attribute}ld ", buf, 0x16u);
        }
        v40 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          id v92 = objc_getProperty((id)v13, v41, 56, 1);
          *(_DWORD *)buf = 138412802;
          id v107 = v92;
          __int16 v108 = 2114;
          uint64_t v109 = (uint64_t)v9;
          __int16 v110 = 2048;
          uint64_t v111 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "[%@] Resetting data consumer for task: %{public}@ after receiving status code: %ld", buf, 0x20u);
        }
        id v43 = objc_getProperty((id)v13, v42, 96, 1);
        v45 = v43;
        if (v43) {
          id v43 = objc_getProperty(v43, v44, 64, 1);
        }
        id v46 = v43;

        v101[0] = _NSConcreteStackBlock;
        v101[1] = 3221225472;
        v101[2] = sub_1003956B4;
        v101[3] = &unk_10052AC08;
        v101[4] = self;
        id v102 = v46;
        id v103 = (id)v13;
        id v104 = v9;
        id v105 = v11;
        id v47 = v46;
        [v47 truncateWithCompletionHandler:v101];
      }
    }
LABEL_63:

    goto LABEL_64;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v107 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Untracked task: %{public}@ canceling after receiving response", buf, 0xCu);
  }

  (*((void (**)(id, void))v11 + 2))(v11, 0);
LABEL_64:
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = sub_10023E1CC((uint64_t)AssetTaskInfo, v6);
  uint64_t v9 = v8;
  if (v8)
  {
    char v10 = *(unsigned char *)(v8 + 9);
    id v11 = ASDLogHandleForCategory();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v12)
      {
        id v29 = objc_getProperty((id)v9, v13, 56, 1);
        int v30 = 138412802;
        id v31 = v29;
        __int16 v32 = 2114;
        id v33 = v6;
        __int16 v34 = 2114;
        id v35 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%@] Retry scheduled for task: %{public}@ error: %{public}@", (uint8_t *)&v30, 0x20u);
      }
      id v23 = ASDLogHandleForCategory();
      id v21 = v23;
      os_signpost_id_t v24 = *(void *)(v9 + 128);
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        id v26 = objc_getProperty((id)v9, v25, 56, 1);
        id v27 = sub_100369AD0(v7);
        int v30 = 138543618;
        id v31 = v26;
        __int16 v32 = 2114;
        id v33 = v27;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, v24, "WillRetry", " uuid=%{public, signpost.description:attribute}@  error=%{public, signpost.description:attribute}@ ", (uint8_t *)&v30, 0x16u);
      }
    }
    else
    {
      if (v12)
      {
        id v28 = objc_getProperty((id)v9, v13, 56, 1);
        int v30 = 138412802;
        id v31 = v28;
        __int16 v32 = 2114;
        id v33 = v6;
        __int16 v34 = 2114;
        id v35 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%@] Canceling task: %{public}@ after cache request failed with error: %{public}@", (uint8_t *)&v30, 0x20u);
      }
      v14 = ASDLogHandleForCategory();
      id v15 = v14;
      os_signpost_id_t v16 = *(void *)(v9 + 128);
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        id v18 = objc_getProperty((id)v9, v17, 56, 1);
        v19 = sub_100369AD0(v7);
        int v30 = 138543618;
        id v31 = v18;
        __int16 v32 = 2114;
        id v33 = v19;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, v16, "CacheFail", " uuid=%{public, signpost.description:attribute}@  error=%{public, signpost.description:attribute}@ ", (uint8_t *)&v30, 0x16u);
      }
      *(void *)(v9 + 16) = 1;
      *(unsigned char *)(v9 + 9) = 1;
      id v21 = objc_getProperty((id)v9, v20, 136, 1);
      [v21 cancel];
    }
  }
  else
  {
    SEL v22 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v30 = 138543362;
      id v31 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Untracked task: %{public}@ canceling after will retry", (uint8_t *)&v30, 0xCu);
    }

    [v6 cancel];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = sub_10023E1CC((uint64_t)AssetTaskInfo, v7);
  char v10 = ASDLogHandleForCategory();
  id v11 = v10;
  if (v9)
  {
    os_signpost_id_t v12 = *(void *)(v9 + 128);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v12, "Download/Transfer", "", buf, 2u);
    }

    uint64_t v13 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_getProperty((id)v9, v14, 56, 1);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@] Completed task: %{public}@", buf, 0x16u);
    }
    if (!v8 || *(void *)(v9 + 16)) {
      goto LABEL_24;
    }
    double v17 = [v8 userInfo];
    id v18 = [v17 objectForKeyedSubscript:NSURLErrorBackgroundTaskCancelledReasonKey];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v18 integerValue] == (id)2)
    {
      SEL v20 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v77 = objc_getProperty((id)v9, v21, 56, 1);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v77;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%@] Restarting request after task cancelled due to insufficient system resources: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (*(unsigned char *)(v9 + 9))
      {
LABEL_21:
        id v24 = objc_getProperty((id)v9, v19, 40, 1);

        if (!v24)
        {
          SEL v25 = ASDErrorWithSafeUserInfo();
          objc_setProperty_atomic((id)v9, v26, v25, 40);
        }
        sub_100396F88((uint64_t)self, 3, (void *)v9);

LABEL_24:
        id v27 = objc_getProperty((id)v9, v16, 40, 1);
        id v28 = (id *)(id)v9;
        id v29 = v27;
        if (self)
        {
          int v30 = sub_1003DA6D4();
          unsigned __int8 v31 = [v30 isHRNMode];

          if ((v31 & 1) == 0)
          {
            id v32 = objc_alloc((Class)AMSMetricsLoadURLContext);
            id v34 = objc_getProperty(v28, v33, 136, 1);
            id v36 = objc_getProperty(v28, v35, 64, 1);
            id v37 = [v32 initWithTask:v34 metrics:v36];

            id v38 = sub_10030B11C();
            [v37 setBag:v38];

            [v37 setError:v29];
            id WeakRetained = objc_loadWeakRetained(v28 + 15);
            [v37 setSession:WeakRetained];

            v40 = +[AMSMetricsLoadURLEvent shouldCollectMetricsPromiseForContext:v37];
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = sub_100398A10;
            SEL v84 = &unk_10052AC80;
            v85 = v28;
            id v86 = v37;
            id v41 = v37;
            [v40 resultWithCompletion:buf];
          }
        }

        id Property = objc_getProperty(v28, v42, 96, 1);
        v45 = Property;
        if (Property) {
          id Property = objc_getProperty(Property, v44, 64, 1);
        }
        id v11 = Property;

        if (v8 && *(void *)(v9 + 16) != 2)
        {
          sub_100396F88((uint64_t)self, 4, v28);
          v79[0] = _NSConcreteStackBlock;
          v79[1] = 3221225472;
          v79[2] = sub_1003975E8;
          v79[3] = &unk_100521620;
          v79[4] = self;
          v65 = (id *)&v80;
          v80 = v28;
          [v11 suspendWithCompletionHandler:v79];
        }
        else
        {
          sub_100396F88((uint64_t)self, 2, v28);
          id v46 = v28;
          id v48 = v8;
          if (self)
          {
            v49 = objc_getProperty(v46, v47, 96, 1);
            os_signpost_id_t v50 = v49;
            if (v49 && v49[3])
            {
              id v78 = v7;
              v51 = objc_opt_new();
              id v52 = +[NSNumber numberWithInteger:v50[3]];
              [v51 setObject:v52 forKeyedSubscript:@"downloadSource"];

              v53 = +[NSNumber numberWithInteger:vcvtpd_s64_f64((double)(unint64_t)v50[11] / 1000.0)];
              [v51 setObject:v53 forKeyedSubscript:@"expectedContentLength"];

              v54 = +[NSNumber numberWithInteger:vcvtpd_s64_f64((double)(unint64_t)v46[3] / 1000.0)];
              [v51 setObject:v54 forKeyedSubscript:@"receivedContentLength"];

              v55 = +[NSNumber numberWithInteger:vcvtpd_s64_f64((double)(unint64_t)v46[14] / 1000.0)];
              [v51 setObject:v55 forKeyedSubscript:@"resumptionOffset"];

              SEL v56 = +[NSNumber numberWithInteger:vcvtpd_s64_f64((double)(unint64_t)v50[20] / 1000.0)];
              [v51 setObject:v56 forKeyedSubscript:@"contentRange"];

              v57 = +[NSNumber numberWithBool:(_BYTE)v46[1] & 1];
              [v51 setObject:v57 forKeyedSubscript:@"cacheServerLocated"];

              v58 = +[NSNumber numberWithBool:*((unsigned char *)v46 + 9) & 1];
              [v51 setObject:v58 forKeyedSubscript:@"cacheServerIgnored"];

              if (v8) {
                v59 = &__kCFBooleanFalse;
              }
              else {
                v59 = &__kCFBooleanTrue;
              }
              [v51 setObject:v59 forKeyedSubscript:@"success"];
              if (v8)
              {
                os_signpost_id_t v60 = sub_1003697F0(v48);
                [v51 setObject:v60 forKeyedSubscript:@"error"];
              }
              sub_10040E9A0((uint64_t)Analytics, v51, 31);

              id v7 = v78;
            }
          }
          id v62 = objc_getProperty(v46, v61, 56, 1);
          id v64 = objc_getProperty(v46, v63, 64, 1);
          +[QALogger linearDownloadWithLogKey:v62 metrics:v64 throughputMin:*((double *)v46 + 19) throughputMax:*((double *)v46 + 18)];

          v81[0] = _NSConcreteStackBlock;
          v81[1] = 3221225472;
          v81[2] = sub_10039701C;
          v81[3] = &unk_100521620;
          v81[4] = self;
          v65 = (id *)&v82;
          v82 = v46;
          [v11 finishWithCompletionHandler:v81];
        }

        sessions = self->_sessions;
        id v68 = objc_getProperty(v28, v67, 32, 1);
        os_signpost_id_t v69 = [(NSMutableDictionary *)sessions objectForKeyedSubscript:v68];
        uint64_t v70 = sub_10038D298(v69);

        id v71 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          id v73 = objc_getProperty(v28, v72, 56, 1);
          id v75 = objc_getProperty(v28, v74, 32, 1);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v73;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v75;
          *(_WORD *)&buf[22] = 2048;
          SEL v84 = (void *)v70;
          _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "[%@] Ended active task in session: %{public}@, now %llu active tasks.", buf, 0x20u);
        }
        goto LABEL_46;
      }
      SEL v22 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v76 = objc_getProperty((id)v9, v23, 56, 1);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v76;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[%@] Encountered failure while using local cache, restarting using original request: %{public}@", buf, 0x16u);
      }
      *(unsigned char *)(v9 + 9) = 1;
    }
    *(void *)(v9 + 16) = 1;
    goto LABEL_21;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Untracked task: %{public}@ completed with error: %{public}@", buf, 0x16u);
  }
LABEL_46:
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = sub_10023E1CC((uint64_t)AssetTaskInfo, v6);
  uint64_t v9 = ASDLogHandleForCategory();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      id v12 = objc_getProperty(v8, v11, 56, 1);
      *(_DWORD *)buf = 138412802;
      id v34 = v12;
      __int16 v35 = 2114;
      unint64_t v36 = (unint64_t)v6;
      __int16 v37 = 2114;
      id v38 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%@] Collected metrics for task: %{public}@ metrics: %{public}@", buf, 0x20u);
    }
    id v27 = v6;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id newValue = v7;
    uint64_t v13 = [v7 transactionMetrics];
    id v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v19 = sub_1003658D8(v18);
          if (v19)
          {
            SEL v20 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              id v22 = objc_getProperty(v8, v21, 56, 1);
              double v23 = (double)(8 * (uint64_t)[v18 countOfResponseBodyBytesReceived]);
              [v19 duration];
              *(_DWORD *)buf = 138412546;
              id v34 = v22;
              __int16 v35 = 2048;
              unint64_t v36 = (unint64_t)(v23 / v24);
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%@] Response body received speed: %{bitrate}llu", buf, 0x16u);
            }
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v15);
    }

    id v7 = newValue;
    objc_setProperty_atomic(v8, v25, newValue, 64);
    id v6 = v27;
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      id v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Untracked task: %{public}@ did finish collecting metrics", buf, 0xCu);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = (void (**)(id, uint64_t, void))a6;
  id v11 = sub_10023E1CC((uint64_t)AssetTaskInfo, v8);
  if (v11)
  {
    id v12 = [v9 protectionSpace];
    uint64_t v13 = [v12 authenticationMethod];
    if ([v13 isEqualToString:NSURLAuthenticationMethodClientCertificate])
    {
      id v14 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = objc_getProperty(v11, v15, 56, 1);
        *(_DWORD *)buf = 138412290;
        id v45 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@] Using client certificate for authentication challenge", buf, 0xCu);
      }
      v10[2](v10, 1, 0);
    }
    else if ([v13 isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
      CFErrorRef error = 0;
      BOOL v19 = SecTrustEvaluateWithError((SecTrustRef)[v12 serverTrust], &error);
      SEL v20 = ASDLogHandleForCategory();
      id v21 = v20;
      if (v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = objc_getProperty(v11, v22, 56, 1);
          *(_DWORD *)buf = 138412290;
          id v45 = v23;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%@] Using server trust for authentication challenge", buf, 0xCu);
        }
        double v24 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v12 serverTrust]);
        ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v24);
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v38 = objc_getProperty(v11, v36, 56, 1);
          *(_DWORD *)buf = 138412546;
          id v45 = v38;
          __int16 v46 = 2114;
          CFErrorRef v47 = error;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "[%@] Failing server trust for authentication challenge: %{public}@", buf, 0x16u);
        }
        v10[2](v10, 2, 0);
      }
      if (error) {
        CFRelease(error);
      }
    }
    else
    {
      SEL v25 = objc_getProperty(v11, v18, 96, 1);
      if (v25) {
        char v26 = v25[8] & 1;
      }
      else {
        char v26 = 0;
      }

      id v27 = ASDLogHandleForCategory();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v28)
        {
          id v30 = objc_getProperty(v11, v29, 56, 1);
          *(_DWORD *)buf = 138412290;
          id v45 = v30;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%@] Prompting user for authentication challenge", buf, 0xCu);
        }
        long long v31 = sub_100361C74([AuthenticationChallenge alloc], v9);
        id v32 = sub_1002CC610((uint64_t)AuthenticationChallengeDialogRequest, v31);
        id v33 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v32];
        id v34 = [v33 present];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100398288;
        v39[3] = &unk_100523558;
        id v40 = v11;
        id v41 = v31;
        SEL v42 = v10;
        __int16 v35 = v31;
        [v34 addFinishBlock:v39];
      }
      else
      {
        if (v28)
        {
          id v37 = objc_getProperty(v11, v29, 56, 1);
          *(_DWORD *)buf = 138412290;
          id v45 = v37;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%@] Prompting for authentication is not permitted", buf, 0xCu);
        }
        v10[2](v10, 2, 0);
      }
    }
  }
  else
  {
    double v17 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v45 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Untracked task: %{public}@ canceling after challenge", buf, 0xCu);
    }

    v10[2](v10, 2, 0);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _alternatePathAvailable:(int)a5
{
  id v6 = a4;
  id v7 = sub_10023E1CC((uint64_t)AssetTaskInfo, v6);
  if (v7)
  {
    id v8 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = objc_getProperty(v7, v9, 56, 1);
      int v26 = 138412802;
      id v27 = v10;
      __int16 v28 = 2114;
      id v29 = v6;
      __int16 v30 = 1024;
      int v31 = a5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%@] Task: %{public}@ has alternate path available: %u", (uint8_t *)&v26, 0x1Cu);
    }
    if (a5 == 3
      && (id v12 = objc_getProperty(v7, v11, 96, 1)) != 0
      && (char v13 = v12[9], v12, (v13 & 1) != 0))
    {
      id v16 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = objc_getProperty(v7, v17, 56, 1);
        int v26 = 138412546;
        id v27 = v18;
        __int16 v28 = 2114;
        id v29 = v6;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%@] Task: %{public}@ restarting to take advantage of alternate path", (uint8_t *)&v26, 0x16u);
      }
      v7[2] = 1;
      objc_setProperty_atomic(v7, v19, 0, 40);
      [v6 cancel];
    }
    else
    {
      id v14 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        BOOL v20 = a5 == 3;
        id v21 = objc_getProperty(v7, v15, 56, 1);
        id v23 = objc_getProperty(v7, v22, 96, 1);
        double v24 = v23;
        if (v23) {
          int v25 = *((unsigned char *)v23 + 9) & 1;
        }
        else {
          int v25 = 0;
        }
        int v26 = 138413058;
        id v27 = v21;
        __int16 v28 = 2114;
        id v29 = v6;
        __int16 v30 = 1024;
        int v31 = v20;
        __int16 v32 = 1024;
        int v33 = v25;
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%@] Task: %{public}@ has alternate path but we are ignorning it: recommended = %{BOOL}d, allow cellular = %{BOOL}d", (uint8_t *)&v26, 0x22u);
      }
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void (**)(id, void))a6;
  id v11 = sub_10023E1CC((uint64_t)AssetTaskInfo, v8);
  if (v11)
  {
    id v12 = ASDLogHandleForCategory();
    char v13 = v12;
    os_signpost_id_t v14 = v11[16];
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      id v16 = objc_getProperty(v11, v15, 56, 1);
      int v21 = 138543362;
      id v22 = v16;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, v14, "TaskConnecting", " uuid=%{public, signpost.description:attribute}@ ", (uint8_t *)&v21, 0xCu);
    }
    double v17 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = objc_getProperty(v11, v18, 56, 1);
      int v21 = 138412546;
      id v22 = v19;
      __int16 v23 = 2114;
      id v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%@] Task: %{public}@ will send request", (uint8_t *)&v21, 0x16u);
    }
    id v20 = v9;
  }
  else
  {
    double v17 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138543362;
      id v22 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Untracked task: %{public}@ canceling after established connection", (uint8_t *)&v21, 0xCu);
    }
    id v20 = 0;
  }

  ((void (**)(id, id))v10)[2](v10, v20);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

@end