@interface _WKApplicationManifest
+ (BOOL)supportsSecureCoding;
+ (id)applicationManifestFromJSON:(id)a3 manifestURL:(id)a4 documentURL:(id)a5;
- (BOOL)isDefaultScope;
- (NSArray)categories;
- (NSArray)icons;
- (NSArray)shortcuts;
- (NSString)applicationDescription;
- (NSString)name;
- (NSString)rawJSON;
- (NSString)shortName;
- (NSURL)manifestId;
- (NSURL)manifestURL;
- (NSURL)scope;
- (NSURL)startURL;
- (Object)_apiObject;
- (UIColor)backgroundColor;
- (UIColor)themeColor;
- (_WKApplicationManifest)initWithCoder:(id)a3;
- (_WKApplicationManifest)initWithJSONData:(id)a3 manifestURL:(id)a4 documentURL:(id)a5;
- (int64_t)dir;
- (int64_t)direction;
- (int64_t)displayMode;
- (optional<_WKApplicationManifestOrientation>)orientation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _WKApplicationManifest

- (_WKApplicationManifest)initWithJSONData:(id)a3 manifestURL:(id)a4 documentURL:(id)a5
{
  v24.receiver = self;
  v24.super_class = (Class)_WKApplicationManifest;
  v8 = [(_WKApplicationManifest *)&v24 init];
  if (v8)
  {
    uint64_t v9 = [[NSString alloc] initWithData:a3 encoding:4];
    if (v9)
    {
      v10 = (const void *)v9;
      MEMORY[0x19972EAD0](&v21, v9);
      MEMORY[0x19972E8A0](v20, a4);
      MEMORY[0x19972E8A0](v19, a5);
      WebCore::ApplicationManifestParser::parseWithValidation(v22, (WebCore::ApplicationManifestParser *)&v21, (const WTF::String *)v20, (const WTF::URL *)v19, v11);
      v13 = v19[0];
      v19[0] = 0;
      if (v13)
      {
        if (*(_DWORD *)v13 == 2) {
          WTF::StringImpl::destroy(v13, v12);
        }
        else {
          *(_DWORD *)v13 -= 2;
        }
      }
      v14 = v20[0];
      v20[0] = 0;
      if (v14)
      {
        if (*(_DWORD *)v14 == 2) {
          WTF::StringImpl::destroy(v14, v12);
        }
        else {
          *(_DWORD *)v14 -= 2;
        }
      }
      v15 = v21;
      v21 = 0;
      if (v15)
      {
        if (*(_DWORD *)v15 == 2) {
          WTF::StringImpl::destroy(v15, v12);
        }
        else {
          *(_DWORD *)v15 -= 2;
        }
      }
      if (v23)
      {
        v16 = [(_WKApplicationManifest *)v8 _apiObject];
        v16->var0 = (void **)&unk_1EE9D1E28;
        WebKit::InitializeWebKit2((WebKit *)v16);
        v16->var0 = (void **)&unk_1EE9C5C28;
        WebCore::ApplicationManifest::ApplicationManifest((uint64_t)&v16[1], (uint64_t)v22);
        v16->var1 = v8;
        if (v23) {
          WebCore::ApplicationManifest::~ApplicationManifest((WebCore::ApplicationManifest *)v22, v17);
        }
      }
      else
      {
        v8 = 0;
      }
      CFRelease(v10);
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WKApplicationManifest)initWithCoder:(id)a3
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"raw_json"];
  MEMORY[0x19972EAD0](&v110, v5);
  unint64_t v6 = [a3 decodeIntegerForKey:@"dir"];
  if (v6 >= 3)
  {
    __break(0xC471u);
    goto LABEL_67;
  }
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  MEMORY[0x19972EAD0](&v109, v7);
  uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"short_name"];
  MEMORY[0x19972EAD0](&v108, v8);
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"description"];
  MEMORY[0x19972EAD0](&v107, v9);
  uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"scope"];
  MEMORY[0x19972E8A0](&v104, v10);
  char v11 = [a3 decodeBoolForKey:@"is_default_scope"];
  char v12 = [a3 decodeIntegerForKey:@"display"];
  uint64_t v13 = [a3 decodeIntegerForKey:@"orientation"];
  uint64_t v14 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"manifest_url"];
  MEMORY[0x19972E8A0](&v101, v14);
  uint64_t v15 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"start_url"];
  MEMORY[0x19972E8A0](&v98, v15);
  uint64_t v16 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"manifestId"];
  MEMORY[0x19972E8A0](&v95, v16);
  char v68 = v12;
  v67 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"background_color"];
  char v17 = v6;
  v65 = self;
  v66 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"theme_color"];
  v18 = (void *)MEMORY[0x1E4F1CAD0];
  v126[0] = objc_opt_class();
  v126[1] = objc_opt_class();
  v19 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v18, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v126, 2)), @"categories");
  v20 = (void *)MEMORY[0x1E4F1CAD0];
  v125[0] = objc_opt_class();
  v125[1] = objc_opt_class();
  v21 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v20, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v125, 2)), @"icons");
  v22 = (void *)MEMORY[0x1E4F1CAD0];
  v124[0] = objc_opt_class();
  v124[1] = objc_opt_class();
  v124[2] = objc_opt_class();
  char v23 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v22, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v124, 3)), @"shortcuts");
  v69 = v110;
  char v70 = v17;
  objc_super v24 = v109;
  v109 = 0;
  v110 = 0;
  v71 = v24;
  v72 = v108;
  v25 = v107;
  v107 = 0;
  v108 = 0;
  v26 = v104;
  v104 = 0;
  v73 = v25;
  v74 = v26;
  long long v75 = v105;
  long long v76 = v106;
  LODWORD(v105) = v105 & 0xFFFFFFFE;
  char v77 = v11;
  char v78 = v68;
  __int16 v27 = v13 | 0x100;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    __int16 v27 = 0;
  }
  __int16 v79 = v27;
  v28 = v101;
  v101 = 0;
  v80 = v28;
  long long v81 = v102;
  long long v82 = v103;
  LODWORD(v102) = v102 & 0xFFFFFFFE;
  v29 = v98;
  v98 = 0;
  long long v84 = v99;
  long long v85 = v100;
  LODWORD(v99) = v99 & 0xFFFFFFFE;
  v30 = v95;
  v95 = 0;
  v83 = v29;
  v86 = v30;
  long long v87 = v96;
  long long v88 = v97;
  LODWORD(v96) = v96 & 0xFFFFFFFE;
  v31 = (WebCore *)[v67 CGColor];
  uint64_t v33 = WebCore::roundAndClampToSRGBALossy(v31, v32);
  uint64_t v34 = bswap32(v33) | 0x1104000000000000;
  if (!BYTE4(v33)) {
    uint64_t v34 = 0;
  }
  uint64_t v89 = v34;
  v35 = (WebCore *)[v66 CGColor];
  uint64_t v37 = WebCore::roundAndClampToSRGBALossy(v35, v36);
  uint64_t v38 = bswap32(v37) | 0x1104000000000000;
  if (!BYTE4(v37)) {
    uint64_t v38 = 0;
  }
  uint64_t v90 = v38;
  WTF::makeVector<WTF::String>(v19, (uint64_t)&v91);
  WTF::makeVector<WebCore::ApplicationManifest::Icon>((uint64_t)v92, v21);
  uint64_t v93 = 0;
  uint64_t v94 = 0;
  unint64_t v39 = objc_msgSend(v23, "count", v92);
  int v40 = v39;
  if (v39)
  {
    if (!(v39 >> 26))
    {
      uint64_t v41 = WTF::fastMalloc((WTF *)(v39 << 6));
      LODWORD(v94) = v40;
      uint64_t v93 = v41;
      goto LABEL_11;
    }
    __break(0xC471u);
LABEL_67:
    JUMPOUT(0x198C0A0BCLL);
  }
LABEL_11:
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  uint64_t v42 = [v23 countByEnumeratingWithState:&v117 objects:v127 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v118;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v118 != v43) {
          objc_enumerationMutation(v23);
        }
        v45 = *(void **)(*((void *)&v117 + 1) + 8 * i);
        objc_opt_class();
        if (((v45 != 0) & objc_opt_isKindOfClass()) != 0)
        {
          MEMORY[0x19972EAD0](&v121, [v45 name]);
          MEMORY[0x19972E8A0](&v122, [v45 url]);
          WTF::makeVector<WebCore::ApplicationManifest::Icon>((uint64_t)v123, (void *)[v45 icons]);
          std::__optional_destruct_base<WebCore::ApplicationManifest::Shortcut,false>::__optional_destruct_base[abi:sn180100]<WebCore::ApplicationManifest::Shortcut>((uint64_t)&v111, (uint64_t *)&v121);
          WTF::Vector<WebCore::ApplicationManifest::Icon,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v123, v47);
          v48 = v122;
          v122 = 0;
          if (v48)
          {
            if (*(_DWORD *)v48 == 2) {
              WTF::StringImpl::destroy(v48, v46);
            }
            else {
              *(_DWORD *)v48 -= 2;
            }
          }
          v49 = v121;
          v121 = 0;
          if (v49)
          {
            if (*(_DWORD *)v49 == 2) {
              WTF::StringImpl::destroy(v49, v46);
            }
            else {
              *(_DWORD *)v49 -= 2;
            }
          }
          if (v116)
          {
            if (HIDWORD(v94) == v94)
            {
              WTF::Vector<WebCore::ApplicationManifest::Shortcut,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::ApplicationManifest::Shortcut>((uint64_t)&v93, (unint64_t)&v111);
            }
            else
            {
              unint64_t v50 = v93 + ((unint64_t)HIDWORD(v94) << 6);
              uint64_t v51 = v111;
              uint64_t v111 = 0;
              *(void *)unint64_t v50 = v51;
              WTF::URL::URL(v50 + 8, v112);
              *(void *)(v50 + 48) = 0;
              *(void *)(v50 + 56) = 0;
              uint64_t v52 = v113;
              uint64_t v113 = 0;
              *(void *)(v50 + 48) = v52;
              LODWORD(v52) = v114;
              int v114 = 0;
              *(_DWORD *)(v50 + 56) = v52;
              LODWORD(v52) = v115;
              int v115 = 0;
              *(_DWORD *)(v50 + 60) = v52;
              ++HIDWORD(v94);
            }
          }
        }
        else
        {
          LOBYTE(v111) = 0;
          char v116 = 0;
        }
        std::__optional_destruct_base<WebCore::ApplicationManifest::Shortcut,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v111, v46);
      }
      uint64_t v42 = [v23 countByEnumeratingWithState:&v117 objects:v127 count:16];
    }
    while (v42);
  }
  WTF::Vector<WebCore::ApplicationManifest::Shortcut,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)&v93, HIDWORD(v94));
  v53 = [(_WKApplicationManifest *)v65 _apiObject];
  v53->var0 = (void **)&unk_1EE9D1E28;
  WebKit::InitializeWebKit2((WebKit *)v53);
  v53->var0 = (void **)&unk_1EE9C5C28;
  WebCore::ApplicationManifest::ApplicationManifest((uint64_t)&v53[1], (uint64_t)&v69);
  v53->var1 = v65;
  WebCore::ApplicationManifest::~ApplicationManifest((WebCore::ApplicationManifest *)&v69, v54);
  v56 = v95;
  v95 = 0;
  if (v56)
  {
    if (*(_DWORD *)v56 == 2) {
      WTF::StringImpl::destroy(v56, v55);
    }
    else {
      *(_DWORD *)v56 -= 2;
    }
  }
  v57 = v98;
  v98 = 0;
  if (v57)
  {
    if (*(_DWORD *)v57 == 2) {
      WTF::StringImpl::destroy(v57, v55);
    }
    else {
      *(_DWORD *)v57 -= 2;
    }
  }
  v58 = v101;
  v101 = 0;
  if (v58)
  {
    if (*(_DWORD *)v58 == 2) {
      WTF::StringImpl::destroy(v58, v55);
    }
    else {
      *(_DWORD *)v58 -= 2;
    }
  }
  v59 = v104;
  v104 = 0;
  if (v59)
  {
    if (*(_DWORD *)v59 == 2) {
      WTF::StringImpl::destroy(v59, v55);
    }
    else {
      *(_DWORD *)v59 -= 2;
    }
  }
  v60 = v107;
  v107 = 0;
  if (v60)
  {
    if (*(_DWORD *)v60 == 2) {
      WTF::StringImpl::destroy(v60, v55);
    }
    else {
      *(_DWORD *)v60 -= 2;
    }
  }
  v61 = v108;
  v108 = 0;
  if (v61)
  {
    if (*(_DWORD *)v61 == 2) {
      WTF::StringImpl::destroy(v61, v55);
    }
    else {
      *(_DWORD *)v61 -= 2;
    }
  }
  v62 = v109;
  v109 = 0;
  if (v62)
  {
    if (*(_DWORD *)v62 == 2) {
      WTF::StringImpl::destroy(v62, v55);
    }
    else {
      *(_DWORD *)v62 -= 2;
    }
  }
  v63 = v110;
  v110 = 0;
  if (v63)
  {
    if (*(_DWORD *)v63 == 2) {
      WTF::StringImpl::destroy(v63, v55);
    }
    else {
      *(_DWORD *)v63 -= 2;
    }
  }
  return v65;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WebCore::ApplicationManifest::~ApplicationManifest((WebCore::ApplicationManifest *)&self->_applicationManifest.data.__lx[16], v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKApplicationManifest;
    [(_WKApplicationManifest *)&v5 dealloc];
  }
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest rawJSON](self, "rawJSON"), @"raw_json");
  [a3 encodeInteger:self->_applicationManifest.data.__lx[24] forKey:@"dir"];
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest name](self, "name"), @"name");
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest shortName](self, "shortName"), @"short_name");
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest applicationDescription](self, "applicationDescription"), @"description");
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest scope](self, "scope"), @"scope");
  objc_msgSend(a3, "encodeBool:forKey:", -[_WKApplicationManifest isDefaultScope](self, "isDefaultScope"), @"is_default_scope");
  [a3 encodeInteger:self->_anon_38[49] forKey:@"display"];
  if (self->_anon_38[51]) {
    uint64_t v5 = self->_anon_38[50];
  }
  else {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [a3 encodeInteger:v5 forKey:@"orientation"];
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest manifestURL](self, "manifestURL"), @"manifest_url");
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest startURL](self, "startURL"), @"start_url");
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest manifestId](self, "manifestId"), @"manifestId");
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest backgroundColor](self, "backgroundColor"), @"background_color");
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest themeColor](self, "themeColor"), @"theme_color");
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest categories](self, "categories"), @"categories");
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest icons](self, "icons"), @"icons");
  unint64_t v6 = [(_WKApplicationManifest *)self shortcuts];

  [a3 encodeObject:v6 forKey:@"shortcuts"];
}

+ (id)applicationManifestFromJSON:(id)a3 manifestURL:(id)a4 documentURL:(id)a5
{
  MEMORY[0x19972EAD0](&v19, a3);
  MEMORY[0x19972E8A0](v18, a4);
  MEMORY[0x19972E8A0](v17, a5);
  WebCore::ApplicationManifestParser::parse(v20, (WebCore::ApplicationManifestParser *)&v19, (const WTF::String *)v18, (const WTF::URL *)v17, v7);
  uint64_t v9 = v17[0];
  v17[0] = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v8);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  uint64_t v10 = v18[0];
  v18[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v8);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  char v11 = v19;
  v19 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v8);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  API::ApplicationManifest::create((uint64_t)v20, v18);
  char v12 = (const void *)*((void *)v18[0] + 1);
  if (v12) {
    CFRetain(*((CFTypeRef *)v18[0] + 1));
  }
  CFTypeRef v14 = (id)CFMakeCollectable(v12);
  uint64_t v15 = v18[0];
  v18[0] = 0;
  if (v15) {
    CFRelease(*((CFTypeRef *)v15 + 1));
  }
  WebCore::ApplicationManifest::~ApplicationManifest((WebCore::ApplicationManifest *)v20, v13);
  return (id)v14;
}

- (Object)_apiObject
{
  return (Object *)&self->_applicationManifest;
}

- (NSString)rawJSON
{
  result = *(NSString **)&self->_applicationManifest.data.__lx[16];
  if (result) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return result;
}

- (int64_t)direction
{
  int v2 = self->_applicationManifest.data.__lx[24];
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (NSString)name
{
  result = *(NSString **)&self->_applicationManifest.data.__lx[32];
  if (result) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return result;
}

- (NSString)shortName
{
  result = *(NSString **)&self->_applicationManifest.data.__lx[40];
  if (result) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return result;
}

- (NSString)applicationDescription
{
  result = *(NSString **)self->_anon_38;
  if (result) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return result;
}

- (NSURL)scope
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (BOOL)isDefaultScope
{
  return self->_anon_38[48];
}

- (NSURL)manifestURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (NSURL)startURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (UIColor)backgroundColor
{
  WebCore::cocoaColor((uint64_t *)&cf, (WebCore *)&self->_anon_38[176], (const Color *)a2);
  CFTypeRef v2 = cf;
  CFTypeRef cf = 0;
  v3 = (id)CFMakeCollectable(v2);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
  return v3;
}

- (UIColor)themeColor
{
  WebCore::cocoaColor((uint64_t *)&cf, (WebCore *)&self->_anon_38[184], (const Color *)a2);
  CFTypeRef v2 = cf;
  CFTypeRef cf = 0;
  v3 = (id)CFMakeCollectable(v2);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
  return v3;
}

- (int64_t)displayMode
{
  if (self->_anon_38[49] - 1 < 3) {
    return (self->_anon_38[49] - 1) + 1;
  }
  else {
    return 0;
  }
}

- (optional<_WKApplicationManifestOrientation>)orientation
{
  if (self->_anon_38[51] && (unint64_t v2 = (char)self->_anon_38[50], v2 <= 7))
  {
    $30EDB2C23837B5636D2A627A1D04886E v3 = stru_1994F6450[v2];
    BOOL v4 = 1;
  }
  else
  {
    v3.var1 = 0;
    BOOL v4 = 0;
  }
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (NSArray)categories
{
  $30EDB2C23837B5636D2A627A1D04886E v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)&self->_anon_38[204]];
  uint64_t v4 = *(unsigned int *)&self->_anon_38[204];
  if (v4)
  {
    uint64_t v5 = *(void **)&self->_anon_38[192];
    uint64_t v6 = 8 * v4;
    while (*v5)
    {
      uint64_t v7 = (__CFString *)WTF::StringImpl::operator NSString *();
      if (v7) {
        goto LABEL_5;
      }
LABEL_6:
      ++v5;
      v6 -= 8;
      if (!v6) {
        goto LABEL_9;
      }
    }
    uint64_t v7 = &stru_1EEA10550;
LABEL_5:
    [v3 addObject:v7];
    goto LABEL_6;
  }
LABEL_9:
  uint64_t v8 = (void *)CFMakeCollectable(v3);

  return (NSArray *)v8;
}

- (NSArray)icons
{
  $30EDB2C23837B5636D2A627A1D04886E v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)&self->_anon_38[220]];
  uint64_t v4 = *(unsigned int *)&self->_anon_38[220];
  if (v4)
  {
    uint64_t v5 = *(void *)&self->_anon_38[208];
    uint64_t v6 = 72 * v4;
    do
    {
      uint64_t v7 = [[_WKApplicationManifestIcon alloc] initWithCoreIcon:v5];
      if (v7)
      {
        [v3 addObject:v7];
        CFRelease(v7);
      }
      v5 += 72;
      v6 -= 72;
    }
    while (v6);
  }
  uint64_t v8 = (void *)CFMakeCollectable(v3);

  return (NSArray *)v8;
}

- (NSArray)shortcuts
{
  $30EDB2C23837B5636D2A627A1D04886E v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)&self->_anon_38[236]];
  uint64_t v4 = *(unsigned int *)&self->_anon_38[236];
  if (v4)
  {
    uint64_t v5 = *(void *)&self->_anon_38[224];
    uint64_t v6 = v4 << 6;
    do
    {
      uint64_t v7 = [[_WKApplicationManifestShortcut alloc] initWithCoreShortcut:v5];
      if (v7)
      {
        [v3 addObject:v7];
        CFRelease(v7);
      }
      v5 += 64;
      v6 -= 64;
    }
    while (v6);
  }
  uint64_t v8 = (void *)CFMakeCollectable(v3);

  return (NSArray *)v8;
}

- (NSURL)manifestId
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (int64_t)dir
{
  return self->_dir;
}

@end