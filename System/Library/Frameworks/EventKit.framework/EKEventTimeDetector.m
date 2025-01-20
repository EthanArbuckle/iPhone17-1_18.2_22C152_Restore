@interface EKEventTimeDetector
+ (id)dateResultsFromString:(id)a3 referenceDate:(id)a4;
+ (id)resultDictionaryForString:(id)a3 referenceDate:(id)a4;
+ (id)resultDictionaryForString:(id)a3 referenceDate:(id)a4 ignoreDurationForApproximateTime:(BOOL)a5;
+ (id)stripRanges:(id)a3 fromString:(id)a4;
@end

@implementation EKEventTimeDetector

+ (id)resultDictionaryForString:(id)a3 referenceDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() resultDictionaryForString:v6 referenceDate:v5 ignoreDurationForApproximateTime:0];

  return v7;
}

+ (id)resultDictionaryForString:(id)a3 referenceDate:(id)a4 ignoreDurationForApproximateTime:(BOOL)a5
{
  BOOL v82 = a5;
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [MEMORY[0x1E4F1CA48] array];
  v86 = id v85 = a1;
  v87 = v7;
  v9 = [(id)objc_opt_class() dateResultsFromString:v7 referenceDate:v8];
  v88 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v113 objects:v121 count:16];
  v12 = v10;
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v114;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v114 != v14) {
          objc_enumerationMutation(v10);
        }
        if (v8)
        {
          v16 = [*(id *)(*((void *)&v113 + 1) + 8 * i) date];
          int v17 = [v16 isSameDayAsDate:v8 inCalendar:v88];

          if (!v17)
          {

            v12 = [(id)objc_opt_class() dateResultsFromString:v87 referenceDate:0];
            goto LABEL_12;
          }
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v113 objects:v121 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    v12 = v10;
  }
LABEL_12:

  v83 = v12;
  v84 = v8;
  if (![v12 count])
  {
    v21 = 0;
    v39 = 0;
    uint64_t v40 = 0;
    BOOL v41 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    v44 = (void *)MEMORY[0x1E4F1CBF0];
    v92 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_90;
  }
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v109 objects:v120 count:16];
  if (!v19)
  {

    v21 = 0;
LABEL_38:
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v45 = v18;
    id v46 = v18;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v101 objects:v118 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      v38 = 0;
      uint64_t v49 = *(void *)v102;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v102 != v49) {
            objc_enumerationMutation(v46);
          }
          v51 = *(void **)(*((void *)&v101 + 1) + 8 * j);
          if (!v38 || ([*(id *)(*((void *)&v101 + 1) + 8 * j) timeIsApproximate] & 1) == 0)
          {
            id v52 = v51;

            v38 = v52;
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v101 objects:v118 count:16];
      }
      while (v48);
    }
    else
    {
      v38 = 0;
    }

    id v18 = v45;
    goto LABEL_51;
  }
  uint64_t v20 = v19;
  v21 = 0;
  uint64_t v22 = *(void *)v110;
  id v89 = 0;
  uint64_t v91 = *(void *)v110;
  do
  {
    uint64_t v23 = 0;
    uint64_t v93 = v20;
    do
    {
      if (*(void *)v110 != v22) {
        objc_enumerationMutation(v18);
      }
      v24 = *(void **)(*((void *)&v109 + 1) + 8 * v23);
      if (([v24 timeIsSignificant] & 1) == 0)
      {
        v95 = v21;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id v25 = v18;
        id v26 = v18;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v105 objects:v119 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v106;
LABEL_21:
          uint64_t v30 = 0;
          while (1)
          {
            if (*(void *)v106 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v105 + 1) + 8 * v30);
            if (v24 != v31)
            {
              NSUInteger v32 = [v24 range];
              NSUInteger v34 = v33;
              v125.location = [v31 range];
              v125.length = v35;
              v124.location = v32;
              v124.length = v34;
              if (NSIntersectionRange(v124, v125).length) {
                break;
              }
            }
            if (v28 == ++v30)
            {
              uint64_t v28 = [v26 countByEnumeratingWithState:&v105 objects:v119 count:16];
              if (v28) {
                goto LABEL_21;
              }
              goto LABEL_28;
            }
          }
        }
        else
        {
LABEL_28:

          id v26 = v89;
          id v89 = v24;
        }

        uint64_t v20 = v93;
        v21 = v95;
        id v18 = v25;
        uint64_t v22 = v91;
      }
      v36 = [v24 timeZone];

      if (v36)
      {
        uint64_t v37 = [v24 timeZone];

        v21 = (void *)v37;
      }
      ++v23;
    }
    while (v23 != v20);
    uint64_t v20 = [v18 countByEnumeratingWithState:&v109 objects:v120 count:16];
  }
  while (v20);

  v38 = v89;
  if (!v89) {
    goto LABEL_38;
  }
LABEL_51:
  v39 = [v38 date];
  [v38 duration];
  double v54 = v53;
  uint64_t v55 = rangesSafeToRemove(v38);
  char v56 = [v38 timeIsApproximate];
  v90 = v38;
  v92 = (void *)v55;
  if ([v38 timeIsSignificant])
  {
    char v57 = 1;
LABEL_70:
    v44 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_73;
  }
  if ((unint64_t)[v18 count] < 2)
  {
    char v57 = 0;
    goto LABEL_70;
  }
  char v94 = v56;
  v96 = v21;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v58 = v18;
  uint64_t v59 = [v58 countByEnumeratingWithState:&v97 objects:v117 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    char v57 = 0;
    v61 = 0;
    uint64_t v62 = *(void *)v98;
    v44 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t k = 0; k != v60; ++k)
      {
        if (*(void *)v98 != v62) {
          objc_enumerationMutation(v58);
        }
        v64 = *(void **)(*((void *)&v97 + 1) + 8 * k);
        if ([v64 timeIsSignificant])
        {
          if (![v64 timeIsApproximate] || v61 == 0)
          {
            id v66 = v64;

            [v66 duration];
            double v54 = v67;
            v68 = (void *)MEMORY[0x1E4F1C9C8];
            v69 = [v66 date];
            uint64_t v70 = [v68 dateWithDatePartFromDate:v39 timePartFromDate:v69 inCalendar:v88];

            uint64_t v71 = rangesSafeToRemove(v66);

            char v94 = [v66 timeIsApproximate];
            char v57 = 1;
            v44 = (void *)v71;
            v39 = (void *)v70;
            v61 = v66;
          }
        }
      }
      uint64_t v60 = [v58 countByEnumeratingWithState:&v97 objects:v117 count:16];
    }
    while (v60);
  }
  else
  {
    char v57 = 0;
    v61 = 0;
    v44 = (void *)MEMORY[0x1E4F1CBF0];
  }

  v21 = v96;
  uint64_t v55 = (uint64_t)v92;
  char v56 = v94;
LABEL_73:

  uint64_t v40 = v56 & 1;
  BOOL v41 = (v57 & 1) == 0;
  if (!v39)
  {
    BOOL v41 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    goto LABEL_90;
  }
  if (v82)
  {
    char v72 = v40;
    if (![v84 isSameDayAsDate:v39 inCalendar:0])
    {
      char v72 = 0;
      uint64_t v43 = 0;
      if (v57) {
        goto LABEL_82;
      }
      goto LABEL_81;
    }
  }
  else
  {
    char v72 = 0;
  }
  uint64_t v43 = v39;
  [v86 addObjectsFromArray:v55];
  [v86 addObjectsFromArray:v44];
  if ((v57 & 1) == 0)
  {
LABEL_81:
    uint64_t v73 = [(id)v43 dateRemovingTimeComponentsInCalendar:v88];

    uint64_t v43 = v73;
  }
LABEL_82:
  if (v54 <= 0.0) {
    char v74 = 1;
  }
  else {
    char v74 = v72;
  }
  if (v74)
  {
    uint64_t v42 = 0;
  }
  else
  {
    v75 = [(id)v43 dateByAddingTimeInterval:v54];
    uint64_t v42 = (uint64_t)v75;
    if (v57)
    {
      BOOL v41 = 0;
    }
    else
    {
      BOOL v41 = 1;
      uint64_t v76 = [v75 dateByAddingDays:1 inCalendar:v88];

      uint64_t v42 = v76;
    }
  }
LABEL_90:
  v77 = objc_opt_new();
  v78 = [v85 stripRanges:v86 fromString:v87];
  [v77 setValue:v78 forKey:@"EKEventTimeDetectorResultTitleKey"];
  [v77 setValue:v43 forKey:@"EKEventTimeDetectorResultStartDateKey"];
  [v77 setValue:v42 forKey:@"EKEventTimeDetectorResultEndDateKey"];
  v79 = [NSNumber numberWithBool:v40];
  [v77 setValue:v79 forKey:@"EKEventTimeDetectorResultTimeIsApproximateKey"];

  if (v43 | v42)
  {
    v80 = [NSNumber numberWithBool:v41];
    [v77 setValue:v80 forKey:@"EKEventTimeDetectorResultAllDayKey"];
  }
  if (v21) {
    [v77 setValue:v21 forKey:@"EKEventTimeDetectorResultTimeZoneKey"];
  }

  return v77;
}

+ (id)dateResultsFromString:(id)a3 referenceDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  if ([v5 length])
  {
    if (dateResultsFromString_referenceDate__onceToken != -1) {
      dispatch_once(&dateResultsFromString_referenceDate__onceToken, &__block_literal_global_19);
    }
    id v8 = dateResultsFromString_referenceDate__dateScannerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__EKEventTimeDetector_dateResultsFromString_referenceDate___block_invoke_2;
    block[3] = &unk_1E5B97190;
    id v14 = v5;
    id v15 = v6;
    id v9 = v7;
    id v16 = v9;
    dispatch_sync(v8, block);
    id v10 = v16;
    id v11 = v9;
  }

  return v7;
}

uint64_t __59__EKEventTimeDetector_dateResultsFromString_referenceDate___block_invoke()
{
  dateResultsFromString_referenceDate__s_dateScanner = DDScannerCreate();
  dispatch_queue_t v0 = dispatch_queue_create("EKEventTimeDetectorDateScannerQueue", 0);
  uint64_t v1 = dateResultsFromString_referenceDate__dateScannerQueue;
  dateResultsFromString_referenceDate__dateScannerQueue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void __59__EKEventTimeDetector_dateResultsFromString_referenceDate___block_invoke_2(uint64_t a1)
{
  if (dateResultsFromString_referenceDate__s_dateScanner)
  {
    if (DDScannerScanString())
    {
      uint64_t v2 = DDScannerCopyResultsWithOptions();
      if (v2)
      {
        CFArrayRef v3 = (const __CFArray *)v2;
        v4 = *(void **)(a1 + 48);
        id v5 = *(id *)(a1 + 40);
        id v12 = v4;
        CFIndex Count = CFArrayGetCount(v3);
        if (Count >= 1)
        {
          CFIndex v6 = 0;
          CFArrayRef v13 = v3;
          do
          {
            CFArrayGetValueAtIndex(v3, v6);
            DDResultGetRange();
            id v7 = DDResultGetType();
            if (([@"Date" isEqualToString:v7] & 1) != 0
              || ([@"Time" isEqualToString:v7] & 1) != 0
              || ([@"DateTime" isEqualToString:v7] & 1) != 0
              || ([@"DateDuration" isEqualToString:v7] & 1) != 0
              || ([@"TimeDuration" isEqualToString:v7] & 1) != 0
              || [@"Timestamp" isEqualToString:v7])
            {
              id v8 = v5;
              if (!v5)
              {
                id v8 = [MEMORY[0x1E4F1C9C8] date];
              }
              id v9 = v8;
              id v10 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
              [v7 rangeOfString:@"Duration"];
              if (!v11 || !DDResultCopyExtractedStartDateEndDate()) {
                DDResultCopyExtractedDateFromReferenceDate();
              }
              if (resultHasApproxTime()) {
                resultHasExactTime();
              }
              DDResultIsPastDate();

              CFArrayRef v3 = v13;
            }

            ++v6;
          }
          while (Count != v6);
        }

        CFRelease(v3);
      }
    }
  }
}

+ (id)stripRanges:(id)a3 fromString:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  CFIndex v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = [a3 sortedArrayUsingComparator:&__block_literal_global_24];
  id v8 = [v6 arrayWithArray:v7];

  if ([v8 count] && objc_msgSend(v8, "count") != 1)
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = [v8 objectAtIndexedSubscript:v9];
      NSUInteger v11 = [v10 rangeValue];
      NSUInteger v13 = v12;

      id v14 = [v8 objectAtIndexedSubscript:v9 + 1];
      NSUInteger v15 = [v14 rangeValue];
      NSUInteger v17 = v16;

      v44.location = v11;
      v44.length = v13;
      v46.location = v15;
      v46.length = v17;
      if (NSIntersectionRange(v44, v46).length)
      {
        id v18 = (void *)MEMORY[0x1E4F29238];
        v45.location = v11;
        v45.length = v13;
        v47.location = v15;
        v47.length = v17;
        NSRange v19 = NSUnionRange(v45, v47);
        uint64_t v20 = objc_msgSend(v18, "valueWithRange:", v19.location, v19.length);
        [v8 setObject:v20 atIndexedSubscript:v9];

        [v8 removeObjectAtIndex:v9 + 1];
      }
      else
      {
        ++v9;
      }
    }
    while (v9 < [v8 count] - 1);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v21 = v8;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
  id v23 = v5;
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v38;
    id v23 = v5;
    do
    {
      uint64_t v26 = 0;
      uint64_t v27 = v23;
      do
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v21);
        }
        uint64_t v28 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v26), "rangeValue", (void)v37);
        objc_msgSend(v27, "stringByReplacingCharactersInRange:withString:", v28, v29, &stru_1EF932508);
        id v23 = (id)objc_claimAutoreleasedReturnValue();

        ++v26;
        uint64_t v27 = v23;
      }
      while (v24 != v26);
      uint64_t v24 = [v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v24);
  }

  if ([v21 count])
  {
    uint64_t v30 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v31 = [v23 componentsSeparatedByCharactersInSet:v30];

    NSUInteger v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF != ''"];
    NSUInteger v33 = [v31 filteredArrayUsingPredicate:v32];

    NSUInteger v34 = [v33 componentsJoinedByString:@" "];

    if ([v34 length]) {
      NSUInteger v35 = v34;
    }
    else {
      NSUInteger v35 = v5;
    }
    id v23 = v35;
  }

  return v23;
}

uint64_t __46__EKEventTimeDetector_stripRanges_fromString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 rangeValue];
  unint64_t v6 = [v4 rangeValue];

  if (v5 > v6) {
    return -1;
  }
  else {
    return v5 != v6;
  }
}

@end