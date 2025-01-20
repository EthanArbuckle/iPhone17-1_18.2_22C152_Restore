@interface HDProfileAuthorizationEntity
+ (BOOL)fetchStatus:(int64_t *)a3 profile:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6;
+ (BOOL)setStatus:(int64_t)a3 profile:(id)a4 bundleIdentifier:(id)a5 dateModified:(id)a6 error:(id *)a7;
+ (BOOL)setStatusIfNeeded:(int64_t)a3 profile:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_allProperties;
+ (id)anyForBundleIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (int64_t)protectionClass;
- (BOOL)unitTest_getBundleIdentifier:(id *)a3 status:(int64_t *)a4 dateModified:(id *)a5 forProfile:(id)a6 error:(id *)a7;
@end

@implementation HDProfileAuthorizationEntity

+ (id)databaseTable
{
  return @"profile_authorization";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_5;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)_allProperties
{
  v2[3] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = @"source_bundle_id";
  v2[1] = @"status";
  v2[2] = @"date_modified";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];

  return v0;
}

+ (BOOL)setStatusIfNeeded:(int64_t)a3 profile:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__HDProfileAuthorizationEntity_setStatusIfNeeded_profile_bundleIdentifier_error___block_invoke;
  v16[3] = &unk_1E62F5200;
  id v17 = v10;
  id v18 = v11;
  id v19 = a1;
  int64_t v20 = a3;
  id v13 = v11;
  id v14 = v10;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v16];

  return (char)a6;
}

uint64_t __81__HDProfileAuthorizationEntity_setStatusIfNeeded_profile_bundleIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = 0;
  if (![*(id *)(a1 + 48) fetchStatus:&v13 profile:*(void *)(a1 + 32) bundleIdentifier:*(void *)(a1 + 40) error:a3])return 0; {
  uint64_t v5 = *(void *)(a1 + 56);
  }
  if (v13 == v5) {
    return 1;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v10 = a1 + 40;
  uint64_t v8 = *(void *)(a1 + 40);
  v9 = *(void **)(v10 + 8);
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v6 = [v9 setStatus:v5 profile:v7 bundleIdentifier:v8 dateModified:v11 error:a3];

  return v6;
}

+ (BOOL)setStatus:(int64_t)a3 profile:(id)a4 bundleIdentifier:(id)a5 dateModified:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v12 profileType] == 1)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_invalidProfileError");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (a7) {
        *a7 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v19 = 0;
  }
  else
  {
    v16 = [v12 database];
    id v17 = +[HDProfileAuthorizationEntity _allProperties]();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __86__HDProfileAuthorizationEntity_setStatus_profile_bundleIdentifier_dateModified_error___block_invoke;
    v21[3] = &unk_1E62F3388;
    id v22 = v13;
    int64_t v24 = a3;
    id v23 = v14;
    id v18 = [a1 insertOrReplaceEntity:1 healthDatabase:v16 properties:v17 error:a7 bindingHandler:v21];

    BOOL v19 = v18 != 0;
  }

  return v19;
}

void __86__HDProfileAuthorizationEntity_setStatus_profile_bundleIdentifier_dateModified_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EC0](a2, @"source_bundle_id", *(void *)(a1 + 32));
  MEMORY[0x1C1879E80](a2, @"status", *(void *)(a1 + 48));

  JUMPOUT(0x1C1879E40);
}

+ (BOOL)fetchStatus:(int64_t *)a3 profile:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if ([v10 profileType] != 1)
  {
    id v13 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"source_bundle_id" equalToValue:v11];
    id v14 = [v10 database];
    id v20 = 0;
    id v15 = [a1 propertyValueForAnyWithProperty:@"status" predicate:v13 healthDatabase:v14 error:&v20];
    id v16 = v20;

    if (!v15)
    {
      if (v16)
      {
        if (a6)
        {
          BOOL v12 = 0;
          *a6 = v16;
        }
        else
        {
          _HKLogDroppedError();
          BOOL v12 = 0;
        }
        goto LABEL_16;
      }
      *a3 = 0;
LABEL_15:
      BOOL v12 = 1;
LABEL_16:

      goto LABEL_17;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v17 = [v15 integerValue];
      if (v17 < 3)
      {
LABEL_14:
        *a3 = v17;
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v17 = -1;
    }
    _HKInitializeLogging();
    id v18 = HKLogInfrastructure();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v22 = a1;
      __int16 v23 = 2048;
      unint64_t v24 = v17;
      _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Encountered unexpected value %ld in table profile_authorization", buf, 0x16u);
    }

    unint64_t v17 = 0;
    goto LABEL_14;
  }
  BOOL v12 = 1;
  *a3 = 1;
LABEL_17:

  return v12;
}

+ (id)anyForBundleIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = a4;
  id v10 = [v8 predicateWithProperty:@"source_bundle_id" equalToValue:a3];
  id v11 = [v9 database];

  BOOL v12 = [a1 anyWithPredicate:v10 healthDatabase:v11 error:a5];

  return v12;
}

- (BOOL)unitTest_getBundleIdentifier:(id *)a3 status:(int64_t *)a4 dateModified:(id *)a5 forProfile:(id)a6 error:(id *)a7
{
  id v12 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__14;
  v28 = __Block_byref_object_dispose__14;
  id v29 = 0;
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__14;
  id v22 = __Block_byref_object_dispose__14;
  id v23 = 0;
  id v13 = +[HDProfileAuthorizationEntity _allProperties]();
  id v14 = [v12 database];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __98__HDProfileAuthorizationEntity_unitTest_getBundleIdentifier_status_dateModified_forProfile_error___block_invoke;
  v17[3] = &unk_1E62F5228;
  v17[4] = &v24;
  v17[5] = &v18;
  v17[6] = a4;
  BOOL v15 = [(HDHealthEntity *)self getValuesForProperties:v13 healthDatabase:v14 error:a7 handler:v17];

  if (v15)
  {
    if (a3) {
      *a3 = (id) v25[5];
    }
    if (a5) {
      *a5 = (id) v19[5];
    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __98__HDProfileAuthorizationEntity_unitTest_getBundleIdentifier_status_dateModified_forProfile_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48)) {
    **(void **)(a1 + 48) = HDSQLiteColumnWithNameAsInt64();
  }
  uint64_t v2 = HDSQLiteColumnWithNameAsString();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = HDSQLiteColumnWithNameAsDate();
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

@end