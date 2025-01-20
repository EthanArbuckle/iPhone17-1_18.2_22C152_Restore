@interface PHUserFeedbackDataCache
+ (BOOL)_isUserFeedbackFeatureFlagEnabled;
+ (id)_emptyUserFeedbackDataCache;
- (NSArray)importantPersons;
- (NSDictionary)userFeedbackTypeByPersonUUID;
- (NSSet)areaNamesWithNegativeFeedback;
- (NSSet)dateIntervalsWithNegativeFeedback;
- (NSSet)datesWithNegativeFeedback;
- (NSSet)deniedFeaturedPhotoUUIDs;
- (NSSet)holidayNamesWithNegativeFeedback;
- (NSSet)locationsWithNegativeFeedback;
- (PHPhotoLibrary)photoLibrary;
- (PHUserFeedbackDataCache)initWithPhotoLibrary:(id)a3;
- (PHUserFeedbackDataCache)initWithPhotoLibrary:(id)a3 importantPersons:(id)a4;
- (id)_confidentMergeCandidateUUIDsForPerson:(id)a3;
- (void)_loadDeniedFeaturedPhotoUUIDsWithPhotoLibrary:(id)a3;
- (void)_loadMemoryFeedbackDataWithPhotoLibrary:(id)a3;
- (void)_loadPersonFeedbackDataWithPhotoLibrary:(id)a3;
- (void)loadDataWithPhotoLibrary:(id)a3;
- (void)setAreaNamesWithNegativeFeedback:(id)a3;
- (void)setDateIntervalsWithNegativeFeedback:(id)a3;
- (void)setDatesWithNegativeFeedback:(id)a3;
- (void)setDeniedFeaturedPhotoUUIDs:(id)a3;
- (void)setHolidayNamesWithNegativeFeedback:(id)a3;
- (void)setImportantPersons:(id)a3;
- (void)setLocationsWithNegativeFeedback:(id)a3;
- (void)setUserFeedbackTypeByPersonUUID:(id)a3;
@end

@implementation PHUserFeedbackDataCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deniedFeaturedPhotoUUIDs, 0);
  objc_storeStrong((id *)&self->_locationsWithNegativeFeedback, 0);
  objc_storeStrong((id *)&self->_dateIntervalsWithNegativeFeedback, 0);
  objc_storeStrong((id *)&self->_datesWithNegativeFeedback, 0);
  objc_storeStrong((id *)&self->_areaNamesWithNegativeFeedback, 0);
  objc_storeStrong((id *)&self->_holidayNamesWithNegativeFeedback, 0);
  objc_storeStrong((id *)&self->_userFeedbackTypeByPersonUUID, 0);
  objc_storeStrong((id *)&self->_importantPersons, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);

  objc_storeStrong((id *)&self->_userFeedbackLogging, 0);
}

- (void)setDeniedFeaturedPhotoUUIDs:(id)a3
{
}

- (void)setLocationsWithNegativeFeedback:(id)a3
{
}

- (void)setDateIntervalsWithNegativeFeedback:(id)a3
{
}

- (void)setDatesWithNegativeFeedback:(id)a3
{
}

- (void)setAreaNamesWithNegativeFeedback:(id)a3
{
}

- (void)setHolidayNamesWithNegativeFeedback:(id)a3
{
}

- (void)setUserFeedbackTypeByPersonUUID:(id)a3
{
}

- (void)setImportantPersons:(id)a3
{
}

- (NSArray)importantPersons
{
  return self->_importantPersons;
}

- (void)_loadDeniedFeaturedPhotoUUIDsWithPhotoLibrary:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  if ([(id)objc_opt_class() _isUserFeedbackFeatureFlagEnabled])
  {
    v39 = self;
    v4 = self->_userFeedbackLogging;
    os_signpost_id_t v5 = os_signpost_id_generate((os_log_t)v4);
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    v6 = v4;
    v7 = v6;
    unint64_t v38 = v5 - 1;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "LoadDeniedFeaturedPhotoUUIDs", (const char *)&unk_19B30018E, buf, 2u);
    }
    os_signpost_id_t spid = v5;
    v37 = v7;

    uint64_t v36 = mach_absolute_time();
    v8 = [v42 librarySpecificFetchOptions];
    v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"state == %d", 4);
    [v8 setPredicate:v9];

    v40 = v8;
    v10 = +[PHSuggestion fetchAllFeaturedStateEnabledSuggestionsWithOptions:v8];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obuint64_t j = v10;
    uint64_t v12 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x19F389B10]();
          v18 = [v42 librarySpecificFetchOptions];
          v19 = +[PHAsset fetchKeyAssetsInAssetCollection:v16 options:v18];

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v20 = v19;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v56 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v44;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v44 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = [*(id *)(*((void *)&v43 + 1) + 8 * j) uuid];
                [v11 addObject:v25];
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v56 count:16];
            }
            while (v22);
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
      }
      while (v13);
    }

    [(PHUserFeedbackDataCache *)v39 setDeniedFeaturedPhotoUUIDs:v11];
    v26 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(PHUserFeedbackDataCache *)v39 deniedFeaturedPhotoUUIDs];
      uint64_t v28 = [v27 count];
      *(_DWORD *)buf = 134217984;
      v53 = (const char *)v28;
      _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading denied featured photos, negative feedback added for %lu assets.", buf, 0xCu);
    }
    uint64_t v29 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v32 = v37;
    v33 = v32;
    if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v33, OS_SIGNPOST_INTERVAL_END, spid, "LoadDeniedFeaturedPhotoUUIDs", (const char *)&unk_19B30018E, buf, 2u);
    }

    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "LoadDeniedFeaturedPhotoUUIDs";
      __int16 v54 = 2048;
      double v55 = (float)((float)((float)((float)(v29 - v36) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_19B043000, v33, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    id v34 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    [(PHUserFeedbackDataCache *)self setDeniedFeaturedPhotoUUIDs:v34];
  }
}

- (NSSet)deniedFeaturedPhotoUUIDs
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_deniedFeaturedPhotoUUIDs) {
    [(PHUserFeedbackDataCache *)v2 _loadDeniedFeaturedPhotoUUIDsWithPhotoLibrary:v2->_photoLibrary];
  }
  objc_sync_exit(v2);

  deniedFeaturedPhotoUUIDs = v2->_deniedFeaturedPhotoUUIDs;

  return deniedFeaturedPhotoUUIDs;
}

- (id)_confidentMergeCandidateUUIDsForPerson:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_signpost_id_t v5 = self->_userFeedbackLogging;
  os_signpost_id_t v6 = os_signpost_id_generate((os_log_t)v5);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v7 = v5;
  v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MergeCandidateUUIDsForPerson", (const char *)&unk_19B30018E, buf, 2u);
  }

  uint64_t v29 = mach_absolute_time();
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = [v4 photoLibrary];
  uint64_t v12 = [v11 librarySpecificFetchOptions];

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "detectionType"));
  v40[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  [v12 setIncludedDetectionTypes:v14];

  [v12 setIncludeOnlyPersonsWithVisibleKeyFaces:1];
  os_signpost_id_t spid = v6;
  if ([v4 detectionType] == 1)
  {
    v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %f", @"mergeCandidateConfidence", 0x3FEA8F5C28F5C28FLL, v6);
    [v12 setPredicate:v15];

    +[PHPerson fetchMergeCandidateWithConfidencePersonsForPerson:v4 options:v12];
  }
  else
  {
    +[PHPerson fetchMergeCandidatePersonsForPerson:v4 options:v12];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [*(id *)(*((void *)&v30 + 1) + 8 * i) uuid];
        [v10 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v18);
  }

  uint64_t v22 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v25 = v8;
  v26 = v25;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v26, OS_SIGNPOST_INTERVAL_END, spid, "MergeCandidateUUIDsForPerson", (const char *)&unk_19B30018E, buf, 2u);
  }

  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v36 = "MergeCandidateUUIDsForPerson";
    __int16 v37 = 2048;
    double v38 = (float)((float)((float)((float)(v22 - v29) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v10;
}

- (void)_loadMemoryFeedbackDataWithPhotoLibrary:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v50 = self;
  os_signpost_id_t v5 = self->_userFeedbackLogging;
  os_signpost_id_t v6 = os_signpost_id_generate((os_log_t)v5);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v7 = v5;
  v8 = v7;
  unint64_t v48 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadMemoryFeedbackData", (const char *)&unk_19B30018E, buf, 2u);
  }
  os_signpost_id_t spid = v6;
  long long v47 = v8;

  uint64_t v46 = mach_absolute_time();
  id v53 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v49 = [v4 librarySpecificFetchOptions];
  id v11 = +[PHMemory fetchBlockedMemoriesWithOptions:](PHMemory, "fetchBlockedMemoriesWithOptions:");
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v63 objects:v74 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v64 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v63 + 1) + 8 * i) blacklistedFeature];
        if ([v16 type] == 16)
        {
          uint64_t v17 = [v16 date];
          uint64_t v18 = v9;
        }
        else if ([v16 type] == 512)
        {
          uint64_t v17 = [v16 dateInterval];
          uint64_t v18 = v10;
        }
        else if ([v16 type] == 32)
        {
          uint64_t v17 = [v16 holidayName];
          uint64_t v18 = v53;
        }
        else if ([v16 type] == 4096)
        {
          uint64_t v17 = [v16 location];
          uint64_t v18 = v52;
        }
        else
        {
          if ([v16 type] != 0x20000) {
            goto LABEL_20;
          }
          uint64_t v17 = [v16 areaName];
          uint64_t v18 = v51;
        }
        [v18 addObject:v17];

LABEL_20:
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v63 objects:v74 count:16];
    }
    while (v13);
  }
  uint64_t v19 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [v11 count];
    *(_DWORD *)buf = 134217984;
    v69 = (const char *)v20;
    _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading memory user feedback data from legacy storage, %tu found.", buf, 0xCu);
  }

  if ([(id)objc_opt_class() _isUserFeedbackFeatureFlagEnabled])
  {
    id v44 = v4;
    uint64_t v21 = [v4 librarySpecificFetchOptions];
    v73 = @"PHMemoryPropertySetUserFeedback";
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
    [v21 setFetchPropertySets:v22];

    long long v43 = v21;
    uint64_t v23 = +[PHMemory fetchMemoriesWithUserFeedbackWithOptions:v21];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v60;
LABEL_27:
      uint64_t v27 = 0;
      while (2)
      {
        if (*(void *)v60 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = [*(id *)(*((void *)&v59 + 1) + 8 * v27) userFeedbackProperties];
        uint64_t v29 = [v28 userFeedback];

        switch([v29 feature])
        {
          case 1:
            id v58 = 0;
            long long v30 = [v29 contextAsDateWithError:&v58];
            long long v31 = (char *)v58;
            if (v30)
            {
              long long v32 = v9;
              goto LABEL_41;
            }
            long long v33 = PLPhotoKitGetLog();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              goto LABEL_53;
            }
            *(_DWORD *)buf = 138412290;
            v69 = v31;
            id v34 = v33;
            v35 = "PHUserFeedbackDataCache: Error parsing user feedback context as date: %@";
            goto LABEL_52;
          case 2:
            id v56 = 0;
            long long v30 = [v29 contextAsStringWithError:&v56];
            long long v31 = (char *)v56;
            if (v30)
            {
              long long v32 = v53;
              goto LABEL_41;
            }
            long long v33 = PLPhotoKitGetLog();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              goto LABEL_53;
            }
            *(_DWORD *)buf = 138412290;
            v69 = v31;
            id v34 = v33;
            v35 = "PHUserFeedbackDataCache: Error parsing user feedback context as holiday name: %@";
            goto LABEL_52;
          case 3:
            id v55 = 0;
            long long v30 = [v29 contextAsLocationWithError:&v55];
            long long v31 = (char *)v55;
            if (v30)
            {
              long long v32 = v52;
              goto LABEL_41;
            }
            long long v33 = PLPhotoKitGetLog();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              goto LABEL_53;
            }
            *(_DWORD *)buf = 138412290;
            v69 = v31;
            id v34 = v33;
            v35 = "PHUserFeedbackDataCache: Error parsing user feedback context as location: %@";
            goto LABEL_52;
          case 4:
            id v54 = 0;
            long long v30 = [v29 contextAsStringWithError:&v54];
            long long v31 = (char *)v54;
            if (v30)
            {
              long long v32 = v51;
              goto LABEL_41;
            }
            long long v33 = PLPhotoKitGetLog();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              goto LABEL_53;
            }
            *(_DWORD *)buf = 138412290;
            v69 = v31;
            id v34 = v33;
            v35 = "PHUserFeedbackDataCache: Error parsing user feedback context as area name: %@";
            goto LABEL_52;
          case 5:
            id v57 = 0;
            long long v30 = [v29 contextAsDateIntervalWithError:&v57];
            long long v31 = (char *)v57;
            if (v30)
            {
              long long v32 = v10;
LABEL_41:
              [v32 addObject:v30];
            }
            else
            {
              long long v33 = PLPhotoKitGetLog();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v69 = v31;
                id v34 = v33;
                v35 = "PHUserFeedbackDataCache: Error parsing user feedback context as date interval: %@";
LABEL_52:
                _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_ERROR, v35, buf, 0xCu);
              }
LABEL_53:

              long long v30 = 0;
            }

LABEL_55:
            if (v25 != ++v27) {
              continue;
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v59 objects:v72 count:16];
            if (!v25) {
              goto LABEL_57;
            }
            goto LABEL_27;
          default:
            goto LABEL_55;
        }
      }
    }
LABEL_57:
    uint64_t v36 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [v23 count];
      *(_DWORD *)buf = 134217984;
      v69 = (const char *)v37;
      _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading memory user feedback data from PHMemory storage, %tu found.", buf, 0xCu);
    }

    id v4 = v44;
  }
  [(PHUserFeedbackDataCache *)v50 setHolidayNamesWithNegativeFeedback:v53];
  [(PHUserFeedbackDataCache *)v50 setAreaNamesWithNegativeFeedback:v51];
  [(PHUserFeedbackDataCache *)v50 setDatesWithNegativeFeedback:v9];
  [(PHUserFeedbackDataCache *)v50 setDateIntervalsWithNegativeFeedback:v10];
  [(PHUserFeedbackDataCache *)v50 setLocationsWithNegativeFeedback:v52];
  uint64_t v38 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v41 = v47;
  id v42 = v41;
  if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v42, OS_SIGNPOST_INTERVAL_END, spid, "LoadMemoryFeedbackData", (const char *)&unk_19B30018E, buf, 2u);
  }

  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v69 = "LoadMemoryFeedbackData";
    __int16 v70 = 2048;
    double v71 = (float)((float)((float)((float)(v38 - v46) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B043000, v42, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (NSSet)locationsWithNegativeFeedback
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_locationsWithNegativeFeedback) {
    [(PHUserFeedbackDataCache *)v2 _loadMemoryFeedbackDataWithPhotoLibrary:v2->_photoLibrary];
  }
  objc_sync_exit(v2);

  locationsWithNegativeFeedback = v2->_locationsWithNegativeFeedback;

  return locationsWithNegativeFeedback;
}

- (NSSet)dateIntervalsWithNegativeFeedback
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_dateIntervalsWithNegativeFeedback) {
    [(PHUserFeedbackDataCache *)v2 _loadMemoryFeedbackDataWithPhotoLibrary:v2->_photoLibrary];
  }
  objc_sync_exit(v2);

  dateIntervalsWithNegativeFeedback = v2->_dateIntervalsWithNegativeFeedback;

  return dateIntervalsWithNegativeFeedback;
}

- (NSSet)datesWithNegativeFeedback
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_datesWithNegativeFeedback) {
    [(PHUserFeedbackDataCache *)v2 _loadMemoryFeedbackDataWithPhotoLibrary:v2->_photoLibrary];
  }
  objc_sync_exit(v2);

  datesWithNegativeFeedback = v2->_datesWithNegativeFeedback;

  return datesWithNegativeFeedback;
}

- (NSSet)areaNamesWithNegativeFeedback
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_areaNamesWithNegativeFeedback) {
    [(PHUserFeedbackDataCache *)v2 _loadMemoryFeedbackDataWithPhotoLibrary:v2->_photoLibrary];
  }
  objc_sync_exit(v2);

  areaNamesWithNegativeFeedback = v2->_areaNamesWithNegativeFeedback;

  return areaNamesWithNegativeFeedback;
}

- (NSSet)holidayNamesWithNegativeFeedback
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_holidayNamesWithNegativeFeedback) {
    [(PHUserFeedbackDataCache *)v2 _loadMemoryFeedbackDataWithPhotoLibrary:v2->_photoLibrary];
  }
  objc_sync_exit(v2);

  holidayNamesWithNegativeFeedback = v2->_holidayNamesWithNegativeFeedback;

  return holidayNamesWithNegativeFeedback;
}

- (void)_loadPersonFeedbackDataWithPhotoLibrary:(id)a3
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v93 = self;
  os_signpost_id_t v5 = self->_userFeedbackLogging;
  os_signpost_id_t v6 = os_signpost_id_generate((os_log_t)v5);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v7 = v5;
  v8 = v7;
  unint64_t v87 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadPersonFeedbackData", (const char *)&unk_19B30018E, buf, 2u);
  }
  os_signpost_id_t spid = v6;
  v86 = v8;

  uint64_t v85 = mach_absolute_time();
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v88 = v4;
  +[PHMemory blockedPersonLocalIdentifiersInPhotoLibrary:v4];
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v122 objects:v137 count:16];
  obuint64_t j = v10;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v123;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v123 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(const char **)(*((void *)&v122 + 1) + 8 * i);
        id v16 = +[PHObject uuidFromLocalIdentifier:v15];
        if (v16)
        {
          [v9 setObject:&unk_1EEB24C78 forKeyedSubscript:v16];
        }
        else
        {
          uint64_t v17 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v128 = v15;
            _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_FAULT, "PHUserFeedbackDataCache: person UUID is nil for local identifier %{public}@. Will not add this person on the list of people with negative feedback.", buf, 0xCu);
          }
        }
      }
      id v10 = obj;
      uint64_t v12 = [obj countByEnumeratingWithState:&v122 objects:v137 count:16];
    }
    while (v12);
  }

  uint64_t v18 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v10 count];
    *(_DWORD *)buf = 134217984;
    v128 = (const char *)v19;
    _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading person user feedback data from legacy storage, %tu people found.", buf, 0xCu);
  }

  uint64_t v20 = v88;
  uint64_t v21 = [v88 librarySpecificFetchOptions];
  [v21 setIncludedDetectionTypes:&unk_1EEB267C0];
  uint64_t v22 = [v10 allObjects];
  uint64_t v23 = +[PHPerson fetchPersonsWithLocalIdentifiers:v22 options:v21];

  id v24 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v25 = [v23 fetchedObjects];
  v101 = (void *)[v24 initWithArray:v25];

  uint64_t v26 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = [v101 count];
    *(_DWORD *)buf = 134217984;
    v128 = (const char *)v27;
    _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading persons for checking merge candidates, %tu people found.", buf, 0xCu);
  }

  if ([(id)objc_opt_class() _isUserFeedbackFeatureFlagEnabled])
  {
    v82 = v23;
    v83 = v21;
    uint64_t v28 = [v88 librarySpecificFetchOptions];
    v136 = @"PHPersonPropertySetUserFeedback";
    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v136 count:1];
    [v28 setFetchPropertySets:v29];

    [v28 setIncludedDetectionTypes:&unk_1EEB267D8];
    v99 = v28;
    +[PHPerson fetchPersonsWithUserFeedbackWithOptions:v28];
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id v91 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = [v91 countByEnumeratingWithState:&v118 objects:v135 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v119;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v119 != v32) {
            objc_enumerationMutation(v91);
          }
          id v34 = *(void **)(*((void *)&v118 + 1) + 8 * j);
          v35 = [v34 userFeedbackProperties];
          uint64_t v36 = [v35 userFeedback];
          uint64_t v37 = [v36 type];

          uint64_t v38 = [v34 uuid];
          v39 = [v9 objectForKeyedSubscript:v38];
          uint64_t v40 = [v39 unsignedIntegerValue];

          unint64_t v41 = +[PHUserFeedback sumFeedbackType:v40 withOtherFeedbackType:v37];
          id v42 = [NSNumber numberWithUnsignedInteger:v41];
          long long v43 = [v34 uuid];
          [v9 setObject:v42 forKeyedSubscript:v43];

          [v101 addObject:v34];
        }
        uint64_t v31 = [v91 countByEnumeratingWithState:&v118 objects:v135 count:16];
      }
      while (v31);
    }

    id v44 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = [v91 count];
      *(_DWORD *)buf = 134217984;
      v128 = (const char *)v45;
      _os_log_impl(&dword_19B043000, v44, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading person user feedback data from PHPerson storage, %tu people found.", buf, 0xCu);
    }

    uint64_t v46 = [v88 librarySpecificFetchOptions];

    [v46 setIncludedDetectionTypes:&unk_1EEB267F0];
    v81 = v46;
    +[PHPerson fetchPersonsWithType:-1 options:v46];
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v90 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v47 = [v90 countByEnumeratingWithState:&v114 objects:v134 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v115;
      do
      {
        for (uint64_t k = 0; k != v48; ++k)
        {
          if (*(void *)v115 != v49) {
            objc_enumerationMutation(v90);
          }
          id v51 = *(void **)(*((void *)&v114 + 1) + 8 * k);
          id v52 = [v51 uuid];
          [v9 setObject:&unk_1EEB24CC0 forKeyedSubscript:v52];

          [v101 addObject:v51];
        }
        uint64_t v48 = [v90 countByEnumeratingWithState:&v114 objects:v134 count:16];
      }
      while (v48);
    }

    id v53 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v54 = [v90 count];
      *(_DWORD *)buf = 134217984;
      v128 = (const char *)v54;
      _os_log_impl(&dword_19B043000, v53, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading person user feedback data from hidden people. %tu persons found.", buf, 0xCu);
    }

    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v89 = v101;
    uint64_t v94 = [v89 countByEnumeratingWithState:&v110 objects:v133 count:16];
    id v55 = 0;
    if (v94)
    {
      uint64_t v92 = *(void *)v111;
      do
      {
        uint64_t v56 = 0;
        do
        {
          if (*(void *)v111 != v92) {
            objc_enumerationMutation(v89);
          }
          id v57 = *(void **)(*((void *)&v110 + 1) + 8 * v56);
          context = (void *)MEMORY[0x19F389B10]();
          id v58 = [v57 uuid];
          long long v59 = [v9 objectForKeyedSubscript:v58];
          uint64_t v60 = [v59 unsignedIntegerValue];

          v96 = [(PHUserFeedbackDataCache *)v93 _confidentMergeCandidateUUIDsForPerson:v57];
          long long v61 = objc_msgSend(v9, "objectsForKeys:notFoundMarker:");
          long long v106 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          uint64_t v62 = [v61 countByEnumeratingWithState:&v106 objects:v132 count:16];
          uint64_t v98 = v56;
          v100 = v55;
          if (v62)
          {
            uint64_t v63 = v62;
            uint64_t v64 = *(void *)v107;
            do
            {
              for (uint64_t m = 0; m != v63; ++m)
              {
                if (*(void *)v107 != v64) {
                  objc_enumerationMutation(v61);
                }
                uint64_t v60 = +[PHUserFeedback mergeFeedbackType:withOtherFeedbackType:](PHUserFeedback, "mergeFeedbackType:withOtherFeedbackType:", v60, [*(id *)(*((void *)&v106 + 1) + 8 * m) unsignedIntegerValue]);
              }
              uint64_t v63 = [v61 countByEnumeratingWithState:&v106 objects:v132 count:16];
            }
            while (v63);
          }
          long long v66 = [NSNumber numberWithUnsignedInteger:v60];
          v67 = [v57 uuid];
          [v9 setObject:v66 forKeyedSubscript:v67];

          long long v104 = 0u;
          long long v105 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          id v68 = v96;
          uint64_t v69 = [v68 countByEnumeratingWithState:&v102 objects:v131 count:16];
          if (v69)
          {
            uint64_t v70 = v69;
            uint64_t v71 = *(void *)v103;
            do
            {
              for (uint64_t n = 0; n != v70; ++n)
              {
                if (*(void *)v103 != v71) {
                  objc_enumerationMutation(v68);
                }
                uint64_t v73 = *(void *)(*((void *)&v102 + 1) + 8 * n);
                v74 = [NSNumber numberWithUnsignedInteger:v60];
                [v9 setObject:v74 forKeyedSubscript:v73];
              }
              uint64_t v70 = [v68 countByEnumeratingWithState:&v102 objects:v131 count:16];
            }
            while (v70);
          }

          id v55 = &v100[[v68 count]];
          uint64_t v56 = v98 + 1;
        }
        while (v98 + 1 != v94);
        uint64_t v94 = [v89 countByEnumeratingWithState:&v110 objects:v133 count:16];
      }
      while (v94);
    }

    uint64_t v75 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v128 = v55;
      _os_log_impl(&dword_19B043000, v75, OS_LOG_TYPE_DEFAULT, "PHUserFeedbackDataCache: Finished loading merge candidates, %tu found.", buf, 0xCu);
    }

    uint64_t v20 = v88;
    uint64_t v23 = v82;
    uint64_t v21 = v83;
  }
  uint64_t v76 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v79 = v86;
  v80 = v79;
  if (v87 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v80, OS_SIGNPOST_INTERVAL_END, spid, "LoadPersonFeedbackData", (const char *)&unk_19B30018E, buf, 2u);
  }

  if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v128 = "LoadPersonFeedbackData";
    __int16 v129 = 2048;
    double v130 = (float)((float)((float)((float)(v76 - v85) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B043000, v80, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  [(PHUserFeedbackDataCache *)v93 setUserFeedbackTypeByPersonUUID:v9];
}

- (NSDictionary)userFeedbackTypeByPersonUUID
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_userFeedbackTypeByPersonUUID) {
    [(PHUserFeedbackDataCache *)v2 _loadPersonFeedbackDataWithPhotoLibrary:v2->_photoLibrary];
  }
  objc_sync_exit(v2);

  userFeedbackTypeByPersonUUID = v2->_userFeedbackTypeByPersonUUID;

  return userFeedbackTypeByPersonUUID;
}

- (void)loadDataWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  [(PHUserFeedbackDataCache *)self _loadPersonFeedbackDataWithPhotoLibrary:v4];
  [(PHUserFeedbackDataCache *)self _loadMemoryFeedbackDataWithPhotoLibrary:v4];
  [(PHUserFeedbackDataCache *)self _loadDeniedFeaturedPhotoUUIDsWithPhotoLibrary:v4];
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHUserFeedbackDataCache)initWithPhotoLibrary:(id)a3 importantPersons:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHUserFeedbackDataCache;
  id v9 = [(PHUserFeedbackDataCache *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_importantPersons, a4);
    uint64_t v11 = PLUserFeedbackGetLog();
    userFeedbackLogging = v10->_userFeedbackLogging;
    v10->_userFeedbackLogging = (OS_os_log *)v11;
  }
  return v10;
}

- (PHUserFeedbackDataCache)initWithPhotoLibrary:(id)a3
{
  return [(PHUserFeedbackDataCache *)self initWithPhotoLibrary:a3 importantPersons:MEMORY[0x1E4F1CBF0]];
}

+ (id)_emptyUserFeedbackDataCache
{
  v2 = objc_alloc_init(PHUserFeedbackDataCache);

  return v2;
}

+ (BOOL)_isUserFeedbackFeatureFlagEnabled
{
  return 1;
}

@end