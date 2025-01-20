@interface HDMedicalRecordJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDMedicalRecordJournalEntry)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDMedicalRecordJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  _HKInitializeLogging();
  v4 = (void *)HKLogDatabase;
  if (os_log_type_enabled(HKLogDatabase, OS_LOG_TYPE_ERROR)) {
    sub_ABE5C(v4);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDMedicalRecordJournalEntry)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HDMedicalRecordJournalEntry;
  return [(HDMedicalRecordJournalEntry *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2 object:self file:@"HDMedicalRecordEntity+HealthRecordsPlugin.m" lineNumber:546 description:@"Encoding is not supported"];
}

@end