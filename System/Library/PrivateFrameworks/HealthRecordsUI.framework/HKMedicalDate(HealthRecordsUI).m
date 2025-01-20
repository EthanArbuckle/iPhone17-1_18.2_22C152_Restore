@interface HKMedicalDate(HealthRecordsUI)
- (uint64_t)hr_dateWithoutTime;
@end

@implementation HKMedicalDate(HealthRecordsUI)

- (uint64_t)hr_dateWithoutTime
{
  unint64_t v2 = [a1 form];
  if (v2 <= 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = v2;
  }
  return [a1 displayStringWithPreferredForm:v3 includeTimeZone:0];
}

@end