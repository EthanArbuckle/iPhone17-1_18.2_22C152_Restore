@interface ATXUserEducationSuggestionFeedbackMetric
- (ATXUserEducationSuggestionFeedback)feedback;
- (ATXUserEducationSuggestionFeedbackMetric)initWithFeedback:(id)a3;
- (id)coreAnalyticsDictionary;
@end

@implementation ATXUserEducationSuggestionFeedbackMetric

- (ATXUserEducationSuggestionFeedbackMetric)initWithFeedback:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUserEducationSuggestionFeedbackMetric;
  v6 = [(_ATXCoreAnalyticsMetric *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_feedback, a3);
  }

  return v7;
}

- (id)coreAnalyticsDictionary
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"feedbackType";
  [(ATXUserEducationSuggestionFeedback *)self->_feedback feedbackType];
  v2 = ATXUserEducationSuggestionFeedbackTypeToString();
  v3 = v2;
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!v2) {

  }
  return v4;
}

- (ATXUserEducationSuggestionFeedback)feedback
{
  return self->_feedback;
}

- (void).cxx_destruct
{
}

@end