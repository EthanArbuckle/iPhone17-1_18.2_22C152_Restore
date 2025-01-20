@interface FigHTTPRequestSessionDataDelegate
- (FigHTTPRequestSessionDataDelegate)init;
- (FigHTTPRequestSessionDataDelegate)initWithResponseDispositionOption:(BOOL)a3;
- (FigRetainProxy)_copyAndLockRequestForTask:(id)a3;
- (id)adoptVoucherFromRetainProxy:(FigRetainProxy *)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_deregisterFigHTTPRequestForDataTask:(id)a3;
- (void)_registerFigHTTPRequest:(OpaqueFigHTTPRequest *)a3 forDataTask:(id)a4;
- (void)dealloc;
- (void)restoreVoucher:(id)a3;
@end

@implementation FigHTTPRequestSessionDataDelegate

- (FigHTTPRequestSessionDataDelegate)initWithResponseDispositionOption:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigHTTPRequestSessionDataDelegate;
  v4 = [(FigHTTPRequestSessionDataDelegate *)&v7 init];
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_taskToFigHTTPRequest = v5;
    if (v5
      && (v4->_taskToFigHTTPRequestMutex = (OpaqueFigReentrantMutex *)FigReentrantMutexCreate(),
          v4->_taskToFigHTTPRequest))
    {
      v4->_doesIgnoreDidReceiveResponseDisposition = a3;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (FigHTTPRequestSessionDataDelegate)init
{
  return [(FigHTTPRequestSessionDataDelegate *)self initWithResponseDispositionOption:0];
}

- (void)dealloc
{
  if (self->_taskToFigHTTPRequestMutex) {
    FigSimpleMutexDestroy();
  }
  v3.receiver = self;
  v3.super_class = (Class)FigHTTPRequestSessionDataDelegate;
  [(FigHTTPRequestSessionDataDelegate *)&v3 dealloc];
}

- (void)_registerFigHTTPRequest:(OpaqueFigHTTPRequest *)a3 forDataTask:(id)a4
{
  DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  MEMORY[0x19970E290](self->_taskToFigHTTPRequestMutex);
  [(NSMutableDictionary *)self->_taskToFigHTTPRequest setObject:*DerivedStorage forKey:a4];

  JUMPOUT(0x19970E2B0);
}

- (void)_deregisterFigHTTPRequestForDataTask:(id)a3
{
  MEMORY[0x19970E290](self->_taskToFigHTTPRequestMutex, a2);
  [(NSMutableDictionary *)self->_taskToFigHTTPRequest removeObjectForKey:a3];

  JUMPOUT(0x19970E2B0);
}

- (id)adoptVoucherFromRetainProxy:(FigRetainProxy *)a3
{
  FigRetainProxyGetOwner();
  id v3 = *(id *)(CMBaseObjectGetDerivedStorage() + 560);

  return (id)voucher_adopt();
}

- (void)restoreVoucher:(id)a3
{
  if (a3)
  {
    id v3 = (void *)voucher_adopt();
  }
}

- (FigRetainProxy)_copyAndLockRequestForTask:(id)a3
{
  MEMORY[0x19970E290](self->_taskToFigHTTPRequestMutex, a2);
  v5 = (FigRetainProxy *)[(NSMutableDictionary *)self->_taskToFigHTTPRequest objectForKey:a3];
  if (v5)
  {
    FigRetainProxyRetain();
    MEMORY[0x19970E2B0](self->_taskToFigHTTPRequestMutex);
    FigRetainProxyLockMutex();
    if (FigRetainProxyIsInvalidated())
    {
      FigRetainProxyUnlockMutex();
      FigRetainProxyRelease();
      return 0;
    }
  }
  else
  {
    MEMORY[0x19970E2B0](self->_taskToFigHTTPRequestMutex);
  }
  return v5;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  objc_super v7 = (void *)MEMORY[0x199711A30](self, a2, a3);
  if (![a4 previousFailureCount])
  {
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 1, 0);
    goto LABEL_17;
  }
  if ([a4 previousFailureCount] != 1
    || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "authenticationMethod"), "isEqual:", *MEMORY[0x1E4F18C78]) & 1) != 0)
  {
    goto LABEL_15;
  }
  CFArrayRef theArray = 0;
  if (FigCFHTTPCopyClientCertChain((uint64_t *)&theArray)) {
    goto LABEL_18;
  }
  if (!theArray)
  {
LABEL_15:
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 2, 0);
    goto LABEL_17;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
  if (ValueAtIndex
    && (v9 = ValueAtIndex, CFTypeID v10 = CFGetTypeID(ValueAtIndex), v10 == SecIdentityGetTypeID())
    && (CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80],
        CFIndex Count = CFArrayGetCount(theArray),
        (MutableCopy = CFArrayCreateMutableCopy(v11, Count, theArray)) != 0))
  {
    v14 = MutableCopy;
    CFArrayRemoveValueAtIndex(MutableCopy, 0);
    int v15 = 1;
    id v16 = (id)[objc_alloc(MEMORY[0x1E4F18D88]) initWithIdentity:v9 certificates:v14 persistence:1];
    if (v16)
    {
      (*((void (**)(id, void, id))a5 + 2))(a5, 0, v16);
      int v15 = 0;
    }
    CFRelease(v14);
  }
  else
  {
LABEL_18:
    int v15 = 1;
  }
  if (theArray) {
    CFRelease(theArray);
  }
  if (v15) {
    goto LABEL_15;
  }
LABEL_17:
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  CFTypeID v10 = (void *)MEMORY[0x199711A30](self, a2, a3);
  CFAllocatorRef v11 = [(FigHTTPRequestSessionDataDelegate *)self _copyAndLockRequestForTask:a4];
  if (!v11)
  {
    (*((void (**)(id, uint64_t, void))a6 + 2))(a6, 2, 0);
    goto LABEL_21;
  }
  id v12 = [(FigHTTPRequestSessionDataDelegate *)self adoptVoucherFromRetainProxy:v11];
  FigRetainProxyGetOwner();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (FigRetainProxyIsInvalidated() || *(unsigned char *)(DerivedStorage + 172))
  {
LABEL_19:
    (*((void (**)(id, uint64_t, void))a6 + 2))(a6, 2, 0);
    goto LABEL_20;
  }
  if ([a5 previousFailureCount] || !objc_msgSend(a5, "proposedCredential"))
  {
    if (a5
      && *(void *)(DerivedStorage + 464)
      && !FigCustomURLRequestInfoCreateMutable()
      && !FigCustomURLRequestInfoSetNSURLAuthenticationChallenge())
    {
      uint64_t v14 = *(void *)(DerivedStorage + 464);
      uint64_t v15 = *(void *)DerivedStorage;
      uint64_t v16 = *(void *)(DerivedStorage + 64);
      uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v18 = v17 ? v17 : 0;
      v19 = *(unsigned int (**)(uint64_t, void, uint64_t, uint64_t, void (*)(), uint64_t))(v18 + 24);
      if (v19)
      {
        if (!v19(v14, 0, v15, v16, figHTTPCustomURLLoaderCredentialCallback, DerivedStorage + 480))
        {
          v20 = *(const void **)(DerivedStorage + 472);
          if (v20)
          {
            _Block_release(v20);
            *(void *)(DerivedStorage + 472) = 0;
          }
          *(void *)(DerivedStorage + 472) = _Block_copy(a6);
          goto LABEL_20;
        }
      }
    }
    goto LABEL_19;
  }
  (*((void (**)(id, uint64_t, void))a6 + 2))(a6, 1, 0);
LABEL_20:
  [(FigHTTPRequestSessionDataDelegate *)self restoreVoucher:v12];
  FigRetainProxyUnlockMutex();
  FigRetainProxyRelease();
LABEL_21:
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  objc_super v7 = [(FigHTTPRequestSessionDataDelegate *)self _copyAndLockRequestForTask:a4];
  if (v7)
  {
    id v8 = [(FigHTTPRequestSessionDataDelegate *)self adoptVoucherFromRetainProxy:v7];
    uint64_t Owner = FigRetainProxyGetOwner();
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (!*(_DWORD *)(DerivedStorage + 552))
    {
      if (a5)
      {
        CFAllocatorRef v11 = (void *)[a5 domain];
        if ([v11 compare:*MEMORY[0x1E4F289A0]] || objc_msgSend(a5, "code") != -999) {
          int v12 = 3;
        }
        else {
          int v12 = 4;
        }
      }
      else
      {
        int v12 = 2;
      }
      *(_DWORD *)(DerivedStorage + 552) = v12;
    }
    if (*(unsigned char *)(DerivedStorage + 172)) {
      goto LABEL_46;
    }
    *(void *)(DerivedStorage + 224) = FigGetUpTimeNanoseconds();
    v13 = (void *)MEMORY[0x199711A30]();
    *(void *)(DerivedStorage + 512) = a5;
    uint64_t v14 = *(void *)DerivedStorage;
    uint64_t v15 = CMBaseObjectGetDerivedStorage();
    if (*(unsigned char *)(v15 + 172)) {
      goto LABEL_43;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void **)(v15 + 512);
    if (v17)
    {
      char v18 = [v17 domain];
      [*(id *)(v16 + 512) code];
      _figHTTPRequestCreateErrorComment(v16, v19, @"Network error: domain=%@, code=%d, %@ for %@", v20, v21, v22, v23, v24, v18);
      [*(id *)(v16 + 512) code];
      unsigned int OutputBuffer = FigSignalErrorAt();
      if (!OutputBuffer) {
        goto LABEL_37;
      }
LABEL_30:
      v34 = (const void *)Owner;
      unsigned int v35 = OutputBuffer;
      goto LABEL_41;
    }
    if (!*(unsigned char *)(v16 + 169))
    {
LABEL_37:
      if (*(void *)(v16 + 384) && *(void *)(v16 + 392) < *(void *)(v16 + 400))
      {
        figHttpRequestSendOutputBlockBuffer(v14, 2u);
LABEL_42:
        FigRetainProxyIsInvalidated();
        goto LABEL_43;
      }
      v34 = (const void *)Owner;
      unsigned int v35 = 0;
LABEL_41:
      figHTTPRequestPerformReadCallback(v34, 0, 0, 0, 2u, v35);
      goto LABEL_42;
    }
    v25 = *(OpaqueCMBlockBuffer **)(v16 + 384);
    if (v25)
    {
      if (*(void *)(v16 + 408))
      {
        dataPointerOut = 0;
        size_t lengthAtOffsetOut = 0;
        if (!CMBlockBufferGetDataPointer(v25, *(void *)(v16 + 400), &lengthAtOffsetOut, 0, &dataPointerOut)
          && lengthAtOffsetOut)
        {
          unsigned int OutputBuffer = 0;
          v27 = dataPointerOut;
LABEL_28:
          unsigned char *v27 = 0;
          *(int64x2_t *)(v16 + 400) = vaddq_s64(*(int64x2_t *)(v16 + 400), (int64x2_t)xmmword_194997F90);
          goto LABEL_29;
        }
        goto LABEL_35;
      }
      size_t lengthAtOffsetOut = 0;
      figHttpRequestSendOutputBlockBuffer(v14, 0);
      if (FigRetainProxyIsInvalidated())
      {
LABEL_43:
        if (!FigRetainProxyIsInvalidated()) {
          figHttpRequestCloseNSURLSessionTask();
        }
LABEL_46:
        [(FigHTTPRequestSessionDataDelegate *)self restoreVoucher:v8];
        FigRetainProxyUnlockMutex();
        FigRetainProxyRelease();
        return;
      }
    }
    else
    {
      size_t lengthAtOffsetOut = 0;
    }
    if (!*(void *)(v16 + 16))
    {
      v36 = CFAllocatorAllocate(*(CFAllocatorRef *)(v16 + 160), 1, 0);
      if (v36)
      {
        v37 = v36;
        OSStatus v38 = CMBlockBufferCreateWithMemoryBlock(*(CFAllocatorRef *)(v16 + 160), v36, 1uLL, *(CFAllocatorRef *)(v16 + 160), 0, 0, 1uLL, 0, (CMBlockBufferRef *)(v16 + 384));
        if (*(void *)(v16 + 384))
        {
          unsigned int OutputBuffer = v38;
          unsigned char *v37 = 0;
          *(_OWORD *)(v16 + 400) = xmmword_194993040;
          *(void *)(v16 + 392) = 0;
LABEL_29:
          *(unsigned char *)(v16 + 169) = 0;
          if (OutputBuffer) {
            goto LABEL_30;
          }
          goto LABEL_37;
        }
        CFAllocatorDeallocate(*(CFAllocatorRef *)(v16 + 160), v37);
      }
LABEL_35:
      unsigned int OutputBuffer = FigSignalErrorAt();
      goto LABEL_36;
    }
    unsigned int OutputBuffer = figHTTPRequestGetOutputBuffer(Owner, (char **)&lengthAtOffsetOut, (size_t *)&dataPointerOut);
    if (!FigRetainProxyIsInvalidated())
    {
      if (!OutputBuffer)
      {
        v27 = (unsigned char *)lengthAtOffsetOut;
        goto LABEL_28;
      }
LABEL_36:
      _figHTTPRequestCreateErrorComment(v16, v28, @"Memory error", v29, v30, v31, v32, v33, blockBufferOut);
      if (OutputBuffer) {
        goto LABEL_30;
      }
      goto LABEL_37;
    }
    goto LABEL_43;
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  cf[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  int v94 = 0;
  CFTypeRef v93 = 0;
  CFTypeID v10 = (void *)MEMORY[0x199711A30](self, a2, a3);
  CFAllocatorRef v11 = [(FigHTTPRequestSessionDataDelegate *)self _copyAndLockRequestForTask:a4];
  if (!v11)
  {
    int v94 = -12420;
    goto LABEL_81;
  }
  id v89 = [(FigHTTPRequestSessionDataDelegate *)self adoptVoucherFromRetainProxy:v11];
  uint64_t Owner = (const void *)FigRetainProxyGetOwner();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 172))
  {
    int v94 = -12420;
    id v64 = v89;
    goto LABEL_80;
  }
  uint64_t v13 = DerivedStorage;
  *(void *)(DerivedStorage + 216) = FigGetUpTimeNanoseconds();
  uint64_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "_incompleteTaskMetrics"), "transactionMetrics"), "lastObject");
  if (objc_opt_respondsToSelector()) {
    char v15 = [v14 _usesMultipath];
  }
  else {
    char v15 = 0;
  }
  *(unsigned char *)(v13 + 536) = v15;
  *(unsigned char *)(v13 + 537) = [v14 isExpensive];
  objc_msgSend((id)objc_msgSend(v14, "domainLookupEndDate"), "timeIntervalSinceDate:", objc_msgSend(v14, "domainLookupStartDate"));
  *(void *)(v13 + 264) = (uint64_t)(v16 * 1000000000.0);
  objc_msgSend((id)objc_msgSend(v14, "secureConnectionEndDate"), "timeIntervalSinceDate:", objc_msgSend(v14, "secureConnectionStartDate"));
  *(void *)(v13 + 272) = (uint64_t)(v17 * 1000000000.0);
  objc_msgSend((id)objc_msgSend(v14, "connectEndDate"), "timeIntervalSinceDate:", objc_msgSend(v14, "connectStartDate"));
  *(void *)(v13 + 280) = (uint64_t)(v18 * 1000000000.0);
  objc_msgSend((id)objc_msgSend(v14, "connectEndDate"), "timeIntervalSinceDate:", objc_msgSend(v14, "fetchStartDate"));
  *(void *)(v13 + 288) = (uint64_t)(v19 * 1000000000.0);
  objc_msgSend((id)objc_msgSend(v14, "requestEndDate"), "timeIntervalSinceDate:", objc_msgSend(v14, "requestStartDate"));
  *(void *)(v13 + 296) = (uint64_t)(v20 * 1000000000.0);
  objc_msgSend((id)objc_msgSend(v14, "requestStartDate"), "timeIntervalSinceDate:", objc_msgSend(v14, "fetchStartDate"));
  *(void *)(v13 + 312) = (uint64_t)-((double)(uint64_t)(*(void *)(v13 + 264) + *(void *)(v13 + 280))
                                    - v21 * 1000000000.0);
  *(unsigned char *)(v13 + 320) = [v14 isReusedConnection];
  cf[0] = 0;
  CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v23) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = 0;
  }
  v25 = *(unsigned int (**)(const void *, uint64_t, const __CFAllocator *, CFTypeRef *))(v24 + 48);
  if (v25 && !v25(Owner, 0x1EE57B6B8, v22, cf))
  {
    double v95 = 0.0;
    double v92 = 0.0;
    if (!FigCFDictionaryGetDoubleIfPresent()
      && !FigCFDictionaryGetDoubleIfPresent()
      && !FigCFDictionaryGetDoubleIfPresent())
    {
      FigCFDictionaryGetDoubleIfPresent();
    }
    if (v95 > 0.0) {
      *(void *)(v13 + 208) = *(void *)(v13 + 192) + (uint64_t)((v95 - *(double *)(v13 + 184)) * 1000000000.0);
    }
    FigCFDictionaryGetDoubleIfPresent();
    if (v92 > 0.0) {
      *(void *)(v13 + 216) = *(void *)(v13 + 192) + (uint64_t)((v92 - *(double *)(v13 + 184)) * 1000000000.0);
    }
    CFRelease(cf[0]);
  }
  if (!*(void *)(v13 + 208)) {
    *(void *)(v13 + 208) = *(void *)(v13 + 200);
  }
  [a5 _CFURLResponse];
  uint64_t IsCellular = CFURLResponseConnectionIsCellular();
  *(unsigned char *)(v13 + 376) = IsCellular;
  if (IsCellular)
  {
    [a5 _CFURLResponse];
    uint64_t IsCellular = CFURLResponseConnectionDidFallback();
    *(unsigned char *)(v13 + 377) = IsCellular;
  }
  *(unsigned char *)(v13 + 457) = 1;
  FigBytePumpGetFigBaseObject(IsCellular);
  if (*(void *)(v13 + 488) && !*(unsigned char *)(v13 + 173))
  {
    if (*(unsigned char *)(v13 + 176))
    {
      figHTTPSetIsDormant((uint64_t)Owner, 0);
    }
    else if (!*(unsigned char *)(v13 + 177))
    {
      *(unsigned char *)(v13 + 177) = 1;
      if (!*(void *)(v13 + 496)) {
        FigNetworkHistoryRequestBecameActive();
      }
      FigNetworkHistorySetRequestSentTimestamp();
      FigNetworkHistorySetRequestLatency();
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "URL"), "scheme"), "caseInsensitiveCompare:", @"data")|| !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "URL"), "scheme"), "caseInsensitiveCompare:", @"file"))
    {
      *(void *)(v13 + 144) = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
      *(void *)(v13 + 416) = [a5 expectedContentLength];
      uint64_t v34 = 200;
      goto LABEL_39;
    }
    char v35 = objc_opt_class();
    uint64_t v86 = objc_msgSend((id)objc_msgSend(a5, "URL"), "scheme");
    _figHTTPRequestCreateErrorComment(v13, v36, @"Received response of type %@ for scheme %@", v37, v38, v39, v40, v41, v35);
LABEL_66:
    unsigned int Callback = FigSignalErrorAt();
LABEL_76:
    unsigned int v62 = Callback;
    int v94 = Callback;
    goto LABEL_77;
  }
  id v27 = (id)[a5 allHeaderFields];
  *(void *)(v13 + 144) = v27;
  if (!v27)
  {
    _figHTTPRequestCreateErrorComment(v13, v28, @"NULL HTTP response headers", v29, v30, v31, v32, v33, v85);
    goto LABEL_66;
  }
  uint64_t v34 = [a5 statusCode];
  *(void *)(v13 + 416) = 0;
  *(void *)(v13 + 424) = 0;
LABEL_39:
  CFStringRef v42 = (const __CFString *)[MEMORY[0x1E4F18D40] localizedStringForStatusCode:v34];
  CFHTTPMessageRef Response = CFHTTPMessageCreateResponse(v22, v34, v42, (CFStringRef)*MEMORY[0x1E4F18F90]);
  *(void *)(v13 + 152) = Response;
  if (Response)
  {
    CFHTTPMessageRef v44 = Response;
    CFDictionaryRef v45 = *(const __CFDictionary **)(v13 + 144);
    if (v45) {
      CFDictionaryApplyFunction(v45, (CFDictionaryApplierFunction)figApplyHeaderToCFHTTPMessaage, v44);
    }
  }
  if (!*(void *)(v13 + 80)) {
    *(void *)(v13 + 80) = CFRetain((CFTypeRef)objc_msgSend(a5, "URL", v44));
  }
  v46 = *(const void **)(v13 + 368);
  if (v46) {
    CFRelease(v46);
  }
  objc_msgSend(a5, "_CFURLResponse", v44);
  *(void *)(v13 + 368) = CFURLResponseCopyPeerAddress();
  FigCFHTTPCopyErrorCodeAndCommentForHTTPStatusCode(v34, &v94, &v93);
  if (v94)
  {
    v47 = *(const void **)(v13 + 520);
    CFTypeRef v48 = v93;
    *(void *)(v13 + 520) = v93;
    if (v48) {
      CFRetain(v48);
    }
    if (v47) {
      CFRelease(v47);
    }
    LODWORD(v92) = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    [*(id *)(v13 + 144) valueForKey:@"X-Error-Description"];
    goto LABEL_67;
  }
  if (*(unsigned char *)(v13 + 170))
  {
    v50 = (void *)[*(id *)(v13 + 144) valueForKey:@"Content-Encoding"];
    if (v50)
    {
      if (![v50 caseInsensitiveCompare:@"gzip"]) {
        *(unsigned char *)(v13 + 171) = 1;
      }
    }
  }
  if (*(unsigned char *)(v13 + 168))
  {
    cf[0] = 0;
    double v95 = 0.0;
    double v92 = 0.0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (FigCFHTTPGetContentRangeFromHeaderString([*(id *)(v13 + 144) valueForKey:@"Content-Range"], cf, &v95, &v92, &type))
    {
      CFTypeRef v58 = *(CFTypeRef *)(v13 + 120);
      int64_t v57 = *(void *)(v13 + 128);
      if (cf[0] == v58)
      {
        double v59 = v95;
        if (!v57 || *(CFTypeRef *)&v95 == (char *)cf[0] + v57 - 1 || type && *(void *)&v95 + 1 == *(void *)&v92)
        {
          int64_t v60 = *(void *)&v95 - (unint64_t)cf[0] + 1;
          *(void *)(v13 + 416) = v60;
          if (v57 > v60) {
            *(void *)(v13 + 128) = v60;
          }
          goto LABEL_70;
        }
      }
      else
      {
        double v59 = v95;
      }
      CFTypeRef v87 = cf[0];
      double v88 = v59;
      uint64_t v86 = *(void *)(v13 + 128);
      _figHTTPRequestCreateErrorComment(v13, v51, @"content range mismatch - should be start %lld length %lld is start %lld length %lld", v52, v53, v54, v55, v56, (char)v58);
LABEL_89:
      int v94 = FigSignalErrorAt();
      goto LABEL_67;
    }
    if (v34 == 206 && !*(void *)(v13 + 128))
    {
      int v94 = FigSignalErrorAt();
      _figHTTPRequestCreateErrorComment(v13, v72, @"have 206 with no Content-Range, and no end length", v73, v74, v75, v76, v77, v85);
      goto LABEL_67;
    }
  }
LABEL_70:
  if (*(void *)(v13 + 416) || *(unsigned char *)(v13 + 171)) {
    goto LABEL_72;
  }
  cf[0] = 0;
  if (FigCFHTTPGetContentLengthFromHeaderString((const __CFString *)[*(id *)(v13 + 144) valueForKey:@"Content-Length"], cf))
  {
    CFTypeRef v71 = cf[0];
    *(CFTypeRef *)(v13 + 416) = cf[0];
    if (!*(unsigned char *)(v13 + 168)) {
      goto LABEL_72;
    }
    if (v34 == 304)
    {
      *(void *)(v13 + 416) = 0;
      goto LABEL_72;
    }
    CFTypeRef v84 = *(CFTypeRef *)(v13 + 128);
    if (v84)
    {
      if (v84 == v71)
      {
LABEL_72:
        if (*(unsigned char *)(v13 + 365)) {
          unsigned int v63 = 17;
        }
        else {
          unsigned int v63 = 1;
        }
        unsigned int Callback = figHTTPRequestPerformReadCallback(Owner, 0, 0, 0, v63, 0);
        goto LABEL_76;
      }
    }
    if (*(unsigned char *)(v13 + 364))
    {
LABEL_102:
      *(unsigned char *)(v13 + 365) = 1;
      goto LABEL_72;
    }
    uint64_t v86 = (uint64_t)v71;
    _figHTTPRequestCreateErrorComment(v13, v65, @"byte range length mismatch - should be length %lld is length %lld", v66, v67, v68, v69, v70, *(void *)(v13 + 128));
    goto LABEL_89;
  }
  if (v34 == 304 || !*(unsigned char *)(v13 + 168)) {
    goto LABEL_72;
  }
  if (*(unsigned char *)(v13 + 364)) {
    goto LABEL_102;
  }
  int v94 = FigSignalErrorAt();
  _figHTTPRequestCreateErrorComment(v13, v78, @"byte range and no content length - error code is %d", v79, v80, v81, v82, v83, v34);
LABEL_67:
  unsigned int v62 = v94;
LABEL_77:
  id v64 = v89;
  if (v62 != -12785 && v62) {
    figHTTPRequestPerformReadCallback(Owner, 0, 0, 0, 2u, v62);
  }
LABEL_80:
  -[FigHTTPRequestSessionDataDelegate restoreVoucher:](self, "restoreVoucher:", v64, v85, v86, v87, *(void *)&v88);
  FigRetainProxyUnlockMutex();
  FigRetainProxyRelease();
  if (!v94)
  {
    (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
    goto LABEL_84;
  }
LABEL_81:
  (*((void (**)(id, void))a6 + 2))(a6, 0);
  if (self->_doesIgnoreDidReceiveResponseDisposition) {
    [a4 cancel];
  }
LABEL_84:
  if (v93) {
    CFRelease(v93);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  if (a5) {
    CFDataRef v8 = (const __CFData *)CFRetain(a5);
  }
  else {
    CFDataRef v8 = 0;
  }
  v9 = [(FigHTTPRequestSessionDataDelegate *)self _copyAndLockRequestForTask:a4];
  if (!v9) {
    goto LABEL_51;
  }
  uint64_t v10 = (uint64_t)v9;
  id v11 = [(FigHTTPRequestSessionDataDelegate *)self adoptVoucherFromRetainProxy:v9];
  uint64_t Owner = (const void *)FigRetainProxyGetOwner();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)(DerivedStorage + 172))
  {
    uint64_t v14 = DerivedStorage;
    figHTTPSetIsDormant((uint64_t)Owner, 0);
    uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
    *(void *)(v14 + 232) = UpTimeNanoseconds;
    if (*(void *)(v14 + 488) && !*(unsigned char *)(v14 + 173))
    {
      [a5 length];
      uint64_t UpTimeNanoseconds = FigNetworkHistoryRequestReceivedBytes();
    }
    double v16 = (void *)MEMORY[0x199711A30](UpTimeNanoseconds);
    unint64_t Length = CFDataGetLength(v8);
    unsigned int OutputBuffer = figHttpRequestEnsureNotTooManyBytes((uint64_t)Owner, Length);
    int v19 = *(unsigned __int8 *)(v14 + 365);
    if (OutputBuffer)
    {
      unint64_t v21 = 0;
      if (*(unsigned char *)(v14 + 365)) {
        goto LABEL_46;
      }
    }
    else
    {
      if (*(unsigned char *)(v14 + 365))
      {
        uint64_t v20 = *(void *)(v14 + 424);
        unint64_t v21 = *(void *)(v14 + 120) - v20;
        if (v21 < Length)
        {
          *(unsigned char *)(v14 + 365) = 0;
          goto LABEL_16;
        }
      }
      else
      {
        unint64_t v21 = 0;
        if (Length) {
          goto LABEL_16;
        }
        uint64_t v20 = *(void *)(v14 + 424);
      }
      *(void *)(v14 + 424) = v20 + Length;
      if (v19)
      {
LABEL_46:
        if (!FigRetainProxyIsInvalidated())
        {
          if (OutputBuffer)
          {
            if (!*(unsigned char *)(v14 + 172)) {
              figHTTPRequestPerformReadCallback(Owner, 0, 0, 0, 2u, OutputBuffer);
            }
          }
          else
          {
            *(void *)(v14 + 240) = FigGetUpTimeNanoseconds();
          }
        }
        goto LABEL_50;
      }
    }
LABEL_16:
    uint64_t v38 = self;
    uint64_t v39 = v16;
    id v40 = v11;
    if (*(void *)(v14 + 16))
    {
      uint64_t v22 = FigRetainProxyGetOwner();
      uint64_t v23 = CMBaseObjectGetDerivedStorage();
      uint64_t v24 = CFDataGetLength(v8) - v21;
      *(void *)(v23 + 424) += v21;
      if (v24 < 1)
      {
LABEL_29:
        unsigned int OutputBuffer = 0;
      }
      else
      {
        while (1)
        {
          size_t v41 = 0;
          *(void *)&customBlockSource.version = 0;
          unsigned int OutputBuffer = figHTTPRequestGetOutputBuffer(v22, (char **)&customBlockSource, &v41);
          if (FigRetainProxyIsInvalidated() || OutputBuffer) {
            break;
          }
          if (!*(void *)(v23 + 384)) {
            goto LABEL_29;
          }
          if (v41 >= v24) {
            CFIndex v25 = v24;
          }
          else {
            CFIndex v25 = v41;
          }
          v43.location = v21;
          v43.length = v25;
          CFDataGetBytes(v8, v43, *(UInt8 **)&customBlockSource.version);
          CFIndex v26 = *(void *)(v23 + 408) - v25;
          *(void *)(v23 + 400) += v25;
          *(void *)(v23 + 408) = v26;
          if (*(unsigned char *)(v23 + 362) || !v26)
          {
            unsigned int appended = figHttpRequestSendOutputBlockBuffer(v10, 0);
            if (appended) {
              goto LABEL_54;
            }
          }
          v21 += v25;
          BOOL v28 = v24 <= v25;
          v24 -= v25;
          if (v28) {
            goto LABEL_29;
          }
        }
      }
      goto LABEL_30;
    }
    uint64_t v29 = FigRetainProxyGetOwner();
    uint64_t v30 = CMBaseObjectGetDerivedStorage();
    uint64_t v31 = v30;
    if (*(unsigned char *)(v30 + 365)) {
      int64_t v32 = *(void *)(v30 + 120) - *(void *)(v30 + 424);
    }
    else {
      int64_t v32 = 0;
    }
    uint64_t v33 = (CMBlockBufferRef *)(v30 + 384);
    if (CMBlockBufferCreateEmpty(*(CFAllocatorRef *)(v30 + 160), 0, 0, (CMBlockBufferRef *)(v30 + 384)) || !*v33)
    {
      unsigned int v35 = FigSignalErrorAt();
    }
    else
    {
      CFIndex v34 = CFDataGetLength(v8);
      unsigned int v35 = figHttpRequestEnsureNotTooManyBytes(v29, v34);
      if (!v35)
      {
        CFIndex v36 = v34 - v32;
        if (v34 <= v32)
        {
          *(void *)(v31 + 424) += v34;
          if (v34 != v32)
          {
            CFIndex v36 = 0;
            goto LABEL_45;
          }
          CFIndex v36 = 0;
        }
        else
        {
          HIDWORD(customBlockSource.AllocateBlock) = 0;
          *(void *)&customBlockSource.version = 0;
          customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))figHttpRequestFreeCFData;
          customBlockSource.refCon = (void *)CFRetain(v8);
          BytePtr = (UInt8 *)CFDataGetBytePtr(v8);
          unsigned int appended = CMBlockBufferAppendMemoryBlock(*v33, BytePtr, v34, 0, &customBlockSource, v32, v34 - v32, 0);
          if (appended)
          {
LABEL_54:
            unsigned int OutputBuffer = appended;
LABEL_30:
            self = v38;
LABEL_31:
            double v16 = v39;
            id v11 = v40;
            goto LABEL_46;
          }
          *(void *)(v31 + 424) += v32;
        }
        *(unsigned char *)(v31 + 365) = 0;
LABEL_45:
        double v16 = v39;
        id v11 = v40;
        *(void *)(v31 + 400) = v36;
        *(void *)(v31 + 408) = 0;
        *(void *)(v31 + 392) = 0;
        unsigned int OutputBuffer = figHttpRequestSendOutputBlockBuffer(v10, 0);
        self = v38;
        goto LABEL_46;
      }
    }
    unsigned int OutputBuffer = v35;
    goto LABEL_31;
  }
LABEL_50:
  -[FigHTTPRequestSessionDataDelegate restoreVoucher:](self, "restoreVoucher:", v11, v38);
  FigRetainProxyUnlockMutex();
  FigRetainProxyRelease();
LABEL_51:
  if (v8) {
    CFRelease(v8);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  objc_super v7 = (void *)MEMORY[0x199711A30](self, a2, a3, a4, a5);
  (*((void (**)(id, void))a6 + 2))(a6, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  if (objc_msgSend((id)objc_msgSend(a5, "transactionMetrics", a3), "count") == 1)
  {
    CFDataRef v8 = objc_msgSend((id)objc_msgSend(a5, "transactionMetrics"), "objectAtIndexedSubscript:", 0);
    v9 = [(FigHTTPRequestSessionDataDelegate *)self _copyAndLockRequestForTask:a4];
    if (v9)
    {
      id v10 = [(FigHTTPRequestSessionDataDelegate *)self adoptVoucherFromRetainProxy:v9];
      FigRetainProxyGetOwner();
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      *(void *)(DerivedStorage + 256) = a5;
      objc_msgSend((id)objc_msgSend(v8, "responseEndDate"), "timeIntervalSinceDate:", objc_msgSend(v8, "fetchStartDate"));
      *(void *)(DerivedStorage + 304) = (uint64_t)(v12 * 1000000000.0);
      *(unsigned char *)(DerivedStorage + 321) = [v8 resourceFetchType] == 2;
      *(void *)(DerivedStorage + 328) = [a5 redirectCount];
      if (objc_opt_respondsToSelector()) {
        *(_DWORD *)(DerivedStorage + 336) = [v8 _privacyStance];
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v13 = *(void **)(DerivedStorage + 344);
        if (v13) {
          nw_release(v13);
        }
        *(void *)(DerivedStorage + 344) = 0;
        uint64_t v14 = (void *)[v8 _establishmentReport];
        *(void *)(DerivedStorage + 344) = v14;
        if (v14) {
          nw_retain(v14);
        }
      }
      char v15 = *(void **)(DerivedStorage + 352);
      if (v15) {
        nw_release(v15);
      }
      *(void *)(DerivedStorage + 352) = 0;
      double v16 = (void *)[v8 _dataTransferReport];
      *(void *)(DerivedStorage + 352) = v16;
      if (v16) {
        nw_retain(v16);
      }
      [(FigHTTPRequestSessionDataDelegate *)self restoreVoucher:v10];
      FigRetainProxyUnlockMutex();
      FigRetainProxyRelease();
    }
  }
}

@end