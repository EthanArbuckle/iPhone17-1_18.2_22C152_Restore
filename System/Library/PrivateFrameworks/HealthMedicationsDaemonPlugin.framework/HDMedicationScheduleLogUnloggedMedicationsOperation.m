@interface HDMedicationScheduleLogUnloggedMedicationsOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDMedicationScheduleLogUnloggedMedicationsOperation)init;
- (HDMedicationScheduleLogUnloggedMedicationsOperation)initWithCoder:(id)a3;
- (HDMedicationScheduleLogUnloggedMedicationsOperation)initWithScheduledItemIdentifier:(id)a3 status:(int64_t)a4 logDate:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDMedicationScheduleLogUnloggedMedicationsOperation

- (HDMedicationScheduleLogUnloggedMedicationsOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDMedicationScheduleLogUnloggedMedicationsOperation)initWithScheduledItemIdentifier:(id)a3 status:(int64_t)a4 logDate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDMedicationScheduleLogUnloggedMedicationsOperation;
  v10 = [(HDMedicationScheduleLogUnloggedMedicationsOperation *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    scheduledItemIdentifier = v10->_scheduledItemIdentifier;
    v10->_scheduledItemIdentifier = (NSString *)v11;

    v10->_status = a4;
    uint64_t v13 = [v9 copy];
    logDate = v10->_logDate;
    v10->_logDate = (NSDate *)v13;
  }
  return v10;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return +[HDMedicationScheduleManager _crossReferenceScheduledItemsAndDoseEventsAndLogUnloggedWithScheduledItemIdentifier:status:logDate:profile:transaction:error:]((uint64_t)HDMedicationScheduleManager, self->_scheduledItemIdentifier, self->_status, self->_logDate, a3, a4, (uint64_t)a5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  scheduledItemIdentifier = self->_scheduledItemIdentifier;
  id v5 = a3;
  [v5 encodeObject:scheduledItemIdentifier forKey:@"ScheduledItemIdentifier"];
  [v5 encodeInteger:self->_status forKey:@"Status"];
  [v5 encodeObject:self->_logDate forKey:@"LogDate"];
}

- (HDMedicationScheduleLogUnloggedMedicationsOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDMedicationScheduleLogUnloggedMedicationsOperation;
  id v5 = [(HDMedicationScheduleLogUnloggedMedicationsOperation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ScheduledItemIdentifier"];
    scheduledItemIdentifier = v5->_scheduledItemIdentifier;
    v5->_scheduledItemIdentifier = (NSString *)v6;

    v5->_status = [v4 decodeIntegerForKey:@"Status"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LogDate"];
    logDate = v5->_logDate;
    v5->_logDate = (NSDate *)v8;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logDate, 0);
  objc_storeStrong((id *)&self->_scheduledItemIdentifier, 0);
}

@end