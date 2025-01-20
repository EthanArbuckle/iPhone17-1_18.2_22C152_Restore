@interface HDSleepDaySummaryEnumerator
+ (id)sleepAnalysisQueryDescriptorForDateInterval:(id)a3 options:(unint64_t)a4;
+ (id)sleepTypesQueryDescriptorsForDateInterval:(id)a3 options:(unint64_t)a4;
- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4;
- (HDSleepDaySummaryEnumerator)initWithProfile:(id)a3 cachingSession:(id)a4 gregorianCalendar:(id)a5 morningIndexRange:(id)a6 ascending:(BOOL)a7 options:(unint64_t)a8 debugIdentifier:(id)a9;
- (id)_updatedBuilderForMorningIndex:(void *)a3 fromBuilders:(int)a4 createIfNeeded:;
- (uint64_t)_aggregationIntervalAdjustedMorningIndexFromMorningIndex:(void *)a1;
- (uint64_t)_enumerateSleepDaySummariesForMorningIndexRanges:(uint64_t)a3 summariesToCache:(void *)a4 error:(void *)a5 handler:(void *)a6;
- (void)_closeBuilders:(uint64_t)a3 fromIndex:(uint64_t)a4 toIndex:(void *)a5 summariesToCache:(void *)a6 handler:(unsigned char *)a7 stop:;
@end

@implementation HDSleepDaySummaryEnumerator

- (HDSleepDaySummaryEnumerator)initWithProfile:(id)a3 cachingSession:(id)a4 gregorianCalendar:(id)a5 morningIndexRange:(id)a6 ascending:(BOOL)a7 options:(unint64_t)a8 debugIdentifier:(id)a9
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v30 = a9;
  v31.receiver = self;
  v31.super_class = (Class)HDSleepDaySummaryEnumerator;
  v18 = [(HDSleepDaySummaryEnumerator *)&v31 init];
  v19 = v18;
  if (v18)
  {
    id v29 = v16;
    objc_storeWeak((id *)&v18->_profile, v15);
    objc_storeStrong((id *)&v19->_cachingSession, a4);
    objc_storeStrong((id *)&v19->_gregorianCalendar, a5);
    v19->_morningIndexRange.start = var0;
    v19->_morningIndexRange.duration = var1;
    v19->_ascending = a7;
    v19->_unint64_t options = a8;
    objc_storeStrong((id *)&v19->_debugIdentifier, a9);
    v20 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_componentsWithDayIndex:calendar:", var0, v17);
    v21 = [v20 date];
    uint64_t v22 = [v17 component:512 fromDate:v21];

    v19->_cachedFirstDayOfWeek = var0 - v22 + 1;
    unint64_t options = v19->_options;
    if ((options & 4) != 0 || (options & 0x18) == 0)
    {
      uint64_t v25 = +[HDStatisticsCollectionCalculatorCachingSourceOrderProvider sleepSourceOrderProviderForProfile:](HDStatisticsCollectionCalculatorCachingSourceOrderProvider, "sleepSourceOrderProviderForProfile:", v15, v16);
      sourceOrderProvider = v19->_sourceOrderProvider;
      v19->_sourceOrderProvider = (HDStatisticsCollectionCalculatorSourceOrderProvider *)v25;
    }
    else
    {
      sourceOrderProvider = v19->_sourceOrderProvider;
      v19->_sourceOrderProvider = 0;
    }
    id v16 = v29;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    adjustedMorningIndexCache = v19->_adjustedMorningIndexCache;
    v19->_adjustedMorningIndexCache = v26;
  }
  return v19;
}

- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x1E4F29FA0];
  v7 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = objc_opt_class();
    debugIdentifier = self->_debugIdentifier;
    id v11 = v9;
    v12 = NSStringFromHKDayIndexRange();
    v13 = HKStringFromBool();
    v14 = HKSleepDaySummaryQueryOptionsStringRepresentation();
    *(_DWORD *)buf = 138544386;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = debugIdentifier;
    *(_WORD *)&buf[22] = 2114;
    v91 = v12;
    *(_WORD *)v92 = 2114;
    *(void *)&v92[2] = v13;
    *(_WORD *)&v92[10] = 2114;
    *(void *)&v92[12] = v14;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Enumerate with range: %{public}@, ascending: %{public}@, options: %{public}@", buf, 0x34u);
  }
  id v15 = self->_cachingSession;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v17 = [WeakRetained daemon];
  v18 = [v17 behavior];
  char v19 = [v18 supportsCachedSleepDaySummaryQueries];
  if (v15) {
    char v20 = v19;
  }
  else {
    char v20 = 0;
  }

  if ((v20 & 1) == 0)
  {
    _HKInitializeLogging();
    os_log_t v26 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = objc_opt_class();
      id v29 = self->_debugIdentifier;
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v29;
      id v30 = v28;
      _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Caching not enabled; enumerating without caching.",
        buf,
        0x16u);
    }
    goto LABEL_14;
  }
  if (self->_morningIndexRange.start != *MEMORY[0x1E4F29990]
    || self->_morningIndexRange.duration != *(void *)(MEMORY[0x1E4F29990] + 8))
  {
    id v32 = objc_loadWeakRetained((id *)&self->_profile);
    v33 = [v32 database];
    id v87 = 0;
    v81 = +[HDHealthEntity maxRowIDForPredicate:0 healthDatabase:v33 error:&v87];
    id v34 = v87;

    if (!v81)
    {
      _HKInitializeLogging();
      os_log_t v50 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      {
        v71 = v50;
        v72 = objc_opt_class();
        v73 = self->_debugIdentifier;
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v72;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v73;
        *(_WORD *)&buf[22] = 2114;
        v91 = v34;
        id v74 = v72;
        _os_log_error_impl(&dword_1BCB7D000, v71, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Error checking for max row ID to serve as cache anchor: %{public}@", buf, 0x20u);
      }
      id v51 = v34;
      id v35 = v51;
      if (v51)
      {
        if (a3)
        {
          id v35 = v51;
          char v31 = 0;
          *a3 = v35;
        }
        else
        {
          _HKLogDroppedError();
          char v31 = 0;
        }
        id v49 = v35;
        goto LABEL_51;
      }
      id v49 = 0;
      goto LABEL_50;
    }
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v86 = v34;
    uint64_t v36 = [(HDSampleAggregateCachingSession *)v15 cachesExistWithError:&v86];
    id v37 = v86;

    if (v36 == 1)
    {
      _HKInitializeLogging();
      os_log_t v52 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v53 = v52;
        v54 = objc_opt_class();
        v55 = self->_debugIdentifier;
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v54;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v55;
        id v56 = v54;
        _os_log_impl(&dword_1BCB7D000, v53, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Cache exists! Returning cached sleep day summaries.", buf, 0x16u);
      }
      id v84 = v37;
      v57 = v15;
      id v80 = v81;
      id v58 = v35;
      id v59 = v5;
      v88[0] = 0;
      v88[1] = v88;
      v88[2] = 0x2020000000;
      char v89 = 0;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __96__HDSleepDaySummaryEnumerator__enumerateCacheWithSession_anchor_summariesToCache_error_handler___block_invoke;
      v91 = &unk_1E62F6EF0;
      *(void *)v92 = self;
      id v60 = v59;
      *(void *)&v92[16] = v60;
      v93 = v88;
      id v61 = v58;
      *(void *)&v92[8] = v61;
      BOOL v79 = [(HDSampleAggregateCachingSession *)v57 activateWithError:&v84 cacheHandler:buf];

      _Block_object_dispose(v88, 8);
      id v44 = v84;

      id v37 = v44;
      if (v79)
      {
LABEL_21:
        id v83 = v44;
        id v35 = v35;
        v45 = v15;
        id v46 = v81;
        if ([v35 count])
        {
          if (v36 == 2
            && ![(HDSampleAggregateCachingSession *)v45 activateWithError:&v83 cacheHandler:&__block_literal_global_321_1])
          {
            char v48 = 0;
            goto LABEL_26;
          }
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __101__HDSleepDaySummaryEnumerator__cacheSleepDaySummaries_cachingSession_cacheAnchor_isEmptyCache_error___block_invoke_2;
          v91 = &unk_1E62F2EF8;
          *(void *)v92 = self;
          id v47 = v35;
          *(void *)&v92[8] = v47;
          *(void *)&v92[16] = v46;
          [(HDSampleAggregateCachingSession *)v45 insertCaches:v47 anchor:*(void *)&v92[16] completion:buf];
        }
        char v48 = 1;
LABEL_26:

        id v49 = v83;
        if (v48)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __53__HDSleepDaySummaryEnumerator__finishCachingSession___block_invoke;
          v91 = &unk_1E62F2978;
          *(void *)v92 = self;
          [(HDSampleAggregateCachingSession *)v45 finishWithCompletion:buf];
          char v31 = 1;
LABEL_51:

          goto LABEL_52;
        }
        _HKInitializeLogging();
        os_log_t v64 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          v75 = v64;
          v76 = objc_opt_class();
          v77 = self->_debugIdentifier;
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v76;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v77;
          *(_WORD *)&buf[22] = 2114;
          v91 = v49;
          id v78 = v76;
          _os_log_error_impl(&dword_1BCB7D000, v75, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Error caching sleep day summaries: %{public}@", buf, 0x20u);
        }
        id v65 = v49;
        id v49 = v65;
        if (v65)
        {
          if (a3) {
            *a3 = v65;
          }
          else {
            _HKLogDroppedError();
          }
        }

LABEL_50:
        char v31 = 0;
        goto LABEL_51;
      }
    }
    else if (v36 == 2)
    {
      _HKInitializeLogging();
      os_log_t v38 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v39 = v38;
        v40 = objc_opt_class();
        v41 = self->_debugIdentifier;
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v41;
        id v42 = v40;
        _os_log_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Cache does not exist. Enumerating sleep day summaries from scratch.", buf, 0x16u);
      }
      id v85 = v37;
      char v43 = [(HDSleepDaySummaryEnumerator *)(uint64_t)self _enumerateSleepDaySummariesForMorningIndexRanges:self->_morningIndexRange.duration summariesToCache:v35 error:&v85 handler:v5];
      id v44 = v85;

      id v37 = v44;
      if (v43) {
        goto LABEL_21;
      }
    }
    _HKInitializeLogging();
    os_log_t v62 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      v67 = v62;
      v68 = objc_opt_class();
      v69 = self->_debugIdentifier;
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v68;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v69;
      *(_WORD *)&buf[22] = 2114;
      v91 = v37;
      id v70 = v68;
      _os_log_error_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Error enumerating sleep day summaries: %{public}@", buf, 0x20u);
    }
    id v63 = v37;
    id v49 = v63;
    if (v63)
    {
      if (a3) {
        *a3 = v63;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_50;
  }
  _HKInitializeLogging();
  os_log_t v21 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = v21;
    v23 = objc_opt_class();
    v24 = self->_debugIdentifier;
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v24;
    id v25 = v23;
    _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Client specified HKDayIndexRangeZero; enumerating without caching.",
      buf,
      0x16u);
  }
LABEL_14:
  char v31 = [(HDSleepDaySummaryEnumerator *)(uint64_t)self _enumerateSleepDaySummariesForMorningIndexRanges:self->_morningIndexRange.duration summariesToCache:0 error:a3 handler:v5];
LABEL_52:

  return v31;
}

- (uint64_t)_enumerateSleepDaySummariesForMorningIndexRanges:(uint64_t)a3 summariesToCache:(void *)a4 error:(void *)a5 handler:(void *)a6
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v95 = a4;
  id v96 = a6;
  if (!a1)
  {
    uint64_t v71 = 0;
    goto LABEL_83;
  }
  id v94 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = *(id *)(a1 + 24);
  BOOL v11 = a2 == *MEMORY[0x1E4F29990] && a3 == *(void *)(MEMORY[0x1E4F29990] + 8);
  char v12 = v11;
  char v93 = v12;
  uint64_t v104 = a1;
  uint64_t v90 = a2;
  uint64_t v91 = a3;
  if (v11)
  {
    v13 = 0;
  }
  else
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_sleepDayIntervalForMorningIndexRange:calendar:", a2, a3, v10);
    id v15 = (void *)v14;
    if (v14)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v17 = [v15 startDate];
      v18 = [v17 dateByAddingTimeInterval:-172800.0];
      char v19 = [v15 endDate];
      v13 = (void *)[v16 initWithStartDate:v18 endDate:v19];
    }
    else
    {
      v13 = 0;
    }
    a1 = v104;
    a3 = v91;
  }

  id v20 = v13;
  v97 = v20;
  if ((*(unsigned char *)(a1 + 56) & 2) != 0)
  {

    goto LABEL_38;
  }
  v100 = +[HDDataEntity hk_timeZoneEncodingOptions];
  v102 = [v97 startDate];
  a1 = v104;
  os_log_t v21 = *(void **)(v104 + 80);
  *(void *)(v104 + 80) = 0;

  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v23 = *(void **)(v104 + 72);
  *(void *)(v104 + 72) = v22;

  if (!v102)
  {

LABEL_37:
    a3 = v91;
LABEL_38:
    char v123 = 0;
    *(void *)&long long v124 = 0;
    *((void *)&v124 + 1) = &v124;
    long long v125 = 0x2020000000uLL;
    if ((v93 & 1) == 0)
    {
      uint64_t v43 = a3 + v90 - 1;
      if (a3 <= 0) {
        uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (*(unsigned char *)(a1 + 48)) {
        uint64_t v44 = v90;
      }
      else {
        uint64_t v44 = v43;
      }
      uint64_t v45 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((void *)a1, v44);
      *(void *)(*((void *)&v124 + 1) + 24) = v45;
    }
    id v119 = 0;
    v120 = &v119;
    uint64_t v121 = 0x2020000000;
    uint64_t v122 = 0;
    id v115 = 0;
    v116 = &v115;
    uint64_t v117 = 0x2020000000;
    uint64_t v118 = 0;
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v106 = __111__HDSleepDaySummaryEnumerator__enumerateSleepDaySummariesForMorningIndexRanges_summariesToCache_error_handler___block_invoke;
    v107 = &unk_1E62F6EC8;
    uint64_t v108 = a1;
    id v103 = v94;
    id v109 = v103;
    v112 = &v124;
    v113 = &v115;
    id v101 = v95;
    id v110 = v101;
    id obja = v96;
    id v111 = obja;
    v114 = &v119;
    id v46 = v97;
    id v47 = v105;
    if ((*(unsigned char *)(a1 + 56) & 2) != 0)
    {
      id v60 = (void *)MEMORY[0x1E4F2ACB8];
      uint64_t v61 = *MEMORY[0x1E4F29870];
      id v62 = v46;
      id v63 = [v60 categoryTypeForIdentifier:v61];
      id v49 = v46;
      os_log_t v64 = [(id)objc_opt_class() sleepAnalysisQueryDescriptorForDateInterval:v62 options:*(void *)(v104 + 56)];

      id WeakRetained = objc_loadWeakRetained((id *)(v104 + 8));
      v66 = +[HDSampleEntity entityEnumeratorWithType:v63 profile:WeakRetained];

      v67 = [v64 samplePredicate];
      [v66 setPredicate:v67];

      v68 = [v64 encodingOptions];
      [v66 addEncodingOptionsFromDictionary:v68];

      v69 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"start_date" entityClass:objc_opt_class() ascending:*(unsigned __int8 *)(v104 + 48)];
      *(void *)buf = v69;
      id v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
      [v66 setOrderingTerms:v70];

      id v128 = 0;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __89__HDSleepDaySummaryEnumerator__enumerateSleepSamplesWithDateInterval_stop_error_handler___block_invoke;
      v130 = &unk_1E62F6F18;
      v131 = v47;
      v132 = &v123;
      uint64_t v71 = [v66 enumerateWithError:&v128 handler:buf];
      id v72 = v128;
      v73 = v72;
      if (v71)
      {
        id v74 = 0;
      }
      else
      {
        id v76 = v72;
        id v74 = v76;
        if (v76) {
          id v77 = v76;
        }
      }
LABEL_62:

      id v78 = v74;
      BOOL v79 = v78;
      if ((v71 & 1) == 0)
      {
        id v86 = v78;
        id v87 = v86;
        if (v86)
        {
          if (a5) {
            *a5 = v86;
          }
          else {
            _HKLogDroppedError();
          }
        }

        goto LABEL_81;
      }
      _HKInitializeLogging();
      id v80 = (id)*MEMORY[0x1E4F29FA0];
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        v81 = objc_opt_class();
        uint64_t v82 = *(void *)(v104 + 64);
        id v83 = v120[3];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v81;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v82;
        *(_WORD *)&buf[22] = 2050;
        v130 = v83;
        id v84 = v81;
        _os_log_impl(&dword_1BCB7D000, v80, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Enumerated %{public}ld samples", buf, 0x20u);
      }
      uint64_t v85 = v90;
      if (!v123)
      {
        if (v93)
        {
          uint64_t v85 = (uint64_t)v116[3];
        }
        else if (*(unsigned char *)(v104 + 48))
        {
          if (v91 <= 0)
          {
            uint64_t v85 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_80;
          }
          uint64_t v85 = v91 + v90 - 1;
        }
        if (v85) {
LABEL_80:
        }
          -[HDSleepDaySummaryEnumerator _closeBuilders:fromIndex:toIndex:summariesToCache:handler:stop:](v104, v103, *(void *)(*((void *)&v124 + 1) + 24), v85, v101, obja, &v123);
      }
LABEL_81:

      _Block_object_dispose(&v115, 8);
      _Block_object_dispose(&v119, 8);
      _Block_object_dispose(&v124, 8);
      goto LABEL_82;
    }
    id v48 = v46;
    id v49 = v46;
    os_log_t v50 = [(id)objc_opt_class() sleepTypesQueryDescriptorsForDateInterval:v48 options:*(void *)(v104 + 56)];

    id v51 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F2A9B8] ascending:*(unsigned __int8 *)(v104 + 48)];
    os_log_t v52 = [HDMultiTypeSortedSampleIterator alloc];
    *(void *)buf = v51;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    id v54 = objc_loadWeakRetained((id *)(v104 + 8));
    v55 = [(HDMultiTypeSortedSampleIterator *)v52 initWithQueryDescriptors:v50 includeDeletedObjects:0 anchor:0 sortDescriptors:v53 bufferSize:100 profile:v54];

    *(void *)buf = 0;
    LODWORD(v54) = [(HDMultiTypeSortedSampleIterator *)v55 advanceWithError:buf];
    id v56 = *(id *)buf;
    if (v54)
    {
      while (!v123)
      {
        uint64_t v57 = MEMORY[0x1C187C0E0]();
        id v58 = [(HDMultiTypeSortedSampleIterator *)v55 sample];
        v106(v47, v58, &v123);

        *(void *)buf = v56;
        LOBYTE(v57) = [(HDMultiTypeSortedSampleIterator *)v55 advanceWithError:buf];
        id v59 = *(id *)buf;

        id v56 = v59;
        if ((v57 & 1) == 0)
        {
          if (v59) {
            goto LABEL_54;
          }
          goto LABEL_55;
        }
      }
    }
    id v59 = v56;
    if (v56)
    {
LABEL_54:
      if ((objc_msgSend(v59, "hk_isHealthKitErrorWithCode:", 900, v90) & 1) == 0)
      {
        id v74 = v59;
        char v75 = 0;
        goto LABEL_61;
      }
    }
LABEL_55:
    id v74 = 0;
    char v75 = 1;
LABEL_61:
    LOBYTE(v128) = v75;

    uint64_t v71 = v128;
    goto LABEL_62;
  }
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  HKSleepScheduleWeekdayArrayFromWeekdays();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v24 = 0;
  uint64_t v25 = [obj countByEnumeratingWithState:&v124 objects:buf count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v125;
    while (2)
    {
      uint64_t v27 = 0;
      v28 = v24;
      do
      {
        if (*(void *)v125 != v26) {
          objc_enumerationMutation(obj);
        }
        id v29 = *(void **)(*((void *)&v124 + 1) + 8 * v27);
        uint64_t v30 = objc_msgSend(v29, "integerValue", v90);
        id v31 = objc_loadWeakRetained((id *)(v104 + 8));
        id v119 = v28;
        id v32 = +[HDSleepScheduleEntity mostRecentSleepScheduleForWeekday:v30 beforeDate:v102 profile:v31 encodingOptions:v100 error:&v119];
        id v24 = v119;

        [*(id *)(v104 + 72) setObject:v32 forKeyedSubscript:v29];
        if (v32) {
          BOOL v33 = 1;
        }
        else {
          BOOL v33 = v24 == 0;
        }
        if (!v33)
        {
          id v42 = *(void **)(v104 + 72);
          *(void *)(v104 + 72) = 0;

          if (a5)
          {
            id v24 = v24;
            *a5 = v24;
          }
          else
          {
            _HKLogDroppedError();
          }
          id v88 = obj;
          goto LABEL_75;
        }

        ++v27;
        v28 = v24;
      }
      while (v25 != v27);
      uint64_t v25 = [obj countByEnumeratingWithState:&v124 objects:buf count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  id v34 = [MEMORY[0x1E4F2B2C0] sleepDurationGoalType];
  id v35 = objc_loadWeakRetained((id *)(v104 + 8));
  uint64_t v36 = HDSampleEntityPredicateForStartDate(3);
  id v115 = v24;
  uint64_t v37 = +[HDSampleEntity mostRecentSampleWithType:v34 profile:v35 encodingOptions:v100 predicate:v36 anchor:0 error:&v115];
  id v38 = v115;

  v39 = *(void **)(v104 + 80);
  *(void *)(v104 + 80) = v37;

  if (*(void *)(v104 + 72))
  {
    v40 = v38;
    if (!*(void *)(v104 + 80) && v38)
    {
      id v41 = v38;
      goto LABEL_85;
    }

    a1 = v104;
    goto LABEL_37;
  }
  v40 = v38;
  id v88 = v38;
  if (v88)
  {
LABEL_85:
    if (a5)
    {
      id v88 = v40;
      *a5 = v88;
      id v24 = v88;
    }
    else
    {
      _HKLogDroppedError();
      id v88 = v38;
      id v24 = v38;
    }
    goto LABEL_75;
  }
  id v24 = 0;
LABEL_75:

  uint64_t v71 = 0;
LABEL_82:

LABEL_83:
  return v71;
}

- (uint64_t)_aggregationIntervalAdjustedMorningIndexFromMorningIndex:(void *)a1
{
  uint64_t v2 = a2;
  v4 = (void *)a1[13];
  id v5 = [NSNumber numberWithInteger:a2];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    uint64_t v7 = a1[7];
    if ((v7 & 0x10) != 0)
    {
      v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_sleepMonthStartForMorningIndex:calendar:", v2, a1[3]);
    }
    else
    {
      if ((v7 & 8) == 0) {
        goto LABEL_8;
      }
      v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_sleepWeekStartForMorningIndex:calendar:", v2, a1[3]);
    }
    v9 = v8;
    uint64_t v10 = objc_msgSend(v8, "hk_morningIndexWithCalendar:", a1[3]);
    BOOL v11 = [NSNumber numberWithInteger:v10];
    char v12 = (void *)a1[13];
    v13 = [NSNumber numberWithInteger:v2];
    [v12 setObject:v11 forKeyedSubscript:v13];

    uint64_t v2 = v10;
    goto LABEL_8;
  }
  uint64_t v2 = [v6 integerValue];
LABEL_8:

  return v2;
}

void __111__HDSleepDaySummaryEnumerator__enumerateSleepDaySummariesForMorningIndexRanges_summariesToCache_error_handler___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1[4];
  v6 = (void *)a1[5];
  uint64_t v7 = *(void *)(a1[8] + 8);
  uint64_t v8 = *(void *)(a1[9] + 8);
  v9 = *(void **)(v5 + 24);
  uint64_t v10 = (void *)a1[6];
  BOOL v11 = (void *)a1[7];
  id v12 = a2;
  id v52 = v6;
  id v55 = v9;
  id v54 = v10;
  id v53 = v11;
  uint64_t v50 = v7;
  uint64_t v51 = v8;
  uint64_t v13 = *(void *)(v7 + 24);
  uint64_t v49 = *(void *)(v8 + 24);
  if (*(unsigned char *)(v5 + 48)) {
    [v12 startDate];
  }
  else {
  uint64_t v14 = [v12 endDate];
  }
  uint64_t v15 = objc_msgSend(v14, "hk_morningIndexWithCalendar:", v55);

  uint64_t v16 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((void *)v5, v15);
  uint64_t v17 = v16;
  if (*(unsigned char *)(v5 + 48)) {
    uint64_t v18 = v16 - 1;
  }
  else {
    uint64_t v18 = v16 + 1;
  }
  uint64_t v19 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((void *)v5, v18);
  if (v13) {
    uint64_t v20 = v13;
  }
  else {
    uint64_t v20 = v17;
  }
  if (*(unsigned char *)(v5 + 48))
  {
    if (v17 > v20)
    {
LABEL_12:
      -[HDSleepDaySummaryEnumerator _closeBuilders:fromIndex:toIndex:summariesToCache:handler:stop:](v5, v52, v20, v19, v54, v53, a3);
      uint64_t v48 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((void *)v5, v17);
      goto LABEL_15;
    }
  }
  else if (v17 < v20)
  {
    goto LABEL_12;
  }
  uint64_t v48 = v20;
LABEL_15:
  os_log_t v21 = [v12 sampleType];
  uint64_t v22 = [v21 code];

  if (v22 == 198)
  {
    id v23 = v12;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    [v23 weekdays];
    id v24 = HKSleepScheduleWeekdayArrayFromWeekdays();
    uint64_t v25 = [v24 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v57 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          if ([v29 integerValue]) {
            [*(id *)(v5 + 72) setObject:v23 forKeyedSubscript:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v26);
    }
  }
  uint64_t v30 = [v12 sampleType];
  uint64_t v31 = [v30 code];

  if (v31 == 197) {
    objc_storeStrong((id *)(v5 + 80), a2);
  }
  uint64_t v32 = objc_msgSend(v12, "hk_morningIndexRangeWithCalendarWithCalendar:", v55);
  uint64_t v34 = v33;
  if (*(void *)(v5 + 32) != *MEMORY[0x1E4F29990] || *(void *)(v5 + 40) != *(void *)(MEMORY[0x1E4F29990] + 8))
  {
    uint64_t v32 = HKIntersectionDayIndexRange();
    uint64_t v34 = v35;
  }
  id v36 = v12;
  id v37 = v52;
  uint64_t v38 = v32 + v34;
  if (v34 >= 1)
  {
    uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v40 = v32;
    do
    {
      uint64_t v41 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((void *)v5, v40);
      if (v41 != v39)
      {
        uint64_t v42 = v41;
        uint64_t v43 = -[HDSleepDaySummaryEnumerator _updatedBuilderForMorningIndex:fromBuilders:createIfNeeded:](v5, v41, v37, 1);
        [v43 addOrderedSample:v36];

        uint64_t v39 = v42;
      }
      ++v40;
    }
    while (v40 < v38);
  }

  if (v49 >= v32) {
    uint64_t v44 = v32;
  }
  else {
    uint64_t v44 = v49;
  }
  uint64_t v45 = v38 - 1;
  if (v34 <= 0) {
    uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v49 > v45) {
    uint64_t v45 = v49;
  }
  if (*(unsigned char *)(v5 + 48)) {
    uint64_t v46 = v45;
  }
  else {
    uint64_t v46 = v44;
  }
  *(void *)(v50 + 24) = v48;
  *(void *)(v51 + 24) = v46;

  ++*(void *)(*(void *)(a1[10] + 8) + 24);
}

- (void)_closeBuilders:(uint64_t)a3 fromIndex:(uint64_t)a4 toIndex:(void *)a5 summariesToCache:(void *)a6 handler:(unsigned char *)a7 stop:
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v63 = a2;
  id v61 = a5;
  id v60 = a6;
  _HKInitializeLogging();
  id v12 = (os_log_t *)MEMORY[0x1E4F29FA0];
  uint64_t v13 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEBUG))
  {
    id v53 = v13;
    id v54 = objc_opt_class();
    uint64_t v55 = *(void *)(a1 + 64);
    id v56 = v54;
    long long v57 = HKStringFromBool();
    *(_DWORD *)buf = 138544386;
    id v65 = v54;
    __int16 v66 = 2114;
    uint64_t v67 = v55;
    id v12 = (os_log_t *)MEMORY[0x1E4F29FA0];
    __int16 v68 = 2050;
    uint64_t v69 = a3;
    __int16 v70 = 2050;
    uint64_t v71 = a4;
    __int16 v72 = 2112;
    v73 = v57;
    _os_log_debug_impl(&dword_1BCB7D000, v53, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Closing builders from %{public}ld to %{public}ld (ascending = %@)", buf, 0x34u);
  }
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v15 = a3 <= a4;
  }
  else {
    BOOL v15 = a3 >= a4;
  }
  if (v15)
  {
    uint64_t v17 = *MEMORY[0x1E4F29990];
    uint64_t v16 = *(void *)(MEMORY[0x1E4F29990] + 8);
    *(void *)&long long v14 = 138543874;
    long long v58 = v14;
    uint64_t v59 = a4;
    do
    {
      uint64_t v18 = (void *)MEMORY[0x1C187C0E0]();
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 40);
      BOOL v21 = v19 == v17 && v20 == v16;
      if (v21 || ((BOOL v22 = __OFSUB__(a3, v19), v23 = a3 - v19, v23 < 0 == v22) ? (v24 = v23 < v20) : (v24 = 0), v24))
      {
        uint64_t v33 = *(void *)(a1 + 56);
        if ((v33 & 0x10) != 0)
        {
          uint64_t v39 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((void *)a1, a3);
          if (a3 == v39) {
            goto LABEL_24;
          }
          uint64_t v46 = v39;
          _HKInitializeLogging();
          os_log_t v47 = *v12;
          if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v26 = v47;
            uint64_t v48 = objc_opt_class();
            uint64_t v49 = *(void *)(a1 + 64);
            *(_DWORD *)buf = 138544130;
            id v65 = v48;
            __int16 v66 = 2114;
            uint64_t v67 = v49;
            __int16 v68 = 2050;
            uint64_t v69 = a3;
            __int16 v70 = 2050;
            uint64_t v71 = v46;
            id v29 = v48;
            uint64_t v30 = v26;
            uint64_t v31 = "[%{public}@:%{public}@] Aggregating monthly! Skipping day index %{public}ld because it's beyond start "
                  "of month index %{public}ld";
LABEL_29:
            uint32_t v32 = 42;
LABEL_30:
            _os_log_debug_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_DEBUG, v31, buf, v32);
          }
        }
        else
        {
          if ((v33 & 8) == 0
            || (uint64_t v34 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((void *)a1, a3), a3 == v34))
          {
LABEL_24:
            uint64_t v40 = v16;
            uint64_t v41 = v17;
            uint64_t v42 = -[HDSleepDaySummaryEnumerator _updatedBuilderForMorningIndex:fromBuilders:createIfNeeded:](a1, a3, v63, (*(void *)(a1 + 56) & 1) == 0);
            uint64_t v43 = v42;
            if (v42)
            {
              uint64_t v44 = [v42 createDaySummary];
              uint64_t v45 = [v44 periods];
              if ([v45 count])
              {

LABEL_32:
                v60[2](v60, v44, a7);
                if (v61) {
                  [v61 addObject:v44];
                }
                uint64_t v51 = objc_msgSend(NSNumber, "numberWithInteger:", a3, v58);
                [v63 setObject:0 forKeyedSubscript:v51];

                if (*a7)
                {

                  break;
                }
              }
              else
              {
                uint64_t v50 = *(void *)(a1 + 56);

                if ((v50 & 1) == 0) {
                  goto LABEL_32;
                }
              }

              a4 = v59;
              id v12 = (os_log_t *)MEMORY[0x1E4F29FA0];
            }

            uint64_t v17 = v41;
            uint64_t v16 = v40;
            goto LABEL_37;
          }
          uint64_t v35 = v34;
          _HKInitializeLogging();
          os_log_t v36 = *v12;
          if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v26 = v36;
            id v37 = objc_opt_class();
            uint64_t v38 = *(void *)(a1 + 64);
            *(_DWORD *)buf = 138544130;
            id v65 = v37;
            __int16 v66 = 2114;
            uint64_t v67 = v38;
            __int16 v68 = 2050;
            uint64_t v69 = a3;
            __int16 v70 = 2050;
            uint64_t v71 = v35;
            id v29 = v37;
            uint64_t v30 = v26;
            uint64_t v31 = "[%{public}@:%{public}@] Aggregating weekly! Skipping day index %{public}ld because it's beyond start o"
                  "f week index %{public}ld";
            goto LABEL_29;
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        os_log_t v25 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v26 = v25;
          uint64_t v27 = objc_opt_class();
          uint64_t v28 = *(void *)(a1 + 64);
          *(_DWORD *)buf = v58;
          id v65 = v27;
          __int16 v66 = 2114;
          uint64_t v67 = v28;
          __int16 v68 = 2050;
          uint64_t v69 = a3;
          id v29 = v27;
          uint64_t v30 = v26;
          uint64_t v31 = "[%{public}@:%{public}@] Skipping index out of range for morning index %{public}ld";
          uint32_t v32 = 32;
          goto LABEL_30;
        }
      }
LABEL_37:
      if (*(unsigned char *)(a1 + 48)) {
        ++a3;
      }
      else {
        --a3;
      }
      if (*(unsigned char *)(a1 + 48)) {
        BOOL v52 = a3 <= a4;
      }
      else {
        BOOL v52 = a3 >= a4;
      }
    }
    while (v52);
  }
}

BOOL __96__HDSleepDaySummaryEnumerator__enumerateCacheWithSession_anchor_summariesToCache_error_handler___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4, void *a5)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(v10 + 32);
  uint64_t v11 = *(void *)(v10 + 40);
  BOOL v13 = __OFSUB__(a4, v12);
  uint64_t v14 = a4 - v12;
  BOOL v15 = v14 < 0 == v13 && v14 < v11;
  uint64_t v16 = (os_log_t *)MEMORY[0x1E4F29FA0];
  if (!v15)
  {
    _HKInitializeLogging();
    os_log_t v17 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_FAULT))
    {
      uint64_t v39 = v17;
      uint64_t v40 = objc_opt_class();
      uint64_t v43 = *(void *)(*(void *)(a1 + 32) + 64);
      id v42 = v40;
      uint64_t v41 = NSStringFromHKDayIndexRange();
      *(_DWORD *)aBlock = 138544386;
      *(void *)&aBlock[4] = v40;
      *(_WORD *)&aBlock[12] = 2114;
      *(void *)&aBlock[14] = v43;
      *(_WORD *)&aBlock[22] = 2050;
      BOOL v52 = (void *)a4;
      *(_WORD *)id v53 = 2114;
      *(void *)&v53[2] = v41;
      *(_WORD *)&v53[10] = 2114;
      *(void *)&v53[12] = v9;
      _os_log_fault_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_FAULT, "[%{public}@:%{public}@] Error: Summary for morningIndex %{public}ld is out of bounds for expected morningIndexRange %{public}@: %{public}@", aBlock, 0x34u);
    }
  }
  _HKInitializeLogging();
  os_log_t v18 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v33 = v18;
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 64);
    id v36 = v34;
    id v37 = HKStringFromBool();
    *(_DWORD *)aBlock = 138544386;
    *(void *)&aBlock[4] = v34;
    *(_WORD *)&aBlock[12] = 2114;
    *(void *)&aBlock[14] = v35;
    *(_WORD *)&aBlock[22] = 2050;
    BOOL v52 = (void *)a4;
    *(_WORD *)id v53 = 2114;
    *(void *)&v53[2] = v37;
    *(_WORD *)&v53[10] = 2114;
    *(void *)&v53[12] = v9;
    _os_log_debug_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Summary returned for dayIndex: %{public}ld, stale: %{public}@, summary: %{public}@", aBlock, 0x34u);
  }
  if (!v9 || a3)
  {
    uint64_t v20 = *(void **)(a1 + 32);
    if (v20)
    {
      uint64_t v45 = 0;
      uint64_t v46 = &v45;
      uint64_t v47 = 0x3032000000;
      uint64_t v48 = __Block_byref_object_copy__30;
      uint64_t v49 = __Block_byref_object_dispose__30;
      id v50 = 0;
      *(void *)aBlock = MEMORY[0x1E4F143A8];
      *(void *)&aBlock[8] = 3221225472;
      *(void *)&aBlock[16] = __69__HDSleepDaySummaryEnumerator__sleepDaySummaryForMorningIndex_error___block_invoke;
      BOOL v52 = &unk_1E62F6FA8;
      *(void *)&v53[8] = &v45;
      *(void *)&v53[16] = sel__sleepDaySummaryForMorningIndex_error_;
      *(void *)id v53 = v20;
      BOOL v21 = _Block_copy(aBlock);
      id v44 = 0;
      char v22 = [(HDSleepDaySummaryEnumerator *)(uint64_t)v20 _enumerateSleepDaySummariesForMorningIndexRanges:1 summariesToCache:0 error:&v44 handler:v21];
      id v23 = v44;
      BOOL v24 = v23;
      if (v22)
      {
        uint64_t v20 = 0;
        os_log_t v25 = (void *)v46[5];
      }
      else
      {
        id v26 = v23;
        uint64_t v20 = v26;
        if (v26) {
          id v27 = v26;
        }

        os_log_t v25 = 0;
      }
      id v28 = v25;

      _Block_object_dispose(&v45, 8);
    }
    else
    {
      id v28 = 0;
    }
    id v29 = v20;
    uint64_t v30 = v29;
    BOOL v19 = v28 != 0;
    if (v28)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      [*(id *)(a1 + 40) addObject:v28];
    }
    else
    {
      id v31 = v29;
      uint32_t v32 = v31;
      if (v31)
      {
        if (a5) {
          *a5 = v31;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    BOOL v19 = 1;
  }

  return v19;
}

uint64_t __89__HDSleepDaySummaryEnumerator__enumerateSleepSamplesWithDateInterval_stop_error_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1C187C0E0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return 1;
}

- (id)_updatedBuilderForMorningIndex:(void *)a3 fromBuilders:(int)a4 createIfNeeded:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = -[HDSleepDaySummaryEnumerator _aggregationIntervalAdjustedMorningIndexFromMorningIndex:]((void *)a1, a2);
  id v9 = [NSNumber numberWithInteger:v8];
  uint64_t v10 = [v7 objectForKeyedSubscript:v9];

  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = a4 == 0;
  }
  if (!v11)
  {
    _HKInitializeLogging();
    uint64_t v12 = (void *)*MEMORY[0x1E4F29FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEBUG))
    {
      id v31 = v12;
      uint32_t v32 = objc_opt_class();
      uint64_t v33 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v32;
      __int16 v41 = 2114;
      uint64_t v42 = v33;
      __int16 v43 = 2050;
      uint64_t v44 = v8;
      id v34 = v32;
      _os_log_debug_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Creating builder for morning index %{public}ld", buf, 0x20u);
    }
    uint64_t v13 = HKSleepScheduleWeekdayFromWeekdayComponent();
    unint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = (v14 >> 2) & 1;
    if ((v14 & 0x10) != 0)
    {
      BOOL v19 = [HDSleepIntervalSummaryBuilder alloc];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_noonWithDayIndex:calendar:", v8, *(void *)(a1 + 24));
      [*(id *)(a1 + 24) rangeOfUnit:16 inUnit:8 forDate:v20];
      uint64_t v22 = v21;

      uint64_t v18 = -[HDSleepDaySummaryBuilder initWithProfile:dayIndexRange:weekday:options:gregorianCalendar:sourceOrderProvider:](v19, "initWithProfile:dayIndexRange:weekday:options:gregorianCalendar:sourceOrderProvider:", WeakRetained, v8, v22, v13, v15, *(void *)(a1 + 24), *(void *)(a1 + 96));
    }
    else if ((v14 & 8) != 0)
    {
      id v23 = [HDSleepIntervalSummaryBuilder alloc];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      uint64_t v18 = -[HDSleepDaySummaryBuilder initWithProfile:dayIndexRange:weekday:options:gregorianCalendar:sourceOrderProvider:](v23, "initWithProfile:dayIndexRange:weekday:options:gregorianCalendar:sourceOrderProvider:", WeakRetained, v8, 7, v13, v15, *(void *)(a1 + 24), *(void *)(a1 + 96));
    }
    else
    {
      uint64_t v16 = [HDSleepDaySummaryBuilder alloc];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      uint64_t v18 = [(HDSleepDaySummaryBuilder *)v16 initWithProfile:WeakRetained morningIndex:v8 weekday:v13 options:v15 gregorianCalendar:*(void *)(a1 + 24) sourceOrderProvider:*(void *)(a1 + 96)];
    }
    uint64_t v10 = (void *)v18;

    BOOL v24 = [NSNumber numberWithInteger:v8];
    [v7 setObject:v10 forKeyedSubscript:v24];
  }
  if (v10 && (*(unsigned char *)(a1 + 56) & 2) == 0)
  {
    _HKInitializeLogging();
    os_log_t v25 = (void *)*MEMORY[0x1E4F29FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v35 = v25;
      id v36 = objc_opt_class();
      uint64_t v37 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v36;
      __int16 v41 = 2114;
      uint64_t v42 = v37;
      __int16 v43 = 2050;
      uint64_t v44 = v8;
      id v38 = v36;
      _os_log_debug_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Updating builder with schedule and goal for morning index %{public}ld", buf, 0x20u);
    }
    uint64_t v26 = HKSleepScheduleWeekdayFromWeekdayComponent();
    id v27 = *(void **)(a1 + 72);
    id v28 = [NSNumber numberWithUnsignedInteger:v26];
    id v29 = [v27 objectForKeyedSubscript:v28];

    if (v29) {
      [v10 addOrderedSample:v29];
    }
    if (*(void *)(a1 + 80)) {
      objc_msgSend(v10, "addOrderedSample:");
    }
  }

  return v10;
}

+ (id)sleepAnalysisQueryDescriptorForDateInterval:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29870]];
  id v7 = objc_msgSend(&unk_1F17E9270, "hk_map:", &__block_literal_global_37);
  uint64_t v8 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v7];
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v8, 0);
  if (v5)
  {
    uint64_t v10 = HDSampleEntityPredicateForDateInterval(v5, v6);
    [v9 addObject:v10];
  }
  if ((v4 & 0x20) != 0)
  {
    BOOL v11 = HDDataEntityPredicateForObjectsFromAppleWatchSources(1);
    [v9 addObject:v11];
  }
  uint64_t v12 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v9];

  uint64_t v13 = [HDQueryDescriptor alloc];
  id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v20[0] = v6;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v16 = (void *)[v14 initWithArray:v15];
  os_log_t v17 = +[HDDataEntity hk_timeZoneEncodingOptions];
  uint64_t v18 = [(HDQueryDescriptor *)v13 initWithSampleTypes:v16 encodingOptions:v17 restrictedSourceEntities:0 authorizationFilter:0 samplePredicate:v12];

  return v18;
}

id __83__HDSleepDaySummaryEnumerator_sleepAnalysisQueryDescriptorForDateInterval_options___block_invoke()
{
  return HDCategorySampleEntityPredicateForValue(1);
}

+ (id)sleepTypesQueryDescriptorsForDateInterval:(id)a3 options:(unint64_t)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [a1 sleepAnalysisQueryDescriptorForDateInterval:v6 options:a4];
  v19[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  uint64_t v10 = (void *)[v7 initWithArray:v9];

  if ((a4 & 2) == 0)
  {
    BOOL v11 = [MEMORY[0x1E4F2B448] dataTypeWithCode:198];
    v18[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F2B3B8] dataTypeWithCode:197];
    v18[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__HDSleepDaySummaryEnumerator_sleepTypesQueryDescriptorsForDateInterval_options___block_invoke;
    v16[3] = &unk_1E62F6F60;
    id v17 = v6;
    id v14 = objc_msgSend(v13, "hk_map:", v16);
    [v10 addObjectsFromArray:v14];
  }

  return v10;
}

HDQueryDescriptor *__81__HDSleepDaySummaryEnumerator_sleepTypesQueryDescriptorsForDateInterval_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = HDSampleEntityPredicateForDateInterval(v4, v3);
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [HDQueryDescriptor alloc];
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
  uint64_t v8 = +[HDDataEntity hk_timeZoneEncodingOptions];
  id v9 = [(HDQueryDescriptor *)v6 initWithSampleTypes:v7 encodingOptions:v8 restrictedSourceEntities:0 authorizationFilter:0 samplePredicate:v5];

  return v9;
}

void __53__HDSleepDaySummaryEnumerator__finishCachingSession___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29FA0];
  id v7 = *MEMORY[0x1E4F29FA0];
  if ((a2 & 1) == 0)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    uint64_t v8 = v6;
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 64);
    int v14 = 138543874;
    uint64_t v15 = v12;
    __int16 v16 = 2114;
    uint64_t v17 = v13;
    __int16 v18 = 2114;
    id v19 = v5;
    id v11 = v12;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Error finishing caching session: %{public}@", (uint8_t *)&v14, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v6;
    id v9 = objc_opt_class();
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 64);
    int v14 = 138543618;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    id v11 = v9;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Finished caching session!", (uint8_t *)&v14, 0x16u);
LABEL_4:
  }
LABEL_6:
}

uint64_t __101__HDSleepDaySummaryEnumerator__cacheSleepDaySummaries_cachingSession_cacheAnchor_isEmptyCache_error___block_invoke()
{
  return 1;
}

void __101__HDSleepDaySummaryEnumerator__cacheSleepDaySummaries_cachingSession_cacheAnchor_isEmptyCache_error___block_invoke_2(void *a1, char a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29FA0];
  id v7 = *MEMORY[0x1E4F29FA0];
  if ((a2 & 1) == 0)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    uint64_t v8 = v6;
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = *(void *)(a1[4] + 64);
    int v18 = 138543874;
    id v19 = v15;
    __int16 v20 = 2114;
    uint64_t v21 = v16;
    __int16 v22 = 2114;
    uint64_t v23 = (uint64_t)v5;
    id v17 = v15;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Error updating cache: %{public}@", (uint8_t *)&v18, 0x20u);

    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v6;
    id v9 = objc_opt_class();
    uint64_t v10 = (void *)a1[5];
    uint64_t v11 = *(void *)(a1[4] + 64);
    id v12 = v9;
    uint64_t v13 = [v10 count];
    uint64_t v14 = a1[6];
    int v18 = 138544130;
    id v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v11;
    __int16 v22 = 2050;
    uint64_t v23 = v13;
    __int16 v24 = 2114;
    uint64_t v25 = v14;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Updated cache with %{public}ld sleep day summaries (anchor: %{public}@)", (uint8_t *)&v18, 0x2Au);

LABEL_4:
  }
LABEL_6:
}

void __69__HDSleepDaySummaryEnumerator__sleepDaySummaryForMorningIndex_error___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v6 + 40);
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a1[6] object:a1[4] file:@"HDSleepDaySummaryEnumerator.m" lineNumber:788 description:@"Handler should only be called once since we're only enumerating samples for a single day."];

    uint64_t v6 = *(void *)(a1[5] + 8);
    id v7 = *(void **)(v6 + 40);
  }
  *(void *)(v6 + 40) = v5;

  *a3 = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustedMorningIndexCache, 0);
  objc_storeStrong((id *)&self->_sourceOrderProvider, 0);
  objc_storeStrong((id *)&self->_sleepDurationGoalSample, 0);
  objc_storeStrong((id *)&self->_schedulesByWeekday, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_cachingSession, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end