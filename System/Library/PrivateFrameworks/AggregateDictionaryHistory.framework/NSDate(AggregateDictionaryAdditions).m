@interface NSDate(AggregateDictionaryAdditions)
+ (uint64_t)dateForDaysSince1970:()AggregateDictionaryAdditions;
+ (uint64_t)daysSince1970;
@end

@implementation NSDate(AggregateDictionaryAdditions)

+ (uint64_t)dateForDaysSince1970:()AggregateDictionaryAdditions
{
  return [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(86400 * a3)];
}

+ (uint64_t)daysSince1970
{
  return ((int)time(0) / 86400);
}

@end