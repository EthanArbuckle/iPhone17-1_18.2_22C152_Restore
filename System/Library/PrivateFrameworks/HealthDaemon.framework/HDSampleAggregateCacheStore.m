@interface HDSampleAggregateCacheStore
- (BOOL)_indexInRangeOfQueryStartIndex:(void *)a3 endIndex:(uint64_t)a4 bucketIndex:;
- (BOOL)deleteCachesForIndexes:(id)a3 generationNumber:(int64_t)a4 error:(id *)a5;
- (BOOL)enumerateForInterval:(id)a3 cachedClass:(Class)a4 anchorAfterDatabaseScan:(int64_t *)a5 error:(id *)a6 cacheHandler:(id)a7;
- (BOOL)enumerateForInterval:(id)a3 cachedClass:(Class)a4 anchorAfterDatabaseScan:(int64_t *)a5 nowDate:(id)a6 calendar:(id)a7 error:(id *)a8 cacheHandler:(id)a9;
- (BOOL)saveCaches:(id)a3 generationNumber:(int64_t)a4 error:(id *)a5;
- (HDQueryDescriptor)queryDescriptor;
- (HDSampleAggregateCacheStore)initWithProfile:(id)a3 queryDescriptor:(id)a4 cachingIdentifier:(id)a5 sourceEntity:(id)a6 anchorDate:(id)a7 intervalComponents:(id)a8 timeIntervalToBucketIndex:(id)a9;
- (NSArray)invalidationQueryDescriptors;
- (id)persistentAnchorDateWithError:(id *)a3;
- (id)timeIntervalToBucketIndex;
- (int64_t)cachesExistWithError:(id *)a3;
- (void)setInvalidationQueryDescriptors:(id)a3;
- (void)setTimeIntervalToBucketIndex:(id)a3;
@end

@implementation HDSampleAggregateCacheStore

- (HDSampleAggregateCacheStore)initWithProfile:(id)a3 queryDescriptor:(id)a4 cachingIdentifier:(id)a5 sourceEntity:(id)a6 anchorDate:(id)a7 intervalComponents:(id)a8 timeIntervalToBucketIndex:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v38.receiver = self;
  v38.super_class = (Class)HDSampleAggregateCacheStore;
  v23 = [(HDSampleAggregateCacheStore *)&v38 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_profile, a3);
    uint64_t v25 = [v17 copy];
    queryDescriptor = v24->_queryDescriptor;
    v24->_queryDescriptor = (HDQueryDescriptor *)v25;

    uint64_t v27 = [v18 copy];
    cachingIdentifier = v24->_cachingIdentifier;
    v24->_cachingIdentifier = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    sourceEntity = v24->_sourceEntity;
    v24->_sourceEntity = (HDSourceEntity *)v29;

    uint64_t v31 = [v22 copy];
    id timeIntervalToBucketIndex = v24->_timeIntervalToBucketIndex;
    v24->_id timeIntervalToBucketIndex = (id)v31;

    uint64_t v33 = [v20 copy];
    anchorDate = v24->_anchorDate;
    v24->_anchorDate = (NSDate *)v33;

    uint64_t v35 = [v21 copy];
    intervalComponents = v24->_intervalComponents;
    v24->_intervalComponents = (NSDateComponents *)v35;
  }
  return v24;
}

- (int64_t)cachesExistWithError:(id *)a3
{
  return +[HDSampleAggregateCacheEntity cachesExistForQueryIdentifier:self->_cachingIdentifier sourceEntity:self->_sourceEntity profile:self->_profile error:a3];
}

- (id)persistentAnchorDateWithError:(id *)a3
{
  persistentAnchorDate = self->_persistentAnchorDate;
  if (persistentAnchorDate)
  {
    v4 = persistentAnchorDate;
  }
  else
  {
    cachingIdentifier = self->_cachingIdentifier;
    sourceEntity = self->_sourceEntity;
    profile = self->_profile;
    id v19 = 0;
    v10 = +[HDCachedQueryMetadataEntity cachedQueryMetadataForQueryIdentifier:cachingIdentifier sourceEntity:sourceEntity profile:profile error:&v19];
    id v11 = v19;
    v12 = v11;
    if (v10) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v11 == 0;
    }
    if (v13)
    {
      if (v10)
      {
        v14 = [v10 anchorDate];
      }
      else
      {
        v14 = self->_anchorDate;
      }
      id v17 = self->_persistentAnchorDate;
      self->_persistentAnchorDate = v14;

      v4 = self->_persistentAnchorDate;
    }
    else
    {
      id v15 = v11;
      id v16 = v15;
      if (a3) {
        *a3 = v15;
      }
      else {
        _HKLogDroppedError();
      }

      v4 = 0;
    }
  }

  return v4;
}

- (BOOL)saveCaches:(id)a3 generationNumber:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v16 = 0;
  v9 = [(HDSampleAggregateCacheStore *)self persistentAnchorDateWithError:&v16];
  id v10 = v16;
  id v11 = v10;
  if (v9)
  {
    BOOL v12 = +[HDSampleAggregateCacheEntity insertCachedData:v8 forQueryIdentifier:self->_cachingIdentifier sourceEntity:self->_sourceEntity generationNumber:a4 persistentAnchorDate:v9 intervalComponents:self->_intervalComponents profile:self->_profile error:a5];
  }
  else
  {
    id v13 = v10;
    v14 = v13;
    BOOL v12 = v13 == 0;
    if (v13)
    {
      if (a5) {
        *a5 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v12;
}

- (BOOL)deleteCachesForIndexes:(id)a3 generationNumber:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v16 = 0;
  v9 = [(HDSampleAggregateCacheStore *)self persistentAnchorDateWithError:&v16];
  id v10 = v16;
  id v11 = v10;
  if (v9)
  {
    BOOL v12 = +[HDSampleAggregateCacheEntity deleteCacheForBucketIndexes:v8 forQueryIdentifier:self->_cachingIdentifier sourceEntity:self->_sourceEntity generationNumber:a4 persistentAnchorDate:v9 intervalComponents:self->_intervalComponents profile:self->_profile error:a5];
  }
  else
  {
    id v13 = v10;
    v14 = v13;
    if (v13)
    {
      if (a5) {
        *a5 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)enumerateForInterval:(id)a3 cachedClass:(Class)a4 anchorAfterDatabaseScan:(int64_t *)a5 error:(id *)a6 cacheHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v14 = [MEMORY[0x1E4F1C9C8] now];
  id v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  LOBYTE(a6) = [(HDSampleAggregateCacheStore *)self enumerateForInterval:v12 cachedClass:a4 anchorAfterDatabaseScan:a5 nowDate:v14 calendar:v15 error:a6 cacheHandler:v13];

  return (char)a6;
}

- (BOOL)enumerateForInterval:(id)a3 cachedClass:(Class)a4 anchorAfterDatabaseScan:(int64_t *)a5 nowDate:(id)a6 calendar:(id)a7 error:(id *)a8 cacheHandler:(id)a9
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  if (!v16)
  {
    id v28 = v18;
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"HDSampleAggregateCacheStore.mm", 147, @"Invalid parameter not satisfying: %@", @"interval != nil" object file lineNumber description];

    id v18 = v28;
  }
  id v20 = [(HDProfile *)self->_profile database];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __124__HDSampleAggregateCacheStore_enumerateForInterval_cachedClass_anchorAfterDatabaseScan_nowDate_calendar_error_cacheHandler___block_invoke;
  v29[3] = &unk_1E62F63E0;
  v29[4] = self;
  id v21 = v16;
  id v30 = v21;
  Class v34 = a4;
  id v22 = v17;
  id v31 = v22;
  id v23 = v18;
  id v32 = v23;
  id v24 = v19;
  id v33 = v24;
  uint64_t v35 = a5;
  BOOL v25 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v20 error:a8 block:v29];

  return v25;
}

uint64_t __124__HDSampleAggregateCacheStore_enumerateForInterval_cachedClass_anchorAfterDatabaseScan_nowDate_calendar_error_cacheHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v223 = *MEMORY[0x1E4F143B8];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  id v171 = 0;
  v7 = *(void **)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  id v152 = v3;
  id v153 = v5;
  id v154 = v6;
  id v150 = v7;
  if (v4)
  {
    uint64_t v9 = v4[2];
    uint64_t v10 = v4[3];
    v168 = v4;
    uint64_t v11 = v4[1];
    id v177 = 0;
    id v12 = +[HDCachedQueryMetadataEntity cachedQueryMetadataForQueryIdentifier:v9 sourceEntity:v10 profile:v11 error:&v177];
    id v13 = v177;
    v14 = v13;
    if (v12) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = v13 == 0;
    }
    if (!v15)
    {
      id v19 = v13;
      char v20 = 0;
      id v171 = v19;
      id v155 = v19;
LABEL_87:

      goto LABEL_88;
    }
    if (v12 && ![v12 generationNumber])
    {

      id v12 = 0;
    }
    uint64_t v142 = v8;
    id v144 = v12;
    uint64_t v16 = v4[2];
    uint64_t v17 = v4[3];
    uint64_t v18 = v4[1];
    id v176 = v14;
    v148 = +[HDCachedQueryMetadataEntity lastUpdatedDateForQueryIdentifier:v16 sourceEntity:v17 profile:v18 error:&v176];
    id v155 = v176;

    if (!v148 && v155)
    {
      id v171 = v155;

      char v20 = 0;
LABEL_86:

      id v19 = v144;
      goto LABEL_87;
    }
    id v21 = v12;
    id v140 = v148;
    id v22 = v154;
    id v23 = v153;
    v145 = v21;
    id v24 = [v21 anchorDate];
    if (!v24) {
      goto LABEL_18;
    }
    BOOL v25 = (void *)v4[4];
    v26 = [v21 anchorDate];
    id v27 = v25;
    id v28 = v26;
    if (([v27 isEqual:v28] & 1) == 0)
    {
      [v27 timeIntervalSinceReferenceDate];
      double v34 = v33;
      [v28 timeIntervalSinceReferenceDate];
      double v36 = v35;
      objc_msgSend((id)v168[6], "hk_approximateDuration");
      int v38 = (int)((v34 - v36) / v37);
      uint64_t v39 = v38;
      int v40 = v38 - 2;
      while (1)
      {
        v41 = objc_msgSend((id)v168[6], "hk_dateByAddingInterval:toDate:", v39, v28);
        char v42 = [v41 isEqual:v27];

        if (v42) {
          break;
        }
        if (++v40 > (int)v39)
        {

          goto LABEL_23;
        }
      }
    }

    uint64_t v29 = [v145 intervalComponents];
    id v24 = v29;
    id v30 = (void *)v168[6];
    if (v29 == v30)
    {
    }
    else
    {
      if (!v30)
      {
LABEL_23:
        char v139 = 0;
        char v136 = 0;
LABEL_33:

        goto LABEL_34;
      }
      id v31 = [v145 intervalComponents];
      char v32 = [v31 isEqual:v168[6]];

      if ((v32 & 1) == 0)
      {
LABEL_18:
        char v139 = 0;
        char v136 = 0;
LABEL_34:

        v51 = [v145 anchorDate];
        v52 = v51;
        if (!v51) {
          v52 = (void *)v168[4];
        }
        v138 = v168 + 5;
        objc_storeStrong((id *)v168 + 5, v52);

        char v175 = 0;
        v172[0] = 0;
        v172[1] = v172;
        v172[2] = 0x4812000000;
        v172[3] = __Block_byref_object_copy__25;
        v172[4] = __Block_byref_object_dispose__25;
        v172[5] = &unk_1BD44B655;
        v174[0] = 0;
        v174[1] = 0;
        v173 = v174;
        id v146 = v152;
        id v147 = v145;
        v53 = [v146 startDate];
        [v53 timeIntervalSinceReferenceDate];
        double v55 = v54;

        v56 = [v146 endDate];
        [v56 timeIntervalSinceReferenceDate];
        double v58 = v57;

        [v147 queryStartIndex];
        v60 = v59 = v168;
        if (v60)
        {
          v61 = [v146 startDate];
          BOOL v62 = v61 == 0;

          v59 = v168;
          if (!v62)
          {
            uint64_t v63 = (*(uint64_t (**)(double))(v168[9] + 16))(v55);
            v64 = [v147 queryStartIndex];
            uint64_t v65 = [v64 integerValue];

            v59 = v168;
            if (v63 < v65)
            {
              do
              {
                std::__tree<long>::__emplace_unique_key_args<long,long const&>((uint64_t *)&v173, v63, v63);
                ++v63;
              }
              while (v65 != v63);
            }
          }
        }
        v66 = [v147 queryEndIndex];
        if (v66)
        {
          v67 = [v146 endDate];
          BOOL v68 = v67 == 0;

          v59 = v168;
          if (!v68)
          {
            uint64_t v69 = (*(uint64_t (**)(double))(v168[9] + 16))(v58);
            v70 = [v147 queryEndIndex];
            uint64_t v71 = [v70 integerValue];

            v59 = v168;
            if (v69 > v71)
            {
              do
              {
                ++v71;
                std::__tree<long>::__emplace_unique_key_args<long,long const&>((uint64_t *)&v173, v71, v71);
              }
              while (v69 != v71);
            }
          }
        }
        v72 = (void *)v59[8];
        if (v72)
        {
          [v72 arrayByAddingObject:v59[7]];
        }
        else
        {
          uint64_t v209 = v59[7];
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v209 count:1];
        v73 = };
        uint64_t v187 = 0;
        v188 = &v187;
        uint64_t v189 = 0x4812000000;
        v190 = __Block_byref_object_copy__304;
        v191 = __Block_byref_object_dispose__305;
        v192 = &unk_1BD44B655;
        uint64_t v195 = 0;
        __p = 0;
        v194 = 0;
        long long v183 = 0u;
        long long v184 = 0u;
        long long v185 = 0u;
        long long v186 = 0u;
        obuint64_t j = v73;
        uint64_t v135 = [obj countByEnumeratingWithState:&v183 objects:aBlock count:16];
        if (v135)
        {
          uint64_t v137 = *(void *)v184;
          do
          {
            for (uint64_t i = 0; i != v135; ++i)
            {
              if (*(void *)v184 != v137) {
                objc_enumerationMutation(obj);
              }
              v74 = *(void **)(*((void *)&v183 + 1) + 8 * i);
              uint64_t v160 = [v147 maxAnchor];
              id v75 = v74;
              id v166 = v146;
              id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v198 = 0u;
              long long v199 = 0u;
              long long v196 = 0u;
              long long v197 = 0u;
              id v163 = v76;
              v77 = [v75 sampleTypes];
              id v156 = v77;
              uint64_t v78 = [v77 countByEnumeratingWithState:&v196 objects:v211 count:16];
              if (v78)
              {
                uint64_t v79 = *(void *)v197;
                do
                {
                  for (uint64_t j = 0; j != v78; ++j)
                  {
                    if (*(void *)v197 != v79) {
                      objc_enumerationMutation(v156);
                    }
                    v81 = *(void **)(*((void *)&v196 + 1) + 8 * j);
                    v82 = +[HDSampleEntity entityEnumeratorWithType:v81 profile:v168[1]];
                    uint64_t v83 = [NSNumber numberWithLongLong:v160];
                    [v82 setAnchor:v83];

                    v84 = HDSampleEntityPredicateForDateInterval(v166, v81);
                    v85 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v84, 0);
                    v86 = [v75 samplePredicate];
                    LOBYTE(v83) = v86 == 0;

                    if ((v83 & 1) == 0)
                    {
                      v87 = [v75 samplePredicate];
                      [v85 addObject:v87];
                    }
                    v88 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v85];
                    [v82 setPredicate:v88];

                    v210[0] = v84;
                    v89 = [MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"start_date"];
                    v210[1] = v89;
                    v90 = [MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"end_date"];
                    v210[2] = v90;
                    v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v210 count:3];

                    v92 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v91];
                    [v82 setDeletedObjectsPredicate:v92];

                    [v163 addObject:v82];
                  }
                  v77 = v156;
                  uint64_t v78 = [v156 countByEnumeratingWithState:&v196 objects:v211 count:16];
                }
                while (v78);
              }

              v93 = (void *)[v163 copy];
              long long v179 = 0u;
              long long v180 = 0u;
              long long v181 = 0u;
              long long v182 = 0u;
              id v94 = v93;
              uint64_t v95 = [v94 countByEnumeratingWithState:&v179 objects:v200 count:16];
              if (v95)
              {
                uint64_t v96 = *(void *)v180;
                while (2)
                {
                  for (uint64_t k = 0; k != v95; ++k)
                  {
                    if (*(void *)v180 != v96) {
                      objc_enumerationMutation(v94);
                    }
                    v98 = *(void **)(*((void *)&v179 + 1) + 8 * k);
                    v178[0] = MEMORY[0x1E4F143A8];
                    v178[1] = 3221225472;
                    v178[2] = __126__HDSampleAggregateCacheStore__bucketIndexesWithSampleChanges_forInterval_queryMetadata_deletedObjectWithoutDatesAdded_error___block_invoke;
                    v178[3] = &unk_1E62F6480;
                    *(double *)&v178[6] = v55;
                    *(double *)&v178[7] = v58;
                    v178[5] = &v175;
                    v178[4] = &v187;
                    if (([v98 enumerateSampleTimesIncludingDeletedObjects:1 error:&v171 handler:v178] & 1) == 0)
                    {

                      char v20 = 0;
                      goto LABEL_79;
                    }
                  }
                  uint64_t v95 = [v94 countByEnumeratingWithState:&v179 objects:v200 count:16];
                  if (v95) {
                    continue;
                  }
                  break;
                }
              }
            }
            uint64_t v135 = [obj countByEnumeratingWithState:&v183 objects:aBlock count:16];
          }
          while (v135);
        }

        v99 = (double *)v188[6];
        v100 = (double *)v188[7];
        while (v99 != v100)
        {
          v101 = (void *)MEMORY[0x1C187C0E0]();
          uint64_t v102 = (*(uint64_t (**)(double))(v168[9] + 16))(*v99);
          uint64_t v103 = (*(uint64_t (**)(double))(v168[9] + 16))(v99[1]);
          if (v102 <= v103)
          {
            uint64_t v104 = v103 + 1;
            do
            {
              std::__tree<long>::__emplace_unique_key_args<long,long const&>((uint64_t *)&v173, v102, v102);
              ++v102;
            }
            while (v104 != v102);
          }
          v99 += 2;
        }
        char v20 = 1;
LABEL_79:
        _Block_object_dispose(&v187, 8);
        if (__p)
        {
          v194 = __p;
          operator delete(__p);
        }

        if (v20)
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __101__HDSampleAggregateCacheStore__enumerateForInterval_cachedClass_nowDate_calendar_error_cacheHandler___block_invoke;
          aBlock[3] = &unk_1E62F6408;
          aBlock[4] = v168;
          id v105 = v147;
          id v205 = v105;
          v206 = v172;
          char v207 = v136 ^ 1;
          char v208 = v175;
          v164 = _Block_copy(aBlock);
          v200[0] = MEMORY[0x1E4F143A8];
          v200[1] = 3221225472;
          v200[2] = __101__HDSampleAggregateCacheStore__enumerateForInterval_cachedClass_nowDate_calendar_error_cacheHandler___block_invoke_2;
          v200[3] = &unk_1E62F6430;
          v200[4] = v168;
          id v161 = v105;
          id v201 = v161;
          v202 = v172;
          char v203 = v139;
          v167 = _Block_copy(v200);
          uint64_t v106 = v168[9];
          v107 = [v146 startDate];
          [v107 timeIntervalSinceReferenceDate];
          uint64_t v108 = (*(uint64_t (**)(uint64_t, void))(v106 + 16))(v106, *v138);

          uint64_t v109 = v168[9];
          v110 = [v146 endDate];
          [v110 timeIntervalSinceReferenceDate];
          uint64_t v111 = (*(uint64_t (**)(uint64_t, void))(v109 + 16))(v109, *v138);

          uint64_t v187 = 0;
          v188 = &v187;
          uint64_t v189 = 0x2020000000;
          v190 = (__n128 (*)(__n128 *, __n128 *))v108;
          uint64_t v113 = v168[2];
          uint64_t v112 = v168[3];
          uint64_t v114 = v168[1];
          v211[0] = MEMORY[0x1E4F143A8];
          v211[1] = 3221225472;
          v211[2] = __101__HDSampleAggregateCacheStore__enumerateForInterval_cachedClass_nowDate_calendar_error_cacheHandler___block_invoke_3;
          v211[3] = &unk_1E62F6458;
          uint64_t v218 = v108;
          uint64_t v219 = v111;
          v220 = sel__enumerateForInterval_cachedClass_nowDate_calendar_error_cacheHandler_;
          v211[4] = v168;
          v216 = &v187;
          id v115 = v150;
          id v213 = v115;
          id v116 = v167;
          id v214 = v116;
          uint64_t v221 = v142;
          id v212 = v161;
          id v117 = v164;
          char v222 = v139;
          id v169 = v117;
          id v215 = v117;
          v217 = v172;
          BOOL v118 = +[HDSampleAggregateCacheEntity enumerateCachedDataForQueryIdentifier:v113 sourceEntity:v112 profile:v114 startIndex:v108 endIndex:v111 error:&v171 enumerationHandler:v211];
          if (v188[3] < v111)
          {
            do
            {
              v119 = (void *)MEMORY[0x1C187C0E0](v118);
              uint64_t v120 = (*((uint64_t (**)(id, uint64_t))v116 + 2))(v116, v188[3]);
              (*((void (**)(id, void, uint64_t, uint64_t, void))v115 + 2))(v115, 0, v120, v188[3], 0);
              uint64_t v121 = v188[3] + 1;
              v188[3] = v121;
            }
            while (v121 < v111);
          }

          _Block_object_dispose(&v187, 8);
        }
        _Block_object_dispose(v172, 8);
        std::__tree<long>::destroy(v174[0]);
        goto LABEL_86;
      }
    }
    id v24 = objc_msgSend(v22, "hk_dateBySubtractingDays:fromDate:", *MEMORY[0x1E4F299B8] - 1, v23);
    if (objc_msgSend(v140, "hk_isBeforeOrEqualToDate:", v24)) {
      goto LABEL_26;
    }
    v43 = [v145 buildVersion];
    v165 = [(id)v168[1] daemon];
    v44 = [v165 behavior];
    v45 = [v44 currentOSBuild];
    if (v43 == v45)
    {
    }
    else
    {
      v162 = [(id)v168[1] daemon];
      v46 = [v162 behavior];
      v47 = [v46 currentOSBuild];
      if (!v47)
      {

        goto LABEL_26;
      }
      v158 = v43;
      v159 = [v145 buildVersion];
      v48 = [(id)v168[1] daemon];
      v49 = [v48 behavior];
      v50 = [v49 currentOSBuild];
      char v157 = [v159 isEqualToString:v50];

      if ((v157 & 1) == 0)
      {
LABEL_26:
        char v136 = 0;
        char v139 = 1;
        goto LABEL_33;
      }
    }
    char v139 = 1;
    char v136 = 1;
    goto LABEL_33;
  }
  char v20 = 0;
LABEL_88:

  id v122 = v171;
  v123 = v122;
  if (v122) {
    char v124 = v20;
  }
  else {
    char v124 = 1;
  }
  if (v124)
  {
    v125 = [*(id *)(*(void *)(a1 + 32) + 8) database];
    id v170 = v123;
    v126 = +[HDHealthEntity maxRowIDForPredicate:0 healthDatabase:v125 error:&v170];
    id v127 = v170;

    if (v126) {
      BOOL v128 = 1;
    }
    else {
      BOOL v128 = v127 == 0;
    }
    uint64_t v129 = v128;
    if (v128)
    {
      v130 = v126;
      if (*(void *)(a1 + 80)) {
        **(void **)(a1 + 80) = [v126 longLongValue];
      }
    }
    else
    {
      id v132 = v127;
      v133 = v132;
      if (a3) {
        *a3 = v132;
      }
      else {
        _HKLogDroppedError();
      }

      v130 = v126;
    }
  }
  else
  {
    id v131 = v122;
    v130 = v131;
    if (a3)
    {
      id v127 = v131;
      uint64_t v129 = 0;
      *a3 = v131;
    }
    else
    {
      _HKLogDroppedError();
      uint64_t v129 = 0;
      id v127 = v130;
    }
  }

  return v129;
}

BOOL __101__HDSampleAggregateCacheStore__enumerateForInterval_cachedClass_nowDate_calendar_error_cacheHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = [*(id *)(a1 + 40) queryStartIndex];
  uint64_t v8 = [*(id *)(a1 + 40) queryEndIndex];
  BOOL v9 = -[HDSampleAggregateCacheStore _indexInRangeOfQueryStartIndex:endIndex:bucketIndex:](v6, v7, v8, a2);

  uint64_t v10 = [*(id *)(a1 + 40) generationNumber];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  v14 = *(void **)(v11 + 56);
  id v12 = (void *)(v11 + 56);
  id v13 = v14;
  if (!v14) {
    goto LABEL_11;
  }
  BOOL v15 = v12;
  do
  {
    uint64_t v16 = v13[4];
    BOOL v17 = v16 < a2;
    if (v16 >= a2) {
      uint64_t v18 = v13;
    }
    else {
      uint64_t v18 = v13 + 1;
    }
    if (!v17) {
      BOOL v15 = v13;
    }
    id v13 = (void *)*v18;
  }
  while (*v18);
  if (v15 == v12 || v15[4] > a2) {
LABEL_11:
  }
    BOOL v15 = v12;
  if (v10 < a3 || !v9) {
    return 1;
  }
  BOOL result = 1;
  if (!*(unsigned char *)(a1 + 56) && v15 == v12) {
    return *(unsigned char *)(a1 + 57) != 0;
  }
  return result;
}

- (BOOL)_indexInRangeOfQueryStartIndex:(void *)a3 endIndex:(uint64_t)a4 bucketIndex:
{
  id v7 = a2;
  id v8 = a3;
  BOOL v9 = v8;
  if (a1)
  {
    a1 = 0;
    if (v7)
    {
      if (v8)
      {
        uint64_t v10 = [v7 integerValue];
        uint64_t v11 = [v9 integerValue];
        a1 = v10 <= a4 && v11 >= a4;
      }
    }
  }

  return a1;
}

uint64_t __101__HDSampleAggregateCacheStore__enumerateForInterval_cachedClass_nowDate_calendar_error_cacheHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = [*(id *)(a1 + 40) queryStartIndex];
  uint64_t v6 = [*(id *)(a1 + 40) queryEndIndex];
  BOOL v7 = -[HDSampleAggregateCacheStore _indexInRangeOfQueryStartIndex:endIndex:bucketIndex:](v4, v5, v6, a2);

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void **)(v8 + 56);
  BOOL v9 = (void *)(v8 + 56);
  uint64_t v10 = v11;
  if (!v11) {
    goto LABEL_11;
  }
  id v12 = v9;
  do
  {
    uint64_t v13 = v10[4];
    BOOL v14 = v13 < a2;
    if (v13 >= a2) {
      BOOL v15 = v10;
    }
    else {
      BOOL v15 = v10 + 1;
    }
    if (!v14) {
      id v12 = v10;
    }
    uint64_t v10 = (void *)*v15;
  }
  while (*v15);
  if (v12 == v9 || v12[4] > a2) {
LABEL_11:
  }
    id v12 = v9;
  unsigned int v16 = !v7;
  if (!*(unsigned char *)(a1 + 56)) {
    unsigned int v16 = 1;
  }
  if (v12 == v9) {
    return v16;
  }
  else {
    return 1;
  }
}

uint64_t __101__HDSampleAggregateCacheStore__enumerateForInterval_cachedClass_nowDate_calendar_error_cacheHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (*(void *)(a1 + 88) > a3 || *(void *)(a1 + 96) < a3)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 104), *(void *)(a1 + 32), @"HDSampleAggregateCacheStore.mm", 278, @"Invalid parameter not satisfying: %@", @"bucketIndex >= requestedStartIndex && bucketIndex <= requestedEndIndex" object file lineNumber description];
  }
  while (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) < a3)
  {
    BOOL v7 = (void *)MEMORY[0x1C187C0E0]();
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
    (*(void (**)(uint64_t, void, uint64_t, void, void))(v8 + 16))(v8, 0, v9, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), 0);
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }
  uint64_t v10 = *(void *)(a1 + 112);
  id v30 = 0;
  uint64_t v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:v10 fromData:v5 error:&v30];
  id v12 = v30;
  if (v11)
  {
    int v13 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
    uint64_t v14 = *(void *)(a1 + 48);
    if (v13)
    {
      if (*(unsigned char *)(a1 + 120)) {
        BOOL v15 = v11;
      }
      else {
        BOOL v15 = 0;
      }
      (*(void (**)(uint64_t, void *, uint64_t, uint64_t, void))(v14 + 16))(v14, v15, 1, a3, 0);
      unsigned int v16 = *(void **)(*(void *)(a1 + 80) + 8);
      BOOL v17 = (uint64_t *)v16[7];
      if (v17)
      {
        uint64_t v18 = v16 + 7;
        id v19 = (void *)v16[7];
        do
        {
          uint64_t v20 = v19[4];
          BOOL v21 = v20 < a3;
          if (v20 >= a3) {
            id v22 = v19;
          }
          else {
            id v22 = v19 + 1;
          }
          if (!v21) {
            uint64_t v18 = v19;
          }
          id v19 = (void *)*v22;
        }
        while (*v22);
        if (v18 != v16 + 7 && v18[4] <= a3)
        {
          id v23 = (uint64_t *)v18[1];
          if (v23)
          {
            do
            {
              id v24 = v23;
              id v23 = (uint64_t *)*v23;
            }
            while (v23);
          }
          else
          {
            id v27 = v18;
            do
            {
              id v24 = (uint64_t *)v27[2];
              BOOL v28 = *v24 == (void)v27;
              id v27 = v24;
            }
            while (!v28);
          }
          if ((uint64_t *)v16[6] == v18) {
            v16[6] = v24;
          }
          --v16[8];
          std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v17, v18);
          operator delete(v18);
        }
      }
    }
    else
    {
      (*(void (**)(uint64_t, void *, void, uint64_t, void))(v14 + 16))(v14, v11, 0, a3, 0);
    }
  }
  else
  {
    _HKInitializeLogging();
    BOOL v25 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = v29;
      _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "Failure to decode cache for query %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);

  return 1;
}

BOOL __126__HDSampleAggregateCacheStore__bucketIndexesWithSampleChanges_forInterval_queryMetadata_deletedObjectWithoutDatesAdded_error___block_invoke(uint64_t a1, double a2, double a3)
{
  BOOL v3 = a3 != 2.22507386e-308 && a2 != 2.22507386e-308;
  if (v3)
  {
    double v4 = *(double *)(a1 + 48);
    if (v4 <= a2) {
      double v4 = a2;
    }
    if (*(double *)(a1 + 56) <= a3) {
      a3 = *(double *)(a1 + 56);
    }
    if (v4 <= a3)
    {
      id v5 = (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
      if (v4 >= a3) {
        a3 = v4;
      }
      HKIntervalMask<double>::_insertInterval(v5, v4, a3);
    }
  }
  else
  {
    **(unsigned char **)(a1 + 40) = 1;
  }
  return v3;
}

- (HDQueryDescriptor)queryDescriptor
{
  return self->_queryDescriptor;
}

- (NSArray)invalidationQueryDescriptors
{
  return self->_invalidationQueryDescriptors;
}

- (void)setInvalidationQueryDescriptors:(id)a3
{
}

- (id)timeIntervalToBucketIndex
{
  return self->_timeIntervalToBucketIndex;
}

- (void)setTimeIntervalToBucketIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeIntervalToBucketIndex, 0);
  objc_storeStrong((id *)&self->_invalidationQueryDescriptors, 0);
  objc_storeStrong((id *)&self->_queryDescriptor, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_persistentAnchorDate, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_sourceEntity, 0);
  objc_storeStrong((id *)&self->_cachingIdentifier, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end