@interface ATXUserEducationSuggestionFeedback
+ (BOOL)supportsSecureCoding;
- (ATXUserEducationSuggestion)userEducationSuggestion;
- (ATXUserEducationSuggestionFeedback)initWithCoder:(id)a3;
- (ATXUserEducationSuggestionFeedback)initWithUserEducationSuggestion:(id)a3 feedbackType:(unint64_t)a4;
- (id)description;
- (id)suggestion;
- (unint64_t)feedbackType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXUserEducationSuggestionFeedback

- (ATXUserEducationSuggestionFeedback)initWithUserEducationSuggestion:(id)a3 feedbackType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXUserEducationSuggestionFeedback;
  v8 = [(ATXUserEducationSuggestionFeedback *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userEducationSuggestion, a3);
    v9->_feedbackType = a4;
  }

  return v9;
}

- (id)suggestion
{
  return self->_userEducationSuggestion;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  userEducationSuggestion = self->_userEducationSuggestion;
  v6 = ATXUserEducationSuggestionFeedbackTypeToString(self->_feedbackType);
  id v7 = (void *)[v3 initWithFormat:@"<%@ userEducationSuggestion: %@ feedbackType: %@>", v4, userEducationSuggestion, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  userEducationSuggestion = self->_userEducationSuggestion;
  id v5 = a3;
  [v5 encodeObject:userEducationSuggestion forKey:@"ATXUserEducationSuggestionFeedback.codingKeyForUserEducationSuggestion"];
  [v5 encodeInteger:self->_feedbackType forKey:@"ATXUserEducationSuggestionFeedback.codingKeyForUserEducationSuggestionFeedbackType"];
}

- (ATXUserEducationSuggestionFeedback)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_context_user_education_suggestions();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"ATXUserEducationSuggestionFeedback.codingKeyForUserEducationSuggestion" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.decode.ATXUserEducationSuggestionFeedback" errorCode:-7 logHandle:v7];

  v9 = [v4 error];

  if (v9)
  {
    v10 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:
      v13 = [v4 error];
      *(_DWORD *)buf = 136315394;
      v17 = "-[ATXUserEducationSuggestionFeedback initWithCoder:]";
      __int16 v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "%s: decoding error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v11 = [v4 decodeIntegerForKey:@"ATXUserEducationSuggestionFeedback.codingKeyForUserEducationSuggestionFeedbackType"];
    v12 = [v4 error];

    if (!v12)
    {
      v14 = (ATXUserEducationSuggestionFeedback *)[objc_alloc((Class)objc_opt_class()) initWithUserEducationSuggestion:v8 feedbackType:v11];
      goto LABEL_8;
    }
    v10 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
  }

  v14 = 0;
LABEL_8:

  return v14;
}

- (ATXUserEducationSuggestion)userEducationSuggestion
{
  return self->_userEducationSuggestion;
}

- (unint64_t)feedbackType
{
  return self->_feedbackType;
}

- (void).cxx_destruct
{
}

@end