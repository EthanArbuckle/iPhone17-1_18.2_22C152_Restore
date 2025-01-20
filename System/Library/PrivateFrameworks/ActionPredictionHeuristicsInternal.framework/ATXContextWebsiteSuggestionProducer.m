@interface ATXContextWebsiteSuggestionProducer
- (ATXContextWebsiteSuggestionProducer)initWithValidDateInterval:(id)a3 reasonCode:(int64_t)a4 score:(double)a5;
- (id)_suggestionWithWebsite:(id)a3 titlesAndSubtitles:(id)a4;
- (id)titleAndSubtitleForUrl:(id)a3 titlesAndSubtitles:(id)a4;
- (id)websiteSuggestions;
@end

@implementation ATXContextWebsiteSuggestionProducer

- (ATXContextWebsiteSuggestionProducer)initWithValidDateInterval:(id)a3 reasonCode:(int64_t)a4 score:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXContextWebsiteSuggestionProducer;
  v10 = [(ATXContextWebsiteSuggestionProducer *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_validDateInterval, a3);
    v11->_reasonCode = a4;
    v11->_score = a5;
  }

  return v11;
}

- (id)websiteSuggestions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v3 = (void *)getATXWebSuggestionsGeneratorClass_softClass;
  uint64_t v18 = getATXWebSuggestionsGeneratorClass_softClass;
  if (!getATXWebSuggestionsGeneratorClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v20 = __getATXWebSuggestionsGeneratorClass_block_invoke;
    v21 = &unk_1E68A4E08;
    v22 = &v15;
    __getATXWebSuggestionsGeneratorClass_block_invoke((uint64_t)&buf);
    v3 = (void *)v16[3];
  }
  v4 = v3;
  _Block_object_dispose(&v15, 8);
  id v5 = objc_alloc_init(v4);
  v6 = stringForATXSuggestionPredictionReasonCode();
  v7 = [v5 websitePredictionsForContextType:v6 limit:2];
  v8 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1D0F43000, v8, OS_LOG_TYPE_DEFAULT, "ATXContextWebsiteSuggestionProducer: websites %@", (uint8_t *)&buf, 0xCu);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__ATXContextWebsiteSuggestionProducer_websiteSuggestions__block_invoke;
  v13[3] = &unk_1E68A5540;
  v13[4] = self;
  id v14 = v5;
  id v9 = v5;
  v10 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", v13);
  v11 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "ATXContextWebsiteSuggestionProducer: websiteSuggestions: %@", (uint8_t *)&buf, 0xCu);
  }

  return v10;
}

id __57__ATXContextWebsiteSuggestionProducer_websiteSuggestions__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 webpageTitlesAndSubtitles];
  v6 = [v2 _suggestionWithWebsite:v4 titlesAndSubtitles:v5];

  return v6;
}

- (id)_suggestionWithWebsite:(id)a3 titlesAndSubtitles:(id)a4
{
  id v6 = a3;
  v7 = [(ATXContextWebsiteSuggestionProducer *)self titleAndSubtitleForUrl:v6 titlesAndSubtitles:a4];
  if ([v7 count] == 2)
  {
    v8 = [v7 objectAtIndexedSubscript:0];
    id v9 = [v7 objectAtIndexedSubscript:1];
    id v10 = objc_alloc(MEMORY[0x1E4F4AE40]);
    v11 = [(NSDateInterval *)self->_validDateInterval startDate];
    v12 = [(NSDateInterval *)self->_validDateInterval endDate];
    objc_super v13 = (void *)[v10 initWithStartDate:v11 endDate:v12 lockScreenEligible:0 predicate:0];

    id v14 = +[ATXContextHeuristicSuggestionProducer suggestionWithURL:v6 actionTitle:v8 subtitle:v9 bundleID:@"com.apple.mobilesafari" score:1 << self->_reasonCode predictionReasons:v13 criteria:self->_score dateInterval:0];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)titleAndSubtitleForUrl:(id)a3 titlesAndSubtitles:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v12 = [v11 URLByAppendingPathComponent:&stru_1F2719D20];
        objc_super v13 = [v19 URLByAppendingPathComponent:&stru_1F2719D20];
        int v14 = [v12 isEqual:v13];

        if (v14)
        {
          uint64_t v15 = [v5 objectForKeyedSubscript:v11];
          uint64_t v16 = [v15 count];

          if (v16 != 2) {
            goto LABEL_13;
          }
          uint64_t v17 = [v5 objectForKeyedSubscript:v11];

          v8 = (void *)v17;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (void).cxx_destruct
{
}

@end