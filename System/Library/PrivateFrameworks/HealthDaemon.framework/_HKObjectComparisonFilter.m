@interface _HKObjectComparisonFilter
- (id)_OSBuildPredicate;
- (id)_appleWatchSourcePredicate;
- (id)_associationPredicateWithProfile:(uint64_t)a3 type:;
- (id)_contributorPredicateWithProfile:(id)a1;
- (id)_creationDatePredicate;
- (id)_devicePropertyPredicateWithProfile:(void *)a1;
- (id)_metadataKeyFromMetadataKeyPath;
- (id)_metadataPredicateWithProfile:(void *)a1;
- (id)_productTypePredicate;
@end

@implementation _HKObjectComparisonFilter

- (id)_associationPredicateWithProfile:(uint64_t)a3 type:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = a2;
    v6 = [a1 keyPath];
    [v6 isEqualToString:*MEMORY[0x1E4F2A478]];
    v7 = objc_opt_class();

    v8 = [a1 value];
    v9 = [v8 UUID];

    v10 = HDDataEntityPredicateForDataUUID();
    v11 = [v5 database];

    id v18 = 0;
    v12 = [v7 anyWithPredicate:v10 healthDatabase:v11 error:&v18];
    id v13 = v18;

    if (v12)
    {
      uint64_t v14 = HDAssociationEntityPredicateForChildObjectsAssociatedWithParentObjectForType([v12 persistentID], a3);
    }
    else
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v20 = v9;
        __int16 v21 = 2114;
        id v22 = v13;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "Failed to find sample with UUID %{public}@, error: %{public}@", buf, 0x16u);
      }
      uint64_t v14 = [MEMORY[0x1E4F65D58] falsePredicate];
    }
    v16 = (void *)v14;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_appleWatchSourcePredicate
{
  if (a1)
  {
    v1 = [a1 value];
    v2 = HDDataEntityPredicateForObjectsFromAppleWatchSources([v1 BOOLValue]);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)_OSBuildPredicate
{
  id v1 = a1;
  if (a1)
  {
    [a1 operatorType];
    uint64_t v2 = HDSQLiteComparisonTypeForPredicateOperator();
    v3 = [v1 value];
    HDDataEntityPredicateForOriginBuild(v2, v3);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (id)_contributorPredicateWithProfile:(id)a1
{
  id v2 = a1;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = a2;
    v4 = [v2 value];
    id v10 = 0;
    id v5 = +[HDContributorEntity contributorEntityWithUUID:v4 profile:v3 includeDeleted:0 error:&v10];

    id v6 = v10;
    if (v5)
    {
      v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "persistentID"));
      HDDataEntityPredicateForContributorIdentifier((uint64_t)v7);
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v12 = v2;
        __int16 v13 = 2114;
        uint64_t v14 = v4;
        __int16 v15 = 2114;
        id v16 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find contributor with UUID %{public}@, error %{public}@", buf, 0x20u);
      }
      id v2 = [MEMORY[0x1E4F65D58] falsePredicate];
    }
  }

  return v2;
}

- (id)_creationDatePredicate
{
  id v1 = a1;
  if (a1)
  {
    [a1 operatorType];
    uint64_t v2 = HDSQLiteComparisonTypeForPredicateOperator();
    id v3 = [v1 value];
    HDDataEntityPredicateForCreationDate(v2);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (id)_productTypePredicate
{
  id v1 = a1;
  if (a1)
  {
    [a1 operatorType];
    uint64_t v2 = HDSQLiteComparisonTypeForPredicateOperator();
    id v3 = [v1 value];
    HDDataEntityPredicateForOriginProductType(v2, (uint64_t)v3);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (id)_devicePropertyPredicateWithProfile:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = a2;
    v4 = [a1 keyPath];
    id v5 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend((id)*MEMORY[0x1E4F2A378], "length") + 1);

    [a1 value];
    id v17 = 0;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = v5;
    id v8 = v3;
    self;
    v9 = [v8 deviceManager];

    id v10 = [v9 deviceEntitiesWithProperty:v7 matchingValues:v6 error:&v17];

    if (v10)
    {
      v11 = objc_msgSend(v10, "hk_map:", &__block_literal_global_218);
    }
    else
    {
      v11 = 0;
    }

    id v12 = v17;
    if (v11)
    {
      uint64_t v13 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"data_provenances.device_id" values:v11];
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v14 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v12;
        _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "Failed to find devices: %{public}@", buf, 0xCu);
      }
      uint64_t v13 = [MEMORY[0x1E4F65D58] falsePredicate];
    }
    __int16 v15 = (void *)v13;
  }
  else
  {
    __int16 v15 = 0;
  }

  return v15;
}

- (id)_metadataPredicateWithProfile:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = -[_HKObjectComparisonFilter _metadataKeyFromMetadataKeyPath](a1);
    uint64_t v5 = [a1 operatorType];
    id v6 = [v3 metadataManager];
    id v7 = [a1 value];
    if (v5 == 10) {
      [v6 predicateWithMetadataKey:v4 allowedValues:v7];
    }
    else {
    a1 = objc_msgSend(v6, "predicateWithMetadataKey:value:operatorType:", v4, v7, objc_msgSend(a1, "operatorType"));
    }
  }

  return a1;
}

- (id)_metadataKeyFromMetadataKeyPath
{
  if (a1)
  {
    id v1 = [a1 keyPath];
    uint64_t v2 = objc_msgSend(v1, "substringFromIndex:", objc_msgSend((id)*MEMORY[0x1E4F2A3C8], "length") + 1);
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

@end