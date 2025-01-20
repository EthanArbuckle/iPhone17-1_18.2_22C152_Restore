@interface MapsSuggestionsHomeWorkSchoolDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
@end

@implementation MapsSuggestionsHomeWorkSchoolDeduper

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 136446978;
      *(void *)&v24[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHomeWorkSchoolDeduper.m";
      __int16 v25 = 1024;
      int v26 = 51;
      __int16 v27 = 2082;
      v28 = "-[MapsSuggestionsHomeWorkSchoolDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v29 = 2082;
      v30 = "nil == (originalEntry)";
      v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_19:
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_ERROR, v18, v24, 0x26u);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!v6)
  {
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 136446978;
      *(void *)&v24[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHomeWorkSchoolDeduper.m";
      __int16 v25 = 1024;
      int v26 = 52;
      __int16 v27 = 2082;
      v28 = "-[MapsSuggestionsHomeWorkSchoolDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v29 = 2082;
      v30 = "nil == (entry)";
      v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (([v5 hasMultipleWaypointsLeft] & 1) != 0
    || ([v7 hasMultipleWaypointsLeft] & 1) != 0)
  {
    goto LABEL_21;
  }
  unint64_t v8 = [v7 type];
  LOBYTE(v9) = 0;
  if (v8 > 0x13 || ((1 << v8) & 0x80006) == 0) {
    goto LABEL_22;
  }
  uint64_t v10 = [v5 type];
  if (v10 != [v7 type]) {
    goto LABEL_21;
  }
  v9 = [v5 geoMapItem];
  if (!v9) {
    goto LABEL_22;
  }
  v11 = [v7 geoMapItem];

  if (!v11
    || (*(void *)v24 = 0, (MapsSuggestionsDistanceBetweenEntries(v5, v7, v24) & 1) == 0)
    && (double v12 = *(double *)v24, GEOConfigGetDouble(), v12 > v13))
  {
LABEL_21:
    LOBYTE(v9) = 0;
    goto LABEL_22;
  }
  v14 = [v5 geoMapItem];
  v15 = [v7 geoMapItem];
  char v16 = MapsSuggestionsMapItemsAreEqual(v14, v15, 0, 0, 0);

  if (v16) {
    goto LABEL_13;
  }
  v20 = [v5 geoMapItem];
  v17 = [v20 shortAddress];

  v21 = [v7 geoMapItem];
  v22 = [v21 shortAddress];

  if (!v17 || !v22)
  {

    goto LABEL_20;
  }
  int v23 = [v17 isEqualToString:v22];

  if (!v23) {
    goto LABEL_21;
  }
LABEL_13:
  LOBYTE(v9) = 1;
  if ((MapsSuggestionsMergeAsShortcut(v5, v7) & 1) == 0) {
    [v5 mergeFromSuggestionEntry:v7 behavior:1];
  }
LABEL_22:

  return (char)v9;
}

@end