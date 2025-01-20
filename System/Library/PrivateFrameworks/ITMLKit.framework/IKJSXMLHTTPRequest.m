@interface IKJSXMLHTTPRequest
+ (id)xhrOperationQueue;
- (BOOL)_isPrimeError:(int64_t)a3 output:(id)a4;
- (BOOL)jingleRequest;
- (BOOL)primeEnabled;
- (BOOL)requireSystemTrust;
- (BOOL)validateTrust:(__SecTrust *)a3;
- (BOOL)verifyCertificateIsSystemTrustedWithTrust:(__SecTrust *)a3;
- (IKDOMDocument)responseXML;
- (IKJSXMLHTTPRequest)init;
- (IKJSXMLHTTPRequest)initWithAppContext:(id)a3 jingleRequest:(BOOL)a4;
- (IKNetworkRequestRecord)networkRequestRecord;
- (ISURLOperation)jingleOperation;
- (JSManagedValue)managedSelf;
- (NSData)receivedData;
- (NSDictionary)performanceMetrics;
- (NSError)requestError;
- (NSHTTPURLResponse)cachedURLResponse;
- (NSHTTPURLResponse)urlResponse;
- (NSMutableArray)onReadyStateChangeMessageQueue;
- (NSMutableURLRequest)urlRequest;
- (NSString)dataToSend;
- (NSString)password;
- (NSString)requestId;
- (NSString)requestStatusText;
- (NSString)responseText;
- (NSString)responseType;
- (NSString)statusText;
- (NSString)user;
- (NSURL)requestURL;
- (NSURLConnection)urlConnection;
- (NSURLSession)urlSession;
- (NSURLSessionConfiguration)urlSessionConfiguration;
- (id)_constructProgressEventData;
- (id)_createStoreOperation:(id)a3;
- (id)_dequeueReadyStateChangeMessage;
- (id)_loadingWillSendRequest:(id)a3 redirectResponse:(id)a4;
- (id)_timeIntervalSince1970;
- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5;
- (id)getAllResponseHeaders;
- (id)getResponseHeader:(id)a3;
- (id)response;
- (id)responseArrayBuffer;
- (id)responseBlob;
- (id)responseJSON;
- (int64_t)primeRetryCount;
- (int64_t)reprimingResponseStatus;
- (int64_t)requestReadyState;
- (int64_t)requestResponseType;
- (unint64_t)timeout;
- (unsigned)readyState;
- (unsigned)requestStatusCode;
- (unsigned)status;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_abort;
- (void)_clearAllReadyStateChangeMessagesAndSquashFutureOnes;
- (void)_loadingDidFailWithError:(id)a3;
- (void)_loadingDidFinish;
- (void)_loadingDidReceiveData:(id)a3;
- (void)_loadingDidReceiveResponse:(id)a3 timingData:(id)a4;
- (void)_openWithMethod:(id)a3 url:(id)a4 async:(BOOL)a5 user:(id)a6 password:(id)a7;
- (void)_operationFinished:(id)a3;
- (void)_prime:(id)a3;
- (void)_reprime:(id)a3;
- (void)_sendWithData:(id)a3;
- (void)_setException:(id)a3;
- (void)abort;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)open:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7;
- (void)operation:(id)a3 didDiscoverContentLength:(id)a4;
- (void)operation:(id)a3 didReceiveResponse:(id)a4;
- (void)operation:(id)a3 failedWithError:(id)a4;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)operation:(id)a3 willSendRequest:(id)a4;
- (void)send:(id)a3;
- (void)setCachedURLResponse:(id)a3;
- (void)setDataToSend:(id)a3;
- (void)setJingleOperation:(id)a3;
- (void)setJingleRequest:(BOOL)a3;
- (void)setManagedSelf:(id)a3;
- (void)setOnReadyStateChangeMessageQueue:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPerformanceMetrics:(id)a3;
- (void)setPrimeRetryCount:(int64_t)a3;
- (void)setReadyState:(unsigned int)a3;
- (void)setReceivedData:(id)a3;
- (void)setRequestError:(id)a3;
- (void)setRequestHeader:(id)a3 :(id)a4;
- (void)setRequestId:(id)a3;
- (void)setRequestReadyState:(int64_t)a3;
- (void)setRequestResponseType:(int64_t)a3;
- (void)setRequestStatusCode:(unsigned int)a3;
- (void)setRequestStatusText:(id)a3;
- (void)setRequestURL:(id)a3;
- (void)setRequireSystemTrust:(BOOL)a3;
- (void)setResponseType:(id)a3;
- (void)setStatus:(unsigned int)a3;
- (void)setStatusText:(id)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)setUrlConnection:(id)a3;
- (void)setUrlRequest:(id)a3;
- (void)setUrlResponse:(id)a3;
- (void)setUrlSession:(id)a3;
- (void)setUrlSessionConfiguration:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation IKJSXMLHTTPRequest

+ (id)xhrOperationQueue
{
  if (xhrOperationQueue_onceToken != -1) {
    dispatch_once(&xhrOperationQueue_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)xhrOperationQueue_sXHROperationQueue;
  return v2;
}

uint64_t __39__IKJSXMLHTTPRequest_xhrOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)xhrOperationQueue_sXHROperationQueue;
  xhrOperationQueue_sXHROperationQueue = (uint64_t)v0;

  v2 = (void *)xhrOperationQueue_sXHROperationQueue;
  return [v2 setMaxConcurrentOperationCount:1];
}

- (IKJSXMLHTTPRequest)init
{
  v3 = +[IKAppContext currentAppContext];
  v4 = [(IKJSXMLHTTPRequest *)self initWithAppContext:v3 jingleRequest:0];

  return v4;
}

- (IKJSXMLHTTPRequest)initWithAppContext:(id)a3 jingleRequest:(BOOL)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IKJSXMLHTTPRequest;
  v7 = [(IKJSObject *)&v21 initWithAppContext:v6];
  if (v7)
  {
    v8 = [v6 delegate];
    if (objc_opt_respondsToSelector())
    {
      v9 = [v8 xhrSessionConfigurationForContext:v6];
      uint64_t v10 = [v9 copy];
      urlSessionConfiguration = v7->_urlSessionConfiguration;
      v7->_urlSessionConfiguration = (NSURLSessionConfiguration *)v10;
    }
    v7->_jingleRequest = a4;
    [(IKJSXMLHTTPRequest *)v7 setTimeout:60000];
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    onReadyStateChangeMessageQueue = v7->_onReadyStateChangeMessageQueue;
    v7->_onReadyStateChangeMessageQueue = v12;

    v7->_onReadyStateChangeMessageQueueLock._os_unfair_lock_opaque = 0;
    v7->_primeEnabled = [v6 mescalPrimeEnabledForXHRRequests];
    v7->_requestReadyState = 0;
    v7->_requestStatusCode = 0;
    v14 = (void *)MEMORY[0x1E4F30928];
    v15 = (void *)MEMORY[0x1E4F30938];
    v16 = [v6 jsContext];
    v17 = [v15 valueWithObject:v7 inContext:v16];
    uint64_t v18 = [v14 managedValueWithValue:v17];
    managedSelf = v7->_managedSelf;
    v7->_managedSelf = (JSManagedValue *)v18;

    [(IKJSXMLHTTPRequest *)v7 setRequireSystemTrust:1];
    [(IKJSXMLHTTPRequest *)v7 setReadyState:LODWORD(v7->_requestReadyState)];
    [(IKJSXMLHTTPRequest *)v7 setStatus:0];
    [(IKJSXMLHTTPRequest *)v7 setStatusText:&stru_1F3E09950];
  }
  return v7;
}

- (void)open:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [(IKJSXMLHTTPRequest *)self _setException:@"XMLHttpRequest.open set with nil method"];
    id v34 = v12;
    goto LABEL_17;
  }
  v17 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3E3DB00];
  id v34 = [v12 uppercaseString];

  if ([v17 containsObject:v34])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [(IKJSXMLHTTPRequest *)self _setException:@"XMLHttpRequest.open set with nil url"];
      goto LABEL_16;
    }
    uint64_t v18 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
    v19 = v18;
    if (v18)
    {
      v20 = [(__CFString *)v18 scheme];
      if ([v20 isEqualToString:@"http"])
      {
LABEL_8:

LABEL_9:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v22 = [v14 BOOLValue];
        }
        else {
          int v22 = 1;
        }
        if ([v15 isUndefined])
        {
          if ([v16 isUndefined])
          {
            unsigned int v32 = v22;
            v30 = [(IKJSObject *)self appContext];
            v25 = [v30 webInspectorController];
            v26 = [v25 requestLoader];
            v27 = [v26 recordForResource:1 withInitiator:1];
            networkRequestRecord = self->_networkRequestRecord;
            self->_networkRequestRecord = v27;

            if (self->_networkRequestRecord) {
              [(NSURLSessionConfiguration *)self->_urlSessionConfiguration set_timingDataOptions:1];
            }
            [(IKJSXMLHTTPRequest *)self _openWithMethod:v34 url:v19 async:v32 user:0 password:0];
            if ([(IKJSXMLHTTPRequest *)self requestReadyState] == 1) {
              goto LABEL_14;
            }
            v24 = @"XMLHttpRequest.open failed";
          }
          else
          {
            v24 = @"XMLHttpRequest.open does not currently support password parameter";
          }
        }
        else
        {
          v24 = @"XMLHttpRequest.open does not currently support user parameter";
        }
        v23 = self;
        goto LABEL_13;
      }
      objc_super v21 = [(__CFString *)v19 scheme];
      if ([v21 isEqualToString:@"https"])
      {

        goto LABEL_8;
      }
      v31 = [(__CFString *)v19 scheme];
      char v33 = [v31 isEqualToString:@"file"];

      if (v33) {
        goto LABEL_9;
      }
    }
    v29 = [NSString stringWithFormat:@"XMLHttpRequest.open set with invalid url %@", v13];
    [(IKJSXMLHTTPRequest *)self _setException:v29];

    goto LABEL_14;
  }
  v19 = [NSString stringWithFormat:@"XMLHttpRequest.open security exception, invalid method %@", v34];
  v23 = self;
  v24 = v19;
LABEL_13:
  [(IKJSXMLHTTPRequest *)v23 _setException:v24];
LABEL_14:

LABEL_16:
LABEL_17:
}

- (void)setRequestHeader:(id)a3 :(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([(IKJSXMLHTTPRequest *)self requestReadyState] != 1)
  {
    v7 = @"XMLHttpRequest.setRequestHeader must be called in OPEN readyState";
    goto LABEL_5;
  }
  if (self->_inProgress)
  {
    v7 = @"XMLHttpRequest.setRequestHeader must be called before send";
LABEL_5:
    [(IKJSXMLHTTPRequest *)self _setException:v7];
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (setRequestHeader::_onceToken != -1) {
      dispatch_once(&setRequestHeader::_onceToken, &__block_literal_global_140);
    }
    v8 = [v10 lowercaseString];
    if (([(id)setRequestHeader::_internalHeaders containsObject:v8] & 1) == 0
      && ([v8 hasPrefix:@"proxy-"] & 1) == 0
      && ([v8 hasPrefix:@"sec-"] & 1) == 0)
    {
      v9 = [(IKJSXMLHTTPRequest *)self urlRequest];
      [v9 setValue:v6 forHTTPHeaderField:v10];
    }
  }
  else
  {
    v8 = [NSString stringWithFormat:@"XMLHttpRequest.setRequestHeader contained nil header name or value (%@ = %@)", v10, v6];
    [(IKJSXMLHTTPRequest *)self _setException:v8];
  }

LABEL_6:
}

uint64_t __40__IKJSXMLHTTPRequest_setRequestHeader::__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3E3DB18];
  uint64_t v1 = setRequestHeader::_internalHeaders;
  setRequestHeader::_internalHeaders = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)send:(id)a3
{
  id v4 = a3;
  if ([(IKJSXMLHTTPRequest *)self requestReadyState] != 1)
  {
    id v6 = @"XMLHttpRequest.send called on request that is not in state OPENED";
    goto LABEL_7;
  }
  if (self->_inProgress)
  {
    v5 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_1E2ACE000, v5, OS_LOG_TYPE_INFO, "XMLHttpRequest.send() already called, ignoring additional calls.", v14, 2u);
    }

    goto LABEL_15;
  }
  self->_inProgress = 1;
  if (v4 && ([v4 isNull] & 1) == 0 && (objc_msgSend(v4, "isUndefined") & 1) == 0)
  {
    if ([v4 isString])
    {
      v7 = [v4 toString];
      goto LABEL_12;
    }
    id v6 = @"XMLHttpRequest.send called with invalid argument, only string type is allowed";
LABEL_7:
    [(IKJSXMLHTTPRequest *)self _setException:v6];
    goto LABEL_15;
  }
  v7 = 0;
LABEL_12:
  if (self->_async)
  {
    v8 = [MEMORY[0x1E4F30920] currentContext];
    v9 = [v8 virtualMachine];

    managedSelf = self->_managedSelf;
    v11 = [(IKJSObject *)self appContext];
    id v12 = [v11 jsContext];
    id v13 = [v12 objectForKeyedSubscript:@"App"];
    [v9 addManagedReference:managedSelf withOwner:v13];
  }
  [(IKJSXMLHTTPRequest *)self _sendWithData:v7];

LABEL_15:
}

- (void)abort
{
  id v9 = [MEMORY[0x1E4F30920] currentArguments];
  if ([v9 count])
  {
    [(IKJSXMLHTTPRequest *)self _setException:@"XMLHttpRequest.abort called with arguments, expected none"];
  }
  else
  {
    v3 = [MEMORY[0x1E4F30920] currentContext];
    id v4 = [v3 virtualMachine];

    managedSelf = self->_managedSelf;
    id v6 = [(IKJSObject *)self appContext];
    v7 = [v6 jsContext];
    v8 = [v7 objectForKeyedSubscript:@"App"];
    [v4 removeManagedReference:managedSelf withOwner:v8];

    [(IKJSXMLHTTPRequest *)self _abort];
  }
}

- (id)getResponseHeader:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ![v4 length]
    || ![(IKJSXMLHTTPRequest *)self requestReadyState]
    || [(IKJSXMLHTTPRequest *)self requestReadyState] == 1)
  {
    goto LABEL_7;
  }
  v5 = [(IKJSXMLHTTPRequest *)self requestError];
  if (v5 || ![v4 caseInsensitiveCompare:@"Set-Cookie"])
  {

LABEL_7:
    id v6 = 0;
    goto LABEL_8;
  }
  if (![v4 caseInsensitiveCompare:@"Set-Cookie2"]) {
    goto LABEL_7;
  }
  BOOL v8 = [(IKJSXMLHTTPRequest *)self jingleRequest];
  id v9 = [(IKJSXMLHTTPRequest *)self urlResponse];
  id v10 = v9;
  if (v8) {
    objc_msgSend(v9, "itunes_allHeaderFields");
  }
  else {
  v11 = [v9 allHeaderFields];
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = objc_msgSend(v11, "allKeys", 0);
  id v6 = (void *)[v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v12);
        }
        id v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (![v15 caseInsensitiveCompare:v4])
        {
          id v6 = [v11 objectForKey:v15];
          goto LABEL_26;
        }
      }
      id v6 = (void *)[v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_26:

LABEL_8:
  return v6;
}

- (id)getAllResponseHeaders
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![(IKJSXMLHTTPRequest *)self requestReadyState]
    || [(IKJSXMLHTTPRequest *)self requestReadyState] == 1
    || ([(IKJSXMLHTTPRequest *)self requestError],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = 0;
  }
  else
  {
    BOOL v6 = [(IKJSXMLHTTPRequest *)self jingleRequest];
    v7 = [(IKJSXMLHTTPRequest *)self urlResponse];
    BOOL v8 = v7;
    if (v6) {
      objc_msgSend(v7, "itunes_allHeaderFields");
    }
    else {
    id v9 = [v7 allHeaderFields];
    }

    id v4 = [MEMORY[0x1E4F28E78] string];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = [v9 allKeys];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v15 caseInsensitiveCompare:@"Set-Cookie"]
            && [v15 caseInsensitiveCompare:@"Set-Cookie2"])
          {
            long long v16 = [v9 objectForKey:v15];
            [v4 appendFormat:@"%@: %@\r\n", v15, v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
  return v4;
}

- (NSString)responseText
{
  if ([(IKJSXMLHTTPRequest *)self readyState] >= 3
    && ([(IKJSXMLHTTPRequest *)self receivedData],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
    v5 = [v4 objectForKey:@"parseStartTime"];

    if (v5)
    {
      BOOL v6 = 0;
    }
    else
    {
      BOOL v8 = (void *)MEMORY[0x1E4F1CA60];
      id v9 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
      BOOL v6 = [v8 dictionaryWithDictionary:v9];

      id v10 = [(IKJSXMLHTTPRequest *)self _timeIntervalSince1970];
      [v6 setObject:v10 forKey:@"parseStartTime"];
    }
    id v11 = [NSString alloc];
    uint64_t v12 = [(IKJSXMLHTTPRequest *)self receivedData];
    v7 = (__CFString *)[v11 initWithData:v12 encoding:4];

    if (v6)
    {
      uint64_t v13 = [(IKJSXMLHTTPRequest *)self _timeIntervalSince1970];
      [v6 setObject:v13 forKey:@"parseEndTime"];

      [(IKJSXMLHTTPRequest *)self setPerformanceMetrics:v6];
    }
  }
  else
  {
    v7 = &stru_1F3E09950;
  }
  return (NSString *)v7;
}

- (IKDOMDocument)responseXML
{
  if ([(IKJSXMLHTTPRequest *)self readyState] < 3) {
    goto LABEL_8;
  }
  v3 = [(IKJSXMLHTTPRequest *)self receivedData];

  if (!v3) {
    goto LABEL_8;
  }
  if ([(IKJSXMLHTTPRequest *)self requestResponseType]
    && [(IKJSXMLHTTPRequest *)self requestResponseType] != 3)
  {
    [(IKJSXMLHTTPRequest *)self _setException:@"InvalidStateError"];
LABEL_8:
    v7 = 0;
    goto LABEL_13;
  }
  id v4 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
  v5 = [v4 objectForKey:@"parseStartTime"];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x1E4F1CA60];
    id v9 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
    BOOL v6 = [v8 dictionaryWithDictionary:v9];

    id v10 = [(IKJSXMLHTTPRequest *)self _timeIntervalSince1970];
    [v6 setObject:v10 forKey:@"parseStartTime"];
  }
  id v11 = [IKDOMImplementation alloc];
  uint64_t v12 = [(IKJSObject *)self appContext];
  uint64_t v13 = [(IKJSObject *)v11 initWithAppContext:v12];

  id v14 = [(IKDOMImplementation *)v13 createLSInput];
  id v15 = [(IKJSXMLHTTPRequest *)self receivedData];
  [v14 setByteStream:v15];

  long long v16 = [(IKDOMImplementation *)v13 createLSParser:1 :0];
  v7 = [v16 parse:v14];

  long long v17 = [(IKJSXMLHTTPRequest *)self requestURL];
  long long v18 = [v17 absoluteString];
  [v7 _setDocumentURI:v18];

  if (v6)
  {
    long long v19 = [(IKJSXMLHTTPRequest *)self _timeIntervalSince1970];
    [v6 setObject:v19 forKey:@"parseEndTime"];

    [(IKJSXMLHTTPRequest *)self setPerformanceMetrics:v6];
  }

LABEL_13:
  return (IKDOMDocument *)v7;
}

- (id)responseJSON
{
  if ([(IKJSXMLHTTPRequest *)self readyState] < 3) {
    goto LABEL_8;
  }
  v3 = [(IKJSXMLHTTPRequest *)self receivedData];

  if (!v3) {
    goto LABEL_8;
  }
  if ([(IKJSXMLHTTPRequest *)self requestResponseType]
    && [(IKJSXMLHTTPRequest *)self requestResponseType] != 4)
  {
    [(IKJSXMLHTTPRequest *)self _setException:@"InvalidStateError"];
LABEL_8:
    v7 = 0;
    goto LABEL_15;
  }
  id v4 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
  v5 = [v4 objectForKey:@"parseStartTime"];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x1E4F1CA60];
    id v9 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
    BOOL v6 = [v8 dictionaryWithDictionary:v9];

    id v10 = [(IKJSXMLHTTPRequest *)self _timeIntervalSince1970];
    [v6 setObject:v10 forKey:@"parseStartTime"];
  }
  id v11 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v12 = [(IKJSXMLHTTPRequest *)self receivedData];
  id v17 = 0;
  v7 = [v11 JSONObjectWithData:v12 options:0 error:&v17];
  id v13 = v17;

  if (v13)
  {
    id v14 = [v13 localizedDescription];
    [(IKJSXMLHTTPRequest *)self _setException:v14];
  }
  if (v6)
  {
    id v15 = [(IKJSXMLHTTPRequest *)self _timeIntervalSince1970];
    [v6 setObject:v15 forKey:@"parseEndTime"];

    [(IKJSXMLHTTPRequest *)self setPerformanceMetrics:v6];
  }

LABEL_15:
  return v7;
}

- (id)responseBlob
{
  if ([(IKJSXMLHTTPRequest *)self readyState] < 3) {
    goto LABEL_8;
  }
  v3 = [(IKJSXMLHTTPRequest *)self receivedData];

  if (!v3) {
    goto LABEL_8;
  }
  if ([(IKJSXMLHTTPRequest *)self requestResponseType]
    && [(IKJSXMLHTTPRequest *)self requestResponseType] != 2)
  {
    [(IKJSXMLHTTPRequest *)self _setException:@"InvalidStateError"];
LABEL_8:
    v7 = 0;
    goto LABEL_13;
  }
  id v4 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
  v5 = [v4 objectForKey:@"parseStartTime"];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x1E4F1CA60];
    id v9 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
    BOOL v6 = [v8 dictionaryWithDictionary:v9];

    id v10 = [(IKJSXMLHTTPRequest *)self _timeIntervalSince1970];
    [v6 setObject:v10 forKey:@"parseStartTime"];
  }
  id v11 = [IKJSBlob alloc];
  uint64_t v12 = [(IKJSXMLHTTPRequest *)self receivedData];
  v7 = [(IKJSBlob *)v11 initWithData:v12];

  if (v6)
  {
    id v13 = [(IKJSXMLHTTPRequest *)self _timeIntervalSince1970];
    [v6 setObject:v13 forKey:@"parseEndTime"];

    [(IKJSXMLHTTPRequest *)self setPerformanceMetrics:v6];
  }

LABEL_13:
  return v7;
}

- (id)responseArrayBuffer
{
  if ([(IKJSXMLHTTPRequest *)self readyState] < 3) {
    goto LABEL_8;
  }
  v3 = [(IKJSXMLHTTPRequest *)self receivedData];

  if (!v3) {
    goto LABEL_8;
  }
  if ([(IKJSXMLHTTPRequest *)self requestResponseType]
    && [(IKJSXMLHTTPRequest *)self requestResponseType] != 1)
  {
    [(IKJSXMLHTTPRequest *)self _setException:@"InvalidStateError"];
LABEL_8:
    v7 = 0;
    goto LABEL_13;
  }
  id v4 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
  v5 = [v4 objectForKey:@"parseStartTime"];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x1E4F1CA60];
    id v9 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
    BOOL v6 = [v8 dictionaryWithDictionary:v9];

    id v10 = [(IKJSXMLHTTPRequest *)self _timeIntervalSince1970];
    [v6 setObject:v10 forKey:@"parseStartTime"];
  }
  id v11 = [(IKJSObject *)self appContext];
  uint64_t v12 = [v11 arrayBufferStore];

  id v13 = [(IKJSXMLHTTPRequest *)self receivedData];
  v7 = [v12 arrayBufferForData:v13];

  if (v6)
  {
    id v14 = [(IKJSXMLHTTPRequest *)self _timeIntervalSince1970];
    [v6 setObject:v14 forKey:@"parseEndTime"];

    [(IKJSXMLHTTPRequest *)self setPerformanceMetrics:v6];
  }

LABEL_13:
  return v7;
}

- (NSString)responseType
{
  unint64_t v2 = self->_requestResponseType - 1;
  if (v2 > 4) {
    return 0;
  }
  else {
    return &off_1E6DE7080[v2]->isa;
  }
}

- (void)setResponseType:(id)a3
{
  id v7 = a3;
  if ([(IKJSXMLHTTPRequest *)self requestReadyState] == 3
    || [(IKJSXMLHTTPRequest *)self requestReadyState] == 4)
  {
    [(IKJSXMLHTTPRequest *)self _setException:@"InvalidStateError"];
  }
  else
  {
    int64_t requestResponseType = self->_requestResponseType;
    if ([v7 isEqualToString:@"arraybuffer"])
    {
      int64_t v5 = 1;
    }
    else if ([v7 isEqualToString:@"blob"])
    {
      int64_t v5 = 2;
    }
    else if ([v7 isEqualToString:@"document"])
    {
      int64_t v5 = 3;
    }
    else if ([v7 isEqualToString:@"json"])
    {
      int64_t v5 = 4;
    }
    else
    {
      int v6 = [v7 isEqualToString:@"text"];
      int64_t v5 = 5;
      if (!v6) {
        int64_t v5 = requestResponseType;
      }
    }
    self->_int64_t requestResponseType = v5;
  }
}

- (id)response
{
  if ([(IKJSXMLHTTPRequest *)self requestResponseType] == 5
    || ![(IKJSXMLHTTPRequest *)self requestResponseType])
  {
    id v4 = [(IKJSXMLHTTPRequest *)self responseText];
  }
  else if ([(IKJSXMLHTTPRequest *)self requestReadyState] == 4 {
         && ([(IKJSXMLHTTPRequest *)self receivedData],
  }
             v3 = objc_claimAutoreleasedReturnValue(),
             v3,
             v3))
  {
    switch([(IKJSXMLHTTPRequest *)self requestResponseType])
    {
      case 1:
        id v4 = [(IKJSXMLHTTPRequest *)self responseArrayBuffer];
        break;
      case 2:
        id v4 = [(IKJSXMLHTTPRequest *)self responseBlob];
        break;
      case 3:
        id v4 = [(IKJSXMLHTTPRequest *)self responseXML];
        break;
      case 4:
        id v4 = [(IKJSXMLHTTPRequest *)self responseJSON];
        break;
      default:
        id v4 = [(IKJSXMLHTTPRequest *)self receivedData];
        break;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_constructProgressEventData
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v3 = [(IKJSXMLHTTPRequest *)self receivedData];
  uint64_t v4 = [v3 length];

  if (v4
    && ([(IKJSXMLHTTPRequest *)self urlResponse],
        int64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    int v6 = [(IKJSXMLHTTPRequest *)self urlResponse];
    uint64_t v7 = [v6 expectedContentLength];

    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  v14[0] = @"lengthComputable";
  id v9 = [NSNumber numberWithBool:v8];
  v15[0] = v9;
  v14[1] = @"loaded";
  id v10 = [NSNumber numberWithUnsignedLongLong:v4];
  v15[1] = v10;
  v14[2] = @"total";
  id v11 = [NSNumber numberWithUnsignedLongLong:v7];
  v15[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (void)_setException:(id)a3
{
  id v4 = a3;
  id v5 = [(IKJSObject *)self appContext];
  [v5 setException:0 withErrorMessage:v4];
}

- (void)setRequestReadyState:(int64_t)a3
{
  if (self->_requestReadyState != a3)
  {
    self->_requestReadyState = a3;
    id v4 = [IKOnReadyStateChangeMessage alloc];
    int64_t v5 = [(IKJSXMLHTTPRequest *)self requestReadyState];
    uint64_t v6 = [(IKJSXMLHTTPRequest *)self requestStatusCode];
    uint64_t v7 = [(IKJSXMLHTTPRequest *)self requestStatusText];
    uint64_t v8 = [(IKJSXMLHTTPRequest *)self requestError];
    id v9 = [(IKOnReadyStateChangeMessage *)v4 initWithReadyState:v5 statusCode:v6 statusText:v7 error:v8];

    os_unfair_lock_lock(&self->_onReadyStateChangeMessageQueueLock);
    if (self->_shouldSquashOnReadyStateEvents)
    {
      os_unfair_lock_unlock(&self->_onReadyStateChangeMessageQueueLock);
    }
    else
    {
      [(NSMutableArray *)self->_onReadyStateChangeMessageQueue addObject:v9];
      os_unfair_lock_unlock(&self->_onReadyStateChangeMessageQueueLock);
      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __43__IKJSXMLHTTPRequest_setRequestReadyState___block_invoke;
      v15[3] = &unk_1E6DE3C70;
      objc_copyWeak(&v16, &location);
      id v10 = (void (**)(void))MEMORY[0x1E4E65800](v15);
      id v11 = +[IKAppContext currentAppContext];

      if (v11)
      {
        v10[2](v10);
      }
      else
      {
        uint64_t v12 = [(IKJSObject *)self appContext];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __43__IKJSXMLHTTPRequest_setRequestReadyState___block_invoke_2;
        v13[3] = &unk_1E6DE7010;
        id v14 = v10;
        [v12 evaluate:v13 completionBlock:0];
      }
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

void __43__IKJSXMLHTTPRequest_setRequestReadyState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v19 = WeakRetained;
    unint64_t v2 = [WeakRetained _dequeueReadyStateChangeMessage];
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v19, "setReadyState:", objc_msgSend(v2, "readyState"));
      if ([v3 statusCode] == 900) {
        uint64_t v4 = 0;
      }
      else {
        uint64_t v4 = [v3 statusCode];
      }
      [v19 setStatus:v4];
      uint64_t v5 = [v3 statusText];
      uint64_t v6 = (void *)v5;
      if (v5) {
        uint64_t v7 = (__CFString *)v5;
      }
      else {
        uint64_t v7 = &stru_1F3E09950;
      }
      [v19 setStatusText:v7];

      id v8 = (id)[v19 invokeMethod:@"onreadystatechange" withArguments:0];
      if ([v3 readyState]) {
        [v19 invokeListeners:@"readystatechange" extraInfo:0];
      }
      if ([v3 readyState] == 4)
      {
        if ([v3 statusCode] == 408 || objc_msgSend(v3, "statusCode") == 900)
        {
          id v9 = [v19 _constructProgressEventData];
          id v10 = @"ontimeout";
          id v11 = @"timeout";
        }
        else if ([v3 statusCode] < 0xC8 {
               || [v3 statusCode] > 0x12B)
        }
        {
          id v9 = [v19 _constructProgressEventData];
          id v10 = @"onerror";
          id v11 = @"error";
        }
        else
        {
          id v9 = [v19 _constructProgressEventData];
          id v10 = @"onload";
          id v11 = @"load";
        }
        [v19 invokeMethod:v10 withArguments:0 thenDispatchEvent:v11 extraInfo:v9];

        uint64_t v12 = [v19 _constructProgressEventData];
        [v19 invokeMethod:@"onloadend" withArguments:0 thenDispatchEvent:@"loadend" extraInfo:v12];

        id v13 = [MEMORY[0x1E4F30920] currentContext];
        id v14 = [v13 virtualMachine];

        id v15 = [v19 managedSelf];
        id v16 = [v19 appContext];
        id v17 = [v16 jsContext];
        long long v18 = [v17 objectForKeyedSubscript:@"App"];
        [v14 removeManagedReference:v15 withOwner:v18];
      }
    }

    id WeakRetained = v19;
  }
}

uint64_t __43__IKJSXMLHTTPRequest_setRequestReadyState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_openWithMethod:(id)a3 url:(id)a4 async:(BOOL)a5 user:(id)a6 password:(id)a7
{
  id v17 = a3;
  id v10 = a4;
  self->_shouldSquashOnReadyStateEvents = 0;
  id v11 = [(IKJSXMLHTTPRequest *)self urlConnection];
  uint64_t v12 = v11;
  if (v11) {
    [v11 cancel];
  }
  [(IKJSXMLHTTPRequest *)self setUrlConnection:0];
  id v13 = [(IKJSXMLHTTPRequest *)self urlSession];
  id v14 = v13;
  if (v13) {
    [v13 invalidateAndCancel];
  }
  [(IKJSXMLHTTPRequest *)self setUrlSession:0];
  [(IKJSXMLHTTPRequest *)self setUrlRequest:0];
  [(IKJSXMLHTTPRequest *)self setRequestId:0];
  if (v17 && v10)
  {
    id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E88]), "initWithURL:cachePolicy:timeoutInterval:", v10, +[IKPreference ignoreHTTPCache](IKPreference, "ignoreHTTPCache"), (double)-[IKJSXMLHTTPRequest timeout](self, "timeout") / 1000.0);
    id v16 = [(IKJSObject *)self appContext];
    [v16 willPerformXhrRequest:v15];

    [(IKJSXMLHTTPRequest *)self setUrlRequest:v15];
    [(IKJSXMLHTTPRequest *)self setRequestURL:v10];
    if (v15)
    {
      [v15 setHTTPMethod:v17];
      self->_async = a5;
      [(IKJSXMLHTTPRequest *)self setRequestReadyState:1];
    }
  }
}

- (void)_sendWithData:(id)a3
{
  id v5 = a3;
  self->_shouldSquashOnReadyStateEvents = 0;
  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = [v6 UUIDString];
  [(IKJSXMLHTTPRequest *)self setRequestId:v7];

  id v8 = [(IKJSXMLHTTPRequest *)self urlRequest];
  id v9 = v5;
  id v10 = [v8 HTTPMethod];
  if ([v10 isEqualToString:@"GET"])
  {
  }
  else
  {
    id v11 = [v8 HTTPMethod];
    int v12 = [v11 isEqualToString:@"HEAD"];

    id v13 = v9;
    if (!v12) {
      goto LABEL_5;
    }
  }

  id v13 = 0;
LABEL_5:
  id v14 = [v13 dataUsingEncoding:4];
  [v8 setHTTPBody:v14];

  objc_msgSend(v8, "setTimeoutInterval:", (double)-[IKJSXMLHTTPRequest timeout](self, "timeout") / 1000.0);
  id v15 = [(IKJSXMLHTTPRequest *)self networkRequestRecord];
  [v15 willSendRequest:v8 redirectResponse:0];
  if ([(IKJSXMLHTTPRequest *)self jingleRequest])
  {
    objc_storeStrong((id *)&self->_dataToSend, a3);
    id v16 = [MEMORY[0x1E4FA8328] sharedPrimeSession];
    id v17 = v16;
    if (self->_primeEnabled && ([v16 primed] & 1) == 0) {
      [(IKJSXMLHTTPRequest *)self _prime:v17];
    }
    long long v18 = [(IKJSXMLHTTPRequest *)self _createStoreOperation:v8];
    [(IKJSXMLHTTPRequest *)self setJingleOperation:v18];
    id v19 = [MEMORY[0x1E4FB8838] mainQueue];
    [v19 addOperation:v18];

    long long v20 = [(IKJSXMLHTTPRequest *)self _constructProgressEventData];
    [(IKJSEventListenerObject *)self invokeMethod:@"onloadstart" withArguments:0 thenDispatchEvent:@"loadstart" extraInfo:v20];

    goto LABEL_22;
  }
  id v17 = [(IKJSXMLHTTPRequest *)self urlSessionConfiguration];
  if (+[IKPreference ignoreHTTPCache])
  {
    [(IKJSXMLHTTPRequest *)self setCachedURLResponse:0];
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4F29078] sharedURLCache];
    uint64_t v22 = [v21 cachedResponseForRequest:v8];

    v23 = [v22 response];
    [(IKJSXMLHTTPRequest *)self setCachedURLResponse:v23];
  }
  if (!self->_async)
  {
    uint64_t v67 = 0;
    v68 = &v67;
    uint64_t v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__28;
    v71 = __Block_byref_object_dispose__28;
    id v72 = 0;
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__28;
    v65 = __Block_byref_object_dispose__28;
    id v66 = 0;
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__28;
    v59 = __Block_byref_object_dispose__28;
    id v60 = 0;
    if (v17)
    {
      v30 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v17 delegate:0 delegateQueue:0];
      dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __36__IKJSXMLHTTPRequest__sendWithData___block_invoke;
      v50[3] = &unk_1E6DE7038;
      v52 = &v67;
      v53 = &v61;
      v54 = &v55;
      unsigned int v32 = v31;
      v51 = v32;
      char v33 = [v30 dataTaskWithRequest:v8 completionHandler:v50];
      [v33 resume];
      dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      id v48 = 0;
      id obj = 0;
      uint64_t v38 = [MEMORY[0x1E4F29090] sendSynchronousRequest:v8 returningResponse:&obj error:&v48];
      objc_storeStrong(&v66, obj);
      objc_storeStrong(&v72, v48);
      v30 = (void *)v56[5];
      v56[5] = v38;
    }

    v39 = [MEMORY[0x1E4F1CA58] dataWithData:v56[5]];
    [(IKJSXMLHTTPRequest *)self setReceivedData:v39];

    [(IKJSXMLHTTPRequest *)self setUrlResponse:v62[5]];
    v40 = [(IKJSXMLHTTPRequest *)self urlResponse];
    -[IKJSXMLHTTPRequest setRequestStatusCode:](self, "setRequestStatusCode:", objc_msgSend(v40, "itunes_statusCode"));

    v41 = objc_msgSend(MEMORY[0x1E4F28D20], "localizedStringForStatusCode:", -[IKJSXMLHTTPRequest requestStatusCode](self, "requestStatusCode"));
    [(IKJSXMLHTTPRequest *)self setRequestStatusText:v41];

    [v15 didReceiveResponse:v62[5] timingData:0];
    if (v56[5]) {
      objc_msgSend(v15, "didCompleteLoadingWithResponseBody:");
    }
    else {
      [v15 didFailWithError:v68[5]];
    }
    self->_requestReadyState = 4;
    [(IKJSXMLHTTPRequest *)self setReadyState:4];
    v42 = [(IKJSXMLHTTPRequest *)self urlResponse];
    -[IKJSXMLHTTPRequest setStatus:](self, "setStatus:", objc_msgSend(v42, "itunes_statusCode"));

    v43 = objc_msgSend(MEMORY[0x1E4F28D20], "localizedStringForStatusCode:", -[IKJSXMLHTTPRequest requestStatusCode](self, "requestStatusCode"));
    [(IKJSXMLHTTPRequest *)self setStatusText:v43];

    [(IKJSEventListenerObject *)self invokeMethod:@"onreadystatechange" withArguments:0 thenDispatchEvent:@"readystatechange" extraInfo:0];
    if ([(IKJSXMLHTTPRequest *)self status] == 408) {
      goto LABEL_32;
    }
    v45 = [(id)v68[5] domain];
    if ([v45 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      uint64_t v46 = [(id)v68[5] code];

      if (v46 == -1001)
      {
LABEL_32:
        v44 = [(IKJSXMLHTTPRequest *)self _constructProgressEventData];
        [(IKJSEventListenerObject *)self invokeMethod:@"ontimeout" withArguments:0 thenDispatchEvent:@"timeout" extraInfo:v44];
LABEL_40:

        v47 = [(IKJSXMLHTTPRequest *)self _constructProgressEventData];
        [(IKJSEventListenerObject *)self invokeMethod:@"onloadend" withArguments:0 thenDispatchEvent:@"loadend" extraInfo:v47];

        _Block_object_dispose(&v55, 8);
        _Block_object_dispose(&v61, 8);

        _Block_object_dispose(&v67, 8);
        goto LABEL_41;
      }
    }
    else
    {
    }
    if (v68[5])
    {
      v44 = [(IKJSXMLHTTPRequest *)self _constructProgressEventData];
      [(IKJSEventListenerObject *)self invokeMethod:@"onerror" withArguments:0 thenDispatchEvent:@"error" extraInfo:v44];
    }
    else
    {
      v44 = [(IKJSXMLHTTPRequest *)self _constructProgressEventData];
      [(IKJSEventListenerObject *)self invokeMethod:@"onload" withArguments:0 thenDispatchEvent:@"load" extraInfo:v44];
    }
    goto LABEL_40;
  }
  if (v17)
  {
    v24 = (void *)MEMORY[0x1E4F290E0];
    v25 = [(id)objc_opt_class() xhrOperationQueue];
    v26 = [v24 sessionWithConfiguration:v17 delegate:self delegateQueue:v25];

    [(IKJSXMLHTTPRequest *)self setUrlSession:v26];
    uint64_t v27 = [v26 dataTaskWithRequest:v8];
    if (v27)
    {
      v28 = (void *)v27;
      v29 = [MEMORY[0x1E4F1CA58] data];
      [(IKJSXMLHTTPRequest *)self setReceivedData:v29];

      [v28 resume];
LABEL_21:

      long long v18 = [(IKJSXMLHTTPRequest *)self _constructProgressEventData];
      [(IKJSEventListenerObject *)self invokeMethod:@"onloadstart" withArguments:0 thenDispatchEvent:@"loadstart" extraInfo:v18];
LABEL_22:

      goto LABEL_41;
    }
  }
  else
  {
    v26 = (void *)[objc_alloc(MEMORY[0x1E4F29090]) initWithRequest:v8 delegate:self startImmediately:0];
    id v34 = [(id)objc_opt_class() xhrOperationQueue];
    [v26 setDelegateQueue:v34];

    [(IKJSXMLHTTPRequest *)self setUrlConnection:v26];
    if (v26)
    {
      v35 = [MEMORY[0x1E4F1CA58] data];
      [(IKJSXMLHTTPRequest *)self setReceivedData:v35];

      [v26 start];
      goto LABEL_21;
    }
  }
  v36 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    -[IKJSXMLHTTPRequest _sendWithData:]();
  }

  [(IKJSXMLHTTPRequest *)self setRequestStatusCode:0];
  [(IKJSXMLHTTPRequest *)self setRequestStatusText:0];
  v37 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ITMLKitErrorDomain" code:1 userInfo:0];
  [(IKJSXMLHTTPRequest *)self setRequestError:v37];

  [(IKJSXMLHTTPRequest *)self setRequestReadyState:4];
LABEL_41:
}

void __36__IKJSXMLHTTPRequest__sendWithData___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  id v15 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
  id v11 = v8;

  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v7;
  id v14 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_abort
{
  id v11 = [(IKJSXMLHTTPRequest *)self urlConnection];
  v3 = [(IKJSXMLHTTPRequest *)self urlSession];
  uint64_t v4 = [(IKJSXMLHTTPRequest *)self urlSessionConfiguration];

  if (v4) {
    id v5 = v3;
  }
  else {
    id v5 = v11;
  }
  uint64_t v6 = [(IKJSXMLHTTPRequest *)self jingleOperation];
  if ([(IKJSXMLHTTPRequest *)self requestReadyState]
    && [(IKJSXMLHTTPRequest *)self requestReadyState] != 4
    && ([(IKJSXMLHTTPRequest *)self requestReadyState] != 1 || v5 || v6))
  {
    id v7 = [(IKJSXMLHTTPRequest *)self networkRequestRecord];
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-999 userInfo:0];
    [v7 didFailWithError:v8];

    if (v6)
    {
      [v6 setDelegate:0];
      [v6 setCompletionBlock:0];
      [v6 cancel];
      [(IKJSXMLHTTPRequest *)self setJingleOperation:0];
    }
    else
    {
      [v11 cancel];
      [(IKJSXMLHTTPRequest *)self setUrlConnection:0];
      [v3 invalidateAndCancel];
      [(IKJSXMLHTTPRequest *)self setUrlSession:0];
    }
    [(IKJSXMLHTTPRequest *)self setRequestId:0];
    [(IKJSXMLHTTPRequest *)self setUrlRequest:0];
    [(IKJSXMLHTTPRequest *)self setUrlResponse:0];
    [(IKJSXMLHTTPRequest *)self setReceivedData:0];
    [(IKJSXMLHTTPRequest *)self setRequestURL:0];
    [(IKJSXMLHTTPRequest *)self setRequestStatusCode:0];
    [(IKJSXMLHTTPRequest *)self setRequestStatusText:0];
    self->_requestReadyState = 4;
    [(IKJSXMLHTTPRequest *)self _clearAllReadyStateChangeMessagesAndSquashFutureOnes];
    [(IKJSXMLHTTPRequest *)self setReadyState:4];
    [(IKJSXMLHTTPRequest *)self setDataToSend:0];
    [(IKJSXMLHTTPRequest *)self setStatus:0];
    [(IKJSXMLHTTPRequest *)self setStatusText:&stru_1F3E09950];
    [(IKJSEventListenerObject *)self invokeMethod:@"onreadystatechange" withArguments:0 thenDispatchEvent:@"readystatechange" extraInfo:0];
    uint64_t v9 = [(IKJSXMLHTTPRequest *)self _constructProgressEventData];
    [(IKJSEventListenerObject *)self invokeMethod:@"onabort" withArguments:0 thenDispatchEvent:@"abort" extraInfo:v9];

    id v10 = [(IKJSXMLHTTPRequest *)self _constructProgressEventData];
    [(IKJSEventListenerObject *)self invokeMethod:@"onloadend" withArguments:0 thenDispatchEvent:@"loadend" extraInfo:v10];
  }
  else
  {
    self->_requestReadyState = 0;
  }
}

- (id)_dequeueReadyStateChangeMessage
{
  p_onReadyStateChangeMessageQueueLock = &self->_onReadyStateChangeMessageQueueLock;
  os_unfair_lock_lock(&self->_onReadyStateChangeMessageQueueLock);
  if ([(NSMutableArray *)self->_onReadyStateChangeMessageQueue count])
  {
    uint64_t v4 = [(NSMutableArray *)self->_onReadyStateChangeMessageQueue objectAtIndex:0];
    [(NSMutableArray *)self->_onReadyStateChangeMessageQueue removeObjectAtIndex:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  os_unfair_lock_unlock(p_onReadyStateChangeMessageQueueLock);
  return v4;
}

- (void)_clearAllReadyStateChangeMessagesAndSquashFutureOnes
{
  p_onReadyStateChangeMessageQueueLock = &self->_onReadyStateChangeMessageQueueLock;
  os_unfair_lock_lock(&self->_onReadyStateChangeMessageQueueLock);
  self->_shouldSquashOnReadyStateEvents = 1;
  [(NSMutableArray *)self->_onReadyStateChangeMessageQueue removeAllObjects];
  os_unfair_lock_unlock(p_onReadyStateChangeMessageQueueLock);
}

- (BOOL)validateTrust:(__SecTrust *)a3
{
  CFErrorRef error = 0;
  BOOL v3 = SecTrustEvaluateWithError(a3, &error);
  if (!v3)
  {
    uint64_t v4 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[IKJSXMLHTTPRequest validateTrust:]((uint64_t)&error, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return v3;
}

- (BOOL)verifyCertificateIsSystemTrustedWithTrust:(__SecTrust *)a3
{
  if (!a3)
  {
    uint64_t v8 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[IKJSXMLHTTPRequest verifyCertificateIsSystemTrustedWithTrust:]();
    }
    goto LABEL_14;
  }
  if (!-[IKJSXMLHTTPRequest validateTrust:](self, "validateTrust:"))
  {
    uint64_t v8 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[IKJSXMLHTTPRequest verifyCertificateIsSystemTrustedWithTrust:].cold.6();
    }
    goto LABEL_14;
  }
  uint64_t v5 = [(IKJSObject *)self appContext];
  if (![v5 canRequireSystemTrustForXHRs])
  {

    goto LABEL_16;
  }
  BOOL v6 = [(IKJSXMLHTTPRequest *)self requireSystemTrust];

  if (!v6)
  {
LABEL_16:
    uint64_t v8 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[IKJSXMLHTTPRequest verifyCertificateIsSystemTrustedWithTrust:].cold.5();
    }
    BOOL v9 = 1;
    goto LABEL_19;
  }
  CFArrayRef v7 = SecTrustCopyCertificateChain(a3);
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v10 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[IKJSXMLHTTPRequest verifyCertificateIsSystemTrustedWithTrust:]();
    }
    goto LABEL_24;
  }
  if (![(__CFArray *)v7 lastObject])
  {
    uint64_t v10 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[IKJSXMLHTTPRequest verifyCertificateIsSystemTrustedWithTrust:]();
    }
    goto LABEL_24;
  }
  BOOL v9 = 1;
  SecTrustStoreForDomain();
  if (!SecTrustStoreContains())
  {
    uint64_t v10 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[IKJSXMLHTTPRequest verifyCertificateIsSystemTrustedWithTrust:].cold.4();
    }
LABEL_24:

LABEL_14:
    BOOL v9 = 0;
  }
LABEL_19:

  return v9;
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  return [(IKJSXMLHTTPRequest *)self _loadingWillSendRequest:a4 redirectResponse:a5];
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v6 = a4;
  id v7 = [a3 _timingData];
  [(IKJSXMLHTTPRequest *)self _loadingDidReceiveResponse:v6 timingData:v7];
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = (void (**)(id, uint64_t, void *))a5;
  uint64_t v8 = [a4 protectionSpace];
  uint64_t v9 = [v8 serverTrust];
  uint64_t v10 = [v8 authenticationMethod];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F28988]];

  if (v11)
  {
    BOOL v12 = [(IKJSXMLHTTPRequest *)self verifyCertificateIsSystemTrustedWithTrust:v9];
    id v13 = ITMLKitGetLogObject(0);
    id v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[IKJSXMLHTTPRequest URLSession:didReceiveChallenge:completionHandler:]();
      }

      id v15 = objc_msgSend(MEMORY[0x1E4F29098], "credentialForTrust:", objc_msgSend(v8, "serverTrust"));
      uint64_t v16 = 0;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[IKJSXMLHTTPRequest URLSession:didReceiveChallenge:completionHandler:]();
      }

      id v15 = 0;
      uint64_t v16 = 2;
    }
  }
  else
  {
    id v17 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[IKJSXMLHTTPRequest URLSession:didReceiveChallenge:completionHandler:]();
    }

    id v15 = 0;
    uint64_t v16 = 1;
  }
  v7[2](v7, v16, v15);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  if (a5) {
    -[IKJSXMLHTTPRequest _loadingDidFailWithError:](self, "_loadingDidFailWithError:", a5, a4);
  }
  else {
    [(IKJSXMLHTTPRequest *)self _loadingDidFinish];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  int v11 = (void (**)(id, uint64_t))a6;
  id v9 = a5;
  uint64_t v10 = [a4 _timingData];
  [(IKJSXMLHTTPRequest *)self _loadingDidReceiveResponse:v9 timingData:v10];

  v11[2](v11, 1);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11 = a7;
  id v12 = [(IKJSXMLHTTPRequest *)self _loadingWillSendRequest:a6 redirectResponse:a5];
  (*((void (**)(id, id))a7 + 2))(v11, v12);
}

- (id)_loadingWillSendRequest:(id)a3 redirectResponse:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [(IKJSXMLHTTPRequest *)self networkRequestRecord];
    [v8 willSendRequest:v6 redirectResponse:v7];
  }
  id v12 = @"requestStartTime";
  id v9 = [(IKJSXMLHTTPRequest *)self _timeIntervalSince1970];
  v13[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  [(IKJSXMLHTTPRequest *)self setPerformanceMetrics:v10];
  return v6;
}

- (void)_loadingDidReceiveResponse:(id)a3 timingData:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(IKJSXMLHTTPRequest *)self networkRequestRecord];
  [v8 didReceiveResponse:v7 timingData:v6];

  id v9 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v10 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
  id v11 = [v9 dictionaryWithDictionary:v10];

  id v12 = [v7 allHeaderFields];
  id v13 = [v12 objectForKey:@"Date"];

  id v14 = [(IKJSXMLHTTPRequest *)self cachedURLResponse];
  id v15 = [v14 allHeaderFields];
  uint64_t v16 = [v15 objectForKey:@"Date"];

  uint64_t v17 = [v13 isEqualToString:v16];
  long long v18 = [NSNumber numberWithBool:v17];
  [v11 setObject:v18 forKey:@"isResponseCached"];

  id v19 = [(IKJSXMLHTTPRequest *)self _timeIntervalSince1970];
  [v11 setObject:v19 forKey:@"responseStartTime"];

  [(IKJSXMLHTTPRequest *)self setPerformanceMetrics:v11];
  [(IKJSXMLHTTPRequest *)self setUrlResponse:v7];
  uint64_t v20 = objc_msgSend(v7, "itunes_statusCode");

  [(IKJSXMLHTTPRequest *)self setRequestStatusCode:v20];
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28D20], "localizedStringForStatusCode:", -[IKJSXMLHTTPRequest requestStatusCode](self, "requestStatusCode"));
  [(IKJSXMLHTTPRequest *)self setRequestStatusText:v21];

  uint64_t v22 = [MEMORY[0x1E4F1C9B8] data];
  [(IKJSXMLHTTPRequest *)self setReceivedData:v22];

  [(IKJSXMLHTTPRequest *)self setRequestReadyState:2];
  v23 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = [(IKJSXMLHTTPRequest *)self urlRequest];
    v25 = [v24 URL];
    int v26 = 138412546;
    uint64_t v27 = v25;
    __int16 v28 = 2048;
    v29 = self;
    _os_log_impl(&dword_1E2ACE000, v23, OS_LOG_TYPE_INFO, "Received response for XHR request %@ %p", (uint8_t *)&v26, 0x16u);
  }
}

- (void)_loadingDidReceiveData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKJSXMLHTTPRequest *)self networkRequestRecord];
  [v5 didReceiveData:v4];

  id v6 = [(IKJSXMLHTTPRequest *)self receivedData];
  id v8 = (id)[v6 mutableCopy];

  [v8 appendData:v4];
  id v7 = (void *)[v8 copy];
  [(IKJSXMLHTTPRequest *)self setReceivedData:v7];

  [(IKJSXMLHTTPRequest *)self setRequestReadyState:3];
}

- (void)_loadingDidFailWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[IKJSXMLHTTPRequest _loadingDidFailWithError:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = [(IKJSXMLHTTPRequest *)self networkRequestRecord];
  [v12 didFailWithError:v4];

  id v13 = (void *)MEMORY[0x1E4F1CA60];
  id v14 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
  id v15 = [v13 dictionaryWithDictionary:v14];

  uint64_t v16 = [(IKJSXMLHTTPRequest *)self _timeIntervalSince1970];
  [v15 setObject:v16 forKey:@"responseEndTime"];

  [(IKJSXMLHTTPRequest *)self setPerformanceMetrics:v15];
  [(IKJSXMLHTTPRequest *)self setUrlConnection:0];
  [(IKJSXMLHTTPRequest *)self setUrlSession:0];
  [(IKJSXMLHTTPRequest *)self setUrlRequest:0];
  [(IKJSXMLHTTPRequest *)self setUrlResponse:0];
  [(IKJSXMLHTTPRequest *)self setReceivedData:0];
  [(IKJSXMLHTTPRequest *)self setRequestURL:0];
  uint64_t v17 = [v4 domain];
  if (![v17 isEqualToString:*MEMORY[0x1E4F289A0]])
  {

    goto LABEL_7;
  }
  uint64_t v18 = [v4 code];

  if (v18 != -1001)
  {
LABEL_7:
    [(IKJSXMLHTTPRequest *)self setRequestError:v4];
    goto LABEL_8;
  }
  [(IKJSXMLHTTPRequest *)self setRequestStatusCode:900];
LABEL_8:
  [(IKJSXMLHTTPRequest *)self setRequestReadyState:4];
  self->_inProgress = 0;
}

- (void)_loadingDidFinish
{
  BOOL v3 = [(IKJSXMLHTTPRequest *)self networkRequestRecord];
  id v4 = [(IKJSXMLHTTPRequest *)self receivedData];
  [v3 didCompleteLoadingWithResponseBody:v4];

  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v6 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
  id v8 = [v5 dictionaryWithDictionary:v6];

  uint64_t v7 = [(IKJSXMLHTTPRequest *)self _timeIntervalSince1970];
  [v8 setObject:v7 forKey:@"responseEndTime"];

  [(IKJSXMLHTTPRequest *)self setPerformanceMetrics:v8];
  [(IKJSXMLHTTPRequest *)self setUrlConnection:0];
  [(IKJSXMLHTTPRequest *)self setUrlSession:0];
  [(IKJSXMLHTTPRequest *)self setUrlRequest:0];
  [(IKJSXMLHTTPRequest *)self setRequestReadyState:4];
  self->_inProgress = 0;
}

- (void)operation:(id)a3 didReceiveResponse:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(IKJSXMLHTTPRequest *)self networkRequestRecord];
  [v6 didReceiveResponse:v5 timingData:0];

  uint64_t v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
  uint64_t v9 = [v7 dictionaryWithDictionary:v8];

  uint64_t v10 = objc_msgSend(v5, "itunes_allHeaderFields");
  uint64_t v11 = [v10 objectForKey:@"Date"];

  id v12 = [(IKJSXMLHTTPRequest *)self cachedURLResponse];
  id v13 = objc_msgSend(v12, "itunes_allHeaderFields");
  id v14 = [v13 objectForKey:@"Date"];

  uint64_t v15 = [v11 isEqualToString:v14];
  uint64_t v16 = [NSNumber numberWithBool:v15];
  [v9 setObject:v16 forKey:@"isResponseCached"];

  [(IKJSXMLHTTPRequest *)self setPerformanceMetrics:v9];
  [(IKJSXMLHTTPRequest *)self setUrlResponse:v5];
  uint64_t v17 = objc_msgSend(v5, "itunes_statusCode");

  [(IKJSXMLHTTPRequest *)self setRequestStatusCode:v17];
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28D20], "localizedStringForStatusCode:", -[IKJSXMLHTTPRequest requestStatusCode](self, "requestStatusCode"));
  [(IKJSXMLHTTPRequest *)self setRequestStatusText:v18];

  id v19 = [MEMORY[0x1E4F1C9B8] data];
  [(IKJSXMLHTTPRequest *)self setReceivedData:v19];

  [(IKJSXMLHTTPRequest *)self setRequestReadyState:2];
  uint64_t v20 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = [(IKJSXMLHTTPRequest *)self urlRequest];
    uint64_t v22 = [v21 URL];
    int v23 = 138412546;
    v24 = v22;
    __int16 v25 = 2048;
    int v26 = self;
    _os_log_impl(&dword_1E2ACE000, v20, OS_LOG_TYPE_INFO, "Received response for XHR request %@ %p", (uint8_t *)&v23, 0x16u);
  }
}

- (void)operation:(id)a3 didDiscoverContentLength:(id)a4
{
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(IKJSXMLHTTPRequest *)self _isPrimeError:[(IKJSXMLHTTPRequest *)self requestStatusCode] output:v7])
  {
    [(IKJSXMLHTTPRequest *)self _reprime:v6];
  }
  else
  {
    id v8 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [(IKJSXMLHTTPRequest *)self urlRequest];
      uint64_t v10 = [v9 URL];
      int v14 = 138412546;
      uint64_t v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = self;
      _os_log_impl(&dword_1E2ACE000, v8, OS_LOG_TYPE_INFO, "Finished loading for XHR request %@ %p", (uint8_t *)&v14, 0x16u);
    }
    [(IKJSXMLHTTPRequest *)self _operationFinished:v6];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = (void *)[v7 copy];
        [(IKJSXMLHTTPRequest *)self setReceivedData:v11];
      }
    }
    id v12 = [(IKJSXMLHTTPRequest *)self networkRequestRecord];
    id v13 = [(IKJSXMLHTTPRequest *)self receivedData];
    [v12 didCompleteLoadingWithResponseBody:v13];

    [(IKJSXMLHTTPRequest *)self setRequestReadyState:4];
  }
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[IKJSXMLHTTPRequest _loadingDidFailWithError:]((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }

  [(IKJSXMLHTTPRequest *)self _operationFinished:v6];
  [(IKJSXMLHTTPRequest *)self setUrlResponse:0];
  [(IKJSXMLHTTPRequest *)self setReceivedData:0];
  [(IKJSXMLHTTPRequest *)self setRequestURL:0];
  uint64_t v15 = [v7 domain];
  if ([v15 isEqualToString:*MEMORY[0x1E4F289A0]])
  {
    uint64_t v16 = [v7 code];

    if (v16 == -1001)
    {
      [(IKJSXMLHTTPRequest *)self setRequestStatusCode:900];
      goto LABEL_9;
    }
  }
  else
  {
  }
  [(IKJSXMLHTTPRequest *)self setRequestError:v7];
  uint64_t v17 = [v6 response];
  uint64_t v18 = objc_msgSend(v17, "itunes_statusCode");

  if (v18)
  {
    id v19 = [v6 response];
    -[IKJSXMLHTTPRequest setRequestStatusCode:](self, "setRequestStatusCode:", objc_msgSend(v19, "itunes_statusCode"));
  }
LABEL_9:
  uint64_t v20 = [(IKJSXMLHTTPRequest *)self networkRequestRecord];
  [v20 didFailWithError:v7];

  [(IKJSXMLHTTPRequest *)self setRequestReadyState:4];
}

- (void)_operationFinished:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [(IKJSXMLHTTPRequest *)self performanceMetrics];
  id v17 = [v4 dictionaryWithDictionary:v6];

  id v7 = [v5 performanceMetrics];
  [v7 startTime];
  unint64_t v9 = (unint64_t)((v8 + 978307200.0) * 1000.0);
  [v7 receivedResponseInterval];
  unint64_t v11 = (unint64_t)((double)v9 + v10 * 1000.0);
  [v7 finishInterval];
  unint64_t v13 = (unint64_t)((double)v9 + v12 * 1000.0);
  uint64_t v14 = [NSNumber numberWithUnsignedLongLong:v9];
  [v17 setObject:v14 forKey:@"requestStartTime"];

  uint64_t v15 = [NSNumber numberWithUnsignedLongLong:v11];
  [v17 setObject:v15 forKey:@"responseStartTime"];

  uint64_t v16 = [NSNumber numberWithUnsignedLongLong:v13];
  [v17 setObject:v16 forKey:@"responseEndTime"];

  [(IKJSXMLHTTPRequest *)self setPerformanceMetrics:v17];
  [v5 setDelegate:0];
  [v5 setCompletionBlock:0];

  [(IKJSXMLHTTPRequest *)self setJingleOperation:0];
  [(IKJSXMLHTTPRequest *)self setUrlRequest:0];
}

- (void)operation:(id)a3 willSendRequest:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(IKJSXMLHTTPRequest *)self urlRequest];
    id v7 = [v6 URL];
    int v8 = 138412546;
    unint64_t v9 = v7;
    __int16 v10 = 2048;
    unint64_t v11 = self;
    _os_log_impl(&dword_1E2ACE000, v5, OS_LOG_TYPE_INFO, "Sending XHR request for %@ %p", (uint8_t *)&v8, 0x16u);
  }
}

- (id)_createStoreOperation:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FA8268]) initWithURLRequest:v4];
  +[IKJSITunesStore setITunesStoreHeaders:v5];
  if (+[IKPreference ignoreHTTPCache])
  {
    [v5 setCachePolicy:1];
    [(IKJSXMLHTTPRequest *)self setCachedURLResponse:0];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F29078] sharedURLCache];
    id v7 = [v6 cachedResponseForRequest:v4];

    int v8 = [v7 response];
    [(IKJSXMLHTTPRequest *)self setCachedURLResponse:v8];
  }
  [v5 setAllowedRetryCount:0];
  id v9 = objc_alloc_init(MEMORY[0x1E4FB8858]);
  __int16 v10 = [NSNumber numberWithInteger:401];
  v18[0] = v10;
  unint64_t v11 = [NSNumber numberWithInteger:400];
  v18[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [v9 setPassThroughErrors:v12];

  [v9 setDelegate:self];
  [v9 setNeedsURLBag:0];
  [v9 setRequestProperties:v5];
  [v9 setTracksPerformanceMetrics:1];
  [v9 setUrlKnownToBeTrusted:1];
  unint64_t v13 = [MEMORY[0x1E4F1CA58] data];
  [(IKJSXMLHTTPRequest *)self setReceivedData:v13];

  objc_initWeak(&location, v9);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__IKJSXMLHTTPRequest__createStoreOperation___block_invoke;
  v15[3] = &unk_1E6DE4158;
  void v15[4] = self;
  objc_copyWeak(&v16, &location);
  [v9 setCompletionBlock:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v9;
}

void __44__IKJSXMLHTTPRequest__createStoreOperation___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ITMLKitErrorDomain" code:1 userInfo:0];
  [v1 operation:WeakRetained failedWithError:v2];
}

- (BOOL)_isPrimeError:(int64_t)a3 output:(id)a4
{
  id v6 = a4;
  char v7 = 0;
  if (a3 == 401 && self->_primeEnabled)
  {
    if ([(IKJSXMLHTTPRequest *)self primeRetryCount] <= 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [v8 objectForKey:@"status"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          char v7 = [v9 isEqualToString:@"verificationFailure"];
        }
        else {
          char v7 = 0;
        }
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (void)_prime:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__IKJSXMLHTTPRequest__prime___block_invoke;
  v7[3] = &unk_1E6DE7060;
  v7[4] = self;
  dispatch_semaphore_t v8 = v5;
  id v6 = v5;
  [v4 primeSessionWithCompletionBlock:v7];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __29__IKJSXMLHTTPRequest__prime___block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1E2ACE000, v4, OS_LOG_TYPE_INFO, "Primed mescal with a result of :%d", (uint8_t *)v6, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setPrimeRetryCount:", objc_msgSend(*(id *)(a1 + 32), "primeRetryCount") + 1);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_reprime:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:0];
  [v4 setCompletionBlock:0];
  dispatch_semaphore_t v5 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2ACE000, v5, OS_LOG_TYPE_INFO, "Failed with a 401. Re-priming mescal session.", buf, 2u);
  }

  id v6 = [MEMORY[0x1E4FA8328] sharedPrimeSession];
  [(IKJSXMLHTTPRequest *)self _prime:v6];
  if ([v6 primed])
  {
    uint64_t v7 = [(IKJSXMLHTTPRequest *)self urlRequest];
    dispatch_semaphore_t v8 = [(IKJSXMLHTTPRequest *)self dataToSend];
    id v9 = [v8 dataUsingEncoding:4];
    [v7 setHTTPBody:v9];

    objc_msgSend(v7, "setTimeoutInterval:", (double)-[IKJSXMLHTTPRequest timeout](self, "timeout") / 1000.0);
    __int16 v10 = [(IKJSXMLHTTPRequest *)self _createStoreOperation:v7];
    [(IKJSXMLHTTPRequest *)self setJingleOperation:v10];
    unint64_t v11 = [MEMORY[0x1E4FB8838] mainQueue];
    [v11 addOperation:v10];
  }
  else
  {
    uint64_t v12 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1E2ACE000, v12, OS_LOG_TYPE_INFO, "Failed to re-prime sesson.", v14, 2u);
    }

    [(IKJSXMLHTTPRequest *)self setUrlResponse:0];
    unint64_t v13 = [MEMORY[0x1E4F28D20] localizedStringForStatusCode:401];
    [(IKJSXMLHTTPRequest *)self setRequestStatusText:v13];

    [(IKJSXMLHTTPRequest *)self setRequestReadyState:2];
    [(IKJSXMLHTTPRequest *)self _operationFinished:v4];
    [(IKJSXMLHTTPRequest *)self setReceivedData:0];
    [(IKJSXMLHTTPRequest *)self setRequestURL:0];
    [(IKJSXMLHTTPRequest *)self setRequestReadyState:4];
  }
}

- (id)_timeIntervalSince1970
{
  v5.tv_sec = 0;
  *(void *)&v5.tv_usec = 0;
  gettimeofday(&v5, 0);
  unint64_t v2 = (unint64_t)(((double)v5.tv_sec + (double)v5.tv_usec * 0.000001) * 1000.0);
  BOOL v3 = NSNumber;
  return (id)[v3 numberWithUnsignedLongLong:v2];
}

- (unint64_t)timeout
{
  return self->timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->timeout = a3;
}

- (BOOL)requireSystemTrust
{
  return self->requireSystemTrust;
}

- (void)setRequireSystemTrust:(BOOL)a3
{
  self->requireSystemTrust = a3;
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (void)setRequestURL:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (IKNetworkRequestRecord)networkRequestRecord
{
  return self->_networkRequestRecord;
}

- (NSString)dataToSend
{
  return self->_dataToSend;
}

- (void)setDataToSend:(id)a3
{
}

- (BOOL)jingleRequest
{
  return self->_jingleRequest;
}

- (void)setJingleRequest:(BOOL)a3
{
  self->_jingleRequest = a3;
}

- (ISURLOperation)jingleOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_jingleOperation);
  return (ISURLOperation *)WeakRetained;
}

- (void)setJingleOperation:(id)a3
{
}

- (NSMutableArray)onReadyStateChangeMessageQueue
{
  return self->_onReadyStateChangeMessageQueue;
}

- (void)setOnReadyStateChangeMessageQueue:(id)a3
{
}

- (NSMutableURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (void)setUrlRequest:(id)a3
{
}

- (NSURLSessionConfiguration)urlSessionConfiguration
{
  return self->_urlSessionConfiguration;
}

- (void)setUrlSessionConfiguration:(id)a3
{
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (NSURLConnection)urlConnection
{
  return self->_urlConnection;
}

- (void)setUrlConnection:(id)a3
{
}

- (NSString)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (int64_t)primeRetryCount
{
  return self->_primeRetryCount;
}

- (void)setPrimeRetryCount:(int64_t)a3
{
  self->_primeRetryCount = a3;
}

- (BOOL)primeEnabled
{
  return self->_primeEnabled;
}

- (NSHTTPURLResponse)urlResponse
{
  return self->_urlResponse;
}

- (void)setUrlResponse:(id)a3
{
}

- (NSData)receivedData
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setReceivedData:(id)a3
{
}

- (int64_t)reprimingResponseStatus
{
  return self->_reprimingResponseStatus;
}

- (int64_t)requestReadyState
{
  return self->_requestReadyState;
}

- (unsigned)requestStatusCode
{
  return self->_requestStatusCode;
}

- (void)setRequestStatusCode:(unsigned int)a3
{
  self->_requestStatusCode = a3;
}

- (NSString)requestStatusText
{
  return self->_requestStatusText;
}

- (void)setRequestStatusText:(id)a3
{
}

- (int64_t)requestResponseType
{
  return self->_requestResponseType;
}

- (void)setRequestResponseType:(int64_t)a3
{
  self->_int64_t requestResponseType = a3;
}

- (NSError)requestError
{
  return self->_requestError;
}

- (void)setRequestError:(id)a3
{
}

- (unsigned)readyState
{
  return self->_readyState;
}

- (void)setReadyState:(unsigned int)a3
{
  self->_readyState = a3;
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned int)a3
{
  self->_status = a3;
}

- (NSString)statusText
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setStatusText:(id)a3
{
}

- (NSDictionary)performanceMetrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPerformanceMetrics:(id)a3
{
}

- (NSHTTPURLResponse)cachedURLResponse
{
  return (NSHTTPURLResponse *)objc_getProperty(self, a2, 248, 1);
}

- (void)setCachedURLResponse:(id)a3
{
}

- (JSManagedValue)managedSelf
{
  return self->_managedSelf;
}

- (void)setManagedSelf:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedSelf, 0);
  objc_storeStrong((id *)&self->_cachedURLResponse, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_requestError, 0);
  objc_storeStrong((id *)&self->_requestStatusText, 0);
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong((id *)&self->_urlResponse, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_urlConnection, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_urlSessionConfiguration, 0);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_onReadyStateChangeMessageQueue, 0);
  objc_destroyWeak((id *)&self->_jingleOperation);
  objc_storeStrong((id *)&self->_dataToSend, 0);
  objc_storeStrong((id *)&self->_networkRequestRecord, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
}

- (void)_sendWithData:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1E2ACE000, v0, v1, "XHR failure: NSURLConnection is nil.", v2, v3, v4, v5, v6);
}

- (void)validateTrust:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1E2ACE000, v0, v1, "Invalid trust provided for system trust verification.", v2, v3, v4, v5, v6);
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1E2ACE000, v0, v1, "No certificate chain, failing system trust validation.", v2, v3, v4, v5, v6);
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1E2ACE000, v0, v1, "No root certificate, failing system trust validation.", v2, v3, v4, v5, v6);
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1E2ACE000, v0, v1, "Root certificate is not system trusted, failing validation.", v2, v3, v4, v5, v6);
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.5()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_1E2ACE000, v0, v1, "Skipping system trust requirement due to default override.", v2, v3, v4, v5, v6);
}

- (void)verifyCertificateIsSystemTrustedWithTrust:.cold.6()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1E2ACE000, v0, v1, "Certificate is not trusted.", v2, v3, v4, v5, v6);
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_1E2ACE000, v0, v1, "System trust verified.", v2, v3, v4, v5, v6);
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1E2ACE000, v0, v1, "System trust verification failed.", v2, v3, v4, v5, v6);
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_1E2ACE000, v0, v1, "Challenge was not server trust.", v2, v3, v4, v5, v6);
}

- (void)_loadingDidFailWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end