@interface ATXUserEducationSuggestionFocusModeSetup
+ (BOOL)supportsSecureCoding;
+ (int64_t)suggestionType;
- (ATXUserEducationSuggestionFocusModeSetup)initWithCoder:(id)a3;
- (ATXUserEducationSuggestionFocusModeSetup)initWithModeSemanticType:(int64_t)a3;
- (id)description;
- (int64_t)modeSemanticType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXUserEducationSuggestionFocusModeSetup

- (ATXUserEducationSuggestionFocusModeSetup)initWithModeSemanticType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXUserEducationSuggestionFocusModeSetup;
  result = [(ATXUserEducationSuggestion *)&v5 initWithRandomUUID];
  if (result) {
    result->_modeSemanticType = a3;
  }
  return result;
}

+ (int64_t)suggestionType
{
  return 3;
}

- (id)description
{
  id v2 = [NSString alloc];
  uint64_t v3 = objc_opt_class();
  v4 = DNDModeSemanticTypeToString();
  objc_super v5 = (void *)[v2 initWithFormat:@"<%@ modeSemanticType: %@>", v3, v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXUserEducationSuggestionFocusModeSetup;
  id v4 = a3;
  [(ATXUserEducationSuggestion *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_modeSemanticType, @"DiscoverySuggestions.codingKeyForModeSemanticType", v5.receiver, v5.super_class);
}

- (ATXUserEducationSuggestionFocusModeSetup)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXUserEducationSuggestionFocusModeSetup;
  objc_super v5 = [(ATXUserEducationSuggestion *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_modeSemanticType = [v4 decodeIntegerForKey:@"DiscoverySuggestions.codingKeyForModeSemanticType"];
    v6 = [v4 error];

    if (!v6)
    {
      v9 = v5;
      goto LABEL_9;
    }
    v7 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v4 error];
      *(_DWORD *)buf = 136315394;
      v13 = "-[ATXUserEducationSuggestionFocusModeSetup initWithCoder:]";
      __int16 v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "%s: decoding error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v7 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXUserEducationSuggestionFocusModeSetup initWithCoder:](v7);
    }
  }

  v9 = 0;
LABEL_9:

  return v9;
}

- (int64_t)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  id v2 = "-[ATXUserEducationSuggestionFocusModeSetup initWithCoder:]";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: decoding issue, got nil instance", (uint8_t *)&v1, 0xCu);
}

@end