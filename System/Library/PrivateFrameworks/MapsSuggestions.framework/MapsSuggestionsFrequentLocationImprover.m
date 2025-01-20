@interface MapsSuggestionsFrequentLocationImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsFrequentLocationImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v20 = 136446978;
      *(void *)&v20[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFrequentLocationImprover.m";
      *(_WORD *)&v20[12] = 1024;
      *(_DWORD *)&v20[14] = 27;
      *(_WORD *)&v20[18] = 2082;
      *(void *)&v20[20] = "-[MapsSuggestionsFrequentLocationImprover improveEntry:]";
      *(_WORD *)&v20[28] = 2082;
      *(void *)&v20[30] = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", v20, 0x26u);
    }
    LOBYTE(v13) = 0;
    goto LABEL_27;
  }
  if ([v4 type] == 4)
  {
    v6 = [v5 geoMapItem];

    if (v6)
    {
      v7 = [v5 geoMapItem];
      v8 = [v5 stringForKey:@"MapsSuggestionsCoreRoutineLabel"];
      v9 = MapsSuggestionsMapItemCityName(v7);
      if (![v8 length]
        && [v7 _hasMUID]
        && [v7 _muid])
      {
        uint64_t v10 = [v7 name];

        v8 = (void *)v10;
      }
      v11 = MapsSuggestionsMapItemStreetName(v7);
      if ([v8 length] || !objc_msgSend(v11, "length"))
      {
        v12 = 0;
      }
      else
      {
        id v14 = v11;

        v12 = MapsSuggestionsLocalizedFrequentLocationNearStreetTitleString(v14);
        *(void *)v20 = MEMORY[0x1E4F143A8];
        *(void *)&v20[8] = 3221225472;
        *(void *)&v20[16] = ___MapsSuggestionsBundle_block_invoke_1;
        *(void *)&v20[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&v20[32] = "FrequentLocationImprover";
        if (qword_1EB6F0150 != -1) {
          dispatch_once(&qword_1EB6F0150, v20);
        }
        v15 = objc_msgSend((id)_MergedGlobals_29, "localizedStringForKey:value:table:", @"MAPS_SUGG_FREQ_LOC_SUBTITLE", @"Significant Location<unlocalized>", 0, *(void *)v20, *(_OWORD *)&v20[8], *(_OWORD *)&v20[24], v21);
        uint64_t v16 = MapsSuggestionsNonNilString(v15, &stru_1EFC640F8);

        v8 = v14;
        v9 = (void *)v16;
      }
      [v5 setString:v8 forKey:@"MapsSuggestionsFrequentLocationTitleWithoutNearKey"];
      if ([v9 length]) {
        int v13 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v9, v5);
      }
      else {
        int v13 = 0;
      }
      if ([v12 length]) {
        v13 |= -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v12, v5);
      }
      if (![v5 containsKey:@"MapsSuggestionsNeedsETATrackingKey"]
        || ([v5 BOOLeanForKey:@"MapsSuggestionsNeedsETATrackingKey"] & 1) == 0)
      {
        LOBYTE(v13) = 1;
        [v5 setBoolean:1 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
      }
      v17 = MapsSuggestionsLocalizedHideInMapsString();
      [v5 setString:v17 forKey:@"MapsSuggestionsRemovalBehaviorStringForHide"];

      v18 = MapsSuggestionsLocalizedForgetMyVisitsString();
      [v5 setString:v18 forKey:@"MapsSuggestionsRemovalBehaviorStringForForget"];

LABEL_27:
      goto LABEL_28;
    }
  }
  LOBYTE(v13) = 0;
LABEL_28:

  return v13;
}

@end