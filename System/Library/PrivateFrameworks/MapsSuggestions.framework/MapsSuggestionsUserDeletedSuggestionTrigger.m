@interface MapsSuggestionsUserDeletedSuggestionTrigger
- (MapsSuggestionsUserDeletedSuggestionTrigger)initWithName:(id)a3;
- (MapsSuggestionsUserDeletedSuggestionTrigger)initWithNotificationName:(const char *)a3 triggerName:(id)a4;
@end

@implementation MapsSuggestionsUserDeletedSuggestionTrigger

- (MapsSuggestionsUserDeletedSuggestionTrigger)initWithNotificationName:(const char *)a3 triggerName:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136446978;
    v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUserDeletedSuggestionTrigger.m";
    __int16 v9 = 1024;
    int v10 = 20;
    __int16 v11 = 2082;
    v12 = "-[MapsSuggestionsUserDeletedSuggestionTrigger initWithNotificationName:triggerName:]";
    __int16 v13 = 2082;
    v14 = "YES";
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You should call -init", (uint8_t *)&v7, 0x26u);
  }

  return [(MapsSuggestionsUserDeletedSuggestionTrigger *)self init];
}

- (MapsSuggestionsUserDeletedSuggestionTrigger)initWithName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsUserDeletedSuggestionTrigger;
  return [(MapsSuggestionsDarwinNotificationTrigger *)&v4 initWithNotificationName:"com.apple.maps.userdeleted" triggerName:a3];
}

@end