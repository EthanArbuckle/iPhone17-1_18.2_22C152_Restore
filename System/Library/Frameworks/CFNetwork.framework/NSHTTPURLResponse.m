@interface NSHTTPURLResponse
+ (BOOL)isErrorStatusCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (NSString)localizedStringForStatusCode:(NSInteger)statusCode;
- (NSDictionary)allHeaderFields;
- (NSHTTPURLResponse)initWithCoder:(id)a3;
- (NSHTTPURLResponse)initWithHTTPPropertyList:(id)a3 URL:(id)a4;
- (NSHTTPURLResponse)initWithURL:(NSURL *)url statusCode:(NSInteger)statusCode HTTPVersion:(NSString *)HTTPVersion headerFields:(NSDictionary *)headerFields;
- (NSHTTPURLResponse)initWithURL:(id)a3 statusCode:(int64_t)a4 headerFields:(id)a5 requestTime:(double)a6;
- (NSInteger)statusCode;
- (NSString)valueForHTTPHeaderField:(NSString *)field;
- (id)HTTPPropertyList;
- (id)_allHTTPHeaderFieldsAsArrays;
- (id)_initWithCFURLResponse:(_CFURLResponse *)a3;
- (id)_peerCertificateChain;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSHTTPURLResponse

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSHTTPURLResponse;
  return (id)objc_msgSend(-[NSURLResponse description](&v3, sel_description), "stringByAppendingFormat:", @" { Status Code: %ld, Headers %@ }", -[NSHTTPURLResponse statusCode](self, "statusCode"), -[NSHTTPURLResponse _allHTTPHeaderFieldsAsArrays](self, "_allHTTPHeaderFieldsAsArrays"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)allHeaderFields
{
  uint64_t v2 = (uint64_t)[(NSURLResponse *)self _inner][88];
  if (v2)
  {
    CFDictionaryRef v3 = CFHTTPMessageCopyAllHeaderFields((CFHTTPMessageRef)(v2 - 16));
    if (v3)
    {
      CFDictionaryRef v4 = v3;
      v5 = (NSDictionary *)(id)[(__CFDictionary *)v3 copy];
      CFRelease(v4);
      if (v5) {
        return v5;
      }
    }
  }
  v7 = (void *)MEMORY[0x1E4F1C9E8];

  return (NSDictionary *)[v7 dictionary];
}

- (id)_allHTTPHeaderFieldsAsArrays
{
  if (self->super._internal
    && ((v2 = (uint64_t)[(NSURLResponse *)self _inner][88]) != 0 ? (uint64_t v3 = v2 - 16) : (uint64_t v3 = 0), v2))
  {
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
    }
    CFDictionaryRef v4 = HTTPMessage::copyAsMultiValueDict((HTTPMessage *)(v3 + 16));
  }
  else
  {
    CFDictionaryRef v4 = 0;
  }

  return v4;
}

- (id)_initWithCFURLResponse:(_CFURLResponse *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSHTTPURLResponse;
  uint64_t v3 = [(NSURLResponse *)&v5 _initWithCFURLResponse:a3];
  if (v3) {
    v3[3] = objc_alloc_init(NSHTTPURLResponseInternal);
  }
  return v3;
}

- (NSString)valueForHTTPHeaderField:(NSString *)field
{
  uint64_t v4 = (uint64_t)[(NSURLResponse *)self _inner][88];
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = CFHTTPMessageCopyHeaderFieldValue((CFHTTPMessageRef)(v4 - 16), (CFStringRef)field);
  v6 = (void *)CFMakeCollectable(v5);

  return (NSString *)v6;
}

- (NSInteger)statusCode
{
  uint64_t v2 = (uint64_t)[(NSURLResponse *)self _inner][88];
  if (!v2) {
    return 0;
  }

  return CFHTTPMessageGetResponseStatusCode((CFHTTPMessageRef)(v2 - 16));
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSHTTPURLResponse;
  [(NSURLResponse *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  char v5 = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSHTTPURLResponse;
  -[NSURLResponse encodeWithCoder:](&v4, sel_encodeWithCoder_);
  int v6 = 9;
  [a3 encodeValueOfObjCType:"i" at:&v6];
  [a3 encodeValueOfObjCType:"B" at:&v5];
}

+ (NSString)localizedStringForStatusCode:(NSInteger)statusCode
{
  if ((unint64_t)(statusCode - 601) < 0xFFFFFFFFFFFFFE0BLL) {
    return (NSString *)@"server error";
  }
  if ((unint64_t)statusCode > 0xC7)
  {
    if ((unint64_t)statusCode > 0x12B)
    {
      if ((unint64_t)statusCode > 0x18F)
      {
        if ((unint64_t)statusCode > 0x1F3)
        {
          if ((unint64_t)statusCode > 0x257) {
            return (NSString *)&stru_1ECFAD558;
          }
          NSInteger v5 = statusCode - 500;
          if ((unint64_t)(statusCode - 500) >= 6) {
            return (NSString *)@"server error";
          }
          int v6 = off_1E5252B28;
        }
        else
        {
          NSInteger v5 = statusCode - 400;
          if ((unint64_t)(statusCode - 400) >= 0x12) {
            return (NSString *)@"client error";
          }
          int v6 = off_1E5252A98;
        }
      }
      else
      {
        NSInteger v5 = statusCode - 300;
        if ((unint64_t)(statusCode - 300) >= 8) {
          return (NSString *)@"redirected";
        }
        int v6 = off_1E5252A58;
      }
    }
    else
    {
      NSInteger v5 = statusCode - 200;
      if ((unint64_t)(statusCode - 200) >= 7) {
        return (NSString *)@"success";
      }
      int v6 = off_1E5252A20;
    }
    return &v6[v5]->isa;
  }
  objc_super v4 = @"informational";
  if (statusCode == 101) {
    objc_super v4 = @"switching protocols";
  }
  if (statusCode == 100) {
    return (NSString *)@"continue";
  }
  else {
    return &v4->isa;
  }
}

- (NSHTTPURLResponse)initWithCoder:(id)a3
{
  v27.receiver = self;
  v27.super_class = (Class)NSHTTPURLResponse;
  objc_super v4 = -[NSURLResponse initWithCoder:](&v27, sel_initWithCoder_);
  if (v4)
  {
    unsigned int v26 = 0;
    [a3 decodeValueOfObjCType:"i" at:&v26 size:4];
    if (v26 - 10 < 0xFFFFFFFC)
    {
LABEL_3:

      return 0;
    }
    if (v26 > 7)
    {
      if (!v4->_httpInternal) {
        v4->_httpInternal = objc_alloc_init(NSHTTPURLResponseInternal);
      }
      LOBYTE(v25) = 0;
      [a3 decodeValueOfObjCType:"B" at:&v25 size:1];
    }
    else
    {
      NSInteger v5 = (const void *)[a3 decodeObject];
      if (!v5) {
        goto LABEL_3;
      }
      uint64_t v6 = (uint64_t)v5;
      CFTypeID v7 = CFGetTypeID(v5);
      if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
      {
        CFTypeID v20 = v7;
        dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
        CFTypeID v7 = v20;
      }
      if (v7 != *(void *)(HTTPMessage::Class(void)::sClass_OBJTYPE + 96)) {
        goto LABEL_3;
      }
      uint64_t v25 = 0;
      __int16 v24 = 0;
      char v23 = 0;
      uint64_t v22 = 0;
      char v21 = 0;
      [a3 decodeValueOfObjCType:"d" at:&v25 size:8];
      [a3 decodeValueOfObjCType:"d" at:&v22 size:8];
      [a3 decodeValueOfObjCType:"B" at:&v21 size:1];
      [a3 decodeValueOfObjCType:"B" at:&v23 size:1];
      [a3 decodeValueOfObjCType:"B" at:(char *)&v24 + 1 size:1];
      [a3 decodeValueOfObjCType:"B" at:&v24 size:1];
      if (!v4->_httpInternal) {
        v4->_httpInternal = objc_alloc_init(NSHTTPURLResponseInternal);
      }
      if (v26 == 7) {
        [a3 decodeValueOfObjCType:"B" at:&v21 size:1];
      }
      v8 = (const void *)[(NSURLResponse *)v4 _inner][8];
      uint64_t v9 = [(NSURLResponse *)v4 _inner];
      v10 = (id *)CFURLResponseCreateWithHTTPResponse(v9, v8, v6, *(_DWORD *)(v9 + 72));
      uint64_t v11 = v25;
      *(void *)([v10 _inner] + 48) = v11;
      if ((_BYTE)v24)
      {
        uint64_t ExpectedContentLength = CFURLResponseGetExpectedContentLength(v4);
        uint64_t v13 = [v10 _inner];
        *(void *)(v13 + 32) = ExpectedContentLength;
        uint64_t v14 = *(void *)(v13 + 88);
        if (v14)
        {
          *(_WORD *)(v14 + 297) |= 0x100u;
          *(_WORD *)(*(void *)(v13 + 88) + 297) |= 0x2000u;
        }
      }
      if (HIBYTE(v24))
      {
        MIMEType = URLResponse::getMIMEType([(NSURLResponse *)v4 _inner]);
        CFURLResponseSetMIMEType(v10, MIMEType);
      }
      if (v23)
      {
        double ExpirationTime = CFURLResponseGetExpirationTime(v4);
        uint64_t v17 = [v10 _inner];
        *(double *)(v17 + 40) = ExpirationTime;
        uint64_t v18 = *(void *)(v17 + 88);
        if (v18) {
          *(_WORD *)(v18 + 297) |= 0x1000u;
        }
      }
      v4->super._internal = (NSURLResponseInternal *)v10[1];
    }
  }
  return v4;
}

- (id)_peerCertificateChain
{
  CFDictionaryRef v2 = (const __CFDictionary *)[(NSURLResponse *)self _inner][64];
  if (!v2) {
    return 0;
  }
  Value = CFDictionaryGetValue(v2, @"kCFStreamPropertySSLPeerCertificates");
  if (!Value) {
    return 0;
  }
  objc_super v4 = Value;
  NSInteger v5 = (void *)MEMORY[0x1E4F1C978];

  return (id)[v5 arrayWithArray:v4];
}

- (NSHTTPURLResponse)initWithURL:(NSURL *)url statusCode:(NSInteger)statusCode HTTPVersion:(NSString *)HTTPVersion headerFields:(NSDictionary *)headerFields
{
  ResponseNoParser = _CFHTTPMessageCreateResponseNoParser(*MEMORY[0x1E4F1CF80], statusCode, 0, (const __CFString *)HTTPVersion);
  if (ResponseNoParser)
  {
    v10 = (__CFHTTPMessage *)ResponseNoParser;
    if (headerFields)
    {
      ResponseNoParser = [(NSDictionary *)headerFields count];
      if (ResponseNoParser) {
        _CFHTTPMessageSetMultipleHeaderFields(v10, (CFDictionaryRef)headerFields);
      }
    }
    id v11 = CFURLResponseCreateWithHTTPResponse((uint64_t)ResponseNoParser, url, (uint64_t)v10, 0);
    if (v11)
    {
      v12 = v11;
      uint64_t v13 = [(NSHTTPURLResponse *)self _initWithCFURLResponse:v11];
      CFRelease(v12);
    }
    else
    {

      uint64_t v13 = 0;
    }
    CFRelease(v10);
  }
  else
  {

    return 0;
  }
  return v13;
}

- (NSHTTPURLResponse)initWithURL:(id)a3 statusCode:(int64_t)a4 headerFields:(id)a5 requestTime:(double)a6
{
  return [(NSHTTPURLResponse *)self initWithURL:a3, a4, @"HTTP/1.1", a5, a6 statusCode HTTPVersion headerFields];
}

+ (BOOL)isErrorStatusCode:(int64_t)a3
{
  return (unint64_t)(a3 - 400) < 0xFFFFFFFFFFFFFED4;
}

- (id)HTTPPropertyList
{
  v23[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v19 = __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke;
  CFTypeID v20 = &unk_1E5258228;
  char v21 = v3;
  uint64_t v4 = (uint64_t)[(NSURLResponse *)self _inner][88];
  if (v4) {
    uint64_t v5 = v4 - 16;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4)
  {
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
    }
    if (*(unsigned char *)(v5 + 40))
    {
      uint64_t v6 = *(void *)(v5 + 152);
      if (v6) {
        [v3 setObject:v6 forKeyedSubscript:@"statusDescription"];
      }
    }
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v15 = __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke_2;
  v16 = &unk_1E5258228;
  id v17 = v7;
  CFIndex ResponseStatusCode = CFHTTPMessageGetResponseStatusCode((CFHTTPMessageRef)v5);
  v23[0] = @":status";
  v22[0] = @"name";
  v22[1] = @"value";
  v23[1] = objc_msgSend(NSString, "stringWithFormat:", @"%ld", ResponseStatusCode);
  objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
  if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
    dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
  }
  if (v4) {
    uint64_t v9 = v5 + 16;
  }
  else {
    uint64_t v9 = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke_3;
  v13[3] = &unk_1E5256C18;
  v13[4] = v7;
  (*(void (**)(uint64_t, void *))(*(void *)v9 + 56))(v9, v13);
  v10 = (void *)[v7 copy];
  [v3 setObject:v10 forKeyedSubscript:@"headerFields"];

  id v11 = (id)[v3 copy];
  v15((uint64_t)v14);
  v19((uint64_t)v18);
  return v11;
}

void __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke(uint64_t a1)
{
}

void __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke_2(uint64_t a1)
{
}

uint64_t __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = *(void **)(a1 + 32);
  v5[0] = @"name";
  v5[1] = @"value";
  v6[0] = a2;
  v6[1] = a3;
  return objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, v5, 2));
}

- (NSHTTPURLResponse)initWithHTTPPropertyList:(id)a3 URL:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (const void *)[a3 objectForKeyedSubscript:@"statusDescription"];
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = (void *)[a3 objectForKeyedSubscript:@"headerFields"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v8 count])
        {
          unint64_t v9 = 0;
          uint64_t v10 = -1;
          while (1)
          {
            id v11 = (void *)[v8 objectAtIndexedSubscript:v9];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            v12 = (void *)[v11 objectForKeyedSubscript:@"name"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            uint64_t v13 = (void *)[v11 objectForKeyedSubscript:@"value"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            if ([v12 hasPrefix:@":"])
            {
              if ([v12 isEqualToString:@":status"]) {
                uint64_t v10 = [v13 integerValue];
              }
              if (++v9 < [v8 count]) {
                continue;
              }
            }
            if (v10 == -1) {
              break;
            }
            ResponseNoParser = _CFHTTPMessageCreateResponseNoParser(*MEMORY[0x1E4F1CF80], v10, v7, @"HTTP/1.1");
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            uint64_t v22 = v25;
            v25[0] = __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke;
            v25[1] = &__block_descriptor_40_e5_v8__0l;
            v25[2] = ResponseNoParser;
            while (1)
            {
              unint64_t v15 = objc_msgSend(v8, "count", v22);
              if (v9 >= v15)
              {
                id v21 = CFURLResponseCreateWithHTTPResponse(v15, a4, (uint64_t)ResponseNoParser, 0);
                v23[0] = MEMORY[0x1E4F143A8];
                v23[1] = 3221225472;
                v23[2] = __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke_2;
                void v23[3] = &__block_descriptor_40_e5_v8__0l;
                v23[4] = v21;
                v19 = [(NSHTTPURLResponse *)self _initWithCFURLResponse:v21];
                __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke_2((uint64_t)v23);
                goto LABEL_27;
              }
              v16 = (void *)[v8 objectAtIndexedSubscript:v9];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              id v17 = (__CFString *)[v16 objectForKeyedSubscript:@"name"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              uint64_t v18 = (__CFString *)[v16 objectForKeyedSubscript:@"value"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0
                || ([(__CFString *)v17 hasPrefix:@":"] & 1) != 0)
              {
                break;
              }
              _CFHTTPMessageAddHeaderFieldValue((uint64_t)ResponseNoParser, v17, v18);
              ++v9;
            }

            v19 = 0;
LABEL_27:
            ((void (*)(void *))v25[0])(v24);
            return v19;
          }
        }
      }
    }
  }

  return 0;
}

void __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke_2(uint64_t a1)
{
}

@end