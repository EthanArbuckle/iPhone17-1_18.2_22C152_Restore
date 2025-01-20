@interface __NSCFURLProxySessionConnection
- (__NSCFURLProxySessionConnection)initWithTask:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _conditionalRequirementsChanged:(BOOL)a5;
- (void)URLSession:(id)a3 task:(id)a4 _isWaitingForConnectionWithReason:(int64_t)a5;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveInformationalResponse:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_URLSession:(id)a3 task:(id)a4 getAuthHeadersForResponse:(id)a5 completionHandler:(id)a6;
- (void)_deliverDidCompleteWithError:(id *)a1;
- (void)_performOriginLoad;
- (void)_startLoad;
- (void)cancel;
- (void)dealloc;
- (void)expectedProgressTargetChanged;
- (void)resume;
- (void)setPoolPriority:(int64_t)a3;
- (void)setTLSMaximumSupportedProtocolVersion:(unsigned __int16)a3;
- (void)setTLSMinimumSupportedProtocolVersion:(unsigned __int16)a3;
- (void)suspend;
@end

@implementation __NSCFURLProxySessionConnection

- (void)_URLSession:(id)a3 task:(id)a4 getAuthHeadersForResponse:(id)a5 completionHandler:(id)a6
{
  if (self)
  {
    v9 = objc_msgSend(objc_getProperty(self, a2, 8, 1), "authenticator");
    uint64_t v11 = objc_msgSend(objc_getProperty(self, v10, 8, 1), "session");
    id Property = objc_getProperty(self, v12, 8, 1);
  }
  else
  {
    v9 = objc_msgSend(0, "authenticator", a3, a4);
    uint64_t v11 = [0 session];
    id Property = 0;
  }

  [v9 getAuthenticationHeadersForTask:v11 task:Property response:a5 completionHandler:a6];
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveInformationalResponse:(id)a5
{
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  uint64_t v7 = objc_msgSend(a4, "_metrics", a3);
  if (self) {
    id Property = objc_getProperty(self, v6, 8, 1);
  }
  else {
    id Property = 0;
  }

  objc_msgSend(Property, "set_metrics:", v7);
}

- (void)URLSession:(id)a3 task:(id)a4 _conditionalRequirementsChanged:(BOOL)a5
{
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  [a4 updateCurrentRequest:a5];
  delegate = self->super._delegate;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __110____NSCFURLProxySessionConnection_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke;
  v11[3] = &unk_1E5258340;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = a6;
  [(__NSCFURLSessionConnectionDelegate *)delegate connection:self _willSendRequestForEstablishedConnection:a5 completion:v11];
}

- (void)URLSession:(id)a3 task:(id)a4 _isWaitingForConnectionWithReason:(int64_t)a5
{
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  if (a5 && self->_cacheTask == a4 && !self->_shouldCancelOnCacheTaskCompletion && !self->_clientWantsCacheOnly)
  {
    self->_completedLocalCacheLookup = 1;

    self->_cacheTask = 0;
    v14 = (void *)[a5 domain];
    if ([v14 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      if ([a5 code] == -2000)
      {
        uint64_t v16 = objc_msgSend((id)objc_msgSend(a5, "userInfo"), "objectForKeyedSubscript:", @"_kCFNetworkErrorCachedResponseKey");
        uint64_t v17 = objc_msgSend((id)objc_msgSend(a5, "userInfo"), "objectForKeyedSubscript:", @"_kCFNetworkErrorConditionalRequestKey");
        if (v16)
        {
          uint64_t v18 = v17;
          if (v17)
          {
            self->_cachedResponseForConditionalRequest = (NSCachedURLResponse *)[[NSCachedURLResponse alloc] _initWithCFCachedURLResponse:v16];
            self->_conditionalRequest = (NSURLRequest *)[[NSURLRequest alloc] _initWithCFURLRequest:v18];
            if (objc_msgSend((id)objc_msgSend(a4, "originalRequest"), "HTTPBodyStream"))
            {
              v19 = (NSURLRequest *)[(NSURLRequest *)self->_conditionalRequest mutableCopy];
              -[NSURLRequest setHTTPBodyStream:](v19, "setHTTPBodyStream:", objc_msgSend((id)objc_msgSend(a4, "originalRequest"), "HTTPBodyStream"));

              self->_conditionalRequest = v19;
            }
          }
        }
      }
    }
    [(__NSCFURLProxySessionConnection *)(uint64_t)self _startLoad];
  }
  else
  {
    cachedResponseDataArray = self->_cachedResponseDataArray;
    if (cachedResponseDataArray)
    {
      DispatchDataFromDataArray = createDispatchDataFromDataArray(cachedResponseDataArray);
      -[__NSCFURLSessionConnection _appendDataToCache:]((uint64_t)self, DispatchDataFromDataArray);
      delegate = self->super._delegate;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __72____NSCFURLProxySessionConnection_URLSession_task_didCompleteWithError___block_invoke;
      v21[3] = &unk_1E5258228;
      v21[4] = DispatchDataFromDataArray;
      [(__NSCFURLSessionConnectionDelegate *)delegate connection:self didReceiveData:DispatchDataFromDataArray completion:v21];
    }
    if (a5) {
      -[__NSCFURLSessionConnection _tossCache]((uint64_t)self);
    }
    -[__NSCFURLSessionConnectionDelegate connectionWillFinishLoading:](self->super._delegate, "connectionWillFinishLoading:", self, a4);
    uint64_t v11 = -[__NSCFURLSessionConnection _cachedResponse]((uint64_t)self);
    if (v11)
    {
      SEL v12 = v11;
      v13 = self->super._delegate;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __72____NSCFURLProxySessionConnection_URLSession_task_didCompleteWithError___block_invoke_2;
      v20[3] = &unk_1E5258318;
      v20[4] = self;
      v20[5] = a5;
      [(__NSCFURLSessionConnectionDelegate *)v13 connection:self willCacheResponse:v12 responseCallback:v20];
    }
    else
    {
      -[__NSCFURLProxySessionConnection _deliverDidCompleteWithError:]((id *)&self->super.super.isa, a5);
    }
  }
}

- (void)_startLoad
{
  if (a1)
  {
    uint64_t v3 = objc_msgSend(objc_getProperty((id)a1, a2, 8, 1), "_cachePolicy");
    if (v3 == 1 || v3 == 4) {
      goto LABEL_7;
    }
    uint64_t v6 = objc_msgSend((id)objc_msgSend(objc_getProperty((id)a1, v4, 8, 1), "_effectiveConfiguration"), "URLCache");
    if (!v6 || *(unsigned char *)(a1 + 90) || *(unsigned char *)(a1 + 91)) {
      goto LABEL_7;
    }
    uint64_t v7 = (id *)objc_msgSend(objc_getProperty((id)a1, v4, 8, 1), "session");
    uint64_t v9 = objc_msgSend(objc_getProperty((id)a1, v8, 8, 1), "currentRequest");
    if (v7)
    {
      uint64_t v7 = (id *)[v7[49] dataTaskWithRequest:v9];
      objc_msgSend(v7, "set_internalDelegate:", a1);
    }
    SEL v10 = v7;
    *(void *)(a1 + 80) = v10;
    objc_msgSend(v10, "set_cacheOnly:", 1);
    uint64_t v11 = *(void **)(a1 + 80);
    if (!v11)
    {
LABEL_7:
      [(__NSCFURLProxySessionConnection *)(void *)a1 _performOriginLoad];
    }
    else
    {
      [v11 resume];
    }
  }
}

- (void)_deliverDidCompleteWithError:(id *)a1
{
  if (a1)
  {
    v4 = a1;
    v5 = (void *)[a2 domain];
    uint64_t v6 = *MEMORY[0x1E4F289A0];
    if ([v5 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      if ([a2 code] == -997) {
        a2 = objc_msgSend(MEMORY[0x1E4F290A8], "_web_errorWithDomain:code:URL:", v6, -1005, objc_msgSend((id)objc_msgSend(objc_getProperty(a1, v7, 8, 1), "currentRequest"), "URL"));
      }
    }
    [a1[3] connection:a1 didFinishLoadingWithError:a2];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64____NSCFURLProxySessionConnection__deliverDidCompleteWithError___block_invoke;
    v8[3] = &unk_1E5258228;
    v8[4] = a1;
    -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)a1, (const char *)v8);
  }
}

- (void)_performOriginLoad
{
  id v3 = self[13];
  if ((v3 || (id v3 = (id)objc_msgSend(objc_getProperty(self, a2, 8, 1), "currentRequest")) != 0)
    && (CFArrayRef v4 = CFURLRequestCopyHTTPRequestBodyParts(v3)) != 0)
  {
    CFRelease(v4);
  }
  else if ([v3 HTTPBodyStream])
  {
    id v3 = (id)[v3 mutableCopy];
    +[NSURLProtocol setProperty:MEMORY[0x1E4F1CC38] forKey:@"_kCFNetworkProxySessionNeedsNewBodyStreamSignal" inRequest:v3];
  }
  uint64_t v6 = objc_msgSend(objc_getProperty(self, v5, 8, 1), "session");
  uint64_t v8 = objc_msgSend(objc_getProperty(self, v7, 8, 1), "_uniqueIdentifier");
  if (v6)
  {
    uint64_t v9 = (void *)[*(id *)(v6 + 376) dataTaskWithRequest:v3 uniqueIdentifier:v8];
    objc_msgSend(v9, "set_internalDelegate:", self);
  }
  else
  {
    uint64_t v9 = 0;
  }
  self[9] = v9;
  id Property = objc_getProperty(self, v10, 8, 1);
  SEL v12 = (void *)self[9];
  if ([Property _authenticatorConfiguredViaTaskProperty])
  {
    objc_msgSend(v12, "set_authenticatorConfiguredViaTaskProperty:", 1);
    objc_msgSend(v12, "setAuthenticator:", objc_msgSend(Property, "authenticator"));
  }
  if ([Property countOfBytesClientExpectsToSend] != -1) {
    objc_msgSend(v12, "setCountOfBytesClientExpectsToSend:", objc_msgSend(Property, "countOfBytesClientExpectsToSend"));
  }
  if ([Property countOfBytesClientExpectsToReceive] != -1) {
    objc_msgSend(v12, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(Property, "countOfBytesClientExpectsToReceive"));
  }
  [Property _timeoutIntervalForResource];
  if (v13 != 0.0)
  {
    [Property _timeoutIntervalForResource];
    objc_msgSend(v12, "set_timeoutIntervalForResource:");
  }
  if ([Property _preconnect]) {
    objc_msgSend(v12, "set_preconnect:", 1);
  }
  if ([Property _effectiveConfiguration]) {
    objc_msgSend(v12, "_adoptEffectiveConfiguration:", objc_msgSend(Property, "_effectiveConfiguration"));
  }
  objc_msgSend(v12, "set_siteForCookies:", objc_msgSend(Property, "_siteForCookies"));
  objc_msgSend(v12, "set_isTopLevelNavigation:", objc_msgSend(Property, "_isTopLevelNavigation"));
  v15 = (void *)self[9];
  if (v15)
  {
    [v15 resume];
  }
  else
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F290A8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1009, objc_msgSend((id)objc_msgSend(objc_getProperty(self, v14, 8, 1), "currentRequest"), "URL"));
    -[__NSCFURLProxySessionConnection _deliverDidCompleteWithError:]((id *)self, v16);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  self->_handledNeedNewBodyStream = 1;
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "originalRequest", a3), "HTTPBodyStream");
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    if (![v8 streamStatus])
    {
      uint64_t v11 = (void (*)(id, uint64_t))*((void *)a5 + 2);
      id v12 = a5;
      uint64_t v10 = v9;
      goto LABEL_9;
    }
  }
  if (self->_originalUploadFilePath)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA10], "inputStreamWithFileAtPath:");
    uint64_t v11 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    id v12 = a5;
LABEL_9:
    v11(v12, v10);
    return;
  }
  delegate = self->super._delegate;
  uint64_t v14 = [a4 currentRequest];

  [(__NSCFURLSessionConnectionDelegate *)delegate connection:self request:v14 needsNewBodyStreamCallback:a5];
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  delegate = self->super._delegate;
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithLongLong:", a5, a4);
  uint64_t v12 = [NSNumber numberWithLongLong:a6];
  uint64_t v13 = [NSNumber numberWithLongLong:a7];

  [(__NSCFURLSessionConnectionDelegate *)delegate connection:self sentBodyBytes:v11 totalBytes:v12 expectedBytes:v13];
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
}

- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = objc_msgSend(a5, "_createDispatchData", a3, a4);
  -[__NSCFURLSessionConnection _appendDataToCache:]((uint64_t)self, v8);
  [(__NSCFURLSessionConnectionDelegate *)self->super._delegate connection:self didReceiveData:v8 completion:a6];

  dispatch_release(v8);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v7 = a5;
  if (self->_cachedResponseForConditionalRequest && objc_msgSend(a5, "statusCode", a3, a4) == 304)
  {
    uint64_t v9 = [v7 allHeaderFields];
    if (v9)
    {
      CFDictionaryRef v10 = (const __CFDictionary *)v9;
      uint64_t v11 = [(NSCachedURLResponse *)self->_cachedResponseForConditionalRequest response];
      uint64_t v12 = (uint64_t)[(NSURLResponse *)v11 _inner][88];
      if (v12) {
        uint64_t v13 = (unsigned char *)(v12 - 16);
      }
      else {
        uint64_t v13 = 0;
      }
      CFHTTPMessageRef Copy = CFHTTPMessageCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFHTTPMessageRef)v13);
      _CFHTTPMessageSetMultipleHeaderFields(Copy, v10);
      if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
        dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
      }
      if (v12) {
        v15 = (HTTPMessage *)(v13 + 16);
      }
      else {
        v15 = 0;
      }
      CFStringRef v16 = HTTPMessage::copyHeaderFieldValue(v15, 0x121192ECu);
      if (v12)
      {
        if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
          dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
        }
        if (v13[40]) {
          uint64_t v17 = (HTTPMessage *)(v13 + 16);
        }
        else {
          uint64_t v17 = 0;
        }
      }
      else
      {
        uint64_t v17 = 0;
      }
      CFStringRef HeaderFieldValue = HTTPMessage::copyLastHeaderFieldValue(v17, 0x11F1D2DBu);
      if (v16)
      {
        if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
          dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
        }
        HTTPMessage::setHeaderFieldStringValue((CFHTTPMessageRef)((char *)Copy + 16), 0x121192ECu, v16);
        CFRelease(v16);
      }
      if (HeaderFieldValue)
      {
        if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
          dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
        }
        HTTPMessage::setHeaderFieldStringValue((CFHTTPMessageRef)((char *)Copy + 16), 0x11F1D2DBu, HeaderFieldValue);
        CFRelease(HeaderFieldValue);
      }
      v19 = (const void *)[(NSURLResponse *)v11 _inner][8];
      uint64_t v20 = [(NSURLResponse *)v11 _inner];
      id v21 = CFURLResponseCreateWithHTTPResponse(v20, v19, (uint64_t)Copy, *(_DWORD *)(v20 + 72));
      MIMEType = URLResponse::getMIMEType([(NSURLResponse *)v11 _inner]);
      CFURLResponseSetMIMEType(v21, MIMEType);
      id v7 = +[NSURLResponse _responseWithCFURLResponse:v21];
      CFRelease(v21);
      CFRelease(Copy);
    }
    self->_cachedResponseDataArray = (NSArray *)[(NSCachedURLResponse *)self->_cachedResponseForConditionalRequest dataArray];
  }

  self->_cachedResponseForConditionalRequest = 0;
  self->_conditionalRequest = 0;
  uint64_t v23 = [v7 expectedContentLength];
  int v24 = *(_DWORD *)([v7 _inner] + 72);
  uint64_t v25 = *(void *)([v7 _inner] + 88);
  if ((!v25 || (*(_WORD *)(v25 + 297) & 0x8000) == 0) && v24 != 2) {
    -[__NSCFURLSessionConnection _setupForCache:expectedLength:response:]((uint64_t)self, v23, v7);
  }
  delegate = self->super._delegate;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __92____NSCFURLProxySessionConnection_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v27[3] = &unk_1E52582A0;
  v27[4] = self;
  v27[5] = a6;
  [(__NSCFURLSessionConnectionDelegate *)delegate connection:self didReceiveResponse:v7 completion:v27];
}

- (void)setTLSMaximumSupportedProtocolVersion:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73____NSCFURLProxySessionConnection_setTLSMaximumSupportedProtocolVersion___block_invoke;
  v3[3] = &unk_1E5258278;
  v3[4] = self;
  unsigned __int16 v4 = a3;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v3);
}

- (void)setTLSMinimumSupportedProtocolVersion:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73____NSCFURLProxySessionConnection_setTLSMinimumSupportedProtocolVersion___block_invoke;
  v3[3] = &unk_1E5258278;
  v3[4] = self;
  unsigned __int16 v4 = a3;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v3);
}

- (void)expectedProgressTargetChanged
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64____NSCFURLProxySessionConnection_expectedProgressTargetChanged__block_invoke;
  v2[3] = &unk_1E5258228;
  v2[4] = self;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v2);
}

- (void)setPoolPriority:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51____NSCFURLProxySessionConnection_setPoolPriority___block_invoke;
  v3[3] = &unk_1E5258250;
  v3[4] = self;
  void v3[5] = a3;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v3);
}

- (void)resume
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41____NSCFURLProxySessionConnection_resume__block_invoke;
  v2[3] = &unk_1E5258228;
  v2[4] = self;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v2);
}

- (void)suspend
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42____NSCFURLProxySessionConnection_suspend__block_invoke;
  v2[3] = &unk_1E5258228;
  v2[4] = self;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v2);
}

- (void)cancel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41____NSCFURLProxySessionConnection_cancel__block_invoke;
  v2[3] = &unk_1E5258228;
  v2[4] = self;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)__NSCFURLProxySessionConnection;
  [(__NSCFURLSessionConnection *)&v3 dealloc];
}

- (__NSCFURLProxySessionConnection)initWithTask:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  v19.receiver = self;
  v19.super_class = (Class)__NSCFURLProxySessionConnection;
  uint64_t v6 = [(__NSCFURLSessionConnection *)&v19 initWithTask:a3 delegate:a4 delegateQueue:a5];
  if (!v6) {
    return v6;
  }
  id v7 = (void *)[a3 currentRequest];
  if (v7)
  {
    uint64_t v8 = v7;
    CFArrayRef v9 = CFURLRequestCopyHTTPRequestBodyParts(v7);
    if (v9)
    {
      CFArrayRef v10 = v9;
      uint64_t v11 = (void *)[v8 mutableCopy];
      uint64_t v12 = [v11 valueForHTTPHeaderField:0x1EC0A20E0];
      URLRequest::_setHTTPBodyParts((URLRequest *)[v11 _inner], 0, 0);
      if (v12) {
        [v11 setValue:v12 forHTTPHeaderField:0x1EC0A20E0];
      }
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v10, 0);
      CFTypeID v14 = CFGetTypeID(ValueAtIndex);
      if (v14 == CFStringGetTypeID())
      {
        v6->_originalUploadFilePath = (NSString *)ValueAtIndex;
        objc_msgSend(v11, "setHTTPBodyStream:", objc_msgSend(MEMORY[0x1E4F1CA10], "inputStreamWithFileAtPath:", ValueAtIndex));
      }
      else
      {
        CFTypeID v15 = CFGetTypeID(ValueAtIndex);
        if (v15 == CFDataGetTypeID()) {
          [v11 setHTTPBody:ValueAtIndex];
        }
      }
      [a3 setCurrentRequest:v11];

      CFRelease(v10);
      goto LABEL_16;
    }
  }
  if (objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "HTTPBody")
    || objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "HTTPBodyStream")
    || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "HTTPMethod"), "isEqualToString:", @"HEAD") & 1) == 0&& (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "HTTPMethod"), "isEqualToString:", @"GET") & 1) == 0)
  {
LABEL_16:
    v6->_requestIsUncacheable = 1;
  }
  if ([a3 _cachePolicy] == 3) {
    char v16 = 1;
  }
  else {
    char v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "valueForHTTPHeaderField:", @"Cache-Control"), "isEqualToString:", @"only-if-cached");
  }
  v6->_clientWantsCacheOnly = v16;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71____NSCFURLProxySessionConnection_initWithTask_delegate_delegateQueue___block_invoke;
  v18[3] = &unk_1E5258228;
  v18[4] = v6;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)v6, (const char *)v18);
  return v6;
}

@end