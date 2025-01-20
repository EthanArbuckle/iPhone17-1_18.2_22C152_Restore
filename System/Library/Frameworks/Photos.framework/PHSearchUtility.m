@interface PHSearchUtility
+ (BOOL)_locationExists:(unint64_t)a3 forString:(id)a4;
+ (BOOL)_shouldOfferCompletionSuggestionsInQueryString:(id)a3 atLocation:(unint64_t)a4 parsedQueryTokens:(id)a5;
+ (BOOL)_tokenHasSuggestion:(id)a3;
+ (BOOL)locationDisambiguationSpansFullLengthOfString:(id)a3;
+ (BOOL)rangeExists:(_NSRange)a3 forString:(id)a4;
+ (_NSRange)_rangeOfTokenInQueryString:(id)a3;
+ (id)CSAttributedEntityKeyFromIndexCategoryType:(unint64_t)a3;
+ (id)CSAttributedEntityKeyFromPHSearchEntityCategoryType:(unint64_t)a3;
+ (id)_parsedAttributedTokensFromQueryText:(id)a3;
+ (id)_searchQueryAnnotationFromRankedGroup:(id)a3 matchRange:(_NSRange)a4;
+ (id)allTokenNGramsFromString:(id)a3;
+ (id)completionSuggestionTextsForQueryString:(id)a3 locationInQueryString:(unint64_t)a4;
+ (id)extractAssetUUIDsForLocationDisambiguationsInQueryString:(id)a3;
+ (id)generateTripAnnotationWithTripUUIDs:(id)a3;
+ (id)insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:(id)a3;
+ (id)queryTokensFromQueryText:(id)a3 limitToSuggestionCategories:(id)a4;
+ (id)sceneIdFromIndexCategoryType:(unint64_t)a3 lookupIdentifier:(id)a4;
+ (id)stringValueForPHSearchEntityCategoryType:(unint64_t)a3;
+ (id)suggestionComponentsInQueryString:(id)a3;
+ (id)tagRangeWithSpotlightAttributedTypeForLocationTripQueryString:(id)a3;
+ (id)updateInitialSearchQueryStringWithSearchAnnotations:(id)a3;
+ (int64_t)CSSceneTypeFromIndexCategoryType:(unint64_t)a3;
+ (unint64_t)PHSearchEntityCategoryTypeFromCSAttributedEntityType:(id)a3;
+ (unint64_t)PHSearchEntityCategoryTypeFromPHSearchSuggestionCategoriesType:(unint64_t)a3;
+ (unint64_t)PHSearchEntityCategoryTypeFromStringValue:(id)a3;
+ (unint64_t)numberOfInsertedSpacesBetweenAnnotationsAndPlainTextInQueryString:(id)a3 beforeLocation:(unint64_t)a4;
+ (unint64_t)suggestionTypeForQueryString:(id)a3 locationInQueryStringForSuggestionGeneration:(unint64_t)a4;
@end

@implementation PHSearchUtility

+ (id)_searchQueryAnnotationFromRankedGroup:(id)a3 matchRange:(_NSRange)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 searchIndexingCategory];
    uint64_t v6 = PLSearchSuggestionCategoriesTypeForSearchIndexCategory();
    v7 = [v5 suggestionComponent];
    if (v7)
    {
      if ((unint64_t)(v6 - 1) >= 0x29) {
        uint64_t v6 = 0;
      }
      v8 = [PHSearchSuggestion alloc];
      v9 = [v5 displayString];
      v14[0] = v7;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      v11 = -[PHSearchSuggestion initWithType:categoriesType:text:matchRangeOfSearchText:count:suggestionComponents:](v8, "initWithType:categoriesType:text:matchRangeOfSearchText:count:suggestionComponents:", 4, v6, v9, 0x7FFFFFFFFFFFFFFFLL, 0, 0, v10);

      v12 = [[PHSearchQueryAnnotation alloc] initWithSuggestion:v11 queryToken:0];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)_locationExists:(unint64_t)a3 forString:(id)a4
{
  return [a4 length] >= a3;
}

+ (BOOL)_tokenHasSuggestion:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v4 = [v3 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PHSearchUtility__tokenHasSuggestion___block_invoke;
  v7[3] = &unk_1E5843008;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0, v7);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __39__PHSearchUtility__tokenHasSuggestion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  v7 = [a2 objectForKeyedSubscript:@"PHSearchQueryAttributeKey"];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

+ (_NSRange)_rangeOfTokenInQueryString:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3010000000;
  v16 = &unk_19B322527;
  long long v17 = xmmword_19B2CC5E0;
  uint64_t v4 = [v3 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__PHSearchUtility__rangeOfTokenInQueryString___block_invoke;
  v10[3] = &unk_1E5841C98;
  id v5 = v3;
  id v11 = v5;
  v12 = &v13;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0, v10);
  NSUInteger v6 = v14[4];
  NSUInteger v7 = v14[5];

  _Block_object_dispose(&v13, 8);
  NSUInteger v8 = v6;
  NSUInteger v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

void __46__PHSearchUtility__rangeOfTokenInQueryString___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 objectForKeyedSubscript:@"PHSearchParsedTokenRangeInQueryKey"];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 rangeValue];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v6 + 32) = v5;
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    NSUInteger v8 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Unable to find associated range value for the parsed token: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

+ (BOOL)_shouldOfferCompletionSuggestionsInQueryString:(id)a3 atLocation:(unint64_t)a4 parsedQueryTokens:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = a5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v23 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
      uint64_t v15 = objc_msgSend(a1, "_rangeOfTokenInQueryString:", v14, (void)v22);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v17 = v15 + v16;
      if (v15 + v16 > (unint64_t)[v8 length]) {
        break;
      }
      if (v17 == a4)
      {
        v19 = [v14 string];

        if (v19) {
          goto LABEL_15;
        }
        goto LABEL_12;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v32 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

LABEL_12:
  v18 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v27 = a4;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_INFO, "Unable to locate specified location: %tu in query string: \"%@\" with parsed query tokens: %@, no suggestions will be generated.", buf, 0x20u);
  }

  v19 = 0;
LABEL_15:
  BOOL v20 = objc_msgSend(v19, "length", (void)v22) != 0;

  return v20;
}

+ (id)_parsedAttributedTokensFromQueryText:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F38908]) initWithUnit:0];
    uint64_t v5 = [v3 string];
    [v4 setString:v5];

    uint64_t v6 = [v4 string];
    uint64_t v7 = [v6 length];

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__PHSearchUtility__parsedAttributedTokensFromQueryText___block_invoke;
    v15[3] = &unk_1E5841D60;
    id v16 = v4;
    id v9 = v3;
    id v17 = v9;
    id v10 = v8;
    id v18 = v10;
    id v11 = v4;
    objc_msgSend(v11, "enumerateTokensInRange:usingBlock:", 0, v7, v15);
    if (![v10 count])
    {
      uint64_t v12 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v9;
        _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "Unable to extract query parses from query: %@", buf, 0xCu);
      }
    }
    uint64_t v13 = (void *)[v10 copy];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

void __56__PHSearchUtility__parsedAttributedTokensFromQueryText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) string];
  uint64_t v7 = objc_msgSend(v6, "substringWithRange:", a2, a3);

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v7];
  id v9 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PHSearchUtility__parsedAttributedTokensFromQueryText___block_invoke_2;
  v11[3] = &unk_1E5841D38;
  id v12 = v8;
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  id v10 = v8;
  objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", a2, a3, 0, v11);
  [*(id *)(a1 + 48) addObject:v10];
}

void __56__PHSearchUtility__parsedAttributedTokensFromQueryText___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F29238];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = a2;
  id v8 = objc_msgSend(v3, "valueWithRange:", v5, v6);
  objc_msgSend(v4, "addAttribute:value:range:", @"PHSearchParsedTokenRangeInQueryKey", v8, 0, objc_msgSend(*(id *)(a1 + 32), "length"));

  id v10 = [v7 objectForKeyedSubscript:@"PHSearchQueryAttributeKey"];

  id v9 = [v10 suggestion];

  if (v9) {
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", @"PHSearchQueryAttributeKey", v10, 0, objc_msgSend(*(id *)(a1 + 32), "length"));
  }
}

+ (BOOL)rangeExists:(_NSRange)a3 forString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  BOOL v7 = 0;
  if ([v6 length] && location != 0x7FFFFFFFFFFFFFFFLL) {
    BOOL v7 = location <= [v6 length] && location + length <= objc_msgSend(v6, "length");
  }

  return v7;
}

+ (id)completionSuggestionTextsForQueryString:(id)a3 locationInQueryString:(unint64_t)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 length])
  {
    id v18 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_49;
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    a4 = [v6 length];
  }
  if (([a1 _locationExists:a4 forString:v6] & 1) == 0)
  {
    BOOL v7 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v39 = a4;
      __int16 v40 = 2112;
      unint64_t v41 = (unint64_t)v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Unable to locate specified location: %tu in query string: \"%@\", no suggestions will be generated.", buf, 0x16u);
    }
    goto LABEL_24;
  }
  BOOL v7 = [a1 _parsedAttributedTokensFromQueryText:v6];
  if (![a1 _shouldOfferCompletionSuggestionsInQueryString:v6 atLocation:a4 parsedQueryTokens:v7])
  {
LABEL_24:
    id v18 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_48;
  }
  uint64_t v8 = [v7 count];
  if (v8 - 1 < 0) {
    goto LABEL_33;
  }
  uint64_t v9 = v8;
  id v37 = v6;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    id v12 = [v7 objectAtIndexedSubscript:--v9];
    if (![a1 _tokenHasSuggestion:v12]) {
      goto LABEL_11;
    }
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
LABEL_19:

    uint64_t v11 = v13;
    if (v9 <= 0) {
      goto LABEL_26;
    }
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_11:
    uint64_t v14 = [a1 _rangeOfTokenInQueryString:v12];
    unint64_t v16 = v14 + v15;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v17 = v9;
    }
    else {
      uint64_t v17 = v11;
    }
    if (v16 <= a4) {
      uint64_t v13 = v17;
    }
    else {
      uint64_t v13 = v11;
    }
    if (v16 <= a4) {
      uint64_t v10 = v9;
    }
    goto LABEL_19;
  }

  uint64_t v13 = v11;
LABEL_26:
  id v6 = v37;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_33:
    v19 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v39 = (unint64_t)v6;
      __int16 v40 = 2048;
      unint64_t v41 = a4;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Unable to extract completion suggestion texts for query: \"%@\" at location: %tu", buf, 0x16u);
    }
    id v18 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_47;
  }
  v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v20 = [v7 objectAtIndexedSubscript:v13];
  uint64_t v21 = [a1 _rangeOfTokenInQueryString:v20];
  if (v21 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v23 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  v35 = v20;
  if (v13 < v10)
  {
LABEL_45:
    id v18 = [v19 copy];
    id v20 = v35;
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v34 = v21 + v22;
    while (v13 + v24 <= (unint64_t)([v7 count] - 1))
    {
      long long v25 = [v7 objectAtIndexedSubscript:v13 + v24];
      if (v24)
      {
        uint64_t v26 = [a1 _rangeOfTokenInQueryString:v25];
        if (v26 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v33 = PLSearchBackendQueryGetLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            unint64_t v39 = (unint64_t)v6;
            __int16 v40 = 2048;
            unint64_t v41 = a4;
            _os_log_impl(&dword_19B043000, v33, OS_LOG_TYPE_ERROR, "Unable to extract completion suggestion texts for query: \"%@\" at location: %tu", buf, 0x16u);
          }
          id v20 = v35;
          goto LABEL_60;
        }
        uint64_t v27 = v26;
        v36 = v25;
        __int16 v28 = v19;
        uint64_t v29 = v34 - v26;
        if ((objc_msgSend(a1, "rangeExists:forString:", v26, v34 - v26, v6) & 1) == 0)
        {
          uint64_t v33 = PLSearchBackendQueryGetLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            unint64_t v39 = (unint64_t)v6;
            __int16 v40 = 2048;
            unint64_t v41 = a4;
            _os_log_impl(&dword_19B043000, v33, OS_LOG_TYPE_ERROR, "Unable to extract completion suggestion texts for query: \"%@\" at location: %tu", buf, 0x16u);
          }
          v19 = v28;
          id v20 = v35;
          long long v25 = v36;
LABEL_60:

          goto LABEL_32;
        }
        __int16 v30 = [v6 string];
        id v31 = objc_msgSend(v30, "substringWithRange:", v27, v29);

        v19 = v28;
        long long v25 = v36;
        id v6 = v37;
      }
      else
      {
        id v31 = [v35 string];
      }
      [v19 addObject:v31];

      --v24;
      if (v13 + v24 + 1 <= v10) {
        goto LABEL_45;
      }
    }
    long long v23 = PLSearchBackendQueryGetLog();
    id v20 = v35;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
LABEL_30:
    *(_DWORD *)buf = 138412546;
    unint64_t v39 = (unint64_t)v6;
    __int16 v40 = 2048;
    unint64_t v41 = a4;
    _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, "Unable to extract completion suggestion texts for query: \"%@\" at location: %tu", buf, 0x16u);
LABEL_31:

LABEL_32:
    id v18 = (id)MEMORY[0x1E4F1CBF0];
  }

LABEL_47:
LABEL_48:

LABEL_49:

  return v18;
}

+ (id)generateTripAnnotationWithTripUUIDs:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = PLServicesLocalizedFrameworkString();
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:13];
  id v6 = +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:13];
  BOOL v7 = [PHSearchQueryQUToken alloc];
  uint64_t v13 = v6;
  v14[0] = v3;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v9 = [(PHSearchQueryQUToken *)v7 initWithText:v4 entityCategoryTypes:v5 metadata:v8];

  uint64_t v10 = [PHSearchQueryAnnotation alloc];
  uint64_t v11 = [(PHSearchQueryAnnotation *)v10 initWithQueryToken:v9];

  return v11;
}

+ (id)tagRangeWithSpotlightAttributedTypeForLocationTripQueryString:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F28E48];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithAttributedString:v4];

  if ([v5 length])
  {
    id v6 = PLServicesLocalizedFrameworkString();
    uint64_t v7 = [v5 length];
    if (v6)
    {
      uint64_t v8 = *MEMORY[0x1E4F22800];
      v18[0] = v6;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      objc_msgSend(v5, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:", 0, v7, v8, v9);
    }
    else
    {
      uint64_t v9 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = [v5 string];
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v10;
        _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Unable to find localized string for SEARCH_TRIP, will not annotate query as trip: %@", buf, 0xCu);
      }
    }

    uint64_t v11 = [v5 string];
    uint64_t v12 = *MEMORY[0x1E4F227F8];
    uint64_t v15 = v11;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    objc_msgSend(v5, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:", 0, v7, v12, v13);
  }

  return v5;
}

+ (BOOL)locationDisambiguationSpansFullLengthOfString:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    [a1 _parsedAttributedTokensFromQueryText:v4];
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v10 = [v9 length];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          void v14[2] = __65__PHSearchUtility_locationDisambiguationSpansFullLengthOfString___block_invoke;
          v14[3] = &unk_1E5843008;
          v14[4] = &v19;
          objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v14);
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v6);
    }

    uint64_t v11 = v20[3];
    BOOL v12 = v11 == [v5 count];
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

void __65__PHSearchUtility_locationDisambiguationSpansFullLengthOfString___block_invoke(uint64_t a1, void *a2)
{
  id v8 = [a2 objectForKeyedSubscript:@"PHSearchQueryAttributeKey"];
  id v3 = [v8 suggestion];
  if ([v3 type] == 3)
  {
    id v4 = [v8 suggestion];
    id v5 = [v4 locationAssetUUIDs];
    uint64_t v6 = [v5 count];

    uint64_t v7 = v8;
    if (v6) {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
  else
  {

    uint64_t v7 = v8;
  }
}

+ (id)queryTokensFromQueryText:(id)a3 limitToSuggestionCategories:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _parsedAttributedTokensFromQueryText:v6];
  long long v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        BOOL v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v24 = 0;
        long long v25 = &v24;
        uint64_t v26 = 0x2020000000;
        char v27 = 0;
        uint64_t v13 = [v12 length];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __72__PHSearchUtility_queryTokensFromQueryText_limitToSuggestionCategories___block_invoke;
        v19[3] = &unk_1E5841D10;
        long long v23 = &v24;
        id v20 = v7;
        id v21 = v6;
        uint64_t v22 = v12;
        objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", @"PHSearchQueryAttributeKey", 0, v13, 0, v19);
        if (*((unsigned char *)v25 + 24))
        {
          uint64_t v14 = [v12 string];
          [v18 addObject:v14];
        }
        _Block_object_dispose(&v24, 8);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }

  long long v15 = (void *)[v18 copy];

  return v15;
}

void __72__PHSearchUtility_queryTokensFromQueryText_limitToSuggestionCategories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 suggestion];
      if (v4)
      {
        if ([*(id *)(a1 + 32) count]) {
          char v5 = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", -[NSObject categoriesType](v4, "categoriesType"));
        }
        else {
          char v5 = 1;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5;
      }
    }
    else
    {
      id v4 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        uint64_t v7 = *(void *)(a1 + 48);
        int v8 = 138412546;
        uint64_t v9 = v6;
        __int16 v10 = 2112;
        uint64_t v11 = v7;
        _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_ERROR, "Found unexpected attribute for PHSearchQueryAttributeKey in query string: %@, not including %@ as a query token for OCR match highlighting", (uint8_t *)&v8, 0x16u);
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

+ (id)extractAssetUUIDsForLocationDisambiguationsInQueryString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (v4)
  {
    uint64_t v6 = [v3 length];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__PHSearchUtility_extractAssetUUIDsForLocationDisambiguationsInQueryString___block_invoke;
    v9[3] = &unk_1E5843058;
    id v10 = v5;
    id v7 = v5;
    objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v9);
    id v5 = (id)[v7 copy];
  }

  return v5;
}

void __76__PHSearchUtility_extractAssetUUIDsForLocationDisambiguationsInQueryString___block_invoke(uint64_t a1, void *a2)
{
  id v13 = [a2 objectForKeyedSubscript:@"PHSearchQueryAttributeKey"];
  id v3 = [v13 suggestion];
  if ([v3 type] == 3)
  {
    uint64_t v4 = [v13 suggestion];
    id v5 = [v4 locationAssetUUIDs];
    uint64_t v6 = [v5 count];

    id v7 = v13;
    if (!v6) {
      goto LABEL_8;
    }
    uint64_t v8 = [*(id *)(a1 + 32) count];
    uint64_t v9 = *(void **)(a1 + 32);
    id v3 = [v13 suggestion];
    id v10 = [v3 locationAssetUUIDs];
    uint64_t v11 = v10;
    if (v8)
    {
      [v9 intersectSet:v10];
    }
    else
    {
      uint64_t v12 = [v10 allObjects];
      [v9 addObjectsFromArray:v12];
    }
  }

  id v7 = v13;
LABEL_8:
}

+ (id)allTokenNGramsFromString:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F388F0]);
  v40[0] = *MEMORY[0x1E4F38860];
  id v5 = (void *)v40[0];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  id v7 = (void *)[v4 initWithTagSchemes:v6];

  [v7 setString:v3];
  id v8 = v5;
  id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v10 = *MEMORY[0x1E4F387E8];
  v39[0] = *MEMORY[0x1E4F387D8];
  v39[1] = v10;
  uint64_t v11 = *MEMORY[0x1E4F38830];
  v39[2] = *MEMORY[0x1E4F38818];
  v39[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  id v13 = (void *)[v9 initWithArray:v12];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v15 = [v3 length];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __44__PHSearchUtility_allTokenNGramsFromString___block_invoke;
  v36[3] = &unk_1E5841CE8;
  id v32 = v13;
  id v37 = v32;
  id v16 = v14;
  id v38 = v16;
  uint64_t v33 = v8;
  uint64_t v34 = v7;
  objc_msgSend(v7, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v15, 0, v8, 6, v36);
  unint64_t v17 = [v16 count];
  long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v17 * v17];
  if (v17)
  {
    for (unint64_t i = 0; i != v17; ++i)
    {
      unint64_t v19 = i;
      do
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", i, v32);
        v21 = id v20 = v3;
        NSUInteger v22 = [v21 rangeValue];
        NSUInteger v24 = v23;

        long long v25 = [v16 objectAtIndexedSubscript:v19];
        NSUInteger v26 = [v25 rangeValue];
        NSUInteger v28 = v27;

        id v3 = v20;
        v42.NSUInteger location = v22;
        v42.NSUInteger length = v24;
        v43.NSUInteger location = v26;
        v43.NSUInteger length = v28;
        NSRange v29 = NSUnionRange(v42, v43);
        long long v30 = objc_msgSend(v20, "substringWithRange:", v29.location, v29.length);
        [v18 addObject:v30];

        ++v19;
      }
      while (v19 < v17);
    }
  }

  return v18;
}

void __44__PHSearchUtility_allTokenNGramsFromString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (([*(id *)(a1 + 32) containsObject:a2] & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) addObject:v7];
  }
}

+ (id)suggestionComponentsInQueryString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = [v3 length];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __53__PHSearchUtility_suggestionComponentsInQueryString___block_invoke;
    uint64_t v12 = &unk_1E5841CC0;
    id v13 = v4;
    id v14 = v3;
    id v6 = v4;
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", @"PHSearchQueryAttributeKey", 0, v5, 0, &v9);
    id v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

void __53__PHSearchUtility_suggestionComponentsInQueryString___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 suggestion];
      uint64_t v5 = v4;
      if (v4)
      {
        id v6 = *(void **)(a1 + 32);
        id v7 = [v4 suggestionComponents];
        [v6 addObjectsFromArray:v7];
      }
    }
    else
    {
      uint64_t v5 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        int v9 = 138412546;
        id v10 = v3;
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_ERROR, "Found unexpected attribute %@ for PHSearchQueryAttributeKey in query string: %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
}

+ (unint64_t)suggestionTypeForQueryString:(id)a3 locationInQueryStringForSuggestionGeneration:(unint64_t)a4
{
  id v5 = a3;
  if (![v5 length]) {
    goto LABEL_5;
  }
  if (a4)
  {
    if (a4 != 0x7FFFFFFFFFFFFFFFLL && [v5 length] < a4)
    {
LABEL_5:
      a4 = 0;
      goto LABEL_12;
    }
    if ([v5 length] <= a4)
    {
      uint64_t v11 = 0;
      uint64_t v12 = &v11;
      uint64_t v13 = 0x2020000000;
      char v14 = 0;
      uint64_t v6 = [v5 length];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __93__PHSearchUtility_suggestionTypeForQueryString_locationInQueryStringForSuggestionGeneration___block_invoke;
      v8[3] = &unk_1E5841C98;
      id v9 = v5;
      id v10 = &v11;
      objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v8);
      if (*((unsigned char *)v12 + 24)) {
        a4 = 2;
      }
      else {
        a4 = 1;
      }

      _Block_object_dispose(&v11, 8);
    }
    else
    {
      a4 = 1;
    }
  }
LABEL_12:

  return a4;
}

void __93__PHSearchUtility_suggestionTypeForQueryString_locationInQueryStringForSuggestionGeneration___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v13 = [a2 objectForKeyedSubscript:@"PHSearchQueryAttributeKey"];
  uint64_t v9 = a3 + a4;
  uint64_t v10 = [*(id *)(a1 + 32) length];
  uint64_t v11 = [v13 suggestion];

  if (v11) {
    BOOL v12 = v9 == v10;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
}

+ (id)insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v5 = (void *)[v3 mutableCopy];
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v32[3] = 0;
    uint64_t v6 = [v3 length];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __84__PHSearchUtility_insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString___block_invoke;
    v27[3] = &unk_1E5841C70;
    id v7 = v3;
    id v28 = v7;
    id v8 = v4;
    id v29 = v8;
    long long v31 = v32;
    id v9 = v5;
    id v30 = v9;
    objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", @"PHSearchQueryAttributeKey", 0, v6, 0, v27);
    if (![v9 length])
    {
      uint64_t v10 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "[First Pass] Failed to insert spacing for query string: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    uint64_t v11 = (void *)[v9 mutableCopy];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    uint64_t v12 = [v9 length];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    id v21 = __84__PHSearchUtility_insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString___block_invoke_76;
    NSUInteger v22 = &unk_1E5841C70;
    id v13 = v9;
    id v23 = v13;
    id v14 = v8;
    id v24 = v14;
    p_long long buf = &buf;
    id v15 = v11;
    id v25 = v15;
    objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", @"PHSearchQueryAttributeKey", 0, v12, 0, &v19);
    if (!objc_msgSend(v15, "length", v19, v20, v21, v22))
    {
      id v16 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v33 = 138412290;
        id v34 = v7;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "[Second Pass] Failed to insert spacing for query string: %@", v33, 0xCu);
      }
    }
    id v17 = (id)[v15 copy];

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v32, 8);
  }
  else
  {
    id v17 = v3;
  }

  return v17;
}

void __84__PHSearchUtility_insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v13 = a2;
  if (v13)
  {
    uint64_t v7 = a3 + a4;
    if (v7 != [*(id *)(a1 + 32) length])
    {
      id v8 = [*(id *)(a1 + 32) string];
      uint64_t v9 = [v8 characterAtIndex:v7];

      if (([*(id *)(a1 + 40) characterIsMember:v9] & 1) == 0)
      {
        uint64_t v10 = *(void **)(a1 + 48);
        uint64_t v11 = v7 + *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
        [v10 insertAttributedString:v12 atIndex:v11];

        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      }
    }
  }
}

void __84__PHSearchUtility_insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString___block_invoke_76(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (v10)
  {
    if (a3)
    {
      id v5 = [*(id *)(a1 + 32) string];
      uint64_t v6 = [v5 characterAtIndex:a3 - 1];

      if (([*(id *)(a1 + 40) characterIsMember:v6] & 1) == 0)
      {
        uint64_t v7 = *(void **)(a1 + 48);
        uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + a3;
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
        [v7 insertAttributedString:v9 atIndex:v8];

        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      }
    }
  }
}

+ (unint64_t)numberOfInsertedSpacesBetweenAnnotationsAndPlainTextInQueryString:(id)a3 beforeLocation:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 length];
  unint64_t v7 = 0;
  if (a4 && v6)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL || [v5 length] <= a4) {
      a4 = [v5 length];
    }
    uint64_t v8 = objc_msgSend(v5, "attributedSubstringFromRange:", 0, a4);
    uint64_t v9 = +[PHSearchUtility insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:v8];

    unint64_t v7 = [v9 length] - a4;
  }

  return v7;
}

+ (id)updateInitialSearchQueryStringWithSearchAnnotations:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (void *)[v4 mutableCopy];
    uint64_t v6 = [v4 length];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __71__PHSearchUtility_updateInitialSearchQueryStringWithSearchAnnotations___block_invoke;
    id v13 = &unk_1E5841C48;
    id v14 = v5;
    id v15 = a1;
    id v7 = v5;
    objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, &v10);
    uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __71__PHSearchUtility_updateInitialSearchQueryStringWithSearchAnnotations___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F8B6F8];
  uint64_t v8 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F8B6F8]];
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", v7, a3, a4);
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "_searchQueryAnnotationFromRankedGroup:matchRange:", v8, a3, a4);
    uint64_t v10 = (void *)v9;
    if (v9)
    {
      uint64_t v11 = *(void **)(a1 + 32);
      id v13 = @"PHSearchQueryAttributeKey";
      v14[0] = v9;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      objc_msgSend(v11, "addAttributes:range:", v12, a3, a4);
    }
  }
}

+ (id)sceneIdFromIndexCategoryType:(unint64_t)a3 lookupIdentifier:(id)a4
{
  id v7 = a4;
  if (![v7 length])
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PHSearchUtility.m", 499, @"Invalid parameter not satisfying: %@", @"lookupIdentifier.length > 0" object file lineNumber description];
  }
  if (a3 - 1500 <= 0x1F && ((1 << (a3 + 36)) & 0xC0300C03) != 0) {
    goto LABEL_5;
  }
  if (a3 - 2600 < 2)
  {
    uint64_t v8 = PLSearchHumanActionIdentifierFromLookupIdentifier();
    goto LABEL_6;
  }
  if (a3 - 2500 <= 1)
  {
LABEL_5:
    uint64_t v8 = PLSearchSceneIdentifierFromLookupIdentifier();
LABEL_6:
    uint64_t v9 = (void *)v8;
    goto LABEL_7;
  }
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

+ (id)CSAttributedEntityKeyFromPHSearchEntityCategoryType:(unint64_t)a3
{
  unint64_t v4 = a3 - 1;
  if (a3 - 1 <= 0x11 && ((0x33717u >> v4) & 1) != 0)
  {
    id v5 = **((id **)&unk_1E5841D80 + v4);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (unint64_t)PHSearchEntityCategoryTypeFromCSAttributedEntityType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F22868]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F22878]] & 1) != 0)
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F227F8]])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F227A0]])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F22850]])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F22838]])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F22830]])
  {
    unint64_t v4 = 10;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F22828]])
  {
    unint64_t v4 = 9;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F22848]])
  {
    unint64_t v4 = 13;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F22820]])
  {
    unint64_t v4 = 11;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F22840]])
  {
    unint64_t v4 = 14;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F22858]])
  {
    unint64_t v4 = 17;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F22860]])
  {
    unint64_t v4 = 18;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (unint64_t)PHSearchEntityCategoryTypeFromStringValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeDate"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"PHSearchEntityCategoryTypePeople"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeLocations"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeGenericLocations"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesWhat"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesPublicEvent"])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesPersonalEvent"])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesMusicTitle"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesMusicArtist"])
  {
    unint64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesMusicGenre"])
  {
    unint64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesMoods"])
  {
    unint64_t v4 = 11;
  }
  else
  {
    if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesDuration"]) {
      goto LABEL_27;
    }
    if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesTrip"])
    {
      unint64_t v4 = 13;
      goto LABEL_28;
    }
    if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesDuration"])
    {
LABEL_27:
      unint64_t v4 = 12;
      goto LABEL_28;
    }
    if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesPersonAgeType"])
    {
      unint64_t v4 = 14;
    }
    else if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesAllTime"])
    {
      unint64_t v4 = 15;
    }
    else if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesSortOrder"])
    {
      unint64_t v4 = 16;
    }
    else if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesPartOfDay"])
    {
      unint64_t v4 = 17;
    }
    else if ([v3 isEqualToString:@"PHSearchEntityCategoryTypeMemoriesPartOfWeek"])
    {
      unint64_t v4 = 18;
    }
    else
    {
      unint64_t v4 = 0;
    }
  }
LABEL_28:

  return v4;
}

+ (id)stringValueForPHSearchEntityCategoryType:(unint64_t)a3
{
  if (a3 - 1 > 0x11) {
    return @"PHSearchEntityCategoryTypeUndefined";
  }
  else {
    return off_1E5841E10[a3 - 1];
  }
}

+ (int64_t)CSSceneTypeFromIndexCategoryType:(unint64_t)a3
{
  if ((uint64_t)a3 <= 1519)
  {
    if (a3 - 1500 < 2) {
      return 1;
    }
    if (a3 - 1510 < 2) {
      return 4;
    }
  }
  else
  {
    char v3 = a3 + 16;
    if (a3 - 1520 <= 0x15)
    {
      if (((1 << v3) & 3) != 0) {
        return 6;
      }
      if (((1 << v3) & 0xC00) != 0) {
        return 7;
      }
      if (((1 << v3) & 0x300000) != 0) {
        return 8;
      }
    }
    if (a3 - 2500 < 2) {
      return 3;
    }
    if (a3 - 2600 <= 1) {
      return 2;
    }
  }
  return 0;
}

+ (id)CSAttributedEntityKeyFromIndexCategoryType:(unint64_t)a3
{
  id v4 = 0;
  if ((uint64_t)a3 > 1599)
  {
    if ((uint64_t)a3 > 1999)
    {
      if ((uint64_t)a3 > 2399)
      {
        if (a3 - 2400 < 2)
        {
          id v5 = (id *)MEMORY[0x1E4F227F0];
          goto LABEL_24;
        }
        if (a3 - 2500 >= 2 && a3 - 2600 >= 2) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
      if ((uint64_t)a3 > 2199)
      {
        if (a3 == 2200)
        {
          id v5 = (id *)MEMORY[0x1E4F22888];
        }
        else
        {
          if (a3 != 2300) {
            goto LABEL_25;
          }
          id v5 = (id *)MEMORY[0x1E4F22788];
        }
      }
      else if (a3 == 2000)
      {
        id v5 = (id *)MEMORY[0x1E4F227C8];
      }
      else
      {
        if (a3 != 2100) {
          goto LABEL_25;
        }
        id v5 = (id *)MEMORY[0x1E4F227D0];
      }
    }
    else if ((uint64_t)a3 <= 1800)
    {
      if ((uint64_t)a3 > 1699)
      {
        switch(a3)
        {
          case 0x6A4uLL:
            id v5 = (id *)MEMORY[0x1E4F22780];
            break;
          case 0x6A5uLL:
            id v5 = (id *)MEMORY[0x1E4F22778];
            break;
          case 0x708uLL:
            id v5 = (id *)MEMORY[0x1E4F227B8];
            break;
          default:
            goto LABEL_25;
        }
      }
      else
      {
        if (a3 - 1600 > 0xB || ((1 << (a3 - 64)) & 0xC03) == 0) {
          goto LABEL_25;
        }
        id v5 = (id *)MEMORY[0x1E4F22800];
      }
    }
    else if (a3 - 1900 >= 0x14)
    {
      if (a3 - 1802 >= 2)
      {
        if (a3 != 1801) {
          goto LABEL_25;
        }
        id v5 = (id *)MEMORY[0x1E4F227C0];
      }
      else
      {
        id v5 = (id *)MEMORY[0x1E4F227B0];
      }
    }
    else
    {
      id v5 = (id *)MEMORY[0x1E4F22808];
    }
LABEL_24:
    id v4 = *v5;
    goto LABEL_25;
  }
  if ((uint64_t)a3 > 1199)
  {
    if ((uint64_t)a3 <= 1399)
    {
      switch(a3)
      {
        case 0x4B0uLL:
          id v5 = (id *)MEMORY[0x1E4F227E8];
          break;
        case 0x4B1uLL:
          id v5 = (id *)MEMORY[0x1E4F228B0];
          break;
        case 0x4B2uLL:
          id v5 = (id *)MEMORY[0x1E4F227A8];
          break;
        case 0x4B3uLL:
        case 0x4B4uLL:
        case 0x4B5uLL:
          id v5 = (id *)MEMORY[0x1E4F228A8];
          break;
        default:
          JUMPOUT(0);
      }
      goto LABEL_24;
    }
    if (a3 - 1500 <= 0x1F && ((1 << (a3 + 36)) & 0xC0300C03) != 0)
    {
LABEL_23:
      id v5 = (id *)MEMORY[0x1E4F22890];
      goto LABEL_24;
    }
    if (a3 - 1400 >= 2) {
      goto LABEL_25;
    }
    id v5 = (id *)MEMORY[0x1E4F22880];
    goto LABEL_24;
  }
  id v5 = (id *)MEMORY[0x1E4F227F8];
  if (a3 - 1 < 0xE) {
    goto LABEL_24;
  }
  switch(a3)
  {
    case 0x44CuLL:
      id v5 = (id *)MEMORY[0x1E4F22790];
      goto LABEL_24;
    case 0x44DuLL:
      id v5 = (id *)MEMORY[0x1E4F22798];
      goto LABEL_24;
    case 0x44EuLL:
      id v5 = (id *)MEMORY[0x1E4F227A0];
      goto LABEL_24;
    case 0x44FuLL:
      id v5 = (id *)MEMORY[0x1E4F227D8];
      goto LABEL_24;
    case 0x450uLL:
    case 0x451uLL:
      id v5 = (id *)MEMORY[0x1E4F22898];
      goto LABEL_24;
    case 0x452uLL:
      id v5 = (id *)MEMORY[0x1E4F22858];
      goto LABEL_24;
    case 0x453uLL:
      id v5 = (id *)MEMORY[0x1E4F22860];
      goto LABEL_24;
    default:
      if (a3 - 1000 < 3) {
        goto LABEL_24;
      }
      break;
  }
LABEL_25:
  return v4;
}

+ (unint64_t)PHSearchEntityCategoryTypeFromPHSearchSuggestionCategoriesType:(unint64_t)a3
{
  if ((uint64_t)a3 > 6)
  {
    if (a3 != 7)
    {
      if (a3 == 42) {
        return 7;
      }
      return 0;
    }
    return 2;
  }
  else
  {
    if (a3 != 1) {
      return a3 == 4;
    }
    return 3;
  }
}

@end