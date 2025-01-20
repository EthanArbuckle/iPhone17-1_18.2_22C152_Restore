@interface ATXProactiveSuggestionShadowLoggingContextEventTuple
+ (BOOL)supportsSecureCoding;
- (ATXProactiveSuggestionShadowLoggingContext)shadowLoggingContext;
- (ATXProactiveSuggestionShadowLoggingContextEventTuple)init;
- (ATXProactiveSuggestionShadowLoggingContextEventTuple)initWithCoder:(id)a3;
- (ATXProactiveSuggestionShadowLoggingContextEventTuple)initWithEvent:(id)a3 shadowLoggingContext:(id)a4;
- (BMStoreEvent)event;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXProactiveSuggestionShadowLoggingContextEventTuple:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXProactiveSuggestionShadowLoggingContextEventTuple

- (ATXProactiveSuggestionShadowLoggingContextEventTuple)init
{
  v3 = objc_opt_new();
  v4 = [(ATXProactiveSuggestionShadowLoggingContextEventTuple *)self initWithEvent:0 shadowLoggingContext:v3];

  return v4;
}

- (ATXProactiveSuggestionShadowLoggingContextEventTuple)initWithEvent:(id)a3 shadowLoggingContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXProactiveSuggestionShadowLoggingContextEventTuple;
  v9 = [(ATXProactiveSuggestionShadowLoggingContextEventTuple *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    objc_storeStrong((id *)&v10->_shadowLoggingContext, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXProactiveSuggestionShadowLoggingContextEventTuple *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXProactiveSuggestionShadowLoggingContextEventTuple *)self isEqualToATXProactiveSuggestionShadowLoggingContextEventTuple:v5];

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionShadowLoggingContextEventTuple:(id)a3
{
  v4 = (id *)a3;
  event = self->_event;
  BOOL v6 = (BMStoreEvent *)v4[1];
  if (event == v6)
  {
  }
  else
  {
    id v7 = v6;
    id v8 = event;
    char v9 = [(BMStoreEvent *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_shadowLoggingContext;
  objc_super v12 = v11;
  if (v11 == v4[2]) {
    char v10 = 1;
  }
  else {
    char v10 = -[ATXProactiveSuggestionShadowLoggingContext isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (unint64_t)hash
{
  return (char *)self->_shadowLoggingContext - (char *)self->_event + 32 * (uint64_t)self->_event;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  event = self->_event;
  id v5 = a3;
  [v5 encodeObject:event forKey:@"event"];
  [v5 encodeObject:self->_shadowLoggingContext forKey:@"loggingContext"];
}

- (ATXProactiveSuggestionShadowLoggingContextEventTuple)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_blending_ecosystem();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"loggingContext" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingContextEventTuple" errorCode:-1 logHandle:v7];

  if (v8)
  {
    char v9 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v10 = objc_opt_class();
    v11 = __atxlog_handle_blending_ecosystem();
    objc_super v12 = [v9 robustDecodeObjectOfClass:v10 forKey:@"event" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingContextEventTuple" errorCode:-1 logHandle:v11];

    self = [(ATXProactiveSuggestionShadowLoggingContextEventTuple *)self initWithEvent:v12 shadowLoggingContext:v8];
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BMStoreEvent)event
{
  return self->_event;
}

- (ATXProactiveSuggestionShadowLoggingContext)shadowLoggingContext
{
  return self->_shadowLoggingContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowLoggingContext, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end