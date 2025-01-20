@interface EKEventSuggestionGenerator
+ (void)adjustTimeForUIAndApplyToAutocompleteResults:(id)a3 usingCurrentStartDate:(id)a4 currentEndDate:(id)a5 timeImplicitlySet:(BOOL)a6 calendar:(id)a7;
- (BOOL)finishedCompletionHandlerCalled;
- (EKAutocompletePendingSearchProtocol)runningTitleSearch;
- (EKAutocompleteSearchResult)lastDefaultReminderResult;
- (EKAutocompleteSearchResult)lastDefaultResult;
- (EKEventSuggestionGenerator)init;
- (NSArray)lastResults;
- (NSString)lastQueryString;
- (OS_dispatch_queue)queryQueue;
- (void)_generateEventSuggestionsAsynchronouslyFromString:(id)a3 defaultSuggestionVisibility:(unint64_t)a4 options:(unint64_t)a5 defaultCalendar:(id)a6 referenceDate:(id)a7 initialEvent:(id)a8 pasteboardItemProvider:(id)a9 handler:(id)a10;
- (void)eventSuggestionsFromString:(id)a3 defaultCalendar:(id)a4 referenceDate:(id)a5 pasteboardItemProvider:(id)a6 defaultSuggestionVisibility:(unint64_t)a7 options:(unint64_t)a8 handler:(id)a9;
- (void)eventSuggestionsFromString:(id)a3 initialEvent:(id)a4 defaultSuggestionVisibility:(unint64_t)a5 options:(unint64_t)a6 handler:(id)a7;
- (void)setFinishedCompletionHandlerCalled:(BOOL)a3;
- (void)setLastDefaultReminderResult:(id)a3;
- (void)setLastDefaultResult:(id)a3;
- (void)setLastQueryString:(id)a3;
- (void)setLastResults:(id)a3;
- (void)setQueryQueue:(id)a3;
- (void)setRunningTitleSearch:(id)a3;
@end

@implementation EKEventSuggestionGenerator

- (EKEventSuggestionGenerator)init
{
  v7.receiver = self;
  v7.super_class = (Class)EKEventSuggestionGenerator;
  v2 = [(EKEventSuggestionGenerator *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.calendarUIKit.eventSuggestionsGeneratorQueue", v3);
    queryQueue = v2->_queryQueue;
    v2->_queryQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)eventSuggestionsFromString:(id)a3 initialEvent:(id)a4 defaultSuggestionVisibility:(unint64_t)a5 options:(unint64_t)a6 handler:(id)a7
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v16 = [v13 calendar];
  v15 = [v13 startDate];
  [(EKEventSuggestionGenerator *)self _generateEventSuggestionsAsynchronouslyFromString:v14 defaultSuggestionVisibility:a5 options:a6 defaultCalendar:v16 referenceDate:v15 initialEvent:v13 pasteboardItemProvider:0 handler:v12];
}

- (void)eventSuggestionsFromString:(id)a3 defaultCalendar:(id)a4 referenceDate:(id)a5 pasteboardItemProvider:(id)a6 defaultSuggestionVisibility:(unint64_t)a7 options:(unint64_t)a8 handler:(id)a9
{
}

- (void)_generateEventSuggestionsAsynchronouslyFromString:(id)a3 defaultSuggestionVisibility:(unint64_t)a4 options:(unint64_t)a5 defaultCalendar:(id)a6 referenceDate:(id)a7 initialEvent:(id)a8 pasteboardItemProvider:(id)a9 handler:(id)a10
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a6;
  id v116 = a7;
  id v18 = a8;
  id v19 = a9;
  id v115 = a10;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(EKEventSuggestionGenerator *)self setFinishedCompletionHandlerCalled:0];
  [(EKEventSuggestionGenerator *)self setLastQueryString:v16];
  [(EKEventSuggestionGenerator *)self setLastDefaultResult:0];
  [(EKEventSuggestionGenerator *)self setLastDefaultReminderResult:0];
  [(EKEventSuggestionGenerator *)self setLastResults:MEMORY[0x1E4F1CBF0]];
  v111 = v18;
  BOOL v20 = v18 == 0;
  if ((a5 & 0x40) != 0)
  {
    v21 = [v17 eventStore];
    uint64_t v22 = [v21 reminderIntegrationCalendar];

    v110 = (void *)v22;
    BOOL v108 = v22 != 0;
  }
  else
  {
    v110 = 0;
    BOOL v108 = 0;
  }
  id v23 = v16;
  v24 = v23;
  BOOL v106 = a4 == 1;
  if (a4 > 1)
  {
    v114 = 0;
    v27 = 0;
    v26 = v23;
  }
  else
  {
    v25 = +[EKEventTimeDetector resultDictionaryForString:v23 referenceDate:v116 ignoreDurationForApproximateTime:(a5 >> 1) & 1];
    v26 = [v25 objectForKeyedSubscript:@"EKEventTimeDetectorResultTitleKey"];

    v114 = v25;
    v27 = [v25 objectForKeyedSubscript:@"EKEventTimeDetectorResultStartDateKey"];
  }
  uint64_t v28 = [v26 length];
  BOOL v29 = v28 != 0;
  if (a4 && v28) {
    BOOL v29 = a4 == 1 && v27 != 0;
  }
  v113 = v26;
  if ((a5 & 0x10) != 0)
  {
    BOOL v32 = 1;
    goto LABEL_20;
  }
  uint64_t v31 = [v26 length];
  BOOL v32 = v31 != 0;
  if (v29 || v31)
  {
LABEL_20:
    v104 = v27;
    v112 = v24;
    v35 = v17;
    unsigned int v36 = (a5 >> 2) & 1;
    char v37 = (a5 | v20) & 1;
    v109 = v19;
    unsigned int v38 = (a5 >> 3) & 1;
    unsigned int v39 = (a5 >> 5) & 1;
    v40 = [(EKEventSuggestionGenerator *)self queryQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke;
    block[3] = &unk_1E5B99860;
    block[4] = self;
    id v41 = v114;
    id v126 = v41;
    char v134 = v39;
    id v102 = v116;
    id v127 = v102;
    BOOL v135 = v108;
    v105 = v35;
    id v42 = v35;
    v24 = v112;
    id v43 = v42;
    id v128 = v42;
    char v136 = v37;
    id v129 = v113;
    char v137 = v36;
    v33 = v111;
    id v130 = v111;
    BOOL v138 = v106;
    id v107 = v112;
    id v131 = v107;
    BOOL v139 = v29;
    id v103 = v115;
    id v133 = v103;
    BOOL v140 = v32;
    char v141 = v38;
    id v19 = v109;
    id v132 = v109;
    dispatch_async(v40, block);

    if (!v29)
    {
      [(EKEventSuggestionGenerator *)self setLastDefaultResult:0];
      id v17 = v105;
      goto LABEL_40;
    }
    v100 = v43;
    v44 = [v41 objectForKeyedSubscript:@"EKEventTimeDetectorResultTitleKey"];
    uint64_t v45 = [v41 objectForKeyedSubscript:@"EKEventTimeDetectorResultStartDateKey"];
    uint64_t v46 = [v41 objectForKeyedSubscript:@"EKEventTimeDetectorResultEndDateKey"];
    uint64_t v47 = [v41 objectForKeyedSubscript:@"EKEventTimeDetectorResultTimeZoneKey"];
    v48 = [v41 objectForKeyedSubscript:@"EKEventTimeDetectorResultAllDayKey"];
    unsigned int v49 = [v48 BOOLValue];

    v50 = [v41 objectForKeyedSubscript:@"EKEventTimeDetectorResultTimeIsApproximateKey"];
    uint64_t v51 = [v50 BOOLValue];

    v52 = [[EKAutocompleteSearchResult alloc] initWithSource:1];
    [(EKAutocompleteSearchResult *)v52 setApproximateTime:v51];
    [(EKAutocompleteSearchResult *)v52 setTitle:v44];
    v101 = (void *)v47;
    if (v47)
    {
      [(EKAutocompleteSearchResult *)v52 setTimeZone:v47];
    }
    else
    {
      v53 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      [(EKAutocompleteSearchResult *)v52 setTimeZone:v53];
    }
    id v17 = v105;
    if (v45 | v46) {
      uint64_t v54 = v49;
    }
    else {
      uint64_t v54 = 0;
    }
    [(EKAutocompleteSearchResult *)v52 setAllDay:v54];
    id v19 = v109;
    if (v45)
    {
      [(EKAutocompleteSearchResult *)v52 setStartDate:v45];
      if (v46)
      {
LABEL_30:
        [(EKAutocompleteSearchResult *)v52 setEndDate:v46];
        [(EKAutocompleteSearchResult *)v52 setCalendar:v100];
        -[EKAutocompleteSearchResult setCalendarColor:](v52, "setCalendarColor:", [v100 CGColor]);
        [(EKEventSuggestionGenerator *)self setLastDefaultResult:v52];
        goto LABEL_38;
      }
    }
    else
    {
      v55 = [MEMORY[0x1E4F57710] shared];
      [v55 defaultEventDuration];
      double v57 = v56;

      if (v102)
      {
        v58 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
        v59 = [MEMORY[0x1E4F1C9D8] CalComponentForHours:9];
        v60 = v44;
        v61 = (void *)MEMORY[0x1E4F1C9C8];
        v62 = [v58 dateFromComponents:v59];
        v63 = v61;
        v44 = v60;
        v64 = [v63 dateWithDatePartFromDate:v102 timePartFromDate:v62 inCalendar:v58];
        [(EKAutocompleteSearchResult *)v52 setStartDate:v64];

        id v19 = v109;
      }
      else
      {
        v58 = [MEMORY[0x1E4F1C9C8] nextRoundedChunkForDuration:v57];
        [(EKAutocompleteSearchResult *)v52 setStartDate:v58];
      }

      uint64_t v45 = 0;
      if (v46) {
        goto LABEL_30;
      }
    }
    v65 = [MEMORY[0x1E4F57710] shared];
    [v65 defaultEventDuration];
    double v67 = v66;

    v68 = [(EKAutocompleteSearchResult *)v52 startDate];
    v69 = [v68 dateByAddingTimeInterval:v67];
    [(EKAutocompleteSearchResult *)v52 setEndDate:v69];

    [(EKAutocompleteSearchResult *)v52 setCalendar:v100];
    -[EKAutocompleteSearchResult setCalendarColor:](v52, "setCalendarColor:", [v100 CGColor]);
    [(EKEventSuggestionGenerator *)self setLastDefaultResult:v52];
    if (v108)
    {
      v70 = [[EKAutocompleteSearchResult alloc] initWithSource:1];
      v71 = [(EKAutocompleteSearchResult *)v52 title];
      [(EKAutocompleteSearchResult *)v70 setTitle:v71];

      v72 = [(EKAutocompleteSearchResult *)v52 timeZone];
      [(EKAutocompleteSearchResult *)v70 setTimeZone:v72];

      [(EKAutocompleteSearchResult *)v70 setAllDay:[(EKAutocompleteSearchResult *)v52 allDay]];
      v73 = [(EKAutocompleteSearchResult *)v52 startDate];
      [(EKAutocompleteSearchResult *)v70 setStartDate:v73];

      if ([(EKAutocompleteSearchResult *)v52 allDay]) {
        [(EKAutocompleteSearchResult *)v52 endDate];
      }
      else {
      v99 = [(EKAutocompleteSearchResult *)v70 startDate];
      }
      [(EKAutocompleteSearchResult *)v70 setEndDate:v99];

      [(EKAutocompleteSearchResult *)v70 setCalendar:v110];
      goto LABEL_39;
    }
LABEL_38:
    v70 = 0;
LABEL_39:
    [(EKEventSuggestionGenerator *)self setLastDefaultReminderResult:v70];

    v24 = v112;
LABEL_40:
    v74 = [(EKEventSuggestionGenerator *)self lastDefaultResult];
    v34 = v113;
    if (v74)
    {
      BOOL v75 = 1;
    }
    else
    {
      v76 = [(EKEventSuggestionGenerator *)self lastDefaultReminderResult];
      BOOL v75 = v76 != 0;
    }
    v77 = [(EKEventSuggestionGenerator *)self lastResults];

    if (!v75 && !v77)
    {
LABEL_70:
      dispatch_time_t v97 = dispatch_time(0, 500000000);
      v117[0] = MEMORY[0x1E4F143A8];
      v117[1] = 3221225472;
      v117[2] = __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2_30;
      v117[3] = &unk_1E5B97168;
      id v118 = v107;
      v119 = self;
      id v120 = v103;
      v98 = (void *)MEMORY[0x1E4F14428];
      dispatch_after(v97, MEMORY[0x1E4F14428], v117);

      v27 = v104;
      goto LABEL_71;
    }
    id v78 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v79 = v78;
    if (v77)
    {
      v80 = [(EKEventSuggestionGenerator *)self lastResults];
      v81 = objc_msgSend(v79, "initWithCapacity:", objc_msgSend(v80, "count") + 2);

      if (!v75) {
        goto LABEL_53;
      }
    }
    else
    {
      v81 = (void *)[v78 initWithCapacity:2];
      if (!v75)
      {
LABEL_53:
        if (v77)
        {
          v86 = [(EKEventSuggestionGenerator *)self lastResults];
          uint64_t v87 = [v86 count];

          uint64_t v88 = 0;
          if (v87)
          {
            while (1)
            {
              v89 = [(EKEventSuggestionGenerator *)self lastResults];
              v90 = [v89 objectAtIndexedSubscript:v88];
              uint64_t v91 = [v90 source];

              if (v91 != 1) {
                break;
              }
              if (v87 == ++v88)
              {
                uint64_t v88 = v87;
                break;
              }
            }
          }
          long long v123 = 0u;
          long long v124 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          v92 = [(EKEventSuggestionGenerator *)self lastResults];
          uint64_t v93 = [v92 countByEnumeratingWithState:&v121 objects:v142 count:16];
          if (v93)
          {
            uint64_t v94 = v93;
            uint64_t v95 = *(void *)v122;
            do
            {
              for (uint64_t i = 0; i != v94; ++i)
              {
                if (*(void *)v122 != v95) {
                  objc_enumerationMutation(v92);
                }
                if (v88) {
                  --v88;
                }
                else {
                  [v81 addObject:*(void *)(*((void *)&v121 + 1) + 8 * i)];
                }
              }
              uint64_t v94 = [v92 countByEnumeratingWithState:&v121 objects:v142 count:16];
            }
            while (v94);
          }

          v33 = v111;
        }
        [(EKEventSuggestionGenerator *)self setLastResults:v81];

        v24 = v112;
        goto LABEL_70;
      }
    }
    v82 = [(EKEventSuggestionGenerator *)self lastDefaultResult];

    if (v82)
    {
      v83 = [(EKEventSuggestionGenerator *)self lastDefaultResult];
      [v81 addObject:v83];
    }
    v84 = [(EKEventSuggestionGenerator *)self lastDefaultReminderResult];

    if (v84)
    {
      v85 = [(EKEventSuggestionGenerator *)self lastDefaultReminderResult];
      [v81 addObject:v85];
    }
    goto LABEL_53;
  }
  (*((void (**)(id, void, uint64_t))v115 + 2))(v115, MEMORY[0x1E4F1CBF0], 1);
  v33 = v111;
  v34 = v113;
LABEL_71:
}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) runningTitleSearch];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) runningTitleSearch];
    [v3 cancel];

    [*(id *)(a1 + 32) setRunningTitleSearch:0];
  }
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__22;
  v33[4] = __Block_byref_object_dispose__22;
  id v34 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_14;
  v17[3] = &unk_1E5B99810;
  v26 = v33;
  id v18 = *(id *)(a1 + 40);
  char v27 = *(unsigned char *)(a1 + 104);
  id v19 = *(id *)(a1 + 48);
  char v28 = *(unsigned char *)(a1 + 105);
  id v20 = *(id *)(a1 + 56);
  char v29 = *(unsigned char *)(a1 + 106);
  id v21 = *(id *)(a1 + 64);
  char v30 = *(unsigned char *)(a1 + 107);
  id v22 = *(id *)(a1 + 72);
  char v31 = *(unsigned char *)(a1 + 108);
  id v4 = *(id *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 32);
  id v23 = v4;
  uint64_t v24 = v5;
  char v32 = *(unsigned char *)(a1 + 109);
  id v25 = *(id *)(a1 + 96);
  uint64_t v6 = MEMORY[0x1A6266730](v17);
  objc_super v7 = (void *)v6;
  if (*(unsigned char *)(a1 + 110))
  {
    v8 = [*(id *)(a1 + 56) eventStore];
    uint64_t v9 = *(unsigned __int8 *)(a1 + 111);
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 88);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2_22;
    v14[3] = &unk_1E5B99838;
    id v15 = v7;
    id v16 = v33;
    v14[4] = *(void *)(a1 + 32);
    id v13 = +[EKAutocompleteSearch searchWithEventStore:v8 searchString:v10 maximumResultCount:0 ignoreScheduledEvents:v9 initialEvent:v11 pasteboardItemProvider:v12 completionHandler:v14];
    [*(id *)(a1 + 32) setRunningTitleSearch:v13];
  }
  else
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }

  _Block_object_dispose(v33, 8);
}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_14(uint64_t a1)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  v65 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), "count"));
  v60 = objc_opt_new();
  *((void *)&v59 + 1) = [*(id *)(a1 + 32) objectForKeyedSubscript:@"EKEventTimeDetectorResultStartDateKey"];
  *(void *)&long long v59 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"EKEventTimeDetectorResultEndDateKey"];
  v58 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"EKEventTimeDetectorResultTimeZoneKey"];
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"EKEventTimeDetectorResultAllDayKey"];
  unsigned int v57 = [v2 BOOLValue];

  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"EKEventTimeDetectorResultTimeIsApproximateKey"];
  int v4 = [v3 BOOLValue];

  int v5 = *(unsigned __int8 *)(a1 + 104);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  obuint64_t j = *(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  uint64_t v6 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = v4 ^ 1;
    if (!v5) {
      int v8 = 1;
    }
    uint64_t v9 = *(void *)v82;
    if (v58) {
      int v10 = v8;
    }
    else {
      int v10 = 0;
    }
    int v64 = v10;
    if (*((void *)&v59 + 1)) {
      int v11 = v8;
    }
    else {
      int v11 = 0;
    }
    int v63 = v11;
    if ((void)v59) {
      int v12 = v8;
    }
    else {
      int v12 = 0;
    }
    char v13 = v8 ^ 1;
    if (v59 == 0) {
      char v13 = 1;
    }
    char v61 = v13;
    int v62 = v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v82 != v9) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(id *)(*((void *)&v81 + 1) + 8 * i);
        id v16 = v15;
        if ([v15 source] == 4)
        {
          id v17 = [v15 pasteboardResults];
          id v16 = [v17 firstObject];
        }
        uint64_t v18 = [v16 source];
        if (v18 != 2)
        {
          if (v64) {
            [v16 setTimeZone:v58];
          }
          if ((v61 & 1) == 0) {
            [v16 setAllDay:v57];
          }
          id v19 = [v16 endDate];
          id v20 = [v16 startDate];
          [v19 timeIntervalSinceDate:v20];
          double v22 = v21;

          if (v63)
          {
            [v16 setStartDate:*((void *)&v59 + 1)];
          }
          else
          {
            uint64_t v23 = *(void *)(a1 + 40);
            if (v23)
            {
              uint64_t v24 = (void *)MEMORY[0x1E4F1C9C8];
              id v25 = [v16 startDate];
              v26 = [v24 dateWithDatePartFromDate:v23 timePartFromDate:v25 inCalendar:0];
              [v16 setStartDate:v26];
            }
            else
            {
              char v27 = [v16 startDate];
              char v28 = [v27 nextDateMatchingTimeComponents];
              [v16 setStartDate:v28];
            }
          }
          if (v62)
          {
            [v16 setEndDate:(void)v59];
          }
          else
          {
            char v29 = [v16 startDate];
            char v30 = [v29 dateByAddingTimeInterval:v22];
            [v16 setEndDate:v30];
          }
        }
        char v31 = [v15 isReminder];
        if (*(unsigned char *)(a1 + 105) || (v31 & 1) == 0)
        {
          if (v18 == 2)
          {
            [v16 setCalendar:*(void *)(a1 + 48)];
          }
          else
          {
            if (*(unsigned char *)(a1 + 106)) {
              char v32 = 1;
            }
            else {
              char v32 = v31;
            }
            if ((v32 & 1) == 0) {
              [v16 setCalendar:*(void *)(a1 + 48)];
            }
            v33 = [v16 calendar];
            objc_msgSend(v16, "setCalendarColor:", objc_msgSend(v33, "CGColor"));
          }
          [v65 addObject:v15];
          id v34 = [v16 title];
          int v35 = [v34 hasPrefixCaseAndDiacriticInsensitive:*(void *)(a1 + 56)];

          if (v35) {
            [v60 addObject:v15];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
    }
    while (v7);
  }

  unsigned int v36 = objc_opt_new();
  if (*(unsigned char *)(a1 + 107) && (unint64_t)[v65 count] >= 4)
  {
    char v37 = (void *)MEMORY[0x1E4F1CA48];
    unsigned int v38 = [v60 array];
    unsigned int v39 = objc_msgSend(v38, "subarrayWithRange:", 0, (unint64_t)fmin((double)(unint64_t)objc_msgSend(v60, "count"), 3.0));
    id v40 = [v37 arrayWithArray:v39];

LABEL_54:
    goto LABEL_55;
  }
  id v41 = (void *)MEMORY[0x1E4F1CA48];
  id v42 = [v60 array];
  id v43 = objc_msgSend(v42, "subarrayWithRange:", 0, (unint64_t)fmin((double)(unint64_t)objc_msgSend(v60, "count"), 7.0));
  id v40 = [v41 arrayWithArray:v43];

  unint64_t v44 = [v65 count];
  if (v44 > [v60 count] && (unint64_t)objc_msgSend(v40, "count") <= 6)
  {
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2;
    v78[3] = &unk_1E5B997C0;
    id v40 = v40;
    id v79 = v40;
    id v80 = v60;
    [v65 enumerateObjectsUsingBlock:v78];

    unsigned int v38 = v79;
    goto LABEL_54;
  }
LABEL_55:
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v45 = v40;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v75;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v75 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = *(void *)(*((void *)&v74 + 1) + 8 * j);
        uint64_t v51 = *(void *)(a1 + 64);
        if (!v51
          || [*(id *)(*((void *)&v74 + 1) + 8 * j) isDifferentEnoughFromInitialEvent:v51 consideringTimeProperties:*(unsigned __int8 *)(a1 + 108)])
        {
          [v36 addObject:v50];
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v47);
  }

  v52 = +[EKLogSubsystem autocomplete];
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
    __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_14_cold_1(v36, a1, v52);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_19;
  block[3] = &unk_1E5B997E8;
  id v53 = *(id *)(a1 + 72);
  uint64_t v54 = *(void *)(a1 + 80);
  v55 = *(void **)(a1 + 88);
  id v68 = v53;
  uint64_t v69 = v54;
  char v72 = *(unsigned char *)(a1 + 109);
  char v73 = *(unsigned char *)(a1 + 105);
  id v70 = v36;
  id v71 = v55;
  id v56 = v36;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  unint64_t v6 = [*(id *)(a1 + 32) count];
  if (v6 > 6)
  {
    *a4 = 1;
  }
  else
  {
    unint64_t v6 = [*(id *)(a1 + 40) containsObject:v9];
    id v7 = v9;
    if (v6) {
      goto LABEL_6;
    }
    unint64_t v6 = [*(id *)(a1 + 32) addObject:v9];
  }
  id v7 = v9;
LABEL_6:

  return MEMORY[0x1F41817F8](v6, v7);
}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_19(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) lastQueryString];
  LODWORD(v2) = [v2 isEqualToString:v3];

  if (v2)
  {
    id v12 = [MEMORY[0x1E4F1CA48] array];
    int v4 = [*(id *)(a1 + 40) lastDefaultResult];
    if (v4)
    {
      int v5 = *(unsigned __int8 *)(a1 + 64);

      if (v5)
      {
        unint64_t v6 = [*(id *)(a1 + 40) lastDefaultResult];
        [v12 addObject:v6];
      }
    }
    id v7 = [*(id *)(a1 + 40) lastDefaultReminderResult];
    if (v7)
    {
      int v8 = *(unsigned __int8 *)(a1 + 65);

      if (v8)
      {
        id v9 = [*(id *)(a1 + 40) lastDefaultReminderResult];
        [v12 addObject:v9];
      }
    }
    [v12 addObjectsFromArray:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setLastResults:v12];
    [*(id *)(a1 + 40) setFinishedCompletionHandlerCalled:1];
    uint64_t v10 = *(void *)(a1 + 56);
    int v11 = [*(id *)(a1 + 40) lastResults];
    (*(void (**)(uint64_t, void *, uint64_t))(v10 + 16))(v10, v11, 1);
  }
}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2_22(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    int v8 = [*(id *)(a1 + 32) queryQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_23;
    v11[3] = &unk_1E5B96B08;
    id v9 = *(id *)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v9;
    dispatch_async(v8, v11);
  }
  else
  {
    uint64_t v10 = +[EKLogSubsystem autocomplete];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2_22_cold_1((uint64_t)v7, v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_23(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 setRunningTitleSearch:0];
}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2_30(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) lastQueryString];
  LODWORD(v2) = [v2 isEqualToString:v3];

  if (v2 && ([*(id *)(a1 + 40) finishedCompletionHandlerCalled] & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [*(id *)(a1 + 40) lastResults];
    (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, v5, 0);
  }
}

+ (void)adjustTimeForUIAndApplyToAutocompleteResults:(id)a3 usingCurrentStartDate:(id)a4 currentEndDate:(id)a5 timeImplicitlySet:(BOOL)a6 calendar:(id)a7
{
  BOOL v8 = a6;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = [v11 firstObject];
  id v16 = v15;
  if (!v8 && [v15 source] == 1 && !objc_msgSend(v16, "approximateTime")) {
    goto LABEL_22;
  }
  int v35 = v16;
  id v17 = [MEMORY[0x1E4F1C9C8] date];
  id v37 = v13;
  if (!v8)
  {
LABEL_7:
    char v18 = 0;
    goto LABEL_8;
  }
  char v18 = 1;
  id v19 = [v14 dateByAddingUnit:16 value:1 toDate:v17 options:0];
  char v20 = [v12 isAfterOrSameDayAsDate:v19 inCalendar:0];

  if ((v20 & 1) == 0)
  {
    double v21 = [v17 laterDate:v13];

    if (v21 == v17)
    {
      uint64_t v33 = [MEMORY[0x1E4F1C9C8] dateWithDatePartFromDate:v17 timePartFromDate:v12 inCalendar:0];

      char v18 = 0;
      id v12 = (id)v33;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_8:
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __139__EKEventSuggestionGenerator_adjustTimeForUIAndApplyToAutocompleteResults_usingCurrentStartDate_currentEndDate_timeImplicitlySet_calendar___block_invoke;
  v43[3] = &unk_1E5B99888;
  BOOL v47 = v8;
  char v48 = v18;
  id v12 = v12;
  id v44 = v12;
  id v34 = v17;
  id v45 = v34;
  id v36 = v14;
  id v46 = v14;
  double v22 = (void (**)(void, void))MEMORY[0x1A6266730](v43);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v38 = v11;
  id v23 = v11;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v23);
        }
        char v28 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ([v28 source] != 2 && objc_msgSend(v28, "source") != 1)
        {
          if ([v28 source] == 4)
          {
            char v29 = [v28 pasteboardResults];
            uint64_t v30 = [v29 count];

            if (v30 == 1)
            {
              char v31 = [v28 pasteboardResults];
              char v32 = [v31 firstObject];
              ((void (**)(void, void *))v22)[2](v22, v32);
            }
          }
          else
          {
            ((void (**)(void, void *))v22)[2](v22, v28);
          }
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v25);
  }

  id v13 = v37;
  id v11 = v38;
  id v16 = v35;
  id v14 = v36;
LABEL_22:
}

void __139__EKEventSuggestionGenerator_adjustTimeForUIAndApplyToAutocompleteResults_usingCurrentStartDate_currentEndDate_timeImplicitlySet_calendar___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  v3 = [v18 endDate];
  uint64_t v4 = [v18 startDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  if (*(unsigned char *)(a1 + 56))
  {
    if (!*(unsigned char *)(a1 + 57))
    {
      id v7 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [v18 startDate];
      uint64_t v10 = [v7 dateWithDatePartFromDate:v8 timePartFromDate:v9 inCalendar:0];

      if (([v18 allDay] & 1) == 0)
      {
        id v11 = [*(id *)(a1 + 40) laterDate:v10];
        id v12 = *(void **)(a1 + 40);

        if (v11 == v12)
        {
          uint64_t v13 = [v10 dateByAddingDays:1 inCalendar:*(void *)(a1 + 48)];

          uint64_t v10 = (void *)v13;
        }
      }
      id v14 = [v10 dateByAddingTimeInterval:v6];
      [v18 setStartDate:v10];
      goto LABEL_10;
    }
LABEL_9:
    id v15 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = [v18 startDate];
    uint64_t v10 = [v15 dateWithDatePartFromDate:v16 timePartFromDate:v17 inCalendar:0];

    [v18 setStartDate:v10];
    id v14 = [v10 dateByAddingTimeInterval:v6];
LABEL_10:
    [v18 setEndDate:v14];

    goto LABEL_11;
  }
  if (*(unsigned char *)(a1 + 57) || [v18 allDay]) {
    goto LABEL_9;
  }
  [v18 setStartDate:*(void *)(a1 + 32)];
  uint64_t v10 = [*(id *)(a1 + 32) dateByAddingTimeInterval:v6];
  [v18 setEndDate:v10];
LABEL_11:
}

- (EKAutocompletePendingSearchProtocol)runningTitleSearch
{
  return (EKAutocompletePendingSearchProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRunningTitleSearch:(id)a3
{
}

- (OS_dispatch_queue)queryQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueryQueue:(id)a3
{
}

- (NSArray)lastResults
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastResults:(id)a3
{
}

- (NSString)lastQueryString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastQueryString:(id)a3
{
}

- (EKAutocompleteSearchResult)lastDefaultResult
{
  return (EKAutocompleteSearchResult *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastDefaultResult:(id)a3
{
}

- (BOOL)finishedCompletionHandlerCalled
{
  return self->_finishedCompletionHandlerCalled;
}

- (void)setFinishedCompletionHandlerCalled:(BOOL)a3
{
  self->_finishedCompletionHandlerCalled = a3;
}

- (EKAutocompleteSearchResult)lastDefaultReminderResult
{
  return (EKAutocompleteSearchResult *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastDefaultReminderResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDefaultReminderResult, 0);
  objc_storeStrong((id *)&self->_lastDefaultResult, 0);
  objc_storeStrong((id *)&self->_lastQueryString, 0);
  objc_storeStrong((id *)&self->_lastResults, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);

  objc_storeStrong((id *)&self->_runningTitleSearch, 0);
}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_14_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = [a1 count];
  uint64_t v6 = *(void *)(a2 + 72);
  v7[0] = 67109378;
  v7[1] = v5;
  __int16 v8 = 2112;
  uint64_t v9 = v6;
  _os_log_debug_impl(&dword_1A4E47000, a3, OS_LOG_TYPE_DEBUG, "Finished with %d suggestions for query \"%@\"", (uint8_t *)v7, 0x12u);
}

void __190__EKEventSuggestionGenerator__generateEventSuggestionsAsynchronouslyFromString_defaultSuggestionVisibility_options_defaultCalendar_referenceDate_initialEvent_pasteboardItemProvider_handler___block_invoke_2_22_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "EventSuggestionGenerator Error when searching with EKAutocompleteSearch: %@", (uint8_t *)&v2, 0xCu);
}

@end