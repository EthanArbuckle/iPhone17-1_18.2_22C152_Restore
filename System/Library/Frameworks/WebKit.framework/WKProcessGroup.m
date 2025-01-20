@interface WKProcessGroup
- (OpaqueWKContext)_contextRef;
- (WKGeolocationProviderIOS)_geolocationProvider;
- (WKProcessGroup)init;
- (WKProcessGroup)initWithInjectedBundleURL:(id)a3;
- (WKProcessGroup)initWithInjectedBundleURL:(id)a3 andCustomClassesForParameterCoder:(id)a4;
- (id).cxx_construct;
@end

@implementation WKProcessGroup

- (WKProcessGroup)init
{
  return [(WKProcessGroup *)self initWithInjectedBundleURL:0];
}

- (WKProcessGroup)initWithInjectedBundleURL:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WKProcessGroup;
  if ([(WKProcessGroup *)&v9 init])
  {
    v4 = (uint64_t *)API::Object::newObject(0xA8uLL, 90);
    API::ProcessPoolConfiguration::ProcessPoolConfiguration((API::ProcessPoolConfiguration *)v4);
    if (a3) {
      MEMORY[0x19972EAD0](v10, [a3 path]);
    }
    else {
      v10[0] = 0;
    }
    WTF::String::operator=(v4 + 2, v10);
    v6 = v10[0];
    v10[0] = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        v6 = (WTF::StringImpl *)WTF::StringImpl::destroy(v6, v5);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
    WebKit::InitializeWebKit2(v6);
    v7 = (WebKit::WebProcessPool *)API::Object::newObject(0x3C8uLL, 89);
    WebKit::WebProcessPool::WebProcessPool(v7, (API::ProcessPoolConfiguration *)v4);
  }
  return 0;
}

- (WKProcessGroup)initWithInjectedBundleURL:(id)a3 andCustomClassesForParameterCoder:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WKProcessGroup;
  if ([(WKProcessGroup *)&v10 init])
  {
    v5 = (uint64_t *)API::Object::newObject(0xA8uLL, 90);
    API::ProcessPoolConfiguration::ProcessPoolConfiguration((API::ProcessPoolConfiguration *)v5);
    if (a3) {
      MEMORY[0x19972EAD0](v11, [a3 path]);
    }
    else {
      v11[0] = 0;
    }
    WTF::String::operator=(v5 + 2, v11);
    v7 = v11[0];
    v11[0] = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2) {
        v7 = (WTF::StringImpl *)WTF::StringImpl::destroy(v7, v6);
      }
      else {
        *(_DWORD *)v7 -= 2;
      }
    }
    WebKit::InitializeWebKit2(v7);
    v8 = (WebKit::WebProcessPool *)API::Object::newObject(0x3C8uLL, 89);
    WebKit::WebProcessPool::WebProcessPool(v8, (API::ProcessPoolConfiguration *)v5);
  }
  return 0;
}

- (void).cxx_destruct
{
  m_ptr = self->_geolocationProvider.m_ptr;
  self->_geolocationProvider.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->_processPool.m_ptr;
  self->_processPool.m_ptr = 0;
  if (v4)
  {
    v5 = (const void *)*((void *)v4 + 1);
    CFRelease(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (OpaqueWKContext)_contextRef
{
  m_ptr = self->_processPool.m_ptr;
  if (m_ptr) {
    return (OpaqueWKContext *)*((void *)m_ptr + 1);
  }
  else {
    return 0;
  }
}

- (WKGeolocationProviderIOS)_geolocationProvider
{
  result = (WKGeolocationProviderIOS *)self->_geolocationProvider.m_ptr;
  if (!result)
  {
    result = [[WKGeolocationProviderIOS alloc] initWithProcessPool:self->_processPool.m_ptr];
    m_ptr = self->_geolocationProvider.m_ptr;
    self->_geolocationProvider.m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return (WKGeolocationProviderIOS *)self->_geolocationProvider.m_ptr;
    }
  }
  return result;
}

@end