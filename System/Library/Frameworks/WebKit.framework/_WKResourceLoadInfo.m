@interface _WKResourceLoadInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)loadedFromCache;
- (NSDate)eventTimestamp;
- (NSString)originalHTTPMethod;
- (NSURL)originalURL;
- (Object)_apiObject;
- (_WKFrameHandle)frame;
- (_WKFrameHandle)parentFrame;
- (_WKResourceLoadInfo)initWithCoder:(id)a3;
- (int64_t)resourceType;
- (unint64_t)resourceLoadID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _WKResourceLoadInfo

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v5 = *(WTF::StringImpl **)self[2]._info.data.__lx;
    *(void *)self[2]._info.data.__lx = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v4);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
    v6 = *(WTF::StringImpl **)&self[1]._info.data.__lx[16];
    *(void *)&self[1]._info.data.__lx[16] = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        WTF::StringImpl::destroy(v6, v4);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)_WKResourceLoadInfo;
    [(_WKResourceLoadInfo *)&v7 dealloc];
  }
}

- (unint64_t)resourceLoadID
{
  return *(void *)&self->_info.data.__lx[16];
}

- (_WKFrameHandle)frame
{
  if (!self->_info.data.__lx[40]) {
    return 0;
  }
  uint64_t v3 = *(void *)&self->_info.data.__lx[24];
  uint64_t v2 = *(void *)&self->_info.data.__lx[32];
  uint64_t v4 = API::Object::newObject(0x28uLL, 11);
  *(void *)uint64_t v4 = &unk_1EE9D1E28;
  WebKit::InitializeWebKit2((WebKit *)v4);
  *(void *)uint64_t v4 = &unk_1EE9B3E30;
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  *(unsigned char *)(v4 + 32) = 0;
  v5 = *(const void **)(v4 + 8);
  if (v5) {
    CFRetain(*(CFTypeRef *)(v4 + 8));
  }
  v6 = (id)CFMakeCollectable(v5);
  CFRelease(*(CFTypeRef *)(v4 + 8));
  return v6;
}

- (_WKFrameHandle)parentFrame
{
  if (!self[1]._info.data.__lx[8]) {
    return 0;
  }
  Class isa = self[1].super.isa;
  uint64_t v2 = *(void *)self[1]._info.data.__lx;
  uint64_t v4 = API::Object::newObject(0x28uLL, 11);
  *(void *)uint64_t v4 = &unk_1EE9D1E28;
  WebKit::InitializeWebKit2((WebKit *)v4);
  *(void *)uint64_t v4 = &unk_1EE9B3E30;
  *(void *)(v4 + 16) = isa;
  *(void *)(v4 + 24) = v2;
  *(unsigned char *)(v4 + 32) = 0;
  v5 = *(const void **)(v4 + 8);
  if (v5) {
    CFRetain(*(CFTypeRef *)(v4 + 8));
  }
  v6 = (id)CFMakeCollectable(v5);
  CFRelease(*(CFTypeRef *)(v4 + 8));
  return v6;
}

- (NSURL)originalURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (NSString)originalHTTPMethod
{
  if (*(void *)self[2]._info.data.__lx) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (NSDate)eventTimestamp
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:*(double *)&self[2]._info.data.__lx[8]];
}

- (BOOL)loadedFromCache
{
  return self[2]._info.data.__lx[16];
}

- (int64_t)resourceType
{
  unint64_t v2 = (char)self[2]._info.data.__lx[17];
  if (v2 > 0xE) {
    return -1;
  }
  else {
    return qword_1994F65B0[v2];
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_info;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WKResourceLoadInfo)initWithCoder:(id)a3
{
  v35.receiver = self;
  v35.super_class = (Class)_WKResourceLoadInfo;
  uint64_t v4 = [(_WKResourceLoadInfo *)&v35 init];
  if (!v4) {
    return v4;
  }
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"resourceLoadID"];
  if (!v5) {
    goto LABEL_12;
  }
  v6 = (void *)v5;
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"frame"];
  if (!v7) {
    goto LABEL_12;
  }
  uint64_t v8 = v7;
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"parentFrame"];
  uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"originalURL"];
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = v10;
  uint64_t v12 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"originalHTTPMethod"];
  if (!v12
    || (uint64_t v13 = v12,
        (uint64_t v14 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"eventTimestamp"]) == 0)
    || (v15 = (void *)v14,
        (uint64_t v16 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"loadedFromCache"]) == 0)
    || (v17 = (void *)v16, (uint64_t v18 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"type"]) == 0))
  {
LABEL_12:

    return 0;
  }
  v19 = (void *)v18;
  uint64_t v26 = [v6 unsignedLongLongValue];
  if (v26 != -1)
  {
    long long v27 = *(_OWORD *)(v8 + 24);
    char v20 = 1;
    char v28 = 1;
    if (v9)
    {
      long long v29 = *(_OWORD *)(v9 + 24);
    }
    else
    {
      char v20 = 0;
      LOBYTE(v29) = 0;
    }
    char v30 = v20;
    MEMORY[0x19972E8A0](&v31, v11);
    MEMORY[0x19972EAD0](v32, v13);
    [v15 timeIntervalSince1970];
    v32[1] = v22;
    char v33 = [v17 BOOLValue];
    char v34 = [v19 unsignedCharValue];
    *(void *)(API::ResourceLoadInfo::ResourceLoadInfo((uint64_t)[(_WKResourceLoadInfo *)v4 _apiObject], (long long *)&v26)+ 8) = v4;
    v24 = v32[0];
    v32[0] = 0;
    if (v24)
    {
      if (*(_DWORD *)v24 == 2) {
        WTF::StringImpl::destroy(v24, v23);
      }
      else {
        *(_DWORD *)v24 -= 2;
      }
    }
    v25 = v31;
    v31 = 0;
    if (v25)
    {
      if (*(_DWORD *)v25 == 2) {
        WTF::StringImpl::destroy(v25, v23);
      }
      else {
        *(_DWORD *)v25 -= 2;
      }
    }
    return v4;
  }
  result = (_WKResourceLoadInfo *)151;
  __break(0xC471u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_WKResourceLoadInfo resourceLoadID](self, "resourceLoadID")), @"resourceLoadID");
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKResourceLoadInfo frame](self, "frame"), @"frame");
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKResourceLoadInfo parentFrame](self, "parentFrame"), @"parentFrame");
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKResourceLoadInfo originalURL](self, "originalURL"), @"originalURL");
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKResourceLoadInfo originalHTTPMethod](self, "originalHTTPMethod"), @"originalHTTPMethod");
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKResourceLoadInfo eventTimestamp](self, "eventTimestamp"), @"eventTimestamp");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[_WKResourceLoadInfo loadedFromCache](self, "loadedFromCache")), @"loadedFromCache");
  uint64_t v5 = [NSNumber numberWithUnsignedChar:self[2]._info.data.__lx[17]];

  [a3 encodeObject:v5 forKey:@"type"];
}

@end