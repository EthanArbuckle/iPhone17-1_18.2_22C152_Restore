@interface HKMedicalIDWeightPickerDataProvider
+ (double)defaultKilogramValue;
+ (double)getWeightInKilogramsForRow:(int64_t)a3;
+ (double)localWeightValueForRow:(int64_t)a3;
+ (double)maximumWeightInKilograms;
+ (id)titleForRow:(int64_t)a3;
+ (int64_t)numberOfRows;
+ (int64_t)rowForWeightInKilograms:(double)a3;
@end

@implementation HKMedicalIDWeightPickerDataProvider

+ (double)defaultKilogramValue
{
  return 60.0;
}

+ (double)maximumWeightInKilograms
{
  return 658.0;
}

+ (int64_t)numberOfRows
{
  v2 = +[HKPersonWeightFormatter sharedFormatter];
  uint64_t v3 = [v2 localWeightUnit];

  int64_t v4 = 1316;
  if (v3 == 1538) {
    int64_t v4 = 1451;
  }
  if (v3 == 1539) {
    return 1036;
  }
  else {
    return v4;
  }
}

+ (int64_t)rowForWeightInKilograms:(double)a3
{
  int64_t v4 = +[HKPersonWeightFormatter sharedFormatter];
  uint64_t v5 = [v4 localWeightUnit];

  if (v5 == 1538)
  {
    double v6 = a3 / 0.453592;
  }
  else if (v5 == 1539)
  {
    double v6 = a3 / 6.35029 * 10.0;
  }
  else
  {
    double v6 = a3 + a3;
  }
  return llround(v6);
}

+ (double)localWeightValueForRow:(int64_t)a3
{
  double v3 = (double)a3;
  int64_t v4 = +[HKPersonWeightFormatter sharedFormatter];
  uint64_t v5 = [v4 localWeightUnit];

  if (v5 == 14) {
    return v3 * 0.5;
  }
  if (v5 == 1539) {
    return v3 / 10.0;
  }
  return v3;
}

+ (id)titleForRow:(int64_t)a3
{
  [a1 localWeightValueForRow:a3];
  double v4 = v3;
  uint64_t v5 = +[HKPersonWeightFormatter sharedFormatter];
  uint64_t v6 = [v5 localWeightUnit];

  v7 = +[HKPersonWeightFormatter sharedFormatter];
  v8 = [v7 stringFromWeightValue:v6 inUnit:v4];

  return v8;
}

+ (double)getWeightInKilogramsForRow:(int64_t)a3
{
  double v4 = +[HKPersonWeightFormatter sharedFormatter];
  uint64_t v5 = [v4 localWeightUnit];

  double v6 = (double)a3;
  if (v5 == 1538)
  {
    double v7 = 0.453592;
  }
  else if (v5 == 1539)
  {
    double v6 = v6 / 10.0;
    double v7 = 6.35029;
  }
  else
  {
    double v7 = 0.5;
  }
  return v6 * v7;
}

@end