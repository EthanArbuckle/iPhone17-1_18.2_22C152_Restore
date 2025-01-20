@interface DMCHTTPTransaction
+ (id)emptySuccessResponseBlock;
- (BOOL)_shouldAllowTrust:(__SecTrust *)a3 forHost:(id)a4;
- (BOOL)_shouldAllowTrustWithPinning:(__SecTrust *)a3 forHost:(id)a4;
- (BOOL)ignoreAuthenticatorError;
- (BOOL)pinningRevocationCheckRequired;
- (DMCHTTPAuthenticator)authenticator;
- (DMCHTTPTransaction)initWithURL:(id)a3 method:(id)a4;
- (DMCHTTPTransaction)initWithURL:(id)a3 method:(id)a4 downloadURL:(id)a5;
- (NSArray)pinnedSecCertificateRefs;
- (NSData)data;
- (NSData)responseData;
- (NSDictionary)responseHeaders;
- (NSError)error;
- (NSString)CMSSignatureHeaderName;
- (NSString)contentType;
- (NSString)method;
- (NSString)userAgent;
- (NSURL)downloadURL;
- (NSURL)permanentlyRedirectedURL;
- (NSURL)url;
- (__SecIdentity)copyIdentity;
- (double)timeout;
- (id)_constructRequestOutError:(id *)a3;
- (id)simulatedTransactionBlock;
- (id)transactionCompletionBlock;
- (int64_t)statusCode;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_beginDataTaskWithSessionConfiguration:(id)a3 request:(id)a4;
- (void)_beginDownloadTaskWithSessionConfiguration:(id)a3 request:(id)a4;
- (void)_beginTransaction;
- (void)_completeTransaction;
- (void)_simulateTransaction;
- (void)addHeaderKey:(id)a3 value:(id)a4;
- (void)dealloc;
- (void)performCompletionBlock:(id)a3;
- (void)performSynchronously;
- (void)setAuthenticator:(id)a3;
- (void)setCMSSignatureHeaderName:(id)a3;
- (void)setContentType:(id)a3;
- (void)setData:(id)a3;
- (void)setDownloadURL:(id)a3;
- (void)setIdentity:(__SecIdentity *)a3;
- (void)setIgnoreAuthenticatorError:(BOOL)a3;
- (void)setMethod:(id)a3;
- (void)setPinnedSecCertificateRefs:(id)a3;
- (void)setPinningRevocationCheckRequired:(BOOL)a3;
- (void)setSimulatedTransactionBlock:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTransactionCompletionBlock:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation DMCHTTPTransaction

- (__SecIdentity)copyIdentity
{
  result = self->_identity;
  if (result)
  {
    CFRetain(result);
    return self->_identity;
  }
  return result;
}

- (void)setIdentity:(__SecIdentity *)a3
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  self->_identity = a3;
  if (a3)
  {
    CFRetain(a3);
  }
}

- (DMCHTTPTransaction)initWithURL:(id)a3 method:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DMCHTTPTransaction;
  v9 = [(DMCHTTPTransaction *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestURL, a3);
    uint64_t v11 = [v8 copy];
    method = v10->_method;
    v10->_method = (NSString *)v11;

    objc_storeStrong((id *)&v10->_userAgent, @"DeviceManagementClient/1.0");
    v10->_timeout = 45.0;
  }

  return v10;
}

- (DMCHTTPTransaction)initWithURL:(id)a3 method:(id)a4 downloadURL:(id)a5
{
  id v9 = a5;
  v10 = [(DMCHTTPTransaction *)self initWithURL:a3 method:a4];
  uint64_t v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_downloadURL, a5);
  }

  return v11;
}

- (void)dealloc
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)DMCHTTPTransaction;
  [(DMCHTTPTransaction *)&v4 dealloc];
}

- (void)addHeaderKey:(id)a3 value:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  headers = self->_headers;
  if (!headers)
  {
    id v8 = (NSMutableDictionary *)objc_opt_new();
    id v9 = self->_headers;
    self->_headers = v8;

    headers = self->_headers;
  }
  [(NSMutableDictionary *)headers setObject:v6 forKeyedSubscript:v10];
}

- (id)_constructRequestOutError:(id *)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F28E88] requestWithURL:self->_requestURL cachePolicy:4 timeoutInterval:self->_timeout];
  [v5 setHTTPMethod:self->_method];
  contentType = self->_contentType;
  if (contentType) {
    [v5 addValue:contentType forHTTPHeaderField:@"Content-Type"];
  }
  userAgent = self->_userAgent;
  if (userAgent) {
    [v5 addValue:userAgent forHTTPHeaderField:@"User-Agent"];
  }
  if (self->_data) {
    objc_msgSend(v5, "setHTTPBody:");
  }
  if (self->_CMSSignatureHeaderName && self->_identity)
  {
    uint64_t v37 = *MEMORY[0x1E4F3B938];
    v38[0] = MEMORY[0x1E4F1CC38];
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    id v9 = [MEMORY[0x1E4F1CA58] data];
    int v10 = SecCMSCreateSignedData();
    if (v10)
    {
      int v11 = v10;
      v12 = *DMCLogObjects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v35) = v11;
        _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_ERROR, "Cannot compute message signature. Error: %d", buf, 8u);
      }
    }
    else
    {
      v13 = [v9 base64EncodedStringWithOptions:0];
      [v5 addValue:v13 forHTTPHeaderField:self->_CMSSignatureHeaderName];
    }
  }
  headers = self->_headers;
  if (headers)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v15 = headers;
    uint64_t v16 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v21 = [(NSMutableDictionary *)self->_headers objectForKeyedSubscript:v20];
          [v5 addValue:v21 forHTTPHeaderField:v20];
        }
        uint64_t v17 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v17);
    }
  }
  v22 = [(DMCHTTPTransaction *)self authenticator];

  if (!v22) {
    goto LABEL_29;
  }
  v23 = [(DMCHTTPTransaction *)self authenticator];
  id v29 = 0;
  char v24 = [v23 authenticateRequest:v5 error:&v29];
  id v25 = v29;

  if (v24) {
    goto LABEL_28;
  }
  v26 = *DMCLogObjects();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v35 = v25;
    _os_log_impl(&dword_1A7863000, v26, OS_LOG_TYPE_ERROR, "Failed to authenticate request with error: %{public}@", buf, 0xCu);
  }
  if ([(DMCHTTPTransaction *)self ignoreAuthenticatorError])
  {
LABEL_28:

LABEL_29:
    id v27 = v5;
    goto LABEL_30;
  }
  if (a3) {
    *a3 = v25;
  }

  id v27 = 0;
LABEL_30:

  return v27;
}

- (void)_beginTransaction
{
  id v8 = 0;
  v3 = [(DMCHTTPTransaction *)self _constructRequestOutError:&v8];
  id v4 = v8;
  id v5 = v8;
  if (v3)
  {
    self->_rememberData = 0;
    id v6 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
    [v6 setTLSMinimumSupportedProtocolVersion:771];
    id v7 = [(DMCHTTPTransaction *)self downloadURL];

    if (v7) {
      [(DMCHTTPTransaction *)self _beginDownloadTaskWithSessionConfiguration:v6 request:v3];
    }
    else {
      [(DMCHTTPTransaction *)self _beginDataTaskWithSessionConfiguration:v6 request:v3];
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_error, v4);
    [(DMCHTTPTransaction *)self _completeTransaction];
  }
}

- (void)_beginDataTaskWithSessionConfiguration:(id)a3 request:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F290E0];
  id v7 = a4;
  id v8 = [v6 sessionWithConfiguration:a3 delegate:self delegateQueue:0];
  session = self->_session;
  self->_session = v8;

  int v10 = [(NSURLSession *)self->_session dataTaskWithRequest:v7];

  int v11 = [(DMCHTTPTransaction *)self authenticator];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  id v12 = 0;
  if ((v7 & 1) != 0
    && ([(DMCHTTPTransaction *)self authenticator],
        v13 = objc_claimAutoreleasedReturnValue(),
        id v17 = 0,
        char v14 = [v13 prepareTask:v10 error:&v17],
        id v15 = v17,
        id v12 = v17,
        v13,
        (v14 & 1) == 0))
  {
    uint64_t v16 = *DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v12;
      _os_log_impl(&dword_1A7863000, v16, OS_LOG_TYPE_ERROR, "Failed to prepare data task with error: %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)&self->_error, v15);
    [(DMCHTTPTransaction *)self _completeTransaction];
  }
  else
  {
    [v10 resume];
    [(NSURLSession *)self->_session finishTasksAndInvalidate];
  }
}

- (void)_beginDownloadTaskWithSessionConfiguration:(id)a3 request:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F290E0];
  id v7 = a4;
  id v8 = [v6 sessionWithConfiguration:a3 delegate:self delegateQueue:0];
  session = self->_session;
  self->_session = v8;

  int v10 = [(NSURLSession *)self->_session downloadTaskWithRequest:v7];

  int v11 = [(DMCHTTPTransaction *)self authenticator];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  id v12 = 0;
  if ((v7 & 1) != 0
    && ([(DMCHTTPTransaction *)self authenticator],
        v13 = objc_claimAutoreleasedReturnValue(),
        id v17 = 0,
        char v14 = [v13 prepareTask:v10 error:&v17],
        id v15 = v17,
        id v12 = v17,
        v13,
        (v14 & 1) == 0))
  {
    uint64_t v16 = *DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v12;
      _os_log_impl(&dword_1A7863000, v16, OS_LOG_TYPE_ERROR, "Failed to prepare download task with error: %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)&self->_error, v15);
    [(DMCHTTPTransaction *)self _completeTransaction];
  }
  else
  {
    [v10 resume];
    [(NSURLSession *)self->_session finishTasksAndInvalidate];
  }
}

- (void)_simulateTransaction
{
  int64_t v14 = 200;
  v3 = *DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7863000, v3, OS_LOG_TYPE_INFO, "Simulating transaction with transaction block", buf, 2u);
  }
  id v4 = [(DMCHTTPTransaction *)self simulatedTransactionBlock];
  id v11 = 0;
  id v12 = 0;
  ((void (**)(void, int64_t *, id *, id *))v4)[2](v4, &v14, &v12, &v11);
  id v5 = v12;
  id v6 = v11;

  self->_statusCode = v14;
  id v7 = (NSMutableData *)[v5 copy];
  responseData = self->_responseData;
  self->_responseData = v7;

  id v9 = (NSError *)[v6 copy];
  error = self->_error;
  self->_error = v9;

  [(DMCHTTPTransaction *)self _completeTransaction];
}

- (void)performSynchronously
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = *DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    requestURL = self->_requestURL;
    *(_DWORD *)buf = 138543362;
    id v12 = requestURL;
    _os_log_impl(&dword_1A7863000, v3, OS_LOG_TYPE_INFO, "Beginning synchronous HTTP request to URL: %{public}@", buf, 0xCu);
  }
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__DMCHTTPTransaction_performSynchronously__block_invoke;
  v9[3] = &unk_1E5CFD920;
  id v6 = v5;
  int v10 = v6;
  [(DMCHTTPTransaction *)self performCompletionBlock:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = *DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = self->_requestURL;
    *(_DWORD *)buf = 138543362;
    id v12 = v8;
    _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_INFO, "Synchronous HTTP request complete to URL: %{public}@", buf, 0xCu);
  }
}

intptr_t __42__DMCHTTPTransaction_performSynchronously__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)performCompletionBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_semaphore_t v5 = *DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    requestURL = self->_requestURL;
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = requestURL;
    _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_INFO, "Beginning HTTP request to URL: %{public}@", buf, 0xCu);
  }
  id v7 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
  responseData = self->_responseData;
  self->_responseData = v7;

  error = self->_error;
  self->_error = 0;

  objc_storeStrong((id *)&self->_currentURL, self->_requestURL);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__DMCHTTPTransaction_performCompletionBlock___block_invoke;
  v15[3] = &unk_1E5CFD8D0;
  v15[4] = self;
  id v16 = v4;
  id v10 = v4;
  id v11 = (void *)MEMORY[0x1AD0D2220](v15);
  id transactionCompletionBlock = self->_transactionCompletionBlock;
  self->_id transactionCompletionBlock = v11;

  uint64_t v13 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__DMCHTTPTransaction_performCompletionBlock___block_invoke_14;
  block[3] = &unk_1E5CFD920;
  block[4] = self;
  dispatch_async(v13, block);
}

uint64_t __45__DMCHTTPTransaction_performCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 112))
  {
    v3 = *(void **)(v2 + 120);
    *(void *)(v2 + 120) = 0;
  }
  id v4 = *DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_INFO, "HTTP request complete to URL: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __45__DMCHTTPTransaction_performCompletionBlock___block_invoke_14(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) simulatedTransactionBlock];

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 _simulateTransaction];
  }
  else
  {
    return [v3 _beginTransaction];
  }
}

- (void)_completeTransaction
{
  v3 = [(DMCHTTPTransaction *)self transactionCompletionBlock];

  if (v3)
  {
    id v4 = [(DMCHTTPTransaction *)self transactionCompletionBlock];
    v4[2]();

    [(DMCHTTPTransaction *)self setTransactionCompletionBlock:0];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = (void (**)(id, id))a7;
  id v12 = a5;
  self->_int64_t statusCode = [v12 statusCode];
  uint64_t v13 = [v12 allHeaderFields];

  responseHeaders = self->_responseHeaders;
  self->_responseHeaders = v13;

  id v15 = [v10 URL];
  id v16 = (NSURL *)[v15 copy];
  currentURL = self->_currentURL;
  self->_currentURL = v16;

  int64_t statusCode = self->_statusCode;
  uint64_t v19 = *DMCLogObjects();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (statusCode == 301)
  {
    if (v20)
    {
      v21 = self->_currentURL;
      int v25 = 138543362;
      v26 = v21;
      _os_log_impl(&dword_1A7863000, v19, OS_LOG_TYPE_DEFAULT, "Redirected permanently to URL: %{public}@", (uint8_t *)&v25, 0xCu);
    }
    v22 = (NSURL *)[(NSURL *)self->_currentURL copy];
    permanentlyRedirectedURL = self->_permanentlyRedirectedURL;
    self->_permanentlyRedirectedURL = v22;
  }
  else if (v20)
  {
    char v24 = self->_currentURL;
    int v25 = 138543362;
    v26 = v24;
    _os_log_impl(&dword_1A7863000, v19, OS_LOG_TYPE_DEFAULT, "Redirected to URL: %{public}@", (uint8_t *)&v25, 0xCu);
  }
  v11[2](v11, v10);
}

- (BOOL)_shouldAllowTrust:(__SecTrust *)a3 forHost:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    if (SecTrustGetCertificateCount(a3) < 1)
    {
      LOBYTE(a3) = 0;
    }
    else if ([(NSArray *)self->_pinnedSecCertificateRefs count])
    {
      LOBYTE(a3) = [(DMCHTTPTransaction *)self _shouldAllowTrustWithPinning:a3 forHost:v6];
    }
    else
    {
      CFErrorRef error = 0;
      LODWORD(a3) = SecTrustEvaluateWithError(a3, &error);
      if ((a3 & 1) == 0) {
        CFRelease(error);
      }
      int v7 = *DMCLogObjects();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = v7;
        uint64_t v9 = DMCStringForBool((int)a3);
        *(_DWORD *)buf = 138543618;
        id v13 = v6;
        __int16 v14 = 2114;
        id v15 = v9;
        _os_log_impl(&dword_1A7863000, v8, OS_LOG_TYPE_DEBUG, "Evaluating trust for host: %{public}@ result: %{public}@", buf, 0x16u);
      }
    }
  }

  return (char)a3;
}

- (BOOL)_shouldAllowTrustWithPinning:(__SecTrust *)a3 forHost:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a4;
  CFTypeRef cf = 0;
  *(void *)int v25 = 0;
  if (!a3) {
    goto LABEL_18;
  }
  CFDataRef v7 = (const __CFData *)SecTrustSerialize();
  if (!v7)
  {
    uint64_t v16 = *DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7863000, v16, OS_LOG_TYPE_ERROR, "Failed to serialize trust when copying", buf, 2u);
    }
    goto LABEL_18;
  }
  CFDataRef v8 = v7;
  if (CFDataGetLength(v7))
  {
    uint64_t v9 = SecTrustDeserialize();
    if (v9)
    {
      id v10 = (__SecTrust *)v9;
      CFRelease(v8);
      SecPolicyRef SSL = SecPolicyCreateSSL(1u, v6);
      id v12 = [MEMORY[0x1E4F1CA48] arrayWithObject:SSL];

      if (self->_pinningRevocationCheckRequired)
      {
        SecPolicyRef Revocation = SecPolicyCreateRevocation(0xBuLL);
        [v12 addObject:Revocation];
      }
      if (SecTrustSetPolicies(v10, v12))
      {
        __int16 v14 = *DMCLogObjects();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int v25 = 138543362;
          *(void *)&v25[4] = v6;
          id v15 = "Failed to set policies when evaluating pinning trust for host %{public}@";
LABEL_25:
          _os_log_impl(&dword_1A7863000, v14, OS_LOG_TYPE_ERROR, v15, v25, 0xCu);
        }
      }
      else
      {
        if (!SecTrustSetAnchorCertificates(v10, (CFArrayRef)self->_pinnedSecCertificateRefs))
        {
          CFTypeRef cf = 0;
          BOOL v20 = SecTrustEvaluateWithError(v10, (CFErrorRef *)&cf);
          if (cf)
          {
            v22 = *DMCLogObjects();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int v25 = 138543618;
              *(void *)&v25[4] = v6;
              __int16 v26 = 2114;
              CFTypeRef v27 = cf;
              _os_log_impl(&dword_1A7863000, v22, OS_LOG_TYPE_ERROR, "Evaluating pinned trust for host %{public}@ failed with error %{public}@", v25, 0x16u);
            }
          }
          goto LABEL_27;
        }
        __int16 v14 = *DMCLogObjects();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int v25 = 138543362;
          *(void *)&v25[4] = v6;
          id v15 = "Failed to set anchors when evaluating pinning trust for host %{public}@";
          goto LABEL_25;
        }
      }
      BOOL v20 = 0;
LABEL_27:

      if (cf) {
        CFRelease(cf);
      }
      CFRelease(v10);
      goto LABEL_21;
    }
    id v17 = *DMCLogObjects();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    uint64_t v18 = "Failed to deserialize trust when copying";
    goto LABEL_16;
  }
  id v17 = *DMCLogObjects();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v18 = "Failed to serialize trust when copying, zero length result";
LABEL_16:
    _os_log_impl(&dword_1A7863000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
  }
LABEL_17:
  CFRelease(v8);
LABEL_18:
  uint64_t v19 = *DMCLogObjects();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int v25 = 138543362;
    *(void *)&v25[4] = v6;
    _os_log_impl(&dword_1A7863000, v19, OS_LOG_TYPE_ERROR, "Failed to copy trust when evaluating pinning trust for host %{public}@", v25, 0xCu);
  }
  BOOL v20 = 0;
LABEL_21:

  return v20;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  CFDataRef v8 = (void (**)(id, uint64_t, void))a6;
  uint64_t v9 = [a5 protectionSpace];
  id v10 = [v9 authenticationMethod];
  id v11 = *DMCLogObjects();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_1A7863000, v11, OS_LOG_TYPE_DEBUG, "Handling challenge: %{public}@", buf, 0xCu);
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F28988]])
  {
    uint64_t v12 = [v9 serverTrust];
    id v13 = [v9 host];
    LOBYTE(v12) = [(DMCHTTPTransaction *)self _shouldAllowTrust:v12 forHost:v13];

    if ((v12 & 1) == 0)
    {
      if (!self->_error)
      {
        v21 = (void *)MEMORY[0x1E4F28C58];
        v22 = DMCErrorArray(@"HTTP_ERROR_INVALID_SERVER_CERT_P_URL_%@", v14, v15, v16, v17, v18, v19, v20, self->_requestURL);
        v23 = [v21 DMCErrorWithDomain:@"DMCHTTPTransactionErrorDomain" code:23002 descriptionArray:v22 errorType:@"DMCFatalError"];
        CFErrorRef error = self->_error;
        self->_CFErrorRef error = v23;
      }
      int v25 = *DMCLogObjects();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7863000, v25, OS_LOG_TYPE_DEBUG, "NOT sending client identity certificate", buf, 2u);
      }
      v8[2](v8, 2, 0);
      goto LABEL_22;
    }
  }
  else if (([v10 isEqualToString:*MEMORY[0x1E4F28968]] & 1) == 0)
  {
    v8[2](v8, 3, 0);
    goto LABEL_22;
  }
  if (self->_identity)
  {
    __int16 v26 = *DMCLogObjects();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7863000, v26, OS_LOG_TYPE_DEBUG, "Preparing to send identity...", buf, 2u);
    }
    *(void *)buf = 0;
    if (!SecIdentityCopyCertificate(self->_identity, (SecCertificateRef *)buf) && self->_identity && *(void *)buf)
    {
      BOOL v38 = +[DMCFeatureOverrides bypassMDMTLSClientAuthentication];
      v39 = *DMCLogObjects();
      if (v38)
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v41 = 0;
          _os_log_impl(&dword_1A7863000, v39, OS_LOG_TYPE_ERROR, "Ignoring request for client identity and performing default handling", v41, 2u);
        }
        v8[2](v8, 1, 0);
      }
      else
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v41 = 0;
          _os_log_impl(&dword_1A7863000, v39, OS_LOG_TYPE_DEBUG, "Sending client identity certificate", v41, 2u);
        }
        v40 = [MEMORY[0x1E4F29098] credentialWithIdentity:self->_identity certificates:0 persistence:1];
        ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v40);
      }
    }
    else
    {
      if (!self->_error)
      {
        v34 = (void *)MEMORY[0x1E4F28C58];
        id v35 = DMCErrorArray(@"HTTP_ERROR_INVALID_IDENTITY_P_URL_%@", v27, v28, v29, v30, v31, v32, v33, self->_requestURL);
        v36 = [v34 DMCErrorWithDomain:@"DMCHTTPTransactionErrorDomain" code:23000 descriptionArray:v35 errorType:@"DMCFatalError"];
        uint64_t v37 = self->_error;
        self->_CFErrorRef error = v36;
      }
      v8[2](v8, 2, 0);
    }
    if (*(void *)buf) {
      CFRelease(*(CFTypeRef *)buf);
    }
  }
  else
  {
    v8[2](v8, 0, 0);
  }
LABEL_22:
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [v8 originalRequest];
  id v10 = [v8 response];

  +[DMCHTTPLog logHTTPDetailsForIdentifier:@"Logs" request:v9 response:v10 responseData:self->_responseData responseError:v7];
  if (v7)
  {
    if (!self->_error)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = [v7 domain];
      uint64_t v13 = [v7 code];
      uint64_t v14 = [v7 localizedDescription];
      v49[0] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
      uint64_t v16 = [v11 DMCErrorWithDomain:v12 code:v13 descriptionArray:v15 errorType:@"DMCFatalError"];
      CFErrorRef error = self->_error;
      self->_CFErrorRef error = v16;
    }
    uint64_t v18 = *DMCLogObjects();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      currentURL = self->_currentURL;
      uint64_t v20 = self->_error;
      v21 = v18;
      v22 = [(NSError *)v20 DMCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v46 = currentURL;
      __int16 v47 = 2114;
      v48 = v22;
      _os_log_impl(&dword_1A7863000, v21, OS_LOG_TYPE_ERROR, "Connection to %{public}@ failed with error: %{public}@", buf, 0x16u);
    }
    goto LABEL_17;
  }
  int64_t statusCode = self->_statusCode;
  char v24 = *DMCLogObjects();
  if (statusCode == 403)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = self->_currentURL;
      *(_DWORD *)buf = 138543362;
      v46 = v25;
      _os_log_impl(&dword_1A7863000, v24, OS_LOG_TYPE_ERROR, "Connection to %{public}@ finished with 403 response", buf, 0xCu);
    }
    __int16 v26 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dmc_jsonDictionaryFromData:", self->_responseData);
    if (v26)
    {
      id v44 = 0;
      BOOL v27 = +[DMCHTTPRequestor parse403ErrorWithResponseDictionary:v26 outError:&v44];
      uint64_t v28 = (NSError *)v44;
      uint64_t v29 = v28;
      if (v27)
      {
        uint64_t v29 = v28;
        uint64_t v30 = self->_error;
        self->_CFErrorRef error = v29;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v29 = 0;
    }
    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    requestURL = self->_requestURL;
    uint64_t v30 = [NSNumber numberWithInteger:self->_statusCode];
    v41 = DMCErrorArray(@"HTTP_ERROR_REQUEST_FAILED_%@_%@", v34, v35, v36, v37, v38, v39, v40, requestURL);
    v42 = [v32 DMCErrorWithDomain:@"DMCHTTPTransactionErrorDomain" code:23010 descriptionArray:v41 errorType:@"DMCFatalError"];
    uint64_t v43 = self->_error;
    self->_CFErrorRef error = v42;

    goto LABEL_16;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = self->_currentURL;
    *(_DWORD *)buf = 138543362;
    v46 = v31;
    _os_log_impl(&dword_1A7863000, v24, OS_LOG_TYPE_DEBUG, "Connection finished loading to URL %{public}@", buf, 0xCu);
  }
LABEL_17:
  [(DMCHTTPTransaction *)self _completeTransaction];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(void))a6;
  id v9 = a5;
  self->_int64_t statusCode = [v9 statusCode];
  id v10 = [v9 allHeaderFields];

  responseHeaders = self->_responseHeaders;
  self->_responseHeaders = v10;

  uint64_t v12 = *DMCLogObjects();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int64_t statusCode = self->_statusCode;
    *(_DWORD *)buf = 67109120;
    int v29 = statusCode;
    _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_DEBUG, "Received response status code: %d", buf, 8u);
  }
  int64_t v14 = self->_statusCode;
  if (v14 == 403 || v14 == 200)
  {
    self->_rememberData = 1;
  }
  else if (!self->_error)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    requestURL = self->_requestURL;
    BOOL v27 = objc_msgSend(NSNumber, "numberWithInteger:");
    char v24 = DMCErrorArray(@"HTTP_ERROR_REQUEST_FAILED_%@_%@", v17, v18, v19, v20, v21, v22, v23, requestURL);
    int v25 = [v15 DMCErrorWithDomain:@"DMCHTTPTransactionErrorDomain" code:23002 descriptionArray:v24 errorType:@"DMCFatalError"];
    CFErrorRef error = self->_error;
    self->_CFErrorRef error = v25;
  }
  v8[2](v8);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  if (self->_rememberData) {
    -[NSMutableData appendData:](self->_responseData, "appendData:", a5, a4);
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = [a4 response];
  self->_int64_t statusCode = [v8 statusCode];
  id v9 = [v8 allHeaderFields];
  responseHeaders = self->_responseHeaders;
  self->_responseHeaders = v9;

  id v11 = *DMCLogObjects();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int64_t statusCode = self->_statusCode;
    *(_DWORD *)buf = 67109120;
    LODWORD(v45) = statusCode;
    _os_log_impl(&dword_1A7863000, v11, OS_LOG_TYPE_DEBUG, "Received response status code: %d", buf, 8u);
  }
  uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  int64_t v14 = [(DMCHTTPTransaction *)self downloadURL];
  id v43 = 0;
  int v15 = [v13 removeItemAtURL:v14 error:&v43];
  id v16 = v43;
  id v17 = v43;

  if (v15)
  {
    uint64_t v18 = *DMCLogObjects();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = v18;
      uint64_t v20 = [(DMCHTTPTransaction *)self downloadURL];
      uint64_t v21 = [v20 path];
      *(_DWORD *)buf = 138543362;
      v45 = v21;
      _os_log_impl(&dword_1A7863000, v19, OS_LOG_TYPE_DEBUG, "Removed existing downloaded data file at %{public}@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  uint64_t v22 = [v17 domain];
  if ([v22 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v23 = [v17 code];

    if (v23 == 4)
    {
LABEL_8:
      char v24 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v25 = [(DMCHTTPTransaction *)self downloadURL];
      id v42 = v17;
      char v26 = [v24 moveItemAtURL:v7 toURL:v25 error:&v42];
      id v27 = v42;
      id v28 = v42;

      int v29 = *DMCLogObjects();
      if (v26)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v30 = v29;
          uint64_t v31 = [v7 path];
          uint64_t v32 = [(DMCHTTPTransaction *)self downloadURL];
          uint64_t v33 = [v32 path];
          *(_DWORD *)buf = 138543618;
          v45 = v31;
          __int16 v46 = 2114;
          id v47 = v33;
          _os_log_impl(&dword_1A7863000, v30, OS_LOG_TYPE_DEBUG, "Moved downloaded data file at %{public}@, to %{public}@", buf, 0x16u);
        }
      }
      else
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = v29;
          uint64_t v35 = [v7 path];
          uint64_t v36 = [(DMCHTTPTransaction *)self downloadURL];
          uint64_t v37 = [v36 path];
          *(_DWORD *)buf = 138543874;
          v45 = v35;
          __int16 v46 = 2114;
          id v47 = v37;
          __int16 v48 = 2114;
          id v49 = v28;
          _os_log_impl(&dword_1A7863000, v34, OS_LOG_TYPE_ERROR, "Could not move downloaded data file at %{public}@, to %{public}@: %{public}@", buf, 0x20u);
        }
        objc_storeStrong((id *)&self->_error, v27);
      }
      id v17 = v28;
      goto LABEL_19;
    }
  }
  else
  {
  }
  uint64_t v38 = *DMCLogObjects();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    uint64_t v39 = v38;
    uint64_t v40 = [(DMCHTTPTransaction *)self downloadURL];
    v41 = [v40 path];
    *(_DWORD *)buf = 138543618;
    v45 = v41;
    __int16 v46 = 2114;
    id v47 = v17;
    _os_log_impl(&dword_1A7863000, v39, OS_LOG_TYPE_ERROR, "Failed to remove existing downloaded data file at %{public}@: %{public}@", buf, 0x16u);
  }
  objc_storeStrong((id *)&self->_error, v16);
LABEL_19:
}

+ (id)emptySuccessResponseBlock
{
  return &__block_literal_global_9;
}

void __47__DMCHTTPTransaction_emptySuccessResponseBlock__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  *a2 = 200;
  *a3 = 0;
  if (a4) {
    *a4 = 0;
  }
}

- (NSURL)url
{
  return self->_requestURL;
}

- (void)setUrl:(id)a3
{
}

- (NSString)method
{
  return self->_method;
}

- (void)setMethod:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSArray)pinnedSecCertificateRefs
{
  return self->_pinnedSecCertificateRefs;
}

- (void)setPinnedSecCertificateRefs:(id)a3
{
}

- (BOOL)pinningRevocationCheckRequired
{
  return self->_pinningRevocationCheckRequired;
}

- (void)setPinningRevocationCheckRequired:(BOOL)a3
{
  self->_pinningRevocationCheckRequired = a3;
}

- (NSData)responseData
{
  return &self->_responseData->super;
}

- (NSString)CMSSignatureHeaderName
{
  return self->_CMSSignatureHeaderName;
}

- (void)setCMSSignatureHeaderName:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (NSURL)permanentlyRedirectedURL
{
  return self->_permanentlyRedirectedURL;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (DMCHTTPAuthenticator)authenticator
{
  return self->_authenticator;
}

- (void)setAuthenticator:(id)a3
{
}

- (BOOL)ignoreAuthenticatorError
{
  return self->_ignoreAuthenticatorError;
}

- (void)setIgnoreAuthenticatorError:(BOOL)a3
{
  self->_ignoreAuthenticatorError = a3;
}

- (NSURL)downloadURL
{
  return self->_downloadURL;
}

- (void)setDownloadURL:(id)a3
{
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (id)simulatedTransactionBlock
{
  return self->_simulatedTransactionBlock;
}

- (void)setSimulatedTransactionBlock:(id)a3
{
}

- (id)transactionCompletionBlock
{
  return self->_transactionCompletionBlock;
}

- (void)setTransactionCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transactionCompletionBlock, 0);
  objc_storeStrong(&self->_simulatedTransactionBlock, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_downloadURL, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_pinnedSecCertificateRefs, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_permanentlyRedirectedURL, 0);
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_storeStrong((id *)&self->_CMSSignatureHeaderName, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
}

@end