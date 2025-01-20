@interface HDMedicationScheduleInsertOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDMedicationScheduleInsertOperation)init;
- (HDMedicationScheduleInsertOperation)initWithCoder:(id)a3;
- (HDMedicationScheduleInsertOperation)initWithMedicationSchedules:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDMedicationScheduleInsertOperation

- (HDMedicationScheduleInsertOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDMedicationScheduleInsertOperation)initWithMedicationSchedules:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDMedicationScheduleInsertOperation;
  v10 = [(HDMedicationScheduleInsertOperation *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_schedules, a3);
    v11->_syncProvenance = a4;
    v11->_syncIdentity = a5;
  }

  return v11;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a3 healthMedicationsProfileExtension];
  v10 = [v9 medicationScheduleManager];
  LOBYTE(a5) = -[HDMedicationScheduleManager _insertMedicationSchedules:syncProvenance:syncIdentity:transaction:error:]((uint64_t)v10, self->_schedules, self->_syncProvenance, self->_syncIdentity, v8, (uint64_t)a5);

  return (char)a5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  schedules = self->_schedules;
  id v5 = a3;
  [v5 encodeObject:schedules forKey:@"schedules"];
  [v5 encodeInt64:self->_syncIdentity forKey:@"sync_identity"];
  [v5 encodeInt64:self->_syncProvenance forKey:@"sync_provenance"];
}

- (HDMedicationScheduleInsertOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDMedicationScheduleInsertOperation;
  id v5 = [(HDMedicationScheduleInsertOperation *)&v10 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"schedules"];
    schedules = v5->_schedules;
    v5->_schedules = (NSArray *)v7;

    v5->_syncProvenance = [v4 decodeInt64ForKey:@"sync_provenance"];
    v5->_syncIdentity = -1;
    if ([v4 containsValueForKey:@"sync_identity"]) {
      v5->_syncIdentity = [v4 decodeInt64ForKey:@"sync_identity"];
    }
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end