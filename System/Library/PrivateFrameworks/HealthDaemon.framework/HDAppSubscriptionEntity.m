@interface HDAppSubscriptionEntity
+ (BOOL)addSubscriptionWithBundleID:(id)a3 dataCode:(int64_t)a4 updateFrequency:(unint64_t)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)removeSubscriptionsWithBundleID:(id)a3 dataCode:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)setLastAnchor:(id)a3 lastAckTime:(id)a4 forBundleID:(id)a5 dataTypes:(id)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)setLaunchTimeHysteresis:(id)a3 forBundleID:(id)a4 dataTypes:(id)a5 profile:(id)a6 error:(id *)a7;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_predicateForBundleID:(uint64_t)a3 dataCode:;
+ (id)_predicateForBundleID:(void *)a3 dataTypes:;
+ (id)_predicateForBundleIdentifier:(uint64_t)a1;
+ (id)_predicateForDataCode:(uint64_t)a1;
+ (id)_subscriptionsWithPredicate:(void *)a3 profile:(uint64_t)a4 error:;
+ (id)allSubscriptionsForBundleID:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)allSubscriptionsForType:(int64_t)a3 profile:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (id)subscriptionForBundleID:(id)a3 dataCode:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (id)tableAliases;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDAppSubscriptionEntity

+ (id)allSubscriptionsForType:(int64_t)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = +[HDAppSubscriptionEntity _predicateForDataCode:]((uint64_t)a1, a3);
  v10 = +[HDAppSubscriptionEntity _subscriptionsWithPredicate:profile:error:]((uint64_t)a1, v9, v8, (uint64_t)a5);

  return v10;
}

+ (id)_predicateForDataCode:(uint64_t)a1
{
  self;
  if (_HKValidDataTypeCode())
  {
    v3 = (void *)MEMORY[0x1E4F65D00];
    v4 = [NSNumber numberWithInteger:a2];
    v5 = [v3 predicateWithProperty:@"code" equalToValue:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)_predicateForBundleID:(uint64_t)a3 dataCode:
{
  id v4 = a2;
  uint64_t v5 = self;
  v6 = +[HDAppSubscriptionEntity _predicateForBundleIdentifier:](v5, v4);

  v7 = +[HDAppSubscriptionEntity _predicateForDataCode:](v5, a3);
  id v8 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v7 otherPredicate:v6];

  return v8;
}

+ (id)_predicateForBundleIdentifier:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"bundle_id" equalToValue:v2];

  return v3;
}

+ (BOOL)addSubscriptionWithBundleID:(id)a3 dataCode:(int64_t)a4 updateFrequency:(unint64_t)a5 profile:(id)a6 error:(id *)a7
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  if (!v13)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"HDAppSubscriptionEntity.m", 51, @"Invalid parameter not satisfying: %@", @"bundleID != nil" object file lineNumber description];

    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_5:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"HDAppSubscriptionEntity.m", 52, @"Invalid parameter not satisfying: %@", @"dataCode >= 0" object file lineNumber description];

    goto LABEL_3;
  }
  if (a4 < 0) {
    goto LABEL_5;
  }
LABEL_3:
  v15 = [v14 database];
  v26[0] = @"bundle_id";
  v26[1] = @"code";
  v26[2] = @"update_frequency";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __94__HDAppSubscriptionEntity_addSubscriptionWithBundleID_dataCode_updateFrequency_profile_error___block_invoke;
  v22[3] = &unk_1E630E188;
  id v23 = v13;
  int64_t v24 = a4;
  unint64_t v25 = a5;
  id v17 = v13;
  v18 = [a1 insertOrReplaceEntity:1 healthDatabase:v15 properties:v16 error:a7 bindingHandler:v22];

  return v18 != 0;
}

void __94__HDAppSubscriptionEntity_addSubscriptionWithBundleID_dataCode_updateFrequency_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EC0](a2, @"bundle_id", *(void *)(a1 + 32));
  MEMORY[0x1C1879E80](a2, @"code", *(void *)(a1 + 40));

  JUMPOUT(0x1C1879E80);
}

+ (BOOL)removeSubscriptionsWithBundleID:(id)a3 dataCode:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a5;
  v11 = +[HDAppSubscriptionEntity _predicateForBundleID:dataCode:]((uint64_t)a1, a3, a4);
  v12 = [v10 database];

  LOBYTE(a6) = [a1 deleteEntitiesWithPredicate:v11 healthDatabase:v12 error:a6];
  return (char)a6;
}

+ (id)_subscriptionsWithPredicate:(void *)a3 profile:(uint64_t)a4 error:
{
  v17[7] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a2;
  id v8 = self;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17[0] = @"bundle_id";
  v17[1] = @"code";
  v17[2] = @"update_frequency";
  v17[3] = @"last_anchor";
  v17[4] = @"last_ack_time";
  v17[5] = @"launch_time_hysteresis";
  v17[6] = @"last_association_anchor";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:7];
  v11 = [v6 database];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__HDAppSubscriptionEntity__subscriptionsWithPredicate_profile_error___block_invoke;
  v15[3] = &unk_1E62F4CC0;
  id v12 = v9;
  id v16 = v12;
  LODWORD(a4) = [v8 enumerateProperties:v10 withPredicate:v7 healthDatabase:v11 error:a4 enumerationHandler:v15];

  if (a4) {
    id v13 = (void *)[v12 copy];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

+ (id)allSubscriptionsForBundleID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"HDAppSubscriptionEntity.m", 92, @"Invalid parameter not satisfying: %@", @"bundleID != nil" object file lineNumber description];
  }
  v11 = +[HDAppSubscriptionEntity _predicateForBundleIdentifier:]((uint64_t)a1, v9);
  id v12 = +[HDAppSubscriptionEntity _subscriptionsWithPredicate:profile:error:]((uint64_t)a1, v11, v10, (uint64_t)a5);

  return v12;
}

+ (id)subscriptionForBundleID:(id)a3 dataCode:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a5;
  v11 = +[HDAppSubscriptionEntity _predicateForBundleID:dataCode:]((uint64_t)a1, a3, a4);
  id v12 = +[HDAppSubscriptionEntity _subscriptionsWithPredicate:profile:error:]((uint64_t)a1, v11, v10, (uint64_t)a6);

  id v13 = [v12 firstObject];

  return v13;
}

+ (BOOL)setLastAnchor:(id)a3 lastAckTime:(id)a4 forBundleID:(id)a5 dataTypes:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = +[HDAppSubscriptionEntity _predicateForBundleID:dataTypes:]((uint64_t)a1, a5, a6);
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", @"last_ack_time", 0);
  v19 = [v14 dataAnchor];

  if (v19) {
    [v18 addObject:@"last_anchor"];
  }
  v20 = [v14 associationAnchor];

  if (v20) {
    [v18 addObject:@"last_association_anchor"];
  }
  v21 = [v16 database];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __89__HDAppSubscriptionEntity_setLastAnchor_lastAckTime_forBundleID_dataTypes_profile_error___block_invoke;
  v26[3] = &unk_1E62F3A88;
  id v27 = v14;
  id v28 = v15;
  id v22 = v15;
  id v23 = v14;
  char v24 = [a1 updateProperties:v18 predicate:v17 healthDatabase:v21 error:a8 bindingHandler:v26];

  return v24;
}

+ (id)_predicateForBundleID:(void *)a3 dataTypes:
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  id v7 = +[HDAppSubscriptionEntity _predicateForBundleIdentifier:](v6, v5);

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __59__HDAppSubscriptionEntity__predicateForBundleID_dataTypes___block_invoke;
  id v16 = &unk_1E630E1B0;
  id v17 = v8;
  uint64_t v18 = v6;
  id v9 = v8;
  [v4 enumerateObjectsUsingBlock:&v13];

  id v10 = objc_msgSend(MEMORY[0x1E4F65D08], "predicateMatchingAnyPredicates:", v9, v13, v14, v15, v16);
  v11 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v10 otherPredicate:v7];

  return v11;
}

void __89__HDAppSubscriptionEntity_setLastAnchor_lastAckTime_forBundleID_dataTypes_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) dataAnchor];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) dataAnchor];
    MEMORY[0x1C1879EA0](a2, @"last_anchor", v5);
  }
  uint64_t v6 = [*(id *)(a1 + 32) associationAnchor];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) associationAnchor];
    MEMORY[0x1C1879EA0](a2, @"last_association_anchor", v7);
  }

  JUMPOUT(0x1C1879EA0);
}

+ (BOOL)setLaunchTimeHysteresis:(id)a3 forBundleID:(id)a4 dataTypes:(id)a5 profile:(id)a6 error:(id *)a7
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  uint64_t v14 = +[HDAppSubscriptionEntity _predicateForBundleID:dataTypes:]((uint64_t)a1, a4, a5);
  v21[0] = @"launch_time_hysteresis";
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v16 = [v13 database];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__HDAppSubscriptionEntity_setLaunchTimeHysteresis_forBundleID_dataTypes_profile_error___block_invoke;
  v19[3] = &unk_1E62F35C8;
  id v20 = v12;
  id v17 = v12;
  LOBYTE(a7) = [a1 updateProperties:v15 predicate:v14 healthDatabase:v16 error:a7 bindingHandler:v19];

  return (char)a7;
}

void __87__HDAppSubscriptionEntity_setLaunchTimeHysteresis_forBundleID_dataTypes_profile_error___block_invoke()
{
}

uint64_t __69__HDAppSubscriptionEntity__subscriptionsWithPredicate_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = [HDAppSubscription alloc];
  id v7 = MEMORY[0x1C1879F80](a4, 0);
  id v8 = [(HDAppSubscription *)v6 initWithBundleIdentifier:v7 dataCode:HDSQLiteColumnAsInt64()];

  [(HDAppSubscription *)v8 setUpdateFrequency:HDSQLiteColumnAsInt64()];
  [(HDAppSubscription *)v8 setLastAnchor:HDSQLiteColumnAsInt64()];
  [(HDAppSubscription *)v8 setLastAckTime:HDSQLiteColumnAsInt64()];
  [(HDAppSubscription *)v8 setLaunchTimeHysteresis:HDSQLiteColumnAsInt64()];
  [(HDAppSubscription *)v8 setLastAssociationAnchor:HDSQLiteColumnAsInt64()];
  [*(id *)(a1 + 32) addObject:v8];

  return 1;
}

void __59__HDAppSubscriptionEntity__predicateForBundleID_dataTypes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  +[HDAppSubscriptionEntity _predicateForDataCode:](*(void *)(a1 + 40), [a2 code]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

+ (id)databaseTable
{
  return @"subscription";
}

+ (id)tableAliases
{
  return &unk_1F17EAD88;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_103;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"bundle_id";
  v4[1] = @"code";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

@end