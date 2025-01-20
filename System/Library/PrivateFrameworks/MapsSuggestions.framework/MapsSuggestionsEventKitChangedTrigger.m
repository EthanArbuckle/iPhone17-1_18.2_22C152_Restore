@interface MapsSuggestionsEventKitChangedTrigger
- (MapsSuggestionsEventKitChangedTrigger)initWithEventKit:(id)a3;
- (void)didAddFirstObserver;
- (void)didRemoveLastObserver;
- (void)eventKitDidChange:(id)a3;
@end

@implementation MapsSuggestionsEventKitChangedTrigger

- (MapsSuggestionsEventKitChangedTrigger)initWithEventKit:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)MapsSuggestionsEventKitChangedTrigger;
    v6 = [(MapsSuggestionsBaseTrigger *)&v11 initWithName:@"MapsSuggestionsEventKitChangedTrigger"];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_eventKit, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/Resources/MapsSuggestionsEventKitChangedTrigger.m";
      __int16 v14 = 1024;
      int v15 = 26;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsEventKitChangedTrigger initWithEventKit:]";
      __int16 v18 = 2082;
      v19 = "nil == (eventKit)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one EventKit", buf, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)didAddFirstObserver
{
}

- (void)didRemoveLastObserver
{
}

- (void)eventKitDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  eventKit = self->_eventKit;
  v6 = GEOFindOrCreateLog();
  v7 = v6;
  if (eventKit == a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "Detected change in EventKit", (uint8_t *)&v8, 2u);
    }

    [(MapsSuggestionsBaseTrigger *)self triggerMyObservers];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/Resources/MapsSuggestionsEventKitChangedTrigger.m";
      __int16 v10 = 1024;
      int v11 = 53;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsEventKitChangedTrigger eventKitDidChange:]";
      __int16 v14 = 2082;
      int v15 = "eventKit != _eventKit";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Received change for the wrong EventKit?!", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void).cxx_destruct
{
}

@end