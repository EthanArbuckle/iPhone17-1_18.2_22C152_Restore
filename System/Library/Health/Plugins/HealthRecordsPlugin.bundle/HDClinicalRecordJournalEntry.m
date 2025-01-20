@interface HDClinicalRecordJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDClinicalRecordJournalEntry)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDClinicalRecordJournalEntry

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

- (HDClinicalRecordJournalEntry)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HDClinicalRecordJournalEntry;
  return [(HDClinicalRecordJournalEntry *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2 object:self file:@"HDClinicalRecordEntity+HealthRecordsPlugin.m" lineNumber:470 description:@"Encoding is not supported"];
}

@end