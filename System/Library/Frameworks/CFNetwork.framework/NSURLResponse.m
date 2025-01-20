@interface NSURLResponse
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (__CFString)getObjectKeyWithIndex:(uint64_t)a1;
+ (id)_responseWithCFURLResponse:(_CFURLResponse *)a3;
- (BOOL)_mustRevalidate;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSDictionary)allHeaderFields;
- (NSString)MIMEType;
- (NSString)suggestedFilename;
- (NSURL)URL;
- (NSURLResponse)init;
- (NSURLResponse)initWithCoder:(id)a3;
- (NSURLResponse)initWithURL:(NSURL *)URL MIMEType:(NSString *)MIMEType expectedContentLength:(NSInteger)length textEncodingName:(NSString *)name;
- (URLResponse)_cf_resp_data;
- (URLResponse)_inner;
- (double)_freshnessLifetime;
- (id)_initWithCFURLResponse:(_CFURLResponse *)a3;
- (id)_initWithInternal:(id)a3;
- (id)_lastModifiedDate;
- (id)_peerCertificateChain;
- (id)description;
- (int64_t)statusCode;
- (void)_setExpectedContentLength:(int64_t)a3;
- (void)_setMIMEType:(id)a3;
- (void)_setSSLCertificateContext:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)set_cf_resp_data:(URLResponse *)a3;
@end

@implementation NSURLResponse

- (NSString)MIMEType
{
  v2 = [(NSURLResponse *)self _inner];

  return (NSString *)URLResponse::getMIMEType(v2);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLResponse;
  return (id)objc_msgSend(-[NSURLResponse description](&v3, sel_description), "stringByAppendingFormat:", @" { URL: %@ }", -[NSURLResponse URL](self, "URL"));
}

- (NSURL)URL
{
  return (NSURL *)[(NSURLResponse *)self _inner][8];
}

- (NSURLResponse)initWithCoder:(id)a3
{
  int v22 = 0;
  [a3 decodeValueOfObjCType:"i" at:&v22 size:4];
  if (v22 <= 6) {
    goto LABEL_17;
  }
  if (v22 == 7)
  {
    uint64_t v5 = [a3 decodeObject];
    if (!v5 || (self, (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v6 = [a3 decodeObject];
      if (v6)
      {
        uint64_t v7 = v6;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = [a3 decodeObject];
          if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            uint64_t v21 = 0;
            [a3 decodeValueOfObjCType:"q" at:&v21 size:8];
            v9 = [(NSURLResponse *)self initWithURL:v5 MIMEType:v7 expectedContentLength:v21 textEncodingName:v8];
            uint64_t v20 = 0;
            [a3 decodeValueOfObjCType:"d" at:&v20 size:8];
            uint64_t v10 = [(NSURLResponse *)v9 _inner];
            *(void *)(v10 + 40) = v20;
            uint64_t v11 = *(void *)(v10 + 88);
            if (v11) {
              *(_WORD *)(v11 + 297) |= 0x1000u;
            }
            return v9;
          }
        }
      }
    }
LABEL_17:

    return 0;
  }
  LODWORD(v21) = 0;
  LODWORD(v20) = 0;
  if ([a3 requiresSecureCoding])
  {
    if (-[NSURLResponse initWithCoder:]::onceToken != -1) {
      dispatch_once(&-[NSURLResponse initWithCoder:]::onceToken, &__block_literal_global_271);
    }
    v12 = (void *)[a3 allowedClasses];
    uint64_t v13 = [v12 setByAddingObjectsFromSet:-[NSURLResponse initWithCoder:]::plistClasses];
  }
  else
  {
    uint64_t v13 = 0;
  }
  [a3 decodeValueOfObjCType:"i" at:&v21 size:4];
  [a3 decodeValueOfObjCType:"i" at:&v20 size:4];
  if (v20 > 7) {
    goto LABEL_17;
  }
  v15 = (const void **)malloc_type_malloc(8 * v20, 0xC0040B8AA526DuLL);
  if ((int)v20 < 1) {
    goto LABEL_29;
  }
  int64_t v16 = 0;
  int v17 = 0;
  do
  {
    if ([a3 requiresSecureCoding]) {
      uint64_t v18 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v13, +[NSURLResponse getObjectKeyWithIndex:]((uint64_t)NSURLResponse, v16));
    }
    else {
      uint64_t v18 = [a3 decodeObject];
    }
    v15[v16] = (const void *)v18;
    if (v18) {
      ++v17;
    }
    ++v16;
  }
  while (v16 < (int)v20);
  if (v17)
  {
    v19 = (const void *)_CFURLResponseCreateFromArchiveList(v18, (int)v21, v15, (int)v20);
    v9 = [(NSURLResponse *)self _initWithCFURLResponse:v19];
    CFRelease(v19);
  }
  else
  {
LABEL_29:

    v9 = 0;
  }
  free(v15);
  return v9;
}

+ (__CFString)getObjectKeyWithIndex:(uint64_t)a1
{
  if (a2 >= 0x1F) {
    __assert_rtn("+[NSURLResponse getObjectKeyWithIndex:]", "NSURLResponse.mm", 210, "false");
  }
  return _objectKeys[a2];
}

+ (id)_responseWithCFURLResponse:(_CFURLResponse *)a3
{
  uint64_t v4 = [(_CFURLResponse *)a3 _inner];
  uint64_t v5 = off_1E5250D18;
  if (*(void *)(v4 + 88)) {
    uint64_t v5 = &off_1E5250BC8;
  }
  uint64_t v6 = (void *)[objc_alloc(*v5) _initWithCFURLResponse:a3];

  return v6;
}

- (id)_initWithCFURLResponse:(_CFURLResponse *)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSURLResponse;
    uint64_t v4 = [(NSURLResponse *)&v6 init];
    if (v4) {
      v4->_internal = (NSURLResponseInternal *)*((id *)a3 + 1);
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() && (sel_isEqual(a3, sel_statusCode) || sel_isEqual(a3, sel_allHeaderFields))) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)NSURLResponse;
  return [(NSURLResponse *)&v7 respondsToSelector:a3];
}

- (URLResponse)_inner
{
  return [(NSURLResponseInternal *)self->_internal _inner];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLResponse;
  [(NSURLResponse *)&v3 dealloc];
}

- (id)_initWithInternal:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSURLResponse;
  uint64_t v4 = [(NSURLResponse *)&v6 init];
  if (v4) {
    v4->_internal = (NSURLResponseInternal *)a3;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int v13 = 8;
  CFAllocatorRef Default = CFAllocatorGetDefault();
  if (self)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v10 = 0;
    URLResponse::createArchiveList([(NSURLResponse *)self _inner], Default, &v12, (const void ***)&v10, &v11);
    self = v10;
    uint64_t v6 = v11;
    int v7 = v12;
  }
  else
  {
    int v7 = 0;
    uint64_t v6 = 7;
  }
  [a3 encodeValueOfObjCType:"i" at:&v13];
  int v13 = v7;
  [a3 encodeValueOfObjCType:"i" at:&v13];
  int v13 = v6;
  [a3 encodeValueOfObjCType:"i" at:&v13];
  if (v6 >= 1)
  {
    unint64_t v8 = 0;
    while (1)
    {
      v9 = (const void *)*((void *)&self->super.isa + v8);
      if ([a3 requiresSecureCoding])
      {
        if ([a3 allowsKeyedCoding]) {
          break;
        }
      }
      [a3 encodeObject:v9];
      if (v9) {
        goto LABEL_11;
      }
LABEL_12:
      if (v6 == ++v8) {
        goto LABEL_13;
      }
    }
    objc_msgSend(a3, "encodeObject:forKey:", v9, +[NSURLResponse getObjectKeyWithIndex:]((uint64_t)NSURLResponse, v8));
    if (!v9) {
      goto LABEL_12;
    }
LABEL_11:
    CFRelease(v9);
    goto LABEL_12;
  }
LABEL_13:
  CFAllocatorDeallocate(Default, self);
}

id __31__NSURLResponse_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id result = (id)objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  -[NSURLResponse initWithCoder:]::plistClasses = (uint64_t)result;
  return result;
}

- (void)set_cf_resp_data:(URLResponse *)a3
{
  self->__cf_resp_data = a3;
}

- (URLResponse)_cf_resp_data
{
  return self->__cf_resp_data;
}

- (NSDictionary)allHeaderFields
{
  if (dyld_program_sdk_at_least())
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_10_5521);
    }
    uint64_t v2 = __CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_fault_impl(&dword_184085000, v2, OS_LOG_TYPE_FAULT, "-allHeaderFields called on NSURLResponse", v4, 2u);
    }
  }
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (int64_t)statusCode
{
  if (dyld_program_sdk_at_least())
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_10_5521);
    }
    uint64_t v2 = __CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_fault_impl(&dword_184085000, v2, OS_LOG_TYPE_FAULT, "-statusCode called on NSURLResponse", v4, 2u);
    }
  }
  return 200;
}

- (NSString)suggestedFilename
{
  uint64_t v2 = (__CFString *)URLResponse::copySuggestedFilename([(NSURLResponse *)self _inner]);

  return (NSString *)v2;
}

- (NSURLResponse)init
{
  return [(NSURLResponse *)self initWithURL:0 MIMEType:0 expectedContentLength:-1 textEncodingName:0];
}

- (NSURLResponse)initWithURL:(NSURL *)URL MIMEType:(NSString *)MIMEType expectedContentLength:(NSInteger)length textEncodingName:(NSString *)name
{
  v19.receiver = self;
  v19.super_class = (Class)NSURLResponse;
  uint64_t v10 = [(NSURLResponse *)&v19 init];
  if (v10)
  {
    if (!MIMEType) {
      MIMEType = (NSString *)@"application/octet-stream";
    }
    uint64_t v11 = objc_alloc_init(NSURLResponseInternal);
    v10->_internal = v11;
    URLResponse::initialize((uint64_t)[(NSURLResponseInternal *)v11 _inner], URL, (const __CFString *)MIMEType, length, (const __CFString *)name, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [(NSURLResponseInternal *)v10->_internal _inner];
      if (!*(void *)(v12 + 88))
      {
        uint64_t v13 = v12;
        CFHTTPMessageRef Empty = CFHTTPMessageCreateEmpty((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
        if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
          dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
        }
        uint64_t Instance = _CFRuntimeCreateInstance();
        uint64_t v16 = Instance;
        if (Instance)
        {
          *(_OWORD *)(Instance + 16) = 0u;
          uint64_t v16 = Instance + 16;
          *(void *)(Instance + 352) = 0;
          *(_OWORD *)(Instance + 320) = 0u;
          *(_OWORD *)(Instance + 336) = 0u;
          *(_OWORD *)(Instance + 288) = 0u;
          *(_OWORD *)(Instance + 304) = 0u;
          *(_OWORD *)(Instance + 256) = 0u;
          *(_OWORD *)(Instance + 272) = 0u;
          *(_OWORD *)(Instance + 224) = 0u;
          *(_OWORD *)(Instance + 240) = 0u;
          *(_OWORD *)(Instance + 192) = 0u;
          *(_OWORD *)(Instance + 208) = 0u;
          *(_OWORD *)(Instance + 160) = 0u;
          *(_OWORD *)(Instance + 176) = 0u;
          *(_OWORD *)(Instance + 128) = 0u;
          *(_OWORD *)(Instance + 144) = 0u;
          *(_OWORD *)(Instance + 96) = 0u;
          *(_OWORD *)(Instance + 112) = 0u;
          *(_OWORD *)(Instance + 64) = 0u;
          *(_OWORD *)(Instance + 80) = 0u;
          *(_OWORD *)(Instance + 32) = 0u;
          *(_OWORD *)(Instance + 48) = 0u;
        }
        if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
          dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
        }
        if (*((unsigned char *)Empty + 40)) {
          int v17 = (const char **)((char *)Empty + 16);
        }
        else {
          int v17 = 0;
        }
        HTTPResponseMessage::HTTPResponseMessage((HTTPResponseMessage *)v16, v17);
        *(void *)uint64_t v16 = &unk_1ECF9BD60;
        *(void *)(v16 + 8) = &unk_1ECF9BDD0;
        *(void *)(v16 + 16) = &unk_1ECF9BDF0;
        *(_WORD *)(v16 + 297) = 0;
        *(unsigned char *)(v16 + 299) = 0;
        *(void *)(v13 + 88) = v16;
        *(_WORD *)(v16 + 297) |= 0x200u;
        *(_WORD *)(*(void *)(v13 + 88) + 297) |= 0x4000u;
        *(_WORD *)(*(void *)(v13 + 88) + 297) |= 0x100u;
        *(_WORD *)(*(void *)(v13 + 88) + 297) |= 0x2000u;
        CFRelease(Empty);
      }
    }
  }
  return v10;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if ((id)objc_opt_class() == a1 && (sel_isEqual(a3, sel_statusCode) || sel_isEqual(a3, sel_allHeaderFields))) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSURLResponse;
  return objc_msgSendSuper2(&v6, sel_instancesRespondToSelector_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_peerCertificateChain
{
  return 0;
}

- (double)_freshnessLifetime
{
  uint64_t v2 = [(NSURLResponse *)self _inner];
  if (!v2->fHTTP) {
    return 1.79769313e308;
  }

  URLResponse::freshnessLifetimeForResponse(v2);
  return result;
}

- (BOOL)_mustRevalidate
{
  return _CFURLResponseMustRevalidate(self) != 0;
}

- (id)_lastModifiedDate
{
  if (URLResponse::getLastModifiedDate([(NSURLResponse *)self _inner]) == 0.0) {
    return 0;
  }
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9C8];

  return (id)objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
}

- (void)_setSSLCertificateContext:(id)a3
{
  uint64_t v4 = [(NSURLResponse *)self _inner];
  fSSLCertContext = v4->fSSLCertContext;
  if (fSSLCertContext) {
    CFRelease(fSSLCertContext);
  }
  if (a3) {
    objc_super v6 = (__CFDictionary *)CFRetain(a3);
  }
  else {
    objc_super v6 = 0;
  }
  v4->fSSLCertContext = v6;
}

- (void)_setMIMEType:(id)a3
{
}

- (void)_setExpectedContentLength:(int64_t)a3
{
  uint64_t v4 = [(NSURLResponse *)self _inner];
  v4->fExpectedContentLength = a3;
  fHTTP = v4->fHTTP;
  if (fHTTP)
  {
    *(_WORD *)((char *)fHTTP + 297) |= 0x100u;
    *(_WORD *)((char *)v4->fHTTP + 297) |= 0x2000u;
  }
}

@end