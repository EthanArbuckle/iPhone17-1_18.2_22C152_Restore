@interface ASDatabseCompetitionEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
@end

@implementation ASDatabseCompetitionEncoder

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  id v9 = objc_alloc_init(MEMORY[0x263F23B48]);
  if ([(ASDatabseCompetitionEncoder *)self applyPropertiesToObject:v9 persistentID:a3 row:a4 error:a5])
  {
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  id v9 = objc_alloc_init(MEMORY[0x263F23B48]);
  if ([(ASDatabseCompetitionEncoder *)self applyPropertiesToObject:v9 persistentID:a3 row:a4 error:a5])
  {
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v6 = a3;
  v7 = HDSQLiteColumnWithNameAsUUID();
  v8 = objc_msgSend(v7, "hk_dataForUUIDBytes");
  [v6 setFriendUUID:v8];

  [v6 setType:HDSQLiteColumnWithNameAsInt64()];
  id v9 = objc_alloc_init(MEMORY[0x263F23B28]);
  id v10 = HDSQLiteColumnWithNameAsUUID();
  v11 = objc_msgSend(v10, "hk_dataForUUIDBytes");
  [v9 setUuid:v11];

  [v9 setCurrentCacheIndex:HDSQLiteColumnWithNameAsInt64()];
  id v12 = objc_alloc(MEMORY[0x263F23B60]);
  v13 = HDSQLiteColumnWithNameAsData();
  v14 = (void *)[v12 initWithData:v13];

  id v15 = objc_alloc(MEMORY[0x263F23B60]);
  v16 = HDSQLiteColumnWithNameAsData();
  v17 = (void *)[v15 initWithData:v16];

  objc_msgSend(v9, "setScores:count:", objc_msgSend(v14, "scores"), objc_msgSend(v14, "scoresCount"));
  objc_msgSend(v9, "setOpponentScores:count:", objc_msgSend(v17, "scores"), objc_msgSend(v17, "scoresCount"));
  id v18 = objc_alloc(MEMORY[0x263F23B30]);
  v19 = HDSQLiteColumnWithNameAsData();
  v20 = (void *)[v18 initWithData:v19];

  id v21 = objc_alloc(MEMORY[0x263F23B30]);
  v22 = HDSQLiteColumnWithNameAsData();
  v23 = (void *)[v21 initWithData:v22];

  [v9 setStartDateComponents:v20];
  [v9 setDurationDateComponents:v23];
  id v24 = objc_alloc(MEMORY[0x263F23B58]);
  v25 = HDSQLiteColumnWithNameAsData();
  v26 = (void *)[v24 initWithData:v25];

  objc_msgSend(v9, "setPreferredVictoryBadgeStyles:count:", objc_msgSend(v26, "styles"), objc_msgSend(v26, "stylesCount"));
  [v9 setMaximumNumberOfPointsPerDay:HDSQLiteColumnWithNameAsInt64()];
  [v6 setCompetition:v9];

  return 1;
}

@end