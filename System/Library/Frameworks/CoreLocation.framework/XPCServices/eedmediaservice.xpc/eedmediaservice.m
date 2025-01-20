int main(int argc, const char **argv, const char **envp)
{
  CLEEDMediaService *v3;
  void *v4;

  v3 = objc_alloc_init(CLEEDMediaService);
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 activate];

  return 0;
}

id sub_100002090()
{
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  v0 = (void *)qword_10002A1D8;

  return v0;
}

void sub_1000055E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005610(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    v3 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      v6 = [v4 delayTimer];
      int v8 = 136446466;
      v9 = "-[CLEEDMediaServiceItem setupUploadTaskForSession:withRequest:resumeData:urlSessionError:]_block_invoke";
      __int16 v10 = 2114;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Delay Timer[%{public}@] fired, proceeding with UploadTask", (uint8_t *)&v8, 0x16u);
    }
    [WeakRetained cancelDelayTimer];
    [WeakRetained handleUploadTaskForSession:*(void *)(a1 + 40) withRequest:*(void *)(a1 + 48) resumeData:*(void *)(a1 + 56)];
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    v7 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100015994(a1, v7);
    }
  }
}

void sub_1000063B4(uint64_t a1)
{
  [*(id *)(a1 + 32) setUploadProgressFraction:(double)*(uint64_t *)(a1 + 56) / (double)*(uint64_t *)(a1 + 64)];
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  v2 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    v6 = *(void **)(a1 + 32);
    v7 = v2;
    [v6 uploadProgressFraction];
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 56);
    int v12 = 136447746;
    v13 = "-[CLEEDMediaServiceItem URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:]_block_invoke";
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    __int16 v16 = 2114;
    uint64_t v17 = v4;
    __int16 v18 = 2050;
    uint64_t v19 = v11;
    __int16 v20 = 2050;
    uint64_t v21 = v8;
    __int16 v22 = 2050;
    uint64_t v23 = v10;
    __int16 v24 = 2050;
    uint64_t v25 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s, Session:%{public}@, task:%{public}@, progressFraction:%{public}0.2lf, bytesSent:%{public}lld, totalBytesSent:%{public}lld, totalBytesExpectedToSend:%{public}lld", (uint8_t *)&v12, 0x48u);
  }
  v3 = [*(id *)(a1 + 32) mediaService];
  [v3 updateProgress];
}

void sub_100006668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_10000667C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    v3 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v19 = 136446979;
      __int16 v20 = "-[CLEEDMediaServiceItem URLSession:task:didCompleteWithError:]_block_invoke";
      __int16 v21 = 2113;
      uint64_t v22 = v4;
      __int16 v23 = 2114;
      uint64_t v24 = v5;
      __int16 v25 = 2114;
      uint64_t v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Session:%{private}@, task:%{public}@, error:%{public}@", (uint8_t *)&v19, 0x2Au);
    }
    if (!*(void *)(a1 + 48))
    {
      uint64_t v11 = [WeakRetained mediaItem];
      int v12 = [*(id *)(a1 + 40) response];
      uint64_t v13 = *(void *)(a1 + 48);
      goto LABEL_11;
    }
    v7 = [WeakRetained mediaService];
    unsigned __int8 v8 = [v7 sessionInvalidated];

    if ((v8 & 1) == 0)
    {
      NSErrorDomain v9 = [*(id *)(a1 + 48) domain];
      NSErrorDomain v10 = v9;
      if (v9 != NSURLErrorDomain)
      {

LABEL_15:
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v11 = [*(id *)(a1 + 40) originalRequest];
        int v12 = [*(id *)(a1 + 48) userInfo];
        __int16 v18 = [v12 objectForKeyedSubscript:NSURLSessionUploadTaskResumeData];
        [WeakRetained setupUploadTaskForSession:v17 withRequest:v11 resumeData:v18 urlSessionError:*(void *)(a1 + 48)];

        goto LABEL_16;
      }
      id v14 = [*(id *)(a1 + 48) code];

      if (v14 != (id)-999) {
        goto LABEL_15;
      }
      uint64_t v15 = [*(id *)(a1 + 56) mediaService];
      unsigned int v16 = [v15 delayRequired];

      uint64_t v11 = [WeakRetained mediaItem];
      int v12 = [*(id *)(a1 + 40) response];
      uint64_t v13 = *(void *)(a1 + 48);
      if (v16)
      {
        [WeakRetained handleUploadTaskDelayForItem:v11 response:v12 error:v13];
        goto LABEL_16;
      }
LABEL_11:
      [WeakRetained handleUploadTaskCompletionForItem:v11 response:v12 error:v13];
LABEL_16:
    }
  }
}

void sub_100006A2C(uint64_t a1)
{
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  v2 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v8 = 136446979;
    NSErrorDomain v9 = "-[CLEEDMediaServiceItem URLSession:task:didReceiveChallenge:completionHandler:]_block_invoke";
    __int16 v10 = 2114;
    uint64_t v11 = v3;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    __int16 v14 = 2113;
    uint64_t v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Session:%{public}@, task:%{public}@, challenge:%{private}@", (uint8_t *)&v8, 0x2Au);
  }
  id v6 = +[CLEEDRequestHelper validateServerCertificateChallenge:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if (v6 != (id)1)
  {
    v7 = [*(id *)(a1 + 56) mediaItem];
    [v7 setServerUploadStatus:v6];
  }
}

id sub_10000717C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) startContinuousProcessingTask:a2];
}

void sub_100007DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007E24(id a1)
{
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLEEDMediaServiceProtocol];
  id v6 = (void *)qword_10002A1C0;
  qword_10002A1C0 = v5;

  [(id)qword_10002A1C0 setClasses:v9 forSelector:"processMediaServicesForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:mediaList:mitigation:completion:" argumentIndex:6 ofReply:0];
  [(id)qword_10002A1C0 setClasses:v9 forSelector:"processMediaServicesMitigations:" argumentIndex:0 ofReply:0];
  [(id)qword_10002A1C0 setClasses:v9 forSelector:"connectToMediaService:uploadConfig:" argumentIndex:0 ofReply:0];
  uint64_t v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLEEDMediaServiceDelegate];
  int v8 = (void *)qword_10002A1C8;
  qword_10002A1C8 = v7;
}

void sub_100007F7C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    uint64_t v2 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = v2;
      uint64_t v4 = +[NSXPCConnection currentConnection];
      int v5 = 136446466;
      id v6 = "-[CLEEDMediaService listener:shouldAcceptNewConnection:]_block_invoke";
      __int16 v7 = 2114;
      int v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Client connection[%{public}@] invalidated", (uint8_t *)&v5, 0x16u);
    }
    WeakRetained[129] = 1;
    [WeakRetained cleanupOnInvalidation];
  }
}

void sub_1000080A8(id a1)
{
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  uint64_t v1 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
    sub_100015E9C(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void sub_100008968(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    uint64_t v3 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40);
      int v5 = 136446466;
      uint64_t v6 = "-[CLEEDMediaService setDebounceTimerForReleasingOSTransaction]_block_invoke";
      __int16 v7 = 2114;
      uint64_t v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Timer[%{public}@] fired, proceeding with releasing OS Transaction", (uint8_t *)&v5, 0x16u);
    }
    [WeakRetained cancelDebounceTimerForReleasingOSTransaction];
    [WeakRetained clearCache];
    [WeakRetained sendCompletionIndication];
    [WeakRetained releaseOSTransaction];
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_10001616C();
    }
  }
}

void sub_100008E4C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[12];
  id v4 = a2;
  objc_msgSend(v2, "handleRemoteProxyError:forProcessIdentifier:", v4, objc_msgSend(v3, "processIdentifier"));
}

void sub_100009D70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [*((id *)WeakRetained + 22) frontmostCall];
    int v5 = v4;
    if (!v4) {
      goto LABEL_9;
    }
    uint64_t v6 = [v4 callUUID];
    __int16 v7 = [*(id *)(a1 + 32) mediaRequest];
    uint64_t v8 = [v7 callUUID];
    unsigned int v9 = [v6 isEqualToString:v8];

    if (v9)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      __int16 v10 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void **)(a1 + 32);
        __int16 v12 = v10;
        uint64_t v13 = [v11 mediaItem];
        __int16 v14 = [v13 assetIdentifier];
        uint64_t v15 = [*(id *)(a1 + 32) mediaItem];
        int v43 = 136446723;
        v44 = "-[CLEEDMediaService updateCallRecordForMediaServiceItem:]_block_invoke";
        __int16 v45 = 2113;
        v46 = v14;
        __int16 v47 = 1026;
        unsigned int v48 = [v15 type];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Adding media item to current call,assetID,%{private}@,mediaType,%{public}d", (uint8_t *)&v43, 0x1Cu);
      }
      unsigned int v16 = [*(id *)(a1 + 32) mediaItem];
      id v17 = [v16 type];

      BOOL v18 = v17 == (id)2;
      sub_1000181E0(v19);
      id v21 = objc_alloc(*(Class *)(v20 + 1112));
      uint64_t v22 = [*(id *)(a1 + 32) mediaItem];
      __int16 v23 = [v22 assetIdentifier];
      id v24 = [v21 initWithAssetId:v23 mediaType:v18];

      __int16 v25 = [v5 emergencyMediaItems];
      uint64_t v26 = +[NSMutableSet setWithSet:v25];

      [v26 addObject:v24];
      [v5 setEmergencyMediaItems:v26];
    }
    else
    {
LABEL_9:
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      v27 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(void **)(a1 + 32);
        v29 = v27;
        v30 = [v28 mediaItem];
        v31 = [v30 assetIdentifier];
        v32 = [*(id *)(a1 + 32) mediaItem];
        int v43 = 136446723;
        v44 = "-[CLEEDMediaService updateCallRecordForMediaServiceItem:]_block_invoke";
        __int16 v45 = 2113;
        v46 = v31;
        __int16 v47 = 1026;
        unsigned int v48 = [v32 type];
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Adding media item to call history,assetID,%{private}@,mediaType,%{public}d", (uint8_t *)&v43, 0x1Cu);
      }
      v33 = [*(id *)(a1 + 32) mediaItem];
      id v34 = [v33 type];

      BOOL v35 = v34 == (id)2;
      sub_100018204(v36);
      id v38 = objc_alloc(*(Class *)(v37 + 832));
      v39 = [*(id *)(a1 + 32) mediaItem];
      v40 = [v39 assetIdentifier];
      id v24 = [v38 initWithAssetId:v40 mediaType:v35];

      v41 = (void *)v3[23];
      uint64_t v26 = [*(id *)(a1 + 32) mediaRequest];
      v42 = [v26 callUUID];
      [v41 updateEmergencyMediaItemFor:v42 with:v24];
    }
  }
}

void sub_10000A604(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && ![WeakRetained abortRequested])
  {
    int v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 mediaItem];
    id v9 = 0;
    __int16 v7 = [v5 encryptMediaItem:v6 returnedAuthTag:&v9];
    id v8 = v9;

    [v3 handleEncryptionCompletionForServiceItem:*(void *)(a1 + 32) encryptedFileURL:v7 authTag:v8];
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v4 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v11 = "-[CLEEDMediaService triggerAllProcessing]_block_invoke";
      __int16 v12 = 2114;
      uint64_t v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, self[%{public}@] or abort requested, early return.", buf, 0x16u);
    }
  }
}

void sub_10000AE2C(uint64_t a1, uint64_t a2)
{
  id v4 = +[NSDate date];
  int v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [*(id *)(a1 + 40) copyMediaItemToStaging:v5];
  if ([v5 uploadStatus] == (id)1)
  {
    [v4 timeIntervalSinceNow];
    [v5 setDurationCopyMs:(uint64_t)(fabs(v6) * 1000.0)];
  }
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  __int16 v7 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    unsigned int v16 = [v5 mediaItemID];
    id v9 = [v16 UUIDString];
    id v10 = [v9 UTF8String];
    id v11 = [v5 uploadStatus];
    id v12 = [v5 durationCopyMs];
    uint64_t v13 = [v5 URL];
    [v13 path];
    __int16 v14 = v4;
    id v15 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136447491;
    BOOL v18 = "-[CLEEDMediaService copyAndCreateServiceItemsForRequest:]_block_invoke";
    __int16 v19 = 2050;
    uint64_t v20 = a2;
    __int16 v21 = 2081;
    id v22 = v10;
    __int16 v23 = 2050;
    id v24 = v11;
    __int16 v25 = 2050;
    id v26 = v12;
    __int16 v27 = 2081;
    id v28 = [v15 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, iteration:%{public}zu, mediaItemID:%{private}s, status:%{public}ld, copyDuration:%{public}ld, url:%{private}s", buf, 0x3Eu);

    id v4 = v14;
  }
}

void sub_10000B4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_10000B540(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained abortRequested])
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      double v6 = qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v7 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136446466;
        v52 = "-[CLEEDMediaService copyMediaItemToStaging:]_block_invoke";
        __int16 v53 = 2114;
        id v54 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, copy aborted for mediaItem:%{public}@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) setUploadStatus:7];
    }
    else
    {
      unsigned int v48 = v3;
      id v8 = +[NSUUID UUID];
      id v9 = (id *)(a1 + 32);
      [*(id *)(a1 + 32) setMediaItemID:v8];

      id v10 = [@"/private/var/mobile/Library/CLEEDMediaService/" UTF8String];
      id v11 = [*(id *)(a1 + 32) mediaItemID];
      id v12 = [v11 UUIDString];
      id v13 = [v12 UTF8String];
      __int16 v14 = [*(id *)(a1 + 32) URL];
      id v15 = [v14 pathExtension];
      unsigned int v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s%s.%s", v10, v13, [v15 UTF8String]);

      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      id v3 = v48;
      id v17 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG)) {
        sub_100016AB0(v17, (uint64_t)v48, v16);
      }
      BOOL v18 = +[NSFileManager defaultManager];
      __int16 v19 = [v48 path];
      id v50 = 0;
      unsigned __int8 v20 = [v18 copyItemAtPath:v19 toPath:v16 error:&v50];
      id v21 = v50;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v20;

      if (v21)
      {
        if (qword_10002A1E0 != -1) {
          dispatch_once(&qword_10002A1E0, &stru_100024738);
        }
        if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
          sub_100016A30();
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      }
      else
      {
        id v22 = +[NSFileManager defaultManager];
        unsigned __int8 v23 = [v22 fileExistsAtPath:v16];

        if (v23)
        {
          id v24 = [objc_alloc((Class)NSURL) initWithString:v16];
          [*v9 setStagingURL:v24];

          id v25 = objc_alloc((Class)NSString);
          id v26 = [v16 pathExtension];
          id v27 = [v25 initWithString:v26];
          [*v9 setMediaItemFormat:v27];

          id v28 = +[NSFileManager defaultManager];
          v29 = [*v9 stagingURL];
          v30 = [v29 path];
          id v49 = 0;
          v31 = [v28 attributesOfItemAtPath:v30 error:&v49];
          id v32 = v49;
          id v33 = [v31 fileSize];

          __int16 v47 = v32;
          if (!v32) {
            [*v9 setOriginalSizeBytes:v33];
          }
          double v34 = (double)(uint64_t)[*(id *)(*(void *)(a1 + 40) + 120) maxUploadFileSizeMB] * 1048576.0;
          BOOL v35 = *(void **)(a1 + 32);
          if (v34 >= (double)(uint64_t)v33)
          {
            [v35 setUploadStatus:1];
            id v3 = v48;
            id v21 = 0;
          }
          else
          {
            [v35 setUploadStatus:9];
            double v36 = [*v9 stagingURL];
            uint64_t v37 = [v36 path];
            +[CLEEDMediaService deleteFileAtPath:v37];

            id v3 = v48;
            id v21 = 0;
            if (qword_10002A1E0 != -1) {
              dispatch_once(&qword_10002A1E0, &stru_100024738);
            }
            id v38 = (void *)qword_10002A1D8;
            if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
              sub_100016884((id *)(a1 + 32), v38);
            }
          }
          if (qword_10002A1E0 != -1) {
            dispatch_once(&qword_10002A1E0, &stru_100024738);
          }
          v40 = (void *)qword_10002A1D8;
          if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
          {
            id v41 = *v9;
            v42 = v40;
            int v43 = [v41 stagingURL];
            id v44 = [v43 path];
            id v45 = [v44 UTF8String];
            *(_DWORD *)buf = 136446467;
            v52 = "-[CLEEDMediaService copyMediaItemToStaging:]_block_invoke";
            __int16 v53 = 2081;
            id v54 = v45;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, copy to staging successful for mediaItem:%{private}s", buf, 0x16u);
          }
        }
        else
        {
          if (qword_10002A1E0 != -1) {
            dispatch_once(&qword_10002A1E0, &stru_100024738);
          }
          v39 = (void *)qword_10002A1D8;
          if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
            sub_100016984(v16, v39);
          }
          [*v9 setUploadStatus:2];
        }
        if (sandbox_extension_release())
        {
          if (qword_10002A1E0 != -1) {
            dispatch_once(&qword_10002A1E0, &stru_100024738);
          }
          v46 = (void *)qword_10002A1D8;
          if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
            sub_1000167E0(v46);
          }
        }
      }
    }
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100016768();
    }
  }
}

int64_t sub_10000C4A0(id a1, id a2, id a3)
{
  return (int64_t)[a2 compareMediaSize:a3];
}

void sub_10000C5C4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (!WeakRetained || [WeakRetained abortRequested])
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v4 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 136446466;
      id v41 = "-[CLEEDMediaService handleEncryptionCompletionForServiceItem:encryptedFileURL:authTag:]_block_invoke";
      __int16 v42 = 2114;
      int v43 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, self[%{public}@] or abort requested, early return.", (uint8_t *)&v40, 0x16u);
    }
    goto LABEL_30;
  }
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  int v5 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v7 = *(id **)(a1 + 32);
    double v6 = *(void **)(a1 + 40);
    id v8 = v5;
    id v9 = [v6 path];
    id v10 = [v9 UTF8String];
    id v11 = [*(id *)(a1 + 48) base64EncodedStringWithOptions:0];
    int v40 = 136446979;
    id v41 = "-[CLEEDMediaService handleEncryptionCompletionForServiceItem:encryptedFileURL:authTag:]_block_invoke";
    __int16 v42 = 2114;
    int v43 = v7;
    __int16 v44 = 2081;
    id v45 = v10;
    __int16 v46 = 2081;
    id v47 = [v11 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, mediaServiceItem:%{public}@, encryptedURL:%{private}s, authTag:%{private}s", (uint8_t *)&v40, 0x2Au);
  }
  id v12 = (id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 48);
  __int16 v14 = [*(id *)(a1 + 32) mediaItem];
  [v14 setAuthTag:v13];

  uint64_t v15 = *(void *)(a1 + 40);
  unsigned int v16 = [*(id *)(a1 + 32) mediaItem];
  [v16 setEncryptedFileURL:v15];

  id v17 = [*(id *)(a1 + 32) mediaItem];
  uint64_t v18 = [v17 encryptedFileURL];
  if (!v18)
  {

    goto LABEL_16;
  }
  __int16 v19 = (void *)v18;
  unsigned __int8 v20 = [*v12 mediaItem];
  id v21 = [v20 authTag];

  if (!v21)
  {
LABEL_16:
    id v26 = [*v12 mediaItem];
    [v26 setUploadStatus:4];

    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v27 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100016C60(a1 + 32, v27);
    }
    id v28 = [*v12 mediaRequest];
    v29 = [*v12 mediaItem];
    id v30 = [v28 updateQueueForProcessedMediaItem:v29];

    if (!v30)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      v31 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = *v12;
        id v33 = v31;
        double v34 = [v32 mediaRequest];
        BOOL v35 = [v34 requestID];
        int v40 = 136446466;
        id v41 = "-[CLEEDMediaService handleEncryptionCompletionForServiceItem:encryptedFileURL:authTag:]_block_invoke";
        __int16 v42 = 2114;
        int v43 = v35;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, All media items processed for requestID:%{public}@", (uint8_t *)&v40, 0x16u);
      }
    }
    [v3[10] addObject:*v12];
    double v36 = [*v12 mediaItem];
    [v3 submitCAMetricForUploadItem:v36];
    goto LABEL_28;
  }
  id v22 = [*(id *)(a1 + 32) mediaItem];
  [v22 setUploadStatus:3];

  unsigned int v23 = [*(id *)(a1 + 56) delayRequired];
  id v24 = *(void **)(a1 + 56);
  uint64_t v25 = *(void *)(a1 + 32);
  if (v23) {
    [v24 handleDelayForMediaServiceItem:v25];
  }
  else {
    [v24 insertMediaServiceItemInUploadList:v25];
  }
  double v36 = [*v12 timestampEncryptionStart];
  [v36 timeIntervalSinceNow];
  uint64_t v38 = (uint64_t)(fabs(v37) * 1000.0);
  v39 = [*v12 mediaItem];
  [v39 setDurationEncryptionMs:v38];

LABEL_28:
  [v3[7] removeObject:*(void *)(a1 + 32)];
  [v3 storeDataToCache];
  if (([*(id *)(a1 + 56) delayRequired] & 1) == 0) {
    [v3 processNextInFlightServiceItem];
  }
LABEL_30:
}

id sub_10000D0EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) processNextInFlightServiceItem];
}

void sub_10000D660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_10000D694(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    if ([WeakRetained abortRequested])
    {
      int v5 = [v4 mediaItem];
      id v6 = [v5 uploadStatus];

      if (v6 != (id)5)
      {
        __int16 v7 = [v4 mediaItem];
        [v7 setUploadStatus:7];
      }
    }
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v8 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      id v10 = [v4 mediaItem];
      id v11 = [v10 mediaItemID];
      id v12 = [v11 UUIDString];
      id v13 = [v12 UTF8String];
      __int16 v14 = [v4 mediaRequest];
      uint64_t v15 = [v14 requestID];
      int v28 = 136446722;
      v29 = "-[CLEEDMediaService triggerUploadForServiceItem:]_block_invoke";
      __int16 v30 = 2082;
      id v31 = v13;
      __int16 v32 = 2114;
      id v33 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Completion called for mediaID:%{public}s, requestID:%{public}@", (uint8_t *)&v28, 0x20u);
    }
    if ([WeakRetained delayRequired]
      && ([v4 mediaItem],
          unsigned int v16 = objc_claimAutoreleasedReturnValue(),
          id v17 = [v16 uploadStatus],
          v16,
          v17 != (id)5))
    {
      [v4 setTimestampUploadStart:0];
      [WeakRetained handleDelayForMediaServiceItem:v4];
    }
    else
    {
      uint64_t v18 = [v4 mediaRequest];
      __int16 v19 = [v4 mediaItem];
      id v20 = [v18 updateQueueForProcessedMediaItem:v19];

      if (!v20)
      {
        if (qword_10002A1E0 != -1) {
          dispatch_once(&qword_10002A1E0, &stru_100024738);
        }
        id v21 = (void *)qword_10002A1D8;
        if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = v21;
          unsigned int v23 = [v4 mediaRequest];
          id v24 = [v23 requestID];
          int v28 = 136446466;
          v29 = "-[CLEEDMediaService triggerUploadForServiceItem:]_block_invoke";
          __int16 v30 = 2114;
          id v31 = v24;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, All media items processed for requestID:%{public}@", (uint8_t *)&v28, 0x16u);
        }
      }
      uint64_t v25 = [v4 mediaItem];
      [WeakRetained submitCAMetricForUploadItem:v25];

      [WeakRetained[10] addObject:v4];
    }
    [WeakRetained storeDataToCache];
    id v26 = [v4 mediaItem];
    id v27 = [v26 uploadStatus];

    if (v27 == (id)5) {
      [WeakRetained updateCallRecordForMediaServiceItem:v4];
    }
    [WeakRetained[11] removeObject:v4];
  }
  [WeakRetained updateProgress];
  [WeakRetained processNextInFlightServiceItem];
}

void sub_10000E8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_10000E8DC(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    int v5 = [WeakRetained getQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E9C8;
    block[3] = &unk_1000245A0;
    objc_copyWeak(&v9, v2);
    dispatch_async(v5, block);

    objc_destroyWeak(&v9);
  }
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  __int16 v7 = v6;
  if (v6) {
    [v6 setTaskCompletedWithSuccess:0];
  }
}

void sub_10000E9C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[169] = 1;
  [WeakRetained abortMediaUpload];
  uint64_t v1 = (void *)*((void *)WeakRetained + 18);
  *((void *)WeakRetained + 18) = 0;

  uint64_t v2 = (void *)*((void *)WeakRetained + 20);
  *((void *)WeakRetained + 20) = 0;

  *((_DWORD *)WeakRetained + 38) = 0;
}

void sub_10000ECEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v3 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 136);
      int v9 = 136446466;
      id v10 = "-[CLEEDMediaService checkAndStartBGTaskStartGuardTimer]_block_invoke";
      __int16 v11 = 2114;
      uint64_t v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Timer[%{public}@] fired, fallback handling has kicked in.", (uint8_t *)&v9, 0x16u);
    }
    [WeakRetained cancelBGTaskStartGuardTimer];
    double v6 = sub_100018174(v5);
    id v8 = objc_msgSend(*(id *)(v7 + 824), "sharedScheduler", v6);
    [v8 cancelTaskRequestWithIdentifier:@"com.corelocation.eedmediaservice.progress"];

    *(unsigned char *)(*(void *)(a1 + 32) + 155) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 168) = 1;
    [*(id *)(a1 + 32) triggerAllProcessing];
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100016F4C();
    }
  }
}

void sub_10000F684(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setProgressUITaskCompletion];
    id WeakRetained = v2;
  }
}

void sub_100013854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013878(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100013888(uint64_t a1)
{
}

id sub_100013890(uint64_t a1)
{
  return *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
}

void sub_100014980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000149A4(uint64_t a1)
{
  return *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
}

void sub_100014B10(id a1)
{
  qword_10002A1D8 = (uint64_t)os_log_create("com.apple.locationd.eedmediaservice", "EmergencyMS");

  _objc_release_x1();
}

void sub_100014B54(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100014B90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100014BA8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100014BDC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t sub_100014BF8()
{
  return v0;
}

uint64_t sub_100014C54()
{
  return v0;
}

void sub_100014C64(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

uint64_t sub_100014C7C()
{
  return v0;
}

void sub_100014C88(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014D00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014D78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014DF0(void *a1)
{
  id v2 = a1;
  objc_msgSend((id)sub_100014C54(), "base64EncodedStringWithOptions:");
  id v3 = objc_claimAutoreleasedReturnValue();
  [v3 UTF8String];
  sub_100014B84();
  sub_100014BA8((void *)&_mh_execute_header, v4, v5, "#EED2EMS,%{public}s, Device key confirmation tag:%{private}s", v6, v7, v8, v9, 3u);
}

void sub_100014E9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014B54((void *)&_mh_execute_header, a1, a3, "#EED2EMS,%{public}s,nil derivedKey or derivedIV,early return", a5, a6, a7, a8, 2u);
}

void sub_100014F14(void *a1)
{
  id v2 = a1;
  objc_msgSend((id)sub_100014C54(), "base64EncodedStringWithOptions:");
  id v3 = objc_claimAutoreleasedReturnValue();
  [v3 UTF8String];
  sub_100014B84();
  sub_100014BA8((void *)&_mh_execute_header, v4, v5, "#EED2EMS,%{public}s, Shared info:%{private}s", v6, v7, v8, v9, 3u);
}

void sub_100014FC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014B54((void *)&_mh_execute_header, a1, a3, "#EED2EMS,%{public}s,one or more input parameters is nil,early return", a5, a6, a7, a8, 2u);
}

void sub_100015038()
{
  v2[0] = 136446466;
  sub_100014B70();
  sub_100014B90((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, MediaItem not found in pendingQueue, item:%{public}@", (uint8_t *)v2);
}

void sub_1000150B0()
{
  v2[0] = 136446466;
  sub_100014B70();
  sub_100014B90((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, MediaItem not found in pendingQueue, item:%{public}@", (uint8_t *)v2);
}

void sub_100015128(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 72);
  id v9 = a2;
  id v10 = [(id)sub_100014C7C() count];
  id v11 = [*(id *)(a1 + 88) count];
  id v12 = [*(id *)(a1 + 96) count];
  id v13 = [*(id *)(a1 + 104) count];
  *(_DWORD *)buf = 136449283;
  uint64_t v18 = "-[CLEEDMediaServiceRequest encodeWithCoder:]";
  __int16 v19 = 2114;
  uint64_t v20 = v4;
  __int16 v21 = 2114;
  uint64_t v22 = v6;
  __int16 v23 = 2114;
  uint64_t v24 = v5;
  __int16 v25 = 2114;
  uint64_t v26 = v7;
  __int16 v27 = 2113;
  uint64_t v28 = v8;
  __int16 v29 = 2113;
  uint64_t v30 = v14;
  __int16 v31 = 2113;
  uint64_t v32 = v15;
  __int16 v33 = 2113;
  uint64_t v34 = v16;
  __int16 v35 = 2050;
  id v36 = v10;
  __int16 v37 = 2050;
  id v38 = v11;
  __int16 v39 = 2050;
  id v40 = v12;
  __int16 v41 = 2050;
  id v42 = v13;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s[requestID:%{public}@,uploadURL:%{public}@,callUUID:%{public}@,requestTimestamp:%{public}@,sharedInfoPrefix:%{private}@,combinedSecret:%{private}@,deviceKeyConfirmation:%{private}@,Token:%{private}@,numFiltered:%{public}lu,numPending:%{public}lu,numDelayed:%{public}lu,numCompleted:%{public}lu]", buf, 0x84u);
}

void sub_1000152A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015318(void *a1)
{
  id v2 = a1;
  objc_msgSend((id)sub_100014C54(), "base64EncodedStringWithOptions:");
  id v3 = objc_claimAutoreleasedReturnValue();
  [v3 UTF8String];
  sub_100014B84();
  sub_100014BA8((void *)&_mh_execute_header, v4, v5, "#EED2EMS,%{public}s, Shared info:%{private}s", v6, v7, v8, v9, 3u);
}

void sub_1000153C4()
{
  v2[0] = 136446466;
  sub_100014B70();
  sub_100014B90((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, Failure while generating Media Encryption Key for mediaItem:%{public}@", (uint8_t *)v2);
}

void sub_10001543C(NSObject *a1)
{
  id v2 = __error();
  strerror(*v2);
  int v4 = 136446466;
  uint64_t v5 = "-[CLEEDMediaServiceItem encryptMediaItem:returnedAuthTag:]";
  sub_100014B84();
  sub_100014B90((void *)&_mh_execute_header, a1, v3, "#EED2EMS,%{public}s, Unable to open media file for reading:%{public}s", (uint8_t *)&v4);
}

void sub_1000154D8(NSObject *a1)
{
  id v2 = __error();
  strerror(*v2);
  int v4 = 136446466;
  uint64_t v5 = "-[CLEEDMediaServiceItem encryptMediaItem:returnedAuthTag:]";
  sub_100014B84();
  sub_100014B90((void *)&_mh_execute_header, a1, v3, "#EED2EMS,%{public}s, Unable to open media file for writing:%{public}s", (uint8_t *)&v4);
}

void sub_100015574()
{
  sub_100014BC8();
  sub_100014BDC((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, Failed to finalize encryption, code:%{public}d", v2, v3, v4, v5, 2u);
}

void sub_1000155E8()
{
  sub_100014BC8();
  sub_100014BDC((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, Failed to encrypt chunk, code:%{public}d", v2, v3, v4, v5, 2u);
}

void sub_10001565C()
{
  int v1 = 136446722;
  uint64_t v2 = "-[CLEEDMediaServiceItem encryptMediaItem:returnedAuthTag:]";
  sub_100014B84();
  __int16 v3 = 1026;
  int v4 = 0x100000;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#EED2EMS,%{public}s, Unexpected read size:%{public}zu > than maxChunk:%{public}d", (uint8_t *)&v1, 0x1Cu);
}

void sub_1000156F4()
{
  sub_100014BC8();
  sub_100014BDC((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, Failed to read file,error code:%{public}d", v2, v3, v4, v5, 2u);
}

void sub_100015768()
{
  sub_100014BC8();
  sub_100014BDC((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, Failed to set cryptor IV with code:%{public}d", v2, v3, v4, v5, 2u);
}

void sub_1000157DC()
{
  sub_100014BC8();
  sub_100014BDC((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, Cryptor initialization failed with code:%{public}d", v2, v3, v4, v5, 2u);
}

void sub_100015850(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100014BF8() stagingURL];
  id v4 = [v3 absoluteString];
  [v4 UTF8String];
  int v6 = 136446467;
  uint64_t v7 = "-[CLEEDMediaServiceItem encryptMediaItem:returnedAuthTag:]";
  sub_100014B84();
  sub_100014B90((void *)&_mh_execute_header, v1, v5, "#EED2EMS,%{public}s, Media file does not exist:%{private}s", (uint8_t *)&v6);
}

void sub_10001591C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015994(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)sub_100014BF8() delayTimer];
  v6[0] = 136446466;
  sub_100014B70();
  sub_100014B90((void *)&_mh_execute_header, v2, v5, "#EED2EMS,%{public}s, Delay Timer[%{public}@] fired, but weakSelf is nil, returning", (uint8_t *)v6);
}

void sub_100015A38(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100014BF8() delayTimer];
  sub_100014B70();
  sub_100014BA8((void *)&_mh_execute_header, v4, v5, "#EED2EMS,%{public}s, cancelling timer[%{public}@]", v6, v7, v8, v9, 2u);
}

void sub_100015AD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015B4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015BC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015C3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015CB4(os_log_t log)
{
  int v1 = 136446210;
  id v2 = "-[CLEEDMediaService getMediaServiceRequestWithID:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s", (uint8_t *)&v1, 0xCu);
}

void sub_100015D38(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 executablePathOfConnection:a3];
  v8[0] = 136446466;
  sub_100014B70();
  sub_100014B90((void *)&_mh_execute_header, v5, v7, "#EED2EMS,%{public}s, process[%{public}@] not in allowlist, exiting", (uint8_t *)v8);
}

void sub_100015DF4(void *a1, void *a2)
{
  id v3 = a1;
  [a2 processIdentifier];
  v4[0] = 136446466;
  sub_100014BC8();
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#EED2EMS,%{public}s, client[%{public}d] missing entitlement, exiting", (uint8_t *)v4, 0x12u);
}

void sub_100015E9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015F14(void *a1, void *a2, int a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 localizedDescription];
  uint64_t v7 = [a2 localizedFailureReason];
  int v8 = 136446978;
  uint64_t v9 = "-[CLEEDMediaService handleRemoteProxyError:forProcessIdentifier:]";
  __int16 v10 = 1026;
  int v11 = a3;
  __int16 v12 = 2114;
  id v13 = v6;
  __int16 v14 = 2114;
  uint64_t v15 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#EED2EMS,%{public}s, [%{public}d]: %{public}@ %{public}@\n", (uint8_t *)&v8, 0x26u);
}

void sub_100016004(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 200);
  uint64_t v4 = a2;
  id v5 = [v3 count];
  uint64_t v6 = *(void *)(a1 + 208);
  BOOL v7 = *(unsigned char *)(a1 + 192) == 0;
  int v9 = 136446978;
  __int16 v10 = "-[CLEEDMediaService encodeWithCoder:]";
  if (v7) {
    int v8 = "NO";
  }
  else {
    int v8 = "YES";
  }
  __int16 v11 = 2050;
  id v12 = v5;
  __int16 v13 = 2082;
  __int16 v14 = v8;
  __int16 v15 = 2050;
  uint64_t v16 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s[numRequests:%{public}lu, extendedSessionEnded:%{public}s, totalBytesUploadedInCall:%{public}ld]", (uint8_t *)&v9, 0x2Au);
}

void sub_1000160F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001616C()
{
  v2[0] = 136446466;
  sub_100014C04();
  sub_100014B90((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, Timer[%{public}@] fired, but weakSelf is nil, returning", (uint8_t *)v2);
}

void sub_1000161EC()
{
  v1[0] = 136446466;
  sub_100014C04();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s, cancelling timer[%{public}@]", (uint8_t *)v1, 0x16u);
}

void sub_100016270()
{
  int v1 = 136446467;
  id v2 = "-[CLEEDMediaService connectToMediaService:uploadConfig:]";
  sub_100014B84();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s, Files:%{private}@", (uint8_t *)&v1, 0x16u);
}

void sub_1000162F8(void *a1)
{
  int v1 = a1;
  [@"/private/var/mobile/Library/CLEEDMediaService/" UTF8String];
  v3[0] = 136446723;
  sub_100014C18();
  sub_100014C64((void *)&_mh_execute_header, v1, v2, "#EED2EMS,%{public}s, Error creating Directory:%{private}s, error:%{public}@", (uint8_t *)v3);
}

void sub_100016398(void *a1, void *a2)
{
  id v4 = a1;
  id v5 = [(id)sub_100014C7C() mediaItem];
  uint64_t v6 = [v5 assetIdentifier];
  BOOL v7 = [a2 mediaItem];
  int v8 = 136446723;
  int v9 = "-[CLEEDMediaService updateCallRecordForMediaServiceItem:]";
  __int16 v10 = 2113;
  __int16 v11 = v6;
  __int16 v12 = 1026;
  unsigned int v13 = [v7 uploadStatus];
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "#EED2EMS,%{public}s, Called with media item that was not uploaded successfully,assetID,%{private}@,status,%{public}d", (uint8_t *)&v8, 0x1Cu);
}

void sub_10001648C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014B54((void *)&_mh_execute_header, a1, a3, "#EED2EMS,%{public}s, input nil, early return", a5, a6, a7, a8, 2u);
}

void sub_100016504(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014B54((void *)&_mh_execute_header, a1, a3, "#EED2EMS,%{public}s, invalid input, early return", a5, a6, a7, a8, 2u);
}

void sub_10001657C()
{
  v2[0] = 136446466;
  sub_100014B70();
  sub_100014B90((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, copy failed, URL is nil for mediaItem:%{public}@", (uint8_t *)v2);
}

void sub_1000165F4()
{
  v2[0] = 136446466;
  sub_100014B70();
  sub_100014B90((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, copy aborted for mediaItem:%{public}@", (uint8_t *)v2);
}

void sub_10001666C(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  int v4 = 136446466;
  id v5 = "-[CLEEDMediaService copyMediaItemToStaging:]";
  sub_100014B84();
  sub_100014B90((void *)&_mh_execute_header, v1, v3, "#EED2EMS,%{public}s, Sandbox extension consume failure:%{public}s", (uint8_t *)&v4);
}

void sub_100016714(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136446466;
  *(void *)(a2 + 4) = "-[CLEEDMediaService copyMediaItemToStaging:]";
  *(_WORD *)(a2 + 12) = 2082;
  *(void *)(a2 + 14) = a1;
  sub_100014B90((void *)&_mh_execute_header, a3, (uint64_t)a3, "#EED2EMS,%{public}s, Sandbox extension release failure:%{public}s", (uint8_t *)a2);
}

void sub_100016768()
{
  v2[0] = 136446466;
  sub_100014B70();
  sub_100014B90((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, self no longer valid, readURL:%{public}@", (uint8_t *)v2);
}

void sub_1000167E0(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  int v4 = 136446466;
  id v5 = "-[CLEEDMediaService copyMediaItemToStaging:]_block_invoke";
  sub_100014B84();
  sub_100014B90((void *)&_mh_execute_header, v1, v3, "#EED2EMS,%{public}s, Sandbox extension release failure:%{public}s", (uint8_t *)&v4);
}

void sub_100016884(id *a1, void *a2)
{
  id v4 = a2;
  double v5 = (double)(unint64_t)[(id)sub_100014C7C() originalSizeBytes] * 0.000000953674316;
  uint64_t v6 = [*a1 stagingURL];
  id v7 = [v6 path];
  int v9 = 136446722;
  __int16 v10 = "-[CLEEDMediaService copyMediaItemToStaging:]_block_invoke";
  __int16 v11 = 2050;
  double v12 = v5;
  __int16 v13 = 2082;
  id v14 = [v7 UTF8String];
  sub_100014C64((void *)&_mh_execute_header, v2, v8, "#EED2EMS,%{public}s, Filesize(%{public}.2lf MB) exceeds limit for:%{public}s", (uint8_t *)&v9);
}

void sub_100016984(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  [v3 UTF8String];
  int v6 = 136446467;
  id v7 = "-[CLEEDMediaService copyMediaItemToStaging:]_block_invoke";
  sub_100014B84();
  sub_100014B90((void *)&_mh_execute_header, v4, v5, "#EED2EMS,%{public}s, file does not exist at path:%{private}s", (uint8_t *)&v6);
}

void sub_100016A30()
{
  int v2 = 136446467;
  id v3 = "-[CLEEDMediaService copyMediaItemToStaging:]_block_invoke";
  sub_100014B84();
  sub_100014B90((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, copyItemAtPath failed with error:%{private}@", (uint8_t *)&v2);
}

void sub_100016AB0(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = [(id)sub_100014C7C() path];
  int v7 = 136446723;
  uint64_t v8 = "-[CLEEDMediaService copyMediaItemToStaging:]_block_invoke";
  __int16 v9 = 2081;
  id v10 = [v6 UTF8String];
  __int16 v11 = 2081;
  id v12 = [a3 UTF8String];
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s, Copying from accessorURL:%{private}s to %{private}s", (uint8_t *)&v7, 0x20u);
}

void sub_100016B94(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100014BF8() stagingURL];
  id v4 = [v3 lastPathComponent];
  [v4 UTF8String];
  int v6 = 136446467;
  int v7 = "-[CLEEDMediaService transcodeMediaItem:]";
  sub_100014B84();
  sub_100014B90((void *)&_mh_execute_header, v1, v5, "#EED2EMS,%{public}s, Transcoding failed for %{private}s", (uint8_t *)&v6);
}

void sub_100016C60(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)sub_100014BF8() mediaItem];
  uint64_t v5 = [v4 URL];
  int v6 = [v5 path];
  int v8 = 136446467;
  __int16 v9 = "-[CLEEDMediaService handleEncryptionCompletionForServiceItem:encryptedFileURL:authTag:]_block_invoke";
  sub_100014B84();
  sub_100014B90((void *)&_mh_execute_header, v2, v7, "#EED2EMS,%{public}s, File Encryption failed, path:%{private}@", (uint8_t *)&v8);
}

void sub_100016D34(os_log_t log)
{
  int v1 = 136446210;
  id v2 = "-[CLEEDMediaService checkIfUploadQuotaReached:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s, extendedSessionEnded, not in emergency mode", (uint8_t *)&v1, 0xCu);
}

void sub_100016DB8(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100014BF8() localizedDescription];
  v5[0] = 136446466;
  sub_100014B70();
  sub_100014B90((void *)&_mh_execute_header, v1, v4, "#EED2EMS,%{public}s, Failed to submit background task request: %{public}@", (uint8_t *)v5);
}

void sub_100016E5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014B54((void *)&_mh_execute_header, a1, a3, "#EED2EMS,%{public}s, SetupFailure or BGTaskStartTimer timed out, returning", a5, a6, a7, a8, 2u);
}

void sub_100016ED4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016F4C()
{
  v2[0] = 136446466;
  sub_100014C04();
  sub_100014B90((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, Timer[%{public}@] fired, but weakSelf is nil, returning", (uint8_t *)v2);
}

void sub_100016FCC(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100014BF8() mediaRequest];
  uint64_t v4 = [v3 requestID];
  sub_100014B70();
  sub_100014BA8((void *)&_mh_execute_header, v5, v6, "#EED2EMS,%{public}s, All media items aborted for requestID:%{public}@", v7, v8, v9, v10, 2u);
}

void sub_100017080(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100014BF8() mediaRequest];
  uint64_t v4 = [v3 requestID];
  sub_100014B70();
  sub_100014BA8((void *)&_mh_execute_header, v5, v6, "#EED2EMS,%{public}s, All media items delayed for requestID:%{public}@", v7, v8, v9, v10, 2u);
}

void sub_100017134(void *a1)
{
  uint64_t v1 = a1;
  [@"/private/var/mobile/Library/CLEEDMediaService/" UTF8String];
  v3[0] = 136446723;
  sub_100014C18();
  sub_100014C64((void *)&_mh_execute_header, v1, v2, "#EED2EMS,%{public}s, Error while getting contents of directory at Path:%{private}s, error:%{public}@", (uint8_t *)v3);
}

void sub_1000171D4(void *a1)
{
  uint64_t v1 = a1;
  [0 UTF8String];
  int v3 = 136446467;
  uint64_t v4 = "+[CLEEDMediaService deleteFileAtPath:]";
  sub_100014B84();
  sub_100014B90((void *)&_mh_execute_header, v1, v2, "#EED2EMS,%{public}s, invalid File Path %{private}s", (uint8_t *)&v3);
}

void sub_100017274()
{
  v1[0] = 136446723;
  sub_100014C38();
  uint64_t v2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s, Removing staged file:%{private}@, removeError:%{public}@", (uint8_t *)v1, 0x20u);
}

void sub_1000172F8()
{
  v2[0] = 136446723;
  sub_100014C38();
  uint64_t v3 = v0;
  sub_100014C64((void *)&_mh_execute_header, v1, (uint64_t)v1, "#EED2EMS,%{public}s, Error removing staged file:%{private}@, removeError:%{public}@", (uint8_t *)v2);
}

void sub_100017378(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  int v7 = 136446722;
  uint64_t v8 = "-[CLEEDMediaService storeDataToCache]";
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  __int16 v11 = 2050;
  id v12 = [a3 length];
  sub_100014C64((void *)&_mh_execute_header, v5, v6, "#EED2EMS,%{public}s, failed to encode CLEEDMediaService cache, encodeError:%{public}@, cacheSize:%{public}lu", (uint8_t *)&v7);
}

void sub_100017438(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000174B0(void *a1)
{
  uint64_t v1 = a1;
  [@"/private/var/mobile/Library/CLEEDMediaService/CLEEDMSCache" UTF8String];
  int v3 = 136446467;
  uint64_t v4 = "-[CLEEDMediaService loadFromCache]";
  sub_100014B84();
  sub_100014B90((void *)&_mh_execute_header, v1, v2, "#EED2EMS,%{public}s, failed to read data from CLEEDMediaService cacheFile:%{private}s", (uint8_t *)&v3);
}

void sub_100017554()
{
  v2[0] = 136446466;
  sub_100014B70();
  sub_100014B90((void *)&_mh_execute_header, v0, v1, "#EED2EMS,%{public}s, failed to decode CLEEDMediaService cache, decodeError:%{public}@", (uint8_t *)v2);
}

void sub_1000175CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017644(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return _CCCryptorCreateWithMode(op, mode, alg, padding, iv, key, keyLength, tweak, tweakLength, numRounds, options, cryptorRef);
}

uint64_t CCCryptorGCMEncrypt()
{
  return _CCCryptorGCMEncrypt();
}

uint64_t CCCryptorGCMFinalize()
{
  return _CCCryptorGCMFinalize();
}

uint64_t CCCryptorGCMSetIV()
{
  return _CCCryptorGCMSetIV();
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return _CCCryptorRelease(cryptorRef);
}

void CFRelease(CFTypeRef cf)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int feof(FILE *a1)
{
  return _feof(a1);
}

int ferror(FILE *a1)
{
  return _ferror(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

CGImageSourceRef sub_100017C3C(const __CFURL *a1, const __CFDictionary *a2, double a3)
{
  if (!atomic_load(&dword_100029EB0)) {
    sub_100017EE4(a3);
  }
  return CGImageSourceCreateWithURL(a1, a2);
}

CFStringRef sub_100017C68(CGImageSourceRef isrc, double a2)
{
  if (!atomic_load(&dword_100029EB0)) {
    sub_100017EE4(a2);
  }
  return CGImageSourceGetType(isrc);
}

size_t sub_100017C94(CGImageSourceRef isrc, double a2)
{
  if (!atomic_load(&dword_100029EB0)) {
    sub_100017EE4(a2);
  }
  return CGImageSourceGetPrimaryImageIndex(isrc);
}

CFDictionaryRef sub_100017CC0(CGImageSource *a1, size_t a2, const __CFDictionary *a3, double a4)
{
  if (!atomic_load(&dword_100029EB0)) {
    sub_100017EE4(a4);
  }
  return CGImageSourceCopyPropertiesAtIndex(a1, a2, a3);
}

CGImageDestinationRef sub_100017CEC(const __CFURL *a1, const __CFString *a2, size_t a3, const __CFDictionary *a4, double a5)
{
  if (!atomic_load(&dword_100029EB0)) {
    sub_100017EE4(a5);
  }
  return CGImageDestinationCreateWithURL(a1, a2, a3, a4);
}

void sub_100017D18(CGImageDestination *a1, CGImageSource *a2, size_t a3, const __CFDictionary *a4, double a5)
{
  if (!atomic_load(&dword_100029EB0)) {
    sub_100017EE4(a5);
  }
  CGImageDestinationAddImageFromSource(a1, a2, a3, a4);
}

BOOL sub_100017D44(CGImageDestinationRef idst, double a2)
{
  if (!atomic_load(&dword_100029EB0)) {
    sub_100017EE4(a2);
  }
  return CGImageDestinationFinalize(idst);
}

uint64_t sub_100017D70(double a1)
{
  if (!atomic_load(&dword_100029EB8)) {
    sub_10001802C(a1);
  }
  return AnalyticsSendEventLazy();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100017D9C(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100017E40(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100017EE4(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100017F88(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10001802C(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1000180D0(double a1)
{
  return a1;
}

double sub_100018174(double result)
{
  if (!atomic_load(&dword_100029EBC)) {
    return sub_1000180D0(result);
  }
  return result;
}

double sub_100018198(double result)
{
  if (!atomic_load(&dword_100029EAC)) {
    return sub_100017E40(result);
  }
  return result;
}

double sub_1000181BC(double result)
{
  if (!atomic_load(&dword_100029EB4)) {
    return sub_100017F88(result);
  }
  return result;
}

double sub_1000181E0(double result)
{
  if (!atomic_load(&dword_100029EAC)) {
    return sub_100017E40(result);
  }
  return result;
}

double sub_100018204(double result)
{
  if (!atomic_load(&dword_100029EB4)) {
    return sub_100017F88(result);
  }
  return result;
}

double sub_100018228(double result)
{
  if (!atomic_load(&dword_100029EA8)) {
    return sub_100017D9C(result);
  }
  return result;
}

double sub_10001824C(double result)
{
  if (!atomic_load(&dword_100029EB0)) {
    return sub_100017EE4(result);
  }
  return result;
}

double sub_100018270(double result)
{
  if (!atomic_load(&dword_100029EB0)) {
    return sub_100017EE4(result);
  }
  return result;
}

double sub_100018294(double result)
{
  if (!atomic_load(&dword_100029EA8)) {
    return sub_100017D9C(result);
  }
  return result;
}

double sub_1000182B8(double result)
{
  if (!atomic_load(&dword_100029EB0)) {
    return sub_100017EE4(result);
  }
  return result;
}

double sub_1000182DC(double result)
{
  if (!atomic_load(&dword_100029EBC)) {
    return sub_1000180D0(result);
  }
  return result;
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingPathExtension];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_abortMediaUpload(void *a1, const char *a2, ...)
{
  return [a1 abortMediaUpload];
}

id objc_msgSend_abortRequested(void *a1, const char *a2, ...)
{
  return [a1 abortRequested];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_anyItemsToProcess(void *a1, const char *a2, ...)
{
  return [a1 anyItemsToProcess];
}

id objc_msgSend_assetIdentifier(void *a1, const char *a2, ...)
{
  return [a1 assetIdentifier];
}

id objc_msgSend_authTag(void *a1, const char *a2, ...)
{
  return [a1 authTag];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callUUID(void *a1, const char *a2, ...)
{
  return [a1 callUUID];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelBGTaskStartGuardTimer(void *a1, const char *a2, ...)
{
  return [a1 cancelBGTaskStartGuardTimer];
}

id objc_msgSend_cancelDebounceTimerForReleasingOSTransaction(void *a1, const char *a2, ...)
{
  return [a1 cancelDebounceTimerForReleasingOSTransaction];
}

id objc_msgSend_cancelDelayTimer(void *a1, const char *a2, ...)
{
  return [a1 cancelDelayTimer];
}

id objc_msgSend_checkAndScheduleProcessing(void *a1, const char *a2, ...)
{
  return [a1 checkAndScheduleProcessing];
}

id objc_msgSend_checkAndStartBGTaskStartGuardTimer(void *a1, const char *a2, ...)
{
  return [a1 checkAndStartBGTaskStartGuardTimer];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return [a1 cleanup];
}

id objc_msgSend_cleanupOnInvalidation(void *a1, const char *a2, ...)
{
  return [a1 cleanupOnInvalidation];
}

id objc_msgSend_clearCache(void *a1, const char *a2, ...)
{
  return [a1 clearCache];
}

id objc_msgSend_clearStagingArea(void *a1, const char *a2, ...)
{
  return [a1 clearStagingArea];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_combinedSecret(void *a1, const char *a2, ...)
{
  return [a1 combinedSecret];
}

id objc_msgSend_completedQueue(void *a1, const char *a2, ...)
{
  return [a1 completedQueue];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return [a1 completionHandler];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultSessionConfiguration];
}

id objc_msgSend_delayMediaUpload(void *a1, const char *a2, ...)
{
  return [a1 delayMediaUpload];
}

id objc_msgSend_delayQueue(void *a1, const char *a2, ...)
{
  return [a1 delayQueue];
}

id objc_msgSend_delayRequired(void *a1, const char *a2, ...)
{
  return [a1 delayRequired];
}

id objc_msgSend_delayTimer(void *a1, const char *a2, ...)
{
  return [a1 delayTimer];
}

id objc_msgSend_deviceKeyConfirmation(void *a1, const char *a2, ...)
{
  return [a1 deviceKeyConfirmation];
}

id objc_msgSend_didApplyDelayMitigation(void *a1, const char *a2, ...)
{
  return [a1 didApplyDelayMitigation];
}

id objc_msgSend_didUserCancelUpload(void *a1, const char *a2, ...)
{
  return [a1 didUserCancelUpload];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_durationCopyMs(void *a1, const char *a2, ...)
{
  return [a1 durationCopyMs];
}

id objc_msgSend_durationEncryptionMs(void *a1, const char *a2, ...)
{
  return [a1 durationEncryptionMs];
}

id objc_msgSend_durationRequestHandlingMs(void *a1, const char *a2, ...)
{
  return [a1 durationRequestHandlingMs];
}

id objc_msgSend_durationTranscodeMs(void *a1, const char *a2, ...)
{
  return [a1 durationTranscodeMs];
}

id objc_msgSend_durationUploadMs(void *a1, const char *a2, ...)
{
  return [a1 durationUploadMs];
}

id objc_msgSend_emergencyMediaItems(void *a1, const char *a2, ...)
{
  return [a1 emergencyMediaItems];
}

id objc_msgSend_encryptedFileURL(void *a1, const char *a2, ...)
{
  return [a1 encryptedFileURL];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_filteredQueue(void *a1, const char *a2, ...)
{
  return [a1 filteredQueue];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frontmostCall(void *a1, const char *a2, ...)
{
  return [a1 frontmostCall];
}

id objc_msgSend_getQueue(void *a1, const char *a2, ...)
{
  return [a1 getQueue];
}

id objc_msgSend_getURLSession(void *a1, const char *a2, ...)
{
  return [a1 getURLSession];
}

id objc_msgSend_hasPendingPhotos(void *a1, const char *a2, ...)
{
  return [a1 hasPendingPhotos];
}

id objc_msgSend_hasPendingVideos(void *a1, const char *a2, ...)
{
  return [a1 hasPendingVideos];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadFromCache(void *a1, const char *a2, ...)
{
  return [a1 loadFromCache];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return [a1 localizedFailureReason];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_maxUploadFileSizeMB(void *a1, const char *a2, ...)
{
  return [a1 maxUploadFileSizeMB];
}

id objc_msgSend_maxUploadQuotaMB(void *a1, const char *a2, ...)
{
  return [a1 maxUploadQuotaMB];
}

id objc_msgSend_mediaItem(void *a1, const char *a2, ...)
{
  return [a1 mediaItem];
}

id objc_msgSend_mediaItemFormat(void *a1, const char *a2, ...)
{
  return [a1 mediaItemFormat];
}

id objc_msgSend_mediaItemID(void *a1, const char *a2, ...)
{
  return [a1 mediaItemID];
}

id objc_msgSend_mediaItemSizeBytes(void *a1, const char *a2, ...)
{
  return [a1 mediaItemSizeBytes];
}

id objc_msgSend_mediaRequest(void *a1, const char *a2, ...)
{
  return [a1 mediaRequest];
}

id objc_msgSend_mediaService(void *a1, const char *a2, ...)
{
  return [a1 mediaService];
}

id objc_msgSend_mediaServiceRequestList(void *a1, const char *a2, ...)
{
  return [a1 mediaServiceRequestList];
}

id objc_msgSend_metricProcessed(void *a1, const char *a2, ...)
{
  return [a1 metricProcessed];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_notifyProcessingCompletion(void *a1, const char *a2, ...)
{
  return [a1 notifyProcessingCompletion];
}

id objc_msgSend_notifyProgressUITaskCompletion(void *a1, const char *a2, ...)
{
  return [a1 notifyProgressUITaskCompletion];
}

id objc_msgSend_numAdditionalMediaItemsSelected(void *a1, const char *a2, ...)
{
  return [a1 numAdditionalMediaItemsSelected];
}

id objc_msgSend_numInFlightUploads(void *a1, const char *a2, ...)
{
  return [a1 numInFlightUploads];
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return [a1 originalRequest];
}

id objc_msgSend_originalSizeBytes(void *a1, const char *a2, ...)
{
  return [a1 originalSizeBytes];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pendingQueue(void *a1, const char *a2, ...)
{
  return [a1 pendingQueue];
}

id objc_msgSend_prepareForServiceTeardown(void *a1, const char *a2, ...)
{
  return [a1 prepareForServiceTeardown];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processMediaServicesFromCache(void *a1, const char *a2, ...)
{
  return [a1 processMediaServicesFromCache];
}

id objc_msgSend_processNextInFlightServiceItem(void *a1, const char *a2, ...)
{
  return [a1 processNextInFlightServiceItem];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_releaseOSTransaction(void *a1, const char *a2, ...)
{
  return [a1 releaseOSTransaction];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requestID(void *a1, const char *a2, ...)
{
  return [a1 requestID];
}

id objc_msgSend_requestTimestamp(void *a1, const char *a2, ...)
{
  return [a1 requestTimestamp];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_restoreDelayedMediaServiceItems(void *a1, const char *a2, ...)
{
  return [a1 restoreDelayedMediaServiceItems];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sandboxExtension(void *a1, const char *a2, ...)
{
  return [a1 sandboxExtension];
}

id objc_msgSend_sendCompletionIndication(void *a1, const char *a2, ...)
{
  return [a1 sendCompletionIndication];
}

id objc_msgSend_serverUploadStatus(void *a1, const char *a2, ...)
{
  return [a1 serverUploadStatus];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sessionInvalidated(void *a1, const char *a2, ...)
{
  return [a1 sessionInvalidated];
}

id objc_msgSend_setProgressUITaskCompletion(void *a1, const char *a2, ...)
{
  return [a1 setProgressUITaskCompletion];
}

id objc_msgSend_sharedInfoPrefix(void *a1, const char *a2, ...)
{
  return [a1 sharedInfoPrefix];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_stagingURL(void *a1, const char *a2, ...)
{
  return [a1 stagingURL];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_storeDataToCache(void *a1, const char *a2, ...)
{
  return [a1 storeDataToCache];
}

id objc_msgSend_takeOSTransaction(void *a1, const char *a2, ...)
{
  return [a1 takeOSTransaction];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timestampEncryptionStart(void *a1, const char *a2, ...)
{
  return [a1 timestampEncryptionStart];
}

id objc_msgSend_timestampUploadStart(void *a1, const char *a2, ...)
{
  return [a1 timestampUploadStart];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_totalBytesUploadedDuringCall(void *a1, const char *a2, ...)
{
  return [a1 totalBytesUploadedDuringCall];
}

id objc_msgSend_triggerAllProcessing(void *a1, const char *a2, ...)
{
  return [a1 triggerAllProcessing];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_updateProgress(void *a1, const char *a2, ...)
{
  return [a1 updateProgress];
}

id objc_msgSend_uploadAttempts(void *a1, const char *a2, ...)
{
  return [a1 uploadAttempts];
}

id objc_msgSend_uploadMigitation(void *a1, const char *a2, ...)
{
  return [a1 uploadMigitation];
}

id objc_msgSend_uploadProgressFraction(void *a1, const char *a2, ...)
{
  return [a1 uploadProgressFraction];
}

id objc_msgSend_uploadStatus(void *a1, const char *a2, ...)
{
  return [a1 uploadStatus];
}

id objc_msgSend_uploadURL(void *a1, const char *a2, ...)
{
  return [a1 uploadURL];
}

id objc_msgSend_urlUploadTask(void *a1, const char *a2, ...)
{
  return [a1 urlUploadTask];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}