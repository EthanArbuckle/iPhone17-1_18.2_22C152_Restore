@interface HSNFCManager
- (BOOL)pausedInBackground;
- (BOOL)readerSupportedWithError:(id *)a3;
- (HSNFCManager)initWithDelegate:(id)a3;
- (HSNFCManagerDelegate)delegate;
- (NFReaderSession)nearFieldReaderSession;
- (NFSession)overallSession;
- (OS_dispatch_queue)sessionQueue;
- (id)start;
- (void)readerSession:(id)a3 didDetectTags:(id)a4;
- (void)readerSessionDidEndUnexpectedly:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNearFieldReaderSession:(id)a3;
- (void)setOverallSession:(id)a3;
- (void)setPausedInBackground:(BOOL)a3;
- (void)setSessionQueue:(id)a3;
- (void)stop;
@end

@implementation HSNFCManager

- (HSNFCManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HSNFCManager;
  v5 = [(HSNFCManager *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.Home.HomeUIService.NFCSessionQueue", v7);
    sessionQueue = v6->_sessionQueue;
    v6->_sessionQueue = (OS_dispatch_queue *)v8;
  }
  return v6;
}

- (id)start
{
  id v38 = 0;
  unsigned __int8 v3 = [(HSNFCManager *)self readerSupportedWithError:&v38];
  id v4 = v38;
  if ((v3 & 1) == 0)
  {
    v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000681AC(v16, v17, v18, v19, v20, v21, v22, v23);
    }

    uint64_t v24 = +[NAFuture futureWithError:v4];
    goto LABEL_13;
  }
  uint64_t v5 = [(HSNFCManager *)self nearFieldReaderSession];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(HSNFCManager *)self nearFieldReaderSession];
    id v8 = [v7 state];

    if (v8 != (id)2)
    {
      v25 = HFLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100068174(v25, v26, v27, v28, v29, v30, v31, v32);
      }

      uint64_t v24 = +[NAFuture futureWithNoResult];
LABEL_13:
      id v15 = (id)v24;
      goto LABEL_14;
    }
  }
  v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NFC: Attempting to start session", (uint8_t *)&buf, 2u);
  }

  id v10 = objc_alloc_init((Class)NAFuture);
  objc_initWeak(&buf, self);
  objc_super v11 = +[NFHardwareManager sharedHardwareManager];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10004A6A4;
  v34[3] = &unk_1000AAEE0;
  v34[4] = self;
  objc_copyWeak(&v36, &buf);
  id v12 = v10;
  id v35 = v12;
  v13 = [v11 startReaderSession:v34];
  [(HSNFCManager *)self setOverallSession:v13];

  v14 = v35;
  id v15 = v12;

  objc_destroyWeak(&v36);
  objc_destroyWeak(&buf);
LABEL_14:

  return v15;
}

- (void)stop
{
  if ([(HSNFCManager *)self readerSupportedWithError:0])
  {
    unsigned __int8 v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NFC: Attempting to end session", buf, 2u);
    }

    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    *(void *)id buf = 0;
    uint64_t v23 = buf;
    uint64_t v24 = 0x3032000000;
    v25 = sub_10004AC88;
    uint64_t v26 = sub_10004AC98;
    id v5 = objc_alloc((Class)BKSProcessAssertion);
    uint64_t v6 = getpid();
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10004ACA0;
    v19[3] = &unk_1000AAF08;
    uint64_t v21 = &v28;
    v7 = v4;
    uint64_t v20 = v7;
    id v27 = [v5 initWithPID:v6 flags:1 reason:4 name:@"HomeNFCStopAssertion" withHandler:v19];
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    if (!*((unsigned char *)v29 + 24))
    {
      id v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000682C0(v8, v9, v10, v11, v12, v13, v14, v15);
      }

      [*((id *)v23 + 5) invalidate];
      v16 = (void *)*((void *)v23 + 5);
      *((void *)v23 + 5) = 0;
    }
    uint64_t v17 = [(HSNFCManager *)self sessionQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004ACB4;
    v18[3] = &unk_1000AAF30;
    v18[4] = self;
    v18[5] = buf;
    dispatch_async(v17, v18);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v28, 8);
  }
}

- (BOOL)readerSupportedWithError:(id *)a3
{
  dispatch_semaphore_t v4 = +[NFHardwareManager sharedHardwareManager];
  LOBYTE(a3) = [v4 areFeaturesSupported:1 outError:a3];

  return (char)a3;
}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412546;
    id v60 = v6;
    __int16 v61 = 2112;
    v62 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NFC: readerSession:%@ didDetectTags:%@", buf, 0x16u);
  }

  __int16 v57 = 0;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v54;
    *(void *)&long long v10 = 138412546;
    long long v37 = v10;
    uint64_t v38 = *(void *)v54;
    v39 = v6;
    do
    {
      uint64_t v13 = 0;
      id v40 = v11;
      do
      {
        if (*(void *)v54 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v13);
        id v52 = 0;
        unsigned __int8 v15 = [v6 connectTag:v14 error:&v52 v37];
        id v16 = v52;
        if (v15)
        {
          [v6 checkNdefSupportsRead:(char *)&v57 + 1 andWrite:&v57];
          uint64_t v17 = HFLogForCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            if (HIBYTE(v57)) {
              uint64_t v18 = "YES";
            }
            else {
              uint64_t v18 = "NO";
            }
            if ((_BYTE)v57) {
              uint64_t v19 = "YES";
            }
            else {
              uint64_t v19 = "NO";
            }
            *(_DWORD *)id buf = 138412802;
            id v60 = v14;
            __int16 v61 = 2080;
            v62 = v18;
            __int16 v63 = 2080;
            v64 = v19;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "NFC: tag %@: read = %s write = %s", buf, 0x20u);
          }

          id v51 = 0;
          uint64_t v20 = [v6 ndefReadWithError:&v51];
          v44 = v51;
          v45 = v20;
          if (!v20)
          {
            uint64_t v21 = HFLogForCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)id buf = v37;
              id v60 = v14;
              __int16 v61 = 2112;
              v62 = (const char *)v44;
              _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "NFC: Unable to read tag: %@. Error = %@", buf, 0x16u);
            }

            uint64_t v20 = 0;
          }
          id v42 = v16;
          v43 = v13;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          uint64_t v22 = [v20 records];
          id v23 = [v22 countByEnumeratingWithState:&v47 objects:v58 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v48;
            do
            {
              for (i = 0; i != v24; i = (char *)i + 1)
              {
                if (*(void *)v48 != v25) {
                  objc_enumerationMutation(v22);
                }
                id v27 = [*(id *)(*((void *)&v47 + 1) + 8 * i) decode];
                uint64_t v28 = HFLogForCategory();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)id buf = 138412290;
                  id v60 = v27;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "NFC: read token: %@", buf, 0xCu);
                }

                uint64_t v29 = [(HSNFCManager *)self delegate];
                unsigned int v30 = [v29 nfcManager:self shouldReturnPayloadString:v27];

                if (v30)
                {
                  char v31 = HFLogForCategory();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)id buf = 138412290;
                    id v60 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "NFC: Successfully read setup payload string %@", buf, 0xCu);
                  }

                  uint64_t v32 = [(HSNFCManager *)self delegate];
                  [v32 nfcManager:self didRecognizePayloadString:v27];
                }
              }
              id v24 = [v22 countByEnumeratingWithState:&v47 objects:v58 count:16];
            }
            while (v24);
          }

          id v46 = 0;
          id v6 = v39;
          unsigned __int8 v33 = [v39 disconnectTagWithError:&v46];
          id v34 = v46;
          id v11 = v40;
          uint64_t v12 = v38;
          id v16 = v42;
          uint64_t v13 = v43;
          if ((v33 & 1) == 0)
          {
            id v35 = HFLogForCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)id buf = 138412290;
              id v60 = v34;
              _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "NFC: Failed to disconnect tag with error:%@", buf, 0xCu);
            }
          }
          id v36 = v44;
        }
        else
        {
          id v36 = HFLogForCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id buf = v37;
            id v60 = v14;
            __int16 v61 = 2112;
            v62 = (const char *)v16;
            _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "NFC: Unable to connect to tag: %@. Error = %@", buf, 0x16u);
          }
        }

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      id v11 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v11);
  }
}

- (void)readerSessionDidEndUnexpectedly:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000682F8((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (HSNFCManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HSNFCManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NFSession)overallSession
{
  return self->_overallSession;
}

- (void)setOverallSession:(id)a3
{
}

- (NFReaderSession)nearFieldReaderSession
{
  return self->_nearFieldReaderSession;
}

- (void)setNearFieldReaderSession:(id)a3
{
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (void)setSessionQueue:(id)a3
{
}

- (BOOL)pausedInBackground
{
  return self->_pausedInBackground;
}

- (void)setPausedInBackground:(BOOL)a3
{
  self->_pausedInBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_nearFieldReaderSession, 0);
  objc_storeStrong((id *)&self->_overallSession, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end