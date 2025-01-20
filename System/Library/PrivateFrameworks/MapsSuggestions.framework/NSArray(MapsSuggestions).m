@interface NSArray(MapsSuggestions)
- (id)MSg_copyIf:()MapsSuggestions;
- (id)MSg_mutableCopyIf:()MapsSuggestions;
@end

@implementation NSArray(MapsSuggestions)

- (id)MSg_copyIf:()MapsSuggestions
{
  v1 = objc_msgSend(a1, "MSg_mutableCopyIf:");
  v2 = (void *)[v1 copy];

  return v2;
}

- (id)MSg_mutableCopyIf:()MapsSuggestions
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = a1;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (v4[2](v4, v11)) {
            objc_msgSend(v5, "addObject:", v11, (void)v13);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCopyIf.m";
      __int16 v20 = 1024;
      int v21 = 23;
      __int16 v22 = 2082;
      v23 = "-[NSArray(MapsSuggestions) MSg_mutableCopyIf:]";
      __int16 v24 = 2082;
      v25 = "nil == (condition)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a condition block", buf, 0x26u);
    }
    v5 = 0;
  }

  return v5;
}

@end