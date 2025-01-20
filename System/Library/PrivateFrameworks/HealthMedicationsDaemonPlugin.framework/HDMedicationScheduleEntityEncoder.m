@interface HDMedicationScheduleEntityEncoder
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
@end

@implementation HDMedicationScheduleEntityEncoder

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v9 = [(HDEntityEncoder *)self profile];
  v10 = [(HDEntityEncoder *)self transaction];
  v11 = +[HDMedicationScheduleEntity _codableRepresentationForMedicationScheduleID:row:profile:transaction:error:]((uint64_t)HDMedicationScheduleEntity, a3, (uint64_t)a4, v9, v10, (uint64_t)a5);

  return v11;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v8 = [(HDEntityEncoder *)self transaction];
  v9 = +[HDMedicationScheduleEntity _medicationScheduleFromRow:persistentID:transaction:error:]((uint64_t)HDMedicationScheduleEntity, (uint64_t)a4, a3, v8, (NSObject **)a5);

  return v9;
}

@end