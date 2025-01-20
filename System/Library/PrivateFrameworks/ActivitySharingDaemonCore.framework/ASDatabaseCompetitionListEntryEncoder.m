@interface ASDatabaseCompetitionListEntryEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
@end

@implementation ASDatabaseCompetitionListEntryEncoder

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  id v9 = objc_alloc_init(MEMORY[0x263F23B50]);
  if ([(ASDatabaseCompetitionListEntryEncoder *)self applyPropertiesToObject:v9 persistentID:a3 row:a4 error:a5])
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
  id v9 = objc_alloc_init(MEMORY[0x263F23B50]);
  if ([(ASDatabaseCompetitionListEntryEncoder *)self applyPropertiesToObject:v9 persistentID:a3 row:a4 error:a5])
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
  v7 = HDSQLiteColumnWithNameAsData();
  [v6 setFriendUUID:v7];

  [v6 setType:HDSQLiteColumnWithNameAsInt64()];
  v8 = HDSQLiteColumnWithNameAsData();
  [v6 setSystemFieldsOnlyRecord:v8];

  [v6 setOwner:HDSQLiteColumnWithNameAsInt64()];
  return 1;
}

@end