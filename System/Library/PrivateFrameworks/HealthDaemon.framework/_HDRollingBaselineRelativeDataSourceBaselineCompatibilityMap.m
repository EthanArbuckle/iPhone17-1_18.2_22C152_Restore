@interface _HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap
+ (id)_canonicalSleepingWristTemperatureBundleIDByBundleIDWithProfile:(id)a3;
- (_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap)initWithProfile:(id)a3 quantityType:(id)a4;
- (id)_bundleIDForSourceID:(int64_t)a3 error:(id *)a4;
- (id)baselineCompatibilityIDForSourceID:(int64_t)a3;
- (id)predicateForDataEntitiesWithSourceIDsCompatibleWithSourceID:(int64_t)a3;
@end

@implementation _HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap

- (_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap)initWithProfile:(id)a3 quantityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap;
  v8 = [(_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    bundleIDBySourceID = v9->_bundleIDBySourceID;
    v9->_bundleIDBySourceID = (NSMutableDictionary *)v10;

    v12 = [v7 identifier];
    int v13 = [v12 isEqualToString:*MEMORY[0x1E4F2A5E0]];

    if (v13)
    {
      uint64_t v14 = [(id)objc_opt_class() _canonicalSleepingWristTemperatureBundleIDByBundleIDWithProfile:v6];
      canonicalBundleIDByBundleID = v9->_canonicalBundleIDByBundleID;
      v9->_canonicalBundleIDByBundleID = (NSDictionary *)v14;
    }
    else
    {
      canonicalBundleIDByBundleID = v9->_canonicalBundleIDByBundleID;
      v9->_canonicalBundleIDByBundleID = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
  }
  return v9;
}

+ (id)_canonicalSleepingWristTemperatureBundleIDByBundleIDWithProfile:(id)a3
{
  v3 = +[HDKeyValueDomain _wristTemperatureIdentifierDomainWithProfile:a3];
  v4 = [v3 _wristTemperatureResolvedSourceIdentifiersBySourceIdentifier];

  return v4;
}

- (id)baselineCompatibilityIDForSourceID:(int64_t)a3
{
  v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v6 = [v5 isAppleInternalInstall];

  if ((v6 & 1) == 0)
  {
    id v8 = [NSNumber numberWithLongLong:a3];
    v12 = [v8 stringValue];
    goto LABEL_10;
  }
  id v15 = 0;
  id v7 = [(_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap *)self _bundleIDForSourceID:a3 error:&v15];
  id v8 = v15;
  if (v7)
  {
    v9 = [(NSDictionary *)self->_canonicalBundleIDByBundleID objectForKeyedSubscript:v7];
    if (!v9)
    {
      int v13 = [NSNumber numberWithLongLong:a3];
      v12 = [v13 stringValue];

      v11 = 0;
      goto LABEL_9;
    }
    id v10 = v9;
    v11 = v10;
  }
  else
  {
    v11 = [NSNumber numberWithLongLong:a3];
    id v10 = [v11 stringValue];
  }
  v12 = v10;
LABEL_9:

LABEL_10:

  return v12;
}

- (id)_bundleIDForSourceID:(int64_t)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  bundleIDBySourceID = self->_bundleIDBySourceID;
  id v8 = objc_msgSend(NSNumber, "numberWithLongLong:");
  v9 = [(NSMutableDictionary *)bundleIDBySourceID objectForKeyedSubscript:v8];

  if (!v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v11 = [WeakRetained sourceManager];
    v12 = [NSNumber numberWithLongLong:a3];
    id v22 = 0;
    int v13 = [v11 clientSourceForPersistentID:v12 error:&v22];
    id v14 = v22;

    if (v13)
    {
      v9 = [v13 bundleIdentifier];
      id v15 = self->_bundleIDBySourceID;
      v16 = [NSNumber numberWithLongLong:a3];
      [(NSMutableDictionary *)v15 setObject:v9 forKeyedSubscript:v16];

      objc_super v17 = v13;
LABEL_11:

      goto LABEL_12;
    }
    _HKInitializeLogging();
    v18 = (id)*MEMORY[0x1E4F29F90];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = [NSNumber numberWithLongLong:a3];
      *(_DWORD *)buf = 138543874;
      v24 = self;
      __int16 v25 = 2114;
      v26 = v21;
      __int16 v27 = 2114;
      id v28 = v14;
      _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Error determining source for ID %{public}@: %{public}@", buf, 0x20u);
    }
    id v19 = v14;
    objc_super v17 = v19;
    if (v19)
    {
      if (a4)
      {
        v9 = 0;
        *a4 = v19;
        goto LABEL_11;
      }
      _HKLogDroppedError();
    }
    v9 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v9;
}

- (id)predicateForDataEntitiesWithSourceIDsCompatibleWithSourceID:(int64_t)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v4 = [v3 isAppleInternalInstall];

  if ((v4 & 1) == 0)
  {
    id v15 = [NSNumber numberWithLongLong:a3];
    v16 = HDDataEntityPredicateForSourceIdentifier((uint64_t)v15);

    goto LABEL_29;
  }
  id v33 = 0;
  id v22 = [(_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap *)self _bundleIDForSourceID:a3 error:&v33];
  id v5 = v33;
  if (v22)
  {
    v26 = -[NSDictionary objectForKeyedSubscript:](self->_canonicalBundleIDByBundleID, "objectForKeyedSubscript:");
    if (v26)
    {
      __int16 v25 = [MEMORY[0x1E4F1CA80] set];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      obj = self->_canonicalBundleIDByBundleID;
      uint64_t v6 = [(NSDictionary *)obj countByEnumeratingWithState:&v29 objects:v40 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v30 != v7) {
              objc_enumerationMutation(obj);
            }
            v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            id v10 = -[NSDictionary objectForKeyedSubscript:](self->_canonicalBundleIDByBundleID, "objectForKeyedSubscript:", v9, v22);
            if ([v10 isEqual:v26])
            {
              id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
              v12 = [WeakRetained sourceManager];
              id v28 = v5;
              int v13 = [v12 allSourcesForBundleIdentifier:v9 error:&v28];
              id v14 = v28;

              if (!v13)
              {
                _HKInitializeLogging();
                v18 = *MEMORY[0x1E4F29F90];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v35 = self;
                  __int16 v36 = 2114;
                  v37 = v9;
                  __int16 v38 = 2114;
                  id v39 = v14;
                  _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Error source entities for bundle ID %{public}@: %{public}@", buf, 0x20u);
                }

                id v5 = v14;
                goto LABEL_21;
              }
              [v25 unionSet:v13];

              id v5 = v14;
            }
          }
          uint64_t v6 = [(NSDictionary *)obj countByEnumeratingWithState:&v29 objects:v40 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_21:

      if (![v25 count])
      {
        _HKInitializeLogging();
        id v19 = *MEMORY[0x1E4F29F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v35 = self;
          __int16 v36 = 2114;
          v37 = v26;
          _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] No source entities found for canonical bundle ID %{public}@", buf, 0x16u);
        }
        v20 = objc_msgSend(NSNumber, "numberWithLongLong:", a3, v22);
        v16 = HDDataEntityPredicateForSourceIdentifier((uint64_t)v20);

        goto LABEL_27;
      }
      uint64_t v17 = HDDataEntityPredicateForSourceEntitySet(7, v25);
    }
    else
    {
      __int16 v25 = [NSNumber numberWithLongLong:a3];
      uint64_t v17 = HDDataEntityPredicateForSourceIdentifier((uint64_t)v25);
    }
    v16 = (void *)v17;
LABEL_27:

    goto LABEL_28;
  }
  v26 = [NSNumber numberWithLongLong:a3];
  v16 = HDDataEntityPredicateForSourceIdentifier((uint64_t)v26);
LABEL_28:

LABEL_29:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDBySourceID, 0);
  objc_storeStrong((id *)&self->_canonicalBundleIDByBundleID, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end