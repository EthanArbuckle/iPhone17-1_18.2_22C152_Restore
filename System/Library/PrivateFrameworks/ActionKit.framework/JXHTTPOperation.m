@interface JXHTTPOperation
+ (id)withURLString:(id)a3;
+ (id)withURLString:(id)a3 queryParameters:(id)a4;
- (BOOL)performsBlocksOnMainQueue;
- (BOOL)requestShouldHandleCookies;
- (BOOL)requestShouldUsePipelining;
- (BOOL)trustAllHosts;
- (BOOL)updatesNetworkActivityIndicator;
- (BOOL)useCredentialStorage;
- (JXHTTPOperation)init;
- (JXHTTPOperationDelegate)delegate;
- (JXHTTPRequestBody)requestBody;
- (NSArray)trustedHosts;
- (NSDate)finishDate;
- (NSDate)startDate;
- (NSDictionary)requestHeaders;
- (NSNumber)downloadProgress;
- (NSNumber)uploadProgress;
- (NSString)password;
- (NSString)requestMethod;
- (NSString)responseDataFilePath;
- (NSString)uniqueString;
- (NSString)username;
- (NSURL)requestMainDocumentURL;
- (NSURL)requestURL;
- (NSURLAuthenticationChallenge)authenticationChallenge;
- (NSURLCredential)credential;
- (OS_dispatch_queue)blockQueue;
- (double)elapsedSeconds;
- (double)requestTimeoutInterval;
- (id)blockForSelector:(SEL)a3;
- (id)connection:(id)a3 needNewBodyStream:(id)a4;
- (id)connection:(id)a3 willCacheResponse:(id)a4;
- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5;
- (id)didFailBlock;
- (id)didFinishLoadingBlock;
- (id)didReceiveDataBlock;
- (id)didReceiveResponseBlock;
- (id)didSendDataBlock;
- (id)didStartBlock;
- (id)responseData;
- (id)responseExpectedFileName;
- (id)responseHeaders;
- (id)responseJSON;
- (id)responseMIMEType;
- (id)responseStatusString;
- (id)responseString;
- (id)responseTextEncodingName;
- (id)responseURL;
- (id)userObject;
- (id)willCacheResponseBlock;
- (id)willNeedNewBodyStreamBlock;
- (id)willSendRequestForAuthenticationChallengeBlock;
- (id)willSendRequestRedirectBlock;
- (id)willStartBlock;
- (int64_t)responseExpectedContentLength;
- (int64_t)responseStatusCode;
- (unint64_t)requestCachePolicy;
- (unint64_t)requestNetworkServiceType;
- (void)addValue:(id)a3 forRequestHeader:(id)a4;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6;
- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4;
- (void)connectionDidFinishLoading:(id)a3;
- (void)dealloc;
- (void)finalizeRequestBody;
- (void)main;
- (void)performDelegateMethod:(SEL)a3;
- (void)setAuthenticationChallenge:(id)a3;
- (void)setBlockQueue:(id)a3;
- (void)setCredential:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidFailBlock:(id)a3;
- (void)setDidFinishLoadingBlock:(id)a3;
- (void)setDidReceiveDataBlock:(id)a3;
- (void)setDidReceiveResponseBlock:(id)a3;
- (void)setDidSendDataBlock:(id)a3;
- (void)setDidStartBlock:(id)a3;
- (void)setDownloadProgress:(id)a3;
- (void)setFinishDate:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPerformsBlocksOnMainQueue:(BOOL)a3;
- (void)setRequestBody:(id)a3;
- (void)setRequestCachePolicy:(unint64_t)a3;
- (void)setRequestHeaders:(id)a3;
- (void)setRequestMainDocumentURL:(id)a3;
- (void)setRequestMethod:(id)a3;
- (void)setRequestNetworkServiceType:(unint64_t)a3;
- (void)setRequestShouldHandleCookies:(BOOL)a3;
- (void)setRequestShouldUsePipelining:(BOOL)a3;
- (void)setRequestTimeoutInterval:(double)a3;
- (void)setRequestURL:(id)a3;
- (void)setResponseDataFilePath:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTrustAllHosts:(BOOL)a3;
- (void)setTrustedHosts:(id)a3;
- (void)setUniqueString:(id)a3;
- (void)setUpdatesNetworkActivityIndicator:(BOOL)a3;
- (void)setUploadProgress:(id)a3;
- (void)setUseCredentialStorage:(BOOL)a3;
- (void)setUserObject:(id)a3;
- (void)setUsername:(id)a3;
- (void)setValue:(id)a3 forRequestHeader:(id)a4;
- (void)setWillCacheResponseBlock:(id)a3;
- (void)setWillNeedNewBodyStreamBlock:(id)a3;
- (void)setWillSendRequestForAuthenticationChallengeBlock:(id)a3;
- (void)setWillSendRequestRedirectBlock:(id)a3;
- (void)setWillStartBlock:(id)a3;
- (void)willFinish;
@end

@implementation JXHTTPOperation

- (id)responseURL
{
  v2 = [(JXURLConnectionOperation *)self response];
  v3 = [v2 URL];

  return v3;
}

- (id)responseTextEncodingName
{
  v2 = [(JXURLConnectionOperation *)self response];
  v3 = [v2 textEncodingName];

  return v3;
}

- (id)responseMIMEType
{
  v2 = [(JXURLConnectionOperation *)self response];
  v3 = [v2 MIMEType];

  return v3;
}

- (id)responseExpectedFileName
{
  v2 = [(JXURLConnectionOperation *)self response];
  v3 = [v2 suggestedFilename];

  return v3;
}

- (int64_t)responseExpectedContentLength
{
  v2 = [(JXURLConnectionOperation *)self response];
  int64_t v3 = [v2 expectedContentLength];

  return v3;
}

- (id)responseStatusString
{
  v2 = (void *)MEMORY[0x263EFC5E0];
  int64_t v3 = [(JXHTTPOperation *)self responseStatusCode];
  return (id)[v2 localizedStringForStatusCode:v3];
}

- (int64_t)responseStatusCode
{
  v2 = [(JXURLConnectionOperation *)self response];
  int64_t v3 = [v2 statusCode];

  return v3;
}

- (id)responseHeaders
{
  v2 = [(JXURLConnectionOperation *)self response];
  int64_t v3 = [v2 allHeaderFields];

  return v3;
}

- (id)responseJSON
{
  v2 = [(JXHTTPOperation *)self responseData];
  if (v2)
  {
    id v9 = 0;
    int64_t v3 = [MEMORY[0x263F08900] JSONObjectWithData:v2 options:0 error:&v9];
    id v4 = v9;
    if (v4)
    {
      v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/JXHTTP/JXHTTP/JXHTTPOperation+Convenience.m"];
      v6 = [v5 lastPathComponent];
      v7 = [v4 localizedDescription];
      NSLog(&cfstr_DError.isa, v6, 155, v7);
    }
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)responseString
{
  int64_t v3 = [(JXHTTPOperation *)self responseData];
  if ([v3 length])
  {
    id v4 = [(JXURLConnectionOperation *)self response];
    v5 = [v4 textEncodingName];

    if (!v5
      || ([(JXURLConnectionOperation *)self response],
          v6 = objc_claimAutoreleasedReturnValue(),
          [v6 textEncodingName],
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          CFStringEncoding v8 = CFStringConvertIANACharSetNameToEncoding(v7),
          v8 == -1))
    {
      unint64_t v9 = 4;
    }
    else
    {
      unint64_t v9 = CFStringConvertEncodingToNSStringEncoding(v8);
    }
    v10 = (void *)[[NSString alloc] initWithData:v3 encoding:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)responseData
{
  int64_t v3 = [(JXURLConnectionOperation *)self outputStream];
  id v4 = [v3 propertyForKey:*MEMORY[0x263EFF590]];

  if (!v4)
  {
    v5 = [(JXHTTPOperation *)self responseDataFilePath];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x263EFF8F8]);
      CFStringEncoding v8 = [(JXHTTPOperation *)self responseDataFilePath];
      id v15 = 0;
      id v4 = (void *)[v7 initWithContentsOfFile:v8 options:1 error:&v15];
      id v9 = v15;

      if (v9)
      {
        v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/JXHTTP/JXHTTP/JXHTTPOperation+Convenience.m"];
        v11 = [v10 lastPathComponent];
        v12 = [v9 localizedDescription];
        NSLog(&cfstr_DError.isa, v11, 121, v12);
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  id v13 = v4;

  return v13;
}

- (void)setValue:(id)a3 forRequestHeader:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(JXURLConnectionOperation *)self request];
  [v8 setValue:v7 forHTTPHeaderField:v6];
}

- (void)addValue:(id)a3 forRequestHeader:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(JXURLConnectionOperation *)self request];
  [v8 addValue:v7 forHTTPHeaderField:v6];
}

- (void)setRequestShouldHandleCookies:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(JXURLConnectionOperation *)self request];
  [v4 setHTTPShouldHandleCookies:v3];
}

- (BOOL)requestShouldHandleCookies
{
  v2 = [(JXURLConnectionOperation *)self request];
  char v3 = [v2 HTTPShouldHandleCookies];

  return v3;
}

- (void)setRequestMethod:(id)a3
{
  id v4 = a3;
  id v5 = [(JXURLConnectionOperation *)self request];
  [v5 setHTTPMethod:v4];
}

- (NSString)requestMethod
{
  v2 = [(JXURLConnectionOperation *)self request];
  char v3 = [v2 HTTPMethod];

  return (NSString *)v3;
}

- (void)setRequestHeaders:(id)a3
{
  id v4 = a3;
  id v5 = [(JXURLConnectionOperation *)self request];
  [v5 setAllHTTPHeaderFields:v4];
}

- (NSDictionary)requestHeaders
{
  v2 = [(JXURLConnectionOperation *)self request];
  char v3 = [v2 allHTTPHeaderFields];

  return (NSDictionary *)v3;
}

- (void)setRequestURL:(id)a3
{
  id v4 = a3;
  id v5 = [(JXURLConnectionOperation *)self request];
  [v5 setURL:v4];
}

- (NSURL)requestURL
{
  v2 = [(JXURLConnectionOperation *)self request];
  char v3 = [v2 URL];

  return (NSURL *)v3;
}

- (void)setRequestNetworkServiceType:(unint64_t)a3
{
  id v4 = [(JXURLConnectionOperation *)self request];
  [v4 setNetworkServiceType:a3];
}

- (unint64_t)requestNetworkServiceType
{
  v2 = [(JXURLConnectionOperation *)self request];
  unint64_t v3 = [v2 networkServiceType];

  return v3;
}

- (void)setRequestTimeoutInterval:(double)a3
{
  id v4 = [(JXURLConnectionOperation *)self request];
  [v4 setTimeoutInterval:a3];
}

- (double)requestTimeoutInterval
{
  v2 = [(JXURLConnectionOperation *)self request];
  [v2 timeoutInterval];
  double v4 = v3;

  return v4;
}

- (void)setRequestMainDocumentURL:(id)a3
{
  id v4 = a3;
  id v5 = [(JXURLConnectionOperation *)self request];
  [v5 setMainDocumentURL:v4];
}

- (NSURL)requestMainDocumentURL
{
  v2 = [(JXURLConnectionOperation *)self request];
  double v3 = [v2 mainDocumentURL];

  return (NSURL *)v3;
}

- (void)setRequestShouldUsePipelining:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(JXURLConnectionOperation *)self request];
  [v4 setHTTPShouldUsePipelining:v3];
}

- (BOOL)requestShouldUsePipelining
{
  v2 = [(JXURLConnectionOperation *)self request];
  char v3 = [v2 HTTPShouldUsePipelining];

  return v3;
}

- (void)setRequestCachePolicy:(unint64_t)a3
{
  id v4 = [(JXURLConnectionOperation *)self request];
  [v4 setCachePolicy:a3];
}

- (unint64_t)requestCachePolicy
{
  v2 = [(JXURLConnectionOperation *)self request];
  unint64_t v3 = [v2 cachePolicy];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockQueue, 0);
  objc_storeStrong(&self->_willSendRequestRedirectBlock, 0);
  objc_storeStrong(&self->_willCacheResponseBlock, 0);
  objc_storeStrong(&self->_didFailBlock, 0);
  objc_storeStrong(&self->_didFinishLoadingBlock, 0);
  objc_storeStrong(&self->_didSendDataBlock, 0);
  objc_storeStrong(&self->_didReceiveDataBlock, 0);
  objc_storeStrong(&self->_didReceiveResponseBlock, 0);
  objc_storeStrong(&self->_didStartBlock, 0);
  objc_storeStrong(&self->_willSendRequestForAuthenticationChallengeBlock, 0);
  objc_storeStrong(&self->_willNeedNewBodyStreamBlock, 0);
  objc_storeStrong(&self->_willStartBlock, 0);
  objc_storeStrong((id *)&self->_finishDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_uploadProgress, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_trustedHosts, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_authenticationChallenge, 0);
  objc_storeStrong(&self->_userObject, 0);
  objc_storeStrong((id *)&self->_responseDataFilePath, 0);
  objc_storeStrong((id *)&self->_uniqueString, 0);
  objc_storeStrong((id *)&self->_requestBody, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setBlockQueue:(id)a3
{
}

- (OS_dispatch_queue)blockQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 528, 1);
}

- (void)setWillSendRequestRedirectBlock:(id)a3
{
}

- (id)willSendRequestRedirectBlock
{
  return objc_getProperty(self, a2, 520, 1);
}

- (void)setWillCacheResponseBlock:(id)a3
{
}

- (id)willCacheResponseBlock
{
  return objc_getProperty(self, a2, 512, 1);
}

- (void)setDidFailBlock:(id)a3
{
}

- (id)didFailBlock
{
  return objc_getProperty(self, a2, 504, 1);
}

- (void)setDidFinishLoadingBlock:(id)a3
{
}

- (id)didFinishLoadingBlock
{
  return objc_getProperty(self, a2, 496, 1);
}

- (void)setDidSendDataBlock:(id)a3
{
}

- (id)didSendDataBlock
{
  return objc_getProperty(self, a2, 488, 1);
}

- (void)setDidReceiveDataBlock:(id)a3
{
}

- (id)didReceiveDataBlock
{
  return objc_getProperty(self, a2, 480, 1);
}

- (void)setDidReceiveResponseBlock:(id)a3
{
}

- (id)didReceiveResponseBlock
{
  return objc_getProperty(self, a2, 472, 1);
}

- (void)setDidStartBlock:(id)a3
{
}

- (id)didStartBlock
{
  return objc_getProperty(self, a2, 464, 1);
}

- (void)setWillSendRequestForAuthenticationChallengeBlock:(id)a3
{
}

- (id)willSendRequestForAuthenticationChallengeBlock
{
  return objc_getProperty(self, a2, 456, 1);
}

- (void)setWillNeedNewBodyStreamBlock:(id)a3
{
}

- (id)willNeedNewBodyStreamBlock
{
  return objc_getProperty(self, a2, 448, 1);
}

- (void)setWillStartBlock:(id)a3
{
}

- (id)willStartBlock
{
  return objc_getProperty(self, a2, 440, 1);
}

- (void)setPerformsBlocksOnMainQueue:(BOOL)a3
{
  self->_performsBlocksOnMainQueue = a3;
}

- (BOOL)performsBlocksOnMainQueue
{
  return self->_performsBlocksOnMainQueue;
}

- (void)setFinishDate:(id)a3
{
}

- (NSDate)finishDate
{
  return (NSDate *)objc_getProperty(self, a2, 432, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 424, 1);
}

- (void)setUpdatesNetworkActivityIndicator:(BOOL)a3
{
  self->_updatesNetworkActivityIndicator = a3;
}

- (BOOL)updatesNetworkActivityIndicator
{
  return self->_updatesNetworkActivityIndicator;
}

- (void)setUploadProgress:(id)a3
{
}

- (NSNumber)uploadProgress
{
  return (NSNumber *)objc_getProperty(self, a2, 416, 1);
}

- (void)setDownloadProgress:(id)a3
{
}

- (NSNumber)downloadProgress
{
  return (NSNumber *)objc_getProperty(self, a2, 408, 1);
}

- (void)setPassword:(id)a3
{
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (void)setTrustedHosts:(id)a3
{
}

- (NSArray)trustedHosts
{
  return (NSArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setTrustAllHosts:(BOOL)a3
{
  self->_trustAllHosts = a3;
}

- (BOOL)trustAllHosts
{
  return self->_trustAllHosts;
}

- (void)setUseCredentialStorage:(BOOL)a3
{
  self->_useCredentialStorage = a3;
}

- (BOOL)useCredentialStorage
{
  return self->_useCredentialStorage;
}

- (void)setCredential:(id)a3
{
}

- (NSURLCredential)credential
{
  return (NSURLCredential *)objc_getProperty(self, a2, 376, 1);
}

- (void)setAuthenticationChallenge:(id)a3
{
}

- (NSURLAuthenticationChallenge)authenticationChallenge
{
  return (NSURLAuthenticationChallenge *)objc_getProperty(self, a2, 368, 1);
}

- (void)setUserObject:(id)a3
{
}

- (id)userObject
{
  return objc_getProperty(self, a2, 360, 1);
}

- (NSString)responseDataFilePath
{
  return self->_responseDataFilePath;
}

- (void)setUniqueString:(id)a3
{
}

- (NSString)uniqueString
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setRequestBody:(id)a3
{
}

- (JXHTTPRequestBody)requestBody
{
  return (JXHTTPRequestBody *)objc_getProperty(self, a2, 336, 1);
}

- (void)setDelegate:(id)a3
{
}

- (JXHTTPOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (JXHTTPOperationDelegate *)WeakRetained;
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (unint64_t)a5;
  if ([(JXHTTPOperation *)self isCancelled])
  {
    id v11 = 0;
  }
  else
  {
    v12 = [(JXHTTPOperation *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    v14 = [(JXHTTPOperation *)self requestBody];
    char v15 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0
      || (v15 & 1) != 0
      || ([(JXHTTPOperation *)self willSendRequestRedirectBlock],
          v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v16))
    {
      uint64_t v38 = 0;
      v39 = &v38;
      uint64_t v40 = 0x3032000000;
      v41 = __Block_byref_object_copy__36507;
      v42 = __Block_byref_object_dispose__36508;
      id v43 = 0;
      if (v13)
      {
        v17 = [(JXHTTPOperation *)self delegate];
        uint64_t v18 = [v17 httpOperation:self willSendRequest:v9 redirectResponse:v10];
        v19 = (void *)v39[5];
        v39[5] = v18;
      }
      if (v15)
      {
        v20 = [(JXHTTPOperation *)self requestBody];
        uint64_t v21 = [v20 httpOperation:self willSendRequest:v9 redirectResponse:v10];
        v22 = (void *)v39[5];
        v39[5] = v21;
      }
      v23 = [(JXHTTPOperation *)self willSendRequestRedirectBlock];

      if (v23)
      {
        BOOL v24 = [(JXHTTPOperation *)self performsBlocksOnMainQueue];
        if (v24)
        {
          v25 = MEMORY[0x263EF83A0];
          id v26 = MEMORY[0x263EF83A0];
        }
        else
        {
          v25 = [(JXHTTPOperation *)self blockQueue];
        }
        uint64_t v30 = MEMORY[0x263EF8330];
        uint64_t v31 = 3221225472;
        v32 = __63__JXHTTPOperation_connection_willSendRequest_redirectResponse___block_invoke;
        v33 = &unk_264E5AA50;
        v37 = &v38;
        v34 = self;
        id v35 = v9;
        id v36 = (id)v10;
        dispatch_sync(v25, &v30);
        v27 = MEMORY[0x263EF83A0];
        if (!v24) {
          v27 = v25;
        }
      }
      if (!(v10 | v39[5])) {
        [(JXOperation *)self cancel];
      }
      if ([(JXHTTPOperation *)self isCancelled]) {
        v28 = 0;
      }
      else {
        v28 = (void *)v39[5];
      }
      id v11 = v28;
      _Block_object_dispose(&v38, 8);
    }
    else
    {
      id v11 = v9;
    }
  }

  return v11;
}

void __63__JXHTTPOperation_connection_willSendRequest_redirectResponse___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) willSendRequestRedirectBlock];
  uint64_t v2 = (*((void (**)(id, void, void, void))v5 + 2))(v5, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)connection:(id)a3 willCacheResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(JXHTTPOperation *)self isCancelled])
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(JXHTTPOperation *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    id v11 = [(JXHTTPOperation *)self requestBody];
    char v12 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0
      || (v12 & 1) != 0
      || ([(JXHTTPOperation *)self willCacheResponseBlock],
          char v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v13))
    {
      uint64_t v34 = 0;
      id v35 = &v34;
      uint64_t v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__36507;
      uint64_t v38 = __Block_byref_object_dispose__36508;
      id v39 = 0;
      v14 = [(JXHTTPOperation *)self delegate];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        v16 = [(JXHTTPOperation *)self delegate];
        uint64_t v17 = [v16 httpOperation:self willCacheResponse:v7];
        uint64_t v18 = (void *)v35[5];
        v35[5] = v17;
      }
      v19 = [(JXHTTPOperation *)self requestBody];
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        uint64_t v21 = [(JXHTTPOperation *)self requestBody];
        uint64_t v22 = [v21 httpOperation:self willCacheResponse:v7];
        v23 = (void *)v35[5];
        v35[5] = v22;
      }
      BOOL v24 = [(JXHTTPOperation *)self willCacheResponseBlock];

      if (v24)
      {
        BOOL v25 = [(JXHTTPOperation *)self performsBlocksOnMainQueue];
        if (v25)
        {
          id v26 = MEMORY[0x263EF83A0];
          id v27 = MEMORY[0x263EF83A0];
        }
        else
        {
          id v26 = [(JXHTTPOperation *)self blockQueue];
        }
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __48__JXHTTPOperation_connection_willCacheResponse___block_invoke;
        block[3] = &unk_264E5DAA8;
        v33 = &v34;
        block[4] = self;
        id v32 = v7;
        dispatch_sync(v26, block);
        v28 = MEMORY[0x263EF83A0];
        if (!v25) {
          v28 = v26;
        }
      }
      if ([(JXHTTPOperation *)self isCancelled]) {
        v29 = 0;
      }
      else {
        v29 = (void *)v35[5];
      }
      id v8 = v29;
      _Block_object_dispose(&v34, 8);
    }
    else
    {
      id v8 = v7;
    }
  }

  return v8;
}

void __48__JXHTTPOperation_connection_willCacheResponse___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) willCacheResponseBlock];
  uint64_t v2 = (*((void (**)(id, void, void))v5 + 2))(v5, *(void *)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)connection:(id)a3 needNewBodyStream:(id)a4
{
  if ([(JXHTTPOperation *)self isCancelled])
  {
    id v5 = 0;
  }
  else
  {
    [(JXHTTPOperation *)self performDelegateMethod:sel_httpOperationWillNeedNewBodyStream_];
    id v6 = [(JXHTTPOperation *)self requestBody];
    id v5 = [v6 httpInputStream];
  }
  return v5;
}

- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)JXHTTPOperation;
  -[JXURLConnectionOperation connection:didSendBodyData:totalBytesWritten:totalBytesExpectedToWrite:](&v11, sel_connection_didSendBodyData_totalBytesWritten_totalBytesExpectedToWrite_, a3, a4);
  if (([(JXHTTPOperation *)self isCancelled] & 1) == 0)
  {
    if (a6 >= 1)
    {
      *(float *)&double v9 = (float)a5 / (float)a6;
      char v10 = [NSNumber numberWithFloat:v9];
      [(JXHTTPOperation *)self setUploadProgress:v10];
    }
    [(JXHTTPOperation *)self performDelegateMethod:sel_httpOperationDidSendData_];
  }
}

- (void)connectionDidFinishLoading:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)JXHTTPOperation;
  [(JXURLConnectionOperation *)&v11 connectionDidFinishLoading:a3];
  if (([(JXHTTPOperation *)self isCancelled] & 1) == 0)
  {
    id v4 = [(JXHTTPOperation *)self downloadProgress];
    [v4 floatValue];
    float v6 = v5;

    if (v6 != 1.0) {
      [(JXHTTPOperation *)self setDownloadProgress:&unk_26F076AB0];
    }
    id v7 = [(JXHTTPOperation *)self uploadProgress];
    [v7 floatValue];
    float v9 = v8;

    if (v9 != 1.0) {
      [(JXHTTPOperation *)self setUploadProgress:&unk_26F076AB0];
    }
    id v10 = objc_alloc_init(MEMORY[0x263EFF910]);
    [(JXHTTPOperation *)self setFinishDate:v10];

    [(JXHTTPOperation *)self performDelegateMethod:sel_httpOperationDidFinishLoading_];
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)JXHTTPOperation;
  [(JXURLConnectionOperation *)&v10 connection:a3 didReceiveData:a4];
  if (([(JXHTTPOperation *)self isCancelled] & 1) == 0)
  {
    float v5 = [(JXURLConnectionOperation *)self response];
    uint64_t v6 = [v5 expectedContentLength];

    if (v6 >= 1)
    {
      id v7 = NSNumber;
      *(float *)&double v8 = (float)[(JXURLConnectionOperation *)self bytesDownloaded] / (float)v6;
      float v9 = [v7 numberWithFloat:v8];
      [(JXHTTPOperation *)self setDownloadProgress:v9];
    }
    [(JXHTTPOperation *)self performDelegateMethod:sel_httpOperationDidReceiveData_];
  }
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)JXHTTPOperation;
  [(JXURLConnectionOperation *)&v5 connection:a3 didReceiveResponse:a4];
  if (([(JXHTTPOperation *)self isCancelled] & 1) == 0) {
    [(JXHTTPOperation *)self performDelegateMethod:sel_httpOperationDidReceiveResponse_];
  }
}

- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([(JXHTTPOperation *)self isCancelled])
  {
    uint64_t v6 = [v5 sender];
    [v6 cancelAuthenticationChallenge:v5];

    goto LABEL_28;
  }
  [(JXHTTPOperation *)self setAuthenticationChallenge:v5];
  [(JXHTTPOperation *)self performDelegateMethod:sel_httpOperationWillSendRequestForAuthenticationChallenge_];
  id v7 = [(JXHTTPOperation *)self credential];
  if (v7)
  {
  }
  else
  {
    double v8 = [(JXHTTPOperation *)self authenticationChallenge];
    float v9 = [v8 protectionSpace];
    objc_super v10 = [v9 authenticationMethod];
    objc_super v11 = (void *)*MEMORY[0x263EFC5A0];

    if (v10 == v11)
    {
      if ([(JXHTTPOperation *)self trustAllHosts])
      {
LABEL_18:
        uint64_t v22 = (void *)MEMORY[0x263EFC610];
        v23 = [(JXHTTPOperation *)self authenticationChallenge];
        BOOL v24 = [v23 protectionSpace];
        BOOL v25 = objc_msgSend(v22, "credentialForTrust:", objc_msgSend(v24, "serverTrust"));
        [(JXHTTPOperation *)self setCredential:v25];
      }
      else
      {
        char v12 = [(JXHTTPOperation *)self trustedHosts];

        if (v12)
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          char v13 = [(JXHTTPOperation *)self trustedHosts];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v40;
            while (2)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v40 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                v19 = [(JXHTTPOperation *)self authenticationChallenge];
                char v20 = [v19 protectionSpace];
                uint64_t v21 = [v20 host];
                LOBYTE(v18) = [v18 isEqualToString:v21];

                if (v18)
                {

                  goto LABEL_18;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
        }
      }
    }
  }
  id v26 = [(JXHTTPOperation *)self credential];
  if (v26) {
    goto LABEL_20;
  }
  uint64_t v32 = [(JXHTTPOperation *)self username];
  if (v32)
  {
    v33 = (void *)v32;
    uint64_t v34 = [(JXHTTPOperation *)self password];

    if (v34)
    {
      id v35 = (void *)MEMORY[0x263EFC610];
      id v26 = [(JXHTTPOperation *)self username];
      uint64_t v36 = [(JXHTTPOperation *)self password];
      v37 = [v35 credentialWithUser:v26 password:v36 persistence:1];
      [(JXHTTPOperation *)self setCredential:v37];

LABEL_20:
    }
  }
  id v27 = [(JXHTTPOperation *)self credential];

  v28 = [(JXHTTPOperation *)self authenticationChallenge];
  v29 = [v28 sender];
  if (v27)
  {
    uint64_t v30 = [(JXHTTPOperation *)self credential];
    uint64_t v31 = [(JXHTTPOperation *)self authenticationChallenge];
    [v29 useCredential:v30 forAuthenticationChallenge:v31];
  }
  else
  {
    uint64_t v38 = [(JXHTTPOperation *)self authenticationChallenge];
    [v29 continueWithoutCredentialForAuthenticationChallenge:v38];
  }
LABEL_28:
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)JXHTTPOperation;
  [(JXURLConnectionOperation *)&v6 connection:a3 didFailWithError:a4];
  if (([(JXHTTPOperation *)self isCancelled] & 1) == 0)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF910]);
    [(JXHTTPOperation *)self setFinishDate:v5];

    [(JXHTTPOperation *)self performDelegateMethod:sel_httpOperationDidFail_];
  }
}

- (void)willFinish
{
  v2.receiver = self;
  v2.super_class = (Class)JXHTTPOperation;
  [(JXURLConnectionOperation *)&v2 willFinish];
}

- (void)main
{
  if (([(JXHTTPOperation *)self isCancelled] & 1) == 0)
  {
    [(JXHTTPOperation *)self performDelegateMethod:sel_httpOperationWillStart_];
    [(JXHTTPOperation *)self finalizeRequestBody];
    id v3 = objc_alloc_init(MEMORY[0x263EFF910]);
    [(JXHTTPOperation *)self setStartDate:v3];

    v4.receiver = self;
    v4.super_class = (Class)JXHTTPOperation;
    [(JXURLConnectionOperation *)&v4 main];
    [(JXHTTPOperation *)self performDelegateMethod:sel_httpOperationDidStart_];
  }
}

- (double)elapsedSeconds
{
  id v3 = [(JXHTTPOperation *)self startDate];

  if (!v3) {
    return 0.0;
  }
  objc_super v4 = [(JXHTTPOperation *)self finishDate];
  if (v4)
  {
    id v5 = [(JXHTTPOperation *)self finishDate];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF910]);
  }
  id v7 = v5;

  double v8 = [(JXHTTPOperation *)self startDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  return v10;
}

- (void)setResponseDataFilePath:(id)a3
{
  id v11 = a3;
  if (([(JXHTTPOperation *)self isCancelled] & 1) == 0
    && ![(JXOperation *)self isExecuting]
    && ![(JXOperation *)self isFinished])
  {
    objc_super v4 = (NSString *)[v11 copy];
    responseDataFilePath = self->_responseDataFilePath;
    self->_responseDataFilePath = v4;

    objc_super v6 = [(JXHTTPOperation *)self responseDataFilePath];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      double v8 = (void *)MEMORY[0x263EFF9E0];
      double v9 = [(JXHTTPOperation *)self responseDataFilePath];
      double v10 = [v8 outputStreamToFileAtPath:v9 append:0];
      [(JXURLConnectionOperation *)self setOutputStream:v10];
    }
  }
}

- (id)blockForSelector:(SEL)a3
{
  if (sel_httpOperationWillStart_ == a3)
  {
    id v3 = [(JXHTTPOperation *)self willStartBlock];
  }
  else if (sel_httpOperationWillNeedNewBodyStream_ == a3)
  {
    id v3 = [(JXHTTPOperation *)self willNeedNewBodyStreamBlock];
  }
  else if (sel_httpOperationWillSendRequestForAuthenticationChallenge_ == a3)
  {
    id v3 = [(JXHTTPOperation *)self willSendRequestForAuthenticationChallengeBlock];
  }
  else if (sel_httpOperationDidStart_ == a3)
  {
    id v3 = [(JXHTTPOperation *)self didStartBlock];
  }
  else if (sel_httpOperationDidReceiveResponse_ == a3)
  {
    id v3 = [(JXHTTPOperation *)self didReceiveResponseBlock];
  }
  else if (sel_httpOperationDidReceiveData_ == a3)
  {
    id v3 = [(JXHTTPOperation *)self didReceiveDataBlock];
  }
  else if (sel_httpOperationDidSendData_ == a3)
  {
    id v3 = [(JXHTTPOperation *)self didSendDataBlock];
  }
  else if (sel_httpOperationDidFinishLoading_ == a3)
  {
    id v3 = [(JXHTTPOperation *)self didFinishLoadingBlock];
  }
  else if (sel_httpOperationDidFail_ == a3)
  {
    id v3 = [(JXHTTPOperation *)self didFailBlock];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)finalizeRequestBody
{
  id v3 = [(JXHTTPOperation *)self requestBody];

  if (v3)
  {
    objc_super v4 = [(JXHTTPOperation *)self requestBody];
    id v23 = [v4 httpInputStream];

    if (v23)
    {
      id v5 = [(JXURLConnectionOperation *)self request];
      [v5 setHTTPBodyStream:v23];
    }
    objc_super v6 = [(JXURLConnectionOperation *)self request];
    uint64_t v7 = [v6 HTTPMethod];
    double v8 = [v7 uppercaseString];
    int v9 = [v8 isEqualToString:@"GET"];

    if (v9)
    {
      double v10 = [(JXURLConnectionOperation *)self request];
      [v10 setHTTPMethod:@"POST"];
    }
    id v11 = [(JXHTTPOperation *)self requestBody];
    char v12 = [v11 httpContentType];

    if (![(__CFString *)v12 length])
    {

      char v12 = @"application/octet-stream";
    }
    char v13 = [(JXURLConnectionOperation *)self request];
    uint64_t v14 = [v13 valueForHTTPHeaderField:@"Content-Type"];

    if (!v14)
    {
      uint64_t v15 = [(JXURLConnectionOperation *)self request];
      [v15 setValue:v12 forHTTPHeaderField:@"Content-Type"];
    }
    uint64_t v16 = [(JXURLConnectionOperation *)self request];
    uint64_t v17 = [v16 valueForHTTPHeaderField:@"User-Agent"];

    if (!v17)
    {
      uint64_t v18 = [(JXURLConnectionOperation *)self request];
      [v18 setValue:@"JXHTTP" forHTTPHeaderField:@"User-Agent"];
    }
    v19 = [(JXHTTPOperation *)self requestBody];
    uint64_t v20 = [v19 httpContentLength];

    if (v20 >= 1)
    {
      uint64_t v21 = [(JXURLConnectionOperation *)self request];
      uint64_t v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", v20);
      [v21 setValue:v22 forHTTPHeaderField:@"Content-Length"];
    }
  }
}

- (void)performDelegateMethod:(SEL)a3
{
  if (([(JXHTTPOperation *)self isCancelled] & 1) == 0)
  {
    id v5 = [(JXHTTPOperation *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [(JXHTTPOperation *)self delegate];
      double v8 = [MEMORY[0x263F08B88] currentThread];
      [v7 performSelector:a3 onThread:v8 withObject:self waitUntilDone:1];
    }
    int v9 = [(JXHTTPOperation *)self requestBody];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(JXHTTPOperation *)self requestBody];
      char v12 = [MEMORY[0x263F08B88] currentThread];
      [v11 performSelector:a3 onThread:v12 withObject:self waitUntilDone:1];
    }
    char v13 = [(JXHTTPOperation *)self blockForSelector:a3];
    if (([(JXHTTPOperation *)self isCancelled] & 1) == 0 && v13)
    {
      BOOL v14 = [(JXHTTPOperation *)self performsBlocksOnMainQueue];
      if (v14)
      {
        uint64_t v15 = MEMORY[0x263EF83A0];
        id v16 = MEMORY[0x263EF83A0];
      }
      else
      {
        uint64_t v15 = [(JXHTTPOperation *)self blockQueue];
      }
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __41__JXHTTPOperation_performDelegateMethod___block_invoke;
      v18[3] = &unk_264E5EE18;
      v18[4] = self;
      id v19 = v13;
      dispatch_async(v15, v18);
      uint64_t v17 = MEMORY[0x263EF83A0];
      if (!v14) {
        uint64_t v17 = v15;
      }
    }
  }
}

uint64_t __41__JXHTTPOperation_performDelegateMethod___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (JXHTTPOperation)init
{
  v12.receiver = self;
  v12.super_class = (Class)JXHTTPOperation;
  objc_super v2 = [(JXURLConnectionOperation *)&v12 init];
  if (v2)
  {
    id v3 = [NSString alloc];
    objc_super v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    char v6 = (void *)[v3 initWithFormat:@"%@.%p.blocks", v5, v2];

    id v7 = v6;
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], 0);
    [(JXHTTPOperation *)v2 setBlockQueue:v8];

    int v9 = [MEMORY[0x263F08AB0] processInfo];
    char v10 = [v9 globallyUniqueString];
    [(JXHTTPOperation *)v2 setUniqueString:v10];

    [(JXHTTPOperation *)v2 setDownloadProgress:&unk_26F076AA0];
    [(JXHTTPOperation *)v2 setUploadProgress:&unk_26F076AA0];
    [(JXHTTPOperation *)v2 setPerformsBlocksOnMainQueue:0];
    [(JXHTTPOperation *)v2 setUpdatesNetworkActivityIndicator:1];
    [(JXHTTPOperation *)v2 setAuthenticationChallenge:0];
    [(JXHTTPOperation *)v2 setResponseDataFilePath:0];
    [(JXHTTPOperation *)v2 setCredential:0];
    [(JXHTTPOperation *)v2 setUserObject:0];
    [(JXHTTPOperation *)v2 setUseCredentialStorage:1];
    [(JXHTTPOperation *)v2 setTrustedHosts:0];
    [(JXHTTPOperation *)v2 setTrustAllHosts:0];
    [(JXHTTPOperation *)v2 setUsername:0];
    [(JXHTTPOperation *)v2 setPassword:0];
    [(JXHTTPOperation *)v2 setStartDate:0];
    [(JXHTTPOperation *)v2 setFinishDate:0];
    [(JXHTTPOperation *)v2 setWillStartBlock:0];
    [(JXHTTPOperation *)v2 setWillNeedNewBodyStreamBlock:0];
    [(JXHTTPOperation *)v2 setWillSendRequestForAuthenticationChallengeBlock:0];
    [(JXHTTPOperation *)v2 setWillSendRequestRedirectBlock:0];
    [(JXHTTPOperation *)v2 setWillCacheResponseBlock:0];
    [(JXHTTPOperation *)v2 setDidStartBlock:0];
    [(JXHTTPOperation *)v2 setDidReceiveResponseBlock:0];
    [(JXHTTPOperation *)v2 setDidReceiveDataBlock:0];
    [(JXHTTPOperation *)v2 setDidSendDataBlock:0];
    [(JXHTTPOperation *)v2 setDidFinishLoadingBlock:0];
    [(JXHTTPOperation *)v2 setDidFailBlock:0];
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)JXHTTPOperation;
  [(JXURLConnectionOperation *)&v2 dealloc];
}

+ (id)withURLString:(id)a3 queryParameters:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    dispatch_queue_t v8 = +[JXURLEncoding encodedDictionary:a4];
    id v7 = [v6 stringByAppendingFormat:@"?%@", v8];
  }
  int v9 = [a1 withURLString:v7];

  return v9;
}

+ (id)withURLString:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = (void *)[objc_alloc(NSURL) initWithString:v4];

  id v7 = (void *)[v5 initWithURL:v6];
  return v7;
}

@end