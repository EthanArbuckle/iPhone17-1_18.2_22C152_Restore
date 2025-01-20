@interface ATXProactiveSuggestionShadowLoggingContext
+ (BOOL)supportsSecureCoding;
- (ATXPredictionContext)context;
- (ATXProactiveSuggestionShadowLoggingContext)init;
- (ATXProactiveSuggestionShadowLoggingContext)initWithClientModelCacheUpdates:(id)a3 context:(id)a4;
- (ATXProactiveSuggestionShadowLoggingContext)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXProactiveSuggestionShadowLoggingContext:(id)a3;
- (NSDictionary)clientModelCacheUpdates;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithClientModelCacheUpdate:(id)a3;
- (void)updateWithContext:(id)a3;
@end

@implementation ATXProactiveSuggestionShadowLoggingContext

- (ATXProactiveSuggestionShadowLoggingContext)init
{
  v3 = objc_opt_new();
  v4 = [(ATXProactiveSuggestionShadowLoggingContext *)self initWithClientModelCacheUpdates:v3 context:0];

  return v4;
}

- (ATXProactiveSuggestionShadowLoggingContext)initWithClientModelCacheUpdates:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXProactiveSuggestionShadowLoggingContext;
  v8 = [(ATXProactiveSuggestionShadowLoggingContext *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 mutableCopy];
    clientModelCacheUpdates = v8->_clientModelCacheUpdates;
    v8->_clientModelCacheUpdates = (NSMutableDictionary *)v9;

    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v8;
}

- (NSDictionary)clientModelCacheUpdates
{
  v2 = (void *)[(NSMutableDictionary *)self->_clientModelCacheUpdates copy];
  return (NSDictionary *)v2;
}

- (void)updateWithClientModelCacheUpdate:(id)a3
{
  id v4 = a3;
  clientModelCacheUpdates = self->_clientModelCacheUpdates;
  id v6 = [v4 clientModelId];
  [(NSMutableDictionary *)clientModelCacheUpdates setObject:v4 forKey:v6];

  id v7 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ATXProactiveSuggestionShadowLoggingContext updateWithClientModelCacheUpdate:]();
  }
}

- (void)updateWithContext:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_context, a3);
  id v6 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ATXProactiveSuggestionShadowLoggingContext updateWithContext:]();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXProactiveSuggestionShadowLoggingContext *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXProactiveSuggestionShadowLoggingContext *)self isEqualToATXProactiveSuggestionShadowLoggingContext:v5];

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionShadowLoggingContext:(id)a3
{
  id v4 = (id *)a3;
  clientModelCacheUpdates = self->_clientModelCacheUpdates;
  BOOL v6 = (NSMutableDictionary *)v4[1];
  if (clientModelCacheUpdates == v6)
  {
  }
  else
  {
    id v7 = v6;
    v8 = clientModelCacheUpdates;
    char v9 = [(NSMutableDictionary *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_context;
  objc_super v12 = v11;
  if (v11 == v4[2]) {
    char v10 = 1;
  }
  else {
    char v10 = -[ATXPredictionContext isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableDictionary *)self->_clientModelCacheUpdates hash];
  return [(ATXPredictionContext *)self->_context hash] - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  clientModelCacheUpdates = self->_clientModelCacheUpdates;
  id v5 = a3;
  [v5 encodeObject:clientModelCacheUpdates forKey:@"clientCaches"];
  [v5 encodeObject:self->_context forKey:@"predictionContext"];
}

- (ATXProactiveSuggestionShadowLoggingContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D25F6CC0]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  char v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  char v10 = (void *)MEMORY[0x1E4F93B90];
  v11 = __atxlog_handle_blending_ecosystem();
  objc_super v12 = [v10 robustDecodeObjectOfClasses:v9 forKey:@"clientCaches" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingContext" errorCode:-1 logHandle:v11];

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v14 = objc_opt_class();
    v15 = __atxlog_handle_blending_ecosystem();
    v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"predictionContext" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingContext" errorCode:-1 logHandle:v15];

    self = [(ATXProactiveSuggestionShadowLoggingContext *)self initWithClientModelCacheUpdates:v12 context:v16];
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (ATXPredictionContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_clientModelCacheUpdates, 0);
}

- (void)updateWithClientModelCacheUpdate:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - updated with new client model cache: %@", v4, v5, v6, v7, v8);
}

- (void)updateWithContext:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - updated with new context: %@", v4, v5, v6, v7, v8);
}

@end