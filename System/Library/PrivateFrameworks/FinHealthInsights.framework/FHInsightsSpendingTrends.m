@interface FHInsightsSpendingTrends
+ (id)_defaultQueue;
+ (void)overrideMonthlyFillFactor;
+ (void)overrideWeeklyFillFactor;
+ (void)setThresholdsWithWeeklyThreshold:(double)a3 monthlyThreshold:(double)a4;
- (FHDatabaseEntity)insightsDestinationEntity;
- (FHDatabaseEntity)transactionAndFeauturesEntities;
- (FHInsightsSpendingTrends)initWithMerchantCounts:(id)a3;
- (FHInsightsSpendingTrends)initWithWeeklyThreshold:(double)a3 monthlyThreshold:(double)a4 merchantCounts:(id)a5;
- (FHInsightsSpendingTrends)trendsWithCompletion:(id)a3;
- (NSDictionary)merchantCounts;
- (OS_dispatch_queue)insightsProcessingQueue;
- (double)_fillFactorWithStartOfPeriodForMostRecentEntryDate:(id)a3 mostRecentEntryDate:(id)a4 endOfPeriodForMostRecentEntryDate:(id)a5 numberOfDaysSinceFirstTransaction:(unint64_t)a6 transactionCount:(unint64_t)a7 transactionCountForMostRecentPeriod:(unint64_t)a8 transactionAmountSums:(double)a9 transactionAmountSumsForMostRecentPeriod:(double)a10;
- (double)monthlyThreshold;
- (double)weeklyThreshold;
- (id)_kendallCoefficientWithIndexedAmountSums:(id)a3;
- (id)_orderedTimeStampAndAmountPair:(id)a3;
- (void)_computeAndStoreTrend:(id)a3 indexedAmountSums:(id)a4 insightFeatureName:(id)a5 insightType:(id)a6 trendWindow:(int64_t)a7;
- (void)_computeCategoryAndMerchantTrends;
- (void)setInsightsDestinationEntity:(id)a3;
- (void)setMerchantCounts:(id)a3;
- (void)setTransactionAndFeauturesEntities:(id)a3;
@end

@implementation FHInsightsSpendingTrends

- (FHInsightsSpendingTrends)initWithWeeklyThreshold:(double)a3 monthlyThreshold:(double)a4 merchantCounts:(id)a5
{
  id v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)FHInsightsSpendingTrends;
  v10 = [(FHInsightsSpendingTrends *)&v24 init];
  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F3C878]);
    uint64_t v12 = objc_msgSend(v11, "initWithJoinKey:entities:", *MEMORY[0x263F3C828], *MEMORY[0x263F3C838], *MEMORY[0x263F3C820], 0);
    transactionAndFeauturesEntities = v10->_transactionAndFeauturesEntities;
    v10->_transactionAndFeauturesEntities = (FHDatabaseEntity *)v12;

    id v14 = objc_alloc(MEMORY[0x263F3C878]);
    uint64_t v15 = [v14 initWithEntity:*MEMORY[0x263F3C760]];
    insightsDestinationEntity = v10->_insightsDestinationEntity;
    v10->_insightsDestinationEntity = (FHDatabaseEntity *)v15;

    uint64_t v17 = [(id)objc_opt_class() _defaultQueue];
    insightsProcessingQueue = v10->_insightsProcessingQueue;
    v10->_insightsProcessingQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v10->_merchantCounts, a5);
    BOOL v19 = a3 > 1.0 || a3 < -1.0;
    double v20 = *(double *)&defaultWeeklyThreshold;
    if (!v19) {
      double v20 = a3;
    }
    BOOL v21 = a4 > 1.0 || a4 < -1.0;
    double v22 = *(double *)&defaultMonthlyThreshold;
    if (!v21) {
      double v22 = a4;
    }
    v10->_weeklyThreshold = v20;
    v10->_monthlyThreshold = v22;
  }

  return v10;
}

- (FHInsightsSpendingTrends)initWithMerchantCounts:(id)a3
{
  return [(FHInsightsSpendingTrends *)self initWithWeeklyThreshold:a3 monthlyThreshold:*(double *)&defaultWeeklyThreshold merchantCounts:*(double *)&defaultMonthlyThreshold];
}

- (FHInsightsSpendingTrends)trendsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  insightsProcessingQueue = self->_insightsProcessingQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__FHInsightsSpendingTrends_trendsWithCompletion___block_invoke;
  v8[3] = &unk_265317B00;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_sync(insightsProcessingQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return result;
}

void __49__FHInsightsSpendingTrends_trendsWithCompletion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [WeakRetained[2] clearData];
    [*(id *)(a1 + 32) _computeCategoryAndMerchantTrends];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_computeCategoryAndMerchantTrends
{
  uint64_t v159 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_insightsProcessingQueue);
  v49 = [MEMORY[0x263F3C870] initWithBuilder:&__block_literal_global];
  uint64_t v151 = 0;
  v152 = &v151;
  uint64_t v153 = 0x3032000000;
  v154 = __Block_byref_object_copy_;
  v155 = __Block_byref_object_dispose_;
  id v156 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v145 = 0;
  v146 = &v145;
  uint64_t v147 = 0x3032000000;
  v148 = __Block_byref_object_copy_;
  v149 = __Block_byref_object_dispose_;
  id v150 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v139 = 0;
  v140 = &v139;
  uint64_t v141 = 0x3032000000;
  v142 = __Block_byref_object_copy_;
  v143 = __Block_byref_object_dispose_;
  id v144 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v133 = 0;
  v134 = &v133;
  uint64_t v135 = 0x3032000000;
  v136 = __Block_byref_object_copy_;
  v137 = __Block_byref_object_dispose_;
  id v138 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v127 = 0;
  v128 = &v127;
  uint64_t v129 = 0x3032000000;
  v130 = __Block_byref_object_copy_;
  v131 = __Block_byref_object_dispose_;
  id v132 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x3032000000;
  v124 = __Block_byref_object_copy_;
  v125 = __Block_byref_object_dispose_;
  id v126 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x3032000000;
  v118 = __Block_byref_object_copy_;
  v119 = __Block_byref_object_dispose_;
  id v120 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v109 = 0;
  v110 = &v109;
  uint64_t v111 = 0x3032000000;
  v112 = __Block_byref_object_copy_;
  v113 = __Block_byref_object_dispose_;
  id v114 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x3032000000;
  v106 = __Block_byref_object_copy_;
  v107 = __Block_byref_object_dispose_;
  id v108 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x3032000000;
  v100 = __Block_byref_object_copy_;
  v101 = __Block_byref_object_dispose_;
  id v102 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x2020000000;
  uint64_t v96 = 0;
  uint64_t v89 = 0;
  v90 = (double *)&v89;
  uint64_t v91 = 0x2020000000;
  uint64_t v92 = 0;
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x2020000000;
  uint64_t v88 = 0;
  uint64_t v81 = 0;
  v82 = (double *)&v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  uint64_t v80 = 0;
  uint64_t v73 = 0;
  v74 = (double *)&v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  uint64_t v72 = 0;
  v3 = [MEMORY[0x263EFF910] distantPast];
  [v3 timeIntervalSinceReferenceDate];
  uint64_t v5 = v4;

  uint64_t v72 = v5;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  uint64_t v70 = 0;
  id v6 = [MEMORY[0x263EFF910] distantPast];
  [v6 timeIntervalSinceReferenceDate];
  uint64_t v8 = v7;

  uint64_t v70 = v8;
  uint64_t v65 = 0;
  v66 = (double *)&v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  id v9 = [MEMORY[0x263EFF910] distantPast];
  [v9 timeIntervalSinceReferenceDate];
  uint64_t v11 = v10;

  uint64_t v68 = v11;
  uint64_t v61 = 0;
  v62 = (double *)&v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  uint64_t v12 = [MEMORY[0x263EFF910] distantFuture];
  [v12 timeIntervalSinceReferenceDate];
  uint64_t v14 = v13;

  uint64_t v64 = v14;
  objc_initWeak(&location, self);
  transactionAndFeauturesEntities = self->_transactionAndFeauturesEntities;
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_106;
  v58[3] = &unk_265317B48;
  objc_copyWeak(&v59, &location);
  uint64_t v16 = *MEMORY[0x263F3C7D8];
  v58[4] = &v61;
  v58[5] = &v65;
  v58[6] = v69;
  v58[7] = &v77;
  v58[8] = &v73;
  v58[9] = &v81;
  v58[10] = &v151;
  v58[11] = &v103;
  v58[12] = v71;
  v58[13] = &v93;
  v58[14] = &v89;
  v58[15] = &v127;
  v58[16] = &v97;
  v58[17] = &v145;
  v58[18] = &v121;
  v58[19] = &v139;
  v58[20] = &v115;
  v58[21] = &v133;
  v58[22] = &v109;
  v58[23] = &v85;
  [(FHDatabaseEntity *)transactionAndFeauturesEntities queryDataWithBlock:v49 logicalOperator:v16 selectFields:&unk_27002A3C0 usingBlock:v58];
  uint64_t v17 = [MEMORY[0x263EFF910] now];
  v18 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v62[3]];
  BOOL v19 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v66[3]];
  v48 = FHDateStartOfWeekOnMonday();
  v47 = FHDateEndOfWeekStartingOnMonday();
  v46 = FHDateStartOfMonth();
  double v20 = FHDateEndOfMonth();
  uint64_t v21 = FHNumberOfDaysBetweenDates();
  if (defaultWeeklyFillFactorStatus)
  {
    BOOL v22 = 1;
  }
  else if (FHIsDateBetweenDates() && v86[3] && v78[3])
  {
    -[FHInsightsSpendingTrends _fillFactorWithStartOfPeriodForMostRecentEntryDate:mostRecentEntryDate:endOfPeriodForMostRecentEntryDate:numberOfDaysSinceFirstTransaction:transactionCount:transactionCountForMostRecentPeriod:transactionAmountSums:transactionAmountSumsForMostRecentPeriod:](self, "_fillFactorWithStartOfPeriodForMostRecentEntryDate:mostRecentEntryDate:endOfPeriodForMostRecentEntryDate:numberOfDaysSinceFirstTransaction:transactionCount:transactionCountForMostRecentPeriod:transactionAmountSums:transactionAmountSumsForMostRecentPeriod:", v48, v19, v47, v21, v82[3], v74[3]);
    double v24 = v23;
    BOOL v22 = v23 >= *MEMORY[0x263F3C780];
    v25 = FinHealthLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v158 = v24;
      _os_log_impl(&dword_24E070000, v25, OS_LOG_TYPE_DEBUG, "weeklyFillFactor: %f", buf, 0xCu);
    }
  }
  else
  {
    BOOL v22 = 0;
  }
  if (defaultMonthlyFillFactorStatus)
  {
    BOOL v26 = 1;
    if (!v22) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (!FHIsDateBetweenDates() || !v86[3] || !v94[3])
  {
    BOOL v26 = 0;
    if (!v22) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  -[FHInsightsSpendingTrends _fillFactorWithStartOfPeriodForMostRecentEntryDate:mostRecentEntryDate:endOfPeriodForMostRecentEntryDate:numberOfDaysSinceFirstTransaction:transactionCount:transactionCountForMostRecentPeriod:transactionAmountSums:transactionAmountSumsForMostRecentPeriod:](self, "_fillFactorWithStartOfPeriodForMostRecentEntryDate:mostRecentEntryDate:endOfPeriodForMostRecentEntryDate:numberOfDaysSinceFirstTransaction:transactionCount:transactionCountForMostRecentPeriod:transactionAmountSums:transactionAmountSumsForMostRecentPeriod:", v46, v19, v20, v21, v82[3], v90[3]);
  double v28 = v27;
  BOOL v26 = v27 >= *MEMORY[0x263F3C770];
  v29 = FinHealthLogObject();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v158 = v28;
    _os_log_impl(&dword_24E070000, v29, OS_LOG_TYPE_DEBUG, "monthlyFillFactor: %f", buf, 0xCu);
  }

  if (v22)
  {
LABEL_21:
    v30 = (void *)v152[5];
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_114;
    v57[3] = &unk_265317B70;
    v57[4] = self;
    [v30 enumerateKeysAndObjectsUsingBlock:v57];
    v31 = (void *)v146[5];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_2;
    v56[3] = &unk_265317B70;
    v56[4] = self;
    [v31 enumerateKeysAndObjectsUsingBlock:v56];
    v32 = (void *)[(id)v104[5] copy];
    v33 = [(FHInsightsSpendingTrends *)self _orderedTimeStampAndAmountPair:v32];

    v34 = [v33 firstObject];
    v35 = [v33 lastObject];
    [(FHInsightsSpendingTrends *)self _computeAndStoreTrend:v34 indexedAmountSums:v35 insightFeatureName:@"Overall Spend" insightType:@"FHInsightTypeOverallSpend" trendWindow:1];

    v36 = (void *)v140[5];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_3;
    v55[3] = &unk_265317B70;
    v55[4] = self;
    [v36 enumerateKeysAndObjectsUsingBlock:v55];
    v37 = (void *)v134[5];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_4;
    v54[3] = &unk_265317B70;
    v54[4] = self;
    [v37 enumerateKeysAndObjectsUsingBlock:v54];
  }
LABEL_22:
  if (v26)
  {
    v38 = (void *)v128[5];
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_5;
    v53[3] = &unk_265317B70;
    v53[4] = self;
    [v38 enumerateKeysAndObjectsUsingBlock:v53];
    v39 = (void *)v122[5];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_6;
    v52[3] = &unk_265317B70;
    v52[4] = self;
    [v39 enumerateKeysAndObjectsUsingBlock:v52];
    v40 = (void *)[(id)v98[5] copy];
    v41 = [(FHInsightsSpendingTrends *)self _orderedTimeStampAndAmountPair:v40];

    v42 = [v41 firstObject];
    v43 = [v41 lastObject];
    [(FHInsightsSpendingTrends *)self _computeAndStoreTrend:v42 indexedAmountSums:v43 insightFeatureName:@"Overall Spend" insightType:@"FHInsightTypeOverallSpend" trendWindow:2];

    v44 = (void *)v116[5];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_7;
    v51[3] = &unk_265317B70;
    v51[4] = self;
    [v44 enumerateKeysAndObjectsUsingBlock:v51];
    v45 = (void *)v110[5];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_8;
    v50[3] = &unk_265317B70;
    v50[4] = self;
    [v45 enumerateKeysAndObjectsUsingBlock:v50];
  }
  objc_destroyWeak(&v59);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(v69, 8);
  _Block_object_dispose(v71, 8);
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v97, 8);

  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v109, 8);

  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v121, 8);

  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(&v133, 8);

  _Block_object_dispose(&v139, 8);
  _Block_object_dispose(&v145, 8);

  _Block_object_dispose(&v151, 8);
}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *MEMORY[0x263F3C730];
  id v3 = a2;
  [v3 addIntegerClause:v2 fieldName:@"transactions.t_type" expression:0];
  [v3 addIntegerClause:*MEMORY[0x263F3C738] fieldName:@"transactions.t_status" expression:0];
  [v3 addIntegerClause:*MEMORY[0x263F3C740] fieldName:@"transactions.t_status" expression:1];
  [v3 addIntegerClause:v2 fieldName:@"transactions.a_type" expression:2];
}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_106(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 192));
  if (WeakRetained && (a4 & 1) == 0)
  {
    uint64_t v8 = [v6 objectAtIndex:1];
    [v8 doubleValue];
    double v10 = v9 / 100.0;

    uint64_t v11 = [v6 objectAtIndex:2];
    [v11 doubleValue];
    double v13 = v12;

    uint64_t v14 = [v6 objectAtIndex:3];
    [v14 integerValue];
    uint64_t v15 = FHMerchantCategoryToString();

    uint64_t v16 = [v6 objectAtIndex:4];
    uint64_t v105 = [v16 stringValue];

    uint64_t v17 = [v6 objectAtIndex:5];
    v104 = [v17 stringValue];

    v18 = [v6 objectAtIndex:6];
    BOOL v19 = [v18 stringValue];

    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = fmin(*(double *)(*(void *)(*(void *)(a1 + 32) + 8)+ 24), v13);
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = fmax(*(double *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24), v13);
    uint64_t v20 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v13];
    uint64_t v96 = FHDateStartOfWeekOnMonday();
    [v96 timeIntervalSinceReferenceDate];
    double v22 = v21;
    uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
    double v24 = *(double *)(v23 + 24);
    if (v22 <= v24)
    {
      if (v22 == v24)
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v10
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                + 24);
      }
    }
    else
    {
      *(double *)(v23 + 24) = v22;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v10;
    }
    *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v10
                                                                + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                            + 24);
    id v108 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v22];
    v25 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) objectForKey:v15];
    BOOL v26 = v25;
    if (v25) {
      id v27 = v25;
    }
    else {
      id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    double v28 = v27;

    [v28 setOrAddToDoubleValue:v108 forKey:v10];
    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setOrAddToDoubleValue:v108 forKey:v10];
    uint64_t v103 = v28;
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setObject:v28 forKey:v15];
    v29 = FHDateStartOfMonth();
    [v29 timeIntervalSinceReferenceDate];
    double v31 = v30;
    uint64_t v32 = *(void *)(*(void *)(a1 + 96) + 8);
    double v33 = *(double *)(v32 + 24);
    uint64_t v97 = (void *)v20;
    id v98 = v6;
    uint64_t v95 = v29;
    if (v31 <= v33)
    {
      if (v31 == v33)
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
        *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = v10
                                                                     + *(double *)(*(void *)(*(void *)(a1 + 112)
                                                                                             + 8)
                                                                                 + 24);
      }
    }
    else
    {
      *(double *)(v32 + 24) = v31;
      *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
      *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = v10;
    }
    v34 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v31];
    v35 = [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) objectForKey:v15];
    v36 = v35;
    if (v35) {
      id v37 = v35;
    }
    else {
      id v37 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    v38 = v37;

    [v38 setOrAddToDoubleValue:v34 forKey:v10];
    [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) setOrAddToDoubleValue:v34 forKey:v10];
    [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) setObject:v38 forKey:v15];
    v39 = [WeakRetained[3] objectForKey:v105];
    unint64_t v40 = [v39 integerValue];
    unint64_t v41 = *MEMORY[0x263F3C768];

    if (v40 > v41)
    {
      v42 = [*(id *)(*(void *)(*(void *)(a1 + 136) + 8) + 40) objectForKey:v105];
      v43 = v42;
      v44 = v19;
      if (v42) {
        id v45 = v42;
      }
      else {
        id v45 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      v46 = v45;

      [v46 setOrAddToDoubleValue:v108 forKey:v10];
      [*(id *)(*(void *)(*(void *)(a1 + 136) + 8) + 40) setObject:v46 forKey:v105];
      v47 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) objectForKey:v105];
      v48 = v47;
      if (v47) {
        id v49 = v47;
      }
      else {
        id v49 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      v50 = v49;

      [v50 setOrAddToDoubleValue:v34 forKey:v10];
      [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) setObject:v50 forKey:v105];

      BOOL v19 = v44;
    }
    v51 = v103;
    v52 = v104;
    v100 = v15;
    v101 = WeakRetained;
    uint64_t v99 = v19;
    id v102 = v38;
    if (v104)
    {
      v94 = [v104 componentsSeparatedByString:*MEMORY[0x263F3C818]];
      v53 = objc_msgSend(MEMORY[0x263F3C908], "reconstructAggregateFeaturesWithProcessingWindow:");
      v54 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF.%K == %@ OR SELF.%K == %@", *MEMORY[0x263F3C728], *MEMORY[0x263F3C808], *MEMORY[0x263F3C728], *MEMORY[0x263F3C800]];
      uint64_t v93 = v53;
      v55 = [v53 filteredArrayUsingPredicate:v54];

      if ([v55 count])
      {
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        uint64_t v92 = v55;
        obuint64_t j = v55;
        uint64_t v56 = [obj countByEnumeratingWithState:&v113 objects:v118 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v58 = *(void *)v114;
          do
          {
            for (uint64_t i = 0; i != v57; ++i)
            {
              if (*(void *)v114 != v58) {
                objc_enumerationMutation(obj);
              }
              v60 = *(void **)(*((void *)&v113 + 1) + 8 * i);
              uint64_t v61 = *(void **)(*(void *)(*(void *)(a1 + 152) + 8) + 40);
              v62 = [v60 name];
              uint64_t v63 = [v61 objectForKey:v62];
              uint64_t v64 = v63;
              if (v63) {
                id v65 = v63;
              }
              else {
                id v65 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              }
              v66 = v65;

              [v66 setOrAddToDoubleValue:v108 forKey:v10];
              uint64_t v67 = *(void **)(*(void *)(*(void *)(a1 + 152) + 8) + 40);
              uint64_t v68 = [v60 name];
              [v67 setObject:v66 forKey:v68];

              v69 = *(void **)(*(void *)(*(void *)(a1 + 160) + 8) + 40);
              uint64_t v70 = [v60 name];
              v71 = [v69 objectForKey:v70];
              uint64_t v72 = v71;
              if (v71) {
                id v73 = v71;
              }
              else {
                id v73 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              }
              v74 = v73;

              [v74 setOrAddToDoubleValue:v34 forKey:v10];
              uint64_t v75 = *(void **)(*(void *)(*(void *)(a1 + 160) + 8) + 40);
              uint64_t v76 = [v60 name];
              [v75 setObject:v74 forKey:v76];
            }
            uint64_t v57 = [obj countByEnumeratingWithState:&v113 objects:v118 count:16];
          }
          while (v57);
        }

        uint64_t v15 = v100;
        WeakRetained = v101;
        v51 = v103;
        v52 = v104;
        BOOL v19 = v99;
        v38 = v102;
        v55 = v92;
      }
    }
    if (v19)
    {
      id obja = [MEMORY[0x263F3C908] reconstructCompoundFeatures:v19];
      uint64_t v77 = [obja objectForKey:*MEMORY[0x263F3C810]];
      v78 = v77;
      if (v77)
      {
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        uint64_t v79 = [v77 countByEnumeratingWithState:&v109 objects:v117 count:16];
        if (v79)
        {
          uint64_t v80 = v79;
          uint64_t v81 = *(void *)v110;
          do
          {
            for (uint64_t j = 0; j != v80; ++j)
            {
              if (*(void *)v110 != v81) {
                objc_enumerationMutation(v78);
              }
              uint64_t v83 = [*(id *)(*((void *)&v109 + 1) + 8 * j) featureLabel];
              uint64_t v84 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectForKey:v83];
              uint64_t v85 = v84;
              if (v84) {
                id v86 = v84;
              }
              else {
                id v86 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              }
              uint64_t v87 = v86;

              [v87 setOrAddToDoubleValue:v108 forKey:v10];
              [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) setObject:v87 forKey:v83];
              uint64_t v88 = [*(id *)(*(void *)(*(void *)(a1 + 176) + 8) + 40) objectForKey:v83];
              uint64_t v89 = v88;
              if (v88) {
                id v90 = v88;
              }
              else {
                id v90 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              }
              uint64_t v91 = v90;

              [v91 setOrAddToDoubleValue:v34 forKey:v10];
              [*(id *)(*(void *)(*(void *)(a1 + 176) + 8) + 40) setObject:v91 forKey:v83];
            }
            uint64_t v80 = [v78 countByEnumeratingWithState:&v109 objects:v117 count:16];
          }
          while (v80);
        }
      }

      uint64_t v15 = v100;
      WeakRetained = v101;
      v51 = v103;
      v52 = v104;
      BOOL v19 = v99;
      v38 = v102;
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 184) + 8) + 24);

    id v6 = v98;
  }
}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = (void *)[a3 copy];
  id v11 = [v5 _orderedTimeStampAndAmountPair:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  double v9 = [v11 firstObject];
  double v10 = [v11 lastObject];
  [v8 _computeAndStoreTrend:v9 indexedAmountSums:v10 insightFeatureName:v6 insightType:@"FHInsightTypeCategorySpend" trendWindow:1];
}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = (void *)[a3 copy];
  id v11 = [v5 _orderedTimeStampAndAmountPair:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  double v9 = [v11 firstObject];
  double v10 = [v11 lastObject];
  [v8 _computeAndStoreTrend:v9 indexedAmountSums:v10 insightFeatureName:v6 insightType:@"FHInsightTypeMerchantSpend" trendWindow:1];
}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = (void *)[a3 copy];
  id v11 = [v5 _orderedTimeStampAndAmountPair:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  double v9 = [v11 firstObject];
  double v10 = [v11 lastObject];
  [v8 _computeAndStoreTrend:v9 indexedAmountSums:v10 insightFeatureName:v6 insightType:@"FHInsightTypeAggregateTag" trendWindow:1];
}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = (void *)[a3 copy];
  id v11 = [v5 _orderedTimeStampAndAmountPair:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  double v9 = [v11 firstObject];
  double v10 = [v11 lastObject];
  [v8 _computeAndStoreTrend:v9 indexedAmountSums:v10 insightFeatureName:v6 insightType:@"FHInsightTypeCompoundTag" trendWindow:1];
}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = (void *)[a3 copy];
  id v11 = [v5 _orderedTimeStampAndAmountPair:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  double v9 = [v11 firstObject];
  double v10 = [v11 lastObject];
  [v8 _computeAndStoreTrend:v9 indexedAmountSums:v10 insightFeatureName:v6 insightType:@"FHInsightTypeCategorySpend" trendWindow:2];
}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = (void *)[a3 copy];
  id v11 = [v5 _orderedTimeStampAndAmountPair:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  double v9 = [v11 firstObject];
  double v10 = [v11 lastObject];
  [v8 _computeAndStoreTrend:v9 indexedAmountSums:v10 insightFeatureName:v6 insightType:@"FHInsightTypeMerchantSpend" trendWindow:2];
}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = (void *)[a3 copy];
  id v11 = [v5 _orderedTimeStampAndAmountPair:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  double v9 = [v11 firstObject];
  double v10 = [v11 lastObject];
  [v8 _computeAndStoreTrend:v9 indexedAmountSums:v10 insightFeatureName:v6 insightType:@"FHInsightTypeAggregateTag" trendWindow:2];
}

void __61__FHInsightsSpendingTrends__computeCategoryAndMerchantTrends__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = (void *)[a3 copy];
  id v11 = [v5 _orderedTimeStampAndAmountPair:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  double v9 = [v11 firstObject];
  double v10 = [v11 lastObject];
  [v8 _computeAndStoreTrend:v9 indexedAmountSums:v10 insightFeatureName:v6 insightType:@"FHInsightTypeCompoundTag" trendWindow:2];
}

- (double)_fillFactorWithStartOfPeriodForMostRecentEntryDate:(id)a3 mostRecentEntryDate:(id)a4 endOfPeriodForMostRecentEntryDate:(id)a5 numberOfDaysSinceFirstTransaction:(unint64_t)a6 transactionCount:(unint64_t)a7 transactionCountForMostRecentPeriod:(unint64_t)a8 transactionAmountSums:(double)a9 transactionAmountSumsForMostRecentPeriod:(double)a10
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v16 = a5;
  id v17 = a3;
  uint64_t v18 = FHNumberOfDaysBetweenDates();
  uint64_t v19 = FHNumberOfDaysBetweenDates();

  double v20 = (a10 / (double)(unint64_t)v18 / ((double)(unint64_t)(a9 - a10) / (double)(a6 - v18))
       + (double)(unint64_t)v18 / (double)(unint64_t)v19
       + (double)a8 / (double)(unint64_t)v18 / ((double)(a7 - a8) / (double)(a6 - v18)))
      / 3.0;
  double v21 = FinHealthLogObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134217984;
    double v24 = v20;
    _os_log_impl(&dword_24E070000, v21, OS_LOG_TYPE_DEBUG, "fillFactorForPeriod: %f", (uint8_t *)&v23, 0xCu);
  }

  return v20;
}

- (id)_orderedTimeStampAndAmountPair:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v3 && [v3 count])
  {
    id v6 = [v3 allKeys];
    uint64_t v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_119];

    if (v7 && [v7 count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            [v4 addObject:v13];
            uint64_t v14 = [v3 objectForKey:v13];
            [v5 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v10);
      }
    }
  }
  uint64_t v15 = (void *)MEMORY[0x263EFF8C0];
  id v16 = (void *)[v4 copy];
  id v17 = (void *)[v5 copy];
  uint64_t v18 = objc_msgSend(v15, "arrayWithObjects:", v16, v17, 0);

  return v18;
}

uint64_t __59__FHInsightsSpendingTrends__orderedTimeStampAndAmountPair___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 lessThanOrEqual:a2];
}

- (void)_computeAndStoreTrend:(id)a3 indexedAmountSums:(id)a4 insightFeatureName:(id)a5 insightType:(id)a6 trendWindow:(int64_t)a7
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v43 = a4;
  id v41 = a5;
  int64_t v39 = a7;
  id v40 = a6;
  uint64_t v12 = 48;
  if (a7 == 1) {
    uint64_t v12 = 40;
  }
  v38 = self;
  double v13 = *(double *)((char *)&self->super.isa + v12);
  uint64_t v14 = FinHealthLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v53 = v13;
    _os_log_impl(&dword_24E070000, v14, OS_LOG_TYPE_DEBUG, "threshold: %f", buf, 0xCu);
  }

  uint64_t v15 = (unint64_t *)MEMORY[0x263F3C788];
  if (a7 != 1) {
    uint64_t v15 = (unint64_t *)MEMORY[0x263F3C778];
  }
  unint64_t v16 = *v15;
  unint64_t v17 = [v43 count];
  if (v17 >= v16)
  {
    unint64_t v18 = v17;
    unint64_t v19 = 0x263F08000uLL;
    do
    {
      long long v20 = objc_msgSend(v43, "subarrayWithRange:", v18 - v16, v16);
      long long v21 = [v42 objectAtIndex:--v18];
      [v21 doubleValue];
      uint64_t v23 = v22;

      double v24 = [MEMORY[0x263F3C910] kendallCoefficientWithIndexedAmountSums:v20];
      uint64_t v25 = (void *)[objc_alloc(*(Class *)(v19 + 1968)) initWithDouble:v13];
      char v26 = [v24 greaterThanOrEqual:v25];

      if (v26)
      {
        uint64_t v27 = 1;
      }
      else
      {
        double v28 = (void *)[objc_alloc(*(Class *)(v19 + 1968)) initWithDouble:-v13];
        char v29 = [v24 lessThanOrEqual:v28];

        if ((v29 & 1) == 0)
        {
          double v30 = FinHealthLogObject();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            double v53 = *(double *)&v41;
            __int16 v54 = 2112;
            id v55 = v40;
            _os_log_impl(&dword_24E070000, v30, OS_LOG_TYPE_DEBUG, "No trend detected for %@: %@", buf, 0x16u);
          }
          goto LABEL_15;
        }
        uint64_t v27 = 2;
      }
      double v30 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v20, 0);
      double v31 = [MEMORY[0x263F087F0] expressionWithFormat:@"average(%@)" argumentArray:v30];
      uint64_t v32 = [v31 expressionValueWithObject:0 context:0];
      double v33 = [v20 lastObject];
      v34 = (void *)MEMORY[0x263F3C880];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __111__FHInsightsSpendingTrends__computeAndStoreTrend_indexedAmountSums_insightFeatureName_insightType_trendWindow___block_invoke;
      v44[3] = &unk_265317BB8;
      uint64_t v49 = v23;
      uint64_t v50 = v27;
      id v45 = v41;
      id v46 = v40;
      id v47 = v32;
      int64_t v51 = v39;
      id v48 = v33;
      id v35 = v33;
      id v36 = v32;
      id v37 = [v34 initWithBuilder:v44];
      [(FHDatabaseEntity *)v38->_insightsDestinationEntity insertOrUpdate:v37 upsert:0];

      unint64_t v19 = 0x263F08000;
LABEL_15:
    }
    while (v18 >= v16);
  }
}

void __111__FHInsightsSpendingTrends__computeAndStoreTrend_indexedAmountSums_insightFeatureName_insightType_trendWindow___block_invoke(double *a1, void *a2)
{
  double v3 = a1[8];
  id v4 = a2;
  [v4 addDoubleValueForField:@"features_insight_trends.trend_date" fieldValue:v3];
  [v4 addIntegerValueForField:@"features_insight_trends.trend_direction" fieldValue:*((void *)a1 + 9)];
  [v4 addStringValueForField:@"features_insight_trends.trend_feature_name" fieldValue:*((void *)a1 + 4)];
  [v4 addStringValueForField:@"features_insight_trends.trend_feature_type" fieldValue:*((void *)a1 + 5)];
  [v4 addIntegerValueForField:@"features_insight_trends.trend_window" fieldValue:*((void *)a1 + 10)];
  [v4 addNumberValueForField:@"features_insight_trends.trend_average" fieldValue:*((void *)a1 + 6)];
  [v4 addDecimalNumberValueForField:@"features_insight_trends.trend_spend" fieldValue:*((void *)a1 + 7)];
  id v5 = @"Downward";
  if (*((void *)a1 + 9) == 1) {
    id v5 = @"Upward";
  }
  id v6 = @"monthly";
  if (*((void *)a1 + 10) == 1) {
    id v6 = @"weekly";
  }
  id v7 = [NSString stringWithFormat:@"%@ %@ trend for feature %@, type %@", v5, v6, *((void *)a1 + 4), *((void *)a1 + 5)];
  [v4 addStringValueForField:@"features_insight_trends.trend_readable_description" fieldValue:v7];
}

- (id)_kendallCoefficientWithIndexedAmountSums:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3 || (unint64_t)[v3 count] < 2) {
    goto LABEL_14;
  }
  if ([v4 count] == 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    unint64_t v7 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    do
    {
      for (unint64_t i = v7; i < [v4 count]; ++i)
      {
        uint64_t v9 = [v4 objectAtIndex:v7];
        uint64_t v10 = [v4 objectAtIndex:i];
        int v11 = [v9 lessThan:v10];

        if (v11)
        {
          ++v5;
        }
        else
        {
          uint64_t v12 = [v4 objectAtIndex:v7];
          double v13 = [v4 objectAtIndex:i];
          unsigned int v14 = [v12 greaterThan:v13];

          v6 += v14;
        }
      }
      ++v7;
    }
    while (v7 < [v4 count] - 1);
  }
  if (v6 + v5) {
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:(double)(v5 - v6) / (double)(v6 + v5)];
  }
  else {
LABEL_14:
  }
    uint64_t v15 = 0;

  return v15;
}

+ (id)_defaultQueue
{
  if (_defaultQueue_onceToken != -1) {
    dispatch_once(&_defaultQueue_onceToken, &__block_literal_global_166);
  }
  uint64_t v2 = (void *)_defaultQueue_defaultQueue;

  return v2;
}

uint64_t __41__FHInsightsSpendingTrends__defaultQueue__block_invoke()
{
  _defaultQueue_defaultQueue = (uint64_t)dispatch_queue_create("com.apple.finhealth.insights", 0);

  return MEMORY[0x270F9A758]();
}

+ (void)setThresholdsWithWeeklyThreshold:(double)a3 monthlyThreshold:(double)a4
{
  defaultWeeklyThreshold = *(void *)&a3;
  defaultMonthlyThreshold = *(void *)&a4;
}

+ (void)overrideWeeklyFillFactor
{
  defaultWeeklyFillFactorStatus = 1;
}

+ (void)overrideMonthlyFillFactor
{
  defaultMonthlyFillFactorStatus = 1;
}

- (FHDatabaseEntity)transactionAndFeauturesEntities
{
  return self->_transactionAndFeauturesEntities;
}

- (void)setTransactionAndFeauturesEntities:(id)a3
{
}

- (FHDatabaseEntity)insightsDestinationEntity
{
  return self->_insightsDestinationEntity;
}

- (void)setInsightsDestinationEntity:(id)a3
{
}

- (NSDictionary)merchantCounts
{
  return self->_merchantCounts;
}

- (void)setMerchantCounts:(id)a3
{
}

- (OS_dispatch_queue)insightsProcessingQueue
{
  return self->_insightsProcessingQueue;
}

- (double)weeklyThreshold
{
  return self->_weeklyThreshold;
}

- (double)monthlyThreshold
{
  return self->_monthlyThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insightsProcessingQueue, 0);
  objc_storeStrong((id *)&self->_merchantCounts, 0);
  objc_storeStrong((id *)&self->_insightsDestinationEntity, 0);

  objc_storeStrong((id *)&self->_transactionAndFeauturesEntities, 0);
}

@end