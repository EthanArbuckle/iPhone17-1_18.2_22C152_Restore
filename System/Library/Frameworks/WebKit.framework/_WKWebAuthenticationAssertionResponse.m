@interface _WKWebAuthenticationAssertionResponse
- (BOOL)synchronizable;
- (NSData)credentialID;
- (NSData)userHandle;
- (NSString)accessGroup;
- (NSString)displayName;
- (NSString)group;
- (NSString)name;
- (Object)_apiObject;
- (void)dealloc;
- (void)setLAContext:(id)a3;
@end

@implementation _WKWebAuthenticationAssertionResponse

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v4 = *(_DWORD **)&self->_response.data.__lx[16];
    *(void *)&self->_response.data.__lx[16] = 0;
    if (v4)
    {
      if (v4[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v4 + 8))(v4);
      }
      else {
        --v4[2];
      }
    }
    v5.receiver = self;
    v5.super_class = (Class)_WKWebAuthenticationAssertionResponse;
    [(_WKWebAuthenticationAssertionResponse *)&v5 dealloc];
  }
}

- (NSString)name
{
  if (*(void *)(*(void *)&self->_response.data.__lx[16] + 144)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (NSString)displayName
{
  if (*(void *)(*(void *)&self->_response.data.__lx[16] + 152)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (NSData)userHandle
{
  API::WebAuthenticationAssertionResponse::userHandle((API::WebAuthenticationAssertionResponse *)&self->_response, &v8);
  v2 = v8;
  if (v8)
  {
    v8 = 0;
    v3 = (const void *)*((void *)v2 + 1);
    if (v3)
    {
      CFRetain(*((CFTypeRef *)v2 + 1));
      v4 = (const void *)*((void *)v2 + 1);
    }
    else
    {
      v4 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v3 = 0;
  }
  objc_super v5 = (id)CFMakeCollectable(v3);
  v6 = v8;
  v8 = 0;
  if (v6) {
    CFRelease(*((CFTypeRef *)v6 + 1));
  }
  return v5;
}

- (BOOL)synchronizable
{
  return *(unsigned char *)(*(void *)&self->_response.data.__lx[16] + 168);
}

- (NSString)group
{
  if (*(void *)(*(void *)&self->_response.data.__lx[16] + 160)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (NSData)credentialID
{
  API::WebAuthenticationAssertionResponse::credentialID((WebCore::AuthenticatorResponse **)&self->_response, &v8);
  v2 = v8;
  if (v8)
  {
    v8 = 0;
    v3 = (const void *)*((void *)v2 + 1);
    if (v3)
    {
      CFRetain(*((CFTypeRef *)v2 + 1));
      v4 = (const void *)*((void *)v2 + 1);
    }
    else
    {
      v4 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v3 = 0;
  }
  objc_super v5 = (id)CFMakeCollectable(v3);
  v6 = v8;
  v8 = 0;
  if (v6) {
    CFRelease(*((CFTypeRef *)v6 + 1));
  }
  return v5;
}

- (NSString)accessGroup
{
  if (*(void *)(*(void *)&self->_response.data.__lx[16] + 208)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setLAContext:(id)a3
{
}

- (Object)_apiObject
{
  return (Object *)&self->_response;
}

@end