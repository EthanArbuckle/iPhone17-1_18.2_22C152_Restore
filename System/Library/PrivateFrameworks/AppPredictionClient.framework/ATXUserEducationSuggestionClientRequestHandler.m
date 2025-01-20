@interface ATXUserEducationSuggestionClientRequestHandler
- (ATXUserEducationSuggestionClientRequestHandler)initWithClient:(id)a3;
- (void)didReceiveUserEducationSuggestionEvent:(id)a3;
@end

@implementation ATXUserEducationSuggestionClientRequestHandler

- (ATXUserEducationSuggestionClientRequestHandler)initWithClient:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATXUserEducationSuggestionClientRequestHandler;
  v5 = [(ATXUserEducationSuggestionClientRequestHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_client, v4);
  }

  return v6;
}

- (void)didReceiveUserEducationSuggestionEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_context_user_education_suggestions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    objc_super v8 = "-[ATXUserEducationSuggestionClientRequestHandler didReceiveUserEducationSuggestionEvent:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%s: received suggestion event: %@", (uint8_t *)&v7, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  [WeakRetained notifyObserversOfSuggestionEvent:v4];
}

- (void).cxx_destruct
{
}

@end