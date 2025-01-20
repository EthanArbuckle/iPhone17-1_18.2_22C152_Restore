@interface BMNotesContentEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMNotesContentEvent)initWithCoder:(id)a3;
- (BMNotesContentEvent)initWithProto:(id)a3;
- (BMNotesContentEvent)initWithProtoData:(id)a3;
- (BMNotesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7;
- (BMNotesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 contentProtection:(id)a8;
- (BMNotesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 content:(id)a8 contentProtection:(id)a9;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)content;
- (NSString)contentProtection;
- (NSString)domainId;
- (NSString)personaId;
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

@implementation BMNotesContentEvent

- (BMNotesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 content:(id)a8 contentProtection:(id)a9
{
  id v17 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a7;
  id v18 = a8;
  id v19 = a9;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"BMNotesContentEvent.m", 33, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"BMNotesContentEvent.m", 34, @"Invalid parameter not satisfying: %@", @"content" object file lineNumber description];

LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)BMNotesContentEvent;
  v20 = [(BMNotesContentEvent *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_uniqueId, a3);
    objc_storeStrong((id *)&v21->_domainId, a4);
    objc_storeStrong((id *)&v21->_personaId, a5);
    v21->_absoluteTimestamp = a6;
    objc_storeStrong((id *)&v21->_title, a7);
    objc_storeStrong((id *)&v21->_content, a8);
    objc_storeStrong((id *)&v21->_contentProtection, a9);
  }

  return v21;
}

- (BMNotesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7 contentProtection:(id)a8
{
  return [(BMNotesContentEvent *)self initWithUniqueId:a3 domainId:a4 personaId:0 absoluteTimestamp:a6 title:a7 content:a8 contentProtection:a5];
}

- (BMNotesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 content:(id)a7
{
  return [(BMNotesContentEvent *)self initWithUniqueId:a3 domainId:a4 absoluteTimestamp:a6 title:a7 content:0 contentProtection:a5];
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
      +[BMNotesContentEvent eventWithData:dataVersion:](a4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v2 = [(BMNotesContentEvent *)self proto];
  v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMNotesContentEvent *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMNotesContentEvent *)(uint64_t)v5 json];
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
  id v5 = [(BMNotesContentEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMNotesContentEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMNotesContentEvent *)self initWithProtoData:v6];
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
  v2 = [(BMNotesContentEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMNotesContentEvent)initWithProto:(id)a3
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
        && ([v5 hasContent] & 1) != 0)
      {
        id v6 = [v5 uniqueId];
        v7 = [v5 domainId];
        id v8 = [v5 personaId];
        [v5 absoluteTimestamp];
        double v10 = v9;
        v11 = [v5 title];
        v12 = [v5 content];
        v13 = [v5 contentProtection];
        self = [(BMNotesContentEvent *)self initWithUniqueId:v6 domainId:v7 personaId:v8 absoluteTimestamp:v11 title:v12 content:v13 contentProtection:v10];

        v14 = self;
LABEL_14:

        goto LABEL_15;
      }
      v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[BMNotesContentEvent initWithProto:](v15);
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMNotesContentEvent initWithProto:](v5);
      }
    }
    v14 = 0;
    goto LABEL_14;
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (BMNotesContentEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBNotesContentEvent alloc] initWithData:v4];

    self = [(BMNotesContentEvent *)self initWithProto:v5];
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
  id v4 = [(BMNotesContentEvent *)self uniqueId];
  [v3 setUniqueId:v4];

  id v5 = [(BMNotesContentEvent *)self domainId];
  [v3 setDomainId:v5];

  id v6 = [(BMNotesContentEvent *)self personaId];
  [v3 setPersonaId:v6];

  [(BMNotesContentEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  v7 = [(BMNotesContentEvent *)self title];
  [v3 setTitle:v7];

  id v8 = [(BMNotesContentEvent *)self content];
  [v3 setContent:v8];

  double v9 = [(BMNotesContentEvent *)self contentProtection];
  [v3 setContentProtection:v9];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueId hash];
  id v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(BMNotesContentEvent *)self proto];
    v7 = [v5 proto];

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
  if (self->_uniqueId && self->_content)
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

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
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
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMNotesContentEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMNotesContentEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMNotesContentEvent: tried to initialize with a proto missing required data.", v1, 2u);
}

- (void)initWithProto:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMNotesContentEvent: tried to initialize with a non-BMNotesContentEvent proto", v1, 2u);
}

@end