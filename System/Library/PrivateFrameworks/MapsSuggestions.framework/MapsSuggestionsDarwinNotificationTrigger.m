@interface MapsSuggestionsDarwinNotificationTrigger
- (MapsSuggestionsDarwinNotificationTrigger)initWithName:(id)a3;
- (MapsSuggestionsDarwinNotificationTrigger)initWithNotificationName:(const char *)a3;
- (MapsSuggestionsDarwinNotificationTrigger)initWithNotificationName:(const char *)a3 triggerName:(id)a4;
- (id)notificationName;
- (void)dealloc;
- (void)didAddFirstObserver;
- (void)didRemoveLastObserver;
@end

@implementation MapsSuggestionsDarwinNotificationTrigger

- (MapsSuggestionsDarwinNotificationTrigger)initWithNotificationName:(const char *)a3
{
  v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"MapsSuggestionsDarwinNotificationTrigger{%s}", a3);
  v6 = [(MapsSuggestionsDarwinNotificationTrigger *)self initWithNotificationName:a3 triggerName:v5];

  return v6;
}

- (MapsSuggestionsDarwinNotificationTrigger)initWithNotificationName:(const char *)a3 triggerName:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (!a3)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDarwinNotificationTrigger.m";
      __int16 v19 = 1024;
      int v20 = 31;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsDarwinNotificationTrigger initWithNotificationName:triggerName:]";
      __int16 v23 = 2082;
      v24 = "nil == (notificationName)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a notification name";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x26u);
    }
LABEL_11:

    v12 = 0;
    goto LABEL_12;
  }
  if (!v6)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDarwinNotificationTrigger.m";
      __int16 v19 = 1024;
      int v20 = 32;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsDarwinNotificationTrigger initWithNotificationName:triggerName:]";
      __int16 v23 = 2082;
      v24 = "nil == (triggerName)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a trigger name";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"MapsSuggestionsDarwinNotificationTrigger{%s}", a3);
  v16.receiver = self;
  v16.super_class = (Class)MapsSuggestionsDarwinNotificationTrigger;
  v9 = [(MapsSuggestionsBaseTrigger *)&v16 initWithName:v8];

  if (v9)
  {
    uint64_t v10 = [[NSString alloc] initWithUTF8String:a3];
    notificationName = v9->_notificationName;
    v9->_notificationName = (NSString *)v10;

    v9->_notificationToken = 0;
  }
  self = v9;
  v12 = self;
LABEL_12:

  return v12;
}

- (void)didAddFirstObserver
{
  v3 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4 = [(NSString *)self->_notificationName UTF8String];
  v5 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__MapsSuggestionsDarwinNotificationTrigger_didAddFirstObserver__block_invoke;
  v6[3] = &unk_1E5CB9CC0;
  objc_copyWeak(&v7, &location);
  notify_register_dispatch(v4, &self->_notificationToken, v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  int notificationToken = self->_notificationToken;
  if (notificationToken)
  {
    notify_cancel(notificationToken);
    self->_int notificationToken = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsDarwinNotificationTrigger;
  [(MapsSuggestionsDarwinNotificationTrigger *)&v4 dealloc];
}

- (MapsSuggestionsDarwinNotificationTrigger)initWithName:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136446978;
    id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDarwinNotificationTrigger.m";
    __int16 v8 = 1024;
    int v9 = 60;
    __int16 v10 = 2082;
    v11 = "-[MapsSuggestionsDarwinNotificationTrigger initWithName:]";
    __int16 v12 = 2082;
    v13 = "YES";
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You should use -initWithNotificationName: instead.", (uint8_t *)&v6, 0x26u);
  }

  return 0;
}

- (id)notificationName
{
  return self->_notificationName;
}

void __63__MapsSuggestionsDarwinNotificationTrigger_didAddFirstObserver__block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = GEOFindOrCreateLog();
  v5 = v4;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = WeakRetained[4];
      int v10 = 138412546;
      *(void *)v11 = v6;
      *(_WORD *)&v11[8] = 1024;
      int v12 = a2;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Received Darwin notification '%@' (%d)", (uint8_t *)&v10, 0x12u);
    }

    if (*((_DWORD *)WeakRetained + 10) != a2)
    {
      id v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v8 = *((_DWORD *)WeakRetained + 10);
        int v10 = 67109376;
        *(_DWORD *)v11 = v8;
        *(_WORD *)&v11[4] = 1024;
        *(_DWORD *)&v11[6] = a2;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "It may not have been for us: %d != %d, continuing", (uint8_t *)&v10, 0xEu);
      }
    }
    [WeakRetained triggerMyObservers];
  }
  else
  {
    int v9 = v4;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      *(void *)v11 = "MapsSuggestionsDarwinNotificationTrigger.m";
      *(_WORD *)&v11[8] = 1026;
      int v12 = 74;
      __int16 v13 = 2082;
      uint64_t v14 = "-[MapsSuggestionsDarwinNotificationTrigger didAddFirstObserver]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)didRemoveLastObserver
{
  v3 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  notify_cancel(self->_notificationToken);
  self->_int notificationToken = 0;
}

- (void).cxx_destruct
{
}

@end