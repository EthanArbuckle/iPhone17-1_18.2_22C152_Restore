@interface HDStatisticsCollectionCalculatorDefaultSourceOrderProvider
- (HDProfile)profile;
- (HDStatisticsCollectionCalculatorDefaultSourceOrderProvider)initWithProfile:(id)a3 quantityType:(id)a4;
- (HKQuantityType)quantityType;
- (id)orderedSourceIDsWithUnorderedIDs:(id)a3;
- (id)sourceForSourceID:(int64_t)a3;
@end

@implementation HDStatisticsCollectionCalculatorDefaultSourceOrderProvider

- (HDStatisticsCollectionCalculatorDefaultSourceOrderProvider)initWithProfile:(id)a3 quantityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDStatisticsCollectionCalculatorDefaultSourceOrderProvider;
  v8 = [(HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    uint64_t v10 = [v7 copy];
    quantityType = v9->_quantityType;
    v9->_quantityType = (HKQuantityType *)v10;
  }
  return v9;
}

- (id)sourceForSourceID:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained sourceManager];
  id v6 = [NSNumber numberWithLongLong:a3];
  id v12 = 0;
  id v7 = [v5 clientSourceForPersistentID:v6 error:&v12];
  id v8 = v12;

  if (v7)
  {
    id v9 = v7;
  }
  else if ((objc_msgSend(v8, "hk_isHealthKitErrorWithCode:", 118) & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v10 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v14 = a3;
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve source for %lld: %{public}@", buf, 0x16u);
    }
  }

  return v7;
}

- (id)orderedSourceIDsWithUnorderedIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained sourceOrderManager];
  quantityType = self->_quantityType;
  id v16 = 0;
  id v8 = [v6 orderedSourceIDsWithUnorderedIDs:v4 objectType:quantityType error:&v16];
  id v9 = v16;

  uint64_t v10 = v8;
  if (!v8)
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E4F29F18];
    BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR);
    uint64_t v10 = v4;
    if (v12)
    {
      __int16 v15 = self->_quantityType;
      *(_DWORD *)buf = 138543618;
      v18 = v15;
      __int16 v19 = 2114;
      id v20 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "Failed to retrieve ordered source ids for %{public}@: %{public}@", buf, 0x16u);
      uint64_t v10 = v4;
    }
  }
  id v13 = v10;

  return v13;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityType, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end