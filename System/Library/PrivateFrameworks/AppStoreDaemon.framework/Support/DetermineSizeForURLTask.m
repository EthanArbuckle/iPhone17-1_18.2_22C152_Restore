@interface DetermineSizeForURLTask
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)main;
@end

@implementation DetermineSizeForURLTask

- (void)main
{
  v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  semaphore = self->_semaphore;
  self->_semaphore = v3;

  v5 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  v6 = +[NSURLSession sessionWithConfiguration:v5 delegate:self delegateQueue:0];
  session = self->_session;
  self->_session = v6;

  v8 = +[NSMutableURLRequest requestWithURL:self->_url];
  [v8 setHTTPMethod:@"HEAD"];
  [v8 setCachePolicy:1];
  [v8 setTimeoutInterval:30.0];
  v9 = sub_100301DF0();
  [v8 setHTTPUserAgent:v9];

  v10 = [(NSURLSession *)self->_session dataTaskWithRequest:v8];
  v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    url = self->_url;
    int v17 = 138412802;
    v18 = logKey;
    __int16 v19 = 2114;
    v20 = url;
    __int16 v21 = 2114;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%@] Running HEAD operation to get size for URL: %{public}@ task: %{public}@", (uint8_t *)&v17, 0x20u);
  }

  [v10 resume];
  v14 = self->_semaphore;
  [v8 timeoutInterval];
  dispatch_time_t v16 = dispatch_time(0, (uint64_t)((v15 + v15) * 1000000000.0));
  dispatch_semaphore_wait(v14, v16);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a4;
  v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    logKey = self->_logKey;
    url = self->_url;
    int v10 = 138412546;
    v11 = logKey;
    __int16 v12 = 2114;
    v13 = url;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%@] Unexpected data received for URL: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  [v6 cancel];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  v9 = (void (**)(id, uint64_t))a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v10 = v8;
  }
  else {
    int v10 = 0;
  }
  id v11 = v10;
  if ((uint64_t)[v11 statusCode] < 200 || (uint64_t)objc_msgSend(v11, "statusCode") > 299)
  {
    v20 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      logKey = self->_logKey;
      id v27 = [v11 statusCode];
      url = self->_url;
      *(_DWORD *)buf = 138412802;
      v36 = logKey;
      __int16 v37 = 2048;
      id v38 = v27;
      __int16 v39 = 2114;
      v40 = url;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%@] Invalid status: %ld for URL: %{public}@", buf, 0x20u);
    }

    NSErrorUserInfoKey v31 = NSDebugDescriptionErrorKey;
    __int16 v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Invalid response, status code: %ld", [v11 statusCode]);
    v32 = v21;
    v22 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];

    v23 = +[NSError errorWithDomain:ASDErrorDomain code:507 userInfo:v22];
    [(Task *)self completeWithError:v23];
  }
  else
  {
    id v12 = [v11 expectedContentLength];
    v13 = ASDLogHandleForCategory();
    v14 = v13;
    if ((uint64_t)v12 <= 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v29 = self->_logKey;
        v30 = self->_url;
        *(_DWORD *)buf = 138412802;
        v36 = v29;
        __int16 v37 = 2048;
        id v38 = v12;
        __int16 v39 = 2114;
        v40 = v30;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%@] Invalid size: %lld for URL: %{public}@", buf, 0x20u);
      }

      NSErrorUserInfoKey v33 = NSDebugDescriptionErrorKey;
      CFStringRef v34 = @"Invalid response, expected content length unknown";
      v24 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v25 = +[NSError errorWithDomain:ASDErrorDomain code:507 userInfo:v24];
      [(Task *)self completeWithError:v25];
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        double v15 = self->_logKey;
        id v16 = [v11 expectedContentLength];
        int v17 = self->_url;
        *(_DWORD *)buf = 138412802;
        v36 = v15;
        __int16 v37 = 2048;
        id v38 = v16;
        __int16 v39 = 2114;
        v40 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@] Found size: %lld for URL: %{public}@", buf, 0x20u);
      }

      v18 = +[NSNumber numberWithLongLong:v12];
      contentLength = self->_contentLength;
      self->_contentLength = v18;

      [(Task *)self completeWithSuccess];
    }
  }
  v9[2](v9, 1);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6 = a5;
  if (v6)
  {
    v7 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      logKey = self->_logKey;
      url = self->_url;
      int v11 = 138412802;
      id v12 = logKey;
      __int16 v13 = 2114;
      v14 = url;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%@] Failed to find size for URL: %{public}@ error: %{public}@", (uint8_t *)&v11, 0x20u);
    }

    id v8 = ASDErrorWithSafeUserInfo();
    [(Task *)self completeWithError:v8];
  }
  [(NSURLSession *)self->_session invalidateAndCancel];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLength, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end