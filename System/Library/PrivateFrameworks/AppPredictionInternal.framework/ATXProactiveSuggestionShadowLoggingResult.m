@interface ATXProactiveSuggestionShadowLoggingResult
+ (BOOL)supportsSecureCoding;
- (ATXClientModelCacheUpdate)clientModelCacheUpdate;
- (ATXPredictionContext)context;
- (ATXProactiveSuggestionShadowLoggingResult)initWithCoder:(id)a3;
- (ATXProactiveSuggestionShadowLoggingResult)initWithShadowEvent:(id)a3 shadowEventDate:(id)a4 clientModelCacheUpdate:(id)a5 context:(id)a6;
- (BMStoreData)shadowEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXProactiveSuggestionShadowLoggingResult:(id)a3;
- (NSDate)shadowEventDate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXProactiveSuggestionShadowLoggingResult

- (ATXProactiveSuggestionShadowLoggingResult)initWithShadowEvent:(id)a3 shadowEventDate:(id)a4 clientModelCacheUpdate:(id)a5 context:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXProactiveSuggestionShadowLoggingResult;
  v15 = [(ATXProactiveSuggestionShadowLoggingResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_shadowEvent, a3);
    objc_storeStrong((id *)&v16->_shadowEventDate, a4);
    objc_storeStrong((id *)&v16->_clientModelCacheUpdate, a5);
    objc_storeStrong((id *)&v16->_context, a6);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXProactiveSuggestionShadowLoggingResult *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXProactiveSuggestionShadowLoggingResult *)self isEqualToATXProactiveSuggestionShadowLoggingResult:v5];

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionShadowLoggingResult:(id)a3
{
  v4 = (id *)a3;
  shadowEvent = self->_shadowEvent;
  BOOL v6 = (BMStoreData *)v4[1];
  if (shadowEvent == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = shadowEvent;
    char v9 = [(BMStoreData *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_11;
    }
  }
  shadowEventDate = self->_shadowEventDate;
  id v11 = (NSDate *)v4[2];
  if (shadowEventDate == v11)
  {
  }
  else
  {
    id v12 = v11;
    id v13 = shadowEventDate;
    char v14 = [(NSDate *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_11;
    }
  }
  clientModelCacheUpdate = self->_clientModelCacheUpdate;
  v16 = (ATXClientModelCacheUpdate *)v4[3];
  if (clientModelCacheUpdate == v16)
  {
  }
  else
  {
    v17 = v16;
    objc_super v18 = clientModelCacheUpdate;
    char v19 = [(ATXClientModelCacheUpdate *)v18 isEqual:v17];

    if ((v19 & 1) == 0)
    {
LABEL_11:
      char v20 = 0;
      goto LABEL_17;
    }
  }
  v21 = self->_context;
  v22 = v21;
  if (v21 == v4[4]) {
    char v20 = 1;
  }
  else {
    char v20 = -[ATXPredictionContext isEqual:](v21, "isEqual:");
  }

LABEL_17:
  return v20;
}

- (unint64_t)hash
{
  uint64_t v3 = [(BMStoreData *)self->_shadowEvent hash];
  uint64_t v4 = [(NSDate *)self->_shadowEventDate hash] - v3 + 32 * v3;
  uint64_t v5 = [(ATXClientModelCacheUpdate *)self->_clientModelCacheUpdate hash] - v4 + 32 * v4;
  return [(ATXPredictionContext *)self->_context hash] - v5 + 32 * v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  shadowEvent = self->_shadowEvent;
  id v9 = a3;
  uint64_t v5 = [(BMStoreData *)shadowEvent serialize];
  [v9 encodeObject:v5 forKey:@"shadowEvent"];

  BOOL v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v9 encodeObject:v7 forKey:@"shadowEventClassName"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMStoreData dataVersion](self->_shadowEvent, "dataVersion"));
  [v9 encodeObject:v8 forKey:@"shadowEventDataVersion"];

  [v9 encodeObject:self->_shadowEventDate forKey:@"shadowEventDate"];
  [v9 encodeObject:self->_clientModelCacheUpdate forKey:@"clientCache"];
  [v9 encodeObject:self->_context forKey:@"context"];
}

- (ATXProactiveSuggestionShadowLoggingResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_blending_ecosystem();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"shadowEvent" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingResult" errorCode:-1 logHandle:v7];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v10 = objc_opt_class();
    id v11 = __atxlog_handle_blending_ecosystem();
    id v12 = [v9 robustDecodeObjectOfClass:v10 forKey:@"shadowEventClassName" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingResult" errorCode:-1 logHandle:v11];

    if (v12)
    {
      id v13 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v14 = objc_opt_class();
      v15 = __atxlog_handle_blending_ecosystem();
      v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"shadowEventDataVersion" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingResult" errorCode:-1 logHandle:v15];

      if (v16 && (Class v17 = NSClassFromString(v12)) != 0)
      {
        objc_super v18 = -[objc_class eventWithData:dataVersion:](v17, "eventWithData:dataVersion:", v8, [v16 unsignedIntValue]);
        if (v18)
        {
          char v19 = (void *)MEMORY[0x1E4F93B90];
          uint64_t v20 = objc_opt_class();
          v21 = __atxlog_handle_blending_ecosystem();
          v22 = [v19 robustDecodeObjectOfClass:v20 forKey:@"shadowEventDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingResult" errorCode:-1 logHandle:v21];

          if (v22)
          {
            v33 = v22;
            v23 = (void *)MEMORY[0x1E4F93B90];
            uint64_t v24 = objc_opt_class();
            v25 = __atxlog_handle_blending_ecosystem();
            v26 = [v23 robustDecodeObjectOfClass:v24 forKey:@"clientCache" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingResult" errorCode:-1 logHandle:v25];

            if (v26)
            {
              v27 = (void *)MEMORY[0x1E4F93B90];
              uint64_t v28 = objc_opt_class();
              v29 = __atxlog_handle_blending_ecosystem();
              v30 = [v27 robustDecodeObjectOfClass:v28 forKey:@"context" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingResult" errorCode:-1 logHandle:v29];

              if (v30)
              {
                v22 = v33;
                self = [(ATXProactiveSuggestionShadowLoggingResult *)self initWithShadowEvent:v18 shadowEventDate:v33 clientModelCacheUpdate:v26 context:v30];
                v31 = self;
              }
              else
              {
                v31 = 0;
                v22 = v33;
              }
            }
            else
            {
              v31 = 0;
              v22 = v33;
            }
          }
          else
          {
            v31 = 0;
          }
        }
        else
        {
          v31 = 0;
        }
      }
      else
      {
        v31 = 0;
      }
    }
    else
    {
      v31 = 0;
    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BMStoreData)shadowEvent
{
  return self->_shadowEvent;
}

- (NSDate)shadowEventDate
{
  return self->_shadowEventDate;
}

- (ATXClientModelCacheUpdate)clientModelCacheUpdate
{
  return self->_clientModelCacheUpdate;
}

- (ATXPredictionContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_clientModelCacheUpdate, 0);
  objc_storeStrong((id *)&self->_shadowEventDate, 0);
  objc_storeStrong((id *)&self->_shadowEvent, 0);
}

@end