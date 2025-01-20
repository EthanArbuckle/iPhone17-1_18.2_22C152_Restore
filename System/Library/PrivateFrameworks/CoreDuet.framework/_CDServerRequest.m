@interface _CDServerRequest
+ (id)getHTTPModifiedSinceFromHeaders:(uint64_t)a1;
+ (void)addHTTPIfModifiedSinceToHeaders:(void *)a3 date:;
- (NSString)description;
- (_CDServerRequest)init;
- (id)_requestForMethod:(uint64_t)a3 URI:(void *)a4 queryItems:(void *)a5 headers:(void *)a6 body:(double)a7 timeoutInterval:;
- (id)startDataTaskWithURI:(void *)a3 headers:(void *)a4 timeoutInterval:(double)a5 responseHandler:;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)_newDefaultSession;
@end

@implementation _CDServerRequest

- (_CDServerRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)_CDServerRequest;
  v2 = [(_CDServerRequest *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    sessionQueue = v2->_sessionQueue;
    v2->_sessionQueue = v3;

    [(NSOperationQueue *)v2->_sessionQueue setMaxConcurrentOperationCount:1];
  }
  return v2;
}

- (void)_newDefaultSession
{
  v1 = a1;
  if (a1)
  {
    v2 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    v1 = objc_msgSend(MEMORY[0x1E4F290E0], "sessionWithConfiguration:delegate:delegateQueue:", v2, v1, objc_getProperty(v1, v3, 16, 1));
  }
  return v1;
}

- (id)_requestForMethod:(uint64_t)a3 URI:(void *)a4 queryItems:(void *)a5 headers:(void *)a6 body:(double)a7 timeoutInterval:
{
  if (a1)
  {
    v12 = (void *)MEMORY[0x1E4F1CB10];
    id v13 = a6;
    id v14 = a5;
    id v15 = a4;
    id v16 = a2;
    v17 = [v12 URLWithString:a3];
    v18 = [MEMORY[0x1E4F29088] componentsWithURL:v17 resolvingAgainstBaseURL:1];
    [v18 setQueryItems:v15];

    v19 = [v18 URL];

    v20 = [MEMORY[0x1E4F28E88] requestWithURL:v19 cachePolicy:1 timeoutInterval:a7];
    [v20 setHTTPMethod:v16];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __82___CDServerRequest__requestForMethod_URI_queryItems_headers_body_timeoutInterval___block_invoke;
    v23[3] = &unk_1E560E620;
    id v21 = v20;
    id v24 = v21;
    [v14 enumerateKeysAndObjectsUsingBlock:v23];

    [v21 setHTTPBody:v13];
  }
  else
  {
    id v21 = 0;
  }
  return v21;
}

- (id)startDataTaskWithURI:(void *)a3 headers:(void *)a4 timeoutInterval:(double)a5 responseHandler:
{
  id v5 = a1;
  if (a1)
  {
    id v9 = a4;
    v10 = -[_CDServerRequest _requestForMethod:URI:queryItems:headers:body:timeoutInterval:]((uint64_t)v5, @"GET", a2, 0, a3, 0, a5);
    objc_setProperty_atomic(v5, v11, v10, 32);

    objc_setProperty_atomic_copy(v5, v12, v9, 8);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[_CDServerRequest startDataTaskWithURI:headers:timeoutInterval:responseHandler:](v5, v13);
    }
    id v14 = -[_CDServerRequest _newDefaultSession](v5);
    objc_setProperty_atomic(v5, v15, v14, 24);

    v17 = objc_msgSend(objc_getProperty(v5, v16, 24, 1), "configuration");
    [v17 timeoutIntervalForResource];
    objc_msgSend(v17, "setTimeoutIntervalForRequest:");
    id v19 = objc_getProperty(v5, v18, 24, 1);
    objc_msgSend(v19, "dataTaskWithRequest:", objc_getProperty(v5, v20, 32, 1));
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    [v5 resume];
  }
  return v5;
}

- (NSString)description
{
  SEL v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v4);
  if (self) {
    id Property = objc_getProperty(self, v5, 32, 1);
  }
  else {
    id Property = 0;
  }
  v8 = [Property URL];
  id v9 = [v8 absoluteString];
  v10 = [v3 stringWithFormat:@"%@<%p>{ url=%@ }", v6, self, v9];

  return (NSString *)v10;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (self) {
    id Property = objc_getProperty(self, v7, 24, 1);
  }
  else {
    id Property = 0;
  }
  if (Property == v6)
  {
    if (self)
    {
      id v12 = objc_getProperty(self, v7, 8, 1);
      objc_setProperty_atomic_copy(self, v13, 0, 8);
      if (v12) {
        (*((void (**)(id, void, void, void, id))v12 + 2))(v12, 0, 0, 0, v8);
      }
      id v15 = objc_getProperty(self, v14, 24, 1);
    }
    else
    {
      id v12 = 0;
      id v15 = 0;
    }
    [v15 invalidateAndCancel];
    if (self) {
      objc_setProperty_atomic(self, v16, 0, 24);
    }
  }
  else
  {
    v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[_CDServerRequest URLSession:didBecomeInvalidWithError:]((int)v6, (const char *)(self == 0), self);
    }
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  if (self) {
    id Property = objc_getProperty(self, v10, 24, 1);
  }
  else {
    id Property = 0;
  }
  if (Property == v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[_CDServerRequest URLSession:downloadTask:didFinishDownloadingToURL:]();
    }
    SEL v13 = [v9 response];
    objc_opt_class();
    if (!((self == 0) | ((objc_opt_isKindOfClass() & 1) == 0)))
    {
      objc_setProperty_atomic(self, v15, v13, 40);
      v17 = (void (**)(id, void *, id, id, void))objc_getProperty(self, v16, 8, 1);
      objc_setProperty_atomic_copy(self, v18, 0, 8);
      if (v17)
      {
        id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "taskIdentifier"));
        id v21 = objc_getProperty(self, v20, 40, 1);
        v17[2](v17, v19, v21, v11, 0);
      }
    }
  }
  else
  {
    SEL v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[_CDServerRequest URLSession:didBecomeInvalidWithError:]((int)v8, (const char *)(self == 0), self);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v9 = a3;
  id v11 = a4;
  if (self) {
    id Property = objc_getProperty(self, v10, 24, 1);
  }
  else {
    id Property = 0;
  }
  if (Property == v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[_CDServerRequest URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:]();
    }
  }
  else
  {
    SEL v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[_CDServerRequest URLSession:didBecomeInvalidWithError:]((int)v9, (const char *)(self == 0), self);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  if (self) {
    id Property = objc_getProperty(self, v10, 24, 1);
  }
  else {
    id Property = 0;
  }
  if (Property != v8)
  {
    SEL v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[_CDServerRequest URLSession:task:didCompleteWithError:]((int)v8, (const char *)(self != 0), self);
    }
    goto LABEL_28;
  }
  BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (!v11)
  {
    if (v15)
    {
      -[_CDServerRequest URLSession:task:didCompleteWithError:]();
      if (!self) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!v15)
  {
LABEL_11:
    if (!self) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  -[_CDServerRequest URLSession:task:didCompleteWithError:]();
  if (!self) {
    goto LABEL_13;
  }
LABEL_12:
  if (!objc_getProperty(self, v16, 32, 1))
  {
LABEL_13:
    SEL v18 = [v9 originalRequest];
    SEL v20 = (void *)[v18 mutableCopy];
    if (self) {
      objc_setProperty_atomic(self, v19, v20, 32);
    }
  }
  if (!self || !objc_getProperty(self, v17, 40, 1))
  {
    v22 = [v9 response];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (self && (isKindOfClass & 1) != 0) {
      objc_setProperty_atomic(self, v24, v22, 40);
    }
  }
  if (self)
  {
    SEL v13 = objc_getProperty(self, v21, 8, 1);
    objc_setProperty_atomic_copy(self, v25, 0, 8);
    if (v13)
    {
      v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "taskIdentifier"));
      id v29 = objc_getProperty(self, v28, 40, 1);
      id v31 = objc_getProperty(self, v30, 48, 1);
      ((void (*)(NSObject *, void *, id, id, id))v13[2].isa)(v13, v27, v29, v31, v11);
    }
    id v32 = objc_getProperty(self, v26, 24, 1);
  }
  else
  {
    SEL v13 = 0;
    id v32 = 0;
  }
  [v32 invalidateAndCancel];
  if (self) {
    objc_setProperty_atomic(self, v33, 0, 24);
  }
LABEL_28:
}

+ (void)addHTTPIfModifiedSinceToHeaders:(void *)a3 date:
{
  id v8 = a2;
  id v4 = a3;
  self;
  if (v8 && v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v5 setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
    id v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
    [v5 setTimeZone:v6];

    v7 = [v5 stringFromDate:v4];
    [v8 setObject:v7 forKeyedSubscript:@"If-Modified-Since"];
  }
}

+ (id)getHTTPModifiedSinceFromHeaders:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (v2)
  {
    SEL v3 = [v2 objectForKeyedSubscript:@"Last-Modified"];
    id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v4 setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
    id v5 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
    [v4 setTimeZone:v5];

    id v6 = [v4 dateFromString:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong(&self->_responseHandler, 0);
}

- (void)startDataTaskWithURI:(void *)a1 headers:(const char *)a2 timeoutInterval:responseHandler:.cold.1(void *a1, const char *a2)
{
  objc_getProperty(a1, a2, 32, 1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, MEMORY[0x1E4F14500], v2, "Will start data task with request: %@", v3, v4, v5, v6, v7);
}

- (void)URLSession:(void *)a3 didBecomeInvalidWithError:.cold.1(int a1, const char *a2, void *a3)
{
  if ((a2 & 1) == 0) {
    OUTLINED_FUNCTION_2_4(a1, a2, a3);
  }
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_5(&dword_18ECEB000, MEMORY[0x1E4F14500], v3, "Delegate session %@ is NOT the same as our session %@", v4, v5, v6, v7, v8);
}

- (void)URLSession:(void *)a1 downloadTask:(uint64_t)a2 didFinishDownloadingToURL:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unexpected exception processing download of '%@': %@", buf, 0x16u);
}

- (void)URLSession:downloadTask:didFinishDownloadingToURL:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "%@ finished download", v1, v2, v3, v4, v5);
}

- (void)URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  __int16 v5 = 2048;
  uint64_t v6 = v1;
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Session task %@ did send data: %lld of %lld", v2, 0x20u);
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "%@ finished", v1, v2, v3, v4, v5);
}

- (void)URLSession:task:didCompleteWithError:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_5(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "%@ finished with error %@", v1, v2, v3, v4, v5);
}

- (void)URLSession:(int)a1 task:(const char *)a2 didCompleteWithError:(void *)a3 .cold.3(int a1, const char *a2, void *a3)
{
  if (a2) {
    OUTLINED_FUNCTION_2_4(a1, a2, a3);
  }
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_5(&dword_18ECEB000, MEMORY[0x1E4F14500], v3, "Delegate session %@ is NOT the same as our session %@", v4, v5, v6, v7, v8);
}

@end