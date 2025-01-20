@interface _LSDServiceDomain
+ (_LSDServiceDomain)currentUserSessionDomain;
+ (id)defaultServiceDomain;
+ (id)defaultServiceDomainIndirect;
+ (id)systemSessionDomain;
- (double)connectionConfigurationStateForServiceClass:(uint64_t)a3@<X8>;
- (id).cxx_construct;
- (id)debugDescription;
- (uint64_t)initWithUID:(void *)a1;
- (uint64_t)resolvedDomainUID;
- (uint64_t)resolvedSessionKey;
- (void)resolvedDomainUID;
@end

@implementation _LSDServiceDomain

+ (id)defaultServiceDomain
{
  self;
  if (+[_LSDServiceDomain defaultServiceDomain]::once != -1) {
    dispatch_once(&+[_LSDServiceDomain defaultServiceDomain]::once, &__block_literal_global_36);
  }
  v0 = (void *)+[_LSDServiceDomain defaultServiceDomain]::target;

  return v0;
}

- (uint64_t)resolvedSessionKey
{
  if (result)
  {
    if (*(_WORD *)(result + 16) == 3) {
      return 0x100000000;
    }
    else {
      return -[_LSDServiceDomain resolvedDomainUID](result);
    }
  }
  return result;
}

- (uint64_t)resolvedDomainUID
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 12))
    {
      return *(unsigned int *)(result + 8);
    }
    else
    {
      int v2 = *(unsigned __int16 *)(result + 16);
      if (*(_WORD *)(result + 16))
      {
        if (v2 == 3)
        {
          return 0;
        }
        else
        {
          if (v2 != 1)
          {
            v5 = [MEMORY[0x1E4F28B00] currentHandler];
            objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_resolvedDomainUID, v1, @"LSDService.mm", 157, @"Resolving effective UID for domain had bogus type %d", *(unsigned __int16 *)(v1 + 16));
          }
          if (xpc_user_sessions_enabled()) {
            uint64_t foreground_uid = xpc_user_sessions_get_foreground_uid();
          }
          else {
            uint64_t foreground_uid = _CFGetEUID();
          }
          result = [(id)__LSDefaultsGetSharedInstance() proxyUIDForUID:foreground_uid];
          *(_DWORD *)(v1 + 8) = result;
          *(unsigned char *)(v1 + 12) = 1;
        }
      }
      else
      {
        SharedInstance = (void *)__LSDefaultsGetSharedInstance();
        return [SharedInstance proxyUIDForCurrentEffectiveUID];
      }
    }
  }
  return result;
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 12) = 0;
  return self;
}

- (double)connectionConfigurationStateForServiceClass:(uint64_t)a3@<X8>
{
  if (!a1)
  {
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return result;
  }
  uint64_t v6 = *(unsigned __int16 *)(a1 + 16);
  unsigned int v7 = [(id)__LSDefaultsGetSharedInstance() proxyUIDForCurrentEffectiveUID];
  *(void *)a3 = 0;
  *(_DWORD *)(a3 + 8) = v7;
  *(void *)(a3 + 16) = configureUIDVanilla;
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (v6 << 32) | (objc_msgSend(a2, "connectionType") << 48) | v7);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  *(void *)(a3 + 24) = v14;
  int v8 = *(unsigned __int16 *)(a1 + 16);
  if (v8 == 2)
  {
    if (!-[_LSDServiceDomain resolvedDomainUID](a1))
    {
LABEL_7:
      *(void *)a3 = 4096;
      goto LABEL_8;
    }
    int v8 = *(unsigned __int16 *)(a1 + 16);
  }
  if (v8 == 3 || [a2 XPCConnectionIsAlwaysPrivileged]) {
    goto LABEL_7;
  }
LABEL_8:
  int v9 = *(unsigned __int16 *)(a1 + 16);
  if (v9 == 1)
  {
    if (xpc_user_sessions_enabled())
    {
      v10 = configureUIDForUserSession;
      unsigned int v11 = -[_LSDServiceDomain resolvedDomainUID](a1);
LABEL_18:
      unsigned int v12 = v11;
      goto LABEL_19;
    }
    int v9 = *(unsigned __int16 *)(a1 + 16);
  }
  if (v9 == 2) {
    goto LABEL_17;
  }
  if (v9 == 3)
  {
    v10 = (void (*)(NSXPCConnection *))configureUIDNull;
    unsigned int v11 = -[_LSDServiceDomain resolvedDomainUID](a1);
    goto LABEL_18;
  }
  if (([a2 XPCConnectionIsAlwaysPrivileged] & 1) == 0)
  {
LABEL_17:
    v10 = (void (*)(NSXPCConnection *))configureUIDVanilla;
    unsigned int v11 = -[_LSDServiceDomain resolvedDomainUID](a1);
    goto LABEL_18;
  }
  v10 = (void (*)(NSXPCConnection *))configureUIDVanilla;
  unsigned int v12 = 0;
LABEL_19:
  *(_DWORD *)(a3 + 8) = v12;
  *(void *)(a3 + 16) = v10;
  *(void *)(a3 + 24) = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (objc_msgSend(a2, "connectionType") << 48) | ((unint64_t)*(unsigned __int16 *)(a1 + 16) << 32) | v12);

  return result;
}

- (uint64_t)initWithUID:(void *)a1
{
  if (!a1) {
    return 0;
  }
  if (a2)
  {
    int v3 = [(id)__LSDefaultsGetSharedInstance() proxyUIDForUID:a2];
    v7.receiver = a1;
    v7.super_class = (Class)_LSDServiceDomain;
    v4 = objc_msgSendSuper2(&v7, sel_init);
    uint64_t v5 = (uint64_t)v4;
    if (v4)
    {
      v4[2] = v3;
      *((unsigned char *)v4 + 12) = 1;
      *((_WORD *)v4 + 8) = 2;
    }
  }
  else
  {
    uint64_t v5 = +[_LSDServiceDomain systemSessionDomain]();
  }
  return v5;
}

+ (id)systemSessionDomain
{
  self;
  if (+[_LSDServiceDomain systemSessionDomain]::once != -1) {
    dispatch_once(&+[_LSDServiceDomain systemSessionDomain]::once, &__block_literal_global_2);
  }
  v0 = (void *)+[_LSDServiceDomain systemSessionDomain]::target;

  return v0;
}

+ (_LSDServiceDomain)currentUserSessionDomain
{
  self;
  v0 = [_LSDServiceDomain alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)_LSDServiceDomain;
    v0 = (_LSDServiceDomain *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_resolvedDomainUID.__engaged_ = 0;
      v0->_resolvedDomainUID.var0.__val_ = 0;
      v0->_specifierType = 1;
    }
  }

  return v0;
}

- (id)debugDescription
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p type %d resolvedDomainUID %d>", v4, self, self->_specifierType, -[_LSDServiceDomain resolvedDomainUID]((uint64_t)self)];
}

+ (id)defaultServiceDomainIndirect
{
  return +[_LSDServiceDomain defaultServiceDomain]();
}

- (void)resolvedDomainUID
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "-[_LSDServiceDomain resolvedDomainUID]";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  *((_WORD *)buf + 9) = 2080;
  *(void *)(buf + 20) = a1;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "%s: xpc_user_sessions_get_foreground_uid() failed with error %d - %s", buf, 0x1Cu);
}

@end