@interface ATXUserEducationSuggestionServerRequestHandler
- (void)logUserEducationSuggestionFeedback:(id)a3;
@end

@implementation ATXUserEducationSuggestionServerRequestHandler

- (void)logUserEducationSuggestionFeedback:(id)a3
{
  id v3 = a3;
  v4 = __atxlog_handle_context_user_education_suggestions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ATXUserEducationSuggestionServerRequestHandler logUserEducationSuggestionFeedback:]((uint64_t)v3, v4);
  }

  v5 = [v3 suggestion];
  [v5 logFeedback:v3];
}

- (void)logUserEducationSuggestionFeedback:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[ATXUserEducationSuggestionServerRequestHandler logUserEducationSuggestionFeedback:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "%s: Received feedback: %@", (uint8_t *)&v2, 0x16u);
}

@end