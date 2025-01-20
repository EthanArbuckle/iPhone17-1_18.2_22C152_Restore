@interface PDURLRequestOperation
+ (id)appleIDSession;
+ (id)setAppleInternalHeadersForRequest:(id)a3;
+ (void)reset;
- (BOOL)hasBigResponses;
- (BOOL)httpRequestCompleted;
- (BOOL)httpRequestHadServerError;
- (BOOL)httpRequestHadTimeoutError;
- (BOOL)httpRequestSucceeded;
- (BOOL)processResponse:(id *)a3;
- (BOOL)requiresAuth;
- (BOOL)shouldProcessResponseBody;
- (BOOL)urlRequestAttempted;
- (BOOL)urlRequestFailed;
- (BOOL)verifyResponse;
- (BOOL)wantsToExecute;
- (BOOL)willAcceptResponseContentType:(id)a3;
- (NSData)requestData;
- (NSString)acceptContentType;
- (NSString)httpMethod;
- (NSString)requestContentType;
- (NSString)responseFailureCause;
- (NSURL)URL;
- (PDURLOperationStats)stats;
- (PDURLRequestOperation)initWithDatabase:(id)a3;
- (PDURLResponse)response;
- (double)timeoutIntervalForRequest;
- (id)_createRequestTask;
- (id)createNSURLRequest;
- (id)createSessionIfNeeded;
- (id)customRequestHeaders;
- (id)operationID;
- (id)sessionTaskForRequest:(id)a3 withData:(id)a4;
- (id)statusReport;
- (int64_t)clsErrorCode;
- (int64_t)clsErrorCodeForAuthenticationFailure;
- (int64_t)errorCodeForRequest;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_simulateResponseWithURL:(id)a3 statusCode:(int64_t)a4 headers:(id)a5 data:(id)a6 error:(id)a7;
- (void)abort;
- (void)abortWithError:(id)a3;
- (void)closeSession:(BOOL)a3;
- (void)didCompleteProcessingResponse;
- (void)execute;
- (void)flushCachedData;
- (void)handleHTTPStatusCode:(id)a3;
- (void)handleRequestError;
- (void)handleResponseBody:(BOOL)a3;
- (void)logHTTPHeaders:(id)a3 withMessage:(id)a4;
- (void)markAsFinished;
- (void)prepareForNextRequest;
- (void)prepareForNextRequestWithResponse:(id)a3;
- (void)releaseResponse;
- (void)requestCompletedWith:(id)a3 error:(id)a4;
- (void)rescheduleOperation;
- (void)sessionFailedWithError:(id)a3;
- (void)setAuthHeadersForRequest:(id)a3;
- (void)setClsErrorCode:(int64_t)a3;
- (void)setHeadersForRequest:(id)a3;
- (void)setStats:(id)a3;
- (void)setTimeoutIntervalForRequest:(double)a3;
- (void)setUrlRequestAttempted:(BOOL)a3;
@end

@implementation PDURLRequestOperation

+ (void)reset
{
  if (qword_10023E6B8 != -1) {
    dispatch_once(&qword_10023E6B8, &stru_1001F4BD0);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&dword_10023E6AC);
  v2 = (void *)qword_10023E6B0;
  qword_10023E6B0 = 0;

  if (qword_10023E6B8 != -1) {
    dispatch_once(&qword_10023E6B8, &stru_1001F4BD0);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_10023E6AC);
}

+ (id)appleIDSession
{
  if (qword_10023E6B8 != -1) {
    dispatch_once(&qword_10023E6B8, &stru_1001F4BD0);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&dword_10023E6AC);
  v2 = (void *)qword_10023E6B0;
  if (!qword_10023E6B0)
  {
    id v3 = [objc_alloc((Class)AKAppleIDSession) initWithIdentifier:@"ClassKitServiceID"];
    v4 = (void *)qword_10023E6B0;
    qword_10023E6B0 = (uint64_t)v3;

    v2 = (void *)qword_10023E6B0;
  }
  id v5 = v2;
  if (qword_10023E6B8 != -1) {
    dispatch_once(&qword_10023E6B8, &stru_1001F4BD0);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_10023E6AC);

  return v5;
}

- (PDURLRequestOperation)initWithDatabase:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDURLRequestOperation;
  id v3 = [(PDOperation *)&v8 initWithDatabase:a3];
  v4 = v3;
  if (v3)
  {
    *(void *)(v3 + 90) = 0;
    v3[98] = 1;
    *(void *)(v3 + 194) = 0x404E000000000000;
    id v5 = sub_1000928A0((char *)[PDURLOperationStats alloc], v3);
    v6 = *(void **)(v4 + 154);
    *(void *)(v4 + 154) = v5;

    v4[138] = 0;
  }
  return (PDURLRequestOperation *)v4;
}

- (id)operationID
{
  if (*(NSError **)((char *)&self->_error + 2))
  {
    v8.receiver = self;
    v8.super_class = (Class)PDURLRequestOperation;
    id v3 = [(PDOperation *)&v8 operationID];
    +[NSString stringWithFormat:@"%@+%ld+%@", v3, *(NSUUID **)((char *)&self->_requestUUID + 2), *(NSError **)((char *)&self->_error + 2)];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PDURLRequestOperation;
    id v3 = [(PDOperation *)&v7 operationID];
    +[NSString stringWithFormat:@"%@+%ld", v3, *(NSUUID **)((char *)&self->_requestUUID + 2), v6];
  v4 = };

  return v4;
}

- (BOOL)hasBigResponses
{
  return 0;
}

- (void)prepareForNextRequest
{
  int v3 = [(PDURLRequestOperation *)self hasBigResponses];
  v4 = [PDURLResponse alloc];
  id v5 = [(PDURLRequestOperation *)self operationID];
  uint64_t v6 = sub_10010067C((id *)&v4->super.isa, v5, v3);

  [(PDURLRequestOperation *)self prepareForNextRequestWithResponse:v6];
}

- (void)prepareForNextRequestWithResponse:(id)a3
{
  id v4 = a3;
  id v5 = *(id *)((char *)&self->_error + 2);
  uint64_t v6 = +[NSUUID UUID];
  objc_super v7 = *(NSError **)((char *)&self->_error + 2);
  *(NSError **)((char *)&self->_error + 2) = v6;

  objc_super v8 = +[PDUserDefaults sharedDefaults];
  unsigned int v9 = [v8 enableVerboseLogging];

  if (v9)
  {
    CLSInitLog();
    v10 = (void *)CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
    {
      v17 = v10;
      v18 = objc_opt_class();
      id v19 = v18;
      v20 = [(PDURLRequestOperation *)self operationID];
      int v21 = 138543874;
      v22 = v18;
      __int16 v23 = 2114;
      v24 = v20;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "OPS: prepareForNextRequest %{public}@:%{public}@ (was %@)", (uint8_t *)&v21, 0x20u);
    }
  }
  v11 = *(void **)(&self->_urlRequestAttempted + 2);
  *(void *)(&self->_urlRequestAttempted + 2) = v4;
  id v12 = v4;

  v13 = sub_1000928A0((char *)[PDURLOperationStats alloc], self);
  v14 = *(PDURLResponse **)((char *)&self->_response + 2);
  *(PDURLResponse **)((char *)&self->_response + 2) = (PDURLResponse *)v13;

  *(NSString **)((char *)&self->_responseFailureCause + 2) = 0;
  v15 = *(void **)(&self->_wantsToExecute + 2);
  *(void *)(&self->_wantsToExecute + 2) = 0;

  v16 = *(NSMutableURLRequest **)((char *)&self->_request + 2);
  *(NSMutableURLRequest **)((char *)&self->_request + 2) = 0;
}

- (id)sessionTaskForRequest:(id)a3 withData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(PDOperation *)self isAborted];
  unsigned int v9 = 0;
  if (v6 && (v8 & 1) == 0)
  {
    if ([(PDOperation *)self isAborted])
    {
      [(PDURLRequestOperation *)self markAsFinished];
      unsigned int v9 = 0;
    }
    else
    {
      uint64_t v10 = [(PDURLRequestOperation *)self createSessionIfNeeded];
      v11 = *(void **)((char *)&self->_clsErrorCode + 2);
      *(int64_t *)((char *)&self->_clsErrorCode + 2) = v10;

      id v12 = *(void **)((char *)&self->_clsErrorCode + 2);
      if (v7) {
        [v12 uploadTaskWithRequest:v6 fromData:v7];
      }
      else {
      unsigned int v9 = [v12 dataTaskWithRequest:v6];
      }
    }
  }

  return v9;
}

- (id)_createRequestTask
{
  uint64_t v3 = [(PDURLRequestOperation *)self createNSURLRequest];
  id v4 = *(void **)(&self->_wantsToExecute + 2);
  *(void *)(&self->_wantsToExecute + 2) = v3;

  if ([(PDOperation *)self isAborted]) {
    goto LABEL_12;
  }
  if (!*(void *)(&self->_wantsToExecute + 2))
  {
    [(PDURLRequestOperation *)self markAsFinished];
LABEL_12:
    unsigned int v9 = 0;
    goto LABEL_13;
  }
  -[PDURLRequestOperation setHeadersForRequest:](self, "setHeadersForRequest:");
  if ([(PDOperation *)self isAborted]) {
    goto LABEL_12;
  }
  id v5 = [(PDURLRequestOperation *)self requestData];
  id v6 = *(NSString **)((char *)&self->_acceptContentType + 2);
  *(NSString **)((char *)&self->_acceptContentType + 2) = v5;

  id v7 = [*(id *)((char *)&self->_acceptContentType + 2) length];
  uint64_t v8 = *(uint64_t *)((char *)&self->_response + 2);
  if (v8) {
    *(void *)(v8 + 80) = v7;
  }
  if ([(PDOperation *)self isAborted] || [(PDOperation *)self isFinished]) {
    goto LABEL_12;
  }
  unsigned int v9 = [(PDURLRequestOperation *)self sessionTaskForRequest:*(void *)(&self->_wantsToExecute + 2) withData:*(NSString **)((char *)&self->_acceptContentType + 2)];
  if (!v9) {
    [(PDURLRequestOperation *)self abort];
  }
  uint64_t v10 = [*(id *)(&self->_wantsToExecute + 2) allHTTPHeaderFields];
  uint64_t v11 = objc_opt_class();
  id v12 = [(PDURLRequestOperation *)self operationID];
  v13 = +[NSString stringWithFormat:@"%@:%@ Request headers:", v11, v12];
  [(PDURLRequestOperation *)self logHTTPHeaders:v10 withMessage:v13];

LABEL_13:

  return v9;
}

- (BOOL)wantsToExecute
{
  return BYTE2(self->_executionsCount);
}

- (void)execute
{
  if (![(PDOperation *)self isFinished])
  {
    if ([(PDURLRequestOperation *)self wantsToExecute])
    {
      unint64_t v3 = *(unint64_t *)((char *)&self->_requestUUID + 2);
      if (v3 >= [(PDOperation *)self maxExecutionCount])
      {
        CLSInitLog();
        uint64_t v8 = (void *)CLSLogOperations;
        if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v9 = v8;
          uint64_t v10 = (__CFString *)objc_opt_class();
          uint64_t v11 = v10;
          id v12 = [(PDURLRequestOperation *)self operationID];
          int v18 = 138543618;
          CFStringRef v19 = v10;
          __int16 v20 = 2114;
          int v21 = v12;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "OPS: execution limited %{public}@:%{public}@", (uint8_t *)&v18, 0x16u);
        }
        if ([(PDURLRequestOperation *)self wantsToExecute]) {
          [(PDURLRequestOperation *)self rescheduleOperation];
        }
        [(PDURLRequestOperation *)self markAsFinished];
      }
      else
      {
        id v4 = +[PDUserDefaults sharedDefaults];
        unsigned int v5 = [v4 enableVerboseLogging];

        if (v5)
        {
          CLSInitLog();
          id v6 = (void *)CLSLogOperations;
          if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
          {
            if (*(NSUUID **)((char *)&self->_requestUUID + 2)) {
              CFStringRef v13 = @"again ";
            }
            else {
              CFStringRef v13 = &stru_1001F6580;
            }
            v14 = v6;
            v15 = objc_opt_class();
            id v16 = v15;
            v17 = [(PDURLRequestOperation *)self operationID];
            int v18 = 138412802;
            CFStringRef v19 = v13;
            __int16 v20 = 2114;
            int v21 = v15;
            __int16 v22 = 2114;
            __int16 v23 = v17;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "OPS: executing %@%{public}@:%{public}@", (uint8_t *)&v18, 0x20u);
          }
        }
        ++*(NSUUID **)((char *)&self->_requestUUID + 2);
        BYTE2(self->_executionsCount) = 0;
        [(PDURLRequestOperation *)self prepareForNextRequest];
        id v7 = [(PDURLRequestOperation *)self _createRequestTask];
        if (v7)
        {
          [(PDURLRequestOperation *)self setUrlRequestAttempted:1];
          [v7 resume];
        }
      }
    }
    else
    {
      [(PDURLRequestOperation *)self markAsFinished];
    }
  }
}

- (void)rescheduleOperation
{
  unint64_t v3 = +[PDUserDefaults sharedDefaults];
  unsigned int v4 = [v3 enableVerboseLogging];

  if (v4)
  {
    CLSInitLog();
    unsigned int v5 = (void *)CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
    {
      id v6 = v5;
      id v7 = objc_opt_class();
      id v8 = v7;
      unsigned int v9 = [(PDURLRequestOperation *)self operationID];
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      CFStringRef v13 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "OPS: rescheduled %{public}@:%{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (NSString)httpMethod
{
  return (NSString *)@"POST";
}

- (BOOL)requiresAuth
{
  return 1;
}

- (int64_t)clsErrorCodeForAuthenticationFailure
{
  if ([(PDOperation *)self requiresValidUser]) {
    return 10;
  }
  else {
    return 105;
  }
}

- (BOOL)willAcceptResponseContentType:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  uint64_t v5 = [(PDURLRequestOperation *)self acceptContentType];
  id v6 = (void *)v5;
  BOOL v7 = (v4 | v5) == 0;
  if (v4 && v5)
  {
    id v8 = [(PDURLRequestOperation *)self acceptContentType];
    BOOL v7 = [(id)v4 caseInsensitiveCompare:v8] == 0;
  }
  return v7;
}

- (id)createNSURLRequest
{
  if ([(PDOperation *)self isAborted])
  {
    id v3 = 0;
  }
  else
  {
    unint64_t v4 = [(PDURLRequestOperation *)self URL];
    uint64_t v5 = [(PDOperation *)self database];
    if (v4
      && ([v4 host],
          id v6 = objc_claimAutoreleasedReturnValue(),
          BOOL v7 = sub_100065140(v5, v6),
          v6,
          v7))
    {
      id v8 = +[PDUserDefaults sharedDefaults];
      unsigned int v9 = [v8 enableVerboseLogging];

      if (v9)
      {
        CLSInitLog();
        int v10 = [(PDOperation *)self logSubsystem];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v15 = objc_opt_class();
          id v16 = v15;
          v17 = [(PDURLRequestOperation *)self operationID];
          int v18 = [(PDURLRequestOperation *)self URL];
          int v19 = 138543874;
          __int16 v20 = v15;
          __int16 v21 = 2114;
          __int16 v22 = v17;
          __int16 v23 = 2114;
          v24 = v18;
          _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@:%{public}@ Creating request for url: %{public}@", (uint8_t *)&v19, 0x20u);
        }
      }
      id v11 = objc_alloc((Class)NSMutableURLRequest);
      [(PDURLRequestOperation *)self timeoutIntervalForRequest];
      id v3 = objc_msgSend(v11, "initWithURL:cachePolicy:timeoutInterval:", v4, 1);
      __int16 v12 = [(PDURLRequestOperation *)self httpMethod];
      [v3 setHTTPMethod:v12];
    }
    else
    {
      CLSInitLog();
      CFStringRef v13 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        __int16 v20 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unable to make request. Host for URL: %@ not allowed.", (uint8_t *)&v19, 0xCu);
      }

      [(PDURLRequestOperation *)self abort];
      id v3 = 0;
    }
  }

  return v3;
}

+ (id)setAppleInternalHeadersForRequest:(id)a3
{
  return 0;
}

- (void)setHeadersForRequest:(id)a3
{
  id v4 = a3;
  if (*(NSError **)((char *)&self->_error + 2))
  {
    uint64_t v5 = +[NSString stringWithFormat:@"%@", *(NSError **)((char *)&self->_error + 2)];
    [v4 setValue:v5 forHTTPHeaderField:@"X-Apple-Request-UUID"];
  }
  id v6 = +[NSNumber numberWithUnsignedInteger:*(NSUUID **)((char *)&self->_requestUUID + 2)];
  BOOL v7 = [v6 stringValue];
  [v4 setValue:v7 forHTTPHeaderField:@"X-Apple-ClassKit-ExecutionCount"];

  id v8 = [(PDURLRequestOperation *)self requestContentType];
  if ([v8 length]) {
    [v4 setValue:v8 forHTTPHeaderField:@"Content-Type"];
  }
  unsigned int v9 = [(PDURLRequestOperation *)self acceptContentType];
  if ([v9 length]) {
    [v4 setValue:v9 forHTTPHeaderField:@"Accept"];
  }
  if (qword_10023E6C0 != -1) {
    dispatch_once(&qword_10023E6C0, &stru_1001F4BF0);
  }
  if (byte_10023E6A8) {
    [v4 setValue:@"yes" forHTTPHeaderField:@"X-Apple-ClassKit-Dev"];
  }
  if (qword_10023E6C8 != -1) {
    dispatch_once(&qword_10023E6C8, &stru_1001F4C10);
  }
  if (byte_10023E6A9) {
    [v4 setValue:@"1" forHTTPHeaderField:@"X-Apple-Canary-Request"];
  }
  if ([(PDURLRequestOperation *)self requiresAuth]) {
    [(PDURLRequestOperation *)self setAuthHeadersForRequest:v4];
  }
  int v10 = [(PDURLRequestOperation *)self customRequestHeaders];
  id v11 = v10;
  if (v10)
  {
    __int16 v22 = v8;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    __int16 v12 = [v10 allKeys];
    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          int v18 = [v11 objectForKeyedSubscript:v17];
          [v4 setValue:v18 forHTTPHeaderField:v17];
        }
        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v14);
    }

    id v8 = v22;
  }
  int v19 = sub_1000A5B38();
  if ([v19 length]) {
    [v4 setValue:v19 forHTTPHeaderField:@"X-Schoolwork-Info"];
  }
  __int16 v20 = [(id)objc_opt_class() setAppleInternalHeadersForRequest:v4];
  if (v20)
  {
    CLSInitLog();
    __int16 v21 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to add Apple Headers. Error: %{public}@", buf, 0xCu);
    }
  }
}

- (void)setAuthHeadersForRequest:(id)a3
{
  id v7 = a3;
  if (![(PDOperation *)self isAborted])
  {
    id v4 = sub_1000062FC();
    if (objc_opt_respondsToSelector())
    {
      if (v4) {
        uint64_t v5 = (void *)v4[5];
      }
      else {
        uint64_t v5 = 0;
      }
      id v6 = v5;
      [v7 setValue:v6 forHTTPHeaderField:@"X-Apple-Alternate-Id"];
    }
  }
}

- (id)customRequestHeaders
{
  return 0;
}

- (void)logHTTPHeaders:(id)a3 withMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CLSInitLog();
  id v8 = [(PDOperation *)self logSubsystem];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ {", buf, 0xCu);
  }
  int v18 = v7;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v13);
        CLSInitLog();
        uint64_t v15 = [(PDOperation *)self logSubsystem];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          id v16 = [v9 objectForKeyedSubscript:v14];
          *(_DWORD *)buf = 138412546;
          id v24 = v14;
          __int16 v25 = 2112;
          long long v26 = v16;
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "    %@: %@", buf, 0x16u);
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v11);
  }

  CLSInitLog();
  uint64_t v17 = [(PDOperation *)self logSubsystem];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "}", buf, 2u);
  }
}

- (BOOL)urlRequestFailed
{
  uint64_t v3 = *(uint64_t *)((char *)&self->_responseFailureCause + 2);
  if (v3 == 317 || v3 == 103)
  {
    CLSInitLog();
    id v4 = (void *)CLSLogOperations;
    if (!os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG)) {
      return 1;
    }
    id v10 = v4;
    long long v21 = objc_opt_class();
    id v12 = v21;
    id v13 = [(PDURLRequestOperation *)self operationID];
    long long v22 = *(NSString **)((char *)&self->_responseFailureCause + 2);
    int v23 = 138543874;
    id v24 = v21;
    __int16 v25 = 2114;
    long long v26 = v13;
    __int16 v27 = 2048;
    id v28 = v22;
    uint64_t v15 = "%{public}@:%{public}@ Network layer error (clsErrorCode:%ld)";
    goto LABEL_15;
  }
  id v6 = *(void **)(&self->super._executing + 1);
  if (v6)
  {
    id v7 = [v6 domain];
    unsigned int v8 = [NSURLErrorDomain isEqualToString:v7];

    if (v8)
    {
      CLSInitLog();
      id v9 = (void *)CLSLogOperations;
      if (!os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG)) {
        return 1;
      }
      id v10 = v9;
      id v11 = objc_opt_class();
      id v12 = v11;
      id v13 = [(PDURLRequestOperation *)self operationID];
      id v14 = [*(id *)(&self->super._executing + 1) code];
      int v23 = 138543874;
      id v24 = v11;
      __int16 v25 = 2114;
      long long v26 = v13;
      __int16 v27 = 2048;
      id v28 = v14;
      uint64_t v15 = "%{public}@:%{public}@ Network layer error (code:%ld)";
LABEL_15:
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v23, 0x20u);

LABEL_16:
      return 1;
    }
  }
  if (![(PDURLRequestOperation *)self httpRequestCompleted])
  {
    id v16 = +[PDUserDefaults sharedDefaults];
    unsigned int v17 = [v16 enableVerboseLogging];

    if (!v17) {
      return 1;
    }
    CLSInitLog();
    int v18 = (void *)CLSLogOperations;
    if (!os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG)) {
      return 1;
    }
    id v10 = v18;
    long long v19 = objc_opt_class();
    id v12 = v19;
    long long v20 = [(PDURLRequestOperation *)self operationID];
    int v23 = 138543618;
    id v24 = v19;
    __int16 v25 = 2114;
    long long v26 = v20;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@:%{public}@ !httpRequestCompleted", (uint8_t *)&v23, 0x16u);

    goto LABEL_16;
  }
  return 0;
}

- (BOOL)httpRequestCompleted
{
  uint64_t v2 = *(void *)(&self->_urlRequestAttempted + 2);
  return v2 && *(unsigned char *)(v2 + 48) != 0;
}

- (BOOL)httpRequestSucceeded
{
  if (![(PDURLRequestOperation *)self httpRequestCompleted]) {
    return 0;
  }
  uint64_t v3 = [(PDURLRequestOperation *)self response];
  id v4 = (void *)v3;
  v6 = v3 && (uint64_t v5 = *(void **)(v3 + 56)) != 0 && (char *)[v5 statusCode] - 200 < (char *)0x64;

  return v6;
}

- (BOOL)httpRequestHadServerError
{
  if (![(PDURLRequestOperation *)self httpRequestCompleted]) {
    return 0;
  }
  uint64_t v3 = [(PDURLRequestOperation *)self response];
  id v4 = (void *)v3;
  v6 = v3 && (uint64_t v5 = *(void **)(v3 + 56)) != 0 && (char *)[v5 statusCode] - 400 < (char *)0xC8;

  return v6;
}

- (BOOL)httpRequestHadTimeoutError
{
  BOOL v3 = [(PDURLRequestOperation *)self httpRequestCompleted];
  if (v3)
  {
    uint64_t v4 = [(PDURLRequestOperation *)self response];
    if (!v4) {
      goto LABEL_5;
    }
    uint64_t v5 = (void *)v4;
    BOOL v6 = *(void **)(v4 + 56);
    if (v6)
    {
      id v7 = [v6 statusCode];

      if (v7 != (id)-1)
      {
LABEL_5:
        LOBYTE(v3) = 0;
        return v3;
      }
    }
    else
    {
    }
    uint64_t v8 = objc_opt_class();
    id v9 = [(PDURLRequestOperation *)self operationID];
    id v10 = +[NSString stringWithFormat:@"%@:%@ Timeout error error: %ld %@", v8, v9, -1, *(NSMutableURLRequest **)((char *)&self->_request + 2)];
    uint64_t v11 = +[NSError cls_createErrorWithCode:320 description:v10];
    id v12 = *(void **)(&self->super._executing + 1);
    *(void *)(&self->super._executing + 1) = v11;

    *(NSString **)((char *)&self->_responseFailureCause + 2) = (NSString *)320;
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)verifyResponse
{
  return 1;
}

- (void)releaseResponse
{
  sub_100100970(*(void **)(&self->_urlRequestAttempted + 2));
  BOOL v3 = *(void **)(&self->_urlRequestAttempted + 2);
  *(void *)(&self->_urlRequestAttempted + 2) = 0;
}

- (BOOL)processResponse:(id *)a3
{
  return 0;
}

- (BOOL)shouldProcessResponseBody
{
  if ([(PDOperation *)self isFinished]) {
    return 0;
  }
  else {
    return ![(PDOperation *)self isAborted];
  }
}

- (void)didCompleteProcessingResponse
{
  [(PDURLRequestOperation *)self releaseResponse];
  id v3 = [(PDURLRequestOperation *)self stats];
  sub_100092D8C((uint64_t)v3);
}

- (void)handleResponseBody:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PDURLRequestOperation *)self stats];
  sub_100092D3C((uint64_t)v5);

  unsigned int v6 = 0;
  if ([(PDURLRequestOperation *)self shouldProcessResponseBody] && v3)
  {
    id v25 = 0;
    unsigned int v6 = [(PDURLRequestOperation *)self processResponse:&v25];
    id v7 = v25;
    if (v7)
    {
      CLSInitLog();
      uint64_t v8 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = objc_opt_class();
        id v10 = v9;
        uint64_t v11 = [(PDURLRequestOperation *)self operationID];
        *(_DWORD *)buf = 138543874;
        __int16 v27 = v9;
        __int16 v28 = 2114;
        v29 = v11;
        __int16 v30 = 2114;
        id v31 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@:%{public}@ request processing failed error: %{public}@", buf, 0x20u);
      }
      [(PDURLRequestOperation *)self abortWithError:v7];
      unsigned int v6 = 0;
    }
  }
  [(PDURLRequestOperation *)self didCompleteProcessingResponse];
  CLSInitLog();
  id v12 = (void *)CLSLogOperations;
  if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    id v14 = [(PDURLRequestOperation *)self stats];
    uint64_t v15 = sub_100092E04(v14);
    *(_DWORD *)buf = 138543362;
    __int16 v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "STATS=req:%{public}@", buf, 0xCu);
  }
  CLSInitLog();
  id v16 = (void *)CLSLogOperations;
  if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v17 = v16;
    int v18 = [(PDURLRequestOperation *)self stats];
    long long v19 = sub_100092E64((uint64_t)v18);
    *(_DWORD *)buf = 138543362;
    __int16 v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "STATS=resp:%{public}@", buf, 0xCu);
  }
  long long v20 = sub_1000A8424();
  long long v21 = sub_1000A8424();
  long long v22 = [(PDURLRequestOperation *)self statusReport];
  int v23 = sub_1000A8888(v21, v22);
  id v24 = [(PDOperation *)self database];
  sub_1000A9080(v20, v23, v24);

  if (v6) {
    [(PDURLRequestOperation *)self execute];
  }
}

- (void)flushCachedData
{
  v6.receiver = self;
  v6.super_class = (Class)PDURLRequestOperation;
  [(PDOperation *)&v6 flushCachedData];
  BOOL v3 = *(void **)(&self->_wantsToExecute + 2);
  *(void *)(&self->_wantsToExecute + 2) = 0;

  sub_100100970(*(void **)(&self->_urlRequestAttempted + 2));
  uint64_t v4 = *(void **)(&self->_urlRequestAttempted + 2);
  *(void *)(&self->_urlRequestAttempted + 2) = 0;

  uint64_t v5 = *(NSMutableURLRequest **)((char *)&self->_request + 2);
  *(NSMutableURLRequest **)((char *)&self->_request + 2) = 0;
}

- (void)abortWithError:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDURLRequestOperation;
  [(PDOperation *)&v11 abortWithError:v4];
  if (v4 && !*(NSString **)((char *)&self->_responseFailureCause + 2))
  {
    uint64_t v5 = objc_msgSend(v4, "cls_underlyingErrorWithDomain:", CLSErrorCodeDomain);
    objc_super v6 = v5;
    if (v5) {
      uint64_t v7 = (uint64_t)[v5 code];
    }
    else {
      uint64_t v7 = 100;
    }
    *(NSString **)((char *)&self->_responseFailureCause + 2) = (NSString *)v7;
    uint64_t v8 = [(PDURLRequestOperation *)self stats];

    if (v8)
    {
      uint64_t v9 = *(uint64_t *)((char *)&self->_responseFailureCause + 2);
      id v10 = [(PDURLRequestOperation *)self stats];
      if (v10) {
        v10[13] = v9;
      }
    }
  }
}

- (void)abort
{
  [(PDURLRequestOperation *)self closeSession:0];
  v3.receiver = self;
  v3.super_class = (Class)PDURLRequestOperation;
  [(PDOperation *)&v3 abort];
}

- (void)markAsFinished
{
  [(PDURLRequestOperation *)self closeSession:1];
  v3.receiver = self;
  v3.super_class = (Class)PDURLRequestOperation;
  [(PDAsyncOperation *)&v3 markAsFinished];
}

- (int64_t)errorCodeForRequest
{
  if ([(PDURLRequestOperation *)self httpRequestSucceeded]) {
    return 0;
  }
  uint64_t v4 = [(PDURLRequestOperation *)self response];
  uint64_t v5 = (void *)v4;
  if (!v4 || (objc_super v6 = *(void **)(v4 + 56)) == 0)
  {

    return 100;
  }
  uint64_t v7 = (uint64_t)[v6 statusCode];

  if (v7 >= 500)
  {
    if (v7 != 503) {
      return 303;
    }
    uint64_t v8 = [(PDURLRequestOperation *)self response];
    uint64_t v9 = sub_1001010EC(v8, @"Retry-After");

    if (v9) {
      return 306;
    }
    else {
      return 303;
    }
  }
  if (v7 < 400) {
    return 100;
  }
  if (v7 != 401) {
    return 302;
  }

  return [(PDURLRequestOperation *)self clsErrorCodeForAuthenticationFailure];
}

- (void)handleHTTPStatusCode:(id)a3
{
  id v4 = a3;
  if ([(PDURLRequestOperation *)self httpRequestCompleted]
    && ![(PDURLRequestOperation *)self httpRequestSucceeded])
  {
    CLSInitLog();
    uint64_t v5 = [(PDOperation *)self logSubsystem];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v6 = objc_opt_class();
      id v7 = v6;
      uint64_t v8 = [(PDURLRequestOperation *)self operationID];
      id v9 = [v4 statusCode];
      id v10 = [v4 URL];
      *(_DWORD *)buf = 138544130;
      long long v26 = v6;
      __int16 v27 = 2114;
      __int16 v28 = v8;
      __int16 v29 = 2048;
      id v30 = v9;
      __int16 v31 = 2112;
      v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@:%{public}@ Received %ld response for request url: %@", buf, 0x2Au);
    }
    sub_100100EB0(*(char **)(&self->_urlRequestAttempted + 2));
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      id v12 = objc_alloc((Class)NSString);
      id v13 = sub_100100EB0(*(char **)(&self->_urlRequestAttempted + 2));
      id v11 = [v12 initWithData:v13 encoding:4];
    }
    id v14 = [(PDURLRequestOperation *)self response];
    sub_1001010EC(v14, @"X-Orion-Failure-Cause");
    uint64_t v15 = (NSMutableURLRequest *)objc_claimAutoreleasedReturnValue();
    id v16 = *(NSMutableURLRequest **)((char *)&self->_request + 2);
    *(NSMutableURLRequest **)((char *)&self->_request + 2) = v15;

    if (!*(void *)(&self->super._executing + 1))
    {
      unsigned int v17 = [(PDURLRequestOperation *)self errorCodeForRequest];
      *(NSString **)((char *)&self->_responseFailureCause + 2) = v17;
      uint64_t v18 = objc_opt_class();
      long long v19 = [(PDURLRequestOperation *)self operationID];
      long long v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@:%@ Server returned error: %ld %@ data: %@", v18, v19, [v4 statusCode], *(NSMutableURLRequest **)((char *)&self->_request + 2), v11);
      uint64_t v21 = +[NSError cls_createErrorWithCode:v17 description:v20];
      long long v22 = *(void **)(&self->super._executing + 1);
      *(void *)(&self->super._executing + 1) = v21;
    }
    uint64_t v23 = *(uint64_t *)((char *)&self->_responseFailureCause + 2);
    id v24 = [(PDURLRequestOperation *)self stats];
    if (v24) {
      v24[13] = v23;
    }
  }
}

- (void)handleRequestError
{
  CLSInitLog();
  objc_super v3 = [(PDOperation *)self logSubsystem];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = [(PDURLRequestOperation *)self operationID];
    uint64_t v5 = *(void *)(&self->super._executing + 1);
    int v6 = 138543618;
    id v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Request %{public}@ failed with error=%{public}@. Aborting the operation", (uint8_t *)&v6, 0x16u);
  }
  [(PDURLRequestOperation *)self abortWithError:*(void *)(&self->super._executing + 1)];
}

- (id)statusReport
{
  v40.receiver = self;
  v40.super_class = (Class)PDURLRequestOperation;
  objc_super v3 = [(PDAsyncOperation *)&v40 statusReport];
  uint64_t v4 = [(PDURLRequestOperation *)self response];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    int v6 = *(void **)(v4 + 56);
    if (v6) {
      uint64_t v7 = (uint64_t)[v6 statusCode];
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = +[NSNumber numberWithInteger:v7];
  uint64_t v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = @"None";
  }
  [v3 setObject:v10 forKeyedSubscript:@"httpStatusCode"];

  uint64_t v11 = +[NSNumber numberWithBool:[(PDURLRequestOperation *)self httpRequestCompleted]];
  id v12 = (void *)v11;
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  else {
    CFStringRef v13 = @"None";
  }
  [v3 setObject:v13 forKeyedSubscript:@"httpRequestCompleted"];

  uint64_t v14 = +[NSNumber numberWithBool:[(PDURLRequestOperation *)self httpRequestSucceeded]];
  uint64_t v15 = (void *)v14;
  if (v14) {
    CFStringRef v16 = (const __CFString *)v14;
  }
  else {
    CFStringRef v16 = @"None";
  }
  [v3 setObject:v16 forKeyedSubscript:@"httpRequestSucceeded"];

  unsigned int v17 = [(PDURLRequestOperation *)self stats];
  uint64_t v18 = sub_100092F94(v17);
  [v3 setObject:v18 forKeyedSubscript:@"stats"];

  long long v19 = [(PDURLRequestOperation *)self URL];
  uint64_t v20 = [v19 absoluteString];
  uint64_t v21 = (void *)v20;
  if (v20) {
    CFStringRef v22 = (const __CFString *)v20;
  }
  else {
    CFStringRef v22 = @"None";
  }
  [v3 setObject:v22 forKeyedSubscript:@"URL"];

  uint64_t v23 = [(PDURLRequestOperation *)self httpMethod];
  id v24 = (void *)v23;
  if (v23) {
    CFStringRef v25 = (const __CFString *)v23;
  }
  else {
    CFStringRef v25 = @"None";
  }
  [v3 setObject:v25 forKeyedSubscript:@"httpMethod"];

  uint64_t v26 = [(PDURLRequestOperation *)self requestContentType];
  __int16 v27 = (void *)v26;
  if (v26) {
    CFStringRef v28 = (const __CFString *)v26;
  }
  else {
    CFStringRef v28 = @"None";
  }
  [v3 setObject:v28 forKeyedSubscript:@"requestContentType"];

  uint64_t v29 = [(PDURLRequestOperation *)self acceptContentType];
  id v30 = (void *)v29;
  if (v29) {
    CFStringRef v31 = (const __CFString *)v29;
  }
  else {
    CFStringRef v31 = @"None";
  }
  [v3 setObject:v31 forKeyedSubscript:@"acceptContentType"];

  [(PDURLRequestOperation *)self timeoutIntervalForRequest];
  v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v32 forKeyedSubscript:@"timeoutIntervalForRequest"];

  uint64_t v33 = [*(id *)(&self->_wantsToExecute + 2) allHTTPHeaderFields];
  v34 = (void *)v33;
  if (v33) {
    CFStringRef v35 = (const __CFString *)v33;
  }
  else {
    CFStringRef v35 = @"None";
  }
  [v3 setObject:v35 forKeyedSubscript:@"requestHeaders"];

  uint64_t v36 = sub_1001010B4(*(void **)(&self->_urlRequestAttempted + 2));
  v37 = (void *)v36;
  if (v36) {
    CFStringRef v38 = (const __CFString *)v36;
  }
  else {
    CFStringRef v38 = @"None";
  }
  [v3 setObject:v38 forKeyedSubscript:@"responseHeaders"];

  return v3;
}

- (BOOL)urlRequestAttempted
{
  return BYTE2(self->_session);
}

- (void)setUrlRequestAttempted:(BOOL)a3
{
  BYTE2(self->_session) = a3;
}

- (PDURLResponse)response
{
  return *(PDURLResponse **)(&self->_urlRequestAttempted + 2);
}

- (PDURLOperationStats)stats
{
  return *(PDURLOperationStats **)((char *)&self->_response + 2);
}

- (void)setStats:(id)a3
{
}

- (NSURL)URL
{
  return *(NSURL **)((char *)&self->_stats + 2);
}

- (NSString)requestContentType
{
  return *(NSString **)((char *)&self->_URL + 2);
}

- (NSString)acceptContentType
{
  return *(NSString **)((char *)&self->_requestContentType + 2);
}

- (NSData)requestData
{
  return *(NSData **)((char *)&self->_acceptContentType + 2);
}

- (double)timeoutIntervalForRequest
{
  return *(double *)((char *)&self->_requestData + 2);
}

- (void)setTimeoutIntervalForRequest:(double)a3
{
  *(double *)((char *)&self->_requestData + 2) = a3;
}

- (int64_t)clsErrorCode
{
  return *(int64_t *)((char *)&self->_responseFailureCause + 2);
}

- (void)setClsErrorCode:(int64_t)a3
{
  *(NSString **)((char *)&self->_responseFailureCause + 2) = (NSString *)a3;
}

- (NSString)responseFailureCause
{
  return *(NSString **)((char *)&self->_request + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_acceptContentType + 2), 0);
  objc_storeStrong((id *)((char *)&self->_requestContentType + 2), 0);
  objc_storeStrong((id *)((char *)&self->_URL + 2), 0);
  objc_storeStrong((id *)((char *)&self->_stats + 2), 0);
  objc_storeStrong((id *)((char *)&self->_response + 2), 0);
  objc_storeStrong((id *)(&self->_urlRequestAttempted + 2), 0);
  objc_storeStrong((id *)((char *)&self->_clsErrorCode + 2), 0);
  objc_storeStrong((id *)((char *)&self->_request + 2), 0);
  objc_storeStrong((id *)(&self->_wantsToExecute + 2), 0);
  objc_storeStrong((id *)((char *)&self->_error + 2), 0);

  objc_storeStrong((id *)(&self->super._executing + 1), 0);
}

- (id)createSessionIfNeeded
{
  if (!*(int64_t *)((char *)&self->_clsErrorCode + 2))
  {
    objc_super v3 = +[NSURLSessionConfiguration defaultSessionConfiguration];
    id v4 = [v3 copy];

    [v4 setURLCache:0];
    [v4 setDiscretionary:0];
    [v4 setWaitsForConnectivity:0];
    objc_msgSend(v4, "setAllowsCellularAccess:", -[PDOperation mayUseCellularData](self, "mayUseCellularData"));
    [(PDOperation *)self timeoutIntervalForRequests];
    objc_msgSend(v4, "setTimeoutIntervalForRequest:");
    uint64_t v5 = +[PDURLRequestOperation appleIDSession];
    objc_msgSend(v4, "set_appleIDContext:", v5);

    int v6 = [(PDOperation *)self sourceApplicationBundleIdentifier];
    objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", v6);

    [v4 setMultipathServiceType:2];
    uint64_t v7 = +[NSURLSession sessionWithConfiguration:v4 delegate:self delegateQueue:0];
    uint64_t v8 = *(void **)((char *)&self->_clsErrorCode + 2);
    *(int64_t *)((char *)&self->_clsErrorCode + 2) = v7;

    uint64_t v9 = +[PDUserDefaults sharedDefaults];
    unsigned int v10 = [v9 enableVerboseLogging];

    if (v10)
    {
      CLSInitLog();
      uint64_t v11 = (void *)CLSLogOperations;
      if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = v11;
        CFStringRef v16 = objc_opt_class();
        id v17 = v16;
        uint64_t v18 = [(PDURLRequestOperation *)self operationID];
        int v19 = 138543618;
        uint64_t v20 = v16;
        __int16 v21 = 2114;
        CFStringRef v22 = v18;
        _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "OPS: session %{public}@:%{public}@ created", (uint8_t *)&v19, 0x16u);
      }
    }
  }
  id v12 = [(PDURLRequestOperation *)self operationID];
  [*(id *)((char *)&self->_clsErrorCode + 2) setSessionDescription:v12];

  CFStringRef v13 = *(void **)((char *)&self->_clsErrorCode + 2);

  return v13;
}

- (void)closeSession:(BOOL)a3
{
  if (*(int64_t *)((char *)&self->_clsErrorCode + 2))
  {
    BOOL v3 = a3;
    uint64_t v5 = +[PDUserDefaults sharedDefaults];
    unsigned int v6 = [v5 enableVerboseLogging];

    if (v6)
    {
      CLSInitLog();
      uint64_t v7 = (void *)CLSLogOperations;
      if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v10 = v7;
        uint64_t v11 = objc_opt_class();
        id v12 = v11;
        if (v3) {
          CFStringRef v13 = @"finished";
        }
        else {
          CFStringRef v13 = @"cancelled & invalidated";
        }
        uint64_t v14 = *(void **)((char *)&self->_clsErrorCode + 2);
        id v15 = v11;
        CFStringRef v16 = [v14 sessionDescription];
        int v17 = 138543874;
        uint64_t v18 = v12;
        __int16 v19 = 2114;
        CFStringRef v20 = v13;
        __int16 v21 = 2112;
        CFStringRef v22 = v16;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "OPS: session %{public}@:%{public}@ %@", (uint8_t *)&v17, 0x20u);
      }
    }
    uint64_t v8 = *(void **)((char *)&self->_clsErrorCode + 2);
    if (v3) {
      [v8 finishTasksAndInvalidate];
    }
    else {
      [v8 invalidateAndCancel];
    }
    uint64_t v9 = *(void **)((char *)&self->_clsErrorCode + 2);
    *(int64_t *)((char *)&self->_clsErrorCode + 2) = 0;
  }
}

- (void)sessionFailedWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    *(NSString **)((char *)&self->_responseFailureCause + 2) = (NSString *)317;
    id v13 = v4;
    NSErrorDomain v5 = [v4 domain];
    if (NSURLErrorDomain == v5)
    {
      id v6 = [v13 code];

      id v4 = v13;
      if (v6 == (id)-1009) {
        *(NSString **)((char *)&self->_responseFailureCause + 2) = (NSString *)103;
      }
    }
    else
    {

      id v4 = v13;
    }
    if (!*(void *)(&self->super._executing + 1))
    {
      uint64_t v7 = *(uint64_t *)((char *)&self->_responseFailureCause + 2);
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = [(PDURLRequestOperation *)self operationID];
      unsigned int v10 = +[NSString stringWithFormat:@"%@:%@ session failed with error: %@ (%ld) ", v8, v9, v13, *(NSString **)((char *)&self->_responseFailureCause + 2)];
      uint64_t v11 = +[NSError cls_createErrorWithCode:v7 underlyingError:v13 description:v10];
      id v12 = *(void **)(&self->super._executing + 1);
      *(void *)(&self->super._executing + 1) = v11;

      id v4 = v13;
    }
  }
}

- (void)requestCompletedWith:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PDOperation *)self isAborted])
  {
    uint64_t v9 = [(PDURLRequestOperation *)self response];
    unsigned int v10 = [(PDURLRequestOperation *)self stats];
    sub_100100E10(v9, v10);

    uint64_t v11 = +[PDUserDefaults sharedDefaults];
    LODWORD(v10) = [v11 enableVerboseLogging];

    if (v10)
    {
      CLSInitLog();
      id v12 = [(PDOperation *)self logSubsystem];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = objc_opt_class();
        id v29 = v13;
        CFStringRef v28 = [(PDURLRequestOperation *)self operationID];
        uint64_t v14 = [(PDURLRequestOperation *)self stats];
        id v15 = (void *)v14;
        if (v14) {
          uint64_t v16 = *(void *)(v14 + 88);
        }
        else {
          uint64_t v16 = 0;
        }
        uint64_t v17 = [(PDURLRequestOperation *)self stats];
        uint64_t v18 = (void *)v17;
        if (v17) {
          uint64_t v19 = *(void *)(v17 + 96);
        }
        else {
          uint64_t v19 = 0;
        }
        *(_DWORD *)buf = 138544130;
        CFStringRef v31 = v13;
        __int16 v32 = 2114;
        uint64_t v33 = v28;
        __int16 v34 = 2048;
        uint64_t v35 = v16;
        __int16 v36 = 2048;
        uint64_t v37 = v19;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@:%{public}@ Received %ld byte response with httpStatus: %ld", buf, 0x2Au);
      }
    }
    CFStringRef v20 = [(PDURLRequestOperation *)self response];
    __int16 v21 = sub_1001010B4(v20);
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = [(PDURLRequestOperation *)self operationID];
    id v24 = +[NSString stringWithFormat:@"%@:%@ Response headers:", v22, v23];
    [(PDURLRequestOperation *)self logHTTPHeaders:v21 withMessage:v24];

    [(PDURLRequestOperation *)self sessionFailedWithError:v7];
    if (v6) {
      CFStringRef v25 = (void *)v6[7];
    }
    else {
      CFStringRef v25 = 0;
    }
    id v26 = v25;
    [(PDURLRequestOperation *)self handleHTTPStatusCode:v26];

    BOOL v27 = ![(PDURLRequestOperation *)self httpRequestHadTimeoutError]
       && ![(PDURLRequestOperation *)self httpRequestHadServerError]
       && [(PDURLRequestOperation *)self verifyResponse];
    if (*(void *)(&self->super._executing + 1)
      || (objc_storeStrong((id *)(&self->super._executing + 1), a4), *(void *)(&self->super._executing + 1)))
    {
      [(PDURLRequestOperation *)self handleRequestError];
    }
    [(PDURLRequestOperation *)self handleResponseBody:v27];
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5 = a4;
  id v6 = +[PDUserDefaults sharedDefaults];
  unsigned int v7 = [v6 enableVerboseLogging];

  if (v7)
  {
    CLSInitLog();
    uint64_t v8 = (void *)CLSLogConnection;
    if (os_log_type_enabled(CLSLogConnection, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = v8;
      unsigned int v10 = objc_opt_class();
      uint64_t v11 = *(void **)((char *)&self->_clsErrorCode + 2);
      id v12 = v10;
      id v13 = [v11 sessionDescription];
      int v14 = 138543874;
      id v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "OPS: session %{public}@:%{public}@ URLSession:didBecomeInvalidWithError:%@", (uint8_t *)&v14, 0x20u);
    }
  }
  [(PDURLRequestOperation *)self sessionFailedWithError:v5];
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  uint64_t v9 = (void (**)(id, uint64_t, void *))a6;
  unsigned int v10 = [v8 protectionSpace];
  uint64_t v11 = [v10 authenticationMethod];
  id v12 = +[PDUserDefaults sharedDefaults];
  unsigned int v13 = [v12 enableVerboseLogging];

  if (v13)
  {
    CLSInitLog();
    int v14 = (void *)CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
    {
      __int16 v16 = v14;
      uint64_t v17 = objc_opt_class();
      __int16 v18 = *(void **)((char *)&self->_clsErrorCode + 2);
      id v19 = v17;
      CFStringRef v20 = [v18 sessionDescription];
      int v21 = 138543618;
      uint64_t v22 = v17;
      __int16 v23 = 2114;
      id v24 = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "OPS: session %{public}@:%{public}@ didReceiveChallenge", (uint8_t *)&v21, 0x16u);
    }
  }
  if (([v11 isEqualToString:NSURLAuthenticationMethodServerTrust] & 1) != 0
    || [v11 isEqualToString:NSURLAuthenticationMethodClientCertificate])
  {
    id v15 = [v8 proposedCredential];
    v9[2](v9, 1, v15);
  }
  else
  {
    v9[2](v9, 1, 0);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    CLSInitLog();
    uint64_t v11 = (void *)CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_ERROR))
    {
      id v12 = v11;
      unsigned int v13 = objc_opt_class();
      int v14 = *(void **)((char *)&self->_clsErrorCode + 2);
      id v15 = v13;
      __int16 v16 = [v14 sessionDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v35 = v13;
      __int16 v36 = 2114;
      uint64_t v37 = v16;
      __int16 v38 = 2112;
      id v39 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "OPS: session %{public}@:%{public}@ didComplete error:%@", buf, 0x20u);
LABEL_7:
    }
  }
  else
  {
    uint64_t v17 = +[PDUserDefaults sharedDefaults];
    unsigned int v18 = [v17 enableVerboseLogging];

    if (v18)
    {
      CLSInitLog();
      id v19 = (void *)CLSLogOperations;
      if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
      {
        id v12 = v19;
        CFStringRef v20 = objc_opt_class();
        int v21 = *(void **)((char *)&self->_clsErrorCode + 2);
        id v15 = v20;
        __int16 v16 = [v21 sessionDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = v20;
        __int16 v36 = 2114;
        uint64_t v37 = v16;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "OPS: session %{public}@:%{public}@ didComplete", buf, 0x16u);
        goto LABEL_7;
      }
    }
  }
  uint64_t v22 = *(void *)(&self->_urlRequestAttempted + 2);
  id v33 = 0;
  char v23 = sub_100100CB0(v22, &v33);
  id v24 = v33;
  if ((v23 & 1) == 0)
  {
    CLSInitLog();
    CFStringRef v25 = (void *)CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v28 = v25;
      id v29 = objc_opt_class();
      id v30 = *(void **)((char *)&self->_clsErrorCode + 2);
      id v31 = v29;
      __int16 v32 = [v30 sessionDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v35 = v29;
      __int16 v36 = 2114;
      uint64_t v37 = v32;
      __int16 v38 = 2112;
      id v39 = v24;
      _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "OPS: session %{public}@:%{public}@ failed to close response %@", buf, 0x20u);
    }
  }
  BOOL v27 = [(PDURLRequestOperation *)self response];
  [(PDURLRequestOperation *)self requestCompletedWith:v27 error:v10];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  id v9 = (void (**)(id, uint64_t))a6;
  id v10 = +[PDUserDefaults sharedDefaults];
  unsigned int v11 = [v10 enableVerboseLogging];

  if (v11)
  {
    CLSInitLog();
    id v12 = (void *)CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
    {
      int v14 = v12;
      id v15 = objc_opt_class();
      __int16 v16 = *(void **)((char *)&self->_clsErrorCode + 2);
      id v17 = v15;
      unsigned int v18 = [v16 sessionDescription];
      int v26 = 138543618;
      BOOL v27 = v15;
      __int16 v28 = 2114;
      id v29 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "OPS: session %{public}@:%{public}@ URLSession:dataTask:didRecieveResponse", (uint8_t *)&v26, 0x16u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sub_100043608(*(void *)(&self->_urlRequestAttempted + 2), v8);
  }
  else
  {
    CLSInitLog();
    unsigned int v13 = (void *)CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_ERROR))
    {
      id v19 = v13;
      CFStringRef v20 = objc_opt_class();
      int v21 = *(void **)((char *)&self->_clsErrorCode + 2);
      id v22 = v20;
      char v23 = [v21 sessionDescription];
      id v24 = objc_opt_class();
      int v26 = 138543874;
      BOOL v27 = v20;
      __int16 v28 = 2114;
      id v29 = v23;
      __int16 v30 = 2112;
      id v31 = v24;
      id v25 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "OPS: session %{public}@:%{public}@ unexpected response class: %@", (uint8_t *)&v26, 0x20u);
    }
  }
  v9[2](v9, 1);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a5;
  unsigned int v7 = +[PDUserDefaults sharedDefaults];
  unsigned int v8 = [v7 enableVerboseLogging];

  if (v8)
  {
    CLSInitLog();
    id v9 = (void *)CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v13 = v9;
      int v14 = objc_opt_class();
      id v15 = *(void **)((char *)&self->_clsErrorCode + 2);
      id v16 = v14;
      id v17 = [v15 sessionDescription];
      *(_DWORD *)buf = 138543874;
      CFStringRef v20 = v14;
      __int16 v21 = 2114;
      id v22 = v17;
      __int16 v23 = 2048;
      id v24 = [v6 length];
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "OPS: session %{public}@:%{public}@ URLSession:dataTask:didReceiveData:wrote %ld bytes", buf, 0x20u);
    }
  }
  id v10 = *(void **)(&self->_urlRequestAttempted + 2);
  id v18 = 0;
  char v11 = sub_1001009DC(v10, v6, &v18);
  id v12 = v18;
  if ((v11 & 1) == 0) {
    [(PDURLRequestOperation *)self abortWithError:v12];
  }
}

- (void)_simulateResponseWithURL:(id)a3 statusCode:(int64_t)a4 headers:(id)a5 data:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!*(void *)(&self->_urlRequestAttempted + 2))
  {
    id v16 = [PDURLResponse alloc];
    id v17 = [(PDURLRequestOperation *)self operationID];
    id v18 = sub_10010067C((id *)&v16->super.isa, v17, [(PDURLRequestOperation *)self hasBigResponses]);
    id v19 = *(void **)(&self->_urlRequestAttempted + 2);
    *(void *)(&self->_urlRequestAttempted + 2) = v18;
  }
  objc_storeStrong((id *)(&self->super._executing + 1), a7);
  [(PDAsyncOperation *)self setDidExecute:1];
  [(PDURLRequestOperation *)self setUrlRequestAttempted:1];
  [*(id *)(&self->_urlRequestAttempted + 2) _simulateHTTPResponseWithURL:v12 statusCode:a4 headers:v13];
  if (v14)
  {
    CFStringRef v20 = *(void **)(&self->_urlRequestAttempted + 2);
    id v27 = 0;
    char v21 = sub_1001009DC(v20, v14, &v27);
    id v22 = v27;
    if ((v21 & 1) == 0) {
      [(PDURLRequestOperation *)self abortWithError:v22];
    }
  }
  uint64_t v23 = *(void *)(&self->_urlRequestAttempted + 2);
  id v26 = 0;
  char v24 = sub_100100CB0(v23, &v26);
  id v25 = v26;
  if ((v24 & 1) == 0) {
    [(PDURLRequestOperation *)self abortWithError:v25];
  }
}

@end