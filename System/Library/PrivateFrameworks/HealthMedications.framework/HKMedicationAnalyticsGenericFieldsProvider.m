@interface HKMedicationAnalyticsGenericFieldsProvider
- (BOOL)isOntologySupportedRegion;
- (HKMedicationAnalyticsGenericFieldsProvider)initWithDataSource:(id)a3;
- (id)activePairedWatchProductType;
- (id)biologicalSex;
- (id)bucketedUserAgeForCurrentDate:(id)a3;
- (id)userAgeForCurrentDate:(id)a3;
- (void)biologicalSex;
@end

@implementation HKMedicationAnalyticsGenericFieldsProvider

- (HKMedicationAnalyticsGenericFieldsProvider)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMedicationAnalyticsGenericFieldsProvider;
  v6 = [(HKMedicationAnalyticsGenericFieldsProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (id)activePairedWatchProductType
{
  v2 = [MEMORY[0x1E4F79EF0] sharedInstance];
  v3 = [v2 getActivePairedDevice];

  v4 = [v3 valueForProperty:*MEMORY[0x1E4F79E18]];

  return v4;
}

- (id)biologicalSex
{
  dataSource = self->_dataSource;
  id v9 = 0;
  v3 = [(HKAnalyticsHealthDataSource *)dataSource biologicalSexWithError:&v9];
  id v4 = v9;
  if (v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogMedication();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[HKMedicationAnalyticsGenericFieldsProvider biologicalSex]();
    }

    goto LABEL_7;
  }
  unint64_t v6 = [v3 biologicalSex];
  if (v6 > 3)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v7 = off_1E62EBA80[v6];
LABEL_8:

  return v7;
}

- (id)userAgeForCurrentDate:(id)a3
{
  dataSource = self->_dataSource;
  id v9 = 0;
  id v4 = [(HKAnalyticsHealthDataSource *)dataSource ageWithCurrentDate:a3 error:&v9];
  id v5 = v9;
  if (v5)
  {
    _HKInitializeLogging();
    unint64_t v6 = HKLogMedication();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[HKMedicationAnalyticsGenericFieldsProvider userAgeForCurrentDate:]();
    }

    id v7 = 0;
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (BOOL)isOntologySupportedRegion
{
  return +[HKMedicationDeviceConfiguration supportsOntologyBackedMedications];
}

- (id)bucketedUserAgeForCurrentDate:(id)a3
{
  v3 = [(HKMedicationAnalyticsGenericFieldsProvider *)self userAgeForCurrentDate:a3];
  if (v3)
  {
    id v4 = v3;
    id v5 = HKMedicationsBucketedDecadeForAge(v3);
  }
  else
  {
    id v5 = 0;
  }
  if (v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = &unk_1F17192B0;
  }
  id v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
}

- (void)biologicalSex
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_1_0(&dword_1BCB4A000, v2, v3, "[%{public}@] Unable access biological sex due to error: %{public}@", v4, v5, v6, v7, v8);
}

- (void)userAgeForCurrentDate:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_1_0(&dword_1BCB4A000, v2, v3, "[%{public}@] Unable access age due to error: %{public}@", v4, v5, v6, v7, v8);
}

@end