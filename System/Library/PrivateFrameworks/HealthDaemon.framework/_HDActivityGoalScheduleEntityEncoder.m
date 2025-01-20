@interface _HDActivityGoalScheduleEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)_quantityForRow:(uint64_t)a1 unit:(uint64_t)a2 columnName:(void *)a3;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDActivityGoalScheduleEntityEncoder

- (id)orderedProperties
{
  v8[9] = *MEMORY[0x1E4F143B8];
  v8[0] = @"goal_type";
  v8[1] = @"unit_string";
  v8[2] = @"monday_goal";
  v8[3] = @"tuesday_goal";
  v8[4] = @"wednesday_goal";
  v8[5] = @"thursday_goal";
  v8[6] = @"friday_goal";
  v8[7] = @"saturday_goal";
  v8[8] = @"sunday_goal";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:9];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2ABA0]) _init];

  return v3;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v8 = [(HDEntityEncoder *)self superclassEncoder];
  v9 = [v8 codableRepresentationForPersistentID:a3 row:a4 error:a5];

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableActivityGoalSchedule);
    [(HDCodableActivityGoalSchedule *)v10 setSample:v9];
    [(HDCodableActivityGoalSchedule *)v10 setGoalType:HDSQLiteColumnWithNameAsInt64()];
    v11 = HDSQLiteColumnWithNameAsString();
    [(HDCodableActivityGoalSchedule *)v10 setUnitString:v11];
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableActivityGoalSchedule setMondayGoal:](v10, "setMondayGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableActivityGoalSchedule setTuesdayGoal:](v10, "setTuesdayGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableActivityGoalSchedule setWednesdayGoal:](v10, "setWednesdayGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableActivityGoalSchedule setThursdayGoal:](v10, "setThursdayGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableActivityGoalSchedule setFridayGoal:](v10, "setFridayGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableActivityGoalSchedule setSaturdayGoal:](v10, "setSaturdayGoal:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableActivityGoalSchedule setSundayGoal:](v10, "setSundayGoal:");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    [v10 setGoalType:HDSQLiteColumnWithNameAsInt64()];
    v22 = HDSQLiteColumnWithNameAsString();
    v13 = [MEMORY[0x1E4F2B618] unitFromString:v22];
    v21 = -[_HDActivityGoalScheduleEntityEncoder _quantityForRow:unit:columnName:]((uint64_t)self, (uint64_t)a5, v13);
    [v10 setMondayGoal:v21];
    v14 = -[_HDActivityGoalScheduleEntityEncoder _quantityForRow:unit:columnName:]((uint64_t)self, (uint64_t)a5, v13);
    [v10 setTuesdayGoal:v14];
    v15 = -[_HDActivityGoalScheduleEntityEncoder _quantityForRow:unit:columnName:]((uint64_t)self, (uint64_t)a5, v13);
    [v10 setWednesdayGoal:v15];
    v16 = -[_HDActivityGoalScheduleEntityEncoder _quantityForRow:unit:columnName:]((uint64_t)self, (uint64_t)a5, v13);
    [v10 setThursdayGoal:v16];
    v17 = -[_HDActivityGoalScheduleEntityEncoder _quantityForRow:unit:columnName:]((uint64_t)self, (uint64_t)a5, v13);
    [v10 setFridayGoal:v17];
    v18 = -[_HDActivityGoalScheduleEntityEncoder _quantityForRow:unit:columnName:]((uint64_t)self, (uint64_t)a5, v13);
    [v10 setSaturdayGoal:v18];
    v19 = -[_HDActivityGoalScheduleEntityEncoder _quantityForRow:unit:columnName:]((uint64_t)self, (uint64_t)a5, v13);
    [v10 setSundayGoal:v19];
  }
  return v12;
}

- (id)_quantityForRow:(uint64_t)a1 unit:(uint64_t)a2 columnName:(void *)a3
{
  if (a1)
  {
    id v3 = a3;
    HDSQLiteColumnWithNameAsDouble();
    v4 = objc_msgSend(MEMORY[0x1E4F2B370], "quantityWithUnit:doubleValue:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end