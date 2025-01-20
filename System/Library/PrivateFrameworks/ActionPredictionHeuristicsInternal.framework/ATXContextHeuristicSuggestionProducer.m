@interface ATXContextHeuristicSuggestionProducer
+ (id)_bundleIDWithURL:(id)a3;
+ (id)_clientModelSpecForSpotlightRecents;
+ (id)_clientModelSpectForContextHeuristics;
+ (id)_dummyUiSpecWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 shouldClearOnEngagement:(BOOL)a6 predictionReasons:(unint64_t)a7;
+ (id)_executableSpecForShortcutsAction:(id)a3;
+ (id)_executableSpecForSpotlightAction:(id)a3;
+ (id)_mediaWithName:(id)a3 type:(int64_t)a4 adamIdentifier:(int64_t)a5 umcIdentifier:(id)a6 predictionReasons:(unint64_t)a7 localizedReason:(id)a8 score:(double)a9 expirationDate:(id)a10;
+ (id)_suggestionWithSpotlightAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 score:(double)a6 uiSpec:(id)a7 dateInterval:(id)a8;
+ (id)_suggestionWithSpotlightRecentAction:(id)a3 score:(double)a4;
+ (id)_uiSpecWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 shouldClearOnEngagement:(BOOL)a6 predictionReasons:(unint64_t)a7 dateInterval:(id)a8;
+ (id)createSuggestionFromShortcutsAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 title:(id)a6 subtitle:(id)a7 score:(double)a8 shouldClearOnEngagement:(BOOL)a9 dateInterval:(id)a10;
+ (id)dummySuggestionWithSpotlightAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 score:(double)a6;
+ (id)flightCheckInActivityWithSubtitle:(id)a3 url:(id)a4 teamIdentifier:(id)a5 predictionReasons:(unint64_t)a6 localizedReason:(id)a7 score:(double)a8 validStartDate:(id)a9 validEndDate:(id)a10;
+ (id)mediaWithName:(id)a3 type:(int64_t)a4 adamIdentifier:(int64_t)a5 predictionReasons:(unint64_t)a6 localizedReason:(id)a7 score:(double)a8 expirationDate:(id)a9;
+ (id)mediaWithName:(id)a3 type:(int64_t)a4 umcIdentifier:(id)a5 predictionReasons:(unint64_t)a6 localizedReason:(id)a7 score:(double)a8 expirationDate:(id)a9;
+ (id)navigationToDestination:(id)a3 title:(id)a4 subtitle:(id)a5 transportType:(unint64_t)a6 destinationName:(id)a7 predictionReasons:(unint64_t)a8 localizedReason:(id)a9 score:(double)a10 shouldClearOnEngagement:(BOOL)a11 validStartDate:(id)a12 validEndDate:(id)a13 dateInterval:(id)a14;
+ (id)rideshareAppActionForDestination:(id)a3 preferredBundleId:(id)a4 predictionReasons:(unint64_t)a5 title:(id)a6 localizedReason:(id)a7 score:(double)a8 validFromStartDate:(id)a9 validToEndDate:(id)a10 dateInterval:(id)a11;
+ (id)suggestionForConferenceWithURL:(id)a3 score:(double)a4 predictionReasons:(unint64_t)a5 localizedReason:(id)a6 criteria:(id)a7 dateInterval:(id)a8;
+ (id)suggestionForDNDWithTitle:(id)a3 eventUniqueID:(id)a4 identifier:(id)a5 until:(id)a6 score:(double)a7 predictionReasons:(unint64_t)a8 localizedReason:(id)a9 validFromStartDate:(id)a10 validToEndDate:(id)a11 dateInterval:(id)a12;
+ (id)suggestionWithAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 score:(double)a6 dateInterval:(id)a7;
+ (id)suggestionWithExecutableSpecification:(id)a3 title:(id)a4 subtitle:(id)a5 predictionReasons:(unint64_t)a6 localizedReason:(id)a7 score:(double)a8;
+ (id)suggestionWithShortcutAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 title:(id)a6 subtitle:(id)a7 score:(double)a8 dateInterval:(id)a9;
+ (id)suggestionWithSpotlightAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 score:(double)a6 dateInterval:(id)a7;
+ (id)suggestionWithURL:(id)a3 actionTitle:(id)a4 subtitle:(id)a5 bundleID:(id)a6 score:(double)a7 predictionReasons:(unint64_t)a8 criteria:(id)a9 dateInterval:(id)a10;
+ (id)toggleAirplaneModeWithPredictionReasons:(unint64_t)a3 localizedReason:(id)a4 score:(double)a5 validFromStartDate:(id)a6 validToEndDate:(id)a7 dateInterval:(id)a8;
@end

@implementation ATXContextHeuristicSuggestionProducer

+ (id)createSuggestionFromShortcutsAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 title:(id)a6 subtitle:(id)a7 score:(double)a8 shouldClearOnEngagement:(BOOL)a9 dateInterval:(id)a10
{
  v15 = (objc_class *)MEMORY[0x1E4F93950];
  id v16 = a10;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  id v21 = [v15 alloc];
  v22 = [v20 contextualAction];
  v23 = [v22 displayString];
  v24 = [v20 contextualAction];
  v25 = [v24 identifier];
  v26 = (void *)[v21 initWithExecutableObject:v20 executableDescription:v23 executableIdentifier:v25 suggestionExecutableType:9];

  v27 = [a1 _uiSpecWithTitle:v18 subtitle:v17 predictionReason:v19 shouldClearOnEngagement:0 predictionReasons:a4 dateInterval:v16];

  v28 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:4 suggestedConfidenceCategory:a8];
  id v29 = objc_alloc(MEMORY[0x1E4F93938]);
  v30 = [a1 _clientModelSpectForContextHeuristics];
  v31 = (void *)[v29 initWithClientModelSpecification:v30 executableSpecification:v26 uiSpecification:v27 scoreSpecification:v28];

  return v31;
}

+ (id)suggestionWithExecutableSpecification:(id)a3 title:(id)a4 subtitle:(id)a5 predictionReasons:(unint64_t)a6 localizedReason:(id)a7 score:(double)a8
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v32 = a6;
    _os_log_impl(&dword_1D0F43000, v17, OS_LOG_TYPE_DEFAULT, "ATXProactiveSuggestion: suggestionWithExecutableSpecification predictionReasons:%llu", buf, 0xCu);
  }

  id v18 = objc_alloc(MEMORY[0x1E4F93950]);
  id v19 = [v16 executableObject];
  id v20 = [v16 executableDescription];
  id v21 = [v16 executableIdentifier];
  uint64_t v22 = [v16 executableType];

  v23 = (void *)[v18 initWithExecutableObject:v19 executableDescription:v20 executableIdentifier:v21 suggestionExecutableType:v22];
  v24 = [a1 _uiSpecWithTitle:v15 subtitle:v14 predictionReason:v13 shouldClearOnEngagement:0 predictionReasons:a6 dateInterval:0];

  v25 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:4 suggestedConfidenceCategory:a8];
  id v26 = objc_alloc(MEMORY[0x1E4F93938]);
  v27 = [a1 _clientModelSpectForContextHeuristics];
  v28 = (void *)[v26 initWithClientModelSpecification:v27 executableSpecification:v23 uiSpecification:v24 scoreSpecification:v25];

  return v28;
}

+ (id)suggestionWithSpotlightAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 score:(double)a6 dateInterval:(id)a7
{
  return (id)[a1 _suggestionWithSpotlightAction:a3 predictionReasons:a4 localizedReason:a5 score:0 uiSpec:a7 dateInterval:a6];
}

+ (id)dummySuggestionWithSpotlightAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 score:(double)a6
{
  id v10 = a5;
  id v11 = a3;
  v12 = [v11 actionDescription];
  id v13 = [a1 _dummyUiSpecWithTitle:v12 subtitle:0 predictionReason:v10 shouldClearOnEngagement:0 predictionReasons:a4];
  id v14 = [a1 _suggestionWithSpotlightAction:v11 predictionReasons:a4 localizedReason:v10 score:v13 uiSpec:0 dateInterval:a6];

  return v14;
}

+ (id)_suggestionWithSpotlightAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 score:(double)a6 uiSpec:(id)a7 dateInterval:(id)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v15 hash];
    id v20 = [v14 actionDescription];
    int v28 = 134218242;
    uint64_t v29 = v19;
    __int16 v30 = 2112;
    v31 = v20;
    _os_log_impl(&dword_1D0F43000, v18, OS_LOG_TYPE_DEFAULT, "ATXProactiveSuggestion: suggestionWithSpotlightAction reason.hash:%lu description:%@", (uint8_t *)&v28, 0x16u);
  }
  id v21 = [a1 _executableSpecForSpotlightAction:v14];
  if (!v16)
  {
    uint64_t v22 = [v14 actionDescription];
    id v16 = [a1 _uiSpecWithTitle:v22 subtitle:0 predictionReason:v15 shouldClearOnEngagement:0 predictionReasons:a4 dateInterval:v17];
  }
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:4 suggestedConfidenceCategory:a6];
  id v24 = objc_alloc(MEMORY[0x1E4F93938]);
  v25 = [a1 _clientModelSpectForContextHeuristics];
  id v26 = (void *)[v24 initWithClientModelSpecification:v25 executableSpecification:v21 uiSpecification:v16 scoreSpecification:v23];

  return v26;
}

+ (id)suggestionWithShortcutAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 title:(id)a6 subtitle:(id)a7 score:(double)a8 dateInterval:(id)a9
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v36 = a5;
  id v16 = a6;
  id v17 = a7;
  id v35 = a9;
  id v18 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v15 contextualAction];
    *(_DWORD *)buf = 134218242;
    unint64_t v38 = a4;
    __int16 v39 = 2112;
    v40 = v19;
    _os_log_impl(&dword_1D0F43000, v18, OS_LOG_TYPE_DEFAULT, "ATXProactiveSuggestion: suggestionWithShortcutAction predictionReasons:%llu shortcutsAction.contextualAction:%@", buf, 0x16u);
  }
  id v20 = objc_alloc(MEMORY[0x1E4F93950]);
  id v21 = [v15 contextualAction];
  uint64_t v22 = [v21 identifier];
  v23 = [v15 contextualAction];
  id v24 = [v23 uniqueIdentifier];
  v25 = (void *)[v20 initWithExecutableObject:v15 executableDescription:v22 executableIdentifier:v24 suggestionExecutableType:9];

  if (!v16)
  {
    id v26 = [v15 contextualAction];
    id v16 = [v26 displayString];
  }
  v27 = objc_msgSend(a1, "_uiSpecWithTitle:subtitle:predictionReason:shouldClearOnEngagement:predictionReasons:dateInterval:", v16, v17, v36, 0, a4, v35, v16);
  int v28 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:4 suggestedConfidenceCategory:a8];
  id v29 = objc_alloc(MEMORY[0x1E4F93938]);
  __int16 v30 = [a1 _clientModelSpectForContextHeuristics];
  v31 = (void *)[v29 initWithClientModelSpecification:v30 executableSpecification:v25 uiSpecification:v27 scoreSpecification:v28];

  return v31;
}

+ (id)suggestionWithAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 score:(double)a6 dateInterval:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v33 = a4;
    _os_log_impl(&dword_1D0F43000, v15, OS_LOG_TYPE_DEFAULT, "ATXProactiveSuggestion: _suggestionWithAction predictionReasons:%llu", buf, 0xCu);
  }

  id v16 = [NSString alloc];
  id v17 = [v14 actionTitle];
  id v18 = [v14 actionSubtitle];
  uint64_t v19 = (void *)[v16 initWithFormat:@"%@ | %@", v17, v18];

  id v20 = [NSString alloc];
  id v21 = [v14 actionKey];
  uint64_t v22 = (void *)[v20 initWithFormat:@"%@:%tu", v21, objc_msgSend(v14, "paramHash")];

  v23 = (void *)[objc_alloc(MEMORY[0x1E4F93950]) initWithExecutableObject:v14 executableDescription:v19 executableIdentifier:v22 suggestionExecutableType:2];
  id v24 = [v14 actionTitle];
  v25 = [v14 actionSubtitle];

  id v26 = [a1 _uiSpecWithTitle:v24 subtitle:v25 predictionReason:v13 shouldClearOnEngagement:0 predictionReasons:a4 dateInterval:v12];

  v27 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:4 suggestedConfidenceCategory:a6];
  id v28 = objc_alloc(MEMORY[0x1E4F93938]);
  id v29 = [a1 _clientModelSpectForContextHeuristics];
  __int16 v30 = (void *)[v28 initWithClientModelSpecification:v29 executableSpecification:v23 uiSpecification:v26 scoreSpecification:v27];

  return v30;
}

+ (id)_executableSpecForShortcutsAction:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F93950];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 contextualAction];
  v7 = [v6 displayString];
  v8 = [v4 contextualAction];
  v9 = [v8 identifier];
  id v10 = (void *)[v5 initWithExecutableObject:v4 executableDescription:v7 executableIdentifier:v9 suggestionExecutableType:9];

  return v10;
}

+ (id)_executableSpecForSpotlightAction:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F93950];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 actionDescription];
  v7 = [v4 actionIdentifier];
  v8 = (void *)[v5 initWithExecutableObject:v4 executableDescription:v6 executableIdentifier:v7 suggestionExecutableType:8];

  return v8;
}

+ (id)_suggestionWithSpotlightRecentAction:(id)a3 score:(double)a4
{
  v6 = [a1 _executableSpecForSpotlightAction:a3];
  v7 = [a1 _uiSpecWithTitle:0 subtitle:0 predictionReason:0 shouldClearOnEngagement:0 predictionReasons:0x1000000 dateInterval:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:4 suggestedConfidenceCategory:a4];
  id v9 = objc_alloc(MEMORY[0x1E4F93938]);
  id v10 = [a1 _clientModelSpecForSpotlightRecents];
  id v11 = (void *)[v9 initWithClientModelSpecification:v10 executableSpecification:v6 uiSpecification:v7 scoreSpecification:v8];

  return v11;
}

+ (id)suggestionForDNDWithTitle:(id)a3 eventUniqueID:(id)a4 identifier:(id)a5 until:(id)a6 score:(double)a7 predictionReasons:(unint64_t)a8 localizedReason:(id)a9 validFromStartDate:(id)a10 validToEndDate:(id)a11 dateInterval:(id)a12
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a12;
  id v20 = a11;
  id v21 = a10;
  id v22 = a9;
  v23 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v40 = "+[ATXContextHeuristicSuggestionProducer suggestionForDNDWithTitle:eventUniqueID:identifier:until:score:predict"
          "ionReasons:localizedReason:validFromStartDate:validToEndDate:dateInterval:]";
    __int16 v41 = 2048;
    uint64_t v42 = [v16 hash];
    __int16 v43 = 2112;
    id v44 = v17;
    __int16 v45 = 2112;
    id v46 = v18;
    _os_log_impl(&dword_1D0F43000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s title.hash:%lu eventUniqueID:%@, until:%@", buf, 0x2Au);
  }

  [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v35 = v17;
  id v24 = v36 = v16;
  uint64_t v34 = v18;
  v25 = [v24 localizedStringForKey:@"SUGGESTION_DND_TITLE" value:&stru_1F2719D20 table:0];
  id v26 = objc_alloc(MEMORY[0x1E4FB49F8]);
  v27 = (void *)[v26 initWithIdentifier:*MEMORY[0x1E4FB4E88] name:v25 symbolName:@"moon.fill" colorName:@"systemIndigoColor"];
  id v28 = [MEMORY[0x1E4FB49F0] toggle:v27];
  id v29 = [v24 localizedStringForKey:@"SUGGESTION_DND_TITLE" value:&stru_1F2719D20 table:0];
  __int16 v30 = (void *)[objc_alloc(MEMORY[0x1E4F4AE40]) initWithStartDate:v21 endDate:v20 lockScreenEligible:0 predicate:0];

  v31 = (void *)[objc_alloc(MEMORY[0x1E4F4B2E0]) initWithContextualAction:v28 criteria:v30];
  uint64_t v32 = [a1 suggestionWithShortcutAction:v31 predictionReasons:a8 localizedReason:v22 title:v29 subtitle:0 score:v19 dateInterval:a7];

  return v32;
}

+ (id)suggestionForConferenceWithURL:(id)a3 score:(double)a4 predictionReasons:(unint64_t)a5 localizedReason:(id)a6 criteria:(id)a7 dateInterval:(id)a8
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v30 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v14;
    _os_log_impl(&dword_1D0F43000, v17, OS_LOG_TYPE_DEFAULT, "ATXProactiveSuggestion: ***** suggestionForConferenceWithURL:%@", buf, 0xCu);
  }

  id v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v19 = [v18 localizedStringForKey:@"SUGGESTION_JOIN_TITLE" value:&stru_1F2719D20 table:0];
  id v20 = [a1 _bundleIDWithURL:v14];
  if ([v20 isEqualToString:@"com.apple.mobilephone"]
    && [MEMORY[0x1E4F93B08] isiPad])
  {
    id v21 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v21, OS_LOG_TYPE_DEFAULT, "suggestionForConferenceWithURL: no Phone application on iPad. Skipping suggestion", buf, 2u);
    }
    id v22 = 0;
    v23 = v30;
  }
  else
  {
    id v24 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      [v14 absoluteString];
      id v26 = v25 = a5;
      *(_DWORD *)buf = 138412802;
      id v32 = v26;
      __int16 v33 = 2112;
      uint64_t v34 = v20;
      __int16 v35 = 2112;
      id v36 = v19;
      _os_log_impl(&dword_1D0F43000, v24, OS_LOG_TYPE_DEFAULT, "[[WFOpenURLContextualAction alloc] initWithURL:%@ bundleIdentifier:%@ actionTitle:%@", buf, 0x20u);

      a5 = v25;
    }

    id v21 = [objc_alloc(MEMORY[0x1E4FB4818]) initWithURL:v14 bundleIdentifier:v20 actionTitle:v19];
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F4B2E0]) initWithContextualAction:v21 criteria:v15];
    id v28 = a1;
    v23 = v30;
    id v22 = [v28 suggestionWithShortcutAction:v27 predictionReasons:a5 localizedReason:v30 title:0 subtitle:0 score:v16 dateInterval:a4];
  }

  return v22;
}

+ (id)suggestionWithURL:(id)a3 actionTitle:(id)a4 subtitle:(id)a5 bundleID:(id)a6 score:(double)a7 predictionReasons:(unint64_t)a8 criteria:(id)a9 dateInterval:(id)a10
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a10;
  id v21 = a9;
  id v22 = a5;
  v23 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [v17 absoluteString];
    int v29 = 138412802;
    id v30 = v24;
    __int16 v31 = 2112;
    id v32 = v19;
    __int16 v33 = 2112;
    id v34 = v18;
    _os_log_impl(&dword_1D0F43000, v23, OS_LOG_TYPE_DEFAULT, "[[WFOpenURLContextualAction alloc] initWithURL:%@ bundleIdentifier:%@ actionTitle:%@", (uint8_t *)&v29, 0x20u);
  }
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4FB4818]) initWithURL:v17 bundleIdentifier:v19 actionTitle:v18];
  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F4B2E0]) initWithContextualAction:v25 criteria:v21];

  v27 = [a1 suggestionWithShortcutAction:v26 predictionReasons:a8 localizedReason:0 title:0 subtitle:v22 score:v20 dateInterval:a7];

  return v27;
}

+ (id)_bundleIDWithURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1D25F43D0]();
  if (v3)
  {
    id v15 = 0;
    id v5 = [MEMORY[0x1E4F22398] appLinksWithURL:v3 limit:1 error:&v15];
    id v6 = v15;
    v7 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_1D0F43000, v7, OS_LOG_TYPE_DEFAULT, "ATXProactiveSuggestion: appLinksWithURL links:%@", buf, 0xCu);
    }

    if ([v5 count])
    {
      v8 = [v5 firstObject];
      id v9 = [v8 targetApplicationRecord];
      id v10 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v9;
        _os_log_impl(&dword_1D0F43000, v10, OS_LOG_TYPE_DEFAULT, "ATXProactiveSuggestion: appLinksWithURL record:%@", buf, 0xCu);
      }

      id v11 = [v9 bundleIdentifier];

      if (v11)
      {
        id v11 = [v9 bundleIdentifier];
      }
    }
    else
    {
      v8 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[ATXContextHeuristicSuggestionProducer _bundleIDWithURL:]((uint64_t)v6, v8);
      }
      id v11 = 0;
    }

    id v13 = INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity();
    id v12 = ATXBundleIdReplacementForBundleIdWithWebpageURLHint();
  }
  else
  {
    id v12 = 0;
    id v6 = 0;
  }

  return v12;
}

+ (id)_clientModelSpectForContextHeuristics
{
  v2 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:44];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v2 clientModelVersion:@"1.0" engagementResetPolicy:1];

  return v3;
}

+ (id)_clientModelSpecForSpotlightRecents
{
  v2 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:46];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v2 clientModelVersion:@"1.0" engagementResetPolicy:1];

  return v3;
}

+ (id)_uiSpecWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 shouldClearOnEngagement:(BOOL)a6 predictionReasons:(unint64_t)a7 dateInterval:(id)a8
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v13 = (objc_class *)MEMORY[0x1E4F93960];
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = (void *)[[v13 alloc] initWithApplicableSuggestionLayout:5];
  v26[0] = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];

  id v20 = objc_alloc(MEMORY[0x1E4F93978]);
  id v21 = [v14 startDate];
  id v22 = [v14 endDate];

  BYTE1(v25) = a6;
  LOBYTE(v25) = 1;
  v23 = objc_msgSend(v20, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:contextStartDate:contextEndDate:", v17, v16, v15, v19, 0, 0, v25, a7, v21, v22);

  return v23;
}

+ (id)_dummyUiSpecWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 shouldClearOnEngagement:(BOOL)a6 predictionReasons:(unint64_t)a7
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v11 = (objc_class *)MEMORY[0x1E4F93960];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)[[v11 alloc] initWithApplicableSuggestionLayout:5];
  v20[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];

  BYTE1(v19) = a6;
  LOBYTE(v19) = 0;
  id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F93978]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", v14, v13, v12, v16, 0, 0, v19, a7);

  return v17;
}

+ (id)toggleAirplaneModeWithPredictionReasons:(unint64_t)a3 localizedReason:(id)a4 score:(double)a5 validFromStartDate:(id)a6 validToEndDate:(id)a7 dateInterval:(id)a8
{
  id v14 = (objc_class *)MEMORY[0x1E4FB4A00];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a4;
  uint64_t v19 = (void *)[[v14 alloc] initWithSetting:0 operation:2];
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F4AE40]) initWithStartDate:v17 endDate:v16 lockScreenEligible:0 predicate:0];

  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F4B2E0]) initWithContextualAction:v19 criteria:v20];
  id v22 = [a1 suggestionWithShortcutAction:v21 predictionReasons:a3 localizedReason:v18 title:0 subtitle:0 score:v15 dateInterval:a5];

  return v22;
}

+ (id)rideshareAppActionForDestination:(id)a3 preferredBundleId:(id)a4 predictionReasons:(unint64_t)a5 title:(id)a6 localizedReason:(id)a7 score:(double)a8 validFromStartDate:(id)a9 validToEndDate:(id)a10 dateInterval:(id)a11
{
  id v17 = (objc_class *)MEMORY[0x1E4FB4858];
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a7;
  id v22 = a6;
  id v23 = a4;
  id v24 = a3;
  id v25 = [v17 alloc];
  id v26 = [v24 location];
  v27 = [v24 name];

  id v28 = (void *)[v25 initWithApplicationBundleIdentifier:v23 destination:v26 name:v27];
  int v29 = (void *)[objc_alloc(MEMORY[0x1E4F4AE40]) initWithStartDate:v20 endDate:v19 lockScreenEligible:0 predicate:0];

  id v30 = (void *)[objc_alloc(MEMORY[0x1E4F4B2E0]) initWithContextualAction:v28 criteria:v29];
  __int16 v31 = [a1 createSuggestionFromShortcutsAction:v30 predictionReasons:a5 localizedReason:v21 title:v22 subtitle:0 score:0 shouldClearOnEngagement:a8 dateInterval:v18];

  return v31;
}

+ (id)flightCheckInActivityWithSubtitle:(id)a3 url:(id)a4 teamIdentifier:(id)a5 predictionReasons:(unint64_t)a6 localizedReason:(id)a7 score:(double)a8 validStartDate:(id)a9 validEndDate:(id)a10
{
  id v18 = (objc_class *)MEMORY[0x1E4F4AE40];
  id v19 = a10;
  id v20 = a9;
  id v21 = a7;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = (void *)[[v18 alloc] initWithStartDate:v20 endDate:v19 lockScreenEligible:0 predicate:0];

  id v26 = objc_msgSend(MEMORY[0x1E4F4AE38], "atx_showCheckInActionWithTeamId:userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:", v22, v23, v24, 0, 0, v21, v25);

  v27 = [a1 suggestionWithAction:v26 predictionReasons:a6 localizedReason:v21 score:0 dateInterval:a8];

  return v27;
}

+ (id)_mediaWithName:(id)a3 type:(int64_t)a4 adamIdentifier:(int64_t)a5 umcIdentifier:(id)a6 predictionReasons:(unint64_t)a7 localizedReason:(id)a8 score:(double)a9 expirationDate:(id)a10
{
  id v17 = a3;
  id v18 = a6;
  id v19 = a8;
  id v20 = a10;
  if ((a5 == 0) == (v18 != 0))
  {
    if (v18)
    {
LABEL_3:
      id v21 = v18;
      goto LABEL_6;
    }
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"ATXContextHeuristicSuggestionProducer.m", 568, @"Expected either adamIdentifier (%lld) or umcIdentifier (%@) but not both", a5, v18 object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  id v21 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", a5);
LABEL_6:
  id v23 = v21;
  id v24 = (void *)[objc_alloc(MEMORY[0x1E4F4AE40]) initWithStartDate:0 endDate:v20 lockScreenEligible:0 predicate:0];
  id v25 = (void *)[objc_alloc(MEMORY[0x1E4F4B328]) initWithMediaName:v17 identifier:v23 criteria:v24];

  id v26 = [a1 suggestionWithSpotlightAction:v25 predictionReasons:a7 localizedReason:v19 score:0 dateInterval:a9];

  return v26;
}

+ (id)mediaWithName:(id)a3 type:(int64_t)a4 adamIdentifier:(int64_t)a5 predictionReasons:(unint64_t)a6 localizedReason:(id)a7 score:(double)a8 expirationDate:(id)a9
{
  return (id)[a1 _mediaWithName:a3 type:a4 adamIdentifier:a5 umcIdentifier:0 predictionReasons:a6 localizedReason:a7 score:a8 expirationDate:a9];
}

+ (id)mediaWithName:(id)a3 type:(int64_t)a4 umcIdentifier:(id)a5 predictionReasons:(unint64_t)a6 localizedReason:(id)a7 score:(double)a8 expirationDate:(id)a9
{
  return (id)[a1 _mediaWithName:a3 type:a4 adamIdentifier:0 umcIdentifier:a5 predictionReasons:a6 localizedReason:a7 score:a8 expirationDate:a9];
}

+ (id)navigationToDestination:(id)a3 title:(id)a4 subtitle:(id)a5 transportType:(unint64_t)a6 destinationName:(id)a7 predictionReasons:(unint64_t)a8 localizedReason:(id)a9 score:(double)a10 shouldClearOnEngagement:(BOOL)a11 validStartDate:(id)a12 validEndDate:(id)a13 dateInterval:(id)a14
{
  id v20 = (objc_class *)MEMORY[0x1E4FB4738];
  id v35 = a14;
  id v21 = a13;
  id v22 = a12;
  id v23 = a9;
  id v24 = a7;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  id v28 = [v20 alloc];
  int v29 = [v27 location];

  id v30 = (void *)[v28 initWithDestination:v29 name:v24 type:a6];
  __int16 v31 = (void *)[objc_alloc(MEMORY[0x1E4F4AE40]) initWithStartDate:v22 endDate:v21 lockScreenEligible:0 predicate:0];

  id v32 = (void *)[objc_alloc(MEMORY[0x1E4F4B2E0]) initWithContextualAction:v30 criteria:v31];
  __int16 v33 = [a1 createSuggestionFromShortcutsAction:v32 predictionReasons:a8 localizedReason:v23 title:v26 subtitle:v25 score:0 shouldClearOnEngagement:a10 dateInterval:v35];

  return v33;
}

+ (void)_bundleIDWithURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "ATXProactiveSuggestion: LSAppLink error:%@", (uint8_t *)&v2, 0xCu);
}

@end