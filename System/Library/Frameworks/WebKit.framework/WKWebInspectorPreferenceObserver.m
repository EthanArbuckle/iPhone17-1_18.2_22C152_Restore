@interface WKWebInspectorPreferenceObserver
+ (id)sharedInstance;
- (WKWebInspectorPreferenceObserver)init;
- (id).cxx_construct;
- (uint64_t)observeValueForKeyPath:ofObject:change:context:;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation WKWebInspectorPreferenceObserver

+ (id)sharedInstance
{
  if (_MergedGlobals_131 == 1) {
    return (id)qword_1EB35A220;
  }
  id result = objc_alloc_init((Class)objc_opt_class());
  qword_1EB35A220 = (uint64_t)result;
  _MergedGlobals_131 = 1;
  return result;
}

- (WKWebInspectorPreferenceObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)WKWebInspectorPreferenceObserver;
  v2 = [(WKWebInspectorPreferenceObserver *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:WebKit::bundleIdentifierForSandboxBroker((WebKit *)v2)];
    m_ptr = v3->m_userDefaults.m_ptr;
    v3->m_userDefaults.m_ptr = v4;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v4 = v3->m_userDefaults.m_ptr;
    }
    if (v4) {
      [v4 addObserver:v3 forKeyPath:@"ShowDevelopMenu" options:1 context:0];
    }
    else {
      WTFLogAlways();
    }
  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  WTF::RunLoop::main((WTF::RunLoop *)self);
  v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v6 = &unk_1EEA005E0;
  objc_super v7 = v6;
  WTF::RunLoop::dispatch();
  if (v7) {
    (*(void (**)(void *))(*v7 + 8))(v7);
  }
}

- (void).cxx_destruct
{
  m_ptr = self->m_userDefaults.m_ptr;
  self->m_userDefaults.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (uint64_t)observeValueForKeyPath:ofObject:change:context:
{
  WebKit::WebProcessPool::allProcessPools((uint64_t)&v7);
  if (v8)
  {
    v1 = v7;
    v2 = &v7[v8];
    do
    {
      uint64_t v3 = *v1;
      if (*(_DWORD *)(*v1 + 84))
      {
        unint64_t v4 = 0;
        do
        {
          v5 = *(atomic_uint **)(*(void *)(v3 + 72) + 8 * v4);
          atomic_fetch_add(v5 + 4, 1u);
          WebKit::WebProcessProxy::enableRemoteInspectorIfNeeded((WebKit::WebProcessProxy *)v5);
          if (v5) {
            WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref((unsigned int *)v5 + 4);
          }
          ++v4;
          uint64_t v3 = *v1;
        }
        while (v4 < *(unsigned int *)(*v1 + 84));
      }
      ++v1;
    }
    while (v1 != v2);
  }
  return WTF::Vector<WTF::Ref<WebKit::WebProcessPool,WTF::RawPtrTraits<WebKit::WebProcessPool>,WTF::DefaultRefDerefTraits<WebKit::WebProcessPool>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v7, v0);
}

@end