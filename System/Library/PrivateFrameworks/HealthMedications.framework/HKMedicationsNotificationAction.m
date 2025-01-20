@interface HKMedicationsNotificationAction
+ (id)rawValueWithIdentifier:(int64_t)a3;
+ (int64_t)identifierWithRawValue:(id)a3;
@end

@implementation HKMedicationsNotificationAction

+ (int64_t)identifierWithRawValue:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F446D0]])
  {
    int64_t v5 = 4;
  }
  else if ([v4 isEqualToString:@"RecordAllMedications"])
  {
    int64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"SkipAllMedications"])
  {
    int64_t v5 = 2;
  }
  else if ([v4 isEqualToString:@"SnoozeAllMedications"])
  {
    int64_t v5 = 3;
  }
  else if ([v4 isEqualToString:@"RecordMedication"])
  {
    int64_t v5 = 5;
  }
  else if ([v4 isEqualToString:@"SkipMedication"])
  {
    int64_t v5 = 6;
  }
  else
  {
    _HKInitializeLogging();
    v6 = HKLogMedication();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[HKMedicationsNotificationAction identifierWithRawValue:v6];
    }

    int64_t v5 = 0;
  }

  return v5;
}

+ (id)rawValueWithIdentifier:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      id v4 = @"SkipAllMedications";
      break;
    case 3:
      id v4 = @"SnoozeAllMedications";
      break;
    case 4:
      id v4 = (__CFString *)(id)*MEMORY[0x1E4F446D0];
      break;
    case 5:
      id v4 = @"RecordMedication";
      break;
    case 6:
      id v4 = @"SkipMedication";
      break;
    default:
      id v4 = @"RecordAllMedications";
      break;
  }
  return v4;
}

+ (void)identifierWithRawValue:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BCB4A000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot map unhandled raw value: %{public}@.", (uint8_t *)&v3, 0x16u);
}

@end