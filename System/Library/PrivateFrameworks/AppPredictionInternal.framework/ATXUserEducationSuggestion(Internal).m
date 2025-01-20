@interface ATXUserEducationSuggestion(Internal)
- (BOOL)suggestionWasAlreadyDismissed;
- (BOOL)suggestionWasAlreadyShown;
- (__CFString)userDefaultsKeyForTrackingSuggestionState;
- (id)userDefaults;
- (uint64_t)metricClass;
- (uint64_t)readSuggestionState;
- (uint64_t)server;
- (void)logFeedback:()Internal;
- (void)writeSuggestionState:()Internal;
@end

@implementation ATXUserEducationSuggestion(Internal)

- (BOOL)suggestionWasAlreadyShown
{
  return (unint64_t)([a1 readSuggestionState] - 1) < 2;
}

- (BOOL)suggestionWasAlreadyDismissed
{
  return [a1 readSuggestionState] == 2;
}

- (__CFString)userDefaultsKeyForTrackingSuggestionState
{
  return @"DiscoverySuggestions.State";
}

- (id)userDefaults
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v1 = (void *)[v0 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  return v1;
}

- (void)writeSuggestionState:()Internal
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = [a1 userDefaults];
  v6 = [a1 userDefaultsKeyForTrackingSuggestionState];
  [v5 setInteger:a3 forKey:v6];

  v7 = __atxlog_handle_context_user_education_suggestions();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = ATXUserEducationSuggestionStateToString(a3);
    int v9 = 136315650;
    v10 = "-[ATXUserEducationSuggestion(Internal) writeSuggestionState:]";
    __int16 v11 = 2114;
    v12 = a1;
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%s: Recorded suggestion %{public}@ as %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (uint64_t)readSuggestionState
{
  v2 = [a1 userDefaults];
  v3 = [a1 userDefaultsKeyForTrackingSuggestionState];
  uint64_t v4 = [v2 integerForKey:v3];

  return v4;
}

- (void)logFeedback:()Internal
{
  id v4 = a3;
  v5 = [a1 server];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__ATXUserEducationSuggestion_Internal__logFeedback___block_invoke;
  v7[3] = &unk_1E68AB870;
  id v8 = v4;
  int v9 = a1;
  id v6 = v4;
  [v5 performBlockOnInternalSerialQueue:v7];
}

- (uint64_t)metricClass
{
  return 0;
}

- (uint64_t)server
{
  return 0;
}

@end