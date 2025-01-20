@interface FAFamilyMegadomeSuggester
- (FAFamilyMegadomeSuggester)init;
- (FAFamilyMegadomeSuggester)initWithRecommendationLoader:(id)a3;
- (FAMegadomeRecommendationLoading)recommendationLoader;
- (id)getFamilyRecommendationsWithContext:(id *)a3 error:(id *)a4;
- (id)peopleNotAlreadyInFamilyInPersonArray:(id)a3;
- (id)recommendedFamilyMembersForMegadomeResults:(id)a3;
- (int64_t)proactiveModel;
- (void)setRecommendationLoader:(id)a3;
@end

@implementation FAFamilyMegadomeSuggester

- (FAFamilyMegadomeSuggester)init
{
  v3 = objc_alloc_init(FAMegadomeRecommendationsLoader);
  v4 = [(FAFamilyMegadomeSuggester *)self initWithRecommendationLoader:v3];

  return v4;
}

- (FAFamilyMegadomeSuggester)initWithRecommendationLoader:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFamilyMegadomeSuggester;
  v6 = [(FAFamilyMegadomeSuggester *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_recommendationLoader, a3);
  }

  return v7;
}

- (int64_t)proactiveModel
{
  return 3;
}

- (id)getFamilyRecommendationsWithContext:(id *)a3 error:(id *)a4
{
  v7 = _FASignpostLogSystem();
  os_signpost_id_t v8 = _FASignpostCreate(v7);
  uint64_t v10 = v9;

  v11 = _FASignpostLogSystem();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D252C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MegadomeFetchRecommendation", "", buf, 2u);
  }

  v13 = _FASignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[FAFamilyMegadomeSuggester getFamilyRecommendationsWithContext:error:](v8, v13);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__FAFamilyMegadomeSuggester_getFamilyRecommendationsWithContext_error___block_invoke;
  aBlock[3] = &__block_descriptor_64_e54_v24__0__NSError_8__FAFamilySuggesterFeedbackContext_16l;
  aBlock[4] = v8;
  aBlock[5] = v10;
  aBlock[6] = a3;
  aBlock[7] = a4;
  v14 = (void (**)(void *, void, FAFamilySuggesterFeedbackContext *))_Block_copy(aBlock);
  v15 = _FALogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D252C000, v15, OS_LOG_TYPE_DEFAULT, "Attempting to get Family suggestions from Megadome", buf, 2u);
  }

  v16 = [(FAFamilyMegadomeSuggester *)self recommendationLoader];
  id v32 = 0;
  v17 = [v16 peopleViewWithError:&v32];
  id v18 = v32;

  if (v17)
  {
    v19 = [(FAFamilyMegadomeSuggester *)self recommendationLoader];
    id v31 = 0;
    v20 = [v19 megadomeResultsForFamilyTagWithError:&v31];
    id v21 = v31;

    if (v20)
    {
      v22 = [(FAFamilyMegadomeSuggester *)self recommendationLoader];
      v23 = [v20 scoredEntities];
      v24 = [v22 megadomePeopleFromScoredEntities:v23 inVisualIdentifierView:v17];

      v25 = [(FAFamilyMegadomeSuggester *)self peopleNotAlreadyInFamilyInPersonArray:v24];
      v26 = [(FAFamilyMegadomeSuggester *)self recommendedFamilyMembersForMegadomeResults:v25];
      v27 = -[FAFamilySuggesterFeedbackContext initWithMegadomeFeedbackEventID:]([FAFamilySuggesterFeedbackContext alloc], "initWithMegadomeFeedbackEventID:", [v20 feedbackEventId]);
      v14[2](v14, 0, v27);
    }
    else
    {
      v29 = _FALogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[FAFamilyMegadomeSuggester getFamilyRecommendationsWithContext:error:]((uint64_t)v21, v29);
      }

      ((void (**)(void *, id, FAFamilySuggesterFeedbackContext *))v14)[2](v14, v21, 0);
      v26 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v28 = _FALogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[FAFamilyMegadomeSuggester getFamilyRecommendationsWithContext:error:]((uint64_t)v18, v28);
    }

    ((void (**)(void *, id, FAFamilySuggesterFeedbackContext *))v14)[2](v14, v18, 0);
    v26 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v26;
}

void __71__FAFamilyMegadomeSuggester_getFamilyRecommendationsWithContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _FASignpostGetNanoseconds(*(void *)(a1 + 32), *(void *)(a1 + 40));
  os_signpost_id_t v8 = _FASignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 32);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D252C000, v9, OS_SIGNPOST_INTERVAL_END, v10, "MegadomeFetchRecommendation", "", v12, 2u);
  }

  v11 = _FASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __71__FAFamilyMegadomeSuggester_getFamilyRecommendationsWithContext_error___block_invoke_cold_1((uint64_t *)(a1 + 32), v11, (double)Nanoseconds / 1000000000.0);
  }

  if (*(void *)(a1 + 48)) {
    **(void **)(a1 + 48) = v6;
  }
  if (*(void *)(a1 + 56)) {
    **(void **)(a1 + 56) = v5;
  }
}

- (id)peopleNotAlreadyInFamilyInPersonArray:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(FAFamilyMegadomeSuggester *)self recommendationLoader];
  id v6 = [v5 familyHandles];

  if ([v6 count])
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v26 = v4;
    obuint64_t j = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(obj);
          }
          os_signpost_id_t v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1E4F1CA48];
          v12 = [v10 emails];
          v13 = [v11 arrayWithArray:v12];

          v14 = [v10 phoneNumbers];
          v15 = +[FAMegadomeRecommendationsLoader normalizedPhoneNumbersForPhoneNumbers:v14];

          [v13 addObjectsFromArray:v15];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v16 = v13;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v42 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v31;
            while (2)
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v31 != v19) {
                  objc_enumerationMutation(v16);
                }
                id v21 = *(const char **)(*((void *)&v30 + 1) + 8 * j);
                if ([v6 containsObject:v21])
                {
                  v22 = _FALogSystem();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v39 = v21;
                    __int16 v40 = 2112;
                    v41 = v10;
                    _os_log_impl(&dword_1D252C000, v22, OS_LOG_TYPE_DEFAULT, "Handle \"%@\" already in Family. Removing recommendation from array: %@", buf, 0x16u);
                  }

                  goto LABEL_19;
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v42 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          [v27 addObject:v10];
LABEL_19:
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v8);
    }

    id v23 = (id)[v27 copy];
    id v4 = v26;
  }
  else
  {
    v24 = _FALogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[FAFamilyMegadomeSuggester peopleNotAlreadyInFamilyInPersonArray:]";
      _os_log_impl(&dword_1D252C000, v24, OS_LOG_TYPE_DEFAULT, "No Family handles. Returning early from %s.", buf, 0xCu);
    }

    id v23 = v4;
  }

  return v23;
}

- (id)recommendedFamilyMembersForMegadomeResults:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [FARecommendedFamilyMember alloc];
        v12 = -[FARecommendedFamilyMember initWithMegadomeRecommendation:](v11, "initWithMegadomeRecommendation:", v10, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = (void *)[v4 copy];
  return v13;
}

- (FAMegadomeRecommendationLoading)recommendationLoader
{
  return self->_recommendationLoader;
}

- (void)setRecommendationLoader:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)getFamilyRecommendationsWithContext:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D252C000, a2, OS_LOG_TYPE_ERROR, "Error initializing megadome visual identifier view: %@", (uint8_t *)&v2, 0xCu);
}

- (void)getFamilyRecommendationsWithContext:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D252C000, a2, OS_LOG_TYPE_ERROR, "Error initializing megadome entities for Family tag: %@", (uint8_t *)&v2, 0xCu);
}

- (void)getFamilyRecommendationsWithContext:(uint64_t)a1 error:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D252C000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: MegadomeFetchRecommendation ", (uint8_t *)&v2, 0xCu);
}

void __71__FAFamilyMegadomeSuggester_getFamilyRecommendationsWithContext_error___block_invoke_cold_1(uint64_t *a1, NSObject *a2, double a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  _os_log_debug_impl(&dword_1D252C000, a2, OS_LOG_TYPE_DEBUG, "END [%lld] %fs:MegadomeFetchRecommendation ", (uint8_t *)&v4, 0x16u);
}

@end