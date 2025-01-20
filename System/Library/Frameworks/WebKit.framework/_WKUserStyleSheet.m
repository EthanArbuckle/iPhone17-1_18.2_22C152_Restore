@interface _WKUserStyleSheet
- (BOOL)isForMainFrameOnly;
- (NSString)source;
- (NSURL)baseURL;
- (Object)_apiObject;
- (_WKUserStyleSheet)initWithSource:(id)a3 forMainFrameOnly:(BOOL)a4;
- (_WKUserStyleSheet)initWithSource:(id)a3 forWKWebView:(id)a4 forMainFrameOnly:(BOOL)a5 includeMatchPatternStrings:(id)a6 excludeMatchPatternStrings:(id)a7 baseURL:(id)a8 level:(int64_t)a9 contentWorld:(id)a10;
- (void)dealloc;
@end

@implementation _WKUserStyleSheet

- (_WKUserStyleSheet)initWithSource:(id)a3 forMainFrameOnly:(BOOL)a4
{
  v27.receiver = self;
  v27.super_class = (Class)_WKUserStyleSheet;
  v5 = [(_WKUserStyleSheet *)&v27 init];
  v6 = v5;
  if (v5)
  {
    WebKit::InitializeWebKit2((WebKit *)v5);
    MEMORY[0x19972EAD0](&v22, a3);
    WTF::URL::URL((WTF::URL *)&v21);
    v20[0] = 0;
    v20[1] = 0;
    v19[0] = 0;
    v19[1] = 0;
    v7 = (API::ContentWorld *)WebCore::UserStyleSheet::UserStyleSheet();
    v8 = API::ContentWorld::pageContentWorld(v7);
    API::Object::constructInWrapper<API::UserStyleSheet,WebCore::UserStyleSheet,API::ContentWorld &>(v6, (uint64_t)&v23, (uint64_t)v8);
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v26, v9);
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v25, v10);
    v12 = v24;
    v24 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v11);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
    v13 = v23;
    v23 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2) {
        WTF::StringImpl::destroy(v13, v11);
      }
      else {
        *(_DWORD *)v13 -= 2;
      }
    }
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v19, v11);
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v20, v14);
    v16 = v21;
    v21 = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2) {
        WTF::StringImpl::destroy(v16, v15);
      }
      else {
        *(_DWORD *)v16 -= 2;
      }
    }
    v17 = v22;
    v22 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2) {
        WTF::StringImpl::destroy(v17, v15);
      }
      else {
        *(_DWORD *)v17 -= 2;
      }
    }
  }
  return v6;
}

- (_WKUserStyleSheet)initWithSource:(id)a3 forWKWebView:(id)a4 forMainFrameOnly:(BOOL)a5 includeMatchPatternStrings:(id)a6 excludeMatchPatternStrings:(id)a7 baseURL:(id)a8 level:(int64_t)a9 contentWorld:(id)a10
{
  WebKit::InitializeWebKit2((WebKit *)self);
  MEMORY[0x19972EAD0](&v31, a3);
  MEMORY[0x19972E8A0](&v30, a8);
  WTF::makeVector<WTF::String>(a6, (uint64_t)v29);
  WTF::makeVector<WTF::String>(a7, (uint64_t)v28);
  if (a4) {
    [a4 _page];
  }
  v16 = (API::ContentWorld *)WebCore::UserStyleSheet::UserStyleSheet();
  if (a10) {
    v17 = (WebKit *)((char *)a10 + 8);
  }
  else {
    v17 = API::ContentWorld::pageContentWorld(v16);
  }
  API::Object::constructInWrapper<API::UserStyleSheet,WebCore::UserStyleSheet,API::ContentWorld &>(self, (uint64_t)&v32, (uint64_t)v17);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v35, v18);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v34, v19);
  v21 = v33;
  v33 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2) {
      WTF::StringImpl::destroy(v21, v20);
    }
    else {
      *(_DWORD *)v21 -= 2;
    }
  }
  v22 = v32;
  v32 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2) {
      WTF::StringImpl::destroy(v22, v20);
    }
    else {
      *(_DWORD *)v22 -= 2;
    }
  }
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v28, v20);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v29, v23);
  uint64_t v25 = v30;
  v30 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2) {
      WTF::StringImpl::destroy(v25, v24);
    }
    else {
      *(_DWORD *)v25 -= 2;
    }
  }
  uint64_t v26 = v31;
  v31 = 0;
  if (v26)
  {
    if (*(_DWORD *)v26 == 2) {
      WTF::StringImpl::destroy(v26, v24);
    }
    else {
      *(_DWORD *)v26 -= 2;
    }
  }
  return self;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    uint64_t v5 = *(void *)&self[2]._userStyleSheet.data.__lx[16];
    *(void *)&self[2]._userStyleSheet.data.__lx[16] = 0;
    if (v5) {
      CFRelease(*(CFTypeRef *)(v5 + 8));
    }
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self[1]._userStyleSheet.data.__lx[32], v4);
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self[1]._userStyleSheet.data.__lx[16], v6);
    v8 = *(WTF::StringImpl **)&self->_userStyleSheet.data.__lx[32];
    *(void *)&self->_userStyleSheet.data.__lx[32] = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, v7);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
    v9 = *(WTF::StringImpl **)&self->_userStyleSheet.data.__lx[24];
    *(void *)&self->_userStyleSheet.data.__lx[24] = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2) {
        WTF::StringImpl::destroy(v9, v7);
      }
      else {
        *(_DWORD *)v9 -= 2;
      }
    }
    v10.receiver = self;
    v10.super_class = (Class)_WKUserStyleSheet;
    [(_WKUserStyleSheet *)&v10 dealloc];
  }
}

- (NSString)source
{
  if (*(void *)&self->_userStyleSheet.data.__lx[24]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (NSURL)baseURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (BOOL)isForMainFrameOnly
{
  return (BOOL)self[2].super.isa;
}

- (Object)_apiObject
{
  return (Object *)&self->_userStyleSheet;
}

@end