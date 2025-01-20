@interface NFCNDEFPayload
+ (BOOL)supportsSecureCoding;
+ (NFCNDEFPayload)wellKnowTypeTextPayloadWithString:(NSString *)text locale:(NSLocale *)locale;
+ (NFCNDEFPayload)wellKnownTypeTextPayloadWithString:(NSString *)text locale:(NSLocale *)locale;
+ (NFCNDEFPayload)wellKnownTypeURIPayloadWithString:(NSString *)uri;
+ (NFCNDEFPayload)wellKnownTypeURIPayloadWithURL:(NSURL *)url;
- (NFCNDEFPayload)initWithCoder:(id)a3;
- (NFCNDEFPayload)initWithFormat:(NFCTypeNameFormat)format type:(NSData *)type identifier:(NSData *)identifier payload:(NSData *)payload;
- (NFCNDEFPayload)initWithFormatType:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6 chunkSize:(unint64_t)a7;
- (NFCTypeNameFormat)typeNameFormat;
- (NSData)identifier;
- (NSData)payload;
- (NSData)type;
- (NSString)wellKnownTypeTextPayloadWithLocale:(NSLocale *)locale;
- (NSURL)wellKnownTypeURIPayload;
- (id)asData;
- (id)description;
- (id)resolveURIString:(id)a3;
- (unint64_t)chunkSize;
- (void)encodeWithCoder:(id)a3;
- (void)setChunkSize:(unint64_t)a3;
- (void)setIdentifier:(NSData *)identifier;
- (void)setPayload:(NSData *)payload;
- (void)setType:(NSData *)type;
- (void)setTypeNameFormat:(NFCTypeNameFormat)typeNameFormat;
@end

@implementation NFCNDEFPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFCNDEFPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFCNDEFPayload;
  v5 = [(NFCNDEFPayload *)&v13 init];
  if (v5)
  {
    v5->_typeNameFormat = [v4 decodeIntegerForKey:@"typeNameFormat"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
    payload = v5->_payload;
    v5->_payload = (NSData *)v10;

    v5->_chunkSize = [v4 decodeIntegerForKey:@"chunkSize"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t typeNameFormat = self->_typeNameFormat;
  id v5 = a3;
  [v5 encodeInteger:typeNameFormat forKey:@"typeNameFormat"];
  [v5 encodeObject:self->_type forKey:@"type"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_payload forKey:@"payload"];
  [v5 encodeInteger:self->_chunkSize forKey:@"chunkSize"];
}

- (NFCNDEFPayload)initWithFormat:(NFCTypeNameFormat)format type:(NSData *)type identifier:(NSData *)identifier payload:(NSData *)payload
{
  return [(NFCNDEFPayload *)self initWithFormatType:format type:type identifier:identifier payload:payload chunkSize:0];
}

- (NFCNDEFPayload)initWithFormatType:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6 chunkSize:(unint64_t)a7
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v40.receiver = self;
  v40.super_class = (Class)NFCNDEFPayload;
  v16 = [(NFCNDEFPayload *)&v40 init];
  if (!v16)
  {
LABEL_25:
    v30 = v16;
    goto LABEL_26;
  }
  uint64_t v17 = [v13 length];
  uint64_t v18 = [v14 length] + v17;
  if ((unint64_t)(v18 + [v15 length]) <= 0x20000)
  {
    v16->_uint64_t typeNameFormat = a3;
    if (v13) {
      uint64_t v31 = [v13 copy];
    }
    else {
      uint64_t v31 = objc_opt_new();
    }
    type = v16->_type;
    v16->_type = (NSData *)v31;

    if (v14) {
      uint64_t v33 = [v14 copy];
    }
    else {
      uint64_t v33 = objc_opt_new();
    }
    identifier = v16->_identifier;
    v16->_identifier = (NSData *)v33;

    if (v15) {
      uint64_t v35 = [v15 copy];
    }
    else {
      uint64_t v35 = objc_opt_new();
    }
    payload = v16->_payload;
    v16->_payload = (NSData *)v35;

    unint64_t v37 = 0xFFFFFFFFLL;
    if (a7 - 0x100000000 >= 0xFFFFFFFF00000001) {
      unint64_t v37 = a7;
    }
    v16->_chunkSize = v37;
    goto LABEL_25;
  }
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v20 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(v16);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(v16);
    Name = sel_getName(a2);
    uint64_t v24 = 45;
    if (isMetaClass) {
      uint64_t v24 = 43;
    }
    v20(3, "%c[%{public}s %{public}s]:%i NDEF payload exceeds the size limit", v24, ClassName, Name, 78);
  }
  v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = object_getClass(v16);
    if (class_isMetaClass(v26)) {
      int v27 = 43;
    }
    else {
      int v27 = 45;
    }
    v28 = object_getClassName(v16);
    v29 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v42 = v27;
    __int16 v43 = 2082;
    v44 = v28;
    __int16 v45 = 2082;
    v46 = v29;
    __int16 v47 = 1024;
    int v48 = 78;
    _os_log_impl(&dword_2214B8000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NDEF payload exceeds the size limit", buf, 0x22u);
  }

  v30 = 0;
LABEL_26:

  return v30;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"TNF=%d, Payload Type=%@, Payload ID=%@, Payload=%@, ChunkSize=%zu", self->_typeNameFormat, self->_type, self->_identifier, self->_payload, self->_chunkSize];

  return v2;
}

- (id)asData
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  int v31 = 0;
  id v4 = [MEMORY[0x263F8C698] recordsWithTNF:self->_typeNameFormat type:self->_type identifier:self->_identifier payload:self->_payload chunkSize:self->_chunkSize outError:&v31];
  if (v31)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v27 + 1) + 8 * i) asData];
          if (!v12)
          {
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              id v15 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              uint64_t v19 = 45;
              if (isMetaClass) {
                uint64_t v19 = 43;
              }
              v15(3, "%c[%{public}s %{public}s]:%i Record serialization error", v19, ClassName, Name, 110, (void)v27);
            }
            v20 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = object_getClass(self);
              if (class_isMetaClass(v21)) {
                int v22 = 43;
              }
              else {
                int v22 = 45;
              }
              v23 = object_getClassName(self);
              uint64_t v24 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              int v33 = v22;
              __int16 v34 = 2082;
              uint64_t v35 = v23;
              __int16 v36 = 2082;
              unint64_t v37 = v24;
              __int16 v38 = 1024;
              int v39 = 110;
              _os_log_impl(&dword_2214B8000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Record serialization error", buf, 0x22u);
            }

            id v5 = 0;
            goto LABEL_22;
          }
          id v13 = (void *)v12;
          [v6 appendData:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v40 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v5 = v6;
LABEL_22:
  }

  return v5;
}

- (unint64_t)chunkSize
{
  return self->_chunkSize;
}

- (void)setChunkSize:(unint64_t)a3
{
  self->_chunkSize = a3;
}

- (NFCTypeNameFormat)typeNameFormat
{
  return self->_typeNameFormat;
}

- (void)setTypeNameFormat:(NFCTypeNameFormat)typeNameFormat
{
  self->_uint64_t typeNameFormat = typeNameFormat;
}

- (NSData)type
{
  return self->_type;
}

- (void)setType:(NSData *)type
{
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(NSData *)identifier
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(NSData *)payload
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

+ (NFCNDEFPayload)wellKnownTypeURIPayloadWithString:(NSString *)uri
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = uri;
  uint64_t v6 = 0;
  while (1)
  {
    unint64_t v7 = [(NSString *)v5 length];
    uint64_t v8 = UrlPrefixMapping[v6];
    if (v7 >= [(__CFString *)v8 length]
      && -[NSString compare:options:range:](v5, "compare:options:range:", v8, 2, 0, [(__CFString *)v8 length]) == NSOrderedSame)
    {
      break;
    }
    if (++v6 == 35)
    {
      char v9 = 0;
      goto LABEL_7;
    }
  }
  uint64_t v10 = [(NSString *)v5 substringFromIndex:[(__CFString *)v8 length]];

  char v9 = v6 + 1;
  id v5 = (NSString *)v10;
LABEL_7:
  v11 = objc_opt_new();
  char v43 = v9;
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v43 length:1];
  [v11 appendData:v12];

  if (![(NSString *)v5 length])
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v20 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v24 = 45;
      if (isMetaClass) {
        uint64_t v24 = 43;
      }
      v20(3, "%c[%{public}s %{public}s]:%i Missing URI field", v24, ClassName, Name, 161);
    }
    v16 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    v25 = object_getClass(a1);
    if (class_isMetaClass(v25)) {
      int v26 = 43;
    }
    else {
      int v26 = 45;
    }
    long long v27 = object_getClassName(a1);
    long long v28 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v45 = v26;
    __int16 v46 = 2082;
    __int16 v47 = v27;
    __int16 v48 = 2082;
    uint64_t v49 = v28;
    __int16 v50 = 1024;
    int v51 = 161;
    long long v29 = "%c[%{public}s %{public}s]:%i Missing URI field";
    goto LABEL_28;
  }
  uint64_t v13 = [(NSString *)v5 dataUsingEncoding:4 allowLossyConversion:0];
  if (v13)
  {
    id v14 = (void *)v13;
    [v11 appendData:v13];

    id v15 = [NFCNDEFPayload alloc];
    v16 = [@"U" dataUsingEncoding:4];
    uint64_t v17 = objc_opt_new();
    uint64_t v18 = [(NFCNDEFPayload *)v15 initWithFormat:1 type:v16 identifier:v17 payload:v11];

    goto LABEL_30;
  }
  uint64_t v30 = NFLogGetLogger();
  if (v30)
  {
    int v31 = (void (*)(uint64_t, const char *, ...))v30;
    v32 = object_getClass(a1);
    BOOL v33 = class_isMetaClass(v32);
    __int16 v34 = object_getClassName(a1);
    int v42 = sel_getName(a2);
    uint64_t v35 = 45;
    if (v33) {
      uint64_t v35 = 43;
    }
    v31(3, "%c[%{public}s %{public}s]:%i Invalid UTF8 URI string", v35, v34, v42, 157);
  }
  v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    __int16 v36 = object_getClass(a1);
    if (class_isMetaClass(v36)) {
      int v37 = 43;
    }
    else {
      int v37 = 45;
    }
    __int16 v38 = object_getClassName(a1);
    int v39 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v45 = v37;
    __int16 v46 = 2082;
    __int16 v47 = v38;
    __int16 v48 = 2082;
    uint64_t v49 = v39;
    __int16 v50 = 1024;
    int v51 = 157;
    long long v29 = "%c[%{public}s %{public}s]:%i Invalid UTF8 URI string";
LABEL_28:
    _os_log_impl(&dword_2214B8000, v16, OS_LOG_TYPE_ERROR, v29, buf, 0x22u);
  }
LABEL_29:
  uint64_t v18 = 0;
LABEL_30:

  return v18;
}

+ (NFCNDEFPayload)wellKnownTypeURIPayloadWithURL:(NSURL *)url
{
  id v4 = [(NSURL *)url absoluteString];
  id v5 = [a1 wellKnownTypeURIPayloadWithString:v4];

  return (NFCNDEFPayload *)v5;
}

+ (NFCNDEFPayload)wellKnowTypeTextPayloadWithString:(NSString *)text locale:(NSLocale *)locale
{
  uint64_t v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", text, locale);
  [v6 handleFailureInMethod:a2 object:a1 file:@"NFCNDEFPayload.m" lineNumber:178 description:@"Please use -wellKnownTypeTextPayloadWithString:locale: replacement"];

  return 0;
}

+ (NFCNDEFPayload)wellKnownTypeTextPayloadWithString:(NSString *)text locale:(NSLocale *)locale
{
  id v5 = text;
  uint64_t v6 = [(NSLocale *)locale languageCode];
  char v15 = [v6 length] & 0x3F | 0x80;
  unint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:&v15 length:1];
  uint64_t v8 = [v6 dataUsingEncoding:1];
  [v7 appendData:v8];

  if ([(NSString *)v5 length])
  {
    char v9 = [(NSString *)v5 dataUsingEncoding:10];
    [v7 appendData:v9];
  }
  uint64_t v10 = [NFCNDEFPayload alloc];
  v11 = [@"T" dataUsingEncoding:4];
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = [(NFCNDEFPayload *)v10 initWithFormat:1 type:v11 identifier:v12 payload:v7];

  return v13;
}

- (NSURL)wellKnownTypeURIPayload
{
  v3 = [@"U" dataUsingEncoding:4];
  if (self->_typeNameFormat == 1
    && [(NSData *)self->_type isEqualToData:v3]
    && (unsigned __int8 v14 = 0, [(NSData *)self->_payload length]))
  {
    [(NSData *)self->_payload getBytes:&v14 length:1];
    if ((unint64_t)(char)v14 > 0x23) {
      unsigned __int8 v14 = 0;
    }
    id v4 = objc_opt_new();
    id v5 = v4;
    if ((char)v14 >= 1) {
      [v4 appendString:UrlPrefixMapping[v14 - 1]];
    }
    int64_t v6 = [(NSData *)self->_payload length] - 1;
    if (v6 < 1)
    {
      uint64_t v12 = 0;
    }
    else
    {
      id v7 = [NSString alloc];
      uint64_t v8 = -[NSData subdataWithRange:](self->_payload, "subdataWithRange:", 1, v6);
      char v9 = (void *)[v7 initWithData:v8 encoding:4];

      [v5 appendString:v9];
      uint64_t v10 = [MEMORY[0x263F08BA0] componentsWithString:v5];
      v11 = v10;
      if (!v10 || ([v10 URL], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        uint64_t v12 = [(NFCNDEFPayload *)self resolveURIString:v5];
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return (NSURL *)v12;
}

- (NSString)wellKnownTypeTextPayloadWithLocale:(NSLocale *)locale
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  int64_t v6 = [@"T" dataUsingEncoding:4];
  if (self->_typeNameFormat != 1 || ![(NSData *)self->_type isEqualToData:v6])
  {
LABEL_17:
    v20 = 0;
    *locale = 0;
    goto LABEL_18;
  }
  char v41 = 0;
  [(NSData *)self->_payload getBytes:&v41 length:1];
  unint64_t v7 = v41 & 0x3F;
  if (v41 < 0) {
    uint64_t v8 = 10;
  }
  else {
    uint64_t v8 = 4;
  }
  if ([(NSData *)self->_payload length] < v7)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i Invalid payload length", v14, ClassName, Name, 266);
    }
    char v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      uint64_t v18 = object_getClassName(self);
      uint64_t v19 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v43 = v17;
      __int16 v44 = 2082;
      int v45 = v18;
      __int16 v46 = 2082;
      __int16 v47 = v19;
      __int16 v48 = 1024;
      int v49 = 266;
      _os_log_impl(&dword_2214B8000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid payload length", buf, 0x22u);
    }

    goto LABEL_17;
  }
  id v22 = [NSString alloc];
  v23 = -[NSData subdataWithRange:](self->_payload, "subdataWithRange:", 1, v7);
  uint64_t v24 = (void *)[v22 initWithData:v23 encoding:1];

  if ([v24 length])
  {
    if (locale)
    {
      *locale = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v24];
    }
    NSUInteger v25 = [(NSData *)self->_payload length] + ~v7;
    if (v25)
    {
      id v26 = [NSString alloc];
      long long v27 = -[NSData subdataWithRange:](self->_payload, "subdataWithRange:", v7 + 1, v25);
      v20 = (void *)[v26 initWithData:v27 encoding:v8];
    }
    else
    {
      uint64_t v28 = NFLogGetLogger();
      if (v28)
      {
        long long v29 = (void (*)(uint64_t, const char *, ...))v28;
        uint64_t v30 = object_getClass(self);
        BOOL v31 = class_isMetaClass(v30);
        v32 = object_getClassName(self);
        objc_super v40 = sel_getName(a2);
        uint64_t v33 = 45;
        if (v31) {
          uint64_t v33 = 43;
        }
        v29(4, "%c[%{public}s %{public}s]:%i Empty string", v33, v32, v40, 284);
      }
      __int16 v34 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = object_getClass(self);
        if (class_isMetaClass(v35)) {
          int v36 = 43;
        }
        else {
          int v36 = 45;
        }
        int v37 = object_getClassName(self);
        __int16 v38 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v43 = v36;
        __int16 v44 = 2082;
        int v45 = v37;
        __int16 v46 = 2082;
        __int16 v47 = v38;
        __int16 v48 = 1024;
        int v49 = 284;
        _os_log_impl(&dword_2214B8000, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Empty string", buf, 0x22u);
      }

      v20 = objc_opt_new();
    }
  }
  else
  {
    v20 = 0;
  }

LABEL_18:

  return (NSString *)v20;
}

- (id)resolveURIString:(id)a3
{
  v3 = (objc_class *)NSURL;
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithString:v4 encodingInvalidCharacters:1];

  return v5;
}

@end