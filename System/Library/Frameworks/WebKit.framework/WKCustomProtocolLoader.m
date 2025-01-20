@interface WKCustomProtocolLoader
- (WKCustomProtocolLoader)initWithLegacyCustomProtocolManagerProxy:(void *)a3 customProtocolID:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF:(id)a5 :SupportsObjectIdentifierNullState::Yes>)a4 ObjectIdentifierThreadSafeAccessTraits<uint64_t> :LegacyCustomProtocolIDType request:;
- (id).cxx_construct;
- (id)connection:(id)a3 willCacheResponse:(id)a4;
- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5;
- (void)cancel;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connectionDidFinishLoading:(id)a3;
- (void)dealloc;
@end

@implementation WKCustomProtocolLoader

- (WKCustomProtocolLoader)initWithLegacyCustomProtocolManagerProxy:(void *)a3 customProtocolID:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF:(id)a5 :SupportsObjectIdentifierNullState::Yes>)a4 ObjectIdentifierThreadSafeAccessTraits<uint64_t> :LegacyCustomProtocolIDType request:
{
  v16.receiver = self;
  v16.super_class = (Class)WKCustomProtocolLoader;
  v8 = [(WKCustomProtocolLoader *)&v16 init];
  if (v8)
  {
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3 + 2, (uint64_t)a3);
    v10 = (atomic_uint *)*((void *)a3 + 1);
    if (v10) {
      atomic_fetch_add(v10, 1u);
    }
    m_ptr = (unsigned int *)v8->_customProtocolManagerProxy.m_impl.m_ptr;
    v8->_customProtocolManagerProxy.m_impl.m_ptr = (DefaultWeakPtrImpl *)v10;
    if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v9);
    }
    v8->_customProtocolID = a4;
    v8->_storagePolicy = 2;
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F18D80]) initWithRequest:a5 delegate:v8 startImmediately:0];
    v13 = v8->_urlConnection.m_ptr;
    v8->_urlConnection.m_ptr = v12;
    if (v13)
    {
      CFRelease(v13);
      v12 = v8->_urlConnection.m_ptr;
    }
    uint64_t v14 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v12 scheduleInRunLoop:v14 forMode:*MEMORY[0x1E4F1C4B0]];
    [v8->_urlConnection.m_ptr start];
  }
  return v8;
}

- (void)dealloc
{
  [self->_urlConnection.m_ptr cancel];
  v3.receiver = self;
  v3.super_class = (Class)WKCustomProtocolLoader;
  [(WKCustomProtocolLoader *)&v3 dealloc];
}

- (void)cancel
{
  m_ptr = (unsigned int *)self->_customProtocolManagerProxy.m_impl.m_ptr;
  self->_customProtocolManagerProxy.m_impl.m_ptr = 0;
  if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, m_ptr);
    WTF::fastFree((WTF *)m_ptr, (void *)a2);
  }
  v4 = self->_urlConnection.m_ptr;

  [v4 cancel];
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  m_ptr = self->_customProtocolManagerProxy.m_impl.m_ptr;
  if (m_ptr && *((void *)m_ptr + 1))
  {
    MEMORY[0x199731570](&v17, a4, a3);
    v6 = self->_customProtocolManagerProxy.m_impl.m_ptr;
    if (v6) {
      uint64_t v7 = *((void *)v6 + 1);
    }
    else {
      uint64_t v7 = 0;
    }
    WebKit::LegacyCustomProtocolManagerProxy::didFailWithError(v7, self->_customProtocolID.m_identifier, (uint64_t)&v17);
    v8 = self->_customProtocolManagerProxy.m_impl.m_ptr;
    if (v8) {
      uint64_t v9 = *((void *)v8 + 1);
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(void *)(*(void *)(v9 + 16) + 8);
    v11 = (unsigned int *)(v10 + 16);
    atomic_fetch_add((atomic_uint *volatile)(v10 + 16), 1u);
    (*(void (**)(void))(**(void **)(v10 + 424) + 24))(*(void *)(v10 + 424));
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v11);
    CFTypeRef v13 = cf;
    CFTypeRef cf = 0;
    if (v13) {
      CFRelease(v13);
    }
    uint64_t v14 = v19;
    v19 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2) {
        WTF::StringImpl::destroy(v14, v12);
      }
      else {
        *(_DWORD *)v14 -= 2;
      }
    }
    v15 = v18;
    v18 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2) {
        WTF::StringImpl::destroy(v15, v12);
      }
      else {
        *(_DWORD *)v15 -= 2;
      }
    }
    objc_super v16 = v17;
    v17 = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2) {
        WTF::StringImpl::destroy(v16, v12);
      }
      else {
        *(_DWORD *)v16 -= 2;
      }
    }
  }
}

- (id)connection:(id)a3 willCacheResponse:(id)a4
{
  self->_storagePolicy = objc_msgSend(a4, "storagePolicy", a3);
  return a4;
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  m_ptr = self->_customProtocolManagerProxy.m_impl.m_ptr;
  if (m_ptr && *((void *)m_ptr + 1))
  {
    WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v11, (NSURLResponse *)a4);
    v6 = self->_customProtocolManagerProxy.m_impl.m_ptr;
    if (v6) {
      uint64_t v7 = *((void *)v6 + 1);
    }
    else {
      uint64_t v7 = 0;
    }
    unint64_t storagePolicy = self->_storagePolicy;
    if (storagePolicy >= 3) {
      LOBYTE(storagePolicy) = 2;
    }
    WebKit::LegacyCustomProtocolManagerProxy::didReceiveResponse(v7, self->_customProtocolID.m_identifier, (uint64_t)v11, storagePolicy);
    CFTypeRef v10 = cf;
    CFTypeRef cf = 0;
    if (v10) {
      CFRelease(v10);
    }
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v11, v9);
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  m_ptr = self->_customProtocolManagerProxy.m_impl.m_ptr;
  if (m_ptr)
  {
    uint64_t v5 = *((void *)m_ptr + 1);
    if (v5)
    {
      unint64_t m_identifier = self->_customProtocolID.m_identifier;
      if (a4)
      {
        uint64_t v8 = objc_msgSend(a4, "bytes", a3);
        uint64_t v9 = [a4 length];
      }
      else
      {
        uint64_t v8 = 0;
        uint64_t v9 = 0;
      }
      WebKit::LegacyCustomProtocolManagerProxy::didLoadData(v5, m_identifier, v8, v9);
    }
  }
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  m_ptr = self->_customProtocolManagerProxy.m_impl.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v6 = *((void *)m_ptr + 1);
  if (!v6) {
    return 0;
  }
  if (a5)
  {
    unint64_t m_identifier = self->_customProtocolID.m_identifier;
    MEMORY[0x199732A50](v15, a4, a3);
    WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v13, (NSURLResponse *)a5);
    WebKit::LegacyCustomProtocolManagerProxy::wasRedirectedToRequest(v6, m_identifier, (uint64_t)v15, (uint64_t)v13);
    CFTypeRef v10 = cf;
    CFTypeRef cf = 0;
    if (v10) {
      CFRelease(v10);
    }
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v13, v9);
    v11 = v16;
    objc_super v16 = 0;
    if (v11) {
      CFRelease(v11);
    }
    WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v15);
    return 0;
  }
  return a4;
}

- (void)connectionDidFinishLoading:(id)a3
{
  m_ptr = self->_customProtocolManagerProxy.m_impl.m_ptr;
  if (m_ptr)
  {
    uint64_t v5 = *((void *)m_ptr + 1);
    if (v5)
    {
      WebKit::LegacyCustomProtocolManagerProxy::didFinishLoading(v5, self->_customProtocolID.m_identifier);
      uint64_t v6 = self->_customProtocolManagerProxy.m_impl.m_ptr;
      if (v6) {
        uint64_t v7 = *((void *)v6 + 1);
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v8 = *(void *)(*(void *)(v7 + 16) + 8);
      uint64_t v9 = (unsigned int *)(v8 + 16);
      atomic_fetch_add((atomic_uint *volatile)(v8 + 16), 1u);
      (*(void (**)(void))(**(void **)(v8 + 424) + 24))(*(void *)(v8 + 424));
      WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v9);
    }
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_urlConnection.m_ptr;
  self->_urlConnection.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = (unsigned int *)self->_customProtocolManagerProxy.m_impl.m_ptr;
  self->_customProtocolManagerProxy.m_impl.m_ptr = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, (void *)a2);
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end