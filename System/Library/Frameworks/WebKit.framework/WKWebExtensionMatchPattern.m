@interface WKWebExtensionMatchPattern
+ (BOOL)supportsSecureCoding;
+ (id)allHostsAndSchemesMatchPattern;
+ (id)allURLsMatchPattern;
+ (id)matchPatternWithScheme:(id)a3 host:(id)a4 path:(id)a5;
+ (id)matchPatternWithString:(id)a3;
+ (void)initialize;
+ (void)registerCustomURLScheme:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesAllHosts;
- (BOOL)matchesAllURLs;
- (BOOL)matchesPattern:(id)a3;
- (BOOL)matchesPattern:(id)a3 options:(unint64_t)a4;
- (BOOL)matchesURL:(id)a3;
- (BOOL)matchesURL:(id)a3 options:(unint64_t)a4;
- (NSString)debugDescription;
- (NSString)host;
- (NSString)path;
- (NSString)scheme;
- (NSString)string;
- (Object)_apiObject;
- (WKWebExtensionMatchPattern)initWithCoder:(id)a3;
- (WKWebExtensionMatchPattern)initWithScheme:(id)a3 host:(id)a4 path:(id)a5 error:(id *)a6;
- (WKWebExtensionMatchPattern)initWithString:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)_objc_initiateDealloc;
- (void)_webExtensionMatchPattern;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WKWebExtensionMatchPattern

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x1F41813B0](a1);
  }
}

+ (void)registerCustomURLScheme:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"WKWebExtensionMatchPattern.mm", 55, @"Invalid parameter not satisfying: %@", @"[urlScheme isKindOfClass:NSString.class]" object file lineNumber description];
  }
  MEMORY[0x19972EAD0](&v15, v5);
  WTF::URLParser::maybeCanonicalizeScheme();
  int v7 = v17;
  if (v17)
  {
    v8 = v16;
    v16 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, v6);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
  }
  v9 = v15;
  v15 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v6);
      if (v7) {
        goto LABEL_14;
      }
      goto LABEL_19;
    }
    *(_DWORD *)v9 -= 2;
  }
  if (v7) {
    goto LABEL_14;
  }
LABEL_19:
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, a1, @"WKWebExtensionMatchPattern.mm", 56, @"Invalid parameter: '%@' is not a valid URL scheme", v5 object file lineNumber description];

LABEL_14:
  MEMORY[0x19972EAD0](&v14, v5);
  WebKit::WebExtensionMatchPattern::registerCustomURLScheme((uint64_t *)&v14);
  v11 = v14;
  v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_objc_initiateDealloc
{
  if (WTF::isMainRunLoop((WTF *)self))
  {
    MEMORY[0x1F4181400](self);
  }
  else
  {
    v3 = MEMORY[0x1E4F14428];
    v4 = (void (__cdecl *)(void *))MEMORY[0x1E4FBA8B8];
    dispatch_async_f(v3, self, v4);
  }
}

- (void)dealloc
{
  (**(void (***)(void))self->_webExtensionMatchPattern.data.__lx)();
  v3.receiver = self;
  v3.super_class = (Class)WKWebExtensionMatchPattern;
  [(WKWebExtensionMatchPattern *)&v3 dealloc];
}

+ (id)allURLsMatchPattern
{
  WebKit::WebExtensionMatchPattern::allURLsMatchPattern(&v5);
  v2 = v5;
  WebKit::wrapper<WebKit::WebExtensionMatchPattern>(&v6, (id *)v5);
  id v3 = v6;
  if (v2) {
    CFRelease(*((CFTypeRef *)v2 + 1));
  }

  return v3;
}

+ (id)allHostsAndSchemesMatchPattern
{
  WebKit::WebExtensionMatchPattern::allHostsAndSchemesMatchPattern(&v5);
  v2 = v5;
  WebKit::wrapper<WebKit::WebExtensionMatchPattern>(&v6, (id *)v5);
  id v3 = v6;
  if (v2) {
    CFRelease(*((CFTypeRef *)v2 + 1));
  }

  return v3;
}

+ (id)matchPatternWithString:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"WKWebExtensionMatchPattern.mm", 73, @"Invalid parameter not satisfying: %@", @"[patternString isKindOfClass:NSString.class]" object file lineNumber description];
  }
  MEMORY[0x19972EAD0](&v14, v5);
  WebKit::WebExtensionMatchPattern::getOrCreate(&v14, v6, (uint64_t *)&v15);
  v8 = v15;
  if (v15)
  {
    v15 = 0;
    WebKit::wrapper<WebKit::WebExtensionMatchPattern>(&v16, (id *)v8);
    CFRelease(*((CFTypeRef *)v8 + 1));
    v9 = v15;
    v10 = v16;
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v15 = 0;
  if (v9) {
    CFRelease(*((CFTypeRef *)v9 + 1));
  }
  v11 = v14;
  v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v7);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }

  return v10;
}

+ (id)matchPatternWithScheme:(id)a3 host:(id)a4 path:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"WKWebExtensionMatchPattern.mm", 80, @"Invalid parameter not satisfying: %@", @"[scheme isKindOfClass:NSString.class]" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"WKWebExtensionMatchPattern.mm", 81, @"Invalid parameter not satisfying: %@", @"[host isKindOfClass:NSString.class]" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"WKWebExtensionMatchPattern.mm", 82, @"Invalid parameter not satisfying: %@", @"[path isKindOfClass:NSString.class]" object file lineNumber description];
  }
  MEMORY[0x19972EAD0](&v25, v9);
  MEMORY[0x19972EAD0](&v24, v10);
  MEMORY[0x19972EAD0](&v23, v11);
  WebKit::WebExtensionMatchPattern::getOrCreate(&v25, &v24, &v23, (uint64_t *)&v26);
  v13 = v26;
  if (v26)
  {
    v26 = 0;
    WebKit::wrapper<WebKit::WebExtensionMatchPattern>(&v27, (id *)v13);
    CFRelease(*((CFTypeRef *)v13 + 1));
    v14 = v26;
    v15 = v27;
  }
  else
  {
    v15 = 0;
    v14 = 0;
  }
  v26 = 0;
  if (v14) {
    CFRelease(*((CFTypeRef *)v14 + 1));
  }
  v16 = v23;
  v23 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy(v16, v12);
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  unsigned __int8 v17 = v24;
  v24 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy(v17, v12);
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  v18 = v25;
  v25 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy(v18, v12);
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }

  return v15;
}

- (WKWebExtensionMatchPattern)initWithString:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a4)
    {
LABEL_3:
      v8 = self;
      uint64_t v9 = [(WKWebExtensionMatchPattern *)v8 _apiObject];
      MEMORY[0x19972EAD0](&v23, v7);
      WebKit::WebExtensionMatchPattern::WebExtensionMatchPattern(v9, &v23, a4);
      id v11 = v23;
      v23 = 0;
      if (v11)
      {
        if (*(_DWORD *)v11 == 2) {
          WTF::StringImpl::destroy(v11, v10);
        }
        else {
          *(_DWORD *)v11 -= 2;
        }
      }
      *(void *)(v9 + 8) = v8;

      if (BYTE1(v8[1].super.isa)) {
        v12 = v8;
      }
      else {
        v12 = 0;
      }
      v13 = v12;
      goto LABEL_21;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WKWebExtensionMatchPattern.mm", 89, @"Invalid parameter not satisfying: %@", @"[string isKindOfClass:NSString.class]" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  API::Object::constructInWrapper<WebKit::WebExtensionMatchPattern>(self);
  MEMORY[0x19972EAD0](&v21, v7);
  WebKit::WebExtensionMatchPattern::getOrCreate(&v21, v15, (uint64_t *)&v22);
  unsigned __int8 v17 = v22;
  if (v22)
  {
    v22 = 0;
    WebKit::wrapper<WebKit::WebExtensionMatchPattern>(&v23, (id *)v17);
    CFRelease(*((CFTypeRef *)v17 + 1));
    v18 = v22;
    v13 = (WKWebExtensionMatchPattern *)v23;
  }
  else
  {
    v13 = 0;
    v18 = 0;
  }
  v22 = 0;
  if (v18) {
    CFRelease(*((CFTypeRef *)v18 + 1));
  }
  v19 = v21;
  v21 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy(v19, v16);
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
LABEL_21:

  return v13;
}

- (WKWebExtensionMatchPattern)initWithScheme:(id)a3 host:(id)a4 path:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WKWebExtensionMatchPattern.mm", 106, @"Invalid parameter not satisfying: %@", @"[scheme isKindOfClass:NSString.class]" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WKWebExtensionMatchPattern.mm", 107, @"Invalid parameter not satisfying: %@", @"[host isKindOfClass:NSString.class]" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a6)
    {
LABEL_7:
      v14 = self;
      uint64_t v15 = [(WKWebExtensionMatchPattern *)v14 _apiObject];
      MEMORY[0x19972EAD0](&v36, v11);
      MEMORY[0x19972EAD0](&v35, v12);
      MEMORY[0x19972EAD0](&v34, v13);
      WebKit::WebExtensionMatchPattern::WebExtensionMatchPattern(v15, &v36, (uint64_t *)&v35, (uint64_t *)&v34, a6);
      unsigned __int8 v17 = v34;
      v34 = 0;
      if (v17)
      {
        if (*(_DWORD *)v17 == 2) {
          WTF::StringImpl::destroy(v17, v16);
        }
        else {
          *(_DWORD *)v17 -= 2;
        }
      }
      v18 = v35;
      v35 = 0;
      if (v18)
      {
        if (*(_DWORD *)v18 == 2) {
          WTF::StringImpl::destroy(v18, v16);
        }
        else {
          *(_DWORD *)v18 -= 2;
        }
      }
      v19 = v36;
      v36 = 0;
      if (v19)
      {
        if (*(_DWORD *)v19 == 2) {
          WTF::StringImpl::destroy(v19, v16);
        }
        else {
          *(_DWORD *)v19 -= 2;
        }
      }
      *(void *)(v15 + 8) = v14;

      if (BYTE1(v14[1].super.isa)) {
        v20 = v14;
      }
      else {
        v20 = 0;
      }
      v21 = v20;
      goto LABEL_41;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WKWebExtensionMatchPattern.mm", 108, @"Invalid parameter not satisfying: %@", @"[path isKindOfClass:NSString.class]" object file lineNumber description];

    if (a6) {
      goto LABEL_7;
    }
  }
  API::Object::constructInWrapper<WebKit::WebExtensionMatchPattern>(self);
  MEMORY[0x19972EAD0](&v34, v11);
  MEMORY[0x19972EAD0](&v33, v12);
  MEMORY[0x19972EAD0](&v32, v13);
  WebKit::WebExtensionMatchPattern::getOrCreate(&v34, &v33, &v32, (uint64_t *)&v35);
  v26 = v35;
  if (v35)
  {
    v35 = 0;
    WebKit::wrapper<WebKit::WebExtensionMatchPattern>(&v36, (id *)v26);
    CFRelease(*((CFTypeRef *)v26 + 1));
    v27 = v35;
    v21 = (WKWebExtensionMatchPattern *)v36;
  }
  else
  {
    v21 = 0;
    v27 = 0;
  }
  v35 = 0;
  if (v27) {
    CFRelease(*((CFTypeRef *)v27 + 1));
  }
  v28 = v32;
  v32 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 2) {
      WTF::StringImpl::destroy(v28, v25);
    }
    else {
      *(_DWORD *)v28 -= 2;
    }
  }
  v29 = v33;
  v33 = 0;
  if (v29)
  {
    if (*(_DWORD *)v29 == 2) {
      WTF::StringImpl::destroy(v29, v25);
    }
    else {
      *(_DWORD *)v29 -= 2;
    }
  }
  v30 = v34;
  v34 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 2) {
      WTF::StringImpl::destroy(v30, v25);
    }
    else {
      *(_DWORD *)v30 -= 2;
    }
  }
LABEL_41:

  return v21;
}

- (WKWebExtensionMatchPattern)initWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WKWebExtensionMatchPattern.mm", 125, @"Invalid parameter not satisfying: %@", @"[coder isKindOfClass:NSCoder.class]" object file lineNumber description];
  }
  id v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"string"];
  id v7 = [(WKWebExtensionMatchPattern *)self initWithString:v6 error:0];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"WKWebExtensionMatchPattern.mm", 132, @"Invalid parameter not satisfying: %@", @"[coder isKindOfClass:NSCoder.class]" object file lineNumber description];
  }
  id v5 = [(WKWebExtensionMatchPattern *)self string];
  [v7 encodeObject:v5 forKey:@"string"];
}

- (unint64_t)hash
{
  v2 = [(WKWebExtensionMatchPattern *)self string];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WKWebExtensionMatchPattern *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    id v5 = WTF::dynamic_objc_cast<WKWebExtensionMatchPattern>(v4);
    if (v5) {
      char v6 = WebKit::WebExtensionMatchPattern::operator==((uint64_t)&self->_webExtensionMatchPattern, (uint64_t)v5 + 8);
    }
    else {
      char v6 = 0;
    }
  }
  return v6;
}

- (NSString)debugDescription
{
  BOOL v3 = [(WKWebExtensionMatchPattern *)self matchesAllURLs];
  v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  id v7 = (void *)v6;
  if (v3)
  {
    v8 = [v4 stringWithFormat:@"<%@: %p matchesAllURLs = YES>", v6, self];;
  }
  else
  {
    uint64_t v9 = [(WKWebExtensionMatchPattern *)self scheme];
    id v10 = [(WKWebExtensionMatchPattern *)self host];
    id v11 = [(WKWebExtensionMatchPattern *)self path];
    v8 = [v4 stringWithFormat:@"<%@: %p scheme = %@; host = %@; path = %@>", v7, self, v9, v10, v11];;
  }

  return (NSString *)v8;
}

- (NSString)scheme
{
  int v3 = BYTE1(self[1].super.isa);
  v4 = (WTF::StringImpl **)MEMORY[0x1E4F30978];
  if (!BYTE1(self[1].super.isa) || LOBYTE(self[1].super.isa))
  {
    id v5 = (WTF::StringImpl *)*MEMORY[0x1E4F30978];
    if (*MEMORY[0x1E4F30978]) {
      goto LABEL_4;
    }
LABEL_17:
    uint64_t v9 = 0;
    goto LABEL_13;
  }
  id v5 = *(WTF::StringImpl **)&self->_webExtensionMatchPattern.data.__lx[16];
  if (!v5) {
    goto LABEL_17;
  }
LABEL_4:
  int v6 = *(_DWORD *)v5;
  *(_DWORD *)v5 += 2;
  if (v6)
  {
    *(_DWORD *)id v5 = v6;
    if (!v3)
    {
LABEL_9:
      id v7 = *v4;
      if (*v4) {
        goto LABEL_10;
      }
LABEL_19:
      uint64_t v9 = &stru_1EEA10550;
      id v11 = &stru_1EEA10550;
      id v12 = &stru_1EEA10550;
      goto LABEL_13;
    }
  }
  else
  {
    WTF::StringImpl::destroy(v5, (WTF::StringImpl *)a2);
    if (!BYTE1(self[1].super.isa)) {
      goto LABEL_9;
    }
  }
  if (LOBYTE(self[1].super.isa)) {
    goto LABEL_9;
  }
  id v7 = *(WTF::StringImpl **)&self->_webExtensionMatchPattern.data.__lx[16];
  if (!v7) {
    goto LABEL_19;
  }
LABEL_10:
  *(_DWORD *)v7 += 2;
  uint64_t v9 = (__CFString *) (id) WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v7 == 2) {
    WTF::StringImpl::destroy(v7, v8);
  }
  else {
    *(_DWORD *)v7 -= 2;
  }
LABEL_13:

  return (NSString *)v9;
}

- (NSString)host
{
  p_webExtensionMatchPattern = &self->_webExtensionMatchPattern;
  WebKit::WebExtensionMatchPattern::host((uint64_t)&self->_webExtensionMatchPattern, &v10);
  v4 = v10;
  id v10 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v3);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
    WebKit::WebExtensionMatchPattern::host((uint64_t)p_webExtensionMatchPattern, &v10);
    if (v10) {
      id v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
    }
    else {
      id v5 = &stru_1EEA10550;
    }
    id v7 = v5;
    v8 = v10;
    id v10 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, v6);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return (NSString *)v7;
}

- (NSString)path
{
  int v3 = BYTE1(self[1].super.isa);
  v4 = (WTF::StringImpl **)MEMORY[0x1E4F30978];
  if (!BYTE1(self[1].super.isa) || LOBYTE(self[1].super.isa))
  {
    id v5 = (WTF::StringImpl *)*MEMORY[0x1E4F30978];
    if (*MEMORY[0x1E4F30978]) {
      goto LABEL_4;
    }
LABEL_17:
    uint64_t v9 = 0;
    goto LABEL_13;
  }
  id v5 = *(WTF::StringImpl **)&self->_webExtensionMatchPattern.data.__lx[32];
  if (!v5) {
    goto LABEL_17;
  }
LABEL_4:
  int v6 = *(_DWORD *)v5;
  *(_DWORD *)v5 += 2;
  if (v6)
  {
    *(_DWORD *)id v5 = v6;
    if (!v3)
    {
LABEL_9:
      id v7 = *v4;
      if (*v4) {
        goto LABEL_10;
      }
LABEL_19:
      uint64_t v9 = &stru_1EEA10550;
      id v11 = &stru_1EEA10550;
      id v12 = &stru_1EEA10550;
      goto LABEL_13;
    }
  }
  else
  {
    WTF::StringImpl::destroy(v5, (WTF::StringImpl *)a2);
    if (!BYTE1(self[1].super.isa)) {
      goto LABEL_9;
    }
  }
  if (LOBYTE(self[1].super.isa)) {
    goto LABEL_9;
  }
  id v7 = *(WTF::StringImpl **)&self->_webExtensionMatchPattern.data.__lx[32];
  if (!v7) {
    goto LABEL_19;
  }
LABEL_10:
  *(_DWORD *)v7 += 2;
  uint64_t v9 = (__CFString *) (id) WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v7 == 2) {
    WTF::StringImpl::destroy(v7, v8);
  }
  else {
    *(_DWORD *)v7 -= 2;
  }
LABEL_13:

  return (NSString *)v9;
}

- (NSString)string
{
  WebKit::WebExtensionMatchPattern::stringWithScheme((WTF::StringImpl *)&self->_webExtensionMatchPattern, MEMORY[0x1E4F30978], &v9);
  if (v9)
  {
    id v2 = (id)WTF::StringImpl::operator NSString *();
    int v3 = v9;
    id v5 = (__CFString *)v2;
    uint64_t v9 = 0;
    if (v3)
    {
      if (*(_DWORD *)v3 == 2) {
        WTF::StringImpl::destroy(v3, v4);
      }
      else {
        *(_DWORD *)v3 -= 2;
      }
    }
  }
  else
  {
    id v5 = &stru_1EEA10550;
    id v7 = &stru_1EEA10550;
    v8 = &stru_1EEA10550;
  }

  return (NSString *)v5;
}

- (BOOL)matchesAllURLs
{
  return (BOOL)self[1].super.isa;
}

- (BOOL)matchesAllHosts
{
  if (!BYTE1(self[1].super.isa)) {
    return 0;
  }
  if (LOBYTE(self[1].super.isa)) {
    return 1;
  }
  if (!self->_webExtensionMatchPattern.data.__lx[41]) {
    return 0;
  }
  uint64_t v3 = *(void *)&self->_webExtensionMatchPattern.data.__lx[24];
  if (!v3) {
    return 1;
  }
  return *(_DWORD *)(v3 + 4) == 0;
}

- (BOOL)matchesURL:(id)a3
{
  return [(WKWebExtensionMatchPattern *)self matchesURL:a3 options:0];
}

- (BOOL)matchesURL:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v7 = a3;
  v8 = v7;
  if ((v4 & 4) != 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"WKWebExtensionMatchPattern.mm" lineNumber:231 description:@"Invalid parameter: WKWebExtensionMatchPatternOptionsMatchBidirectionally is not valid when matching a URL"];

    if (v8) {
      goto LABEL_3;
    }
LABEL_10:
    char v10 = 0;
    goto LABEL_11;
  }
  if (!v7) {
    goto LABEL_10;
  }
LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WKWebExtensionMatchPattern.mm", 236, @"Invalid parameter not satisfying: %@", @"[urlToMatch isKindOfClass:NSURL.class]" object file lineNumber description];
  }
  MEMORY[0x19972E8A0](v15, v8);
  char v10 = WebKit::WebExtensionMatchPattern::matchesURL(self->_webExtensionMatchPattern.data.__lx, (WTF::URL *)v15, v4 & 7);
  id v11 = v15[0];
  v15[0] = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v9);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
LABEL_11:

  return v10;
}

- (BOOL)matchesPattern:(id)a3
{
  return [(WKWebExtensionMatchPattern *)self matchesPattern:a3 options:0];
}

- (BOOL)matchesPattern:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"WKWebExtensionMatchPattern.mm", 251, @"Invalid parameter not satisfying: %@", @"[patternToMatch isKindOfClass:WKWebExtensionMatchPattern.class]" object file lineNumber description];
    }
    char v8 = WebKit::WebExtensionMatchPattern::matchesPattern(self->_webExtensionMatchPattern.data.__lx, (unsigned __int8 *)[v7 _webExtensionMatchPattern], v4 & 7);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionMatchPattern;
}

- (void)_webExtensionMatchPattern
{
  return &self->_webExtensionMatchPattern;
}

@end