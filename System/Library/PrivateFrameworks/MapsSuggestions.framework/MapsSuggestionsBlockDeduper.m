@interface MapsSuggestionsBlockDeduper
+ (BOOL)isEnabled;
+ (id)deduperWithBlock:(id)a3;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
- (MapsSuggestionsBlockDeduper)initWithBlock:(id)a3;
@end

@implementation MapsSuggestionsBlockDeduper

+ (id)deduperWithBlock:(id)a3
{
  id v3 = a3;
  v4 = [[MapsSuggestionsBlockDeduper alloc] initWithBlock:v3];

  return v4;
}

- (MapsSuggestionsBlockDeduper)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsBlockDeduper;
  v5 = [(MapsSuggestionsBlockDeduper *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id block = v5->_block;
    v5->_id block = v6;
  }
  return v5;
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBlockDeduper.m";
      __int16 v15 = 1024;
      int v16 = 41;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsBlockDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v19 = 2082;
      v20 = "nil == (originalEntry)";
      v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original entry";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x26u);
    }
LABEL_9:

    char v9 = 0;
    goto LABEL_10;
  }
  if (!v7)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBlockDeduper.m";
      __int16 v15 = 1024;
      int v16 = 42;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsBlockDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v19 = 2082;
      v20 = "nil == (entry)";
      v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a entry";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  char v9 = (*((uint64_t (**)(void))self->_block + 2))();
LABEL_10:

  return v9;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void).cxx_destruct
{
}

@end