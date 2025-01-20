@interface HDSignedClinicalDataIssuerTitleUpdateJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
@end

@implementation HDSignedClinicalDataIssuerTitleUpdateJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v4 = a4;
  uint64_t v5 = [v4 healthRecordsExtension];
  v6 = [(id)v5 createSignedClinicalDataRegistry];

  id v9 = 0;
  LOBYTE(v5) = +[HDSignedClinicalDataIssuerEntity updateIssuerTitlesUsingRegistry:v6 profile:v4 error:&v9];

  id v7 = v9;
  if ((v5 & 1) == 0)
  {
    _HKInitializeLogging();
    v8 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_ABF6C((uint64_t)v7, v8);
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end