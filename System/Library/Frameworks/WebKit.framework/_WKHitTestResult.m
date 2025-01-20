@interface _WKHitTestResult
- (BOOL)hasLocalDataForLinkURL;
- (BOOL)isContentEditable;
- (BOOL)isMediaDownloadable;
- (BOOL)isMediaFullscreen;
- (BOOL)isSelected;
- (CGRect)elementBoundingBox;
- (NSString)imageMIMEType;
- (NSString)imageSuggestedFilename;
- (NSString)linkLabel;
- (NSString)linkLocalDataMIMEType;
- (NSString)linkSuggestedFilename;
- (NSString)linkTitle;
- (NSString)lookupText;
- (NSURL)absoluteImageURL;
- (NSURL)absoluteLinkURL;
- (NSURL)absoluteMediaURL;
- (NSURL)absolutePDFURL;
- (Object)_apiObject;
- (WKFrameInfo)frameInfo;
- (int64_t)elementType;
- (void)dealloc;
@end

@implementation _WKHitTestResult

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_hitTestResult.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)_WKHitTestResult;
    [(_WKHitTestResult *)&v4 dealloc];
  }
}

- (NSURL)absoluteImageURL
{
  v2 = *(const WTF::String **)&self->_hitTestResult.data.__lx[16];
  if (v2) {
    *(_DWORD *)v2 += 2;
  }
  objc_super v4 = (NSURL *)URLFromString(v2);
  if (v2)
  {
    if (*(_DWORD *)v2 == 2) {
      WTF::StringImpl::destroy(v2, v3);
    }
    else {
      *(_DWORD *)v2 -= 2;
    }
  }
  return v4;
}

- (NSURL)absolutePDFURL
{
  v2 = *(const WTF::String **)&self->_hitTestResult.data.__lx[24];
  if (v2) {
    *(_DWORD *)v2 += 2;
  }
  objc_super v4 = (NSURL *)URLFromString(v2);
  if (v2)
  {
    if (*(_DWORD *)v2 == 2) {
      WTF::StringImpl::destroy(v2, v3);
    }
    else {
      *(_DWORD *)v2 -= 2;
    }
  }
  return v4;
}

- (NSURL)absoluteLinkURL
{
  v2 = *(const WTF::String **)&self->_hitTestResult.data.__lx[32];
  if (v2) {
    *(_DWORD *)v2 += 2;
  }
  objc_super v4 = (NSURL *)URLFromString(v2);
  if (v2)
  {
    if (*(_DWORD *)v2 == 2) {
      WTF::StringImpl::destroy(v2, v3);
    }
    else {
      *(_DWORD *)v2 -= 2;
    }
  }
  return v4;
}

- (BOOL)hasLocalDataForLinkURL
{
  return self[9]._hitTestResult.data.__lx[0];
}

- (NSString)linkLocalDataMIMEType
{
  Class isa = self[9].super.isa;
  if (!isa) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)isa += 2;
  objc_super v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)isa == 2) {
    WTF::StringImpl::destroy(isa, v3);
  }
  else {
    *(_DWORD *)isa -= 2;
  }
  return v4;
}

- (NSURL)absoluteMediaURL
{
  v2 = *(const WTF::String **)&self->_hitTestResult.data.__lx[40];
  if (v2) {
    *(_DWORD *)v2 += 2;
  }
  objc_super v4 = (NSURL *)URLFromString(v2);
  if (v2)
  {
    if (*(_DWORD *)v2 == 2) {
      WTF::StringImpl::destroy(v2, v3);
    }
    else {
      *(_DWORD *)v2 -= 2;
    }
  }
  return v4;
}

- (NSString)linkLabel
{
  Class isa = self[1].super.isa;
  if (!isa) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)isa += 2;
  objc_super v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)isa == 2) {
    WTF::StringImpl::destroy(isa, v3);
  }
  else {
    *(_DWORD *)isa -= 2;
  }
  return v4;
}

- (NSString)linkTitle
{
  v2 = *(WTF::StringImpl **)self[1]._hitTestResult.data.__lx;
  if (!v2) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)v2 += 2;
  objc_super v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (NSString)lookupText
{
  v2 = *(WTF::StringImpl **)self[8]._hitTestResult.data.__lx;
  if (!v2) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)v2 += 2;
  objc_super v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (NSString)linkSuggestedFilename
{
  v2 = *(WTF::StringImpl **)&self[1]._hitTestResult.data.__lx[8];
  if (!v2) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)v2 += 2;
  objc_super v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (NSString)imageSuggestedFilename
{
  v2 = *(WTF::StringImpl **)&self[1]._hitTestResult.data.__lx[16];
  if (!v2) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)v2 += 2;
  objc_super v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (NSString)imageMIMEType
{
  v2 = *(WTF::StringImpl **)&self[8]._hitTestResult.data.__lx[40];
  if (!v2) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)v2 += 2;
  objc_super v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (BOOL)isContentEditable
{
  return self[1]._hitTestResult.data.__lx[24];
}

- (BOOL)isSelected
{
  return self[1]._hitTestResult.data.__lx[45];
}

- (BOOL)isMediaDownloadable
{
  return (BOOL)self[2].super.isa;
}

- (BOOL)isMediaFullscreen
{
  return BYTE1(self[2].super.isa);
}

- (CGRect)elementBoundingBox
{
  WebCore::IntRect::operator CGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)elementType
{
  int v2 = BYTE3(self[2].super.isa);
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (WKFrameInfo)frameInfo
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  std::__optional_copy_base<WebKit::FrameInfoData,false>::__optional_copy_base[abi:sn180100]((WebKit::FrameInfoData *)v12, (uint64_t)&self[2]._hitTestResult);
  if (v12[296])
  {
    uint64_t v4 = *(void *)&self[12]._hitTestResult.data.__lx[8];
    if (v4)
    {
      uint64_t v5 = *(void *)(v4 + 8);
      if (v5)
      {
        CFRetain(*(CFTypeRef *)(v5 - 8));
        uint64_t v4 = v5 - 16;
      }
      else
      {
        uint64_t v4 = 0;
      }
    }
    uint64_t v11 = v4;
    uint64_t v7 = API::Object::newObject(0x140uLL, 60);
    uint64_t v8 = API::FrameInfo::FrameInfo(v7, (uint64_t)v12, &v11);
    v9 = *(const void **)(v8 + 8);
    if (v9) {
      CFRetain(*(CFTypeRef *)(v8 + 8));
    }
    v6 = (id)CFMakeCollectable(v9);
    CFRelease(*(CFTypeRef *)(v7 + 8));
    if (v11) {
      CFRelease(*(CFTypeRef *)(v11 + 8));
    }
  }
  else
  {
    v6 = 0;
  }
  std::__optional_destruct_base<WebKit::FrameInfoData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v12, v3);
  return v6;
}

- (Object)_apiObject
{
  return (Object *)&self->_hitTestResult;
}

@end