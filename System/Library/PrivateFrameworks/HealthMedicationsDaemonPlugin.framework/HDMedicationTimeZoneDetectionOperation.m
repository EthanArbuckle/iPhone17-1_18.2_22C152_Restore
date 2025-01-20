@interface HDMedicationTimeZoneDetectionOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDMedicationTimeZoneDetectionOperation)init;
- (HDMedicationTimeZoneDetectionOperation)initWithCoder:(id)a3;
- (HDMedicationTimeZoneDetectionOperation)initWithMotive:(unint64_t)a3;
- (unint64_t)motive;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDMedicationTimeZoneDetectionOperation

- (HDMedicationTimeZoneDetectionOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDMedicationTimeZoneDetectionOperation)initWithMotive:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDMedicationTimeZoneDetectionOperation;
  result = [(HDMedicationTimeZoneDetectionOperation *)&v5 init];
  if (result) {
    result->_motive = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDMedicationTimeZoneDetectionOperation)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeInt64ForKey:@"Motive"];
  return [(HDMedicationTimeZoneDetectionOperation *)self initWithMotive:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 healthMedicationsProfileExtension];
  v11 = [v10 medicationScheduleManager];
  v12 = [v11 timeZoneManager];

  if ([v12 _isAuthorizedToFireTimeZoneNotificationWithProfile:v8])
  {
    id v31 = 0;
    v13 = +[HDMedicationScheduleEntity allActiveMedicationSchedulesWithTransaction:v9 error:&v31];
    v14 = v31;
    if (v14)
    {
      _HKInitializeLogging();
      v15 = HKLogMedication();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationTimeZoneDetectionOperation performWithProfile:transaction:error:].cold.5();
      }

      if (a5)
      {
        char v16 = 0;
        *a5 = v14;
      }
      else
      {
        _HKLogDroppedError();
        char v16 = 0;
      }
      goto LABEL_37;
    }
    if (![v13 count])
    {
      _HKInitializeLogging();
      v22 = HKLogMedication();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v33 = self;
        _os_log_impl(&dword_1BD54A000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No schedules found, disabling timezone experience", buf, 0xCu);
      }

      char v16 = [v12 _updateTimeZoneExperienceAsEnabled:0 transaction:v9 error:a5];
      goto LABEL_37;
    }
    if (self->_motive != 1)
    {
      _HKInitializeLogging();
      v23 = HKLogMedication();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v33 = self;
      }

      char v16 = 1;
      goto LABEL_37;
    }
    v30[2] = (id)0x7FFFFFFFFFFFFFFFLL;
    [MEMORY[0x1E4F1CAF0] localTimeZone];
    v29 = v30[1] = 0;
    int64_t v17 = +[HDMedicationScheduleEntity allActiveSchedulesCreatedWithinTimeZone:transaction:offsetChange:error:](HDMedicationScheduleEntity, "allActiveSchedulesCreatedWithinTimeZone:transaction:offsetChange:error:");
    id v28 = 0;
    if (v17 == 1)
    {
      _HKInitializeLogging();
      v24 = HKLogMedication();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v33 = self;
        _os_log_impl(&dword_1BD54A000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Timezone has changed, but all scheduled medications match were created in the new timezone", buf, 0xCu);
      }

      v30[0] = 0;
      char v25 = [v12 _updateTimeZoneExperienceAsEnabled:0 transaction:v9 error:v30];
      id v21 = v30[0];
      v19 = v28;
      if ((v25 & 1) == 0)
      {
        _HKInitializeLogging();
        v26 = HKLogMedication();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[HDMedicationTimeZoneDetectionOperation performWithProfile:transaction:error:].cold.4();
        }
      }
      char v16 = [v12 _updateTimeZoneOffsetOffset:0 transaction:v9 error:a5];
      goto LABEL_36;
    }
    if (!v17)
    {
      _HKInitializeLogging();
      v18 = HKLogMedication();
      v19 = v28;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationTimeZoneDetectionOperation performWithProfile:transaction:error:]();
      }

      id v20 = v28;
      id v21 = v20;
      if (v20)
      {
        if (a5)
        {
          id v21 = v20;
          char v16 = 0;
          *a5 = v21;
LABEL_36:

LABEL_37:
          goto LABEL_38;
        }
        _HKLogDroppedError();
      }
      char v16 = 0;
      goto LABEL_36;
    }
    id v21 = [v12 _mostRecentTimeZoneOffsetWithProfile:v8];
    char v16 = 1;
    v19 = v28;
    goto LABEL_36;
  }
  _HKInitializeLogging();
  v14 = HKLogMedication();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = self;
    _os_log_impl(&dword_1BD54A000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Not authorized to fire timezone notification", buf, 0xCu);
  }
  char v16 = 1;
LABEL_38:

  return v16;
}

- (unint64_t)motive
{
  return self->_motive;
}

- (void)performWithProfile:transaction:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@]: Timezone has changed, but we failed to update experience with error: %{public}@");
}

- (void)performWithProfile:transaction:error:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@]: Timezone has changed, but we failed to update offset in Key-Value Domain with error: %{public}@");
}

- (void)performWithProfile:transaction:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@]: Timezone has changed, but fetching schedules failed with '%{public}@'");
}

- (void)performWithProfile:transaction:error:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@]: Timezone has changed, but setting experience disabled failed with '%{public}@'");
}

- (void)performWithProfile:transaction:error:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to fetch schedules with error: '%{public}@'");
}

@end