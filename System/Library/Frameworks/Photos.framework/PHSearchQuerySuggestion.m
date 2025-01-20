@interface PHSearchQuerySuggestion
+ (BOOL)_deleteRecentSuggestions:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
+ (BOOL)_saveRecentSuggestions:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
+ (BOOL)deleteAllRecentSearchSuggestionsForPhotoLibrary:(id)a3 error:(id *)a4;
+ (BOOL)deleteRecentSearchSuggestions:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
+ (BOOL)saveRecentSearchQuery:(id)a3 assetResultCount:(int64_t)a4 keyAssetUUIDs:(id)a5 photoLibrary:(id)a6 error:(id *)a7;
+ (BOOL)supportsSecureCoding;
+ (id)_assetUUIDsFromFetchResult:(id)a3;
+ (id)_prepareQueryTextForSaving:(id)a3;
+ (id)_recentSuggestionsForPhotoLibrary:(id)a3 error:(id *)a4;
+ (id)new;
+ (id)recentSearchesForPhotoLibrary:(id)a3 error:(id *)a4;
+ (void)initialSearchQuerySuggestionsForPhotoLibrary:(id)a3 suggestionLimit:(unint64_t)a4 minimumResultCountPerSuggestion:(unint64_t)a5 suggestionStyleType:(unint64_t)a6 suggestionsHandler:(id)a7;
+ (void)initialSearchQuerySuggestionsForPhotoLibrary:(id)a3 suggestionLimit:(unint64_t)a4 minimumResultCountPerSuggestion:(unint64_t)a5 suggestionsHandler:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)keyAssetUUIDs;
- (NSAttributedString)queryText;
- (PHSearchQuerySuggestion)init;
- (PHSearchQuerySuggestion)initWithCoder:(id)a3;
- (PHSearchQuerySuggestion)initWithQueryText:(id)a3 type:(unint64_t)a4 assetCount:(int64_t)a5 keyAssetUUIDs:(id)a6;
- (float)score;
- (id)description;
- (id)jsonDictionary;
- (int64_t)assetCount;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PHSearchQuerySuggestion

+ (id)recentSearchesForPhotoLibrary:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PHSearchQuerySuggestion.m", 172, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v8 = [a1 _recentSuggestionsForPhotoLibrary:v7 error:a4];

  return v8;
}

+ (id)_recentSuggestionsForPhotoLibrary:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PHSearchQuerySuggestion.m", 252, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v8 = [v7 pathManager];
  v9 = [v8 searchRecentSearchesFilePath];

  id v23 = 0;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v9 options:0 error:&v23];
  id v11 = v23;
  v12 = v11;
  if (v10)
  {
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    id v22 = v12;
    v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v15 fromData:v10 error:&v22];
    id v17 = v22;

    if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v7;
      __int16 v26 = 2112;
      id v27 = v17;
      _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to unarchive search suggestions for photoLibrary: %@, error: %@", buf, 0x16u);
    }

    if (a4) {
      goto LABEL_8;
    }
  }
  else
  {
    v16 = 0;
    id v17 = v11;
    if (a4) {
LABEL_8:
    }
      *a4 = v17;
  }
  if (v16) {
    v18 = v16;
  }
  else {
    v18 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v19 = v18;

  return v19;
}

void __159__PHSearchQuerySuggestion_initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  PLPhotosSearchGetLog();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v2 = os_signpost_id_generate(v1);

  v3 = v1;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "PLSearchBackendInitialSuggestionGeneration", (const char *)&unk_19B30018E, buf, 2u);
  }
  __int16 v26 = v4;

  v5 = [*(id *)(a1 + 32) searchIndex];
  id v27 = [v5 unverifiedPsiSearchIndex];

  if (v27)
  {
    v24 = [MEMORY[0x1E4F8A8A8] sharedManager];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    v9 = [*(id *)(a1 + 32) photoLibrary];
    id v25 = [v24 fetchInitialSuggestionsWithLimit:v6 minimumResultCountPerSuggestion:v7 suggestionStyleType:v8 photoLibrary:v9 psiDatabase:v27];

    if ([v25 count])
    {
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v41 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v38 = 0u;
      id obj = v25;
      uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v39;
        uint64_t v12 = *MEMORY[0x1E4F8B700];
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v39 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            *(void *)buf = 0;
            v33 = buf;
            uint64_t v34 = 0x3032000000;
            v35 = __Block_byref_object_copy__8502;
            v36 = __Block_byref_object_dispose__8503;
            id v37 = 0;
            uint64_t v15 = [v14 length];
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __159__PHSearchQuerySuggestion_initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler___block_invoke_59;
            v31[3] = &unk_1E5842E20;
            v31[4] = buf;
            objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v15, 0, v31);
            if ([*((id *)v33 + 5) length])
            {
              v16 = +[PHSearchUtility updateInitialSearchQueryStringWithSearchAnnotations:v14];
              if (v16)
              {
                id v17 = [[PHSearchQuerySuggestion alloc] initWithQueryText:v16 type:1 assetCount:0x7FFFFFFFFFFFFFFFLL keyAssetUUIDs:0];
                [v29 addObject:v17];
              }
            }
            else
            {
              v16 = PLSearchBackendInitialSuggestionsGetLog();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v42 = 138412290;
                v43 = v14;
                _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Found invalid initial suggestion containing no template key: %@, suggestion will be skipped.", v42, 0xCu);
              }
            }

            _Block_object_dispose(buf, 8);
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
        }
        while (v10);
      }

      uint64_t v18 = *(void *)(a1 + 40);
      id v19 = (void *)[v29 copy];
      (*(void (**)(uint64_t, void *, void))(v18 + 16))(v18, v19, 0);

      v20 = v26;
      v21 = v20;
      if (v2 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v21, OS_SIGNPOST_INTERVAL_END, v2, "PLSearchBackendInitialSuggestionGeneration", (const char *)&unk_19B30018E, buf, 2u);
      }
    }
    else
    {
      id v23 = PLSearchBackendInitialSuggestionsGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_DEFAULT, "No initial suggestions found.", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v22 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "Unexpected nil psiDatabase. No initial suggestions will be generated.", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __159__PHSearchQuerySuggestion_initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler___block_invoke()
{
  attr = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qos_class_t v0 = qos_class_self();
  if (v0 >= QOS_CLASS_UTILITY) {
    dispatch_qos_class_t v1 = QOS_CLASS_UTILITY;
  }
  else {
    dispatch_qos_class_t v1 = v0;
  }
  os_signpost_id_t v2 = dispatch_queue_attr_make_with_qos_class(attr, v1, 0);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.photos.search.initial-suggestion-generation", v2);
  v4 = (void *)initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler__initialSuggestionGenerationQueue;
  initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler__initialSuggestionGenerationQueue = (uint64_t)v3;
}

+ (void)initialSearchQuerySuggestionsForPhotoLibrary:(id)a3 suggestionLimit:(unint64_t)a4 minimumResultCountPerSuggestion:(unint64_t)a5 suggestionsHandler:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void *)MEMORY[0x1E4F1CA20];
  id v11 = a6;
  id v12 = a3;
  v13 = [v10 currentLocale];
  int v14 = PLSearchNaturalLanguageInitialSuggestionsSupportedForLocale();
  uint64_t v15 = PLSearchBackendInitialSuggestionsGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = @"NO";
    if (v14) {
      v16 = @"YES";
    }
    int v17 = 138412290;
    uint64_t v18 = v16;
    _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEFAULT, "Device locale supports natural language style initial suggestions: %@", (uint8_t *)&v17, 0xCu);
  }

  [a1 initialSearchQuerySuggestionsForPhotoLibrary:v12 suggestionLimit:a4 minimumResultCountPerSuggestion:a5 suggestionStyleType:v14 ^ 1u suggestionsHandler:v11];
}

+ (void)initialSearchQuerySuggestionsForPhotoLibrary:(id)a3 suggestionLimit:(unint64_t)a4 minimumResultCountPerSuggestion:(unint64_t)a5 suggestionStyleType:(unint64_t)a6 suggestionsHandler:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  uint64_t v15 = v14;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_8:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PHSearchQuerySuggestion.m", 107, @"Invalid parameter not satisfying: %@", @"suggestionsHandler" object file lineNumber description];

    if (a4) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"PHSearchQuerySuggestion.m", 106, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

  if (!v15) {
    goto LABEL_8;
  }
LABEL_3:
  if (a4) {
    goto LABEL_4;
  }
LABEL_9:
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, a1, @"PHSearchQuerySuggestion.m", 108, @"Invalid parameter not satisfying: %@", @"suggestionLimit > 0" object file lineNumber description];

LABEL_4:
  if (initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler__onceToken != -1) {
    dispatch_once(&initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler__onceToken, &__block_literal_global_8495);
  }
  v16 = initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler__initialSuggestionGenerationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __159__PHSearchQuerySuggestion_initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler___block_invoke_2;
  block[3] = &unk_1E5842E48;
  id v24 = v13;
  id v25 = v15;
  unint64_t v26 = a4;
  unint64_t v27 = a5;
  unint64_t v28 = a6;
  id v17 = v15;
  id v18 = v13;
  dispatch_block_t v19 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
  dispatch_async(v16, v19);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetUUIDs, 0);

  objc_storeStrong((id *)&self->_queryText, 0);
}

- (NSArray)keyAssetUUIDs
{
  return self->_keyAssetUUIDs;
}

- (int64_t)assetCount
{
  return self->_assetCount;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSAttributedString)queryText
{
  return self->_queryText;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v21[0] = @"type";
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHSearchQuerySuggestion type](self, "type"));
  v22[0] = v20;
  v21[1] = @"type_humanReadable";
  unint64_t v4 = [(PHSearchQuerySuggestion *)self type];
  v5 = @"PHSearchQuerySuggestionTypeUndefined";
  if (v4 == 1) {
    v5 = @"PHSearchQuerySuggestionTypeInitial";
  }
  if (v4 == 2) {
    v5 = @"PHSearchQuerySuggestionTypeRecent";
  }
  uint64_t v6 = v5;
  v22[1] = v6;
  v21[2] = @"query_attr_text";
  uint64_t v7 = [(PHSearchQuerySuggestion *)self queryText];
  uint64_t v8 = [v7 description];
  v22[2] = v8;
  v21[3] = @"query_plain_text";
  v9 = [(PHSearchQuerySuggestion *)self queryText];
  uint64_t v10 = [v9 string];
  v22[3] = v10;
  v21[4] = @"score";
  id v11 = NSNumber;
  [(PHSearchQuerySuggestion *)self score];
  id v12 = objc_msgSend(v11, "numberWithFloat:");
  v22[4] = v12;
  v21[5] = @"asset_count";
  id v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHSearchQuerySuggestion assetCount](self, "assetCount"));
  v22[5] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:6];
  uint64_t v15 = (void *)[v3 initWithDictionary:v14];

  v16 = [(PHSearchQuerySuggestion *)self keyAssetUUIDs];

  if (v16)
  {
    id v17 = [(PHSearchQuerySuggestion *)self keyAssetUUIDs];
    [v15 setObject:v17 forKeyedSubscript:@"key_asset_uuids"];
  }
  id v18 = (void *)[v15 copy];

  return v18;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PHSearchQuerySuggestion *)self queryText];
  uint64_t v6 = [v5 description];
  unint64_t type = self->_type;
  uint64_t v8 = @"PHSearchQuerySuggestionTypeUndefined";
  if (type == 1) {
    uint64_t v8 = @"PHSearchQuerySuggestionTypeInitial";
  }
  if (type == 2) {
    uint64_t v8 = @"PHSearchQuerySuggestionTypeRecent";
  }
  v9 = v8;
  [(PHSearchQuerySuggestion *)self score];
  double v11 = v10;
  int64_t v12 = [(PHSearchQuerySuggestion *)self assetCount];
  id v13 = [(PHSearchQuerySuggestion *)self keyAssetUUIDs];
  id v14 = [v3 stringWithFormat:@"%@: %p, query text: '%@', type: %ld (%@), score: %f, asset count: %ld, key asset uuids: %@", v4, self, v6, type, v9, *(void *)&v11, v12, v13];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_queryText forKey:@"PHSearchQuerySuggestionPropertyQueryText"];
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:self->_type];
  [v6 encodeObject:v4 forKey:@"PHSearchQuerySuggestionPropertyType"];

  if (self->_assetCount != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v6 encodeObject:v5 forKey:@"PHSearchQuerySuggestionPropertyAssetCount"];
  }
  [v6 encodeObject:self->_keyAssetUUIDs forKey:@"PHSearchQuerySuggestionPropertyKeyAssetUUIDs"];
}

- (PHSearchQuerySuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchQuerySuggestionPropertyType"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  float v10 = [v4 decodeObjectOfClasses:v9 forKey:@"PHSearchQuerySuggestionPropertyQueryText"];
  double v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchQuerySuggestionPropertyAssetCount"];
  int64_t v12 = v11;
  if (v11) {
    uint64_t v13 = [v11 integerValue];
  }
  else {
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v14 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"PHSearchQuerySuggestionPropertyKeyAssetUUIDs"];
  uint64_t v15 = 0;
  if ([v10 length] && v6)
  {
    if (v13 == 0x7FFFFFFFFFFFFFFFLL && v6 == 2)
    {
      uint64_t v15 = 0;
    }
    else
    {
      self = [(PHSearchQuerySuggestion *)self initWithQueryText:v10 type:v6 assetCount:v13 keyAssetUUIDs:v14];
      uint64_t v15 = self;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PHSearchQuerySuggestion *)self type];
  id v4 = [(PHSearchQuerySuggestion *)self queryText];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PHSearchQuerySuggestion *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      unint64_t v6 = [(PHSearchQuerySuggestion *)self type];
      if (v6 == [(PHSearchQuerySuggestion *)v5 type])
      {
        uint64_t v7 = [(PHSearchQuerySuggestion *)self queryText];
        uint64_t v8 = [(PHSearchQuerySuggestion *)v5 queryText];
        char v9 = [v7 isEqualToAttributedString:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (float)score
{
  uint64_t v19 = 0;
  v20 = (float *)&v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  int64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  unint64_t v3 = [(PHSearchQuerySuggestion *)self queryText];
  id v4 = [(PHSearchQuerySuggestion *)self queryText];
  uint64_t v5 = [v4 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__PHSearchQuerySuggestion_score__block_invoke;
  v10[3] = &unk_1E5842DF8;
  v10[4] = &v11;
  v10[5] = &v19;
  v10[6] = &v15;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", @"PHSearchQueryAttributeKey", 0, v5, 0, v10);

  if (v12[3])
  {
    unint64_t v6 = v16[3];
    if (v6) {
      float v7 = v20[6] / (float)v6;
    }
    else {
      float v7 = 0.0;
    }
  }
  else
  {
    [MEMORY[0x1E4F8AB88] suggestionScoreForIndexCategory:1102];
    float v7 = v8;
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v7;
}

void __32__PHSearchQuerySuggestion_score__block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [a2 suggestion];
  id v4 = v3;
  if (v3)
  {
    ++*(void *)(*(void *)(a1[4] + 8) + 24);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = objc_msgSend(v3, "suggestionComponents", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v9) score];
          *(float *)(*(void *)(a1[5] + 8) + 24) = v10 + *(float *)(*(void *)(a1[5] + 8) + 24);
          ++*(void *)(*(void *)(a1[6] + 8) + 24);
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (PHSearchQuerySuggestion)initWithQueryText:(id)a3 type:(unint64_t)a4 assetCount:(int64_t)a5 keyAssetUUIDs:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  if (v11)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PHSearchQuerySuggestion.m", 48, @"Invalid parameter not satisfying: %@", @"queryText" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"PHSearchQuerySuggestion.m", 49, @"Invalid parameter not satisfying: %@", @"type != PHSearchQuerySuggestionTypeUndefined" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)PHSearchQuerySuggestion;
  long long v13 = [(PHSearchQuerySuggestion *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v11 copy];
    queryText = v13->_queryText;
    v13->_queryText = (NSAttributedString *)v14;

    v13->_unint64_t type = a4;
    v13->_assetCount = a5;
    uint64_t v16 = [v12 copy];
    keyAssetUUIDs = v13->_keyAssetUUIDs;
    v13->_keyAssetUUIDs = (NSArray *)v16;
  }
  return v13;
}

- (PHSearchQuerySuggestion)init
{
  os_signpost_id_t v2 = self;
  PFMethodNotImplementedException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)_prepareQueryTextForSaving:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28E48];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 string];
  uint64_t v7 = (void *)[v5 initWithString:v6];

  uint64_t v8 = [v4 length];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__PHSearchQuerySuggestion__prepareQueryTextForSaving___block_invoke;
  v12[3] = &unk_1E5842E70;
  id v13 = v7;
  id v9 = v7;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", @"PHSearchQueryAttributeKey", 0, v8, 0, v12);

  float v10 = (void *)[v9 copy];

  return v10;
}

uint64_t __54__PHSearchQuerySuggestion__prepareQueryTextForSaving___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", @"PHSearchQueryAttributeKey", a2, a3, a4);
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_assetUUIDsFromFetchResult:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  id v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__PHSearchQuerySuggestion__assetUUIDsFromFetchResult___block_invoke;
  v9[3] = &unk_1E58452C0;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  uint64_t v7 = (void *)[v6 copy];

  return v7;
}

void __54__PHSearchQuerySuggestion__assetUUIDsFromFetchResult___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 uuid];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 uuid];
    [v4 addObject:v5];
  }
}

+ (BOOL)_deleteRecentSuggestions:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PHSearchQuerySuggestion.m", 297, @"Invalid parameter not satisfying: %@", @"suggestionsToDelete" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"PHSearchQuerySuggestion.m", 298, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

LABEL_3:
  if ([v9 count])
  {
    id v21 = 0;
    id v12 = [a1 _recentSuggestionsForPhotoLibrary:v11 error:&v21];
    id v13 = v21;
    uint64_t v14 = (void *)[v12 mutableCopy];
    [v14 removeObjectsInArray:v9];
    id v20 = 0;
    int v15 = [a1 _saveRecentSuggestions:v14 photoLibrary:v11 error:&v20];
    id v16 = v20;

    if (v15)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v23 = v9;
        __int16 v24 = 2112;
        id v25 = v11;
        _os_log_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Deleted search suggestions: %@, photoLibrary: %@", buf, 0x16u);
        if (!a5) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to delete search suggestions: %@, photoLibrary: %@, error: %@", buf, 0x20u);
      if (!a5) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    if (!a5)
    {
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    *a5 = v16;
    goto LABEL_12;
  }
  LOBYTE(v15) = 1;
LABEL_13:

  return v15;
}

+ (BOOL)_saveRecentSuggestions:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PHSearchQuerySuggestion.m", 273, @"Invalid parameter not satisfying: %@", @"suggestions" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  int v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, a1, @"PHSearchQuerySuggestion.m", 274, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

LABEL_3:
  id v12 = [v11 pathManager];
  id v13 = [v12 searchRecentSearchesFilePath];

  id v24 = 0;
  uint64_t v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v24];
  id v15 = v24;
  id v16 = v15;
  if (v14)
  {
    id v23 = v15;
    int v17 = [v14 writeToFile:v13 options:1073741825 error:&v23];
    id v18 = v23;

    if (v17)
    {
      BOOL v19 = 1;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v26 = v9;
        __int16 v27 = 2112;
        uint64_t v28 = v11;
        _os_log_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Saved search suggestions: %@, photoLibrary: %@", buf, 0x16u);
      }
      goto LABEL_11;
    }
  }
  else
  {
    id v18 = v15;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = v9;
    __int16 v27 = 2112;
    uint64_t v28 = v11;
    __int16 v29 = 2112;
    id v30 = v18;
    _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to save search suggestions: %@, photoLibrary: %@, error: %@", buf, 0x20u);
  }
  BOOL v19 = 0;
LABEL_11:
  if (a5) {
    *a5 = v18;
  }

  return v19;
}

+ (BOOL)deleteAllRecentSearchSuggestionsForPhotoLibrary:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = [a3 pathManager];
  id v6 = [v5 searchRecentSearchesFilePath];

  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v19 = 0;
    int v10 = [v9 removeItemAtPath:v6 error:&v19];
    id v11 = v19;

    id v12 = PLSearchBackendRecentSuggestionsGetLog();
    id v13 = v12;
    if (v10)
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      uint64_t v14 = "Successfully deleted recent suggestions at path: \"%@\".";
      id v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 12;
    }
    else
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v11;
      uint64_t v14 = "Failed to delete recent suggestions at path: \"%@\" with error: %@.";
      id v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 22;
    }
    _os_log_impl(&dword_19B043000, v15, v16, v14, buf, v17);
LABEL_11:

    if (a4)
    {
      id v11 = v11;
      *a4 = v11;
    }
    goto LABEL_13;
  }
  id v11 = PLSearchBackendRecentSuggestionsGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEFAULT, "No recent suggestions found at path: \"%@\", nothing to delete.", buf, 0xCu);
  }
  LOBYTE(v10) = 1;
LABEL_13:

  return v10;
}

+ (BOOL)deleteRecentSearchSuggestions:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PHSearchQuerySuggestion.m", 220, @"Invalid parameter not satisfying: %@", @"suggestionsToDelete" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PHSearchQuerySuggestion.m", 221, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  char v12 = [a1 _deleteRecentSuggestions:v9 photoLibrary:v11 error:a5];

  return v12;
}

+ (BOOL)saveRecentSearchQuery:(id)a3 assetResultCount:(int64_t)a4 keyAssetUUIDs:(id)a5 photoLibrary:(id)a6 error:(id *)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = v14;
  uint64_t v45 = v14;
  if (v12)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v36 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v14);
    [v36 handleFailureInMethod:a2, a1, @"PHSearchQuerySuggestion.m", 177, @"Invalid parameter not satisfying: %@", @"searchQuery" object file lineNumber description];

    id v15 = v45;
    if (v45) {
      goto LABEL_3;
    }
  }
  id v37 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v15);
  [v37 handleFailureInMethod:a2, a1, @"PHSearchQuerySuggestion.m", 178, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

  id v15 = v45;
LABEL_3:
  id v51 = 0;
  os_log_type_t v16 = [a1 recentSearchesForPhotoLibrary:v15 error:&v51];
  id v38 = v51;
  v44 = v12;
  uint32_t v17 = [v12 searchText];
  id v40 = a1;
  uint64_t v18 = [a1 _prepareQueryTextForSaving:v17];

  long long v41 = (void *)v18;
  id v19 = +[PHSearchUtility insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:v18];
  v43 = v13;
  id v20 = [[PHSearchQuerySuggestion alloc] initWithQueryText:v19 type:2 assetCount:a4 keyAssetUUIDs:v13];
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:10];
  __int16 v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
  [v21 addObject:v19];
  long long v39 = v20;
  [v22 addObject:v20];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v23 = v16;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v48;
LABEL_5:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v48 != v26) {
        objc_enumerationMutation(v23);
      }
      uint64_t v28 = *(void **)(*((void *)&v47 + 1) + 8 * v27);
      if ((unint64_t)[v22 count] > 9) {
        break;
      }
      __int16 v29 = [v28 queryText];
      char v30 = [v21 containsObject:v29];

      if ((v30 & 1) == 0)
      {
        uint64_t v31 = [v28 queryText];
        [v21 addObject:v31];

        [v22 addObject:v28];
      }
      if (v25 == ++v27)
      {
        uint64_t v25 = [v23 countByEnumeratingWithState:&v47 objects:v58 count:16];
        if (v25) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  id v46 = 0;
  int v32 = [v40 _saveRecentSuggestions:v22 photoLibrary:v45 error:&v46];
  id v33 = v46;

  if (v32)
  {
    uint64_t v34 = a7;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v45;
      _os_log_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Saved recent search query for photoLibrary: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v34 = a7;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v53 = v44;
      __int16 v54 = 2112;
      v55 = v45;
      __int16 v56 = 2112;
      id v57 = v33;
      _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to save recent search query: %@, photoLibrary: %@, error: %@", buf, 0x20u);
    }
  }
  if (v34) {
    *uint64_t v34 = v33;
  }

  return v32;
}

void __159__PHSearchQuerySuggestion_initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler___block_invoke_59(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

+ (id)new
{
  id v2 = a1;
  PFMethodNotImplementedException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end