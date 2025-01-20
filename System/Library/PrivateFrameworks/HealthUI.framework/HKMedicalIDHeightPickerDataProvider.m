@interface HKMedicalIDHeightPickerDataProvider
+ (double)defaultCentimeterValue;
+ (id)titleForRow:(int64_t)a3 inComponent:(int64_t)a4;
+ (int64_t)heightValueForRow:(int64_t)a3 inComponent:(int64_t)a4;
+ (int64_t)numberOfRowsInComponent:(int64_t)a3;
@end

@implementation HKMedicalIDHeightPickerDataProvider

+ (double)defaultCentimeterValue
{
  v2 = +[HKPersonHeightFormatter sharedFormatter];
  int v3 = [v2 usesImperialUnits];

  double result = 168.0;
  if (v3) {
    return 167.64;
  }
  return result;
}

+ (int64_t)numberOfRowsInComponent:(int64_t)a3
{
  v4 = +[HKPersonHeightFormatter sharedFormatter];
  int v5 = [v4 usesImperialUnits];

  int64_t v6 = 12;
  if (!a3) {
    int64_t v6 = 10;
  }
  if (v5) {
    return v6;
  }
  else {
    return 300;
  }
}

+ (id)titleForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  int64_t v6 = +[HKPersonHeightFormatter sharedFormatter];
  int v7 = [v6 usesImperialUnits];

  if (v7)
  {
    v8 = +[HKPersonHeightFormatter sharedFormatter];
    v9 = v8;
    double v10 = (double)a3;
    if (a4) {
      [v8 formattedValueForInches:v10];
    }
    else {
    uint64_t v11 = [v8 formattedValueForFeet:v10];
    }
  }
  else
  {
    v9 = +[HKPersonHeightFormatter sharedFormatter];
    uint64_t v11 = [v9 formattedValueForCentimeters:(double)a3];
  }
  v12 = (void *)v11;

  return v12;
}

+ (int64_t)heightValueForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  return a3;
}

@end