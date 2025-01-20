@interface MCTaggedLocationCollector
+ (id)sharedCollector;
- (BOOL)uploadRequest:(id)a3;
- (MCTaggedLocationCollector)init;
- (id)buildUploadFileName;
- (id)collectorUploadSession;
- (id)geocorrectiondUploadDir;
- (id)getLastRunTime;
- (id)startTimeFromUploadFileName:(id)a3;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)collectIfReady:(id)a3;
- (void)storeLastRunTime:(id)a3;
@end

@implementation MCTaggedLocationCollector

+ (id)sharedCollector
{
  if (qword_100023A38 != -1) {
    dispatch_once(&qword_100023A38, &stru_10001D5D0);
  }
  v2 = (void *)qword_100023A30;

  return v2;
}

- (MCTaggedLocationCollector)init
{
  v12.receiver = self;
  v12.super_class = (Class)MCTaggedLocationCollector;
  v2 = [(MCTaggedLocationCollector *)&v12 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(MCTaggedLocationCollector *)v2 getLastRunTime];
    lastRunTime = v3->_lastRunTime;
    v3->_lastRunTime = (NSDate *)v4;

    uint64_t v6 = geo_dispatch_queue_create_with_qos();
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v6;

    v3->_pendingCompletion = 0;
    v8 = v3->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B014;
    block[3] = &unk_10001C650;
    v11 = v3;
    dispatch_async(v8, block);
  }
  return v3;
}

- (void)collectIfReady:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B35C;
  v7[3] = &unk_10001D648;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (id)getLastRunTime
{
  GEOConfigGetDouble();

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
}

- (void)storeLastRunTime:(id)a3
{
  id v4 = (NSDate *)a3;
  [(NSDate *)v4 timeIntervalSinceReferenceDate];
  GEOConfigSetDouble();
  lastRunTime = self->_lastRunTime;
  self->_lastRunTime = v4;
}

- (id)collectorUploadSession
{
  v3 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.apple.geocorrectiond.taggedloc"];
  objc_msgSend(v3, "set_allowsExpensiveAccess:", 0);
  objc_msgSend(v3, "set_requiresPowerPluggedIn:", 1);
  [v3 setDiscretionary:1];
  [v3 setAllowsConstrainedNetworkAccess:0];
  [v3 setSessionSendsLaunchEvents:1];
  id v4 = +[NSURLSession sessionWithConfiguration:v3 delegate:self delegateQueue:0];

  return v4;
}

- (id)buildUploadFileName
{
  +[NSDate timeIntervalSinceReferenceDate];
  return +[NSString stringWithFormat:@"%@_%llu", @"taggedLocUpload", (unint64_t)v2];
}

- (id)startTimeFromUploadFileName:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@"_"];
  if ([v3 count] == (id)2)
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    unsigned int v5 = [v4 isEqualToString:@"taggedLocUpload"];

    id v6 = 0;
    if (v5)
    {
      id v7 = objc_alloc_init((Class)NSNumberFormatter);
      [v7 setNumberStyle:0];
      id v8 = [v3 objectAtIndexedSubscript:1];
      v9 = [v7 numberFromString:v8];

      if (v9)
      {
        [v9 doubleValue];
        id v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      }
      else
      {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)geocorrectiondUploadDir
{
  double v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 objectAtIndex:0];
  id v4 = [v3 stringByAppendingPathComponent:@"com.apple.geocorrectiond"];
  unsigned int v5 = [v4 stringByAppendingPathComponent:@"upload"];
  char v15 = 0;
  id v6 = +[NSFileManager defaultManager];
  unsigned __int8 v7 = [v6 fileExistsAtPath:v5 isDirectory:&v15];

  if (v7) {
    goto LABEL_4;
  }
  id v8 = +[NSFileManager defaultManager];
  id v14 = 0;
  unsigned __int8 v9 = [v8 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v10 = v14;

  if (v9)
  {

LABEL_4:
    id v11 = v5;
    goto LABEL_8;
  }
  objc_super v12 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v5;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "unable to create cache dir %@ (%@)", buf, 0x16u);
  }

  id v11 = 0;
LABEL_8:

  return v11;
}

- (BOOL)uploadRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = GEOGetURL();
  if (v5)
  {
    id v6 = [(MCTaggedLocationCollector *)self buildUploadFileName];
    unsigned __int8 v7 = [(MCTaggedLocationCollector *)self geocorrectiondUploadDir];
    if (v7)
    {
      id v8 = [(MCTaggedLocationCollector *)self geocorrectiondUploadDir];
      unsigned __int8 v9 = [v8 stringByAppendingPathComponent:v6];

      v21[1] = 0;
      char v10 = GEOCreateBodyDataForProtocolBufferRequest();
      id v11 = 0;
      objc_super v12 = v11;
      if (v10)
      {
        v21[0] = 0;
        unsigned __int8 v13 = [v11 writeToFile:v9 options:0 error:v21];
        id v14 = v21[0];
        if (v13)
        {
          char v15 = +[NSMutableURLRequest requestWithURL:v5];
          [v15 setHTTPMethod:@"POST"];
          v20 = [(MCTaggedLocationCollector *)self collectorUploadSession];
          v16 = +[NSURL fileURLWithPath:v9];
          v17 = [v20 uploadTaskWithRequest:v15 fromFile:v16];

          [v17 setTaskDescription:v6];
          GEOConfigGetDouble();
          objc_msgSend(v17, "set_timeoutIntervalForResource:");
          [v17 resume];
          BOOL v18 = v17 != 0;
        }
        else
        {
          char v15 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v23 = v9;
            __int16 v24 = 2112;
            v25 = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "could not write request to %@ : (%@)", buf, 0x16u);
          }
          BOOL v18 = 0;
        }
      }
      else
      {
        id v14 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "could not serialize request", buf, 2u);
        }
        BOOL v18 = 0;
      }
    }
    else
    {
      unsigned __int8 v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "missing upload dir", buf, 2u);
      }
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a5;
  id v8 = [a4 taskDescription];
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C39C;
  block[3] = &unk_10001D698;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(workQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_lastRunTime, 0);
}

@end