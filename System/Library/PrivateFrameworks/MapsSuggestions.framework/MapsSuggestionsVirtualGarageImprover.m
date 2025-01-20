@interface MapsSuggestionsVirtualGarageImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsVirtualGarageImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarageImprover.m";
      __int16 v22 = 1024;
      int v23 = 23;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsVirtualGarageImprover improveEntry:]";
      __int16 v26 = 2082;
      v27 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an Entry", (uint8_t *)&v20, 0x26u);
    }

    goto LABEL_15;
  }
  if ([v4 type] != 20)
  {
LABEL_15:
    char v17 = 0;
    goto LABEL_16;
  }
  v6 = MapsSuggestionsLocalizedSubtitleForVehicleSetup();
  v7 = [v5 stringForKey:@"MapsSuggestionsVehicleSetupManufacturerKey"];
  v8 = MapsSuggestionsLocalizedTitleFormatForVehicleSetup(v7);
  if (!v7 || ![v7 length])
  {
    uint64_t v9 = MapsSuggestionsLocalizedBackupTitleFormatForVehicleSetup();

    v8 = (void *)v9;
  }
  char v10 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v8, v5);
  char v11 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v6, v5);
  [v5 weight];
  double v13 = v12;
  GEOConfigGetDouble();
  double v15 = v14;
  if (v13 != v14) {
    [v5 setWeight:0.85];
  }
  if (v13 == v15) {
    char v16 = v11;
  }
  else {
    char v16 = 1;
  }
  char v17 = v10 | v16;

LABEL_16:
  return v17;
}

@end