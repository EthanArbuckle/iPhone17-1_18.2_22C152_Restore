@interface IPDataDetectorsFeatureExtractor
- (BOOL)stringContainsNonTimeStrings:(id)a3 aroundRange:(_NSRange)a4;
- (IPDataDetectorsFeatureExtractor)init;
- (_NSRange)textRangeReferencingAfternoon:(id)a3;
- (_NSRange)textRangeReferencingAllDay:(id)a3;
- (_NSRange)textRangeReferencingEvening:(id)a3;
- (_NSRange)textRangeReferencingMorning:(id)a3;
- (_NSRange)textRangeReferencingNewYearsEve:(id)a3;
- (_NSRange)textRangeReferencingNextWeekEnd:(id)a3;
- (_NSRange)textRangeReferencingNoon:(id)a3;
- (_NSRange)textRangeReferencingThisWeekEnd:(id)a3;
- (_NSRange)textRangeReferencingTomorrow:(id)a3;
- (_NSRange)textRangeReferencingValentineDay:(id)a3;
- (__DDScanner)standardScanner;
- (__DDScanner)timeScanner;
- (id)featureDataComplementingFeatureData:(id)a3 hour:(unint64_t)a4 minute:(unint64_t)a5 duration:(double)a6;
- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 context:(id)a5;
- (id)newYearsEveDayDateFromReferenceDate:(id)a3;
- (id)queue;
- (id)stringByReplacingDetectedDataWithNGramMarkersInString:(id)a3;
- (id)thisSaturdayDateFromReferenceDate:(id)a3;
- (id)tomorrowDateFromReferenceDate:(id)a3;
- (id)valentineDayDateFromReferenceDate:(id)a3;
- (void)setTimeZone:(id)a3 forDateFeatures:(id)a4;
- (void)standardizeTimezonesForDetectedFeatures:(id)a3;
@end

@implementation IPDataDetectorsFeatureExtractor

- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 context:(id)a5
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v83 = a4;
  id v87 = a5;
  uint64_t v8 = [MEMORY[0x263EFF980] arrayWithCapacity:30];
  v9 = [v83 originalMessage];
  v10 = [v9 dateSent];

  v115[0] = 0;
  v115[1] = v115;
  v115[2] = 0x3032000000;
  v115[3] = __Block_byref_object_copy__1;
  v115[4] = __Block_byref_object_dispose__1;
  id v116 = [MEMORY[0x263EFF980] array];
  uint64_t v111 = 0;
  v112 = &v111;
  uint64_t v113 = 0x2020000000;
  char v114 = 0;
  v11 = [v87 objectForKey:@"IPFeatureExtractorDetectedDateInSubjectFeatureData"];
  v12 = [v11 value];
  v82 = v11;
  v13 = [v11 contextDictionary];
  v14 = objc_msgSend(v13, "objectForKeyedSubscript:");
  char v15 = [v14 BOOLValue];

  v16 = [v82 contextDictionary];
  v17 = [v16 objectForKeyedSubscript:@"timeIsApproximate"];
  char v18 = [v17 BOOLValue];

  NSUInteger v19 = [v7 length];
  v20 = [v87 objectForKey:@"IPFeatureExtractorContextText"];
  v92 = (void *)[v7 copy];
  v85 = v20;
  if (v20)
  {
    NSUInteger v19 = [v7 length];
    uint64_t v21 = [v20 stringByAppendingString:v7];

    v22 = (void *)v8;
    v20 = (void *)([v20 length] + 1);
    id v7 = (id)v21;
  }
  else
  {
    v22 = (void *)v8;
  }
  v23 = sStandardScannerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__IPDataDetectorsFeatureExtractor_featuresForTextString_inMessageUnit_context___block_invoke;
  block[3] = &unk_264722F98;
  id v108 = v7;
  block[4] = self;
  v106 = v115;
  id v86 = v7;
  id v102 = v86;
  id v24 = v22;
  id v103 = v24;
  id v80 = v12;
  id v104 = v80;
  char v109 = v15;
  char v110 = v18;
  id v89 = v10;
  id v105 = v89;
  v107 = &v111;
  dispatch_sync(v23, block);
  v25 = (void *)MEMORY[0x22A632550]();
  v84 = [v86 lowercaseString];
  if (!*((unsigned char *)v112 + 24))
  {
    if (v89)
    {
      uint64_t v27 = -[IPDataDetectorsFeatureExtractor textRangeReferencingTomorrow:](self, "textRangeReferencingTomorrow:", v84, v80);
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v28 = v26;
        v29 = [(IPDataDetectorsFeatureExtractor *)self tomorrowDateFromReferenceDate:v89];
        v30 = +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 1, v29, v27, v28);
        v31 = [v30 contextDictionary];
        [v31 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"allDay"];

        v32 = [v30 contextDictionary];
        [v32 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"dateTimeIsTenseDependent"];

        v33 = [v30 contextDictionary];
        [v33 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"IPFeatureDataContextDateTimeFromIpsosOverlay"];

        [v30 setTextUnit:v86];
        [v24 addObject:v30];
      }
    }
  }
  if (!*((unsigned char *)v112 + 24))
  {
    if (v89)
    {
      uint64_t v35 = [(IPDataDetectorsFeatureExtractor *)self textRangeReferencingValentineDay:v84];
      if (v35 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v36 = v34;
        v37 = [(IPDataDetectorsFeatureExtractor *)self valentineDayDateFromReferenceDate:v89];
        v38 = +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 1, v37, v35, v36);
        v39 = [v38 contextDictionary];
        [v39 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"allDay"];

        v40 = [v37 dateByAddingTimeInterval:10800.0];
        v41 = [v38 contextDictionary];
        [v41 setObject:v40 forKeyedSubscript:@"endDate"];

        v42 = [v38 contextDictionary];
        [v42 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"dateTimeIsTenseDependent"];

        v43 = [v38 contextDictionary];
        [v43 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"IPFeatureDataContextDateTimeFromIpsosOverlay"];

        [v38 setTextUnit:v86];
        [v24 addObject:v38];
      }
    }
  }
  if (!*((unsigned char *)v112 + 24) && v89)
  {
    if (IPGregorianCalendar_once_0 != -1) {
      dispatch_once(&IPGregorianCalendar_once_0, &__block_literal_global_189);
    }
    id v44 = (id)IPGregorianCalendar_calendar_0;
    v45 = [v44 components:8 fromDate:v89];
    if ([v45 month] == 12)
    {
      uint64_t v47 = [(IPDataDetectorsFeatureExtractor *)self textRangeReferencingNewYearsEve:v84];
      if (v47 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v48 = v46;
        id v49 = [(IPDataDetectorsFeatureExtractor *)self newYearsEveDayDateFromReferenceDate:v89];
        v50 = +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 1, v49, v47, v48);
        v51 = [v50 contextDictionary];
        [v51 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"allDay"];

        v52 = [v49 dateByAddingTimeInterval:21600.0];
        v53 = [v50 contextDictionary];
        [v53 setObject:v52 forKeyedSubscript:@"endDate"];

        v54 = [v50 contextDictionary];
        [v54 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"dateTimeIsTenseDependent"];

        v55 = [v50 contextDictionary];
        [v55 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"IPFeatureDataContextDateTimeFromIpsosOverlay"];

        [v50 setTextUnit:v86];
        [v24 addObject:v50];
      }
    }
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  obuint64_t j = v24;
  uint64_t v56 = [obj countByEnumeratingWithState:&v97 objects:v118 count:16];
  if (!v56)
  {
LABEL_42:
    v65 = 0;
    v66 = obj;
LABEL_43:

    goto LABEL_44;
  }
  id v57 = 0;
  uint64_t v58 = *(void *)v98;
  while (2)
  {
    for (uint64_t i = 0; i != v56; ++i)
    {
      if (*(void *)v98 != v58) {
        objc_enumerationMutation(obj);
      }
      v60 = *(void **)(*((void *)&v97 + 1) + 8 * i);
      if (!objc_msgSend(v60, "type", v80) || objc_msgSend(v60, "type") == 1)
      {
        v61 = [v60 contextDictionary];
        v62 = [v61 objectForKeyedSubscript:@"allDay"];
        char v63 = [v62 BOOLValue];

        if (v57) {
          char v64 = 0;
        }
        else {
          char v64 = v63;
        }
        if ((v64 & 1) == 0)
        {

          goto LABEL_42;
        }
        id v57 = v60;
      }
    }
    uint64_t v56 = [obj countByEnumeratingWithState:&v97 objects:v118 count:16];
    if (v56) {
      continue;
    }
    break;
  }

  v65 = v57;
  if (v57)
  {
    if ([(IPDataDetectorsFeatureExtractor *)self textRangeReferencingMorning:v84] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(IPDataDetectorsFeatureExtractor *)self textRangeReferencingNoon:v84] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([(IPDataDetectorsFeatureExtractor *)self textRangeReferencingAfternoon:v84] == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ([(IPDataDetectorsFeatureExtractor *)self textRangeReferencingEvening:v84] == 0x7FFFFFFFFFFFFFFFLL)
          {
            if ([(IPDataDetectorsFeatureExtractor *)self textRangeReferencingAllDay:v84] == 0x7FFFFFFFFFFFFFFFLL)goto LABEL_44; {
            v66 = [(IPDataDetectorsFeatureExtractor *)self featureDataComplementingFeatureData:v57 hour:8 minute:0 duration:43200.0];
            }
            v67 = [v66 contextDictionary];
            [v67 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"allDay"];

            v68 = [v66 contextDictionary];
            [v68 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"prefersAllDay"];

            [v66 setTextUnit:v86];
            v65 = v57;
            [obj addObject:v66];
            [obj removeObject:v57];
          }
          else
          {
            v66 = [(IPDataDetectorsFeatureExtractor *)self featureDataComplementingFeatureData:v57 hour:19 minute:0 duration:7200.0];
            [v66 setTextUnit:v86];
            [obj addObject:v66];
            [obj removeObject:v57];
          }
        }
        else
        {
          v66 = [(IPDataDetectorsFeatureExtractor *)self featureDataComplementingFeatureData:v57 hour:15 minute:0 duration:7200.0];
          [v66 setTextUnit:v86];
          [obj addObject:v66];
          [obj removeObject:v57];
        }
      }
      else
      {
        v66 = [(IPDataDetectorsFeatureExtractor *)self featureDataComplementingFeatureData:v57 hour:12 minute:0 duration:3600.0];
        [v66 setTextUnit:v86];
        [obj addObject:v66];
        [obj removeObject:v57];
      }
    }
    else
    {
      v66 = [(IPDataDetectorsFeatureExtractor *)self featureDataComplementingFeatureData:v57 hour:9 minute:0 duration:7200.0];
      [v66 setTextUnit:v86];
      [obj addObject:v66];
      [obj removeObject:v57];
    }
    goto LABEL_43;
  }
LABEL_44:
  -[IPDataDetectorsFeatureExtractor standardizeTimezonesForDetectedFeatures:](self, "standardizeTimezonesForDetectedFeatures:", obj, v80);
  if (v85)
  {
    v91 = v65;
    uint64_t v69 = [v85 length];
    v70 = objc_opt_new();
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v71 = obj;
    uint64_t v72 = [v71 countByEnumeratingWithState:&v93 objects:v117 count:16];
    if (v72)
    {
      uint64_t v73 = *(void *)v94;
      do
      {
        for (uint64_t j = 0; j != v72; ++j)
        {
          if (*(void *)v94 != v73) {
            objc_enumerationMutation(v71);
          }
          v75 = *(void **)(*((void *)&v93 + 1) + 8 * j);
          v121.location = [v75 matchRange];
          v122.location = (NSUInteger)v20;
          v122.length = v19;
          if (NSIntersectionRange(v121, v122).length)
          {
            uint64_t v76 = [v75 matchRange];
            [v75 matchRange];
            objc_msgSend(v75, "setMatchRange:", v76 - v69, v77);
            [v75 setTextUnit:v92];
            [v70 addObject:v75];
          }
        }
        uint64_t v72 = [v71 countByEnumeratingWithState:&v93 objects:v117 count:16];
      }
      while (v72);
    }

    obuint64_t j = (id)[v70 copy];
    v65 = v91;
  }
  id v78 = obj;

  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(v115, 8);

  return v78;
}

- (IPDataDetectorsFeatureExtractor)init
{
  v4.receiver = self;
  v4.super_class = (Class)IPDataDetectorsFeatureExtractor;
  v2 = [(IPDataDetectorsFeatureExtractor *)&v4 init];
  if (init_onceToken != -1) {
    dispatch_once(&init_onceToken, &__block_literal_global_3);
  }
  return v2;
}

void __39__IPDataDetectorsFeatureExtractor_init__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.Ipsos.IPDataDetectorsFeatureExtractor", v2);
  v1 = (void *)sStandardScannerQueue;
  sStandardScannerQueue = (uint64_t)v0;
}

- (__DDScanner)standardScanner
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (sScanner)
  {
    uint64_t v2 = sLastPreferredLanguage;
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    objc_super v4 = [v3 arrayForKey:@"AppleLanguages"];
    v5 = [v4 firstObject];
    LOBYTE(v2) = [(id)v2 isEqualToString:v5];

    result = (__DDScanner *)sScanner;
    if (v2)
    {
      if (sScanner) {
        return result;
      }
    }
    else
    {
      CFRelease((CFTypeRef)sScanner);
      sScanner = 0;
    }
  }
  sScanner = DDScannerCreate();
  if (sScanner)
  {
    DDScannerEnableOptionalSource();
    id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v8 = [v7 arrayForKey:@"AppleLanguages"];
    uint64_t v9 = [v8 firstObject];
    v10 = (void *)sLastPreferredLanguage;
    sLastPreferredLanguage = v9;
  }
  else
  {
    v11 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v11 = _IPLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = 0;
      _os_log_impl(&dword_225684000, v11, OS_LOG_TYPE_ERROR, "standardScanner creation failed: %@ #Generic", buf, 0xCu);
    }
    CFRelease(0);
  }
  return (__DDScanner *)sScanner;
}

- (__DDScanner)timeScanner
{
  return 0;
}

- (BOOL)stringContainsNonTimeStrings:(id)a3 aroundRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  id v7 = +[IPRegexToolbox regularExpressionWithKey:@"stringContainsNonTimeStrings:aroundRange:" generator:&__block_literal_global_9];
  if (location <= 1) {
    NSUInteger v8 = length;
  }
  else {
    NSUInteger v8 = length + 2;
  }
  if (location <= 1) {
    NSUInteger v9 = location;
  }
  else {
    NSUInteger v9 = location - 2;
  }
  unint64_t v10 = [v6 length] - (v9 + v8);
  if (v10 >= 2) {
    unint64_t v10 = 2;
  }
  uint64_t v11 = objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v6, 2, v9, v10 + v8);

  return v11 != 0x7FFFFFFFFFFFFFFFLL;
}

id __76__IPDataDetectorsFeatureExtractor_stringContainsNonTimeStrings_aroundRange___block_invoke()
{
  uint64_t v2 = 0;
  dispatch_queue_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"([£%$€#]| (sera))" options:65 error:&v2];
  return v0;
}

void __79__IPDataDetectorsFeatureExtractor_featuresForTextString_inMessageUnit_context___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v205 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) standardScanner];
  uint64_t v2 = [*(id *)(v1 + 32) timeScanner];
  if (DDScannerScanString())
  {
    v3 = *(void **)(*(void *)(*(void *)(v1 + 72) + 8) + 40);
    objc_super v4 = (void *)DDScannerCopyResultsWithOptions();
    [v3 addObjectsFromArray:v4];
  }
  if ([*(id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40) count]) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 && DDScannerScanString())
  {
    id v6 = (void *)DDScannerCopyResultsWithOptions();
    id v7 = [MEMORY[0x263EFF980] array];
    long long v197 = 0u;
    long long v198 = 0u;
    long long v199 = 0u;
    long long v200 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v197 objects:v204 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v198;
      CFStringRef v12 = (const __CFString *)*MEMORY[0x263F39470];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v198 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v197 + 1) + 8 * i);
          CFStringRef Type = (const __CFString *)DDResultGetType();
          if (CFEqual(Type, v12))
          {
            uint64_t Range = DDResultGetRange();
            if ((objc_msgSend(*(id *)(v1 + 32), "stringContainsNonTimeStrings:aroundRange:", *(void *)(v1 + 40), Range, v17) & 1) == 0)objc_msgSend(v7, "addObject:", v14); {
          }
            }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v197 objects:v204 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      [v7 addObjectsFromArray:*(void *)(*(void *)(*(void *)(v1 + 72) + 8) + 40)];
      v206.NSUInteger length = CFArrayGetCount((CFArrayRef)v7);
      v206.NSUInteger location = 0;
      CFArraySortValues((CFMutableArrayRef)v7, v206, (CFComparatorFunction)IPDDResultRangeCompare, 0);
      if (CFArrayGetCount((CFArrayRef)v7) >= 2)
      {
        CFIndex v18 = 0;
        do
        {
          CFArrayGetValueAtIndex((CFArrayRef)v7, v18);
          uint64_t v19 = DDResultGetRange();
          uint64_t v21 = v20;
          CFIndex v22 = v18 + 1;
          CFArrayGetValueAtIndex((CFArrayRef)v7, v18 + 1);
          uint64_t v23 = DDResultGetRange();
          if (v23 < v19 + v21)
          {
            if (v24 >= v21 && v19 == v23) {
              CFIndex v26 = v18;
            }
            else {
              CFIndex v26 = v18 + 1;
            }
            CFArrayRemoveValueAtIndex((CFMutableArrayRef)v7, v26);
            CFIndex v22 = v18;
          }
          CFIndex v18 = v22;
        }
        while (v22 < CFArrayGetCount((CFArrayRef)v7) - 1);
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), v7);
    }
  }
  v180 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), "count"));
  uint64_t v27 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(*(id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), "count"));
  long long v193 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  long long v194 = 0u;
  id v28 = *(id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40);
  uint64_t v183 = [v28 countByEnumeratingWithState:&v193 objects:v203 count:16];
  uint64_t v185 = v1;
  v176 = v27;
  if (v183)
  {
    uint64_t v181 = *(void *)v194;
    id v170 = v28;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v194 != v181) {
          objc_enumerationMutation(v28);
        }
        uint64_t v30 = *(void *)(*((void *)&v193 + 1) + 8 * v29);
        int Category = DDResultGetCategory();
        uint64_t v32 = DDResultGetRange();
        uint64_t v186 = v33;
        uint64_t v34 = objc_msgSend(NSString, "stringWithFormat:", @"%ld %ld", v32, v33);
        if (([v27 containsObject:v34] & 1) == 0)
        {
          [v27 addObject:v34];
          switch(Category)
          {
            case 0:
              if (DDResultHasType()) {
                goto LABEL_40;
              }
              break;
            case 1:
              uint64_t v35 = (void *)DDResultCopyExtractedURLWithOptions();
              if (!v35)
              {
                v54 = 0;
LABEL_77:

                goto LABEL_78;
              }
              uint64_t v36 = [NSURL URLWithString:v35];
              if (!v36)
              {
                v54 = 0;
LABEL_76:

                goto LABEL_77;
              }
              v37 = v36;
              v38 = [v36 scheme];
              v172 = [v38 lowercaseString];

              id v168 = v37;
              v39 = [v37 resourceSpecifier];
              if ([v39 hasPrefix:@"//"])
              {
                uint64_t v40 = [v39 substringFromIndex:2];
                v41 = v39;
                v39 = (void *)v40;
              }
              v174 = v39;
              uint64_t v42 = [v39 length];
              v43 = v172;
              if (v42 && [(__CFString *)v172 length])
              {
                if ([(__CFString *)v172 isEqualToString:@"mailto"])
                {
                  v165 = v35;
                  id v44 = [v174 componentsSeparatedByString:@"?"];
                  v45 = [v44 firstObject];
                  uint64_t v46 = [v45 componentsSeparatedByString:@","];

                  long long v191 = 0u;
                  long long v192 = 0u;
                  long long v189 = 0u;
                  long long v190 = 0u;
                  id v47 = v46;
                  uint64_t v48 = [v47 countByEnumeratingWithState:&v189 objects:v202 count:16];
                  if (v48)
                  {
                    uint64_t v49 = v48;
                    uint64_t v50 = *(void *)v190;
                    do
                    {
                      for (uint64_t j = 0; j != v49; ++j)
                      {
                        if (*(void *)v190 != v50) {
                          objc_enumerationMutation(v47);
                        }
                        v52 = *(void **)(*((void *)&v189 + 1) + 8 * j);
                        if ([v52 containsString:@"@"])
                        {
                          v53 = +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 5, v52, v32, v186);
                          [v53 setTextUnit:*(void *)(v185 + 40)];
                          [*(id *)(v185 + 48) addObject:v53];
                        }
                      }
                      uint64_t v49 = [v47 countByEnumeratingWithState:&v189 objects:v202 count:16];
                    }
                    while (v49);
                  }

                  v54 = 0;
                  uint64_t v1 = v185;
                  uint64_t v27 = v176;
                  id v28 = v170;
                  v43 = v172;
                  uint64_t v35 = v165;
                  goto LABEL_75;
                }
                if (([(__CFString *)v172 isEqualToString:@"tel"] & 1) != 0
                  || [(__CFString *)v172 isEqualToString:@"telprompt"])
                {
                  uint64_t v62 = 6;
                  char v63 = v174;
                }
                else
                {
                  if (([(__CFString *)v172 isEqualToString:@"facetime"] & 1) != 0
                    || [(__CFString *)v172 isEqualToString:@"facetime-audio"])
                  {
                    char v64 = [v174 componentsSeparatedByString:@"?"];
                    v65 = [v64 firstObject];

                    v43 = v172;
                    if ([v65 containsString:@"@"]) {
                      uint64_t v66 = 5;
                    }
                    else {
                      uint64_t v66 = 6;
                    }
                    v54 = +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", v66, v65, v32, v186);

                    uint64_t v27 = v176;
                    goto LABEL_75;
                  }
                  uint64_t v62 = 4;
                  char v63 = v37;
                }
                v54 = +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", v62, v63, v32, v186);
              }
              else
              {
                v54 = 0;
              }
LABEL_75:

              uint64_t v36 = v168;
              goto LABEL_76;
            case 2:
              DDResultCopyPhoneValue();
              v54 = 0;
              goto LABEL_78;
            case 3:
              if (DDResultGetSubresultWithType() && DDResultGetSubresultWithType()) {
                break;
              }
              v55 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
              DDResultCopyFullAddressComponents();
              uint64_t v56 = 3;
              goto LABEL_61;
            case 4:
LABEL_40:
              [v180 addObject:v30];
              break;
            case 5:
              if (DDResultHasType())
              {
                MatchedString = (const void *)DDResultGetMatchedString();
                uint64_t v58 = (void *)CFRetain(MatchedString);
                v54 = +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 11, v58, v32, v186);

                uint64_t v27 = v176;
              }
              else
              {
                unsigned int ParsecDomain = DDResultGetParsecDomain();
                if (ParsecDomain > 8 || ((0x19Bu >> ParsecDomain) & 1) == 0) {
                  break;
                }
                uint64_t v60 = qword_2256AF060[ParsecDomain];
                v61 = (const void *)DDResultGetMatchedString();
                v55 = (void *)CFRetain(v61);
                uint64_t v27 = v176;
                uint64_t v56 = v60;
LABEL_61:
                v54 = +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", v56, v55, v32, v186);

                id v28 = v170;
              }
LABEL_78:
              if (v54)
              {
                [v54 setTextUnit:*(void *)(v1 + 40)];
                [*(id *)(v1 + 48) addObject:v54];
              }
              break;
            default:
              break;
          }
        }

        ++v29;
      }
      while (v29 != v183);
      uint64_t v67 = [v28 countByEnumeratingWithState:&v193 objects:v203 count:16];
      uint64_t v183 = v67;
    }
    while (v67);
  }

  uint64_t v68 = [v180 count];
  uint64_t v154 = v68 - 1;
  if (v68 >= 1)
  {
    uint64_t v69 = v68;
    uint64_t v70 = 0;
    v159 = 0;
    uint64_t v171 = 0;
    CFStringRef theString2 = (const __CFString *)*MEMORY[0x263F39470];
    CFStringRef v163 = (const __CFString *)*MEMORY[0x263F39468];
    CFStringRef v179 = (const __CFString *)*MEMORY[0x263F39420];
    CFStringRef v162 = (const __CFString *)*MEMORY[0x263F39418];
    CFStringRef v173 = (const __CFString *)*MEMORY[0x263F39428];
    uint64_t v175 = -1;
    uint64_t v71 = -3;
    uint64_t v156 = v68;
    do
    {
      uint64_t v72 = [v180 objectAtIndexedSubscript:v70];

      CFStringRef v73 = (const __CFString *)DDResultGetType();
      HasCFStringRef Type = DDResultHasType();
      CFComparisonResult v75 = CFStringCompare(v73, theString2, 0);
      CFComparisonResult v76 = CFStringCompare(v73, v163, 0);
      CFComparisonResult v187 = CFStringCompare(v73, v179, 0);
      CFComparisonResult v178 = CFStringCompare(v73, v162, 0);
      unsigned int v182 = HasType;
      if (HasType)
      {
        BOOL v77 = 0;
        BOOL v184 = 1;
      }
      else
      {
        BOOL v184 = CFEqual(v73, v173);
        BOOL v77 = DDResultTimeIsApprox() != 0;
      }
      BOOL v167 = v77;
      BOOL v78 = (v187 == kCFCompareEqualTo || v184 && v77) && DDResultDateExtractionDependsOnContextTense() != 0;
      if (v75) {
        BOOL v79 = v76 == kCFCompareEqualTo;
      }
      else {
        BOOL v79 = 1;
      }
      int v80 = v79;
      unsigned int v169 = v80;
      uint64_t v177 = v71;
      BOOL v166 = v78;
      if (v79)
      {
        v81 = *(void **)(v1 + 56);
        if (v81)
        {
          id v82 = v81;
          int v83 = 0;
          goto LABEL_126;
        }
        uint64_t v84 = v70 + ~v71;
        if (v84 >= 2) {
          uint64_t v84 = 2;
        }
        uint64_t v85 = v84 + v70;
        if (v85 >= v154) {
          uint64_t v85 = v154;
        }
        if (v70 < v85)
        {
          uint64_t v86 = v175 - v71;
          if (v175 - v71 >= 2) {
            uint64_t v86 = 2;
          }
          uint64_t v87 = v86 + v70;
          if (v87 >= v154) {
            uint64_t v88 = v154;
          }
          else {
            uint64_t v88 = v87;
          }
          uint64_t v89 = v70;
          do
          {
            [v180 objectAtIndexedSubscript:++v89];

            CFStringRef v90 = (const __CFString *)DDResultGetType();
            if (CFEqual(v90, v173)
              || CFEqual(v90, v179))
            {
              DDResultCopyExtractedDateFromReferenceDate();
            }
          }
          while (v88 != v89);
        }
        uint64_t v27 = v176;
        uint64_t v69 = v156;
        uint64_t v177 = v71;
        uint64_t v171 = 0;
      }
      id v82 = *(id *)(v1 + 64);
      int v83 = 1;
LABEL_126:
      uint64_t v91 = DDResultGetRange();
      uint64_t v93 = v91;
      uint64_t v94 = v92;
      int v95 = v182;
      if (v187 == kCFCompareEqualTo) {
        int v95 = 1;
      }
      int v96 = v95 | v184;
      if (v75) {
        char v97 = 1;
      }
      else {
        char v97 = v83;
      }
      if (v96 != 1 && (v97 & 1) != 0)
      {
        if (v76 && v178)
        {
          uint64_t v71 = v177;
        }
        else
        {
          uint64_t v135 = v91;
          if (DDResultCopyExtractedStartDateEndDate())
          {
            if (DDResultDateExtractionDependsOnContextTense()) {
              BOOL v136 = 1;
            }
            else {
              BOOL v136 = v75 == kCFCompareEqualTo;
            }
            int v137 = v136;
            unsigned int v188 = v137;
            DDResultIsPartialDateRangeOrTimeRange();
            uint64_t v113 = +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 1, 0, v135, v94);

            uint64_t v138 = v169 & v83;
            v139 = [NSNumber numberWithUnsignedChar:0];
            v140 = [v113 contextDictionary];
            [v140 setObject:v139 forKeyedSubscript:@"allDay"];

            v141 = [NSNumber numberWithBool:v167];
            v142 = [v113 contextDictionary];
            [v142 setObject:v141 forKeyedSubscript:@"timeIsApproximate"];

            v143 = [NSNumber numberWithBool:v188];
            v144 = [v113 contextDictionary];
            [v144 setObject:v143 forKeyedSubscript:@"dateTimeIsTenseDependent"];

            v145 = [NSNumber numberWithBool:v138];
            v146 = [v113 contextDictionary];
            [v146 setObject:v145 forKeyedSubscript:@"dateIsTimeOnlyAndReferrengingToSentDate"];

            v147 = [NSNumber numberWithInt:v169];
            v148 = [v113 contextDictionary];
            [v148 setObject:v147 forKeyedSubscript:@"dateOnlyContainsTimeInformation"];

            v149 = [NSNumber numberWithBool:v178 == kCFCompareEqualTo];
            v150 = [v113 contextDictionary];
            [v150 setObject:v149 forKeyedSubscript:@"isDateRange"];

            v151 = [NSNumber numberWithBool:DDResultNeedsMeridianGuess() != 0];
            v152 = [v113 contextDictionary];
            [v152 setObject:v151 forKeyedSubscript:@"timeNeedsMeridianGuess"];

            *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
            uint64_t v27 = v176;
            uint64_t v71 = v177;
            uint64_t v69 = v156;
            if (!v113) {
              goto LABEL_189;
            }
            goto LABEL_188;
          }
          uint64_t v71 = v177;
        }
        goto LABEL_189;
      }
      uint64_t v160 = v91;
      uint64_t v161 = v92;
      if (!v159 || v75)
      {
        if (!v159)
        {
          id v102 = *(void **)(v1 + 56);
          if (v102 && v166) {
            id v82 = (id)objc_msgSend(v102, "dateByAddingTimeInterval:", v93, -86399.0);
          }
        }
LABEL_147:
        char v101 = 0;
        goto LABEL_148;
      }
      if ((DDResultHasType() & 1) == 0)
      {
        uint64_t v98 = v69;
        id v99 = v82;
        int IsApprox = DDResultTimeIsApprox();
        BOOL v5 = IsApprox == DDResultTimeIsApprox();
        id v82 = v99;
        uint64_t v69 = v98;
        if (v5) {
          goto LABEL_147;
        }
      }
      v201[0] = v72;
      v201[1] = v159;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v201 count:2];
      uint64_t v72 = (void *)DDResultCreateFromDateTimeResults();
      CFAutorelease(v72);
      char v101 = 1;
LABEL_148:
      if (DDResultCopyExtractedDateFromReferenceDate())
      {
        id v104 = 0;
        if (DDResultDateExtractionDependsOnContextTense()) {
          BOOL v105 = 1;
        }
        else {
          BOOL v105 = v75 == kCFCompareEqualTo;
        }
        int v106 = v105;
        unsigned int v157 = v106;
        v107 = *(void **)(v1 + 56);
        v158 = v104;
        if (!v107
          || ([v107 timeIntervalSinceDate:v104], fabs(v108) >= 43200.0)
          || *(unsigned char *)(v1 + 96)
          || *(unsigned char *)(v1 + 97))
        {
          id v109 = v104;
        }
        else
        {
          id v109 = v104;
          if (v167)
          {
            uint64_t v1 = v185;
            id v153 = *(id *)(v185 + 56);

            BOOL v167 = 0;
            id v109 = v153;
          }
          else
          {
            BOOL v167 = 0;
            uint64_t v1 = v185;
          }
        }
        uint64_t v110 = v169 & v83;
        CFTypeRef v155 = v82;
        if (v182)
        {
          [v109 timeIntervalSinceReferenceDate];
          uint64_t v112 = [v109 dateByAddingTimeInterval:-(v111 + -round(v111 / 600.0) * 600.0)];

          id v109 = (id)v112;
        }
        uint64_t v113 = +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 1, v109, v160, v161);
        char v114 = [NSNumber numberWithUnsignedChar:0];
        v115 = [v113 contextDictionary];
        [v115 setObject:v114 forKeyedSubscript:@"allDay"];

        id v116 = [NSNumber numberWithBool:v167];
        v117 = [v113 contextDictionary];
        [v117 setObject:v116 forKeyedSubscript:@"timeIsApproximate"];

        v118 = [NSNumber numberWithBool:v182];
        uint64_t v119 = [v113 contextDictionary];
        [v119 setObject:v118 forKeyedSubscript:@"isTimeOffset"];

        v120 = [NSNumber numberWithBool:v157];
        NSRange v121 = [v113 contextDictionary];
        [v121 setObject:v120 forKeyedSubscript:@"dateTimeIsTenseDependent"];

        NSRange v122 = [NSNumber numberWithBool:v110];
        v123 = [v113 contextDictionary];
        [v123 setObject:v122 forKeyedSubscript:@"dateIsTimeOnlyAndReferrengingToSentDate"];

        v124 = [NSNumber numberWithInt:v169 | v182];
        v125 = [v113 contextDictionary];
        [v125 setObject:v124 forKeyedSubscript:@"dateOnlyContainsTimeInformation"];

        v126 = [NSNumber numberWithBool:v178 == kCFCompareEqualTo];
        v127 = [v113 contextDictionary];
        [v127 setObject:v126 forKeyedSubscript:@"isDateRange"];

        v128 = [NSNumber numberWithBool:DDResultNeedsMeridianGuess() != 0];
        v129 = [v113 contextDictionary];
        [v129 setObject:v128 forKeyedSubscript:@"timeNeedsMeridianGuess"];

        int v130 = v184;
        if (v187 == kCFCompareEqualTo) {
          int v130 = 1;
        }
        uint64_t v131 = 0;
        BOOL v5 = v130 == 0;
        uint64_t v27 = v176;
        uint64_t v132 = v177;
        if (v5) {
          uint64_t v131 = v171;
        }
        else {
          uint64_t v132 = v70;
        }
        if (v178) {
          uint64_t v71 = v132;
        }
        else {
          uint64_t v71 = -3;
        }
        if (v178) {
          uint64_t v133 = v131;
        }
        else {
          uint64_t v133 = 0;
        }
        uint64_t v171 = v133;
        *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
        uint64_t v69 = v156;
        if ((v101 & 1) == 0)
        {
          if (v155)
          {
            CFTypeRef v134 = CFRetain(v155);
            CFAutorelease(v134);
          }
          v159 = v72;
        }

        if (!v113) {
          goto LABEL_189;
        }
LABEL_188:
        [v113 setTextUnit:*(void *)(v1 + 40)];
        [*(id *)(v1 + 48) addObject:v113];

        goto LABEL_189;
      }
      uint64_t v71 = v177;
LABEL_189:
      ++v70;
      ++v175;
    }
    while (v70 != v69);
  }
}

- (void)standardizeTimezonesForDetectedFeatures:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_super v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  obuint64_t j = v5;
  if (!v6)
  {
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v7 = v6;
  id v5 = 0;
  uint64_t v8 = *(void *)v21;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
      if (![v10 type] || objc_msgSend(v10, "type") == 1)
      {
        uint64_t v11 = [v10 contextDictionary];
        CFStringRef v12 = [v11 objectForKeyedSubscript:@"startDateTimeZone"];

        uint64_t v13 = [v10 contextDictionary];
        uint64_t v14 = [v13 objectForKeyedSubscript:@"endDateTimeZone"];

        if (v12)
        {
          id v15 = v12;
          goto LABEL_12;
        }
        if (v14)
        {
          id v15 = v14;
LABEL_12:
          id v16 = v15;

          [(IPDataDetectorsFeatureExtractor *)self setTimeZone:v16 forDateFeatures:v4];
          [v4 removeAllObjects];
          id v5 = v16;
        }
        else
        {
          [v4 addObject:v10];
        }
      }
      ++v9;
    }
    while (v7 != v9);
    uint64_t v17 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    uint64_t v7 = v17;
  }
  while (v17);

  if (v5)
  {
    [(IPDataDetectorsFeatureExtractor *)self setTimeZone:v5 forDateFeatures:v4];
    goto LABEL_20;
  }
LABEL_21:
}

- (void)setTimeZone:(id)a3 forDateFeatures:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFFA18] localTimeZone];
  uint64_t v8 = [v5 secondsFromGMT];
  uint64_t v29 = v7;
  uint64_t v9 = [v7 secondsFromGMT];
  uint64_t v32 = v5;
  uint64_t v10 = [v5 secondsFromGMT];
  uint64_t v11 = [MEMORY[0x263EFFA18] timeZoneWithName:@"GMT"];
  uint64_t v12 = [v11 secondsFromGMT];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v6;
  uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v31 = v10 - v12 + 82800;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        CFIndex v18 = [v17 contextDictionary];
        uint64_t v19 = [v18 objectForKeyedSubscript:@"allDay"];
        int v20 = [v19 BOOLValue];

        uint64_t v21 = v8 - v9;
        if (v20) {
          uint64_t v21 = v31;
        }
        double v22 = (double)v21;
        long long v23 = [v17 value];
        uint64_t v24 = [v23 dateByAddingTimeInterval:v22];
        [v17 setValue:v24];

        uint64_t v25 = [v17 contextDictionary];
        [v25 setObject:v32 forKeyedSubscript:@"startDateTimeZone"];

        CFIndex v26 = [v17 contextDictionary];
        uint64_t v27 = [v26 objectForKeyedSubscript:@"endDate"];

        if (v27)
        {
          id v28 = [v17 contextDictionary];
          [v28 setObject:0 forKeyedSubscript:@"endDate"];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v14);
  }
}

- (id)featureDataComplementingFeatureData:(id)a3 hour:(unint64_t)a4 minute:(unint64_t)a5 duration:(double)a6
{
  id v9 = a3;
  uint64_t v10 = [v9 value];
  if (IPGregorianCalendar_once_0 != -1) {
    dispatch_once(&IPGregorianCalendar_once_0, &__block_literal_global_189);
  }
  id v11 = (id)IPGregorianCalendar_calendar_0;
  uint64_t v12 = [v11 components:2097182 fromDate:v10];
  uint64_t v13 = objc_opt_new();
  objc_msgSend(v13, "setDay:", objc_msgSend(v12, "day"));
  objc_msgSend(v13, "setMonth:", objc_msgSend(v12, "month"));
  objc_msgSend(v13, "setYear:", objc_msgSend(v12, "year"));
  objc_msgSend(v13, "setEra:", objc_msgSend(v12, "era"));
  uint64_t v14 = [v12 timeZone];
  [v13 setTimeZone:v14];

  [v13 setHour:a4];
  [v13 setMinute:a5];
  uint64_t v15 = [v11 dateFromComponents:v13];

  uint64_t v16 = [v9 matchRange];
  CFIndex v18 = +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 1, v15, v16, v17);
  uint64_t v19 = [v18 contextDictionary];
  [v19 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"allDay"];

  int v20 = [v18 contextDictionary];
  uint64_t v21 = MEMORY[0x263EFFA88];
  [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"timeIsApproximate"];

  double v22 = [v18 contextDictionary];
  [v22 setObject:v21 forKeyedSubscript:@"dateTimeComplement"];

  long long v23 = [v9 contextDictionary];

  uint64_t v24 = [v23 objectForKeyedSubscript:@"dateTimeIsTenseDependent"];
  uint64_t v25 = [v18 contextDictionary];
  [v25 setObject:v24 forKeyedSubscript:@"dateTimeIsTenseDependent"];

  if (a6 > 0.0)
  {
    CFIndex v26 = [v15 dateByAddingTimeInterval:a6];
    uint64_t v27 = [v18 contextDictionary];
    [v27 setObject:v26 forKeyedSubscript:@"endDate"];
  }
  return v18;
}

- (id)stringByReplacingDetectedDataWithNGramMarkersInString:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(IPDataDetectorsFeatureExtractor *)self featuresForTextString:v4 inMessageUnit:0 context:0];
  id v6 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v13, "matchRange", (void)v20) >= v10 && v10 < objc_msgSend(v13, "matchRange"))
        {
          uint64_t v14 = objc_msgSend(v4, "substringWithRange:", v10, objc_msgSend(v13, "matchRange") - v10);
          [v6 appendString:v14];

          uint64_t v15 = [v13 nGramMarker];
          [v6 appendString:v15];

          uint64_t v16 = [v13 matchRange];
          unint64_t v10 = v16 + v17;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
  }

  CFIndex v18 = objc_msgSend(v4, "substringWithRange:", v10, objc_msgSend(v4, "length") - v10);
  [v6 appendString:v18];

  return v6;
}

- (id)thisSaturdayDateFromReferenceDate:(id)a3
{
  uint64_t v3 = IPGregorianCalendar_once_0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&IPGregorianCalendar_once_0, &__block_literal_global_189);
  }
  id v5 = (id)IPGregorianCalendar_calendar_0;
  id v6 = [v5 components:25088 fromDate:v4];

  [v6 setWeekday:7];
  id v7 = [v5 dateFromComponents:v6];

  return v7;
}

- (id)tomorrowDateFromReferenceDate:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setDay:1];
  id v5 = objc_alloc(MEMORY[0x263EFF8F0]);
  id v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  id v7 = [v6 dateByAddingComponents:v4 toDate:v3 options:0];

  uint64_t v8 = [v6 components:28 fromDate:v7];
  uint64_t v9 = [v6 dateFromComponents:v8];

  return v9;
}

- (id)valentineDayDateFromReferenceDate:(id)a3
{
  uint64_t v3 = IPGregorianCalendar_once_0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&IPGregorianCalendar_once_0, &__block_literal_global_189);
  }
  id v5 = (id)IPGregorianCalendar_calendar_0;
  id v6 = [v5 components:4 fromDate:v4];

  id v7 = objc_opt_new();
  [v7 setDay:14];
  [v7 setMonth:2];
  objc_msgSend(v7, "setYear:", objc_msgSend(v6, "year"));
  [v7 setHour:19];
  uint64_t v8 = [v5 dateFromComponents:v7];

  return v8;
}

- (id)newYearsEveDayDateFromReferenceDate:(id)a3
{
  uint64_t v3 = IPGregorianCalendar_once_0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&IPGregorianCalendar_once_0, &__block_literal_global_189);
  }
  id v5 = (id)IPGregorianCalendar_calendar_0;
  id v6 = [v5 components:4 fromDate:v4];

  id v7 = objc_opt_new();
  [v7 setDay:31];
  [v7 setMonth:12];
  objc_msgSend(v7, "setYear:", objc_msgSend(v6, "year"));
  [v7 setHour:20];
  uint64_t v8 = [v5 dateFromComponents:v7];

  return v8;
}

- (_NSRange)textRangeReferencingTomorrow:(id)a3
{
  id v3 = a3;
  id v4 = +[IPRegexToolbox regularExpressionWithKey:@"textRangeReferencingTomorrow" generator:&__block_literal_global_78];
  uint64_t v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

id __64__IPDataDetectorsFeatureExtractor_textRangeReferencingTomorrow___block_invoke()
{
  uint64_t v2 = 0;
  dispatch_queue_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(?:tomorrow|demain|(?<!la)mañana|domani|morgen)" options:65 error:&v2];
  return v0;
}

- (_NSRange)textRangeReferencingThisWeekEnd:(id)a3
{
  id v3 = a3;
  id v4 = +[IPRegexToolbox regularExpressionWithKey:@"textRangeReferencingThisWeekEnd" generator:&__block_literal_global_86];
  uint64_t v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

id __67__IPDataDetectorsFeatureExtractor_textRangeReferencingThisWeekEnd___block_invoke()
{
  uint64_t v2 = 0;
  dispatch_queue_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(?:(?:this|(?<!de)ce) week-?end|(?:este|pr[óo]ximo) (?:finde|week-?end|fin de semana)|(?:quest|prossim)o (?:week- ?end|weekend|fine settimana)|(?:diese[sm]|kommende[sn]) w(?:eek-?end|ochenende))" options:65 error:&v2];
  return v0;
}

- (_NSRange)textRangeReferencingNextWeekEnd:(id)a3
{
  id v3 = a3;
  id v4 = +[IPRegexToolbox regularExpressionWithKey:@"textRangeReferencingNextWeekEnd" generator:&__block_literal_global_94];
  uint64_t v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

id __67__IPDataDetectorsFeatureExtractor_textRangeReferencingNextWeekEnd___block_invoke()
{
  uint64_t v2 = 0;
  dispatch_queue_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(?:next week-?end|le week-?end prochain|n(?:ae|ä)chste[sn] w(?:eek-?end|ochenende))" options:65 error:&v2];
  return v0;
}

- (_NSRange)textRangeReferencingAllDay:(id)a3
{
  id v3 = a3;
  id v4 = +[IPRegexToolbox regularExpressionWithKey:@"textRangeReferencingAllDay" generator:&__block_literal_global_102];
  uint64_t v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

id __62__IPDataDetectorsFeatureExtractor_textRangeReferencingAllDay___block_invoke()
{
  uint64_t v2 = 0;
  dispatch_queue_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(?:all day|toute la journée)" options:65 error:&v2];
  return v0;
}

- (_NSRange)textRangeReferencingValentineDay:(id)a3
{
  id v3 = a3;
  id v4 = +[IPRegexToolbox regularExpressionWithKey:@"textRangeReferencingValentineDay" generator:&__block_literal_global_110];
  uint64_t v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

id __68__IPDataDetectorsFeatureExtractor_textRangeReferencingValentineDay___block_invoke()
{
  uint64_t v2 = 0;
  dispatch_queue_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(?:valentine(?:['’]?s)? day|s(?:ain)?t[ \\-]valentin|san valent[ií]n|san valentino|valentinstag)" options:65 error:&v2];
  return v0;
}

- (_NSRange)textRangeReferencingNewYearsEve:(id)a3
{
  id v3 = a3;
  id v4 = +[IPRegexToolbox regularExpressionWithKey:@"textRangeReferencingNewYearsEve" generator:&__block_literal_global_118];
  uint64_t v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

id __67__IPDataDetectorsFeatureExtractor_textRangeReferencingNewYearsEve___block_invoke()
{
  uint64_t v2 = 0;
  dispatch_queue_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(?:new year(?:['’]s)? eve|le nouvel an|du jour de l['’]an|du nouvel an|nochevieja|año nuevo|capodanno|l['’]ultimo dell['’]anno|silvester)" options:65 error:&v2];
  return v0;
}

- (_NSRange)textRangeReferencingMorning:(id)a3
{
  id v3 = a3;
  id v4 = +[IPRegexToolbox regularExpressionWithKey:@"textRangeReferencingMorning" generator:&__block_literal_global_126];
  uint64_t v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

id __63__IPDataDetectorsFeatureExtractor_textRangeReferencingMorning___block_invoke()
{
  uint64_t v2 = 0;
  dispatch_queue_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(?:morning|matin|(début|fin) de matinée|la mañana|mattina|morgen früh|清晨|上午|朝)" options:65 error:&v2];
  return v0;
}

- (_NSRange)textRangeReferencingNoon:(id)a3
{
  id v3 = a3;
  id v4 = +[IPRegexToolbox regularExpressionWithKey:@"textRangeReferencingNoon" generator:&__block_literal_global_134];
  uint64_t v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

id __60__IPDataDetectorsFeatureExtractor_textRangeReferencingNoon___block_invoke()
{
  uint64_t v2 = 0;
  dispatch_queue_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(?:lunch|(?<!after)noon|(?<!petit( |-))déjeuner|(?<!après-)midi|migdia|mezzogiorno|alla mezza|mitta(?:g(?:essen)?|ch)|中午|正午)" options:65 error:&v2];
  return v0;
}

- (_NSRange)textRangeReferencingAfternoon:(id)a3
{
  id v3 = a3;
  id v4 = +[IPRegexToolbox regularExpressionWithKey:@"textRangeReferencingAfternoon" generator:&__block_literal_global_142];
  uint64_t v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

id __65__IPDataDetectorsFeatureExtractor_textRangeReferencingAfternoon___block_invoke()
{
  uint64_t v2 = 0;
  dispatch_queue_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(?:after(?:noon| lunch)|après(?:-midi| d[eé]jeuner)|tarde|después de comer|pomeriggio|nachmittag|下午|午後)" options:65 error:&v2];
  return v0;
}

- (_NSRange)textRangeReferencingEvening:(id)a3
{
  id v3 = a3;
  id v4 = +[IPRegexToolbox regularExpressionWithKey:@"textRangeReferencingEvening" generator:&__block_literal_global_150];
  uint64_t v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

id __63__IPDataDetectorsFeatureExtractor_textRangeReferencingEvening___block_invoke()
{
  uint64_t v2 = 0;
  dispatch_queue_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(?:evening|dinner|(?<!bonne)soirée|ce soir|tomar algo|cenar|(?:una |la |sta)sera|晚|夜)" options:65 error:&v2];
  return v0;
}

- (id)queue
{
  if (queue__onceToken_0 != -1) {
    dispatch_once(&queue__onceToken_0, &__block_literal_global_155);
  }
  uint64_t v2 = (void *)queue__ipExprOnceResult_0;
  return v2;
}

void __40__IPDataDetectorsFeatureExtractor_queue__block_invoke()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x22A632550]();
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("IPDataDetectorsFeatureExtractor", v1);
  id v3 = (void *)queue__ipExprOnceResult_0;
  queue__ipExprOnceResult_0 = (uint64_t)v2;
}

@end