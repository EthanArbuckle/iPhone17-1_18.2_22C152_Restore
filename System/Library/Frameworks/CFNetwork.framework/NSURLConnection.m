@interface NSURLConnection
+ (BOOL)_collectsTimingData;
+ (BOOL)canHandleRequest:(NSURLRequest *)request;
+ (NSData)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse *)response error:(NSError *)error;
+ (NSURLConnection)connectionWithRequest:(NSURLRequest *)request delegate:(id)delegate;
+ (__CFRunLoop)resourceLoaderRunLoop;
+ (unint64_t)_sweeperInterval;
+ (unint64_t)_timingDataOptions;
+ (void)_collectTimingDataWithOptions:(unint64_t)a3;
+ (void)_setCollectsTimingData:(BOOL)a3;
+ (void)_setLoaderThreadPriority:(int)a3;
+ (void)_setMIMETypesWithNoSizeLimit:(id)a3;
+ (void)sendAsynchronousRequest:(NSURLRequest *)request queue:(NSOperationQueue *)queue completionHandler:(void *)handler;
- (BOOL)defersCallbacks;
- (NSString)description;
- (NSURLConnection)initWithRequest:(NSURLRequest *)request delegate:(id)delegate;
- (NSURLConnection)initWithRequest:(NSURLRequest *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately;
- (NSURLRequest)currentRequest;
- (NSURLRequest)originalRequest;
- (id)_cfInternal;
- (id)_initWithRequest:(id)a3 delegate:(id)a4 usesCache:(BOOL)a5 maxContentLength:(int64_t)a6 startImmediately:(BOOL)a7 connectionProperties:(id)a8;
- (id)_timingData;
- (id)connectionProperties;
- (void)_resumeLoading;
- (void)_suspendLoading;
- (void)cancel;
- (void)cancelAuthenticationChallenge:(id)a3;
- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3;
- (void)dealloc;
- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3;
- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3;
- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode;
- (void)setDefersCallbacks:(BOOL)a3;
- (void)setDelegateQueue:(NSOperationQueue *)queue;
- (void)start;
- (void)unscheduleFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode;
- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4;
@end

@implementation NSURLConnection

+ (BOOL)_collectsTimingData
{
  return _timingDataCollection;
}

+ (__CFRunLoop)resourceLoaderRunLoop
{
  if (+[NSURLConnection(Loader) resourceLoaderRunLoop]::sOnce != -1) {
    dispatch_once(&+[NSURLConnection(Loader) resourceLoaderRunLoop]::sOnce, &__block_literal_global_4870);
  }
  return (__CFRunLoop *)+[NSURLConnection(Loader) resourceLoaderRunLoop]::sLoadRunLoop;
}

CFTypeRef __48__NSURLConnection_Loader__resourceLoaderRunLoop__block_invoke()
{
  CFTypeRef result = CoreSchedulingSet::createNewPrivateRunLoopThread((uint64_t)"com.apple.NSURLConnectionLoader", (uint64_t)&__block_literal_global_19_4873, &__block_literal_global_22_4874);
  +[NSURLConnection(Loader) resourceLoaderRunLoop]::sLoadRunLoop = (uint64_t)result;
  return result;
}

uint64_t __48__NSURLConnection_Loader__resourceLoaderRunLoop__block_invoke_3()
{
  *(_DWORD *)v2.__opaque = 0;
  v2.sched_priority = _loaderThreadPriority;
  v0 = pthread_self();
  uint64_t result = pthread_setschedparam(v0, 1, &v2);
  if (result == -1)
  {
    NSLog(&cfstr_FatalFailedToC.isa);
    abort();
  }
  return result;
}

- (void)_resumeLoading
{
}

- (void)_suspendLoading
{
}

- (id)_cfInternal
{
  if (objc_opt_isKindOfClass()) {
    return self->_internal;
  }
  else {
    return 0;
  }
}

- (BOOL)defersCallbacks
{
  return 0;
}

- (void)setDefersCallbacks:(BOOL)a3
{
  internal = self->_internal;
  if (a3) {
    [(NSURLConnectionInternal *)internal _suspendLoading];
  }
  else {
    [(NSURLConnectionInternal *)internal _resumeLoading];
  }
}

- (id)connectionProperties
{
  internal = self->_internal;
  if (internal) {
    return internal->_connectionProperties;
  }
  else {
    return 0;
  }
}

- (NSURLRequest)currentRequest
{
  internal = self->_internal;
  if (internal) {
    return internal->_currentRequest;
  }
  else {
    return 0;
  }
}

- (NSURLRequest)originalRequest
{
  internal = self->_internal;
  if (internal) {
    return internal->_originalRequest;
  }
  else {
    return 0;
  }
}

- (void)unscheduleFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
}

- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
}

- (void)cancel
{
}

- (void)start
{
}

- (void)setDelegateQueue:(NSOperationQueue *)queue
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLConnection;
  [(NSURLConnection *)&v3 dealloc];
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLConnection;
  return [(NSString *)[(NSURLConnection *)&v3 description] stringByAppendingFormat:@" { request: %@ }", [(NSURLConnection *)self originalRequest]];
}

- (NSURLConnection)initWithRequest:(NSURLRequest *)request delegate:(id)delegate
{
  return (NSURLConnection *)[(NSURLConnection *)self _initWithRequest:request delegate:delegate usesCache:1 maxContentLength:0 startImmediately:1 connectionProperties:0];
}

- (NSURLConnection)initWithRequest:(NSURLRequest *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately
{
  return (NSURLConnection *)[(NSURLConnection *)self _initWithRequest:request delegate:delegate usesCache:1 maxContentLength:0 startImmediately:startImmediately connectionProperties:0];
}

+ (unint64_t)_sweeperInterval
{
  return 0;
}

+ (BOOL)canHandleRequest:(NSURLRequest *)request
{
  return +[NSURLProtocol _protocolClassForRequest:request skipAppSSO:1] != 0;
}

+ (void)sendAsynchronousRequest:(NSURLRequest *)request queue:(NSOperationQueue *)queue completionHandler:(void *)handler
{
  *(void *)&v15.var4 = 1;
  v15.var5 = 0;
  v15.var0 = 0;
  *(_OWORD *)&v15.var2 = 0u;
  v15.var1 = request;
  v8 = createCFRequest(&v15);
  if (v8)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke_2;
    v13[3] = &unk_1E5253D00;
    v13[5] = request;
    v13[6] = handler;
    v13[4] = queue;
    CFAllocatorRef v10 = CFGetAllocator(v8);
    v11 = CFAllocatorAllocate(v10, 72, 0);
    _OWORD *v11 = 0u;
    v11[1] = 0u;
    v11[2] = 0u;
    v11[3] = 0u;
    *((void *)v11 + 8) = 0;
    v12 = SyncClient::SyncClient((CFAllocatedReferenceCountedObject *)v11, v10, v8, global_queue, v13);
    CFURLConnectionStart(*((void *)v12 + 3));
    (*(void (**)(_OWORD *))(*(void *)v11 + 48))(v11);
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke;
    v14[3] = &unk_1E5258028;
    v14[4] = request;
    v14[5] = handler;
    [(NSOperationQueue *)queue addOperationWithBlock:v14];
  }
  CFRelease(v8);
}

uint64_t __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
    (id)objc_msgSend(v2, "_web_initWithDomain_nowarn:code:URL:", *MEMORY[0x1E4F28798], 12, objc_msgSend(*(id *)(v1 + 32), "URL"));
    objc_super v3 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v3();
  }
  return result;
}

uint64_t __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke_2(uint64_t a1, CFTypeRef cf, CFTypeRef a3, CFTypeRef a4)
{
  if (cf) {
    CFRetain(cf);
  }
  if (a4) {
    CFRetain(a4);
  }
  if (a3) {
    CFRetain(a3);
  }
  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke_3;
  v10[3] = &unk_1E5257350;
  CFTypeRef v12 = a3;
  CFTypeRef v13 = a4;
  long long v11 = *(_OWORD *)(a1 + 40);
  CFTypeRef v14 = cf;
  return [v8 addOperationWithBlock:v10];
}

void __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = (void *)MEMORY[0x18531D6D0]();
    if (*(void *)(a1 + 48)) {
      +[NSURLResponse _responseWithCFURLResponse:](NSURLResponse, "_responseWithCFURLResponse:");
    }
    objc_super v3 = *(__CFError **)(a1 + 56);
    if (v3) {
      cfnTranslateCFError(v3, (void *)[*(id *)(a1 + 32) URL]);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  v4 = *(const void **)(a1 + 64);
  if (v4) {
    CFRelease(v4);
  }
  v5 = *(const void **)(a1 + 56);
  if (v5) {
    CFRelease(v5);
  }
  v6 = *(const void **)(a1 + 48);
  if (v6)
  {
    CFRelease(v6);
  }
}

+ (NSData)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse *)response error:(NSError *)error
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (__CFNProcessIsApplication::onceToken != -1) {
      dispatch_once(&__CFNProcessIsApplication::onceToken, &__block_literal_global_28_5560);
    }
    if (__CFNProcessIsApplication::result)
    {
      v8 = [[(NSURLRequest *)request URL] scheme];
      if (v8)
      {
        v9 = v8;
        if ([(NSString *)v8 caseInsensitiveCompare:@"https"] == NSOrderedSame
          || [(NSString *)v9 caseInsensitiveCompare:@"http"] == NSOrderedSame
          || [(NSString *)v9 caseInsensitiveCompare:@"ftp"] == NSOrderedSame)
        {
          if (__CFNPerformanceDiagnosticRuntimeIssuesLogHandle::onceToken != -1) {
            dispatch_once(&__CFNPerformanceDiagnosticRuntimeIssuesLogHandle::onceToken, &__block_literal_global_13_5526);
          }
          CFAllocatorRef v10 = __CFNPerformanceDiagnosticRuntimeIssuesLogHandle::logger;
          if (os_log_type_enabled((os_log_t)__CFNPerformanceDiagnosticRuntimeIssuesLogHandle::logger, OS_LOG_TYPE_FAULT))
          {
            LODWORD(buf.var0) = 136315394;
            *(id *)((char *)&buf.var0 + 4) = "__delegate_identifier__:Performance Diagnostics__:::____message__:";
            WORD2(buf.var1) = 2112;
            *(id *)((char *)&buf.var1 + 6) = [(NSURLRequest *)request URL];
            _os_log_fault_impl(&dword_184085000, v10, OS_LOG_TYPE_FAULT, "%sSynchronous URL loading of %@ should not occur on this application's main thread as it may lead to UI unresponsiveness. Please switch to an asynchronous networking API such as URLSession.", (uint8_t *)&buf, 0x16u);
          }
        }
      }
    }
  }
  buf.var5 = 0;
  buf.var0 = 0;
  *(_OWORD *)&buf.var2 = 0u;
  buf.var1 = request;
  *(void *)&buf.var4 = 1;
  long long v11 = createCFRequest(&buf);
  if (!v11)
  {
    if (!error) {
      return 0;
    }
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    InternalInit v15 = 0;
    *error = (NSError *)(id)objc_msgSend(v17, "_web_initWithDomain_nowarn:code:URL:", *MEMORY[0x1E4F28798], 12, -[NSURLRequest URL](request, "URL"));
    return v15;
  }
  CFTypeRef v12 = v11;
  CFTypeRef v21 = 0;
  CFTypeRef cf = 0;
  if (response) {
    p_CFTypeRef cf = &cf;
  }
  else {
    p_CFTypeRef cf = 0;
  }
  if (error) {
    CFTypeRef v14 = &v21;
  }
  else {
    CFTypeRef v14 = 0;
  }
  InternalInit v15 = (NSData *)CFURLConnectionSendSynchronousRequest(v11, p_cf, v14, 86400.0);
  CFRelease(v12);
  if (!response)
  {
LABEL_23:
    if (error) {
      goto LABEL_24;
    }
    goto LABEL_33;
  }
  if (cf)
  {
    *response = (NSURLResponse *)+[NSURLResponse _responseWithCFURLResponse:](NSURLResponse, "_responseWithCFURLResponse:");
    CFRelease(cf);
    goto LABEL_23;
  }
  *response = 0;
  if (error)
  {
LABEL_24:
    if (v21)
    {
      v16 = (NSError *)cfnTranslateCFError((__CFError *)v21, [(NSURLRequest *)request URL]);
      *error = v16;
      if (v16 == v21) {
        v18 = v16;
      }
      else {
        CFRelease(v21);
      }
    }
  }
LABEL_33:
  if (v15)
  {
    CFMakeCollectable(v15);
    v19 = v15;
  }
  return v15;
}

+ (NSURLConnection)connectionWithRequest:(NSURLRequest *)request delegate:(id)delegate
{
  v4 = [[NSURLConnection alloc] initWithRequest:request delegate:delegate];

  return v4;
}

- (id)_timingData
{
  return [(NSURLConnectionInternal *)self->_internal _timingData];
}

- (id)_initWithRequest:(id)a3 delegate:(id)a4 usesCache:(BOOL)a5 maxContentLength:(int64_t)a6 startImmediately:(BOOL)a7 connectionProperties:(id)a8
{
  BOOL v9 = a7;
  if (!a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    LOWORD(v20[0]) = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "assertion failure", (uint8_t *)v20, 2u);
  }
  v21.receiver = self;
  v21.super_class = (Class)NSURLConnection;
  InternalInit v15 = [(NSURLConnection *)&v21 init];
  if (v15)
  {
    v16 = [NSURLConnectionInternalConnection alloc];
    v15->_internal = &v16->super;
    if (!v16) {
      goto LABEL_9;
    }
    v20[0] = v15;
    v20[1] = a3;
    v20[2] = a4;
    v20[3] = a8;
    v20[5] = a6;
    v20[4] = a5;
    uint64_t v17 = [(NSURLConnectionInternalConnection *)v16 initWithInfo:v20];
    v15->_internal = (NSURLConnectionInternal *)v17;
    if (v17)
    {
      if (v9)
      {
        uint64_t v18 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
        [(NSURLConnection *)v15 scheduleInRunLoop:v18 forMode:*MEMORY[0x1E4F1C3A0]];
        [(NSURLConnection *)v15 start];
      }
    }
    else
    {
LABEL_9:

      return 0;
    }
  }
  return v15;
}

- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3
{
}

- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3
{
}

- (void)cancelAuthenticationChallenge:(id)a3
{
}

- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3
{
}

- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4
{
}

+ (unint64_t)_timingDataOptions
{
  return _dataCollection;
}

+ (void)_collectTimingDataWithOptions:(unint64_t)a3
{
  _dataCollection = a3;
  [a1 _setCollectsTimingData:1];
}

+ (void)_setCollectsTimingData:(BOOL)a3
{
  _timingDataCollection = a3;
}

+ (void)_setLoaderThreadPriority:(int)a3
{
  _loaderThreadPriority = a3;
}

+ (void)_setMIMETypesWithNoSizeLimit:(id)a3
{
  if ((+[NSURLConnection(Deprecated) _setMIMETypesWithNoSizeLimit:]::sDidWarn & 1) == 0)
  {
    +[NSURLConnection(Deprecated) _setMIMETypesWithNoSizeLimit:]::sDidWarn = 1;
    NSLog(&cfstr_SDeprecated.isa, a2, a3, "+[NSURLConnection(Deprecated) _setMIMETypesWithNoSizeLimit:]");
  }
}

@end