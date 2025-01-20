@interface BMParsecSearchEngagementEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMParsecSearchEngagementEvent)initWithCoder:(id)a3;
- (BMParsecSearchEngagementEvent)initWithProto:(id)a3;
- (BMParsecSearchEngagementEvent)initWithProtoData:(id)a3;
- (BMParsecSearchEngagementEvent)initWithUniqueId:(id)a3 resultId:(id)a4 domainId:(id)a5 absoluteTimestamp:(double)a6 userInput:(id)a7 completedQuery:(id)a8 entities:(id)a9;
- (BMParsecSearchEngagementEvent)initWithUniqueId:(id)a3 resultId:(id)a4 domainId:(id)a5 absoluteTimestamp:(double)a6 userInput:(id)a7 completedQuery:(id)a8 entities:(id)a9 contentProtection:(id)a10;
- (BMParsecSearchEngagementEvent)initWithUniqueId:(id)a3 resultId:(id)a4 domainId:(id)a5 personaId:(id)a6 absoluteTimestamp:(double)a7 userInput:(id)a8 completedQuery:(id)a9 entities:(id)a10 contentProtection:(id)a11;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)entities;
- (NSString)completedQuery;
- (NSString)contentProtection;
- (NSString)domainId;
- (NSString)personaId;
- (NSString)resultId;
- (NSString)uniqueId;
- (NSString)userInput;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMParsecSearchEngagementEvent

- (BMParsecSearchEngagementEvent)initWithUniqueId:(id)a3 resultId:(id)a4 domainId:(id)a5 personaId:(id)a6 absoluteTimestamp:(double)a7 userInput:(id)a8 completedQuery:(id)a9 entities:(id)a10 contentProtection:(id)a11
{
  id v18 = a3;
  id v19 = a4;
  id v37 = a5;
  id obj = a6;
  id v36 = a6;
  id v34 = a8;
  id v20 = a8;
  id v35 = a9;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  if (v18)
  {
    if (v19) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"BMParsecSearchEngagementEvent.m", 392, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];

    if (v19)
    {
LABEL_3:
      if (v20) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"BMParsecSearchEngagementEvent.m", 393, @"Invalid parameter not satisfying: %@", @"resultId" object file lineNumber description];

  if (v20)
  {
LABEL_4:
    if (v21) {
      goto LABEL_5;
    }
LABEL_12:
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"BMParsecSearchEngagementEvent.m", 395, @"Invalid parameter not satisfying: %@", @"completedQuery" object file lineNumber description];

    if (v22) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_11:
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"BMParsecSearchEngagementEvent.m", 394, @"Invalid parameter not satisfying: %@", @"userInput" object file lineNumber description];

  if (!v21) {
    goto LABEL_12;
  }
LABEL_5:
  if (v22) {
    goto LABEL_6;
  }
LABEL_13:
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"BMParsecSearchEngagementEvent.m", 396, @"Invalid parameter not satisfying: %@", @"entities" object file lineNumber description];

LABEL_6:
  v39.receiver = self;
  v39.super_class = (Class)BMParsecSearchEngagementEvent;
  v24 = [(BMParsecSearchEngagementEvent *)&v39 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_uniqueId, a3);
    objc_storeStrong((id *)&v25->_resultId, a4);
    objc_storeStrong((id *)&v25->_domainId, a5);
    objc_storeStrong((id *)&v25->_personaId, obj);
    v25->_absoluteTimestamp = a7;
    objc_storeStrong((id *)&v25->_userInput, v34);
    objc_storeStrong((id *)&v25->_completedQuery, v35);
    objc_storeStrong((id *)&v25->_entities, a10);
    objc_storeStrong((id *)&v25->_contentProtection, a11);
  }

  return v25;
}

- (BMParsecSearchEngagementEvent)initWithUniqueId:(id)a3 resultId:(id)a4 domainId:(id)a5 absoluteTimestamp:(double)a6 userInput:(id)a7 completedQuery:(id)a8 entities:(id)a9 contentProtection:(id)a10
{
  return [(BMParsecSearchEngagementEvent *)self initWithUniqueId:a3 resultId:a4 domainId:a5 personaId:0 absoluteTimestamp:a7 userInput:a8 completedQuery:a6 entities:a9 contentProtection:a10];
}

- (BMParsecSearchEngagementEvent)initWithUniqueId:(id)a3 resultId:(id)a4 domainId:(id)a5 absoluteTimestamp:(double)a6 userInput:(id)a7 completedQuery:(id)a8 entities:(id)a9
{
  return [(BMParsecSearchEngagementEvent *)self initWithUniqueId:a3 resultId:a4 domainId:a5 absoluteTimestamp:a7 userInput:a8 completedQuery:a9 entities:a6 contentProtection:0];
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
  v2 = [(BMParsecSearchEngagementEvent *)self proto];
  v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMParsecSearchEngagementEvent *)self jsonDict];
  id v14 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v14];
  id v5 = v14;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMParsecSearchTopic *)(uint64_t)v5 json];
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
  id v5 = [(BMParsecSearchEngagementEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMParsecSearchEngagementEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMParsecSearchEngagementEvent *)self initWithProtoData:v6];
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
  v2 = [(BMParsecSearchEngagementEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMParsecSearchEngagementEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasUniqueId]
        && [v5 hasResultId]
        && [v5 hasAbsoluteTimestamp]
        && [v5 hasUserInput]
        && ([v5 hasCompletedQuery] & 1) != 0)
      {
        id v19 = [v5 uniqueId];
        id v18 = [v5 resultId];
        id v6 = [v5 domainId];
        uint64_t v7 = [v5 personaId];
        [v5 absoluteTimestamp];
        double v9 = v8;
        uint64_t v10 = [v5 userInput];
        uint64_t v11 = [v5 completedQuery];
        uint64_t v12 = [v5 entities];
        v13 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_187);
        id v14 = [v5 contentProtection];
        self = [(BMParsecSearchEngagementEvent *)self initWithUniqueId:v19 resultId:v18 domainId:v6 personaId:v7 absoluteTimestamp:v10 userInput:v11 completedQuery:v9 entities:v13 contentProtection:v14];

        v15 = self;
LABEL_16:

        goto LABEL_17;
      }
      v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BMParsecSearchEngagementEvent initWithProto:]();
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMParsecSearchEngagementEvent initWithProto:]();
      }
    }
    v15 = 0;
    goto LABEL_16;
  }
  v15 = 0;
LABEL_17:

  return v15;
}

BMParsecSearchEntity *__47__BMParsecSearchEngagementEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BMParsecSearchEntity alloc] initWithProto:v2];

  return v3;
}

- (BMParsecSearchEngagementEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBParsecSearchEngagementEvent alloc] initWithData:v4];

    self = [(BMParsecSearchEngagementEvent *)self initWithProto:v5];
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
  id v4 = [(BMParsecSearchEngagementEvent *)self uniqueId];
  [v3 setUniqueId:v4];

  id v5 = [(BMParsecSearchEngagementEvent *)self resultId];
  [v3 setResultId:v5];

  id v6 = [(BMParsecSearchEngagementEvent *)self domainId];
  [v3 setDomainId:v6];

  uint64_t v7 = [(BMParsecSearchEngagementEvent *)self personaId];
  [v3 setPersonaId:v7];

  [(BMParsecSearchEngagementEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  double v8 = [(BMParsecSearchEngagementEvent *)self userInput];
  [v3 setUserInput:v8];

  double v9 = [(BMParsecSearchEngagementEvent *)self completedQuery];
  [v3 setCompletedQuery:v9];

  uint64_t v10 = [(BMParsecSearchEngagementEvent *)self entities];
  uint64_t v11 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_190);
  uint64_t v12 = (void *)[v11 mutableCopy];
  [v3 setEntities:v12];

  v13 = [(BMParsecSearchEngagementEvent *)self contentProtection];
  [v3 setContentProtection:v13];

  return v3;
}

uint64_t __38__BMParsecSearchEngagementEvent_proto__block_invoke(uint64_t a1, void *a2)
{
  return [a2 proto];
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_uniqueId hash] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(BMParsecSearchEngagementEvent *)self proto];
    uint64_t v7 = [v5 proto];

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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_entities;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "isCompleteWithContext:error:", v6, a4, (void)v14))
        {

          goto LABEL_15;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (self->_uniqueId && self->_resultId && self->_userInput && self->_completedQuery)
  {
    BOOL v12 = 1;
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_15:
    BOOL v12 = 0;
  }

  return v12;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)resultId
{
  return self->_resultId;
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

- (NSString)userInput
{
  return self->_userInput;
}

- (NSString)completedQuery
{
  return self->_completedQuery;
}

- (NSArray)entities
{
  return self->_entities;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_completedQuery, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_resultId, 0);

  objc_storeStrong((id *)&self->_uniqueId, 0);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMParsecSearchEngagementEvent: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMParsecSearchEngagementEvent: tried to initialize with a non-BMParsecSearchEngagementEvent proto", v2, v3, v4, v5, v6);
}

@end