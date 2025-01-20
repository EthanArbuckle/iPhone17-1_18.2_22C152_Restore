@interface WKCustomProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (id)canonicalRequestForRequest:(id)a3;
- (ObjectIdentifierGeneric<WebKit::LegacyCustomProtocolIDType,)customProtocolID;
- (WKCustomProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5;
- (__CFRunLoop)initializationRunLoop;
- (id).cxx_construct;
- (uint64_t)startLoading;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation WKCustomProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  if (byte_1E93CF331 == 1)
  {
    uint64_t v4 = qword_1E93CF338;
  }
  else
  {
    uint64_t v4 = 0;
    qword_1E93CF338 = 0;
    byte_1E93CF331 = 1;
  }
  v11[0] = (WTF::StringImpl *)"LegacyCustomProtocolManager";
  v11[1] = (WTF::StringImpl *)28;
  v5 = WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>,WTF::ASCIILiteral>((uint64_t *)(v4 + 208), (WTF::ASCIILiteralHash *)v11);
  if (!v5) {
    return 0;
  }
  v6 = (WebKit::LegacyCustomProtocolManager *)v5;
  MEMORY[0x19972EAD0](v11, objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "URL"), "scheme"), "lowercaseString"));
  char v8 = WebKit::LegacyCustomProtocolManager::supportsScheme(v6, v11);
  v9 = v11[0];
  v11[0] = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v7);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  return v8;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return 0;
}

- (WKCustomProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)WKCustomProtocol;
  v5 = [(NSURLProtocol *)&v14 initWithRequest:a3 cachedResponse:a4 client:a5];
  if (v5)
  {
    if (byte_1E93CF331 == 1)
    {
      uint64_t v6 = qword_1E93CF338;
    }
    else
    {
      uint64_t v6 = 0;
      qword_1E93CF338 = 0;
      byte_1E93CF331 = 1;
    }
    cf[0] = "LegacyCustomProtocolManager";
    cf[1] = (CFTypeRef)28;
    v7 = WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>,WTF::ASCIILiteral>((uint64_t *)(v6 + 208), (WTF::ASCIILiteralHash *)cf);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      cf[0] = v5;
      CFRetain(v5);
      v5->_customProtocolID.m_identifier = WebKit::LegacyCustomProtocolManager::addCustomProtocol(v8, (uint64_t *)cf);
      CFTypeRef v9 = cf[0];
      cf[0] = 0;
      if (v9) {
        CFRelease(v9);
      }
    }
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopRef v11 = Current;
    if (Current) {
      CFRetain(Current);
    }
    m_ptr = v5->_initializationRunLoop.m_ptr;
    v5->_initializationRunLoop.m_ptr = v11;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v5;
}

- (__CFRunLoop)initializationRunLoop
{
  return (__CFRunLoop *)self->_initializationRunLoop.m_ptr;
}

- (void)startLoading
{
  if (byte_1E93CF331 == 1)
  {
    uint64_t v2 = qword_1E93CF338;
  }
  else
  {
    uint64_t v2 = 0;
    qword_1E93CF338 = 0;
    byte_1E93CF331 = 1;
  }
  v7[0] = "LegacyCustomProtocolManager";
  v7[1] = 28;
  v3 = WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>,WTF::ASCIILiteral>((uint64_t *)(v2 + 208), (WTF::ASCIILiteralHash *)v7);
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    uint64_t v5 = *(void *)(a1 + 8);
    MEMORY[0x199732A50](v7, *(void *)(a1 + 16));
    WebKit::LegacyCustomProtocolManager::startLoading(v4, v5, (WebCore::ResourceRequest *)v7);
    CFTypeRef v6 = cf;
    CFTypeRef cf = 0;
    if (v6) {
      CFRelease(v6);
    }
    WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v7);
  }
}

- (void)stopLoading
{
  if (byte_1E93CF331 == 1)
  {
    uint64_t v2 = qword_1E93CF338;
  }
  else
  {
    uint64_t v2 = 0;
    qword_1E93CF338 = 0;
    byte_1E93CF331 = 1;
  }
  v5[0] = "LegacyCustomProtocolManager";
  v5[1] = 28;
  v3 = WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>,WTF::ASCIILiteral>((uint64_t *)(v2 + 208), (WTF::ASCIILiteralHash *)v5);
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    WebKit::LegacyCustomProtocolManager::stopLoading((uint64_t)v3, *(void *)(a1 + 8));
    WebKit::LegacyCustomProtocolManager::removeCustomProtocol(v4, *(void *)(a1 + 8));
  }
}

- (ObjectIdentifierGeneric<WebKit::LegacyCustomProtocolIDType,)customProtocolID
{
  return self->_customProtocolID;
}

- (void).cxx_destruct
{
  m_ptr = self->_initializationRunLoop.m_ptr;
  self->_initializationRunLoop.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

- (uint64_t)startLoading
{
  *(void *)this = &unk_1EE9BBA68;
  v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

@end