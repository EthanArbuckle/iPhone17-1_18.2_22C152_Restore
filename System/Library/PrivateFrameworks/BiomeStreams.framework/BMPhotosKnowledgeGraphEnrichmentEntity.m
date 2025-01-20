@interface BMPhotosKnowledgeGraphEnrichmentEntity
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMPhotosKnowledgeGraphEnrichmentEntity)initWithCoder:(id)a3;
- (BMPhotosKnowledgeGraphEnrichmentEntity)initWithName:(id)a3 score:(double)a4 language:(id)a5 category:(unsigned int)a6;
- (BMPhotosKnowledgeGraphEnrichmentEntity)initWithProto:(id)a3;
- (BMPhotosKnowledgeGraphEnrichmentEntity)initWithProtoData:(id)a3;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)language;
- (NSString)name;
- (double)score;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)category;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMPhotosKnowledgeGraphEnrichmentEntity

- (BMPhotosKnowledgeGraphEnrichmentEntity)initWithName:(id)a3 score:(double)a4 language:(id)a5 category:(unsigned int)a6
{
  id v12 = a3;
  id v13 = a5;
  v14 = v13;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"BMPhotosKnowledgeGraphEnrichmentEvent.m", 194, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"BMPhotosKnowledgeGraphEnrichmentEvent.m", 195, @"Invalid parameter not satisfying: %@", @"language" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)BMPhotosKnowledgeGraphEnrichmentEntity;
  v15 = [(BMPhotosKnowledgeGraphEnrichmentEntity *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    v16->_score = a4;
    objc_storeStrong((id *)&v16->_language, a5);
    v16->_category = a6;
  }

  return v16;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMPhotosKnowledgeGraphEnrichmentEntity eventWithData:dataVersion:]();
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v9[0] = self->_name;
  v8[0] = @"name";
  v8[1] = @"score";
  v3 = [NSNumber numberWithDouble:self->_score];
  language = self->_language;
  v9[1] = v3;
  v9[2] = language;
  v8[2] = @"language";
  v8[3] = @"category";
  v5 = [NSNumber numberWithUnsignedInt:self->_category];
  v9[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMPhotosKnowledgeGraphEnrichmentEntity *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMPhotosKnowledgeGraphEnrichmentEntity json]();
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
  id v5 = [(BMPhotosKnowledgeGraphEnrichmentEntity *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMPhotosKnowledgeGraphEnrichmentEntity)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMPhotosKnowledgeGraphEnrichmentEntity *)self initWithProtoData:v6];
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
  v2 = [(BMPhotosKnowledgeGraphEnrichmentEntity *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMPhotosKnowledgeGraphEnrichmentEntity)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasName]
        && [v5 hasScore]
        && [v5 hasLanguage]
        && ([v5 hasCategory] & 1) != 0)
      {
        id v6 = [v5 name];
        [v5 score];
        double v8 = v7;
        v9 = [v5 language];
        self = [(BMPhotosKnowledgeGraphEnrichmentEntity *)self initWithName:v6 score:v9 language:[v5 category] category:v8];

        v10 = self;
LABEL_15:

        goto LABEL_16;
      }
      v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[BMPhotosKnowledgeGraphEnrichmentEntity initWithProto:]();
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMPhotosKnowledgeGraphEnrichmentEntity initWithProto:]();
      }
    }
    v10 = 0;
    goto LABEL_15;
  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (BMPhotosKnowledgeGraphEnrichmentEntity)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBPhotosKnowledgeGraphEnrichmentEntity alloc] initWithData:v4];

    self = [(BMPhotosKnowledgeGraphEnrichmentEntity *)self initWithProto:v5];
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
  id v4 = [(BMPhotosKnowledgeGraphEnrichmentEntity *)self name];
  [v3 setName:v4];

  [(BMPhotosKnowledgeGraphEnrichmentEntity *)self score];
  objc_msgSend(v3, "setScore:");
  id v5 = [(BMPhotosKnowledgeGraphEnrichmentEntity *)self language];
  [v3 setLanguage:v5];

  objc_msgSend(v3, "setCategory:", -[BMPhotosKnowledgeGraphEnrichmentEntity category](self, "category"));

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  id v4 = [NSNumber numberWithUnsignedInt:self->_category];
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
    name = self->_name;
    double v7 = [v5 name];
    if ([(NSString *)name isEqualToString:v7]
      && (double score = self->_score, [v5 score], score == v9))
    {
      language = self->_language;
      v11 = [v5 language];
      if ([(NSString *)language isEqualToString:v11])
      {
        unsigned int category = self->_category;
        BOOL v13 = category == [v5 category];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_name && self->_language)
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

- (NSString)name
{
  return self->_name;
}

- (double)score
{
  return self->_score;
}

- (NSString)language
{
  return self->_language;
}

- (unsigned)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(&dword_18E67D000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEntity: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
}

- (void)json
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEntity: Unable to create json from object: %@", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEntity: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEntity: tried to initialize with a non-BMPhotosKnowledgeGraphEnrichmentEntity proto", v2, v3, v4, v5, v6);
}

@end