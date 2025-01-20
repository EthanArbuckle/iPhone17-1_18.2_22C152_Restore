@interface NSDateInterval(LifetimePhase)
- (uint64_t)dnds_lifetimePhaseForDate:()LifetimePhase;
@end

@implementation NSDateInterval(LifetimePhase)

- (uint64_t)dnds_lifetimePhaseForDate:()LifetimePhase
{
  id v4 = a3;
  v5 = [a1 startDate];
  v6 = [a1 endDate];
  uint64_t v7 = DNDSGetLifetimePhase(v4, (uint64_t)v5, v6);

  return v7;
}

@end