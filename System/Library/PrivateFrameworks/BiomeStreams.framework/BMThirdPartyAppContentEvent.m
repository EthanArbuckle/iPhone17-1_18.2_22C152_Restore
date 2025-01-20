@interface BMThirdPartyAppContentEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMThirdPartyAppContentEvent)initWithCoder:(id)a3;
- (BMThirdPartyAppContentEvent)initWithProto:(id)a3;
- (BMThirdPartyAppContentEvent)initWithProtoData:(id)a3;
- (BMThirdPartyAppContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 bundleId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 desc:(id)a8 comment:(id)a9 content:(id)a10;
- (BMThirdPartyAppContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 bundleId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 desc:(id)a8 comment:(id)a9 content:(id)a10 contentProtection:(id)a11;
- (BMThirdPartyAppContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 bundleId:(id)a5 personaId:(id)a6 absoluteTimestamp:(double)a7 title:(id)a8 desc:(id)a9 comment:(id)a10 content:(id)a11 contentProtection:(id)a12;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleId;
- (NSString)comment;
- (NSString)content;
- (NSString)contentProtection;
- (NSString)desc;
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

@implementation BMThirdPartyAppContentEvent

- (BMThirdPartyAppContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 bundleId:(id)a5 personaId:(id)a6 absoluteTimestamp:(double)a7 title:(id)a8 desc:(id)a9 comment:(id)a10 content:(id)a11 contentProtection:(id)a12
{
  id v19 = a3;
  id v31 = a4;
  id v37 = a4;
  id v32 = a5;
  id v20 = a5;
  id v36 = a6;
  id v33 = a8;
  id v35 = a8;
  id v21 = a9;
  id v34 = a10;
  id v22 = a11;
  id v23 = a12;
  if (v19)
  {
    if (v20) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"BMThirdPartyAppContentEvent.m", 36, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];

    if (v20) {
      goto LABEL_3;
    }
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"BMThirdPartyAppContentEvent.m", 37, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

LABEL_3:
  v38.receiver = self;
  v38.super_class = (Class)BMThirdPartyAppContentEvent;
  v24 = [(BMThirdPartyAppContentEvent *)&v38 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_uniqueId, a3);
    objc_storeStrong((id *)&v25->_domainId, v31);
    objc_storeStrong((id *)&v25->_bundleId, v32);
    objc_storeStrong((id *)&v25->_personaId, a6);
    v25->_absoluteTimestamp = a7;
    objc_storeStrong((id *)&v25->_title, v33);
    objc_storeStrong((id *)&v25->_desc, a9);
    objc_storeStrong((id *)&v25->_comment, a10);
    objc_storeStrong((id *)&v25->_content, a11);
    objc_storeStrong((id *)&v25->_contentProtection, a12);
  }

  return v25;
}

- (BMThirdPartyAppContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 bundleId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 desc:(id)a8 comment:(id)a9 content:(id)a10 contentProtection:(id)a11
{
  return [(BMThirdPartyAppContentEvent *)self initWithUniqueId:a3 domainId:a4 bundleId:a5 personaId:0 absoluteTimestamp:a7 title:a8 desc:a6 comment:a9 content:a10 contentProtection:a11];
}

- (BMThirdPartyAppContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 bundleId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 desc:(id)a8 comment:(id)a9 content:(id)a10
{
  return [(BMThirdPartyAppContentEvent *)self initWithUniqueId:a3 domainId:a4 bundleId:a5 absoluteTimestamp:a7 title:a8 desc:a9 comment:a6 content:a10 contentProtection:0];
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
      +[BMThirdPartyAppContentEvent eventWithData:dataVersion:](a4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v2 = [(BMThirdPartyAppContentEvent *)self proto];
  v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMThirdPartyAppContentEvent *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMThirdPartyAppContentEvent *)(uint64_t)v5 json];
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
  id v5 = [(BMThirdPartyAppContentEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMThirdPartyAppContentEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMThirdPartyAppContentEvent *)self initWithProtoData:v6];
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
  v2 = [(BMThirdPartyAppContentEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMThirdPartyAppContentEvent)initWithProto:(id)a3
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
        && ([v5 hasBundleId] & 1) != 0)
      {
        id v19 = [v5 uniqueId];
        v18 = [v5 domainId];
        id v6 = [v5 bundleId];
        v7 = [v5 personaId];
        [v5 absoluteTimestamp];
        double v9 = v8;
        v10 = [v5 title];
        v11 = [v5 desc];
        v12 = [v5 comment];
        v13 = [v5 content];
        v14 = [v5 contentProtection];
        self = [(BMThirdPartyAppContentEvent *)self initWithUniqueId:v19 domainId:v18 bundleId:v6 personaId:v7 absoluteTimestamp:v10 title:v11 desc:v9 comment:v12 content:v13 contentProtection:v14];

        v15 = self;
LABEL_14:

        goto LABEL_15;
      }
      v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BMThirdPartyAppContentEvent initWithProto:](v16);
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMThirdPartyAppContentEvent initWithProto:](v5);
      }
    }
    v15 = 0;
    goto LABEL_14;
  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (BMThirdPartyAppContentEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBThirdPartyAppContentEvent alloc] initWithData:v4];

    self = [(BMThirdPartyAppContentEvent *)self initWithProto:v5];
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
  id v4 = [(BMThirdPartyAppContentEvent *)self uniqueId];
  [v3 setUniqueId:v4];

  id v5 = [(BMThirdPartyAppContentEvent *)self domainId];
  [v3 setDomainId:v5];

  id v6 = [(BMThirdPartyAppContentEvent *)self bundleId];
  [v3 setBundleId:v6];

  v7 = [(BMThirdPartyAppContentEvent *)self personaId];
  [v3 setPersonaId:v7];

  [(BMThirdPartyAppContentEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  [v3 setTitle:self->_title];
  [v3 setDesc:self->_desc];
  [v3 setComment:self->_comment];
  [v3 setContent:self->_content];
  [v3 setContentProtection:self->_contentProtection];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueId hash];
  NSUInteger v4 = [(NSString *)self->_bundleId hash] ^ v3;
  id v5 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(BMThirdPartyAppContentEvent *)self proto];
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
  if (self->_uniqueId && self->_bundleId)
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

- (NSString)bundleId
{
  return self->_bundleId;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)desc
{
  return self->_desc;
}

- (NSString)comment
{
  return self->_comment;
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
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
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
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMThirdPartyAppContentEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMThirdPartyAppContentEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMPBThirdPartyAppContentEvent: tried to initialize with a proto missing required data.", v1, 2u);
}

- (void)initWithProto:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMThirdPartyAppContentEvent: tried to initialize with a non-BMThirdPartyAppContentEvent proto", v1, 2u);
}

@end