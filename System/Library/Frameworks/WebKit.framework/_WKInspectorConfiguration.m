@interface _WKInspectorConfiguration
- (NSString)groupIdentifier;
- (Object)_apiObject;
- (WKProcessPool)processPool;
- (_WKInspectorConfiguration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)applyToWebViewConfiguration:(id)a3;
- (void)dealloc;
- (void)setGroupIdentifier:(id)a3;
- (void)setProcessPool:(id)a3;
- (void)setURLSchemeHandler:(id)a3 forURLScheme:(id)a4;
@end

@implementation _WKInspectorConfiguration

- (_WKInspectorConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)_WKInspectorConfiguration;
  v2 = [(_WKInspectorConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(_WKInspectorConfiguration *)v2 _apiObject];
    *(_OWORD *)(v4 + 8) = 0u;
    *(_OWORD *)(v4 + 24) = 0u;
    *(void *)uint64_t v4 = &unk_1EE9D1E28;
    WebKit::InitializeWebKit2((WebKit *)v4);
    *(void *)(v4 + 24) = 0;
    *(void *)(v4 + 32) = 0;
    *(void *)(v4 + 8) = v3;
    *(void *)(v4 + 16) = 0;
    *(void *)uint64_t v4 = &unk_1EE9DFE10;
  }
  return v3;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::InspectorConfiguration::~InspectorConfiguration((API::InspectorConfiguration *)&self->_configuration, v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKInspectorConfiguration;
    [(_WKInspectorConfiguration *)&v5 dealloc];
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_configuration;
}

- (void)setURLSchemeHandler:(id)a3 forURLScheme:(id)a4
{
  WebKit::WebURLSchemeHandlerCocoa::create(a3, (uint64_t *)&v9);
  v10 = v9;
  MEMORY[0x19972EAD0](&v8, a4);
  API::InspectorConfiguration::addURLSchemeHandler((uint64_t)&self->_configuration, &v10, &v8);
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  if (v10)
  {
    if (v10[2] == 1) {
      (*(void (**)(void))(*(void *)v10 + 8))();
    }
    else {
      --v10[2];
    }
  }
}

- (void)setProcessPool:(id)a3
{
  if (a3) {
    v3 = (CFTypeRef *)((char *)a3 + 8);
  }
  else {
    v3 = 0;
  }
  API::InspectorConfiguration::setProcessPool((API::InspectorConfiguration *)&self->_configuration, v3);
}

- (WKProcessPool)processPool
{
  uint64_t v2 = *(void *)&self->_configuration.data.__lx[32];
  if (v2) {
    return *(WKProcessPool **)(v2 + 8);
  }
  else {
    return 0;
  }
}

- (void)applyToWebViewConfiguration:(id)a3
{
  uint64_t v5 = *(unsigned int *)&self->_configuration.data.__lx[28];
  if (v5)
  {
    objc_super v6 = *(void **)&self->_configuration.data.__lx[16];
    v7 = &v6[2 * v5];
    do
    {
      uint64_t v8 = *v6;
      v9 = (WTF::StringImpl *)v6[1];
      ++*(_DWORD *)(*v6 + 8);
      if (v9)
      {
        *(_DWORD *)v9 += 2;
        uint64_t v10 = *(void *)(v8 + 48);
        v11 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else
      {
        uint64_t v10 = *(void *)(v8 + 48);
        v11 = &stru_1EEA10550;
      }
      [a3 setURLSchemeHandler:v10 forURLScheme:v11];
      if (v9)
      {
        if (*(_DWORD *)v9 == 2) {
          WTF::StringImpl::destroy(v9, v12);
        }
        else {
          *(_DWORD *)v9 -= 2;
        }
      }
      if (*(_DWORD *)(v8 + 8) == 1) {
        (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
      }
      else {
        --*(_DWORD *)(v8 + 8);
      }
      v6 += 2;
    }
    while (v6 != v7);
  }
  v13 = [(_WKInspectorConfiguration *)self processPool];
  if (v13) {
    [a3 setProcessPool:v13];
  }
  v14 = [(_WKInspectorConfiguration *)self groupIdentifier];
  if (v14)
  {
    [a3 _setGroupIdentifier:v14];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = *(unsigned int *)&self->_configuration.data.__lx[28];
  if (v5)
  {
    objc_super v6 = *(void **)&self->_configuration.data.__lx[16];
    v7 = &v6[2 * v5];
    do
    {
      uint64_t v8 = *v6;
      v9 = (WTF::StringImpl *)v6[1];
      ++*(_DWORD *)(*v6 + 8);
      if (v9)
      {
        *(_DWORD *)v9 += 2;
        uint64_t v10 = *(void *)(v8 + 48);
        v11 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else
      {
        uint64_t v10 = *(void *)(v8 + 48);
        v11 = &stru_1EEA10550;
      }
      [v4 setURLSchemeHandler:v10 forURLScheme:v11];
      if (v9)
      {
        if (*(_DWORD *)v9 == 2) {
          WTF::StringImpl::destroy(v9, v12);
        }
        else {
          *(_DWORD *)v9 -= 2;
        }
      }
      if (*(_DWORD *)(v8 + 8) == 1) {
        (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
      }
      else {
        --*(_DWORD *)(v8 + 8);
      }
      v6 += 2;
    }
    while (v6 != v7);
  }
  v13 = [(_WKInspectorConfiguration *)self processPool];
  if (v13) {
    [v4 setProcessPool:v13];
  }
  v14 = [(_WKInspectorConfiguration *)self groupIdentifier];
  if (v14) {
    [v4 setGroupIdentifier:v14];
  }
  return v4;
}

- (NSString)groupIdentifier
{
  return *(NSString **)&self->_configuration.data.__lx[40];
}

- (void)setGroupIdentifier:(id)a3
{
}

@end