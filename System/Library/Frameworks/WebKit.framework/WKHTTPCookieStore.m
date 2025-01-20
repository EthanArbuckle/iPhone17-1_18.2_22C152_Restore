@interface WKHTTPCookieStore
+ (BOOL)accessInstanceVariablesDirectly;
- (Object)_apiObject;
- (id).cxx_construct;
- (uint64_t)deleteCookie:(WTF *)this completionHandler:(void *)a2;
- (uint64_t)deleteCookie:(uint64_t)a1 completionHandler:;
- (uint64_t)getAllCookies:(WTF *)this;
- (uint64_t)getAllCookies:(uint64_t)a1;
- (uint64_t)getCookiePolicy:(const void *)a1;
- (uint64_t)getCookiePolicy:(uint64_t)a1;
- (uint64_t)setCookie:(WTF *)this completionHandler:(void *)a2;
- (uint64_t)setCookie:(uint64_t)a1 completionHandler:;
- (uint64_t)setCookiePolicy:(const void *)a1 completionHandler:;
- (uint64_t)setCookiePolicy:(uint64_t)a1 completionHandler:;
- (void)_flushCookiesToDiskWithCompletionHandler:(id)a3;
- (void)_getCookiesForURL:(id)a3 completionHandler:(id)a4;
- (void)_setCookieAcceptPolicy:(unint64_t)a3 completionHandler:(id)a4;
- (void)addObserver:(id)observer;
- (void)dealloc;
- (void)deleteCookie:(NSHTTPCookie *)cookie completionHandler:(void *)completionHandler;
- (void)deleteCookie:(void *)a1 completionHandler:;
- (void)getAllCookies:(void *)a1;
- (void)getAllCookies:(void *)completionHandler;
- (void)getCookiePolicy:(void *)completionHandler;
- (void)removeObserver:(id)observer;
- (void)setCookie:(NSHTTPCookie *)cookie completionHandler:(void *)completionHandler;
- (void)setCookie:(void *)a1 completionHandler:;
- (void)setCookiePolicy:(WKCookiePolicy)policy completionHandler:(void *)completionHandler;
@end

@implementation WKHTTPCookieStore

- (Object)_apiObject
{
  return (Object *)&self->_cookieStore;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKHTTPCookieStore accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKHTTPCookieStore accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1EB357B50;
    if (os_log_type_enabled((os_log_t)qword_1EB357B50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_1985F2000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (void)dealloc
{
  char v3 = (objc_class *)objc_opt_class();
  if (WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self)) {
    return;
  }
  m_tableForLLDB = self->_observers.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    uint64_t v6 = *(m_tableForLLDB - 1);
    v7 = (char *)&m_tableForLLDB[4 * v6];
    if (*(m_tableForLLDB - 3))
    {
      m_table = (char *)self->_observers.m_impl.var0.m_table;
      if (v6)
      {
        uint64_t v9 = 16 * v6;
        m_table = (char *)self->_observers.m_impl.var0.m_table;
        while ((unint64_t)(*(void *)m_table + 1) <= 1)
        {
          m_table += 16;
          v9 -= 16;
          if (!v9)
          {
            m_table = v7;
            goto LABEL_9;
          }
        }
      }
      goto LABEL_9;
    }
    m_table = (char *)&m_tableForLLDB[4 * v6];
  }
  else
  {
    m_table = 0;
    uint64_t v6 = 0;
  }
  v7 = (char *)&m_tableForLLDB[4 * v6];
  if (!m_tableForLLDB)
  {
    v10 = 0;
    goto LABEL_14;
  }
LABEL_9:
  v10 = (char *)&m_tableForLLDB[4 * *(m_tableForLLDB - 1)];
LABEL_14:
  while (m_table != v10)
  {
    API::HTTPCookieStore::unregisterObserver((uint64_t)&self->_cookieStore, *((void **)m_table + 1));
    v11 = m_table + 16;
    m_table = v7;
    if (v11 != v7)
    {
      m_table = v11;
      while ((unint64_t)(*(void *)m_table + 1) <= 1)
      {
        m_table += 16;
        if (m_table == v7)
        {
          m_table = v7;
          break;
        }
      }
    }
  }
  API::HTTPCookieStore::~HTTPCookieStore((API::HTTPCookieStore *)&self->_cookieStore, v4);
  v12.receiver = self;
  v12.super_class = (Class)WKHTTPCookieStore;
  [(WKHTTPCookieStore *)&v12 dealloc];
}

- (void)getAllCookies:(void *)completionHandler
{
  uint64_t v4 = [completionHandler copy];
  v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C2CD0;
  v5[1] = v4;
  v7 = v5;
  API::HTTPCookieStore::cookies((uint64_t)&self->_cookieStore, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
}

- (void)setCookie:(NSHTTPCookie *)cookie completionHandler:(void *)completionHandler
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  MEMORY[0x19973A9B0](v12, cookie);
  WTF::Vector<WebCore::Cookie,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector(v11, (const WebCore::Cookie *)v12, 1uLL);
  uint64_t v6 = [completionHandler copy];
  v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C2CF8;
  v7[1] = v6;
  v10 = v7;
  API::HTTPCookieStore::setCookies((uint64_t)&self->_cookieStore, v11, (uint64_t *)&v10);
  if (v10) {
    (*(void (**)(void *))(*v10 + 8))(v10);
  }
  WTF::Vector<WebCore::Cookie,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v11, v8);
  WebCore::Cookie::~Cookie((WebCore::Cookie *)v12, v9);
}

- (void)deleteCookie:(NSHTTPCookie *)cookie completionHandler:(void *)completionHandler
{
  MEMORY[0x19973A9B0](v11, cookie);
  uint64_t v6 = [completionHandler copy];
  v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C2D20;
  v7[1] = v6;
  v10 = v7;
  API::HTTPCookieStore::deleteCookie((uint64_t)&self->_cookieStore, (uint64_t)v11, (uint64_t *)&v10);
  uint64_t v9 = (uint64_t)v10;
  v10 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  WebCore::Cookie::~Cookie((WebCore::Cookie *)v11, v8);
}

- (void)addObserver:(id)observer
{
  p_observers = (uint64_t *)&self->_observers;
  m_tableForLLDB = self->_observers.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB
    || (WTF::HashTable<void const*,WTF::KeyValuePair<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>>>,WTF::DefaultHash<void const*>,WTF::HashMap<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<std::unique_ptr<WKHTTPCookieStoreObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<void const*>>::expand((uint64_t *)&self->_observers, 0), (m_tableForLLDB = (_DWORD *)*p_observers) != 0))
  {
    int v7 = *(m_tableForLLDB - 2);
  }
  else
  {
    int v7 = 0;
  }
  unint64_t v8 = ((unint64_t)observer + ~((void)observer << 32)) ^ (((unint64_t)observer
                                                                  + ~((void)observer << 32)) >> 22);
  unint64_t v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
  unint64_t v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
  unsigned int v11 = v7 & ((v10 >> 31) ^ v10);
  objc_super v12 = (uint64_t *)&m_tableForLLDB[4 * v11];
  id v13 = (id)*v12;
  if (!*v12)
  {
LABEL_12:
    uint64_t v16 = v12[1];
    *objc_super v12 = (uint64_t)observer;
    v12[1] = 0;
    if (v16) {
      (*(void (**)(uint64_t, SEL))(*(void *)v16 + 8))(v16, a2);
    }
    uint64_t v17 = *p_observers;
    if (*p_observers) {
      int v18 = *(_DWORD *)(v17 - 12) + 1;
    }
    else {
      int v18 = 1;
    }
    *(_DWORD *)(v17 - 12) = v18;
    uint64_t v19 = *p_observers;
    if (*p_observers) {
      int v20 = *(_DWORD *)(v19 - 12);
    }
    else {
      int v20 = 0;
    }
    uint64_t v21 = (*(_DWORD *)(v19 - 16) + v20);
    unint64_t v22 = *(unsigned int *)(v19 - 4);
    if (v22 > 0x400)
    {
      if (v22 > 2 * v21) {
        goto LABEL_24;
      }
    }
    else if (3 * v22 > 4 * v21)
    {
LABEL_24:
      uint64_t v23 = WTF::fastMalloc((WTF *)0x18);
      *(void *)(v23 + 8) = 0;
      *(void *)uint64_t v23 = &unk_1EE9C2CA8;
      *(void *)(v23 + 16) = 0;
      objc_initWeak((id *)(v23 + 16), observer);
      uint64_t v24 = v12[1];
      v12[1] = v23;
      if (v24)
      {
        (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
        uint64_t v23 = v12[1];
      }
      API::HTTPCookieStore::registerObserver((uint64_t)&self->_cookieStore, (void *)v23);
      return;
    }
    objc_super v12 = WTF::HashTable<void const*,WTF::KeyValuePair<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>>>,WTF::DefaultHash<void const*>,WTF::HashMap<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<std::unique_ptr<WKHTTPCookieStoreObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<void const*>>::expand(p_observers, v12);
    goto LABEL_24;
  }
  v14 = 0;
  int v15 = 1;
  while (v13 != observer)
  {
    if (v13 == (id)-1) {
      v14 = v12;
    }
    unsigned int v11 = (v11 + v15) & v7;
    objc_super v12 = (uint64_t *)&m_tableForLLDB[4 * v11];
    id v13 = (id)*v12;
    ++v15;
    if (!*v12)
    {
      if (v14)
      {
        uint64_t *v14 = 0;
        v14[1] = 0;
        --*(_DWORD *)(*p_observers - 16);
        objc_super v12 = v14;
      }
      goto LABEL_12;
    }
  }
}

- (void)removeObserver:(id)observer
{
  m_tableForLLDB = self->_observers.m_impl.var0.m_tableForLLDB;
  p_observers = (uint64_t *)&self->_observers;
  v5 = m_tableForLLDB;
  if (m_tableForLLDB)
  {
    unsigned int v7 = *(v5 - 2);
    unint64_t v8 = ((unint64_t)observer + ~((void)observer << 32)) ^ (((unint64_t)observer
                                                                    + ~((void)observer << 32)) >> 22);
    unint64_t v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
    unint64_t v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
    uint64_t v11 = v7 & ((v10 >> 31) ^ v10);
    id v12 = *(id *)&v5[4 * v11];
    if (v12 != observer)
    {
      int v13 = 1;
      while (v12)
      {
        uint64_t v11 = (v11 + v13) & v7;
        id v12 = *(id *)&v5[4 * v11];
        ++v13;
        if (v12 == observer) {
          goto LABEL_8;
        }
      }
      uint64_t v11 = *(v5 - 1);
    }
LABEL_8:
    if (v11 != *(v5 - 1))
    {
      v14 = &v5[4 * v11];
      int v15 = (void *)*((void *)v14 + 1);
      *((void *)v14 + 1) = 0;
      uint64_t v16 = *p_observers;
      if (!*p_observers || (v16 += 16 * *(unsigned int *)(v16 - 4), (unsigned int *)v16 != v14))
      {
        if ((unsigned int *)v16 != v14)
        {
          *(void *)v14 = -1;
          *((void *)v14 + 1) = 0;
          ++*(_DWORD *)(*p_observers - 16);
          uint64_t v17 = *p_observers;
          int v18 = *p_observers ? *(_DWORD *)(v17 - 12) - 1 : -1;
          *(_DWORD *)(v17 - 12) = v18;
          uint64_t v19 = *p_observers;
          if (*p_observers)
          {
            unsigned int v20 = 6 * *(_DWORD *)(v19 - 12);
            unsigned int v21 = *(_DWORD *)(v19 - 4);
            if (v20 < v21 && v21 >= 9) {
              WTF::HashTable<void const*,WTF::KeyValuePair<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>>>,WTF::DefaultHash<void const*>,WTF::HashMap<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<std::unique_ptr<WKHTTPCookieStoreObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<void const*>>::rehash(p_observers, v21 >> 1, 0);
            }
          }
        }
      }
      if (v15)
      {
        API::HTTPCookieStore::unregisterObserver((uint64_t)&self->_cookieStore, v15);
        uint64_t v23 = *(void (**)(void *))(*v15 + 8);
        v23(v15);
      }
    }
  }
}

- (void)setCookiePolicy:(WKCookiePolicy)policy completionHandler:(void *)completionHandler
{
  uint64_t v6 = _Block_copy(completionHandler);
  unsigned int v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C2D48;
  v7[1] = v6;
  unint64_t v10 = v7;
  if (policy) {
    char v8 = 1;
  }
  else {
    char v8 = 2;
  }
  API::HTTPCookieStore::setHTTPCookieAcceptPolicy((uint64_t)&self->_cookieStore, v8, (uint64_t *)&v10);
  uint64_t v9 = (uint64_t)v10;
  unint64_t v10 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  _Block_release(0);
}

- (void)getCookiePolicy:(void *)completionHandler
{
  uint64_t v4 = _Block_copy(completionHandler);
  v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C2D70;
  v5[1] = v4;
  unsigned int v7 = v5;
  API::HTTPCookieStore::getHTTPCookieAcceptPolicy((uint64_t)&self->_cookieStore, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  unsigned int v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (void).cxx_destruct
{
  m_tableForLLDB = self->_observers.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    uint64_t v3 = *(m_tableForLLDB - 1);
    if (v3)
    {
      uint64_t v4 = (uint64_t *)(m_tableForLLDB + 2);
      do
      {
        if (*(v4 - 1) != -1)
        {
          uint64_t v5 = *v4;
          uint64_t *v4 = 0;
          if (v5) {
            (*(void (**)(uint64_t, SEL))(*(void *)v5 + 8))(v5, a2);
          }
        }
        v4 += 2;
        --v3;
      }
      while (v3);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
  }
}

- (void)_getCookiesForURL:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x19972E8A0](v12, a3);
  uint64_t v6 = _Block_copy(a4);
  unsigned int v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C2D98;
  v7[1] = v6;
  uint64_t v11 = v7;
  API::HTTPCookieStore::cookiesForURL((uint64_t)&self->_cookieStore, (uint64_t *)v12, (uint64_t *)&v11);
  uint64_t v8 = (uint64_t)v11;
  uint64_t v11 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
  unint64_t v10 = v12[0];
  v12[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v9);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (void)_setCookieAcceptPolicy:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  unsigned int v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  if (a3 >= 4) {
    char v8 = 1;
  }
  else {
    char v8 = a3;
  }
  void *v7 = &unk_1EE9C2DC0;
  v7[1] = v6;
  unint64_t v10 = v7;
  API::HTTPCookieStore::setHTTPCookieAcceptPolicy((uint64_t)&self->_cookieStore, v8, (uint64_t *)&v10);
  uint64_t v9 = (uint64_t)v10;
  unint64_t v10 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  _Block_release(0);
}

- (void)_flushCookiesToDiskWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C2DE8;
  v5[1] = v4;
  unsigned int v7 = v5;
  API::HTTPCookieStore::flushCookies((uint64_t)&self->_cookieStore, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  unsigned int v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (void)getAllCookies:(void *)a1
{
  v2 = (const void *)a1[1];
  *a1 = &unk_1EE9C2CD0;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)getAllCookies:(WTF *)this
{
  uint64_t v3 = (const void *)*((void *)this + 1);
  *(void *)this = &unk_1EE9C2CD0;
  *((void *)this + 1) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)getAllCookies:(uint64_t)a1
{
  uint64_t v2 = *(void *)(a1 + 8);
  id v3 = coreCookiesToNSCookies(a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t, id))(v2 + 16);

  return v4(v2, v3);
}

- (void)setCookie:(void *)a1 completionHandler:
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_1EE9C2CF8;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)setCookie:(WTF *)this completionHandler:(void *)a2
{
  id v3 = (const void *)*((void *)this + 1);
  *(void *)this = &unk_1EE9C2CF8;
  *((void *)this + 1) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)setCookie:(uint64_t)a1 completionHandler:
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteCookie:(void *)a1 completionHandler:
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_1EE9C2D20;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)deleteCookie:(WTF *)this completionHandler:(void *)a2
{
  id v3 = (const void *)*((void *)this + 1);
  *(void *)this = &unk_1EE9C2D20;
  *((void *)this + 1) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)deleteCookie:(uint64_t)a1 completionHandler:
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (uint64_t)setCookiePolicy:(uint64_t)a1 completionHandler:
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (uint64_t)setCookiePolicy:(const void *)a1 completionHandler:
{
  *a1 = &unk_1EE9C2D48;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)getCookiePolicy:(uint64_t)a1
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)getCookiePolicy:(const void *)a1
{
  *a1 = &unk_1EE9C2D70;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

@end