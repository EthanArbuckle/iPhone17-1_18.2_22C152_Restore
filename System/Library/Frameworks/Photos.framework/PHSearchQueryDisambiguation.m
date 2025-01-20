@interface PHSearchQueryDisambiguation
+ (id)_performDisambiguationForLocationName:(id)a3 expansionStringValues:(id)a4 allowedSearchIndexCategories:(id)a5 maxNumberOfResults:(unint64_t)a6 matchOptions:(unint64_t)a7 photoLibrary:(id)a8;
+ (id)_performDisambiguationForLocationName:(id)a3 expansionStringValues:(id)a4 allowedSearchIndexCategories:(id)a5 maxNumberOfResults:(unint64_t)a6 matchOptions:(unint64_t)a7 photosEntityStore:(id)a8;
+ (id)_performDisambiguationForLocationName:(id)a3 expansionStringValues:(id)a4 allowedSearchIndexCategories:(id)a5 photosEntityStore:(id)a6;
+ (id)_personLookupIdentifiersForPersonNames:(id)a3 photosEntityStore:(id)a4 photoLibrary:(id)a5;
+ (id)allowedSearchIndexCategoriesForMemoriesLocationPromptBinding;
+ (id)performDisambiguationForLocationName:(id)a3 expansionStringValues:(id)a4 allowedSearchIndexCategories:(id)a5 photoLibrary:(id)a6;
+ (id)performDisambiguationForPersonName:(id)a3 expansionStringValuesByCSAttributedEntityType:(id)a4 photoLibrary:(id)a5;
+ (id)performLocationDisambiguationForFullQueryString:(id)a3 allowedSearchIndexCategories:(id)a4 maxNumberOfResults:(unint64_t)a5 photoLibrary:(id)a6;
@end

@implementation PHSearchQueryDisambiguation

+ (id)_performDisambiguationForLocationName:(id)a3 expansionStringValues:(id)a4 allowedSearchIndexCategories:(id)a5 maxNumberOfResults:(unint64_t)a6 matchOptions:(unint64_t)a7 photosEntityStore:(id)a8
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v33 = v14;
  v31 = v16;
  if ([v14 count])
  {
    id v17 = v14;
  }
  else
  {
    v42[0] = v13;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  }
  v18 = v17;
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v18;
  uint64_t v20 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v26 = PLSearchBackendQueryGetLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v40 = v24;
            _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "QU location data has an unexpected data type: %@", buf, 0xCu);
          }

          goto LABEL_16;
        }
        v25 = (void *)[objc_alloc(MEMORY[0x1E4F8A7D8]) initWithQueryTerm:v24 disambiguationType:1 indexingCategories:v15 maxNumberOfResults:a6 matchOptions:a7];
        [v19 addObject:v25];
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  v27 = (void *)[objc_alloc(MEMORY[0x1E4F8ACB8]) initWithDisambiguations:v19 photosEntityStore:v31];
  v28 = [v27 performDisambiguationQuery];
  v29 = [v28 locationNames];
  if ([v29 count]) {
    [v32 addObjectsFromArray:v29];
  }

  return v32;
}

+ (id)_performDisambiguationForLocationName:(id)a3 expansionStringValues:(id)a4 allowedSearchIndexCategories:(id)a5 photosEntityStore:(id)a6
{
  return (id)[a1 _performDisambiguationForLocationName:a3 expansionStringValues:a4 allowedSearchIndexCategories:a5 maxNumberOfResults:0 matchOptions:15 photosEntityStore:a6];
}

+ (id)_performDisambiguationForLocationName:(id)a3 expansionStringValues:(id)a4 allowedSearchIndexCategories:(id)a5 maxNumberOfResults:(unint64_t)a6 matchOptions:(unint64_t)a7 photoLibrary:(id)a8
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = [a8 searchIndex];
  v18 = [v17 unverifiedPsiSearchIndex];

  if (v18)
  {
    v19 = [a1 _performDisambiguationForLocationName:v14 expansionStringValues:v15 allowedSearchIndexCategories:v16 maxNumberOfResults:a6 matchOptions:a7 photosEntityStore:v18];
  }
  else
  {
    uint64_t v20 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138412290;
      id v23 = v14;
      _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_ERROR, "Unable to open the photos entity store during location disambiguation for %@", (uint8_t *)&v22, 0xCu);
    }

    v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

+ (id)_personLookupIdentifiersForPersonNames:(id)a3 photosEntityStore:(id)a4 photoLibrary:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = (void *)[objc_alloc(MEMORY[0x1E4F8A7D8]) initWithQueryTerm:*(void *)(*((void *)&v21 + 1) + 8 * i) disambiguationType:3 indexingCategories:0 maxNumberOfResults:0 matchOptions:14];
        id v15 = (void *)[objc_alloc(MEMORY[0x1E4F8ACB8]) initWithDisambiguation:v14 photoLibrary:v9 photosEntityStore:v8];
        id v16 = [v15 performDisambiguationQuery];
        id v17 = [v16 personLookupIdentifiers];
        if ([v17 count]) {
          [v20 addObjectsFromArray:v17];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  return v20;
}

+ (id)allowedSearchIndexCategoriesForMemoriesLocationPromptBinding
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:1];
  [v2 addIndex:1700];

  return v2;
}

+ (id)performLocationDisambiguationForFullQueryString:(id)a3 allowedSearchIndexCategories:(id)a4 maxNumberOfResults:(unint64_t)a5 photoLibrary:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[PHSearchUtility allTokenNGramsFromString:v12];
  id v14 = [v13 allObjects];
  id v15 = [a1 _performDisambiguationForLocationName:v12 expansionStringValues:v14 allowedSearchIndexCategories:v11 maxNumberOfResults:a5 matchOptions:6 photoLibrary:v10];

  return v15;
}

+ (id)performDisambiguationForLocationName:(id)a3 expansionStringValues:(id)a4 allowedSearchIndexCategories:(id)a5 photoLibrary:(id)a6
{
  return (id)[a1 _performDisambiguationForLocationName:a3 expansionStringValues:a4 allowedSearchIndexCategories:a5 maxNumberOfResults:0 matchOptions:7 photoLibrary:a6];
}

+ (id)performDisambiguationForPersonName:(id)a3 expansionStringValuesByCSAttributedEntityType:(id)a4 photoLibrary:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PHSearchQueryDisambiguation.m", 27, @"Invalid parameter not satisfying: %@", @"personName" object file lineNumber description];
  }
  id v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F22878]];
  id v13 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F22868]];
  if ([v12 count])
  {
    id v14 = v12;
  }
  else
  {
    id v15 = [v11 searchIndex];
    id v16 = [v15 unverifiedPsiSearchIndex];

    id v17 = [v11 photoLibrary];
    if (v16)
    {
      v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      if ([v13 count])
      {
        v19 = [a1 _personLookupIdentifiersForPersonNames:v13 photosEntityStore:v16 photoLibrary:v17];
        [v18 unionSet:v19];
      }
      if (![v18 count])
      {
        id v24 = v9;
        id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
        long long v21 = [a1 _personLookupIdentifiersForPersonNames:v20 photosEntityStore:v16 photoLibrary:v17];

        [v18 unionSet:v21];
      }
      id v14 = [v18 allObjects];
    }
    else
    {
      v18 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v9;
        _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "Unable to open the photos entity store during person disambiguation for %@", buf, 0xCu);
      }
      id v14 = (id)MEMORY[0x1E4F1CBF0];
    }
  }

  return v14;
}

@end