@interface HKSignedClinicalDataSubject(HealthRecordServices)
- (id)dataForUniquenessChecksumCalculation;
@end

@implementation HKSignedClinicalDataSubject(HealthRecordServices)

- (id)dataForUniquenessChecksumCalculation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v13 = 0;
  v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v13];
  id v4 = v13;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
    {
      v9 = v6;
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      v15 = v11;
      __int16 v16 = 2114;
      v17 = v12;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_error_impl(&dword_221D38000, v9, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@: unexpectedly failed to archive to data, returning zero-length data. Error: %{public}@", buf, 0x20u);
    }
    id v5 = objc_alloc_init(MEMORY[0x263EFF8F8]);
  }
  v7 = v5;

  return v7;
}

@end