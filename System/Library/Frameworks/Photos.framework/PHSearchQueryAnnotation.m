@interface PHSearchQueryAnnotation
+ (BOOL)hasCSAttributedEntityTypePhotosMemoriesTripKeyInAttributedQueryString:(id)a3;
+ (BOOL)isAllTimeWithAttributedQueryString:(id)a3;
+ (BOOL)isTripWithAttributedQueryString:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_addTripMeaningAnnotationForSpotlightAttributedQueryString:(id)a3;
+ (id)_annotationFromQueryString:(id)a3 inRange:(_NSRange)a4;
+ (id)_updateSpotlightAttributedQueryString:(id)a3 disambiguation:(id)a4 range:(_NSRange)a5;
+ (id)_updateSpotlightAttributedQueryString:(id)a3 suggestion:(id)a4 range:(_NSRange)a5;
+ (id)_updateSpotlightAttributedQueryString:(id)a3 withAnnotation:(id)a4 range:(_NSRange)a5;
+ (id)annotatedQueryStringFromLLMQUAttributedString:(id)a3 photoLibrary:(id)a4;
+ (id)annotatedQueryStringFromSpotlightAttributedQueryString:(id)a3 forSearchQuery:(id)a4 photosEntityStore:(id)a5 photoLibrary:(id)a6;
+ (id)searchQueryAnnotationsFromAttributedQueryString:(id)a3;
+ (id)selectedSuggestionsFromQueryString:(id)a3 inRange:(_NSRange)a4;
+ (id)sortOrderWithAttributedQueryString:(id)a3;
+ (id)spotlightAttributedQueryStringFromAnnotatedQueryString:(id)a3;
+ (id)updateQueryString:(id)a3 withSelectedSuggestion:(id)a4 inRange:(_NSRange)a5 additionalAttributes:(id)a6;
- (BOOL)isEqual:(id)a3;
- (PHSearchQueryAnnotation)initWithCoder:(id)a3;
- (PHSearchQueryAnnotation)initWithQueryToken:(id)a3;
- (PHSearchQueryAnnotation)initWithSuggestion:(id)a3 queryToken:(id)a4;
- (PHSearchQueryQUToken)QUToken;
- (PHSearchSuggestion)suggestion;
- (id)description;
- (id)jsonDictionary;
- (unint64_t)ambiguityType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSuggestion:(id)a3;
@end

@implementation PHSearchQueryAnnotation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_QUToken, 0);

  objc_storeStrong((id *)&self->_suggestion, 0);
}

- (PHSearchQueryQUToken)QUToken
{
  return self->_QUToken;
}

- (void)setSuggestion:(id)a3
{
}

- (PHSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (id)jsonDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(PHSearchQueryAnnotation *)self suggestion];
  v5 = [v4 jsonDictionary];
  [v3 setObject:v5 forKeyedSubscript:@"suggestion"];

  v6 = [(PHSearchQueryAnnotation *)self QUToken];
  v7 = [v6 jsonDictionary];
  [v3 setObject:v7 forKeyedSubscript:@"disambiguation_token"];

  unint64_t v8 = [(PHSearchQueryAnnotation *)self ambiguityType];
  v9 = @"PHSearchAmbiguityTypeNone";
  if (v8 == 1) {
    v9 = @"PHSearchAmbiguityTypePartiallyAmbiguous";
  }
  if (v8 == 2) {
    v9 = @"PHSearchAmbiguityTypeFullyAmbiguous";
  }
  v10 = v9;
  [v3 setObject:v10 forKeyedSubscript:@"ambiguity_type"];

  v11 = (void *)[v3 copy];

  return v11;
}

- (unint64_t)hash
{
  id v3 = [(PHSearchQueryAnnotation *)self suggestion];
  uint64_t v4 = [v3 hash];
  v5 = [(PHSearchQueryAnnotation *)self QUToken];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PHSearchQueryAnnotation *)a3;
  if (v4 == self)
  {
    char v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(PHSearchQueryAnnotation *)self suggestion];
      if (v6
        && ([(PHSearchQueryAnnotation *)v5 suggestion], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        unint64_t v8 = (void *)v7;
        v9 = [(PHSearchQueryAnnotation *)self suggestion];
        v10 = [(PHSearchQueryAnnotation *)v5 suggestion];
        char v11 = [v9 isEqual:v10];

        if (v11)
        {
LABEL_6:
          v12 = [(PHSearchQueryAnnotation *)self QUToken];
          if (v12
            && ([(PHSearchQueryAnnotation *)v5 QUToken], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v14 = (void *)v13;
            v15 = [(PHSearchQueryAnnotation *)self QUToken];
            v16 = [(PHSearchQueryAnnotation *)v5 QUToken];
            char v17 = [v15 isEqual:v16];
          }
          else
          {
            v14 = [(PHSearchQueryAnnotation *)self QUToken];
            v15 = [(PHSearchQueryAnnotation *)v5 QUToken];
            char v17 = v14 == v15;
          }

          goto LABEL_17;
        }
      }
      else
      {
        v18 = [(PHSearchQueryAnnotation *)self suggestion];
        v19 = [(PHSearchQueryAnnotation *)v5 suggestion];

        if (v6) {
        if (v18 == v19)
        }
          goto LABEL_6;
      }
      char v17 = 0;
LABEL_17:

      goto LABEL_18;
    }
    char v17 = 0;
  }
LABEL_18:

  return v17;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = [(PHSearchQueryAnnotation *)self QUToken];
  v5 = [(PHSearchQueryAnnotation *)self suggestion];
  unint64_t v6 = [(PHSearchQueryAnnotation *)self ambiguityType];
  uint64_t v7 = @"PHSearchAmbiguityTypeNone";
  if (v6 == 1) {
    uint64_t v7 = @"PHSearchAmbiguityTypePartiallyAmbiguous";
  }
  if (v6 == 2) {
    uint64_t v7 = @"PHSearchAmbiguityTypeFullyAmbiguous";
  }
  unint64_t v8 = v7;
  v9 = [v3 stringWithFormat:@"QU token: %@, suggestion: %@, ambiguityType: %@", v4, v5, v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  suggestion = self->_suggestion;
  id v5 = a3;
  [v5 encodeObject:suggestion forKey:@"PHSearchQueryAnnotationPropertySuggestion"];
  [v5 encodeObject:self->_QUToken forKey:@"PHSearchQueryAnnotationPropertyToken"];
}

- (PHSearchQueryAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchQueryAnnotationPropertySuggestion"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHSearchQueryAnnotationPropertyToken"];

  if (v5)
  {
    uint64_t v7 = [(PHSearchQueryAnnotation *)self initWithSuggestion:v5 queryToken:v6];
LABEL_5:
    unint64_t v8 = v7;
    self = v8;
    goto LABEL_6;
  }
  if (v6)
  {
    uint64_t v7 = [(PHSearchQueryAnnotation *)self initWithQueryToken:v6];
    goto LABEL_5;
  }
  v10 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)char v11 = 0;
    _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_FAULT, "Both suggestion and QUToken are nil", v11, 2u);
  }

  unint64_t v8 = 0;
LABEL_6:

  return v8;
}

- (unint64_t)ambiguityType
{
  id v3 = [(PHSearchQueryAnnotation *)self suggestion];

  if (v3) {
    return 0;
  }
  id v5 = [(PHSearchQueryAnnotation *)self QUToken];
  unint64_t v6 = [v5 ambiguityType];

  return v6;
}

- (PHSearchQueryAnnotation)initWithSuggestion:(id)a3 queryToken:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PHSearchQueryAnnotation.m", 52, @"Invalid parameter not satisfying: %@", @"suggestion" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PHSearchQueryAnnotation;
  v10 = [(PHSearchQueryAnnotation *)&v14 init];
  char v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_suggestion, a3);
    objc_storeStrong((id *)&v11->_QUToken, a4);
  }

  return v11;
}

- (PHSearchQueryAnnotation)initWithQueryToken:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PHSearchQueryAnnotation.m", 40, @"Invalid parameter not satisfying: %@", @"queryToken" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PHSearchQueryAnnotation;
  uint64_t v7 = [(PHSearchQueryAnnotation *)&v11 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_QUToken, a3);
  }

  return v8;
}

+ (id)_annotationFromQueryString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__9215;
  objc_super v14 = __Block_byref_object_dispose__9216;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PHSearchQueryAnnotation__annotationFromQueryString_inRange___block_invoke;
  v9[3] = &unk_1E5843008;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v9);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __62__PHSearchQueryAnnotation__annotationFromQueryString_inRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"PHSearchQueryAttributeKey"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)_updateSpotlightAttributedQueryString:(id)a3 disambiguation:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (__CFString *)a4;
  uint64_t v11 = [(__CFString *)v10 categoriesType];
  if (v11 <= 6)
  {
    if (v11 == 1)
    {
      v22 = [(__CFString *)v10 locationAssetUUIDs];
      uint64_t v23 = [v22 count];

      v24 = (void *)MEMORY[0x1E4F227F8];
      if (v23) {
        v24 = (void *)MEMORY[0x1E4F227E0];
      }
      objc_msgSend(v9, "tagRangeWithFilter:withCSAttributedEntityKey:", location, length, *v24);
      goto LABEL_30;
    }
    if (v11 != 4) {
      goto LABEL_17;
    }
    objc_super v14 = [(__CFString *)v10 startDate];
    id v15 = [(__CFString *)v10 endDate];
    uint64_t v16 = [(__CFString *)v10 startDateComponents];
    char v17 = (void *)v16;
    if (v14 && v15)
    {
      objc_msgSend(v9, "tagRangeWithFilter:withCSAttributedEntityKey:startDate:endDate:", location, length, *MEMORY[0x1E4F22818], v14, v15);
    }
    else
    {
      if (!v16)
      {
        v34 = PLSearchBackendQueryGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = [v9 string];
          *(_DWORD *)buf = 138412546;
          v38 = v10;
          __int16 v39 = 2112;
          v40 = v35;
          _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_DEFAULT, "Nil dates and date components found for date type suggestion: %@ for Spotlight query: %@, attempting to annotate with non-disambiguation tagging.", buf, 0x16u);
        }
        objc_msgSend(a1, "_updateSpotlightAttributedQueryString:suggestion:range:", v9, v10, location, length);
        id v30 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_26;
      }
      v28 = [(__CFString *)v10 endDateComponents];
      objc_msgSend(v9, "tagRangeWithFilter:withCSAttributedEntityKey:startDateComponents:endDateComponents:", location, length, *MEMORY[0x1E4F227A0], v17, v28);
    }
    goto LABEL_30;
  }
  if (v11 == 41)
  {
    uint64_t v18 = PLServicesLocalizedFrameworkString();
    objc_super v14 = (void *)v18;
    if (v18)
    {
      uint64_t v19 = *MEMORY[0x1E4F22800];
      uint64_t v36 = v18;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      objc_msgSend(v9, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:", location, length, v19, v20);
    }
    else
    {
      v20 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v29 = [v9 string];
        *(_DWORD *)buf = 138412290;
        v38 = v29;
        _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_ERROR, "Unable to find localized string for SEARCH_TRIP, will not annotate query as trip: %@", buf, 0xCu);
      }
    }

    objc_msgSend(v9, "tagRangeWithFilter:withCSAttributedEntityKey:", location, length, *MEMORY[0x1E4F227F8]);
    id v30 = v9;
LABEL_26:

    goto LABEL_32;
  }
  if (v11 != 12)
  {
    if (v11 == 7)
    {
      uint64_t v12 = *MEMORY[0x1E4F22878];
      uint64_t v13 = [(__CFString *)v10 personUUIDs];
      objc_msgSend(v9, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:filterOperator:", location, length, v12, v13, 1);

LABEL_30:
      id v21 = v9;
      goto LABEL_31;
    }
LABEL_17:
    v25 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [(__CFString *)v10 categoriesType];
      if ((unint64_t)(v26 - 1) > 0x29) {
        v27 = @"PHSearchSuggestionCategoriesTypeUndefined";
      }
      else {
        v27 = off_1E5844490[v26 - 1];
      }
      v31 = v27;
      v32 = [(__CFString *)v10 text];
      *(_DWORD *)buf = 138412546;
      v38 = v31;
      __int16 v39 = 2112;
      v40 = v32;
      _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_ERROR, "Unsupported categories type found for disambiguation suggestion: %@, no query filter applied for the suggestion: %@", buf, 0x16u);
    }
    goto LABEL_30;
  }
  objc_msgSend(a1, "_updateSpotlightAttributedQueryString:suggestion:range:", v9, v10, location, length);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
  id v30 = v21;
LABEL_32:

  return v30;
}

+ (id)_updateSpotlightAttributedQueryString:(id)a3 suggestion:(id)a4 range:(_NSRange)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 suggestionComponents];
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v62;
    uint64_t v52 = *MEMORY[0x1E4F8B778];
    v53 = (void *)*MEMORY[0x1E4F228B0];
    uint64_t v51 = *MEMORY[0x1E4F8B760];
    *(void *)&long long v11 = 138412546;
    long long v50 = v11;
    id v58 = v6;
    id v59 = v9;
    uint64_t v56 = *(void *)v62;
    id v57 = v7;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v62 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v61 + 1) + 8 * v14);
        uint64_t v16 = +[PHSearchUtility CSAttributedEntityKeyFromIndexCategoryType:](PHSearchUtility, "CSAttributedEntityKeyFromIndexCategoryType:", objc_msgSend(v15, "indexCategory", v50));
        if (!v16)
        {
          uint64_t v18 = PLSearchBackendQueryGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            [v15 indexCategory];
            uint64_t v19 = PLDebugStringForSearchIndexCategory();
            *(_DWORD *)buf = 138412802;
            id v69 = v19;
            __int16 v70 = 2112;
            id v71 = v15;
            __int16 v72 = 2112;
            id v73 = v7;
            v20 = v18;
            id v21 = "Unable to find CSAttributedEntityKey for index category: %@, no query filter applied for suggestion co"
                  "mponent: %@ for suggestion: %@";
            goto LABEL_16;
          }
LABEL_17:

          goto LABEL_75;
        }
        uint64_t v17 = [v15 indexCategory];
        if (v17 <= 1499)
        {
          if (v17 <= 1099)
          {
            if (v17 > 999)
            {
              if ((unint64_t)(v17 - 1003) < 4) {
                goto LABEL_79;
              }
              if ((unint64_t)(v17 - 1000) < 3) {
                goto LABEL_73;
              }
            }
            else
            {
              if ((unint64_t)(v17 - 1) < 0xE) {
                goto LABEL_73;
              }
              if (!v17)
              {
                uint64_t v18 = PLSearchBackendQueryGetLog();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v50;
                  id v69 = v15;
                  __int16 v70 = 2112;
                  id v71 = v7;
                  _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "Unexpected PLSearchIndexCategoryNone, no query filter applied for suggestion component: %@ for suggestion: %@", buf, 0x16u);
                }
                goto LABEL_17;
              }
            }
          }
          else if (v17 > 1299)
          {
            if (v17 > 1329)
            {
              if (v17 <= 1399)
              {
                if (v17 != 1330)
                {
                  if (v17 != 1331) {
                    goto LABEL_75;
                  }
                  goto LABEL_73;
                }
LABEL_87:
                v43 = [v7 personUUIDs];
                uint64_t v44 = [v43 count];

                if (v44)
                {
                  uint64_t v18 = [v7 personUUIDs];
                  objc_msgSend(v6, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:filterOperator:", a5.location, a5.length, v16, v18, 0);
                  goto LABEL_17;
                }
                goto LABEL_75;
              }
              if (v17 == 1400)
              {
                uint64_t v66 = v51;
                uint64_t v41 = (void *)MEMORY[0x1E4F1C978];
                v42 = &v66;
LABEL_90:
                v45 = [v41 arrayWithObjects:v42 count:1];
                objc_msgSend(v6, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:", a5.location, a5.length, v16, v45);

                v33 = v6;
                NSUInteger location = a5.location;
                NSUInteger length = a5.length;
                uint64_t v36 = v53;
LABEL_74:
                objc_msgSend(v33, "tagRangeWithFilter:withCSAttributedEntityKey:", location, length, v36);
                goto LABEL_75;
              }
              if (v17 == 1401)
              {
                uint64_t v65 = v52;
                uint64_t v41 = (void *)MEMORY[0x1E4F1C978];
                v42 = &v65;
                goto LABEL_90;
              }
            }
            else
            {
              if (v17 > 1319)
              {
                if ((unint64_t)(v17 - 1320) < 2)
                {
                  v37 = [v15 lookupIdentifier];

                  if (v37)
                  {
                    v38 = [v15 lookupIdentifier];
                    __int16 v39 = PLSearchContributorUUIDFromLookupIdentifier();

                    v67 = v39;
                    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
                    objc_msgSend(v6, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:", a5.location, a5.length, v16, v40);
                  }
                }
                goto LABEL_75;
              }
              switch(v17)
              {
                case 1300:
                  goto LABEL_87;
                case 1301:
                  goto LABEL_73;
                case 1310:
                  goto LABEL_79;
              }
            }
          }
          else
          {
            if ((unint64_t)(v17 - 1100) <= 7)
            {
              if (v17 == 1102) {
                goto LABEL_79;
              }
LABEL_73:
              v33 = v6;
              NSUInteger location = a5.location;
              NSUInteger length = a5.length;
              uint64_t v36 = v16;
              goto LABEL_74;
            }
            if ((unint64_t)(v17 - 1200) < 6) {
              goto LABEL_73;
            }
          }
        }
        else if (v17 <= 1899)
        {
          if (v17 > 1599)
          {
            BOOL v26 = (unint64_t)(v17 - 1600) > 0xB || ((1 << (v17 - 64)) & 0xC03) == 0;
            if (!v26 || (unint64_t)(v17 - 1800) < 4 || (unint64_t)(v17 - 1700) < 2) {
              goto LABEL_73;
            }
          }
          else
          {
            char v22 = v17 + 36;
            if ((unint64_t)(v17 - 1500) > 0x29) {
              goto LABEL_75;
            }
            if (((1 << v22) & 0xC0300C03) != 0)
            {
LABEL_37:
              +[PHSearchUtility CSSceneTypeFromIndexCategoryType:](PHSearchUtility, "CSSceneTypeFromIndexCategoryType:", [v15 indexCategory]);
              uint64_t v23 = [v15 lookupIdentifier];
              v24 = [v15 lookupIdentifier];
              if (v24)
              {
                v25 = +[PHSearchUtility sceneIdFromIndexCategoryType:lookupIdentifier:](PHSearchUtility, "sceneIdFromIndexCategoryType:lookupIdentifier:", [v15 indexCategory], v23);
              }
              else
              {
                v25 = 0;
              }

              int64_t v27 = +[PHSearchUtility CSSceneTypeFromIndexCategoryType:](PHSearchUtility, "CSSceneTypeFromIndexCategoryType:", [v15 indexCategory]);
              v28 = [v15 lookupIdentifier];

              uint64_t v29 = [v15 lookupIdentifier];
              if (v29)
              {
                id v30 = (void *)v29;
                v31 = +[PHSearchUtility sceneIdFromIndexCategoryType:lookupIdentifier:](PHSearchUtility, "sceneIdFromIndexCategoryType:lookupIdentifier:", [v15 indexCategory], v28);

                if (v27)
                {
                  id v7 = v57;
                  id v6 = v58;
                  uint64_t v13 = v56;
                  if (v31)
                  {
                    v32 = [NSNumber numberWithInteger:v27];
                    [v55 addObject:v32];

                    [v54 addObject:v31];
                  }
                  goto LABEL_69;
                }
              }
              else
              {

                v31 = 0;
              }
              id v7 = v57;
              id v6 = v58;
              uint64_t v13 = v56;
LABEL_69:

              id v9 = v59;
              goto LABEL_75;
            }
            if (((1 << v22) & 0x30000000000) != 0) {
              goto LABEL_79;
            }
          }
        }
        else if (v17 > 2199)
        {
          if (v17 <= 2499)
          {
            if ((unint64_t)(v17 - 2400) < 2 || v17 == 2200 || v17 == 2300) {
              goto LABEL_73;
            }
          }
          else if (v17 > 2699)
          {
            if (v17 == 2700 || v17 == 2800)
            {
LABEL_79:
              uint64_t v18 = PLSearchBackendQueryGetLog();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                [v15 indexCategory];
                uint64_t v19 = PLDebugStringForSearchIndexCategory();
                *(_DWORD *)buf = 138412802;
                id v69 = v19;
                __int16 v70 = 2112;
                id v71 = v15;
                __int16 v72 = 2112;
                id v73 = v7;
                v20 = v18;
                id v21 = "Unexpected PLSearchIndexCategory: %@, no query filter applied for suggestion component: %@ for suggestion: %@";
LABEL_16:
                _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x20u);
              }
              goto LABEL_17;
            }
          }
          else if ((unint64_t)(v17 - 2500) < 2 || (unint64_t)(v17 - 2600) < 2)
          {
            goto LABEL_37;
          }
        }
        else
        {
          if ((unint64_t)(v17 - 1900) < 0x14) {
            goto LABEL_73;
          }
          if (v17 == 2000)
          {
            objc_msgSend(v6, "tagRangeWithFilter:withCSAttributedEntityKey:numberValues:", a5.location, a5.length, v16, &unk_1EEB268C8);
          }
          else if (v17 == 2100)
          {
            goto LABEL_73;
          }
        }
LABEL_75:

        ++v14;
      }
      while (v12 != v14);
      uint64_t v46 = [v9 countByEnumeratingWithState:&v61 objects:v74 count:16];
      uint64_t v12 = v46;
    }
    while (v46);
  }

  uint64_t v47 = [v55 count];
  if (v47 == [v54 count])
  {
    if ([v55 count] && objc_msgSend(v54, "count")) {
      objc_msgSend(v6, "tagRangeWithSceneFilters:withCSSceneTypes:sceneIDs:", a5.location, a5.length, v55, v54);
    }
  }
  else
  {
    v48 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v69 = v7;
      __int16 v70 = 2112;
      id v71 = v55;
      __int16 v72 = 2112;
      id v73 = v54;
      _os_log_impl(&dword_19B043000, v48, OS_LOG_TYPE_ERROR, "Unaligned scene identifiers and scene types, no query filter applied for suggestion: %@, sceneTypes: %@, sceneIds: %@", buf, 0x20u);
    }
  }

  return v6;
}

+ (id)_addTripMeaningAnnotationForSpotlightAttributedQueryString:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = PLServicesLocalizedFrameworkString();
  if (v4)
  {
    uint64_t v5 = [v3 length];
    uint64_t v6 = *MEMORY[0x1E4F22800];
    v12[0] = v4;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    objc_msgSend(v3, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:", 0, v5, v6, v7);
  }
  else
  {
    id v7 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v3 string];
      int v10 = 138412290;
      long long v11 = v8;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Unable to find localized string for SEARCH_TRIP, will not annotate query as trip: %@", (uint8_t *)&v10, 0xCu);
    }
  }

  return v3;
}

+ (id)_updateSpotlightAttributedQueryString:(id)a3 withAnnotation:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_28:
    id v27 = v10;
    goto LABEL_29;
  }
  uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, a1, @"PHSearchQueryAnnotation.m", 537, @"Invalid parameter not satisfying: %@", @"attributedQueryString" object file lineNumber description];

  if (!v12) {
    goto LABEL_28;
  }
LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v19 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = [v10 string];
      *(_DWORD *)buf = 138412546;
      v31 = v20;
      __int16 v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Cannot update query string: %@ with annotation: %@ because it belongs to an unexpected class", buf, 0x16u);
    }
    goto LABEL_28;
  }
  if (!+[PHSearchUtility rangeExists:forString:](PHSearchUtility, "rangeExists:forString:", location, length, v10))
  {
    id v21 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      char v22 = [v10 string];
      v38.NSUInteger location = location;
      v38.NSUInteger length = length;
      uint64_t v23 = NSStringFromRange(v38);
      *(_DWORD *)buf = 138412802;
      v31 = v22;
      __int16 v32 = 2112;
      v33 = v12;
      __int16 v34 = 2112;
      v35 = v23;
      _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_ERROR, "Cannot update query string: %@ with annotation: %@ because the provided range is out of bounds: %@", buf, 0x20u);
    }
    goto LABEL_28;
  }
  uint64_t v13 = [v12 QUToken];
  if ([v13 hasMemoryGenAnnotation])
  {
    uint64_t v14 = [v12 suggestion];

    if (!v14) {
      goto LABEL_10;
    }
    uint64_t v13 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v15 = [v10 string];
      *(_DWORD *)buf = 138412546;
      v31 = v12;
      __int16 v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_INFO, "Found suggestion on memory gen annotation: %@, may be erroneous for query: %@", buf, 0x16u);
    }
  }

LABEL_10:
  uint64_t v16 = [v12 suggestion];

  if (!v16)
  {
    v24 = [v12 QUToken];
    int v25 = [v24 hasMemoryGenAnnotation];

    if (v25)
    {
      BOOL v26 = [v12 QUToken];
      uint64_t v17 = [v26 entityCategoryTypes];

      if (([v17 containsIndex:5] & 1) == 0
        && (([v17 containsIndex:11] & 1) != 0
         || ([v17 containsIndex:12] & 1) != 0
         || ([v17 containsIndex:8] & 1) != 0
         || ([v17 containsIndex:10] & 1) != 0
         || [v17 containsIndex:9]))
      {
        objc_msgSend(v10, "tagRangeWithFilter:withCSAttributedEntityKey:", location, length, *MEMORY[0x1E4F227E0]);
      }
LABEL_27:
    }
    goto LABEL_28;
  }
  uint64_t v17 = [v12 suggestion];
  switch([v17 type])
  {
    case 0:
      id v18 = v10;
      break;
    case 1:
    case 2:
    case 4:
      objc_msgSend(a1, "_updateSpotlightAttributedQueryString:suggestion:range:", v10, v17, location, length);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(a1, "_updateSpotlightAttributedQueryString:disambiguation:range:", v10, v17, location, length);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      goto LABEL_27;
  }
  id v27 = v18;

LABEL_29:

  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)annotatedQueryStringFromSpotlightAttributedQueryString:(id)a3 forSearchQuery:(id)a4 photosEntityStore:(id)a5 photoLibrary:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v11 searchText];
  id v15 = +[PHSearchUtility insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:v14];

  uint64_t v16 = [v11 searchOptions];
  char v17 = [v16 enableQueryUnderstanding];

  if ((v17 & 1) == 0)
  {
    uint64_t v31 = [v15 copy];
LABEL_14:
    id v30 = (id)v31;
    goto LABEL_15;
  }
  if (![v10 length])
  {
    __int16 v32 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_ERROR, "No QU annotated string provided to search by Spotlight for query: \"%@\"", buf, 0xCu);
    }
    goto LABEL_13;
  }
  id v18 = [v10 string];
  uint64_t v19 = [v15 string];
  char v20 = [v18 isEqualToString:v19];

  if ((v20 & 1) == 0)
  {
    __int16 v32 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = [v10 string];
      __int16 v34 = [v15 string];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v33;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v34;
      _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_ERROR, "QU annotated string value: %@ is not equal to the original string provided to spotlight: %@, cannot annotate the provided string.", buf, 0x16u);
    }
LABEL_13:

    uint64_t v31 = [v15 copy];
    goto LABEL_14;
  }
  id v21 = objc_alloc(MEMORY[0x1E4F28E48]);
  char v22 = [v10 string];
  uint64_t v23 = (void *)[v21 initWithString:v22];

  uint64_t v24 = [v15 length];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __128__PHSearchQueryAnnotation_annotatedQueryStringFromSpotlightAttributedQueryString_forSearchQuery_photosEntityStore_photoLibrary___block_invoke;
  v45[3] = &unk_1E5843058;
  id v25 = v23;
  id v46 = v25;
  objc_msgSend(v15, "enumerateAttributesInRange:options:usingBlock:", 0, v24, 0, v45);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v48 = 0;
  uint64_t v26 = [v10 length];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __128__PHSearchQueryAnnotation_annotatedQueryStringFromSpotlightAttributedQueryString_forSearchQuery_photosEntityStore_photoLibrary___block_invoke_2;
  v36[3] = &unk_1E5843080;
  id v44 = a1;
  id v37 = v15;
  id v38 = v11;
  id v39 = v10;
  id v40 = v13;
  id v41 = v12;
  v43 = buf;
  id v27 = v25;
  id v42 = v27;
  objc_msgSend(v39, "enumerateAttributesInRange:options:usingBlock:", 0, v26, 0, v36);
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    uint64_t v28 = [v27 length];
    objc_msgSend(v27, "addAttribute:value:range:", @"PHSearchQueryTripAttributeKey", MEMORY[0x1E4F1CC38], 0, v28);
  }
  uint64_t v29 = v42;
  id v30 = v27;

  _Block_object_dispose(buf, 8);
LABEL_15:

  return v30;
}

void __128__PHSearchQueryAnnotation_annotatedQueryStringFromSpotlightAttributedQueryString_forSearchQuery_photosEntityStore_photoLibrary___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = [a2 objectForKeyedSubscript:@"PHSearchQueryAttributeKey"];
  id v7 = [v8 suggestion];
  if (v7) {
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", @"PHSearchQueryAttributeKey", v8, a3, a4);
  }
}

void __128__PHSearchQueryAnnotation_annotatedQueryStringFromSpotlightAttributedQueryString_forSearchQuery_photosEntityStore_photoLibrary___block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = objc_msgSend(*(id *)(a1 + 88), "_annotationFromQueryString:inRange:", *(void *)(a1 + 32), a3, a4);
  if (v8) {
    goto LABEL_121;
  }
  uint64_t v132 = a1;
  v127.NSUInteger location = a3;
  v127.NSUInteger length = a4;
  uint64_t v9 = *MEMORY[0x1E4F22868];
  *((void *)&v125 + 1) = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F22868]];
  uint64_t v10 = *MEMORY[0x1E4F22878];
  *(void *)&long long v125 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F22878]];
  id v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F227F8]];
  v126 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F227A0]];
  uint64_t v12 = *MEMORY[0x1E4F22850];
  id v13 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F22850]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v15 = [v7 objectForKeyedSubscript:v12];
  uint64_t v16 = v15;
  if (isKindOfClass)
  {
    char v17 = [v15 BOOLValue];

    v122 = 0;
  }
  else
  {
    objc_opt_class();
    char v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) == 0)
    {
      int v19 = 0;
      v122 = 0;
      BOOL v20 = v11 == 0;
      char v21 = 1;
      goto LABEL_10;
    }
    v122 = [v7 objectForKeyedSubscript:v12];
    char v17 = 1;
  }
  int v19 = 0;
  BOOL v20 = v11 == 0;
  char v21 = v17 ^ 1;
  if (v11 && ((v17 ^ 1) & 1) == 0)
  {
    char v22 = [*(id *)(v132 + 40) searchOptions];
    int v19 = [v22 enableQueryUnderstandingGenericLocations];

    BOOL v20 = 0;
    char v121 = v19;
    goto LABEL_11;
  }
LABEL_10:
  char v121 = v21;
LABEL_11:
  id v128 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v131 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v23 = 0x1E4F29000uLL;
  v123 = v11;
  id v124 = v7;
  if (v125 != 0)
  {
    [v128 addIndex:2];
    uint64_t v129 = +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:2];
    uint64_t v24 = [*(id *)(v132 + 48) string];
    id v25 = objc_msgSend(v24, "substringWithRange:", v127.location, a4);

    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v27 = v26;
    if ((void)v125) {
      [v26 setObject:(void)v125 forKeyedSubscript:v10];
    }
    if (*((void *)&v125 + 1)) {
      [v27 setObject:*((void *)&v125 + 1) forKeyedSubscript:v9];
    }
    +[PHSearchQueryDisambiguation performDisambiguationForPersonName:v25 expansionStringValuesByCSAttributedEntityType:v27 photoLibrary:*(void *)(v132 + 56)];
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v28 countByEnumeratingWithState:&v149 objects:v166 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v150;
      while (2)
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v150 != v31) {
            objc_enumerationMutation(v28);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            __int16 v34 = (void *)v129;
            [v131 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:v129];
            v35 = PLSearchBackendQueryGetLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              uint64_t v36 = NSStringFromRange(v127);
              [*(id *)(v132 + 40) searchText];
              id v38 = v37 = v20;
              *(_DWORD *)buf = 138412802;
              v161 = v36;
              __int16 v162 = 2112;
              v163 = v38;
              __int16 v164 = 2112;
              id v165 = v28;
              _os_log_impl(&dword_19B043000, v35, OS_LOG_TYPE_ERROR, "QU person data for range: %@ in query: %@ has an unexpected data type: %@", buf, 0x20u);

              BOOL v20 = v37;
              __int16 v34 = (void *)v129;
            }
            goto LABEL_31;
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v149 objects:v166 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }

    if ([v28 count]) {
      id v33 = v28;
    }
    else {
      id v33 = (id)MEMORY[0x1E4F1CBF0];
    }
    __int16 v34 = (void *)v129;
    [v131 setObject:v33 forKeyedSubscript:v129];
LABEL_31:
    id v7 = v124;

    id v11 = v123;
    unint64_t v23 = 0x1E4F29000uLL;
  }
  if (v19)
  {
    [v128 addIndex:4];
    uint64_t v120 = +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:4];
    if ([v11 count])
    {
      id v39 = v11;
    }
    else
    {
      uint64_t v49 = [*(id *)(v132 + 48) string];
      long long v50 = [v49 substringWithRange:v127];

      if (v50)
      {
        v159 = v50;
        id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v159 count:1];
      }
      else
      {
        id v39 = 0;
      }
    }
    id v130 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id v45 = v39;
    uint64_t v51 = [v45 countByEnumeratingWithState:&v145 objects:v158 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v146;
      while (2)
      {
        for (uint64_t j = 0; j != v52; ++j)
        {
          if (*(void *)v146 != v53) {
            objc_enumerationMutation(v45);
          }
          uint64_t v55 = *(void *)(*((void *)&v145 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v41 = (void *)v120;
            [v131 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:v120];
            uint64_t v47 = PLSearchBackendQueryGetLog();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              long long v63 = NSStringFromRange(v127);
              long long v64 = [*(id *)(v132 + 40) searchText];
              *(_DWORD *)buf = 138412802;
              v161 = v63;
              __int16 v162 = 2112;
              v163 = v64;
              __int16 v164 = 2112;
              id v165 = v45;
              _os_log_impl(&dword_19B043000, v47, OS_LOG_TYPE_ERROR, "QU generic location data for range: %@ in query: %@ has an unexpected data type: %@", buf, 0x20u);
            }
            id v7 = v124;
            id v40 = v128;
            id v46 = v130;
            goto LABEL_58;
          }
          unint64_t v56 = v23;
          id v57 = (void *)[objc_alloc(MEMORY[0x1E4F8A7D8]) initWithQueryTerm:v55 disambiguationType:2 indexingCategories:0 maxNumberOfResults:0 matchOptions:15];
          id v58 = objc_alloc(MEMORY[0x1E4F8ACB8]);
          id v59 = [*(id *)(v132 + 56) photoLibrary];
          v60 = (void *)[v58 initWithDisambiguation:v57 photoLibrary:v59 photosEntityStore:*(void *)(v132 + 64)];

          long long v61 = [v60 performDisambiguationQuery];
          long long v62 = [v61 genericLocationTuples];
          if ([v62 count]) {
            [v130 addObjectsFromArray:v62];
          }

          unint64_t v23 = v56;
        }
        uint64_t v52 = [v45 countByEnumeratingWithState:&v145 objects:v158 count:16];
        if (v52) {
          continue;
        }
        break;
      }
    }

    id v46 = v130;
    uint64_t v47 = [v130 copy];
    id v41 = (void *)v120;
    [v131 setObject:v47 forKeyedSubscript:v120];
    id v7 = v124;
  }
  else
  {
    id v40 = v128;
    if (v20) {
      goto LABEL_59;
    }
    [v128 addIndex:3];
    id v41 = +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:3];
    id v42 = [*(id *)(v132 + 48) string];
    v43 = [v42 substringWithRange:v127];

    id v44 = v11;
    id v45 = v43;
    id v46 = +[PHSearchQueryDisambiguation performDisambiguationForLocationName:v43 expansionStringValues:v44 allowedSearchIndexCategories:0 photoLibrary:*(void *)(v132 + 56)];
    uint64_t v47 = [v43 lowercaseString];
    if ([v46 containsObject:v47])
    {
      v157 = v47;
      char v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v157 count:1];
      [v131 setObject:v48 forKeyedSubscript:v41];
    }
    else
    {
      [v131 setObject:v46 forKeyedSubscript:v41];
    }
  }
  id v40 = v128;
LABEL_58:

LABEL_59:
  if (v126)
  {
    [v40 addIndex:1];
    uint64_t v65 = +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:1];
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    id v66 = v126;
    uint64_t v67 = [v66 countByEnumeratingWithState:&v141 objects:v156 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v142;
      while (2)
      {
        for (uint64_t k = 0; k != v68; ++k)
        {
          if (*(void *)v142 != v69) {
            objc_enumerationMutation(v66);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_72;
          }
        }
        uint64_t v68 = [v66 countByEnumeratingWithState:&v141 objects:v156 count:16];
        if (v68) {
          continue;
        }
        break;
      }
    }

    if ([v66 count] && objc_msgSend(v66, "count") != 2)
    {
LABEL_72:
      [v131 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:v65];
      id v71 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        __int16 v72 = NSStringFromRange(v127);
        id v73 = [*(id *)(v132 + 40) searchText];
        *(_DWORD *)buf = 138412802;
        v161 = v72;
        __int16 v162 = 2112;
        v163 = v73;
        __int16 v164 = 2112;
        id v165 = v66;
        _os_log_impl(&dword_19B043000, v71, OS_LOG_TYPE_ERROR, "QU date data for range: %@ in query: %@ has an unexpected data type: %@", buf, 0x20u);
      }
    }
    else
    {
      [v131 setObject:v66 forKeyedSubscript:v65];
    }
    id v40 = v128;
  }
  v74 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F22838]];
  int v75 = [v74 BOOLValue];

  v76 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F22828]];
  int v77 = [v76 BOOLValue];

  v78 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F22830]];
  int v79 = [v78 BOOLValue];

  v80 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F22848]];
  int v81 = [v80 BOOLValue];

  v82 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F22820]];
  v83 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F22810]];
  if (v121)
  {
    if (!v75) {
      goto LABEL_78;
    }
  }
  else
  {
    [v40 addIndex:5];
    v92 = +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:5];
    if ([v122 count]) {
      v93 = v122;
    }
    else {
      v93 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v40 = v128;
    [v131 setObject:v93 forKeyedSubscript:v92];

    if (!v75)
    {
LABEL_78:
      if (!v77) {
        goto LABEL_79;
      }
      goto LABEL_102;
    }
  }
  [v40 addIndex:8];
  v94 = +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:8];
  [v131 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:v94];

  if (!v77)
  {
LABEL_79:
    if (!v79) {
      goto LABEL_80;
    }
    goto LABEL_103;
  }
LABEL_102:
  [v40 addIndex:9];
  v95 = +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:9];
  [v131 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:v95];

  if (!v79)
  {
LABEL_80:
    if (!v82) {
      goto LABEL_81;
    }
    goto LABEL_104;
  }
LABEL_103:
  [v40 addIndex:10];
  v96 = +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:10];
  [v131 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:v96];

  if (!v82)
  {
LABEL_81:
    if (!v83) {
      goto LABEL_82;
    }
LABEL_127:
    [v40 addIndex:12];
    v116 = +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:12];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v154 = v83;
      v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v154 count:1];
      [v131 setObject:v117 forKeyedSubscript:v116];
    }
    else
    {
      [v131 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:v116];
      v117 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
      {
        v118 = NSStringFromRange(v127);
        v119 = [*(id *)(v132 + 40) searchText];
        *(_DWORD *)buf = 138412802;
        v161 = v118;
        __int16 v162 = 2112;
        v163 = v119;
        __int16 v164 = 2112;
        id v165 = v83;
        _os_log_impl(&dword_19B043000, v117, OS_LOG_TYPE_ERROR, "QU memories duration data for range: %@ in query: %@ has an unexpected data type: %@", buf, 0x20u);
      }
    }

    if (!v81) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
LABEL_104:
  [v40 addIndex:11];
  v97 = +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:11];
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v98 = v82;
  uint64_t v99 = [v98 countByEnumeratingWithState:&v137 objects:v155 count:16];
  if (v99)
  {
    uint64_t v100 = v99;
    uint64_t v101 = *(void *)v138;
    while (2)
    {
      for (uint64_t m = 0; m != v100; ++m)
      {
        if (*(void *)v138 != v101) {
          objc_enumerationMutation(v98);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_123;
        }
      }
      uint64_t v100 = [v98 countByEnumeratingWithState:&v137 objects:v155 count:16];
      if (v100) {
        continue;
      }
      break;
    }
  }

  if ([v98 count])
  {
    [v131 setObject:v98 forKeyedSubscript:v97];
  }
  else
  {
LABEL_123:
    [v131 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:v97];
    v113 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
    {
      v114 = NSStringFromRange(v127);
      v115 = [*(id *)(v132 + 40) searchText];
      *(_DWORD *)buf = 138412802;
      v161 = v114;
      __int16 v162 = 2112;
      v163 = v115;
      __int16 v164 = 2112;
      id v165 = v98;
      _os_log_impl(&dword_19B043000, v113, OS_LOG_TYPE_ERROR, "QU memories moods data for range: %@ in query: %@ has an unexpected data type: %@", buf, 0x20u);
    }
  }
  id v7 = v124;
  id v40 = v128;

  if (v83) {
    goto LABEL_127;
  }
LABEL_82:
  if (v81) {
LABEL_83:
  }
    *(unsigned char *)(*(void *)(*(void *)(v132 + 80) + 8) + 24) = 1;
LABEL_84:
  v84 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F22840]];
  if (v84)
  {
    [v40 addIndex:14];
    v85 = +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:14];
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v86 = v84;
    uint64_t v87 = [v86 countByEnumeratingWithState:&v133 objects:v153 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      uint64_t v89 = *(void *)v134;
      while (2)
      {
        for (uint64_t n = 0; n != v88; ++n)
        {
          if (*(void *)v134 != v89) {
            objc_enumerationMutation(v86);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            [v131 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:v85];
            v103 = PLSearchBackendQueryGetLog();
            if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
            {
              v104 = NSStringFromRange(v127);
              v105 = [*(id *)(v132 + 40) searchText];
              *(_DWORD *)buf = 138412802;
              v161 = v104;
              __int16 v162 = 2112;
              v163 = v105;
              __int16 v164 = 2112;
              id v165 = v86;
              _os_log_impl(&dword_19B043000, v103, OS_LOG_TYPE_ERROR, "QU person age type data for range: %@ in query: %@ has an unexpected data type: %@", buf, 0x20u);
            }
            goto LABEL_117;
          }
        }
        uint64_t v88 = [v86 countByEnumeratingWithState:&v133 objects:v153 count:16];
        if (v88) {
          continue;
        }
        break;
      }
    }

    if ([v86 count]) {
      id v91 = v86;
    }
    else {
      id v91 = (id)MEMORY[0x1E4F1CBF0];
    }
    [v131 setObject:v91 forKeyedSubscript:v85];
LABEL_117:
    id v7 = v124;
    id v40 = v128;
  }
  v106 = v131;
  if ([v131 count])
  {
    v107 = [*(id *)(v132 + 72) string];
    v108 = [v107 substringWithRange:v127];

    v109 = [PHSearchQueryQUToken alloc];
    v110 = (void *)[v128 copy];
    v111 = [(PHSearchQueryQUToken *)v109 initWithText:v108 entityCategoryTypes:v110 metadata:v131];

    v112 = [[PHSearchQueryAnnotation alloc] initWithQueryToken:v111];
    id v40 = v128;
    [*(id *)(v132 + 72) addAttribute:@"PHSearchQueryAttributeKey" value:v112 range:v127];

    v106 = v131;
  }

  id v8 = 0;
LABEL_121:
}

+ (id)spotlightAttributedQueryStringFromAnnotatedQueryString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__9215;
    id v15 = __Block_byref_object_dispose__9216;
    id v5 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v6 = [v4 string];
    id v16 = (id)[v5 initWithString:v6];

    uint64_t v7 = [v4 length];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__PHSearchQueryAnnotation_spotlightAttributedQueryStringFromAnnotatedQueryString___block_invoke;
    v10[3] = &unk_1E5843030;
    v10[4] = &v11;
    v10[5] = a1;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", @"PHSearchQueryAttributeKey", 0, v7, 0, v10);
    id v8 = (void *)[(id)v12[5] copy];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __82__PHSearchQueryAnnotation_spotlightAttributedQueryStringFromAnnotatedQueryString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "_updateSpotlightAttributedQueryString:withAnnotation:range:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2, a3, a4);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

+ (id)selectedSuggestionsFromQueryString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (![v8 length])
  {
    int v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PHSearchQueryAnnotation.m", 142, @"Invalid parameter not satisfying: %@", @"queryString.length > 0" object file lineNumber description];
  }
  if (+[PHSearchUtility rangeExists:forString:](PHSearchUtility, "rangeExists:forString:", location, length, v8))
  {
    *(void *)id v25 = 0;
    *(void *)&v25[8] = v25;
    *(void *)&v25[16] = 0x3032000000;
    id v26 = __Block_byref_object_copy__9215;
    id v27 = __Block_byref_object_dispose__9216;
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = objc_msgSend(v8, "attributedSubstringFromRange:", location, length);
    uint64_t v10 = [v9 length];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__PHSearchQueryAnnotation_selectedSuggestionsFromQueryString_inRange___block_invoke;
    v20[3] = &unk_1E5843008;
    v20[4] = v25;
    objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v20);
    if (![*(id *)(*(void *)&v25[8] + 40) count])
    {
      uint64_t v11 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v31.NSUInteger location = location;
        v31.NSUInteger length = length;
        NSStringFromRange(v31);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v8 string];
        *(_DWORD *)buf = 138412546;
        id v22 = v12;
        __int16 v23 = 2112;
        uint64_t v24 = v13;
        _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_INFO, "Unable to find selected suggestions in range: %@ for query string: %@", buf, 0x16u);
      }
    }
    id v14 = *(id *)(*(void *)&v25[8] + 40);

    _Block_object_dispose(v25, 8);
  }
  else
  {
    id v15 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v32.NSUInteger location = location;
      v32.NSUInteger length = length;
      id v16 = NSStringFromRange(v32);
      char v17 = [v8 string];
      *(_DWORD *)id v25 = 138412546;
      *(void *)&v25[4] = v16;
      *(_WORD *)&v25[12] = 2112;
      *(void *)&v25[14] = v17;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Received out of bounds range: %@ for query string: %@", v25, 0x16u);
    }
    id v14 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

void __70__PHSearchQueryAnnotation_selectedSuggestionsFromQueryString_inRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"PHSearchQueryAttributeKey"];
  if (v3)
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v6 = v3;
    uint64_t v5 = [v3 suggestion];
    [v4 addObject:v5];

    id v3 = v6;
  }
}

+ (id)updateQueryString:(id)a3 withSelectedSuggestion:(id)a4 inRange:(_NSRange)a5 additionalAttributes:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (![v12 length])
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"PHSearchQueryAnnotation.m", 77, @"Invalid parameter not satisfying: %@", @"queryString.length > 0" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
LABEL_18:
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"PHSearchQueryAnnotation.m", 78, @"Invalid parameter not satisfying: %@", @"selectedSuggestion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v13) {
    goto LABEL_18;
  }
LABEL_3:
  if ([v13 type] == 2
    || +[PHSearchUtility rangeExists:forString:](PHSearchUtility, "rangeExists:forString:", location, length, v12))
  {
    id v15 = (void *)[v12 mutableCopy];
    if ([v13 type] == 2)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28E48]);
      char v17 = [v13 text];
      char v18 = (void *)[v16 initWithString:v17];

      int v19 = [[PHSearchQueryAnnotation alloc] initWithSuggestion:v13 queryToken:0];
      uint64_t v36 = @"PHSearchQueryAttributeKey";
      BOOL v37 = v19;
      BOOL v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      char v21 = (void *)[v20 mutableCopy];

      if (v14) {
        [v21 addEntriesFromDictionary:v14];
      }
      id v22 = (void *)[v21 copy];
      objc_msgSend(v18, "setAttributes:range:", v22, 0, objc_msgSend(v18, "length"));

      [v15 appendAttributedString:v18];
    }
    else
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __97__PHSearchQueryAnnotation_updateQueryString_withSelectedSuggestion_inRange_additionalAttributes___block_invoke;
      v30[3] = &unk_1E5842FE0;
      NSUInteger v34 = location;
      NSUInteger v35 = length;
      id v31 = v15;
      id v32 = v13;
      id v33 = v14;
      objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", @"PHSearchQueryAttributeKey", location, length, 0, v30);

      char v18 = v31;
    }

    id v23 = (id)[v15 copy];
  }
  else
  {
    uint64_t v24 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v46.NSUInteger location = location;
      v46.NSUInteger length = length;
      id v25 = NSStringFromRange(v46);
      id v26 = [v12 string];
      *(_DWORD *)buf = 138412802;
      id v39 = v25;
      __int16 v40 = 2112;
      id v41 = v13;
      __int16 v42 = 2112;
      v43 = v26;
      _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_ERROR, "Received out of bounds range: %@ for suggestion: %@ in query string: %@", buf, 0x20u);
    }
    id v23 = v12;
  }

  return v23;
}

void __97__PHSearchQueryAnnotation_updateQueryString_withSelectedSuggestion_inRange_additionalAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  uint64_t v10 = v9;
  if (a3 == *(void *)(a1 + 56) && a4 == *(void *)(a1 + 64))
  {
    id v12 = v9;
    if (v12) {
      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", @"PHSearchQueryAttributeKey", *(void *)(a1 + 56), *(void *)(a1 + 64));
    }
    id v13 = [v12 QUToken];
    id v14 = [[PHSearchQueryAnnotation alloc] initWithSuggestion:*(void *)(a1 + 40) queryToken:v13];
    if ([*(id *)(a1 + 40) type])
    {
      id v22 = @"PHSearchQueryAttributeKey";
      v23[0] = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v16 = (void *)[v15 mutableCopy];

      if (*(void *)(a1 + 48)) {
        objc_msgSend(v16, "addEntriesFromDictionary:");
      }
      if ([*(id *)(a1 + 40) type] == 3)
      {
        char v17 = *(void **)(a1 + 32);
        char v18 = (void *)[v16 copy];
        objc_msgSend(v17, "setAttributes:range:", v18, *(void *)(a1 + 56), *(void *)(a1 + 64));
      }
      else
      {
        id v19 = objc_alloc(MEMORY[0x1E4F28E48]);
        BOOL v20 = [*(id *)(a1 + 40) text];
        char v18 = (void *)[v19 initWithString:v20];

        char v21 = (void *)[v16 copy];
        objc_msgSend(v18, "setAttributes:range:", v21, 0, objc_msgSend(v18, "length"));

        objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withAttributedString:", *(void *)(a1 + 56), *(void *)(a1 + 64), v18);
      }
    }
    *a5 = 1;
  }
}

+ (id)annotatedQueryStringFromLLMQUAttributedString:(id)a3 photoLibrary:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F28B18];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  id v9 = [v7 string];
  uint64_t v10 = (void *)[v8 initWithString:v9];

  uint64_t v11 = objc_alloc_init(PHSearchQueryOptions);
  [(PHSearchQueryOptions *)v11 setEnableQueryUnderstanding:1];
  [(PHSearchQueryOptions *)v11 setEnableQueryUnderstandingGenericLocations:1];
  id v12 = [[PHSearchQuery alloc] initWithSearchText:v10 searchOptions:v11 photoLibrary:v6 queryIdentifier:0x7FFFFFFFLL batchIdentifier:0];
  id v13 = [v6 searchIndex];
  id v14 = [v13 unverifiedPsiSearchIndex];

  id v15 = +[PHSearchQueryAnnotation annotatedQueryStringFromSpotlightAttributedQueryString:v7 forSearchQuery:v12 photosEntityStore:v14 photoLibrary:v6];

  return v15;
}

+ (id)sortOrderWithAttributedQueryString:(id)a3
{
  id v3 = [a3 attribute:@"PHSearchQuerySortOrderAttributeKey" atIndex:0 effectiveRange:0];
  id v4 = v3;
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = @"none";
  }

  return v5;
}

+ (BOOL)isAllTimeWithAttributedQueryString:(id)a3
{
  id v3 = [a3 attribute:@"PHSearchQueryAllTimeAttributeKey" atIndex:0 effectiveRange:0];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isTripWithAttributedQueryString:(id)a3
{
  id v3 = [a3 attribute:@"PHSearchQueryTripAttributeKey" atIndex:0 effectiveRange:0];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)hasCSAttributedEntityTypePhotosMemoriesTripKeyInAttributedQueryString:(id)a3
{
  id v3 = [a3 attribute:*MEMORY[0x1E4F22848] atIndex:0 effectiveRange:0];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)searchQueryAnnotationsFromAttributedQueryString:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__PHSearchQueryAnnotation_Memories__searchQueryAnnotationsFromAttributedQueryString___block_invoke;
  v10[3] = &unk_1E5843058;
  id v11 = v5;
  id v7 = v5;
  objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v10);

  id v8 = (void *)[v7 copy];

  return v8;
}

void __85__PHSearchQueryAnnotation_Memories__searchQueryAnnotationsFromAttributedQueryString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"PHSearchQueryAttributeKey"];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

@end