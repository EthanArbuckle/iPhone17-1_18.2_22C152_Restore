@interface NSDateComponents(StatisticsIntervalComponents)
+ (id)hk_chartStatisticsIntervalComponentsForValue:()StatisticsIntervalComponents forComponent:;
@end

@implementation NSDateComponents(StatisticsIntervalComponents)

+ (id)hk_chartStatisticsIntervalComponentsForValue:()StatisticsIntervalComponents forComponent:
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v6 setValue:a3 forComponent:a4];
  return v6;
}

@end