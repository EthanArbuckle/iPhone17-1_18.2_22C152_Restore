@interface BMSafariPageViewEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMSafariPageViewEvent)initWithCoder:(id)a3;
- (BMSafariPageViewEvent)initWithProto:(id)a3;
- (BMSafariPageViewEvent)initWithProtoData:(id)a3;
- (BMSafariPageViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 contentIsReaderText:(BOOL)a8 url:(id)a9;
- (BMSafariPageViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 contentIsReaderText:(BOOL)a8 url:(id)a9 contentProtection:(id)a10;
- (BMSafariPageViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 content:(id)a8 contentIsReaderText:(BOOL)a9 url:(id)a10 contentProtection:(id)a11;
- (BOOL)contentIsReaderText;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)content;
- (NSString)contentProtection;
- (NSString)domainId;
- (NSString)personaId;
- (NSString)title;
- (NSString)uniqueId;
- (NSURL)url;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMSafariPageViewEvent

- (BMSafariPageViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 content:(id)a8 contentIsReaderText:(BOOL)a9 url:(id)a10 contentProtection:(id)a11
{
  id v18 = a3;
  id v33 = a4;
  id v32 = a5;
  id v31 = a7;
  id obj = a8;
  id v19 = a8;
  id v20 = a10;
  id v21 = a11;
  if (v18)
  {
    if (v19) {
      goto LABEL_3;
    }
LABEL_8:
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"BMSafariPageViewEvent.m", 35, @"Invalid parameter not satisfying: %@", @"content" object file lineNumber description];

    if (v20) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"BMSafariPageViewEvent.m", 34, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];

  if (!v19) {
    goto LABEL_8;
  }
LABEL_3:
  if (v20) {
    goto LABEL_4;
  }
LABEL_9:
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"BMSafariPageViewEvent.m", 36, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

LABEL_4:
  v34.receiver = self;
  v34.super_class = (Class)BMSafariPageViewEvent;
  v22 = [(BMSafariPageViewEvent *)&v34 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_uniqueId, a3);
    objc_storeStrong((id *)&v23->_personaId, a5);
    objc_storeStrong((id *)&v23->_domainId, a4);
    v23->_absoluteTimestamp = a6;
    objc_storeStrong((id *)&v23->_title, a7);
    objc_storeStrong((id *)&v23->_content, obj);
    v23->_contentIsReaderText = a9;
    objc_storeStrong((id *)&v23->_url, a10);
    objc_storeStrong((id *)&v23->_contentProtection, a11);
  }

  return v23;
}

- (BMSafariPageViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 contentIsReaderText:(BOOL)a8 url:(id)a9 contentProtection:(id)a10
{
  return [(BMSafariPageViewEvent *)self initWithUniqueId:a3 domainId:a4 personaId:0 absoluteTimestamp:a6 title:a7 content:a8 contentIsReaderText:a5 url:a9 contentProtection:a10];
}

- (BMSafariPageViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 contentIsReaderText:(BOOL)a8 url:(id)a9
{
  return [(BMSafariPageViewEvent *)self initWithUniqueId:a3 domainId:a4 absoluteTimestamp:a6 title:a7 content:a8 contentIsReaderText:a9 url:a5 contentProtection:0];
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMSafariPageViewEvent eventWithData:dataVersion:](a4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v2 = [(BMSafariPageViewEvent *)self proto];
  v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMSafariPageViewEvent *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMSafariPageViewEvent *)(uint64_t)v5 json];
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMSafariPageViewEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMSafariPageViewEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMSafariPageViewEvent *)self initWithProtoData:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMSafariPageViewEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMSafariPageViewEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMSafariPageViewEvent initWithProto:].cold.4(v5, v20, v21, v22, v23, v24, v25, v26);
      }
      id v19 = 0;
      goto LABEL_19;
    }
    id v5 = v4;
    if ([v5 hasUniqueId]
      && [v5 hasAbsoluteTimestamp]
      && [v5 hasContent]
      && [v5 hasContentIsReaderText]
      && ([v5 hasUrl] & 1) != 0)
    {
      id v6 = [v5 url];
      uint64_t v7 = [v6 length];

      if (v7)
      {
        id v8 = objc_alloc(MEMORY[0x1E4F1CB10]);
        v9 = [v5 url];
        v10 = [v8 initWithString:v9 encodingInvalidCharacters:1];

        if (v10)
        {
          v43 = [v5 uniqueId];
          v11 = [v5 domainId];
          v12 = [v5 personaId];
          [v5 absoluteTimestamp];
          double v14 = v13;
          v15 = [v5 title];
          v16 = [v5 content];
          uint64_t v17 = [v5 contentIsReaderText];
          id v18 = [v5 contentProtection];
          self = [(BMSafariPageViewEvent *)self initWithUniqueId:v43 domainId:v11 personaId:v12 absoluteTimestamp:v15 title:v16 content:v17 contentIsReaderText:v14 url:v10 contentProtection:v18];

          id v19 = self;
LABEL_18:

LABEL_19:
          goto LABEL_20;
        }
        v42 = __biome_log_for_category();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
          -[BMSafariPageViewEvent initWithProto:](v5, v42);
        }
      }
      else
      {
        v10 = __biome_log_for_category();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          -[BMSafariPageViewEvent initWithProto:](v10, v35, v36, v37, v38, v39, v40, v41);
        }
      }
    }
    else
    {
      v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BMSafariPageViewEvent initWithProto:](v10, v27, v28, v29, v30, v31, v32, v33);
      }
    }
    id v19 = 0;
    goto LABEL_18;
  }
  id v19 = 0;
LABEL_20:

  return v19;
}

- (BMSafariPageViewEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBSafariPageViewEvent alloc] initWithData:v4];

    self = [(BMSafariPageViewEvent *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(BMSafariPageViewEvent *)self uniqueId];
  [v3 setUniqueId:v4];

  id v5 = [(BMSafariPageViewEvent *)self domainId];
  [v3 setDomainId:v5];

  id v6 = [(BMSafariPageViewEvent *)self personaId];
  [v3 setPersonaId:v6];

  [(BMSafariPageViewEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  [v3 setTitle:self->_title];
  [v3 setContent:self->_content];
  [v3 setContentIsReaderText:self->_contentIsReaderText];
  uint64_t v7 = [(NSURL *)self->_url absoluteString];
  [v3 setUrl:v7];

  id v8 = [(BMSafariPageViewEvent *)self contentProtection];
  [v3 setContentProtection:v8];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueId hash];
  id v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  uint64_t v5 = [v4 hash];
  id v6 = [(NSURL *)self->_url absoluteString];
  unint64_t v7 = v5 ^ v3 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(BMSafariPageViewEvent *)self proto];
    unint64_t v7 = [v5 proto];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_uniqueId && self->_content && self->_url)
  {
    BOOL v7 = 1;
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)domainId
{
  return self->_domainId;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)content
{
  return self->_content;
}

- (BOOL)contentIsReaderText
{
  return self->_contentIsReaderText;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);

  objc_storeStrong((id *)&self->_uniqueId, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMSafariPageViewEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMSafariPageViewEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithProto:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 url];
  int v4 = 138739971;
  uint64_t v5 = v3;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "BMSafariPageViewEvent: could not init NSURL from string %{sensitive}@.", (uint8_t *)&v4, 0xCu);
}

- (void)initWithProto:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithProto:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end