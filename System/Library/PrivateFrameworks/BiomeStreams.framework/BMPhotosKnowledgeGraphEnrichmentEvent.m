@interface BMPhotosKnowledgeGraphEnrichmentEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithCoder:(id)a3;
- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithProto:(id)a3;
- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithProtoData:(id)a3;
- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 topics:(id)a5 entities:(id)a6 locations:(id)a7;
- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 topics:(id)a5 entities:(id)a6 locations:(id)a7 contentProtection:(id)a8;
- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithUniqueId:(id)a3 personaId:(id)a4 absoluteTimestamp:(double)a5 topics:(id)a6 entities:(id)a7 locations:(id)a8 contentProtection:(id)a9;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)entities;
- (NSArray)locations;
- (NSArray)topics;
- (NSString)contentProtection;
- (NSString)personaId;
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

@implementation BMPhotosKnowledgeGraphEnrichmentEvent

- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithUniqueId:(id)a3 personaId:(id)a4 absoluteTimestamp:(double)a5 topics:(id)a6 entities:(id)a7 locations:(id)a8 contentProtection:(id)a9
{
  id v17 = a3;
  id v34 = a4;
  id v18 = a6;
  id v19 = a7;
  id obj = a8;
  id v20 = a8;
  id v32 = a9;
  id v21 = a9;
  v22 = self;
  id v33 = v21;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, v22, @"BMPhotosKnowledgeGraphEnrichmentEvent.m", 564, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];

    if (v18)
    {
LABEL_3:
      if (v19) {
        goto LABEL_4;
      }
LABEL_10:
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2, v22, @"BMPhotosKnowledgeGraphEnrichmentEvent.m", 566, @"Invalid parameter not satisfying: %@", @"entities" object file lineNumber description];

      if (v20) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, v22, @"BMPhotosKnowledgeGraphEnrichmentEvent.m", 565, @"Invalid parameter not satisfying: %@", @"topics" object file lineNumber description];

  if (!v19) {
    goto LABEL_10;
  }
LABEL_4:
  if (v20) {
    goto LABEL_5;
  }
LABEL_11:
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, v22, @"BMPhotosKnowledgeGraphEnrichmentEvent.m", 567, @"Invalid parameter not satisfying: %@", @"locations" object file lineNumber description];

LABEL_5:
  v35.receiver = v22;
  v35.super_class = (Class)BMPhotosKnowledgeGraphEnrichmentEvent;
  v23 = [(BMPhotosKnowledgeGraphEnrichmentEvent *)&v35 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_uniqueId, a3);
    objc_storeStrong((id *)&v24->_personaId, a4);
    v24->_absoluteTimestamp = a5;
    objc_storeStrong((id *)&v24->_topics, a6);
    objc_storeStrong((id *)&v24->_entities, a7);
    objc_storeStrong((id *)&v24->_locations, obj);
    objc_storeStrong((id *)&v24->_contentProtection, v32);
  }

  return v24;
}

- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 topics:(id)a5 entities:(id)a6 locations:(id)a7 contentProtection:(id)a8
{
  return [(BMPhotosKnowledgeGraphEnrichmentEvent *)self initWithUniqueId:a3 personaId:0 absoluteTimestamp:a5 topics:a6 entities:a7 locations:a8 contentProtection:a4];
}

- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 topics:(id)a5 entities:(id)a6 locations:(id)a7
{
  return [(BMPhotosKnowledgeGraphEnrichmentEvent *)self initWithUniqueId:a3 absoluteTimestamp:a5 topics:a6 entities:a7 locations:0 contentProtection:a4];
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
      +[BMPhotosKnowledgeGraphEnrichmentEvent eventWithData:dataVersion:]();
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v3 = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self proto];
  v4 = [v3 dictionaryRepresentation];

  v5 = [v4 objectForKeyedSubscript:@"locations"];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self proto];
    v8 = [v7 dictionaryRepresentation];
    v9 = (void *)[v8 mutableCopy];

    id v10 = v9;
    v11 = [v10 objectForKeyedSubscript:@"locations"];
    v12 = objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_6);
    [v10 setObject:v12 forKeyedSubscript:@"locations"];

    v4 = v10;
  }

  return v4;
}

id __49__BMPhotosKnowledgeGraphEnrichmentEvent_jsonDict__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKeyedSubscript:@"encodedLocation"];
  if (v3)
  {
    v4 = (void *)[v2 mutableCopy];
    v5 = [v3 base64EncodedStringWithOptions:0];
    [v4 setObject:v5 forKeyedSubscript:@"encodedLocation"];

    id v2 = v4;
  }

  return v2;
}

- (id)json
{
  id v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    uint64_t v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMPhotosKnowledgeGraphEnrichmentEvent json]();
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
  id v5 = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  uint64_t v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self initWithProtoData:v6];
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
  id v2 = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasUniqueId]
        && ([v5 hasAbsoluteTimestamp] & 1) != 0)
      {
        uint64_t v6 = [v5 uniqueId];
        v7 = [v5 personaId];
        [v5 absoluteTimestamp];
        double v9 = v8;
        id v19 = [v5 topics];
        id v10 = objc_msgSend(v19, "_pas_mappedArrayWithTransform:", &__block_literal_global_217);
        id v18 = [v5 entities];
        v11 = objc_msgSend(v18, "_pas_mappedArrayWithTransform:", &__block_literal_global_220);
        v12 = [v5 locations];
        v13 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_223);
        v14 = [v5 contentProtection];
        self = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self initWithUniqueId:v6 personaId:v7 absoluteTimestamp:v10 topics:v11 entities:v13 locations:v14 contentProtection:v9];

        v15 = self;
LABEL_13:

        goto LABEL_14;
      }
      v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BMPhotosKnowledgeGraphEnrichmentEvent initWithProto:]();
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMPhotosKnowledgeGraphEnrichmentEvent initWithProto:]();
      }
    }
    v15 = 0;
    goto LABEL_13;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

BMPhotosKnowledgeGraphEnrichmentTopic *__55__BMPhotosKnowledgeGraphEnrichmentEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BMPhotosKnowledgeGraphEnrichmentTopic alloc] initWithProto:v2];

  return v3;
}

BMPhotosKnowledgeGraphEnrichmentEntity *__55__BMPhotosKnowledgeGraphEnrichmentEvent_initWithProto___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BMPhotosKnowledgeGraphEnrichmentEntity alloc] initWithProto:v2];

  return v3;
}

BMPhotosKnowledgeGraphEnrichmentLocation *__55__BMPhotosKnowledgeGraphEnrichmentEvent_initWithProto___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BMPhotosKnowledgeGraphEnrichmentLocation alloc] initWithProto:v2];

  return v3;
}

- (BMPhotosKnowledgeGraphEnrichmentEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBPhotosKnowledgeGraphEnrichmentEvent alloc] initWithData:v4];

    self = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self initWithProto:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self uniqueId];
  [v3 setUniqueId:v4];

  id v5 = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self personaId];
  [v3 setPersonaId:v5];

  [(BMPhotosKnowledgeGraphEnrichmentEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  uint64_t v6 = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self topics];
  v7 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_226);
  double v8 = (void *)[v7 mutableCopy];
  [v3 setTopics:v8];

  double v9 = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self entities];
  id v10 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_229);
  v11 = (void *)[v10 mutableCopy];
  [v3 setEntities:v11];

  v12 = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self locations];
  v13 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_232);
  v14 = (void *)[v13 mutableCopy];
  [v3 setLocations:v14];

  v15 = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self contentProtection];
  [v3 setContentProtection:v15];

  return v3;
}

uint64_t __46__BMPhotosKnowledgeGraphEnrichmentEvent_proto__block_invoke(uint64_t a1, void *a2)
{
  return [a2 proto];
}

uint64_t __46__BMPhotosKnowledgeGraphEnrichmentEvent_proto__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 proto];
}

uint64_t __46__BMPhotosKnowledgeGraphEnrichmentEvent_proto__block_invoke_3(uint64_t a1, void *a2)
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
    uint64_t v6 = [(BMPhotosKnowledgeGraphEnrichmentEvent *)self proto];
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
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v7 = self->_topics;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v32 != v10) {
        objc_enumerationMutation(v7);
      }
      if (![*(id *)(*((void *)&v31 + 1) + 8 * v11) isCompleteWithContext:v6 error:a4]) {
        goto LABEL_28;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v7 = self->_entities;
  uint64_t v12 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
LABEL_11:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v28 != v14) {
        objc_enumerationMutation(v7);
      }
      if (![*(id *)(*((void *)&v27 + 1) + 8 * v15) isCompleteWithContext:v6 error:a4]) {
        goto LABEL_28;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v13) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v7 = self->_locations;
  uint64_t v16 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
LABEL_19:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v24 != v18) {
        objc_enumerationMutation(v7);
      }
      if (!objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v19), "isCompleteWithContext:error:", v6, a4, (void)v23))break; {
      if (v17 == ++v19)
      }
      {
        uint64_t v17 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v35 count:16];
        if (v17) {
          goto LABEL_19;
        }
        goto LABEL_25;
      }
    }
LABEL_28:

    BOOL v21 = 0;
    goto LABEL_29;
  }
LABEL_25:

  uniqueId = self->_uniqueId;
  BOOL v21 = uniqueId != 0;
  if (a4 && !uniqueId)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
    BOOL v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_29:

  return v21;
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

- (NSArray)topics
{
  return self->_topics;
}

- (NSArray)entities
{
  return self->_entities;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_personaId, 0);

  objc_storeStrong((id *)&self->_uniqueId, 0);
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(&dword_18E67D000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEvent: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
}

- (void)json
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEvent: Unable to create json from object: %@", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEvent: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentEvent: tried to initialize with a non-BMPhotosKnowledgeGraphEnrichmentEvent proto", v2, v3, v4, v5, v6);
}

@end