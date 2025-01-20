@interface CacheDeleteCacheableForVolume
@end

@implementation CacheDeleteCacheableForVolume

void ___CacheDeleteCacheableForVolume_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 67109378;
    int v17 = 1331;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    _os_log_impl(&dword_1A63D1000, v4, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume() calling remote clientGetState with key:%@", buf, 0x12u);
  }

  v6 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___CacheDeleteCacheableForVolume_block_invoke_331;
  v11[3] = &unk_1E5C517A8;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 56);
  id v12 = v7;
  uint64_t v14 = v8;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v10;
  long long v13 = v10;
  uint64_t v15 = *(void *)(a1 + 64);
  [v3 clientGetState:v7 replyBlock:v11];
}

void ___CacheDeleteCacheableForVolume_block_invoke_331(void *a1, void *a2)
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (const char *)a1[4];
    *(_DWORD *)buf = 67109634;
    int v106 = 1333;
    __int16 v107 = 2112;
    v108 = v5;
    __int16 v109 = 2112;
    uint64_t v110 = (uint64_t)v3;
    _os_log_impl(&dword_1A63D1000, v4, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState: %@ : %@", buf, 0x1Cu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v3 isEqual:MEMORY[0x1E4F1CC38]];
    v6 = NSNumber;
    id v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v7 timeIntervalSinceReferenceDate];
    uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
    uint64_t v9 = *(void *)(a1[7] + 8);
    long long v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    v11 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (const char *)a1[4];
      if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
        long long v13 = "TRUE";
      }
      else {
        long long v13 = "FALSE";
      }
      *(_DWORD *)buf = 67109634;
      int v106 = 1337;
      __int16 v107 = 2112;
      v108 = v12;
      __int16 v109 = 2080;
      uint64_t v110 = (uint64_t)v13;
      _os_log_impl(&dword_1A63D1000, v11, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState: %@ : %s", buf, 0x1Cu);
    }
LABEL_9:

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_22:
    v11 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v40 = (const char *)a1[4];
      if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
        v41 = "TRUE";
      }
      else {
        v41 = "FALSE";
      }
      *(_DWORD *)buf = 67109634;
      int v106 = 1372;
      __int16 v107 = 2112;
      v108 = v40;
      __int16 v109 = 2080;
      uint64_t v110 = (uint64_t)v41;
      _os_log_impl(&dword_1A63D1000, v11, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState reply block for: %@, result: %s", buf, 0x1Cu);
    }
    goto LABEL_27;
  }
  uint64_t v14 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (const char *)a1[4];
    v16 = objc_opt_class();
    *(_DWORD *)buf = 67109890;
    int v106 = 1339;
    __int16 v107 = 2112;
    v108 = v15;
    __int16 v109 = 2112;
    uint64_t v110 = (uint64_t)v16;
    __int16 v111 = 2112;
    id v112 = v3;
    id v17 = v16;
    _os_log_impl(&dword_1A63D1000, v14, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState reply block for: %@, results(%@): %@", buf, 0x26u);
  }
  v11 = [v3 objectForKeyedSubscript:@"CACHE_DELETE_CACHE_ENABLED"];
  __int16 v18 = [v3 objectForKeyedSubscript:@"CACHE_DELETE_CACHEABLE_DURATION"];
  uint64_t v19 = evaluateNumberProperty(v18);
  uint64_t v20 = *(void *)(a1[7] + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  if (v11)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = evaluateBoolProperty(v11);
    v22 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (const char *)a1[4];
      if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
        v24 = "TRUE";
      }
      else {
        v24 = "FALSE";
      }
      *(_DWORD *)buf = 67109634;
      int v106 = 1351;
      __int16 v107 = 2112;
      v108 = v23;
      __int16 v109 = 2080;
      uint64_t v110 = (uint64_t)v24;
      _os_log_impl(&dword_1A63D1000, v22, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState reply block for: %@, result: %s", buf, 0x1Cu);
    }

    if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
    {
      v25 = (void *)a1[5];
      id v26 = v3;
      id v27 = v25;
      v28 = [MEMORY[0x1E4F1C9C8] date];
      [v28 timeIntervalSinceReferenceDate];
      double v30 = v29;

      v31 = [v27 thresholds];
      v32 = [v31 objectForKeyedSubscript:@"DESIRED_DISK_THRESHOLD"];
      v33 = evaluateNumberProperty(v32);

      v34 = [v26 objectForKeyedSubscript:@"CACHE_DELETE_CACHEABLE_DURATION"];
      v35 = evaluateNumberProperty(v34);

      if (v35)
      {
        v36 = [v26 objectForKeyedSubscript:@"CACHE_DELETE_CACHEABLE_DURATION"];
        v37 = evaluateNumberProperty(v36);
        [v37 doubleValue];
        double v39 = v38;
      }
      else
      {
        v36 = CDGetLogHandle((uint64_t)"client");
        double v39 = 7200.0;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          int v106 = 1173;
          __int16 v107 = 2112;
          v108 = (const char *)v26;
          _os_log_error_impl(&dword_1A63D1000, v36, OS_LOG_TYPE_ERROR, "%d validateCacheableStateForVolume: duration not specified, using default. state: %@", buf, 0x12u);
        }
      }

      v45 = [v26 objectForKeyedSubscript:@"CACHE_DELETE_TIMESTAMP"];
      v46 = evaluateNumberProperty(v45);

      if (v46)
      {
        v47 = [v26 objectForKeyedSubscript:@"CACHE_DELETE_TIMESTAMP"];
        v48 = evaluateNumberProperty(v47);
        [v48 doubleValue];
        double v50 = v49;

        double v51 = v30 - v50;
        unint64_t v52 = 0x280000000;
        if (v33)
        {
          uint64_t v53 = [v33 unsignedLongLongValue];
          if ((unint64_t)(2 * v53) < 0x280000000) {
            unint64_t v52 = 2 * v53;
          }
        }
        if (v51 < v39)
        {
          v54 = CDGetLogHandle((uint64_t)"client");
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            v55 = [v27 mountPoint];
            uint64_t v96 = [v27 freespace];
            humanReadableNumber([v27 freespace]);
            v56 = id v99 = v27;
            v57 = humanReadableNumber(v52);
            [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v50];
            v58 = v102 = v33;
            *(_DWORD *)buf = 67110914;
            int v106 = 1199;
            __int16 v107 = 2112;
            v108 = v55;
            __int16 v109 = 2048;
            uint64_t v110 = v96;
            __int16 v111 = 2112;
            id v112 = v56;
            __int16 v113 = 2112;
            v114 = v57;
            __int16 v115 = 2048;
            double v116 = v51;
            __int16 v117 = 2048;
            double v118 = v39;
            __int16 v119 = 2112;
            v120 = v58;
            _os_log_impl(&dword_1A63D1000, v54, OS_LOG_TYPE_DEFAULT, "%d valid cacheable state for %@: freespace is %llu (%@) (%@ required), age is %f seconds (duration is: %f seconds), set at: %@", buf, 0x4Eu);

            v33 = v102;
            id v27 = v99;
          }
LABEL_49:
          int v59 = 1;
          goto LABEL_50;
        }
        unint64_t v60 = [v27 freespace];
        v54 = CDGetLogHandle((uint64_t)"client");
        BOOL v61 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
        if (v60 < v52)
        {
          if (v61)
          {
            v62 = [v27 mountPoint];
            uint64_t v97 = [v27 freespace];
            v100 = humanReadableNumber([v27 freespace]);
            v63 = humanReadableNumber(v52);
            [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v50];
            v64 = v103 = v33;
            *(_DWORD *)buf = 67110914;
            int v106 = 1215;
            __int16 v107 = 2112;
            v108 = v62;
            __int16 v109 = 2048;
            uint64_t v110 = v97;
            __int16 v111 = 2112;
            id v112 = v100;
            __int16 v113 = 2112;
            v114 = v63;
            __int16 v115 = 2048;
            double v116 = v51;
            __int16 v117 = 2048;
            double v118 = v39;
            __int16 v119 = 2112;
            v120 = v64;
            _os_log_impl(&dword_1A63D1000, v54, OS_LOG_TYPE_DEFAULT, "%d valid cacheable state for %@: freespace is %llu (%@) (%@ required), age is %f seconds (duration is: %f seconds), set at: %@", buf, 0x4Eu);

            v33 = v103;
          }
          goto LABEL_49;
        }
        if (v61)
        {
          v93 = [v27 mountPoint];
          uint64_t v98 = [v27 freespace];
          v101 = humanReadableNumber([v27 freespace]);
          v94 = humanReadableNumber(v52);
          [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v50];
          v95 = v104 = v33;
          *(_DWORD *)buf = 67110914;
          int v106 = 1224;
          __int16 v107 = 2112;
          v108 = v93;
          __int16 v109 = 2048;
          uint64_t v110 = v98;
          __int16 v111 = 2112;
          id v112 = v101;
          __int16 v113 = 2112;
          v114 = v94;
          __int16 v115 = 2048;
          double v116 = v51;
          __int16 v117 = 2048;
          double v118 = v39;
          __int16 v119 = 2112;
          v120 = v95;
          _os_log_impl(&dword_1A63D1000, v54, OS_LOG_TYPE_DEFAULT, "%d invalid cacheable state for %@: freespace is %llu (%@) (%@ required), age is %f seconds (duration is: %f seconds), set at: %@", buf, 0x4Eu);

          v33 = v104;
        }
      }
      else
      {
        v54 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          int v106 = 1180;
          __int16 v107 = 2112;
          v108 = (const char *)v26;
          _os_log_error_impl(&dword_1A63D1000, v54, OS_LOG_TYPE_ERROR, "%d validateCacheableStateForVolume: Invalid state, no timestamp: %@", buf, 0x12u);
        }
      }
      int v59 = 0;
LABEL_50:

      v65 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        v66 = " NOT";
        if (v59) {
          v66 = "";
        }
        *(_DWORD *)buf = 67109378;
        int v106 = 1227;
        __int16 v107 = 2080;
        v108 = v66;
        _os_log_impl(&dword_1A63D1000, v65, OS_LOG_TYPE_DEFAULT, "%d validateCacheableStateForVolume: cacheable state is%s valid", buf, 0x12u);
      }

      if ((v59 & 1) == 0)
      {
        v67 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          v68 = (const char *)a1[4];
          if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
            v69 = "TRUE";
          }
          else {
            v69 = "FALSE";
          }
          *(_DWORD *)buf = 67109634;
          int v106 = 1361;
          __int16 v107 = 2112;
          v108 = v68;
          __int16 v109 = 2080;
          uint64_t v110 = (uint64_t)v69;
          _os_log_impl(&dword_1A63D1000, v67, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState reply block for: %@, result: %s", buf, 0x1Cu);
        }

        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
        v70 = (void *)a1[5];
        v71 = NSNumber;
        v72 = [MEMORY[0x1E4F1C9C8] distantFuture];
        [v72 timeIntervalSinceReferenceDate];
        v73 = objc_msgSend(v71, "numberWithDouble:");
        _CacheDeleteSetCacheableForVolume(v70, v73, 1);

        v74 = NSNumber;
        v75 = [MEMORY[0x1E4F1C9C8] distantFuture];
        [v75 timeIntervalSinceReferenceDate];
        uint64_t v76 = objc_msgSend(v74, "numberWithDouble:");
        uint64_t v77 = *(void *)(a1[7] + 8);
        v78 = *(void **)(v77 + 40);
        *(void *)(v77 + 40) = v76;

        v79 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          v80 = (const char *)a1[4];
          if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
            v81 = "TRUE";
          }
          else {
            v81 = "FALSE";
          }
          *(_DWORD *)buf = 67109634;
          int v106 = 1365;
          __int16 v107 = 2112;
          v108 = v80;
          __int16 v109 = 2080;
          uint64_t v110 = (uint64_t)v81;
          _os_log_impl(&dword_1A63D1000, v79, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState reply block for: %@, result: %s", buf, 0x1Cu);
        }
      }
      v82 = NSString;
      [*(id *)(*(void *)(a1[7] + 8) + 40) doubleValue];
      uint64_t v84 = v83;
      v85 = (void *)MEMORY[0x1E4F1C9C8];
      [*(id *)(*(void *)(a1[7] + 8) + 40) doubleValue];
      v86 = objc_msgSend(v85, "dateWithTimeIntervalSinceNow:");
      uint64_t v87 = [v82 stringWithFormat:@"cacheable disabled, will reset in %f seconds at %@", v84, v86];
      uint64_t v88 = *(void *)(a1[8] + 8);
      v89 = *(void **)(v88 + 40);
      *(void *)(v88 + 40) = v87;

      v90 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        v91 = (const char *)a1[4];
        if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
          v92 = "TRUE";
        }
        else {
          v92 = "FALSE";
        }
        *(_DWORD *)buf = 67109634;
        int v106 = 1370;
        __int16 v107 = 2112;
        v108 = v91;
        __int16 v109 = 2080;
        uint64_t v110 = (uint64_t)v92;
        _os_log_impl(&dword_1A63D1000, v90, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState reply block for: %@, result: %s", buf, 0x1Cu);
      }

      goto LABEL_9;
    }
  }
  else
  {
    v42 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = (const char *)a1[4];
      if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
        v44 = "TRUE";
      }
      else {
        v44 = "FALSE";
      }
      *(_DWORD *)buf = 67109634;
      int v106 = 1346;
      __int16 v107 = 2112;
      v108 = v43;
      __int16 v109 = 2080;
      uint64_t v110 = (uint64_t)v44;
      _os_log_impl(&dword_1A63D1000, v42, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume clientGetState reply block for: %@, result: %s", buf, 0x1Cu);
    }

    v11 = 0;
  }
LABEL_27:
}

@end