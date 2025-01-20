@interface NSCalendar(HKMenstrualCycles)
- (uint64_t)hkmc_nextDateAfterDate:()HKMenstrualCycles matchingHourComponents:;
@end

@implementation NSCalendar(HKMenstrualCycles)

- (uint64_t)hkmc_nextDateAfterDate:()HKMenstrualCycles matchingHourComponents:
{
  return [a1 nextDateAfterDate:a3 matchingComponents:a4 options:2];
}

@end