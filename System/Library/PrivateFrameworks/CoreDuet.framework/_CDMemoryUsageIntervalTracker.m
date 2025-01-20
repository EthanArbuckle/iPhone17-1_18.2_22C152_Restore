@interface _CDMemoryUsageIntervalTracker
+ (id)sharedInstance;
- (_CDMemoryUsageIntervalTracker)init;
- (void)beginInterval:(uint64_t)a1;
- (void)endInterval:(uint64_t)a1;
@end

@implementation _CDMemoryUsageIntervalTracker

- (void)beginInterval:(uint64_t)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (a1)
  {
    context = (void *)MEMORY[0x192FB2F20]();
    lock = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    unint64_t v4 = (*(void *)(a1 + 16) + 1) % 0x7FFFFFFFFFFFFFFEuLL;
    if (v4 <= 1) {
      unint64_t v4 = 1;
    }
    *(void *)(a1 + 16) = v4;
    if (v3) {
      v3[10] = v4;
    }
    unint64_t v36 = 0;
    get_memory_usage(v3 + 1, &v36, v3 + 2, 1);
    v31 = [MEMORY[0x1E4F28E60] indexSet];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v5 = [*(id *)(a1 + 32) allObjects];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v49 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v33;
      v29 = v5;
      v30 = v3;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v33 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
          if (v9)
          {
            __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX) - v9[7];
            if (v10 > *(void *)(a1 + 40))
            {
              v11 = +[_CDLogging instrumentationChannel];
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                uint64_t v14 = v9[10];
                v15 = [v9 name];
                v16 = [v9 client];
                *(_DWORD *)buf = 134218754;
                uint64_t v38 = v14;
                __int16 v39 = 2112;
                v40 = v15;
                __int16 v41 = 2112;
                v42 = v16;
                __int16 v43 = 2048;
                unint64_t v44 = v10 / 0x3B9ACA00;
                _os_log_error_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_ERROR, "[error] id=%lu name=%@ client=%@ tracking stopped due to age %llus", buf, 0x2Au);

                v5 = v29;
                v3 = v30;
              }
              v9[6] = 2;
              [*(id *)(a1 + 32) removeObject:v9];
              goto LABEL_21;
            }
            unint64_t v12 = v36;
            uint64_t v13 = v9[10];
            if (v9[11] > v36) {
              unint64_t v12 = v9[11];
            }
            v9[11] = v12;
          }
          else
          {
            uint64_t v13 = 0;
          }
          objc_msgSend(v31, "addIndex:", v13, context, lock);
          if (v3) {
            *((unsigned char *)v3 + 64) = 1;
          }
LABEL_21:
          ++v8;
        }
        while (v6 != v8);
        uint64_t v17 = [v5 countByEnumeratingWithState:&v32 objects:v49 count:16];
        uint64_t v6 = v17;
      }
      while (v17);
    }

    [*(id *)(a1 + 32) addObject:v3];
    v18 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      if (v3) {
        uint64_t v19 = v3[10];
      }
      else {
        uint64_t v19 = 0;
      }
      v20 = objc_msgSend(v3, "name", context);
      v21 = [v3 client];
      if (v3)
      {
        double v22 = (double)(unint64_t)v3[1] * 0.0009765625 * 0.0009765625;
        BOOL v23 = *((unsigned char *)v3 + 64) != 0;
      }
      else
      {
        BOOL v23 = 0;
        double v22 = 0.0;
      }
      uint64_t v24 = objc_msgSend(v31, "_cd_commaSeparatedIndexes");
      v25 = (void *)v24;
      v26 = "";
      *(_DWORD *)buf = 134219266;
      uint64_t v38 = v19;
      __int16 v39 = 2112;
      if (v23) {
        v26 = "*, concurrent: ";
      }
      v40 = v20;
      __int16 v41 = 2112;
      v42 = v21;
      __int16 v43 = 2048;
      unint64_t v44 = *(void *)&v22;
      __int16 v45 = 2082;
      v46 = v26;
      __int16 v47 = 2114;
      uint64_t v48 = v24;
      _os_log_debug_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_DEBUG, "[begin] id=%ld name=%@ client=%@ (start: %.1fMB%{public}s%{public}@)", buf, 0x3Eu);
    }
    os_unfair_lock_unlock(lock);
  }
}

- (void)endInterval:(uint64_t)a1
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (a1)
  {
    unint64_t v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    unint64_t v50 = 0;
    get_memory_usage(v3 + 3, &v50, v3 + 4, 0);
    if (v3)
    {
      unint64_t v5 = v3[11];
      unint64_t v6 = v50;
      if (v5 >= v50)
      {
        unint64_t v50 = v3[11];
        uint64_t v7 = "*";
        unint64_t v6 = v5;
      }
      else
      {
        uint64_t v7 = "";
      }
      v3[12] = v6;
    }
    else if (v50)
    {
      uint64_t v7 = "";
    }
    else
    {
      unint64_t v50 = 0;
      uint64_t v7 = "*";
    }
    [*(id *)(a1 + 32) removeObject:v3];
    uint64_t v8 = [MEMORY[0x1E4F28E60] indexSet];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v75 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v47;
      unint64_t v12 = "*";
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v47 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v46 + 1) + 8 * v13);
          if (v14)
          {
            unint64_t v15 = v50;
            uint64_t v16 = *(void *)(v14 + 80);
            if (*(void *)(v14 + 88) > v50) {
              unint64_t v15 = *(void *)(v14 + 88);
            }
            *(void *)(v14 + 88) = v15;
          }
          else
          {
            uint64_t v16 = 0;
          }
          [v8 addIndex:v16];
          ++v13;
        }
        while (v10 != v13);
        uint64_t v17 = [v9 countByEnumeratingWithState:&v46 objects:v75 count:16];
        uint64_t v10 = v17;
      }
      while (v17);
    }
    else
    {
      unint64_t v12 = "";
    }

    if (v3) {
      unint64_t v18 = v3[1];
    }
    else {
      unint64_t v18 = 0;
    }
    unint64_t v19 = *(void *)(a1 + 24);
    double v20 = (double)v19;
    double v21 = (double)v19 * 0.9;
    BOOL v22 = v21 < (double)v50 && v21 > (double)v18;
    BOOL v24 = v18 < v19 && v50 > v19;
    v25 = +[_CDLogging instrumentationChannel];
    v26 = v25;
    if (v22) {
      char v27 = 16;
    }
    else {
      char v27 = 2;
    }
    if (v24) {
      os_log_type_t v28 = OS_LOG_TYPE_FAULT;
    }
    else {
      os_log_type_t v28 = v27;
    }
    if (os_log_type_enabled(v25, v28))
    {
      unint64_t v44 = v7;
      __int16 v45 = v4;
      __int16 v43 = v12;
      if (v3) {
        uint64_t v41 = v3[10];
      }
      else {
        uint64_t v41 = 0;
      }
      v42 = [v3 name];
      v40 = [v3 client];
      if (v24)
      {
        v29 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"error: operation peaked over limit of %.0fMB ", v20 * 0.0009765625 * 0.0009765625);
        int v38 = 0;
      }
      else if (v22)
      {
        v29 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"warning: operation peaked near limit of %.0fMB ", v20 * 0.0009765625 * 0.0009765625);
        int v38 = 1;
      }
      else
      {
        int v38 = 0;
        v29 = &stru_1EDDE58B8;
      }
      if (v3)
      {
        if (*((unsigned char *)v3 + 64)) {
          v31 = "*";
        }
        else {
          v31 = "";
        }
        v30.i64[1] = v3[1];
        v30.i64[0] = v3[12];
        float64x2_t v32 = (float64x2_t)vdupq_n_s64(0x3F50000000000000uLL);
        float64x2_t v39 = vmulq_f64(vmulq_f64(vcvtq_f64_u64(v30), v32), v32);
        double v33 = (double)(unint64_t)v3[3] * 0.0009765625 * 0.0009765625;
      }
      else
      {
        float64x2_t v39 = 0u;
        double v33 = 0.0;
        v31 = "";
      }
      uint64_t v34 = [v8 count];
      uint64_t v35 = objc_msgSend(v8, "_cd_commaSeparatedIndexes");
      unint64_t v36 = (void *)v35;
      *(_DWORD *)buf = 134220802;
      v37 = ", concurrent: ";
      uint64_t v52 = v41;
      if (!v34) {
        v37 = "";
      }
      __int16 v53 = 2112;
      v54 = v42;
      __int16 v55 = 2112;
      v56 = v40;
      __int16 v57 = 2114;
      v58 = v29;
      __int16 v59 = 2048;
      float64_t v60 = v39.f64[1];
      __int16 v61 = 2082;
      v62 = v31;
      __int16 v63 = 2048;
      float64_t v64 = v39.f64[0];
      __int16 v65 = 2082;
      v66 = v44;
      __int16 v67 = 2048;
      double v68 = v33;
      __int16 v69 = 2082;
      v70 = v43;
      __int16 v71 = 2082;
      v72 = v37;
      __int16 v73 = 2114;
      uint64_t v74 = v35;
      _os_log_impl(&dword_18ECEB000, v26, v28, "[end]   id=%lu name=%@ client=%@ %{public}@(start: %.1fMB%{public}s, peak: %.1fMB%{public}s, end: %.1fMB%{public}s%{public}s%{public}@)", buf, 0x7Au);

      unint64_t v4 = v45;
      if (v38) {

      }
      if (v24) {
    }
      }

    os_unfair_lock_unlock(v4);
  }
}

+ (id)sharedInstance
{
  self;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)sharedInstance_instance;
  return v0;
}

- (_CDMemoryUsageIntervalTracker)init
{
  v9.receiver = self;
  v9.super_class = (Class)_CDMemoryUsageIntervalTracker;
  v2 = [(_CDMemoryUsageIntervalTracker *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    if (active_memory_limit_onceToken != -1) {
      dispatch_once(&active_memory_limit_onceToken, &__block_literal_global_1);
    }
    int v4 = active_memory_limit_limit;
    v3->_activeMemoryLimit = active_memory_limit_limit;
    if (!v4)
    {
      uint64_t v7 = 0;
      goto LABEL_8;
    }
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    activeIntervals = v3->_activeIntervals;
    v3->_activeIntervals = (NSHashTable *)v5;

    v3->_intervalTimeout = 60000000000;
  }
  uint64_t v7 = v3;
LABEL_8:

  return v7;
}

- (void).cxx_destruct
{
}

@end