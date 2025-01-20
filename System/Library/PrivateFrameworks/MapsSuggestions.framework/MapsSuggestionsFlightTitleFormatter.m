@interface MapsSuggestionsFlightTitleFormatter
- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4;
@end

@implementation MapsSuggestionsFlightTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] == 15)
  {
    if (qword_1EB6F0100 == -1)
    {
      if (v7) {
        goto LABEL_10;
      }
    }
    else
    {
      dispatch_once(&qword_1EB6F0100, &__block_literal_global_0);
      if (v7) {
        goto LABEL_10;
      }
    }
    if ([v6 containsKey:@"MapsSuggestionsETAKey"])
    {
      id v7 = [v6 ETAForKey:@"MapsSuggestionsETAKey"];
    }
    else
    {
      id v7 = 0;
    }
LABEL_10:
    if ([v6 containsKey:@"MapsSuggestionsFlightStatusKey"])
    {
      v10 = [v6 stringForKey:@"MapsSuggestionsFlightStatusKey"];
      if ([v10 length]) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
    id v12 = v6;
    if ([v12 containsKey:@"MapsSuggestionsFlightFullTargetAirportKey"]
      && ([v12 BOOLeanForKey:@"MapsSuggestionsFlightMapItemIsTerminalKey" is:1] & 1) != 0)
    {
      v13 = @"MapsSuggestionsFlightFullTargetAirportKey";
    }
    else
    {
      v13 = @"MapsSuggestionsEntryTitleNameKey";
    }
    v14 = [v12 stringForKey:v13];

    id v15 = v14;
    LODWORD(v16) = MapsSuggestionsFlightUpdateAlreadyThere(v12);
    if (v16)
    {
      if ([v12 hasFullFlightInfoAndGate])
      {
        v17 = [v12 stringForKey:@"MapsSuggestionsFlightDepartureGateKey"];
        v18 = [v12 stringForKey:@"MapsSuggestionsFullFlightNumberKey"];
        uint64_t v45 = MapsSuggestionsLocalizedFlightGate(v17);

        [v12 dateForKey:@"MapsSuggestionsFlightDepartureTimeKey"];
        char v19 = (char)v16;
        id v16 = v15;
        v21 = v20 = self;
        uint64_t v22 = MapsSuggestionsLocalizedFlightDepatureTime(v18, v21);
        v23 = v11;
        id v11 = (id)v22;

        self = v20;
        id v15 = v16;
        LOBYTE(v16) = v19;
        v24 = (void *)v45;

        v25 = 0;
LABEL_28:

        goto LABEL_30;
      }
    }
    else if (v7)
    {
      [v7 seconds];
      v27 = NSStringFromMapsSuggestionsShortETA(v26);
      v17 = v27;
      v24 = v15;
      if (v27)
      {
        v24 = v15;
        if (_MergedGlobals_26)
        {
          v24 = MapsSuggestionsLocalizedFlightETAString(v27, v15);
        }
      }
      v25 = [v7 trafficString];
      goto LABEL_28;
    }
    v25 = 0;
    v24 = v15;
LABEL_30:
    unint64_t v28 = (unint64_t)v11;
    uint64_t v29 = [v12 subtitle];
    if (v29)
    {
      v30 = (void *)v29;
      [v12 subtitle];
      char v44 = (char)v16;
      v32 = v31 = self;
      id v46 = v12;
      v33 = v25;
      id v34 = v6;
      v35 = v24;
      id v36 = v15;
      id v37 = v7;
      uint64_t v38 = [v32 length] | v28;

      self = v31;
      BOOL v39 = v38 == 0;
      id v7 = v37;
      id v15 = v36;
      v24 = v35;
      id v6 = v34;
      v25 = v33;
      id v12 = v46;
      char v40 = v44;
      if (v39) {
        unint64_t v28 = 0;
      }
      else {
        char v40 = 1;
      }
      if (v40)
      {
        id v41 = (id)v28;
LABEL_41:
        char v9 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v12, v24, v41, 1);

        goto LABEL_42;
      }
    }
    else
    {
      if (v28) {
        char v42 = 1;
      }
      else {
        char v42 = (char)v16;
      }
      id v41 = (id)v28;
      if (v42) {
        goto LABEL_41;
      }
    }
    id v41 = v25;
    unint64_t v28 = 0;
    goto LABEL_41;
  }
  v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v48 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlightTitleFormatter.m";
    __int16 v49 = 1024;
    int v50 = 37;
    __int16 v51 = 2082;
    v52 = "-[MapsSuggestionsFlightTitleFormatter formatTitlesForEntry:eta:]";
    __int16 v53 = 2082;
    v54 = "MapsSuggestionsEntryTypeTravelFlight != entry.type";
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a TravelFlight entry", buf, 0x26u);
  }

  char v9 = 0;
LABEL_42:

  return v9;
}

void __64__MapsSuggestionsFlightTitleFormatter_formatTitlesForEntry_eta___block_invoke()
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___MapsSuggestionsBundle_block_invoke_0;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = "FlightTitleFormatter";
  if (qword_1EB6F0110 != -1) {
    dispatch_once(&qword_1EB6F0110, block);
  }
  id v0 = (id)qword_1EB6F0108;
  v1 = [v0 localizedStringForKey:@"MAPS_ETA_TO" value:@"%@ to %@<unlocalized>" table:0];
  uint64_t v2 = MapsSuggestionsNonNilString(v1, &stru_1EFC640F8);
  v3 = (void *)_MergedGlobals_26;
  _MergedGlobals_26 = v2;
}

@end