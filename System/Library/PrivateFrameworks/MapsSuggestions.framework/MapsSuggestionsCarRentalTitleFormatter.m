@interface MapsSuggestionsCarRentalTitleFormatter
- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4;
@end

@implementation MapsSuggestionsCarRentalTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v18 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    int v21 = 136446978;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCarRentalTitleFormatter.m";
    __int16 v23 = 1024;
    int v24 = 24;
    __int16 v25 = 2082;
    v26 = "-[MapsSuggestionsCarRentalTitleFormatter formatTitlesForEntry:eta:]";
    __int16 v27 = 2082;
    v28 = "nil == (entry)";
    v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_17:
    _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v21, 0x26u);
    goto LABEL_18;
  }
  if (!v7)
  {
    v18 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    int v21 = 136446978;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCarRentalTitleFormatter.m";
    __int16 v23 = 1024;
    int v24 = 25;
    __int16 v25 = 2082;
    v26 = "-[MapsSuggestionsCarRentalTitleFormatter formatTitlesForEntry:eta:]";
    __int16 v27 = 2082;
    v28 = "nil == (eta)";
    v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
    goto LABEL_17;
  }
  if ([v6 type] != 14)
  {
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCarRentalTitleFormatter.m";
      __int16 v23 = 1024;
      int v24 = 26;
      __int16 v25 = 2082;
      v26 = "-[MapsSuggestionsCarRentalTitleFormatter formatTitlesForEntry:eta:]";
      __int16 v27 = 2082;
      v28 = "entry.type != MapsSuggestionsEntryTypeCarRental";
      v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Needs to be a Car Rental entry";
      goto LABEL_17;
    }
LABEL_18:

    char v17 = 0;
    goto LABEL_19;
  }
  [v8 seconds];
  v10 = NSStringFromMapsSuggestionsShortETA(v9);
  v11 = [v6 undecoratedSubtitle];
  if (([v6 BOOLeanForKey:@"MapsSuggestionsCalendarCarRentalIsPickupDayKey"] & 1) == 0
    && -[MapsSuggestionsEventETATitleFormatter shouldDecorateEntry:withETA:](self, "shouldDecorateEntry:withETA:", v6, v8)&& [v10 length])
  {
    v12 = MapsSuggestionsLocalizedStringFromGEOTransportType([v8 transportType]);
    uint64_t v13 = qword_1EB6F01E0;
    id v14 = v10;
    if (v13 != -1) {
      dispatch_once(&qword_1EB6F01E0, &__block_literal_global_10);
    }
    uint64_t v15 = (*(void (**)(uint64_t, id, void *))(_MergedGlobals_36 + 16))(_MergedGlobals_36, v14, v12);

    v11 = (void *)v15;
  }
  v16 = [v6 title];
  char v17 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v6, v16, v11, 0);

LABEL_19:
  return v17;
}

@end