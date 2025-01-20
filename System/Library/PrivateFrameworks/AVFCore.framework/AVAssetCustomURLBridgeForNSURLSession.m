@interface AVAssetCustomURLBridgeForNSURLSession
- (AVAssetCustomURLBridgeForNSURLSession)init;
- (AVAssetCustomURLBridgeForNSURLSession)initWithFigAsset:(OpaqueFigAsset *)a3;
- (NSURLSession)session;
- (id)_lookupRequestForDataTask:(id)a3;
- (int)_cancelRequestID:(unint64_t)a3;
- (int)_handleRequest:(__CFDictionary *)a3 requestID:(unint64_t)a4 canHandleRequestOut:(BOOL *)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)_registerRequest:(__CFDictionary *)a3 id:(unint64_t)a4 forDataTask:(id)a5;
- (void)_unregisterRequestForDataTask:(id)a3;
- (void)dealloc;
- (void)setSession:(id)a3;
@end

@implementation AVAssetCustomURLBridgeForNSURLSession

- (void)_registerRequest:(__CFDictionary *)a3 id:(unint64_t)a4 forDataTask:(id)a5
{
  taskToRequest = self->_taskToRequest;
  v7 = +[AVAssetCustomURLRequest requestWithRequest:a3 id:a4];
  [(NSMutableDictionary *)taskToRequest setObject:v7 forKey:a5];
}

- (void)_unregisterRequestForDataTask:(id)a3
{
}

- (id)_lookupRequestForDataTask:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_taskToRequest objectForKey:a3];
}

- (int)_handleRequest:(__CFDictionary *)a3 requestID:(unint64_t)a4 canHandleRequestOut:(BOOL *)a5
{
  uint64_t v30 = 0;
  id v31 = 0;
  id v28 = 0;
  uint64_t v29 = 0;
  char v27 = 0;
  if (![(AVAssetCustomURLBridgeForNSURLSession *)self session]) {
    goto LABEL_25;
  }
  int v9 = FigCustomURLRequestInfoCopyURL();
  if (v9)
  {
    int v20 = v9;
    goto LABEL_23;
  }
  FigCustomURLRequestInfoGetIsPingRequest();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __86__AVAssetCustomURLBridgeForNSURLSession__handleRequest_requestID_canHandleRequestOut___block_invoke;
  v26[3] = &unk_1E57B5F10;
  v26[4] = v31;
  if ([&unk_1EE5E1B00 indexOfObjectPassingTest:v26] == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_25:
    BOOL v21 = 0;
    int v20 = 0;
    goto LABEL_24;
  }
  if (!v27)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F18D50]);
    id v15 = (id)[v14 initWithURL:v31];
    if (!v15) {
      goto LABEL_27;
    }
    v16 = v15;
    [v15 setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    [v16 setValue:@"identity" forHTTPHeaderField:@"Accept-Encoding"];
    [v16 setValue:@"Keep-Alive" forHTTPHeaderField:@"Connection"];
    if (!FigCustomURLRequestInfoCopyHTTPHeaders())
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __86__AVAssetCustomURLBridgeForNSURLSession__handleRequest_requestID_canHandleRequestOut___block_invoke_3;
      v24[3] = &unk_1E57B41C8;
      v24[4] = v16;
      [v28 enumerateKeysAndObjectsUsingBlock:v24];
    }
    if (!FigCustomURLRequestInfoGetByteRange())
    {
      if ((unint64_t)(v29 - 0x7FFFFFFFFFFFFFFFLL) > 0x8000000000000001) {
        uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%llu-%llu", v30, v29 + v30 - 1);
      }
      else {
        uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%llu-", v30, v23);
      }
      [v16 setValue:v17 forHTTPHeaderField:@"Range"];
    }
    v18 = [[(AVAssetCustomURLBridgeForNSURLSession *)self session] dataTaskWithRequest:v16];
    if (!v18)
    {
LABEL_27:
      int v20 = -12786;
      goto LABEL_23;
    }
    v19 = v18;
    [(AVAssetCustomURLBridgeForNSURLSession *)self _registerRequest:a3 id:a4 forDataTask:v18];
    [(NSURLSessionDataTask *)v19 resume];
    goto LABEL_22;
  }
  [(AVAssetCustomURLBridgeForNSURLSession *)self session];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v31 absoluteURL];
    handler = self->_handler;
    if (handler)
    {
      CFTypeRef v12 = CFRetain(handler);
      if (!a3)
      {
LABEL_9:
        v13 = [(AVAssetCustomURLBridgeForNSURLSession *)self session];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __86__AVAssetCustomURLBridgeForNSURLSession__handleRequest_requestID_canHandleRequestOut___block_invoke_2;
        v25[3] = &__block_descriptor_56_e20_v24__0__NSError_8d16l;
        v25[4] = a3;
        v25[5] = v12;
        v25[6] = a4;
        [(NSURLSession *)v13 sendH2Ping:v10 pongHandler:v25];
        goto LABEL_22;
      }
    }
    else
    {
      CFTypeRef v12 = 0;
      if (!a3) {
        goto LABEL_9;
      }
    }
    CFRetain(a3);
    goto LABEL_9;
  }
LABEL_22:
  int v20 = 0;
LABEL_23:
  BOOL v21 = 1;
LABEL_24:

  *a5 = v21;
  return v20;
}

BOOL __86__AVAssetCustomURLBridgeForNSURLSession__handleRequest_requestID_canHandleRequestOut___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "scheme"), "caseInsensitiveCompare:", a2) == 0;
}

void __86__AVAssetCustomURLBridgeForNSURLSession__handleRequest_requestID_canHandleRequestOut___block_invoke_2(void *a1, uint64_t a2)
{
  if (!FigCustomURLResponseInfoCreateMutable()
    && !FigCustomURLResponseInfoSetRoundTripTime())
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v7 = v6 ? v6 : 0;
    v8 = *(unsigned int (**)(uint64_t, uint64_t, void))(v7 + 8);
    if (v8 && !v8(v4, v5, 0))
    {
      uint64_t v9 = a1[5];
      uint64_t v10 = a1[6];
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v12 = v11 ? v11 : 0;
      v13 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(v12 + 24);
      if (v13) {
        v13(v9, v10, a2, 0);
      }
    }
  }
  id v14 = (const void *)a1[4];
  if (v14) {
    CFRelease(v14);
  }
  id v15 = (const void *)a1[5];
  if (v15) {
    CFRelease(v15);
  }
}

uint64_t __86__AVAssetCustomURLBridgeForNSURLSession__handleRequest_requestID_canHandleRequestOut___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (int)_cancelRequestID:(unint64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__23;
  uint64_t v11 = __Block_byref_object_dispose__23;
  uint64_t v12 = 0;
  taskToRequest = self->_taskToRequest;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__AVAssetCustomURLBridgeForNSURLSession__cancelRequestID___block_invoke;
  v6[3] = &unk_1E57B5F58;
  v6[4] = &v7;
  v6[5] = a3;
  [(NSMutableDictionary *)taskToRequest enumerateKeysAndObjectsUsingBlock:v6];
  if (v8[5]) {
    -[AVAssetCustomURLBridgeForNSURLSession _unregisterRequestForDataTask:](self, "_unregisterRequestForDataTask:");
  }
  _Block_object_dispose(&v7, 8);
  return 0;
}

uint64_t __58__AVAssetCustomURLBridgeForNSURLSession__cancelRequestID___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 requestID];
  if (result == *(void *)(a1 + 40))
  {
    uint64_t result = [a2 cancel];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__AVAssetCustomURLBridgeForNSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v7[3] = &unk_1E57B5F80;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a5;
  v7[7] = a6;
  dispatch_async(callbackQueue, v7);
}

void __98__AVAssetCustomURLBridgeForNSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _lookupRequestForDataTask:*(void *)(a1 + 40)];
  if (!v2) {
    goto LABEL_23;
  }
  v3 = v2;
  [v2 customURLRequest];
  int Mutable = FigCustomURLResponseInfoCreateMutable();
  if (Mutable) {
    goto LABEL_24;
  }
  [v3 setCustomURLResponse:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 48) statusCode];
    int Mutable = FigCustomURLResponseInfoSetHTTPStatusCode();
    if (Mutable) {
      goto LABEL_24;
    }
    uint64_t v5 = *(void **)(a1 + 48);
    unsigned __int8 v17 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "allHeaderFields"), "valueForKey:", @"Content-Range");
    if (v6 && (avacu_getLengthsfromContentRange(v6, &v16, &v15, &v17) & 1) != 0)
    {
      int v7 = v17;
    }
    else
    {
      if ([v5 expectedContentLength] < 0) {
        goto LABEL_13;
      }
      int v7 = 1;
    }
    int Mutable = FigCustomURLResponseInfoSetContentLength();
    if (Mutable) {
      goto LABEL_24;
    }
    if (v7)
    {
      int Mutable = FigCustomURLResponseInfoSetResourceSize();
      if (Mutable) {
        goto LABEL_24;
      }
    }
LABEL_13:
    [*(id *)(a1 + 48) allHeaderFields];
    int Mutable = FigCustomURLResponseInfoSetHTTPHeaders();
    if (Mutable) {
      goto LABEL_24;
    }
  }
  [*(id *)(a1 + 48) URL];
  int Mutable = FigCustomURLResponseInfoSetFinalURL();
  if (Mutable) {
    goto LABEL_24;
  }
  int Mutable = FigCustomURLResponseInfoSetIsCachingDisabled();
  if (Mutable) {
    goto LABEL_24;
  }
  v8 = (void *)[*(id *)(a1 + 48) MIMEType];
  if ([v8 length])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F442D8], "typeWithMIMEType:", v8), "identifier");
    int Mutable = FigCustomURLResponseInfoSetUniversalTypeIdentifier();
    if (Mutable) {
      goto LABEL_24;
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v10 = [v3 requestID];
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = *(uint64_t (**)(uint64_t, uint64_t, void))(v12 + 8);
  if (v13)
  {
    int Mutable = v13(v9, v10, 0);
    goto LABEL_24;
  }
LABEL_23:
  int Mutable = -111;
LABEL_24:
  uint64_t v14 = *(void *)(a1 + 56);
  if (v14) {
    (*(void (**)(void, BOOL))(v14 + 16))(*(void *)(a1 + 56), Mutable == 0);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AVAssetCustomURLBridgeForNSURLSession_URLSession_dataTask_didReceiveData___block_invoke;
  block[3] = &unk_1E57B2138;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(callbackQueue, block);
}

void __76__AVAssetCustomURLBridgeForNSURLSession_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _lookupRequestForDataTask:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = (void *)v2;
    if (!FigCreateBlockBufferWithCFDataNoCopy())
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24);
      uint64_t v5 = [v3 requestID];
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      v8 = *(void (**)(uint64_t, uint64_t, void))(v7 + 16);
      if (v8) {
        v8(v4, v5, 0);
      }
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__AVAssetCustomURLBridgeForNSURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke;
  block[3] = &unk_1E57B2138;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(callbackQueue, block);
}

uint64_t __84__AVAssetCustomURLBridgeForNSURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _lookupRequestForDataTask:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 setMetrics:v3];
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__AVAssetCustomURLBridgeForNSURLSession_URLSession_task_didCompleteWithError___block_invoke;
  block[3] = &unk_1E57B2138;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(callbackQueue, block);
}

uint64_t __78__AVAssetCustomURLBridgeForNSURLSession_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _lookupRequestForDataTask:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "metrics"), "transactionMetrics"), "firstObject");
    uint64_t v6 = [v5 networkProtocolName];
    [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F202C8]];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v5, "_privacyStance"));
    [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F202D0]];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 24);
    uint64_t v9 = [v3 requestID];
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v12 = v11 ? v11 : 0;
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(v12 + 24);
    if (v13) {
      v13(v8, v9, v10, v4);
    }
  }
  uint64_t v14 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  return [v14 _unregisterRequestForDataTask:v15];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  if (a6) {
    (*((void (**)(id, void))a6 + 2))(a6, 0);
  }
}

- (AVAssetCustomURLBridgeForNSURLSession)init
{
  return 0;
}

- (AVAssetCustomURLBridgeForNSURLSession)initWithFigAsset:(OpaqueFigAsset *)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)AVAssetCustomURLBridgeForNSURLSession;
  CFTypeRef cf = 0;
  uint64_t v4 = [(AVAssetCustomURLBridgeForNSURLSession *)&v19 init];
  if (!v4)
  {
    int v9 = 0;
    goto LABEL_16;
  }
  if (a3)
  {
    v4->_taskToRequest = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.customurl.nsurlsession", v5);
    uint64_t CMBaseObject = FigAssetGetCMBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v8 = v7 ? v7 : 0;
    uint64_t v10 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v8 + 48);
    if (v10)
    {
      int v11 = v10(CMBaseObject, *MEMORY[0x1E4F32208], *MEMORY[0x1E4F1CF80], &cf);
      if (v11)
      {
LABEL_14:
        int v9 = v11;
        goto LABEL_16;
      }
      uint64_t v21 = *MEMORY[0x1E4F202C0];
      v22[0] = MEMORY[0x1E4F1CC38];
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      CFTypeRef v13 = cf;
      callbackQueue = v4->_callbackQueue;
      uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v15) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      unsigned __int8 v17 = *(uint64_t (**)(CFTypeRef, uint64_t, const char *, AVAssetCustomURLBridgeForNSURLSession *, OS_dispatch_queue *, void *, uint64_t, OpaqueFigCustomURLHandler **))(v16 + 16);
      if (v17)
      {
        int v11 = v17(v13, 1000, "com.apple.avfoundation.customurl.nsurlsession", v4, callbackQueue, &initWithFigAsset__sAVAssetCustomURLCallbacksForNSURLSession, v12, &v4->_handler);
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

- (void)dealloc
{
  callbackQueue = self->_callbackQueue;
  if (callbackQueue) {
    dispatch_release(callbackQueue);
  }
  handler = self->_handler;
  if (handler) {
    CFRelease(handler);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAssetCustomURLBridgeForNSURLSession;
  [(AVAssetCustomURLBridgeForNSURLSession *)&v5 dealloc];
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

@end