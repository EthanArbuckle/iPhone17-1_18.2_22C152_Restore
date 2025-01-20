@interface DDEventComponents
+ (BOOL)supportsSecureCoding;
+ (id)_eventComponents:(id)a3 matchingResult:(__DDResult *)a4 context:(id)a5;
+ (id)_eventComponents:(id)a3 withSuggestedTitleFromNaturalLanguageContext:(id)a4 context:(id)a5;
+ (id)_eventsFromIntelligentSuggestions:(id)a3;
+ (id)_eventsFromNaturalLanguageText:(id)a3 context:(id)a4;
+ (id)_messageWithNaturalLanguageContext:(id)a3 context:(id)a4;
+ (id)bestEventComponentsForResult:(__DDResult *)a3 withNaturalLanguageContext:(id)a4 suggestionsContext:(id)a5 context:(id)a6;
- (DDEventComponents)initWithCoder:(id)a3;
- (EKStructuredLocation)structuredLocation;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)eventTypeIdentifier;
- (NSString)location;
- (NSString)notes;
- (NSString)title;
- (NSURL)URL;
- (_NSRange)originRange;
- (double)duration;
- (int64_t)source;
- (unint64_t)eventAttributes;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEndDate:(id)a3;
- (void)setEventAttributes:(unint64_t)a3;
- (void)setEventTypeIdentifier:(id)a3;
- (void)setLocation:(id)a3;
- (void)setNotes:(id)a3;
- (void)setOriginRange:(_NSRange)a3;
- (void)setSource:(int64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setStructuredLocation:(id)a3;
- (void)setTitle:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation DDEventComponents

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)bestEventComponentsForResult:(__DDResult *)a3 withNaturalLanguageContext:(id)a4 suggestionsContext:(id)a5 context:(id)a6
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v11 bundleIdentifier];
  v14 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  char v15 = [v14 containsObject:v13];

  if (v15)
  {
    v16 = 0;
    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[DDEventComponents bestEventComponentsForResult:withNaturalLanguageContext:suggestionsContext:context:].cold.4((uint64_t)a3, (uint64_t)v10, (uint64_t)v11);
    if (v12) {
      goto LABEL_5;
    }
LABEL_7:
    v17 = objc_opt_new();
    goto LABEL_8;
  }
  if (!v12) {
    goto LABEL_7;
  }
LABEL_5:
  v17 = (void *)[v12 mutableCopy];
LABEL_8:
  v18 = v17;
  objc_msgSend(v17, "objectForKey:", @"ReferenceDate", 0);
  [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  if (DDResultCopyExtractedDateFromReferenceDate() && v37)
  {
    [v18 setObject:v37 forKey:@"_ActionResultTimeZone"];
  }
  uint64_t Range = DDResultGetRange();
  v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", Range, v20);
  [v18 setObject:v21 forKey:@"_ActionResultRange"];

  if (v11)
  {
    v22 = [a1 _eventsFromIntelligentSuggestions:v11];
    v23 = [a1 _eventComponents:v22 matchingResult:a3 context:v18];
  }
  else
  {
    v23 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[DDEventComponents bestEventComponentsForResult:withNaturalLanguageContext:suggestionsContext:context:](v23);
  }
  if ([v23 count] != 1)
  {
    v24 = [a1 _eventsFromNaturalLanguageText:v10 context:v18];
    uint64_t v35 = [a1 _eventComponents:v24 matchingResult:a3 context:v18];
    goto LABEL_23;
  }
  if (_os_feature_enabled_impl())
  {
    v24 = [v23 objectAtIndexedSubscript:0];
    v25 = [v24 eventTypeIdentifier];

    if (!v25) {
      goto LABEL_24;
    }
    BOOL v26 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (v26) {
      +[DDEventComponents bestEventComponentsForResult:withNaturalLanguageContext:suggestionsContext:context:](v26, v27, v28, v29, v30, v31, v32, v33);
    }
    uint64_t v34 = [a1 _eventComponents:v24 withSuggestedTitleFromNaturalLanguageContext:v10 context:v18];
    v38[0] = v34;
    uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];

    v23 = (void *)v34;
LABEL_23:

    v23 = (void *)v35;
LABEL_24:
  }
  v16 = [v23 firstObject];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[DDEventComponents bestEventComponentsForResult:withNaturalLanguageContext:suggestionsContext:context:]();
  }

LABEL_28:
  return v16;
}

- (DDEventComponents)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DDEventComponents;
  v5 = [(DDEventComponents *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventTypeIdentifier"];
    eventTypeIdentifier = v5->_eventTypeIdentifier;
    v5->_eventTypeIdentifier = (NSString *)v8;

    v5->_source = [v4 decodeIntegerForKey:@"source"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originRange"];
    v5->_originRange.location = [v14 rangeValue];
    v5->_originRange.length = v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_eventTypeIdentifier forKey:@"eventTypeIdentifier"];
  [v5 encodeInteger:self->_source forKey:@"source"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_originRange.location, self->_originRange.length);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"originRange"];
}

+ (id)_eventComponents:(id)a3 matchingResult:(__DDResult *)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (a4)
  {
    uint64_t Range = DDResultGetRange();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __61__DDEventComponents__eventComponents_matchingResult_context___block_invoke;
    v23[3] = &__block_descriptor_48_e30_B24__0__DDEventComponents_8_16l;
    v23[4] = Range;
    v23[5] = v10;
    id v11 = [MEMORY[0x1E4F28F60] predicateWithBlock:v23];
    a4 = [v7 filteredArrayUsingPredicate:v11];

    id v12 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v13 = (void *)[v12 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    v14 = [v8 objectForKey:@"_ActionResultDate"];

    if (v14)
    {
      NSUInteger v15 = [v8 objectForKey:@"_ActionResultDate"];
      v14 = [v13 components:28 fromDate:v15];
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__DDEventComponents__eventComponents_matchingResult_context___block_invoke_2;
    v19[3] = &unk_1E5A85778;
    int v22 = 28;
    id v20 = v13;
    id v21 = v14;
    id v16 = v14;
    id v17 = v13;
    [(__DDResult *)a4 enumerateObjectsUsingBlock:v19];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      +[DDEventComponents _eventComponents:matchingResult:context:](v7, a4);
    }
  }
  return a4;
}

BOOL __61__DDEventComponents__eventComponents_matchingResult_context___block_invoke(NSRange *a1, void *a2)
{
  NSUInteger v3 = [a2 originRange];
  NSUInteger v5 = v4;
  v10.location = v3;
  v10.length = v4;
  NSRange v6 = NSUnionRange(a1[2], v10);
  return v3 == v6.location && v5 == v6.length || v3 == 0x7FFFFFFFFFFFFFFFLL;
}

void __61__DDEventComponents__eventComponents_matchingResult_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  NSUInteger v3 = [v12 startDate];

  NSUInteger v4 = v12;
  if (v3)
  {
    NSUInteger v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(unsigned int *)(a1 + 48);
    id v7 = [v12 startDate];
    id v8 = [v5 components:v6 fromDate:v7];

    uint64_t v9 = [v8 day];
    if (v9 != [*(id *)(a1 + 40) day]
      || (uint64_t v10 = [v8 month], v10 != objc_msgSend(*(id *)(a1 + 40), "month"))
      || (uint64_t v11 = [v8 year], v11 != objc_msgSend(*(id *)(a1 + 40), "year")))
    {
      [v12 setStartDate:0];
      [v12 setEndDate:0];
    }

    NSUInteger v4 = v12;
  }
}

+ (id)_eventsFromNaturalLanguageText:(id)a3 context:(id)a4
{
  v147[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [v7 objectForKeyedSubscript:@"EventTitle"];
  [v6 result];
  uint64_t v10 = DDResultGetMatchedString();
  uint64_t v11 = [a1 _messageWithNaturalLanguageContext:v6 context:v7];
  id v12 = [v11 messageUnits];
  id v13 = [v12 firstObject];

  v141 = v13;
  if (v13)
  {
    v136 = v11;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      +[DDEventComponents _eventsFromNaturalLanguageText:context:]2(v6, v10);
    }
    v137 = v10;
    unsigned __int8 v144 = 0;
    v14 = [v6 associatedResults];
    id v143 = 0;
    v140 = beginDateOfEventResultsRespectingSpecificEndDates(v14, 1, v7, &v144, &v143);
    id v139 = v143;

    [v6 result];
    int IsApprox = DDResultTimeIsApprox();
    id v16 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v138 = (void *)[v16 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    uint64_t v17 = [v7 objectForKey:@"_ActionResultDate"];
    uint64_t v18 = [v7 objectForKey:@"_ActionResultTimeZone"];
    v19 = objc_alloc_init(DDEventComponents);
    [(DDEventComponents *)v19 setSource:2];
    double Helper_x8__OBJC_CLASS___IPEventClassificationType = gotLoadHelper_x8__OBJC_CLASS___IPEventClassificationType(v20);
    v23 = objc_msgSend(*(id *)(v22 + 528), "eventClassificationTypeFromMessageUnit:detectedStartDate:", v141, v17, Helper_x8__OBJC_CLASS___IPEventClassificationType);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      +[DDEventComponents _eventsFromNaturalLanguageText:context:]1();
      if (v23) {
        goto LABEL_6;
      }
    }
    else if (v23)
    {
LABEL_6:
      BOOL v24 = [v23 defaultStartingTimeHour] != -1;
      goto LABEL_10;
    }
    if ((_os_feature_enabled_impl() & 1) == 0) {
      goto LABEL_64;
    }
    BOOL v24 = 0;
LABEL_10:
    [v23 defaultDuration];
    double v26 = v25;
    int v27 = v144 | IsApprox;
    BOOL v28 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (!v27)
    {
      v44 = v140;
      if (v28)
      {
        +[DDEventComponents _eventsFromNaturalLanguageText:context:]0(v28, v29, v30, v31, v32, v33, v34, v35);
        v44 = v140;
      }
      id v45 = v44;
      v46 = v45;
      if (v139)
      {
        id v134 = v139;
        BOOL v47 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
        if (v47) {
          +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.9(v47, v48, v49, v50, v51, v52, v53, v54);
        }
      }
      else if (v26 <= 0.0)
      {
        id v134 = [v45 dateByAddingTimeInterval:3600.0];
        BOOL v63 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
        if (v63) {
          +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.8(v63, v64, v65, v66, v67, v68, v69, v70);
        }
      }
      else
      {
        [v23 defaultDuration];
        objc_msgSend(v46, "dateByAddingTimeInterval:");
        id v134 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v55 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
        if (v55) {
          +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.7(v55, v56, v57, v58, v59, v60, v61, v62);
        }
      }
      goto LABEL_44;
    }
    if (v28) {
      +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.6(v28, v29, v30, v31, v32, v33, v34, v35);
    }
    BOOL v36 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (!v24)
    {
      if (v36) {
        +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.5(v36, v37, v38, v39, v40, v41, v42, v43);
      }
      id v134 = 0;
      v46 = 0;
      goto LABEL_44;
    }
    if (v36)
    {
      +[DDEventComponents _eventsFromNaturalLanguageText:context:].cold.4(v36, v37, v38, v39, v40, v41, v42, v43);
      if (v18) {
        goto LABEL_16;
      }
    }
    else if (v18)
    {
LABEL_16:
      [v138 setTimeZone:v18];
LABEL_32:
      if (v140)
      {
        v72 = v138;
        v73 = objc_msgSend(v138, "components:fromDate:", 62);
      }
      else
      {
        v74 = [MEMORY[0x1E4F1C9C8] date];
        v72 = v138;
        v73 = [v138 components:62 fromDate:v74];
      }
      objc_msgSend(v73, "setHour:", (int)objc_msgSend(v23, "defaultStartingTimeHour"));
      int v75 = [v23 defaultStartingTimeMinutes];
      [v73 setMinute:v75 & ~(v75 >> 31)];
      v76 = [v72 dateFromComponents:v73];
      v77 = v76;
      if (v26 <= 0.0 || v139)
      {
        if (v139)
        {
          id v86 = v139;
        }
        else
        {
          id v86 = [v76 dateByAddingTimeInterval:3600.0];
        }
        id v134 = v86;
      }
      else
      {
        [v23 defaultDuration];
        objc_msgSend(v77, "dateByAddingTimeInterval:");
        id v134 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v78 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
        if (v78) {
          +[DDEventComponents _eventsFromNaturalLanguageText:context:](v78, v79, v80, v81, v82, v83, v84, v85);
        }
      }

      v46 = v77;
LABEL_44:
      v87 = [MEMORY[0x1E4F1CA48] arrayWithObject:@"com.apple.MobileSMS"];
      if (_os_feature_enabled_impl()) {
        [v87 addObject:@"com.apple.mobilemail"];
      }
      v135 = v87;
      if (_os_feature_enabled_impl())
      {
        v88 = [v6 bundleIdentifier];
        uint64_t v89 = [v87 containsObject:v88];
      }
      else
      {
        uint64_t v89 = 0;
      }
      char v142 = 0;
      v147[0] = v141;
      v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v147 count:1];
      v91 = [v23 adjustedEventTitleForMessageUnits:v90 subject:v9 dateInSubject:0 eventStartDate:0 useTitleGenerationModel:v89 isGeneratedFromSubject:0 isGeneratedFromTitleGenerationModel:&v142];
      if (v91)
      {
        [(DDEventComponents *)v19 setTitle:v91];
      }
      else
      {
        [v23 defaultTitle];
        v133 = v23;
        id v92 = v7;
        id v93 = v6;
        v94 = v46;
        v95 = v9;
        v97 = id v96 = v8;
        [(DDEventComponents *)v19 setTitle:v97];

        id v8 = v96;
        uint64_t v9 = v95;
        v46 = v94;
        id v6 = v93;
        id v7 = v92;
        v23 = v133;
      }

      if (v142)
      {
        v98 = [(DDEventComponents *)v19 title];

        if (v98) {
          [(DDEventComponents *)v19 setSource:4];
        }
      }
      if (v23) {
        int v99 = 0;
      }
      else {
        int v99 = v89;
      }
      if (v99 == 1)
      {
        BOOL v100 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
        if (v100) {
          +[DDEventComponents _eventsFromNaturalLanguageText:context:](v100, v101, v102, v103, v104, v105, v106, v107);
        }
        double v109 = gotLoadHelper_x8__OBJC_CLASS___IPEventClassificationType(v108);
        v111 = *(void **)(v110 + 528);
        v146 = v141;
        v112 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v146, 1, v109);
        v113 = [v111 titleGenerationModelPredictionForMessageUnits:v112];
        [(DDEventComponents *)v19 setTitle:v113];

        v114 = [(DDEventComponents *)v19 title];

        if (v114) {
          [(DDEventComponents *)v19 setSource:4];
        }
      }
      v115 = [v23 identifier];
      [(DDEventComponents *)v19 setEventTypeIdentifier:v115];

      [(DDEventComponents *)v19 setStartDate:v46];
      [(DDEventComponents *)v19 setEndDate:v134];
      [v23 defaultDuration];
      -[DDEventComponents setDuration:](v19, "setDuration:");
      -[DDEventComponents setOriginRange:](v19, "setOriginRange:", 0x7FFFFFFFFFFFFFFFLL, 0);

LABEL_64:
      v116 = [(DDEventComponents *)v19 title];
      if ([v116 length])
      {
        uint64_t v10 = v137;
        v117 = v138;
      }
      else
      {
        uint64_t v118 = [v9 length];

        uint64_t v10 = v137;
        v117 = v138;
        if (!v118)
        {
LABEL_71:
          [v8 addObject:v19];
          id v13 = v8;

          uint64_t v11 = v136;
          goto LABEL_72;
        }
        BOOL v119 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
        if (v119) {
          +[DDEventComponents _eventsFromNaturalLanguageText:context:](v119, v120, v121, v122, v123, v124, v125, v126);
        }
        double v128 = gotLoadHelper_x8__OBJC_CLASS___IPEventClassificationType(v127);
        v130 = *(void **)(v129 + 528);
        v145 = v141;
        v131 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v145, 1, v128);
        v116 = [v130 fallbackEventTitleForMessageUnits:v131 subject:v9 checkForDateInSubject:1];

        [(DDEventComponents *)v19 setTitle:v116];
        -[DDEventComponents setOriginRange:](v19, "setOriginRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
      }

      goto LABEL_71;
    }
    v71 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    [v138 setTimeZone:v71];

    goto LABEL_32;
  }
LABEL_72:

  return v13;
}

+ (id)_eventsFromIntelligentSuggestions:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[DDEventComponents _eventsFromIntelligentSuggestions:](v3);
  }
  NSUInteger v4 = [v3 coreSpotlightUniqueIdentifier];

  if (v4)
  {
    gotLoadHelper_x8__OBJC_CLASS___CSSearchableItemAttributeSet(v5);
    id v7 = objc_alloc(*(Class *)(v6 + 2128));
    id v8 = [(id)*MEMORY[0x1E4F44440] identifier];
    uint64_t v9 = (void *)[v7 initWithItemContentType:v8];

    gotLoadHelper_x8__OBJC_CLASS___CSSearchableItem(v10);
    id v12 = objc_alloc(*(Class *)(v11 + 2112));
    id v13 = [v3 coreSpotlightUniqueIdentifier];
    v14 = (void *)[v12 initWithUniqueIdentifier:v13 domainIdentifier:0 attributeSet:v9];

    double Helper_x8__OBJC_CLASS___SGSuggestionsService = gotLoadHelper_x8__OBJC_CLASS___SGSuggestionsService(v15);
    uint64_t v18 = objc_msgSend(*(id *)(v17 + 2928), "serviceForMessages", Helper_x8__OBJC_CLASS___SGSuggestionsService);
    v19 = (uint64_t *)MEMORY[0x1E4F1CBF0];
    if (v18)
    {
      double v20 = &v39;
      uint64_t v39 = 0;
      uint64_t v40 = &v39;
      uint64_t v41 = 0x3032000000;
      uint64_t v42 = __Block_byref_object_copy__0;
      uint64_t v43 = __Block_byref_object_dispose__0;
      id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
      uint64_t v22 = [v3 bundleIdentifier];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __55__DDEventComponents__eventsFromIntelligentSuggestions___block_invoke;
      v35[3] = &unk_1E5A857A0;
      id v36 = v3;
      uint64_t v38 = &v39;
      v23 = v21;
      uint64_t v37 = v23;
      [v18 harvestedSuggestionsFromMessage:v14 bundleIdentifier:v22 options:2 completionHandler:v35];

      BOOL v24 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v24) {
        +[DDEventComponents _eventsFromIntelligentSuggestions:](v24, v25, v26, v27, v28, v29, v30, v31);
      }
      dispatch_time_t v32 = dispatch_time(0, 5000000000);
      intptr_t v33 = dispatch_semaphore_wait(v23, v32);
      if (v33)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
          +[DDEventComponents _eventsFromIntelligentSuggestions:]();
        }
      }
      else
      {
        double v20 = (uint64_t *)(id)v40[5];
      }

      _Block_object_dispose(&v39, 8);
      if (!v33) {
        v19 = v20;
      }
    }
  }
  else
  {
    v19 = (uint64_t *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

void __55__DDEventComponents__eventsFromIntelligentSuggestions___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    __55__DDEventComponents__eventsFromIntelligentSuggestions___block_invoke_cold_2(v9);
    if (v7)
    {
LABEL_3:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __55__DDEventComponents__eventsFromIntelligentSuggestions___block_invoke_cold_1(a1);
      }
      goto LABEL_32;
    }
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  id v46 = v8;
  id v47 = v7;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v45 = v9;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        double v15 = objc_alloc_init(DDEventComponents);
        [(DDEventComponents *)v15 setSource:1];
        id v16 = [v14 event];
        uint64_t v17 = [v16 title];
        [(DDEventComponents *)v15 setTitle:v17];

        uint64_t v18 = [v16 URL];
        [(DDEventComponents *)v15 setURL:v18];

        v19 = [v16 notes];
        [(DDEventComponents *)v15 setNotes:v19];

        double v20 = [v16 locations];
        dispatch_semaphore_t v21 = [v20 firstObject];

        uint64_t v22 = [v21 label];
        if (v22)
        {
          [(DDEventComponents *)v15 setLocation:v22];
        }
        else
        {
          v23 = [v21 address];
          [(DDEventComponents *)v15 setLocation:v23];
        }
        if (([v21 isGeocoded] & 1) != 0
          || ([v21 handle], BOOL v24 = objc_claimAutoreleasedReturnValue(), v24, v24))
        {
          uint64_t v25 = (void *)MEMORY[0x1E4F25630];
          uint64_t v26 = [v21 label];
          uint64_t v27 = v26;
          if (!v26)
          {
            NSUInteger v4 = [v21 address];
            uint64_t v27 = v4;
          }
          uint64_t v28 = [v25 locationWithTitle:v27];
          if (!v26) {

          }
          uint64_t v29 = [v21 address];

          if (v29)
          {
            uint64_t v30 = [v21 address];
            [v28 setAddress:v30];
          }
          if ([v21 isGeocoded])
          {
            gotLoadHelper_x8__OBJC_CLASS___CLLocation(v31);
            id v33 = objc_alloc(*(Class *)(v32 + 1520));
            [v21 latitude];
            double v35 = v34;
            [v21 longitude];
            uint64_t v37 = (void *)[v33 initWithLatitude:v35 longitude:v36];
            [v28 setGeoLocation:v37];
          }
          uint64_t v38 = [v21 handle];

          if (v38)
          {
            uint64_t v39 = [v21 handle];
            [v28 setMapKitHandle:v39];
          }
          [(DDEventComponents *)v15 setStructuredLocation:v28];
        }
        uint64_t v40 = [v16 naturalLanguageEventTypeIdentifier];
        [(DDEventComponents *)v15 setEventTypeIdentifier:v40];

        -[DDEventComponents setEventAttributes:](v15, "setEventAttributes:", [v16 naturalLanguageEventAttributes]);
        -[DDEventComponents setOriginRange:](v15, "setOriginRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
        if (([v16 isAllDay] & 1) == 0)
        {
          uint64_t v41 = [v14 event];
          uint64_t v42 = [v41 start];
          [(DDEventComponents *)v15 setStartDate:v42];

          uint64_t v43 = [v14 event];
          id v44 = [v43 end];
          [(DDEventComponents *)v15 setEndDate:v44];
        }
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v15];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v11);
  }

  id v8 = v46;
  id v7 = v47;
  id v9 = v45;
LABEL_32:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)_eventComponents:(id)a3 withSuggestedTitleFromNaturalLanguageContext:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 eventAttributes] & 0x1000) != 0)
  {
    BOOL v19 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (v19) {
      +[DDEventComponents _eventComponents:withSuggestedTitleFromNaturalLanguageContext:context:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  else
  {
    uint64_t v11 = [a1 _messageWithNaturalLanguageContext:v9 context:v10];
    double Helper_x8__OBJC_CLASS___IPEventClassificationType = gotLoadHelper_x8__OBJC_CLASS___IPEventClassificationType(v12);
    double v15 = *(void **)(v14 + 528);
    uint64_t v17 = objc_msgSend(v16, "messageUnits", Helper_x8__OBJC_CLASS___IPEventClassificationType);
    uint64_t v18 = [v15 titleGenerationModelPredictionForMessageUnits:v17];

    if (v18)
    {
      [v8 setTitle:v18];
      [v8 setSource:3];
    }
  }
  return v8;
}

+ (id)_messageWithNaturalLanguageContext:(id)a3 context:(id)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v5 result];
  id v7 = DDResultGetMatchedString();
  id v8 = [v6 objectForKeyedSubscript:@"GroupTranscript"];
  if (![v8 length])
  {
    id v9 = [v5 leadingText];

    if (v9)
    {
      id v8 = [v9 stringByAppendingString:v7];
    }
    else
    {
      id v8 = v7;
    }
    id v10 = [v5 trailingText];
    if (v10)
    {
      uint64_t v11 = [v5 trailingText];
      uint64_t v12 = [v8 stringByAppendingString:v11];

      id v8 = (id)v12;
    }
  }
  if ([v8 length])
  {
    id v13 = [v6 objectForKey:@"EventTitle"];
    uint64_t v14 = [v6 objectForKey:@"ReferenceDate"];
    double v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [MEMORY[0x1E4F1C9C8] date];
    }
    uint64_t v18 = v16;

    if (_os_feature_enabled_impl())
    {
      uint64_t v20 = [v6 objectForKey:@"CoreSpotlightUniqueIdentifier"];
      if (_os_feature_enabled_impl())
      {
        uint64_t v22 = [v5 bundleIdentifier];
        int v23 = [v22 isEqualToString:@"com.apple.mobilemail"];

        double Helper_x8__IPMessageTypeEmail = gotLoadHelper_x8__IPMessageTypeEmail(v24);
        gotLoadHelper_x9__IPMessageTypeShortMessage(Helper_x8__IPMessageTypeEmail);
        uint64_t v28 = *(id **)(v27 + 520);
        if (!v23) {
          uint64_t v26 = v28;
        }
        id v29 = *v26;
      }
      else
      {
        id v29 = 0;
      }
      gotLoadHelper_x8__OBJC_CLASS___IPMessage(v21);
      id v33 = objc_alloc(*(Class *)(v32 + 552));
      if (v13) {
        double v34 = v13;
      }
      else {
        double v34 = &stru_1EF5023D8;
      }
      uint64_t v17 = (void *)[v33 initWithIdentifier:v20 subject:v34 sender:0 recipients:MEMORY[0x1E4F1CBF0] dateSent:v18 type:v29];
    }
    else
    {
      gotLoadHelper_x8__OBJC_CLASS___IPMessage(v19);
      uint64_t v17 = (void *)[objc_alloc(*(Class *)(v30 + 552)) initWithDateSent:v18 subject:v13];
    }
    gotLoadHelper_x8__OBJC_CLASS___IPMessageUnit(v31);
    double v36 = (void *)[objc_alloc(*(Class *)(v35 + 560)) initWithText:v8 originalMessage:v17 index:0];
    uint64_t v37 = [v6 objectForKey:@"_ActionResultRange"];
    uint64_t v38 = v37;
    if (v37 && [v37 rangeValue] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v39 = [v38 rangeValue];
      objc_msgSend(v36, "setInteractedDateRange:", v39, v40);
    }
    if (v36)
    {
      v43[0] = v36;
      uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
      [v17 setMessageUnits:v41];
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)eventTypeIdentifier
{
  return self->_eventTypeIdentifier;
}

- (void)setEventTypeIdentifier:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (_NSRange)originRange
{
  NSUInteger length = self->_originRange.length;
  NSUInteger location = self->_originRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setOriginRange:(_NSRange)a3
{
  self->_originuint64_t Range = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (unint64_t)eventAttributes
{
  return self->_eventAttributes;
}

- (void)setEventAttributes:(unint64_t)a3
{
  self->_eventAttributes = a3;
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (EKStructuredLocation)structuredLocation
{
  return self->_structuredLocation;
}

- (void)setStructuredLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_structuredLocation, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (void)bestEventComponentsForResult:withNaturalLanguageContext:suggestionsContext:context:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "Suggested event components are coming from '%@'", v1, v2, v3, v4, v5);
}

+ (void)bestEventComponentsForResult:(uint64_t)a3 withNaturalLanguageContext:(uint64_t)a4 suggestionsContext:(uint64_t)a5 context:(uint64_t)a6 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)bestEventComponentsForResult:(void *)a1 withNaturalLanguageContext:suggestionsContext:context:.cold.3(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1A1709000, MEMORY[0x1E4F14500], v1, "Number of events returned from Suggestions: %ld", v2, v3, v4, v5, v6);
}

+ (void)bestEventComponentsForResult:(uint64_t)a3 withNaturalLanguageContext:suggestionsContext:context:.cold.4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 138412802;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  __int16 v7 = 2112;
  uint64_t v8 = a3;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Attempting to determine best event components for DDResult '%@' using NL context '%@' and Suggestions context '%@'", (uint8_t *)&v3, 0x20u);
}

+ (void)_eventComponents:(void *)a1 matchingResult:(void *)a2 context:.cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = [a1 count];
  __int16 v5 = 2048;
  uint64_t v6 = [a2 count];
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Number of event components before and after filtering: %ld --> %ld", (uint8_t *)&v3, 0x16u);
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_eventsFromNaturalLanguageText:(uint64_t)a3 context:(uint64_t)a4 .cold.10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_eventsFromNaturalLanguageText:context:.cold.11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "Results for event type based on natural language context: event type '%@'", v1, v2, v3, v4, v5);
}

+ (void)_eventsFromNaturalLanguageText:(void *)a1 context:(void *)a2 .cold.12(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 leadingText];
  uint64_t v5 = [v4 length];
  uint64_t v6 = [a2 length];
  uint64_t v7 = [a1 trailingText];
  int v8 = 134218496;
  uint64_t v9 = v5;
  __int16 v10 = 2048;
  uint64_t v11 = v6;
  __int16 v12 = 2048;
  uint64_t v13 = [v7 length];
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Determining event components based on natural language context using text of lengths (leading, result, trailing): (%ld, %ld, %ld)", (uint8_t *)&v8, 0x20u);
}

+ (void)_eventsFromIntelligentSuggestions:.cold.1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "The completion block while waiting for results from Suggestions has not been called, and a time-out occured.", v0, 2u);
}

+ (void)_eventsFromIntelligentSuggestions:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1709000, MEMORY[0x1E4F14500], a3, "Waiting for Suggestions to return results...", a5, a6, a7, a8, 0);
}

+ (void)_eventsFromIntelligentSuggestions:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 coreSpotlightUniqueIdentifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1A1709000, MEMORY[0x1E4F14500], v2, "Determining events from Suggestions using CoreSpotlight unique identifier '%@'", v3, v4, v5, v6, v7);
}

void __55__DDEventComponents__eventsFromIntelligentSuggestions___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) coreSpotlightUniqueIdentifier];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Retrieving events from Suggestions for identifier '%@' failed with error: %@", v2, 0x16u);
}

void __55__DDEventComponents__eventsFromIntelligentSuggestions___block_invoke_cold_2(void *a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Results for reading from Suggestions events: %ld found events, error: '%@'", v1, 0x16u);
}

+ (void)_eventComponents:(uint64_t)a3 withSuggestedTitleFromNaturalLanguageContext:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end