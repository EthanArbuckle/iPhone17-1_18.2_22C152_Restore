@interface MapsSuggestionsBaseImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
- (NSString)uniqueName;
- (uint64_t)improveMyUndecoratedSubtitle:(void *)a3 forEntry:;
- (uint64_t)improveMyUndecoratedTitle:(void *)a3 forEntry:;
@end

@implementation MapsSuggestionsBaseImprover

- (uint64_t)improveMyUndecoratedTitle:(void *)a3 forEntry:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v6)
    {
      a1 = [v6 updateUndecoratedTitle:v5];
    }
    else
    {
      v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136446978;
        v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseImprover.m";
        __int16 v12 = 1024;
        int v13 = 30;
        __int16 v14 = 2082;
        v15 = "-[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]";
        __int16 v16 = 2082;
        v17 = "nil == (entry)";
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v10, 0x26u);
      }

      a1 = 0;
    }
  }

  return a1;
}

- (uint64_t)improveMyUndecoratedSubtitle:(void *)a3 forEntry:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v6)
    {
      a1 = [v6 updateUndecoratedSubtitle:v5];
    }
    else
    {
      v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136446978;
        v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseImprover.m";
        __int16 v12 = 1024;
        int v13 = 37;
        __int16 v14 = 2082;
        v15 = "-[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]";
        __int16 v16 = 2082;
        v17 = "nil == (entry)";
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v10, 0x26u);
      }

      a1 = 0;
    }
  }

  return a1;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (BOOL)improveEntry:(id)a3
{
  id v5 = a3;
  BOOL result = [(MapsSuggestionsBaseImprover *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

+ (BOOL)isEnabled
{
  BOOL result = [a1 doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

@end