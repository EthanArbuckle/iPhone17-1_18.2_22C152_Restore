@interface HDClinicalIngestionNotifyHealthRecordsDaemonOperation
- (void)main;
@end

@implementation HDClinicalIngestionNotifyHealthRecordsDaemonOperation

- (void)main
{
  _HKInitializeLogging();
  v3 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v11 = 138412290;
    *(void *)&v11[4] = objc_opt_class();
    id v5 = *(id *)&v11[4];
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Now running %@", v11, 0xCu);
  }
  v6 = [(HDClinicalIngestionOperation *)self profileExtension];
  v7 = [v6 clinicalSharingManager];

  if (v7)
  {
    v8 = [(HDClinicalIngestionOperation *)self profileExtension];
    v9 = [v8 clinicalSharingManager];
    [v9 scheduleSharing];
  }
  else
  {
    _HKInitializeLogging();
    v10 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AE4D0(self, v10);
    }
  }
}

@end