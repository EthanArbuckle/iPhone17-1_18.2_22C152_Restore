@interface NSDictionary(MapsSuggestions)
- (NSObject)MSg_mutableCopyIf:()MapsSuggestions;
- (id)MSg_copyIf:()MapsSuggestions;
@end

@implementation NSDictionary(MapsSuggestions)

- (NSObject)MSg_mutableCopyIf:()MapsSuggestions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__NSDictionary_MapsSuggestions__MSg_mutableCopyIf___block_invoke;
    v11[3] = &unk_1E5CBA7B0;
    id v13 = v4;
    id v6 = v5;
    id v12 = v6;
    [a1 enumerateKeysAndObjectsUsingBlock:v11];
    v7 = v12;
    v8 = v6;

    v9 = v8;
  }
  else
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCopyIf.m";
      __int16 v16 = 1024;
      int v17 = 48;
      __int16 v18 = 2082;
      v19 = "-[NSDictionary(MapsSuggestions) MSg_mutableCopyIf:]";
      __int16 v20 = 2082;
      v21 = "nil == (condition)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a condition block", buf, 0x26u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)MSg_copyIf:()MapsSuggestions
{
  v1 = objc_msgSend(a1, "MSg_mutableCopyIf:");
  v2 = (void *)[v1 copy];

  return v2;
}

@end