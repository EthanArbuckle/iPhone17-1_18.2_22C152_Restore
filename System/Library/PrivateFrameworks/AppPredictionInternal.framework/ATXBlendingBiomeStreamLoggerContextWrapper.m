@interface ATXBlendingBiomeStreamLoggerContextWrapper
+ (BOOL)supportsSecureCoding;
- (ATXBlendingBiomeStreamLoggerContext)loggerContext;
- (ATXBlendingBiomeStreamLoggerContextWrapper)initWithCoder:(id)a3;
- (ATXBlendingBiomeStreamLoggerContextWrapper)initWithEvent:(id)a3 loggerContext:(id)a4;
- (BMStoreEvent)event;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXBlendingBiomeStreamLoggerContextWrapper:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEvent:(id)a3;
- (void)setLoggerContext:(id)a3;
@end

@implementation ATXBlendingBiomeStreamLoggerContextWrapper

- (ATXBlendingBiomeStreamLoggerContextWrapper)initWithEvent:(id)a3 loggerContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXBlendingBiomeStreamLoggerContextWrapper;
  v9 = [(ATXBlendingBiomeStreamLoggerContextWrapper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    objc_storeStrong((id *)&v10->_loggerContext, a4);
  }

  return v10;
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
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
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
  event = self->_event;
  id v5 = a3;
  [v5 encodeObject:event forKey:@"codingKeyForBiomeEvent"];
  [v5 encodeObject:self->_loggerContext forKey:@"codingKeyForLoggerContext"];
}

- (ATXBlendingBiomeStreamLoggerContextWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codingKeyForBiomeEvent"];
  if ([(ATXBlendingBiomeStreamLoggerContextWrapper *)self checkAndReportDecodingFailureIfNeededForid:v5 key:@"codingKeyForBiomeEvent" coder:v4 errorDomain:@"com.apple.duetexpertd.ATXBlendingBiomeStreamLoggerContextWrapper" errorCode:-1])
  {
    v6 = 0;
  }
  else
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codingKeyForLoggerContext"];
    if ([(ATXBlendingBiomeStreamLoggerContextWrapper *)self checkAndReportDecodingFailureIfNeededForid:v7 key:@"codingKeyForLoggerContext" coder:v4 errorDomain:@"com.apple.duetexpertd.ATXBlendingBiomeStreamLoggerContextWrapper" errorCode:-1])
    {
      v6 = 0;
    }
    else
    {
      self = [(ATXBlendingBiomeStreamLoggerContextWrapper *)self initWithEvent:v5 loggerContext:v7];
      v6 = self;
    }
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXBlendingBiomeStreamLoggerContextWrapper *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXBlendingBiomeStreamLoggerContextWrapper *)self isEqualToATXBlendingBiomeStreamLoggerContextWrapper:v5];

  return v6;
}

- (BOOL)isEqualToATXBlendingBiomeStreamLoggerContextWrapper:(id)a3
{
  id v4 = (id *)a3;
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
  id v11 = self->_loggerContext;
  id v12 = v11;
  if (v11 == v4[2]) {
    char v10 = 1;
  }
  else {
    char v10 = -[ATXBlendingBiomeStreamLoggerContext isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (unint64_t)hash
{
  return (char *)self->_loggerContext - (char *)self->_event + 32 * (uint64_t)self->_event;
}

- (BMStoreEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (ATXBlendingBiomeStreamLoggerContext)loggerContext
{
  return self->_loggerContext;
}

- (void)setLoggerContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggerContext, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end