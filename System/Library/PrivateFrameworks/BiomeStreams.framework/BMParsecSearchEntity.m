@interface BMParsecSearchEntity
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMParsecSearchEntity)initWithCoder:(id)a3;
- (BMParsecSearchEntity)initWithName:(id)a3 category:(unsigned int)a4 probabilityScore:(float)a5 topics:(id)a6;
- (BMParsecSearchEntity)initWithProto:(id)a3;
- (BMParsecSearchEntity)initWithProtoData:(id)a3;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)topics;
- (NSString)name;
- (float)probabilityScore;
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

@implementation BMParsecSearchEntity

- (BMParsecSearchEntity)initWithName:(id)a3 category:(unsigned int)a4 probabilityScore:(float)a5 topics:(id)a6
{
  id v12 = a3;
  id v13 = a6;
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
    [v18 handleFailureInMethod:a2, self, @"BMParsecSearchEngagementEvent.m", 192, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"BMParsecSearchEngagementEvent.m", 193, @"Invalid parameter not satisfying: %@", @"topics" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)BMParsecSearchEntity;
  v15 = [(BMParsecSearchEntity *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    v16->_category = a4;
    v16->_probabilityScore = a5;
    objc_storeStrong((id *)&v16->_topics, a6);
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
      +[BMParsecSearchTopic eventWithData:dataVersion:]();
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v10[0] = self->_name;
  v9[0] = @"name";
  v9[1] = @"category";
  v3 = [NSNumber numberWithUnsignedInt:self->_category];
  v10[1] = v3;
  v9[2] = @"probabilityScore";
  *(float *)&double v4 = self->_probabilityScore;
  v5 = [NSNumber numberWithFloat:v4];
  v10[2] = v5;
  v9[3] = @"topics";
  id v6 = [(NSArray *)self->_topics _pas_mappedArrayWithTransform:&__block_literal_global_4];
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

uint64_t __32__BMParsecSearchEntity_jsonDict__block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonDict];
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMParsecSearchEntity *)self jsonDict];
  id v14 = 0;
  double v4 = [v2 dataWithJSONObject:v3 options:1 error:&v14];
  id v5 = v14;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMParsecSearchEntity *)(uint64_t)v5 json];
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
  id v5 = [(BMParsecSearchEntity *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMParsecSearchEntity)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMParsecSearchEntity *)self initWithProtoData:v6];
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMParsecSearchEntity *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMParsecSearchEntity)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasName]
        && [v5 hasCategory]
        && [v5 hasProbabilityScore]
        && [v5 topicsCount])
      {
        id v6 = [v5 name];
        uint64_t v7 = [v5 category];
        [v5 probabilityScore];
        int v9 = v8;
        uint64_t v10 = [v5 topics];
        uint64_t v11 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_139);
        LODWORD(v12) = v9;
        self = [(BMParsecSearchEntity *)self initWithName:v6 category:v7 probabilityScore:v11 topics:v12];

        id v13 = self;
LABEL_15:

        goto LABEL_16;
      }
      id v14 = __biome_log_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BMParsecSearchEntity initWithProto:]();
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMParsecSearchEntity initWithProto:]();
      }
    }
    id v13 = 0;
    goto LABEL_15;
  }
  id v13 = 0;
LABEL_16:

  return v13;
}

BMParsecSearchTopic *__38__BMParsecSearchEntity_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BMParsecSearchTopic alloc] initWithProto:v2];

  return v3;
}

- (BMParsecSearchEntity)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBParsecSearchEntity alloc] initWithData:v4];

    self = [(BMParsecSearchEntity *)self initWithProto:v5];
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
  id v4 = [(BMParsecSearchEntity *)self name];
  [v3 setName:v4];

  objc_msgSend(v3, "setCategory:", -[BMParsecSearchEntity category](self, "category"));
  [(BMParsecSearchEntity *)self probabilityScore];
  objc_msgSend(v3, "setProbabilityScore:");
  id v5 = [(BMParsecSearchEntity *)self topics];
  id v6 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_141);
  uint64_t v7 = (void *)[v6 mutableCopy];
  [v3 setTopics:v7];

  return v3;
}

uint64_t __29__BMParsecSearchEntity_proto__block_invoke(uint64_t a1, void *a2)
{
  return [a2 proto];
}

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    name = self->_name;
    uint64_t v7 = [v5 name];
    if ([(NSString *)name isEqualToString:v7]
      && (unsigned int category = self->_category, category == [v5 category])
      && (float probabilityScore = self->_probabilityScore, [v5 probabilityScore], probabilityScore == v10))
    {
      topics = self->_topics;
      double v12 = [v5 topics];
      char v13 = [(NSArray *)topics isEqual:v12];
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = self->_topics;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "isCompleteWithContext:error:", v6, a4, (void)v15))
        {

          BOOL v13 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  name = self->_name;
  BOOL v13 = name != 0;
  if (a4 && !name)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
    BOOL v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)category
{
  return self->_category;
}

- (float)probabilityScore
{
  return self->_probabilityScore;
}

- (NSArray)topics
{
  return self->_topics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topics, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)json
{
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMParsecSearchEntity: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMParsecSearchEntity: tried to initialize with a non-BMParsecSearchEntity proto", v2, v3, v4, v5, v6);
}

@end