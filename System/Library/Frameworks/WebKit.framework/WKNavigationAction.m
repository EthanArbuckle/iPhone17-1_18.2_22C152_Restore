@interface WKNavigationAction
- (BOOL)_canHandleRequest;
- (BOOL)_hasOpener;
- (BOOL)_isRedirect;
- (BOOL)_isUserInitiated;
- (BOOL)_shouldOpenAppLinks;
- (BOOL)_shouldOpenExternalSchemes;
- (BOOL)_shouldPerformDownload;
- (BOOL)shouldPerformDownload;
- (CGPoint)_clickLocationInRootViewCoordinates;
- (NSEventModifierFlags)modifierFlags;
- (NSString)_targetFrameName;
- (NSString)description;
- (NSURL)_originalURL;
- (NSURLRequest)request;
- (Object)_apiObject;
- (WKFrameInfo)sourceFrame;
- (WKFrameInfo)targetFrame;
- (WKNavigation)_mainFrameNavigation;
- (WKNavigationType)navigationType;
- (_WKHitTestResult)_hitTestResult;
- (_WKUserInitiatedAction)_userInitiatedAction;
- (int64_t)_syntheticClickType;
- (void)_storeSKAdNetworkAttribution;
- (void)dealloc;
@end

@implementation WKNavigationAction

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::NavigationAction::~NavigationAction((API::NavigationAction *)&self->_navigationAction);
    v4.receiver = self;
    v4.super_class = (Class)WKNavigationAction;
    [(WKNavigationAction *)&v4 dealloc];
  }
}

- (NSString)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  WKNavigationType v6 = [(WKNavigationAction *)self navigationType];
  int64_t v7 = [(WKNavigationAction *)self _syntheticClickType];
  [(WKNavigationAction *)self _clickLocationInRootViewCoordinates];
  uint64_t v9 = v8;
  [(WKNavigationAction *)self _clickLocationInRootViewCoordinates];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; navigationType = %ld; syntheticClickType = %ld; position x = %.2f y = %.2f request = %@; sourceFrame = %@; targetFrame = %@>",
                       v5,
                       self,
                       v6,
                       v7,
                       v9,
                       v10,
                       [(WKNavigationAction *)self request],
                       [(WKNavigationAction *)self sourceFrame],
                       [(WKNavigationAction *)self targetFrame]);
}

- (WKFrameInfo)sourceFrame
{
  uint64_t v2 = *(void *)&self->_navigationAction.data.__lx[16];
  if (v2) {
    return *(WKFrameInfo **)(v2 + 8);
  }
  else {
    return 0;
  }
}

- (WKFrameInfo)targetFrame
{
  uint64_t v2 = *(void *)&self->_navigationAction.data.__lx[24];
  if (v2) {
    return *(WKFrameInfo **)(v2 + 8);
  }
  else {
    return 0;
  }
}

- (WKNavigationType)navigationType
{
  unint64_t isa_low = SLOBYTE(self[5].super.isa);
  if (isa_low > 5) {
    return -1;
  }
  else {
    return qword_1994F61E8[isa_low];
  }
}

- (NSURLRequest)request
{
  return (NSURLRequest *)WebCore::ResourceRequest::nsURLRequest();
}

- (BOOL)shouldPerformDownload
{
  return *(void *)self[6]._anon_8 != 0;
}

- (int64_t)_syntheticClickType
{
  int v2 = BYTE3(self[5].super.isa);
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (CGPoint)_clickLocationInRootViewCoordinates
{
  WebCore::FloatPoint::operator CGPoint();
  result.y = v3;
  result.x = v2;
  return result;
}

- (NSEventModifierFlags)modifierFlags
{
  return (BYTE1(self[5].super.isa) << 12) & 0x10000 | ((unint64_t)(BYTE1(self[5].super.isa) & 0xF) << 17);
}

- (Object)_apiObject
{
  return (Object *)&self->_navigationAction;
}

- (NSURL)_originalURL
{
  if (!self[4].super.isa) {
    WebCore::ResourceRequestBase::url((WebCore::ResourceRequestBase *)&self->_navigationAction.data.__lx[40]);
  }

  return (NSURL *)WTF::URL::operator NSURL *();
}

- (BOOL)_isUserInitiated
{
  if (*(void *)&self[4]._navigationAction.data.__lx[32]) {
    double v2 = WTF::RefPtr<API::UserInitiatedAction,WTF::RawPtrTraits<API::UserInitiatedAction>,WTF::DefaultRefDerefTraits<API::UserInitiatedAction>>::unspecifiedBoolTypeInstance;
  }
  else {
    double v2 = 0;
  }
  return v2 != 0;
}

- (BOOL)_canHandleRequest
{
  return (BOOL)self[6].super.isa;
}

- (BOOL)_shouldOpenExternalSchemes
{
  return BYTE1(self[6].super.isa) - 1 < 2;
}

- (BOOL)_shouldOpenAppLinks
{
  return self[4]._navigationAction.data.__lx[24] && BYTE1(self[6].super.isa) == 2;
}

- (BOOL)_shouldPerformDownload
{
  return *(void *)self[6]._anon_8 != 0;
}

- (_WKUserInitiatedAction)_userInitiatedAction
{
  uint64_t v2 = *(void *)&self[4]._navigationAction.data.__lx[32];
  if (v2) {
    return *(_WKUserInitiatedAction **)(v2 + 8);
  }
  else {
    return 0;
  }
}

- (BOOL)_isRedirect
{
  return (self[8]._navigationAction.data.__lx[18] & 1) == 0;
}

- (WKNavigation)_mainFrameNavigation
{
  uint64_t v2 = *(void *)self[45]._navigationAction.data.__lx;
  if (v2) {
    return *(WKNavigation **)(v2 + 8);
  }
  else {
    return 0;
  }
}

- (void)_storeSKAdNetworkAttribution
{
  uint64_t v2 = *(unsigned char **)self[45]._navigationAction.data.__lx;
  if (v2)
  {
    if (v2[1368])
    {
      if (v2[1104])
      {
        uint64_t v3 = *(void *)&self->_navigationAction.data.__lx[16];
        if (v3)
        {
          uint64_t v4 = *(void *)(v3 + 312);
          if (v4) {
            WebKit::WebsiteDataStore::storePrivateClickMeasurement(*(WebKit::WebsiteDataStore **)(v4 + 312), (const WebCore::PrivateClickMeasurement *)(v2 + 1056));
          }
        }
      }
    }
  }
}

- (_WKHitTestResult)_hitTestResult
{
  if (!LOBYTE(self[29].super.isa)) {
    return 0;
  }
  uint64_t v3 = *(void *)&self->_navigationAction.data.__lx[16];
  if (!v3) {
    return 0;
  }
  CFRetain(*(CFTypeRef *)(v3 + 8));
  uint64_t v4 = *(CFTypeRef **)(v3 + 312);
  if (!v4)
  {
    uint64_t v9 = 0;
LABEL_8:
    CFRelease(*(CFTypeRef *)(v3 + 8));
    return v9;
  }
  CFRetain(v4[1]);
  if (LOBYTE(self[29].super.isa))
  {
    v5 = (const WebKit::WebHitTestResultData *)&self[18]._navigationAction.data.__lx[24];
    WKNavigationType v6 = (CFTypeRef *)API::Object::newObject(0x2B0uLL, 67);
    int64_t v7 = API::HitTestResult::HitTestResult((API::HitTestResult *)v6, v5, (WebKit::WebPageProxy *)v4);
    uint64_t v8 = (const void *)*((void *)v7 + 1);
    if (v8) {
      CFRetain(*((CFTypeRef *)v7 + 1));
    }
    uint64_t v9 = (id)CFMakeCollectable(v8);
    CFRelease(v6[1]);
    CFRelease(v4[1]);
    goto LABEL_8;
  }
  CGPoint result = (_WKHitTestResult *)std::__throw_bad_optional_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (NSString)_targetFrameName
{
  CGPoint result = *(NSString **)&self->_navigationAction.data.__lx[32];
  if (result) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return result;
}

- (BOOL)_hasOpener
{
  return self[10]._navigationAction.data.__lx[12];
}

@end