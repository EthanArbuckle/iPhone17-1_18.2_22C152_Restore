@interface MapsSuggestionsBaseTitleFormatter
- (BOOL)resetTitlesForEntry:(id)a3;
- (NSString)uniqueName;
- (uint64_t)updateMyChangedTitlesForEntry:(void *)a3 title:(void *)a4 subtitle:(int)a5 includeLockedVersions:;
@end

@implementation MapsSuggestionsBaseTitleFormatter

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (BOOL)resetTitlesForEntry:(id)a3
{
  id v4 = a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "resetTitlesForEntry", v10, 2u);
  }

  v6 = [v4 undecoratedTitle];
  v7 = [v4 undecoratedSubtitle];
  char v8 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v4, v6, v7, 1);

  return v8;
}

- (uint64_t)updateMyChangedTitlesForEntry:(void *)a3 title:(void *)a4 subtitle:(int)a5 includeLockedVersions:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (!a1) {
    goto LABEL_20;
  }
  if (v9)
  {
    if (v10
      && ([v9 title],
          v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v10 isEqualToString:v12],
          v12,
          (v13 & 1) == 0))
    {
      [v9 setTitle:v10];
      a1 = 1;
      if (!v11) {
        goto LABEL_13;
      }
    }
    else
    {
      a1 = 0;
      if (!v11)
      {
LABEL_13:
        if (a5)
        {
          if (v10)
          {
            v17 = [v9 titleWhenLocked];
            char v18 = [v10 isEqualToString:v17];

            if ((v18 & 1) == 0)
            {
              [v9 setTitleWhenLocked:v10];
              a1 = 1;
            }
          }
          if (v11)
          {
            v19 = [v9 subtitleWhenLocked];
            char v20 = [v11 isEqualToString:v19];

            if ((v20 & 1) == 0)
            {
              [v9 setSubtitleWhenLocked:v11];
              a1 = 1;
            }
          }
        }
        goto LABEL_20;
      }
    }
    v15 = [v9 subtitle];
    char v16 = [v11 isEqualToString:v15];

    if ((v16 & 1) == 0)
    {
      [v9 setSubtitle:v11];
      a1 = 1;
    }
    goto LABEL_13;
  }
  v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v22 = 136446978;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseTitleFormatter.m";
    __int16 v24 = 1024;
    int v25 = 51;
    __int16 v26 = 2082;
    v27 = "-[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]";
    __int16 v28 = 2082;
    v29 = "nil == (entry)";
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v22, 0x26u);
  }

  a1 = 0;
LABEL_20:

  return a1;
}

@end