@interface WKNavigationData
- (NSString)title;
- (NSURL)destinationURL;
- (NSURLRequest)originalRequest;
- (NSURLResponse)response;
- (Object)_apiObject;
- (void)dealloc;
@end

@implementation WKNavigationData

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_data.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKNavigationData;
    [(WKNavigationData *)&v4 dealloc];
  }
}

- (NSString)title
{
  v2 = *(WTF::StringImpl **)&self->_data.data.__lx[24];
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

- (NSURLRequest)originalRequest
{
  return (NSURLRequest *)WebCore::ResourceRequest::nsURLRequest();
}

- (NSURL)destinationURL
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  objc_super v4 = *(WTF::StringImpl **)&self->_data.data.__lx[16];
  if (v4) {
    *(_DWORD *)v4 += 2;
  }
  v9 = v4;
  v6 = (NSURL *)objc_msgSend(v3, "_web_URLWithWTFString:", &v9);
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v5);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  return v6;
}

- (NSURLResponse)response
{
  return (NSURLResponse *)WebCore::ResourceResponse::nsURLResponse((WebCore::ResourceResponse *)&self[4]._data.data.__lx[8]);
}

- (Object)_apiObject
{
  return (Object *)&self->_data;
}

@end