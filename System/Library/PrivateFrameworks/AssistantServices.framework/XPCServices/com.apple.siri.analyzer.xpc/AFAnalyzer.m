@interface AFAnalyzer
+ (id)analyzer;
- (double)_measureTimeToLoadURL:(id)a3 withMethod:(id)a4;
- (id)_addressToPingForHost:(id)a3;
- (id)_resultForCommand:(const char *)a3;
- (void)_getDefaultGateway:(id *)a3 iface:(id *)a4;
- (void)_handleMessage:(id)a3;
- (void)_logAnalysisForURL:(id)a3 failedIFaceIndex:(id)a4 sendBufferSize:(id)a5 isUserFailure:(BOOL)a6 isWWANPreferred:(BOOL)a7 isRetrySuccess:(BOOL)a8;
- (void)_pingHost:(id)a3 time:(double *)a4 sentPackets:(int64_t *)a5 droppedPackets:(int64_t *)a6;
- (void)_startAnalysisWithMessage:(id)a3;
- (void)runAnalysis;
- (void)runAnalyzerService;
@end

@implementation AFAnalyzer

- (void)runAnalysis
{
  id v3 = +[NSURL URLWithString:@"https://guzzoni.apple.com"];
  [(AFAnalyzer *)self _logAnalysisForURL:v3 failedIFaceIndex:0 sendBufferSize:0 isUserFailure:0 isWWANPreferred:0 isRetrySuccess:0];
}

- (void)runAnalyzerService
{
  AFLogInitIfNeeded();
  id v3 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[AFAnalyzer runAnalyzerService]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Running analyzer service", (uint8_t *)&v4, 0xCu);
  }
  objc_storeStrong((id *)&qword_100010AE8, self);
  xpc_main((xpc_connection_handler_t)sub_100005830);
}

- (void)_handleMessage:(id)a3
{
  id v5 = a3;
  string = xpc_dictionary_get_string(v5, "message");
  if (!strcmp(string, "analyze")) {
    [(AFAnalyzer *)self _startAnalysisWithMessage:v5];
  }
}

- (void)_startAnalysisWithMessage:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "url");
  if (string)
  {
    v6 = string;
    v7 = +[NSString stringWithUTF8String:string];
    v8 = +[NSURL URLWithString:v7];

    v9 = AFSiriLogContextAnalysis;
    BOOL v10 = os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        int v22 = 136315394;
        v23 = "-[AFAnalyzer _startAnalysisWithMessage:]";
        __int16 v24 = 2112;
        v25 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Attempting analysis on URL {%@}.", (uint8_t *)&v22, 0x16u);
      }
      v11 = xpc_dictionary_get_value(v4, "interface");
      v12 = v11;
      if (v11)
      {
        v13 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v11)];
      }
      else
      {
        v13 = 0;
      }
      v16 = xpc_dictionary_get_value(v4, "send buffer");
      v17 = v16;
      if (v16)
      {
        v18 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v16)];
      }
      else
      {
        v18 = 0;
      }
      BOOL v19 = xpc_dictionary_get_BOOL(v4, "request failure");
      BOOL v20 = xpc_dictionary_get_BOOL(v4, "wwan preferred");
      [(AFAnalyzer *)self _logAnalysisForURL:v8 failedIFaceIndex:v13 sendBufferSize:v18 isUserFailure:v19 isWWANPreferred:v20 isRetrySuccess:xpc_dictionary_get_BOOL(v4, "successful retry")];
      dispatch_time_t v21 = dispatch_time(0, 1000000000);
      dispatch_after(v21, (dispatch_queue_t)&_dispatch_main_q, &stru_10000C890);
    }
    else
    {
      if (!v10)
      {
LABEL_17:

        goto LABEL_18;
      }
      v13 = v9;
      v15 = +[NSString stringWithUTF8String:v6];
      int v22 = 136315394;
      v23 = "-[AFAnalyzer _startAnalysisWithMessage:]";
      __int16 v24 = 2112;
      v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Ending analysis. Instantiating a URL for {%@} returned nil.", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_17;
  }
  v14 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315138;
    v23 = "-[AFAnalyzer _startAnalysisWithMessage:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Ending analysis. Attempted analysis on a NULL URL.", (uint8_t *)&v22, 0xCu);
  }
LABEL_18:
}

- (void)_logAnalysisForURL:(id)a3 failedIFaceIndex:(id)a4 sendBufferSize:(id)a5 isUserFailure:(BOOL)a6 isWWANPreferred:(BOOL)a7 isRetrySuccess:(BOOL)a8
{
  BOOL v67 = a8;
  BOOL v68 = a7;
  BOOL v69 = a6;
  id v62 = a3;
  id v66 = a4;
  id v65 = a5;
  v11 = +[NSMutableDictionary dictionary];
  v12 = +[NSNumber numberWithBool:v69];
  [v11 setObject:v12 forKey:@"User Failure"];

  v13 = +[NSNumber numberWithBool:v68];
  [v11 setObject:v13 forKey:@"WWAN Preferred"];

  v14 = +[NSNumber numberWithBool:v67];
  [v11 setObject:v14 forKey:@"Retry Success"];

  if (v66
    && (sub_100006880((signed int)[v66 intValue]),
        v15 = objc_claimAutoreleasedReturnValue(),
        (v16 = v15) != 0))
  {
    if ([v15 isEqualToString:@"pdp_ip0"]) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    v18 = +[NSNumber numberWithInt:v17];
    [v11 setObject:v18 forKey:@"Connection Interface"];

    BOOL v19 = v16;
  }
  else
  {
    BOOL v19 = 0;
  }
  if (v65) {
    [v11 setObject:v65 forKey:@"Send buffer size"];
  }
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x3032000000;
  v101 = sub_100006908;
  v102 = sub_100006918;
  id v103 = 0;
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x3032000000;
  v95 = sub_100006908;
  v96 = sub_100006918;
  id v97 = 0;
  id v90 = 0;
  id v91 = 0;
  [(AFAnalyzer *)self _getDefaultGateway:&v91 iface:&v90];
  id v63 = v91;
  id v64 = v90;
  if (![v63 length])
  {
    __int16 v24 = +[NSNumber numberWithInteger:0];
    [v11 setObject:v24 forKey:@"Gateway availability status"];
    goto LABEL_28;
  }
  v61 = v19;
  BOOL v20 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v105 = "-[AFAnalyzer _logAnalysisForURL:failedIFaceIndex:sendBufferSize:isUserFailure:isWWANPreferred:isRetrySuccess:]";
    __int16 v106 = 2112;
    id v107 = v63;
    __int16 v108 = 2112;
    id v109 = v64;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Gateway is %@ on interface %@", buf, 0x20u);
  }
  unsigned int v21 = [v64 isEqualToString:@"pdp_ip0"];
  if (v21) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = 2;
  }
  v23 = +[NSNumber numberWithInt:v22];
  [v11 setObject:v23 forKey:@"Gateway availability status"];

  __int16 v24 = dispatch_group_create();
  v25 = dispatch_get_global_queue(0, 0);
  dispatch_queue_t v26 = dispatch_queue_create(0, 0);
  id v27 = objc_alloc_init((Class)NSMutableDictionary);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006920;
  block[3] = &unk_10000C7B0;
  block[4] = self;
  v28 = v26;
  v88 = v28;
  id v29 = v27;
  id v89 = v29;
  dispatch_group_async(v24, v25, block);
  if ((v21 & 1) == 0)
  {
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_1000069FC;
    v81[3] = &unk_10000C800;
    v81[4] = self;
    id v82 = v63;
    v85 = &v98;
    v86 = &v92;
    v83 = v28;
    id v84 = v29;
    dispatch_group_async(v24, v25, v81);
  }
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_100006B28;
  v77[3] = &unk_10000C828;
  v77[4] = self;
  id v30 = v62;
  id v78 = v30;
  v31 = v28;
  v79 = v31;
  id v32 = v29;
  id v80 = v32;
  dispatch_group_async(v24, v25, v77);
  v33 = [v30 URLByDeletingLastPathComponent];
  v34 = [v33 URLByAppendingPathComponent:@"salt"];

  if (v34)
  {
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_100006BD8;
    v73[3] = &unk_10000C828;
    v73[4] = self;
    id v74 = v34;
    v75 = v31;
    id v76 = v32;
    dispatch_group_async(v24, v25, v73);
  }
  dispatch_time_t v35 = dispatch_time(0, 20000000000);
  intptr_t v36 = dispatch_group_wait(v24, v35);
  v37 = AFSiriLogContextAnalysis;
  BOOL v38 = os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO);
  if (v36)
  {
    if (v38)
    {
      *(_DWORD *)buf = 136315138;
      v105 = "-[AFAnalyzer _logAnalysisForURL:failedIFaceIndex:sendBufferSize:isUserFailure:isWWANPreferred:isRetrySuccess:]";
      v39 = "%s Failed waiting for network";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, v39, buf, 0xCu);
    }
  }
  else if (v38)
  {
    *(_DWORD *)buf = 136315138;
    v105 = "-[AFAnalyzer _logAnalysisForURL:failedIFaceIndex:sendBufferSize:isUserFailure:isWWANPreferred:isRetrySuccess:]";
    v39 = "%s Dispatch group finished waiting";
    goto LABEL_26;
  }
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_100006C88;
  v70[3] = &unk_10000C850;
  id v71 = v32;
  id v72 = v11;
  id v40 = v32;
  dispatch_sync(v31, v70);

  BOOL v19 = v61;
LABEL_28:

  v41 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v105 = "-[AFAnalyzer _logAnalysisForURL:failedIFaceIndex:sendBufferSize:isUserFailure:isWWANPreferred:isRetrySuccess:]";
    __int16 v106 = 2112;
    id v107 = v11;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v42 = objc_opt_new();
  v43 = [v11 objectForKey:@"Connection Interface"];
  [v42 setConnectionInterface:v43];

  v44 = [v11 objectForKey:@"Send buffer size"];
  [v42 setSendBufferBytesRemaining:v44];

  [v42 setForUserRequest:v69];
  [v42 setWwanPreferred:v68];
  [v42 setAnalyzedSuccessfulRetry:v67];
  v45 = [v11 objectForKey:@"Apple URL HEAD time"];
  v46 = [v11 objectForKey:@"Siri URL HEAD time"];
  v47 = [v11 objectForKey:@"Siri Salt URL HEAD time"];
  [v45 doubleValue];
  if (v48 >= 0.0) {
    v49 = v45;
  }
  else {
    v49 = 0;
  }
  [v42 setKnownURLLoadDuration:v49];
  [v46 doubleValue];
  if (v50 >= 0.0) {
    v51 = v46;
  }
  else {
    v51 = 0;
  }
  [v42 setSiriURLLoadDuration:v51];
  [v47 doubleValue];
  if (v52 >= 0.0) {
    v53 = v47;
  }
  else {
    v53 = 0;
  }
  [v42 setSiriSaltURLLoadDuration:v53];
  v54 = [v11 objectForKey:@"Gateway availability status"];
  unsigned int v55 = [v54 intValue];

  if (v55 >= 3) {
    uint64_t v56 = -1;
  }
  else {
    uint64_t v56 = v55;
  }
  [v42 setGatewayStatus:v56];
  v57 = [v11 objectForKey:@"Gateway average ping"];
  [v57 doubleValue];
  if (v58 >= 0.0) {
    v59 = v57;
  }
  else {
    v59 = 0;
  }
  [v42 setGatewayPingDuration:v59];
  [v42 setGatewayPingsSent:v99[5]];
  [v42 setGatewayPingsDropped:v93[5]];
  v60 = +[AFDiagnostics sharedDiagnostics];
  [v60 logNetworkAnalyzeRunWithResults:v42];

  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v98, 8);
}

- (double)_measureTimeToLoadURL:(id)a3 withMethod:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[AFAnalyzer _measureTimeToLoadURL:withMethod:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Attempting to load %@", buf, 0x16u);
  }
  id v8 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v5];
  [v8 setHTTPMethod:v6];
  [v8 setHTTPShouldHandleCookies:0];
  v9 = +[NSProcessInfo processInfo];
  [v9 systemUptime];
  uint64_t v11 = v10;

  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  unint64_t v30 = 0xBFF0000000000000;
  v13 = +[NSURLSession sharedSession];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100007244;
  v21[3] = &unk_10000C760;
  v23 = buf;
  uint64_t v24 = v11;
  v14 = v12;
  uint64_t v22 = v14;
  v15 = [v13 dataTaskWithRequest:v8 completionHandler:v21];

  [v15 resume];
  dispatch_time_t v16 = dispatch_time(0, 300000000000);
  dispatch_semaphore_wait(v14, v16);
  uint64_t v17 = AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    if (*(double *)(*(void *)&buf[8] + 24) < 0.0) {
      CFStringRef v18 = @"failed";
    }
    else {
      CFStringRef v18 = @"succeeded";
    }
    *(_DWORD *)v25 = 136315394;
    dispatch_queue_t v26 = "-[AFAnalyzer _measureTimeToLoadURL:withMethod:]";
    __int16 v27 = 2112;
    CFStringRef v28 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s URL load %@", v25, 0x16u);
  }
  double v19 = *(double *)(*(void *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v19;
}

- (void)_pingHost:(id)a3 time:(double *)a4 sentPackets:(int64_t *)a5 droppedPackets:(int64_t *)a6
{
  id v8 = a3;
  v9 = [(AFAnalyzer *)self _addressToPingForHost:v8];
  if (v9)
  {
    unsigned __int16 v10 = arc4random_uniform(0xFFFFu);
    int v11 = socket(2, 2, 1);
    if ((v11 & 0x80000000) == 0)
    {
      unsigned int v12 = v11;
      v13 = AFSiriLogContextAnalysis;
      if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[AFAnalyzer _pingHost:time:sentPackets:droppedPackets:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v63) = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Pinging %@ using id %d", buf, 0x1Cu);
      }
      id v15 = +[NSString stringWithFormat:@"ping.queue.%d", v10];
      dispatch_time_t v16 = dispatch_queue_create((const char *)[v15 UTF8String], 0);

      dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
      dispatch_source_t v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v12, 0, v16);
      uint64_t v58 = 0;
      v59 = &v58;
      uint64_t v60 = 0x2020000000;
      int v61 = 0;
      uint64_t v54 = 0;
      unsigned int v55 = (double *)&v54;
      uint64_t v56 = 0x2020000000;
      uint64_t v57 = 0;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100007810;
      handler[3] = &unk_10000C6E8;
      unsigned int v51 = v12;
      id v19 = v9;
      unsigned __int16 v53 = v10;
      id v47 = v19;
      v49 = &v58;
      double v50 = &v54;
      int v52 = 5;
      BOOL v20 = v18;
      double v48 = v20;
      dispatch_source_set_event_handler(v20, handler);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100007BC0;
      v43[3] = &unk_10000C710;
      unsigned int v21 = v17;
      v44 = v21;
      unsigned int v45 = v12;
      dispatch_source_set_cancel_handler(v20, v43);
      dispatch_resume(v20);
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x2020000000;
      __int16 v42 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v63 = sub_100007BFC;
      id v64 = sub_100007C28;
      id v65 = 0;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100007C30;
      v32[3] = &unk_10000C738;
      uint64_t v22 = v20;
      v33 = v22;
      unsigned __int16 v40 = v10;
      id v34 = v19;
      intptr_t v36 = v41;
      unsigned int v38 = v12;
      int v39 = 5;
      v23 = v16;
      dispatch_time_t v35 = v23;
      v37 = buf;
      id v24 = [v32 copy];
      id v25 = objc_retainBlock(v24);
      dispatch_queue_t v26 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v25;

      dispatch_async(v23, v24);
      dispatch_time_t v27 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(v21, v27);
      dispatch_source_cancel(v22);
      if (a4)
      {
        int v28 = *((_DWORD *)v59 + 6);
        if (v28 < 1) {
          double v29 = -1.0;
        }
        else {
          double v29 = v55[3] / (double)v28;
        }
        *a4 = v29;
      }
      if (a5) {
        *a5 = 5;
      }
      if (a6) {
        *a6 = 5 - *((int *)v59 + 6);
      }

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(v41, 8);

      _Block_object_dispose(&v54, 8);
      _Block_object_dispose(&v58, 8);
    }
  }
  else
  {
    v14 = AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[AFAnalyzer _pingHost:time:sentPackets:droppedPackets:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Couldn't find addr for host %@", buf, 0x16u);
    }
  }
}

- (id)_addressToPingForHost:(id)a3
{
  if (!a3) {
    goto LABEL_10;
  }
  v13 = 0;
  memset(&v12, 0, sizeof(v12));
  *(void *)&v12.ai_family = 0x200000002;
  int v3 = getaddrinfo((const char *)objc_msgSend(a3, "UTF8String", *(_OWORD *)&v12.ai_flags, 0, 0, 0, 0), 0, &v12, &v13);
  if (v3)
  {
    int v4 = v3;
    id v5 = (void *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      id v6 = v5;
      v7 = gai_strerror(v4);
      *(_DWORD *)buf = 136315394;
      id v15 = "-[AFAnalyzer _addressToPingForHost:]";
      __int16 v16 = 2080;
      dispatch_semaphore_t v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Couldn't getaddrinfo %s", buf, 0x16u);
    }
    goto LABEL_10;
  }
  id v8 = v13;
  if (!v13)
  {
LABEL_10:
    unsigned __int16 v10 = 0;
    goto LABEL_11;
  }
  v9 = v13;
  while (v9->ai_family != 2)
  {
    v9 = v9->ai_next;
    if (!v9)
    {
      unsigned __int16 v10 = 0;
      goto LABEL_15;
    }
  }
  unsigned __int16 v10 = +[NSData dataWithBytes:v9->ai_addr length:v9->ai_addrlen];
  id v8 = v13;
  if (!v13) {
    goto LABEL_11;
  }
LABEL_15:
  freeaddrinfo(v8);
LABEL_11:
  return v10;
}

- (void)_getDefaultGateway:(id *)a3 iface:(id *)a4
{
  *(_OWORD *)unsigned int v21 = xmmword_100009CF8;
  uint64_t v22 = 1;
  size_t size = 0;
  if (sysctl(v21, 6u, 0, &size, 0, 0) < 0
    || (id v6 = (unsigned __int16 *)malloc_type_malloc(size, 0x23C22130uLL)) == 0)
  {
    id v19 = 0;
    id v9 = 0;
    if (!a3) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  v7 = v6;
  if (sysctl(v21, 6u, v6, &size, 0, 0) < 0
    || (unint64_t v8 = (unint64_t)v7 + size, v7 >= (unsigned __int16 *)((char *)v7 + size)))
  {
    id v19 = 0;
    id v9 = 0;
  }
  else
  {
    id v9 = 0;
    unsigned __int16 v10 = v7;
    while (1)
    {

      if (v10 && (*((_DWORD *)v10 + 2) & 0x20002) == 2 && (v10[11] & 1) == 0 && *((unsigned char *)v10 + 93) == 2)
      {
        uint64_t v11 = 0;
        addrinfo v12 = v10 + 46;
        memset(v25, 0, sizeof(v25));
        unsigned int v13 = *((_DWORD *)v10 + 3);
        do
        {
          if ((v13 >> v11))
          {
            uint64_t v14 = ((*v12 - 1) & 0xFFFFFFFC) + 4;
            if (!*v12) {
              uint64_t v14 = 4;
            }
            id v15 = v12;
            v12 += v14;
          }
          else
          {
            id v15 = 0;
          }
          *((void *)v25 + v11++) = v15;
        }
        while (v11 != 8);
        if (*(unsigned char *)(*((void *)&v25[0] + 1) + 1) == 2
          && (*(void *)v23 = 0,
              uint64_t v24 = 0,
              (__int16 v16 = inet_ntop(2, (const void *)(*((void *)&v25[0] + 1) + 4), v23, 0x10u)) != 0))
        {
          id v17 = +[NSString stringWithUTF8String:v16];
        }
        else
        {
          id v17 = 0;
        }
        sub_100006880(v10[2]);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v17 = 0;
        id v18 = 0;
      }
      id v19 = v17;
      id v9 = v18;
      if (v19) {
        break;
      }
      unsigned __int16 v10 = (unsigned __int16 *)((char *)v10 + *v10);
      if ((unint64_t)v10 >= v8)
      {
        id v19 = 0;
        break;
      }
    }
  }
  free(v7);
  if (a3) {
LABEL_27:
  }
    *a3 = v19;
LABEL_28:
  if (a4) {
    *a4 = v9;
  }
}

- (id)_resultForCommand:(const char *)a3
{
  int v4 = popen(a3, "r");
  if (v4)
  {
    id v5 = v4;
    id v6 = +[NSMutableString string];
    while (!feof(v5))
    {
      int64_t v7 = fread(&v13, 1uLL, 0x200uLL, v5);
      if (v7 >= 1)
      {
        id v8 = [objc_alloc((Class)NSString) initWithBytes:&v13 length:v7 encoding:4];
        if (v8) {
          [v6 appendString:v8];
        }
      }
    }
    pclose(v5);
  }
  else
  {
    id v9 = (void *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      unsigned __int16 v10 = v9;
      int v11 = *__error();
      int v13 = 136315650;
      uint64_t v14 = "-[AFAnalyzer _resultForCommand:]";
      __int16 v15 = 1024;
      int v16 = v11;
      __int16 v17 = 2080;
      id v18 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Unable to run (%d): %s", (uint8_t *)&v13, 0x1Cu);
    }
    id v6 = 0;
  }
  return v6;
}

+ (id)analyzer
{
  v2 = objc_alloc_init(AFAnalyzer);
  return v2;
}

@end