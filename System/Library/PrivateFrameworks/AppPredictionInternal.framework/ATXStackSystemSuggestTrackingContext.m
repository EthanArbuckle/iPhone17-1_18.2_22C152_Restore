@interface ATXStackSystemSuggestTrackingContext
+ (BOOL)supportsSecureCoding;
- (ATXStackRotationSessionManager)sessionManager;
- (ATXStackSystemSuggestTrackingContext)init;
- (ATXStackSystemSuggestTrackingContext)initWithCoder:(id)a3;
- (ATXStackSystemSuggestTrackingContext)initWithRotationSessionManager:(id)a3 systemSuggestBlendingCaches:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXStackSystemSuggestTrackingContext:(id)a3;
- (NSMutableArray)systemSuggestBlendingCaches;
- (id)blendingCacheWithUUID:(id)a3;
- (id)removeAllAndReturnCompletedSystemSuggestSessions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithBlendingUICacheUpdate:(id)a3;
- (void)updateWithUIEvent:(id)a3;
@end

@implementation ATXStackSystemSuggestTrackingContext

- (ATXStackSystemSuggestTrackingContext)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(ATXStackSystemSuggestTrackingContext *)self initWithRotationSessionManager:v3 systemSuggestBlendingCaches:v4];

  return v5;
}

- (ATXStackSystemSuggestTrackingContext)initWithRotationSessionManager:(id)a3 systemSuggestBlendingCaches:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXStackSystemSuggestTrackingContext;
  v9 = [(ATXStackSystemSuggestTrackingContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionManager, a3);
    objc_storeStrong((id *)&v10->_systemSuggestBlendingCaches, a4);
  }

  return v10;
}

- (void)updateWithUIEvent:(id)a3
{
}

- (id)removeAllAndReturnCompletedSystemSuggestSessions
{
  return [(ATXStackRotationSessionManager *)self->_sessionManager removeAllAndReturnCompletedSystemSuggestSessions];
}

- (id)blendingCacheWithUUID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    systemSuggestBlendingCaches = self->_systemSuggestBlendingCaches;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__ATXStackSystemSuggestTrackingContext_blendingCacheWithUUID___block_invoke;
    v10[3] = &unk_1E68B5720;
    id v11 = v4;
    id v7 = [(NSMutableArray *)systemSuggestBlendingCaches _pas_filteredArrayWithTest:v10];
    id v8 = [v7 firstObject];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __62__ATXStackSystemSuggestTrackingContext_blendingCacheWithUUID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)updateWithBlendingUICacheUpdate:(id)a3
{
}

- (unint64_t)hash
{
  unint64_t v3 = [(ATXStackRotationSessionManager *)self->_sessionManager hash];
  return [(NSMutableArray *)self->_systemSuggestBlendingCaches hash] - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXStackSystemSuggestTrackingContext *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXStackSystemSuggestTrackingContext *)self isEqualToATXStackSystemSuggestTrackingContext:v5];

  return v6;
}

- (BOOL)isEqualToATXStackSystemSuggestTrackingContext:(id)a3
{
  uint64_t v4 = (id *)a3;
  sessionManager = self->_sessionManager;
  BOOL v6 = (ATXStackRotationSessionManager *)v4[1];
  if (sessionManager == v6)
  {
  }
  else
  {
    id v7 = v6;
    id v8 = sessionManager;
    BOOL v9 = [(ATXStackRotationSessionManager *)v8 isEqual:v7];

    if (!v9)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  id v11 = self->_systemSuggestBlendingCaches;
  objc_super v12 = v11;
  if (v11 == v4[2]) {
    char v10 = 1;
  }
  else {
    char v10 = -[NSMutableArray isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  sessionManager = self->_sessionManager;
  id v5 = a3;
  [v5 encodeObject:sessionManager forKey:@"sessionManager"];
  [v5 encodeObject:self->_systemSuggestBlendingCaches forKey:@"blendingCaches"];
}

- (ATXStackSystemSuggestTrackingContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_metrics();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"sessionManager" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.StackRotationStatus" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], BOOL v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    id v11 = (void *)MEMORY[0x1D25F6CC0]();
    id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
    v15 = (void *)MEMORY[0x1E4F93B90];
    v16 = __atxlog_handle_metrics();
    v17 = [v15 robustDecodeObjectOfClasses:v14 forKey:@"blendingCaches" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.StackRotationStatus" errorCode:-1 logHandle:v16];

    v18 = [v4 error];

    if (v18)
    {
      char v10 = 0;
    }
    else
    {
      self = [(ATXStackSystemSuggestTrackingContext *)self initWithRotationSessionManager:v8 systemSuggestBlendingCaches:v17];
      char v10 = self;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (ATXStackRotationSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (NSMutableArray)systemSuggestBlendingCaches
{
  return self->_systemSuggestBlendingCaches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemSuggestBlendingCaches, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
}

@end