@interface ADDiagnosticsManager
- (ADDiagnosticsManager)initWithQueue:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)updateLatencyDiagnosticConfiguration:(id)a3 completion:(id)a4;
@end

@implementation ADDiagnosticsManager

- (void).cxx_destruct
{
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
}

- (void)updateLatencyDiagnosticConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v30 = a4;
  v7 = dispatch_group_create();
  id v34 = objc_alloc_init((Class)NSMutableArray);
  v8 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  v9 = self;
  v33 = +[NSURLSession sessionWithConfiguration:v8 delegate:self delegateQueue:0];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v31 = v6;
  id obj = [v6 diagnosticActions];
  id v10 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v48;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "uri", v30);
        v16 = +[NSMutableURLRequest requestWithURL:v15];
        v17 = [v14 verb];
        [v16 setHTTPMethod:v17];
        v18 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v52 = "-[ADDiagnosticsManager updateLatencyDiagnosticConfiguration:completion:]";
          __int16 v53 = 2112;
          v54 = v16;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Dispatching diagnostic request: %@", buf, 0x16u);
        }
        dispatch_group_enter(v7);
        v19 = +[NSProcessInfo processInfo];
        [v19 systemUptime];
        uint64_t v21 = v20;

        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10012B4A8;
        v39[3] = &unk_100502E08;
        id v40 = v16;
        id v41 = v15;
        id v42 = v17;
        uint64_t v46 = v21;
        v43 = v7;
        v44 = v9;
        id v45 = v34;
        id v22 = v17;
        id v23 = v15;
        id v24 = v16;
        v25 = [v33 dataTaskWithRequest:v24 completionHandler:v39];
        [v25 resume];
      }
      id v11 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v11);
  }

  queue = v9->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012B72C;
  block[3] = &unk_10050E1D8;
  id v36 = v34;
  id v37 = v33;
  id v38 = v30;
  id v27 = v33;
  id v28 = v30;
  id v29 = v34;
  dispatch_group_notify(v7, queue, block);
}

- (ADDiagnosticsManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADDiagnosticsManager;
  id v6 = [(ADDiagnosticsManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

@end