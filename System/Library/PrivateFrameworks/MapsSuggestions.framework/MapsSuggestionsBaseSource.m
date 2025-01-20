@interface MapsSuggestionsBaseSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (MapsSuggestionsBaseSource)initWithDelegate:(id)a3 name:(id)a4;
- (MapsSuggestionsSourceDelegate)delegate;
- (NSString)uniqueName;
- (double)updateSuggestionEntriesOfType:(int64_t)a3 handler:(id)a4;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (unint64_t)addOrUpdateMySuggestionEntries:(id)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MapsSuggestionsBaseSource

- (MapsSuggestionsBaseSource)initWithDelegate:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MapsSuggestionsBaseSource;
  v8 = [(MapsSuggestionsBaseSource *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v10 = [v7 copy];
    name = v9->_name;
    v9->_name = (NSString *)v10;
  }
  return v9;
}

- (unint64_t)addOrUpdateMySuggestionEntries:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(MapsSuggestionsBaseSource *)self delegate];
    id v6 = [(MapsSuggestionsBaseSource *)self uniqueName];
    unint64_t v7 = [v5 addOrUpdateSuggestionEntries:v4 source:v6];
  }
  else
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseSource.m";
      __int16 v12 = 1024;
      int v13 = 105;
      __int16 v14 = 2082;
      v15 = "-[MapsSuggestionsBaseSource addOrUpdateMySuggestionEntries:]";
      __int16 v16 = 2082;
      v17 = "nil == (entries)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires zero or more entries", (uint8_t *)&v10, 0x26u);
    }

    unint64_t v7 = 0;
  }

  return v7;
}

- (MapsSuggestionsSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MapsSuggestionsSourceDelegate *)WeakRetained;
}

- (NSString)uniqueName
{
  return self->_name;
}

- (void)setDelegate:(id)a3
{
}

+ (BOOL)isEnabled
{
  BOOL result = [a1 doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

+ (unint64_t)disposition
{
  unint64_t result = [a1 doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id result = (id)[(MapsSuggestionsBaseSource *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (id)initFromResourceDepot:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() description];
  id v6 = [(MapsSuggestionsBaseSource *)self initFromResourceDepot:v4 name:v5];

  return v6;
}

- (void)start
{
}

- (void)stop
{
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v5 = a3;
  [(MapsSuggestionsBaseSource *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (double)updateSuggestionEntriesOfType:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  if (!a3 || (double v7 = 0.0, [(MapsSuggestionsBaseSource *)self canProduceEntriesOfType:a3]))
  {
    [(MapsSuggestionsBaseSource *)self updateSuggestionEntriesWithHandler:v6];
    double v7 = v8;
  }

  return v7;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  BOOL result = [(MapsSuggestionsBaseSource *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL result = [(MapsSuggestionsBaseSource *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
}

@end