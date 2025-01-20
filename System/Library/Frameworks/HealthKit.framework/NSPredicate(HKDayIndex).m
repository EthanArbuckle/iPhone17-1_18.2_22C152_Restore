@interface NSPredicate(HKDayIndex)
+ (id)hk_predicateForSamplesInDayIndexRange:()HKDayIndex;
@end

@implementation NSPredicate(HKDayIndex)

+ (id)hk_predicateForSamplesInDayIndexRange:()HKDayIndex
{
  v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_earliestPossibleDateWithDayIndex:");
  if (a4 <= 0) {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v7 = a4 + a3 - 1;
  }
  v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_latestPossibleDateWithDayIndex:", v7);
  v9 = +[HKQuery predicateForSamplesWithStartDate:v6 endDate:v8 options:0];

  return v9;
}

@end