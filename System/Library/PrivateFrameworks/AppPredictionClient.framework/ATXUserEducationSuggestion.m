@interface ATXUserEducationSuggestion
+ (BOOL)supportsSecureCoding;
+ (int64_t)suggestionType;
- (ATXUserEducationSuggestion)initWithCoder:(id)a3;
- (ATXUserEducationSuggestion)initWithRandomUUID;
- (ATXUserEducationSuggestion)initWithUUID:(id)a3;
- (NSUUID)uuid;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXUserEducationSuggestion

- (ATXUserEducationSuggestion)initWithUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUserEducationSuggestion;
  v6 = [(ATXUserEducationSuggestion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uuid, a3);
  }

  return v7;
}

- (ATXUserEducationSuggestion)initWithRandomUUID
{
  v3 = objc_opt_new();
  v4 = [(ATXUserEducationSuggestion *)self initWithUUID:v3];

  return v4;
}

+ (int64_t)suggestionType
{
  return 0;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@ uuid: %@>", objc_opt_class(), self->_uuid];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATXUserEducationSuggestion)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_context_user_education_suggestions();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"DiscoverySuggestions.codingKeyForUUID" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.decode.ATXUserEducationSuggestion" errorCode:-7 logHandle:v7];

  objc_super v9 = [v4 error];

  if (v9)
  {
    v10 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v4 error];
      *(_DWORD *)buf = 136315394;
      v15 = "-[ATXUserEducationSuggestion initWithCoder:]";
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "%s: decoding error: %{public}@", buf, 0x16u);
    }
    v12 = 0;
  }
  else
  {
    v12 = (ATXUserEducationSuggestion *)[objc_alloc((Class)objc_opt_class()) initWithUUID:v8];
  }

  return v12;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

@end