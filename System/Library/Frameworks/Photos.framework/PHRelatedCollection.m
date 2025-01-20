@interface PHRelatedCollection
+ (id)_relatedCollectionsFromInfos:(id)a3 relatedObject:(id)a4 photoLibrary:(id)a5;
+ (id)_transientCollectionListWithCollectionsRelatedToLocalIdentifiers:(id)a3 relationType:(unint64_t)a4 options:(id)a5 photoLibrary:(id)a6;
+ (id)transientCollectionListWithCollectionsRelatedToObject:(id)a3 relationType:(unint64_t)a4 options:(id)a5;
+ (id)transientCollectionListWithCollectionsRelatedToPersons:(id)a3 relationType:(unint64_t)a4 options:(id)a5;
- (BOOL)canPerformEditOperation:(int64_t)a3;
- (NSArray)debugInfo;
- (NSArray)momentLocalIdentifiers;
- (NSString)highlightLocalIdentifier;
- (NSString)subtitle;
- (PHObject)relatedObject;
- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 relationType:(unint64_t)a5 relatedObject:(id)a6 title:(id)a7 subtitle:(id)a8 titleCategory:(int64_t)a9 highlightLocalIdentifier:(id)a10 momentLocalIdentifiers:(id)a11 debugInfo:(id)a12;
- (id)localizedSubtitle;
- (int64_t)titleCategory;
- (unint64_t)relationType;
@end

@implementation PHRelatedCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_momentLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_highlightLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_relatedObject, 0);

  objc_storeStrong((id *)&self->_debugInfo, 0);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSArray)momentLocalIdentifiers
{
  return self->_momentLocalIdentifiers;
}

- (NSString)highlightLocalIdentifier
{
  return self->_highlightLocalIdentifier;
}

- (PHObject)relatedObject
{
  return self->_relatedObject;
}

- (NSArray)debugInfo
{
  return self->_debugInfo;
}

- (unint64_t)relationType
{
  return self->_relationType;
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  return a3 == 1;
}

- (int64_t)titleCategory
{
  return self->_titleCategory;
}

- (id)localizedSubtitle
{
  return self->_subtitle;
}

- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 relationType:(unint64_t)a5 relatedObject:(id)a6 title:(id)a7 subtitle:(id)a8 titleCategory:(int64_t)a9 highlightLocalIdentifier:(id)a10 momentLocalIdentifiers:(id)a11 debugInfo:(id)a12
{
  id v25 = a6;
  id v24 = a8;
  id v23 = a10;
  id v19 = a11;
  v26.receiver = self;
  v26.super_class = (Class)PHRelatedCollection;
  v20 = [(PHAssetCollection *)&v26 initTransientWithAssets:a3 orFetchResult:a4 title:a7 identifier:0 albumKind:0];
  v21 = v20;
  if (v20)
  {
    v20[45] = (id)a5;
    objc_storeStrong(v20 + 47, a6);
    objc_storeStrong(v21 + 48, a10);
    objc_storeStrong(v21 + 49, a11);
    objc_storeStrong(v21 + 50, a8);
    v21[13] = (id)5;
    v21[44] = (id)a9;
  }

  return v21;
}

+ (id)_transientCollectionListWithCollectionsRelatedToLocalIdentifiers:(id)a3 relationType:(unint64_t)a4 options:(id)a5 photoLibrary:(id)a6
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [v12 photoAnalysisClient];
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E4F1CA60];
    v28 = @"PHRelatedOptionRelationOptionsKey";
    v15 = [NSNumber numberWithUnsignedInteger:a4];
    v29[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v17 = [v14 dictionaryWithDictionary:v16];

    uint64_t v18 = [v11 fetchLimit];
    if (v18)
    {
      id v19 = [NSNumber numberWithUnsignedInteger:v18];
      [v17 setObject:v19 forKeyedSubscript:@"PHRelatedOptionFetchLimitKey"];
    }
    v20 = [v11 referenceAsset];
    v21 = v20;
    if (v20)
    {
      v22 = [v20 localIdentifier];
      [v17 setObject:v22 forKeyedSubscript:@"PHRelatedOptionReferenceAssetIdentifier"];
    }
    uint64_t v27 = 0;
    id v23 = [v13 requestAssetCollectionsRelatedToPersonLocalIdentifiers:v10 options:v17 error:&v27];
    if (v23)
    {
      id v24 = [a1 _relatedCollectionsFromInfos:v23 relatedObject:0 photoLibrary:v12];
      id v25 = +[PHCollectionList transientCollectionListWithCollections:v24 title:0 identifier:0 photoLibrary:v12];
    }
    else
    {
      id v25 = +[PHCollectionList transientCollectionListWithCollections:MEMORY[0x1E4F1CBF0] title:0 identifier:0 photoLibrary:v12];
    }
  }
  else
  {
    id v25 = +[PHCollectionList transientCollectionListWithCollections:MEMORY[0x1E4F1CBF0] title:0];
  }

  return v25;
}

+ (id)transientCollectionListWithCollectionsRelatedToPersons:(id)a3 relationType:(unint64_t)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_msgSend(v8, "_pl_map:", &__block_literal_global_28564);
  id v11 = [v9 photoLibrary];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    v14 = [v8 firstObject];
    id v13 = [v14 photoLibrary];
  }
  v15 = [a1 _transientCollectionListWithCollectionsRelatedToLocalIdentifiers:v10 relationType:a4 options:v9 photoLibrary:v13];

  return v15;
}

uint64_t __99__PHRelatedCollection_transientCollectionListWithCollectionsRelatedToPersons_relationType_options___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

+ (id)transientCollectionListWithCollectionsRelatedToObject:(id)a3 relationType:(unint64_t)a4 options:(id)a5
{
  v83[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 photoLibrary];
  id v11 = [v10 photoAnalysisClient];

  if (!v11)
  {
    v41 = +[PHCollectionList transientCollectionListWithCollections:MEMORY[0x1E4F1CBF0] title:0];
    goto LABEL_51;
  }
  id v61 = a1;
  id v12 = (void *)MEMORY[0x1E4F1CA60];
  v82[0] = @"PHRelatedOptionRelationOptionsKey";
  id v13 = [NSNumber numberWithUnsignedInteger:a4];
  v82[1] = @"PHRelatedOptionIsDiversityEnabledKey";
  v83[0] = v13;
  v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "enableDiversity"));
  v83[1] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
  v16 = [v12 dictionaryWithDictionary:v15];

  v17 = [v9 referenceAsset];
  uint64_t v18 = v17;
  if (v17)
  {
    id v19 = [v17 localIdentifier];
    [v16 setObject:v19 forKeyedSubscript:@"PHRelatedOptionReferenceAssetIdentifier"];
  }
  v62 = [v9 excludedAssetCollections];
  v63 = v16;
  v64 = v11;
  if ([v62 count])
  {
    v58 = v18;
    id v59 = v9;
    id v60 = v8;
    v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v62, "count"));
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v21 = v62;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v72 objects:v81 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v73 != v24) {
            objc_enumerationMutation(v21);
          }
          objc_super v26 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          switch([v26 assetCollectionType])
          {
            case 3:
              uint64_t v27 = [v26 localIdentifier];
              v28 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:0 orObject:v26];
              v80 = v26;
              v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
              v30 = +[PHAssetCollection fetchPhotosHighlightsContainingMoments:v29 options:v28];
              v31 = [v30 firstObject];

              if (v31)
              {
                v32 = [v31 localIdentifier];
                [v20 addObject:v32];
              }
              if (v27) {
                goto LABEL_18;
              }
              break;
            case 4:
            case 6:
              uint64_t v27 = [v26 localIdentifier];
              if (v27) {
                goto LABEL_18;
              }
              break;
            case 5:
              id v33 = v26;
              uint64_t v27 = [v33 highlightLocalIdentifier];
              v34 = [v33 momentLocalIdentifiers];

              [v20 addObjectsFromArray:v34];
              if (v27)
              {
LABEL_18:
                [v20 addObject:v27];
              }
              break;
            default:
              continue;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v72 objects:v81 count:16];
      }
      while (v23);
    }

    v35 = [MEMORY[0x1E4F1CAD0] setWithArray:v20];
    v16 = v63;
    [v63 setObject:v35 forKeyedSubscript:@"PHRelatedOptionFilteringLocalIdentifiers"];

    id v9 = v59;
    id v8 = v60;
    id v11 = v64;
    uint64_t v18 = v58;
  }
  uint64_t v36 = [v9 fetchLimit];
  if (v36)
  {
    v37 = [NSNumber numberWithUnsignedInteger:v36];
    [v16 setObject:v37 forKeyedSubscript:@"PHRelatedOptionFetchLimitKey"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v38 = [v8 localIdentifier];
    id v71 = 0;
    v39 = [v11 requestAssetCollectionsRelatedToAssetWithLocalIdentifier:v38 options:v16 error:&v71];
    id v40 = v71;
    goto LABEL_45;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v38 = v8;
    v42 = [v38 highlightLocalIdentifier];
    v43 = [v38 momentLocalIdentifiers];
    v44 = v43;
    if (v42)
    {
      v70 = 0;
      v39 = [v11 requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:v42 options:v16 error:&v70];
      v45 = v70;
    }
    else
    {
      if ([v43 count] == 1)
      {
        v48 = [v44 firstObject];
        id v69 = 0;
        v39 = [v11 requestAssetCollectionsRelatedToMomentWithLocalIdentifier:v48 options:v16 error:&v69];
        id v40 = v69;

LABEL_44:
        goto LABEL_45;
      }
      v50 = +[PHAssetCollection graphOptionsForTransientAssetCollection:v38 needsCompleteMomentsInfo:0 options:0];
      [v16 addEntriesFromDictionary:v50];

      v68 = 0;
      v39 = [v11 requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:0 options:v16 error:&v68];
      v45 = v68;
    }
    id v40 = v45;
    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v46 = v8;
    id v38 = [v46 localIdentifier];
    id v67 = 0;
    v39 = [v11 requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:v38 options:v16 error:&v67];
    id v40 = v67;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v49 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v77 = v8;
        _os_log_impl(&dword_19B043000, v49, OS_LOG_TYPE_ERROR, "Invalid PHObject type for related query: %@", buf, 0xCu);
      }

      id v40 = 0;
      goto LABEL_47;
    }
    id v38 = v8;
    if ([v38 assetCollectionType] == 3
      || [v38 assetCollectionType] == 6
      || [v38 assetCollectionType] == 1
      || [v38 assetCollectionType] == 2 && objc_msgSend(v38, "assetCollectionSubtype") != 200)
    {
      v47 = [v38 localIdentifier];
      id v66 = 0;
      v39 = [v11 requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:v47 options:v16 error:&v66];
      id v40 = v66;
    }
    else
    {
      v57 = +[PHAssetCollection graphOptionsForTransientAssetCollection:v38 needsCompleteMomentsInfo:0 options:0];
      [v16 addEntriesFromDictionary:v57];

      id v65 = 0;
      v39 = [v11 requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:0 options:v16 error:&v65];
      id v40 = v65;
    }
  }
LABEL_45:

  if (!v39)
  {
LABEL_47:
    v55 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v77 = v8;
      __int16 v78 = 2112;
      id v79 = v40;
      _os_log_impl(&dword_19B043000, v55, OS_LOG_TYPE_ERROR, "Request for asset collections related to object %@ failed with error %@", buf, 0x16u);
    }

    v39 = [v8 photoLibrary];
    v41 = +[PHCollectionList transientCollectionListWithCollections:MEMORY[0x1E4F1CBF0] title:0 identifier:0 photoLibrary:v39];
    goto LABEL_50;
  }
  v51 = [v8 photoLibrary];
  v52 = [v61 _relatedCollectionsFromInfos:v39 relatedObject:v8 photoLibrary:v51];

  [v8 photoLibrary];
  v54 = v53 = v18;
  v41 = +[PHCollectionList transientCollectionListWithCollections:v52 title:0 identifier:0 photoLibrary:v54];

  uint64_t v18 = v53;
LABEL_50:

  id v11 = v64;
LABEL_51:

  return v41;
}

+ (id)_relatedCollectionsFromInfos:(id)a3 relatedObject:(id)a4 photoLibrary:(id)a5
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v76 = a5;
  id v69 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v7;
  uint64_t v70 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
  if (v70)
  {
    uint64_t v9 = *(void *)v82;
    id v75 = v8;
    uint64_t v66 = *(void *)v82;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v82 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v81 + 1) + 8 * v10);
        uint64_t v12 = [v11 objectForKeyedSubscript:@"PHRelatedMemoryIdentifierKey"];
        uint64_t v13 = [v11 objectForKeyedSubscript:@"PHRelatedHighlightIdentifierKey"];
        v14 = [v11 objectForKeyedSubscript:@"PHRelatedMomentIdentifiersKey"];
        id v71 = v14;
        long long v72 = (void *)v13;
        if (v13)
        {
          uint64_t v15 = v13;
          v16 = (void *)v12;
          uint64_t v17 = v10;
          uint64_t v87 = v15;
          uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
          id v19 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:v76 orObject:v8];
          v20 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v18 options:v19];
          id v21 = [v20 firstObject];

          if (v21) {
            [v69 addObject:v21];
          }
LABEL_17:
          uint64_t v10 = v17;
          goto LABEL_18;
        }
        uint64_t v22 = v14;
        if ([v14 count] == 1)
        {
          id v67 = (void *)v12;
          uint64_t v23 = [v22 firstObject];
          uint64_t v24 = +[PHObject uuidFromLocalIdentifier:v23];

          id v25 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:v76 orObject:v8];
          long long v73 = (void *)v24;
          objc_super v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid = %@", v24];
          [v25 setPredicate:v26];
          uint64_t v27 = +[PHAssetCollection fetchMomentsWithOptions:v25];
          v28 = [v27 lastObject];

          if (v28)
          {
            +[PHAsset fetchAssetsInAssetCollection:v28 options:0];
            v30 = uint64_t v29 = v10;
            v31 = [PHRelatedCollection alloc];
            v32 = [v11 objectForKeyedSubscript:@"PHRelatedSuggestedTitleKey"];
            uint64_t v33 = [v11 objectForKeyedSubscript:@"PHRelatedSuggestedSubtitleKey"];
            v34 = v11;
            v35 = (void *)v33;
            uint64_t v36 = [v34 objectForKeyedSubscript:@"PHRelatedTitleCategoryKey"];
            id v37 = -[PHRelatedCollection initTransientWithAssets:orFetchResult:relationType:relatedObject:title:subtitle:titleCategory:highlightLocalIdentifier:momentLocalIdentifiers:debugInfo:](v31, "initTransientWithAssets:orFetchResult:relationType:relatedObject:title:subtitle:titleCategory:highlightLocalIdentifier:momentLocalIdentifiers:debugInfo:", 0, v30, 63, v75, v32, v35, [v36 integerValue], 0, v22, 0);

            id v8 = v75;
            [v69 addObject:v37];

            uint64_t v10 = v29;
          }

          uint64_t v9 = v66;
          v16 = v67;
          id v21 = v73;
        }
        else
        {
          if (v12)
          {
            uint64_t v17 = v10;
            id v38 = [v76 librarySpecificFetchOptions];
            [v38 setIncludeLocalMemories:1];
            [v38 setFetchLimit:1];
            v16 = (void *)v12;
            uint64_t v86 = v12;
            v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
            id v21 = v38;
            id v40 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v39 options:v38];
            v41 = [v40 firstObject];

            if (v41) {
              [v69 addObject:v41];
            }

            goto LABEL_17;
          }
          v64 = v11;
          uint64_t v65 = v10;
          long long v74 = [MEMORY[0x1E4F1CA48] array];
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          id v42 = v22;
          uint64_t v43 = [v42 countByEnumeratingWithState:&v77 objects:v85 count:16];
          if (v43)
          {
            uint64_t v44 = v43;
            uint64_t v45 = *(void *)v78;
            do
            {
              for (uint64_t i = 0; i != v44; ++i)
              {
                if (*(void *)v78 != v45) {
                  objc_enumerationMutation(v42);
                }
                v47 = +[PHObject uuidFromLocalIdentifier:*(void *)(*((void *)&v77 + 1) + 8 * i)];
                v48 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:v76 orObject:v8];
                v49 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid = %@", v47];
                [v48 setPredicate:v49];
                v50 = +[PHAssetCollection fetchMomentsWithOptions:v48];
                v51 = [v50 lastObject];

                if (v51)
                {
                  v52 = +[PHAsset fetchAssetsInAssetCollection:v51 options:0];
                  v53 = [v52 fetchedObjectIDs];
                  if (v53) {
                    [v74 addObjectsFromArray:v53];
                  }

                  id v8 = v75;
                }
              }
              uint64_t v44 = [v42 countByEnumeratingWithState:&v77 objects:v85 count:16];
            }
            while (v44);
          }

          v54 = [PHManualFetchResult alloc];
          v55 = +[PHAsset fetchType];
          v56 = [(PHManualFetchResult *)v54 initWithOids:v74 photoLibrary:v76 fetchType:v55 fetchPropertySets:0 identifier:0 registerIfNeeded:1];

          v57 = [PHRelatedCollection alloc];
          v58 = [v64 objectForKeyedSubscript:@"PHRelatedSuggestedTitleKey"];
          id v59 = [v64 objectForKeyedSubscript:@"PHRelatedSuggestedSubtitleKey"];
          id v60 = [v64 objectForKeyedSubscript:@"PHRelatedTitleCategoryKey"];
          id v61 = -[PHRelatedCollection initTransientWithAssets:orFetchResult:relationType:relatedObject:title:subtitle:titleCategory:highlightLocalIdentifier:momentLocalIdentifiers:debugInfo:](v57, "initTransientWithAssets:orFetchResult:relationType:relatedObject:title:subtitle:titleCategory:highlightLocalIdentifier:momentLocalIdentifiers:debugInfo:", 0, v56, 63, v8, v58, v59, [v60 integerValue], 0, v42, 0);

          [v69 addObject:v61];
          id v21 = v74;

          uint64_t v10 = v65;
          uint64_t v9 = v66;
          v16 = 0;
        }
LABEL_18:

        ++v10;
      }
      while (v10 != v70);
      uint64_t v62 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
      uint64_t v70 = v62;
    }
    while (v62);
  }

  return v69;
}

@end