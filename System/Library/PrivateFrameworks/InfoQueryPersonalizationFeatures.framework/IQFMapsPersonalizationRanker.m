@interface IQFMapsPersonalizationRanker
- (BOOL)isResultCandidateForPromotion:(id)a3;
- (IQFMapsPersonalizationRanker)init;
- (IQFMapsPersonalizationRanker)initWithVisitCountThreshold:(double)a3 lastVisitDaysThreshold:(double)a4 visitCountGivenLocationThreshold:(double)a5 entityRelevanceThreshold:(double)a6;
- (IQFMapsPersonalizationRanker)initWithVisitCountThreshold:(double)a3 lastVisitDaysThreshold:(double)a4 visitCountGivenLocationThreshold:(double)a5 entityRelevanceThreshold:(double)a6 enableEntityRelevance:(BOOL)a7;
- (double)_calendarEventScoreForResult:(id)a3;
- (double)_routineFrecencyScoreForEntityRelevanceResult:(id)a3;
- (double)_routineFrecencyScoreForLifeEvent:(id)a3;
- (double)_scoreForResult:(id)a3;
- (id)_sortedResults:(id)a3;
- (id)rankedEventsForLocations:(id)a3;
- (int64_t)_compareResult:(id)a3 toOtherResult:(id)a4;
- (void)_updateCachedMUIDs:(id)a3 rankedResults:(id)a4;
- (void)rankedEventsForLocations:(id)a3 completionHandler:(id)a4;
@end

@implementation IQFMapsPersonalizationRanker

- (IQFMapsPersonalizationRanker)init
{
  v3 = [[IQFMapsPersonalizationRanker alloc] initWithVisitCountThreshold:1 lastVisitDaysThreshold:3.0 visitCountGivenLocationThreshold:60.0 entityRelevanceThreshold:0.0 enableEntityRelevance:0.0];

  return v3;
}

- (IQFMapsPersonalizationRanker)initWithVisitCountThreshold:(double)a3 lastVisitDaysThreshold:(double)a4 visitCountGivenLocationThreshold:(double)a5 entityRelevanceThreshold:(double)a6
{
  v7 = [[IQFMapsPersonalizationRanker alloc] initWithVisitCountThreshold:1 lastVisitDaysThreshold:a3 visitCountGivenLocationThreshold:a4 entityRelevanceThreshold:a5 enableEntityRelevance:a6];

  return v7;
}

- (IQFMapsPersonalizationRanker)initWithVisitCountThreshold:(double)a3 lastVisitDaysThreshold:(double)a4 visitCountGivenLocationThreshold:(double)a5 entityRelevanceThreshold:(double)a6 enableEntityRelevance:(BOOL)a7
{
  v21.receiver = self;
  v21.super_class = (Class)IQFMapsPersonalizationRanker;
  v12 = [(IQFMapsPersonalizationRanker *)&v21 init];
  if (v12)
  {
    uint64_t v13 = objc_opt_new();
    cachedMUIDs = v12->_cachedMUIDs;
    v12->_cachedMUIDs = (NSSet *)v13;

    uint64_t v15 = objc_opt_new();
    cachedRankedResults = v12->_cachedRankedResults;
    v12->_cachedRankedResults = (NSArray *)v15;

    v12->_visitCountThreshold = a3;
    v12->_lastVisitDaysThreshold = a4;
    v12->_visitCountGivenLocationThreshold = a5;
    v12->_entityRelevanceThreshold = a6;
    v12->_enableEntityRelevance = a7;
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.infoQueryPersonalizationFeatures.geo", v17);
    caLoggingQueue = v12->_caLoggingQueue;
    v12->_caLoggingQueue = (OS_dispatch_queue *)v18;
  }
  return v12;
}

- (id)rankedEventsForLocations:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = (id)objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__IQFMapsPersonalizationRanker_rankedEventsForLocations___block_invoke;
  v9[3] = &unk_2653868C0;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  [(IQFMapsPersonalizationRanker *)self rankedEventsForLocations:v4 completionHandler:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __57__IQFMapsPersonalizationRanker_rankedEventsForLocations___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)rankedEventsForLocations:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, NSArray *, void))a4;
  v8 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = [*(id *)(*((void *)&v32 + 1) + 8 * i) muid];
        [v8 addObject:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v10);
  }

  BOOL v14 = [(NSSet *)self->_cachedMUIDs isEqualToSet:v8];
  uint64_t v15 = IQFLogCategoryDefault();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    if (v16) {
      -[IQFMapsPersonalizationRanker rankedEventsForLocations:completionHandler:]();
    }

    v7[2](v7, self->_cachedRankedResults, 0);
  }
  else
  {
    if (v16) {
      -[IQFMapsPersonalizationRanker rankedEventsForLocations:completionHandler:].cold.4();
    }

    id v17 = IQFLogCategoryDefault();
    dispatch_queue_t v18 = (char *)os_signpost_id_generate(v17);
    v19 = v17;
    v20 = v19;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_2529E5000, v20, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v18, "rankedEventsForLocations", " enableTelemetry=YES ", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    objc_super v21 = +[IQFMapsPersonalizationLookup sharedMapsPersonalizationLookup];
    if (v21)
    {
      v22 = IQFLogCategoryDefault();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[IQFMapsPersonalizationRanker rankedEventsForLocations:completionHandler:]();
      }

      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __75__IQFMapsPersonalizationRanker_rankedEventsForLocations_completionHandler___block_invoke;
      v25[3] = &unk_265386988;
      v26 = v20;
      v30[1] = v18;
      objc_copyWeak(v30, buf);
      v29 = v7;
      id v27 = v8;
      id v28 = v9;
      [v21 eventsAtLocations:v28 completionHandler:v25];

      objc_destroyWeak(v30);
      v23 = (NSArray *)v26;
    }
    else
    {
      v24 = IQFLogCategoryDefault();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[IQFMapsPersonalizationRanker rankedEventsForLocations:completionHandler:]();
      }

      v23 = (NSArray *)objc_opt_new();
      v7[2](v7, v23, 0);
    }

    objc_destroyWeak(buf);
  }
}

void __75__IQFMapsPersonalizationRanker_rankedEventsForLocations_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 72);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2529E5000, v8, OS_SIGNPOST_INTERVAL_END, v9, "rankedEventsForLocations", (const char *)&unk_2529EE612, buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v12 = [WeakRetained _sortedResults:v5];
    [v11 _updateCachedMUIDs:*(void *)(a1 + 40) rankedResults:v12];
    uint64_t v13 = IQFLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __75__IQFMapsPersonalizationRanker_rankedEventsForLocations_completionHandler___block_invoke_cold_1(v12);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    BOOL v14 = v11[8];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __75__IQFMapsPersonalizationRanker_rankedEventsForLocations_completionHandler___block_invoke_24;
    v17[3] = &unk_265386960;
    id v18 = v12;
    id v19 = *(id *)(a1 + 48);
    id v15 = v12;
    dispatch_async(v14, v17);
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 56);
    id v15 = (id)objc_opt_new();
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v15, v6);
  }
}

id __75__IQFMapsPersonalizationRanker_rankedEventsForLocations_completionHandler___block_invoke_24(uint64_t a1)
{
  return +[IQFMapsCoreAnalyticsLogger logCoreAnalyticsEventsWithResults:*(void *)(a1 + 32) locations:*(void *)(a1 + 40)];
}

- (id)_sortedResults:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__IQFMapsPersonalizationRanker__sortedResults___block_invoke;
  v5[3] = &unk_2653869B0;
  v5[4] = self;
  v3 = [a3 sortedArrayWithOptions:16 usingComparator:v5];

  return v3;
}

uint64_t __47__IQFMapsPersonalizationRanker__sortedResults___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _compareResult:a2 toOtherResult:a3];
}

- (void)_updateCachedMUIDs:(id)a3 rankedResults:(id)a4
{
  id v6 = (NSSet *)a3;
  id v7 = (NSArray *)a4;
  cachedMUIDs = self->_cachedMUIDs;
  self->_cachedMUIDs = v6;
  uint64_t v10 = v6;

  cachedRankedResults = self->_cachedRankedResults;
  self->_cachedRankedResults = v7;
}

- (BOOL)isResultCandidateForPromotion:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _isCandidateForPromotion];

  if (v5)
  {
    id v6 = [v4 _isCandidateForPromotion];
    LOBYTE(v7) = [v6 BOOLValue];
  }
  else
  {
    switch([v4 resultType])
    {
      case 0:
        uint64_t v12 = IQFLogCategoryDefault();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[IQFMapsPersonalizationRanker isResultCandidateForPromotion:](v4);
        }
        goto LABEL_24;
      case 1:
        if (self->_enableEntityRelevance)
        {
          uint64_t v12 = IQFLogCategoryDefault();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            -[IQFMapsPersonalizationRanker isResultCandidateForPromotion:]();
          }
          goto LABEL_24;
        }
        v8 = [v4 numberOfVisits];
        [v8 doubleValue];
        if (v15 < self->_visitCountThreshold) {
          goto LABEL_20;
        }
        os_signpost_id_t v9 = [v4 dateOfLastVisit];
        [v9 timeIntervalSinceNow];
        uint64_t v7 = v17 >= self->_lastVisitDaysThreshold * -86400.0;
        goto LABEL_9;
      case 2:
      case 3:
      case 5:
        v8 = [v4 startEventDate];
        if (![v8 isDateInTodayOrFuture]) {
          goto LABEL_20;
        }
        os_signpost_id_t v9 = [v4 startEventDate];
        [v9 timeIntervalSinceNow];
        double v11 = 2592000.0;
        goto LABEL_8;
      case 4:
      case 6:
      case 7:
      case 8:
      case 9:
        v8 = [v4 startEventDate];
        if (![v8 isDateInTodayOrFuture]) {
          goto LABEL_20;
        }
        os_signpost_id_t v9 = [v4 startEventDate];
        [v9 timeIntervalSinceNow];
        double v11 = 604800.0;
LABEL_8:
        uint64_t v7 = v10 < v11;
        goto LABEL_9;
      case 10:
        if (self->_enableEntityRelevance)
        {
          v8 = [v4 entityRelevanceScore];
          [v8 doubleValue];
          if (v13 < self->_entityRelevanceThreshold)
          {
LABEL_20:
            uint64_t v7 = 0;
          }
          else
          {
            os_signpost_id_t v9 = [v4 numberOfVisits];
            [v9 doubleValue];
            if (v14 >= self->_visitCountThreshold)
            {
              id v18 = [v4 dateOfLastVisit];
              [v18 timeIntervalSinceNow];
              uint64_t v7 = v19 >= self->_lastVisitDaysThreshold * -86400.0;
            }
            else
            {
              uint64_t v7 = 0;
            }
LABEL_9:
          }
        }
        else
        {
          uint64_t v12 = IQFLogCategoryDefault();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            -[IQFMapsPersonalizationRanker isResultCandidateForPromotion:]();
          }
LABEL_24:

LABEL_25:
          uint64_t v7 = 0;
        }
        [v4 setIsCandidateForPromotion:v7];
        break;
      default:
        goto LABEL_25;
    }
  }

  return v7;
}

- (double)_scoreForResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _score];
  id v6 = v5;
  if (!v5)
  {
    uint64_t v9 = [v4 resultType];
    if ((unint64_t)(v9 - 2) >= 8)
    {
      if (v9 == 1)
      {
        [(IQFMapsPersonalizationRanker *)self _routineFrecencyScoreForLifeEvent:v4];
      }
      else
      {
        double v8 = 0.0;
        if (v9 != 10) {
          goto LABEL_6;
        }
        [(IQFMapsPersonalizationRanker *)self _routineFrecencyScoreForEntityRelevanceResult:v4];
      }
    }
    else
    {
      [(IQFMapsPersonalizationRanker *)self _calendarEventScoreForResult:v4];
    }
    double v8 = v10;
LABEL_6:
    [v4 setScore:v8];
    goto LABEL_7;
  }
  [v5 doubleValue];
  double v8 = v7;
LABEL_7:

  return v8;
}

- (double)_routineFrecencyScoreForLifeEvent:(id)a3
{
  double v3 = 0.0;
  if (!self->_enableEntityRelevance)
  {
    id v4 = a3;
    id v5 = [v4 dateOfLastVisit];
    [v5 timeIntervalSinceNow];
    double v7 = v6;

    double v8 = [v4 numberOfVisits];

    [v8 doubleValue];
    double v3 = exp2(v7 / 2592000.0) * v9;
  }
  return v3;
}

- (double)_routineFrecencyScoreForEntityRelevanceResult:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_enableEntityRelevance)
  {
    if (self->_entityRelevanceThreshold <= 0.0) {
      [v4 numberOfVisits];
    }
    else {
    double v7 = [v4 entityRelevanceScore];
    }
    [v7 doubleValue];
    double v6 = v8;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (double)_calendarEventScoreForResult:(id)a3
{
  id v3 = a3;
  id v4 = [v3 startEventDate];
  [v4 timeIntervalSinceNow];
  double v6 = v5;

  if (v6 >= 0.0) {
    goto LABEL_3;
  }
  double v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  double v8 = [v3 startEventDate];
  int v9 = [v7 isDateInToday:v8];

  double v10 = 0.0;
  if (v9) {
LABEL_3:
  }
    double v10 = exp2(fabs(v6) / -2592000.0);

  return v10;
}

- (int64_t)_compareResult:(id)a3 toOtherResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(IQFMapsPersonalizationRanker *)self isResultCandidateForPromotion:v6];
  if (v8 == [(IQFMapsPersonalizationRanker *)self isResultCandidateForPromotion:v7])
  {
    if (isCalendarBasedPersonalizationResultType([v6 resultType])
      || !isCalendarBasedPersonalizationResultType([v7 resultType]))
    {
      if (isCalendarBasedPersonalizationResultType([v6 resultType])
        && !isCalendarBasedPersonalizationResultType([v7 resultType]))
      {
        int64_t v9 = -1;
      }
      else
      {
        [(IQFMapsPersonalizationRanker *)self _scoreForResult:v6];
        double v11 = v10;
        [(IQFMapsPersonalizationRanker *)self _scoreForResult:v7];
        uint64_t v13 = -1;
        if (v11 <= v12) {
          uint64_t v13 = 1;
        }
        if (v11 == v12) {
          int64_t v9 = 0;
        }
        else {
          int64_t v9 = v13;
        }
      }
    }
    else
    {
      int64_t v9 = 1;
    }
  }
  else if ([(IQFMapsPersonalizationRanker *)self isResultCandidateForPromotion:v6])
  {
    int64_t v9 = -1;
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caLoggingQueue, 0);
  objc_storeStrong((id *)&self->_cachedRankedResults, 0);

  objc_storeStrong((id *)&self->_cachedMUIDs, 0);
}

- (void)rankedEventsForLocations:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2529E5000, v0, v1, "IQFMapsParsecRanker: using cached ranked events", v2, v3, v4, v5, v6);
}

- (void)rankedEventsForLocations:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2529E5000, v0, OS_LOG_TYPE_ERROR, "IQFMapsParsecRanker: not attempting lookup because IQFMapsPersonalizationLookup is nil", v1, 2u);
}

- (void)rankedEventsForLocations:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2529E5000, v0, v1, "IQFMapsParsecRanker: looking up events at location", v2, v3, v4, v5, v6);
}

- (void)rankedEventsForLocations:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2529E5000, v0, v1, "IQFMapsParsecRanker: no cached result for these muids", v2, v3, v4, v5, v6);
}

void __75__IQFMapsPersonalizationRanker_rankedEventsForLocations_completionHandler___block_invoke_cold_1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_2_0(&dword_2529E5000, v1, v2, "IQFMapsParsecRanker: fetched %ld new ranked events & updated cache", v3, v4, v5, v6, 0);
}

- (void)isResultCandidateForPromotion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2529E5000, v0, v1, "IQFMapsPersonalizationRanker: Life event is not eligible as candidate for promotion because _enableEntityRelevance = YES", v2, v3, v4, v5, v6);
}

- (void)isResultCandidateForPromotion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2529E5000, v0, v1, "IQFMapsPersonalizationRanker: Entity relevance event is not eligible as candidate for promotion because _enableEntityRelevance = NO", v2, v3, v4, v5, v6);
}

- (void)isResultCandidateForPromotion:(void *)a1 .cold.3(void *a1)
{
  [a1 resultType];
  OUTLINED_FUNCTION_2_0(&dword_2529E5000, v1, v2, "IQFMapsPersonalizationRanker received unknown result type: %lu", v3, v4, v5, v6, 0);
}

@end