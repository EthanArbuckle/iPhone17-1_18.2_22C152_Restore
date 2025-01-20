@interface MapsSuggestionsUniqueIdentifierDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
- (MapsSuggestionsUniqueIdentifierDeduper)initWithType:(int64_t)a3;
- (NSString)uniqueName;
@end

@implementation MapsSuggestionsUniqueIdentifierDeduper

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v17 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136446978;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUniqueIdentifierDeduper.m";
    __int16 v23 = 1024;
    int v24 = 46;
    __int16 v25 = 2082;
    v26 = "-[MapsSuggestionsUniqueIdentifierDeduper dedupeByEnrichingEntry:withEntry:]";
    __int16 v27 = 2082;
    v28 = "nil == (originalEntry)";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_16:
    _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x26u);
    goto LABEL_17;
  }
  if (!v7)
  {
    v17 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136446978;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUniqueIdentifierDeduper.m";
    __int16 v23 = 1024;
    int v24 = 47;
    __int16 v25 = 2082;
    v26 = "-[MapsSuggestionsUniqueIdentifierDeduper dedupeByEnrichingEntry:withEntry:]";
    __int16 v27 = 2082;
    v28 = "nil == (entry)";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
    goto LABEL_16;
  }
  v9 = [v6 uniqueIdentifier];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    v17 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136446978;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUniqueIdentifierDeduper.m";
    __int16 v23 = 1024;
    int v24 = 48;
    __int16 v25 = 2082;
    v26 = "-[MapsSuggestionsUniqueIdentifierDeduper dedupeByEnrichingEntry:withEntry:]";
    __int16 v27 = 2082;
    v28 = "0u == originalEntry.uniqueIdentifier.length";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Every suggestion entry requires a .uniqueIdentifier by contract.";
    goto LABEL_16;
  }
  v11 = [v8 uniqueIdentifier];
  uint64_t v12 = [v11 length];

  if (!v12)
  {
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUniqueIdentifierDeduper.m";
      __int16 v23 = 1024;
      int v24 = 49;
      __int16 v25 = 2082;
      v26 = "-[MapsSuggestionsUniqueIdentifierDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v27 = 2082;
      v28 = "0u == entry.uniqueIdentifier.length";
      v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Every suggestion entry requires a .uniqueIdentifier by contract.";
      goto LABEL_16;
    }
LABEL_17:

LABEL_18:
    BOOL v16 = 0;
    goto LABEL_19;
  }
  if (!MapsSuggestionsEntriesAreBothOfType(self->_type, v6, v8)) {
    goto LABEL_18;
  }
  v13 = [v6 uniqueIdentifier];
  v14 = [v8 uniqueIdentifier];
  int v15 = [v13 isEqualToString:v14];

  if (!v15) {
    goto LABEL_18;
  }
  LOWORD(v20) = 256;
  BOOL v16 = 1;
  objc_msgSend(v6, "mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:", v8, 1, 0, 1, 0, 0, v20);
LABEL_19:

  return v16;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (MapsSuggestionsUniqueIdentifierDeduper)initWithType:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsUniqueIdentifierDeduper;
  v4 = [(MapsSuggestionsUniqueIdentifierDeduper *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    id v6 = [NSString alloc];
    id v7 = [(id)objc_opt_class() description];
    v8 = NSStringFromMapsSuggestionsEntryType(v5->_type);
    uint64_t v9 = [v6 initWithFormat:@"%@_%@", v7, v8];
    name = v5->_name;
    v5->_name = (NSString *)v9;
  }
  return v5;
}

- (NSString)uniqueName
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end