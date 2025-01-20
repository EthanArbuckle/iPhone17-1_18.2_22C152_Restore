@interface NSNumberFormatter(PKAccessibility)
+ (id)pkaxLocalizedDouble:()PKAccessibility maximumNumberOfDigitsAfterDecimalSeparator:;
+ (id)pkaxLocalizedNumber:()PKAccessibility numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:;
+ (id)pkaxLocalizedPercentage:()PKAccessibility maximumNumberOfDigitsAfterDecimalSeparator:;
+ (id)pkaxLocalizedUnsignedInteger:()PKAccessibility;
+ (uint64_t)pkaxLocalizedDouble:()PKAccessibility;
+ (uint64_t)pkaxLocalizedNumber:()PKAccessibility;
+ (uint64_t)pkaxLocalizedNumber:()PKAccessibility maximumNumberOfDigitsAfterDecimalSeparator:;
+ (uint64_t)pkaxLocalizedNumber:()PKAccessibility numberStyle:;
+ (uint64_t)pkaxLocalizedPercentage:()PKAccessibility;
@end

@implementation NSNumberFormatter(PKAccessibility)

+ (id)pkaxLocalizedUnsignedInteger:()PKAccessibility
{
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v3 = [a1 pkaxLocalizedNumber:v2 maximumNumberOfDigitsAfterDecimalSeparator:0];

  return v3;
}

+ (uint64_t)pkaxLocalizedDouble:()PKAccessibility
{
  return objc_msgSend(a1, "pkaxLocalizedDouble:maximumNumberOfDigitsAfterDecimalSeparator:", 1);
}

+ (id)pkaxLocalizedDouble:()PKAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  v6 = [a1 pkaxLocalizedNumber:v5 maximumNumberOfDigitsAfterDecimalSeparator:a3];

  return v6;
}

+ (uint64_t)pkaxLocalizedPercentage:()PKAccessibility
{
  return objc_msgSend(a1, "pkaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:", 1);
}

+ (id)pkaxLocalizedPercentage:()PKAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  v6 = [a1 pkaxLocalizedNumber:v5 numberStyle:3 maximumNumberOfDigitsAfterDecimalSeparator:a3];

  return v6;
}

+ (uint64_t)pkaxLocalizedNumber:()PKAccessibility
{
  return [a1 pkaxLocalizedNumber:a3 maximumNumberOfDigitsAfterDecimalSeparator:1];
}

+ (uint64_t)pkaxLocalizedNumber:()PKAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  return [a1 pkaxLocalizedNumber:a3 numberStyle:1 maximumNumberOfDigitsAfterDecimalSeparator:a4];
}

+ (uint64_t)pkaxLocalizedNumber:()PKAccessibility numberStyle:
{
  return [a1 pkaxLocalizedNumber:a3 numberStyle:a4 maximumNumberOfDigitsAfterDecimalSeparator:1];
}

+ (id)pkaxLocalizedNumber:()PKAccessibility numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:
{
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 setNumberStyle:a4];
  [v8 setMaximumFractionDigits:a5];
  v9 = [v8 stringFromNumber:v7];

  return v9;
}

@end