@interface PDURLResponse
- (NSString)operationID;
- (NSURL)responseFileURL;
- (NSURLSessionTaskMetrics)metrics;
- (id)createFileHandleForURL:(id)a3;
- (id)createResponseFileURL;
- (int64_t)bytesReceived;
- (void)_simulateHTTPResponseWithURL:(id)a3 statusCode:(int64_t)a4 headers:(id)a5;
- (void)cleanupFileResources;
- (void)setIsComplete:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)setOperationID:(id)a3;
@end

@implementation PDURLResponse

- (id)createResponseFileURL
{
  v2 = [(PDURLResponse *)self operationID];
  v3 = +[NSString stringWithFormat:@"%@-response.data", v2];

  v4 = sub_1000D0CEC();
  v5 = sub_1000D13D4((uint64_t)v4);
  v6 = [v5 URLByAppendingPathComponent:v3 isDirectory:0];

  return v6;
}

- (id)createFileHandleForURL:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_13:
    v11 = 0;
    goto LABEL_17;
  }
  v5 = +[PDUserDefaults sharedDefaults];
  unsigned int v6 = [v5 enableVerboseLogging];

  if (v6)
  {
    CLSInitLog();
    v7 = (void *)CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
    {
      v21 = v7;
      v22 = [(PDURLResponse *)self operationID];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v22;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%{public}@ createFileHandleForURL responseDataURL:%@", buf, 0x16u);
    }
  }
  v8 = +[NSFileManager defaultManager];
  v9 = [v4 path];
  unsigned __int8 v10 = [v8 createFileAtPath:v9 contents:0 attributes:0];

  if ((v10 & 1) == 0)
  {
    CLSInitLog();
    v18 = (void *)CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_ERROR))
    {
      v23 = v18;
      v24 = [(PDURLResponse *)self operationID];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v24;
      __int16 v30 = 2114;
      id v31 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@ createFileHandleForURL failed to create file at '%{public}@'", buf, 0x16u);
    }
    goto LABEL_13;
  }
  id v28 = 0;
  v11 = +[NSFileHandle fileHandleForWritingToURL:v4 error:&v28];
  id v12 = v28;
  if (v11)
  {
    *(void *)buf = 0;
    id v27 = 0;
    unsigned __int8 v13 = [v11 seekToEndReturningOffset:buf error:&v27];
    id v14 = v27;

    if ((v13 & 1) == 0)
    {
      CLSInitLog();
      v15 = (void *)CLSLogOperations;
      if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        v17 = [(PDURLResponse *)self operationID];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v17;
        __int16 v30 = 2114;
        id v31 = v4;
        __int16 v32 = 2114;
        id v33 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ createFileHandleForURL failed to create fileHandle for file at '%{public}@' error:%{public}@", buf, 0x20u);
      }
    }
    id v12 = v14;
  }
  else
  {
    CLSInitLog();
    v19 = (void *)CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
    {
      v25 = v19;
      v26 = [(PDURLResponse *)self operationID];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v26;
      __int16 v30 = 2112;
      id v31 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%{public}@ createFileHandleForURL failed to open fileHandle error:%@", buf, 0x16u);
    }
  }

LABEL_17:

  return v11;
}

- (void)cleanupFileResources
{
  responseFileHandle = self->_responseFileHandle;
  if (responseFileHandle)
  {
    id v21 = 0;
    unsigned __int8 v4 = [(NSFileHandle *)responseFileHandle closeAndReturnError:&v21];
    v5 = (NSURL *)v21;
    if ((v4 & 1) == 0)
    {
      CLSInitLog();
      unsigned int v6 = CLSLogOperations;
      if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_ERROR))
      {
        operationID = self->_operationID;
        *(_DWORD *)buf = 138543618;
        v23 = operationID;
        __int16 v24 = 2114;
        v25 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@ PDURLResponse cleanup failed to close filehandle: error:%{public}@", buf, 0x16u);
      }
    }
    v7 = self->_responseFileHandle;
    self->_responseFileHandle = 0;
  }
  responseFileURL = self->_responseFileURL;
  if (responseFileURL)
  {
    v9 = [(NSURL *)responseFileURL path];
    unsigned __int8 v10 = self->_responseFileURL;
    v11 = self->_responseFileURL;
    self->_responseFileURL = 0;

    if (v9)
    {
      id v12 = +[NSFileManager defaultManager];
      unsigned int v13 = [v12 fileExistsAtPath:v9];

      if (v13)
      {
        id v14 = +[NSFileManager defaultManager];
        id v20 = 0;
        unsigned __int8 v15 = [v14 removeItemAtURL:v10 error:&v20];
        id v16 = v20;

        if ((v15 & 1) == 0)
        {
          CLSInitLog();
          v17 = CLSLogOperations;
          if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_ERROR))
          {
            v19 = self->_operationID;
            *(_DWORD *)buf = 138543874;
            v23 = v19;
            __int16 v24 = 2114;
            v25 = v10;
            __int16 v26 = 2114;
            id v27 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@ cleanup failed to remove fileURL:%{public}@ error:%{public}@", buf, 0x20u);
          }
        }
      }
    }
  }
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (void)setOperationID:(id)a3
{
}

- (int64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (NSURL)responseFileURL
{
  return self->_responseFileURL;
}

- (NSURLSessionTaskMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong((id *)&self->_urlResponse, 0);
  objc_storeStrong((id *)&self->_returnFileHandle, 0);
  objc_storeStrong((id *)&self->_responseFileHandle, 0);
  objc_storeStrong((id *)&self->_responseFileURL, 0);
  objc_storeStrong((id *)&self->_memMappedBuffer, 0);

  objc_storeStrong((id *)&self->_buffer, 0);
}

- (void)_simulateHTTPResponseWithURL:(id)a3 statusCode:(int64_t)a4 headers:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  if (a4 == -1)
  {
    urlResponse = self->_urlResponse;
    self->_urlResponse = 0;
  }
  else
  {
    v9 = (NSHTTPURLResponse *)[objc_alloc((Class)NSHTTPURLResponse) initWithURL:v11 statusCode:a4 HTTPVersion:@"1.1" headerFields:v8];
    urlResponse = self->_urlResponse;
    self->_urlResponse = v9;
  }
}

@end