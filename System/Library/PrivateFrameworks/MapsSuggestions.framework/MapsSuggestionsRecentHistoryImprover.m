@interface MapsSuggestionsRecentHistoryImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsRecentHistoryImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 type] == 5)
    {
      id v6 = [v5 geoMapItem];
      v7 = v6;
      id v8 = 0;
      if (!self || !v6) {
        goto LABEL_17;
      }
      v9 = [v6 eventName];
      uint64_t v10 = [v9 length];

      if (v10)
      {
        id v8 = [v7 eventName];
LABEL_17:

        char v18 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v8, v5);
        v19 = MapsSuggestionsLocalizedRecentlyViewedString();
        char v20 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v19, v5);

        char v12 = v18 | v20;
        goto LABEL_18;
      }
      v13 = MapsSuggestionsMapItemHomeWorkSchoolName(v7);
      v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        v16 = [v7 contactName];
        uint64_t v17 = [v16 length];

        if (v17)
        {
          id v15 = [v7 contactName];
        }
        else
        {
          v22 = [v7 name];
          uint64_t v23 = [v22 length];

          if (v23)
          {
            id v24 = [v7 name];
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            *(void *)&buf[24] = __Block_byref_object_copy__12;
            *(void *)&buf[32] = __Block_byref_object_dispose__12;
            id v27 = 0;
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = ___firstLineOfString_block_invoke_0;
            v25[3] = &unk_1E5CB8B80;
            v25[4] = buf;
            [v24 enumerateLinesUsingBlock:v25];
            id v8 = *(id *)(*(void *)&buf[8] + 40);
            _Block_object_dispose(buf, 8);

            goto LABEL_16;
          }
          id v15 = [v7 shortAddress];
        }
      }
      id v8 = v15;
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRecentHistoryImprover.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 23;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsRecentHistoryImprover improveEntry:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "entry == nil";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", buf, 0x26u);
    }
  }
  char v12 = 0;
LABEL_18:

  return v12;
}

@end