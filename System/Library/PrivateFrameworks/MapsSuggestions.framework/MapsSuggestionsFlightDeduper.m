@interface MapsSuggestionsFlightDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
@end

@implementation MapsSuggestionsFlightDeduper

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v61 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlightDeduper.m";
      __int16 v62 = 1024;
      int v63 = 78;
      __int16 v64 = 2082;
      v65 = "-[MapsSuggestionsFlightDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v66 = 2082;
      v67 = "nil == (originalEntry)";
      v23 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_16:
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, v23, buf, 0x26u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!v6)
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v61 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlightDeduper.m";
      __int16 v62 = 1024;
      int v63 = 79;
      __int16 v64 = 2082;
      v65 = "-[MapsSuggestionsFlightDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v66 = 2082;
      v67 = "nil == (entry)";
      v23 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (!MapsSuggestionsEntriesAreBothOfType(15, v5, v6)) {
    goto LABEL_18;
  }
  v8 = v5;
  id v9 = v7;
  v10 = [v8 uniqueIdentifier];
  v11 = [v9 uniqueIdentifier];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {

LABEL_6:
    v13 = v8;
    id v14 = v9;
    if ([v14 containsKey:@"MapsSuggestionsFullFlightNumberKey"]
      && ([v13 containsKey:@"MapsSuggestionsFullFlightNumberKey"] & 1) != 0)
    {
      v15 = [v14 stringForKey:@"MapsSuggestionsFullFlightNumberKey"];
      v16 = [v13 stringForKey:@"MapsSuggestionsFullFlightNumberKey"];
      char v17 = [v15 isEqualToString:v16];

      if (v17)
      {
        v18 = v13;
        id v19 = v14;
        v20 = [v19 originatingSourceName];
        if ([v20 isEqualToString:@"MapsSuggestionsWalletSource"])
        {
          v21 = [v18 originatingSourceName];
          int v22 = [v21 isEqualToString:@"MapsSuggestionsWalletSource"];

          if (!v22) {
            goto LABEL_32;
          }
        }
        else
        {
        }
        if (([v19 containsKey:@"MapsSuggestionsFlightStatusKey"] & 1) == 0
          && ([v19 containsKey:@"MapsSuggestionsFlightStatusKey"] & 1) == 0
          && [v18 containsKey:@"MapsSuggestionsFlightStatusKey"])
        {
          [v18 setNumber:0 forKey:@"MapsSuggestionsAlreadyThereKey"];
          uint64_t v59 = 0;
LABEL_33:

          int v46 = [v18 hasFullFlightInfoAndGate];
          v47 = [v18 dateForKey:@"MapsSuggestionsFlightDepartureTimeKey"];
          v48 = [v18 stringForKey:@"MapsSuggestionsFlightDepartureGateKey"];
          v49 = [v18 stringForKey:@"MapsSuggestionsFlightDepartureTerminalKey"];
          v50 = [v18 stringForKey:@"MapsSuggestionsFlightStatusKey"];
          v51 = [v18 stringForKey:@"MapsSuggestionsFlightFullTargetAirportKey"];
          unsigned int v57 = [v18 BOOLeanForKey:@"MapsSuggestionsFlightMapItemIsTerminalKey"];
          unsigned int v55 = [v18 BOOLeanForKey:@"MapsSuggestionsFlightMapItemIsGateKey"];
          LOWORD(v52) = 256;
          -[NSObject mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:](v18, "mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:", v19, v59, 0, 1, 0, 0, v52);
          if (v46)
          {
            [v18 setDate:v47 forKey:@"MapsSuggestionsFlightDepartureTimeKey"];
            [v18 setString:v48 forKey:@"MapsSuggestionsFlightDepartureGateKey"];
            [v18 setString:v49 forKey:@"MapsSuggestionsFlightDepartureTerminalKey"];
            [v18 setString:v50 forKey:@"MapsSuggestionsFlightStatusKey"];
            [v18 setString:v51 forKey:@"MapsSuggestionsFlightFullTargetAirportKey"];
            [v18 setBoolean:v57 forKey:@"MapsSuggestionsFlightMapItemIsTerminalKey"];
            [v18 setBoolean:v55 forKey:@"MapsSuggestionsFlightMapItemIsGateKey"];
          }

          goto LABEL_25;
        }
LABEL_32:
        uint64_t v59 = 1;
        goto LABEL_33;
      }
    }
    else
    {
    }
    [v13 replaceByEntry:v14];
LABEL_25:
    BOOL v24 = 1;
    goto LABEL_19;
  }
  v26 = [v8 stringForKey:@"MapsSuggestionsFullFlightNumberKey"];
  v27 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  v28 = [v27 invertedSet];

  v58 = v26;
  v29 = [v26 componentsSeparatedByCharactersInSet:v28];
  v30 = [v29 componentsJoinedByString:&stru_1EFC640F8];

  v31 = [v9 stringForKey:@"MapsSuggestionsFullFlightNumberKey"];
  v32 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  v33 = [v32 invertedSet];

  v34 = v31;
  v35 = [v31 componentsSeparatedByCharactersInSet:v33];
  v36 = [v35 componentsJoinedByString:&stru_1EFC640F8];

  if (![v30 isEqualToString:v36])
  {

    goto LABEL_17;
  }
  v56 = [v8 stringForKey:@"MapsSuggestionsEntryTitleNameKey"];
  v37 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  v38 = [v37 invertedSet];

  v39 = [v56 componentsSeparatedByCharactersInSet:v38];
  v40 = [v39 componentsJoinedByString:&stru_1EFC640F8];

  v41 = [v9 stringForKey:@"MapsSuggestionsEntryTitleNameKey"];
  v42 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  [v42 invertedSet];
  v43 = v54 = v30;

  v44 = [v41 componentsSeparatedByCharactersInSet:v43];
  [v44 componentsJoinedByString:&stru_1EFC640F8];
  v45 = v53 = v34;

  LODWORD(v43) = [v40 isEqualToString:v45];
  if (v43) {
    goto LABEL_6;
  }
LABEL_18:
  BOOL v24 = 0;
LABEL_19:

  return v24;
}

@end