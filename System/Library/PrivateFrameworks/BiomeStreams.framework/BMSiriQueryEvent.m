@interface BMSiriQueryEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMSiriQueryEvent)initWithCoder:(id)a3;
- (BMSiriQueryEvent)initWithProto:(id)a3;
- (BMSiriQueryEvent)initWithProtoData:(id)a3;
- (BMSiriQueryEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 query:(id)a5 results:(id)a6;
- (BMSiriQueryEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 query:(id)a5 results:(id)a6 contentProtection:(id)a7;
- (BMSiriQueryEvent)initWithUniqueId:(id)a3 personaId:(id)a4 absoluteTimestamp:(double)a5 query:(id)a6 results:(id)a7 contentProtection:(id)a8;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)results;
- (NSString)contentProtection;
- (NSString)personaId;
- (NSString)query;
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

@implementation BMSiriQueryEvent

- (BMSiriQueryEvent)initWithUniqueId:(id)a3 personaId:(id)a4 absoluteTimestamp:(double)a5 query:(id)a6 results:(id)a7 contentProtection:(id)a8
{
  id v15 = a3;
  id v26 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_8:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"BMSiriQueryEvent.m", 204, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    if (v17) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"BMSiriQueryEvent.m", 203, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];

  if (!v16) {
    goto LABEL_8;
  }
LABEL_3:
  if (v17) {
    goto LABEL_4;
  }
LABEL_9:
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"BMSiriQueryEvent.m", 205, @"Invalid parameter not satisfying: %@", @"results" object file lineNumber description];

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)BMSiriQueryEvent;
  v19 = [(BMSiriQueryEvent *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_uniqueId, a3);
    objc_storeStrong((id *)&v20->_personaId, a4);
    v20->_absoluteTimestamp = a5;
    objc_storeStrong((id *)&v20->_query, a6);
    objc_storeStrong((id *)&v20->_results, a7);
    objc_storeStrong((id *)&v20->_contentProtection, a8);
  }

  return v20;
}

- (BMSiriQueryEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 query:(id)a5 results:(id)a6 contentProtection:(id)a7
{
  return [(BMSiriQueryEvent *)self initWithUniqueId:a3 personaId:0 absoluteTimestamp:a5 query:a6 results:a7 contentProtection:a4];
}

- (BMSiriQueryEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 query:(id)a5 results:(id)a6
{
  return [(BMSiriQueryEvent *)self initWithUniqueId:a3 absoluteTimestamp:a5 query:a6 results:0 contentProtection:a4];
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
      +[BMSiriQueryEvent eventWithData:dataVersion:]();
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v2 = [(BMSiriQueryEvent *)self proto];
  v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMSiriQueryEvent *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMSiriQueryEvent *)(uint64_t)v5 json];
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
  id v5 = [(BMSiriQueryEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMSiriQueryEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMSiriQueryEvent *)self initWithProtoData:v6];
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
  v2 = [(BMSiriQueryEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMSiriQueryEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasUniqueId])
      {
        [v5 absoluteTimestamp];
        if (v6 != 0.0)
        {
          v7 = [v5 query];

          if (v7)
          {
            id v8 = [v5 uniqueId];
            v9 = [v5 personaId];
            [v5 absoluteTimestamp];
            double v11 = v10;
            v12 = [v5 query];
            v13 = [v5 results];
            v14 = objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global);
            id v15 = [v5 contentProtection];
            self = [(BMSiriQueryEvent *)self initWithUniqueId:v8 personaId:v9 absoluteTimestamp:v12 query:v14 results:v15 contentProtection:v11];

            id v16 = self;
LABEL_14:

            goto LABEL_15;
          }
        }
      }
      id v17 = __biome_log_for_category();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[BMSiriQueryEvent initWithProto:]();
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMSiriQueryEvent initWithProto:]();
      }
    }
    id v16 = 0;
    goto LABEL_14;
  }
  id v16 = 0;
LABEL_15:

  return v16;
}

BMSiriQueryResult *__34__BMSiriQueryEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BMSiriQueryResult alloc] initWithProto:v2];

  return v3;
}

- (BMSiriQueryEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBSiriQueryEvent alloc] initWithData:v4];

    self = [(BMSiriQueryEvent *)self initWithProto:v5];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(BMSiriQueryEvent *)self uniqueId];
  [v3 setUniqueId:v4];

  id v5 = [(BMSiriQueryEvent *)self personaId];
  [v3 setPersonaId:v5];

  [(BMSiriQueryEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  double v6 = [(BMSiriQueryEvent *)self query];
  [v3 setQuery:v6];

  v7 = [(BMSiriQueryEvent *)self results];
  id v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_144);
  v9 = (void *)[v8 mutableCopy];
  [v3 setResults:v9];

  double v10 = [(BMSiriQueryEvent *)self contentProtection];
  [v3 setContentProtection:v10];

  return v3;
}

uint64_t __25__BMSiriQueryEvent_proto__block_invoke(uint64_t a1, void *a2)
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
    double v6 = [(BMSiriQueryEvent *)self proto];
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
  if (self->_uniqueId && self->_query && [(NSArray *)self->_results count])
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

- (NSString)personaId
{
  return self->_personaId;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)query
{
  return self->_query;
}

- (NSArray)results
{
  return self->_results;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_personaId, 0);

  objc_storeStrong((id *)&self->_uniqueId, 0);
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_4();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "BMSiriQueryEvent: Mismatched data versions (%u != %u) cannot deserialize", v1, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMSiriQueryEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMPBSiriQueryEvent: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMSiriQueryEvent: tried to initialize with a non-BMSiriQueryEvent proto", v2, v3, v4, v5, v6);
}

@end