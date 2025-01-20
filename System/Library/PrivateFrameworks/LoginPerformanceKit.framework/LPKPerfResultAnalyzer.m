@interface LPKPerfResultAnalyzer
+ (double)_durationFromString:(id)a3;
+ (id)_abstractUserSwitchsFromTheEnd:(int64_t)a3 userSwitches:(id)a4;
+ (id)_perfResultsFromUserSwitches:(id)a3;
+ (id)analyzePerformanceTestResult:(id)a3 type:(unint64_t)a4 count:(int64_t)a5;
+ (void)_populateMigratorsData:(id)a3;
@end

@implementation LPKPerfResultAnalyzer

+ (id)analyzePerformanceTestResult:(id)a3 type:(unint64_t)a4 count:(int64_t)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy_;
  v55[4] = __Block_byref_object_dispose_;
  id v56 = 0;
  v8 = objc_opt_new();
  [v8 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSSSS"];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __65__LPKPerfResultAnalyzer_analyzePerformanceTestResult_type_count___block_invoke;
  v50[3] = &unk_264C7E598;
  id v40 = v8;
  id v51 = v40;
  id v9 = v6;
  id v52 = v9;
  v54 = v55;
  id v10 = v7;
  id v53 = v10;
  [v5 enumerateObjectsUsingBlock:v50];
  v39 = v5;
  v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v47 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v18 = [v17 startDate];
        if (v18)
        {
          v19 = [v17 endDate];
          BOOL v20 = v19 == 0;

          if (!v20) {
            [v11 addObject:v17];
          }
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v14);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v21 = v10;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v57 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        v26 = [v25 startDate];
        if (v26)
        {
          v27 = [v25 endDate];
          BOOL v28 = v27 == 0;

          if (!v28) {
            [v12 addObject:v25];
          }
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v57 count:16];
    }
    while (v22);
  }

  id v29 = v11;
  id v30 = v12;

  if (a4 - 2 < 2)
  {
    unint64_t v32 = [v30 count];
    if (v32 >= a5) {
      int64_t v33 = a5;
    }
    else {
      int64_t v33 = v32;
    }
    uint64_t v31 = objc_msgSend(v30, "subarrayWithRange:", 0, v33);
    goto LABEL_30;
  }
  if (a4 == 1)
  {
LABEL_25:
    uint64_t v31 = [a1 _abstractUserSwitchsFromTheEnd:a5 userSwitches:v29];
LABEL_30:
    v34 = (void *)v31;
    goto LABEL_32;
  }
  if (!a4)
  {
    +[LPKPerfResultAnalyzer _populateMigratorsData:v29];
    goto LABEL_25;
  }
  v34 = 0;
LABEL_32:
  v35 = +[LPKPerfResultAnalyzer _perfResultsFromUserSwitches:v34];

  _Block_object_dispose(v55, 8);

  return v35;
}

void __65__LPKPerfResultAnalyzer_analyzePerformanceTestResult_type_count___block_invoke(uint64_t a1, void *a2)
{
  id v30 = a2;
  v3 = [v30 objectForKeyedSubscript:@"eventname"];
  if ([v3 length] && objc_msgSend(v3, "containsString:", @"LGN"))
  {
    v4 = [v30 objectForKeyedSubscript:@"walltime"];
    id v5 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 3);

    v6 = [*(id *)(a1 + 32) dateFromString:v5];
    v7 = [v3 componentsSeparatedByString:@"_"];
    v8 = [v7 lastObject];
    id v9 = [v7 objectAtIndexedSubscript:1];
    int v10 = [v9 isEqualToString:@"S"];

    if (!v10)
    {
      uint64_t v15 = [v7 objectAtIndexedSubscript:1];
      int v16 = [v15 isEqualToString:@"E"];

      if (!v16)
      {
LABEL_18:

        goto LABEL_19;
      }
      v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) signposts];
      v18 = [v17 objectForKeyedSubscript:v8];

      [v18 setEndDate:v6];
      v19 = [v7 objectAtIndexedSubscript:2];
      int v20 = [v19 isEqualToString:@"Login"];

      if (v20)
      {
        id v21 = (id *)(a1 + 40);
      }
      else
      {
        BOOL v28 = [v7 objectAtIndexedSubscript:2];
        int v29 = [v28 isEqualToString:@"Logout"];

        if (!v29)
        {
LABEL_17:

          goto LABEL_18;
        }
        id v21 = (id *)(a1 + 48);
      }
      v27 = [*v21 lastObject];
      [v27 setEndDate:v6];
LABEL_16:

      goto LABEL_17;
    }
    v11 = [v7 objectAtIndexedSubscript:2];
    int v12 = [v11 isEqualToString:@"Login"];

    if (v12)
    {
      id v13 = objc_opt_new();
      [v13 setStartDate:v6];
      uint64_t v14 = *(void **)(a1 + 40);
    }
    else
    {
      uint64_t v22 = [v7 objectAtIndexedSubscript:2];
      int v23 = [v22 isEqualToString:@"Logout"];

      if (!v23)
      {
LABEL_12:
        v18 = objc_opt_new();
        [v18 setStartDate:v6];
        [v18 setName:v8];
        v26 = [v30 objectForKeyedSubscript:@"execname"];
        [v18 setProcessName:v26];

        v27 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) signposts];
        [v27 setObject:v18 forKeyedSubscript:v8];
        goto LABEL_16;
      }
      id v13 = objc_opt_new();
      [v13 setStartDate:v6];
      uint64_t v14 = *(void **)(a1 + 48);
    }
    [v14 addObject:v13];
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
    v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v13;

    goto LABEL_12;
  }
LABEL_19:
}

+ (id)_perfResultsFromUserSwitches:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  if ([v3 count])
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [v3 objectAtIndexedSubscript:v5];
      v7 = [v6 signposts];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __54__LPKPerfResultAnalyzer__perfResultsFromUserSwitches___block_invoke;
      v11[3] = &unk_264C7E5C0;
      id v12 = v4;
      [v7 enumerateKeysAndObjectsUsingBlock:v11];

      ++v5;
    }
    while ([v3 count] > v5);
  }
  v8 = [v4 allValues];
  id v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_93];

  return v9;
}

void __54__LPKPerfResultAnalyzer__perfResultsFromUserSwitches___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  v6 = [v5 endDate];
  if (v6)
  {
  }
  else
  {
    [v5 duration];
    if (v7 <= 0.0) {
      goto LABEL_7;
    }
  }
  v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];

  if (!v8)
  {
    id v9 = objc_opt_new();
    [v9 setEntryName:v11];
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v11];
  }
  int v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
  [v5 duration];
  objc_msgSend(v10, "addEntryValue:");

LABEL_7:
}

uint64_t __54__LPKPerfResultAnalyzer__perfResultsFromUserSwitches___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 medianValue];
  double v7 = v6;
  [v5 medianValue];
  if (v7 >= v8)
  {
    [v4 medianValue];
    double v11 = v10;
    [v5 medianValue];
    if (v11 == v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

+ (void)_populateMigratorsData:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    NSLog(&cfstr_AnalyzingMigra.isa);
    v42[0] = 0;
    id v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\((.*?)\\)" options:16 error:v42];
    id v5 = v42[0];
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy_;
    v40[4] = __Block_byref_object_dispose_;
    id v41 = [v3 firstObject];
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v39[3] = 0;
    double v6 = [MEMORY[0x263F52748] localStore];
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy_;
    v37 = __Block_byref_object_dispose_;
    id v38 = 0;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke;
    v32[3] = &unk_264C7E608;
    v32[4] = &v33;
    [v6 prepareWithCompletionHandler:v32];
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = objc_alloc(MEMORY[0x263F52750]);
    uint64_t v9 = [v8 initWithSource:v34[5]];
    double v10 = (void *)_populateMigratorsData__stream;
    _populateMigratorsData__stream = v9;

    [(id)_populateMigratorsData__stream setFlags:20];
    double v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"process==%@", @"com.apple.datamigrator"];
    [(id)_populateMigratorsData__stream setFilterPredicate:v11];
    double v12 = (void *)_populateMigratorsData__stream;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke_2;
    v27[3] = &unk_264C7E658;
    id v30 = v39;
    id v13 = v3;
    id v28 = v13;
    uint64_t v31 = v40;
    id v14 = v4;
    id v29 = v14;
    [v12 setEventHandler:v27];
    uint64_t v15 = (void *)_populateMigratorsData__stream;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke_4;
    v25[3] = &unk_264C7E680;
    int v16 = v7;
    v26 = v16;
    [v15 setInvalidationHandler:v25];
    v17 = [v13 firstObject];
    v18 = [v17 startDate];

    if (v18)
    {
      v19 = (void *)_populateMigratorsData__stream;
      int v20 = (void *)MEMORY[0x263EFF910];
      id v21 = [v13 firstObject];
      uint64_t v22 = [v21 startDate];
      [v22 timeIntervalSince1970];
      uint64_t v24 = [v20 dateWithTimeIntervalSince1970:v23 + -1.0];
      [v19 activateStreamFromDate:v24];

      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    }

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(v39, 8);
    _Block_object_dispose(v40, 8);
  }
}

void __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke(uint64_t a1, void *a2)
{
}

void __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 1024)
  {
    id v4 = [v3 composedMessage];
    int v5 = [v4 containsString:@"completed migration"];

    if (v5)
    {
      double v6 = [v3 date];
      while (1)
      {
        unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        if (v7 >= [*(id *)(a1 + 32) count]) {
          break;
        }
        uint64_t v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
        uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
        double v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        double v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) startDate];
        uint64_t v12 = [v6 compare:v11];

        if (v12 == -1) {
          goto LABEL_16;
        }
        id v13 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) startDate];
        if ([v6 compare:v13] == -1)
        {
        }
        else
        {
          id v14 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) endDate];
          uint64_t v15 = [v6 compare:v14];

          if (v15 != 1) {
            break;
          }
        }
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      }
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (v16 != [*(id *)(a1 + 32) count])
      {
        v17 = [v3 composedMessage];
        uint64_t v33 = 0;
        v34 = &v33;
        uint64_t v35 = 0x3032000000;
        v36 = __Block_byref_object_copy_;
        v37 = __Block_byref_object_dispose_;
        id v38 = 0;
        uint64_t v27 = 0;
        id v28 = &v27;
        uint64_t v29 = 0x3032000000;
        id v30 = __Block_byref_object_copy_;
        uint64_t v31 = __Block_byref_object_dispose_;
        id v32 = 0;
        v18 = *(void **)(a1 + 40);
        uint64_t v19 = [v17 length];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke_3;
        v23[3] = &unk_264C7E630;
        id v20 = v17;
        id v24 = v20;
        v25 = &v33;
        v26 = &v27;
        objc_msgSend(v18, "enumerateMatchesInString:options:range:usingBlock:", v20, 16, 0, v19, v23);
        if (v34[5] && v28[5])
        {
          id v21 = objc_opt_new();
          [v21 setName:v34[5]];
          [v21 setProcessName:@"com.apple.datamigrator"];
          +[LPKPerfResultAnalyzer _durationFromString:v28[5]];
          objc_msgSend(v21, "setDuration:");
          uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) signposts];
          [v22 setObject:v21 forKeyedSubscript:v34[5]];
        }
        _Block_object_dispose(&v27, 8);

        _Block_object_dispose(&v33, 8);
      }
LABEL_16:
    }
  }
}

void __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke_3(uint64_t a1, void *a2)
{
  id v13 = a2;
  BOOL v3 = (unint64_t)[v13 numberOfRanges] >= 2;
  id v4 = v13;
  if (v3)
  {
    uint64_t v5 = [v13 rangeAtIndex:1];
    uint64_t v7 = v6;
    BOOL v8 = v5 + v6 > (unint64_t)[*(id *)(a1 + 32) length];
    id v4 = v13;
    if (!v8)
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        id v4 = v13;
        if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
          goto LABEL_9;
        }
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v5, v7);
        uint64_t v10 = *(void *)(a1 + 48);
      }
      else
      {
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v5, v7);
        uint64_t v10 = *(void *)(a1 + 40);
      }
      uint64_t v11 = *(void *)(v10 + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v9;

      id v4 = v13;
    }
  }
LABEL_9:
}

intptr_t __48__LPKPerfResultAnalyzer__populateMigratorsData___block_invoke_4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (double)_durationFromString:(id)a3
{
  [a3 doubleValue];
  return result;
}

+ (id)_abstractUserSwitchsFromTheEnd:(int64_t)a3 userSwitches:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [v5 count];
  if (v6 >= a3) {
    int64_t v7 = a3;
  }
  else {
    int64_t v7 = v6;
  }
  uint64_t v8 = [v5 count];
  uint64_t v9 = objc_msgSend(v5, "subarrayWithRange:", (v8 - a3) & ~((v8 - a3) >> 63), v7);

  return v9;
}

@end