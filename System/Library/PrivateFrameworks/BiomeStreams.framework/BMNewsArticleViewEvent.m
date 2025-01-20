@interface BMNewsArticleViewEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMNewsArticleViewEvent)initWithCoder:(id)a3;
- (BMNewsArticleViewEvent)initWithProto:(id)a3;
- (BMNewsArticleViewEvent)initWithProtoData:(id)a3;
- (BMNewsArticleViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 summary:(id)a8 publication:(id)a9;
- (BMNewsArticleViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 summary:(id)a8 publication:(id)a9 contentProtection:(id)a10;
- (BMNewsArticleViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 content:(id)a8 summary:(id)a9 publication:(id)a10 contentProtection:(id)a11;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)content;
- (NSString)contentProtection;
- (NSString)domainId;
- (NSString)personaId;
- (NSString)publication;
- (NSString)summary;
- (NSString)title;
- (NSString)uniqueId;
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

@implementation BMNewsArticleViewEvent

- (BMNewsArticleViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 content:(id)a8 summary:(id)a9 publication:(id)a10 contentProtection:(id)a11
{
  id v19 = a3;
  id v35 = a4;
  id v34 = a5;
  id v33 = a7;
  id obj = a8;
  id v20 = a8;
  id v32 = a9;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  if (v19)
  {
    if (v20) {
      goto LABEL_3;
    }
LABEL_8:
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"BMNewsArticleViewEvent.m", 36, @"Invalid parameter not satisfying: %@", @"content" object file lineNumber description];

    if (v21) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"BMNewsArticleViewEvent.m", 35, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];

  if (!v20) {
    goto LABEL_8;
  }
LABEL_3:
  if (v21) {
    goto LABEL_4;
  }
LABEL_9:
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"BMNewsArticleViewEvent.m", 37, @"Invalid parameter not satisfying: %@", @"summary" object file lineNumber description];

LABEL_4:
  v36.receiver = self;
  v36.super_class = (Class)BMNewsArticleViewEvent;
  v24 = [(BMNewsArticleViewEvent *)&v36 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_uniqueId, a3);
    objc_storeStrong((id *)&v25->_domainId, a4);
    objc_storeStrong((id *)&v25->_personaId, a5);
    v25->_absoluteTimestamp = a6;
    objc_storeStrong((id *)&v25->_title, a7);
    objc_storeStrong((id *)&v25->_content, obj);
    objc_storeStrong((id *)&v25->_summary, v32);
    objc_storeStrong((id *)&v25->_publication, a10);
    objc_storeStrong((id *)&v25->_contentProtection, a11);
  }

  return v25;
}

- (BMNewsArticleViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 summary:(id)a8 publication:(id)a9 contentProtection:(id)a10
{
  return [(BMNewsArticleViewEvent *)self initWithUniqueId:a3 domainId:a4 personaId:0 absoluteTimestamp:a6 title:a7 content:a8 summary:a5 publication:a9 contentProtection:a10];
}

- (BMNewsArticleViewEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 summary:(id)a8 publication:(id)a9
{
  return [(BMNewsArticleViewEvent *)self initWithUniqueId:a3 domainId:a4 absoluteTimestamp:a6 title:a7 content:a8 summary:a9 publication:a5 contentProtection:0];
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
      +[BMNewsArticleViewEvent eventWithData:dataVersion:](a4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v2 = [(BMNewsArticleViewEvent *)self proto];
  v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMNewsArticleViewEvent *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMNewsArticleViewEvent *)(uint64_t)v5 json];
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
  id v5 = [(BMNewsArticleViewEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMNewsArticleViewEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMNewsArticleViewEvent *)self initWithProtoData:v6];
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
  v2 = [(BMNewsArticleViewEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMNewsArticleViewEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasUniqueId]
        && [v5 hasAbsoluteTimestamp]
        && [v5 hasContent]
        && ([v5 hasSummary] & 1) != 0)
      {
        v18 = [v5 uniqueId];
        id v6 = [v5 domainId];
        v7 = [v5 personaId];
        [v5 absoluteTimestamp];
        double v9 = v8;
        v10 = [v5 title];
        v11 = [v5 content];
        v12 = [v5 summary];
        v13 = [v5 publication];
        v14 = [v5 contentProtection];
        self = [(BMNewsArticleViewEvent *)self initWithUniqueId:v18 domainId:v6 personaId:v7 absoluteTimestamp:v10 title:v11 content:v12 summary:v9 publication:v13 contentProtection:v14];

        v15 = self;
LABEL_15:

        goto LABEL_16;
      }
      v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BMNewsArticleViewEvent initWithProto:](v16);
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMNewsArticleViewEvent initWithProto:](v5);
      }
    }
    v15 = 0;
    goto LABEL_15;
  }
  v15 = 0;
LABEL_16:

  return v15;
}

- (BMNewsArticleViewEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBNewsArticleViewEvent alloc] initWithData:v4];

    self = [(BMNewsArticleViewEvent *)self initWithProto:v5];
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
  id v4 = [(BMNewsArticleViewEvent *)self uniqueId];
  [v3 setUniqueId:v4];

  id v5 = [(BMNewsArticleViewEvent *)self domainId];
  [v3 setDomainId:v5];

  id v6 = [(BMNewsArticleViewEvent *)self personaId];
  [v3 setPersonaId:v6];

  [(BMNewsArticleViewEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  [v3 setTitle:self->_title];
  [v3 setContent:self->_content];
  [v3 setSummary:self->_summary];
  [v3 setPublication:self->_publication];
  v7 = [(BMNewsArticleViewEvent *)self contentProtection];
  [v3 setContentProtection:v7];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueId hash];
  id v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  uint64_t v5 = [v4 hash];
  NSUInteger v6 = v3 ^ [(NSString *)self->_title hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_summary hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    NSUInteger v6 = [(BMNewsArticleViewEvent *)self proto];
    NSUInteger v7 = [v5 proto];

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
  if (self->_uniqueId && self->_content && self->_summary)
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

- (NSString)summary
{
  return self->_summary;
}

- (NSString)publication
{
  return self->_publication;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_publication, 0);
  objc_storeStrong((id *)&self->_summary, 0);
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
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMNewsArticleViewEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMNewsArticleViewEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMNewsArticleViewEvent: tried to initialize with a proto missing required data.", v1, 2u);
}

- (void)initWithProto:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMNewsArticleViewEvent: tried to initialize with a non-BMNewsArticleViewEvent proto", v1, 2u);
}

@end