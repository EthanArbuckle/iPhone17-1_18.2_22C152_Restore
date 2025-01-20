@interface PHMemoryUpNextHelper
+ (BOOL)_hasInvalidMemoryTriggerForMemory:(id)a3;
+ (BOOL)_isAcceptableUserFeedbackForMemory:(id)a3 keyAsset:(id)a4 userFeedbackCalculator:(id)a5;
+ (BOOL)_isMomentFetchResult:(id)a3 overlappingWithFetchResults:(id)a4;
+ (BOOL)isMomentFetchResult:(id)a3 overlappingWithFetchResult:(id)a4;
+ (id)_memoryTriggerTypesToAvoid;
+ (id)fetchFallbackMemoriesForMemory:(id)a3 targetCount:(unint64_t)a4 memoryLocalIdentifiersToAvoid:(id)a5 error:(id *)a6;
+ (id)fetchFallbackMemoriesForMemory:(id)a3 targetCount:(unint64_t)a4 memoryLocalIdentifiersToAvoid:(id)a5 sharingFilter:(unsigned __int16)a6 error:(id *)a7;
+ (id)fetchFallbackMemoryCandidatesInPhotoLibrary:(id)a3 memoryLocalIdentifiersToAvoid:(id)a4 sharingFilter:(unsigned __int16)a5;
@end

@implementation PHMemoryUpNextHelper

+ (BOOL)_isAcceptableUserFeedbackForMemory:(id)a3 keyAsset:(id)a4 userFeedbackCalculator:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v24 = a5;
  v9 = [v7 photoLibrary];
  v10 = [v9 librarySpecificFetchOptions];
  [v10 setIncludedDetectionTypes:&unk_1EEB268B0];
  v11 = +[PHPerson fetchPersonsInAsset:v8 options:v10];
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v25 + 1) + 8 * v17) uuid];
        [v12 addObject:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }

  v19 = [v8 uuid];
  v20 = [v7 blockableFeatures];
  [v24 scoreForKeyAssetUUID:v19 personsUUIDsInKeyAsset:v12 memoryFeatures:v20];
  double v22 = v21;

  LOBYTE(v19) = +[PHUserFeedbackCalculator score:v22 meetsScoreThreshold:-0.1];
  return (char)v19;
}

+ (id)fetchFallbackMemoryCandidatesInPhotoLibrary:(id)a3 memoryLocalIdentifiersToAvoid:(id)a4 sharingFilter:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  v25[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [a3 librarySpecificFetchOptions];
  [v8 setWantsIncrementalChangeDetails:0];
  [v8 setIncludePendingMemories:1];
  v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v25[0] = v9;
  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:0];
  v25[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  [v8 setSortDescriptors:v11];

  [v8 setSharingFilter:v5];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (localIdentifier IN %@)", v7];

  [v12 addObject:v13];
  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"rejected == NO"];
  [v12 addObject:v14];

  uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v16 = [v15 dateByAddingTimeInterval:-31536000.0];

  uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate > %@", v16];
  [v12 addObject:v17];

  v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (category IN %@)", &unk_1EEB26898];
  [v12 addObject:v18];

  v19 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v12];
  [v8 setPredicate:v19];

  v20 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v8];
  double v21 = PLMemoriesGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = [v20 count];
    _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_DEFAULT, "[PHMemoryUpNextHelper] Found %lu fallback memory candidates", buf, 0xCu);
  }

  return v20;
}

+ (id)_memoryTriggerTypesToAvoid
{
  if (_memoryTriggerTypesToAvoid_onceToken != -1) {
    dispatch_once(&_memoryTriggerTypesToAvoid_onceToken, &__block_literal_global_8899);
  }
  v2 = (void *)_memoryTriggerTypesToAvoid_triggerTypesToAvoid;

  return v2;
}

void __50__PHMemoryUpNextHelper__memoryTriggerTypesToAvoid__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EEB25110, &unk_1EEB25128, &unk_1EEB25140, 0);
  v1 = (void *)_memoryTriggerTypesToAvoid_triggerTypesToAvoid;
  _memoryTriggerTypesToAvoid_triggerTypesToAvoid = v0;
}

+ (BOOL)_hasInvalidMemoryTriggerForMemory:(id)a3
{
  id v4 = a3;
  [v4 photosGraphVersion];
  if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() >= 0x301)
  {
    v6 = [v4 photosGraphProperties];
    id v7 = [v6 objectForKeyedSubscript:@"triggerTypes"];

    if ([v7 count])
    {
      id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
      v9 = [a1 _memoryTriggerTypesToAvoid];
      char v5 = [v8 intersectsSet:v9];
    }
    else
    {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)_isMomentFetchResult:(id)a3 overlappingWithFetchResults:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend((id)objc_opt_class(), "isMomentFetchResult:overlappingWithFetchResult:", v5, *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

+ (BOOL)isMomentFetchResult:(id)a3 overlappingWithFetchResult:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 count];
  long long v18 = 0u;
  long long v19 = 0u;
  if ((v7 - 1) / 3uLL >= 2) {
    unint64_t v8 = 2;
  }
  else {
    unint64_t v8 = (v7 - 1) / 3uLL;
  }
  long long v20 = 0uLL;
  long long v21 = 0uLL;
  uint64_t v9 = objc_msgSend(v5, "fetchedObjectIDs", (void)v18);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = 0;
    unint64_t v12 = v8 + 1;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v16 = [v6 fetchedObjectIDs];
        LODWORD(v15) = [v16 containsObject:v15];

        v11 += v15;
        if (v11 == v12)
        {
          LOBYTE(v10) = 1;
          goto LABEL_14;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v10;
}

+ (id)fetchFallbackMemoriesForMemory:(id)a3 targetCount:(unint64_t)a4 memoryLocalIdentifiersToAvoid:(id)a5 sharingFilter:(unsigned __int16)a6 error:(id *)a7
{
  uint64_t v7 = a6;
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  unint64_t v12 = PLMemoriesGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEFAULT, "[PHMemoryUpNextHelper] Start fetching fallback memories", buf, 2u);
  }

  uint64_t v13 = PLUpNextGetLog();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v15 = v13;
  long long v16 = v15;
  unint64_t v94 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PHMemoryUpNextFallbackGenerate", (const char *)&unk_19B30018E, buf, 2u);
  }
  os_signpost_id_t spid = v14;
  v93 = v16;

  uint64_t v89 = mach_absolute_time();
  uint64_t v17 = [v10 photoLibrary];
  id v18 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v106 = a1;
  long long v19 = [a1 fetchFallbackMemoryCandidatesInPhotoLibrary:v17 memoryLocalIdentifiersToAvoid:v11 sharingFilter:v7];
  long long v20 = [v19 fetchedObjects];
  long long v21 = (void *)[v18 initWithArray:v20];

  id v22 = objc_alloc(MEMORY[0x1E4F8CD40]);
  uint64_t v23 = [v10 localIdentifier];
  uint64_t v24 = objc_msgSend(v22, "initWithSeed:", objc_msgSend(v23, "hash"));

  v97 = (void *)v24;
  PFMutableArrayShuffleWithRandomNumberGenerator();
  long long v25 = [v17 librarySpecificFetchOptions];
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v92 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"category", 23);
  objc_msgSend(v26, "addObject:");
  v91 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"category", 8);
  objc_msgSend(v26, "addObject:");
  v95 = v26;
  long long v27 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v26];
  [v25 setPredicate:v27];

  v98 = v11;
  v96 = v25;
  long long v28 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v11 options:v25];
  uint64_t v29 = [v28 count];
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v29];
  id v108 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v104 = v17;
  v112 = [v17 librarySpecificFetchOptions];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id obj = v28;
  uint64_t v31 = [obj countByEnumeratingWithState:&v117 objects:v131 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v118;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v118 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = *(void *)(*((void *)&v117 + 1) + 8 * i);
        v36 = (void *)MEMORY[0x19F389B10]();
        v37 = +[PHAsset fetchKeyCuratedAssetInAssetCollection:v35 referenceAsset:0 options:v112];
        v38 = [v37 firstObject];

        if (v38)
        {
          v39 = [v38 localIdentifier];
          [v30 addObject:v39];
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v117 objects:v131 count:16];
    }
    while (v32);
  }
  v107 = v30;

  v102 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
  v40 = [v104 librarySpecificFetchOptions];
  v99 = v10;
  uint64_t v41 = +[PHAssetCollection fetchMomentsBackingMemory:v10 options:v40];

  v42 = v104;
  v90 = (void *)v41;
  v101 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v41, 0);
  v105 = [[PHUserFeedbackCalculator alloc] initWithPhotoLibrary:v104];
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v109 = v21;
  uint64_t v43 = [v109 countByEnumeratingWithState:&v113 objects:v130 count:16];
  v44 = v106;
  v45 = v108;
  if (v43)
  {
    uint64_t v46 = v43;
    uint64_t v111 = *(void *)v114;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v114 != v111) {
          objc_enumerationMutation(v109);
        }
        v48 = *(void **)(*((void *)&v113 + 1) + 8 * v47);
        v49 = (void *)MEMORY[0x19F389B10]();
        v50 = [v48 title];
        v51 = [v50 lowercaseString];

        if ([v45 containsObject:v51])
        {
          v52 = PLMemoriesGetLog();
          if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_35;
          }
          v53 = [v48 localIdentifier];
          v54 = [v48 title];
          *(_DWORD *)buf = 138412546;
          v123 = v53;
          __int16 v124 = 2112;
          uint64_t v125 = (uint64_t)v54;
          v55 = v52;
          v56 = "[PHMemoryUpNextHelper] Same Title (ignoring case), skip memory:%@ - %@";
LABEL_26:
          _os_log_impl(&dword_19B043000, v55, OS_LOG_TYPE_DEFAULT, v56, buf, 0x16u);

          goto LABEL_35;
        }
        if ([v44 _hasInvalidMemoryTriggerForMemory:v48])
        {
          v52 = PLMemoriesGetLog();
          if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_35;
          }
          v53 = [v48 localIdentifier];
          v54 = [v48 title];
          *(_DWORD *)buf = 138412546;
          v123 = v53;
          __int16 v124 = 2112;
          uint64_t v125 = (uint64_t)v54;
          v55 = v52;
          v56 = "[PHMemoryUpNextHelper] invalid trigger type, skip memory:%@ - %@";
          goto LABEL_26;
        }
        v57 = [v42 librarySpecificFetchOptions];
        v58 = +[PHAsset fetchKeyCuratedAssetInAssetCollection:v48 referenceAsset:0 options:v57];
        v52 = [v58 firstObject];

        v59 = [v52 localIdentifier];
        if (v52 && ![v107 containsObject:v59])
        {
          if ([v44 _isAcceptableUserFeedbackForMemory:v48 keyAsset:v52 userFeedbackCalculator:v105])
          {
            v65 = [v42 librarySpecificFetchOptions];
            v66 = +[PHAsset fetchAssetsInAssetCollection:v48 options:v65];
            unint64_t v67 = [v66 count];

            if (v67 > 0xC)
            {
              v70 = [v104 librarySpecificFetchOptions];
              uint64_t v71 = +[PHAssetCollection fetchMomentsBackingMemory:v48 options:v70];

              v44 = v106;
              v103 = (void *)v71;
              if ([v106 _isMomentFetchResult:v71 overlappingWithFetchResults:v101])
              {
                v72 = PLMemoriesGetLog();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  v73 = [v48 localIdentifier];
                  v74 = [v48 title];
                  *(_DWORD *)buf = 138412546;
                  v123 = v73;
                  __int16 v124 = 2112;
                  uint64_t v125 = (uint64_t)v74;
                  _os_log_impl(&dword_19B043000, v72, OS_LOG_TYPE_DEFAULT, "[PHMemoryUpNextHelper] Overlapped moments, skip memory:%@ - %@", buf, 0x16u);
                }
                v42 = v104;
              }
              else
              {
                [v107 addObject:v59];
                [v108 addObject:v51];
                [v102 addObject:v48];
                [v101 addObject:v71];
                v75 = PLMemoriesGetLog();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                {
                  v76 = [v48 localIdentifier];
                  v77 = [v48 title];
                  *(_DWORD *)buf = 138412546;
                  v123 = v76;
                  __int16 v124 = 2112;
                  uint64_t v125 = (uint64_t)v77;
                  _os_log_impl(&dword_19B043000, v75, OS_LOG_TYPE_DEFAULT, "[PHMemoryUpNextHelper] Found 1 fallback memory:%@ - %@", buf, 0x16u);
                }
                v42 = v104;
                if ([v102 count] == a4)
                {

                  goto LABEL_55;
                }
              }

              goto LABEL_34;
            }
            v60 = PLMemoriesGetLog();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              v68 = [v48 localIdentifier];
              v69 = [v48 title];
              *(_DWORD *)buf = 134218754;
              v123 = (const char *)v67;
              __int16 v124 = 2048;
              uint64_t v125 = 13;
              __int16 v126 = 2112;
              v127 = v68;
              __int16 v128 = 2112;
              v129 = v69;
              _os_log_impl(&dword_19B043000, v60, OS_LOG_TYPE_DEFAULT, "[PHMemoryUpNextHelper] Number of assets (%lu) below threshold (%lu), skip memory:%@ - %@", buf, 0x2Au);
            }
            v42 = v104;
            goto LABEL_32;
          }
          v60 = PLMemoriesGetLog();
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_33;
          }
          v61 = [v48 localIdentifier];
          v62 = [v48 title];
          *(_DWORD *)buf = 138412546;
          v123 = v61;
          __int16 v124 = 2112;
          uint64_t v125 = (uint64_t)v62;
          v63 = v60;
          v64 = "[PHMemoryUpNextHelper] UserFeedbackScore below threshold, skip memory:%@ - %@";
LABEL_31:
          _os_log_impl(&dword_19B043000, v63, OS_LOG_TYPE_DEFAULT, v64, buf, 0x16u);

LABEL_32:
          v44 = v106;
          goto LABEL_33;
        }
        v60 = PLMemoriesGetLog();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          v61 = [v48 localIdentifier];
          v62 = [v48 title];
          *(_DWORD *)buf = 138412546;
          v123 = v61;
          __int16 v124 = 2112;
          uint64_t v125 = (uint64_t)v62;
          v63 = v60;
          v64 = "[PHMemoryUpNextHelper] nil or same keyAsset, skip memory:%@ - %@";
          goto LABEL_31;
        }
LABEL_33:

LABEL_34:
        v45 = v108;
LABEL_35:

        ++v47;
      }
      while (v46 != v47);
      uint64_t v78 = [v109 countByEnumeratingWithState:&v113 objects:v130 count:16];
      uint64_t v46 = v78;
    }
    while (v78);
  }
LABEL_55:

  v79 = PLMemoriesGetLog();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v80 = [v102 count];
    *(_DWORD *)buf = 134218242;
    v123 = (const char *)v80;
    __int16 v124 = 2112;
    uint64_t v125 = (uint64_t)v102;
    _os_log_impl(&dword_19B043000, v79, OS_LOG_TYPE_DEFAULT, "[PHMemoryUpNextHelper] Found %lu Fallback memories:%@", buf, 0x16u);
  }

  v81 = [[PHManualFetchResult alloc] initWithObjects:v102 photoLibrary:v42 fetchType:@"PHMemory" fetchPropertySets:0 identifier:0 registerIfNeeded:1];
  uint64_t v82 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v85 = v93;
  v86 = v85;
  if (v94 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v86, OS_SIGNPOST_INTERVAL_END, spid, "PHMemoryUpNextFallbackGenerate", (const char *)&unk_19B30018E, buf, 2u);
  }

  if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v123 = "PHMemoryUpNextFallbackGenerate";
    __int16 v124 = 2048;
    *(double *)&uint64_t v125 = (float)((float)((float)((float)(v82 - v89) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B043000, v86, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v81;
}

+ (id)fetchFallbackMemoriesForMemory:(id)a3 targetCount:(unint64_t)a4 memoryLocalIdentifiersToAvoid:(id)a5 error:(id *)a6
{
  return (id)[a1 fetchFallbackMemoriesForMemory:a3 targetCount:a4 memoryLocalIdentifiersToAvoid:a5 sharingFilter:2 error:a6];
}

@end