@interface JavaNetURI
+ (const)__metadata;
+ (id)createWithNSString:(id)a3;
+ (int)getEffectivePortWithNSString:(id)a3 withInt:(int)a4;
+ (void)initialize;
- (BOOL)escapedEqualsWithNSString:(id)a3 withNSString:(id)a4;
- (BOOL)isAbsolute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOpaque;
- (BOOL)isValidDomainNameWithNSString:(id)a3;
- (BOOL)isValidHostWithBoolean:(BOOL)a3 withNSString:(id)a4;
- (JavaNetURI)init;
- (JavaNetURI)initWithNSString:(id)a3;
- (JavaNetURI)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5;
- (JavaNetURI)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withInt:(int)a6 withNSString:(id)a7 withNSString:(id)a8 withNSString:(id)a9;
- (JavaNetURI)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6;
- (JavaNetURI)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7;
- (NSString)description;
- (NSString)getHashString;
- (id)convertHexToLowerCaseWithNSString:(id)a3;
- (id)decodeWithNSString:(id)a3;
- (id)getAuthority;
- (id)getFragment;
- (id)getHost;
- (id)getPath;
- (id)getQuery;
- (id)getRawAuthority;
- (id)getRawFragment;
- (id)getRawPath;
- (id)getRawQuery;
- (id)getRawSchemeSpecificPart;
- (id)getRawUserInfo;
- (id)getScheme;
- (id)getSchemeSpecificPart;
- (id)getUserInfo;
- (id)normalize;
- (id)normalizeWithNSString:(id)a3 withBoolean:(BOOL)a4;
- (id)parseServerAuthority;
- (id)relativizeWithJavaNetURI:(id)a3;
- (id)resolveWithJavaNetURI:(id)a3;
- (id)resolveWithNSString:(id)a3;
- (id)setSchemeSpecificPart;
- (id)toASCIIString;
- (id)toURL;
- (id)validateSchemeWithNSString:(id)a3 withInt:(int)a4;
- (int)compareToWithId:(id)a3;
- (int)getEffectivePort;
- (int)getPort;
- (unint64_t)hash;
- (void)dealloc;
- (void)parseAuthorityWithBoolean:(BOOL)a3;
- (void)parseURIWithNSString:(id)a3 withBoolean:(BOOL)a4;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)validateUserInfoWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaNetURI

- (JavaNetURI)init
{
  self->port_ = -1;
  self->serverAuthority_ = 0;
  self->hash__ = -1;
  return self;
}

- (JavaNetURI)initWithNSString:(id)a3
{
  self->port_ = -1;
  self->serverAuthority_ = 0;
  self->hash__ = -1;
  sub_10025A018((uint64_t)self, a3, 0);
  return self;
}

- (JavaNetURI)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5
{
  return self;
}

- (JavaNetURI)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withInt:(int)a6 withNSString:(id)a7 withNSString:(id)a8 withNSString:(id)a9
{
  return self;
}

- (JavaNetURI)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6
{
  return self;
}

- (JavaNetURI)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7
{
  return self;
}

- (void)parseURIWithNSString:(id)a3 withBoolean:(BOOL)a4
{
}

- (id)validateSchemeWithNSString:(id)a3 withInt:(int)a4
{
  return sub_10025A36C(a3, *(uint64_t *)&a4);
}

- (void)parseAuthorityWithBoolean:(BOOL)a3
{
}

- (void)validateUserInfoWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5
{
}

- (BOOL)isValidHostWithBoolean:(BOOL)a3 withNSString:(id)a4
{
  return sub_10025A6F8(a3, a4);
}

- (BOOL)isValidDomainNameWithNSString:(id)a3
{
  return sub_10025A87C(a3);
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3) {
    goto LABEL_45;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  scheme = self->scheme_;
  uint64_t v6 = *((void *)a3 + 2);
  if (scheme)
  {
    if (!v6) {
      return 1;
    }
    int result = -[NSString compareToIgnoreCase:](scheme, "compareToIgnoreCase:");
    if (result) {
      return result;
    }
  }
  else if (v6)
  {
    return -1;
  }
  if (self->opaque_)
  {
    if (*((unsigned char *)a3 + 88))
    {
      schemeSpecificPart = self->schemeSpecificPart_;
      if (schemeSpecificPart)
      {
        uint64_t v9 = *((void *)a3 + 3);
LABEL_12:
        int result = [(NSString *)schemeSpecificPart compareToWithId:v9];
        if (result) {
          return result;
        }
        goto LABEL_13;
      }
LABEL_45:
      JreThrowNullPointerException();
    }
    return 1;
  }
  if (*((unsigned char *)a3 + 88)) {
    return -1;
  }
  uint64_t v12 = *((void *)a3 + 4);
  if (self->authority_)
  {
    if (!v12) {
      return 1;
    }
    host = self->host_;
    if (host && (uint64_t v14 = *((void *)a3 + 6)) != 0)
    {
      uint64_t v15 = *((void *)a3 + 5);
      if (self->userInfo_)
      {
        if (!v15) {
          return 1;
        }
        int result = [(NSString *)self->userInfo_ compareToWithId:*((void *)a3 + 5)];
        if (result) {
          return result;
        }
        host = self->host_;
        uint64_t v14 = *((void *)a3 + 6);
      }
      else if (v15)
      {
        return -1;
      }
      int result = [(NSString *)host compareToIgnoreCase:v14];
      if (result) {
        return result;
      }
      int port = self->port_;
      int v18 = *((_DWORD *)a3 + 14);
      int result = port - v18;
      if (port != v18) {
        return result;
      }
    }
    else
    {
      int result = [(NSString *)self->authority_ compareToWithId:*((void *)a3 + 4)];
      if (result) {
        return result;
      }
    }
  }
  else if (v12)
  {
    return -1;
  }
  path = self->path_;
  if (!path) {
    goto LABEL_45;
  }
  int result = [(NSString *)path compareToWithId:*((void *)a3 + 8)];
  if (result) {
    return result;
  }
  schemeSpecificPart = self->query_;
  uint64_t v9 = *((void *)a3 + 9);
  if (schemeSpecificPart)
  {
    if (!v9) {
      return 1;
    }
    goto LABEL_12;
  }
  if (v9) {
    return -1;
  }
LABEL_13:
  fragment = self->fragment_;
  uint64_t v11 = *((void *)a3 + 10);
  if (!fragment)
  {
    if (!v11) {
      return 0;
    }
    return -1;
  }
  if (!v11) {
    return 1;
  }
  int result = -[NSString compareToWithId:](fragment, "compareToWithId:");
  if (!result) {
    return 0;
  }
  return result;
}

+ (id)createWithNSString:(id)a3
{
  return JavaNetURI_createWithNSString_(a3);
}

- (id)convertHexToLowerCaseWithNSString:(id)a3
{
  return sub_10025AC84(a3);
}

- (BOOL)escapedEqualsWithNSString:(id)a3 withNSString:(id)a4
{
  return sub_10025ADE4(a3, a4);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_21;
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  v5 = (void *)*((void *)a3 + 10);
  fragment = self->fragment_;
  if (v5)
  {
    if (!fragment) {
      goto LABEL_21;
    }
    LODWORD(host) = sub_10025ADE4(v5, fragment);
    if (!host) {
      return (char)host;
    }
  }
  else if (fragment)
  {
    goto LABEL_21;
  }
  v8 = (void *)*((void *)a3 + 2);
  scheme = self->scheme_;
  if (v8)
  {
    if (!scheme) {
      goto LABEL_21;
    }
    LODWORD(host) = objc_msgSend(v8, "equalsIgnoreCase:");
    if (!host) {
      return (char)host;
    }
  }
  else if (scheme)
  {
    goto LABEL_21;
  }
  if (!*((unsigned char *)a3 + 88))
  {
    if (self->opaque_) {
      goto LABEL_21;
    }
    LODWORD(host) = sub_10025ADE4(self->path_, *((void **)a3 + 8));
    if (!host) {
      return (char)host;
    }
    uint64_t v12 = (void *)*((void *)a3 + 9);
    query = self->query_;
    if (v12)
    {
      if (!query) {
        goto LABEL_21;
      }
      LODWORD(host) = sub_10025ADE4(v12, query);
      if (!host) {
        return (char)host;
      }
    }
    else if (query)
    {
      goto LABEL_21;
    }
    userInfo = (NSString *)*((void *)a3 + 4);
    authority = self->authority_;
    LOBYTE(host) = ((unint64_t)userInfo | (unint64_t)authority) == 0;
    if (!userInfo || !authority) {
      return (char)host;
    }
    host = self->host_;
    if (!*((void *)a3 + 6))
    {
      if (host) {
        goto LABEL_21;
      }
LABEL_40:
      v10 = userInfo;
      goto LABEL_17;
    }
    if (!host) {
      return (char)host;
    }
    LODWORD(host) = -[NSString equalsIgnoreCase:](host, "equalsIgnoreCase:");
    if (!host) {
      return (char)host;
    }
    if (self->port_ == *((_DWORD *)a3 + 14))
    {
      authority = (NSString *)*((void *)a3 + 5);
      userInfo = self->userInfo_;
      LOBYTE(host) = ((unint64_t)authority | (unint64_t)userInfo) == 0;
      if (!authority || !userInfo) {
        return (char)host;
      }
      goto LABEL_40;
    }
LABEL_21:
    LOBYTE(host) = 0;
    return (char)host;
  }
  if (!self->opaque_) {
    goto LABEL_21;
  }
  v10 = (void *)*((void *)a3 + 3);
  authority = self->schemeSpecificPart_;
LABEL_17:
  LOBYTE(host) = sub_10025ADE4(v10, authority);
  return (char)host;
}

- (id)getScheme
{
  return self->scheme_;
}

- (id)getSchemeSpecificPart
{
  id result = self->schemeSpecificPart_;
  if (result) {
    return LibcoreNetUriCodec_decodeWithNSString_(result);
  }
  return result;
}

- (id)getRawSchemeSpecificPart
{
  return self->schemeSpecificPart_;
}

- (id)getAuthority
{
  id result = self->authority_;
  if (result) {
    return LibcoreNetUriCodec_decodeWithNSString_(result);
  }
  return result;
}

- (id)getRawAuthority
{
  return self->authority_;
}

- (id)getUserInfo
{
  id result = self->userInfo_;
  if (result) {
    return LibcoreNetUriCodec_decodeWithNSString_(result);
  }
  return result;
}

- (id)getRawUserInfo
{
  return self->userInfo_;
}

- (id)getHost
{
  return self->host_;
}

- (int)getPort
{
  return self->port_;
}

- (int)getEffectivePort
{
  return JavaNetURI_getEffectivePortWithNSString_withInt_((uint64_t)self->scheme_, self->port_);
}

+ (int)getEffectivePortWithNSString:(id)a3 withInt:(int)a4
{
  return JavaNetURI_getEffectivePortWithNSString_withInt_((uint64_t)a3, *(uint64_t *)&a4);
}

- (id)getPath
{
  id result = self->path_;
  if (result) {
    return LibcoreNetUriCodec_decodeWithNSString_(result);
  }
  return result;
}

- (id)getRawPath
{
  return self->path_;
}

- (id)getQuery
{
  id result = self->query_;
  if (result) {
    return LibcoreNetUriCodec_decodeWithNSString_(result);
  }
  return result;
}

- (id)getRawQuery
{
  return self->query_;
}

- (id)getFragment
{
  id result = self->fragment_;
  if (result) {
    return LibcoreNetUriCodec_decodeWithNSString_(result);
  }
  return result;
}

- (id)getRawFragment
{
  return self->fragment_;
}

- (unint64_t)hash
{
  unint64_t v2 = self;
  LODWORD(self) = *(_DWORD *)(self + 92);
  if (self == -1)
  {
    v3 = -[JavaNetURI getHashString]_0(v2);
    if (!v3) {
      JreThrowNullPointerException();
    }
    LODWORD(self) = [(NSString *)v3 hash];
    *(_DWORD *)(v2 + 92) = self;
  }
  return (int)self;
}

- (NSString)getHashString
{
  unint64_t v2 = new_JavaLangStringBuilder_init();
  v3 = *(void **)(a1 + 16);
  if (v3)
  {
    if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    -[JavaLangStringBuilder appendWithNSString:](v2, "appendWithNSString:", [v3 lowercaseStringWithJRELocale:JavaUtilLocale_US_]);
    [(JavaLangStringBuilder *)v2 appendWithChar:58];
  }
  if (*(unsigned char *)(a1 + 88))
  {
    v4 = (void *)(a1 + 24);
LABEL_21:
    [(JavaLangStringBuilder *)v2 appendWithNSString:*v4];
    goto LABEL_22;
  }
  if (*(void *)(a1 + 32))
  {
    [(JavaLangStringBuilder *)v2 appendWithNSString:@"//"];
    uint64_t v12 = *(void **)(a1 + 48);
    if (!v12)
    {
      CFStringRef v20 = *(const __CFString **)(a1 + 32);
      goto LABEL_16;
    }
    if (*(void *)(a1 + 40))
    {
      [(JavaLangStringBuilder *)v2 appendWithNSString:JreStrcat("$C", v5, v6, v7, v8, v9, v10, v11, *(id *)(a1 + 40))];
      uint64_t v12 = *(void **)(a1 + 48);
    }
    if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0)
    {
      v23 = v12;
      objc_opt_class();
      uint64_t v12 = v23;
    }
    -[JavaLangStringBuilder appendWithNSString:](v2, "appendWithNSString:", [v12 lowercaseStringWithJRELocale:JavaUtilLocale_US_]);
    if (*(_DWORD *)(a1 + 56) != -1)
    {
      CFStringRef v20 = JreStrcat("CI", v13, v14, v15, v16, v17, v18, v19, (id)0x3A);
LABEL_16:
      [(JavaLangStringBuilder *)v2 appendWithNSString:v20];
    }
  }
  if (*(void *)(a1 + 64)) {
    -[JavaLangStringBuilder appendWithNSString:](v2, "appendWithNSString:");
  }
  v4 = (void *)(a1 + 72);
  if (*(void *)(a1 + 72))
  {
    [(JavaLangStringBuilder *)v2 appendWithChar:63];
    goto LABEL_21;
  }
LABEL_22:
  if (*(void *)(a1 + 80))
  {
    [(JavaLangStringBuilder *)v2 appendWithChar:35];
    [(JavaLangStringBuilder *)v2 appendWithNSString:*(void *)(a1 + 80)];
  }
  v21 = [(JavaLangStringBuilder *)v2 description];
  return sub_10025AC84(v21);
}

- (BOOL)isAbsolute
{
  return self->absolute_;
}

- (BOOL)isOpaque
{
  return self->opaque_;
}

- (id)normalizeWithNSString:(id)a3 withBoolean:(BOOL)a4
{
  return (id)sub_10025B428((__CFString *)a3, a4);
}

- (id)normalize
{
  unint64_t v2 = self;
  if (!self->opaque_)
  {
    v3 = (__CFString *)sub_10025B428((__CFString *)self->path_, 0);
    path = v2->path_;
    if (!path) {
      goto LABEL_7;
    }
    if (([(NSString *)path isEqual:v3] & 1) == 0)
    {
      uint64_t v5 = sub_10025ABB4((uint64_t)v2);
      if (v5)
      {
        unint64_t v2 = v5;
        JreStrongAssign((id *)&v5->path_, v3);
        -[JavaNetURI setSchemeSpecificPart]_0((uint64_t)v2);
        return v2;
      }
LABEL_7:
      JreThrowNullPointerException();
    }
  }
  return v2;
}

- (id)setSchemeSpecificPart
{
  uint64_t v9 = new_JavaLangStringBuilder_init();
  if (*(void *)(a1 + 32)) {
    [(JavaLangStringBuilder *)v9 appendWithNSString:JreStrcat("$$", v2, v3, v4, v5, v6, v7, v8, @"//")];
  }
  uint64_t v10 = *(void *)(a1 + 64);
  if (v10) {
    -[JavaLangStringBuilder appendWithNSString:](v9, "appendWithNSString:");
  }
  if (*(void *)(a1 + 72)) {
    [(JavaLangStringBuilder *)v9 appendWithNSString:JreStrcat("C$", v2, v10, v4, v5, v6, v7, v8, (id)0x3F)];
  }
  JreStrongAssign((id *)(a1 + 24), [(JavaLangStringBuilder *)v9 description]);
  return JreStrongAssign((id *)(a1 + 8), 0);
}

- (id)parseServerAuthority
{
  if (!self->serverAuthority_) {
    sub_10025A428((uint64_t)self, 1);
  }
  return self;
}

- (id)relativizeWithJavaNetURI:(id)a3
{
  if (!a3) {
    goto LABEL_20;
  }
  id v3 = a3;
  if (!*((unsigned char *)a3 + 88) && !self->opaque_)
  {
    scheme = self->scheme_;
    uint64_t v7 = *((void *)a3 + 2);
    if (scheme)
    {
      if (![(NSString *)scheme isEqual:v7]) {
        return v3;
      }
    }
    else if (v7)
    {
      return v3;
    }
    authority = self->authority_;
    uint64_t v9 = *((void *)v3 + 4);
    if (authority)
    {
      if (![(NSString *)authority isEqual:v9]) {
        return v3;
      }
    }
    else if (v9)
    {
      return v3;
    }
    uint64_t v10 = (__CFString *)sub_10025B428((__CFString *)self->path_, 0);
    CFStringRef v11 = sub_10025B428(*((__CFString **)v3 + 8), 0);
    if (v10)
    {
      uint64_t v12 = (__CFString *)v11;
      if (([(__CFString *)v10 isEqual:v11] & 1) == 0)
      {
        uint64_t v13 = (__CFString *)[(__CFString *)v10 substring:0 endIndex:[(__CFString *)v10 lastIndexOf:47] + 1];
        if (!v12) {
          goto LABEL_20;
        }
        uint64_t v10 = v13;
        if (![(__CFString *)v12 hasPrefix:v13]) {
          return v3;
        }
      }
      uint64_t v14 = [JavaNetURI alloc];
      v14->port_ = -1;
      v14->serverAuthority_ = 0;
      v14->hash__ = -1;
      uint64_t v15 = v14;
      JreStrongAssign(v15 + 10, *((void **)v3 + 10));
      JreStrongAssign(v15 + 9, *((void **)v3 + 9));
      if (v12 && v10)
      {
        JreStrongAssign(v15 + 8, [(__CFString *)v12 substring:[(__CFString *)v10 length]]);
        -[JavaNetURI setSchemeSpecificPart]_0((uint64_t)v15);
        return v15;
      }
    }
LABEL_20:
    JreThrowNullPointerException();
  }
  return v3;
}

- (id)resolveWithJavaNetURI:(id)a3
{
  if (!a3) {
    goto LABEL_20;
  }
  if (*((unsigned char *)a3 + 89) || self->opaque_) {
    return a3;
  }
  if (*((void *)a3 + 4))
  {
    uint64_t v7 = sub_10025ABB4((uint64_t)a3);
    if (v7)
    {
      uint64_t v5 = (uint64_t)v7;
      JreStrongAssign((id *)&v7->scheme_, self->scheme_);
      *(unsigned char *)(v5 + 89) = self->absolute_;
      return (id)v5;
    }
LABEL_20:
    JreThrowNullPointerException();
  }
  uint64_t v8 = (void *)*((void *)a3 + 8);
  if (!v8) {
    goto LABEL_20;
  }
  if ([v8 isEmpty] && !*((void *)a3 + 2) && !*((void *)a3 + 9))
  {
    v24 = sub_10025ABB4((uint64_t)self);
    if (v24)
    {
      uint64_t v5 = (uint64_t)v24;
      JreStrongAssign((id *)&v24->fragment_, *((void **)a3 + 10));
      return (id)v5;
    }
    goto LABEL_20;
  }
  uint64_t v9 = sub_10025ABB4((uint64_t)self);
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v5 = (uint64_t)v9;
  JreStrongAssign((id *)&v9->fragment_, *((void **)a3 + 10));
  JreStrongAssign((id *)(v5 + 72), *((void **)a3 + 9));
  unsigned __int8 v10 = [*((id *)a3 + 8) hasPrefix:@"/"];
  path = (__CFString *)*((void *)a3 + 8);
  if ((v10 & 1) == 0)
  {
    unsigned __int8 v12 = [(__CFString *)path isEmpty];
    path = (__CFString *)self->path_;
    if ((v12 & 1) == 0)
    {
      id v13 = [(NSString *)self->path_ substring:0 endIndex:[(__CFString *)path lastIndexOf:47] + 1];
      path = (__CFString *)JreStrcat("$$", v14, v15, v16, v17, v18, v19, v20, v13);
    }
  }
  v21 = *(void **)(v5 + 32);
  v22 = (__CFString *)sub_10025B428(path, 1);
  v23 = (__CFString *)LibcoreNetUrlUrlUtils_authoritySafePathWithNSString_withNSString_(v21, v22);
  JreStrongAssign((id *)(v5 + 64), v23);
  -[JavaNetURI setSchemeSpecificPart]_0(v5);
  return (id)v5;
}

- (id)resolveWithNSString:(id)a3
{
  uint64_t v4 = JavaNetURI_createWithNSString_(a3);
  return [(JavaNetURI *)self resolveWithJavaNetURI:v4];
}

- (id)decodeWithNSString:(id)a3
{
  if (a3) {
    return LibcoreNetUriCodec_decodeWithNSString_(a3);
  }
  else {
    return 0;
  }
}

- (id)toASCIIString
{
  id v3 = new_JavaLangStringBuilder_init();
  if (!qword_100561278) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = v3;
  objc_msgSend((id)qword_100561278, "appendEncodedWithJavaLangStringBuilder:withNSString:", v3, -[JavaNetURI description](self, "description"));
  return [(JavaLangStringBuilder *)v4 description];
}

- (NSString)description
{
  p_string = &self->string_;
  id result = self->string_;
  if (result) {
    return result;
  }
  uint64_t v5 = new_JavaLangStringBuilder_init();
  uint64_t v6 = v5;
  if (self->scheme_)
  {
    -[JavaLangStringBuilder appendWithNSString:](v5, "appendWithNSString:");
    [(JavaLangStringBuilder *)v6 appendWithChar:58];
  }
  if (self->opaque_)
  {
    p_schemeSpecificPart = &self->schemeSpecificPart_;
  }
  else
  {
    if (self->authority_)
    {
      [(JavaLangStringBuilder *)v6 appendWithNSString:@"//"];
      [(JavaLangStringBuilder *)v6 appendWithNSString:self->authority_];
    }
    if (self->path_) {
      -[JavaLangStringBuilder appendWithNSString:](v6, "appendWithNSString:");
    }
    p_schemeSpecificPart = &self->query_;
    if (!self->query_) {
      goto LABEL_13;
    }
    [(JavaLangStringBuilder *)v6 appendWithChar:63];
  }
  [(JavaLangStringBuilder *)v6 appendWithNSString:*p_schemeSpecificPart];
LABEL_13:
  if (self->fragment_)
  {
    [(JavaLangStringBuilder *)v6 appendWithChar:35];
    [(JavaLangStringBuilder *)v6 appendWithNSString:self->fragment_];
  }
  JreStrongAssign((id *)p_string, [(JavaLangStringBuilder *)v6 description]);
  return *p_string;
}

- (id)toURL
{
  BOOL absolute = self->absolute_;
  id v3 = [(JavaNetURI *)self description];
  if (!absolute)
  {
    CFStringRef v13 = JreStrcat("$$", v4, v5, v6, v7, v8, v9, v10, @"URI is not absolute: ");
    uint64_t v14 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v13);
    objc_exception_throw(v14);
  }
  CFStringRef v11 = new_JavaNetURL_initWithNSString_(v3);
  return v11;
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  sub_10025A018((uint64_t)self, self->string_, 0);
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  [(JavaNetURI *)self description];
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultWriteObject];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetURI;
  [(JavaNetURI *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = sub_10025BD78(&stru_10048C1F8);
    JreStrongAssignAndConsume((id *)&JavaNetURI_USER_INFO_ENCODER_, v2);
    objc_super v3 = sub_10025BD78(@"/@");
    JreStrongAssignAndConsume((id *)&JavaNetURI_PATH_ENCODER_, v3);
    uint64_t v4 = sub_10025BD78(@"@[]");
    JreStrongAssignAndConsume((id *)&JavaNetURI_AUTHORITY_ENCODER_, v4);
    uint64_t v5 = sub_10025BD78(@"/@?");
    JreStrongAssignAndConsume((id *)&JavaNetURI_FILE_AND_QUERY_ENCODER_, v5);
    uint64_t v6 = sub_10025BD78(@"?/[]@");
    JreStrongAssignAndConsume((id *)&JavaNetURI_ALL_LEGAL_ENCODER_, v6);
    uint64_t v7 = [JavaNetURI__1 alloc];
    LibcoreNetUriCodec_init(v7, v8);
    JreStrongAssignAndConsume((id *)&qword_100561278, v7);
    atomic_store(1u, (unsigned __int8 *)JavaNetURI__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046A000;
}

@end