@interface _WKWebPushMessage
- (NSData)data;
- (NSString)partition;
- (NSURL)scopeURL;
- (Object)_apiObject;
- (id)scope;
- (void)dealloc;
@end

@implementation _WKWebPushMessage

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    std::__optional_destruct_base<WebCore::NotificationPayload,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&self->_anon_38[40], v4);
    v6 = *(WTF::StringImpl **)self->_anon_38;
    *(void *)self->_anon_38 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        WTF::StringImpl::destroy(v6, v5);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
    v7 = *(WTF::StringImpl **)&self->_message.data.__lx[40];
    *(void *)&self->_message.data.__lx[40] = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2) {
        WTF::StringImpl::destroy(v7, v5);
      }
      else {
        *(_DWORD *)v7 -= 2;
      }
    }
    if (self->_message.data.__lx[32])
    {
      v8 = *(WTF **)&self->_message.data.__lx[16];
      if (v8)
      {
        *(void *)&self->_message.data.__lx[16] = 0;
        *(_DWORD *)&self->_message.data.__lx[24] = 0;
        WTF::fastFree(v8, v5);
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)_WKWebPushMessage;
    [(_WKWebPushMessage *)&v9 dealloc];
  }
}

- (NSData)data
{
  std::__optional_copy_base<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,false>::__optional_copy_base[abi:sn180100]((uint64_t)&v7, (uint64_t)&self->_message.data.__lx[16]);
  if (!v10) {
    return 0;
  }
  v2 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 length:v9];
  v4 = v2;
  if (v2) {
    CFRelease(v2);
  }
  if (v10)
  {
    v5 = v7;
    if (v7)
    {
      v7 = 0;
      int v8 = 0;
      WTF::fastFree(v5, v3);
    }
  }
  return v4;
}

- (id)scope
{
  v2 = *(WTF::StringImpl **)self->_anon_38;
  if (v2) {
    *(_DWORD *)v2 += 2;
  }
  v6 = v2;
  v4 = (void *)WTF::URL::operator NSURL *();
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v3);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  return v4;
}

- (NSString)partition
{
  v2 = *(WTF::StringImpl **)&self->_message.data.__lx[40];
  if (!v2) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (Object)_apiObject
{
  return (Object *)&self->_message;
}

- (NSURL)scopeURL
{
  return self->_scopeURL;
}

@end