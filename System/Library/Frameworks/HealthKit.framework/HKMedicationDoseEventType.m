@interface HKMedicationDoseEventType
+ (id)allTypes;
+ (id)medicationDoseEventType;
- (BOOL)supportsStatisticOptions:(unint64_t)a3;
- (id)canonicalUnitForStatistics;
- (id)underlyingSampleType;
- (int64_t)aggregationStyleForStatistics;
- (void)validateUnitForStatistic:(id)a3;
@end

@implementation HKMedicationDoseEventType

+ (id)allTypes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 medicationDoseEventTypeForIdentifier:@"HKMedicationDoseEventTypeIdentifierMedicationDoseEvent"];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)medicationDoseEventType
{
  return (id)[a1 medicationDoseEventTypeForIdentifier:@"HKMedicationDoseEventTypeIdentifierMedicationDoseEvent"];
}

- (id)underlyingSampleType
{
  return +[HKMedicationDoseEventType medicationDoseEventType];
}

- (int64_t)aggregationStyleForStatistics
{
  return 0;
}

- (id)canonicalUnitForStatistics
{
  return +[HKUnit countUnit];
}

- (BOOL)supportsStatisticOptions:(unint64_t)a3
{
  if ((a3 & 0xE) != 0) {
    return 0;
  }
  unint64_t v5 = _HKStatisticsOptionPercentile() & a3;
  BOOL result = 0;
  if (v5 != _HKStatisticsOptionPercentile())
  {
    if ((a3 & 0x40) == 0) {
      return 1;
    }
    unint64_t v6 = _HKStatisticOptionsAverageSampleDuration() & a3;
    if (v6 != _HKStatisticOptionsAverageSampleDuration()) {
      return 1;
    }
  }
  return result;
}

- (void)validateUnitForStatistic:(id)a3
{
  id v10 = a3;
  v4 = [(HKMedicationDoseEventType *)self canonicalUnitForStatistics];
  char v5 = [v10 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = objc_opt_class();
    v9 = [(HKMedicationDoseEventType *)self canonicalUnitForStatistics];
    [v6 raise:v7, @"%@ %@ requires unit of type %@. Incompatible unit: %@", v8, self, v9, v10 format];
  }
}

@end