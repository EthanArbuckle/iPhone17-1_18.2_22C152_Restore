@interface _WKWebPushSubscriptionData
- (NSData)applicationServerKey;
- (NSData)authenticationSecret;
- (NSData)ecdhPublicKey;
- (NSURL)endpoint;
- (Object)_apiObject;
- (void)dealloc;
@end

@implementation _WKWebPushSubscriptionData

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v5 = *(WTF **)&self[1]._data.data.__lx[24];
    if (v5)
    {
      *(void *)&self[1]._data.data.__lx[24] = 0;
      *(_DWORD *)&self[1]._data.data.__lx[32] = 0;
      WTF::fastFree(v5, v4);
    }
    v6 = *(WTF **)&self[1]._data.data.__lx[8];
    if (v6)
    {
      *(void *)&self[1]._data.data.__lx[8] = 0;
      *(_DWORD *)&self[1]._data.data.__lx[16] = 0;
      WTF::fastFree(v6, v4);
    }
    isa = self[1].super.isa;
    if (isa)
    {
      self[1].super.isa = 0;
      *(_DWORD *)self[1]._data.data.__lx = 0;
      WTF::fastFree(isa, v4);
    }
    v8 = *(WTF::StringImpl **)&self->_data.data.__lx[24];
    *(void *)&self->_data.data.__lx[24] = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, (WTF::StringImpl *)v4);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)_WKWebPushSubscriptionData;
    [(_WKWebPushSubscriptionData *)&v9 dealloc];
  }
}

- (NSURL)endpoint
{
  WTF::URL::URL((uint64_t)&v6, (WTF::StringImpl **)&self->_data.data.__lx[24]);
  v3 = (NSURL *)WTF::URL::operator NSURL *();
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v2);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  return v3;
}

- (NSData)applicationServerKey
{
  uint64_t v2 = *(unsigned int *)&self[1]._data.data.__lx[4];
  if (v2)
  {
    v4 = (void *)WTF::fastMalloc((WTF *)*(unsigned int *)&self[1]._data.data.__lx[4]);
    memcpy(v4, self[1].super.isa, *(unsigned int *)&self[1]._data.data.__lx[4]);
  }
  else
  {
    v4 = 0;
  }
  v5 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v4 length:v2];
  v7 = v5;
  if (v5) {
    CFRelease(v5);
  }
  if (v4) {
    WTF::fastFree((WTF *)v4, v6);
  }
  return v7;
}

- (NSData)authenticationSecret
{
  uint64_t v2 = *(unsigned int *)&self[1]._data.data.__lx[36];
  if (v2)
  {
    v4 = (void *)WTF::fastMalloc((WTF *)*(unsigned int *)&self[1]._data.data.__lx[36]);
    memcpy(v4, *(const void **)&self[1]._data.data.__lx[24], *(unsigned int *)&self[1]._data.data.__lx[36]);
  }
  else
  {
    v4 = 0;
  }
  v5 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v4 length:v2];
  v7 = v5;
  if (v5) {
    CFRelease(v5);
  }
  if (v4) {
    WTF::fastFree((WTF *)v4, v6);
  }
  return v7;
}

- (NSData)ecdhPublicKey
{
  uint64_t v2 = *(unsigned int *)&self[1]._data.data.__lx[20];
  if (v2)
  {
    v4 = (void *)WTF::fastMalloc((WTF *)*(unsigned int *)&self[1]._data.data.__lx[20]);
    memcpy(v4, *(const void **)&self[1]._data.data.__lx[8], *(unsigned int *)&self[1]._data.data.__lx[20]);
  }
  else
  {
    v4 = 0;
  }
  v5 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v4 length:v2];
  v7 = v5;
  if (v5) {
    CFRelease(v5);
  }
  if (v4) {
    WTF::fastFree((WTF *)v4, v6);
  }
  return v7;
}

- (Object)_apiObject
{
  return (Object *)&self->_data;
}

@end