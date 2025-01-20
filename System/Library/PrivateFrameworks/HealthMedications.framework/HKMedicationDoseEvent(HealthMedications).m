@interface HKMedicationDoseEvent(HealthMedications)
+ (id)syncIdentifierForScheduleItemIdentifier:()HealthMedications medicationIdentifier:;
+ (id)syncVersionForStatus:()HealthMedications;
@end

@implementation HKMedicationDoseEvent(HealthMedications)

+ (id)syncVersionForStatus:()HealthMedications
{
  if ((unint64_t)(a3 - 1) >= 3)
  {
    v3 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  }
  else
  {
    v3 = *(&off_1E62EAE88 + a3 - 1);
  }

  return v3;
}

+ (id)syncIdentifierForScheduleItemIdentifier:()HealthMedications medicationIdentifier:
{
  if (a3 && a4)
  {
    v4 = [NSString stringWithFormat:@"%@_%@", a4, a3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F29128] UUID];
    v4 = [v5 UUIDString];
  }

  return v4;
}

@end