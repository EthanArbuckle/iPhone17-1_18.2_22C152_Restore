@interface WKGeolocationProviderIOS
- (WKGeolocationProviderIOS)init;
- (WKGeolocationProviderIOS)initWithProcessPool:(void *)a3;
- (id).cxx_construct;
- (uint64_t)decidePolicyForGeolocationRequestFromOrigin:(WTF *)this completionHandler:(void *)a2 view:;
- (uint64_t)decidePolicyForGeolocationRequestFromOrigin:(uint64_t)a1 completionHandler:(int)a2 view:;
- (void)_setEnableHighAccuracy:(BOOL)a3;
- (void)_startUpdating;
- (void)_stopUpdating;
- (void)decidePolicyForGeolocationRequestFromOrigin:(void *)a1 completionHandler:view:;
- (void)decidePolicyForGeolocationRequestFromOrigin:(void *)a3 completionHandler:(void *)a4 view:(id)a5;
- (void)errorOccurred:(id)a3;
- (void)geolocationAuthorizationDenied;
- (void)geolocationAuthorizationGranted;
- (void)positionChanged:(id)a3;
- (void)resetGeolocation;
@end

@implementation WKGeolocationProviderIOS

- (void)_startUpdating
{
  self->_isWebCoreGeolocationActive = 1;
  [self->_coreLocationProvider.m_ptr start];
  m_ptr = self->_lastActivePosition.m_ptr;
  if (m_ptr)
  {
    v5 = self->_geolocationManager.m_ptr;
    WebKit::WebGeolocationManagerProxy::providerDidChangePosition((WebKit::WebGeolocationManagerProxy *)v5, (WebKit::WebGeolocationPosition *)m_ptr, v3);
  }
}

- (void)_stopUpdating
{
  self->_isWebCoreGeolocationActive = 0;
  [self->_coreLocationProvider.m_ptr stop];
  m_ptr = self->_lastActivePosition.m_ptr;
  self->_lastActivePosition.m_ptr = 0;
  if (m_ptr)
  {
    v4 = (const void *)*((void *)m_ptr + 1);
    CFRelease(v4);
  }
}

- (void)_setEnableHighAccuracy:(BOOL)a3
{
}

- (WKGeolocationProviderIOS)init
{
  return 0;
}

- (WKGeolocationProviderIOS)initWithProcessPool:(void *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)WKGeolocationProviderIOS;
  v4 = [(WKGeolocationProviderIOS *)&v17 init];
  if (v4)
  {
    CFRetain(*((CFTypeRef *)a3 + 1));
    if ([*((id *)a3 + 1) _coreLocationProvider])
    {
      *(void *)&long long v13 = "WebGeolocationManagerProxy";
      *((void *)&v13 + 1) = 27;
      v5 = WTF::HashMap<WTF::ASCIILiteral,WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>,WTF::ASCIILiteral>((uint64_t *)a3 + 57, (WTF::ASCIILiteralHash *)&v13);
      if (v5) {
        v6 = (WebGeolocationManagerProxy *)(v5 - 16);
      }
      else {
        v6 = 0;
      }
      if (v5) {
        CFRetain(*((CFTypeRef *)v5 - 1));
      }
      m_ptr = v4->_geolocationManager.m_ptr;
      v4->_geolocationManager.m_ptr = v6;
      if (m_ptr)
      {
        CFRelease(*((CFTypeRef *)m_ptr + 1));
        v6 = v4->_geolocationManager.m_ptr;
      }
      *(void *)&long long v13 = 1;
      *((void *)&v13 + 1) = v4;
      v14 = startUpdatingCallback;
      v15 = stopUpdatingCallback;
      v16 = setEnableHighAccuracy;
      if (v6) {
        v8 = (void *)*((void *)v6 + 1);
      }
      else {
        v8 = 0;
      }
      WKGeolocationManagerSetProvider(v8, &v13);
      v9 = (void *)[*((id *)a3 + 1) _coreLocationProvider];
      v10 = v9;
      if (v9) {
        CFRetain(v9);
      }
      v11 = v4->_coreLocationProvider.m_ptr;
      v4->_coreLocationProvider.m_ptr = v10;
      if (v11)
      {
        CFRelease(v11);
        v10 = v4->_coreLocationProvider.m_ptr;
      }
      [v10 setListener:v4];
    }
    CFRelease(*((CFTypeRef *)a3 + 1));
  }
  return v4;
}

- (void)decidePolicyForGeolocationRequestFromOrigin:(void *)a3 completionHandler:(void *)a4 view:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v9 = (char *)a3 + 208;
  WebCore::RegistrableDomain::RegistrableDomain((WebCore::RegistrableDomain *)&v35, (const WebCore::SecurityOriginData *)((char *)a3 + 208));
  MEMORY[0x19972E8A0](v36, [a5 URL]);
  __int16 v37 = *(_WORD *)a3;
  WebCore::ResourceRequestBase::ResourceRequestBase((uint64_t)v38, (uint64_t)a3 + 8);
  uint64_t v10 = *((void *)a3 + 25);
  *((void *)a3 + 25) = 0;
  v38[24] = v10;
  std::__variant_detail::__move_constructor<std::__variant_detail::__traits<WebCore::SecurityOriginData::Tuple,WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::OpaqueOriginIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)v39, (uint64_t)v9);
  uint64_t v11 = *((void *)a3 + 30);
  *((void *)a3 + 30) = 0;
  v39[4] = v11;
  *(_OWORD *)((char *)v41 + 14) = *(_OWORD *)((char *)a3 + 278);
  long long v12 = *(_OWORD *)((char *)a3 + 264);
  long long v40 = *(_OWORD *)((char *)a3 + 248);
  v41[0] = v12;
  uint64_t v13 = *(void *)a4;
  *(void *)a4 = 0;
  uint64_t v42 = v13;
  id v43 = a5;
  if (a5) {
    CFRetain(a5);
  }
  unint64_t m_start = self->_requestsWaitingForCoreLocationAuthorization.m_start;
  unint64_t m_end = self->_requestsWaitingForCoreLocationAuthorization.m_end;
  if (m_start)
  {
    if (m_end + 1 != m_start) {
      goto LABEL_22;
    }
    LODWORD(m_capacity) = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity;
  }
  else
  {
    uint64_t m_capacity = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity;
    if (m_end)
    {
      if (m_end != m_capacity - 1) {
        goto LABEL_22;
      }
    }
    else if (m_capacity)
    {
      unint64_t m_end = 0;
      goto LABEL_22;
    }
  }
  uint64_t v17 = m_capacity;
  unint64_t v18 = ((unint64_t)m_capacity >> 2) + m_capacity;
  if (v18 <= 0xF) {
    unint64_t v18 = 15;
  }
  if (v18 >= 0xBA2E8B)
  {
    __break(0xC471u);
    return;
  }
  m_buffer = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer;
  unsigned int v20 = 352 * v18 + 352;
  v21 = (GeolocationRequestData *)WTF::fastMalloc((WTF *)(352 * v18 + 352));
  self->_requestsWaitingForCoreLocationAuthorization.m_buffer.uint64_t m_capacity = v20 / 0x160;
  self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer = v21;
  unint64_t v23 = self->_requestsWaitingForCoreLocationAuthorization.m_start;
  unint64_t v22 = self->_requestsWaitingForCoreLocationAuthorization.m_end;
  if (v23 <= v22)
  {
    WTF::VectorMover<false,GeolocationRequestData>::move((GeolocationRequestData *)((char *)m_buffer + 352 * v23), (GeolocationRequestData *)((char *)m_buffer + 352 * v22), (uint64_t)v21 + 352 * v23);
  }
  else
  {
    WTF::VectorMover<false,GeolocationRequestData>::move(m_buffer, (GeolocationRequestData *)((char *)m_buffer + 352 * v22), (uint64_t)v21);
    unint64_t v24 = self->_requestsWaitingForCoreLocationAuthorization.m_start;
    unint64_t v25 = v24 - v17 + self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity;
    WTF::VectorMover<false,GeolocationRequestData>::move((GeolocationRequestData *)((char *)m_buffer + 352 * v24), (GeolocationRequestData *)((char *)m_buffer + 352 * v17), (uint64_t)self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer + 352 * v25);
    self->_requestsWaitingForCoreLocationAuthorization.unint64_t m_start = v25;
  }
  if (m_buffer)
  {
    if (self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer == m_buffer)
    {
      self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer = 0;
      self->_requestsWaitingForCoreLocationAuthorization.m_buffer.uint64_t m_capacity = 0;
    }
    WTF::fastFree((WTF *)m_buffer, v26);
  }
  unint64_t m_end = self->_requestsWaitingForCoreLocationAuthorization.m_end;
LABEL_22:
  GeolocationRequestData::GeolocationRequestData((uint64_t)self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer + 352 * m_end, (uint64_t)v36);
  unint64_t v27 = self->_requestsWaitingForCoreLocationAuthorization.m_end;
  if (v27 == self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity - 1) {
    unint64_t v28 = 0;
  }
  else {
    unint64_t v28 = v27 + 1;
  }
  self->_requestsWaitingForCoreLocationAuthorization.unint64_t m_end = v28;
  m_ptr = self->_coreLocationProvider.m_ptr;
  if (m_ptr)
  {
    [m_ptr requestGeolocationAuthorization];
  }
  else
  {
    CFRetain(self);
    v31 = (void *)WTF::fastMalloc((WTF *)0x18);
    void *v31 = &unk_1EE9D4160;
    v31[1] = self;
    v31[2] = self;
    v34 = v31;
    WebCore::CoreLocationGeolocationProvider::requestAuthorization();
    if (v34) {
      (*(void (**)(void *))(*v34 + 8))(v34);
    }
  }
  GeolocationRequestData::~GeolocationRequestData((GeolocationRequestData *)v36, v30);
  v33 = v35;
  v35 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 2) {
      WTF::StringImpl::destroy(v33, v32);
    }
    else {
      *(_DWORD *)v33 -= 2;
    }
  }
}

- (void).cxx_destruct
{
  unint64_t m_start = self->_requestsWaitingForCoreLocationAuthorization.m_start;
  unint64_t m_end = self->_requestsWaitingForCoreLocationAuthorization.m_end;
  m_buffer = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer;
  if (m_start <= m_end)
  {
    if (m_start == m_end) {
      goto LABEL_14;
    }
    uint64_t v13 = 352 * m_start;
    v14 = (GeolocationRequestData *)((char *)m_buffer + v13);
    unint64_t v15 = 352 * m_end - v13;
    do
    {
      GeolocationRequestData::~GeolocationRequestData(v14, (WTF::StringImpl *)a2);
      v14 = (GeolocationRequestData *)(v16 + 352);
      v15 -= 352;
    }
    while (v15);
  }
  else
  {
    if (m_end)
    {
      uint64_t v6 = 352 * m_end;
      do
      {
        GeolocationRequestData::~GeolocationRequestData(m_buffer, (WTF::StringImpl *)a2);
        m_buffer = (GeolocationRequestData *)(v7 + 352);
        v6 -= 352;
      }
      while (v6);
      m_buffer = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer;
      unint64_t m_start = self->_requestsWaitingForCoreLocationAuthorization.m_start;
    }
    uint64_t m_capacity = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity;
    if (m_start != m_capacity)
    {
      uint64_t v9 = 352 * m_start;
      uint64_t v10 = (GeolocationRequestData *)((char *)m_buffer + v9);
      uint64_t v11 = 352 * m_capacity - v9;
      do
      {
        GeolocationRequestData::~GeolocationRequestData(v10, (WTF::StringImpl *)a2);
        uint64_t v10 = (GeolocationRequestData *)(v12 + 352);
        v11 -= 352;
      }
      while (v11);
    }
  }
  m_buffer = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer;
LABEL_14:
  if (m_buffer)
  {
    self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer = 0;
    self->_requestsWaitingForCoreLocationAuthorization.m_buffer.uint64_t m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
  }
  m_ptr = self->_lastActivePosition.m_ptr;
  self->_lastActivePosition.m_ptr = 0;
  if (m_ptr) {
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  }
  unint64_t v18 = self->_coreLocationProvider.m_ptr;
  self->_coreLocationProvider.m_ptr = 0;
  if (v18) {
    CFRelease(v18);
  }
  v19 = self->_geolocationManager.m_ptr;
  self->_geolocationManager.m_ptr = 0;
  if (v19)
  {
    unsigned int v20 = (const void *)*((void *)v19 + 1);
    CFRelease(v20);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((void *)self + 8) = 0;
  return self;
}

- (void)geolocationAuthorizationGranted
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t m_start = self->_requestsWaitingForCoreLocationAuthorization.m_start;
  if (m_start != self->_requestsWaitingForCoreLocationAuthorization.m_end)
  {
    GeolocationRequestData::GeolocationRequestData((uint64_t)v28, (uint64_t)self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer + 352 * m_start);
    unint64_t v5 = self->_requestsWaitingForCoreLocationAuthorization.m_start;
    if (v5 == self->_requestsWaitingForCoreLocationAuthorization.m_end)
    {
      __break(0xC471u);
      JUMPOUT(0x198D9DC74);
    }
    GeolocationRequestData::~GeolocationRequestData((GeolocationRequestData *)((char *)self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer + 352 * v5), v4);
    unint64_t v6 = self->_requestsWaitingForCoreLocationAuthorization.m_start;
    if (v6 == self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity - 1) {
      unint64_t v7 = 0;
    }
    else {
      unint64_t v7 = v6 + 1;
    }
    self->_requestsWaitingForCoreLocationAuthorization.unint64_t m_start = v7;
    uint64_t v8 = v30;
    uint64_t v30 = 0;
    CFRetain(self);
    uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x18);
    void *v9 = &unk_1EE9D4188;
    v9[1] = v8;
    v9[2] = self;
    unint64_t v24 = v9;
    uint64_t v10 = (WebKit::CompletionHandlerCallChecker *)[v31 UIDelegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = v31[52];
      if (v11) {
        CFRetain(*(CFTypeRef *)(v11 + 8));
      }
      v26[0] = v11;
      uint64_t v12 = API::Object::newObject(0x140uLL, 60);
      uint64_t v13 = API::FrameInfo::FrameInfo(v12, (uint64_t)&v29, v26);
      v14 = *(WKWebAllowDenyPolicyListener **)(v13 + 8);
      if (v14)
      {
        CFRetain(*(CFTypeRef *)(v13 + 8));
        unint64_t v15 = *(const void **)(v12 + 8);
      }
      else
      {
        unint64_t v15 = 0;
      }
      CFRelease(v15);
      if (v26[0]) {
        CFRelease(*(CFTypeRef *)(v26[0] + 8));
      }
      WebKit::CompletionHandlerCallChecker::create(v10, (objc_object *)sel__webView_requestGeolocationAuthorizationForURL_frame_decisionHandler_, v26);
      v19 = v31;
      uint64_t v20 = WTF::URL::operator NSURL *();
      unint64_t v24 = 0;
      uint64_t v21 = v26[0];
      unint64_t v22 = malloc_type_malloc(0x30uLL, 0x10E0040FAC56454uLL);
      *unint64_t v22 = MEMORY[0x1E4F14398];
      v22[1] = 50331650;
      v22[2] = WTF::BlockPtr<void ()(BOOL)>::fromCallable<-[WKGeolocationProviderIOS(WebGeolocationCoreLocationUpdateListener) geolocationAuthorizationGranted]::$_1>([(WKGeolocationProviderIOS(WebGeolocationCoreLocationUpdateListener) *)void * geolocationAuthorizationGranted]#1}::__invoke;
      v22[3] = &WTF::BlockPtr<void ()(BOOL)>::fromCallable<-[WKGeolocationProviderIOS(WebGeolocationCoreLocationUpdateListener) geolocationAuthorizationGranted]::$_1>(-[WKGeolocationProviderIOS(WebGeolocationCoreLocationUpdateListener) geolocationAuthorizationGranted]::$_1)::descriptor;
      v22[4] = v9;
      v22[5] = v21;
      [(WebKit::CompletionHandlerCallChecker *)v10 _webView:v19 requestGeolocationAuthorizationForURL:v20 frame:v14 decisionHandler:v22];
      _Block_release(v22);
    }
    else
    {
      v14 = [[WKWebAllowDenyPolicyListener alloc] initWithCompletionHandler:&v24];
      id v16 = +[WKWebGeolocationPolicyDecider sharedPolicyDecider];
      WebCore::SecurityOriginData::fromURLWithoutStrictOpaqueness(v26, (WebCore::SecurityOriginData *)v28, v17);
      [v16 decidePolicyForGeolocationRequestFromOrigin:v26 requestingURL:WTF::URL::operator NSURL *() view:v31 listener:v14];
      if (v27 != -1) {
        ((void (*)(char *, uint64_t *))off_1EE9D4120[v27])(&v25, v26);
      }
    }
    if (v14) {
      CFRelease(v14);
    }
    unint64_t v23 = v24;
    unint64_t v24 = 0;
    if (v23) {
      (*(void (**)(void *))(*v23 + 8))(v23);
    }
    GeolocationRequestData::~GeolocationRequestData((GeolocationRequestData *)v28, v18);
  }
}

- (void)geolocationAuthorizationDenied
{
  unint64_t m_start = self->_requestsWaitingForCoreLocationAuthorization.m_start;
  unint64_t m_end = self->_requestsWaitingForCoreLocationAuthorization.m_end;
  self->_requestsWaitingForCoreLocationAuthorization.unint64_t m_start = 0;
  self->_requestsWaitingForCoreLocationAuthorization.unint64_t m_end = 0;
  m_buffer = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer;
  self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer = 0;
  unint64_t m_capacity = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity;
  self->_requestsWaitingForCoreLocationAuthorization.m_buffer.unint64_t m_capacity = 0;
  if (m_start != m_end)
  {
    unint64_t v6 = m_start;
    do
    {
      (*(void (**)(void, void))(**((void **)m_buffer + 44 * v6 + 42) + 16))(*((void *)m_buffer + 44 * v6 + 42), 0);
      v6 += m_capacity + 1;
      do
        v6 -= m_capacity;
      while (v6 >= m_capacity);
    }
    while (m_end != v6);
    if (m_start <= m_end)
    {
      uint64_t v13 = (GeolocationRequestData *)((char *)m_buffer + 352 * m_start);
      uint64_t v14 = 352 * m_end - 352 * m_start;
      do
      {
        GeolocationRequestData::~GeolocationRequestData(v13, (WTF::StringImpl *)a2);
        uint64_t v13 = (GeolocationRequestData *)(v15 + 352);
        v14 -= 352;
      }
      while (v14);
    }
    else
    {
      if (m_end)
      {
        uint64_t v7 = 352 * m_end;
        uint64_t v8 = m_buffer;
        do
        {
          GeolocationRequestData::~GeolocationRequestData(v8, (WTF::StringImpl *)a2);
          uint64_t v8 = (GeolocationRequestData *)(v9 + 352);
          v7 -= 352;
        }
        while (v7);
      }
      if (m_start != m_capacity)
      {
        uint64_t v10 = (GeolocationRequestData *)((char *)m_buffer + 352 * m_start);
        uint64_t v11 = 352 * m_capacity - 352 * m_start;
        do
        {
          GeolocationRequestData::~GeolocationRequestData(v10, (WTF::StringImpl *)a2);
          uint64_t v10 = (GeolocationRequestData *)(v12 + 352);
          v11 -= 352;
        }
        while (v11);
      }
    }
  }
  if (m_buffer)
  {
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
  }
}

- (void)positionChanged:(id)a3
{
  v4 = (WebGeolocationPosition *)((char *)a3 + 8);
  if (a3) {
    CFRetain(*((CFTypeRef *)a3 + 2));
  }
  m_ptr = self->_lastActivePosition.m_ptr;
  self->_lastActivePosition.m_ptr = v4;
  if (m_ptr)
  {
    CFRelease(*((CFTypeRef *)m_ptr + 1));
    v4 = self->_lastActivePosition.m_ptr;
  }
  unint64_t v6 = self->_geolocationManager.m_ptr;

  WebKit::WebGeolocationManagerProxy::providerDidChangePosition((WebKit::WebGeolocationManagerProxy *)v6, (WebKit::WebGeolocationPosition *)v4, (const WTF::StringImpl *)a3);
}

- (void)errorOccurred:(id)a3
{
  m_ptr = self->_geolocationManager.m_ptr;
  MEMORY[0x19972EAD0](&v7, a3);
  WebKit::WebGeolocationManagerProxy::providerDidFailToDeterminePosition((WebKit::WebGeolocationManagerProxy *)m_ptr, (const WTF::String *)&v7, v4);
  unint64_t v6 = v7;
  uint64_t v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)resetGeolocation
{
  WebKit::WebGeolocationManagerProxy::resetPermissions((WebKit::WebGeolocationManagerProxy *)self->_geolocationManager.m_ptr, (uint64_t)a2, v2);
}

- (void)decidePolicyForGeolocationRequestFromOrigin:(void *)a1 completionHandler:view:
{
  *a1 = &unk_1EE9D4160;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)decidePolicyForGeolocationRequestFromOrigin:(WTF *)this completionHandler:(void *)a2 view:
{
  *(void *)this = &unk_1EE9D4160;
  v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)decidePolicyForGeolocationRequestFromOrigin:(uint64_t)a1 completionHandler:(int)a2 view:
{
  v2 = *(void **)(a1 + 8);
  if (a2) {
    return [v2 geolocationAuthorizationGranted];
  }
  else {
    return [v2 geolocationAuthorizationDenied];
  }
}

@end