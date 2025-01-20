@interface HDCloudSyncStateSampleWindowUpdater
+ (BOOL)_fetchPersistedDeletedSamples:(uint64_t)a1 withSampleUUIDs:(void *)a2 profile:(void *)a3 transaction:(void *)a4 timeWindow:(void *)a5 error:(uint64_t)a6;
+ (BOOL)_generateSyncCodableContributors:(void *)a3 fromCollectionByProvenance:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:;
+ (BOOL)_generateSyncCodableDevices:(void *)a3 fromCollectionByProvenance:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:;
+ (BOOL)updateDataWithStateStorage:(id)a3 configuration:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (HDCodableSyncState)_codableSyncStateFromExistingSyncState:(void *)a3 forDomain:(void *)a4 key:;
+ (id)_healthObjectUUIDsFromMergedStateSyncCollection:(void *)a3 configuration:;
+ (uint64_t)_decodeCloudData:(objc_class *)a3 ofClass:(void *)a4 forKey:(void *)a5 dataVersion:(void *)a6 currentSyncVersion:(NSObject *)a7 configuration:(uint64_t *)a8 codableSyncState:codableCollection:error:;
@end

@implementation HDCloudSyncStateSampleWindowUpdater

+ (BOOL)updateDataWithStateStorage:(id)a3 configuration:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  uint64_t v211 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v14 = a7;
  id v15 = v13;
  id v179 = a5;
  id v16 = a6;
  id v204 = 0;
  v17 = [v15 sampleOriginKey];
  LOBYTE(a7) = [v12 data:&v204 forKey:v17 error:a7];
  id v18 = v204;

  if (a7)
  {
    v177 = v16;
    id v203 = 0;
    v19 = [v15 key];
    char v20 = [v12 data:&v203 forKey:v19 error:v14];
    v21 = (uint64_t *)v14;
    v22 = v203;

    if ((v20 & 1) == 0)
    {
      _HKInitializeLogging();
      v26 = [v15 loggingCategory];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v46 = [v15 key];
        uint64_t v47 = *v21;
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v46;
        *(_WORD *)&buf[22] = 2114;
        uint64_t v210 = v47;
        _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch cloud data for key: %{public}@, with error: %{public}@", buf, 0x20u);
      }
      BOOL v39 = 0;
      goto LABEL_27;
    }
    v23 = (objc_class *)objc_opt_class();
    v24 = [v15 sampleOriginKey];
    v201 = 0;
    id v202 = 0;
    uint64_t v25 = +[HDCloudSyncStateSampleWindowUpdater _decodeCloudData:ofClass:forKey:dataVersion:currentSyncVersion:configuration:codableSyncState:codableCollection:error:]((uint64_t)a1, v18, v23, v24, v15, &v202, &v201, v21);
    v26 = v202;
    v27 = v201;

    if (v25 != 2)
    {
      BOOL v39 = v25 == 1;
LABEL_26:

LABEL_27:
      id v16 = v177;
      goto LABEL_28;
    }
    v28 = (objc_class *)objc_opt_class();
    v29 = [v15 key];
    v199 = 0;
    id v200 = 0;
    id v176 = a1;
    v178 = v21;
    uint64_t v30 = +[HDCloudSyncStateSampleWindowUpdater _decodeCloudData:ofClass:forKey:dataVersion:currentSyncVersion:configuration:codableSyncState:codableCollection:error:]((uint64_t)a1, v22, v28, v29, v15, &v200, &v199, v21);
    id v31 = v200;
    unint64_t v173 = v199;

    if (v30 != 2)
    {
      _HKInitializeLogging();
      v41 = [v15 loggingCategory];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v176;
        *(_WORD *)&buf[12] = 1026;
        *(_DWORD *)&buf[14] = v30;
        _os_log_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Decode finished with error?: %{public}i", buf, 0x12u);
      }

      BOOL v39 = v30 == 1;
      goto LABEL_24;
    }
    v171 = v27;
    v172 = v26;
    if (v27)
    {
      v32 = v27;
      id v33 = v179;
      uint64_t v34 = self;
      v35 = [v32 devices];
      if (!+[HDDeviceEntity insertCodableDevices:v35 syncProvenance:0 profile:v33 error:v21])
      {
LABEL_11:

        _HKInitializeLogging();
        v38 = [v15 loggingCategory];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          uint64_t v136 = *v178;
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v176;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v136;
          _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to save sample origins with error: %{public}@", buf, 0x16u);
        }

        BOOL v39 = 0;
        v27 = v171;
        v26 = v172;
LABEL_24:
        v42 = (void *)v173;
LABEL_25:

        goto LABEL_26;
      }
      id v174 = v15;
      v36 = [v32 contributors];
      if (+[HDSyncSampleOriginUtilities ingestContributorSyncObjects:v36 syncStore:0 profile:v33 error:v21] == 1)
      {
        _HKInitializeLogging();
        v37 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          uint64_t v144 = *v178;
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v34;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v144;
          _os_log_error_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to ingest contributor sync object with error: %{public}@", buf, 0x16u);
        }

        id v15 = v174;
        goto LABEL_11;
      }

      id v15 = v174;
    }
    v168 = v12;
    id v169 = v18;
    v167 = v22;
    v170 = v31;
    if (v173)
    {
      long long v197 = 0u;
      long long v198 = 0u;
      long long v195 = 0u;
      long long v196 = 0u;
      v48 = [(id)v173 deletedSampleCollections];
      uint64_t v49 = [v48 countByEnumeratingWithState:&v195 objects:v208 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        v51 = v15;
        int v52 = 0;
        char v53 = 0;
        uint64_t v54 = *(void *)v196;
        do
        {
          for (uint64_t i = 0; i != v50; ++i)
          {
            if (*(void *)v196 != v54) {
              objc_enumerationMutation(v48);
            }
            v56 = *(void **)(*((void *)&v195 + 1) + 8 * i);
            if (!+[HDDataSyncUtilities insertDeletedObjectsFromCodableObjectCollection:syncEntityClass:syncStore:profile:error:](HDDataSyncUtilities, "insertDeletedObjectsFromCodableObjectCollection:syncEntityClass:syncStore:profile:error:", v56, +[HDDataSyncUtilities deletedSampleSyncEntityClass], 0, v179, v178))
            {
              _HKInitializeLogging();
              v57 = [v51 loggingCategory];
              if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              {
                uint64_t v58 = *v178;
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v176;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v58;
                _os_log_error_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to save deleted samples with error: %{public}@", buf, 0x16u);
              }

              char v53 = 1;
            }
            v52 += [v56 deletedSamplesCount];
          }
          uint64_t v50 = [v48 countByEnumeratingWithState:&v195 objects:v208 count:16];
        }
        while (v50);

        id v15 = v51;
        id v18 = v169;
        id v31 = v170;
        if (v53)
        {
          _HKInitializeLogging();
          v59 = [v15 loggingCategory];
          v22 = v167;
          v27 = v171;
          v26 = v172;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            uint64_t v147 = *v178;
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v176;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v147;
            _os_log_error_impl(&dword_1BCB7D000, v59, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to insert a deleted sample with error: %{public}@", buf, 0x16u);
          }

          BOOL v39 = 0;
          goto LABEL_24;
        }
      }
      else
      {

        int v52 = 0;
      }
      _HKInitializeLogging();
      v60 = [v15 loggingCategory];
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v176;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v52;
        _os_log_impl(&dword_1BCB7D000, v60, OS_LOG_TYPE_DEFAULT, "[%{public}@] Persist %i deleted samples for state sync", buf, 0x12u);
      }
      v61 = v15;

      long long v193 = 0u;
      long long v194 = 0u;
      long long v191 = 0u;
      long long v192 = 0u;
      v42 = (void *)v173;
      v62 = [(id)v173 sampleCollections];
      uint64_t v63 = [v62 countByEnumeratingWithState:&v191 objects:v207 count:16];
      if (v63)
      {
        uint64_t v64 = v63;
        int v65 = 0;
        char v66 = 0;
        uint64_t v67 = *(void *)v192;
        do
        {
          for (uint64_t j = 0; j != v64; ++j)
          {
            if (*(void *)v192 != v67) {
              objc_enumerationMutation(v62);
            }
            v69 = *(void **)(*((void *)&v191 + 1) + 8 * j);
            if (!+[HDDataSyncUtilities insertObjectsFromCodableObjectCollection:syncEntityClass:syncStore:profile:error:](HDDataSyncUtilities, "insertObjectsFromCodableObjectCollection:syncEntityClass:syncStore:profile:error:", v69, [v61 syncEntityClass], 0, v179, v178))
            {
              _HKInitializeLogging();
              v70 = [v61 loggingCategory];
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                uint64_t v72 = *v178;
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v176;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v72;
                _os_log_error_impl(&dword_1BCB7D000, v70, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to save samples with error: %{public}@", buf, 0x16u);
              }

              char v66 = 1;
            }
            int v71 = [v69 count];
            v65 += v71 - [v69 deletedSamplesCount];
          }
          uint64_t v64 = [v62 countByEnumeratingWithState:&v191 objects:v207 count:16];
        }
        while (v64);

        id v31 = v170;
        v42 = (void *)v173;
        if (v66)
        {
          _HKInitializeLogging();
          id v15 = v61;
          v73 = [v61 loggingCategory];
          v22 = v167;
          v27 = v171;
          v26 = v172;
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            uint64_t v149 = *v178;
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v176;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v149;
            _os_log_error_impl(&dword_1BCB7D000, v73, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to insert a sample with error: %{public}@", buf, 0x16u);
          }

          BOOL v39 = 0;
          id v18 = v169;
          goto LABEL_25;
        }
      }
      else
      {

        int v65 = 0;
      }
      _HKInitializeLogging();
      v74 = [v61 loggingCategory];
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v176;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v65;
        _os_log_impl(&dword_1BCB7D000, v74, OS_LOG_TYPE_DEFAULT, "[%{public}@] Persist %i sample events for state sync", buf, 0x12u);
      }

      id v75 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v187 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      long long v190 = 0u;
      v76 = [v42 sampleCollections];
      uint64_t v77 = [v76 countByEnumeratingWithState:&v187 objects:v206 count:16];
      id v15 = v61;
      id v18 = v169;
      if (v77)
      {
        uint64_t v78 = v77;
        uint64_t v79 = *(void *)v188;
        do
        {
          for (uint64_t k = 0; k != v78; ++k)
          {
            if (*(void *)v188 != v79) {
              objc_enumerationMutation(v76);
            }
            v81 = [v15 sampleUUIDsFromCodableObjectCollection:*(void *)(*((void *)&v187 + 1) + 8 * k)];
            [v75 addObjectsFromArray:v81];
          }
          uint64_t v78 = [v76 countByEnumeratingWithState:&v187 objects:v206 count:16];
        }
        while (v78);
      }

      id v186 = 0;
      v82 = [v15 timeWindow];
      BOOL v83 = +[HDCloudSyncStateSampleWindowUpdater _fetchPersistedDeletedSamples:withSampleUUIDs:profile:transaction:timeWindow:error:]((uint64_t)HDCloudSyncStateSampleWindowUpdater, &v186, v75, v179, v82, (uint64_t)v178);
      id v84 = v186;

      if (!v83)
      {
        _HKInitializeLogging();
        v100 = [v15 loggingCategory];
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          uint64_t v148 = *v178;
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v176;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v148;
          _os_log_error_impl(&dword_1BCB7D000, v100, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch deleted samples with error: %{public}@", buf, 0x16u);
        }
        BOOL v39 = 0;
        v42 = (void *)v173;
        goto LABEL_145;
      }
      v165 = v84;
    }
    else
    {
      v165 = 0;
    }
    id v175 = v15;
    id v85 = v15;
    os_log_t log = (os_log_t)v179;
    self;
    v86 = [v85 sampleType];
    uint64_t v87 = HDSampleEntityPredicateForDataType(v86);
    v88 = (void *)MEMORY[0x1E4F65D08];
    v89 = HDDataEntityPredicateForType(2);
    v90 = [v88 negatedPredicate:v89];

    v91 = [v85 timeWindow];
    v92 = HDSampleEntityPredicateForDateInterval(v91, v86);

    v93 = (void *)MEMORY[0x1E4F65D08];
    v160 = (void *)v87;
    *(void *)buf = v87;
    *(void *)&buf[8] = v92;
    *(void *)&buf[16] = v90;
    v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];
    v95 = [v93 predicateMatchingAllPredicates:v94];

    v96 = [v85 sampleType];
    v166 = v85;

    uint64_t v97 = objc_msgSend((id)objc_msgSend(v96, "dataObjectClass"), "hd_dataEntityClass");
    v98 = +[HDDataSyncUtilities generateCodableObjectCollectionsForEntityClass:v97 predicate:v95 profile:log error:v178];

    if (v98)
    {
      if ([v98 count]) {
        id v99 = v98;
      }
      else {
        id v99 = 0;
      }
    }
    else
    {
      id v99 = 0;
    }

    id v101 = v99;
    id v75 = v101;
    if (!v98)
    {
      _HKInitializeLogging();
      v100 = [v166 loggingCategory];
      v42 = (void *)v173;
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      {
        uint64_t v146 = *v178;
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v176;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v146;
        _os_log_error_impl(&dword_1BCB7D000, v100, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch samples with error: %{public}@", buf, 0x16u);
      }
      BOOL v39 = 0;
      id v15 = v175;
      id v18 = v169;
      id v84 = v165;
      goto LABEL_145;
    }
    v102 = [v101 allValues];
    v162 = [v165 allValues];
    long long v182 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    v100 = v102;
    uint64_t v103 = [v100 countByEnumeratingWithState:&v182 objects:v205 count:16];
    if (v103)
    {
      uint64_t v104 = v103;
      int v105 = 0;
      int v106 = 0;
      uint64_t v107 = *(void *)v183;
      do
      {
        for (uint64_t m = 0; m != v104; ++m)
        {
          if (*(void *)v183 != v107) {
            objc_enumerationMutation(v100);
          }
          v109 = *(void **)(*((void *)&v182 + 1) + 8 * m);
          int v110 = [v109 deletedSamplesCount];
          v105 += [v109 count] - v110;
          v106 += v110;
        }
        uint64_t v104 = [v100 countByEnumeratingWithState:&v182 objects:v205 count:16];
      }
      while (v104);
    }
    else
    {
      int v105 = 0;
      int v106 = 0;
    }

    _HKInitializeLogging();
    v111 = [v166 loggingCategory];
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v176;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v105;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v106;
      _os_log_impl(&dword_1BCB7D000, v111, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetch %i local samples and %i deleted samples for state sync", buf, 0x18u);
    }

    v42 = (void *)v173;
    if (v100)
    {
      unint64_t v112 = objc_alloc_init(HDCodableStateSyncCollection);
      id v113 = [v100 mutableCopy];
      [(id)v112 setSampleCollections:v113];

      id v18 = v169;
      if (!v162)
      {
LABEL_107:
        v115 = +[HDCloudSyncStateSampleWindowUpdater _healthObjectUUIDsFromMergedStateSyncCollection:configuration:]((uint64_t)v176, (void *)v173, v166);
        v161 = (HDCodableStateSyncCollection *)v112;
        +[HDCloudSyncStateSampleWindowUpdater _healthObjectUUIDsFromMergedStateSyncCollection:configuration:]((uint64_t)v176, (void *)v112, v166);
        v159 = v157 = v115;
        char v116 = objc_msgSend(v115, "isEqualToSet:");
        BOOL v117 = (v173 | v112) == 0;
        _HKInitializeLogging();
        v118 = [v166 loggingCategory];
        BOOL v119 = os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT);
        if ((v116 & 1) != 0 || v117)
        {
          id v84 = v165;
          v158 = v118;
          if (v119)
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v176;
            _os_log_impl(&dword_1BCB7D000, v118, OS_LOG_TYPE_DEFAULT, "[%{public}@] Steady state reached for samples.", buf, 0xCu);
          }
          BOOL v39 = 1;
          id v12 = v168;
          id v15 = v175;
          v130 = v161;
          v134 = v157;
          goto LABEL_144;
        }
        id v84 = v165;
        if (v119)
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v176;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v105;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v106;
          _os_log_impl(&dword_1BCB7D000, v118, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %i samples and %i deleted samples in cloud state for state sync", buf, 0x18u);
        }

        v120 = [v166 domain];
        v121 = [v166 key];
        v122 = +[HDCloudSyncStateSampleWindowUpdater _codableSyncStateFromExistingSyncState:forDomain:key:]((uint64_t)v176, v170, v120, v121);

        [v122 setVersionRange:0x100000001];
        [v122 setCodableObject:v161 version:1 profile:log];
        v158 = v122;
        v123 = [v122 data];
        v124 = [v166 key];
        id v12 = v168;
        v125 = v178;
        char v126 = [v168 setData:v123 forKey:v124 error:v178];

        if ((v126 & 1) == 0)
        {
          _HKInitializeLogging();
          v135 = [v166 loggingCategory];
          id v15 = v175;
          p_super = v135;
          if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
          {
            v151 = objc_msgSend(v166, "key", v135);
            uint64_t v152 = *v178;
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v176;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v151;
            *(_WORD *)&buf[22] = 2114;
            uint64_t v210 = v152;
            _os_log_error_impl(&dword_1BCB7D000, v135, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set merged data for key: %{public}@, with error: %{public}@", buf, 0x20u);
          }
          BOOL v39 = 0;
          v42 = (void *)v173;
          v130 = v161;
          v134 = v157;
          goto LABEL_143;
        }
        id v15 = v175;
        if (v75)
        {
          id v181 = 0;
          BOOL v127 = +[HDCloudSyncStateSampleWindowUpdater _generateSyncCodableDevices:fromCollectionByProvenance:profile:transaction:error:]((uint64_t)HDCloudSyncStateSampleWindowUpdater, &v181, v75, log, v177, (uint64_t)v178);
          p_super = v181;
          if (!v127)
          {
            _HKInitializeLogging();
            loga = [v166 loggingCategory];
            v42 = (void *)v173;
            v130 = v161;
            if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
            {
              uint64_t v153 = *v178;
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v176;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v153;
              _os_log_error_impl(&dword_1BCB7D000, loga, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to generate merged devices with error: %{public}@", buf, 0x16u);
            }
            BOOL v39 = 0;
            goto LABEL_131;
          }
          id v180 = 0;
          BOOL v39 = +[HDCloudSyncStateSampleWindowUpdater _generateSyncCodableContributors:fromCollectionByProvenance:profile:transaction:error:]((uint64_t)HDCloudSyncStateSampleWindowUpdater, &v180, v75, log, v177, (uint64_t)v178);
          v128 = v180;
          v129 = v128;
          v130 = v161;
          if (v39)
          {
            uint64_t v131 = objc_alloc_init(HDCodableSampleOriginCollection);
            [(id)v131 setDevices:p_super];
            [(id)v131 setContributors:v129];
            int v132 = [v171 isEqual:v131];
            if ((unint64_t)v171 | v131 && !v132)
            {

              v133 = (HDCodableSampleOriginCollection *)v131;
              id v12 = v168;
              v125 = v178;
LABEL_126:
              v137 = objc_msgSend(v166, "domain", p_super);
              v138 = [v166 sampleOriginKey];
              v139 = +[HDCloudSyncStateSampleWindowUpdater _codableSyncStateFromExistingSyncState:forDomain:key:]((uint64_t)v176, v172, v137, v138);

              [v139 setVersionRange:0x100000001];
              BOOL v39 = 1;
              p_super = &v133->super.super;
              [v139 setCodableObject:v133 version:1 profile:log];
              loga = v139;
              v140 = [v139 data];
              v141 = [v166 sampleOriginKey];
              char v142 = [v12 setData:v140 forKey:v141 error:v125];

              if ((v142 & 1) == 0)
              {
                _HKInitializeLogging();
                v143 = [v166 loggingCategory];
                v42 = (void *)v173;
                v130 = v161;
                id v84 = v165;
                if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
                {
                  v154 = [v166 sampleOriginKey];
                  uint64_t v155 = *v125;
                  *(_DWORD *)buf = 138543874;
                  *(void *)&buf[4] = v176;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v154;
                  *(_WORD *)&buf[22] = 2114;
                  uint64_t v210 = v155;
                  _os_log_error_impl(&dword_1BCB7D000, v143, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set merged data for key: %{public}@, with error: %{public}@", buf, 0x20u);

                  v42 = (void *)v173;
                }

                BOOL v39 = 0;
                id v15 = v175;
                goto LABEL_135;
              }
              v42 = (void *)v173;
              id v15 = v175;
              v130 = v161;
LABEL_131:
              id v84 = v165;
LABEL_135:
              v134 = v157;
LABEL_142:

LABEL_143:
LABEL_144:

LABEL_145:
              v22 = v167;
              v27 = v171;
              v26 = v172;
              id v31 = v170;
              goto LABEL_25;
            }
            loga = v129;
            _HKInitializeLogging();
            v150 = [v166 loggingCategory];
            id v84 = v165;
            if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v176;
              _os_log_impl(&dword_1BCB7D000, v150, OS_LOG_TYPE_DEFAULT, "[%{public}@] Steady state reached for sample origin.", buf, 0xCu);
            }

            id v12 = v168;
            id v15 = v175;
          }
          else
          {
            loga = v128;
            _HKInitializeLogging();
            uint64_t v131 = [v166 loggingCategory];
            id v84 = v165;
            if (os_log_type_enabled((os_log_t)v131, OS_LOG_TYPE_ERROR))
            {
              uint64_t v145 = *v178;
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v176;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v145;
              _os_log_error_impl(&dword_1BCB7D000, (os_log_t)v131, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to generate merged contributors with error: %{public}@", buf, 0x16u);
            }
          }
          v134 = v157;

          v42 = (void *)v173;
          goto LABEL_142;
        }
        v133 = 0;
        goto LABEL_126;
      }
      if (v112)
      {
LABEL_106:
        v114 = (void *)[v162 mutableCopy];
        [(id)v112 setDeletedSampleCollections:v114];

        goto LABEL_107;
      }
    }
    else
    {
      id v18 = v169;
      if (!v162)
      {
        unint64_t v112 = 0;
        goto LABEL_107;
      }
    }
    unint64_t v112 = objc_alloc_init(HDCodableStateSyncCollection);
    goto LABEL_106;
  }
  v40 = v14;
  _HKInitializeLogging();
  v22 = [v15 loggingCategory];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v44 = [v15 sampleOriginKey];
    id v45 = *v40;
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v44;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v210 = (uint64_t)v45;
    _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch cloud data for key: %{public}@, with error: %{public}@", buf, 0x20u);
  }
  BOOL v39 = 0;
LABEL_28:

  return v39;
}

+ (uint64_t)_decodeCloudData:(objc_class *)a3 ofClass:(void *)a4 forKey:(void *)a5 dataVersion:(void *)a6 currentSyncVersion:(NSObject *)a7 configuration:(uint64_t *)a8 codableSyncState:codableCollection:error:
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a4;
  id v13 = a2;
  uint64_t v14 = self;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  uint64_t v18 = self;
  if (!v15)
  {
    uint64_t v30 = 0;
    uint64_t v31 = 1;
    goto LABEL_26;
  }
  uint64_t v19 = v18;
  char v20 = [[HDCodableSyncState alloc] initWithData:v15];
  v21 = v20;
  if (v20)
  {
    v22 = [(HDCodableSyncState *)v20 domain];
    uint64_t v23 = [v17 domain];
    v60 = a3;
    uint64_t v61 = v14;
    if (v22 == (void *)v23)
    {
    }
    else
    {
      v24 = (void *)v23;
      uint64_t v59 = v19;
      uint64_t v25 = [v17 domain];
      if (!v25)
      {

LABEL_15:
        v38 = (void *)MEMORY[0x1E4F28C58];
        BOOL v39 = [(HDCodableSyncState *)v21 key];
        v40 = [v17 domain];
        objc_msgSend(v38, "hk_assignError:code:format:", a8, 129, @"Deserialized domain %@ does not match expected value %@", v39, v40);

        uint64_t v30 = 0;
        uint64_t v31 = 0;
        a3 = v60;
        uint64_t v14 = v61;
        goto LABEL_25;
      }
      v26 = (void *)v25;
      v27 = [(HDCodableSyncState *)v21 domain];
      v28 = [v17 domain];
      char v29 = [v27 isEqualToString:v28];

      uint64_t v19 = v59;
      if ((v29 & 1) == 0) {
        goto LABEL_15;
      }
    }
    id v34 = [(HDCodableSyncState *)v21 key];
    if (v34 == v16)
    {

      a3 = v60;
    }
    else
    {
      v35 = v34;
      if (!v16)
      {

        a3 = v60;
LABEL_23:
        v44 = (void *)MEMORY[0x1E4F28C58];
        id v45 = [(HDCodableSyncState *)v21 key];
        v46 = [v17 domain];
        objc_msgSend(v44, "hk_assignError:code:format:", a8, 129, @"Deserialized key %@ does not match %@ for domain %@", v45, v16, v46);

        uint64_t v30 = 0;
        uint64_t v31 = 0;
LABEL_24:
        uint64_t v14 = v61;
        goto LABEL_25;
      }
      v36 = [(HDCodableSyncState *)v21 key];
      char v37 = [v36 isEqualToString:v16];

      a3 = v60;
      if ((v37 & 1) == 0) {
        goto LABEL_23;
      }
    }
    if ((int)[(HDCodableSyncState *)v21 versionRange] < 2)
    {
      uint64_t v30 = v21;
      uint64_t v31 = 1;
    }
    else
    {
      _HKInitializeLogging();
      v41 = [v17 loggingCategory];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        int v42 = (int)[(HDCodableSyncState *)v21 versionRange];
        v43 = [v17 domain];
        *(_DWORD *)buf = 138544386;
        uint64_t v67 = v19;
        __int16 v68 = 1024;
        *(_DWORD *)v69 = v42;
        *(_WORD *)&v69[4] = 2048;
        *(void *)&v69[6] = 1;
        *(_WORD *)&v69[14] = 2114;
        *(void *)&v69[16] = v43;
        __int16 v70 = 2114;
        id v71 = v16;
        _os_log_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Codable state has minimum version %d but current version for OS is %ld for (%{public}@, %{public}@) ", buf, 0x30u);
      }
      uint64_t v30 = 0;
      uint64_t v31 = 2;
    }
    goto LABEL_24;
  }
  v32 = (void *)MEMORY[0x1E4F28C58];
  id v33 = [v17 domain];
  objc_msgSend(v32, "hk_assignError:code:format:", a8, 129, @"Unable to decode state sync data for domain %@ key %@", v33, v16);

  uint64_t v30 = 0;
  uint64_t v31 = 0;
LABEL_25:

LABEL_26:
  uint64_t v47 = v30;
  v48 = v47;
  if (v31 == 2)
  {
    _HKInitializeLogging();
    uint64_t v49 = [v17 loggingCategory];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      int v52 = NSStringFromClass(a3);
      *(_DWORD *)buf = 138543618;
      uint64_t v67 = v14;
      __int16 v68 = 2114;
      *(void *)v69 = v52;
      _os_log_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Decode finished without error but could not decode sync state codable of class: %{public}@.", buf, 0x16u);
    }
    uint64_t v53 = 1;
  }
  else
  {
    if (!v31)
    {
      _HKInitializeLogging();
      uint64_t v49 = [v17 loggingCategory];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        uint64_t v50 = NSStringFromClass(a3);
        uint64_t v51 = *a8;
        *(_DWORD *)buf = 138543874;
        uint64_t v67 = v14;
        __int16 v68 = 2114;
        *(void *)v69 = v50;
        *(_WORD *)&v69[8] = 2114;
        *(void *)&v69[10] = v51;
        _os_log_error_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to decode cloud sync state codable of class: %{public}@, with error: %{public}@", buf, 0x20u);
      }
LABEL_38:
      uint64_t v53 = 0;
      goto LABEL_45;
    }
    if (v47)
    {
      id v65 = 0;
      BOOL v54 = [(HDCodableSyncState *)v47 decodedObjectOfClass:a3 version:1 decodedObject:&v65 error:a8];
      uint64_t v49 = v65;
      if (!v54)
      {
        _HKInitializeLogging();
        v55 = [v17 loggingCategory];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          v57 = NSStringFromClass(a3);
          uint64_t v58 = *a8;
          *(_DWORD *)buf = 138543874;
          uint64_t v67 = v14;
          __int16 v68 = 2114;
          *(void *)v69 = v57;
          *(_WORD *)&v69[8] = 2114;
          *(void *)&v69[10] = v58;
          _os_log_error_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to decode codable cloud collection of class: %{public}@, with error: %{public}@", buf, 0x20u);
        }
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v49 = 0;
    }
    if (a6) {
      *a6 = v48;
    }
    if (a7)
    {
      uint64_t v49 = v49;
      *a7 = v49;
    }
    uint64_t v53 = 2;
  }
LABEL_45:

  return v53;
}

+ (BOOL)_fetchPersistedDeletedSamples:(uint64_t)a1 withSampleUUIDs:(void *)a2 profile:(void *)a3 transaction:(void *)a4 timeWindow:(void *)a5 error:(uint64_t)a6
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  self;
  if ([v9 count])
  {
    uint64_t v12 = HDDataEntityPredicateForType(2);
    id v13 = HDDataEntityPredicateForDataUUIDs(v9);
    uint64_t v14 = [v11 endDate];
    id v15 = HDSampleEntityPredicateForStartDate(3);

    id v16 = [v11 startDate];
    id v17 = HDSampleEntityPredicateForEndDate(6);

    uint64_t v25 = (void *)v12;
    v27[0] = v12;
    v27[1] = v13;
    v27[2] = v15;
    v27[3] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
    uint64_t v19 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v18];
    char v20 = +[HDDataSyncUtilities generateCodableObjectCollectionsForEntityClass:predicate:profile:error:](HDDataSyncUtilities, "generateCodableObjectCollectionsForEntityClass:predicate:profile:error:", +[HDDataSyncUtilities deletedSampleEntityClass], v19, v10, a6);
    v21 = v20;
    BOOL v22 = v20 != 0;
    if (v20)
    {
      uint64_t v23 = [v20 count];
      if (a2)
      {
        if (v23) {
          *a2 = v21;
        }
      }
    }
  }
  else
  {
    BOOL v22 = 1;
  }

  return v22;
}

+ (id)_healthObjectUUIDsFromMergedStateSyncCollection:(void *)a3 configuration:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v7 = [v4 sampleCollections];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [v5 sampleUUIDsFromCodableObjectCollection:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        [v6 addObjectsFromArray:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (HDCodableSyncState)_codableSyncStateFromExistingSyncState:(void *)a3 forDomain:(void *)a4 key:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  if (v6)
  {
    uint64_t v9 = (HDCodableSyncState *)v6;
  }
  else
  {
    uint64_t v9 = objc_alloc_init(HDCodableSyncState);
    [(HDCodableSyncState *)v9 setDomain:v7];
    [(HDCodableSyncState *)v9 setKey:v8];
  }

  return v9;
}

+ (BOOL)_generateSyncCodableDevices:(void *)a3 fromCollectionByProvenance:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  self;
  id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    while (2)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [*(id *)(*((void *)&v27 + 1) + 8 * v18) deviceID];
        if (!v19)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 3, @"DataOriginProvenance's deviceID is unexpectedly nil.");
          BOOL v22 = 0;
          v24 = v14;
          goto LABEL_14;
        }
        char v20 = (void *)v19;
        [v13 addObject:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  v21 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:*MEMORY[0x1E4F65C70] values:v13];
  id v26 = 0;
  BOOL v22 = +[HDSyncSampleOriginUtilities generateStateSyncCodableDevices:&v26 predicate:v21 profile:v11 transaction:v12 error:a6];
  id v23 = v26;
  v24 = v23;
  if (a2 && v22) {
    *a2 = v23;
  }

LABEL_14:
  return v22;
}

+ (BOOL)_generateSyncCodableContributors:(void *)a3 fromCollectionByProvenance:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:
{
  uint64_t v24 = a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v27 = a4;
  id v25 = a5;
  uint64_t v9 = self;
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    uint64_t v15 = (os_log_t *)MEMORY[0x1E4F29FA8];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "contributorID", v24);
        if (v17)
        {
          [v10 addObject:v17];
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v18 = *v15;
          if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v34 = v9;
            _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Contributor persistentID is nil", buf, 0xCu);
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v13);
  }

  uint64_t v19 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:*MEMORY[0x1E4F65C70] values:v10];
  id v28 = 0;
  BOOL v20 = +[HDSyncSampleOriginUtilities generateStateSyncCodableContributors:&v28 predicate:v19 profile:v27 transaction:v25 error:v24];
  id v21 = v28;
  BOOL v22 = v21;
  if (a2 && v20) {
    *a2 = v21;
  }

  return v20;
}

@end