@interface FHInsightsFetcher
+ (id)sharedInstance;
- (NSDecimalNumberHandler)roundingBehavior;
- (id)_init;
- (id)retrieveInsightsWithStartDate:(id)a3 endDate:(id)a4 insightTypeItems:(id)a5 trendWindow:(int64_t)a6;
- (id)retrieveSpendInsightsWithStartDate:(id)a3 endDate:(id)a4 insightTypeItems:(id)a5 trendWindow:(int64_t)a6;
- (id)totalSpendAmountBetweenDates:(id)a3 endDate:(id)a4;
- (void)setRoundingBehavior:(id)a3;
@end

@implementation FHInsightsFetcher

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_insightsFetcher;
  return v2;
}

uint64_t __35__FHInsightsFetcher_sharedInstance__block_invoke()
{
  sharedInstance_insightsFetcher = [[FHInsightsFetcher alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)FHInsightsFetcher;
  v2 = [(FHInsightsFetcher *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F087B8] decimalNumberHandlerWithRoundingMode:0 scale:2 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
    roundingBehavior = v2->_roundingBehavior;
    v2->_roundingBehavior = (NSDecimalNumberHandler *)v3;
  }
  return v2;
}

- (id)totalSpendAmountBetweenDates:(id)a3 endDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__0;
  v35 = __Block_byref_object_dispose__0;
  id v36 = (id)objc_opt_new();
  uint64_t v27 = 0;
  v28 = (double *)&v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  id v8 = objc_alloc(MEMORY[0x263F3C878]);
  v9 = (void *)[v8 initWithEntity:*MEMORY[0x263F3C838]];
  v10 = [v9 fieldsInOrder];
  v11 = (void *)MEMORY[0x263F3C870];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __58__FHInsightsFetcher_totalSpendAmountBetweenDates_endDate___block_invoke;
  v24[3] = &unk_265317CB0;
  id v12 = v5;
  id v25 = v12;
  id v13 = v6;
  id v26 = v13;
  v14 = [v11 initWithBuilder:v24];
  uint64_t v15 = *MEMORY[0x263F3C7D8];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __58__FHInsightsFetcher_totalSpendAmountBetweenDates_endDate___block_invoke_2;
  v23[3] = &unk_265317CD8;
  v23[4] = &v27;
  v23[5] = &v31;
  [v9 queryDataWithBlock:v14 logicalOperator:v15 selectFields:v10 usingBlock:v23];
  v16 = (void *)MEMORY[0x263F087B0];
  v17 = [NSNumber numberWithDouble:v28[3]];
  v18 = v17;
  if (v17)
  {
    [v17 decimalValue];
  }
  else
  {
    v21[0] = 0;
    v21[1] = 0;
    int v22 = 0;
  }
  v19 = [v16 decimalNumberWithDecimal:v21];
  [v7 setValue:v19 forKey:@"overallSpending"];

  [v7 setValue:v32[5] forKey:@"categorySpending"];
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v7;
}

void __58__FHInsightsFetcher_totalSpendAmountBetweenDates_endDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x263F3C738];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 addDateClause:v3 fieldName:@"transactions.t_date" expression:v4];
  [v5 addDateClause:*MEMORY[0x263F3C740] fieldName:@"transactions.t_date" expression:*(void *)(a1 + 40)];
  [v5 addIntegerClause:*MEMORY[0x263F3C730] fieldName:@"transactions.a_type" expression:2];
  [v5 addIntegerClause:*MEMORY[0x263F3C748] fieldName:@"transactions.t_fh_internal_state" expression:6];
}

void __58__FHInsightsFetcher_totalSpendAmountBetweenDates_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [v14 signedIntegerAtIndex:14];
  unint64_t v4 = [v14 signedIntegerAtIndex:10];
  if (v3 == 13 || !v3)
  {
    id v5 = (void *)MEMORY[0x263F087B0];
    id v6 = [v14 objectAtIndex:6];
    v7 = [v6 stringValue];
    id v8 = [v5 decimalNumberWithString:v7];

    if (v4 <= 8 && ((1 << v4) & 0x103) != 0)
    {
      double v9 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      v10 = [v14 objectAtIndex:6];
      [v10 doubleValue];
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9 + v11;

      id v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v13 = [v14 objectAtIndex:24];
      [v12 setOrAddToDecimalValue:v8 forKey:v13];
    }
  }
}

- (id)retrieveSpendInsightsWithStartDate:(id)a3 endDate:(id)a4 insightTypeItems:(id)a5 trendWindow:(int64_t)a6
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v91 = a3;
  id v9 = a4;
  v10 = FinHealthLogObject();
  double v11 = FinHealthLogObject();
  ptr = self;
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);

  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24E070000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "insight:retriveSpendingInsights", (const char *)&unk_24E07E6FF, buf, 2u);
  }

  id v13 = FinHealthLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24E070000, v13, OS_LOG_TYPE_INFO, "BEGIN \"insight:retriveSpendingInsights\"", buf, 2u);
  }

  v84 = objc_alloc_init(FHOverallSpendInsight);
  v89 = objc_opt_new();
  id v14 = +[FHInsightsFetcher sharedInstance];
  uint64_t v15 = [v14 totalSpendAmountBetweenDates:v91 endDate:v9];

  v16 = [v15 objectForKey:@"overallSpending"];
  [v16 doubleValue];
  double v18 = v17;

  v83 = v15;
  v19 = [v15 objectForKey:@"categorySpending"];
  v90 = objc_opt_new();
  v20 = [MEMORY[0x263EFF910] now];
  LODWORD(v15) = FHIsDateBetweenDates();

  if (v15)
  {
    v21 = [MEMORY[0x263EFF910] now];
    unint64_t v22 = FHNumberOfDaysBetweenDates();
  }
  else
  {
    unint64_t v22 = FHNumberOfDaysBetweenDates();
  }
  switch(a6)
  {
    case 3:
      uint64_t v23 = FHStartOfLastYear();
      break;
    case 2:
      v24 = FHDateStartOfLastMonth();
      if (v22 == FHNumberOfDaysInMonthForDate() || v22 >= FHNumberOfDaysInMonthForDate()) {
        FHNumberOfDaysInMonthForDate();
      }
      goto LABEL_18;
    case 1:
      uint64_t v23 = FHDateFromNumberOfDays();
      break;
    default:
      double v30 = 0.0;
      double v34 = 3.40282347e38;
      double v32 = v18;
      goto LABEL_23;
  }
  v24 = (void *)v23;
LABEL_18:
  id v25 = FHDateFromNumberOfDays();
  id v26 = +[FHInsightsFetcher sharedInstance];
  uint64_t v27 = [v26 totalSpendAmountBetweenDates:v24 endDate:v25];

  v28 = [v27 objectForKey:@"overallSpending"];
  [v28 doubleValue];
  double v30 = v29;

  uint64_t v31 = [v27 objectForKey:@"categorySpending"];

  double v32 = v18 - v30;
  double v33 = fabs(v18 - v30) / v30 * 100.0;
  if (v30 == 0.0) {
    double v34 = 3.40282347e38;
  }
  else {
    double v34 = v33;
  }
  v90 = (void *)v31;
LABEL_23:
  uint64_t v35 = 2;
  if (v32 >= 0.0) {
    uint64_t v35 = 1;
  }
  if (v32 == 0.0) {
    uint64_t v36 = 0;
  }
  else {
    uint64_t v36 = v35;
  }
  [(FHFeatureInsight *)v84 setDirection:v36];
  [(FHFeatureInsight *)v84 setType:@"FHInsightTypeOverallSpend"];
  v37 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v18 / 100.0];
  v38 = [v37 decimalNumberByRoundingAccordingToBehavior:ptr->_roundingBehavior];
  [(FHFeatureInsight *)v84 setSpendAmount:v38];

  v39 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v30 / 100.0];
  v40 = [v39 decimalNumberByRoundingAccordingToBehavior:ptr->_roundingBehavior];
  [(FHFeatureInsight *)v84 setAverageAmount:v40];

  v41 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v32 / 100.0];
  v42 = [v41 decimalNumberByRoundingAccordingToBehavior:ptr->_roundingBehavior];
  [(FHFeatureInsight *)v84 setSpendingInsightAmount:v42];

  v43 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v34];
  v44 = [v43 decimalNumberByRoundingAccordingToBehavior:ptr->_roundingBehavior];
  [(FHFeatureInsight *)v84 setSpendingInsightPercentageValue:v44];

  [(FHFeatureInsight *)v84 setStartDate:v91];
  [(FHFeatureInsight *)v84 setEndDate:v9];
  [(FHFeatureInsight *)v84 setWindow:a6];
  [(FHFeatureInsight *)v84 setCurrencyCode:@"USD"];
  [v89 addObject:v84];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id obj = v19;
  uint64_t v92 = [obj countByEnumeratingWithState:&v96 objects:v101 count:16];
  if (v92)
  {
    uint64_t v87 = *(void *)v97;
    int64_t v88 = a6;
    id v86 = v9;
    do
    {
      for (uint64_t i = 0; i != v92; ++i)
      {
        if (*(void *)v97 != v87) {
          objc_enumerationMutation(obj);
        }
        v46 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        v47 = objc_alloc_init(FHCategorySpendInsight);
        v48 = [MEMORY[0x263F087B0] zero];
        v49 = [MEMORY[0x263F087B0] zero];
        v50 = [obj objectForKeyedSubscript:v46];
        v51 = [v90 objectForKey:v46];

        if (v51)
        {
          uint64_t v52 = [v90 objectForKeyedSubscript:v46];

          v48 = (void *)v52;
        }
        v95 = v50;
        v53 = [v50 decimalNumberBySubtracting:v48];
        v54 = [v53 decimalNumberByRoundingAccordingToBehavior:ptr->_roundingBehavior];

        unint64_t v55 = 0x263F08000uLL;
        v56 = [MEMORY[0x263F087B0] zero];
        uint64_t v57 = [v48 compare:v56];

        if (!v57)
        {
          [(FHFeatureInsight *)v47 setDirection:1];
          uint64_t v66 = [objc_alloc(MEMORY[0x263F087B0]) initWithDouble:3.40282347e38];
LABEL_41:
          v62 = (void *)v66;
          [(FHFeatureInsight *)v47 setSpendingInsightPercentageValue:v66];
          goto LABEL_44;
        }
        v58 = [MEMORY[0x263F087B0] zero];
        uint64_t v59 = [v54 compare:v58];

        if (!v59)
        {
          [(FHFeatureInsight *)v47 setDirection:0];
          uint64_t v66 = [MEMORY[0x263F087B0] zero];
          goto LABEL_41;
        }
        v60 = [MEMORY[0x263F087B0] zero];
        uint64_t v61 = [v54 compare:v60];

        if (v61 == 1)
        {
          [(FHFeatureInsight *)v47 setDirection:1];
          v62 = [v54 decimalNumberByDividingBy:v48];
          v63 = [MEMORY[0x263F087B0] decimalNumberWithString:@"100"];
          v64 = [v62 decimalNumberByMultiplyingBy:v63];
          v65 = [v64 decimalNumberByRoundingAccordingToBehavior:ptr->_roundingBehavior];
          [(FHFeatureInsight *)v47 setSpendingInsightPercentageValue:v65];

          unint64_t v55 = 0x263F08000;
        }
        else
        {
          [(FHFeatureInsight *)v47 setDirection:2];
          v62 = [v48 decimalNumberBySubtracting:v95];
          v85 = [v62 decimalNumberByDividingBy:v48];
          v67 = [MEMORY[0x263F087B0] decimalNumberWithString:@"100"];
          v68 = [v85 decimalNumberByMultiplyingBy:v67];
          v69 = [v68 decimalNumberByRoundingAccordingToBehavior:ptr->_roundingBehavior];
          [(FHFeatureInsight *)v47 setSpendingInsightPercentageValue:v69];
        }
        id v9 = v86;
LABEL_44:

        [(FHFeatureInsight *)v47 setType:@"FHInsightTypeCategorySpend"];
        [*(id *)(v55 + 1968) defaultDatabaseAmountMultiplier];
        v71 = unint64_t v70 = v55;
        v72 = [v95 decimalNumberByDividingBy:v71];
        [(FHFeatureInsight *)v47 setSpendAmount:v72];

        v73 = [*(id *)(v70 + 1968) defaultDatabaseAmountMultiplier];
        v74 = [v48 decimalNumberByDividingBy:v73];
        [(FHFeatureInsight *)v47 setAverageAmount:v74];

        v75 = [*(id *)(v70 + 1968) defaultDatabaseAmountMultiplier];
        v76 = [v54 decimalNumberByDividingBy:v75];
        [(FHFeatureInsight *)v47 setSpendingInsightAmount:v76];

        [(FHFeatureInsight *)v47 setStartDate:v91];
        [(FHFeatureInsight *)v47 setEndDate:v9];
        [(FHFeatureInsight *)v47 setWindow:v88];
        [(FHFeatureInsight *)v47 setCurrencyCode:@"USD"];
        -[FHCategorySpendInsight setMerchantCategory:](v47, "setMerchantCategory:", (int)[v46 intValue]);
        [v89 addObject:v47];
      }
      uint64_t v92 = [obj countByEnumeratingWithState:&v96 objects:v101 count:16];
    }
    while (v92);
  }

  v77 = FinHealthLogObject();
  v78 = FinHealthLogObject();
  os_signpost_id_t v79 = os_signpost_id_make_with_pointer(v78, ptr);

  if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24E070000, v77, OS_SIGNPOST_INTERVAL_END, v79, "insight:retriveSpendingInsights", (const char *)&unk_24E07E6FF, buf, 2u);
  }

  v80 = FinHealthLogObject();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24E070000, v80, OS_LOG_TYPE_INFO, "END \"insight:retriveSpendingInsights\"", buf, 2u);
  }

  v81 = (void *)[v89 copy];
  return v81;
}

- (id)retrieveInsightsWithStartDate:(id)a3 endDate:(id)a4 insightTypeItems:(id)a5 trendWindow:(int64_t)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc(MEMORY[0x263F3C878]);
  id v14 = (void *)[v13 initWithEntity:*MEMORY[0x263F3C760]];
  uint64_t v15 = [v14 fieldsInOrder];
  v16 = objc_msgSend(v15, "subarrayWithRange:", 1, objc_msgSend(v15, "count") - 1);
  double v17 = (void *)MEMORY[0x263F3C870];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __88__FHInsightsFetcher_retrieveInsightsWithStartDate_endDate_insightTypeItems_trendWindow___block_invoke;
  v38[3] = &unk_265317CB0;
  id v18 = v10;
  id v39 = v18;
  id v19 = v11;
  id v40 = v19;
  v20 = [v17 initWithBuilder:v38];
  v21 = FinHealthLogObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v20;
    _os_log_impl(&dword_24E070000, v21, OS_LOG_TYPE_DEBUG, "databaseClauses: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__0;
  v44 = __Block_byref_object_dispose__0;
  id v45 = (id)objc_opt_new();
  objc_initWeak(&location, self);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __88__FHInsightsFetcher_retrieveInsightsWithStartDate_endDate_insightTypeItems_trendWindow___block_invoke_104;
  v33[3] = &unk_265317D00;
  objc_copyWeak(v36, &location);
  uint64_t v22 = *MEMORY[0x263F3C7D8];
  v36[1] = (id)a6;
  id v23 = v12;
  id v34 = v23;
  p_long long buf = &buf;
  [v14 queryDataWithBlock:v20 logicalOperator:v22 selectFields:v16 usingBlock:v33];
  v24 = *(void **)(*((void *)&buf + 1) + 40);
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  double v30 = __88__FHInsightsFetcher_retrieveInsightsWithStartDate_endDate_insightTypeItems_trendWindow___block_invoke_2;
  uint64_t v31 = &unk_265317D28;
  id v25 = v23;
  id v32 = v25;
  [v24 sortUsingComparator:&v28];
  id v26 = objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "copy", v28, v29, v30, v31);

  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

  return v26;
}

void __88__FHInsightsFetcher_retrieveInsightsWithStartDate_endDate_insightTypeItems_trendWindow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x263F3C738];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 addDateClause:v3 fieldName:@"features_insight_trends.trend_date" expression:v4];
  [v5 addDateClause:*MEMORY[0x263F3C740] fieldName:@"features_insight_trends.trend_date" expression:*(void *)(a1 + 40)];
}

void __88__FHInsightsFetcher_retrieveInsightsWithStartDate_endDate_insightTypeItems_trendWindow___block_invoke_104(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  id v35 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && (a4 & 1) == 0)
  {
    v7 = [v35 objectAtIndex:0];
    [v7 doubleValue];
    double v9 = v8;

    id v10 = [v35 objectAtIndex:1];
    int v11 = [v10 intValue];

    id v12 = [v35 objectAtIndex:5];
    int v13 = [v12 intValue];

    id v14 = [v35 objectAtIndex:4];
    [v14 doubleValue];
    double v16 = v15;

    double v17 = [v35 objectAtIndex:6];
    [v17 doubleValue];
    double v19 = v18;

    v20 = [v35 objectAtIndex:2];
    v21 = [v20 stringValue];

    uint64_t v22 = [v35 objectAtIndex:3];
    id v23 = [v22 stringValue];

    if (*(void *)(a1 + 56) != v13 || ![*(id *)(a1 + 32) containsObject:v23]) {
      goto LABEL_13;
    }
    uint64_t v24 = v11;
    if ([v23 isEqualToString:@"FHInsightTypeCategorySpend"])
    {
      id v25 = objc_alloc_init(FHCategorySpendInsight);
      [(FHFeatureInsight *)v25 setType:@"FHInsightTypeCategorySpend"];
      [(FHFeatureInsight *)v25 setDetectionType:2];
      [(FHFeatureInsight *)v25 setDirection:v24];
      [(FHCategorySpendInsight *)v25 setMerchantCategory:FHMerchantCategoryFromString()];
    }
    else if ([v23 isEqualToString:@"FHInsightTypeOverallSpend"])
    {
      id v25 = objc_alloc_init(FHOverallSpendInsight);
      [(FHFeatureInsight *)v25 setType:@"FHInsightTypeOverallSpend"];
      [(FHFeatureInsight *)v25 setDetectionType:2];
      [(FHFeatureInsight *)v25 setDirection:v24];
    }
    else
    {
      if (![v23 isEqualToString:@"FHInsightTypeMerchantSpend"])
      {
        if (([v23 isEqualToString:@"FHInsightTypeAggregateTag"] & 1) == 0
          && ![v23 isEqualToString:@"FHInsightTypeCompoundTag"])
        {
          goto LABEL_13;
        }
        id v25 = objc_alloc_init(FHSearchTagSpendInsight);
        [(FHFeatureInsight *)v25 setDetectionType:2];
        [(FHFeatureInsight *)v25 setDirection:v24];
        [(FHFeatureInsight *)v25 setWindow:v13];
        double v30 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v9];
        [(FHFeatureInsight *)v25 setStartDate:v30];

        uint64_t v31 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v9];
        [(FHFeatureInsight *)v25 setEndDate:v31];

        id v32 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v16];
        [(FHFeatureInsight *)v25 setSpendAmount:v32];

        double v33 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v19];
        [(FHFeatureInsight *)v25 setAverageAmount:v33];

        [(FHFeatureInsight *)v25 setCurrencyCode:@"USD"];
        if ([v23 isEqualToString:@"FHInsightTypeAggregateTag"]) {
          id v34 = @"FHInsightTypeAggregateTag";
        }
        else {
          id v34 = @"FHInsightTypeCompoundTag";
        }
        [(FHFeatureInsight *)v25 setType:v34];
LABEL_12:
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v25];

LABEL_13:
        goto LABEL_14;
      }
      id v25 = objc_alloc_init(FHMerchantSpendInsight);
      [(FHFeatureInsight *)v25 setType:@"FHInsightTypeMerchantSpend"];
      [(FHFeatureInsight *)v25 setDetectionType:2];
      [(FHFeatureInsight *)v25 setDirection:v24];
      [(FHCategorySpendInsight *)v25 setMerchantName:v21];
    }
    [(FHFeatureInsight *)v25 setWindow:v13];
    id v26 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v9];
    [(FHFeatureInsight *)v25 setStartDate:v26];

    uint64_t v27 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v9];
    [(FHFeatureInsight *)v25 setEndDate:v27];

    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v16];
    [(FHFeatureInsight *)v25 setSpendAmount:v28];

    uint64_t v29 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v19];
    [(FHFeatureInsight *)v25 setAverageAmount:v29];

    [(FHFeatureInsight *)v25 setCurrencyCode:@"USD"];
    goto LABEL_12;
  }
LABEL_14:
}

uint64_t __88__FHInsightsFetcher_retrieveInsightsWithStartDate_endDate_insightTypeItems_trendWindow___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  double v8 = [v5 type];
  unint64_t v9 = [v7 indexOfObject:v8];

  id v10 = *(void **)(a1 + 32);
  int v11 = [v6 type];
  unint64_t v12 = [v10 indexOfObject:v11];

  if (v9 != 0x7FFFFFFFFFFFFFFFLL && v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9 != v12)
    {
      uint64_t v14 = v9 > v12;
      goto LABEL_14;
    }
    double v15 = [v5 type];
    if ([v15 isEqualToString:@"FHInsightTypeCategorySpend"])
    {
      double v16 = [v6 type];
      int v17 = [v16 isEqualToString:@"FHInsightTypeCategorySpend"];

      if (v17)
      {
        uint64_t v18 = [v5 merchantCategory];
        uint64_t v14 = v18 <= [v6 merchantCategory];
        goto LABEL_14;
      }
    }
    else
    {
    }
    double v19 = [v5 spendAmount];
    v20 = [v6 spendAmount];
    uint64_t v14 = [v19 compare:v20];

    goto LABEL_14;
  }
  uint64_t v14 = 0;
LABEL_14:

  return v14;
}

- (NSDecimalNumberHandler)roundingBehavior
{
  return self->_roundingBehavior;
}

- (void)setRoundingBehavior:(id)a3
{
}

- (void).cxx_destruct
{
}

@end