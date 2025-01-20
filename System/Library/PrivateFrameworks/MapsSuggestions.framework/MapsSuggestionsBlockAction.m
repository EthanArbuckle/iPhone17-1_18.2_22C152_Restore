@interface MapsSuggestionsBlockAction
- (MapsSuggestionsBlockAction)initWithName:(id)a3 block:(id)a4;
- (void)actWithHandler:(id)a3;
@end

@implementation MapsSuggestionsBlockAction

- (MapsSuggestionsBlockAction)initWithName:(id)a3 block:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBlockAction.m";
      __int16 v19 = 1024;
      int v20 = 27;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsBlockAction initWithName:block:]";
      __int16 v23 = 2082;
      v24 = "nil == (name)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x26u);
    }
LABEL_11:

    v12 = 0;
    goto LABEL_12;
  }
  if (!v7)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBlockAction.m";
      __int16 v19 = 1024;
      int v20 = 28;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsBlockAction initWithName:block:]";
      __int16 v23 = 2082;
      v24 = "nil == (block)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an action block";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v16.receiver = self;
  v16.super_class = (Class)MapsSuggestionsBlockAction;
  v9 = [(MapsSuggestionsBaseAction *)&v16 initWithName:v6];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id block = v9->_block;
    v9->_id block = (id)v10;
  }
  self = v9;
  v12 = self;
LABEL_12:

  return v12;
}

- (void)actWithHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end