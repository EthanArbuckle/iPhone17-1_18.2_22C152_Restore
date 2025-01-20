@interface ATXBlendingBiomeStreamLoggerContext
+ (BOOL)supportsSecureCoding;
- (ATXBiomeStreamCacheUpdateContext)cacheUpdateContext;
- (ATXBlendingBiomeStreamLoggerContext)init;
- (ATXBlendingBiomeStreamLoggerContext)initWithCoder:(id)a3;
- (ATXBlendingBiomeStreamLoggerContext)initWithSessionTrackingContext:(id)a3 cacheUpdateContext:(id)a4 stackSuggestTrackingContext:(id)a5 screenLogUnlockSessionContext:(id)a6;
- (ATXScreenLogUnlockSessionContext)screenLogUnlockSessionContext;
- (ATXSingleSuggestionSessionTrackingContext)sessionTrackingContext;
- (ATXStackSystemSuggestTrackingContext)stackSuggestTrackingContext;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXBlendingBiomeStreamLoggerContext:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheUpdateContext:(id)a3;
- (void)setScreenLogUnlockSessionContext:(id)a3;
- (void)setSessionTrackingContext:(id)a3;
- (void)setStackSuggestTrackingContext:(id)a3;
- (void)updateWithBlendingUICacheUpdate:(id)a3;
- (void)updateWithClientModelCacheUpdate:(id)a3;
- (void)updateWithUIEvent:(id)a3;
@end

@implementation ATXBlendingBiomeStreamLoggerContext

- (ATXBlendingBiomeStreamLoggerContext)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = [(ATXBlendingBiomeStreamLoggerContext *)self initWithSessionTrackingContext:v3 cacheUpdateContext:v4 stackSuggestTrackingContext:v5 screenLogUnlockSessionContext:v6];

  return v7;
}

- (ATXBlendingBiomeStreamLoggerContext)initWithSessionTrackingContext:(id)a3 cacheUpdateContext:(id)a4 stackSuggestTrackingContext:(id)a5 screenLogUnlockSessionContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXBlendingBiomeStreamLoggerContext;
  v15 = [(ATXBlendingBiomeStreamLoggerContext *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionTrackingContext, a3);
    objc_storeStrong((id *)&v16->_cacheUpdateContext, a4);
    objc_storeStrong((id *)&v16->_stackSuggestTrackingContext, a5);
    objc_storeStrong((id *)&v16->_screenLogUnlockSessionContext, a6);
  }

  return v16;
}

- (void)updateWithClientModelCacheUpdate:(id)a3
{
  sessionTrackingContext = self->_sessionTrackingContext;
  id v5 = a3;
  [(ATXSingleSuggestionSessionTrackingContext *)sessionTrackingContext updateWithClientModelCacheUpdate:v5];
  [(ATXBiomeStreamCacheUpdateContext *)self->_cacheUpdateContext updateWithClientModelCacheUpdate:v5];
  [(ATXStackSystemSuggestTrackingContext *)self->_stackSuggestTrackingContext updateWithClientModelCacheUpdate:v5];
  [(ATXScreenLogUnlockSessionContext *)self->_screenLogUnlockSessionContext updateWithClientModelCacheUpdate:v5];
}

- (void)updateWithBlendingUICacheUpdate:(id)a3
{
  sessionTrackingContext = self->_sessionTrackingContext;
  id v5 = a3;
  [(ATXSingleSuggestionSessionTrackingContext *)sessionTrackingContext updateWithBlendingUICacheUpdate:v5];
  [(ATXBiomeStreamCacheUpdateContext *)self->_cacheUpdateContext updateWithBlendingUICacheUpdate:v5];
  [(ATXStackSystemSuggestTrackingContext *)self->_stackSuggestTrackingContext updateWithBlendingUICacheUpdate:v5];
  [(ATXScreenLogUnlockSessionContext *)self->_screenLogUnlockSessionContext updateWithBlendingUICacheUpdate:v5];
}

- (void)updateWithUIEvent:(id)a3
{
  sessionTrackingContext = self->_sessionTrackingContext;
  id v5 = a3;
  [(ATXSingleSuggestionSessionTrackingContext *)sessionTrackingContext updateWithUIEvent:v5];
  [(ATXBiomeStreamCacheUpdateContext *)self->_cacheUpdateContext updateWithUIEvent:v5];
  [(ATXStackSystemSuggestTrackingContext *)self->_stackSuggestTrackingContext updateWithUIEvent:v5];
  [(ATXScreenLogUnlockSessionContext *)self->_screenLogUnlockSessionContext updateWithUIEvent:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
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
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      objc_super v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
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
  sessionTrackingContext = self->_sessionTrackingContext;
  id v5 = a3;
  [v5 encodeObject:sessionTrackingContext forKey:@"sessionTrackingContext"];
  [v5 encodeObject:self->_cacheUpdateContext forKey:@"cacheUpdateContext"];
  [v5 encodeObject:self->_stackSuggestTrackingContext forKey:@"systemSuggestContext"];
  [v5 encodeObject:self->_screenLogUnlockSessionContext forKey:@"screenLogUnlockContext"];
}

- (ATXBlendingBiomeStreamLoggerContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionTrackingContext"];
  if ([(ATXBlendingBiomeStreamLoggerContext *)self checkAndReportDecodingFailureIfNeededForid:v5 key:@"sessionTrackingContext" coder:v4 errorDomain:@"com.apple.duetexpertd.ATXBlendingBiomeStreamLoggerContext" errorCode:-1])
  {
    v6 = 0;
  }
  else
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cacheUpdateContext"];
    if ([(ATXBlendingBiomeStreamLoggerContext *)self checkAndReportDecodingFailureIfNeededForid:v7 key:@"cacheUpdateContext" coder:v4 errorDomain:@"com.apple.duetexpertd.ATXBlendingBiomeStreamLoggerContext" errorCode:-1])
    {
      v6 = 0;
    }
    else
    {
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemSuggestContext"];
      if ([(ATXBlendingBiomeStreamLoggerContext *)self checkAndReportDecodingFailureIfNeededForid:v8 key:@"systemSuggestContext" coder:v4 errorDomain:@"com.apple.duetexpertd.ATXBlendingBiomeStreamLoggerContext" errorCode:-1])
      {
        v6 = 0;
      }
      else
      {
        v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"screenLogUnlockContext"];
        if ([(ATXBlendingBiomeStreamLoggerContext *)self checkAndReportDecodingFailureIfNeededForid:v9 key:@"screenLogUnlockContext" coder:v4 errorDomain:@"com.apple.duetexpertd.ATXBlendingBiomeStreamLoggerContext" errorCode:-1])
        {
          v6 = 0;
        }
        else
        {
          self = [(ATXBlendingBiomeStreamLoggerContext *)self initWithSessionTrackingContext:v5 cacheUpdateContext:v7 stackSuggestTrackingContext:v8 screenLogUnlockSessionContext:v9];
          v6 = self;
        }
      }
    }
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXBlendingBiomeStreamLoggerContext *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXBlendingBiomeStreamLoggerContext *)self isEqualToATXBlendingBiomeStreamLoggerContext:v5];

  return v6;
}

- (BOOL)isEqualToATXBlendingBiomeStreamLoggerContext:(id)a3
{
  id v4 = (id *)a3;
  sessionTrackingContext = self->_sessionTrackingContext;
  BOOL v6 = (ATXSingleSuggestionSessionTrackingContext *)v4[1];
  if (sessionTrackingContext == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = sessionTrackingContext;
    BOOL v9 = [(ATXSingleSuggestionSessionTrackingContext *)v8 isEqual:v7];

    if (!v9) {
      goto LABEL_11;
    }
  }
  cacheUpdateContext = self->_cacheUpdateContext;
  id v11 = (ATXBiomeStreamCacheUpdateContext *)v4[2];
  if (cacheUpdateContext == v11)
  {
  }
  else
  {
    id v12 = v11;
    id v13 = cacheUpdateContext;
    BOOL v14 = [(ATXBiomeStreamCacheUpdateContext *)v13 isEqual:v12];

    if (!v14) {
      goto LABEL_11;
    }
  }
  stackSuggestTrackingContext = self->_stackSuggestTrackingContext;
  id v16 = (ATXStackSystemSuggestTrackingContext *)v4[3];
  if (stackSuggestTrackingContext == v16)
  {
  }
  else
  {
    v17 = v16;
    objc_super v18 = stackSuggestTrackingContext;
    BOOL v19 = [(ATXStackSystemSuggestTrackingContext *)v18 isEqual:v17];

    if (!v19)
    {
LABEL_11:
      char v20 = 0;
      goto LABEL_17;
    }
  }
  uint64_t v21 = self->_screenLogUnlockSessionContext;
  v22 = v21;
  if (v21 == v4[4]) {
    char v20 = 1;
  }
  else {
    char v20 = -[ATXScreenLogUnlockSessionContext isEqual:](v21, "isEqual:");
  }

LABEL_17:
  return v20;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ATXSingleSuggestionSessionTrackingContext *)self->_sessionTrackingContext hash];
  unint64_t v4 = [(ATXBiomeStreamCacheUpdateContext *)self->_cacheUpdateContext hash] - v3 + 32 * v3;
  unint64_t v5 = [(ATXStackSystemSuggestTrackingContext *)self->_stackSuggestTrackingContext hash] - v4 + 32 * v4;
  return [(ATXScreenLogUnlockSessionContext *)self->_screenLogUnlockSessionContext hash] - v5 + 32 * v5;
}

- (ATXSingleSuggestionSessionTrackingContext)sessionTrackingContext
{
  return self->_sessionTrackingContext;
}

- (void)setSessionTrackingContext:(id)a3
{
}

- (ATXBiomeStreamCacheUpdateContext)cacheUpdateContext
{
  return self->_cacheUpdateContext;
}

- (void)setCacheUpdateContext:(id)a3
{
}

- (ATXStackSystemSuggestTrackingContext)stackSuggestTrackingContext
{
  return self->_stackSuggestTrackingContext;
}

- (void)setStackSuggestTrackingContext:(id)a3
{
}

- (ATXScreenLogUnlockSessionContext)screenLogUnlockSessionContext
{
  return self->_screenLogUnlockSessionContext;
}

- (void)setScreenLogUnlockSessionContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenLogUnlockSessionContext, 0);
  objc_storeStrong((id *)&self->_stackSuggestTrackingContext, 0);
  objc_storeStrong((id *)&self->_cacheUpdateContext, 0);
  objc_storeStrong((id *)&self->_sessionTrackingContext, 0);
}

@end