@interface CAXSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (CAXSuggestion)initWithCoder:(id)a3;
- (CAXSuggestion)initWithProto:(id)a3;
- (CAXSuggestion)initWithProtoData:(id)a3;
- (CAXSuggestion)initWithSuggestedActions:(id)a3 modelVersion:(id)a4;
- (NSArray)suggestedActions;
- (NSString)modelVersion;
- (NSUUID)blendingCacheUpdateUUID;
- (id)description;
- (id)encodeAsProto;
- (id)json;
- (id)jsonRawData;
- (id)proto;
- (void)encodeWithCoder:(id)a3;
- (void)setBlendingCacheUpdateUUID:(id)a3;
- (void)setModelVersion:(id)a3;
@end

@implementation CAXSuggestion

- (CAXSuggestion)initWithSuggestedActions:(id)a3 modelVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAXSuggestion;
  v9 = [(CAXSuggestion *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestedActions, a3);
    objc_storeStrong((id *)&v10->_modelVersion, a4);
  }

  return v10;
}

- (id)description
{
  v2 = [(CAXSuggestion *)self jsonRawData];
  v3 = [v2 description];

  return v3;
}

- (id)jsonRawData
{
  v26[3] = *MEMORY[0x263EF8340];
  v25[0] = @"uuid";
  uint64_t v3 = [(CAXSuggestion *)self blendingCacheUpdateUUID];
  v4 = (void *)v3;
  v5 = &stru_26D8EF838;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v26[0] = v5;
  v25[1] = @"suggestedActions";
  v6 = objc_opt_new();
  v26[1] = v6;
  v25[2] = @"modelVersion";
  uint64_t v7 = [(CAXSuggestion *)self modelVersion];
  id v8 = (void *)v7;
  v9 = @"nil";
  if (v7) {
    v9 = (__CFString *)v7;
  }
  v26[2] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v11 = [(CAXSuggestion *)self suggestedActions];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v17 = [v10 objectForKeyedSubscript:@"suggestedActions"];
        v18 = [v16 jsonRawData];
        [v17 addObject:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  return v10;
}

- (id)json
{
  v2 = (void *)MEMORY[0x263F08900];
  uint64_t v3 = [(CAXSuggestion *)self jsonRawData];
  v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v21 = *MEMORY[0x263F08320];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CAXSuggestion *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"CAXProtobufData"];
}

- (CAXSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAXProtobufData"];

  v6 = [(CAXSuggestion *)self initWithProtoData:v5];
  return v6;
}

- (id)encodeAsProto
{
  v2 = [(CAXSuggestion *)self proto];
  uint64_t v3 = [v2 data];

  return v3;
}

- (CAXSuggestion)initWithProto:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = objc_alloc(MEMORY[0x263EFF980]);
      uint64_t v7 = [v5 suggestedActions];
      id v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v9 = [v5 suggestedActions];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            BOOL v14 = [[CAXContextualAction alloc] initWithProto:*(void *)(*((void *)&v19 + 1) + 8 * i)];
            if (!v14)
            {
              v17 = __atxlog_handle_contextual_actions();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
                -[CAXSuggestion initWithProto:](v17);
              }

              id v16 = 0;
              goto LABEL_19;
            }
            v15 = v14;
            [v8 addObject:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      v9 = [v5 modelVersion];
      self = [(CAXSuggestion *)self initWithSuggestedActions:v8 modelVersion:v9];
      id v16 = self;
LABEL_19:
    }
    else
    {
      id v5 = __atxlog_handle_contextual_actions();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[CAXContextualActionsFeedbackEvent initWithProto:]((uint64_t)self, v5);
      }
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (CAXSuggestion)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[CAXPBSuggestion alloc] initWithData:v4];

    self = [(CAXSuggestion *)self initWithProto:v5];
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
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  [v3 setModelVersion:self->_modelVersion];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_suggestedActions, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_suggestedActions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * v9) proto];
        if (v10)
        {
          [v4 addObject:v10];
        }
        else
        {
          uint64_t v11 = __atxlog_handle_contextual_actions();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
            [(CAXPredictionContext *)&v13 proto];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [v3 setSuggestedActions:v4];
  return v3;
}

- (NSArray)suggestedActions
{
  return self->_suggestedActions;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (NSUUID)blendingCacheUpdateUUID
{
  return self->_blendingCacheUpdateUUID;
}

- (void)setBlendingCacheUpdateUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendingCacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_suggestedActions, 0);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2257D2000, log, OS_LOG_TYPE_FAULT, "Attempting to decode CAXPBSuggestion from proto failed because the recovered PBCodable had an unrecoverable CAXContextualAction.", v1, 2u);
}

@end