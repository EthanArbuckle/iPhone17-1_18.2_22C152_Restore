@interface CLTileDownloadRequest
- (CLTileDownloadRequest)initWithQueue:(id)a3;
- (NSURL)decompressionDestination;
- (NSURLSession)session;
- (NSURLSessionDownloadTask)task;
- (OS_dispatch_queue)queue;
- (id).cxx_construct;
- (id)decompressionCompletionHandler;
- (void)cancel;
- (void)dealloc;
- (void)downloadWithURLRequest:(id)a3 withDecompressionURL:(id)a4 completionHandler:(id)a5;
- (void)onDownloadCompleted:(id)a3 withResponse:(id)a4 withError:(id)a5;
- (void)serveCompletionHandler:(id)a3 withResponse:(id)a4 withError:(id)a5;
- (void)setDecompressionCompletionHandler:(id)a3;
- (void)setDecompressionDestination:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation CLTileDownloadRequest

- (CLTileDownloadRequest)initWithQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLTileDownloadRequest;
  v4 = [(CLTileDownloadRequest *)&v7 init];
  v5 = v4;
  if (v4) {
    [(CLTileDownloadRequest *)v4 setQueue:a3];
  }
  return v5;
}

- (void)downloadWithURLRequest:(id)a3 withDecompressionURL:(id)a4 completionHandler:(id)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)[(CLTileDownloadRequest *)self queue]);
  [(CLTileDownloadRequest *)self setDecompressionDestination:a4];
  [(CLTileDownloadRequest *)self setDecompressionCompletionHandler:a5];
  [(CLTileDownloadRequest *)self setSession:getSharedSessionInQueue([(CLTileDownloadRequest *)self queue])];
  ptr = self->_callbackValidity.fToken.__ptr_;
  cntrl = self->_callbackValidity.fToken.__cntrl_;
  if (cntrl)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 2, 1uLL, memory_order_relaxed);
    sub_1000038A0((std::__shared_weak_count *)cntrl);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3321888768;
  v11[2] = sub_100006390;
  v11[3] = &unk_10000C6A0;
  v11[5] = ptr;
  v12 = (std::__shared_weak_count *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 2, 1uLL, memory_order_relaxed);
  }
  v11[4] = self;
  [(CLTileDownloadRequest *)self setTask:[(NSURLSession *)[(CLTileDownloadRequest *)self session] downloadTaskWithRequest:a3 completionHandler:v11]];
  [(NSURLSessionDownloadTask *)[(CLTileDownloadRequest *)self task] resume];
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (void)cancel
{
  dispatch_assert_queue_V2((dispatch_queue_t)[(CLTileDownloadRequest *)self queue]);
  [(NSURLSessionDownloadTask *)[(CLTileDownloadRequest *)self task] cancel];
  [(CLTileDownloadRequest *)self setTask:0];
  [(CLTileDownloadRequest *)self setDecompressionDestination:0];
  [(CLTileDownloadRequest *)self setDecompressionCompletionHandler:0];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLTileDownloadRequest;
  [(CLTileDownloadRequest *)&v2 dealloc];
}

- (void)onDownloadCompleted:(id)a3 withResponse:(id)a4 withError:(id)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)[(CLTileDownloadRequest *)self queue]);
  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C6D0);
  }
  v9 = qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290307;
    int v30 = 0;
    __int16 v31 = 2082;
    v32 = "";
    __int16 v33 = 2113;
    id v34 = a3;
    __int16 v35 = 2113;
    v36 = a4;
    __int16 v37 = 2113;
    v38 = (CLTileDownloadRequest *)[a5 description];
    __int16 v39 = 2050;
    id v40 = [(CLTileDownloadRequest *)self decompressionCompletionHandler];
    __int16 v41 = 2050;
    v42 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TilesService onDowloadCompleted\", \"location\":%{private, location:escape_only}@, \"response\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@, \"decompressionCompletionHandler\":\"%{public}p\", \"self\":\"%{public}p\"}", buf, 0x44u);
  }
  if ([(CLTileDownloadRequest *)self decompressionCompletionHandler])
  {
    if (a5)
    {
      v10 = self;
      v11 = 0;
      id v12 = a4;
      v13 = (NSError *)a5;
LABEL_8:
      [(CLTileDownloadRequest *)v10 serveCompletionHandler:v11 withResponse:v12 withError:v13];
      return;
    }
    if (a3)
    {
      v15 = (const char *)objc_msgSend(objc_msgSend(a3, "path"), "UTF8String");
      if (!v15) {
        sub_1000078F0();
      }
      char v16 = decompress(v15, [(NSString *)[(NSURL *)[(CLTileDownloadRequest *)self decompressionDestination] path] UTF8String]);
      id v28 = 0;
      if (![+[NSFileManager defaultManager] removeItemAtURL:a3 error:&v28]|| v28)
      {
        if (qword_100010AE0 != -1) {
          dispatch_once(&qword_100010AE0, &stru_10000C6D0);
        }
        v17 = qword_100010AE8;
        if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_ERROR))
        {
          id v18 = [v28 description];
          *(_DWORD *)buf = 68289795;
          int v30 = 0;
          __int16 v31 = 2082;
          v32 = "";
          __int16 v33 = 2113;
          id v34 = a3;
          __int16 v35 = 2113;
          v36 = v18;
          __int16 v37 = 2050;
          v38 = self;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TilesService unable to remove file at location\", \"location\":%{private, location:escape_only}@, \"fileRemovalError\":%{private, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
          if (qword_100010AE0 != -1) {
            dispatch_once(&qword_100010AE0, &stru_10000C6D0);
          }
        }
        v19 = qword_100010AE8;
        if (os_signpost_enabled((os_log_t)qword_100010AE8))
        {
          id v20 = [v28 description];
          *(_DWORD *)buf = 68289795;
          int v30 = 0;
          __int16 v31 = 2082;
          v32 = "";
          __int16 v33 = 2113;
          id v34 = a3;
          __int16 v35 = 2113;
          v36 = v20;
          __int16 v37 = 2050;
          v38 = self;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#TilesService unable to remove file at location", "{\"msg%{public}.0s\":\"#TilesService unable to remove file at location\", \"location\":%{private, location:escape_only}@, \"fileRemovalError\":%{private, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
        }
      }
      if (v16)
      {
        if (qword_100010AE0 != -1) {
          dispatch_once(&qword_100010AE0, &stru_10000C6D0);
        }
        v21 = qword_100010AE8;
        if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (void *)(int)[a4 statusCode];
          v23 = [(CLTileDownloadRequest *)self decompressionDestination];
          *(_DWORD *)buf = 68289795;
          int v30 = 0;
          __int16 v31 = 2082;
          v32 = "";
          __int16 v33 = 2050;
          id v34 = v22;
          __int16 v35 = 2113;
          v36 = v23;
          __int16 v37 = 2050;
          v38 = self;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TilesService Successfully downloaded and decompressed file\", \"statusCode\":%{public}ld, \"decompressionDestination\":%{private, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
        }
        v11 = [(CLTileDownloadRequest *)self decompressionDestination];
        v10 = self;
        id v12 = a4;
        v13 = 0;
      }
      else
      {
        [+[NSFileManager defaultManager] removeItemAtURL:[(CLTileDownloadRequest *)self decompressionDestination] error:0];
        v13 = +[NSError errorWithDomain:@"kCLTileErrorDomain" code:1 userInfo:0];
        v10 = self;
        v11 = 0;
        id v12 = a4;
      }
      goto LABEL_8;
    }
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C6D0);
    }
    v24 = qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_ERROR))
    {
      id v25 = [0 path];
      *(_DWORD *)buf = 68289539;
      int v30 = 0;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2113;
      id v34 = v25;
      __int16 v35 = 2050;
      v36 = self;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TilesService did not receive a valid download location\", \"locationPath\":%{private, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x26u);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C6D0);
      }
    }
    v26 = qword_100010AE8;
    if (os_signpost_enabled((os_log_t)qword_100010AE8))
    {
      id v27 = [0 path];
      *(_DWORD *)buf = 68289539;
      int v30 = 0;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2113;
      id v34 = v27;
      __int16 v35 = 2050;
      v36 = self;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#TilesService did not receive a valid download location", "{\"msg%{public}.0s\":\"#TilesService did not receive a valid download location\", \"locationPath\":%{private, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x26u);
    }
  }
  else
  {
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C6D0);
    }
    v14 = qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v30 = 0;
      __int16 v31 = 2082;
      v32 = "";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TilesService task has already been served\"}", buf, 0x12u);
    }
  }
}

- (void)serveCompletionHandler:(id)a3 withResponse:(id)a4 withError:(id)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)[(CLTileDownloadRequest *)self queue]);
  v9 = [(CLTileDownloadRequest *)self decompressionCompletionHandler];
  v9[2](v9, a3, a4, a5);
  [(CLTileDownloadRequest *)self setDecompressionCompletionHandler:0];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  self->_session = (NSURLSession *)a3;
}

- (NSURLSessionDownloadTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (id)decompressionCompletionHandler
{
  return self->_decompressionCompletionHandler;
}

- (void)setDecompressionCompletionHandler:(id)a3
{
}

- (NSURL)decompressionDestination
{
  return self->_decompressionDestination;
}

- (void)setDecompressionDestination:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  self->_callbackValidity._vptr$CLCallbackDropManager = (void **)off_10000C498;
  v3 = (char *)operator new(0x20uLL);
  *((void *)v3 + 1) = 0;
  *((void *)v3 + 2) = 0;
  *(void *)v3 = off_10000C4D0;
  self->_callbackValidity.fToken.__cntrl_ = (__shared_weak_count *)v3;
  *((_DWORD *)v3 + 6) = 31337;
  self->_callbackValidity.fToken.__ptr_ = (int *)(v3 + 24);
  return self;
}

@end