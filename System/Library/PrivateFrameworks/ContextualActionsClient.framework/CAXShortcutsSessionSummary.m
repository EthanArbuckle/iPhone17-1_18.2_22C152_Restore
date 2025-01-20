@interface CAXShortcutsSessionSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (CAXShortcutsSessionSummary)initWithActions:(id)a3 sessionIdentifier:(id)a4;
- (CAXShortcutsSessionSummary)initWithCoder:(id)a3;
- (NSArray)actions;
- (NSString)sessionIdentifier;
- (NSUUID)blendingCacheUpdateUUID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAXShortcutsSessionSummary

- (CAXShortcutsSessionSummary)initWithActions:(id)a3 sessionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAXShortcutsSessionSummary;
  v9 = [(CAXShortcutsSessionSummary *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actions, a3);
    objc_storeStrong((id *)&v10->_sessionIdentifier, a4);
  }

  return v10;
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
  id v7 = a3;
  v4 = [(CAXShortcutsSessionSummary *)self actions];
  [v7 encodeObject:v4 forKey:@"codingKeyForActions"];

  v5 = [(CAXShortcutsSessionSummary *)self sessionIdentifier];

  if (v5)
  {
    v6 = [(CAXShortcutsSessionSummary *)self sessionIdentifier];
    [v7 encodeObject:v6 forKey:@"codingKeyForSessionId"];
  }
}

- (CAXShortcutsSessionSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F61E90];
  v6 = (void *)MEMORY[0x22A635790]();
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  id v8 = __atxlog_handle_contextual_actions();
  v9 = [v5 robustDecodeObjectOfClasses:v7 forKey:@"codingKeyForSessionId" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.decode.CAXShorctutsSessionSummar" errorCode:-1 logHandle:v8];

  v10 = (void *)MEMORY[0x263F61E90];
  id v11 = (void *)MEMORY[0x22A635790]();
  id v12 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v12, "initWithObjects:", v13, v14, objc_opt_class(), 0);
  id v16 = __atxlog_handle_contextual_actions();
  v17 = [v10 robustDecodeObjectOfClasses:v15 forKey:@"codingKeyForActions" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.decode.CAXShorctutsSessionSummar" errorCode:-1 logHandle:v16];

  v18 = [v4 error];

  if (v18)
  {
    v19 = __atxlog_handle_contextual_actions();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CAXShortcutsSessionSummary initWithCoder:](v4, v19);
    }

    v20 = 0;
  }
  else
  {
    self = [(CAXShortcutsSessionSummary *)self initWithActions:v17 sessionIdentifier:v9];
    v20 = self;
  }

  return v20;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSUUID)blendingCacheUpdateUUID
{
  return self->_blendingCacheUpdateUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendingCacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 error];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_2257D2000, a2, OS_LOG_TYPE_ERROR, "init with coder failed for CAXShortcutsSessionSummary with error: %@", (uint8_t *)&v4, 0xCu);
}

@end