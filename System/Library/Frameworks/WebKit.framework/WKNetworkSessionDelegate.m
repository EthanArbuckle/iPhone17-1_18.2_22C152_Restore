@interface WKNetworkSessionDelegate
- (RefPtr<WebKit::NetworkDataTaskCocoa,)existingTask:(id)a3;
- (WKNetworkSessionDelegate)initWithNetworkSession:(NakedRef<WebKit:(void *)a4 :(BOOL)a5 NetworkSessionCocoa>)a3 wrapper:withCredentials:;
- (id).cxx_construct;
- (uint64_t)URLSession:(WebCore::Credential *)this task:didReceiveChallenge:completionHandler:;
- (uint64_t)URLSession:(const void *)a1 dataTask:didReceiveResponse:completionHandler:;
- (uint64_t)URLSession:(const void *)a1 task:_schemeUpgraded:completionHandler:;
- (uint64_t)URLSession:(const void *)a1 task:didReceiveChallenge:completionHandler:;
- (uint64_t)URLSession:(const void *)a1 task:willPerformHTTPRedirection:newRequest:completionHandler:;
- (uint64_t)URLSession:(uint64_t)a1 dataTask:didReceiveResponse:completionHandler:;
- (uint64_t)URLSession:(uint64_t)a1 task:_schemeUpgraded:completionHandler:;
- (uint64_t)URLSession:(uint64_t)a1 task:didReceiveChallenge:completionHandler:;
- (uint64_t)URLSession:(uint64_t)a1 task:willPerformHTTPRedirection:newRequest:completionHandler:;
- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 _didReceiveInformationalResponse:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 _schemeUpgraded:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveInformationalResponse:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)URLSession:(id)a3 webSocketTask:(id)a4 didCloseWithCode:(int64_t)a5 reason:(id)a6;
- (void)URLSession:(id)a3 webSocketTask:(id)a4 didOpenWithProtocol:(id)a5;
- (void)URLSession:(uint64_t)a1 task:_schemeUpgraded:completionHandler:;
- (void)URLSession:(uint64_t)a1 task:willPerformHTTPRedirection:newRequest:completionHandler:;
- (void)URLSession:task:didReceiveChallenge:completionHandler:;
- (void)existingWebSocketTask:(id)a3;
- (void)sessionFromTask:(id)a3;
- (void)sessionInvalidated;
@end

@implementation WKNetworkSessionDelegate

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (WKNetworkSessionDelegate)initWithNetworkSession:(NakedRef<WebKit:(void *)a4 :(BOOL)a5 NetworkSessionCocoa>)a3 wrapper:withCredentials:
{
  v16.receiver = self;
  v16.super_class = (Class)WKNetworkSessionDelegate;
  v8 = [(WKNetworkSessionDelegate *)&v16 init];
  if (v8)
  {
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3.var0 + 2, (uint64_t)a3.var0);
    v10 = (atomic_uint *)*((void *)a3.var0 + 1);
    if (v10) {
      atomic_fetch_add(v10, 1u);
    }
    m_ptr = (unsigned int *)v8->_session.m_impl.m_ptr;
    v8->_session.m_impl.m_ptr = (DefaultWeakPtrImpl *)v10;
    if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v9);
    }
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a4, (uint64_t)a4);
    v13 = *(atomic_uint **)a4;
    if (*(void *)a4) {
      atomic_fetch_add(v13, 1u);
    }
    v14 = (unsigned int *)v8->_sessionWrapper.m_impl.m_ptr;
    v8->_sessionWrapper.m_impl.m_ptr = (DefaultWeakPtrImpl *)v13;
    if (v14 && atomic_fetch_add((atomic_uint *volatile)v14, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v14);
      WTF::fastFree((WTF *)v14, v12);
    }
    v8->_withCredentials = a5;
  }
  return v8;
}

- (void)sessionInvalidated
{
  m_ptr = (unsigned int *)self->_sessionWrapper.m_impl.m_ptr;
  self->_sessionWrapper.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (RefPtr<WebKit::NetworkDataTaskCocoa,)existingTask:(id)a3
{
  v4 = v3;
  m_ptr = self->_sessionWrapper.m_impl.m_ptr;
  if (!m_ptr) {
    goto LABEL_8;
  }
  uint64_t v6 = *((void *)m_ptr + 1);
  if (!v6) {
    goto LABEL_8;
  }
  if (!a3) {
    goto LABEL_8;
  }
  self = (WKNetworkSessionDelegate *)[a3 taskIdentifier];
  uint64_t v7 = *(void *)(v6 + 24);
  if (!v7) {
    goto LABEL_8;
  }
  int v8 = *(_DWORD *)(v7 - 8);
  unint64_t v9 = ((unint64_t)self + ~((void)self << 32)) ^ (((unint64_t)self + ~((void)self << 32)) >> 22);
  unint64_t v10 = 9 * ((v9 + ~(v9 << 13)) ^ ((v9 + ~(v9 << 13)) >> 8));
  unint64_t v11 = (v10 ^ (v10 >> 15)) + ~((v10 ^ (v10 >> 15)) << 27);
  unsigned int v12 = v8 & ((v11 >> 31) ^ v11);
  v13 = *(WKNetworkSessionDelegate **)(v7 + 24 * v12);
  if (v13 != self)
  {
    int v14 = 1;
    while (v13)
    {
      unsigned int v12 = (v12 + v14) & v8;
      v13 = *(WKNetworkSessionDelegate **)(v7 + 24 * v12);
      ++v14;
      if (v13 == self) {
        goto LABEL_6;
      }
    }
    goto LABEL_8;
  }
LABEL_6:
  self = *(WKNetworkSessionDelegate **)(v7 + 24 * v12 + 8);
  if (!self
    || (self = (WKNetworkSessionDelegate *)WTF::ThreadSafeWeakPtrControlBlock::weakRef((atomic_uchar *)self)) == 0)
  {
LABEL_8:
    void *v4 = 0;
    return (RefPtr<WebKit::NetworkDataTaskCocoa, WTF::RawPtrTraits<WebKit::NetworkDataTaskCocoa>, WTF::DefaultRefDerefTraits<WebKit::NetworkDataTaskCocoa>>)self;
  }
  v15 = self;
  objc_super v16 = v4;
  v17 = (atomic_uchar *)v15;
  WTF::ThreadSafeWeakPtrControlBlock::makeStrongReferenceIfPossible<WebKit::NetworkDataTaskCocoa>(v16, (atomic_uchar *)v15, *(void *)(v7 + 24 * v12 + 16));

  return (RefPtr<WebKit::NetworkDataTaskCocoa, WTF::RawPtrTraits<WebKit::NetworkDataTaskCocoa>, WTF::DefaultRefDerefTraits<WebKit::NetworkDataTaskCocoa>>)WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v17, v18);
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  if (self)
  {
    [(WKNetworkSessionDelegate *)self existingTask:a4];
    if (v9)
    {
      WebKit::NetworkDataTaskCocoa::didSendData((WebKit::NetworkDataTaskCocoa *)v9, a6, a7);
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(v9[1]);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  if (!self)
  {
    uint64_t v11 = 0;
    goto LABEL_8;
  }
  [(WKNetworkSessionDelegate *)self existingTask:a4];
  if (!v11)
  {
LABEL_8:
    (*((void (**)(id, void))a5 + 2))(a5, 0);
    goto LABEL_12;
  }
  WebCore::ResourceRequestBase::httpBody((uint64_t *)&v10, (WebCore::ResourceRequestBase *)(v11 + 128));
  if (v10)
  {
    int v8 = v10;
    unint64_t v10 = 0;
    WebCore::createHTTPBodyNSInputStream();
    (*((void (**)(id))a5 + 2))(a5);
    if (cf) {
      CFRelease(cf);
    }
    WTF::RefCounted<WebCore::FormData>::deref(v8);
  }
  else
  {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
  uint64_t v6 = v10;
  unint64_t v10 = 0;
  if (v6) {
    WTF::RefCounted<WebCore::FormData>::deref(v6);
  }
LABEL_12:
  uint64_t v7 = v11;
  uint64_t v11 = 0;
  if (v7) {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(atomic_uchar **)(v7 + 8));
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v12 = objc_msgSend(a4, "taskIdentifier", a3);
  if (self)
  {
    [(WKNetworkSessionDelegate *)self existingTask:a4];
    if (v45)
    {
      uint64_t v13 = *(void *)(v45 + 16);
      if (!v13) {
        goto LABEL_36;
      }
      uint64_t v14 = *(void *)(v13 + 8);
      if (!v14) {
        goto LABEL_36;
      }
      uint64_t v15 = *(void *)(v14 + 32);
      v41.super.isa = *(Class *)(v14 + 24);
      WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<PAL::SessionID>>,PAL::SessionID>((uint64_t *)(v15 + 232), &v41);
      uint64_t v16 = *(unsigned char *)(v45 + 544) ? [a6 URL] : objc_msgSend(a6, "mainDocumentURL");
      uint64_t v27 = v16;
      if ((objc_opt_respondsToSelector() & 1) == 0
        || ![a6 _schemeWasUpgradedDueToDynamicHSTS])
      {
        goto LABEL_36;
      }
      MEMORY[0x19972E8A0](&v41, v27);
      MEMORY[0x19972E8A0](v39, [a6 URL]);
      long long v43 = *(_OWORD *)(v45 + 744);
      char v44 = 1;
      int shouldBlockCookies = WebCore::NetworkStorageSession::shouldBlockCookies();
      v30 = v39[0];
      v39[0] = 0;
      if (v30)
      {
        if (*(_DWORD *)v30 == 2) {
          WTF::StringImpl::destroy(v30, v28);
        }
        else {
          *(_DWORD *)v30 -= 2;
        }
      }
      isa = v41.super.isa;
      v41.super.isa = 0;
      if (isa)
      {
        if (*(_DWORD *)isa == 2)
        {
          WTF::StringImpl::destroy(isa, v28);
          if (shouldBlockCookies)
          {
LABEL_33:
            downgradeRequest(&v41, a6);
            updateIgnoreStrictTransportSecuritySetting((id *)&v41.super.isa, 1);
            Class v32 = v41.super.isa;
            (*((void (**)(id, Class))a7 + 2))(a7, v41.super.isa);
            if (v32) {
              CFRelease(v32);
            }
            goto LABEL_19;
          }
LABEL_36:
          WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)&v41, (NSURLResponse *)a5);
          uint64_t v33 = v45;
          MEMORY[0x199732A50](v39, a6);
          uint64_t v34 = *(void *)(v45 + 16);
          if (v34) {
            uint64_t v35 = *(void *)(v34 + 8);
          }
          else {
            uint64_t v35 = 0;
          }
          v36 = _Block_copy(a7);
          uint64_t v37 = WTF::fastMalloc((WTF *)0x28);
          *(void *)uint64_t v37 = &unk_1EE9BC410;
          *(void *)(v37 + 8) = v35;
          *(void *)(v37 + 16) = v36;
          *(void *)(v37 + 24) = v12;
          *(unsigned char *)(v37 + 32) = 0;
          v38 = (void *)v37;
          WebKit::NetworkDataTaskCocoa::willPerformHTTPRedirection(v33, (uint64_t)&v41, (WebCore::ResourceRequestBase *)v39, (uint64_t *)&v38);
          uint64_t v22 = (uint64_t)v38;
          if (!v38) {
            goto LABEL_13;
          }
          goto LABEL_12;
        }
        *(_DWORD *)isa -= 2;
      }
      if (shouldBlockCookies) {
        goto LABEL_33;
      }
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v45 = 0;
  }
  v17 = [(WKNetworkSessionDelegate *)self existingWebSocketTask:a4];
  if (!v17)
  {
    (*((void (**)(id, void))a7 + 2))(a7, 0);
    goto LABEL_19;
  }
  WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)&v41, (NSURLResponse *)a5);
  MEMORY[0x199732A50](v39, a6);
  uint64_t v18 = *(void *)(v17[6] + 48);
  if (v18) {
    uint64_t v19 = *(void *)(v18 + 8);
  }
  else {
    uint64_t v19 = 0;
  }
  v20 = _Block_copy(a7);
  v21 = (void *)WTF::fastMalloc((WTF *)0x20);
  void *v21 = &unk_1EE9BC438;
  v21[1] = v19;
  v21[2] = v20;
  v21[3] = v12;
  v38 = v21;
  WebKit::NetworkTaskCocoa::willPerformHTTPRedirection((uint64_t)v17, (WebCore::ResourceResponseBase *)&v41, (WebCore::ResourceRequestBase *)v39, (uint64_t *)&v38);
  uint64_t v22 = (uint64_t)v38;
  v38 = 0;
  if (!v22) {
    goto LABEL_13;
  }
LABEL_12:
  (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
LABEL_13:
  _Block_release(0);
  CFTypeRef v23 = v40;
  CFTypeRef v40 = 0;
  if (v23) {
    CFRelease(v23);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v39);
  CFTypeRef v25 = cf;
  CFTypeRef cf = 0;
  if (v25) {
    CFRelease(v25);
  }
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)&v41, v24);
LABEL_19:
  uint64_t v26 = v45;
  uint64_t v45 = 0;
  if (v26) {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(atomic_uchar **)(v26 + 8));
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _schemeUpgraded:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = objc_msgSend(a4, "taskIdentifier", a3);
  if (!self)
  {
    uint64_t v40 = 0;
    goto LABEL_13;
  }
  uint64_t v11 = v10;
  [(WKNetworkSessionDelegate *)self existingTask:a4];
  if (!v40)
  {
LABEL_13:
    (*((void (**)(id, void))a6 + 2))(a6, 0);
    goto LABEL_28;
  }
  uint64_t v12 = *(void *)(v40 + 16);
  if (!v12) {
    goto LABEL_14;
  }
  uint64_t v13 = *(void *)(v12 + 8);
  if (!v13) {
    goto LABEL_14;
  }
  uint64_t v14 = *(void *)(v13 + 32);
  v35.super.Class isa = *(Class *)(v13 + 24);
  WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<PAL::SessionID>>,PAL::SessionID>((uint64_t *)(v14 + 232), &v35);
  if ((objc_opt_respondsToSelector() & 1) == 0 || ![a5 _schemeWasUpgradedDueToDynamicHSTS]) {
    goto LABEL_14;
  }
  MEMORY[0x199732A50](&v35, a5);
  long long v38 = *(_OWORD *)(v40 + 744);
  char v39 = 1;
  int shouldBlockCookies = WebCore::NetworkStorageSession::shouldBlockCookies();
  CFTypeRef v16 = v36;
  CFTypeRef v36 = 0;
  if (v16) {
    CFRelease(v16);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)&v35);
  if (shouldBlockCookies)
  {
    downgradeRequest(&v35, a5);
    updateIgnoreStrictTransportSecuritySetting((id *)&v35.super.isa, 1);
    Class isa = v35.super.isa;
    (*((void (**)(id, Class))a6 + 2))(a6, v35.super.isa);
    if (isa) {
      CFRelease(isa);
    }
  }
  else
  {
LABEL_14:
    uint64_t v18 = (WebCore *)[a4 currentRequest];
    v20 = (NSURLResponse *)WebCore::synthesizeRedirectResponseIfNecessary(v18, (NSURLRequest *)a5, 0, v19);
    WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)&v35, v20);
    uint64_t v21 = [a5 valueForHTTPHeaderField:@"Origin"];
    if (v21) {
      uint64_t v22 = (__CFString *)v21;
    }
    else {
      uint64_t v22 = @"*";
    }
    MEMORY[0x19972EAD0](v33, v22);
    WebCore::ResourceResponseBase::setHTTPHeaderField();
    v24 = v33[0];
    v33[0] = 0;
    if (v24)
    {
      if (*(_DWORD *)v24 == 2) {
        WTF::StringImpl::destroy(v24, v23);
      }
      else {
        *(_DWORD *)v24 -= 2;
      }
    }
    uint64_t v25 = v40;
    MEMORY[0x199732A50](v33, a5);
    uint64_t v26 = _Block_copy(a6);
    uint64_t v27 = WTF::fastMalloc((WTF *)0x20);
    *(void *)uint64_t v27 = &unk_1EE9BC460;
    *(void *)(v27 + 8) = v26;
    *(void *)(v27 + 16) = v11;
    *(unsigned char *)(v27 + 24) = 0;
    uint64_t v32 = v27;
    WebKit::NetworkDataTaskCocoa::willPerformHTTPRedirection(v25, (uint64_t)&v35, (WebCore::ResourceRequestBase *)v33, &v32);
    if (v32) {
      (*(void (**)(uint64_t))(*(void *)v32 + 8))(v32);
    }
    _Block_release(0);
    CFTypeRef v28 = v34;
    CFTypeRef v34 = 0;
    if (v28) {
      CFRelease(v28);
    }
    WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v33);
    CFTypeRef v30 = cf;
    CFTypeRef cf = 0;
    if (v30) {
      CFRelease(v30);
    }
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)&v35, v29);
  }
LABEL_28:
  uint64_t v31 = v40;
  uint64_t v40 = 0;
  if (v31) {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(atomic_uchar **)(v31 + 8));
  }
}

- (void)sessionFromTask:(id)a3
{
  if (!self || ([(WKNetworkSessionDelegate *)self existingTask:a3], (v5 = v28) == 0))
  {
    m_ptr = self->_sessionWrapper.m_impl.m_ptr;
    if (!m_ptr) {
      return 0;
    }
    uint64_t v9 = *((void *)m_ptr + 1);
    if (!v9) {
      return 0;
    }
    uint64_t v10 = [a3 taskIdentifier];
    uint64_t v11 = *(void *)(v9 + 32);
    if (v11)
    {
      unsigned int v12 = *(_DWORD *)(v11 - 8);
      unint64_t v13 = (v10 + ~(v10 << 32)) ^ ((unint64_t)(v10 + ~(v10 << 32)) >> 22);
      unint64_t v14 = 9 * ((v13 + ~(v13 << 13)) ^ ((v13 + ~(v13 << 13)) >> 8));
      unint64_t v15 = (v14 ^ (v14 >> 15)) + ~((v14 ^ (v14 >> 15)) << 27);
      uint64_t v16 = v12 & ((v15 >> 31) ^ v15);
      uint64_t v17 = *(void *)(v11 + 16 * v16);
      if (v17 == v10)
      {
LABEL_13:
        uint64_t v19 = (uint64_t *)(*(void *)(*((void *)self->_session.m_impl.m_ptr + 1) + 32) + 192);
        CFTypeRef v28 = *(WTF **)(v11 + 16 * v16 + 8);
        uint64_t v20 = WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>,std::unique_ptr<WebKit::RemoteCDMInstanceProxy>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteCDMInstanceProxy>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>,std::unique_ptr<WebKit::RemoteCDMInstanceProxy>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteCDMInstanceProxy>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>>,WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>(v19, &v28);
        if (v20)
        {
          uint64_t v21 = *(void *)(*((void *)self->_session.m_impl.m_ptr + 1) + 32);
          CFTypeRef v28 = *(WTF **)(v20 + 160);
          return (void *)WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<PAL::SessionID>>,PAL::SessionID>((uint64_t *)(v21 + 224), &v28);
        }
        return 0;
      }
      int v18 = 1;
      while (v17)
      {
        uint64_t v16 = (v16 + v18) & v12;
        uint64_t v17 = *(void *)(v11 + 16 * v16);
        ++v18;
        if (v17 == v10) {
          goto LABEL_13;
        }
      }
    }
    uint64_t v22 = self->_sessionWrapper.m_impl.m_ptr;
    if (v22) {
      uint64_t v23 = *((void *)v22 + 1);
    }
    else {
      uint64_t v23 = 0;
    }
    WTF::HashMap<unsigned long long,WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<unsigned long long,WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<unsigned long long>>,unsigned long long>((atomic_uint **)&v28, *(void *)(v23 + 40), [a3 taskIdentifier]);
    uint64_t v25 = (unsigned int *)v28;
    if (v28)
    {
      uint64_t v7 = (void *)*((void *)v28 + 1);
      CFTypeRef v28 = 0;
      if (atomic_fetch_add((atomic_uint *volatile)v25, 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v25);
        WTF::fastFree((WTF *)v25, v24);
        if (!v7) {
          return v7;
        }
      }
      else if (!v7)
      {
        return v7;
      }
      uint64_t v26 = *(void *)(v7[6] + 48);
      if (v26) {
        return *(void **)(v26 + 8);
      }
    }
    return 0;
  }
  uint64_t v6 = *((void *)v28 + 2);
  if (v6) {
    uint64_t v7 = *(void **)(v6 + 8);
  }
  else {
    uint64_t v7 = 0;
  }
  CFTypeRef v28 = 0;
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*((atomic_uchar **)v5 + 1));
  return v7;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = [(WKNetworkSessionDelegate *)self sessionFromTask:a4];
  if (!v10 || (uint64_t v11 = (uint64_t)v10, [a4 state] == 2))
  {
    unsigned int v12 = (void (*)(id, uint64_t, void))*((void *)a6 + 2);
    id v13 = a6;
    uint64_t v14 = 2;
LABEL_4:
    v12(v13, v14, 0);
    return;
  }
  uint64_t v15 = [a4 taskIdentifier];
  if (objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "isProxy")
    && !*(_DWORD *)(v11 + 1172)
    && !*(unsigned char *)(v11 + 1200))
  {
    unsigned int v12 = (void (*)(id, uint64_t, void))*((void *)a6 + 2);
    id v13 = a6;
    uint64_t v14 = 0;
    goto LABEL_4;
  }
  uint64_t v16 = objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "authenticationMethod");
  if (![v16 isEqualToString:*MEMORY[0x1E4F18CB8]]) {
    goto LABEL_32;
  }
  MEMORY[0x199737840](&to, a5);
  WebKit::NetworkProcess::sourceApplicationAuditData((WebKit::NetworkProcess *)&location, *(void *)(*(void *)(v11 + 32) + 40));
  id v18 = location;
  if (location)
  {
    objc_msgSend((id)objc_msgSend((id)cf, "protectionSpace"), "serverTrust");
    SecTrustSetClientAuditToken();
    CFRelease(v18);
  }
  CFTypeRef v19 = cf;
  CFTypeRef cf = 0;
  if (v19) {
    CFRelease(v19);
  }
  CFTypeRef v20 = v108;
  CFTypeRef v108 = 0;
  if (v20) {
    CFRelease(v20);
  }
  WebCore::AuthenticationChallengeBase::~AuthenticationChallengeBase((WebCore::AuthenticationChallengeBase *)&to, v17);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "_incompleteTaskMetrics"), "transactionMetrics"), "lastObject"), "negotiatedTLSProtocolVersion"), "unsignedShortValue")- 771 >= 0xFFFFFFFE|| (objc_opt_respondsToSelector() & 1) != 0&& ((int v21 = objc_msgSend(a4, "_TLSNegotiatedProtocolVersion"), v21 == 7) || v21 == 4))
  {
    if ([a4 _preconnect])
    {
      (*((void (**)(id, uint64_t, void))a6 + 2))(a6, 2, 0);
      return;
    }
    uint64_t v33 = 1;
    goto LABEL_34;
  }
  if (!*(unsigned char *)(v11 + 1187))
  {
LABEL_32:
    uint64_t v33 = 0;
LABEL_34:
    m_ptr = self->_sessionWrapper.m_impl.m_ptr;
    if (m_ptr) {
      uint64_t v35 = *((void *)m_ptr + 1);
    }
    else {
      uint64_t v35 = 0;
    }
    MEMORY[0x199737840](&to, a5);
    [(WKNetworkSessionDelegate *)self existingTask:a4];
    CFTypeRef v36 = _Block_copy(a6);
    uint64_t v37 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v37 = &unk_1EE9BC488;
    v37[1] = v36;
    id location = v37;
    WebKit::NetworkSessionCocoa::continueDidReceiveChallenge(v11, v35, (WebCore::AuthenticationChallengeBase *)&to, v33, v15, &v98, (uint64_t *)&location);
    id v38 = location;
    id location = 0;
    if (v38) {
      (*(void (**)(id))(*(void *)v38 + 8))(v38);
    }
    _Block_release(0);
    uint64_t v40 = v98;
    uint64_t v98 = 0;
    if (v40) {
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(atomic_uchar **)(v40 + 8));
    }
    CFTypeRef v41 = cf;
    CFTypeRef cf = 0;
    if (v41) {
      CFRelease(v41);
    }
    CFTypeRef v42 = v108;
    CFTypeRef v108 = 0;
    if (v42) {
      CFRelease(v42);
    }
    WebCore::AuthenticationChallengeBase::~AuthenticationChallengeBase((WebCore::AuthenticationChallengeBase *)&to, v39);
    return;
  }
  if (self)
  {
    [(WKNetworkSessionDelegate *)self existingTask:a4];
    if (v102)
    {
      uint64_t v22 = (void *)[a5 protectionSpace];
      uint64_t v23 = v102;
      MEMORY[0x19972EAD0](&v100, [v22 protocol]);
      MEMORY[0x19972EAD0](&v99, [v22 host]);
      uint64_t v24 = [v22 port];
      unint64_t v25 = v24;
      uint64_t v27 = v99;
      uint64_t v26 = v100;
      if (v100)
      {
        int v28 = *((_DWORD *)v100 + 1);
        if (v99) {
          goto LABEL_28;
        }
      }
      else
      {
        int v28 = 0;
        if (v99)
        {
LABEL_28:
          int v29 = *((_DWORD *)v99 + 1);
          if ((v24 & 0x8000000000000000) == 0) {
            goto LABEL_29;
          }
          goto LABEL_51;
        }
      }
      int v29 = 0;
      if ((v24 & 0x8000000000000000) == 0)
      {
LABEL_29:
        int v30 = 0;
        unint64_t v31 = v24;
        do
        {
          ++v30;
          BOOL v32 = v31 > 9;
          v31 /= 0xAuLL;
        }
        while (v32);
LABEL_53:
        if (v30 < 0) {
          goto LABEL_142;
        }
        BOOL v45 = __OFADD__(v30, 1);
        int v46 = v30 + 1;
        BOOL v47 = v45;
        if (v29 < 0) {
          goto LABEL_142;
        }
        if (v47) {
          goto LABEL_142;
        }
        BOOL v45 = __OFADD__(v29, v46);
        int v48 = v29 + v46;
        if (v45) {
          goto LABEL_142;
        }
        BOOL v45 = __OFADD__(v48, 3);
        int v49 = v48 + 3;
        BOOL v50 = v45;
        if (v28 < 0) {
          goto LABEL_142;
        }
        if (v50) {
          goto LABEL_142;
        }
        uint64_t v51 = (v28 + v49);
        if (__OFADD__(v28, v49)) {
          goto LABEL_142;
        }
        if ((!v100 || (*((unsigned char *)v100 + 16) & 4) != 0) && (!v99 || (*((unsigned char *)v99 + 16) & 4) != 0))
        {
          if (v51)
          {
            if ((v51 & 0x80000000) != 0) {
              goto LABEL_142;
            }
            WTF::tryFastCompactMalloc((WTF *)(v51 + 20));
            v62 = (char *)location;
            if (!location) {
              goto LABEL_142;
            }
            uint64_t v97 = v23;
            v63 = (char *)location + 20;
            *(_DWORD *)id location = 2;
            *((_DWORD *)v62 + 1) = v51;
            *((void *)v62 + 1) = v62 + 20;
            v54 = (WTF::StringImpl *)v62;
            *((_DWORD *)v62 + 4) = 4;
            v110 = v26;
            WTF::StringTypeAdapter<WTF::StringImpl *,void>::writeTo<unsigned char>((uint64_t *)&v110, v62 + 20);
            uint64_t v64 = (uint64_t)v110;
            if (v110) {
              uint64_t v64 = *((unsigned int *)v110 + 1);
            }
            v65 = &v63[v64];
            v65[2] = 47;
            *(_WORD *)v65 = 12090;
            v66 = v65 + 3;
            v111 = v27;
            WTF::StringTypeAdapter<WTF::StringImpl *,void>::writeTo<unsigned char>((uint64_t *)&v111, v65 + 3);
            uint64_t v67 = (uint64_t)v111;
            if (v111) {
              uint64_t v67 = *((unsigned int *)v111 + 1);
            }
            v66[v67] = 58;
            v68 = &v66[v67 + 1];
            uint64_t v69 = 0;
            if ((v25 & 0x8000000000000000) != 0)
            {
              unint64_t v74 = -(uint64_t)v25;
              uint64_t v23 = v97;
              do
              {
                *((unsigned char *)&v114 + v69--) = (v74 % 0xA) | 0x30;
                BOOL v32 = v74 > 9;
                v74 /= 0xAuLL;
              }
              while (v32);
              uint64_t v75 = v69 + 24;
              v70 = (char *)&location + v69 + 24;
              unsigned char *v70 = 45;
              if (v69 + 26 > 26) {
                goto LABEL_109;
              }
              if (v75 <= 24) {
                uint64_t v75 = 24;
              }
              size_t v71 = v75 - v69 - 23;
            }
            else
            {
              uint64_t v23 = v97;
              do
              {
                *((unsigned char *)&v114 + v69--) = (v25 % 0xA) | 0x30;
                BOOL v32 = v25 > 9;
                v25 /= 0xAuLL;
              }
              while (v32);
              if (v69 + 26 > 25) {
                goto LABEL_109;
              }
              v70 = (char *)&v114 + v69 + 1;
              size_t v71 = -v69;
            }
            memcpy(v68, v70, v71);
LABEL_109:
            v101 = v54;
            MEMORY[0x19972E890](&to, &v101, 0);
            uint64_t v77 = *(void *)(v23 + 24);
            if (v77)
            {
              uint64_t v78 = *(void *)(v77 + 8);
              if (v78) {
                (*(void (**)(uint64_t, id *))(*(void *)v78 + 96))(v78, &to);
              }
            }
            v79 = (WTF::StringImpl *)to;
            id to = 0;
            if (v79)
            {
              if (*(_DWORD *)v79 == 2) {
                WTF::StringImpl::destroy(v79, v76);
              }
              else {
                *(_DWORD *)v79 -= 2;
              }
            }
            v80 = v101;
            v101 = 0;
            if (v80)
            {
              if (*(_DWORD *)v80 == 2) {
                WTF::StringImpl::destroy(v80, v76);
              }
              else {
                *(_DWORD *)v80 -= 2;
              }
            }
            v81 = v99;
            v99 = 0;
            if (v81)
            {
              if (*(_DWORD *)v81 == 2) {
                WTF::StringImpl::destroy(v81, v76);
              }
              else {
                *(_DWORD *)v81 -= 2;
              }
            }
            v82 = v100;
            v100 = 0;
            if (v82)
            {
              if (*(_DWORD *)v82 == 2) {
                WTF::StringImpl::destroy(v82, v76);
              }
              else {
                *(_DWORD *)v82 -= 2;
              }
            }
            goto LABEL_128;
          }
        }
        else if (v51)
        {
          if (v51 <= 0x7FFFFFEF)
          {
            WTF::tryFastCompactMalloc((WTF *)(2 * v51 + 20));
            v52 = (char *)location;
            if (location)
            {
              uint64_t v96 = v23;
              v53 = (char *)location + 20;
              *(_DWORD *)id location = 2;
              *((_DWORD *)v52 + 1) = v51;
              *((void *)v52 + 1) = v52 + 20;
              v54 = (WTF::StringImpl *)v52;
              *((_DWORD *)v52 + 4) = 0;
              v110 = v26;
              WTF::StringTypeAdapter<WTF::StringImpl *,void>::writeTo<char16_t>((uint64_t *)&v110, v52 + 20);
              uint64_t v55 = (uint64_t)v110;
              if (v110) {
                uint64_t v55 = *((unsigned int *)v110 + 1);
              }
              v56 = &v53[2 * v55];
              *(_DWORD *)v56 = 3080250;
              *((_WORD *)v56 + 2) = 47;
              v57 = v56 + 6;
              v111 = v27;
              WTF::StringTypeAdapter<WTF::StringImpl *,void>::writeTo<char16_t>((uint64_t *)&v111, v56 + 6);
              uint64_t v58 = (uint64_t)v111;
              if (v111) {
                uint64_t v58 = *((unsigned int *)v111 + 1);
              }
              v59 = &v57[2 * v58];
              *(_WORD *)v59 = 58;
              v60 = v59 + 2;
              if ((v25 & 0x8000000000000000) != 0)
              {
                unint64_t v72 = -(uint64_t)v25;
                uint64_t v73 = 24;
                uint64_t v23 = v96;
                do
                {
                  *((unsigned char *)&location + v73--) = (v72 % 0xA) | 0x30;
                  BOOL v32 = v72 > 9;
                  v72 /= 0xAuLL;
                }
                while (v32);
                *((unsigned char *)&location + v73) = 45;
                if (v73 + 2 <= 26)
                {
                  do
                  {
                    *v60++ = *((unsigned __int8 *)&location + v73);
                    BOOL v32 = v73++ < 24;
                  }
                  while (v32);
                }
              }
              else
              {
                uint64_t v61 = 0;
                uint64_t v23 = v96;
                do
                {
                  *((unsigned char *)&v114 + v61--) = (v25 % 0xA) | 0x30;
                  BOOL v32 = v25 > 9;
                  v25 /= 0xAuLL;
                }
                while (v32);
                if (v61 + 26 <= 25)
                {
                  do
                  {
                    *v60++ = *((unsigned __int8 *)&v114 + v61 + 1);
                    BOOL v44 = __CFADD__(v61++, 1);
                  }
                  while (!v44);
                }
              }
              goto LABEL_109;
            }
          }
LABEL_142:
          __break(0xC471u);
          return;
        }
        v54 = (WTF::StringImpl *)MEMORY[0x1E4F30960];
        *MEMORY[0x1E4F30960] += 2;
        goto LABEL_109;
      }
LABEL_51:
      unint64_t v43 = -v24;
      int v30 = 1;
      do
      {
        ++v30;
        BOOL v44 = v43 >= 0xA;
        v43 /= 0xAuLL;
      }
      while (v44);
      goto LABEL_53;
    }
  }
  else
  {
    uint64_t v102 = 0;
  }
LABEL_128:
  id location = 0;
  objc_initWeak(&location, self);
  WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)(v11 + 8), v11);
  v83 = *(atomic_uint **)(v11 + 8);
  if (v83) {
    atomic_fetch_add(v83, 1u);
  }
  *(void *)&long long v113 = v83;
  *((void *)&v113 + 1) = _Block_copy(a6);
  uint64_t v114 = v15;
  uint64_t v84 = v102;
  if (v102) {
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref((atomic_uchar *volatile *)(v102 + 8));
  }
  uint64_t v115 = v84;
  char v116 = 0;
  id to = 0;
  objc_moveWeak(&to, &location);
  long long v85 = v113;
  long long v113 = 0uLL;
  *(_OWORD *)v104 = v85;
  uint64_t v86 = v115;
  uint64_t v115 = 0;
  uint64_t v105 = v114;
  uint64_t v106 = v86;
  char v107 = v116;
  v87 = (char *)malloc_type_malloc(0x50uLL, 0x10E00402AFD4002uLL);
  *(void *)v87 = MEMORY[0x1E4F14398];
  *((void *)v87 + 1) = 50331650;
  *((void *)v87 + 2) = WTF::BlockPtr<void ()(NSURLAuthenticationChallenge *,int)>::fromCallable<-[WKNetworkSessionDelegate URLSession:task:didReceiveChallenge:completionHandler:]::$_15>(-[WKNetworkSessionDelegate URLSession:task:didReceiveChallenge:completionHandler:]::$_15)::{lambda(void *,NSURLAuthenticationChallenge *,int)#1}::__invoke;
  *((void *)v87 + 3) = &WTF::BlockPtr<void ()(NSURLAuthenticationChallenge *,int)>::fromCallable<-[WKNetworkSessionDelegate URLSession:task:didReceiveChallenge:completionHandler:]::$_15>(-[WKNetworkSessionDelegate URLSession:task:didReceiveChallenge:completionHandler:]::$_15)::descriptor;
  *((void *)v87 + 4) = 0;
  objc_moveWeak((id *)v87 + 4, &to);
  long long v88 = *(_OWORD *)v104;
  v104[0] = 0;
  v104[1] = 0;
  *(_OWORD *)(v87 + 40) = v88;
  uint64_t v89 = v106;
  *((void *)v87 + 7) = v105;
  *((void *)v87 + 8) = v89;
  v87[72] = v107;
  uint64_t v106 = 0;
  _Block_release(0);
  v91 = (unsigned int *)v104[0];
  v104[0] = 0;
  if (v91 && atomic_fetch_add((atomic_uint *volatile)v91, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v91);
    WTF::fastFree((WTF *)v91, v90);
  }
  objc_destroyWeak(&to);
  uint64_t v92 = v115;
  uint64_t v115 = 0;
  if (v92) {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(atomic_uchar **)(v92 + 8));
  }
  _Block_release(*((const void **)&v113 + 1));
  v94 = (unsigned int *)v113;
  *(void *)&long long v113 = 0;
  if (v94 && atomic_fetch_add((atomic_uint *volatile)v94, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v94);
    WTF::fastFree((WTF *)v94, v93);
  }
  objc_destroyWeak(&location);
  objc_msgSend(MEMORY[0x1E4F18DC0], "_strictTrustEvaluate:queue:completionHandler:", a5, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F08], "mainQueue"), "underlyingQueue"), v87);
  _Block_release(v87);
  uint64_t v95 = v102;
  uint64_t v102 = 0;
  if (v95) {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(atomic_uchar **)(v95 + 8));
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  v5 = (NSError *)a5;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    if (objc_msgSend(a5, "userInfo", a3)) {
      int v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
    }
    else {
      int v28 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    }
    int v29 = v28;
    objc_msgSend(v28, "setObject:forKeyedSubscript:", objc_msgSend(a4, "description"), @"networkTaskDescription");
    if (self)
    {
      [(WKNetworkSessionDelegate *)self existingTask:a4];
      if (*(void *)buf)
      {
        unsigned int v30 = *(unsigned __int8 *)(*(void *)buf + 715) - 1;
        if (v30 > 4) {
          unint64_t v31 = @"Unknown";
        }
        else {
          unint64_t v31 = off_1E5811BE8[(char)v30];
        }
        [v29 setObject:v31 forKeyedSubscript:@"networkTaskMetricsPrivacyStance"];
        id ResolutionReport = extractResolutionReport(v5);
        if (ResolutionReport)
        {
          [v29 setObject:ResolutionReport forKeyedSubscript:@"networkResolutionReport"];
        }
        else
        {
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          uint64_t v37 = [(NSError *)v5 underlyingErrors];
          uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v51 objects:v59 count:16];
          if (v38)
          {
            uint64_t v40 = *(void *)v52;
            while (2)
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v52 != v40) {
                  objc_enumerationMutation(v37);
                }
                id v42 = extractResolutionReport(*(NSError **)(*((void *)&v51 + 1) + 8 * i));
                if (v42)
                {
                  [v29 setObject:v42 forKeyedSubscript:@"networkResolutionReport"];
                  goto LABEL_55;
                }
              }
              uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v51 objects:v59 count:16];
              if (v38) {
                continue;
              }
              break;
            }
          }
        }
LABEL_55:
        uint64_t v39 = *(void *)buf;
        *(void *)buf = 0;
        if (v39) {
          WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(atomic_uchar **)(v39 + 8));
        }
      }
    }
    v5 = (NSError *)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", -[NSError domain](v5, "domain"), -[NSError code](v5, "code"), v29);
  }
  if (self)
  {
    [(WKNetworkSessionDelegate *)self existingTask:a4];
    if (v50)
    {
      MEMORY[0x199731570](buf, v5);
      if (!kdebug_is_enabled())
      {
LABEL_5:
        uint64_t v9 = *(void *)(v50 + 24);
        if (v9)
        {
          uint64_t v10 = *(void *)(v9 + 8);
          if (v10) {
            (*(void (**)(uint64_t, unsigned char *, uint64_t))(*(void *)v10 + 40))(v10, buf, v50 + 616);
          }
        }
        goto LABEL_8;
      }
      int v43 = *MEMORY[0x1E4F30948];
      BOOL v44 = WTFSignpostLogHandle();
      BOOL v45 = v44;
      if (v43)
      {
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v46 = *(void *)(v50 + 608);
          uint64_t v47 = WTFCurrentContinuousTime();
          *(_DWORD *)v60 = 67110144;
          BOOL v61 = 0;
          __int16 v62 = 1024;
          int v63 = 0;
          __int16 v64 = 2048;
          uint64_t v65 = v46;
          __int16 v66 = 2048;
          uint64_t v67 = v47;
          __int16 v68 = 1024;
          BOOL v69 = v57 != 0;
          _os_log_impl(&dword_1985F2000, v45, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu completed with error: %d", v60, 0x28u);
        }
        goto LABEL_5;
      }
      int v48 = *(const void **)(v50 + 608);
      if (v48)
      {
        os_signpost_id_t v49 = os_signpost_id_make_with_pointer(v44, v48);
        if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_5;
        }
      }
      else
      {
        os_signpost_id_t v49 = 0xEEEEB0B5B2B2EEEELL;
      }
      if (os_signpost_enabled(v45))
      {
        *(_DWORD *)v60 = 67109120;
        BOOL v61 = v57 != 0;
        _os_signpost_emit_with_name_impl(&dword_1985F2000, v45, OS_SIGNPOST_EVENT, v49, "DataTask", "completed with error: %d", v60, 8u);
      }
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v50 = 0;
  }
  uint64_t v15 = [(WKNetworkSessionDelegate *)self existingWebSocketTask:a4];
  if (!v15)
  {
    if (!v5) {
      goto LABEL_19;
    }
    m_ptr = self->_sessionWrapper.m_impl.m_ptr;
    if (!m_ptr) {
      goto LABEL_19;
    }
    uint64_t v17 = *((void *)m_ptr + 1);
    if (!v17) {
      goto LABEL_19;
    }
    unint64_t v18 = WTF::HashMap<unsigned long long,WTF::ObjectIdentifierGeneric<WebKit::DownloadIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::DownloadIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>,WTF::HashTableTraits>::takeOptional((uint64_t *)(v17 + 32), [a4 taskIdentifier]);
    if (!v19) {
      goto LABEL_19;
    }
    CFTypeRef v20 = self->_session.m_impl.m_ptr;
    if (!v20) {
      goto LABEL_19;
    }
    uint64_t v21 = *((void *)v20 + 1);
    if (!v21) {
      goto LABEL_19;
    }
    uint64_t v22 = (uint64_t *)(*(void *)(v21 + 32) + 192);
    *(void *)buf = v18;
    uint64_t v23 = WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>,std::unique_ptr<WebKit::RemoteCDMInstanceProxy>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteCDMInstanceProxy>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>,std::unique_ptr<WebKit::RemoteCDMInstanceProxy>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteCDMInstanceProxy>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>>,WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>(v22, buf);
    if (!v23) {
      goto LABEL_19;
    }
    uint64_t v24 = (unsigned char *)v23;
    unint64_t v25 = [(NSError *)v5 userInfo];
    if (v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = [(NSDictionary *)v25 objectForKeyedSubscript:@"NSURLSessionDownloadTaskResumeData"];
        if (v26)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v27 = (char *)[v26 bytes];
            unint64_t v25 = (NSDictionary *)[v26 length];
LABEL_51:
            MEMORY[0x199731570](buf, v5);
            WebKit::Download::didFail(v24, (uint64_t)buf, v27, (WTF *)v25);
LABEL_8:
            CFTypeRef v11 = cf;
            CFTypeRef cf = 0;
            if (v11) {
              CFRelease(v11);
            }
            unsigned int v12 = v56;
            v56 = 0;
            if (v12)
            {
              if (*(_DWORD *)v12 == 2) {
                WTF::StringImpl::destroy(v12, v8);
              }
              else {
                *(_DWORD *)v12 -= 2;
              }
            }
            id v13 = *(WTF::StringImpl **)&buf[8];
            *(void *)&buf[8] = 0;
            if (v13)
            {
              if (*(_DWORD *)v13 == 2) {
                WTF::StringImpl::destroy(v13, v8);
              }
              else {
                *(_DWORD *)v13 -= 2;
              }
            }
            uint64_t v14 = *(WTF::StringImpl **)buf;
            *(void *)buf = 0;
            if (v14)
            {
              if (*(_DWORD *)v14 == 2) {
                WTF::StringImpl::destroy(v14, v8);
              }
              else {
                *(_DWORD *)v14 -= 2;
              }
            }
            goto LABEL_19;
          }
          BOOL v32 = qword_1EB3581B8;
          if (os_log_type_enabled((os_log_t)qword_1EB3581B8, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = [a4 taskIdentifier];
            CFTypeRef v34 = (objc_class *)objc_opt_class();
            uint64_t v35 = [NSStringFromClass(v34) UTF8String];
            *(_DWORD *)buf = 134218242;
            *(void *)&buf[4] = v33;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v35;
            _os_log_impl(&dword_1985F2000, v32, OS_LOG_TYPE_DEFAULT, "Download task %llu finished with resume data of wrong class: %s", buf, 0x16u);
          }
        }
      }
      uint64_t v27 = 0;
      unint64_t v25 = 0;
      goto LABEL_51;
    }
    uint64_t v27 = 0;
    goto LABEL_51;
  }
  if (!*((unsigned char *)v15 + 64))
  {
    *((unsigned char *)v15 + 64) = 1;
    WebKit::NetworkSocketChannel::didClose(*((uint64_t **)v15 + 6), (WTF::StringImpl *)0x3EE, MEMORY[0x1E4F30980]);
  }
LABEL_19:
  if (v50) {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(atomic_uchar **)(v50 + 8));
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  if (!self) {
    return;
  }
  [(WKNetworkSessionDelegate *)self existingTask:a4];
  if (!v94) {
    return;
  }
  uint64_t v7 = (void *)[a5 transactionMetrics];
  int v8 = (void *)[v7 lastObject];
  uint64_t v9 = v94;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "firstObject"), "fetchStartDate"), "timeIntervalSince1970");
  if (*(double *)&v10 == 0.0)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v84 = v10;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v84);
  }
  *(void *)(v9 + 616) = v11;
  objc_msgSend((id)objc_msgSend(v8, "fetchStartDate"), "timeIntervalSince1970");
  if (*(double *)&v12 == 0.0)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v84 = v12;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v84);
  }
  *(void *)(v9 + 624) = v13;
  objc_msgSend((id)objc_msgSend(v8, "domainLookupStartDate"), "timeIntervalSince1970");
  if (*(double *)&v14 == 0.0)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v84 = v14;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v84);
  }
  *(void *)(v9 + 632) = v15;
  objc_msgSend((id)objc_msgSend(v8, "domainLookupEndDate"), "timeIntervalSince1970");
  if (*(double *)&v16 == 0.0)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v84 = v16;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v84);
  }
  *(void *)(v9 + 640) = v17;
  objc_msgSend((id)objc_msgSend(v8, "connectStartDate"), "timeIntervalSince1970");
  if (*(double *)&v18 == 0.0)
  {
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v84 = v18;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v84);
  }
  *(void *)(v9 + 648) = v19;
  if ([v8 isReusedConnection]
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "response"), "URL"), "scheme"), "isEqualToString:", @"https"))
  {
    *(void *)(v9 + 656) = 0xBFF0000000000000;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(v8, "secureConnectionStartDate"), "timeIntervalSince1970");
    if (*(double *)&v20 == 0.0)
    {
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v84 = v20;
      WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v84);
    }
    *(void *)(v9 + 656) = v21;
  }
  objc_msgSend((id)objc_msgSend(v8, "connectEndDate"), "timeIntervalSince1970");
  if (*(double *)&v22 == 0.0)
  {
    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v84 = v22;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v84);
  }
  *(void *)(v9 + 664) = v23;
  objc_msgSend((id)objc_msgSend(v8, "requestStartDate"), "timeIntervalSince1970");
  if (*(double *)&v24 == 0.0)
  {
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v84 = v24;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v84);
  }
  *(void *)(v9 + 672) = v25;
  objc_msgSend((id)objc_msgSend(v8, "responseStartDate"), "timeIntervalSince1970");
  if (*(double *)&v26 == 0.0)
  {
    double v27 = 0.0;
  }
  else
  {
    uint64_t v84 = v26;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v84);
  }
  if (*(double *)(v9 + 672) >= v27) {
    double v27 = *(double *)(v9 + 672);
  }
  *(double *)(v9 + 680) = v27;
  objc_msgSend((id)objc_msgSend(v8, "responseEndDate"), "timeIntervalSince1970");
  if (*(double *)&v28 == 0.0)
  {
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v84 = v28;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v84);
  }
  *(void *)(v9 + 688) = v29;
  *(unsigned char *)(v9 + 714) |= 1u;
  *(_WORD *)(v9 + 712) = [a5 redirectCount];
  MEMORY[0x19972EAD0](&v84, [v8 networkProtocolName]);
  unint64_t v31 = v84;
  uint64_t v84 = 0;
  BOOL v32 = *(WTF::StringImpl **)(v9 + 704);
  *(void *)(v9 + 704) = v31;
  if (v32)
  {
    int v33 = *(_DWORD *)v32 - 2;
    if (*(_DWORD *)v32 != 2)
    {
LABEL_29:
      *(_DWORD *)BOOL v32 = v33;
      goto LABEL_30;
    }
    WTF::StringImpl::destroy(v32, v30);
    BOOL v32 = v84;
    uint64_t v84 = 0;
    if (v32)
    {
      int v33 = *(_DWORD *)v32 - 2;
      if (*(_DWORD *)v32 != 2) {
        goto LABEL_29;
      }
      WTF::StringImpl::destroy(v32, v45);
    }
  }
LABEL_30:
  if ([v8 isCellular]) {
    char v34 = 2;
  }
  else {
    char v34 = 0;
  }
  *(unsigned char *)(v9 + 714) = *(unsigned char *)(v9 + 714) & 0xFD | v34;
  if ([v8 isExpensive]) {
    char v35 = 4;
  }
  else {
    char v35 = 0;
  }
  *(unsigned char *)(v9 + 714) = *(unsigned char *)(v9 + 714) & 0xFB | v35;
  if ([v8 isConstrained]) {
    char v36 = 8;
  }
  else {
    char v36 = 0;
  }
  *(unsigned char *)(v9 + 714) = *(unsigned char *)(v9 + 714) & 0xF7 | v36;
  if ([v8 isMultipath]) {
    char v37 = 16;
  }
  else {
    char v37 = 0;
  }
  *(unsigned char *)(v9 + 714) = *(unsigned char *)(v9 + 714) & 0xEF | v37;
  if ([v8 isReusedConnection]) {
    char v38 = 32;
  }
  else {
    char v38 = 0;
  }
  *(unsigned char *)(v9 + 714) = *(unsigned char *)(v9 + 714) & 0xDF | v38;
  unsigned int v39 = [v8 _privacyStance];
  if (v39 >= 6) {
    char v40 = 0;
  }
  else {
    char v40 = v39;
  }
  *(unsigned char *)(v9 + 715) = v40;
  uint64_t v41 = *(void *)(v94 + 24);
  if (v41)
  {
    uint64_t v42 = *(void *)(v41 + 8);
    if (v42)
    {
      if ((*(unsigned int (**)(uint64_t))(*(void *)v42 + 88))(v42))
      {
        WebCore::AdditionalNetworkLoadMetricsForWebInspector::create(&v93);
        [a4 priority];
        if (*MEMORY[0x1E4F18CF8] > v46) {
          char v47 = 1;
        }
        else {
          char v47 = 2;
        }
        if (*MEMORY[0x1E4F18D00] >= v46) {
          char v47 = 0;
        }
        *(unsigned char *)(v93 + 4) = v47;
        unsigned int v48 = objc_msgSend((id)objc_msgSend(v8, "remotePort"), "unsignedIntValue");
        if (v48)
        {
          MEMORY[0x19972EAD0](&v92, [v8 remoteAddress]);
          WTF::makeString<WTF::String,char,unsigned int>((uint64_t)&v84, (uint64_t)v92, v48);
          uint64_t v50 = *(WTF::StringImpl **)(v93 + 8);
          *(void *)(v93 + 8) = v84;
          if (v50)
          {
            if (*(_DWORD *)v50 == 2) {
              WTF::StringImpl::destroy(v50, v49);
            }
            else {
              *(_DWORD *)v50 -= 2;
            }
          }
          long long v51 = v92;
          uint64_t v92 = 0;
          if (!v51) {
            goto LABEL_83;
          }
        }
        else
        {
          MEMORY[0x19972EAD0](&v84, [v8 remoteAddress]);
          v76 = v84;
          uint64_t v84 = 0;
          long long v51 = *(WTF::StringImpl **)(v93 + 8);
          *(void *)(v93 + 8) = v76;
          if (!v51) {
            goto LABEL_83;
          }
          int v52 = *(_DWORD *)v51 - 2;
          if (*(_DWORD *)v51 != 2) {
            goto LABEL_82;
          }
          WTF::StringImpl::destroy(v51, v75);
          long long v51 = v84;
          uint64_t v84 = 0;
          if (!v51) {
            goto LABEL_83;
          }
        }
        int v52 = *(_DWORD *)v51 - 2;
        if (*(_DWORD *)v51 != 2)
        {
LABEL_82:
          *(_DWORD *)long long v51 = v52;
          goto LABEL_83;
        }
        WTF::StringImpl::destroy(v51, v49);
LABEL_83:
        MEMORY[0x19972EAD0](&v84, objc_msgSend((id)objc_msgSend(v8, "_connectionIdentifier", v9), "UUIDString"));
        long long v54 = v84;
        uint64_t v84 = 0;
        uint64_t v55 = *(WTF::StringImpl **)(v93 + 16);
        *(void *)(v93 + 16) = v54;
        if (v55)
        {
          int v56 = *(_DWORD *)v55 - 2;
          if (*(_DWORD *)v55 == 2)
          {
            WTF::StringImpl::destroy(v55, v53);
            uint64_t v55 = v84;
            uint64_t v84 = 0;
            if (!v55) {
              goto LABEL_86;
            }
            int v56 = *(_DWORD *)v55 - 2;
            if (*(_DWORD *)v55 == 2)
            {
              WTF::StringImpl::destroy(v55, v77);
              goto LABEL_86;
            }
          }
          *(_DWORD *)uint64_t v55 = v56;
        }
LABEL_86:
        stringForTLSProtocolVersion(&v84, objc_msgSend((id)objc_msgSend(v8, "negotiatedTLSProtocolVersion"), "unsignedShortValue"));
        uint64_t v58 = *(WTF::StringImpl **)(v93 + 24);
        *(void *)(v93 + 24) = v84;
        if (v58)
        {
          if (*(_DWORD *)v58 == 2) {
            WTF::StringImpl::destroy(v58, v57);
          }
          else {
            *(_DWORD *)v58 -= 2;
          }
        }
        stringForTLSCipherSuite(&v84, objc_msgSend((id)objc_msgSend(v8, "negotiatedTLSCipherSuite"), "unsignedShortValue"));
        v60 = *(WTF::StringImpl **)(v93 + 32);
        *(void *)(v93 + 32) = v84;
        if (v60)
        {
          if (*(_DWORD *)v60 == 2) {
            WTF::StringImpl::destroy(v60, v59);
          }
          else {
            *(_DWORD *)v60 -= 2;
          }
        }
        uint64_t v84 = 0;
        long long v85 = &v84;
        uint64_t v86 = 0x5012000000;
        v87 = __Block_byref_object_copy__0;
        long long v88 = __Block_byref_object_dispose__0;
        uint64_t v89 = 0;
        WebCore::HTTPHeaderMap::HTTPHeaderMap((WebCore::HTTPHeaderMap *)v90);
        BOOL v61 = objc_msgSend((id)objc_msgSend(v8, "request"), "allHTTPHeaderFields");
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __71__WKNetworkSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke;
        v83[3] = &unk_1E5811BA8;
        v83[4] = &v84;
        [v61 enumerateKeysAndObjectsUsingBlock:v83];
        WebCore::HTTPHeaderMap::operator=(v93 + 40, (uint64_t *)v85 + 6);
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        __int16 v62 = (void *)[a5 transactionMetrics];
        uint64_t v63 = 0;
        uint64_t v64 = 0;
        uint64_t v65 = [v62 countByEnumeratingWithState:&v79 objects:v95 count:16];
        if (v65)
        {
          uint64_t v66 = *(void *)v80;
          do
          {
            for (uint64_t i = 0; i != v65; ++i)
            {
              if (*(void *)v80 != v66) {
                objc_enumerationMutation(v62);
              }
              __int16 v68 = *(void **)(*((void *)&v79 + 1) + 8 * i);
              v63 += [v68 countOfRequestHeaderBytesSent];
              v64 += [v68 countOfResponseHeaderBytesReceived];
            }
            uint64_t v65 = [v62 countByEnumeratingWithState:&v79 objects:v95 count:16];
          }
          while (v65);
        }
        *(void *)(v93 + 72) = v63;
        uint64_t v69 = [a4 countOfBytesSent];
        uint64_t v70 = v93;
        *(void *)(v93 + 80) = v64;
        *(void *)(v70 + 88) = v69;
        char v71 = [v8 isProxyConnection];
        uint64_t v72 = v93;
        *(unsigned char *)(v93 + 96) = v71;
        uint64_t v93 = 0;
        uint64_t v9 = v78;
        uint64_t v73 = *(WebCore::AdditionalNetworkLoadMetricsForWebInspector **)(v78 + 736);
        *(void *)(v78 + 736) = v72;
        if (v73) {
          WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v73);
        }
        _Block_object_dispose(&v84, 8);
        WTF::Vector<WebCore::HTTPHeaderMap::UncommonHeader,0ul,WTF::CrashOnOverflow,0ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)&v91);
        WTF::Vector<WebCore::HTTPHeaderMap::CommonHeader,0ul,WTF::CrashOnOverflow,6ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)v90);
        unint64_t v74 = (WebCore::AdditionalNetworkLoadMetricsForWebInspector *)v93;
        uint64_t v93 = 0;
        if (v74) {
          WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v74);
        }
      }
    }
  }
  *(void *)(v9 + 720) = [v8 countOfResponseBodyBytesReceived];
  uint64_t v43 = [v8 countOfResponseBodyBytesAfterDecoding];
  *(void *)(v9 + 728) = v43;
  if (!v43) {
    *(void *)(v9 + 720) = 0;
  }
  uint64_t v44 = v94;
  uint64_t v94 = 0;
  if (v44) {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(atomic_uchar **)(v44 + 8));
  }
}

WTF::StringImpl *__71__WKNetworkSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  MEMORY[0x19972EAD0](&v9);
  MEMORY[0x19972EAD0](&v8, a3);
  WebCore::HTTPHeaderMap::set((WebCore::HTTPHeaderMap *)(v4 + 48), (const WTF::String *)&v9, (const WTF::String *)&v8);
  uint64_t v6 = v8;
  int v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  result = v9;
  uint64_t v9 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2) {
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v5);
    }
    else {
      *(_DWORD *)result -= 2;
    }
  }
  return result;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveInformationalResponse:(id)a5
{
  if (self)
  {
    [(WKNetworkSessionDelegate *)self existingTask:a4];
    if (v13)
    {
      WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v11, (NSURLResponse *)a5);
      uint64_t v7 = *(void *)(v13 + 24);
      if (v7)
      {
        uint64_t v8 = *(void *)(v7 + 8);
        if (v8) {
          (*(void (**)(uint64_t, unsigned char *))(*(void *)v8 + 16))(v8, v11);
        }
      }
      CFTypeRef v9 = cf;
      CFTypeRef cf = 0;
      if (v9) {
        CFRelease(v9);
      }
      WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v11, v6);
      uint64_t v10 = v13;
      uint64_t v13 = 0;
      if (v10) {
        WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(atomic_uchar **)(v10 + 8));
      }
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _didReceiveInformationalResponse:(id)a5
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(WKNetworkSessionDelegate *)self URLSession:a3 task:a4 didReceiveInformationalResponse:a5];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = objc_msgSend(a4, "taskIdentifier", a3);
  if (!self)
  {
    uint64_t v53 = 0;
    goto LABEL_29;
  }
  uint64_t v11 = v10;
  [(WKNetworkSessionDelegate *)self existingTask:a4];
  if (!v53)
  {
LABEL_29:
    (*((void (**)(id, void))a6 + 2))(a6, 0);
    goto LABEL_25;
  }
  unsigned int v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "_incompleteTaskMetrics"), "transactionMetrics"), "lastObject");
  BOOL v13 = [v12 _privacyStance] == 4 || objc_msgSend(v12, "_privacyStance") == 1;
  __int16 v14 = objc_msgSend((id)objc_msgSend(v12, "negotiatedTLSProtocolVersion"), "unsignedShortValue");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_36;
  }
  int v15 = [a5 statusCode];
  uint64_t v16 = (void *)[a5 valueForHTTPHeaderField:@"X-Content-Type-Options"];
  if (v16) {
    [v16 caseInsensitiveCompare:@"nosniff"];
  }
  if (v15 != 304)
  {
LABEL_36:
    [a5 _CFURLResponse];
    WebCore::adjustMIMETypeIfNecessary();
  }
  WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v50, (NSURLResponse *)a5);
  uint64_t v17 = (WTF::URL *)WebCore::ResourceResponseBase::url((WebCore::ResourceResponseBase *)v50);
  uint64_t v18 = (WTF::URL::hasSpecialScheme(v17) & 1) != 0 && !v13;
  WebCore::ResourceResponse::disableLazyInitialization((WebCore::ResourceResponse *)v50);
  WebCore::copyTimingData();
  CFTypeRef v20 = *(WTF **)buf;
  *(void *)buf = 0;
  uint64_t v21 = (WebCore::AdditionalNetworkLoadMetricsForWebInspector **)v51;
  long long v51 = v20;
  if (v21)
  {
    WTF::ThreadSafeRefCounted<WTF::Box<WebCore::NetworkLoadMetrics>::Data,(WTF::DestructionThread)0>::deref(v21, v19);
    uint64_t v23 = *(WebCore::AdditionalNetworkLoadMetricsForWebInspector ***)buf;
    *(void *)buf = 0;
    if (v23) {
      WTF::ThreadSafeRefCounted<WTF::Box<WebCore::NetworkLoadMetrics>::Data,(WTF::DestructionThread)0>::deref(v23, v22);
    }
  }
  uint64_t v24 = v53;
  uint64_t v25 = _Block_copy(a6);
  id v26 = (void *)WTF::fastMalloc((WTF *)0x18);
  *id v26 = &unk_1EE9BC4B0;
  v26[1] = v25;
  v26[2] = v11;
  os_signpost_id_t v49 = v26;
  if (!kdebug_is_enabled()) {
    goto LABEL_15;
  }
  int v38 = *MEMORY[0x1E4F30948];
  unsigned int v39 = WTFSignpostLogHandle();
  char v40 = v39;
  if (v38)
  {
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = *(void *)(v24 + 608);
      uint64_t v42 = WTFCurrentContinuousTime();
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = 0;
      __int16 v56 = 1024;
      int v57 = 0;
      __int16 v58 = 2048;
      uint64_t v59 = v41;
      __int16 v60 = 2048;
      uint64_t v61 = v42;
      _os_log_impl(&dword_1985F2000, v40, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu received response headers", buf, 0x22u);
    }
    goto LABEL_15;
  }
  char v47 = *(const void **)(v24 + 608);
  if (!v47)
  {
    os_signpost_id_t v48 = 0xEEEEB0B5B2B2EEEELL;
    goto LABEL_45;
  }
  os_signpost_id_t v48 = os_signpost_id_make_with_pointer(v39, v47);
  if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_45:
    if (os_signpost_enabled(v40))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1985F2000, v40, OS_SIGNPOST_EVENT, v48, "DataTask", "received response headers", buf, 2u);
    }
  }
LABEL_15:
  if (*(unsigned char *)(v24 + 544))
  {
    char v37 = (const WTF::URL *)WebCore::ResourceResponseBase::url((WebCore::ResourceResponseBase *)v50);
    WebKit::NetworkDataTaskCocoa::updateFirstPartyInfoForSession((WebKit::NetworkDataTaskCocoa *)v24, v37);
  }
  else
  {
    double v27 = (WebKit::NetworkIssueReporter *)[*(id *)(v24 + 608) _incompleteTaskMetrics];
    if (WebKit::NetworkIssueReporter::shouldReport(v27, v28))
    {
      uint64_t v43 = *(void *)(v24 + 16);
      if (v43)
      {
        uint64_t v44 = *(void *)(v43 + 8);
        if (v44)
        {
          uint64_t v45 = *(void *)(v24 + 768);
          float v46 = (uint64_t *)WebCore::ResourceRequestBase::url((WebCore::ResourceRequestBase *)(v24 + 128));
          WebKit::NetworkSession::reportNetworkIssue(v44, v45, v46);
        }
      }
    }
  }
  uint64_t v29 = (WebCore::IPAddress *)MEMORY[0x19972EAD0](&v54, objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v24 + 608), "_incompleteTaskMetrics"), "transactionMetrics"), "lastObject"), "remoteAddress"));
  WebCore::IPAddress::fromString((uint64_t *)buf, v29, v30);
  WebKit::NetworkDataTask::didReceiveResponse(v24, (WebCore::ResourceResponseBase *)v50, (unsigned __int16)(v14 - 769) < 2u, v18, (WebCore::IPAddress *)buf, (uint64_t *)&v49);
  BOOL v32 = v54;
  long long v54 = 0;
  if (v32)
  {
    if (*(_DWORD *)v32 == 2) {
      WTF::StringImpl::destroy(v32, v31);
    }
    else {
      *(_DWORD *)v32 -= 2;
    }
  }
  uint64_t v33 = (uint64_t)v49;
  os_signpost_id_t v49 = 0;
  if (v33) {
    (*(void (**)(uint64_t))(*(void *)v33 + 8))(v33);
  }
  _Block_release(0);
  CFTypeRef v35 = cf;
  CFTypeRef cf = 0;
  if (v35) {
    CFRelease(v35);
  }
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v50, v34);
LABEL_25:
  uint64_t v36 = v53;
  uint64_t v53 = 0;
  if (v36) {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(atomic_uchar **)(v36 + 8));
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = (WebCore::FragmentedSharedBuffer *)a5;
  if (!self) {
    return;
  }
  [(WKNetworkSessionDelegate *)self existingTask:a4];
  uint64_t v6 = v23;
  if (!v23) {
    return;
  }
  WebCore::SharedBuffer::create<NSData *&>(&v24, v5, (uint64_t *)&v22);
  uint64_t v7 = (uint64_t)v22;
  if (kdebug_is_enabled())
  {
    int v13 = *MEMORY[0x1E4F30948];
    __int16 v14 = WTFSignpostLogHandle();
    int v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(v6 + 608);
        uint64_t v17 = WTFCurrentContinuousTime();
        uint64_t v18 = *(void *)(v7 + 48);
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)id v26 = 0;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = 0;
        __int16 v27 = 2048;
        uint64_t v28 = v16;
        __int16 v29 = 2048;
        uint64_t v30 = v17;
        __int16 v31 = 2048;
        uint64_t v32 = v18;
        _os_log_impl(&dword_1985F2000, v15, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu received %zd bytes", buf, 0x2Cu);
      }
      goto LABEL_4;
    }
    uint64_t v19 = *(const void **)(v6 + 608);
    if (v19)
    {
      os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v14, v19);
      if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_4;
      }
    }
    else
    {
      os_signpost_id_t v20 = 0xEEEEB0B5B2B2EEEELL;
    }
    if (os_signpost_enabled(v15))
    {
      uint64_t v21 = *(void *)(v7 + 48);
      *(_DWORD *)buf = 134217984;
      *(void *)id v26 = v21;
      _os_signpost_emit_with_name_impl(&dword_1985F2000, v15, OS_SIGNPOST_EVENT, v20, "DataTask", "received %zd bytes", buf, 0xCu);
    }
  }
LABEL_4:
  uint64_t v9 = *(void *)(v6 + 24);
  if (v9)
  {
    uint64_t v10 = *(void *)(v9 + 8);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)v10 + 32))(v10, v7);
    }
  }
  uint64_t v11 = v22;
  uint64_t v22 = 0;
  if (v11) {
    WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref(v11, v8);
  }
  uint64_t v12 = v23;
  uint64_t v23 = 0;
  if (v12) {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(atomic_uchar **)(v12 + 8));
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  m_ptr = self->_sessionWrapper.m_impl.m_ptr;
  if (m_ptr)
  {
    uint64_t v6 = *((void *)m_ptr + 1);
    if (v6)
    {
      unint64_t v8 = WTF::HashMap<unsigned long long,WTF::ObjectIdentifierGeneric<WebKit::DownloadIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::DownloadIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>,WTF::HashTableTraits>::takeOptional((uint64_t *)(v6 + 32), objc_msgSend(a4, "taskIdentifier", a3));
      if (v9)
      {
        uint64_t v10 = self->_session.m_impl.m_ptr;
        if (v10)
        {
          uint64_t v11 = *((void *)v10 + 1);
          if (v11)
          {
            uint64_t v12 = (uint64_t *)(*(void *)(v11 + 32) + 192);
            unint64_t v14 = v8;
            int v13 = (WebKit::Download *)WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>,std::unique_ptr<WebKit::RemoteCDMInstanceProxy>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteCDMInstanceProxy>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>,std::unique_ptr<WebKit::RemoteCDMInstanceProxy>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteCDMInstanceProxy>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>>,WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>(v12, &v14);
            if (v13) {
              WebKit::Download::didFinish(v13);
            }
          }
        }
      }
    }
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  m_ptr = self->_sessionWrapper.m_impl.m_ptr;
  if (m_ptr)
  {
    uint64_t v8 = *((void *)m_ptr + 1);
    if (v8)
    {
      uint64_t v13 = objc_msgSend(a4, "taskIdentifier", a3);
      uint64_t v14 = *(void *)(v8 + 32);
      if (v14)
      {
        unsigned int v15 = *(_DWORD *)(v14 - 8);
        unint64_t v16 = (v13 + ~(v13 << 32)) ^ ((unint64_t)(v13 + ~(v13 << 32)) >> 22);
        unint64_t v17 = 9 * ((v16 + ~(v16 << 13)) ^ ((v16 + ~(v16 << 13)) >> 8));
        unint64_t v18 = (v17 ^ (v17 >> 15)) + ~((v17 ^ (v17 >> 15)) << 27);
        uint64_t v19 = v15 & ((v18 >> 31) ^ v18);
        uint64_t v20 = *(void *)(v14 + 16 * v19);
        if (v20 == v13)
        {
LABEL_8:
          uint64_t v22 = self->_session.m_impl.m_ptr;
          if (v22)
          {
            uint64_t v23 = *((void *)v22 + 1);
            if (v23)
            {
              uint64_t v24 = (uint64_t *)(*(void *)(v23 + 32) + 192);
              uint64_t v26 = *(void *)(v14 + 16 * v19 + 8);
              uint64_t v25 = (WebKit::Download *)WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>,std::unique_ptr<WebKit::RemoteCDMInstanceProxy>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteCDMInstanceProxy>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>,std::unique_ptr<WebKit::RemoteCDMInstanceProxy>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteCDMInstanceProxy>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>>,WTF::ObjectIdentifierGeneric<WebKit::RemoteCDMInstanceIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>(v24, &v26);
              if (v25)
              {
                WebKit::Download::didReceiveData(v25, a5, a6, a7);
              }
            }
          }
        }
        else
        {
          int v21 = 1;
          while (v20)
          {
            uint64_t v19 = (v19 + v21) & v15;
            uint64_t v20 = *(void *)(v14 + 16 * v19);
            ++v21;
            if (v20 == v13) {
              goto LABEL_8;
            }
          }
        }
      }
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  if (!self) {
    return;
  }
  [(WKNetworkSessionDelegate *)self existingTask:a4];
  uint64_t v7 = v38;
  if (!v38) {
    return;
  }
  uint64_t v8 = *((void *)v38 + 2);
  if (!v8 || (uint64_t v9 = *(void *)(v8 + 8)) == 0)
  {
    int v38 = 0;
LABEL_26:
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*((atomic_uchar **)v7 + 1));
    return;
  }
  uint64_t v10 = (atomic_uchar **)((char *)v38 + 8);
  WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref((atomic_uchar *volatile *)v38 + 1);
  uint64_t v11 = *((void *)v38 + 5);
  if (v11)
  {
    uint64_t v37 = *((void *)v38 + 5);
    uint64_t v12 = *(void *)(v9 + 32);
    WebKit::NetworkDataTaskCocoa::suggestedFilename((uint64_t)v38, v34);
    uint64_t v13 = (WebKit::Download *)WTF::fastMalloc((WTF *)0x1C8);
    uint64_t v14 = (uint64_t *)(v12 + 160);
    uint64_t v36 = WebKit::Download::Download((uint64_t)v13, (uint64_t)v14, v11, a5, v9);
    unint64_t v16 = v34[0];
    v34[0] = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2) {
        WTF::StringImpl::destroy(v16, v15);
      }
      else {
        *(_DWORD *)v16 -= 2;
      }
    }
    unint64_t v17 = v38;
    uint64_t v18 = *((void *)v38 + 75);
    *((void *)v38 + 75) = 0;
    uint64_t v19 = (const char ***)*((void *)v13 + 8);
    *((void *)v13 + 8) = v18;
    if (v19)
    {
      WTF::RefCounted<WebKit::SandboxExtension>::deref(v19);
      unint64_t v17 = v38;
    }
    WebKit::Download::didCreateDestination(v13, (WebKit::NetworkDataTaskCocoa *)((char *)v17 + 120));
    WebKit::DownloadManager::dataTaskBecameDownloadTask(v14, v37, &v36);
    m_ptr = self->_sessionWrapper.m_impl.m_ptr;
    if (m_ptr)
    {
      uint64_t v21 = *((void *)m_ptr + 1);
      goto LABEL_15;
    }
  }
  else
  {
    __break(1u);
  }
  uint64_t v21 = 0;
LABEL_15:
  uint64_t v22 = [a5 taskIdentifier];
  uint64_t v23 = *(void *)(v21 + 32);
  if (v23)
  {
    int v24 = *(_DWORD *)(v23 - 8);
    unint64_t v25 = (v22 + ~(v22 << 32)) ^ ((unint64_t)(v22 + ~(v22 << 32)) >> 22);
    unint64_t v26 = 9 * ((v25 + ~(v25 << 13)) ^ ((v25 + ~(v25 << 13)) >> 8));
    unint64_t v27 = (v26 ^ (v26 >> 15)) + ~((v26 ^ (v26 >> 15)) << 27);
    unsigned int v28 = v24 & ((v27 >> 31) ^ v27);
    uint64_t v29 = *(void *)(v23 + 16 * v28);
    if (v29 == v22)
    {
LABEL_20:
      __break(0xC471u);
      JUMPOUT(0x198A46958);
    }
    int v30 = 1;
    while (v29)
    {
      unsigned int v28 = (v28 + v30) & v24;
      uint64_t v29 = *(void *)(v23 + 16 * v28);
      ++v30;
      if (v29 == v22) {
        goto LABEL_20;
      }
    }
  }
  __int16 v31 = self->_sessionWrapper.m_impl.m_ptr;
  if (v31) {
    uint64_t v32 = *((void *)v31 + 1);
  }
  else {
    uint64_t v32 = 0;
  }
  uint64_t v35 = [a5 taskIdentifier];
  WTF::HashMap<unsigned long long,WTF::ObjectIdentifierGeneric<WebKit::DownloadIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::DownloadIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>,WTF::HashTableTraits>::add<WTF::ObjectIdentifierGeneric<WebKit::DownloadIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>&>((uint64_t *)(v32 + 32), &v35, &v37, (uint64_t)v34);
  uint64_t v33 = v36;
  uint64_t v36 = 0;
  if (v33) {
    (*(void (**)(uint64_t))(*(void *)v33 + 8))(v33);
  }
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*v10);
  uint64_t v7 = v38;
  int v38 = 0;
  if (v7) {
    goto LABEL_26;
  }
}

- (void)existingWebSocketTask:(id)a3
{
  m_ptr = self->_sessionWrapper.m_impl.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v4 = 0;
  if (!a3) {
    return v4;
  }
  uint64_t v5 = *((void *)m_ptr + 1);
  if (!v5) {
    return v4;
  }
  WTF::HashMap<unsigned long long,WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<unsigned long long,WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<unsigned long long>>,unsigned long long>((atomic_uint **)&v9, *(void *)(v5 + 40), [a3 taskIdentifier]);
  uint64_t v7 = (unsigned int *)v9;
  if (!v9) {
    return 0;
  }
  uint64_t v4 = (void *)*((void *)v9 + 1);
  uint64_t v9 = 0;
  if (atomic_fetch_add((atomic_uint *volatile)v7, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v7);
    WTF::fastFree((WTF *)v7, v6);
  }
  return v4;
}

- (void)URLSession:(id)a3 webSocketTask:(id)a4 didOpenWithProtocol:(id)a5
{
  uint64_t v6 = [(WKNetworkSessionDelegate *)self existingWebSocketTask:a4];
  if (v6)
  {
    uint64_t v7 = v6;
    MEMORY[0x19972EAD0](&v10, a5);
    WebKit::WebSocketTask::didConnect(v7, (const WTF::String *)&v10);
    uint64_t v9 = v10;
    uint64_t v10 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2) {
        WTF::StringImpl::destroy(v9, v8);
      }
      else {
        *(_DWORD *)v9 -= 2;
      }
    }
  }
}

- (void)URLSession:(id)a3 webSocketTask:(id)a4 didCloseWithCode:(int64_t)a5 reason:(id)a6
{
  unsigned __int16 v7 = a5;
  uint64_t v8 = [(WKNetworkSessionDelegate *)self existingWebSocketTask:a4];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (const void *)[[NSString alloc] initWithData:a6 encoding:4];
    MEMORY[0x19972EAD0](&v13, v10);
    if (!*((unsigned char *)v9 + 64))
    {
      *((unsigned char *)v9 + 64) = 1;
      WebKit::NetworkSocketChannel::didClose(*((uint64_t **)v9 + 6), (WTF::StringImpl *)v7, (const WTF::String *)&v13);
    }
    uint64_t v12 = v13;
    uint64_t v13 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
      {
        WTF::StringImpl::destroy(v12, v11);
        if (!v10) {
          return;
        }
LABEL_8:
        CFRelease(v10);
        return;
      }
      *(_DWORD *)v12 -= 2;
    }
    if (!v10) {
      return;
    }
    goto LABEL_8;
  }
}

- (void).cxx_destruct
{
  m_ptr = (unsigned int *)self->_sessionWrapper.m_impl.m_ptr;
  self->_sessionWrapper.m_impl.m_ptr = 0;
  if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, m_ptr);
    WTF::fastFree((WTF *)m_ptr, (void *)a2);
  }
  uint64_t v4 = (unsigned int *)self->_session.m_impl.m_ptr;
  self->_session.m_impl.m_ptr = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, (void *)a2);
  }
}

- (void)URLSession:task:didReceiveChallenge:completionHandler:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int16 v7 = WeakRetained;
  if (WeakRetained && (uint64_t v8 = *((void *)WeakRetained + 2)) != 0 && *(void *)(v8 + 8))
  {
    uint64_t v9 = *(void *)(a1 + 64);
    *(void *)(a1 + 64) = 0;
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10 && a3 && (uint64_t v11 = *(void *)(v10 + 8)) != 0)
    {
      uint64_t v12 = *((void *)WeakRetained + 2);
      if (v12) {
        uint64_t v13 = *(void *)(v12 + 8);
      }
      else {
        uint64_t v13 = 0;
      }
      int v14 = *(unsigned __int8 *)(a1 + 72);
      uint64_t v15 = *(void *)(a1 + 56);
      unint64_t v16 = (void *)WTF::fastMalloc((WTF *)0x10);
      *unint64_t v16 = &unk_1EE9BC1E0;
      uint64_t v17 = *(void *)(a1 + 48);
      *(void *)(a1 + 48) = 0;
      v16[1] = v17;
      MEMORY[0x199737840](v27, a2);
      if (v9) {
        WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref((atomic_uchar *volatile *)(v9 + 8));
      }
      uint64_t v26 = v9;
      uint64_t v18 = (const void *)objc_msgSend((id)objc_msgSend(a2, "protectionSpace"), "serverTrust");
      uint64_t v19 = v18;
      if (v18) {
        CFRetain(v18);
      }
      uint64_t v20 = (void *)WTF::fastMalloc((WTF *)0x18);
      void *v20 = &unk_1EE9BC1B8;
      v20[1] = v16;
      v20[2] = v19;
      unint64_t v25 = v20;
      WebKit::NetworkSessionCocoa::continueDidReceiveChallenge(v11, v13, (WebCore::AuthenticationChallengeBase *)v27, v14 != 0, v15, &v26, (uint64_t *)&v25);
      uint64_t v22 = (uint64_t)v25;
      unint64_t v25 = 0;
      if (v22) {
        (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
      }
      if (v9) {
        WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(atomic_uchar **)(v9 + 8));
      }
      CFTypeRef v23 = cf;
      CFTypeRef cf = 0;
      if (v23) {
        CFRelease(v23);
      }
      CFTypeRef v24 = v28;
      CFTypeRef v28 = 0;
      if (v24) {
        CFRelease(v24);
      }
      WebCore::AuthenticationChallengeBase::~AuthenticationChallengeBase((WebCore::AuthenticationChallengeBase *)v27, v21);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    if (v9) {
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(atomic_uchar **)(v9 + 8));
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (!v7) {
      return;
    }
  }
  CFRelease(v7);
}

- (uint64_t)URLSession:(uint64_t)a1 task:willPerformHTTPRedirection:newRequest:completionHandler:
{
  *(void *)a1 = &unk_1EE9BC438;
  _Block_release(*(const void **)(a1 + 16));
  return a1;
}

- (uint64_t)URLSession:(const void *)a1 task:willPerformHTTPRedirection:newRequest:completionHandler:
{
  *a1 = &unk_1EE9BC438;
  _Block_release(a1[2]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)URLSession:(uint64_t)a1 task:willPerformHTTPRedirection:newRequest:completionHandler:
{
  v2 = (const void *)WebCore::ResourceRequest::nsURLRequest();
  v3 = v2;
  if (v2) {
    CFRetain(v2);
  }
  (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
  if (v3)
  {
    CFRelease(v3);
  }
}

- (uint64_t)URLSession:(uint64_t)a1 task:_schemeUpgraded:completionHandler:
{
  *(void *)a1 = &unk_1EE9BC460;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)URLSession:(const void *)a1 task:_schemeUpgraded:completionHandler:
{
  *a1 = &unk_1EE9BC460;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)URLSession:(uint64_t)a1 task:_schemeUpgraded:completionHandler:
{
  v2 = (void *)WebCore::ResourceRequest::nsURLRequest();
  id v4 = v2;
  if (v2) {
    CFRetain(v2);
  }
  updateIgnoreStrictTransportSecuritySetting(&v4, *(unsigned __int8 *)(a1 + 24));
  id v3 = v4;
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v3)
  {
    CFRelease(v3);
  }
}

- (uint64_t)URLSession:(uint64_t)a1 task:didReceiveChallenge:completionHandler:
{
  *(void *)a1 = &unk_1EE9BC488;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)URLSession:(const void *)a1 task:didReceiveChallenge:completionHandler:
{
  *a1 = &unk_1EE9BC488;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)URLSession:(WebCore::Credential *)this task:didReceiveChallenge:completionHandler:
{
  WebCore::Credential::nsCredential(this);
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);

  return v4();
}

- (uint64_t)URLSession:(uint64_t)a1 dataTask:didReceiveResponse:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)URLSession:(const void *)a1 dataTask:didReceiveResponse:completionHandler:
{
  *a1 = &unk_1EE9BC4B0;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

@end