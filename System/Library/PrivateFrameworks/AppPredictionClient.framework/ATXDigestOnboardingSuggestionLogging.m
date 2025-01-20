@interface ATXDigestOnboardingSuggestionLogging
- (ATXDigestOnboardingSuggestionLogging)init;
- (ATXDigestOnboardingSuggestionLogging)initWithDigestOnboardingSuggestionLoggingBiomeStream:(id)a3;
- (void)logDigestOnboardingSuggestionWithOutcome:(int)a3 timeToResolution:(double)a4;
@end

@implementation ATXDigestOnboardingSuggestionLogging

- (ATXDigestOnboardingSuggestionLogging)initWithDigestOnboardingSuggestionLoggingBiomeStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXDigestOnboardingSuggestionLogging;
  v6 = [(ATXDigestOnboardingSuggestionLogging *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_digestOnboardingSuggestionLoggingBiomeStream, a3);
  }

  return v7;
}

- (ATXDigestOnboardingSuggestionLogging)init
{
  v3 = objc_opt_new();
  v4 = [(ATXDigestOnboardingSuggestionLogging *)self initWithDigestOnboardingSuggestionLoggingBiomeStream:v3];

  return v4;
}

- (void)logDigestOnboardingSuggestionWithOutcome:(int)a3 timeToResolution:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  id v9 = (id)objc_opt_new();
  v7 = [[ATXDigestOnboardingSuggestionLoggingEvent alloc] initWithSessionUUID:v9 outcome:v5 timeToResolution:a4];
  v8 = [(ATXDigestOnboardingSuggestionLoggingBiomeStream *)self->_digestOnboardingSuggestionLoggingBiomeStream source];
  [v8 sendEvent:v7];
}

- (void).cxx_destruct
{
}

@end