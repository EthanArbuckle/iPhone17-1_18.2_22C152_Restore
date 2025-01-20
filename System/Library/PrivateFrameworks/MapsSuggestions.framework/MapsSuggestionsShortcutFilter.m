@interface MapsSuggestionsShortcutFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsShortcutFilter

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutFilter.m";
      __int16 v10 = 1024;
      int v11 = 21;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsShortcutFilter shouldKeepEntry:]";
      __int16 v14 = 2082;
      v15 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Required suggestion entry", (uint8_t *)&v8, 0x26u);
    }

    goto LABEL_9;
  }
  if ([v3 type] == 18
    || [v4 containsKey:@"MapsSuggestionsShortcutOnlyKey"]
    && ([v4 BOOLeanForKey:@"MapsSuggestionsShortcutOnlyKey"] & 1) != 0)
  {
LABEL_9:
    BOOL v5 = 0;
    goto LABEL_10;
  }
  BOOL v5 = 1;
LABEL_10:

  return v5;
}

@end