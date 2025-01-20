@interface WKWebProcessPlugInController
- (Object)_apiObject;
- (OpaqueWKBundle)_bundleRef;
- (id).cxx_construct;
- (id)parameters;
- (void)_setPrincipalClassInstance:(id)a3;
- (void)dealloc;
- (void)extendClassesForParameterCoder:(id)a3;
@end

@implementation WKWebProcessPlugInController

- (id)parameters
{
  return WebKit::InjectedBundle::bundleParameters((WebKit::InjectedBundle *)&self->_bundle);
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  return self;
}

- (void)extendClassesForParameterCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a3 count];
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  if (v5)
  {
    if (v5 >> 29)
    {
      __break(0xC471u);
      return;
    }
    LODWORD(v26) = v5;
    uint64_t v25 = WTF::fastMalloc((WTF *)(8 * v5));
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = (void *)WKStringCreateWithCFString(v9);
          if (v10) {
            uint64_t v11 = [v10 _apiObject];
          }
          else {
            uint64_t v11 = 0;
          }
          int v12 = HIDWORD(v26);
          if (HIDWORD(v26) == v26)
          {
            unint64_t v13 = HIDWORD(v26) + ((unint64_t)HIDWORD(v26) >> 2);
            if (v13 >= 0x10) {
              unint64_t v14 = v13 + 1;
            }
            else {
              unint64_t v14 = 16;
            }
            if (v14 <= (unint64_t)HIDWORD(v26) + 1) {
              unint64_t v15 = HIDWORD(v26) + 1;
            }
            else {
              unint64_t v15 = v14;
            }
            WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&v25, v15);
            int v12 = HIDWORD(v26);
            v16 = (uint64_t *)(v25 + 8 * HIDWORD(v26));
          }
          else
          {
            v16 = (uint64_t *)(v25 + 8 * HIDWORD(v26));
          }
          uint64_t *v16 = v11;
          HIDWORD(v26) = v12 + 1;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v17 = [a3 countByEnumeratingWithState:&v21 objects:v27 count:16];
      uint64_t v6 = v17;
    }
    while (v17);
  }
  API::Array::create(&v25, (uint64_t *)&v20);
  WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v25, v18);
  v19 = v20;
  WebKit::InjectedBundle::extendClassesForParameterCoder((WebKit::InjectedBundle *)&self->_bundle, v20);
  CFRelease(*((CFTypeRef *)v19 + 1));
}

- (void)_setPrincipalClassInstance:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_principalClassInstance.m_ptr;
  self->_principalClassInstance.m_ptr = a3;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v10 = 0;
  long long v9 = 0u;
  *(void *)&long long v6 = 1;
  *((void *)&v6 + 1) = self;
  uint64_t v7 = didCreatePage;
  uint64_t v8 = willDestroyPage;
  WKBundleSetClient(*(void **)&self->_bundle.data.__lx[8], &v6);
}

- (Object)_apiObject
{
  return (Object *)&self->_bundle;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_bundle.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKWebProcessPlugInController;
    [(WKWebProcessPlugInController *)&v4 dealloc];
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_principalClassInstance.m_ptr;
  self->_principalClassInstance.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (OpaqueWKBundle)_bundleRef
{
  return *(OpaqueWKBundle **)&self->_bundle.data.__lx[8];
}

@end