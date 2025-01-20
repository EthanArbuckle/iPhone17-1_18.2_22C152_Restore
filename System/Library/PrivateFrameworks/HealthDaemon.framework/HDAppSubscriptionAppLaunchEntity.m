@interface HDAppSubscriptionAppLaunchEntity
+ (BOOL)insertOrUpdateAppSDKVersionToken:(unint64_t)a3 forBundleID:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)removeBundleIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)setLaunchTime:(id)a3 forBundleID:(id)a4 profile:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)launchTimeForBundleID:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)tableAliases;
+ (int64_t)protectionClass;
+ (unint64_t)appSDKVersionTokenForBundleID:(id)a3 profile:(id)a4 error:(id *)a5;
@end

@implementation HDAppSubscriptionAppLaunchEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (BOOL)setLaunchTime:(id)a3 forBundleID:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v12 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__HDAppSubscriptionAppLaunchEntity_setLaunchTime_forBundleID_profile_error___block_invoke;
  v18[3] = &unk_1E62F2E18;
  id v19 = v11;
  id v20 = v12;
  id v21 = v10;
  id v22 = a1;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v13 error:a6 block:v18];

  return (char)a6;
}

uint64_t __76__HDAppSubscriptionAppLaunchEntity_setLaunchTime_forBundleID_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v5 = *(void **)(a1 + 56);
  v6 = [a2 databaseForEntityClass:v5];
  v7 = +[HDAppSubscriptionEntity _predicateForBundleIdentifier:](*(void *)(a1 + 56), *(void **)(a1 + 32));
  id v28 = 0;
  v8 = [v5 anyInDatabase:v6 predicate:v7 error:&v28];
  id v9 = v28;

  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  if (v10)
  {
    if (v8)
    {
      v29 = @"last_launch_time";
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      id v12 = [*(id *)(a1 + 40) database];
      id v23 = v9;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __76__HDAppSubscriptionAppLaunchEntity_setLaunchTime_forBundleID_profile_error___block_invoke_3;
      v21[3] = &unk_1E62F35C8;
      id v22 = *(id *)(a1 + 48);
      uint64_t v13 = [v8 updateProperties:v11 healthDatabase:v12 error:&v23 bindingHandler:v21];
      id v14 = v23;
    }
    else
    {
      id v15 = *(void **)(a1 + 56);
      id v16 = [*(id *)(a1 + 40) database];
      v30[0] = @"bundle_id";
      v30[1] = @"last_launch_time";
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
      id v27 = v9;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __76__HDAppSubscriptionAppLaunchEntity_setLaunchTime_forBundleID_profile_error___block_invoke_2;
      v24[3] = &unk_1E62F3A88;
      id v25 = *(id *)(a1 + 32);
      id v26 = *(id *)(a1 + 48);
      v18 = [v15 insertOrReplaceEntity:0 healthDatabase:v16 properties:v17 error:&v27 bindingHandler:v24];
      id v14 = v27;

      if (v18) {
        BOOL v19 = 1;
      }
      else {
        BOOL v19 = v14 == 0;
      }
      uint64_t v13 = v19;
      if (!v19)
      {
        if (a3) {
          *a3 = v14;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else if (a3)
  {
    id v14 = v9;
    uint64_t v13 = 0;
    *a3 = v14;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v13 = 0;
    id v14 = v9;
  }

  return v13;
}

void __76__HDAppSubscriptionAppLaunchEntity_setLaunchTime_forBundleID_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EC0](a2, @"bundle_id", *(void *)(a1 + 32));

  JUMPOUT(0x1C1879EA0);
}

void __76__HDAppSubscriptionAppLaunchEntity_setLaunchTime_forBundleID_profile_error___block_invoke_3()
{
}

+ (id)launchTimeForBundleID:(id)a3 profile:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"HDAppSubscriptionEntity.m", 313, @"Invalid parameter not satisfying: %@", @"bundleID != nil" object file lineNumber description];
  }
  id v11 = +[HDAppSubscriptionEntity _predicateForBundleIdentifier:]((uint64_t)a1, v9);
  id v12 = v10;
  id v13 = v11;
  id v14 = self;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v26[0] = @"last_launch_time";
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v17 = [v12 database];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __76__HDAppSubscriptionAppLaunchEntity__launchTimesWithPredicate_profile_error___block_invoke;
  v24[3] = &unk_1E62F4CC0;
  id v18 = v15;
  id v25 = v18;
  int v19 = [v14 enumerateProperties:v16 withPredicate:v13 healthDatabase:v17 error:a5 enumerationHandler:v24];

  if (v19) {
    id v20 = (void *)[v18 copy];
  }
  else {
    id v20 = 0;
  }

  id v21 = [v20 firstObject];

  return v21;
}

+ (BOOL)removeBundleIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = +[HDAppSubscriptionEntity _predicateForBundleIdentifier:]((uint64_t)a1, a3);
  id v10 = [v8 database];

  LOBYTE(a5) = [a1 deleteEntitiesWithPredicate:v9 healthDatabase:v10 error:a5];
  return (char)a5;
}

uint64_t __76__HDAppSubscriptionAppLaunchEntity__launchTimesWithPredicate_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1C1879F60](a4, 0);
  [v4 addObject:v5];

  return 1;
}

+ (BOOL)insertOrUpdateAppSDKVersionToken:(unint64_t)a3 forBundleID:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__HDAppSubscriptionAppLaunchEntity_insertOrUpdateAppSDKVersionToken_forBundleID_profile_error___block_invoke;
  v16[3] = &unk_1E62F5200;
  id v17 = v10;
  id v18 = v11;
  id v19 = a1;
  unint64_t v20 = a3;
  id v13 = v11;
  id v14 = v10;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v12 error:a6 block:v16];

  return (char)a6;
}

uint64_t __95__HDAppSubscriptionAppLaunchEntity_insertOrUpdateAppSDKVersionToken_forBundleID_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v32[3] = *MEMORY[0x1E4F143B8];
  v5 = *(void **)(a1 + 48);
  v6 = [a2 databaseForEntityClass:v5];
  v7 = +[HDAppSubscriptionEntity _predicateForBundleIdentifier:](*(void *)(a1 + 48), *(void **)(a1 + 32));
  id v30 = 0;
  id v8 = [v5 anyInDatabase:v6 predicate:v7 error:&v30];
  id v9 = v30;

  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  if (v10)
  {
    if (v8)
    {
      v31 = @"sdk_version";
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      id v12 = [*(id *)(a1 + 40) database];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __95__HDAppSubscriptionAppLaunchEntity_insertOrUpdateAppSDKVersionToken_forBundleID_profile_error___block_invoke_2;
      v23[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
      v23[4] = *(void *)(a1 + 56);
      id v24 = v9;
      uint64_t v13 = [v8 updateProperties:v11 healthDatabase:v12 error:&v24 bindingHandler:v23];
      id v14 = v24;
    }
    else
    {
      id v15 = *(void **)(a1 + 48);
      id v16 = [*(id *)(a1 + 40) database];
      v32[0] = @"bundle_id";
      v32[1] = @"sdk_version";
      v32[2] = @"last_launch_time";
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
      id v29 = v9;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __95__HDAppSubscriptionAppLaunchEntity_insertOrUpdateAppSDKVersionToken_forBundleID_profile_error___block_invoke_370;
      v25[3] = &unk_1E62F3388;
      id v18 = *(id *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 56);
      id v26 = v18;
      id v27 = &unk_1F17EF0F0;
      uint64_t v28 = v19;
      unint64_t v20 = [v15 insertOrReplaceEntity:0 healthDatabase:v16 properties:v17 error:&v29 bindingHandler:v25];
      id v14 = v29;

      if (v20) {
        BOOL v21 = 1;
      }
      else {
        BOOL v21 = v14 == 0;
      }
      uint64_t v13 = v21;
      if (!v21)
      {
        if (a3) {
          *a3 = v14;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else if (a3)
  {
    id v14 = v9;
    uint64_t v13 = 0;
    *a3 = v14;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v13 = 0;
    id v14 = v9;
  }

  return v13;
}

void __95__HDAppSubscriptionAppLaunchEntity_insertOrUpdateAppSDKVersionToken_forBundleID_profile_error___block_invoke_370(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EC0](a2, @"bundle_id", *(void *)(a1 + 32));
  uint64_t v3 = HKBitPatternCastUnsignedToSignedInt64();
  MEMORY[0x1C1879E80](a2, @"sdk_version", v3);

  JUMPOUT(0x1C1879EA0);
}

void __95__HDAppSubscriptionAppLaunchEntity_insertOrUpdateAppSDKVersionToken_forBundleID_profile_error___block_invoke_2()
{
  HKBitPatternCastUnsignedToSignedInt64();

  JUMPOUT(0x1C1879E80);
}

+ (unint64_t)appSDKVersionTokenForBundleID:(id)a3 profile:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"HDAppSubscriptionEntity.m", 394, @"Invalid parameter not satisfying: %@", @"bundleID != nil" object file lineNumber description];
  }
  id v11 = +[HDAppSubscriptionEntity _predicateForBundleIdentifier:]((uint64_t)a1, v9);
  uint64_t v19 = 0;
  unint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v23[0] = @"sdk_version";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  uint64_t v13 = [v10 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__HDAppSubscriptionAppLaunchEntity_appSDKVersionTokenForBundleID_profile_error___block_invoke;
  v18[3] = &unk_1E630BBB0;
  void v18[4] = &v19;
  int v14 = [a1 enumerateProperties:v12 withPredicate:v11 healthDatabase:v13 error:a5 enumerationHandler:v18];

  if (v14) {
    unint64_t v15 = v20[3];
  }
  else {
    unint64_t v15 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v15;
}

uint64_t __80__HDAppSubscriptionAppLaunchEntity_appSDKVersionTokenForBundleID_profile_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HKBitPatternCastSignedToUnsignedInt64();
  return 1;
}

+ (id)databaseTable
{
  return @"subscription_app_launch";
}

+ (id)tableAliases
{
  return &unk_1F17EADA0;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_381;
}

@end