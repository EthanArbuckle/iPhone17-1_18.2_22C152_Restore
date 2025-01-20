@interface EndpointReachability
- (BOOL)_flagIsReachable:(unsigned int)a3;
- (BOOL)_httpSendRequestWithURL:(id)a3 timeout:(int64_t)a4 error:(id *)a5;
- (EndpointReachabilityInputs)inputs;
- (NSMutableDictionary)endpointsInfo;
- (id)_calculateTimeIntervalFrom:(id)a3 To:(id)a4;
- (id)_connectionEstablishmentTime:(id)a3;
- (id)_dnsResolutionTime:(id)a3;
- (id)_httpRequestTime:(id)a3;
- (id)_httpResponseTime:(id)a3;
- (id)_remoteAddress:(id)a3;
- (id)_remotePort:(id)a3;
- (id)_requestURL:(id)a3;
- (int64_t)_httpCheckWithURL:(id)a3 timeout:(int64_t)a4;
- (int64_t)_localNetworkCheckWithHostName:(id)a3;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_testURL:(id)a3 timeout:(int64_t)a4 completion:(id)a5;
- (void)cancel;
- (void)initEndpointsInfo;
- (void)setEndpointsInfo:(id)a3;
- (void)setInputs:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
@end

@implementation EndpointReachability

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    v12 = "-[EndpointReachability setupWithInputs:responder:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v11, 0x20u);
  }

  [(EndpointReachability *)self setInputs:v6];
  v9 = [(EndpointReachability *)self inputs];

  if (!v9)
  {
    v10 = [(EndpointReachability *)self result];
    [v10 setStatusCode:&off_100008698];

    [(EndpointReachability *)self setFinished:1];
  }
}

- (void)start
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[EndpointReachability start]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v73 = 0x3032000000;
  v74 = sub_100003A04;
  v75 = sub_100003A14;
  id v76 = (id)objc_opt_new();
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = sub_100003A04;
  v64 = sub_100003A14;
  id v65 = (id)objc_opt_new();
  v35 = objc_opt_new();
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 1;
  v3 = [(EndpointReachability *)self inputs];
  v4 = [v3 timeout];
  signed int v5 = [v4 intValue];

  if (v5)
  {
    uint64_t v6 = v5;
  }
  else
  {
    id v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v69 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Timeout is 0, setting to default timeout.", v69, 2u);
    }

    uint64_t v6 = 60;
  }
  [(EndpointReachability *)self initEndpointsInfo];
  v8 = dispatch_semaphore_create(32);
  group = dispatch_group_create();
  queue = dispatch_get_global_queue(21, 0);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v9 = [(EndpointReachability *)self endpointsInfo];
  id v10 = [v9 countByEnumeratingWithState:&v52 objects:v71 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v53;
    *(void *)&long long v11 = 138412290;
    long long v34 = v11;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v53 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
        __int16 v15 = handleForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v69 = v34;
          uint64_t v70 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Testing endpoint: %@", v69, 0xCu);
        }

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100003A1C;
        block[3] = &unk_1000082B8;
        id v16 = group;
        v44 = v16;
        v45 = self;
        v50 = &v56;
        uint64_t v51 = v6;
        uint64_t v46 = v14;
        v48 = &v60;
        p_long long buf = &buf;
        v47 = v8;
        dispatch_group_async(v16, queue, block);
      }
      id v10 = [v9 countByEnumeratingWithState:&v52 objects:v71 count:16];
    }
    while (v10);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v57 + 24))
  {
    v17 = [(EndpointReachability *)self result];
    [v17 setStatusCode:&off_1000086B0];
  }
  else
  {
    v17 = [(EndpointReachability *)self result];
    [v17 setStatusCode:&off_1000086C8];
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v18 = [(EndpointReachability *)self endpointsInfo];
  id v19 = [v18 countByEnumeratingWithState:&v39 objects:v68 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v40;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = *(void *)(*((void *)&v39 + 1) + 8 * (void)j);
        v23 = [(EndpointReachability *)self endpointsInfo];
        v24 = [v23 valueForKey:v22];

        v25 = [v24 valueForKey:@"metrics"];
        [v35 setObject:v25 forKey:v22];
      }
      id v19 = [v18 countByEnumeratingWithState:&v39 objects:v68 count:16];
    }
    while (v19);
  }

  v66[0] = @"endpointReachability";
  id v26 = [(id)v61[5] count];
  if (v26)
  {
    v27 = (void *)v61[5];
  }
  else
  {
    v27 = +[NSNull null];
  }
  v67[0] = v27;
  v66[1] = @"unreachableEndpoints";
  id v28 = [*(id *)(*((void *)&buf + 1) + 40) count:v34];
  if (v28)
  {
    v29 = *(void **)(*((void *)&buf + 1) + 40);
  }
  else
  {
    v29 = +[NSNull null];
  }
  v67[1] = v29;
  v66[2] = @"metrics";
  id v30 = [v35 count];
  v31 = v35;
  if (!v30)
  {
    v31 = +[NSNull null];
  }
  v67[2] = v31;
  v32 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];
  v33 = [(EndpointReachability *)self result];
  [v33 setData:v32];

  if (!v30) {
  if (!v28)
  }

  if (!v26) {
  [(EndpointReachability *)self setFinished:1];
  }

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&buf, 8);
}

- (void)cancel
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[EndpointReachability cancel]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)teardown
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[EndpointReachability teardown]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)initEndpointsInfo
{
  int v3 = objc_opt_new();
  [(EndpointReachability *)self setEndpointsInfo:v3];

  long long v40 = self;
  v4 = [(EndpointReachability *)self inputs];
  signed int v5 = [v4 endpointURLs];
  uint64_t v6 = +[NSSet setWithArray:v5];
  id v7 = [v6 allObjects];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v7;
  id v41 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v46;
    v8 = &CFRelease_ptr;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v46 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v9;
        id v10 = *(void **)(*((void *)&v45 + 1) + 8 * v9);
        long long v11 = handleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          long long v52 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "endpoint: %@", buf, 0xCu);
        }

        uint64_t v12 = +[NSURL URLWithString:v10];
        uint64_t v13 = [v12 host];
        uint64_t v14 = [v12 port];
        if (!v14)
        {
          __int16 v15 = handleForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            long long v52 = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: Port number not specified, using default.", buf, 0xCu);
          }

          id v16 = [v12 scheme];
          id v17 = [v16 caseInsensitiveCompare:@"http"];

          if (v17)
          {
            v18 = [v12 scheme];
            id v19 = [v18 caseInsensitiveCompare:@"https"];

            if (v19)
            {
              uint64_t v14 = 0;
              goto LABEL_17;
            }
            uint64_t v20 = 443;
          }
          else
          {
            uint64_t v20 = 80;
          }
          uint64_t v14 = +[NSNumber numberWithInt:v20];
        }
LABEL_17:
        long long v42 = +[NSString stringWithFormat:@"%@:%@", v13, v14];
        v49[0] = @"remoteAddress";
        v21 = [v8[62] null];
        v50[0] = v21;
        v49[1] = @"remotePort";
        uint64_t v22 = [v8[62] null];
        v50[1] = v22;
        v49[2] = @"dnsResolutionTime";
        [v8[62] null];
        v24 = v23 = (void *)v13;
        v50[2] = v24;
        v49[3] = @"connectionEstablishmentTime";
        v25 = [v8[62] null];
        v50[3] = v25;
        v49[4] = @"httpRequestTime";
        [v8[62] null];
        v27 = id v26 = v8;
        v50[4] = v27;
        v49[5] = @"httpResponseTime";
        id v28 = [v26[62] null];
        v50[5] = v28;
        v43 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:6];

        v29 = objc_opt_new();
        id v30 = [v12 scheme];
        v31 = +[NSString stringWithFormat:@"%@://%@", v30, v42];
        [v29 setObject:v31 forKey:@"url"];

        if (v23)
        {
          [v29 setObject:v23 forKey:@"hostname"];
        }
        else
        {
          v32 = [v26[62] null];
          [v29 setObject:v32 forKey:@"hostname"];
        }
        v8 = v26;
        if (v14)
        {
          [v29 setObject:v14 forKey:@"port"];
          if (v43) {
            goto LABEL_22;
          }
        }
        else
        {
          v33 = [v26[62] null];
          [v29 setObject:v33 forKey:@"port"];

          if (v43)
          {
LABEL_22:
            [v29 setObject:v43 forKey:@"metrics"];
            goto LABEL_25;
          }
        }
        long long v34 = [v26[62] null];
        [v29 setObject:v34 forKey:@"metrics"];

LABEL_25:
        v35 = [(EndpointReachability *)v40 endpointsInfo];
        [v35 setObject:v29 forKey:v42];

        uint64_t v9 = v44 + 1;
      }
      while (v41 != (id)(v44 + 1));
      id v41 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v41);
  }

  v36 = handleForCategory();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = [(EndpointReachability *)v40 endpointsInfo];
    *(_DWORD *)long long buf = 138412290;
    long long v52 = v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "endpointsInfo: %@", buf, 0xCu);
  }
}

- (void)_testURL:(id)a3 timeout:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, int64_t))a5;
  id v10 = handleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 136315394;
    long long v34 = "-[EndpointReachability _testURL:timeout:completion:]";
    __int16 v35 = 2112;
    id v36 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v33, 0x16u);
  }

  long long v11 = [(EndpointReachability *)self endpointsInfo];
  uint64_t v12 = [v11 objectForKeyedSubscript:v8];

  uint64_t v13 = [v12 objectForKeyedSubscript:@"url"];
  uint64_t v14 = +[NSURL URLWithString:v13];

  __int16 v15 = [v12 objectForKeyedSubscript:@"hostname"];
  id v16 = [v12 objectForKeyedSubscript:@"port"];
  id v17 = handleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138412546;
    long long v34 = v15;
    __int16 v35 = 2112;
    id v36 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Hostname: %@  Portnumber: %@", (uint8_t *)&v33, 0x16u);
  }

  int64_t v18 = [(EndpointReachability *)self _localNetworkCheckWithHostName:v15];
  if (v18)
  {
    int64_t v19 = v18;
    uint64_t v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100005B48((uint64_t)v8, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  else
  {
    int64_t v19 = [(EndpointReachability *)self _httpCheckWithURL:v14 timeout:a4];
    if (!v19) {
      goto LABEL_12;
    }
    uint64_t v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100005ADC((uint64_t)v8, v20, v27, v28, v29, v30, v31, v32);
    }
  }

LABEL_12:
  if (v9) {
    v9[2](v9, v19);
  }
}

- (BOOL)_flagIsReachable:(unsigned int)a3
{
  BOOL v3 = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0) {
    BOOL v3 = 0;
  }
  BOOL v4 = (a3 & 4) == 0 || v3;
  return (a3 & 2) != 0 && v4;
}

- (int64_t)_localNetworkCheckWithHostName:(id)a3
{
  BOOL v4 = (char *)a3;
  signed int v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v24 = "-[EndpointReachability _localNetworkCheckWithHostName:]";
    __int16 v25 = 2112;
    uint64_t v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  uint64_t v6 = v4;
  id v7 = (const char *)[v6 UTF8String];
  if (v7 && (id v8 = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, v7)) != 0)
  {
    uint64_t v9 = v8;
    SCNetworkReachabilityFlags flags = 0;
    if (SCNetworkReachabilityGetFlags(v8, &flags))
    {
      unsigned int v10 = [(EndpointReachability *)self _flagIsReachable:flags];
      long long v11 = handleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = "No";
        if (v10) {
          uint64_t v12 = "Yes";
        }
        *(_DWORD *)long long buf = 138412546;
        uint64_t v24 = v6;
        __int16 v25 = 2080;
        uint64_t v26 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ reachable: %s", buf, 0x16u);
      }

      int64_t v13 = v10 - 1;
    }
    else
    {
      uint64_t v14 = handleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100005BB4((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
      }

      int64_t v13 = -2;
    }
    CFRelease(v9);
  }
  else
  {
    int64_t v13 = -13;
  }

  return v13;
}

- (BOOL)_httpSendRequestWithURL:(id)a3 timeout:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = handleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Sending HTTP Request...", (uint8_t *)&buf, 0xCu);
  }

  unsigned int v10 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  long long v11 = +[NSURLSession sessionWithConfiguration:v10 delegate:self delegateQueue:0];
  uint64_t v12 = +[NSMutableURLRequest requestWithURL:v8 cachePolicy:1 timeoutInterval:(double)a4];
  [v12 setHTTPMethod:@"GET"];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = sub_100003A04;
  long long v52 = sub_100003A14;
  id v53 = 0;
  uint64_t v39 = 0;
  long long v40 = &v39;
  uint64_t v41 = 0x3032000000;
  long long v42 = sub_100003A04;
  v43 = sub_100003A14;
  id v44 = 0;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_100003A04;
  v37 = sub_100003A14;
  id v38 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100004CE0;
  v23[3] = &unk_1000082E0;
  p_long long buf = &buf;
  uint64_t v26 = &v39;
  uint64_t v27 = &v33;
  uint64_t v28 = &v29;
  int64_t v13 = dispatch_semaphore_create(0);
  uint64_t v24 = v13;
  uint64_t v14 = [v11 dataTaskWithRequest:v12 completionHandler:v23];
  [v14 resume];
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v15 = handleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v40[5];
    *(_DWORD *)long long v45 = 138412546;
    id v46 = v8;
    __int16 v47 = 2112;
    uint64_t v48 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: HTTP Response Header: %@", v45, 0x16u);
  }

  uint64_t v17 = handleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = *((_DWORD *)v30 + 6);
    *(_DWORD *)long long v45 = 138412546;
    id v46 = v8;
    __int16 v47 = 1024;
    LODWORD(v48) = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@: HTTP Status: %d", v45, 0x12u);
  }

  uint64_t v19 = handleForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = v34[5];
    *(_DWORD *)long long v45 = 138412546;
    id v46 = v8;
    __int16 v47 = 2112;
    uint64_t v48 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: HTTP Error: %@", v45, 0x16u);
  }

  uint64_t v21 = (void *)v34[5];
  if (a5 && v21) {
    *a5 = v21;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&buf, 8);

  return v21 == 0;
}

- (int64_t)_httpCheckWithURL:(id)a3 timeout:(int64_t)a4
{
  id v6 = a3;
  id v7 = handleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v15 = "-[EndpointReachability _httpCheckWithURL:timeout:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  id v13 = 0;
  unsigned __int8 v8 = [(EndpointReachability *)self _httpSendRequestWithURL:v6 timeout:a4 error:&v13];
  id v9 = v13;
  unsigned int v10 = v9;
  int64_t v11 = 0;
  if ((v8 & 1) == 0)
  {
    if ([v9 code] == (id)-1001)
    {
      int64_t v11 = -11;
    }
    else if ([v10 code] == (id)-1004)
    {
      int64_t v11 = -9;
    }
    else if ([v10 code] == (id)-1009)
    {
      int64_t v11 = -8;
    }
    else if ([v10 code] == (id)-1003)
    {
      int64_t v11 = -10;
    }
    else
    {
      int64_t v11 = -12;
    }
  }

  return v11;
}

- (id)_calculateTimeIntervalFrom:(id)a3 To:(id)a4
{
  signed int v5 = 0;
  if (a3 && a4)
  {
    [a4 timeIntervalSinceDate:];
    signed int v5 = +[NSString stringWithFormat:@"%lf", v6];
    uint64_t v4 = vars8;
  }
  return v5;
}

- (id)_dnsResolutionTime:(id)a3
{
  id v4 = a3;
  signed int v5 = [v4 domainLookupStartDate];
  uint64_t v6 = [v4 domainLookupEndDate];

  id v7 = [(EndpointReachability *)self _calculateTimeIntervalFrom:v5 To:v6];

  return v7;
}

- (id)_connectionEstablishmentTime:(id)a3
{
  id v4 = a3;
  signed int v5 = [v4 connectStartDate];
  uint64_t v6 = [v4 connectEndDate];

  id v7 = [(EndpointReachability *)self _calculateTimeIntervalFrom:v5 To:v6];

  return v7;
}

- (id)_httpRequestTime:(id)a3
{
  id v4 = a3;
  signed int v5 = [v4 requestStartDate];
  uint64_t v6 = [v4 requestEndDate];

  id v7 = [(EndpointReachability *)self _calculateTimeIntervalFrom:v5 To:v6];

  return v7;
}

- (id)_httpResponseTime:(id)a3
{
  id v4 = a3;
  signed int v5 = [v4 responseStartDate];
  uint64_t v6 = [v4 responseEndDate];

  id v7 = [(EndpointReachability *)self _calculateTimeIntervalFrom:v5 To:v6];

  return v7;
}

- (id)_requestURL:(id)a3
{
  BOOL v3 = [a3 request];
  id v4 = [v3 URL];

  return v4;
}

- (id)_remoteAddress:(id)a3
{
  return [a3 remoteAddress];
}

- (id)_remotePort:(id)a3
{
  return [a3 remotePort];
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, void, void *))a5;
  unsigned __int8 v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "URLSession didReceiveChallenge...", buf, 2u);
  }

  id v9 = [v6 protectionSpace];
  unsigned int v10 = [v9 authenticationMethod];
  unsigned int v11 = [v10 isEqualToString:NSURLAuthenticationMethodServerTrust];

  uint64_t v12 = handleForCategory();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Continue without authentication. Accepting server.", v17, 2u);
    }

    uint64_t v14 = [v6 protectionSpace];
    uint64_t v15 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v14 serverTrust]);

    v7[2](v7, 0, v15);
  }
  else
  {
    if (v13)
    {
      v16[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Perform default challenge handling.", (uint8_t *)v16, 2u);
    }

    v7[2](v7, 1, 0);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v7 = (void (**)(id, void))a7;
  unsigned __int8 v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "URLSession willPerformHTTPRedirection...", v9, 2u);
  }

  v7[2](v7, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v31 = a3;
  id v32 = a4;
  id v38 = a5;
  unsigned __int8 v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v32 originalRequest];
    unsigned int v10 = [v9 URL];
    *(_DWORD *)long long buf = 138412546;
    long long v40 = v10;
    __int16 v41 = 2112;
    id v42 = v38;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully collected URL(%@) metrics %@", buf, 0x16u);
  }
  unsigned int v11 = [v38 transactionMetrics];
  uint64_t v12 = [v11 firstObject];

  uint64_t v35 = [(EndpointReachability *)self _dnsResolutionTime:v12];
  long long v34 = [(EndpointReachability *)self _connectionEstablishmentTime:v12];
  uint64_t v33 = [(EndpointReachability *)self _httpRequestTime:v12];
  BOOL v13 = [(EndpointReachability *)self _httpResponseTime:v12];
  uint64_t v14 = [(EndpointReachability *)self _remoteAddress:v12];
  uint64_t v15 = [(EndpointReachability *)self _remotePort:v12];
  __int16 v16 = [(EndpointReachability *)self _requestURL:v12];
  v37 = [v16 host];
  id v36 = [v16 port];
  id v17 = +[NSString stringWithFormat:@"%@:%@", v37, v36];
  int v18 = handleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v40 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "testpoint: %@", buf, 0xCu);
  }

  uint64_t v19 = objc_opt_new();
  uint64_t v20 = v19;
  if (v14)
  {
    [v19 setObject:v14 forKey:@"remoteAddress"];
  }
  else
  {
    uint64_t v21 = +[NSNull null];
    [v20 setObject:v21 forKey:@"remoteAddress"];
  }
  if (v15)
  {
    [v20 setObject:v15 forKey:@"remotePort"];
  }
  else
  {
    uint64_t v22 = +[NSNull null];
    [v20 setObject:v22 forKey:@"remotePort"];
  }
  if (v35)
  {
    [v20 setObject:v35 forKey:@"dnsResolutionTime"];
  }
  else
  {
    uint64_t v23 = +[NSNull null];
    [v20 setObject:v23 forKey:@"dnsResolutionTime"];
  }
  if (v34)
  {
    [v20 setObject:v34 forKey:@"connectionEstablishmentTime"];
  }
  else
  {
    uint64_t v24 = +[NSNull null];
    [v20 setObject:v24 forKey:@"connectionEstablishmentTime"];
  }
  if (v33)
  {
    [v20 setObject:v33 forKey:@"httpRequestTime"];
  }
  else
  {
    __int16 v25 = +[NSNull null];
    [v20 setObject:v25 forKey:@"httpRequestTime"];
  }
  if (v13)
  {
    [v20 setObject:v13 forKey:@"httpResponseTime"];
  }
  else
  {
    uint64_t v26 = +[NSNull null];
    [v20 setObject:v26 forKey:@"httpResponseTime"];
  }
  uint64_t v27 = handleForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    long long v40 = v17;
    __int16 v41 = 2112;
    id v42 = v20;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ metrics: %@", buf, 0x16u);
  }

  uint64_t v28 = self;
  objc_sync_enter(v28);
  uint64_t v29 = [(EndpointReachability *)v28 endpointsInfo];
  uint64_t v30 = [v29 objectForKey:v17];
  [v30 setObject:v20 forKey:@"metrics"];

  objc_sync_exit(v28);
}

- (EndpointReachabilityInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (NSMutableDictionary)endpointsInfo
{
  return self->_endpointsInfo;
}

- (void)setEndpointsInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointsInfo, 0);

  objc_storeStrong((id *)&self->_inputs, 0);
}

@end