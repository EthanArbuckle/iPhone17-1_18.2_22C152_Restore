@interface _HKBooleanFilter(HealthDaemon)
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKBooleanFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  if ([a1 value]) {
    [MEMORY[0x1E4F65D58] truePredicate];
  }
  else {
  v1 = [MEMORY[0x1E4F65D58] falsePredicate];
  }

  return v1;
}

@end