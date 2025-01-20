@interface HDPauseRingsScheduleEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)orderingTermForSortDescriptor:(id)a3;
@end

@implementation HDPauseRingsScheduleEntity

+ (id)databaseTable
{
  return @"pause_rings_schedule_samples";
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [v4 key];
  uint64_t v6 = [v4 ascending];
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A318]])
  {
    v7 = (void *)MEMORY[0x1E4F65D50];
    uint64_t v8 = objc_opt_class();
    v9 = @"start_date_index";
LABEL_5:
    uint64_t v10 = [v7 orderingTermWithProperty:v9 entityClass:v8 ascending:v6];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A310]])
  {
    v7 = (void *)MEMORY[0x1E4F65D50];
    uint64_t v8 = objc_opt_class();
    v9 = @"end_date_index";
    goto LABEL_5;
  }
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___HDPauseRingsScheduleEntity;
  uint64_t v10 = objc_msgSendSuper2(&v13, sel_orderingTermForSortDescriptor_, v4);
LABEL_7:
  v11 = (void *)v10;

  return v11;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_11;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"data_id";
  v2 = +[HDDataEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a5;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDPauseRingsScheduleEntity.m", 62, @"Subclasses must override %s", "+[HDPauseRingsScheduleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v27[0] = @"data_id";
  v27[1] = @"start_date_index";
  v27[2] = @"end_date_index";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __92__HDPauseRingsScheduleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
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

void __92__HDPauseRingsScheduleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"data_id", [*(id *)(a1 + 32) longLongValue]);
  MEMORY[0x1C1879E80](a2, @"start_date_index", [*(id *)(a1 + 40) startDateIndex]);
  [*(id *)(a1 + 40) endDateIndex];

  JUMPOUT(0x1C1879E80);
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 pauseRingsSchedules];
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addPauseRingsSchedules:a3];
  }
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[_HDPauseRingsScheduleEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

@end