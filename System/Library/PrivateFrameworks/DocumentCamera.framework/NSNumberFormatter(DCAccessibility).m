@interface NSNumberFormatter(DCAccessibility)
+ (id)dcaxLocalizedDouble:()DCAccessibility maximumNumberOfDigitsAfterDecimalSeparator:;
+ (id)dcaxLocalizedNumber:()DCAccessibility numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:;
+ (id)dcaxLocalizedPercentage:()DCAccessibility maximumNumberOfDigitsAfterDecimalSeparator:;
+ (id)dcaxLocalizedUnsignedInteger:()DCAccessibility;
+ (uint64_t)dcaxLocalizedDouble:()DCAccessibility;
+ (uint64_t)dcaxLocalizedNumber:()DCAccessibility;
+ (uint64_t)dcaxLocalizedNumber:()DCAccessibility maximumNumberOfDigitsAfterDecimalSeparator:;
+ (uint64_t)dcaxLocalizedNumber:()DCAccessibility numberStyle:;
+ (uint64_t)dcaxLocalizedPercentage:()DCAccessibility;
@end

@implementation NSNumberFormatter(DCAccessibility)

+ (id)dcaxLocalizedUnsignedInteger:()DCAccessibility
{
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v3 = [a1 dcaxLocalizedNumber:v2 maximumNumberOfDigitsAfterDecimalSeparator:0];

  return v3;
}

+ (uint64_t)dcaxLocalizedDouble:()DCAccessibility
{
  return objc_msgSend(a1, "dcaxLocalizedDouble:maximumNumberOfDigitsAfterDecimalSeparator:", 1);
}

+ (id)dcaxLocalizedDouble:()DCAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  v6 = [a1 dcaxLocalizedNumber:v5 maximumNumberOfDigitsAfterDecimalSeparator:a3];

  return v6;
}

+ (uint64_t)dcaxLocalizedPercentage:()DCAccessibility
{
  return objc_msgSend(a1, "dcaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:", 1);
}

+ (id)dcaxLocalizedPercentage:()DCAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  v6 = [a1 dcaxLocalizedNumber:v5 numberStyle:3 maximumNumberOfDigitsAfterDecimalSeparator:a3];

  return v6;
}

+ (uint64_t)dcaxLocalizedNumber:()DCAccessibility
{
  return [a1 dcaxLocalizedNumber:a3 maximumNumberOfDigitsAfterDecimalSeparator:1];
}

+ (uint64_t)dcaxLocalizedNumber:()DCAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  return [a1 dcaxLocalizedNumber:a3 numberStyle:1 maximumNumberOfDigitsAfterDecimalSeparator:a4];
}

+ (uint64_t)dcaxLocalizedNumber:()DCAccessibility numberStyle:
{
  return [a1 dcaxLocalizedNumber:a3 numberStyle:a4 maximumNumberOfDigitsAfterDecimalSeparator:1];
}

+ (id)dcaxLocalizedNumber:()DCAccessibility numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:
{
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 setNumberStyle:a4];
  [v8 setMaximumFractionDigits:a5];
  v9 = [v8 stringFromNumber:v7];

  return v9;
}

@end