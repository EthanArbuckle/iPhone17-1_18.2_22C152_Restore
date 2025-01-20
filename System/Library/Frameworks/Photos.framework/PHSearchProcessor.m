@interface PHSearchProcessor
+ (id)_albumUUIDsFromAssetBasedSearchResults:(id)a3;
+ (id)_collectionUUIDsForSpotlightSearchableItem:(id)a3 identifiersKey:(id)a4 countsKey:(id)a5 assetCountByCollectionUUID:(id)a6;
+ (id)_filterResultsByMatchType:(id)a3 forQuery:(id)a4 highPrecisionEmbeddingDistanceThreshold:(float)a5 veryHighPrecisionEmbeddingDistanceThreshold:(float)a6;
+ (id)_highlightUUIDsFromAssetBasedSearchResults:(id)a3;
+ (id)_matchedPersonIndexesForSearchableItem:(id)a3;
+ (id)_matchedSceneIndexesForSearchableItem:(id)a3;
+ (id)_memoryUUIDsFromAssetBasedSearchResults:(id)a3;
+ (id)_popResultsFromResults:(id)a3 popCount:(unint64_t)a4;
+ (id)_rankedAssetSearchResultsFromResults:(id)a3 maxResults:(unint64_t)a4 queryId:(int)a5 batchId:(int)a6;
+ (id)_rankedCollectionSearchResultsFromResults:(id)a3 maxResults:(unint64_t)a4 queryId:(int)a5 batchId:(int)a6;
+ (id)_removeTransientProcessingStateForSearchResults:(id)a3;
+ (id)queryMatchDetailsForSearchResults:(id)a3 queryText:(id)a4 queryEmbedding:(id)a5 matchedPersonUUIDs:(id)a6 matchedScenes:(id)a7 queryId:(int)a8;
+ (id)queryMatchDetailsForSearchResults:(id)a3 queryText:(id)a4 queryEmbedding:(id)a5 queryId:(int)a6;
+ (unint64_t)_searchResultTypeForSpotlightSearchableItem:(id)a3;
+ (void)_matchedPeopleForSearchableItem:(id)a3 personUUIDs:(id *)a4;
+ (void)_matchedScenesForSearchableItem:(id)a3 sceneIDs:(id *)a4 audioIDs:(id *)a5 humanActionIDs:(id *)a6;
+ (void)searchSuggestionsFromPLSearchSuggestions:(id)a3 suggestions:(id *)a4 queryId:(int)a5 batchId:(int)a6 rangeOfSuggestionText:(_NSRange)a7;
- (CSCustomAttributeKey)photosAlbumAssetCountsKey;
- (CSCustomAttributeKey)photosAlbumIdentifiersKey;
- (CSCustomAttributeKey)photosHighlightAssetCountsKey;
- (CSCustomAttributeKey)photosHighlightIdentifiersKey;
- (CSCustomAttributeKey)photosMemoryAssetCountsKey;
- (CSCustomAttributeKey)photosMemoryIdentifiersKey;
- (PHSearchProcessor)init;
- (id)_searchResultFromSpotlightSearchableItem:(id)a3 queryOptions:(id)a4 assetCountByCollectionUUID:(id)a5;
- (void)searchResultsFromSpotlightSearchableItems:(id)a3 query:(id)a4 annotatedQueryString:(id)a5 searchResults:(id *)a6 unfilteredAssetSearchResults:(id *)a7 rankedAssetSearchResults:(id *)a8 rankedCollectionSearchResults:(id *)a9 assetUUIDsForSuggestions:(id *)a10 collectionUUIDsForSuggestions:(id *)a11 highPrecisionEmbeddingDistanceThreshold:(float)a12 veryHighPrecisionEmbeddingDistanceThreshold:(float)a13;
- (void)setPhotosAlbumAssetCountsKey:(id)a3;
- (void)setPhotosAlbumIdentifiersKey:(id)a3;
- (void)setPhotosHighlightAssetCountsKey:(id)a3;
- (void)setPhotosHighlightIdentifiersKey:(id)a3;
- (void)setPhotosMemoryAssetCountsKey:(id)a3;
- (void)setPhotosMemoryIdentifiersKey:(id)a3;
@end

@implementation PHSearchProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosHighlightAssetCountsKey, 0);
  objc_storeStrong((id *)&self->_photosHighlightIdentifiersKey, 0);
  objc_storeStrong((id *)&self->_photosMemoryAssetCountsKey, 0);
  objc_storeStrong((id *)&self->_photosMemoryIdentifiersKey, 0);
  objc_storeStrong((id *)&self->_photosAlbumAssetCountsKey, 0);

  objc_storeStrong((id *)&self->_photosAlbumIdentifiersKey, 0);
}

- (void)setPhotosHighlightAssetCountsKey:(id)a3
{
}

- (CSCustomAttributeKey)photosHighlightAssetCountsKey
{
  return self->_photosHighlightAssetCountsKey;
}

- (void)setPhotosHighlightIdentifiersKey:(id)a3
{
}

- (CSCustomAttributeKey)photosHighlightIdentifiersKey
{
  return self->_photosHighlightIdentifiersKey;
}

- (void)setPhotosMemoryAssetCountsKey:(id)a3
{
}

- (CSCustomAttributeKey)photosMemoryAssetCountsKey
{
  return self->_photosMemoryAssetCountsKey;
}

- (void)setPhotosMemoryIdentifiersKey:(id)a3
{
}

- (CSCustomAttributeKey)photosMemoryIdentifiersKey
{
  return self->_photosMemoryIdentifiersKey;
}

- (void)setPhotosAlbumAssetCountsKey:(id)a3
{
}

- (CSCustomAttributeKey)photosAlbumAssetCountsKey
{
  return self->_photosAlbumAssetCountsKey;
}

- (void)setPhotosAlbumIdentifiersKey:(id)a3
{
}

- (CSCustomAttributeKey)photosAlbumIdentifiersKey
{
  return self->_photosAlbumIdentifiersKey;
}

- (id)_searchResultFromSpotlightSearchableItem:(id)a3 queryOptions:(id)a4 assetCountByCollectionUUID:(id)a5
{
  id v9 = a3;
  id v47 = a4;
  id v46 = a5;
  if (!v9)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PHSearchProcessor.m", 636, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];
  }
  uint64_t v10 = [(id)objc_opt_class() _searchResultTypeForSpotlightSearchableItem:v9];
  v11 = [v9 attributeSet];
  if ([v47 enableQueryMatchDetails])
  {
    [v11 attributeForKey:*MEMORY[0x1E4F237A8]];
    v13 = uint64_t v12 = v10;
    char v44 = [v13 BOOLValue];

    v45 = [v11 attributeForKey:*MEMORY[0x1E4F23760]];
    id v14 = objc_alloc(MEMORY[0x1E4F237C0]);
    v15 = (void *)[v14 initWithKeyName:*MEMORY[0x1E4F8B750] searchable:0 searchableByDefault:0 unique:0 multiValued:0];
    v16 = [v11 valueForCustomKey:v15];
    char v42 = [v16 BOOLValue];

    uint64_t v10 = v12;
  }
  else
  {
    char v42 = 0;
    char v44 = 0;
    v45 = 0;
  }
  v43 = [v11 attributeForKey:*MEMORY[0x1E4F23798]];
  v41 = [v11 attributeForKey:*MEMORY[0x1E4F237A0]];
  v17 = &unk_1EEB24C60;
  if (v10 == 1) {
    v17 = 0;
  }
  uint64_t v18 = *MEMORY[0x1E4F23790];
  id v39 = v17;
  v40 = v11;
  v19 = [v11 attributeForKey:v18];
  uint64_t v38 = [v19 unsignedIntegerValue];

  v20 = 0;
  v21 = 0;
  v22 = 0;
  if (v10 == 1)
  {
    v23 = objc_opt_class();
    v24 = [(PHSearchProcessor *)self photosAlbumIdentifiersKey];
    v25 = [(PHSearchProcessor *)self photosAlbumAssetCountsKey];
    v20 = [v23 _collectionUUIDsForSpotlightSearchableItem:v9 identifiersKey:v24 countsKey:v25 assetCountByCollectionUUID:v46];

    v26 = objc_opt_class();
    v27 = [(PHSearchProcessor *)self photosHighlightIdentifiersKey];
    v28 = [(PHSearchProcessor *)self photosHighlightAssetCountsKey];
    v21 = [v26 _collectionUUIDsForSpotlightSearchableItem:v9 identifiersKey:v27 countsKey:v28 assetCountByCollectionUUID:v46];

    v29 = objc_opt_class();
    v30 = [(PHSearchProcessor *)self photosMemoryIdentifiersKey];
    v31 = [(PHSearchProcessor *)self photosMemoryAssetCountsKey];
    uint64_t v10 = 1;
    v22 = [v29 _collectionUUIDsForSpotlightSearchableItem:v9 identifiersKey:v30 countsKey:v31 assetCountByCollectionUUID:v46];
  }
  v32 = [PHSearchResult alloc];
  v33 = [v9 uniqueIdentifier];
  BYTE1(v37) = v42;
  LOBYTE(v37) = v44;
  v34 = -[PHSearchResult initWithSearchResultType:uuid:personUUIDs:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:retrievalType:hasOCRTextMatch:isSensitiveLocation:embeddingDistances:l1Score:l2Score:collectionScore:assetAlbumUUIDs:assetMemoryUUIDs:assetHighlightUUIDs:](v32, "initWithSearchResultType:uuid:personUUIDs:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:retrievalType:hasOCRTextMatch:isSensitiveLocation:embeddingDistances:l1Score:l2Score:collectionScore:assetAlbumUUIDs:assetMemoryUUIDs:assetHighlightUUIDs:", v10, v33, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], v38, v37, v45, v43, v41, v39, v20, v22, v21);

  return v34;
}

- (void)searchResultsFromSpotlightSearchableItems:(id)a3 query:(id)a4 annotatedQueryString:(id)a5 searchResults:(id *)a6 unfilteredAssetSearchResults:(id *)a7 rankedAssetSearchResults:(id *)a8 rankedCollectionSearchResults:(id *)a9 assetUUIDsForSuggestions:(id *)a10 collectionUUIDsForSuggestions:(id *)a11 highPrecisionEmbeddingDistanceThreshold:(float)a12 veryHighPrecisionEmbeddingDistanceThreshold:(float)a13
{
  uint64_t v200 = *MEMORY[0x1E4F143B8];
  id v155 = a3;
  id v19 = a4;
  id v151 = a5;
  v157 = v19;
  if (!v19)
  {
    v124 = [MEMORY[0x1E4F28B00] currentHandler];
    [v124 handleFailureInMethod:a2, self, @"PHSearchProcessor.m", 79, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];
  }
  v144 = a6;
  if (a6)
  {
    if (a7) {
      goto LABEL_5;
    }
  }
  else
  {
    v125 = [MEMORY[0x1E4F28B00] currentHandler];
    [v125 handleFailureInMethod:a2, self, @"PHSearchProcessor.m", 80, @"Invalid parameter not satisfying: %@", @"outSearchResults" object file lineNumber description];

    if (a7) {
      goto LABEL_5;
    }
  }
  v126 = [MEMORY[0x1E4F28B00] currentHandler];
  [v126 handleFailureInMethod:a2, self, @"PHSearchProcessor.m", 81, @"Invalid parameter not satisfying: %@", @"outUnfilteredAssetSearchResults" object file lineNumber description];

LABEL_5:
  if (!a10)
  {
    v127 = [MEMORY[0x1E4F28B00] currentHandler];
    [v127 handleFailureInMethod:a2, self, @"PHSearchProcessor.m", 82, @"Invalid parameter not satisfying: %@", @"outAssetUUIDsForSuggestions" object file lineNumber description];
  }
  if (!a11)
  {
    v128 = [MEMORY[0x1E4F28B00] currentHandler];
    [v128 handleFailureInMethod:a2, self, @"PHSearchProcessor.m", 83, @"Invalid parameter not satisfying: %@", @"outCollectionUUIDsForSuggestions" object file lineNumber description];
  }
  uint64_t v159 = [v19 batchIdentifier];
  uint64_t v156 = [v19 queryIdentifier];
  v158 = [v19 searchOptions];
  v20 = PLSearchBackendResultProcessingGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    if (v159) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v159, v156);
    }
    else {
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v156);
    }
    uint64_t v22 = [v155 count];
    v23 = [v158 scopedIdentifiers];
    *(_DWORD *)buf = 138543874;
    *(void *)v189 = v21;
    *(_WORD *)&v189[8] = 2048;
    *(void *)v190 = v22;
    *(_WORD *)&v190[8] = 2048;
    *(void *)v191 = [v23 count];
    _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing %tu items from Spotlight with %tu scoped identifiers", buf, 0x20u);
  }
  PLPhotosSearchGetLog();
  v24 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t spid = os_signpost_id_generate(v24);
  v25 = v24;

  v26 = v25;
  v27 = v26;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v27, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PLSearchBackendQuerySearchableItemTranslation", (const char *)&unk_19B30018E, buf, 2u);
  }

  v149 = v27;
  BOOL v28 = +[PHSearchUtility locationDisambiguationSpansFullLengthOfString:v151];
  v29 = [v158 scopedIdentifiers];
  v154 = v29;
  if (v29) {
    BOOL v30 = [v29 count] == 0;
  }
  else {
    BOOL v30 = 0;
  }
  uint64_t v31 = [v155 count];
  int v32 = !v28;
  if (v31) {
    int v32 = 0;
  }
  if ((v32 | v30) == 1)
  {
    if ([v158 maxRankedAssetSearchResults] >= 1) {
      *a8 = (id)MEMORY[0x1E4F1CBF0];
    }
    if ([v158 maxRankedCollectionSearchResults] >= 1) {
      *a9 = (id)MEMORY[0x1E4F1CBF0];
    }
    v33 = (void *)MEMORY[0x1E4F1CBF0];
    id *v144 = (id)MEMORY[0x1E4F1CBF0];
    *a10 = v33;
    *a11 = v33;
    if (v30)
    {
      v34 = PLSearchBackendResultProcessingGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        if (v159) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v159, v156);
        }
        else {
        v72 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v156);
        }
        v73 = [v157 queryStringSentToSpotlight];
        *(_DWORD *)buf = 138543618;
        *(void *)v189 = v72;
        *(_WORD *)&v189[8] = 2112;
        *(void *)v190 = v73;
        _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Scoped search set is empty, no results to process for query \"%@\".", buf, 0x16u);
      }
    }
    else
    {
      v34 = PLSearchBackendResultProcessingGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        if (v159) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v159, v156);
        }
        else {
        v74 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v156);
        }
        v75 = [v157 queryStringSentToSpotlight];
        *(_DWORD *)buf = 138543618;
        *(void *)v189 = v74;
        *(_WORD *)&v189[8] = 2112;
        *(void *)v190 = v75;
        _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ No results to process for query: \"%@\"", buf, 0x16u);
      }
    }
  }
  else
  {
    v35 = [v157 searchText];
    v142 = +[PHSearchUtility extractAssetUUIDsForLocationDisambiguationsInQueryString:v35];

    v36 = v158;
    if ([v142 count])
    {
      uint64_t v37 = PLSearchBackendResultProcessingGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        if (v159) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v159, v156);
        }
        else {
        uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v156);
        }
        uint64_t v39 = [v142 count];
        *(_DWORD *)buf = 138543618;
        *(void *)v189 = v38;
        *(_WORD *)&v189[8] = 2048;
        *(void *)v190 = v39;
        _os_log_impl(&dword_19B043000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %tu assetUUIDs from location disambiguations which will be used to scope the search", buf, 0x16u);
      }
      if ([v154 count])
      {
        v40 = [v154 mutableCopy];
        [v40 intersectSet:v142];
        uint64_t v41 = [v40 copy];

        v154 = v41;
      }
      else
      {
        v40 = v154;
        v154 = v142;
      }

      v36 = v158;
    }
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v150 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v141 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v143 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v140 = objc_opt_new();
    id v146 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v145 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v44 = [v36 searchQueryResultTypes];
    char v45 = [v36 searchQueryResultTypes];
    BOOL v46 = [v36 maxRankedAssetSearchResults] > 0;
    char v47 = [v36 fastRanking];
    unint64_t v48 = v45 & 2;
    unint64_t v135 = v48;
    if (v28)
    {
      v49 = [v154 allObjects];
      v50 = [v49 sortedArrayUsingSelector:sel_compare_];

      long long v186 = 0u;
      long long v187 = 0u;
      long long v184 = 0u;
      long long v185 = 0u;
      id v51 = v50;
      uint64_t v52 = [v51 countByEnumeratingWithState:&v184 objects:v199 count:16];
      if (v52)
      {
        uint64_t v53 = *(void *)v185;
        uint64_t v54 = MEMORY[0x1E4F1CBF0];
        do
        {
          for (uint64_t i = 0; i != v52; ++i)
          {
            if (*(void *)v185 != v53) {
              objc_enumerationMutation(v51);
            }
            uint64_t v56 = *(void *)(*((void *)&v184 + 1) + 8 * i);
            LOWORD(v131) = 0;
            v57 = -[PHSearchResult initWithSearchResultType:uuid:personUUIDs:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:retrievalType:hasOCRTextMatch:isSensitiveLocation:embeddingDistances:l1Score:l2Score:collectionScore:assetAlbumUUIDs:assetMemoryUUIDs:assetHighlightUUIDs:]([PHSearchResult alloc], "initWithSearchResultType:uuid:personUUIDs:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:retrievalType:hasOCRTextMatch:isSensitiveLocation:embeddingDistances:l1Score:l2Score:collectionScore:assetAlbumUUIDs:assetMemoryUUIDs:assetHighlightUUIDs:", 1, v56, v54, v54, v54, v54, 0, v131, 0, 0, 0, 0, 0, 0, 0);
            [v43 addObject:v56];
            [v42 addObject:v57];
          }
          uint64_t v52 = [v51 countByEnumeratingWithState:&v184 objects:v199 count:16];
        }
        while (v52);
      }

      v138 = 0;
      v139 = 0;
      v137 = 0;
    }
    else
    {
      char v58 = v47;
      char v59 = v44 & 1;
      unint64_t v60 = v48 >> 1;
      v167[0] = MEMORY[0x1E4F143A8];
      v167[1] = 3221225472;
      v167[2] = __327__PHSearchProcessor_searchResultsFromSpotlightSearchableItems_query_annotatedQueryString_searchResults_unfilteredAssetSearchResults_rankedAssetSearchResults_rankedCollectionSearchResults_assetUUIDsForSuggestions_collectionUUIDsForSuggestions_highPrecisionEmbeddingDistanceThreshold_veryHighPrecisionEmbeddingDistanceThreshold___block_invoke;
      v167[3] = &unk_1E5841F50;
      id v61 = v157;
      id v168 = v61;
      v169 = v154;
      v170 = self;
      id v171 = v140;
      id v172 = v158;
      BOOL v180 = v46;
      char v181 = v58;
      id v62 = v141;
      id v173 = v62;
      id v174 = v145;
      char v182 = v59;
      id v63 = v43;
      id v175 = v63;
      id v64 = v42;
      id v176 = v64;
      char v183 = v60;
      id v177 = v143;
      id v178 = v150;
      id v179 = v146;
      [v155 enumerateObjectsUsingBlock:v167];
      *a7 = (id)[v64 copy];
      v65 = objc_opt_class();
      *(float *)&double v66 = a12;
      *(float *)&double v67 = a13;
      id v42 = [v65 _filterResultsByMatchType:v64 forQuery:v61 highPrecisionEmbeddingDistanceThreshold:v66 veryHighPrecisionEmbeddingDistanceThreshold:v67];

      v68 = objc_opt_class();
      *(float *)&double v69 = a12;
      *(float *)&double v70 = a13;
      id v141 = [v68 _filterResultsByMatchType:v62 forQuery:v61 highPrecisionEmbeddingDistanceThreshold:v69 veryHighPrecisionEmbeddingDistanceThreshold:v70];

      if (v135)
      {
        v139 = [(id)objc_opt_class() _albumUUIDsFromAssetBasedSearchResults:v42];
        v138 = [(id)objc_opt_class() _highlightUUIDsFromAssetBasedSearchResults:v42];
        v137 = [(id)objc_opt_class() _memoryUUIDsFromAssetBasedSearchResults:v42];
      }
      else
      {
        v138 = 0;
        v139 = 0;
        v137 = 0;
      }
      v71 = PLSearchBackendResultProcessingGetLog();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        if (v159) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v159, v156);
        }
        else {
        v133 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v156);
        }
        uint64_t v132 = [v42 count];
        uint64_t v76 = [v63 count];
        uint64_t v77 = [v139 count];
        uint64_t v78 = [v138 count];
        uint64_t v79 = [v137 count];
        v80 = [v61 queryStringSentToSpotlight];
        *(_DWORD *)buf = 138544898;
        *(void *)v189 = v133;
        *(_WORD *)&v189[8] = 2048;
        *(void *)v190 = v132;
        *(_WORD *)&v190[8] = 2048;
        *(void *)v191 = v76;
        *(_WORD *)&v191[8] = 2048;
        uint64_t v192 = v77;
        __int16 v193 = 2048;
        uint64_t v194 = v78;
        __int16 v195 = 2048;
        uint64_t v196 = v79;
        __int16 v197 = 2112;
        v198 = v80;
        _os_log_impl(&dword_19B043000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %tu assets, %tu assets for suggestions, %tu albums, %tu highlights, and %tu memories from Spotlight for query: %@", buf, 0x48u);
      }
      id v51 = v168;
    }

    if (v135)
    {
      id v81 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v158 collectionThreshold];
      uint64_t v83 = v82;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __327__PHSearchProcessor_searchResultsFromSpotlightSearchableItems_query_annotatedQueryString_searchResults_unfilteredAssetSearchResults_rankedAssetSearchResults_rankedCollectionSearchResults_assetUUIDsForSuggestions_collectionUUIDsForSuggestions_highPrecisionEmbeddingDistanceThreshold_veryHighPrecisionEmbeddingDistanceThreshold___block_invoke_37;
      aBlock[3] = &unk_1E5841F78;
      id v161 = v140;
      uint64_t v164 = v83;
      id v162 = v150;
      int v165 = v159;
      int v166 = v156;
      id v84 = v81;
      id v163 = v84;
      v85 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
      v85[2](v85, 2, v139);
      v85[2](v85, 3, v137);
      v85[2](v85, 4, v138);
      if ([v84 count])
      {
        v86 = PLSearchBackendResultProcessingGetLog();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          if (v159) {
            objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v159, v156);
          }
          else {
          v87 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v156);
          }
          uint64_t v88 = [v84 count];
          *(_DWORD *)buf = 138543874;
          *(void *)v189 = v87;
          *(_WORD *)&v189[8] = 2048;
          *(void *)v190 = v88;
          *(_WORD *)&v190[8] = 2112;
          *(void *)v191 = v84;
          _os_log_impl(&dword_19B043000, v86, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %tu collections below threshold. Collection UUIDs: %@", buf, 0x20u);
        }
      }
      v89 = PLSearchBackendResultProcessingGetLog();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        id v136 = v84;
        if (v159) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v159, v156);
        }
        else {
        v90 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v156);
        }
        uint64_t v91 = [v139 count];
        uint64_t v92 = [v138 count];
        uint64_t v93 = [v137 count];
        v94 = [v157 queryStringSentToSpotlight];
        *(_DWORD *)buf = 138544386;
        *(void *)v189 = v90;
        *(_WORD *)&v189[8] = 2048;
        *(void *)v190 = v91;
        *(_WORD *)&v190[8] = 2048;
        *(void *)v191 = v92;
        *(_WORD *)&v191[8] = 2048;
        uint64_t v192 = v93;
        __int16 v193 = 2112;
        uint64_t v194 = (uint64_t)v94;
        _os_log_impl(&dword_19B043000, v89, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated collections with asset based collections: %tu albums, %tu highlights and %tu memories from Spotlight for query: %@", buf, 0x34u);

        id v84 = v136;
      }
    }
    if ([v146 count])
    {
      v95 = PLSearchBackendResultProcessingGetLog();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
      {
        if (v159) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v159, v156);
        }
        else {
        v96 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v156);
        }
        uint64_t v97 = [v146 count];
        *(_DWORD *)buf = 138543874;
        *(void *)v189 = v96;
        *(_WORD *)&v189[8] = 2048;
        *(void *)v190 = v97;
        *(_WORD *)&v190[8] = 2112;
        *(void *)v191 = v146;
        _os_log_impl(&dword_19B043000, v95, OS_LOG_TYPE_FAULT, "%{public}@ %tu unexpected domain identifiers returned from Spotlight: %@", buf, 0x20u);
      }
    }
    if ([v145 count])
    {
      v98 = PLSearchBackendResultProcessingGetLog();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_FAULT))
      {
        if (v159) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v159, v156);
        }
        else {
        v99 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v156);
        }
        uint64_t v100 = [v145 count];
        *(_DWORD *)buf = 138543874;
        *(void *)v189 = v99;
        *(_WORD *)&v189[8] = 2048;
        *(void *)v190 = v100;
        *(_WORD *)&v190[8] = 2112;
        *(void *)v191 = v145;
        _os_log_impl(&dword_19B043000, v98, OS_LOG_TYPE_FAULT, "%{public}@ Received %tu searchable item(s) with undefined type(s): %@", buf, 0x20u);
      }
    }
    v101 = v158;
    uint64_t v102 = [v158 maxRankedAssetSearchResults];
    if (v102)
    {
      if (!a8)
      {
        v129 = [MEMORY[0x1E4F28B00] currentHandler];
        [v129 handleFailureInMethod:a2, self, @"PHSearchProcessor.m", 287, @"Invalid parameter not satisfying: %@", @"outRankedAssetSearchResults" object file lineNumber description];
      }
      *a8 = [(id)objc_opt_class() _rankedAssetSearchResultsFromResults:v141 maxResults:v102 queryId:v156 batchId:v159];
      v103 = PLSearchBackendResultProcessingGetLog();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
        if (v159) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v159, v156);
        }
        else {
        v104 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v156);
        }
        uint64_t v105 = [*a8 count];
        v106 = [v157 queryStringSentToSpotlight];
        *(_DWORD *)buf = 138543874;
        *(void *)v189 = v104;
        *(_WORD *)&v189[8] = 2048;
        *(void *)v190 = v105;
        *(_WORD *)&v190[8] = 2112;
        *(void *)v191 = v106;
        _os_log_impl(&dword_19B043000, v103, OS_LOG_TYPE_DEFAULT, "%{public}@ Identified %tu ranked assets for query: %@", buf, 0x20u);
      }
      v101 = v158;
    }
    else
    {
      *a8 = (id)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v107 = [v101 maxRankedCollectionSearchResults];
    if (v107)
    {
      if (!a9)
      {
        v130 = [MEMORY[0x1E4F28B00] currentHandler];
        [v130 handleFailureInMethod:a2, self, @"PHSearchProcessor.m", 298, @"Invalid parameter not satisfying: %@", @"outRankedCollectionSearchResults" object file lineNumber description];
      }
      *a9 = [(id)objc_opt_class() _rankedCollectionSearchResultsFromResults:v150 maxResults:v107 queryId:v156 batchId:v159];
      v108 = PLSearchBackendResultProcessingGetLog();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        if (v159) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v159, v156);
        }
        else {
        v109 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v156);
        }
        uint64_t v110 = [*a9 count];
        v111 = [v157 queryStringSentToSpotlight];
        *(_DWORD *)buf = 138543874;
        *(void *)v189 = v109;
        *(_WORD *)&v189[8] = 2048;
        *(void *)v190 = v110;
        *(_WORD *)&v190[8] = 2112;
        *(void *)v191 = v111;
        _os_log_impl(&dword_19B043000, v108, OS_LOG_TYPE_DEFAULT, "%{public}@ Identified %tu ranked collections for query: %@", buf, 0x20u);
      }
    }
    else
    {
      *a9 = (id)MEMORY[0x1E4F1CBF0];
    }
    v153 = [(id)objc_opt_class() _removeTransientProcessingStateForSearchResults:v42];

    id v112 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v112 addObjectsFromArray:v153];
    [v112 addObjectsFromArray:v150];
    id *v144 = (id)[v112 copy];
    *a10 = (id)[v43 copy];
    *a11 = (id)[v143 copy];
    v113 = PLSearchBackendResultProcessingGetLog();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      if (v159) {
        objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v159, v156);
      }
      else {
      v114 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v156);
      }
      uint64_t v115 = [v153 count];
      uint64_t v116 = [v43 count];
      uint64_t v117 = [v150 count];
      uint64_t v118 = [v143 count];
      v119 = [v157 queryStringSentToSpotlight];
      *(_DWORD *)buf = 138544642;
      *(void *)v189 = v114;
      *(_WORD *)&v189[8] = 2048;
      *(void *)v190 = v115;
      *(_WORD *)&v190[8] = 2048;
      *(void *)v191 = v116;
      *(_WORD *)&v191[8] = 2048;
      uint64_t v192 = v117;
      __int16 v193 = 2048;
      uint64_t v194 = v118;
      __int16 v195 = 2112;
      uint64_t v196 = (uint64_t)v119;
      _os_log_impl(&dword_19B043000, v113, OS_LOG_TYPE_DEFAULT, "%{public}@ Processed %tu asset results, %tu asset results for suggestions, and %tu collection results, %tu collection results for suggestions for query: %@", buf, 0x3Eu);
    }
    v120 = v149;
    v121 = v120;
    if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v120))
    {
      uint64_t v122 = [v155 count];
      uint64_t v123 = [v112 count];
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v189 = v156;
      *(_WORD *)&v189[4] = 1024;
      *(_DWORD *)&v189[6] = v159;
      *(_WORD *)v190 = 2048;
      *(void *)&v190[2] = v122;
      *(_WORD *)v191 = 2048;
      *(void *)&v191[2] = v123;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v121, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendQuerySearchableItemTranslation", "Query: %d, Batch: %d, CSSearchableItems: %tu, PHSearchResults: %tu", buf, 0x22u);
    }

    v34 = v142;
  }
}

void __327__PHSearchProcessor_searchResultsFromSpotlightSearchableItems_query_annotatedQueryString_searchResults_unfilteredAssetSearchResults_rankedAssetSearchResults_rankedCollectionSearchResults_assetUUIDsForSuggestions_collectionUUIDsForSuggestions_highPrecisionEmbeddingDistanceThreshold_veryHighPrecisionEmbeddingDistanceThreshold___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v29 = a2;
  if ([*(id *)(a1 + 32) isCancelled]) {
    *a4 = 1;
  }
  v6 = *(void **)(a1 + 40);
  if (!v6
    || ([(__CFString *)v29 uniqueIdentifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v6 containsObject:v7],
        v7,
        v8))
  {
    id v9 = [(__CFString *)v29 domainIdentifier];
    int v10 = [v9 isEqualToString:*MEMORY[0x1E4F8B758]];

    if (!v10)
    {
      v15 = *(void **)(a1 + 120);
      uint64_t v16 = [(__CFString *)v29 domainIdentifier];
      v13 = (__CFString *)v16;
      if (v16) {
        v17 = (__CFString *)v16;
      }
      else {
        v17 = &stru_1EEAC1950;
      }
      uint64_t v18 = v15;
      goto LABEL_37;
    }
    v11 = *(void **)(a1 + 48);
    uint64_t v12 = [*(id *)(a1 + 32) searchOptions];
    v13 = [v11 _searchResultFromSpotlightSearchableItem:v29 queryOptions:v12 assetCountByCollectionUUID:*(void *)(a1 + 56)];

    if ([*(id *)(a1 + 64) excludeOCRTextResultMatches]
      && ([(__CFString *)v13 hasOCRTextMatch] & 1) != 0)
    {
      goto LABEL_38;
    }
    if (*(unsigned char *)(a1 + 128) && [(__CFString *)v13 type] == 1)
    {
      id v14 = [(__CFString *)v13 l2Score];
      if (v14)
      {
      }
      else if (!*(unsigned char *)(a1 + 129))
      {
        goto LABEL_18;
      }
      [*(id *)(a1 + 72) addObject:v13];
    }
LABEL_18:
    uint64_t v19 = [(__CFString *)v13 type];
    if ((unint64_t)(v19 - 2) >= 3)
    {
      if (v19 == 1)
      {
        if (*(unsigned char *)(a1 + 130))
        {
          if (([(__CFString *)v13 isEligibleForSuggestions] & 1) != 0
            || ([*(id *)(a1 + 32) searchOptions],
                v25 = objc_claimAutoreleasedReturnValue(),
                int v26 = [v25 disableSemanticSearch],
                v25,
                v26))
          {
            v27 = *(void **)(a1 + 88);
            BOOL v28 = [(__CFString *)v13 uuid];
            [v27 addObject:v28];
          }
          uint64_t v22 = (void **)(a1 + 96);
          goto LABEL_35;
        }
      }
      else if (!v19)
      {
        uint64_t v22 = (void **)(a1 + 80);
        v17 = v29;
LABEL_36:
        uint64_t v18 = *v22;
LABEL_37:
        [v18 addObject:v17];
      }
    }
    else
    {
      int v20 = *(unsigned __int8 *)(a1 + 131);
      if ([(__CFString *)v13 type] == 3)
      {
        char v21 = PLIsFeaturedContentAllowed();
        if (!v20 || (v21 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_27;
      }
      if (v20)
      {
LABEL_27:
        if ([(__CFString *)v13 isEligibleForSuggestions])
        {
          v23 = *(void **)(a1 + 104);
          v24 = [(__CFString *)v13 uuid];
          [v23 addObject:v24];
        }
        uint64_t v22 = (void **)(a1 + 112);
LABEL_35:
        v17 = v13;
        goto LABEL_36;
      }
    }
LABEL_38:
  }
}

void __327__PHSearchProcessor_searchResultsFromSpotlightSearchableItems_query_annotatedQueryString_searchResults_unfilteredAssetSearchResults_rankedAssetSearchResults_rankedCollectionSearchResults_assetUUIDsForSuggestions_collectionUUIDsForSuggestions_highPrecisionEmbeddingDistanceThreshold_veryHighPrecisionEmbeddingDistanceThreshold___block_invoke_37(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    id v26 = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
        unint64_t v12 = [v11 unsignedIntegerValue];

        unint64_t v13 = [v5 countForObject:v10];
        double v14 = (double)v13 / (double)v12;
        if (v14 >= *(double *)(a1 + 56))
        {
          int v20 = [PHSearchResult alloc];
          char v21 = [NSNumber numberWithDouble:v14];
          LOWORD(v25) = 0;
          uint64_t v22 = -[PHSearchResult initWithSearchResultType:uuid:personUUIDs:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:retrievalType:hasOCRTextMatch:isSensitiveLocation:embeddingDistances:l1Score:l2Score:collectionScore:assetAlbumUUIDs:assetMemoryUUIDs:assetHighlightUUIDs:](v20, "initWithSearchResultType:uuid:personUUIDs:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:retrievalType:hasOCRTextMatch:isSensitiveLocation:embeddingDistances:l1Score:l2Score:collectionScore:assetAlbumUUIDs:assetMemoryUUIDs:assetHighlightUUIDs:", a2, v10, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], 0, v25, 0, 0, 0, v21, 0, 0, 0);

          [*(id *)(a1 + 40) addObject:v22];
        }
        else
        {
          unint64_t v15 = v13;
          uint64_t v16 = PLSearchBackendResultProcessingGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v17 = v7;
            uint64_t v18 = v8;
            uint64_t v19 = a2;
            if (*(_DWORD *)(a1 + 64)) {
              objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68));
            }
            else {
            v23 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 68), v25);
            }
            uint64_t v24 = *(void *)(a1 + 56);
            *(_DWORD *)buf = 138544642;
            int v32 = v23;
            __int16 v33 = 2112;
            uint64_t v34 = v10;
            __int16 v35 = 2048;
            double v36 = v14;
            __int16 v37 = 2048;
            uint64_t v38 = v24;
            __int16 v39 = 2048;
            unint64_t v40 = v12;
            __int16 v41 = 2048;
            unint64_t v42 = v15;
            _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "%{public}@ Skipping collection below threshold. Collection: %@, confidence: %f, threshold: %f, collectionAssetCount: %tu, collectionAssetHitCount: %tu", buf, 0x3Eu);

            a2 = v19;
            uint64_t v8 = v18;
            uint64_t v7 = v17;
            id v5 = v26;
          }

          [*(id *)(a1 + 48) addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v7);
  }
}

- (PHSearchProcessor)init
{
  v16.receiver = self;
  v16.super_class = (Class)PHSearchProcessor;
  v2 = [(PHSearchProcessor *)&v16 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F237C0]);
    v4 = (void *)[v3 initWithKeyName:*MEMORY[0x1E4F8B728] searchable:0 searchableByDefault:0 unique:0 multiValued:1];
    [(PHSearchProcessor *)v2 setPhotosAlbumIdentifiersKey:v4];

    id v5 = objc_alloc(MEMORY[0x1E4F237C0]);
    uint64_t v6 = (void *)[v5 initWithKeyName:*MEMORY[0x1E4F8B720] searchable:0 searchableByDefault:0 unique:0 multiValued:1];
    [(PHSearchProcessor *)v2 setPhotosAlbumAssetCountsKey:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F237C0]);
    uint64_t v8 = (void *)[v7 initWithKeyName:*MEMORY[0x1E4F8B748] searchable:0 searchableByDefault:0 unique:0 multiValued:1];
    [(PHSearchProcessor *)v2 setPhotosMemoryIdentifiersKey:v8];

    id v9 = objc_alloc(MEMORY[0x1E4F237C0]);
    uint64_t v10 = (void *)[v9 initWithKeyName:*MEMORY[0x1E4F8B740] searchable:0 searchableByDefault:0 unique:0 multiValued:1];
    [(PHSearchProcessor *)v2 setPhotosMemoryAssetCountsKey:v10];

    id v11 = objc_alloc(MEMORY[0x1E4F237C0]);
    unint64_t v12 = (void *)[v11 initWithKeyName:*MEMORY[0x1E4F8B738] searchable:0 searchableByDefault:0 unique:0 multiValued:1];
    [(PHSearchProcessor *)v2 setPhotosHighlightIdentifiersKey:v12];

    id v13 = objc_alloc(MEMORY[0x1E4F237C0]);
    double v14 = (void *)[v13 initWithKeyName:*MEMORY[0x1E4F8B730] searchable:0 searchableByDefault:0 unique:0 multiValued:1];
    [(PHSearchProcessor *)v2 setPhotosHighlightAssetCountsKey:v14];
  }
  return v2;
}

+ (id)_filterResultsByMatchType:(id)a3 forQuery:(id)a4 highPrecisionEmbeddingDistanceThreshold:(float)a5 veryHighPrecisionEmbeddingDistanceThreshold:(float)a6
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (![v9 count])
  {
    unint64_t v15 = PLSearchBackendResultProcessingGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if ([v10 batchIdentifier]) {
        objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", objc_msgSend(v10, "batchIdentifier"), objc_msgSend(v10, "queryIdentifier"));
      }
      else {
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", objc_msgSend(v10, "queryIdentifier"), v53);
      }
      *(_DWORD *)buf = 138543362;
      double v70 = v19;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ No results available to filter by match type.", buf, 0xCu);
    }
    id v20 = v9;
    goto LABEL_76;
  }
  id v11 = [v10 searchOptions];
  unint64_t v12 = [v11 matchType];
  unint64_t v13 = v12;
  if (v12 > 3) {
    double v14 = @"Unknown";
  }
  else {
    double v14 = off_1E58428A0[v12];
  }
  objc_super v16 = v14;
  if (!+[PHSearchQueryManager currentSpotlightVersionSupportsExactMatchBehavior])
  {
    if (v13 - 1 > 1)
    {
LABEL_74:
      id v20 = v9;
      goto LABEL_75;
    }
    uint64_t v17 = PLSearchBackendResultProcessingGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if ([v10 batchIdentifier]) {
        objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", objc_msgSend(v10, "batchIdentifier"), objc_msgSend(v10, "queryIdentifier"));
      }
      else {
      __int16 v37 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", objc_msgSend(v10, "queryIdentifier"), v53);
      }
      *(_DWORD *)buf = 138543362;
      double v70 = v37;
      uint64_t v38 = "%{public}@ Exact or hybrid match results requested by client, but not supported on the this device build.";
      __int16 v39 = v17;
      os_log_type_t v40 = OS_LOG_TYPE_ERROR;
      uint32_t v41 = 12;
      goto LABEL_72;
    }
LABEL_73:

    goto LABEL_74;
  }
  if (v13 == 3 || !v13)
  {
    uint64_t v17 = PLSearchBackendResultProcessingGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if ([v10 batchIdentifier]) {
        objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", objc_msgSend(v10, "batchIdentifier"), objc_msgSend(v10, "queryIdentifier"));
      }
      else {
      __int16 v37 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", objc_msgSend(v10, "queryIdentifier"), v53);
      }
      *(_DWORD *)buf = 138543618;
      double v70 = v37;
      __int16 v71 = 2112;
      v72 = v16;
      uint64_t v38 = "%{public}@ Returning results of all match types for the query due to match type of: %@.";
      __int16 v39 = v17;
      os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
      uint32_t v41 = 22;
LABEL_72:
      _os_log_impl(&dword_19B043000, v39, v40, v38, buf, v41);

      goto LABEL_73;
    }
    goto LABEL_73;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v11 enableEmbeddingOnlyResultsInExactMatches]) {
    id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v63 = 0;
  }
  uint64_t v56 = v16;
  v57 = v10;
  if ([v11 enableEmbeddingOnlyResultsInExactMatches]) {
    id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v58 = 0;
  }
  id v62 = v18;
  uint64_t v54 = v11;
  id v55 = v9;
  long long v67 = 0u;
  long long v68 = 0u;
  BOOL v21 = a6 <= 0.0 && a5 <= 0.0;
  long long v65 = 0uLL;
  long long v66 = 0uLL;
  id obj = v9;
  uint64_t v22 = [obj countByEnumeratingWithState:&v65 objects:v83 count:16];
  if (!v22)
  {
    uint64_t v24 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    goto LABEL_57;
  }
  uint64_t v23 = v22;
  uint64_t v24 = 0;
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  uint64_t v25 = *(void *)v66;
  unint64_t v59 = v13;
  unint64_t v26 = v13 - 1;
  do
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v66 != v25) {
        objc_enumerationMutation(obj);
      }
      long long v28 = *(void **)(*((void *)&v65 + 1) + 8 * i);
      unsigned int v29 = [v28 isExclusivelyExactOCRTextMatch];
      uint64_t v30 = [v28 matchType];
      if (v30 == 2)
      {
        if (v59 == 2)
        {
          [v62 addObject:v28];
          ++v61;
          goto LABEL_51;
        }
      }
      else if (v30 == 1 && v26 <= 1)
      {
        [v62 addObject:v28];
        ++v60;
        goto LABEL_51;
      }
      int v32 = [v28 embeddingDistances];
      __int16 v33 = [v32 firstObject];

      if (v33) {
        char v34 = v21;
      }
      else {
        char v34 = 1;
      }
      if ((v34 & 1) == 0)
      {
        [v33 doubleValue];
        double v36 = v63;
        if (v35 <= a6 || (double v36 = v58, v35 <= a5)) {
          [v36 addObject:v28];
        }
      }

LABEL_51:
      uint64_t v24 = (__CFString *)((char *)v24 + v29);
    }
    uint64_t v23 = [obj countByEnumeratingWithState:&v65 objects:v83 count:16];
  }
  while (v23);
LABEL_57:

  if ([v62 count])
  {
    objc_super v16 = v56;
    id v10 = v57;
    if ((__CFString *)[v62 count] == v24)
    {
      unint64_t v42 = PLSearchBackendResultProcessingGetLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        if ([v57 batchIdentifier]) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", objc_msgSend(v57, "batchIdentifier"), objc_msgSend(v57, "queryIdentifier"));
        }
        else {
        BOOL v46 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", objc_msgSend(v57, "queryIdentifier"), v53);
        }
        *(_DWORD *)buf = 138543618;
        double v70 = v46;
        __int16 v71 = 2048;
        v72 = v24;
        _os_log_impl(&dword_19B043000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ All %tu exact match results were for OCR results: returning all results.", buf, 0x16u);
      }
      goto LABEL_94;
    }
    if (v24 && (__CFString *)[v62 count] == (__CFString *)((char *)v24 + v61))
    {
      unint64_t v42 = PLSearchBackendResultProcessingGetLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        if ([v57 batchIdentifier]) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", objc_msgSend(v57, "batchIdentifier"), objc_msgSend(v57, "queryIdentifier"));
        }
        else {
        uint64_t v52 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", objc_msgSend(v57, "queryIdentifier"), v53);
        }
        *(_DWORD *)buf = 138543874;
        double v70 = v52;
        __int16 v71 = 2048;
        v72 = v24;
        __int16 v73 = 2048;
        uint64_t v74 = v61;
        _os_log_impl(&dword_19B043000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ All %tu exact match results were for OCR or %tu hybrid boosted results: returning all results.", buf, 0x20u);
      }
LABEL_94:
      id v11 = v54;
      id v9 = v55;
    }
    else
    {
      id v44 = v63;
      if (v60 || (id v44 = v58, v61)) {
        [v62 addObjectsFromArray:v44];
      }
      unint64_t v42 = PLSearchBackendResultProcessingGetLog();
      id v11 = v54;
      id v9 = v55;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        if ([v57 batchIdentifier]) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", objc_msgSend(v57, "batchIdentifier"), objc_msgSend(v57, "queryIdentifier"));
        }
        else {
        char v47 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", objc_msgSend(v57, "queryIdentifier"), v53);
        }
        uint64_t v48 = [v62 count];
        uint64_t v49 = [obj count];
        uint64_t v50 = [v63 count];
        uint64_t v51 = [v58 count];
        *(_DWORD *)buf = 138544898;
        double v70 = v47;
        __int16 v71 = 2048;
        v72 = (__CFString *)v48;
        __int16 v73 = 2048;
        uint64_t v74 = v49;
        __int16 v75 = 2048;
        uint64_t v76 = v50;
        __int16 v77 = 2048;
        double v78 = a6;
        __int16 v79 = 2048;
        uint64_t v80 = v51;
        __int16 v81 = 2048;
        double v82 = a5;
        _os_log_impl(&dword_19B043000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ Filtered down to %tu asset results from %tu asset results returned from Spotlight. With %tu veryHighPrecision (%f) embedding results and %tu highPrecision (%f) embedding results.", buf, 0x48u);
      }
      id obj = v62;
    }
  }
  else
  {
    unint64_t v42 = PLSearchBackendResultProcessingGetLog();
    objc_super v16 = v56;
    id v10 = v57;
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_94;
    }
    id v11 = v54;
    id v9 = v55;
    if ([v57 batchIdentifier]) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", objc_msgSend(v57, "batchIdentifier"), objc_msgSend(v57, "queryIdentifier"));
    }
    else {
    char v45 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", objc_msgSend(v57, "queryIdentifier"), v53);
    }
    *(_DWORD *)buf = 138543618;
    double v70 = v45;
    __int16 v71 = 2112;
    v72 = v56;
    _os_log_impl(&dword_19B043000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ No filtered results found for match type: %@, returning all results.", buf, 0x16u);
  }
  id v20 = obj;

LABEL_75:
LABEL_76:

  return v20;
}

+ (id)_removeTransientProcessingStateForSearchResults:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) releaseOwningCollectionUUIDs];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v3;
}

+ (id)_highlightUUIDsFromAssetBasedSearchResults:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (void)v13) == 1)
        {
          long long v11 = [v10 assetHighlightUUIDs];
          [v4 addObjectsFromArray:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)_memoryUUIDsFromAssetBasedSearchResults:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (void)v13) == 1)
        {
          long long v11 = [v10 assetMemoryUUIDs];
          [v4 addObjectsFromArray:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)_albumUUIDsFromAssetBasedSearchResults:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (void)v13) == 1)
        {
          long long v11 = [v10 assetAlbumUUIDs];
          [v4 addObjectsFromArray:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)_matchedSceneIndexesForSearchableItem:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 795, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = [v5 attributeSet];
  uint64_t v8 = [v7 attributeForKey:*MEMORY[0x1E4F23348]];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v6, "addIndex:", objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "unsignedIntegerValue"));
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v11);
  }
  uint64_t v31 = v9;

  long long v14 = [v5 attributeSet];
  long long v15 = [v14 attributeForKey:*MEMORY[0x1E4F23360]];

  int v32 = v5;
  long long v16 = [v5 attributeSet];
  double v35 = [v16 attributeForKey:*MEMORY[0x1E4F23358]];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v15;
  uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v34 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        id v20 = v6;
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = [*(id *)(*((void *)&v40 + 1) + 8 * j) unsignedIntegerValue];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v22 = v35;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = 0;
          uint64_t v26 = *(void *)v37;
          while (2)
          {
            uint64_t v27 = 0;
            uint64_t v28 = v25 + v24;
            do
            {
              if (*(void *)v37 != v26) {
                objc_enumerationMutation(v22);
              }
              v21 -= [*(id *)(*((void *)&v36 + 1) + 8 * v27) unsignedIntegerValue];
              if (v21 < 0)
              {
                uint64_t v28 = v25 + v27;
                goto LABEL_26;
              }
              ++v27;
            }
            while (v24 != v27);
            uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v48 count:16];
            uint64_t v25 = v28;
            if (v24) {
              continue;
            }
            break;
          }
        }
        else
        {
          uint64_t v28 = 0;
        }
LABEL_26:

        uint64_t v6 = v20;
        [v20 addIndex:v28];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v18);
  }

  return v6;
}

+ (void)_matchedScenesForSearchableItem:(id)a3 sceneIDs:(id *)a4 audioIDs:(id *)a5 humanActionIDs:(id *)a6
{
  id v11 = a3;
  if (v11)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 746, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 747, @"Invalid parameter not satisfying: %@", @"outSceneIDs" object file lineNumber description];

LABEL_3:
  uint64_t v31 = a5;
  if (!a5)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 748, @"Invalid parameter not satisfying: %@", @"outAudioIDs" object file lineNumber description];
  }
  uint64_t v30 = a4;
  uint64_t v12 = a6;
  if (!a6)
  {
    unsigned int v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 749, @"Invalid parameter not satisfying: %@", @"outHumanActionIDs" object file lineNumber description];
  }
  long long v13 = [v11 attributeSet];
  long long v14 = objc_opt_new();
  long long v15 = objc_opt_new();
  long long v16 = objc_opt_new();
  uint64_t v17 = [v13 attributeForKey:*MEMORY[0x1E4F23338]];
  uint64_t v18 = [v13 attributeForKey:*MEMORY[0x1E4F23368]];
  uint64_t v19 = [a1 _matchedSceneIndexesForSearchableItem:v11];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __86__PHSearchProcessor__matchedScenesForSearchableItem_sceneIDs_audioIDs_humanActionIDs___block_invoke;
  v32[3] = &unk_1E5842018;
  id v33 = v17;
  id v34 = v18;
  id v35 = v14;
  id v36 = v15;
  id v37 = v16;
  id v38 = v11;
  id v20 = v11;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  id v24 = v18;
  id v25 = v17;
  [v19 enumerateIndexesUsingBlock:v32];
  id *v30 = (id)[v23 copy];
  id *v31 = (id)[v22 copy];
  *uint64_t v12 = (id)[v21 copy];
}

void __86__PHSearchProcessor__matchedScenesForSearchableItem_sceneIDs_audioIDs_humanActionIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  switch([v5 unsignedIntegerValue])
  {
    case 1:
      uint64_t v6 = *(void **)(a1 + 48);
      goto LABEL_8;
    case 2:
      uint64_t v6 = *(void **)(a1 + 64);
      goto LABEL_8;
    case 3:
      uint64_t v6 = *(void **)(a1 + 56);
LABEL_8:
      [v6 addObject:v4];
      break;
    case 4:
    case 6:
    case 7:
    case 8:
      break;
    default:
      uint64_t v7 = PLSearchBackendResultProcessingGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = [*(id *)(a1 + 72) uniqueIdentifier];
        int v9 = 138412546;
        uint64_t v10 = v5;
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Invalid scene type (%@), while resolving match details for searchable item: %@", (uint8_t *)&v9, 0x16u);
      }
      break;
  }
}

+ (id)_matchedPersonIndexesForSearchableItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 727, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = [v5 attributeSet];
  uint64_t v8 = [v7 attributeForKey:*MEMORY[0x1E4F23308]];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v6, "addIndex:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "unsignedIntegerValue"));
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v6;
}

+ (void)_matchedPeopleForSearchableItem:(id)a3 personUUIDs:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 705, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 706, @"Invalid parameter not satisfying: %@", @"outPersonUUIDs" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = objc_opt_new();
  id v9 = [v7 attributeSet];
  uint64_t v10 = [v9 attributeForKey:*MEMORY[0x1E4F23310]];

  uint64_t v11 = [a1 _matchedPersonIndexesForSearchableItem:v7];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__PHSearchProcessor__matchedPeopleForSearchableItem_personUUIDs___block_invoke;
  v17[3] = &unk_1E5841FF0;
  id v18 = v10;
  id v19 = v8;
  id v20 = v7;
  id v12 = v7;
  id v13 = v8;
  id v14 = v10;
  [v11 enumerateIndexesUsingBlock:v17];
  *a4 = (id)[v13 copy];
}

void __65__PHSearchProcessor__matchedPeopleForSearchableItem_personUUIDs___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [a1[4] objectAtIndexedSubscript:a2];
  if (v3)
  {
    [a1[5] addObject:v3];
  }
  else
  {
    id v4 = PLSearchBackendResultProcessingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [a1[6] uniqueIdentifier];
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_ERROR, "Missing expected MDItemPhotosPeoplePersonIdentifiers for %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

+ (unint64_t)_searchResultTypeForSpotlightSearchableItem:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 613, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];
  }
  int v6 = [v5 attributeSet];
  id v7 = [v6 photosResultType];

  if ([v7 isEqualToString:*MEMORY[0x1E4F8B768]])
  {
    unint64_t v8 = 1;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F8B760]])
  {
    unint64_t v8 = 2;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F8B778]])
  {
    unint64_t v8 = 3;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F8B770]])
  {
    unint64_t v8 = 4;
  }
  else
  {
    id v9 = PLSearchBackendResultProcessingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Received searchableItem with invalid result type: %@", buf, 0xCu);
    }

    unint64_t v8 = 0;
  }

  return v8;
}

+ (id)_collectionUUIDsForSpotlightSearchableItem:(id)a3 identifiersKey:(id)a4 countsKey:(id)a5 assetCountByCollectionUUID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 593, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];

    if (v12)
    {
LABEL_3:
      if (v13) {
        goto LABEL_4;
      }
LABEL_10:
      id v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 595, @"Invalid parameter not satisfying: %@", @"countsKey" object file lineNumber description];

      if (v14) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 594, @"Invalid parameter not satisfying: %@", @"identifiersKey" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_4:
  if (v14) {
    goto LABEL_5;
  }
LABEL_11:
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 596, @"Invalid parameter not satisfying: %@", @"assetCountByCollectionUUID" object file lineNumber description];

LABEL_5:
  long long v15 = [v11 attributeSet];
  long long v16 = [v15 valueForCustomKey:v12];
  long long v17 = [v15 valueForCustomKey:v13];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __116__PHSearchProcessor__collectionUUIDsForSpotlightSearchableItem_identifiersKey_countsKey_assetCountByCollectionUUID___block_invoke;
  v25[3] = &unk_1E5841FC8;
  id v26 = v14;
  id v27 = v17;
  id v18 = v17;
  id v19 = v14;
  [v16 enumerateObjectsUsingBlock:v25];

  return v16;
}

void __116__PHSearchProcessor__collectionUUIDsForSpotlightSearchableItem_identifiersKey_countsKey_assetCountByCollectionUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  objc_msgSend(v5, "_pl_safeObjectAtIndex:", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

+ (id)_popResultsFromResults:(id)a3 popCount:(unint64_t)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 count];
  if (v6 < a4) {
    a4 = v6;
  }
  id v7 = objc_msgSend(v5, "subarrayWithRange:", 0, a4);
  objc_msgSend(v5, "removeObjectsInRange:", 0, a4);

  return v7;
}

+ (id)_rankedCollectionSearchResultsFromResults:(id)a3 maxResults:(unint64_t)a4 queryId:(int)a5 batchId:(int)a6
{
  LODWORD(v37) = a5;
  HIDWORD(v37) = a6;
  v59[4] = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  PLPhotosSearchGetLog();
  unint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  unint64_t v8 = v6;
  id v9 = v8;
  os_signpost_id_t spid = v7;
  unint64_t v43 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PLSearchBackendQueryCollectionRanking", (const char *)&unk_19B30018E, buf, 2u);
  }
  long long v44 = v9;

  if ([v46 count])
  {
    long long v42 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"collectionScore" ascending:0];
    long long v41 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"l2Score" ascending:0];
    long long v40 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"l1Score" ascending:0];
    long long v39 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
    v59[0] = v42;
    v59[1] = v41;
    v59[2] = v40;
    v59[3] = v39;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:4];
    id v11 = [v46 sortedArrayUsingDescriptors:v10];

    if ([v11 count] <= a4)
    {
      id v48 = v11;
    }
    else
    {
      id v48 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
      id v12 = objc_opt_new();
      uint64_t v49 = objc_opt_new();
      id v13 = objc_opt_new();
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v14 = v11;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v51 != v16) {
              objc_enumerationMutation(v14);
            }
            id v18 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            uint64_t v19 = objc_msgSend(v18, "type", v37);
            id v20 = v12;
            switch(v19)
            {
              case 0:
              case 1:
                uint64_t v21 = PLSearchBackendResultProcessingGetLog();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)id v55 = v18;
                  _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_ERROR, "Unexpected result type found during Top Collections ranking: %@", buf, 0xCu);
                }

                continue;
              case 2:
                goto LABEL_17;
              case 3:
                id v20 = v49;
                goto LABEL_17;
              case 4:
                id v20 = v13;
LABEL_17:
                [v20 addObject:v18];
                break;
              default:
                continue;
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v58 count:16];
        }
        while (v15);
      }

      uint64_t v22 = [v12 count];
      uint64_t v23 = [v13 count];
      uint64_t v24 = [v49 count];
      unint64_t v25 = (unint64_t)((double)a4 * 0.2);
      id v26 = [a1 _popResultsFromResults:v12 popCount:v25];
      [v48 addObjectsFromArray:v26];

      id v27 = [a1 _popResultsFromResults:v13 popCount:v25];
      [v48 addObjectsFromArray:v27];

      uint64_t v28 = [a1 _popResultsFromResults:v49 popCount:v25];
      [v48 addObjectsFromArray:v28];

      if (v23 + v22 + v24 >= a4) {
        unint64_t v29 = a4;
      }
      else {
        unint64_t v29 = v23 + v22 + v24;
      }
      do
      {
        if (objc_msgSend(v48, "count", v37) >= v29) {
          break;
        }
        uint64_t v30 = [a1 _popResultsFromResults:v12 popCount:1];
        [v48 addObjectsFromArray:v30];

        if ([v48 count] >= v29) {
          break;
        }
        uint64_t v31 = [a1 _popResultsFromResults:v13 popCount:1];
        [v48 addObjectsFromArray:v31];

        if ([v48 count] >= v29) {
          break;
        }
        int v32 = [a1 _popResultsFromResults:v49 popCount:1];
        [v48 addObjectsFromArray:v32];
      }
      while ([v48 count] < v29);
    }
  }
  else
  {
    id v48 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v33 = v44;
  id v34 = v33;
  if (v43 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    uint64_t v35 = [v46 count];
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)id v55 = v37;
    *(_WORD *)&v55[4] = 1024;
    *(_DWORD *)&v55[6] = HIDWORD(v37);
    __int16 v56 = 2048;
    uint64_t v57 = v35;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v34, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendQueryCollectionRanking", "Query: %d, Batch: %d, CollectionResults: %tu", buf, 0x18u);
  }

  return v48;
}

+ (id)_rankedAssetSearchResultsFromResults:(id)a3 maxResults:(unint64_t)a4 queryId:(int)a5 batchId:(int)a6
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  PLPhotosSearchGetLog();
  unint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = v8;
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PLSearchBackendQueryAssetRanking", (const char *)&unk_19B30018E, buf, 2u);
  }

  if ([v7 count])
  {
    id v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"l2Score" ascending:0];
    id v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"l1Score" ascending:0];
    id v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
    v30[0] = v12;
    v30[1] = v13;
    v30[2] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
    uint64_t v16 = [v7 sortedArrayUsingDescriptors:v15];

    if ([v16 count] > a4)
    {
      uint64_t v17 = objc_msgSend(v16, "subarrayWithRange:", 0, a4);

      uint64_t v16 = (void *)v17;
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v18 = v11;
  uint64_t v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    uint64_t v20 = [v7 count];
    *(_DWORD *)buf = 67109632;
    int v25 = a5;
    __int16 v26 = 1024;
    int v27 = a6;
    __int16 v28 = 2048;
    uint64_t v29 = v20;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v19, OS_SIGNPOST_INTERVAL_END, v9, "PLSearchBackendQueryAssetRanking", "Query: %d, Batch: %d, AssetResults: %tu", buf, 0x18u);
  }

  return v16;
}

+ (id)queryMatchDetailsForSearchResults:(id)a3 queryText:(id)a4 queryEmbedding:(id)a5 queryId:(int)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v48 = a4;
  id v49 = a5;
  if (!v48)
  {
    long long v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 431, @"Invalid parameter not satisfying: %@", @"queryText" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_25:
    long long v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 432, @"Invalid parameter not satisfying: %@", @"searchResults" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_25;
  }
LABEL_3:
  id v11 = PLPhotosSearchGetLog();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  id v13 = v11;
  id v14 = v13;
  os_signpost_id_t spid = v12;
  unint64_t v46 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLSearchBackendQueryExtractQueryMatchDetails", (const char *)&unk_19B30018E, buf, 2u);
  }
  long long v47 = v14;

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v19 = v10;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v52 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if ([v23 type] == 1)
        {
          uint64_t v24 = [v23 personUUIDS];
          [v15 addObjectsFromArray:v24];

          int v25 = [v23 sceneIdentifiers];
          [v16 addObjectsFromArray:v25];

          __int16 v26 = [v23 audioIdentifiers];
          [v17 addObjectsFromArray:v26];

          int v27 = [v23 humanActionIdentifiers];
          [v18 addObjectsFromArray:v27];

          if ([v23 hasOCRTextMatch])
          {
            __int16 v28 = [v23 uuid];
            [v50 addObject:v28];
          }
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v20);
  }

  long long v44 = [PHSearchQueryMatchDetails alloc];
  uint64_t v29 = [v15 allObjects];
  uint64_t v30 = [v16 allObjects];
  uint64_t v31 = [v17 allObjects];
  int v32 = [v18 allObjects];
  id v33 = [v50 allObjects];
  long long v45 = [(PHSearchQueryMatchDetails *)v44 initWithQueryText:v48 queryEmbedding:v49 personUUIDS:v29 sceneIdentifiers:v30 audioIdentifiers:v31 humanActionIdentifiers:v32 ocrAssetUUIDS:v33];

  id v34 = v47;
  uint64_t v35 = v34;
  if (v46 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v34))
  {
    uint64_t v36 = [v19 count];
    uint64_t v37 = @"YES";
    *(_DWORD *)buf = 67109634;
    int v56 = a6;
    if (!v49) {
      uint64_t v37 = @"NO";
    }
    __int16 v57 = 2048;
    uint64_t v58 = v36;
    __int16 v59 = 2112;
    uint64_t v60 = v37;
    id v38 = v37;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v35, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendQueryExtractQueryMatchDetails", "Query: %d, SearchResults: %tu, QueryEmbedding: %@", buf, 0x1Cu);
  }

  return v45;
}

+ (id)queryMatchDetailsForSearchResults:(id)a3 queryText:(id)a4 queryEmbedding:(id)a5 matchedPersonUUIDs:(id)a6 matchedScenes:(id)a7 queryId:(int)a8
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v58 = a5;
  id v57 = a6;
  id v16 = a7;
  int v56 = v15;
  if (!v15)
  {
    id v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 368, @"Invalid parameter not satisfying: %@", @"queryText" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
LABEL_42:
    long long v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, a1, @"PHSearchProcessor.m", 369, @"Invalid parameter not satisfying: %@", @"searchResults" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v14) {
    goto LABEL_42;
  }
LABEL_3:
  id v17 = PLPhotosSearchGetLog();
  os_signpost_id_t v18 = os_signpost_id_generate(v17);
  id v19 = v17;
  uint64_t v20 = v19;
  os_signpost_id_t spid = v18;
  unint64_t v54 = v18 - 1;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PLSearchBackendQueryExtractQueryMatchDetails", (const char *)&unk_19B30018E, buf, 2u);
  }
  id v55 = v20;

  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v21 = v14;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v68 != v23) {
          objc_enumerationMutation(v21);
        }
        int v25 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        if ([v25 type] == 1 && objc_msgSend(v25, "hasOCRTextMatch"))
        {
          __int16 v26 = [v25 uuid];
          [v61 addObject:v26];
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v67 objects:v74 count:16];
    }
    while (v22);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v27 = v16;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v64 != v29) {
          objc_enumerationMutation(v27);
        }
        uint64_t v31 = *(void **)(*((void *)&v63 + 1) + 8 * j);
        if ([v31 count] == 2)
        {
          int v32 = [v31 objectAtIndexedSubscript:0];
          id v33 = [v31 objectAtIndexedSubscript:1];
          uint64_t v34 = [v33 unsignedIntegerValue];

          uint64_t v35 = v62;
          switch(v34)
          {
            case 1:
              goto LABEL_30;
            case 2:
              uint64_t v35 = v59;
              goto LABEL_30;
            case 3:
              uint64_t v35 = v60;
LABEL_30:
              [v35 addObject:v32];
              break;
            case 4:
            case 6:
            case 7:
            case 8:
              break;
            default:
              uint64_t v36 = PLSearchBackendResultProcessingGetLog();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218242;
                *(void *)v72 = v34;
                *(_WORD *)&v72[8] = 2112;
                *(void *)&v72[10] = v31;
                _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_ERROR, "Invalid scene type %tu, while resolving match details. sceneIdentifierAndType: %@", buf, 0x16u);
              }

              break;
          }
        }
        else
        {
          int v32 = PLSearchBackendQueryGetLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v72 = v31;
            _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_ERROR, "Invalid sceneIdentifierAndType: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v63 objects:v73 count:16];
    }
    while (v28);
  }

  uint64_t v37 = [PHSearchQueryMatchDetails alloc];
  id v38 = [v57 allObjects];
  long long v39 = [v62 allObjects];
  long long v40 = [v60 allObjects];
  long long v41 = [v59 allObjects];
  long long v42 = [v61 allObjects];
  unint64_t v43 = [(PHSearchQueryMatchDetails *)v37 initWithQueryText:v56 queryEmbedding:v58 personUUIDS:v38 sceneIdentifiers:v39 audioIdentifiers:v40 humanActionIdentifiers:v41 ocrAssetUUIDS:v42];

  long long v44 = v55;
  long long v45 = v44;
  if (v54 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v44))
  {
    uint64_t v46 = [v21 count];
    long long v47 = @"YES";
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v72 = a8;
    if (!v58) {
      long long v47 = @"NO";
    }
    *(_WORD *)&v72[4] = 2048;
    *(void *)&v72[6] = v46;
    *(_WORD *)&v72[14] = 2112;
    *(void *)&v72[16] = v47;
    id v48 = v47;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v45, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendQueryExtractQueryMatchDetails", "Query: %d, SearchResults: %tu, QueryEmbedding: %@", buf, 0x1Cu);
  }

  return v43;
}

+ (void)searchSuggestionsFromPLSearchSuggestions:(id)a3 suggestions:(id *)a4 queryId:(int)a5 batchId:(int)a6 rangeOfSuggestionText:(_NSRange)a7
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if ([v12 count])
  {
    PLPhotosSearchGetLog();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v14 = os_signpost_id_generate(v13);

    id v15 = v13;
    id v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLSearchBackendQuerySuggestionTranslation", (const char *)&unk_19B30018E, buf, 2u);
    }

    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __112__PHSearchProcessor_searchSuggestionsFromPLSearchSuggestions_suggestions_queryId_batchId_rangeOfSuggestionText___block_invoke;
    v22[3] = &unk_1E5841FA0;
    NSUInteger v24 = location;
    NSUInteger v25 = length;
    id v18 = v17;
    id v23 = v18;
    [v12 enumerateObjectsUsingBlock:v22];
    *a4 = (id)[v18 copy];
    id v19 = v16;
    uint64_t v20 = v19;
    if (v14 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v19))
    {
      uint64_t v21 = [v12 count];
      *(_DWORD *)buf = 67109632;
      int v27 = a5;
      __int16 v28 = 1024;
      int v29 = a6;
      __int16 v30 = 2048;
      uint64_t v31 = v21;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v20, OS_SIGNPOST_INTERVAL_END, v14, "PLSearchBackendQuerySuggestionTranslation", "Query: %d, Batch: %d, Suggestions: %tu", buf, 0x18u);
    }
  }
  else
  {
    *a4 = (id)MEMORY[0x1E4F1CBF0];
  }
}

void __112__PHSearchProcessor_searchSuggestionsFromPLSearchSuggestions_suggestions_queryId_batchId_rangeOfSuggestionText___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  uint64_t v3 = [v15 suggestionType];
  uint64_t v4 = [v15 categoriesType];
  if ([v15 matchedAssetsCount]) {
    uint64_t v5 = [v15 matchedAssetsCount];
  }
  else {
    uint64_t v5 = [v15 matchedCollectionsCount];
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [v15 matchRangeOfSearchText];
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
  }
  if ((unint64_t)(v4 - 1) >= 0x29) {
    uint64_t v4 = 0;
  }
  if (v3 == 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2 * (v3 == 2);
  }
  id v11 = [PHSearchSuggestion alloc];
  id v12 = [v15 contentString];
  id v13 = [v15 suggestionComponents];
  os_signpost_id_t v14 = -[PHSearchSuggestion initWithType:categoriesType:text:matchRangeOfSearchText:count:suggestionComponents:](v11, "initWithType:categoriesType:text:matchRangeOfSearchText:count:suggestionComponents:", v10, v4, v12, v7, v9, v6, v13);

  [*(id *)(a1 + 32) addObject:v14];
}

@end