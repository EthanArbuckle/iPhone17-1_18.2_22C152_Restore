@interface NSURLProtectionSpace
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProxy;
- (BOOL)receivesCredentialSecurely;
- (NSArray)distinguishedNames;
- (NSInteger)port;
- (NSString)authenticationMethod;
- (NSString)description;
- (NSString)host;
- (NSString)protocol;
- (NSString)proxyType;
- (NSString)realm;
- (NSURLProtectionSpace)init;
- (NSURLProtectionSpace)initWithCoder:(id)a3;
- (NSURLProtectionSpace)initWithHost:(NSString *)host port:(NSInteger)port protocol:(NSString *)protocol realm:(NSString *)realm authenticationMethod:(NSString *)authenticationMethod;
- (NSURLProtectionSpace)initWithProxyHost:(NSString *)host port:(NSInteger)port type:(NSString *)type realm:(NSString *)realm authenticationMethod:(NSString *)authenticationMethod;
- (SecTrustRef)serverTrust;
- (_CFURLProtectionSpace)_CFURLProtectionSpace;
- (_CFURLProtectionSpace)_cfurlprtotectionspace;
- (id)_initWithCFURLProtectionSpace:(_CFURLProtectionSpace *)a3;
- (id)_initWithWebKitPropertyListData:(id)a3;
- (id)_webKitPropertyListData;
- (unint64_t)hash;
- (void)_setDistinguishedNames:(id)a3;
- (void)_setServerTrust:(__SecTrust *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSURLProtectionSpace

- (_CFURLProtectionSpace)_cfurlprtotectionspace
{
  return (_CFURLProtectionSpace *)self->_internal;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal) {
    CFRelease(internal);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSURLProtectionSpace;
  [(NSURLProtectionSpace *)&v4 dealloc];
}

- (id)_initWithCFURLProtectionSpace:(_CFURLProtectionSpace *)a3
{
  if (!self) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)NSURLProtectionSpace;
  objc_super v4 = [(NSURLProtectionSpace *)&v7 init];
  if (!v4) {
    return 0;
  }
  v5 = v4;
  v4->_internal = 0;
  if (!a3)
  {

    return 0;
  }
  CFRetain(a3);
  v5->_internal = (NSURLProtectionSpaceInternal *)CFMakeCollectable(a3);
  return v5;
}

- (NSString)authenticationMethod
{
  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
  }
  v3 = (char *)internal + 16;
  if (!internal) {
    v3 = 0;
  }
  unsigned int v4 = *((_DWORD *)v3 + 14) - 2;
  if (v4 > 0xA) {
    return (NSString *)@"NSURLAuthenticationMethodDefault";
  }
  else {
    return &off_1E5252FE8[v4]->isa;
  }
}

- (_CFURLProtectionSpace)_CFURLProtectionSpace
{
  return (_CFURLProtectionSpace *)self->_internal;
}

- (NSString)proxyType
{
  if (!CFURLProtectionSpaceIsProxy((uint64_t)self->_internal)) {
    return 0;
  }
  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
  }
  result = 0;
  v5 = (char *)internal + 16;
  if (!internal) {
    v5 = 0;
  }
  unsigned int v6 = *((_DWORD *)v5 + 11) - 1;
  if (v6 <= 7) {
    return &off_1E5253040[v6]->isa;
  }
  return result;
}

- (NSURLProtectionSpace)initWithCoder:(id)a3
{
  if ([a3 requiresSecureCoding] && objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = (const void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v18, "setWithObjects:", v17, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0), @"__nsurlprotectionspace_proto_plist");
  }
  else
  {
    v13 = (const void *)[a3 decodeObject];
  }
  if (v13)
  {
    v14 = (const void *)_CFURLProtectionSpaceCreateFromArchive((const __CFAllocator *)*MEMORY[0x1E4F1CF80], v13);
    v15 = [(NSURLProtectionSpace *)self _initWithCFURLProtectionSpace:v14];
    if (v14) {
      CFRelease(v14);
    }
    return v15;
  }
  else
  {
    return (NSURLProtectionSpace *)[(NSURLProtectionSpace *)self _initWithCFURLProtectionSpace:0];
  }
}

- (void)encodeWithCoder:(id)a3
{
  CFTypeRef Archive = _CFURLProtectionSpaceCreateArchive((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (uint64_t)[(NSURLProtectionSpace *)self _cfurlprtotectionspace]);
  if (Archive)
  {
    uint64_t v5 = Archive;
    if ([a3 requiresSecureCoding] && objc_msgSend(a3, "allowsKeyedCoding")) {
      [a3 encodeObject:v5 forKey:@"__nsurlprotectionspace_proto_plist"];
    }
    else {
      [a3 encodeObject:v5];
    }
    CFRelease(v5);
  }
}

- (NSString)protocol
{
  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
  }
  result = 0;
  unsigned int v4 = (char *)internal + 16;
  if (!internal) {
    unsigned int v4 = 0;
  }
  unsigned int v5 = *((_DWORD *)v4 + 11) - 1;
  if (v5 <= 7) {
    return &off_1E5253040[v5]->isa;
  }
  return result;
}

- (void)_setServerTrust:(__SecTrust *)a3
{
  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
  }
  if (internal) {
    unsigned int v5 = (char *)internal + 16;
  }
  else {
    unsigned int v5 = 0;
  }
  uint64_t v6 = (__SecTrust *)*((void *)v5 + 9);
  if (v6 != a3)
  {
    if (v6) {
      CFRelease(v6);
    }
    if (a3) {
      CFTypeRef v7 = CFRetain(a3);
    }
    else {
      CFTypeRef v7 = 0;
    }
    *((void *)v5 + 9) = v7;
  }
}

- (SecTrustRef)serverTrust
{
  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
  }
  v3 = (char *)internal + 16;
  if (!internal) {
    v3 = 0;
  }
  return (SecTrustRef)*((void *)v3 + 9);
}

- (void)_setDistinguishedNames:(id)a3
{
  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
  }
  if (internal) {
    unsigned int v5 = (NSURLProtectionSpaceInternal *)((char *)internal + 16);
  }
  else {
    unsigned int v5 = 0;
  }

  URLProtectionSpace::setDistinguishedNames(v5, a3);
}

- (NSArray)distinguishedNames
{
  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
  }
  v3 = (char *)internal + 16;
  if (!internal) {
    v3 = 0;
  }
  return (NSArray *)*((void *)v3 + 8);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(internal) = 1;
  }
  else
  {
    self;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    internal = self->_internal;
    if (!internal) {
      return (char)internal;
    }
    uint64_t v6 = (const void *)*((void *)a3 + 1);
    if (!v6)
    {
LABEL_6:
      LOBYTE(internal) = 0;
      return (char)internal;
    }
    LOBYTE(internal) = CFEqual(internal, v6) != 0;
  }
  return (char)internal;
}

- (unint64_t)hash
{
  return CFHash(self->_internal);
}

- (NSInteger)port
{
  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
  }
  v3 = (char *)internal + 16;
  if (!internal) {
    v3 = 0;
  }
  return *((int *)v3 + 10);
}

- (NSString)host
{
  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
  }
  v3 = (id *)((char *)internal + 16);
  if (!internal) {
    v3 = 0;
  }
  id v4 = v3[4];

  return (NSString *)v4;
}

- (BOOL)isProxy
{
  return CFURLProtectionSpaceIsProxy((uint64_t)self->_internal);
}

- (BOOL)receivesCredentialSecurely
{
  return CFURLProtectionSpaceReceivesCredentialSecurely((uint64_t)self->_internal) != 0;
}

- (NSString)realm
{
  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
  }
  v3 = (id *)((char *)internal + 16);
  if (!internal) {
    v3 = 0;
  }
  id v4 = v3[6];

  return (NSString *)v4;
}

- (NSString)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)NSURLProtectionSpace;
  id v4 = [(NSURLProtectionSpace *)&v12 description];
  unsigned int v5 = [(NSURLProtectionSpace *)self host];
  uint64_t v6 = [(NSURLProtectionSpace *)self protocol];
  CFTypeRef v7 = [(NSURLProtectionSpace *)self authenticationMethod];
  uint64_t v8 = [(NSURLProtectionSpace *)self realm];
  NSInteger v9 = [(NSURLProtectionSpace *)self port];
  if ([(NSURLProtectionSpace *)self isProxy]) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  return (NSString *)[v3 stringWithFormat:@"%@: Host:%@, Server:%@, Auth-Scheme:%@, Realm:%@, Port:%ld, Proxy:%@, Proxy-Type:%@", v4, v5, v6, v7, v8, v9, v10, -[NSURLProtectionSpace proxyType](self, "proxyType")];
}

- (NSURLProtectionSpace)init
{
  return 0;
}

- (NSURLProtectionSpace)initWithProxyHost:(NSString *)host port:(NSInteger)port type:(NSString *)type realm:(NSString *)realm authenticationMethod:(NSString *)authenticationMethod
{
  if (!self) {
    return 0;
  }
  int v10 = port;
  v18.receiver = self;
  v18.super_class = (Class)NSURLProtectionSpace;
  objc_super v12 = [(NSURLProtectionSpace *)&v18 init];
  if (!v12) {
    return 0;
  }
  v13 = v12;
  v12->_internal = 0;
  int v14 = authMethodToAuthScheme(authenticationMethod);
  if (type && ![(NSString *)type isEqualToString:@"http"])
  {
    if ([(NSString *)type isEqualToString:@"https"])
    {
      int v15 = 6;
    }
    else if ([(NSString *)type isEqualToString:@"ftp"])
    {
      int v15 = 7;
    }
    else if ([(NSString *)type isEqualToString:@"SOCKS"])
    {
      int v15 = 8;
    }
    else
    {
      int v15 = 5;
    }
  }
  else
  {
    int v15 = 5;
  }
  v16 = (const void *)CFURLProtectionSpaceCreate(0, (const __CFString *)host, v10, v15, (const __CFString *)realm, v14);
  v13->_internal = (NSURLProtectionSpaceInternal *)CFMakeCollectable(v16);
  return v13;
}

- (NSURLProtectionSpace)initWithHost:(NSString *)host port:(NSInteger)port protocol:(NSString *)protocol realm:(NSString *)realm authenticationMethod:(NSString *)authenticationMethod
{
  if (!self) {
    return 0;
  }
  int v10 = port;
  v18.receiver = self;
  v18.super_class = (Class)NSURLProtectionSpace;
  objc_super v12 = [(NSURLProtectionSpace *)&v18 init];
  if (!v12) {
    return 0;
  }
  v13 = v12;
  v12->_internal = 0;
  int v14 = authMethodToAuthScheme(authenticationMethod);
  if (protocol && ![(NSString *)protocol isEqualToString:@"http"])
  {
    if ([(NSString *)protocol isEqualToString:@"https"])
    {
      int v15 = 2;
    }
    else if ([(NSString *)protocol isEqualToString:@"ftp"])
    {
      int v15 = 3;
    }
    else if ([(NSString *)protocol isEqualToString:@"ftps"])
    {
      int v15 = 4;
    }
    else
    {
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 1;
  }
  v16 = (const void *)CFURLProtectionSpaceCreate(0, (const __CFString *)host, v10, v15, (const __CFString *)realm, v14);
  v13->_internal = (NSURLProtectionSpaceInternal *)CFMakeCollectable(v16);
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithWebKitPropertyListData:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  CFStringRef v5 = (const __CFString *)[a3 objectForKeyedSubscript:@"host"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
  }
  uint64_t v6 = (void *)[a3 objectForKeyedSubscript:@"port"];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
  }
  uint64_t v7 = [a3 objectForKeyedSubscript:@"type"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
  }
  CFStringRef v8 = (const __CFString *)[a3 objectForKeyedSubscript:@"realm"];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
  }
  uint64_t v9 = [a3 objectForKeyedSubscript:@"scheme"];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
  }
  int v10 = (void *)[a3 objectForKeyedSubscript:@"distnames"];
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
  }
  v21 = (void *)v9;
  v22 = (void *)v7;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
LABEL_15:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(v10);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_26;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v12) {
          goto LABEL_15;
        }
        break;
      }
    }
  }
  int v15 = (const void *)[a3 objectForKeyedSubscript:@"trust"];
  v16 = v15;
  if (v15)
  {
    CFTypeID v17 = CFGetTypeID(v15);
    if (v17 != SecTrustGetTypeID())
    {
LABEL_26:

      return 0;
    }
  }
  if (!self) {
    return 0;
  }
  v27.receiver = self;
  v27.super_class = (Class)NSURLProtectionSpace;
  objc_super v18 = [(NSURLProtectionSpace *)&v27 init];
  if (!v18) {
    return 0;
  }
  v19 = v18;
  v18->_internal = 0;
  v18->_internal = (NSURLProtectionSpaceInternal *)CFURLProtectionSpaceCreate(*MEMORY[0x1E4F1CF80], v5, [v6 intValue], objc_msgSend(v22, "intValue"), v8, objc_msgSend(v21, "intValue"));
  [(NSURLProtectionSpace *)v19 _setDistinguishedNames:v10];
  [(NSURLProtectionSpace *)v19 _setServerTrust:v16];
  return v19;
}

- (id)_webKitPropertyListData
{
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:6];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSURLProtectionSpace host](self, "host"), @"host");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", -[NSURLProtectionSpace port](self, "port")), @"port");
  id v4 = NSNumber;
  internal = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
  }
  uint64_t v6 = (char *)internal + 16;
  if (!internal) {
    uint64_t v6 = 0;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v4, "numberWithInt:", *((unsigned int *)v6 + 11)), @"type");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSURLProtectionSpace realm](self, "realm"), @"realm");
  uint64_t v7 = NSNumber;
  CFStringRef v8 = self->_internal;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
  }
  uint64_t v9 = (char *)v8 + 16;
  if (!v8) {
    uint64_t v9 = 0;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v7, "numberWithInt:", *((unsigned int *)v9 + 14)), @"scheme");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSURLProtectionSpace distinguishedNames](self, "distinguishedNames"), @"distnames");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSURLProtectionSpace serverTrust](self, "serverTrust"), @"trust");
  return v3;
}

@end