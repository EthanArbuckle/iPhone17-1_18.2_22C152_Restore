@interface HDWorkoutZonesSampleEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
@end

@implementation HDWorkoutZonesSampleEntity

+ (id)databaseTable
{
  return @"workout_zones_samples";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_16;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v10 = a5;
  id v11 = a6;
  v12 = (void *)MEMORY[0x1E4F28DB0];
  v13 = [a3 zones];
  v14 = [v12 archivedDataWithRootObject:v13 requiringSecureCoding:1 error:a7];

  if (v14)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __92__HDWorkoutZonesSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
    v19[3] = &unk_1E62F2900;
    id v15 = v11;
    id v20 = v15;
    id v21 = v14;
    if ([v10 executeSQL:@"INSERT INTO workout_zones_samples (data_id, zones) VALUES (?, ?)", a7, v19, 0 error bindingHandler enumerationHandler])v16 = v15; {
    else
    }
      v16 = 0;
    id v17 = v16;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

uint64_t __92__HDWorkoutZonesSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);

  return HDSQLiteBindFoundationValueToStatement();
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 workoutZones];
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addWorkoutZones:a3];
  }
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(HDEntityEncoder *)[_HDWorkoutZonesSampleEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

@end