@interface FAFamilyPeopleSuggesterSuggester
- (id)getFamilyRecommendationsWithContext:(id *)a3 error:(id *)a4;
- (int64_t)proactiveModel;
@end

@implementation FAFamilyPeopleSuggesterSuggester

- (int64_t)proactiveModel
{
  return 2;
}

- (id)getFamilyRecommendationsWithContext:(id *)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v4 = _FASignpostLogSystem();
  os_signpost_id_t v5 = _FASignpostCreate(v4);
  uint64_t v34 = v6;

  v7 = _FASignpostLogSystem();
  v8 = v7;
  unint64_t v33 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D252C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PeopleSuggesterFetchRecommendation", "", buf, 2u);
  }

  v9 = _FASignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[FAFamilyPeopleSuggesterSuggester getFamilyRecommendationsWithContext:error:](v5, v9);
  }

  v10 = _FALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D252C000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to get Family suggestions from PeopleSuggester", buf, 2u);
  }
  os_signpost_id_t v35 = v5;

  v11 = [MEMORY[0x1E4F89CA8] suggesterWithDaemon];
  id v12 = objc_alloc_init(MEMORY[0x1E4F89C98]);
  v13 = +[FAPeopleDiscoveryService sharedInstance];
  v14 = [v13 getNearbyPeople];
  v15 = [v14 allObjects];

  [v12 setSeedContactIdentifiers:v15];
  v16 = [v11 familyRecommendationSuggestionsWithPredictionContext:v12];
  v17 = _FALogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v16;
    _os_log_impl(&dword_1D252C000, v17, OS_LOG_TYPE_DEFAULT, "Loaded family PeopleSuggester suggestions. %@", buf, 0xCu);
  }

  v18 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v19 = v16;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "recipients", v33, v34);
        v25 = [v24 firstObject];

        if (v25)
        {
          v26 = [[FARecommendedFamilyMember alloc] initWithPeopleSuggesterRecommendation:v25];
          [v18 addObject:v26];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v21);
  }

  unint64_t Nanoseconds = _FASignpostGetNanoseconds(v35, v34);
  v28 = _FASignpostLogSystem();
  v29 = v28;
  if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D252C000, v29, OS_SIGNPOST_INTERVAL_END, v35, "PeopleSuggesterFetchRecommendation", "", buf, 2u);
  }

  v30 = _FASignpostLogSystem();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    -[FAFamilyPeopleSuggesterSuggester getFamilyRecommendationsWithContext:error:](v35, v30, (double)Nanoseconds / 1000000000.0);
  }

  if (a3) {
    *a3 = [[FAFamilySuggesterFeedbackContext alloc] initWithPredictionContext:v12 suggestions:v19];
  }
  if (a4) {
    *a4 = 0;
  }
  v31 = objc_msgSend(v18, "copy", v33);

  return v31;
}

- (void)getFamilyRecommendationsWithContext:(double)a3 error:.cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_1D252C000, a2, OS_LOG_TYPE_DEBUG, "END [%lld] %fs:PeopleSuggesterFetchRecommendation ", (uint8_t *)&v3, 0x16u);
}

- (void)getFamilyRecommendationsWithContext:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D252C000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: PeopleSuggesterFetchRecommendation ", (uint8_t *)&v2, 0xCu);
}

@end