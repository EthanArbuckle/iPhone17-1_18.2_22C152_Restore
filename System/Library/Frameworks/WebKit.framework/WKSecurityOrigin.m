@interface WKSecurityOrigin
+ (BOOL)accessInstanceVariablesDirectly;
- (BOOL)isSameSiteAsOrigin:(id)a3;
- (BOOL)isSameSiteAsURL:(id)a3;
- (NSInteger)port;
- (NSString)description;
- (NSString)host;
- (NSString)protocol;
- (Object)_apiObject;
- (void)dealloc;
@end

@implementation WKSecurityOrigin

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKSecurityOrigin accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKSecurityOrigin accessInstanceVariablesDirectly]::didLogFault = 1;
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
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_securityOrigin.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKSecurityOrigin;
    [(WKSecurityOrigin *)&v4 dealloc];
  }
}

- (NSString)description
{
  char v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; protocol = %@; host = %@; port = %li>",
                       NSStringFromClass(v4),
                       self,
                       [(WKSecurityOrigin *)self protocol],
                       [(WKSecurityOrigin *)self host],
                       [(WKSecurityOrigin *)self port]);
}

- (NSString)protocol
{
  int v2 = *(_DWORD *)&self->_securityOrigin.data.__lx[40];
  if (v2)
  {
    if (v2 != 1)
    {
      std::__throw_bad_variant_access[abi:sn180100]();
      return (NSString *)&stru_1EEA10550;
    }
    char v3 = (unsigned __int8 *)MEMORY[0x1E4F30980];
  }
  else
  {
    char v3 = &self->_securityOrigin.data.__lx[16];
  }
  if (!*(void *)v3) {
    return (NSString *)&stru_1EEA10550;
  }

  return (NSString *)WTF::StringImpl::operator NSString *();
}

- (NSString)host
{
  int v2 = *(_DWORD *)&self->_securityOrigin.data.__lx[40];
  if (v2)
  {
    if (v2 != 1)
    {
      v5 = (WKSecurityOrigin *)std::__throw_bad_variant_access[abi:sn180100]();
      return (NSString *)[(WKSecurityOrigin *)v5 port];
    }
    char v3 = (unsigned __int8 *)MEMORY[0x1E4F30980];
  }
  else
  {
    char v3 = &self->_securityOrigin.data.__lx[24];
  }
  if (!*(void *)v3) {
    return (NSString *)&stru_1EEA10550;
  }

  return (NSString *)WTF::StringImpl::operator NSString *();
}

- (NSInteger)port
{
  int v2 = *(_DWORD *)&self->_securityOrigin.data.__lx[40];
  if (!v2)
  {
    int v3 = *(_DWORD *)&self->_securityOrigin.data.__lx[32];
    if ((v3 & 0xFF0000) != 0) {
      return (unsigned __int16)v3;
    }
LABEL_5:
    LOWORD(v3) = 0;
    return (unsigned __int16)v3;
  }
  if (v2 == 1) {
    goto LABEL_5;
  }
  v5 = (WKSecurityOrigin *)std::__throw_bad_variant_access[abi:sn180100]();
  return [(WKSecurityOrigin *)v5 isSameSiteAsOrigin:v7];
}

- (BOOL)isSameSiteAsOrigin:(id)a3
{
  WebCore::SecurityOriginData::securityOrigin((uint64_t *)&v10, (WebCore::SecurityOriginData *)&self->_securityOrigin.data.__lx[16]);
  WebCore::SecurityOriginData::securityOrigin((uint64_t *)&v9, (WebCore::SecurityOriginData *)((char *)a3 + 24));
  char isSameSiteAs = WebCore::SecurityOrigin::isSameSiteAs(v10, v9);
  SEL v6 = v9;
  v9 = 0;
  if (v6) {
    WTF::ThreadSafeRefCounted<WebCore::SecurityOrigin,(WTF::DestructionThread)0>::deref((uint64_t)v6, v4);
  }
  id v7 = v10;
  v10 = 0;
  if (v7) {
    WTF::ThreadSafeRefCounted<WebCore::SecurityOrigin,(WTF::DestructionThread)0>::deref((uint64_t)v7, v4);
  }
  return isSameSiteAs;
}

- (BOOL)isSameSiteAsURL:(id)a3
{
  WebCore::SecurityOriginData::securityOrigin((uint64_t *)&v14, (WebCore::SecurityOriginData *)&self->_securityOrigin.data.__lx[16]);
  MEMORY[0x19972E8A0](v12, a3);
  WebCore::SecurityOrigin::create((uint64_t *)&v13, (WebCore::SecurityOrigin *)v12, v4);
  SEL v6 = v12[0];
  v12[0] = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  char isSameSiteAs = WebCore::SecurityOrigin::isSameSiteAs(v14, v13);
  v9 = v13;
  v13 = 0;
  if (v9) {
    WTF::ThreadSafeRefCounted<WebCore::SecurityOrigin,(WTF::DestructionThread)0>::deref((uint64_t)v9, v7);
  }
  v10 = v14;
  v14 = 0;
  if (v10) {
    WTF::ThreadSafeRefCounted<WebCore::SecurityOrigin,(WTF::DestructionThread)0>::deref((uint64_t)v10, v7);
  }
  return isSameSiteAs;
}

- (Object)_apiObject
{
  return (Object *)&self->_securityOrigin;
}

@end