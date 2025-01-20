@interface ATXSpotlightClient
+ (BOOL)_isAutoShortcutEnabledForSpotlight:(id)a3;
+ (BOOL)_isEqualRecentTopics:(id)a3 otherRecentTopics:(id)a4;
+ (BOOL)_isValidSuggestion:(id)a3 forWorldState:(id)a4;
+ (BOOL)_shouldDisplayUpcomingMediaForTesting;
+ (BOOL)isAutoShortcutEnabledForSpotlightForBundleId:(id)a3 signature:(id)a4;
+ (BOOL)isAutoShortcutsEnabledForSpotlightForBundleId:(id)a3;
+ (BOOL)topic:(id)a3 isDuplicateComparingTopics:(id)a4;
+ (id)_accessoryImageWithContextualAction:(id)a3;
+ (id)_contextualActionIconFromLNImage:(id)a3;
+ (id)_descriptionForTopic:(id)a3;
+ (id)_extractTopicsFromRecentTopics:(id)a3;
+ (id)_fetchSpotlightRecentTopics:(int64_t)a3;
+ (id)_fetchSpotlightRecentTopicsWithAlternateRanking:(int64_t)a3 limit:(int64_t)a4;
+ (id)_iconForParameterizedAutoShortcutContextualAction:(id)a3 provider:(id)a4;
+ (id)_imageWithContextualActionIcon:(id)a3;
+ (id)_imageWithDirectionsContextualAction:(id)a3;
+ (id)_imageWithLinkImage:(id)a3;
+ (id)_responseWithSpotlightLayout:(id)a3 andSpotlightRecentTopics:(id)a4;
+ (id)_responseWithUpcomingMedia;
+ (id)_resultWithATXAction:(id)a3;
+ (id)_resultWithActionSuggestion:(id)a3;
+ (id)_resultWithAppBundleId:(id)a3;
+ (id)_resultWithAppClipSuggestion:(id)a3;
+ (id)_resultWithContextualAction:(id)a3 title:(id)a4 subtitle:(id)a5;
+ (id)_resultWithIntent:(id)a3 title:(id)a4 subtitle:(id)a5 bundleIdForDisplay:(id)a6 appIcon:(id)a7;
+ (id)_resultWithLinkActionContainer:(id)a3;
+ (id)_resultWithLinkActionSuggestion:(id)a3;
+ (id)_resultWithShortcutsActionSuggestion:(id)a3;
+ (id)_resultWithSuggestion:(id)a3;
+ (id)_symbolImageForName:(id)a3;
+ (id)_topicWithSuggestion:(id)a3 layoutUUID:(id)a4;
+ (id)detailedRowCardSectionWithTitle:(id)a3 subtitles:(id)a4 thumbnail:(id)a5 trailingImage:(id)a6;
+ (id)recentUpcomingMediaActionsWithLimit:(unint64_t)a3;
+ (id)rerankRecents:(id)a3 withAlternateRanking:(unint64_t)a4;
+ (id)rerankRecents_Filter:(id)a3 removingType:(int)a4;
+ (id)rerankRecents_LimitCount:(id)a3 oneCountDays:(double)a4 twoCountDays:(double)a5;
+ (id)rerankRecents_Normal:(id)a3;
+ (id)suggestedResultResponseWithLimit:(int64_t)a3;
+ (id)suggestedResultResponseWithLimit:(int64_t)a3 andSpotlightRecentTopics:(id)a4;
+ (int)_imageCornerRoundingStyleForIconDisplayStyle:(unint64_t)a3;
+ (void)_responseWithUpcomingMedia;
- (ATXSpotlightClientDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation ATXSpotlightClient

+ (id)suggestedResultResponseWithLimit:(int64_t)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v5 = +[ATXSpotlightZKWTrialClientWrapper sharedInstance];
  uint64_t v6 = [v5 alternateRecentsRanking];
  v7 = (void *)CFPreferencesCopyAppValue(@"SuggestionsSpotlightZKWRecentsEnabled", @"com.apple.suggestions");
  if (!v7 || (v8 = v7, int v9 = [v7 BOOLValue], v8, v9))
  {
    v10 = [a1 _fetchSpotlightRecentTopics:4];
    v11 = __atxlog_handle_ui();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (!v6)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] AB match: NO", buf, 2u);
      }
      goto LABEL_32;
    }
    if (v12)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v39 = v6;
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] AB match: YES, Test ranking %lu", buf, 0xCu);
    }

    int v13 = [v5 matchesAlternateRecentsControlCodePath];
    int v14 = [v5 matchesAlternateRecentsTreatmentCodePath];
    v15 = __atxlog_handle_ui();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = &stru_1EFD9B408;
      v17 = @"control";
      if (!v13) {
        v17 = &stru_1EFD9B408;
      }
      *(_DWORD *)buf = 134218498;
      uint64_t v39 = v6;
      v41 = v17;
      __int16 v40 = 2112;
      if (v14) {
        v16 = @"treatment";
      }
      __int16 v42 = 2112;
      v43 = v16;
      _os_log_impl(&dword_1A790D000, v15, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] Test ranking %lu, %@%@", buf, 0x20u);
    }

    v18 = __atxlog_handle_metrics();
    os_signpost_id_t v19 = os_signpost_id_generate(v18);

    v20 = __atxlog_handle_metrics();
    v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A790D000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "ATXSpotlightClient.SpotlightRecentsAlternate", " enableTelemetry=YES ", buf, 2u);
    }

    v11 = [a1 _fetchSpotlightRecentTopicsWithAlternateRanking:v6 limit:4];
    v22 = __atxlog_handle_metrics();
    v23 = v22;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v39 = v6;
      _os_signpost_emit_with_name_impl(&dword_1A790D000, v23, OS_SIGNPOST_INTERVAL_END, v19, "ATXSpotlightClient.SpotlightRecentsAlternate", "alt=%{public, signpost.telemetry:number1}ld enableTelemetry=YES ", buf, 0xCu);
    }

    char v24 = [a1 _isEqualRecentTopics:v10 otherRecentTopics:v11];
    if ((v13 & v14) == 1)
    {
      v25 = __atxlog_handle_ui();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        +[ATXSpotlightClient suggestedResultResponseWithLimit:]();
      }
    }
    else
    {
      if (v13)
      {
        if ((v24 & 1) == 0)
        {
          v26 = [v5 codePathForAlternateRecentsControl];
LABEL_33:

          v27 = [a1 _extractTopicsFromRecentTopics:v10];
          goto LABEL_34;
        }
LABEL_32:
        v26 = 0;
        goto LABEL_33;
      }
      if (v14)
      {
        if ((v24 & 1) == 0)
        {
          v26 = [v5 codePathForAlternateRecentsTreatment];
          v11 = v11;

          v10 = v11;
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      v25 = __atxlog_handle_ui();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        +[ATXSpotlightClient suggestedResultResponseWithLimit:]();
      }
    }

    goto LABEL_32;
  }
  v10 = __atxlog_handle_ui();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: suggestedResultResponseWithLimit: Siri setting 'Show Recents' turned off. spotlightRecentTopics = @[]", buf, 2u);
  }
  v26 = 0;
  v27 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_34:

  v28 = __atxlog_handle_metrics();
  os_signpost_id_t v29 = os_signpost_id_generate(v28);

  v30 = __atxlog_handle_metrics();
  v31 = v30;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A790D000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "ATXSpotlightClient.SuggestedActions", " enableTelemetry=YES ", buf, 2u);
  }

  v32 = [a1 suggestedResultResponseWithLimit:a3 andSpotlightRecentTopics:v27];
  v33 = __atxlog_handle_metrics();
  v34 = v33;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A790D000, v34, OS_SIGNPOST_INTERVAL_END, v29, "ATXSpotlightClient.SuggestedActions", " enableTelemetry=YES ", buf, 2u);
  }

  v35 = __atxlog_handle_ui();
  BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v36)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v35, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] send code path trigger", buf, 2u);
    }

    [v32 addCodePathId:v26];
  }
  else
  {
    if (v36)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v35, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] Alternate ranking did not change results", buf, 2u);
    }
  }

  return v32;
}

+ (id)suggestedResultResponseWithLimit:(int64_t)a3 andSpotlightRecentTopics:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)CFPreferencesCopyAppValue(@"SuggestionsSpotlightZKWEnabled", @"com.apple.suggestions");
  if (v7 && (v8 = v7, int v9 = [v7 BOOLValue], v8, !v9))
  {
    __atxlog_handle_ui();
    v11 = (ATXProactiveSuggestionClient *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1A790D000, &v11->super, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: suggestedResultResponseWithLimit: Siri setting 'Show Suggestions' turned off. spotlightLayout = nil", (uint8_t *)&v16, 2u);
    }
    BOOL v12 = 0;
  }
  else
  {
    v10 = __atxlog_handle_ui();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      int64_t v17 = a3;
      _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: suggestedResultResponseWithLimit: %ld", (uint8_t *)&v16, 0xCu);
    }

    v11 = [[ATXProactiveSuggestionClient alloc] initWithConsumerSubType:21];
    BOOL v12 = [(ATXProactiveSuggestionClient *)v11 spotlightSuggestionLayoutFromCache];
    int v13 = __atxlog_handle_ui();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      int64_t v17 = (int64_t)v12;
      _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Blending retrieved a spotlightLayout %@.", (uint8_t *)&v16, 0xCu);
    }
  }
  int v14 = [a1 _responseWithSpotlightLayout:v12 andSpotlightRecentTopics:v6];

  return v14;
}

+ (id)_descriptionForTopic:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v13 = (objc_class *)NSString;
      id v14 = v3;
      id v15 = [v13 alloc];
      id v4 = [v14 query];
      int v16 = [v14 date];

      int64_t v17 = (void *)[v15 initWithFormat:@"SFFlightTopic: %@, %@", v4, v16];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v26 = (objc_class *)NSString;
        if (isKindOfClass)
        {
          id v27 = v3;
          id v28 = [v26 alloc];
          id v4 = [v27 query];
          uint64_t v29 = [v27 queryType];
          v30 = [v27 identifier];

          int64_t v17 = (void *)[v28 initWithFormat:@"SFQueryTopic: %@, type: %d, id: %@", v4, v29, v30];
        }
        else
        {
          id v34 = [NSString alloc];
          v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          id v4 = (id)objc_claimAutoreleasedReturnValue();
          int64_t v17 = (void *)[v34 initWithFormat:@"unhandled of type %@", v4];
        }
        goto LABEL_19;
      }
      uint64_t v18 = (objc_class *)NSString;
      id v19 = v3;
      id v20 = [v18 alloc];
      id v4 = [v19 query];
      int v16 = [v19 location];
      [v16 lat];
      uint64_t v22 = v21;
      v23 = [v19 location];

      [v23 lng];
      int64_t v17 = (void *)[v20 initWithFormat:@"SFWeatherTopic: %@, lat %f, lng %f", v4, v22, v24];
    }
    goto LABEL_19;
  }
  id v4 = v3;
  v5 = [v4 result];
  id v6 = [v5 title];
  v7 = [v6 text];

  if (!v7)
  {
    v8 = [v4 result];
    int v9 = [v8 inlineCard];
    v10 = [v9 cardSections];
    v11 = [v10 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v12 = [v11 title];
      v7 = [v12 text];
    }
    else
    {
      v7 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [v11 suggestionText];
      uint64_t v32 = [v31 text];

      v7 = (void *)v32;
    }
    if (!v7)
    {
      v7 = [v4 identifier];
    }
  }
  int64_t v17 = (void *)[[NSString alloc] initWithFormat:@"SFLocalTopic %@, %@", v7, v4];

LABEL_19:

  return v17;
}

+ (BOOL)_isValidSuggestion:(id)a3 forWorldState:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 atxActionCriteria];
  char v8 = [v7 isRelevant:v6];

  if ((v8 & 1) == 0)
  {
    BOOL v12 = __atxlog_handle_ui();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v5 uiSpecification];
      id v14 = [v13 title];
      id v15 = [v5 executableSpecification];
      int v16 = [v15 executableClassString];
      int v18 = 138412546;
      id v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      _os_log_impl(&dword_1A790D000, v12, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Not valid for device state, hiding: %@, type %@", (uint8_t *)&v18, 0x16u);
    }
    goto LABEL_8;
  }
  int v9 = [v5 uiSpecification];
  int v10 = [v9 predictionReasons];

  if ((v10 & 0x1000000) != 0)
  {
    BOOL v12 = __atxlog_handle_ui();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[ATXSpotlightClient _isValidSuggestion:forWorldState:]();
    }
LABEL_8:

    BOOL v11 = 0;
    goto LABEL_9;
  }
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

+ (BOOL)topic:(id)a3 isDuplicateComparingTopics:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    id v20 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([MEMORY[0x1E4FA5D80] topic:v5 isSameAsTopic:v10])
        {
          LOBYTE(v7) = 1;
          goto LABEL_19;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = v5;
            id v12 = v10;
            int v13 = [v11 identifier];
            if ([v13 length])
            {
              id v14 = [v12 identifier];
              uint64_t v15 = [v14 length];

              if (v15)
              {
                int v16 = [v11 identifier];
                int64_t v17 = [v12 identifier];
                char v18 = [v16 isEqualToString:v17];

                if (v18)
                {

                  LOBYTE(v7) = 1;
                  id v6 = v20;
                  goto LABEL_19;
                }
              }
            }
            else
            {
            }
            id v6 = v20;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  return v7;
}

+ (id)_responseWithSpotlightLayout:(id)a3 andSpotlightRecentTopics:(id)a4
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([a1 _shouldDisplayUpcomingMediaForTesting])
  {
    uint64_t v8 = [a1 _responseWithUpcomingMedia];
    goto LABEL_64;
  }
  v63 = v7;
  v75 = [v6 uuid];
  v76 = v6;
  int v9 = [v6 collections];
  v74 = objc_opt_new();
  v73 = objc_opt_new();
  v65 = objc_opt_new();
  v78 = objc_opt_new();
  int v10 = __atxlog_handle_ui();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Response: create sections and topics ", buf, 2u);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  obuint64_t j = v9;
  uint64_t v67 = [obj countByEnumeratingWithState:&v91 objects:v104 count:16];
  if (v67)
  {
    uint64_t v77 = 0;
    uint64_t v66 = *(void *)v92;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v92 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v69 = v11;
        id v12 = *(void **)(*((void *)&v91 + 1) + 8 * v11);
        int v13 = [v12 suggestions];
        id v14 = [v13 firstObject];
        uint64_t v15 = [v14 uiSpecification];
        uint64_t v16 = [v15 predictionReasons];

        int64_t v17 = __atxlog_handle_ui();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          char v18 = [v12 contextTitle];
          uint64_t v19 = [v18 hash];
          id v20 = [v12 suggestions];
          uint64_t v21 = [v20 count];
          *(_DWORD *)buf = 134218496;
          uint64_t v99 = v19;
          __int16 v100 = 2048;
          uint64_t v101 = v16;
          __int16 v102 = 2048;
          uint64_t v103 = v21;
          _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Section.hash: %lu, type: %llu, count: %lu", buf, 0x20u);
        }
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        v68 = v12;
        long long v22 = [v12 suggestions];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v87 objects:v97 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          v25 = 0;
          uint64_t v26 = *(void *)v88;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v88 != v26) {
                objc_enumerationMutation(v22);
              }
              id v28 = *(void **)(*((void *)&v87 + 1) + 8 * i);
              if ([(id)objc_opt_class() _isValidSuggestion:v28 forWorldState:v78])
              {
                uint64_t v29 = [a1 _topicWithSuggestion:v28 layoutUUID:v75];
                v30 = [v76 scores];
                v31 = [v30 objectAtIndexedSubscript:v77 + i];

                uint64_t v32 = __atxlog_handle_ui();
                v33 = v32;
                if (v29)
                {
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    id v34 = [a1 _descriptionForTopic:v29];
                    *(_DWORD *)buf = 138740227;
                    uint64_t v99 = (uint64_t)v34;
                    __int16 v100 = 2112;
                    uint64_t v101 = (uint64_t)v31;
                    _os_log_impl(&dword_1A790D000, v33, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Topic: %{sensitive}@ Score: %@, ", buf, 0x16u);
                  }
                  ++v25;
                  [v74 addObject:v29];
                  [v73 addObject:v31];
                }
                else
                {
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                  {
                    v71 = [v28 uiSpecification];
                    v72 = [v71 title];
                    v70 = [v28 executableSpecification];
                    v35 = [v70 executableClassString];
                    *(_DWORD *)buf = 138412546;
                    uint64_t v99 = (uint64_t)v72;
                    __int16 v100 = 2112;
                    uint64_t v101 = (uint64_t)v35;
                    _os_log_error_impl(&dword_1A790D000, v33, OS_LOG_TYPE_ERROR, "ATXSpotlightClient: Topic: nil: %@, type %@", buf, 0x16u);
                  }
                }
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v87 objects:v97 count:16];
            v77 += i;
          }
          while (v24);
        }
        else
        {
          v25 = 0;
        }

        BOOL v36 = [v68 contextTitle];
        v37 = objc_opt_new();
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        v38 = [v68 suggestions];
        uint64_t v39 = [v38 countByEnumeratingWithState:&v83 objects:v96 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v84;
          while (2)
          {
            for (uint64_t j = 0; j != v40; ++j)
            {
              if (*(void *)v84 != v41) {
                objc_enumerationMutation(v38);
              }
              v43 = [v37 contextTitleWithSuggestion:*(void *)(*((void *)&v83 + 1) + 8 * j) eventTitle:v36];
              if ([v43 length])
              {

                goto LABEL_40;
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v83 objects:v96 count:16];
            if (v40) {
              continue;
            }
            break;
          }
        }
        v43 = v36;
LABEL_40:

        uint64_t v44 = __atxlog_handle_ui();
        BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
        if (v25)
        {
          if (v45)
          {
            v46 = [v68 contextTitle];
            uint64_t v47 = [v46 hash];
            *(_DWORD *)buf = 134218240;
            uint64_t v99 = v47;
            __int16 v100 = 2048;
            uint64_t v101 = (uint64_t)v25;
            _os_log_impl(&dword_1A790D000, v44, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Creating Section [%lu] with suggestions count %lu", buf, 0x16u);
          }
          uint64_t v44 = [v68 sectionIdentifier];
          v48 = +[ATXSpotlightClientResponse createSectionWithTitle:v43 sectionBundleIdentifier:v44 resultCount:v25];
          [v65 addObject:v48];
        }
        else
        {
          if (!v45) {
            goto LABEL_47;
          }
          v48 = [v68 contextTitle];
          uint64_t v49 = [v48 hash];
          *(_DWORD *)buf = 134217984;
          uint64_t v99 = v49;
          _os_log_impl(&dword_1A790D000, v44, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Skipping Section [%lu] no longer has valid suggestions", buf, 0xCu);
        }

LABEL_47:
        uint64_t v11 = v69 + 1;
      }
      while (v69 + 1 != v67);
      uint64_t v67 = [obj countByEnumeratingWithState:&v91 objects:v104 count:16];
    }
    while (v67);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v7 = v63;
  id v50 = v63;
  uint64_t v51 = [v50 countByEnumeratingWithState:&v79 objects:v95 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = 0;
    uint64_t v54 = *(void *)v80;
    double v55 = 10.0;
LABEL_51:
    uint64_t v56 = 0;
    uint64_t v57 = v53;
    while (1)
    {
      uint64_t v58 = v56;
      if (*(void *)v80 != v54) {
        objc_enumerationMutation(v50);
      }
      [v74 addObject:*(void *)(*((void *)&v79 + 1) + 8 * v56)];
      v59 = [NSNumber numberWithDouble:v55];
      [v73 addObject:v59];

      if ((unint64_t)(v57 + v58 + 1) >= 4) {
        break;
      }
      double v55 = v55 + -1.0;
      uint64_t v56 = v58 + 1;
      if (v52 == v58 + 1)
      {
        uint64_t v52 = [v50 countByEnumeratingWithState:&v79 objects:v95 count:16];
        uint64_t v53 = v57 + v56;
        if (v52) {
          goto LABEL_51;
        }

        id v6 = v76;
        id v7 = v63;
        if (!(v57 + v56)) {
          goto LABEL_63;
        }
LABEL_60:
        id v50 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v60 = [v50 localizedStringForKey:@"SPOTLIGHT_SECTION_RECENTS" value:&stru_1EFD9B408 table:0];
        v61 = +[ATXSpotlightClientResponse createSectionWithTitle:v60 sectionBundleIdentifier:@"com.apple.spotlight.dec.zkw.recents" resultCount:v57 + v58 + 1];
        [v65 addObject:v61];

        goto LABEL_62;
      }
    }

    id v6 = v76;
    id v7 = v63;
    goto LABEL_60;
  }
  id v6 = v76;
LABEL_62:

LABEL_63:
  uint64_t v8 = [[ATXSpotlightClientResponse alloc] initWithTopics:v74 scores:v73 sections:v65];

LABEL_64:

  return v8;
}

+ (id)_topicWithSuggestion:(id)a3 layoutUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 executableSpecification];
  uint64_t v9 = [v8 executableType];

  if (v9 == 8)
  {
    int v10 = [v6 atxSpotlightActionExecutableObject];
    uint64_t v11 = [v10 topic];
LABEL_9:
    id v20 = (void *)v11;
    goto LABEL_10;
  }
  id v12 = [a1 _resultWithSuggestion:v6];
  int v10 = v12;
  if (v12)
  {
    int v13 = [v12 identifier];
    uint64_t v14 = [v13 length];

    if (!v14)
    {
      uint64_t v15 = __atxlog_handle_ui();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        +[ATXSpotlightClient _topicWithSuggestion:layoutUUID:]();
      }

      uint64_t v16 = objc_opt_new();
      int64_t v17 = [v16 UUIDString];
      [v10 setIdentifier:v17];
    }
    char v18 = (void *)[v6 copy];
    [v10 setProactiveSuggestion:v18];

    uint64_t v19 = (void *)[v7 copy];
    [v10 setBlendingModelUICacheUpdateUUID:v19];

    uint64_t v11 = [MEMORY[0x1E4FA5D78] proactiveTopicWithResult:v10];
    goto LABEL_9;
  }
  id v20 = 0;
LABEL_10:

  return v20;
}

+ (id)_fetchSpotlightRecentTopics:(int64_t)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = __atxlog_handle_metrics();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  id v6 = __atxlog_handle_ui();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    int64_t v19 = a3;
    _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "spotlight recents request: %ld", (uint8_t *)&v18, 0xCu);
  }

  id v7 = __atxlog_handle_metrics();
  uint64_t v8 = v7;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A790D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ATXSpotlightClient.SpotlightRecents", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }

  uint64_t v9 = (void *)MEMORY[0x1E4FA5D80];
  uint64_t v22 = *MEMORY[0x1E4FA5D88];
  int v10 = [NSNumber numberWithInteger:a3];
  v23[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v12 = [v9 recentResultsWithOptions:v11];

  int v13 = __atxlog_handle_metrics();
  uint64_t v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A790D000, v14, OS_SIGNPOST_INTERVAL_END, v5, "ATXSpotlightClient.SpotlightRecents", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }

  uint64_t v15 = __atxlog_handle_ui();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v12 count];
    int v18 = 134218243;
    int64_t v19 = v16;
    __int16 v20 = 2117;
    uint64_t v21 = v12;
    _os_log_impl(&dword_1A790D000, v15, OS_LOG_TYPE_DEFAULT, "spotlight recents results: %ld %{sensitive}@", (uint8_t *)&v18, 0x16u);
  }

  return v12;
}

+ (id)_extractTopicsFromRecentTopics:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_91);
}

id __53__ATXSpotlightClient__extractTopicsFromRecentTopics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 topic];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    os_signpost_id_t v5 = __atxlog_handle_ui();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v10 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v10);
    uint64_t v8 = [v2 topic];
    int v13 = 138412547;
    uint64_t v14 = v6;
    __int16 v15 = 2117;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "spotlight recent %@: %{sensitive}@", (uint8_t *)&v13, 0x16u);
    goto LABEL_6;
  }
  os_signpost_id_t v5 = [v2 topic];
  id v6 = __atxlog_handle_ui();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = [v5 query];
    int v13 = 138412803;
    uint64_t v14 = v8;
    __int16 v15 = 2117;
    uint64_t v16 = v9;
    __int16 v17 = 1024;
    int v18 = [v5 queryType];
    _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "spotlight recent %@: %{sensitive}@, %d", (uint8_t *)&v13, 0x1Cu);

LABEL_6:
  }

LABEL_8:
  uint64_t v11 = [v2 topic];

  return v11;
}

+ (id)_fetchSpotlightRecentTopicsWithAlternateRanking:(int64_t)a3 limit:(int64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4FA5D80];
  uint64_t v12 = *MEMORY[0x1E4FA5D88];
  id v7 = [NSNumber numberWithInteger:a4];
  v13[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__ATXSpotlightClient__fetchSpotlightRecentTopicsWithAlternateRanking_limit___block_invoke;
  v11[3] = &__block_descriptor_48_e26___NSArray_16__0__NSArray_8l;
  v11[4] = a1;
  v11[5] = a3;
  uint64_t v9 = [v6 recentResultsWithOptions:v8 rankAndDeduplicate:v11];

  return v9;
}

id __76__ATXSpotlightClient__fetchSpotlightRecentTopicsWithAlternateRanking_limit___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) rerankRecents:a2 withAlternateRanking:*(void *)(a1 + 40)];
  unint64_t v3 = [v2 count];
  if (v3 >= 0xA) {
    uint64_t v4 = 10;
  }
  else {
    uint64_t v4 = v3;
  }
  os_signpost_id_t v5 = objc_msgSend(v2, "subarrayWithRange:", 0, v4);

  return v5;
}

+ (id)rerankRecents:(id)a3 withAlternateRanking:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0uLL:
      id v7 = __atxlog_handle_ui();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] rerankRecents_Normal", buf, 2u);
      }

      goto LABEL_8;
    case 1uLL:
      int v10 = __atxlog_handle_ui();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v20 = 0;
        _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] rerankRecents_Filter UserTyped", v20, 2u);
      }

      uint64_t v9 = objc_msgSend(a1, "rerankRecents_Filter:removingType:", v6, 30);
      break;
    case 2uLL:
      uint64_t v11 = __atxlog_handle_ui();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] rerankRecentsLimitCount 2.5, 7.5", v19, 2u);
      }

      double v12 = 2.5;
      double v13 = 7.5;
      goto LABEL_18;
    case 3uLL:
      uint64_t v14 = __atxlog_handle_ui();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v18 = 0;
        _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [Recents] rerankRecentsLimitCount 7.5, 14.5", v18, 2u);
      }

      double v12 = 7.5;
      double v13 = 14.5;
LABEL_18:
      uint64_t v9 = objc_msgSend(a1, "rerankRecents_LimitCount:oneCountDays:twoCountDays:", v6, v12, v13);
      break;
    default:
      uint64_t v8 = __atxlog_handle_ui();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        +[ATXSpotlightClient rerankRecents:withAlternateRanking:]();
      }

LABEL_8:
      uint64_t v9 = objc_msgSend(a1, "rerankRecents_Normal:", v6);
      break;
  }
  __int16 v15 = (void *)v9;
  uint64_t v16 = __atxlog_handle_ui();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    +[ATXSpotlightClient rerankRecents:withAlternateRanking:](v15);
  }

  return v15;
}

+ (id)rerankRecents_Normal:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  id v6 = [v5 dateByAddingTimeInterval:-604800.0];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v8) {
    goto LABEL_28;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v43;
  uint64_t v32 = v35;
  id v33 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v43 != v10) {
        objc_enumerationMutation(v7);
      }
      double v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      if ((unint64_t)objc_msgSend(v4, "count", v32) >= 0xA)
      {
        uint64_t v29 = __atxlog_handle_ui();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v30 = "[Recents]: V0 only considers first 10";
LABEL_26:
          _os_log_impl(&dword_1A790D000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
        }
LABEL_27:
        id v5 = v33;

        goto LABEL_28;
      }
      double v13 = [v12 engagementTime];
      [v13 timeIntervalSinceReferenceDate];
      double v15 = v14;
      [v6 timeIntervalSinceReferenceDate];
      double v17 = v16;

      if (v15 < v17)
      {
        uint64_t v29 = __atxlog_handle_ui();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v30 = "[Recents]: V0 no need to consider more past max date";
          goto LABEL_26;
        }
        goto LABEL_27;
      }
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __43__ATXSpotlightClient_rerankRecents_Normal___block_invoke;
      v40[3] = &unk_1E5D0A4C0;
      v40[4] = v12;
      uint64_t v18 = [v4 indexOfObjectPassingTest:v40];
      uint64_t v19 = __atxlog_handle_ui();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v20) {
          +[ATXSpotlightClient rerankRecents_Normal:](&v38, v39);
        }

        [v4 addObject:v12];
      }
      else
      {
        if (v20) {
          +[ATXSpotlightClient rerankRecents_Normal:](&v36, v37);
        }

        uint64_t v21 = [v4 objectAtIndexedSubscript:v18];
        uint64_t v22 = [v21 engagementTime];
        [v22 timeIntervalSinceReferenceDate];
        double v24 = v23;
        v25 = [v12 engagementTime];
        [v25 timeIntervalSinceReferenceDate];
        double v27 = v26;

        if (v24 < v27)
        {
          id v28 = __atxlog_handle_ui();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
            +[ATXSpotlightClient rerankRecents_Normal:](&v34, v32);
          }
        }
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
    id v5 = v33;
    if (v9) {
      continue;
    }
    break;
  }
LABEL_28:

  return v4;
}

uint64_t __43__ATXSpotlightClient_rerankRecents_Normal___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) title];
  id v5 = [v3 title];
  if ([v4 isEqualToString:v5])
  {
    id v6 = [*(id *)(a1 + 32) encodedNormalizedTopic];
    id v7 = [v3 encodedNormalizedTopic];
    uint64_t v8 = [v6 isEqualToData:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)rerankRecents_Filter:(id)a3 removingType:(int)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__ATXSpotlightClient_rerankRecents_Filter_removingType___block_invoke;
  v8[3] = &__block_descriptor_36_e27_B16__0___SFEngagedResult__8l;
  int v9 = a4;
  id v5 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", v8);
  id v6 = objc_msgSend(a1, "rerankRecents_Normal:", v5);

  return v6;
}

BOOL __56__ATXSpotlightClient_rerankRecents_Filter_removingType___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 type];
  int v6 = *(_DWORD *)(a1 + 32);
  id v4 = (int *)(a1 + 32);
  int v5 = v6;
  if (v3 == v6)
  {
    id v7 = __atxlog_handle_ui();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __56__ATXSpotlightClient_rerankRecents_Filter_removingType___block_invoke_cold_1(v4, v7);
    }
  }
  return v3 != v5;
}

+ (id)rerankRecents_LimitCount:(id)a3 oneCountDays:(double)a4 twoCountDays:(double)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  v37 = [v10 dateByAddingTimeInterval:a4 * -86400.0];
  char v38 = v10;
  char v36 = [v10 dateByAddingTimeInterval:a5 * -86400.0];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v7;
  uint64_t v11 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v52;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v51 + 1) + 8 * v14);
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke;
        v50[3] = &unk_1E5D0A4C0;
        v50[4] = v15;
        uint64_t v16 = objc_msgSend(v8, "indexOfObjectPassingTest:", v50, v36);
        double v17 = __atxlog_handle_ui();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v18) {
            +[ATXSpotlightClient rerankRecents_Normal:](&v48, v49);
          }

          [v8 addObject:v15];
          [v9 addObject:&unk_1EFDF4830];
        }
        else
        {
          if (v18) {
            +[ATXSpotlightClient rerankRecents_LimitCount:oneCountDays:twoCountDays:].cold.5(&v46, v47);
          }

          uint64_t v19 = [v9 objectAtIndexedSubscript:v16];
          BOOL v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "integerValue") + 1);
          [v9 replaceObjectAtIndex:v16 withObject:v20];

          uint64_t v21 = [v8 objectAtIndexedSubscript:v16];
          uint64_t v22 = [v21 engagementTime];
          [v22 timeIntervalSinceReferenceDate];
          double v24 = v23;
          v25 = [v15 engagementTime];
          [v25 timeIntervalSinceReferenceDate];
          double v27 = v26;

          if (v24 < v27)
          {
            id v28 = __atxlog_handle_ui();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
              +[ATXSpotlightClient rerankRecents_Normal:](&v44, v45);
            }
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v12);
  }

  uint64_t v29 = __atxlog_handle_ui();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    +[ATXSpotlightClient rerankRecents_LimitCount:oneCountDays:twoCountDays:](v8);
  }

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke_233;
  v40[3] = &unk_1E5D0A508;
  id v41 = v9;
  id v42 = v37;
  id v43 = v36;
  id v30 = v36;
  id v31 = v37;
  id v32 = v9;
  id v33 = objc_msgSend(v8, "_pas_filteredArrayWithIndexedTest:", v40);
  char v34 = __atxlog_handle_ui();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    +[ATXSpotlightClient rerankRecents_LimitCount:oneCountDays:twoCountDays:](v33);
  }

  return v33;
}

uint64_t __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) title];
  int v5 = [v3 title];
  if ([v4 isEqualToString:v5])
  {
    int v6 = [*(id *)(a1 + 32) encodedNormalizedTopic];
    id v7 = [v3 encodedNormalizedTopic];
    uint64_t v8 = [v6 isEqualToData:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke_233(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  int v6 = [a1[4] objectAtIndexedSubscript:a3];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7 == 2)
  {
    uint64_t v14 = [v5 engagementTime];
    [v14 timeIntervalSinceReferenceDate];
    double v16 = v15;
    [a1[6] timeIntervalSinceReferenceDate];
    double v18 = v17;

    if (v16 < v18)
    {
      uint64_t v13 = __atxlog_handle_ui();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke_233_cold_2(v5);
      }
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v19 = 1;
    goto LABEL_11;
  }
  if (v7 != 1) {
    goto LABEL_10;
  }
  uint64_t v8 = [v5 engagementTime];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;
  [a1[5] timeIntervalSinceReferenceDate];
  double v12 = v11;

  if (v10 >= v12) {
    goto LABEL_10;
  }
  uint64_t v13 = __atxlog_handle_ui();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke_233_cold_1(v5);
  }
LABEL_9:

  uint64_t v19 = 0;
LABEL_11:

  return v19;
}

+ (BOOL)_isEqualRecentTopics:(id)a3 otherRecentTopics:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 != [v6 count])
  {
LABEL_10:
    char v18 = 0;
    goto LABEL_11;
  }
  if ([v5 count])
  {
    uint64_t v8 = 0;
    while (1)
    {
      double v9 = [v5 objectAtIndexedSubscript:v8];
      double v10 = [v6 objectAtIndexedSubscript:v8];
      double v11 = [v9 engagementDate];
      double v12 = [v10 engagementDate];
      int v13 = [v11 isEqualToDate:v12];

      if (!v13) {
        break;
      }
      uint64_t v14 = [v9 topic];
      double v15 = [v14 identifier];
      double v16 = [v10 topic];
      double v17 = [v16 identifier];
      char v18 = [v15 isEqualToString:v17];

      if ((v18 & 1) != 0 && [v5 count] > (unint64_t)++v8) {
        continue;
      }
      goto LABEL_11;
    }

    goto LABEL_10;
  }
  char v18 = 1;
LABEL_11:

  return v18;
}

+ (id)_resultWithSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = [v4 executableSpecification];
  uint64_t v6 = [v5 executableType];

  if (v6 == 2)
  {
    uint64_t v7 = __atxlog_handle_ui();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithSuggestion is ATXSuggestionExecutableTypeAction", buf, 2u);
    }

    uint64_t v8 = [a1 _resultWithActionSuggestion:v4];
LABEL_17:
    uint64_t v19 = (void *)v8;
    goto LABEL_18;
  }
  double v9 = [v4 executableSpecification];
  uint64_t v10 = [v9 executableType];

  if (v10 == 5)
  {
    double v11 = __atxlog_handle_ui();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v23 = 0;
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithSuggestion is ATXSuggestionExecutableTypeAppClip", v23, 2u);
    }

    uint64_t v8 = [a1 _resultWithAppClipSuggestion:v4];
    goto LABEL_17;
  }
  double v12 = [v4 executableSpecification];
  uint64_t v13 = [v12 executableType];

  if (v13 == 9)
  {
    uint64_t v14 = __atxlog_handle_ui();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithSuggestion is ATXSuggestionExecutableTypeShortcutsAction", v22, 2u);
    }

    uint64_t v8 = [a1 _resultWithShortcutsActionSuggestion:v4];
    goto LABEL_17;
  }
  double v15 = [v4 executableSpecification];
  uint64_t v16 = [v15 executableType];

  double v17 = __atxlog_handle_ui();
  char v18 = v17;
  if (v16 == 10)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1A790D000, v18, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithSuggestion is ATXSuggestionExecutableTypeLinkAction", v21, 2u);
    }

    uint64_t v8 = [a1 _resultWithLinkActionSuggestion:v4];
    goto LABEL_17;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    +[ATXSpotlightClient _resultWithSuggestion:](v4, v18);
  }

  uint64_t v19 = 0;
LABEL_18:

  return v19;
}

+ (id)_resultWithLinkActionSuggestion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 uiSpecification];
    uint64_t v7 = [v6 title];
    int v11 = 138412290;
    double v12 = v7;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithLinkActionSuggestion %@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v8 = [v4 linkActionExecutableObject];
  if (v8)
  {
    double v9 = [a1 _resultWithLinkActionContainer:v8];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

+ (id)_resultWithLinkActionContainer:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 image];

  if (v5)
  {
    uint64_t v6 = [v4 image];
    uint64_t v7 = [a1 _imageWithLinkImage:v6];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v6 = [v4 bundleId];
    [v7 setBundleIdentifier:v6];
  }

  id v8 = objc_alloc(MEMORY[0x1E4FB47D0]);
  double v9 = [v4 action];
  uint64_t v10 = [v4 bundleId];
  int v11 = (void *)[v8 initWithAction:v9 appBundleIdentifier:v10 extensionBundleIdentifier:0 authenticationPolicy:0];

  id v31 = 0;
  double v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v31];
  id v13 = v31;
  if (v13)
  {
    uint64_t v14 = __atxlog_handle_ui();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[ATXSpotlightClient _resultWithLinkActionContainer:]();
    }
    double v15 = 0;
  }
  else
  {
    uint64_t v16 = [v11 subtitle];
    if (v16)
    {
      double v17 = [v11 subtitle];
      v33[0] = v17;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    }
    else
    {
      uint64_t v14 = MEMORY[0x1E4F1CBF0];
    }

    char v18 = [v11 title];
    uint64_t v19 = [a1 _accessoryImageWithContextualAction:v11];
    BOOL v20 = [a1 detailedRowCardSectionWithTitle:v18 subtitles:v14 thumbnail:v7 trailingImage:v19];

    uint64_t v21 = objc_opt_new();
    [v21 setIsRunnableWorkflow:1];
    [v21 setIntentMessageData:v12];
    uint64_t v22 = [v11 identifier];
    [v21 setIntentMessageName:v22];

    [v20 setCommand:v21];
    double v23 = [v11 identifier];
    [v20 setCommandDetail:v23];

    double v15 = objc_opt_new();
    [v11 uniqueIdentifier];
    double v24 = v30 = v7;
    [v15 setIdentifier:v24];

    v25 = [v11 associatedAppBundleIdentifier];
    [v15 setApplicationBundleIdentifier:v25];

    double v26 = [v15 applicationBundleIdentifier];
    [v15 setResultBundleId:v26];

    double v27 = objc_opt_new();
    id v32 = v20;
    id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [v27 setCardSections:v28];

    [v15 setInlineCard:v27];
    uint64_t v7 = v30;
  }

  return v15;
}

+ (id)_resultWithShortcutsActionSuggestion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 uiSpecification];
    uint64_t v7 = [v6 title];
    int v17 = 138412290;
    char v18 = v7;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithShortcutsActionSuggestion %@", (uint8_t *)&v17, 0xCu);
  }
  id v8 = [v4 atxShortcutsActionExecutableObject];
  double v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 contextualAction];
    int v11 = [v4 uiSpecification];
    double v12 = [v11 title];
    id v13 = [v4 uiSpecification];
    uint64_t v14 = [v13 subtitle];
    double v15 = [a1 _resultWithContextualAction:v10 title:v12 subtitle:v14];
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

+ (id)_resultWithContextualAction:(id)a3 title:(id)a4 subtitle:(id)a5
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    id v12 = objc_alloc_init(MEMORY[0x1E4F72B48]);
    if (![a1 _isAutoShortcutEnabledForSpotlight:v11]) {
      goto LABEL_9;
    }
  }
  else
  {
    id v12 = 0;
    id v11 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v10)
    {
LABEL_9:
      uint64_t v21 = 0;
      goto LABEL_33;
    }
    id v58 = v12;
    double v13 = (double)[v10 integerValue];
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
    [v14 timeIntervalSinceReferenceDate];
    double v16 = v13 - v15;

    int v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    char v18 = [v8 alarmName];
    uint64_t v19 = v18;
    if (v16 <= 3600.0)
    {
      uint64_t v22 = objc_opt_new();
      [v22 setUnitsStyle:2];
      [v22 setAllowedUnits:64];
      double v23 = 60.0;
      if (v16 > 60.0) {
        double v23 = v16;
      }
      double v24 = [v22 stringFromTimeInterval:v23];
      v25 = NSString;
      [v17 localizedStringForKey:@"SPOTLIGHT_TIME_TO_ALARM" value:&stru_1EFD9B408 table:0];
      uint64_t v56 = v17;
      id v26 = v11;
      v28 = id v27 = v9;
      objc_msgSend(v25, "localizedStringWithFormat:", v28, v19, v24);
      id v20 = (id)objc_claimAutoreleasedReturnValue();

      id v9 = v27;
      id v11 = v26;
      int v17 = v56;

      id v10 = v22;
    }
    else
    {
      id v20 = v18;
    }

    id v10 = v20;
    id v12 = v58;
  }
  uint64_t v29 = MEMORY[0x1AD0D3C30]();
  id v61 = 0;
  uint64_t v30 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v61];
  id v31 = v61;
  id v32 = (void *)v29;
  id v33 = v31;
  if (v33)
  {
    char v34 = (void *)v30;
    v35 = __atxlog_handle_ui();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      +[ATXSpotlightClient _resultWithContextualAction:title:subtitle:]();
    }
    uint64_t v21 = 0;
  }
  else
  {
    char v36 = [v8 icon];

    if (v36)
    {
      v37 = [v8 icon];
      v35 = [a1 _imageWithContextualActionIcon:v37];
    }
    else
    {
      v37 = __atxlog_handle_ui();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        +[ATXSpotlightClient _resultWithContextualAction:title:subtitle:]();
      }
      v35 = 0;
    }

    uint64_t v38 = [a1 _iconForParameterizedAutoShortcutContextualAction:v11 provider:v12];
    id v59 = v12;
    if (v38)
    {
      uint64_t v39 = __atxlog_handle_ui();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A790D000, v39, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: using icon from parameterized app shortcut", buf, 2u);
      }

      uint64_t v40 = [a1 _imageWithContextualActionIcon:v38];
    }
    else
    {
      uint64_t v40 = [a1 _accessoryImageWithContextualAction:v8];
    }
    id v57 = v9;
    long long v54 = (void *)v40;
    double v55 = (void *)v38;
    if (v10)
    {
      v63[0] = v10;
      uint64_t v41 = v40;
      id v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
      id v43 = [a1 detailedRowCardSectionWithTitle:v9 subtitles:v42 thumbnail:v35 trailingImage:v41];
    }
    else
    {
      id v43 = [a1 detailedRowCardSectionWithTitle:v9 subtitles:MEMORY[0x1E4F1CBF0] thumbnail:v35 trailingImage:v40];
    }
    char v44 = objc_opt_new();
    [v44 setIsRunnableWorkflow:1];
    [v44 setIntentMessageData:v30];
    long long v45 = [v8 identifier];
    [v44 setIntentMessageName:v45];

    char v46 = [v8 settingBiomeStreamIdentifier];
    [v44 setBiomeStreamIdentifier:v46];

    [v43 setCommand:v44];
    uint64_t v47 = [v8 identifier];
    [v43 setCommandDetail:v47];

    char v34 = (void *)v30;
    uint64_t v21 = objc_opt_new();
    char v48 = [v8 uniqueIdentifier];
    [v21 setIdentifier:v48];

    uint64_t v49 = [v8 associatedAppBundleIdentifier];
    [v21 setApplicationBundleIdentifier:v49];

    id v50 = [v21 applicationBundleIdentifier];
    [v21 setResultBundleId:v50];

    long long v51 = objc_opt_new();
    v62 = v43;
    long long v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
    [v51 setCardSections:v52];

    [v21 setInlineCard:v51];
    id v9 = v57;
    id v12 = v59;
    id v33 = 0;
  }

LABEL_33:

  return v21;
}

+ (id)_accessoryImageWithContextualAction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 accessoryIcon];
  if (v5)
  {
    uint64_t v6 = [a1 _imageWithContextualActionIcon:v5];
LABEL_5:
    uint64_t v7 = (void *)v6;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [a1 _imageWithDirectionsContextualAction:v4];
    goto LABEL_5;
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

+ (id)_imageWithLinkImage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)getINUISearchFoundationImageAdapterClass());
  id v5 = [v3 inImage];

  uint64_t v6 = (void *)[v4 initWithIntentsImage:v5];

  return v6;
}

+ (id)_imageWithContextualActionIcon:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 applicationBundleIdentifier];
  if (v5)
  {
    uint64_t v6 = __atxlog_handle_ui();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      char v18 = v5;
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: using contextualAction.icon.applicationBundleIdentifier %@", (uint8_t *)&v17, 0xCu);
    }

    id v7 = (id)objc_opt_new();
    if ([v5 isEqualToString:@"com.apple.mobilesafari"]) {
      [v7 setIconType:1];
    }
    else {
      [v7 setBundleIdentifier:v5];
    }
  }
  else
  {
    id v8 = [v4 imageData];

    if (v8)
    {
      id v9 = __atxlog_handle_ui();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: using icon.imageData ", (uint8_t *)&v17, 2u);
      }

      id v7 = objc_alloc_init(MEMORY[0x1E4F9A128]);
      id v10 = [v4 imageData];
      [v7 setImageData:v10];

      [v4 imageScale];
      objc_msgSend(v7, "setScale:");
    }
    else
    {
      id v11 = [v4 systemName];

      id v12 = __atxlog_handle_ui();
      double v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [v4 systemName];
          int v17 = 138412290;
          char v18 = v14;
          _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: using icon.systemName %@", (uint8_t *)&v17, 0xCu);
        }
        id v7 = objc_alloc_init(MEMORY[0x1E4F9A498]);
        double v15 = [v4 systemName];
        [v7 setSymbolName:v15];

        [v7 setIsTemplate:1];
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          +[ATXSpotlightClient _imageWithContextualActionIcon:]();
        }

        id v7 = 0;
      }
    }
  }
  objc_msgSend(v7, "setCornerRoundingStyle:", objc_msgSend(a1, "_imageCornerRoundingStyleForIconDisplayStyle:", objc_msgSend(v4, "displayStyle")));

  return v7;
}

+ (int)_imageCornerRoundingStyleForIconDisplayStyle:(unint64_t)a3
{
  return 4 * (a3 == 1);
}

+ (id)_imageWithDirectionsContextualAction:(id)a3
{
  unint64_t v3 = [a3 navigationType];
  if (v3 > 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (uint64_t)*(&off_1E5D0A558 + v3);
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A498]);
  [v5 setSymbolName:v4];
  [v5 setIsTemplate:1];

  return v5;
}

+ (id)_resultWithActionSuggestion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 executableSpecification];
  uint64_t v6 = [v5 executableClassString];

  id v7 = __atxlog_handle_ui();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    double v15 = v6;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithActionSuggestion executableClassString:%@", (uint8_t *)&v14, 0xCu);
  }

  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  int v10 = [v6 isEqualToString:v9];

  if (v10)
  {
    id v11 = [v4 atxActionExecutableObject];
    if (v11)
    {
      id v12 = [a1 _resultWithATXAction:v11];
      goto LABEL_9;
    }
  }
  else
  {
    id v11 = __atxlog_handle_ui();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[ATXSpotlightClient _resultWithActionSuggestion:]();
    }
  }
  id v12 = 0;
LABEL_9:

  return v12;
}

+ (id)_resultWithIntent:(id)a3 title:(id)a4 subtitle:(id)a5 bundleIdForDisplay:(id)a6 appIcon:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = (void *)MEMORY[0x1E4F28F80];
  id v17 = a6;
  char v18 = [v16 processInfo];
  uint64_t v19 = [v18 processName];
  int v20 = [v19 isEqualToString:@"duetexpertd"];

  if (v20)
  {
    long long v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2 object:a1 file:@"ATXSpotlightClient.m" lineNumber:870 description:@"We should not be pulling in UIKit in duetexpertd"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v15 setBundleIdentifier:@"com.apple.mobilephone"];
  }
  uint64_t v21 = __atxlog_handle_ui();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v52 = v13;
    __int16 v53 = 2112;
    id v54 = v12;
    _os_log_impl(&dword_1A790D000, v21, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithIntent [%@] intent:%@", buf, 0x16u);
  }

  INUISearchFoundationImageAdapterClass = (objc_class *)getINUISearchFoundationImageAdapterClass();
  if (v12 && (double v23 = INUISearchFoundationImageAdapterClass, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v24 = v17;

    v25 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v12 response:0];
    id v26 = [v25 _keyImage];
    id v27 = __atxlog_handle_ui();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [v26 _identifier];
      *(_DWORD *)buf = 138412290;
      id v52 = v28;
      _os_log_impl(&dword_1A790D000, v27, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithIntent intentsImage._identifier:%@", buf, 0xCu);
    }
    if (v26)
    {
      uint64_t v29 = (void *)[[v23 alloc] initWithIntentsImage:v26];
      objc_msgSend(v29, "setSize:", 32.0, 32.0);
    }
    else
    {
      uint64_t v29 = 0;
    }

    uint64_t v30 = (void *)MEMORY[0x1E4F1CBF0];
    id v17 = v24;
    objc_msgSend(a1, "detailedRowCardSectionWithTitle:subtitles:thumbnail:trailingImage:", v13, MEMORY[0x1E4F1CBF0], v15, v29, 0);
  }
  else if (v14)
  {
    id v50 = v14;
    uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    uint64_t v29 = 0;
    objc_msgSend(a1, "detailedRowCardSectionWithTitle:subtitles:thumbnail:trailingImage:", v13, v30, v15, 0, v14);
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v30 = (void *)MEMORY[0x1E4F1CBF0];
    objc_msgSend(a1, "detailedRowCardSectionWithTitle:subtitles:thumbnail:trailingImage:", v13, MEMORY[0x1E4F1CBF0], v15, 0, 0);
  id v31 = };
  id v32 = objc_opt_new();
  id v33 = [v12 backingStore];
  [v33 data];
  char v34 = v48 = v13;
  [v32 setIntentMessageData:v34];

  v35 = [v12 _intentInstanceDescription];
  char v36 = [v35 type];
  [v32 setIntentMessageName:v36];

  [v32 setApplicationBundleIdentifier:v17];
  [v31 setCommand:v32];
  v37 = objc_opt_new();
  uint64_t v38 = objc_opt_new();
  [v38 UUIDString];
  v40 = uint64_t v39 = v15;
  [v37 setIdentifier:v40];

  [v37 setApplicationBundleIdentifier:v17];
  uint64_t v41 = [v37 applicationBundleIdentifier];
  [v37 setResultBundleId:v41];

  id v42 = objc_opt_new();
  uint64_t v49 = v31;
  id v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  [v42 setCardSections:v43];

  [v37 setInlineCard:v42];

  return v37;
}

+ (id)_resultWithAppBundleId:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[ATXApplicationRecord localizedNameForBundle:v3];
  if (![v4 length])
  {
    id v5 = __atxlog_handle_ui();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[ATXSpotlightClient _resultWithAppBundleId:]();
    }
  }
  uint64_t v6 = objc_opt_new();
  [v6 setBundleIdentifier:v3];
  id v7 = objc_alloc_init(MEMORY[0x1E4F9A198]);
  [v7 setApplicationBundleIdentifier:v3];
  id v8 = objc_opt_new();
  [v8 setShouldUseCompactDisplay:1];
  [v8 setThumbnail:v6];
  id v9 = [MEMORY[0x1E4F9A378] textWithString:v4];
  [v8 setTitle:v9];

  [v8 setCommand:v7];
  int v10 = objc_alloc_init(ATXSuggestionSearchResult);
  [(ATXSuggestionSearchResult *)v10 setIdentifier:v3];
  [(ATXSuggestionSearchResult *)v10 setApplicationBundleIdentifier:v3];
  id v11 = [(ATXSuggestionSearchResult *)v10 applicationBundleIdentifier];
  [(ATXSuggestionSearchResult *)v10 setResultBundleId:v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4F99F20]);
  v15[0] = v8;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v12 setCardSections:v13];

  [(ATXSuggestionSearchResult *)v10 setInlineCard:v12];

  return v10;
}

+ (id)_resultWithATXAction:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 actionTitle];
  uint64_t v6 = [v4 actionSubtitle];
  id v7 = [v4 _bundleIdForDisplay];
  id v8 = +[ATXSpotlightZKWTrialClientWrapper sharedInstance];
  keyExistsAndHasValidFormat[0] = 0;
  if (CFPreferencesGetAppBooleanValue(@"zkwShowNSUAApp", (CFStringRef)*MEMORY[0x1E4F4B688], keyExistsAndHasValidFormat)|| [v8 showNSUASuggestionsAsAppLaunches])
  {
    id v9 = [a1 _resultWithAppBundleId:v7];
    goto LABEL_4;
  }
  id v11 = objc_opt_new();
  if ([v7 isEqualToString:@"com.apple.mobilesafari"])
  {
    [v11 setIconType:1];
  }
  else
  {
    id v12 = [v4 userActivity];
    id v13 = [v12 webpageURL];
    uint64_t v14 = ATXBundleIdReplacementForBundleIdWithWebpageURLHint();

    [v11 setBundleIdentifier:v14];
    id v7 = (void *)v14;
  }
  id v15 = __atxlog_handle_ui();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v4 bundleId];
    *(_DWORD *)keyExistsAndHasValidFormat = 138412546;
    id v52 = v5;
    __int16 v53 = 2112;
    id v54 = v16;
    _os_log_impl(&dword_1A790D000, v15, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithATXAction [%@] action.bundleId=%@", keyExistsAndHasValidFormat, 0x16u);
  }
  id v17 = [v4 intent];

  if (!v17)
  {
    uint64_t v19 = [v4 userActivity];
    int v20 = [v19 webpageURL];

    if (v20)
    {
      uint64_t v21 = [v4 userActivity];
      uint64_t v22 = [v21 webpageURL];

      double v23 = [v22 host];
      char v24 = [v23 isEqualToString:@"trackingshipment.apple.com"];

      if (v24)
      {
        uint64_t v25 = 0;
      }
      else
      {
        id v26 = [v22 absoluteString];

        if (v26)
        {
          uint64_t v27 = [v22 schemelessAbsoluteString];

          uint64_t v6 = (void *)v27;
        }
        uint64_t v25 = [a1 _symbolImageForName:@"link"];
      }
      id v28 = __atxlog_handle_ui();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)keyExistsAndHasValidFormat = 138412546;
        id v52 = v5;
        __int16 v53 = 2112;
        id v54 = v22;
        _os_log_impl(&dword_1A790D000, v28, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: _resultWithATXAction [%@] userActivity webpageURL:%@", keyExistsAndHasValidFormat, 0x16u);
      }
    }
    else
    {
      uint64_t v25 = 0;
    }
    if (v6)
    {
      id v50 = v6;
      uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    }
    else
    {
      uint64_t v29 = MEMORY[0x1E4F1CBF0];
    }
    uint64_t v47 = (void *)v29;
    char v48 = v11;
    char v46 = (void *)v25;
    uint64_t v30 = [a1 detailedRowCardSectionWithTitle:v5 subtitles:v29 thumbnail:v11 trailingImage:v25];
    id v31 = [v4 userActivity];
    id v32 = [v31 webpageURL];

    if (v32)
    {
      id v33 = objc_opt_new();
      char v34 = (void *)MEMORY[0x1E4F9A2F8];
      v35 = [v4 userActivity];
      char v36 = [v35 webpageURL];
      v37 = [v34 punchoutWithURL:v36];
      [v33 setPunchout:v37];

      [v30 setCommand:v33];
      uint64_t v38 = v30;
    }
    else
    {
      uint64_t v39 = [v4 userActivity];

      if (!v39)
      {
        id v33 = __atxlog_handle_ui();
        uint64_t v38 = v30;
        char v18 = v46;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
          +[ATXSpotlightClient _resultWithATXAction:]();
        }
        goto LABEL_32;
      }
      id v33 = objc_alloc_init(MEMORY[0x1E4F9A150]);
      uint64_t v40 = [v4 userActivityString];
      [v33 setUserActivityRequiredString:v40];

      [v33 setApplicationBundleIdentifier:v7];
      uint64_t v38 = v30;
      [v30 setCommand:v33];
    }
    char v18 = v46;
LABEL_32:

    id v9 = objc_opt_new();
    uint64_t v41 = objc_opt_new();
    id v42 = [v41 UUIDString];
    [v9 setIdentifier:v42];

    [v9 setApplicationBundleIdentifier:v7];
    id v43 = [v9 applicationBundleIdentifier];
    [v9 setResultBundleId:v43];

    char v44 = objc_opt_new();
    uint64_t v49 = v38;
    long long v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    [v44 setCardSections:v45];

    [v9 setInlineCard:v44];
    id v11 = v48;
    goto LABEL_33;
  }
  char v18 = [v4 intent];
  id v9 = [a1 _resultWithIntent:v18 title:v5 subtitle:v6 bundleIdForDisplay:v7 appIcon:v11];
LABEL_33:

LABEL_4:

  return v9;
}

+ (id)_symbolImageForName:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setSymbolName:v3];

  [v4 setIsTemplate:1];

  return v4;
}

+ (id)_resultWithAppClipSuggestion:(id)a3
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 appClipHeroAppPredictionExecutableObject];
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v21 = 0;
    goto LABEL_26;
  }
  id v7 = [v5 clipMetadata];
  if (v7)
  {
    id v8 = [v4 uiSpecification];
    id v9 = [v8 subtitle];

    int v10 = [v7 localizedSubtitleForClipSuggestion];
    if ([v10 isEqualToString:v9])
    {
      id v11 = [v4 uiSpecification];
      uint64_t v12 = [v11 title];

      id v13 = [v4 uiSpecification];
      uint64_t v14 = [v13 subtitle];

      int v10 = (void *)v14;
      id v9 = (void *)v12;
    }
    id v15 = [v7 fullAppCachedIconFilePath];

    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F9A510]);
      id v17 = (void *)MEMORY[0x1E4F1CB10];
      char v18 = [v7 fullAppCachedIconFilePath];
      uint64_t v19 = [v17 fileURLWithPath:v18];
      int v20 = (void *)[v16 initWithURL:v19];
    }
    else
    {
      uint64_t v22 = [v7 clipBusinessIconURL];

      if (v22)
      {
        id v23 = objc_alloc(MEMORY[0x1E4F9A510]);
        uint64_t v24 = [v7 clipBusinessIconURL];
      }
      else
      {
        int v20 = [v7 fullAppIconURL];

        if (!v20)
        {
LABEL_15:
          [v20 setCornerRoundingStyle:3];
          id v50 = v20;
          if (v10)
          {
            v54[0] = v10;
            uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
            id v26 = [a1 detailedRowCardSectionWithTitle:v9 subtitles:v25 thumbnail:v20 trailingImage:0];
          }
          else
          {
            id v26 = [a1 detailedRowCardSectionWithTitle:v9 subtitles:MEMORY[0x1E4F1CBF0] thumbnail:v20 trailingImage:0];
          }
          char v48 = v9;
          uint64_t v49 = v10;
          id v27 = objc_alloc_init(MEMORY[0x1E4F9A2F8]);
          id v28 = [v6 clipMetadata];
          uint64_t v29 = [v28 clipURL];
          if (v29)
          {
            uint64_t v30 = [v6 clipMetadata];
            id v31 = [v30 clipURL];
            __int16 v53 = v31;
            id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
            [v27 setUrls:v32];
          }
          else
          {
            [v27 setUrls:MEMORY[0x1E4F1CBF0]];
          }

          [v27 setHasClip:1];
          id v52 = v27;
          id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
          [v26 setPunchoutOptions:v33];

          [v26 setThumbnail:v50];
          id v34 = objc_alloc_init(MEMORY[0x1E4F99E88]);
          [v26 setAction:v34];

          v35 = [v7 clipOpenButtonTitle];
          char v36 = [v35 uppercaseString];
          v37 = [v26 action];
          [v37 setLabel:v36];

          uint64_t v21 = objc_opt_new();
          [v21 setType:23];
          [v21 setApplicationBundleIdentifier:@"com.apple.application"];
          uint64_t v38 = [v21 applicationBundleIdentifier];
          [v21 setResultBundleId:v38];

          uint64_t v39 = NSString;
          uint64_t v40 = [v6 clipMetadata];
          uint64_t v41 = [v40 webClipID];
          id v42 = (void *)v41;
          if (v41) {
            id v43 = (__CFString *)v41;
          }
          else {
            id v43 = &stru_1EFD9B408;
          }
          char v44 = [v39 stringWithFormat:@"com.apple.appclip-%@", v43];
          [v21 setIdentifier:v44];

          [v21 setNearbyBusinessesString:&stru_1EFD9B408];
          long long v45 = objc_opt_new();
          long long v51 = v26;
          char v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
          [v45 setCardSections:v46];

          [v21 setInlineCard:v45];
          goto LABEL_25;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F9A510]);
        uint64_t v24 = [v7 fullAppIconURL];
      }
      char v18 = (void *)v24;
      int v20 = (void *)[v23 initWithURL:v24];
    }

    goto LABEL_15;
  }
  uint64_t v21 = 0;
LABEL_25:

LABEL_26:

  return v21;
}

+ (id)detailedRowCardSectionWithTitle:(id)a3 subtitles:(id)a4 thumbnail:(id)a5 trailingImage:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_opt_new();
  [v13 setShouldUseCompactDisplay:1];
  [v13 setThumbnail:v11];
  [v13 setTrailingThumbnail:v12];
  id v23 = v9;
  uint64_t v14 = [MEMORY[0x1E4F9A378] textWithString:v9];
  [v13 setTitle:v14];

  id v15 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [MEMORY[0x1E4F9A378] textWithString:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        [v15 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }

  [v13 setDescriptions:v15];

  return v13;
}

+ (BOOL)_isAutoShortcutEnabledForSpotlight:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  char v6 = [a1 isAutoShortcutsEnabledForSpotlightForBundleId:v5];

  if ((v6 & 1) == 0)
  {
    id v11 = __atxlog_handle_zkw_hide();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v4 bundleIdentifier];
      int v21 = 138412290;
      uint64_t v22 = v17;
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "ATXSFL: All auto shortcuts are disabled for app: %@", (uint8_t *)&v21, 0xCu);
LABEL_10:
    }
LABEL_11:
    BOOL v16 = 0;
    goto LABEL_12;
  }
  id v7 = [v4 bundleIdentifier];
  id v8 = [v4 phrase];
  id v9 = [v8 signature];
  char v10 = [a1 isAutoShortcutEnabledForSpotlightForBundleId:v7 signature:v9];

  id v11 = __atxlog_handle_zkw_hide();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) == 0)
  {
    if (v12)
    {
      uint64_t v17 = [v4 phrase];
      uint64_t v18 = [v17 signature];
      uint64_t v19 = [v4 bundleIdentifier];
      int v21 = 138412546;
      uint64_t v22 = v18;
      __int16 v23 = 2112;
      long long v24 = v19;
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "ATXSFL: Auto shortcut is hidden for shortcut with signature: %@ from app: %@", (uint8_t *)&v21, 0x16u);

      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v12)
  {
    id v13 = [v4 bundleIdentifier];
    uint64_t v14 = [v4 phrase];
    id v15 = [v14 signature];
    int v21 = 138412546;
    uint64_t v22 = v13;
    __int16 v23 = 2112;
    long long v24 = v15;
    _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "ATXSFL: Can display auto shortcut for app: %@ with shortcut signature: %@", (uint8_t *)&v21, 0x16u);
  }
  BOOL v16 = 1;
LABEL_12:

  return v16;
}

+ (BOOL)isAutoShortcutsEnabledForSpotlightForBundleId:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v5 = (void *)CFPreferencesCopyValue(@"SBSearchDisabledBundles", @"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  char v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1C978] array];
  }
  id v8 = v7;

  id v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v8];
  [v9 removeObject:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
  [v9 removeObject:@"com.apple.CloudDocs.iCloudDriveFileProvider"];
  [v9 removeObject:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"];
  if ([v8 containsObject:@"com.apple.DocumentsApp"])
  {
    [v9 addObject:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
    [v9 addObject:@"com.apple.CloudDocs.iCloudDriveFileProvider"];
    [v9 addObject:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"];
    [v9 addObject:@"com.apple.FileProvider.LocalStorage"];
  }
  char v10 = [MEMORY[0x1E4F1CA80] setWithArray:v9];

  id v11 = (void *)[v4 initWithSet:v10];
  if ([v11 containsObject:v3])
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    id v13 = objc_opt_new();
    int v12 = [v13 autoShortcutHasBeenHiddenForIdentifier:v3] ^ 1;
  }
  return v12;
}

+ (BOOL)isAutoShortcutEnabledForSpotlightForBundleId:(id)a3 signature:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  id v8 = [v6 stringByAppendingString:v5];

  LOBYTE(v6) = [v7 autoShortcutHasBeenHiddenForIdentifier:v8] ^ 1;
  return (char)v6;
}

+ (id)_iconForParameterizedAutoShortcutContextualAction:(id)a3 provider:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 phrase];
    id v9 = [v8 parameterIdentifier];

    if (!v9)
    {
      int v12 = __atxlog_handle_blending();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v6 bundleIdentifier];
        uint64_t v18 = [v6 actionIdentifier];
        *(_DWORD *)buf = 138412546;
        long long v27 = v17;
        __int16 v28 = 2112;
        uint64_t v29 = v18;
        _os_log_impl(&dword_1A790D000, v12, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [AutoShortcut] not a phrase with parameters, use contextualAction icon %@, %@", buf, 0x16u);
      }
      uint64_t v14 = 0;
      goto LABEL_23;
    }
    uint64_t v25 = v9;
    char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    id v24 = 0;
    id v11 = [v7 propertiesForIdentifiers:v10 error:&v24];
    int v12 = v24;

    if (v12)
    {
      id v13 = __atxlog_handle_blending();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[ATXSpotlightClient _iconForParameterizedAutoShortcutContextualAction:provider:](v6, (uint64_t)v12, v13);
      }
    }
    else
    {
      if (v11)
      {
        uint64_t v19 = [v11 objectForKeyedSubscript:v9];
        id v13 = v19;
        if (v19)
        {
          int v20 = [v19 value];
          int v21 = [v20 displayRepresentation];

          uint64_t v22 = [v21 image];
          uint64_t v14 = [a1 _contextualActionIconFromLNImage:v22];
        }
        else
        {
          int v21 = __atxlog_handle_blending();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            +[ATXSpotlightClient _iconForParameterizedAutoShortcutContextualAction:provider:](v6);
          }
          uint64_t v14 = 0;
        }

        goto LABEL_22;
      }
      id v13 = __atxlog_handle_blending();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[ATXSpotlightClient _iconForParameterizedAutoShortcutContextualAction:provider:](v6);
      }
    }
    uint64_t v14 = 0;
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  id v9 = __atxlog_handle_blending();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [0 bundleIdentifier];
    BOOL v16 = [0 actionIdentifier];
    *(_DWORD *)buf = 138412546;
    long long v27 = v15;
    __int16 v28 = 2112;
    uint64_t v29 = v16;
    _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [AutoShortcut] is not an Auto Shortcut, use contextualAction icon %@, %@", buf, 0x16u);
  }
  uint64_t v14 = 0;
LABEL_24:

  return v14;
}

+ (id)_contextualActionIconFromLNImage:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28F80] processInfo];
  id v5 = [v4 processName];
  id v6 = [v5 lowercaseString];
  int v7 = [v6 isEqualToString:@"duetexpertd"];

  if (!v7)
  {
    int v20 = 0;
    if (!WorkflowKitLibraryCore_frameworkLibrary)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      __int16 v23 = __WorkflowKitLibraryCore_block_invoke;
      id v24 = &__block_descriptor_40_e5_v8__0l;
      uint64_t v25 = &v20;
      long long v26 = xmmword_1E5D0A540;
      uint64_t v27 = 0;
      WorkflowKitLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (!WorkflowKitLibraryCore_frameworkLibrary) {
      +[ATXSpotlightClient _contextualActionIconFromLNImage:](&v20);
    }
    if (v20) {
      free(v20);
    }
    char v10 = objc_msgSend(v3, "wf_image");
    id v8 = v10;
    if (v10)
    {
      id v11 = [v10 URL];

      if (v11)
      {
        int v12 = (void *)MEMORY[0x1E4FB4658];
        id v13 = [v8 URL];
        [v3 displayStyle];
        uint64_t v14 = [v12 iconWithImageURL:v13 displayStyle:WFContextualActionIconDisplayStyleForLNImageDisplayStyle()];
LABEL_20:
        id v9 = (void *)v14;
        goto LABEL_21;
      }
      id v15 = [v8 data];

      if (v15)
      {
        BOOL v16 = (void *)MEMORY[0x1E4FB4658];
        id v13 = [v8 data];
        [v3 displayStyle];
        uint64_t v14 = [v16 iconWithImageData:v13 scale:WFContextualActionIconDisplayStyleForLNImageDisplayStyle() displayStyle:0.0];
        goto LABEL_20;
      }
      uint64_t v17 = [v8 symbolName];

      if (v17)
      {
        uint64_t v18 = (void *)MEMORY[0x1E4FB4658];
        id v13 = [v8 symbolName];
        uint64_t v14 = [v18 iconWithSystemName:v13];
        goto LABEL_20;
      }
      id v13 = __atxlog_handle_ui();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        +[ATXSpotlightClient _contextualActionIconFromLNImage:]();
      }
    }
    else
    {
      id v13 = __atxlog_handle_blending();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: [AutoShortcut] wfimage nil", buf, 2u);
      }
    }
    id v9 = 0;
LABEL_21:

    goto LABEL_22;
  }
  id v8 = __atxlog_handle_ui();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    +[ATXSpotlightClient _contextualActionIconFromLNImage:]();
  }
  id v9 = 0;
LABEL_22:

  return v9;
}

+ (BOOL)_shouldDisplayUpcomingMediaForTesting
{
  return CFPreferencesGetAppBooleanValue(@"displayUpcomingMedia", @"com.apple.duetexpertd", 0) != 0;
}

+ (id)_responseWithUpcomingMedia
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  id v6 = [a1 recentUpcomingMediaActionsWithLimit:4];
  int v7 = +[ATXSpotlightClientResponse createSectionWithTitle:sectionBundleIdentifier:resultCount:](ATXSpotlightClientResponse, "createSectionWithTitle:sectionBundleIdentifier:resultCount:", 0, &stru_1EFD9B408, [v6 count]);
  long long v26 = v5;
  [v5 addObject:v7];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      uint64_t v12 = 0;
      uint64_t v27 = v10;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
        uint64_t v14 = [a1 _resultWithATXAction:v13];
        if (v14
          && ([MEMORY[0x1E4FA5D78] proactiveTopicWithResult:v14],
              (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          BOOL v16 = v15;
          uint64_t v17 = __atxlog_handle_ui();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            [a1 _descriptionForTopic:v16];
            uint64_t v18 = v11;
            id v19 = a1;
            id v20 = v8;
            int v21 = v4;
            v23 = uint64_t v22 = v3;
            *(_DWORD *)buf = 138412290;
            v35 = v23;
            _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, "ATXSpotlightClient: Topic: %@", buf, 0xCu);

            id v3 = v22;
            id v4 = v21;
            id v8 = v20;
            a1 = v19;
            uint64_t v11 = v18;
            uint64_t v10 = v27;
          }

          [v3 addObject:v16];
          [v4 addObject:&unk_1EFDF4848];
        }
        else
        {
          BOOL v16 = __atxlog_handle_ui();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            +[ATXSpotlightClient _responseWithUpcomingMedia];
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v10);
  }

  id v24 = [[ATXSpotlightClientResponse alloc] initWithTopics:v3 scores:v4 sections:v26];

  return v24;
}

+ (id)recentUpcomingMediaActionsWithLimit:(unint64_t)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
  long long v29 = +[ATXUpcomingMediaQuery getAllUpcomingMedia];
  id v4 = [v29 sortedUpcomingMedia];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v35 + 1) + 8 * i) first];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v8);
  }

  unint64_t v12 = [v5 count];
  if (v12 >= a3) {
    unint64_t v13 = a3;
  }
  else {
    unint64_t v13 = v12;
  }
  uint64_t v14 = objc_msgSend(v5, "subarrayWithRange:", 0, v13);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        id v20 = [v19 launchId];

        if (v20)
        {
          int v21 = [ATXAction alloc];
          uint64_t v22 = objc_opt_new();
          __int16 v23 = [v19 launchId];
          LOBYTE(v28) = 0;
          id v24 = [(ATXAction *)v21 initWithIntent:v19 actionUUID:v22 bundleId:v23 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v28 title:0 subtitle:0];

          if (v24)
          {
            uint64_t v25 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v40 = v24;
              _os_log_impl(&dword_1A790D000, v25, OS_LOG_TYPE_DEFAULT, "recentUpcomingMediaActionsWithLimit action:%@", buf, 0xCu);
            }

            [v30 addObject:v24];
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v16);
  }
  long long v26 = (void *)[v30 copy];

  return v26;
}

- (ATXSpotlightClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXSpotlightClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)suggestedResultResponseWithLimit:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXSpotlightClient: [Recents] alternate ranking match in both codepaths", v2, v3, v4, v5, v6);
}

+ (void)suggestedResultResponseWithLimit:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXSpotlightClient: [Recents] alternate ranking without matching control or treatment codepath", v2, v3, v4, v5, v6);
}

+ (void)_isValidSuggestion:forWorldState:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A790D000, v0, OS_LOG_TYPE_ERROR, "ATXSpotlightClient: Removing unexpected spotlight recent", v1, 2u);
}

+ (void)_topicWithSuggestion:layoutUUID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXSpotlightClient: _resultWithSuggestion must have an identifier to be included in Spotlight metrics", v2, v3, v4, v5, v6);
}

+ (void)rerankRecents:(void *)a1 withAlternateRanking:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1A790D000, v1, v2, "[Recents]: Returning results: %lu", v3, v4, v5, v6, v7);
}

+ (void)rerankRecents:withAlternateRanking:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXSpotlightClient: [Recents] unsupported alt ranking %lu", v2, v3, v4, v5, v6);
}

+ (void)rerankRecents_Normal:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_11(a1, a2);
  OUTLINED_FUNCTION_6_5(&dword_1A790D000, v2, v3, "[Recents]: Adding", v4);
}

+ (void)rerankRecents_Normal:(unsigned char *)a1 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_11(a1, a2);
  _os_log_fault_impl(&dword_1A790D000, v2, OS_LOG_TYPE_FAULT, "[Recents]: Unexpected date out of order", v3, 2u);
}

+ (void)rerankRecents_Normal:(unsigned char *)a1 .cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_11(a1, a2);
  OUTLINED_FUNCTION_6_5(&dword_1A790D000, v2, v3, "[Recents]: Duplicate", v4);
}

void __56__ATXSpotlightClient_rerankRecents_Filter_removingType___block_invoke_cold_1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1A790D000, a2, OS_LOG_TYPE_DEBUG, "[Recents]: Removing result with type %d", (uint8_t *)v3, 8u);
}

+ (void)rerankRecents_LimitCount:(void *)a1 oneCountDays:twoCountDays:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1A790D000, v1, v2, "[Recents]: After removing expired: %lu", v3, v4, v5, v6, v7);
}

+ (void)rerankRecents_LimitCount:(void *)a1 oneCountDays:twoCountDays:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1A790D000, v1, v2, "[Recents]: After removing duplicates: %lu", v3, v4, v5, v6, v7);
}

+ (void)rerankRecents_LimitCount:(unsigned char *)a1 oneCountDays:(unsigned char *)a2 twoCountDays:.cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_11(a1, a2);
  OUTLINED_FUNCTION_6_5(&dword_1A790D000, v2, v3, "[Recents]: Duplicate, incrementing", v4);
}

void __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke_233_cold_1(void *a1)
{
  uint64_t v1 = [a1 engagementTime];
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_5(&dword_1A790D000, v2, v3, "[Recents]: Remove single engagement: %lu %@", v4, v5, v6, v7, 2u);
}

void __73__ATXSpotlightClient_rerankRecents_LimitCount_oneCountDays_twoCountDays___block_invoke_233_cold_2(void *a1)
{
  uint64_t v1 = [a1 engagementTime];
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_5(&dword_1A790D000, v2, v3, "[Recents]: Remove double engagement: %lu %@", v4, v5, v6, v7, 2u);
}

+ (void)_resultWithSuggestion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 executableSpecification];
  uint64_t v4 = [v3 executableClassString];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXSpotlightClient: _resultWithSuggestion is not handled %@", v5, 0xCu);
}

+ (void)_resultWithLinkActionContainer:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Error secure archiving of WFLinkContextualAction: %@", v2, v3, v4, v5, v6);
}

+ (void)_resultWithContextualAction:title:subtitle:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "WFContextualAction does not have icon or related bundle identifier", v2, v3, v4, v5, v6);
}

+ (void)_resultWithContextualAction:title:subtitle:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Error secure archiving of WFContextualAction: %@", v2, v3, v4, v5, v6);
}

+ (void)_imageWithContextualActionIcon:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXSpotlightClient: WFContextualActionIcon does not have image data, or system name", v2, v3, v4, v5, v6);
}

+ (void)_resultWithActionSuggestion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXSpotlightClient: executableClassString %@ wrong class.", v2, v3, v4, v5, v6);
}

+ (void)_resultWithAppBundleId:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ZKW app result had no title for bundleId: %@", v2, v3, v4, v5, v6);
}

+ (void)_resultWithATXAction:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "ATXSpotlightClient: _resultWithActionSuggestion action %@ has no intent nor user activity", v2, v3, v4, v5, v6);
}

+ (void)_iconForParameterizedAutoShortcutContextualAction:(void *)a1 provider:.cold.1(void *a1)
{
  uint64_t v2 = [a1 bundleIdentifier];
  uint64_t v3 = [a1 actionIdentifier];
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v4, v5, "ATXSpotlightClient: [AutoShortcut] properties nil for %@, %@", v6, v7, v8, v9, 2u);
}

+ (void)_iconForParameterizedAutoShortcutContextualAction:(void *)a1 provider:.cold.2(void *a1)
{
  uint64_t v2 = [a1 bundleIdentifier];
  uint64_t v3 = [a1 actionIdentifier];
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v4, v5, "ATXSpotlightClient: [AutoShortcut] property nil for %@, %@", v6, v7, v8, v9, 2u);
}

+ (void)_iconForParameterizedAutoShortcutContextualAction:(NSObject *)a3 provider:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 bundleIdentifier];
  uint64_t v7 = [a1 actionIdentifier];
  int v9 = 138412802;
  uint64_t v10 = v6;
  OUTLINED_FUNCTION_3_7();
  __int16 v11 = v8;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_1A790D000, a3, OS_LOG_TYPE_ERROR, "ATXSpotlightClient: [AutoShortcut] properties lookup error for %@, %@: %@", (uint8_t *)&v9, 0x20u);
}

+ (void)_contextualActionIconFromLNImage:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXSpotlightClient: should not be pulling in UIKit duetexpertd.", v2, v3, v4, v5, v6);
}

+ (void)_contextualActionIconFromLNImage:(void *)a1 .cold.2(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *WorkflowKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ATXSpotlightClient.m", 50, @"%s", *a1);

  __break(1u);
}

+ (void)_contextualActionIconFromLNImage:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXSpotlightClient: WFContextualAction does not have url or data or symbolName", v2, v3, v4, v5, v6);
}

+ (void)_responseWithUpcomingMedia
{
  uint64_t v7 = [a2 actionTitle];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1A790D000, a4, OS_LOG_TYPE_ERROR, "ATXSpotlightClient: Topic: nil: %@", a1, 0xCu);
}

@end