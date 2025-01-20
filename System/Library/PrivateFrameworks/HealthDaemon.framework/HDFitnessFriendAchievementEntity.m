@interface HDFitnessFriendAchievementEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)enumerateAchievementsWithPredicate:(id)a3 anchor:(id *)a4 profile:(id)a5 error:(id *)a6 handler:(id)a7;
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (int64_t)protectionClass;
@end

@implementation HDFitnessFriendAchievementEntity

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  v27[5] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a5;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDFitnessFriendAchievementEntity.m", 84, @"Subclasses must override %s", "+[HDFitnessFriendAchievementEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v27[0] = @"data_id";
  v27[1] = @"friend_uuid";
  v27[2] = @"template_unique_name";
  v27[3] = @"completed_date";
  v27[4] = @"value";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:5];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __98__HDFitnessFriendAchievementEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v24[3] = &unk_1E62F3A88;
  id v25 = v13;
  id v26 = v12;
  id v17 = v12;
  id v18 = v13;
  v19 = [a1 insertOrReplaceEntity:1 database:v14 properties:v16 error:a7 bindingHandler:v24];

  if (v19) {
    v20 = v18;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  return v21;
}

void __98__HDFitnessFriendAchievementEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"data_id", [*(id *)(a1 + 32) longLongValue]);
  v4 = [*(id *)(a1 + 40) friendUUID];
  MEMORY[0x1C1879EF0](a2, @"friend_uuid", v4);

  v5 = [*(id *)(a1 + 40) templateUniqueName];
  MEMORY[0x1C1879EC0](a2, @"template_unique_name", v5);

  v6 = [*(id *)(a1 + 40) completedDate];
  MEMORY[0x1C1879E40](a2, @"completed_date", v6);

  id v7 = [*(id *)(a1 + 40) value];
  MEMORY[0x1C1879EA0](a2, @"value", v7);
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return @"fitness_friend_achievements";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_60;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[_HDFitnessFriendAchievementEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 fitnessFriendAchievements];
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addFitnessFriendAchievements:a3];
  }
  return a3 != 0;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (BOOL)enumerateAchievementsWithPredicate:(id)a3 anchor:(id *)a4 profile:(id)a5 error:(id *)a6 handler:(id)a7
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v25 = a6;
  if (a4)
  {
    id v14 = *a4;
    uint64_t v15 = *MEMORY[0x1E4F65C70];
    if (v14)
    {
      v16 = [MEMORY[0x1E4F65D00] predicateWithProperty:*MEMORY[0x1E4F65C70] greaterThanValue:v14];
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    id v14 = 0;
    v16 = 0;
    uint64_t v15 = *MEMORY[0x1E4F65C70];
  }
  id v17 = [MEMORY[0x1E4F2B2C0] fitnessFriendAchievementType];
  id v18 = +[HDSampleEntity entityEnumeratorWithType:v17 profile:v12];

  v19 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v11 otherPredicate:v16];
  [v18 setPredicate:v19];

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v32 = [v14 longLongValue];
  v20 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:v15 entityClass:objc_opt_class() ascending:1];
  v33[0] = v20;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  [v18 setOrderingTerms:v21];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __100__HDFitnessFriendAchievementEntity_enumerateAchievementsWithPredicate_anchor_profile_error_handler___block_invoke;
  v26[3] = &unk_1E6301DB0;
  v28 = &v29;
  id v22 = v13;
  id v27 = v22;
  char v23 = [v18 enumerateWithError:v25 handler:v26];
  if (a4)
  {
    *a4 = [NSNumber numberWithLongLong:v30[3]];
  }

  _Block_object_dispose(&v29, 8);
  return v23;
}

uint64_t __100__HDFitnessFriendAchievementEntity_enumerateAchievementsWithPredicate_anchor_profile_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  if (v4 <= a3) {
    uint64_t v4 = a3;
  }
  *(void *)(v3 + 24) = v4;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end