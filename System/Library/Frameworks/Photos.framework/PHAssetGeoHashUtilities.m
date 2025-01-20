@interface PHAssetGeoHashUtilities
+ (id)_featureVectorDataWithOneHotAtIndex:(unint64_t)a3 featureVectorSize:(unint64_t)a4;
+ (id)_newSystemPhotoLibrary;
+ (id)_poiGeoHashForAsset:(id)a3 geoHashSize:(unint64_t)a4;
+ (id)_randomPublishedUUIDsFromPublishedUUIDs:(id)a3 sentUUIDs:(id)a4;
+ (id)_sceneLabelsForSceneClassifications:(id)a3;
+ (id)assetUUIDsFromBiomeStream;
+ (id)assetUUIDsFromBiomeStreamWithPhotoLibrary:(id)a3;
+ (id)featureVectorByGeoHashForAssetUUID:(id)a3 geoHashSize:(id)a4 geoHashKeySize:(id)a5 sceneLabelMapping:(id)a6 dryRun:(id)a7;
+ (id)featureVectorByGeoHashForAssetUUID:(id)a3 geoHashSize:(id)a4 geoHashKeySize:(id)a5 sceneLabelMapping:(id)a6 dryRun:(id)a7 photoLibrary:(id)a8;
+ (id)featureVectorByGeoHashForAssetUUIDs:(id)a3 geoHashSize:(id)a4 geoHashKeySize:(id)a5 sceneLabelMapping:(id)a6 dryRun:(id)a7;
+ (id)featureVectorByGeoHashForAssetUUIDs:(id)a3 geoHashSize:(id)a4 geoHashKeySize:(id)a5 sceneLabelMapping:(id)a6 dryRun:(id)a7 photoLibrary:(id)a8;
+ (id)mockReturnDataWithAssetUUIDs:(id)a3 geoHashKeySize:(id)a4;
+ (id)poiGeoHashWithGeoHashSize:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5;
+ (id)sceneLabelExclusionList;
+ (unint64_t)_indexForPOIGeoHash:(id)a3 geoHashKeySize:(unint64_t)a4;
+ (unint64_t)_randomIndexFromCount:(unint64_t)a3;
+ (unint64_t)_randomSceneIndexForAsset:(id)a3 sceneLabelMapping:(id)a4 orderedRemappedSceneLabels:(id)a5;
@end

@implementation PHAssetGeoHashUtilities

+ (id)_poiGeoHashForAsset:(id)a3 geoHashSize:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 location];
  [v6 coordinate];
  double v8 = v7;

  v9 = [v5 location];
  [v9 coordinate];
  double v11 = v10;

  if (v8 == 0.0 && v11 == 0.0)
  {
    v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v5 uuid];
      int v16 = 138412290;
      v17 = v13;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEFAULT, "[PHAssetGeoHashUtilities] Invalid coordinates for asset uuid %@", (uint8_t *)&v16, 0xCu);
    }
    v14 = 0;
  }
  else
  {
    v14 = +[PHAssetGeoHashUtilities poiGeoHashWithGeoHashSize:a4 latitude:v8 longitude:v11];
  }

  return v14;
}

+ (id)poiGeoHashWithGeoHashSize:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a4 == 0.0 && a5 == 0.0)
  {
    double v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEFAULT, "[PHAssetGeoHashUtilities] Invalid coordinates", (uint8_t *)&v23, 2u);
    }
    goto LABEL_22;
  }
  double v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([v8 length] >= a3)
  {
LABEL_18:
    double v8 = v8;
    v20 = v8;
    goto LABEL_23;
  }
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  char v11 = 1;
  double v12 = -180.0;
  double v13 = 180.0;
  double v14 = -90.0;
  double v15 = 90.0;
  while (1)
  {
    if (v11)
    {
      double v16 = (v12 + v13) * 0.5;
      double v17 = v14;
      if (v16 >= a5)
      {
        double v13 = (v12 + v13) * 0.5;
        goto LABEL_13;
      }
LABEL_11:
      uint64_t v18 = [&unk_1EEB26D18 objectAtIndexedSubscript:v10];
      v9 |= [v18 integerValue];

      double v12 = v16;
      double v14 = v17;
      goto LABEL_13;
    }
    double v17 = (v14 + v15) * 0.5;
    double v16 = v12;
    if (v17 < a4) {
      goto LABEL_11;
    }
    double v15 = (v14 + v15) * 0.5;
LABEL_13:
    if (v10 > 3) {
      break;
    }
    ++v10;
LABEL_17:
    v11 ^= 1u;
    if ([v8 length] >= a3) {
      goto LABEL_18;
    }
  }
  if (v9 < [@"0123456789bcdefghjkmnpqrstuvwxyz" length])
  {
    v19 = objc_msgSend(@"0123456789bcdefghjkmnpqrstuvwxyz", "substringWithRange:", v9, 1);
    [v8 appendString:v19];

    unint64_t v10 = 0;
    unint64_t v9 = 0;
    goto LABEL_17;
  }
  v21 = PLBackendGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 134218240;
    unint64_t v24 = v9;
    __int16 v25 = 2048;
    uint64_t v26 = [@"0123456789bcdefghjkmnpqrstuvwxyz" length];
    _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_DEFAULT, "[PHAssetGeoHashUtilities] Character index (%lu) is larger than base32 length (%lu).", (uint8_t *)&v23, 0x16u);
  }

LABEL_22:
  v20 = 0;
LABEL_23:

  return v20;
}

+ (id)sceneLabelExclusionList
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1EEB26D00];

  return v2;
}

+ (id)_randomPublishedUUIDsFromPublishedUUIDs:(id)a3 sentUUIDs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 count];
  if (v7 > 0x64)
  {
    uint32_t v10 = v7;
    double v8 = [v5 allObjects];
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    for (uint64_t i = 0; i != 100; ++i)
    {
      uint64_t v13 = arc4random_uniform(v10);
      double v14 = [v8 objectAtIndexedSubscript:v13];
      int v15 = [v6 containsObject:v14];

      for (uint64_t j = 0; j != 100; ++j)
      {
        if (([v11 containsIndex:v13] | v15) != 1) {
          break;
        }
        uint64_t v13 = arc4random_uniform(j);
      }
      [v11 addIndex:v13];
    }
    unint64_t v9 = [v8 objectsAtIndexes:v11];
  }
  else
  {
    double v8 = (void *)[v5 mutableCopy];
    [v8 minusSet:v6];
    unint64_t v9 = [v8 allObjects];
  }

  return v9;
}

+ (id)_newSystemPhotoLibrary
{
  v2 = [PHPhotoLibrary alloc];
  v3 = +[PHPhotoLibrary systemPhotoLibraryURL];
  v4 = [(PHPhotoLibrary *)v2 initWithPhotoLibraryURL:v3];

  return v4;
}

+ (id)_featureVectorDataWithOneHotAtIndex:(unint64_t)a3 featureVectorSize:(unint64_t)a4
{
  if (a3 >= a4)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PHAssetGeoHashUtilities.m", 242, @"Invalid parameter not satisfying: %@", @"oneHotIndex < featureVectorSize" object file lineNumber description];
  }
  id v6 = malloc_type_calloc(a4, 1uLL, 0x100004077774924uLL);
  v6[a3] = 1;
  unint64_t v7 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)[v7 dataWithBytesNoCopy:v6 length:a4];
}

+ (unint64_t)_indexForPOIGeoHash:(id)a3 geoHashKeySize:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(v5, "substringWithRange:", a4, objc_msgSend(v5, "length") - a4);
  unint64_t v7 = 0;
  if ([v6 length])
  {
    unint64_t v8 = 0;
    do
    {
      unint64_t v9 = objc_msgSend(v6, "substringWithRange:", v8, 1);
      unint64_t v10 = [@"0123456789bcdefghjkmnpqrstuvwxyz" rangeOfString:v9];
      unint64_t v7 = (unint64_t)((double)v7 + exp2((double)v8 * 5.0) * (double)v10);

      ++v8;
    }
    while (v8 < [v6 length]);
  }

  return v7;
}

+ (unint64_t)_randomIndexFromCount:(unint64_t)a3
{
  return arc4random_uniform(a3);
}

+ (id)_sceneLabelsForSceneClassifications:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = [a1 sceneLabelExclusionList];
  id v7 = objc_alloc_init(MEMORY[0x1E4F8CD60]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v7, "nodeRefForExtendedSceneClassId:", objc_msgSend(v13, "extendedSceneIdentifier", (void)v25));
        uint64_t v15 = PFSceneTaxonomyNodeNetworkId();
        if (v14) {
          BOOL v16 = v15 == 1;
        }
        else {
          BOOL v16 = 0;
        }
        if (v16)
        {
          [v13 confidence];
          double v18 = v17;
          PFSceneTaxonomyNodeSearchThreshold();
          if (v18 >= v19)
          {
            v20 = PFSceneTaxonomyNodeName();
            v21 = v20;
            if (v20)
            {
              v22 = [v20 lowercaseString];
              char v23 = [v6 containsObject:v22];

              if ((v23 & 1) == 0) {
                [v5 addObject:v21];
              }
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  return v5;
}

+ (unint64_t)_randomSceneIndexForAsset:(id)a3 sceneLabelMapping:(id)a4 orderedRemappedSceneLabels:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v27 = a5;
  uint64_t v10 = [v8 sceneClassifications];
  uint64_t v11 = [a1 _sceneLabelsForSceneClassifications:v10];

  double v12 = PLBackendGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [v8 uuid];
    *(_DWORD *)buf = 138412546;
    v34 = v13;
    __int16 v35 = 2112;
    id v36 = v11;
    _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_INFO, "[PHAssetGeoHashUtilities] Scene labels for asset %@: %@", buf, 0x16u);
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v28 + 1) + 8 * v19) lowercaseString];
        v21 = [v9 objectForKeyedSubscript:v20];

        if (v21) {
          [v14 addObject:v21];
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v17);
  }

  if ([v14 count])
  {
    v22 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(a1, "_randomIndexFromCount:", objc_msgSend(v14, "count")));
    char v23 = v27;
    unint64_t v24 = [v27 indexOfObject:v22];
  }
  else
  {
    v22 = PLBackendGetLog();
    char v23 = v27;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      long long v25 = [v8 uuid];
      *(_DWORD *)buf = 138412546;
      v34 = v25;
      __int16 v35 = 2112;
      id v36 = v15;
      _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_DEFAULT, "[PHAssetGeoHashUtilities] Scene labels for asset %@ are empty after remapping. Scene Labels: %@", buf, 0x16u);
    }
    unint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v24;
}

+ (id)mockReturnDataWithAssetUUIDs:(id)a3 geoHashKeySize:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v14 = [a1 _featureVectorDataWithOneHotAtIndex:1 featureVectorSize:3];
        id v15 = objc_msgSend(v13, "substringWithRange:", 0, objc_msgSend(v7, "integerValue"));
        char v23 = v15;
        unint64_t v24 = v14;
        uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        [v8 addObject:v16];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v10);
  }

  return v8;
}

+ (id)featureVectorByGeoHashForAssetUUIDs:(id)a3 geoHashSize:(id)a4 geoHashKeySize:(id)a5 sceneLabelMapping:(id)a6 dryRun:(id)a7 photoLibrary:(id)a8
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v66 = a4;
  id v15 = a5;
  id v70 = a6;
  id v16 = a7;
  id v17 = a8;
  if ([v15 integerValue] >= 1 && (unint64_t)objc_msgSend(v15, "integerValue") < 5)
  {
    if ([v16 BOOLValue])
    {
      long long v19 = [a1 mockReturnDataWithAssetUUIDs:v14 geoHashKeySize:v15];
    }
    else
    {
      id v61 = v16;
      v65 = v15;
      long long v21 = (void *)MEMORY[0x1E4F1CAD0];
      long long v22 = [v70 allValues];
      char v23 = [v21 setWithArray:v22];

      v64 = v23;
      unint64_t v24 = [v23 allObjects];
      uint64_t v25 = [v24 sortedArrayUsingSelector:sel_compare_];

      v60 = v17;
      uint64_t v26 = [v17 librarySpecificFetchOptions];
      v83 = @"PHAssetPropertySetSceneAnalysis";
      id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
      [v26 setFetchPropertySets:v27];

      v62 = v14;
      v59 = v26;
      long long v28 = +[PHAsset fetchAssetsWithLocalIdentifiers:v14 options:v26];
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      obuint64_t j = v28;
      long long v30 = v66;
      v63 = (void *)v25;
      uint64_t v69 = [obj countByEnumeratingWithState:&v75 objects:v82 count:16];
      if (v69)
      {
        uint64_t v31 = *(void *)v76;
        while (2)
        {
          for (uint64_t i = 0; i != v69; ++i)
          {
            if (*(void *)v76 != v31) {
              objc_enumerationMutation(obj);
            }
            v33 = *(void **)(*((void *)&v75 + 1) + 8 * i);
            v34 = (void *)MEMORY[0x19F389B10]();
            uint64_t v35 = [a1 _randomSceneIndexForAsset:v33 sceneLabelMapping:v70 orderedRemappedSceneLabels:v25];
            if (v35 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v36 = v35;
              context = v34;
              objc_msgSend(a1, "_poiGeoHashForAsset:geoHashSize:", v33, objc_msgSend(v30, "integerValue"));
              v38 = id v37 = a1;
              if (v38)
              {
                uint64_t v39 = objc_msgSend(v37, "_indexForPOIGeoHash:geoHashKeySize:", v38, objc_msgSend(v65, "integerValue"));
                unint64_t v40 = (unint64_t)exp2((double)([v30 integerValue] - objc_msgSend(v65, "integerValue"))* 5.0);
                v41 = objc_msgSend(v37, "_featureVectorDataWithOneHotAtIndex:featureVectorSize:", v39 + v36 * v40, objc_msgSend(v64, "count") * v40);
                uint64_t v25 = (uint64_t)v63;
                v42 = objc_msgSend(v38, "substringWithRange:", 0, objc_msgSend(v65, "integerValue"));
                v80 = v42;
                v81 = v41;
                v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
                v44 = [v33 uuid];
                [v29 setObject:v43 forKeyedSubscript:v44];

                unint64_t v45 = [v29 count];
                BOOL v46 = v45 > 9;
                long long v30 = v66;
                if (v46)
                {

                  goto LABEL_24;
                }
              }

              a1 = v37;
              v34 = context;
            }
          }
          uint64_t v69 = [obj countByEnumeratingWithState:&v75 objects:v82 count:16];
          if (v69) {
            continue;
          }
          break;
        }
      }
LABEL_24:

      id v17 = v60;
      if ([v29 count])
      {
        v47 = (void *)MEMORY[0x1E4F8A778];
        v48 = [v29 allKeys];
        v49 = [v60 photoLibraryBundle];
        v50 = [v49 pathManager];
        [v47 publishUUIDs:v48 stream:1 pathManager:v50];
      }
      id v14 = v62;
      long long v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v62, "count"));
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v51 = v62;
      uint64_t v52 = [v51 countByEnumeratingWithState:&v71 objects:v79 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v72;
        v55 = (void *)MEMORY[0x1E4F1CC08];
        do
        {
          for (uint64_t j = 0; j != v53; ++j)
          {
            if (*(void *)v72 != v54) {
              objc_enumerationMutation(v51);
            }
            uint64_t v57 = [v29 objectForKeyedSubscript:*(void *)(*((void *)&v71 + 1) + 8 * j)];
            if (v57) {
              v58 = (void *)v57;
            }
            else {
              v58 = v55;
            }
            [v19 addObject:v58];
          }
          uint64_t v53 = [v51 countByEnumeratingWithState:&v71 objects:v79 count:16];
        }
        while (v53);
      }

      id v15 = v65;
      id v16 = v61;
    }
  }
  else
  {
    uint64_t v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v85 = v15;
      __int16 v86 = 2048;
      uint64_t v87 = 4;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "[PHAssetGeoHashUtilities] geoHashKeySize %@ not supported. It should be a number between 1 and %tu (inclusive).", buf, 0x16u);
    }

    long long v19 = 0;
  }

  return v19;
}

+ (id)featureVectorByGeoHashForAssetUUIDs:(id)a3 geoHashSize:(id)a4 geoHashKeySize:(id)a5 sceneLabelMapping:(id)a6 dryRun:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v14 integerValue] >= 1 && (unint64_t)objc_msgSend(v14, "integerValue") < 5)
  {
    if ([v16 BOOLValue])
    {
      uint64_t v18 = [a1 mockReturnDataWithAssetUUIDs:v12 geoHashKeySize:v14];
    }
    else
    {
      long long v20 = (void *)[a1 _newSystemPhotoLibrary];
      id v24 = 0;
      char v21 = [v20 openAndWaitWithUpgrade:0 error:&v24];
      id v22 = v24;
      if (v21)
      {
        uint64_t v18 = [a1 featureVectorByGeoHashForAssetUUIDs:v12 geoHashSize:v13 geoHashKeySize:v14 sceneLabelMapping:v15 dryRun:v16 photoLibrary:v20];
        [v20 close];
      }
      else
      {
        char v23 = PLBackendGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v22;
          _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, "[PHAssetGeoHashUtilities] Error opening system photo library: %@", buf, 0xCu);
        }

        uint64_t v18 = 0;
      }
    }
  }
  else
  {
    id v17 = PLBackendGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v14;
      __int16 v27 = 2048;
      uint64_t v28 = 4;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "[PHAssetGeoHashUtilities] geoHashKeySize %@ not supported. It should be a number between 1 and %tu (inclusive).", buf, 0x16u);
    }

    uint64_t v18 = 0;
  }

  return v18;
}

+ (id)featureVectorByGeoHashForAssetUUID:(id)a3 geoHashSize:(id)a4 geoHashKeySize:(id)a5 sceneLabelMapping:(id)a6 dryRun:(id)a7 photoLibrary:(id)a8
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v14 = (void *)MEMORY[0x1E4F1C978];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  char v21 = [v14 arrayWithObjects:&v25 count:1];

  id v22 = objc_msgSend(a1, "featureVectorByGeoHashForAssetUUIDs:geoHashSize:geoHashKeySize:sceneLabelMapping:dryRun:photoLibrary:", v21, v19, v18, v17, v16, v15, v25, v26);

  char v23 = [v22 firstObject];

  return v23;
}

+ (id)featureVectorByGeoHashForAssetUUID:(id)a3 geoHashSize:(id)a4 geoHashKeySize:(id)a5 sceneLabelMapping:(id)a6 dryRun:(id)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v12 = (void *)MEMORY[0x1E4F1C978];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [v12 arrayWithObjects:&v22 count:1];

  id v19 = objc_msgSend(a1, "featureVectorByGeoHashForAssetUUIDs:geoHashSize:geoHashKeySize:sceneLabelMapping:dryRun:", v18, v16, v15, v14, v13, v22, v23);

  id v20 = [v19 firstObject];

  return v20;
}

+ (id)assetUUIDsFromBiomeStreamWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F8A778];
  id v6 = [v4 photoLibraryBundle];
  id v7 = [v6 pathManager];
  id v8 = [v5 publishedUUIDsInStream:0 pathManager:v7];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    uint64_t v10 = (void *)MEMORY[0x1E4F8A778];
    uint64_t v11 = [v4 photoLibraryBundle];
    id v12 = [v11 pathManager];
    id v13 = [v10 publishedUUIDsInStream:1 pathManager:v12];

    if (v13)
    {
      id v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
    }
    else
    {
      id v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "[PHAssetGeoHashUtilities] Failed to retrieve sent UUIDs from Biome", v19, 2u);
      }

      id v14 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    id v17 = v14;
    id v15 = [a1 _randomPublishedUUIDsFromPublishedUUIDs:v9 sentUUIDs:v14];
  }
  else
  {
    uint64_t v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "[PHAssetGeoHashUtilities] Failed to retrieve published UUIDs from Biome", buf, 2u);
    }
    id v15 = 0;
  }

  return v15;
}

+ (id)assetUUIDsFromBiomeStream
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[a1 _newSystemPhotoLibrary];
  id v9 = 0;
  char v4 = [v3 openAndWaitWithUpgrade:0 error:&v9];
  id v5 = v9;
  if (v4)
  {
    id v6 = [a1 assetUUIDsFromBiomeStreamWithPhotoLibrary:v3];
    [v3 close];
  }
  else
  {
    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "[PHAssetGeoHashUtilities] Error opening system photo library: %@", buf, 0xCu);
    }

    id v6 = 0;
  }

  return v6;
}

@end