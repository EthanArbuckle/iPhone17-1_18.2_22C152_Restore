@interface MapsSuggestionsHotelTitleFormatter
- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4;
@end

@implementation MapsSuggestionsHotelTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v16 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v19 = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHotelTitleFormatter.m";
    __int16 v21 = 1024;
    int v22 = 21;
    __int16 v23 = 2082;
    v24 = "-[MapsSuggestionsHotelTitleFormatter formatTitlesForEntry:eta:]";
    __int16 v25 = 2082;
    v26 = "nil == (entry)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_14:
    _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v19, 0x26u);
    goto LABEL_15;
  }
  if (!v7)
  {
    v16 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v19 = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHotelTitleFormatter.m";
    __int16 v21 = 1024;
    int v22 = 22;
    __int16 v23 = 2082;
    v24 = "-[MapsSuggestionsHotelTitleFormatter formatTitlesForEntry:eta:]";
    __int16 v25 = 2082;
    v26 = "nil == (eta)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
    goto LABEL_14;
  }
  if ([v6 type] != 13)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHotelTitleFormatter.m";
      __int16 v21 = 1024;
      int v22 = 23;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsHotelTitleFormatter formatTitlesForEntry:eta:]";
      __int16 v25 = 2082;
      v26 = "entry.type != MapsSuggestionsEntryTypeHotel";
      v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a Hotel entry";
      goto LABEL_14;
    }
LABEL_15:

    char v15 = 0;
    goto LABEL_16;
  }
  [v8 seconds];
  v10 = NSStringFromMapsSuggestionsShortETA(v9);
  v11 = [v6 undecoratedSubtitle];
  if ([v10 length]
    && [(MapsSuggestionsEventETATitleFormatter *)self shouldDecorateEntry:v6 withETA:v8])
  {
    v12 = MapsSuggestionsLocalizedStringFromGEOTransportType([v8 transportType]);
    uint64_t v13 = MapsSuggestionsLocalizedETAFormatString(v10, v12);

    v11 = (void *)v13;
  }
  v14 = [v6 title];
  char v15 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v6, v14, v11, 0);

LABEL_16:
  return v15;
}

@end