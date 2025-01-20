@interface HDRaceRouteWorkoutEntity
+ (BOOL)enumerateRoutePointsForWorkoutPersistentID:(int64_t)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 startDuration:(double)a6 finishDuration:(double)a7 transaction:(id)a8 error:(id *)a9 handler:(id)a10;
+ (BOOL)enumerateRoutePointsForWorkoutUUID:(id)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 profile:(id)a6 error:(id *)a7 dataHandler:(id)a8;
+ (BOOL)insertCodableRoutePoints:(id)a3 workoutPersistentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)markForDeletionWorkoutDataWithPersistentID:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (BOOL)pruneWorkoutsMarkedForDeletionInTransaction:(id)a3 error:(id *)a4;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_insertWithWorkoutUUID:(uint64_t)a3 seriesKey:(void *)a4 transaction:(uint64_t)a5 error:;
+ (id)_routeKeyForPersistentID:(void *)a3 transaction:(uint64_t)a4 error:;
+ (id)createRaceRouteWorkoutFromWorkout:(id)a3 transaction:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)databaseTable;
+ (id)entityForWorkoutUUID:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)insertCodableRacingMetrics:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)privateSubEntities;
+ (id)startingPointForWorkoutWithPersistentID:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
- (BOOL)setDateToDelete:(id)a3 transaction:(id)a4 error:(id *)a5;
- (id)dateToDeleteInTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDRaceRouteWorkoutEntity

+ (id)insertCodableRacingMetrics:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 routePoints];
  v11 = +[HDRaceRouteLocationSeriesEntity insertCodableRoutePoints:v10 transaction:v9 error:a5];

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E4F29128];
    v13 = [v8 workoutUUID];
    v14 = objc_msgSend(v12, "hk_UUIDWithData:", v13);

    v15 = +[HDRaceRouteWorkoutEntity _insertWithWorkoutUUID:seriesKey:transaction:error:]((uint64_t)a1, v14, [v11 longLongValue], v9, (uint64_t)a5);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)_insertWithWorkoutUUID:(uint64_t)a3 seriesKey:(void *)a4 transaction:(uint64_t)a5 error:
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a4;
  v10 = self;
  v11 = [v9 databaseForEntityClass:v10];

  v19[0] = @"workout_uuid";
  v19[1] = @"route_key";
  v19[2] = @"date_to_delete";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__HDRaceRouteWorkoutEntity__insertWithWorkoutUUID_seriesKey_transaction_error___block_invoke;
  v16[3] = &unk_1E62F67E8;
  id v17 = v8;
  uint64_t v18 = a3;
  id v13 = v8;
  v14 = [v10 insertOrReplaceEntity:0 database:v11 properties:v12 error:a5 bindingHandler:v16];

  return v14;
}

+ (BOOL)insertCodableRoutePoints:(id)a3 workoutPersistentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = +[HDRaceRouteWorkoutEntity _routeKeyForPersistentID:transaction:error:]((uint64_t)a1, a4, v11, (uint64_t)a6);
  id v13 = v12;
  if (v12) {
    BOOL v14 = +[HDRaceRouteLocationSeriesEntity insertCodableRoutePoints:seriesKey:transaction:error:](HDRaceRouteLocationSeriesEntity, "insertCodableRoutePoints:seriesKey:transaction:error:", v10, [v12 longLongValue], v11, a6);
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

+ (id)_routeKeyForPersistentID:(void *)a3 transaction:(uint64_t)a4 error:
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = self;
  id v8 = [v6 databaseForEntityClass:v7];
  id v9 = (void *)MEMORY[0x1E4F65D00];
  id v10 = [NSNumber numberWithUnsignedLongLong:a2];
  id v11 = [v9 predicateWithProperty:@"ROWID" equalToValue:v10];

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__131;
  v21 = __Block_byref_object_dispose__131;
  id v22 = 0;
  v12 = [v7 queryWithDatabase:v8 predicate:v11];
  v23[0] = @"route_key";
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__HDRaceRouteWorkoutEntity__routeKeyForPersistentID_transaction_error___block_invoke;
  v16[3] = &unk_1E62F9DB8;
  void v16[4] = &v17;
  [v12 enumerateProperties:v13 error:a4 enumerationHandler:v16];

  id v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v14;
}

+ (id)createRaceRouteWorkoutFromWorkout:(id)a3 transaction:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = +[HDRaceRouteLocationSeriesEntity createRoutePointsFromWorkout:v10 transaction:v11 profile:a5 error:a6];
  if (v12)
  {
    id v13 = [v11 databaseForEntity:v10];
    id v14 = [v10 UUIDForProperty:@"uuid" database:v13];
    if (v14)
    {
      v15 = +[HDRaceRouteWorkoutEntity _insertWithWorkoutUUID:seriesKey:transaction:error:]((uint64_t)a1, v14, [v12 longLongValue], v11, (uint64_t)a6);
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)markForDeletionWorkoutDataWithPersistentID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = [a4 databaseForEntityClass:a1];
  id v9 = [MEMORY[0x1E4F2B800] workoutType];
  [v9 maximumAllowedDuration];
  double v11 = v10;

  v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v11];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__HDRaceRouteWorkoutEntity_markForDeletionWorkoutDataWithPersistentID_transaction_error___block_invoke;
  v18[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v18[4] = a1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__HDRaceRouteWorkoutEntity_markForDeletionWorkoutDataWithPersistentID_transaction_error___block_invoke_2;
  v15[3] = &unk_1E62F33F8;
  id v16 = v12;
  int64_t v17 = a3;
  id v13 = v12;
  LOBYTE(a5) = [v8 executeCachedStatementForKey:&markForDeletionWorkoutDataWithPersistentID_transaction_error__updateDateKey error:a5 SQLGenerator:v18 bindingHandler:v15 enumerationHandler:0];

  return (char)a5;
}

id __89__HDRaceRouteWorkoutEntity_markForDeletionWorkoutDataWithPersistentID_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) databaseTable];
  v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = ? WHERE %@ = ? AND %@ IS NULL", v2, @"date_to_delete", @"ROWID", @"date_to_delete"];

  return v3;
}

uint64_t __89__HDRaceRouteWorkoutEntity_markForDeletionWorkoutDataWithPersistentID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

+ (BOOL)pruneWorkoutsMarkedForDeletionInTransaction:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 databaseForEntityClass:a1];
  id v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  double v10 = [v8 predicateWithProperty:@"date_to_delete" lessThanValue:v9];

  double v11 = [a1 queryWithDatabase:v7 predicate:v10];
  v19[0] = @"route_key";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__HDRaceRouteWorkoutEntity_pruneWorkoutsMarkedForDeletionInTransaction_error___block_invoke;
  v17[3] = &unk_1E62FE2E0;
  id v13 = v6;
  id v18 = v13;
  int v14 = [v11 enumerateProperties:v12 error:a4 enumerationHandler:v17];

  if (v14) {
    char v15 = [a1 deleteEntitiesInDatabase:v7 predicate:v10 error:a4];
  }
  else {
    char v15 = 0;
  }

  return v15;
}

BOOL __78__HDRaceRouteWorkoutEntity_pruneWorkoutsMarkedForDeletionInTransaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v7 = *(void *)(a1 + 32);

  return +[HDRaceRouteLocationSeriesEntity deleteSeriesDataWithIdentifier:v6 transaction:v7 error:a4];
}

+ (BOOL)enumerateRoutePointsForWorkoutUUID:(id)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 profile:(id)a6 error:(id *)a7 dataHandler:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  id v16 = [a6 database];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __111__HDRaceRouteWorkoutEntity_enumerateRoutePointsForWorkoutUUID_timestampAnchor_limit_profile_error_dataHandler___block_invoke;
  v20[3] = &unk_1E6304E48;
  id v22 = v15;
  id v23 = a1;
  double v24 = a4;
  unint64_t v25 = a5;
  id v21 = v14;
  id v17 = v15;
  id v18 = v14;
  LOBYTE(a7) = [a1 performReadTransactionWithHealthDatabase:v16 error:a7 block:v20];

  return (char)a7;
}

BOOL __111__HDRaceRouteWorkoutEntity_enumerateRoutePointsForWorkoutUUID_timestampAnchor_limit_profile_error_dataHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 48) entityForWorkoutUUID:*(void *)(a1 + 32) transaction:v5 error:a3];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 numberForProperty:@"route_key" transaction:v5 error:a3];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 longLongValue];
      double v11 = *(double *)(a1 + 56);
      uint64_t v12 = *(void *)(a1 + 64);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __111__HDRaceRouteWorkoutEntity_enumerateRoutePointsForWorkoutUUID_timestampAnchor_limit_profile_error_dataHandler___block_invoke_2;
      v15[3] = &unk_1E6304E20;
      id v16 = *(id *)(a1 + 40);
      BOOL v13 = +[HDRaceRouteLocationSeriesEntity enumerateRoutePointsForSeries:v10 timestampAnchor:v12 limit:v5 transaction:a3 error:v15 handler:v11];
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __111__HDRaceRouteWorkoutEntity_enumerateRoutePointsForWorkoutUUID_timestampAnchor_limit_profile_error_dataHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)enumerateRoutePointsForWorkoutPersistentID:(int64_t)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 startDuration:(double)a6 finishDuration:(double)a7 transaction:(id)a8 error:(id *)a9 handler:(id)a10
{
  id v18 = a8;
  id v19 = a10;
  v20 = +[HDRaceRouteWorkoutEntity _routeKeyForPersistentID:transaction:error:]((uint64_t)a1, a3, v18, (uint64_t)a9);
  id v21 = v20;
  if (v20) {
    BOOL v22 = +[HDRaceRouteLocationSeriesEntity enumerateRoutePointsForSeries:timestampAnchor:limit:startDuration:finishDuration:transaction:error:handler:](HDRaceRouteLocationSeriesEntity, "enumerateRoutePointsForSeries:timestampAnchor:limit:startDuration:finishDuration:transaction:error:handler:", [v20 longLongValue], a5, v18, a9, v19, a4, a6, a7);
  }
  else {
    BOOL v22 = 0;
  }

  return v22;
}

+ (id)entityForWorkoutUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = a4;
  uint64_t v10 = [v8 predicateWithProperty:@"workout_uuid" equalToValue:a3];
  double v11 = [v9 databaseForEntityClass:a1];

  uint64_t v12 = [a1 anyInDatabase:v11 predicate:v10 error:a5];

  return v12;
}

+ (id)startingPointForWorkoutWithPersistentID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = +[HDRaceRouteWorkoutEntity _routeKeyForPersistentID:transaction:error:]((uint64_t)a1, a3, v8, (uint64_t)a5);
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy__131;
    v20 = __Block_byref_object_dispose__131;
    id v21 = 0;
    uint64_t v11 = [v9 longLongValue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __86__HDRaceRouteWorkoutEntity_startingPointForWorkoutWithPersistentID_transaction_error___block_invoke;
    v15[3] = &unk_1E6304E70;
    void v15[4] = &v16;
    if (+[HDRaceRouteLocationSeriesEntity enumerateRoutePointsForSeries:v11 timestampAnchor:1 limit:v8 transaction:a5 error:v15 handler:-1.0])
    {
      uint64_t v12 = (void *)v17[5];
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v13 = v12;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __86__HDRaceRouteWorkoutEntity_startingPointForWorkoutWithPersistentID_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F1E5F0];
  id v4 = a2;
  id v5 = [v3 alloc];
  objc_msgSend(v4, "latitude_deg");
  double v7 = v6;
  objc_msgSend(v4, "longitude_deg");
  double v9 = v8;

  uint64_t v10 = [v5 initWithLatitude:v7 longitude:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  return 0;
}

- (id)dateToDeleteInTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self dateForProperty:@"date_to_delete" transaction:a3 error:a4];
}

- (BOOL)setDateToDelete:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return [(HDHealthEntity *)self setDate:a3 forProperty:@"date_to_delete" transaction:a4 error:a5];
}

+ (id)databaseTable
{
  return @"RacePreviousRoute_workout";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_67;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)privateSubEntities
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

uint64_t __71__HDRaceRouteWorkoutEntity__routeKeyForPersistentID_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsNumber();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 0;
}

void __79__HDRaceRouteWorkoutEntity__insertWithWorkoutUUID_seriesKey_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EF0](a2, @"workout_uuid", *(void *)(a1 + 32));
  MEMORY[0x1C1879E80](a2, @"route_key", *(void *)(a1 + 40));

  JUMPOUT(0x1C1879E90);
}

@end