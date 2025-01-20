@interface HRBrandImageManagerInvalidateOldImagesOperation
- (void)main;
@end

@implementation HRBrandImageManagerInvalidateOldImagesOperation

- (void)main
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 firstObject];

  v4 = [v3 stringByAppendingPathComponent:@"BrandLogos"];

  v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-259200.0];
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E4F29F38];
  v47 = v5;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543874;
    v52 = v9;
    __int16 v53 = 2112;
    uint64_t v54 = (uint64_t)v10;
    __int16 v55 = 2114;
    id v56 = v47;
    _os_log_impl(&dword_1C21A1000, v7, OS_LOG_TYPE_INFO, "%{public}@: removing old brand logos: %@ with cutoff date %{public}@", buf, 0x20u);

    v5 = v47;
  }
  v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  v12 = [v11 enumeratorAtPath:v4];

  v48 = v12;
  uint64_t v13 = [v12 nextObject];
  if (v13)
  {
    v14 = (void *)v13;
    uint64_t v15 = *MEMORY[0x1E4F282C0];
    do
    {
      v16 = [v4 stringByAppendingPathComponent:v14];
      v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v50 = 0;
      v18 = [v17 attributesOfItemAtPath:v16 error:&v50];
      id v19 = v50;

      v20 = [v18 objectForKeyedSubscript:v15];
      v21 = v20;
      if (v20)
      {
        if ([v20 compare:v5] != 1)
        {
          v22 = v4;
          _HKInitializeLogging();
          v23 = (void *)*MEMORY[0x1E4F29F38];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEBUG))
          {
            v34 = v23;
            v35 = (objc_class *)objc_opt_class();
            v36 = NSStringFromClass(v35);
            v37 = HKSensitiveLogItem();
            *(_DWORD *)buf = 138543618;
            v52 = v36;
            __int16 v53 = 2114;
            uint64_t v54 = (uint64_t)v37;
            _os_log_debug_impl(&dword_1C21A1000, v34, OS_LOG_TYPE_DEBUG, "%{public}@: deleting file: %{public}@", buf, 0x16u);
          }
          v24 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v49 = v19;
          char v25 = [v24 removeItemAtPath:v16 error:&v49];
          id v26 = v49;

          if (v25)
          {
            id v19 = v26;
            v4 = v22;
          }
          else
          {
            v4 = v22;
            if (v26)
            {
              _HKInitializeLogging();
              v27 = (void *)*MEMORY[0x1E4F29F38];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR))
              {
                v38 = v27;
                v39 = (objc_class *)objc_opt_class();
                v40 = NSStringFromClass(v39);
                v41 = HKSensitiveLogItem();
                *(_DWORD *)buf = 138543874;
                v52 = v40;
                __int16 v53 = 2114;
                uint64_t v54 = (uint64_t)v41;
                __int16 v55 = 2114;
                id v56 = v26;
                _os_log_error_impl(&dword_1C21A1000, v38, OS_LOG_TYPE_ERROR, "%{public}@: failed to delete file: %{public}@ error: %{public}@", buf, 0x20u);

                v4 = v22;
              }
            }
            id v19 = v26;
          }
          v5 = v47;
        }
      }
      else
      {
        _HKInitializeLogging();
        v28 = (void *)*MEMORY[0x1E4F29F38];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR))
        {
          v29 = v28;
          v30 = (objc_class *)objc_opt_class();
          v46 = NSStringFromClass(v30);
          uint64_t v31 = HKSensitiveLogItem();
          *(_DWORD *)buf = 138543874;
          v52 = v46;
          __int16 v53 = 2112;
          uint64_t v54 = v31;
          v32 = (void *)v31;
          __int16 v55 = 2114;
          id v56 = v19;
          _os_log_error_impl(&dword_1C21A1000, v29, OS_LOG_TYPE_ERROR, "%{public}@: could not find creation date for: %@ error: %{public}@", buf, 0x20u);
        }
      }

      uint64_t v33 = [v48 nextObject];

      v14 = (void *)v33;
    }
    while (v33);
  }
  _HKInitializeLogging();
  v42 = (void *)*MEMORY[0x1E4F29F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_INFO))
  {
    v43 = v42;
    v44 = (objc_class *)objc_opt_class();
    v45 = NSStringFromClass(v44);
    *(_DWORD *)buf = 138543362;
    v52 = v45;
    _os_log_impl(&dword_1C21A1000, v43, OS_LOG_TYPE_INFO, "%{public}@: done removing old brand logos", buf, 0xCu);
  }
}

@end