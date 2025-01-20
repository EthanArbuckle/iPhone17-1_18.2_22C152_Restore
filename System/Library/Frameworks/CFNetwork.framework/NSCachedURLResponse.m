@interface NSCachedURLResponse
+ (BOOL)supportsSecureCoding;
- (NSCachedURLResponse)initWithCoder:(id)a3;
- (NSCachedURLResponse)initWithResponse:(NSURLResponse *)response data:(NSData *)data;
- (NSCachedURLResponse)initWithResponse:(NSURLResponse *)response data:(NSData *)data userInfo:(NSDictionary *)userInfo storagePolicy:(NSURLCacheStoragePolicy)storagePolicy;
- (NSCachedURLResponse)initWithResponse:(id)a3 dataArray:(id)a4 userInfo:(id)a5 storagePolicy:(unint64_t)a6;
- (NSData)data;
- (NSDictionary)userInfo;
- (NSURLCacheStoragePolicy)storagePolicy;
- (NSURLResponse)response;
- (_CFCachedURLResponse)_CFCachedURLResponse;
- (id)_initWithCFCachedURLResponse:(_CFCachedURLResponse *)a3;
- (id)_wrappedRequest;
- (id)dataArray;
- (void)_deallocInternalCFCachedURLResponse;
- (void)_reestablishInternalCFCachedURLResponse:(_CFCachedURLResponse *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSCachedURLResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CFCachedURLResponse)_CFCachedURLResponse
{
  internal = self->_internal;
  if (internal) {
    return internal->_cachedURLResponse;
  }
  else {
    return 0;
  }
}

- (id)_initWithCFCachedURLResponse:(_CFCachedURLResponse *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSCachedURLResponse;
  v4 = [(NSCachedURLResponse *)&v8 init];
  if (v4)
  {
    if (a3) {
      uint64_t v5 = *((void *)a3->var1 + 4);
    }
    else {
      uint64_t v5 = 0;
    }
    v4->_internal = objc_alloc_init(NSCachedURLResponseInternal);
    v4->_internal->response = (NSURLResponse *)+[NSURLResponse _responseWithCFURLResponse:v5];
    v4->_internal->data = 0;
    v4->_internal->userInfo = 0;
    if (a3) {
      uint64_t v6 = *((int *)a3->var1 + 14);
    }
    else {
      uint64_t v6 = 2;
    }
    v4->_internal->storagePolicy = v6;
    v4->_internal->_cachedURLResponse = a3;
  }
  return v4;
}

- (NSCachedURLResponse)initWithResponse:(NSURLResponse *)response data:(NSData *)data userInfo:(NSDictionary *)userInfo storagePolicy:(NSURLCacheStoragePolicy)storagePolicy
{
  v12.receiver = self;
  v12.super_class = (Class)NSCachedURLResponse;
  v10 = [(NSCachedURLResponse *)&v12 init];
  if (v10)
  {
    v10->_internal = objc_alloc_init(NSCachedURLResponseInternal);
    v10->_internal->response = (NSURLResponse *)[(NSURLResponse *)response copy];
    v10->_internal->data = (NSData *)[(NSData *)data copy];
    v10->_internal->userInfo = (NSDictionary *)[(NSDictionary *)userInfo copy];
    v10->_internal->storagePolicy = storagePolicy;
    v10->_internal->_cachedURLResponse = (_CFCachedURLResponse *)CFCachedURLResponseCreateWithUserInfo();
    CFMakeCollectable(v10->_internal->_cachedURLResponse);
  }
  return v10;
}

- (NSData)data
{
  internal = self->_internal;
  if (internal)
  {
    CFArrayRef v3 = (const __CFArray *)CFCachedURLResponseCopyReceiverDataArray((uint64_t)internal->_cachedURLResponse);
    if (v3)
    {
      CFArrayRef v4 = v3;
      CFIndex Count = CFArrayGetCount(v3);
      if (Count == 1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, 0);
        CFTypeRef v7 = CFRetain(ValueAtIndex);
        objc_super v8 = (id)CFMakeCollectable(v7);
      }
      else
      {
        if (Count <= 1)
        {
          CFRelease(v4);
          goto LABEL_11;
        }
        CFIndex v9 = Count;
        objc_super v8 = (NSData *)[MEMORY[0x1E4F1CA58] data];
        for (CFIndex i = 0; i != v9; ++i)
          [(NSData *)v8 appendData:CFArrayGetValueAtIndex(v4, i)];
      }
      CFRelease(v4);
      if (v8) {
        return v8;
      }
    }
  }
LABEL_11:
  objc_super v12 = (void *)MEMORY[0x1E4F1C9B8];

  return (NSData *)[v12 data];
}

- (NSURLResponse)response
{
  internal = self->_internal;
  if (internal) {
    return internal->response;
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    cachedURLResponse = internal->_cachedURLResponse;
    if (cachedURLResponse)
    {
      var1 = cachedURLResponse->var1;
      if (var1)
      {
        __CFCachedURLResponse::SetNSCachedURLResponse(var1, 0);
        cachedURLResponse = self->_internal->_cachedURLResponse;
      }

      internal = self->_internal;
    }
  }

  v6.receiver = self;
  v6.super_class = (Class)NSCachedURLResponse;
  [(NSCachedURLResponse *)&v6 dealloc];
}

- (NSCachedURLResponse)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)NSCachedURLResponse;
  CFArrayRef v4 = [(NSCachedURLResponse *)&v15 init];
  if (!v4) {
    return v4;
  }
  int v14 = 0;
  [a3 decodeValueOfObjCType:"i" at:&v14 size:4];
  if (v14 != 12)
  {

    return 0;
  }
  v4->_internal = objc_alloc_init(NSCachedURLResponseInternal);
  v4->_internal->response = (NSURLResponse *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_NSURLResponseType"];
  v4->_internal->data = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_NSDataType"];
  v4->_internal->userInfo = (NSDictionary *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_NSDictionaryType"];
  int v13 = 0;
  [a3 decodeValueOfObjCType:"i" at:&v13 size:4];
  v4->_internal->storagePolicy = v13;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"_CFCachedURLResponseReceiverDataArray");
  CFDataRef v7 = (const __CFData *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_CFCachedURLResponseUserInfo"];
  CFErrorRef error = 0;
  if (v7)
  {
    CFPropertyListRef v8 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7, 0, 0, &error);
    if (v8 || !error) {
      goto LABEL_9;
    }
    NSLog(&cfstr_ErrorDecodingU.isa, error);
    if (error) {
      CFRelease(error);
    }
  }
  CFPropertyListRef v8 = 0;
LABEL_9:
  CFIndex v9 = (__CFCachedURLResponse **)CFCachedURLResponseCreateWithDataArray();
  [(NSCachedURLResponse *)v4 _reestablishInternalCFCachedURLResponse:v9];
  if (v8) {
    CFRelease(v8);
  }
  if (v9)
  {
    v10 = (const _CFURLRequest *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_CFURLRequestAsNSURLRequest"];
    if (v10) {
      __CFCachedURLResponse::SetRequest(v9[2], v10);
    }
    CFRelease(v9);
  }
  return v4;
}

- (void)_reestablishInternalCFCachedURLResponse:(_CFCachedURLResponse *)a3
{
  internal = self->_internal;
  if (internal && !internal->_cachedURLResponse)
  {
    if (a3)
    {
      CFRetain(a3);
      internal = self->_internal;
    }
    internal->_cachedURLResponse = a3;
  }
}

- (NSDictionary)userInfo
{
  internal = self->_internal;
  if (internal && (cachedURLResponse = internal->_cachedURLResponse) != 0) {
    return (NSDictionary *)*((void *)cachedURLResponse->var1 + 5);
  }
  else {
    return 0;
  }
}

- (NSCachedURLResponse)initWithResponse:(NSURLResponse *)response data:(NSData *)data
{
  return [(NSCachedURLResponse *)self initWithResponse:response data:data userInfo:0 storagePolicy:0];
}

- (id)_wrappedRequest
{
  internal = self->_internal;
  if (!internal) {
    return 0;
  }
  CFArrayRef v3 = (void *)CFCachedURLResponseCopyWrappedRequest(internal->_cachedURLResponse);

  return v3;
}

- (void)_deallocInternalCFCachedURLResponse
{
  internal = self->_internal;
  if (internal)
  {
    cachedURLResponse = internal->_cachedURLResponse;
    if (cachedURLResponse)
    {

      self->_internal->_cachedURLResponse = 0;
    }
  }
}

- (NSURLCacheStoragePolicy)storagePolicy
{
  internal = self->_internal;
  if (internal && (cachedURLResponse = internal->_cachedURLResponse) != 0) {
    return (uint64_t)*((int *)cachedURLResponse->var1 + 14);
  }
  else {
    return 2;
  }
}

- (id)dataArray
{
  internal = self->_internal;
  if (!internal) {
    return 0;
  }
  CFTypeRef v3 = CFCachedURLResponseCopyReceiverDataArray((uint64_t)internal->_cachedURLResponse);
  CFArrayRef v4 = (void *)CFMakeCollectable(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int v19 = 12;
  [a3 encodeValueOfObjCType:"i" at:&v19];
  [a3 encodeObject:self->_internal->response forKey:@"_NSURLResponseType"];
  [a3 encodeObject:self->_internal->data forKey:@"_NSDataType"];
  [a3 encodeObject:self->_internal->userInfo forKey:@"_NSDictionaryType"];
  int storagePolicy = self->_internal->storagePolicy;
  [a3 encodeValueOfObjCType:"i" at:&storagePolicy];
  cachedURLResponse = self->_internal->_cachedURLResponse;
  if (cachedURLResponse)
  {
    CFErrorRef error = 0;
    CFTypeRef v6 = CFCachedURLResponseCopyReceiverDataArray((uint64_t)cachedURLResponse);
    if (v6)
    {
      CFDataRef v7 = v6;
      CFPropertyListRef v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v6];
      CFRelease(v7);
    }
    else
    {
      CFPropertyListRef v8 = 0;
    }
    CFIndex v9 = self->_internal->_cachedURLResponse;
    if (v9 && (v10 = (const void *)*((void *)v9->var1 + 5)) != 0)
    {
      CFDataRef v11 = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, kCFPropertyListBinaryFormat_v1_0, 0, &error);
      if (!v11)
      {
        NSLog(&cfstr_ErrorEncodingU.isa, error);
        CFRelease(error);
      }
    }
    else
    {
      CFDataRef v11 = 0;
    }
    if (v8)
    {
      [a3 encodeObject:v8 forKey:@"_CFCachedURLResponseReceiverDataArray"];
    }
    if (v11)
    {
      [a3 encodeObject:v11 forKey:@"_CFCachedURLResponseUserInfo"];
      CFRelease(v11);
    }
    objc_super v12 = self->_internal->_cachedURLResponse;
    if (v12)
    {
      uint64_t v13 = CFCachedURLResponseCopyWrappedRequest(v12);
      if (v13)
      {
        int v14 = (const void *)v13;
        id v15 = [[NSURLRequest alloc] _initWithCFURLRequest:v13];
        if (v15)
        {
          v16 = v15;
          [a3 encodeObject:v15 forKey:@"_CFURLRequestAsNSURLRequest"];
        }
        CFRelease(v14);
      }
    }
  }
}

- (NSCachedURLResponse)initWithResponse:(id)a3 dataArray:(id)a4 userInfo:(id)a5 storagePolicy:(unint64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)NSCachedURLResponse;
  CFPropertyListRef v8 = [(NSCachedURLResponse *)&v10 init];
  if (v8)
  {
    v8->_internal = objc_alloc_init(NSCachedURLResponseInternal);
    v8->_internal->response = (NSURLResponse *)[a3 copy];
    v8->_internal->data = 0;
    v8->_internal->userInfo = 0;
    v8->_internal->int storagePolicy = a6;
    v8->_internal->_cachedURLResponse = (_CFCachedURLResponse *)CFCachedURLResponseCreateWithDataArray();
    CFMakeCollectable(v8->_internal->_cachedURLResponse);
  }
  return v8;
}

@end