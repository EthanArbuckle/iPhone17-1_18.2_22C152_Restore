@interface AVAssetCustomURLBridgeForNSURLProtocol
- (AVAssetCustomURLBridgeForNSURLProtocol)initWithFigAsset:(OpaqueFigAsset *)a3;
- (BOOL)_willSendRequest:(id)a3 request:(_CFURLRequest *)a4 redirectionResponse:(_CFURLResponse *)a5;
- (int)_handleRequest:(__CFDictionary *)a3 requestID:(unint64_t)a4;
- (void)_cancelAndFinishRequest:(id)a3 error:(__CFError *)a4;
- (void)_cancelPendingRequests;
- (void)_cancelRequestID:(unint64_t)a3;
- (void)_didFinish:(id)a3 error:(__CFError *)a4;
- (void)_didReceiveData:(id)a3 data:(__CFData *)a4;
- (void)_didReceiveResponse:(id)a3 response:(_CFURLResponse *)a4;
- (void)dealloc;
- (void)reportSuccessfulURLLoad;
@end

@implementation AVAssetCustomURLBridgeForNSURLProtocol

- (AVAssetCustomURLBridgeForNSURLProtocol)initWithFigAsset:(OpaqueFigAsset *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)AVAssetCustomURLBridgeForNSURLProtocol;
  CFTypeRef cf = 0;
  v4 = [(AVAssetCustomURLBridgeForNSURLProtocol *)&v18 init];
  if (!v4)
  {
    int v9 = 0;
    goto LABEL_16;
  }
  if (a3)
  {
    v4->_requestIDToDownload = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.customurl.cfurlconnection", v5);
    uint64_t CMBaseObject = FigAssetGetCMBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v8 = v7 ? v7 : 0;
    v10 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v8 + 48);
    if (v10)
    {
      int v11 = v10(CMBaseObject, *MEMORY[0x1E4F32208], *MEMORY[0x1E4F1CF80], &cf);
      if (v11)
      {
LABEL_14:
        int v9 = v11;
        goto LABEL_16;
      }
      CFTypeRef v12 = cf;
      callbackQueue = v4->_callbackQueue;
      uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v14) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
      v16 = *(uint64_t (**)(CFTypeRef, uint64_t, const char *, AVAssetCustomURLBridgeForNSURLProtocol *, OS_dispatch_queue *, void *, void, OpaqueFigCustomURLHandler **))(v15 + 16);
      if (v16)
      {
        int v11 = v16(v12, 100, "com.apple.avfoundation.customurl.cfurlconnection", v4, callbackQueue, &initWithFigAsset__sAVAssetCustomURLCallbacksForNSURLSession_223, 0, &v4->_handler);
        goto LABEL_14;
      }
    }
  }
  int v9 = -12780;
LABEL_16:
  if (cf) {
    CFRelease(cf);
  }
  if (v9)
  {

    return 0;
  }
  return v4;
}

- (void)reportSuccessfulURLLoad
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  uint64_t v3 = *MEMORY[0x1E4F1FBD8];
  uint64_t v4 = *MEMORY[0x1E4F1FBF8];
  v5.n128_u64[0] = 1.0;
  MEMORY[0x1F40DC7D8](v2, v3, v4, v5);
}

- (void)dealloc
{
  [(AVAssetCustomURLBridgeForNSURLProtocol *)self _cancelPendingRequests];

  callbackQueue = self->_callbackQueue;
  if (callbackQueue) {
    dispatch_release(callbackQueue);
  }
  handler = self->_handler;
  if (handler) {
    CFRelease(handler);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAssetCustomURLBridgeForNSURLProtocol;
  [(AVAssetCustomURLBridgeForNSURLProtocol *)&v5 dealloc];
}

- (void)_cancelPendingRequests
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-999 userInfo:0];
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_requestIDToDownload allValues];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(AVAssetCustomURLBridgeForNSURLProtocol *)self _cancelAndFinishRequest:*(void *)(*((void *)&v9 + 1) + 8 * v8++) error:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (int)_handleRequest:(__CFDictionary *)a3 requestID:(unint64_t)a4
{
  int v7 = FigCustomURLRequestInfoCopyURL();
  if (v7)
  {
    int v16 = v7;
    uint64_t v8 = 0;
    CFHTTPMessageRef Request = 0;
    CFStringRef v11 = 0;
LABEL_25:

    goto LABEL_16;
  }
  uint64_t v8 = [(AVAssetCustomURLRequest *)[AVNSURLProtocolRequest alloc] initWithRequest:a3 id:a4];
  if (!v8)
  {
    CFHTTPMessageRef Request = 0;
    goto LABEL_23;
  }
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFHTTPMessageRef Request = CFHTTPMessageCreateRequest((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"GET", 0, (CFStringRef)*MEMORY[0x1E4F18F90]);
  if (!Request)
  {
LABEL_23:
    CFStringRef v11 = 0;
    goto LABEL_24;
  }
  if (!FigCustomURLRequestInfoCopyHTTPHeaders()) {
    CFDictionaryApplyFunction(0, (CFDictionaryApplierFunction)SetHeaderFieldToCFHTTPMessageApplierFunc, Request);
  }
  if (!FigCustomURLRequestInfoCopyUserAgent()) {
    CFHTTPMessageSetHeaderFieldValue(Request, @"User-Agent", 0);
  }
  if (FigCustomURLRequestInfoGetByteRange())
  {
    CFStringRef v11 = 0;
  }
  else
  {
    CFStringRef v11 = CFStringCreateWithFormat(v9, 0, @"bytes=%llu-%llu", 0, -1);
    if (!v11)
    {
LABEL_24:
      int v16 = -12786;
      goto LABEL_25;
    }
    CFHTTPMessageSetHeaderFieldValue(Request, @"Range", v11);
  }
  CFURLGetBaseURL(0);
  HTTPCFHTTPMessageRef Request = CFURLRequestCreateHTTPRequest();
  if (!HTTPRequest) {
    goto LABEL_24;
  }
  v13 = (const void *)HTTPRequest;
  uint64_t v14 = CFURLConnectionCreate();
  if (v14)
  {
    uint64_t v15 = (const void *)v14;
    [(AVNSURLProtocolRequest *)v8 setConnection:v14];
    [(AVNSURLProtocolRequest *)v8 setBridge:self];
    -[NSMutableDictionary setObject:forKey:](self->_requestIDToDownload, "setObject:forKey:", v8, [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a4]);
    FigThreadGetGlobalNetworkBufferingRunloop();
    CFURLConnectionScheduleWithRunLoop();
    CFURLConnectionStart();

    CFRelease(v15);
    int v16 = 0;
  }
  else
  {

    int v16 = -12786;
  }
  CFRelease(v13);
LABEL_16:
  if (v11) {
    CFRelease(v11);
  }
  if (Request) {
    CFRelease(Request);
  }
  return v16;
}

- (void)_cancelRequestID:(unint64_t)a3
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_requestIDToDownload, "objectForKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:"));
  if (v5)
  {
    [v5 connection];
    CFURLConnectionCancel();
    requestIDToDownload = self->_requestIDToDownload;
    uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a3];
    [(NSMutableDictionary *)requestIDToDownload removeObjectForKey:v7];
  }
}

- (void)_cancelAndFinishRequest:(id)a3 error:(__CFError *)a4
{
  -[AVAssetCustomURLBridgeForNSURLProtocol _cancelRequestID:](self, "_cancelRequestID:", [a3 requestID]);
  handler = self->_handler;
  uint64_t v8 = [a3 requestID];
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  CFStringRef v11 = *(void (**)(OpaqueFigCustomURLHandler *, uint64_t, __CFError *, void))(v10 + 24);
  if (v11)
  {
    v11(handler, v8, a4, 0);
  }
}

- (void)_didFinish:(id)a3 error:(__CFError *)a4
{
  if (a4) {
    CFRetain(a4);
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AVAssetCustomURLBridgeForNSURLProtocol__didFinish_error___block_invoke;
  block[3] = &unk_1E57B2270;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(callbackQueue, block);
}

void __59__AVAssetCustomURLBridgeForNSURLProtocol__didFinish_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelAndFinishRequest:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  uint64_t v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (BOOL)_willSendRequest:(id)a3 request:(_CFURLRequest *)a4 redirectionResponse:(_CFURLResponse *)a5
{
  uint64_t URL = CFURLRequestGetURL();
  if (a5) {
    BOOL v10 = URL == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = !v10;
  if (!v10)
  {
    long long v12 = (const void *)URL;
    if (a4) {
      CFRetain(a4);
    }
    CFRetain(v12);
    callbackQueue = self->_callbackQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __87__AVAssetCustomURLBridgeForNSURLProtocol__willSendRequest_request_redirectionResponse___block_invoke;
    v15[3] = &unk_1E57B3CD0;
    v15[6] = v12;
    v15[7] = a4;
    v15[4] = self;
    v15[5] = a3;
    dispatch_async(callbackQueue, v15);
  }
  return v11;
}

void __87__AVAssetCustomURLBridgeForNSURLProtocol__willSendRequest_request_redirectionResponse___block_invoke(uint64_t a1)
{
  CFURLRef v2 = CFURLCopyAbsoluteURL(*(CFURLRef *)(a1 + 48));
  uint64_t v3 = (const void *)CFURLRequestCopyAllHTTPHeaderFields();
  objc_msgSend(*(id *)(a1 + 32), "_cancelRequestID:", objc_msgSend(*(id *)(a1 + 40), "requestID"));
  [*(id *)(a1 + 40) customURLRequest];
  if (!FigCustomURLResponseInfoCreateMutable()
    && !FigCustomURLResponseInfoSetHTTPStatusCode()
    && !FigCustomURLResponseInfoSetHTTPHeaders()
    && !FigCustomURLResponseInfoSetRedirectLocation()
    && !FigCustomURLResponseInfoSetRedirectRequestHeaders())
  {
    [*(id *)(a1 + 40) setCustomURLResponse:0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
    uint64_t v5 = [*(id *)(a1 + 40) requestID];
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v7 = v6 ? v6 : 0;
    uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, void))(v7 + 8);
    if (v8 && !v8(v4, v5, 0))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 16);
      uint64_t v10 = [*(id *)(a1 + 40) requestID];
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v12 = v11 ? v11 : 0;
      v13 = *(void (**)(uint64_t, uint64_t, void, void))(v12 + 24);
      if (v13) {
        v13(v9, v10, 0, 0);
      }
    }
  }
  if (v2) {
    CFRelease(v2);
  }
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v14 = *(const void **)(a1 + 56);
  if (v14) {
    CFRelease(v14);
  }
  uint64_t v15 = *(const void **)(a1 + 48);
  if (v15) {
    CFRelease(v15);
  }
}

- (void)_didReceiveResponse:(id)a3 response:(_CFURLResponse *)a4
{
  if (a4) {
    CFRetain(a4);
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__AVAssetCustomURLBridgeForNSURLProtocol__didReceiveResponse_response___block_invoke;
  block[3] = &unk_1E57B2270;
  block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(callbackQueue, block);
}

void __71__AVAssetCustomURLBridgeForNSURLProtocol__didReceiveResponse_response___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) customURLRequest];
  if (FigCustomURLResponseInfoCreateMutable()) {
    goto LABEL_29;
  }
  HTTPResponse = (__CFHTTPMessage *)CFURLResponseGetHTTPResponse();
  if (!HTTPResponse) {
    goto LABEL_20;
  }
  uint64_t v3 = HTTPResponse;
  unsigned __int8 v20 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  CFStringRef v4 = CFHTTPMessageCopyHeaderFieldValue(HTTPResponse, @"Content-Range");
  CFStringRef v5 = v4;
  if (v4)
  {
    if (avacu_getLengthsfromContentRange((uint64_t)v4, &v19, &v18, &v20))
    {
      char v6 = 1;
      goto LABEL_12;
    }
    uint64_t v7 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(v3, @"Content-Length");
    if (!v7)
    {
      char v6 = 0;
LABEL_12:
      CFRelease(v5);
      if ((v6 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v7 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(v3, @"Content-Length");
    if (!v7) {
      goto LABEL_16;
    }
  }
  uint64_t v18 = [(__CFString *)v7 longLongValue];
  uint64_t v19 = v18;
  char v6 = 1;
  unsigned __int8 v20 = 1;
  CFRelease(v7);
  if (v5) {
    goto LABEL_12;
  }
LABEL_13:
  int v8 = v20;
  if (FigCustomURLResponseInfoSetContentLength()
    || v8 && FigCustomURLResponseInfoSetResourceSize())
  {
    goto LABEL_29;
  }
LABEL_16:
  CFHTTPMessageGetResponseStatusCode(v3);
  if (!FigCustomURLResponseInfoSetHTTPStatusCode())
  {
    CFDictionaryRef v9 = CFHTTPMessageCopyAllHeaderFields(v3);
    int v10 = FigCustomURLResponseInfoSetHTTPHeaders();
    if (v9) {
      CFRelease(v9);
    }
    if (!v10)
    {
LABEL_20:
      if (!FigCustomURLResponseInfoSetIsCachingDisabled())
      {
        MIMEType = (void *)CFURLResponseGetMIMEType();
        if (![MIMEType length]
          || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F442D8], "typeWithMIMEType:", MIMEType), "identifier"),
              !FigCustomURLResponseInfoSetUniversalTypeIdentifier()))
        {
          uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 16);
          uint64_t v13 = [*(id *)(a1 + 32) requestID];
          uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
          uint64_t v15 = v14 ? v14 : 0;
          int v16 = *(unsigned int (**)(uint64_t, uint64_t, void))(v15 + 8);
          if (v16)
          {
            if (!v16(v12, v13, 0)) {
              [*(id *)(a1 + 32) setCustomURLResponse:0];
            }
          }
        }
      }
    }
  }
LABEL_29:
  v17 = *(const void **)(a1 + 48);
  if (v17) {
    CFRelease(v17);
  }
}

- (void)_didReceiveData:(id)a3 data:(__CFData *)a4
{
  if (a4) {
    CFRetain(a4);
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AVAssetCustomURLBridgeForNSURLProtocol__didReceiveData_data___block_invoke;
  block[3] = &unk_1E57B2270;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __63__AVAssetCustomURLBridgeForNSURLProtocol__didReceiveData_data___block_invoke(uint64_t a1)
{
  if (!FigCreateBlockBufferWithCFDataNoCopy())
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
    uint64_t v3 = [*(id *)(a1 + 40) requestID];
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v5 = v4 ? v4 : 0;
    char v6 = *(void (**)(uint64_t, uint64_t, void))(v5 + 16);
    if (v6) {
      v6(v2, v3, 0);
    }
  }
  uint64_t v7 = *(const void **)(a1 + 48);
  if (v7) {
    CFRelease(v7);
  }
}

@end