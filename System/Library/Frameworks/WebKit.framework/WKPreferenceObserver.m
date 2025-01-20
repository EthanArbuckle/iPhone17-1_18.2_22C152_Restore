@interface WKPreferenceObserver
+ (id)sharedInstance;
- (WKPreferenceObserver)init;
- (WTF::StringImpl)preferenceDidChange:(void *)a1 key:encodedValue:;
- (id).cxx_construct;
- (uint64_t)preferenceDidChange:(WTF *)this key:(void *)a2 encodedValue:;
- (void)preferenceDidChange:(id)a3 key:(id)a4 encodedValue:(id)a5;
- (void)preferenceDidChange:(void *)a1 key:encodedValue:;
@end

@implementation WKPreferenceObserver

+ (id)sharedInstance
{
  if (_MergedGlobals_13 == 1) {
    return (id)qword_1EB358E18;
  }
  id result = objc_alloc_init((Class)objc_opt_class());
  qword_1EB358E18 = (uint64_t)result;
  _MergedGlobals_13 = 1;
  return result;
}

- (WKPreferenceObserver)init
{
  v19.receiver = self;
  v19.super_class = (Class)WKPreferenceObserver;
  v2 = [(WKPreferenceObserver *)&v19 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = 0;
    p_m_userDefaults = &v2->m_userDefaults;
    do
    {
      v6 = off_1E5811B28[v4];
      v7 = [[WKUserDefaults alloc] initWithSuiteName:v6];
      CFTypeRef cf = v7;
      if (!v7)
      {
        MEMORY[0x19972EAD0](&v16, v6);
        WTF::String::utf8();
        WTFLogAlways();
        v12 = v17;
        v17 = 0;
        if (v12)
        {
          if (*(_DWORD *)v12 == 1) {
            WTF::fastFree(v12, v11);
          }
          else {
            --*(_DWORD *)v12;
          }
        }
        v13 = v16;
        v16 = 0;
        if (v13)
        {
          if (*(_DWORD *)v13 == 2) {
            WTF::StringImpl::destroy(v13, (WTF::StringImpl *)v11);
          }
          else {
            *(_DWORD *)v13 -= 2;
          }
        }
        goto LABEL_18;
      }
      objc_storeWeak(&v7->m_observer.m_weakReference, v3);
      [(id)cf addObserver:cf forKeyPath:@"testkey" options:1 context:0];
      uint64_t m_size = v3->m_userDefaults.m_size;
      if (m_size == v3->m_userDefaults.m_capacity)
      {
        v9 = (CFTypeRef *)WTF::Vector<WTF::RetainPtr<WKUserDefaults>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v3->m_userDefaults, m_size + 1, (unint64_t)&cf);
        uint64_t m_size = v3->m_userDefaults.m_size;
        CFTypeRef v10 = *v9;
        *((void *)v3->m_userDefaults.m_buffer + m_size) = v10;
        if (v10) {
          goto LABEL_11;
        }
      }
      else
      {
        CFTypeRef v10 = cf;
        *((void *)p_m_userDefaults->m_buffer + m_size) = cf;
        if (v10)
        {
LABEL_11:
          CFRetain(v10);
          LODWORD(m_size) = v3->m_userDefaults.m_size;
        }
      }
      v3->m_userDefaults.uint64_t m_size = m_size + 1;
LABEL_18:
      CFTypeRef v14 = cf;
      CFTypeRef cf = 0;
      if (v14) {
        CFRelease(v14);
      }
      ++v4;
    }
    while (v4 != 11);
  }
  return v3;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)preferenceDidChange:(id)a3 key:(id)a4 encodedValue:(id)a5
{
  WTF::RunLoop::main((WTF::RunLoop *)self);
  if (a3) {
    CFRetain(a3);
  }
  if (a4) {
    CFRetain(a4);
  }
  if (a5) {
    CFRetain(a5);
  }
  v8 = (void *)WTF::fastMalloc((WTF *)0x20);
  void *v8 = &unk_1EE9B96E0;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a5;
  v9 = v8;
  WTF::RunLoop::dispatch();
  if (v9) {
    (*(void (**)(void *))(*v9 + 8))(v9);
  }
}

- (void).cxx_destruct
{
  uint64_t m_size = self->m_userDefaults.m_size;
  if (m_size)
  {
    m_buffer = (const void **)self->m_userDefaults.m_buffer;
    uint64_t v5 = 8 * m_size;
    do
    {
      v6 = *m_buffer;
      *m_buffer = 0;
      if (v6) {
        CFRelease(v6);
      }
      ++m_buffer;
      v5 -= 8;
    }
    while (v5);
  }
  v7 = (WTF *)self->m_userDefaults.m_buffer;
  if (v7)
  {
    self->m_userDefaults.m_buffer = 0;
    self->m_userDefaults.m_capacity = 0;
    WTF::fastFree(v7, (void *)a2);
  }
}

- (void)preferenceDidChange:(void *)a1 key:encodedValue:
{
  *a1 = &unk_1EE9B96E0;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)a1[1];
  a1[1] = 0;
  if (v4) {
    CFRelease(v4);
  }
  return a1;
}

- (uint64_t)preferenceDidChange:(WTF *)this key:(void *)a2 encodedValue:
{
  *(void *)this = &unk_1EE9B96E0;
  v3 = (const void *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v5) {
    CFRelease(v5);
  }

  return WTF::fastFree(this, a2);
}

- (WTF::StringImpl)preferenceDidChange:(void *)a1 key:encodedValue:
{
  LOBYTE(v21) = 0;
  char v22 = 0;
  if (a1[3])
  {
    MEMORY[0x19972EAD0](&v17);
    v3 = v17;
    if (v22)
    {
      v17 = 0;
      uint64_t v4 = v21;
      v21 = v3;
      if (!v4) {
        goto LABEL_9;
      }
      int v5 = *(_DWORD *)v4 - 2;
      if (*(_DWORD *)v4 != 2) {
        goto LABEL_7;
      }
      WTF::StringImpl::destroy(v4, v2);
      uint64_t v4 = v17;
      v17 = 0;
      if (!v4) {
        goto LABEL_9;
      }
      int v5 = *(_DWORD *)v4 - 2;
      if (*(_DWORD *)v4 == 2) {
        WTF::StringImpl::destroy(v4, v6);
      }
      else {
LABEL_7:
      }
        *(_DWORD *)uint64_t v4 = v5;
    }
    else
    {
      v21 = v17;
      char v22 = 1;
    }
  }
LABEL_9:
  MEMORY[0x19972EAD0](&v20, a1[1]);
  MEMORY[0x19972EAD0](&v19, a1[2]);
  {
    if (WebKit::singleton(void)::singleton)
    {
      uint64_t v7 = *(void *)(WebKit::singleton(void)::singleton + 8);
      if (v7)
      {
        v8 = (unsigned int *)(v7 + 16);
        atomic_fetch_add((atomic_uint *volatile)(v7 + 16), 1u);
        WebKit::AuxiliaryProcessProxy::notifyPreferencesChanged(v7, &v20, &v19, (const WTF::StringImpl *)&v21);
        WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v8);
      }
    }
  }
  else
  {
    WebKit::singleton(void)::singleton = 0;
  }
  {
    if (WebKit::NetworkProcessProxy::defaultNetworkProcess(void)::networkProcess)
    {
      uint64_t v9 = *(void *)(WebKit::NetworkProcessProxy::defaultNetworkProcess(void)::networkProcess + 8);
      if (v9)
      {
        CFTypeRef v10 = (unsigned int *)(v9 + 16);
        atomic_fetch_add((atomic_uint *volatile)(v9 + 16), 1u);
        WebKit::AuxiliaryProcessProxy::notifyPreferencesChanged(v9, &v20, &v19, (const WTF::StringImpl *)&v21);
        WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v10);
      }
    }
  }
  else
  {
    WebKit::NetworkProcessProxy::defaultNetworkProcess(void)::networkProcess = 0;
  }
  WebKit::WebProcessPool::allProcessPools((uint64_t)&v17);
  if (v18)
  {
    v12 = (uint64_t *)v17;
    uint64_t v13 = 8 * v18;
    do
    {
      WebKit::WebProcessPool::notifyPreferencesChanged(*v12++, &v20, &v19, (const WTF::StringImpl *)&v21);
      v13 -= 8;
    }
    while (v13);
  }
  WTF::Vector<WTF::Ref<WebKit::WebProcessPool,WTF::RawPtrTraits<WebKit::WebProcessPool>,WTF::DefaultRefDerefTraits<WebKit::WebProcessPool>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v17, v11);
  v15 = v19;
  objc_super v19 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy(v15, v14);
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  id result = v20;
  v20 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2) {
      id result = (WTF::StringImpl *)WTF::StringImpl::destroy(result, v14);
    }
    else {
      *(_DWORD *)result -= 2;
    }
  }
  if (v22)
  {
    id result = v21;
    v21 = 0;
    if (result)
    {
      if (*(_DWORD *)result == 2) {
        return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v14);
      }
      else {
        *(_DWORD *)result -= 2;
      }
    }
  }
  return result;
}

@end