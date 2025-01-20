@interface _HKListUserDomainConceptComparisonFilter(HealthDaemon)
- (__CFString)propertyForKeyPath;
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKListUserDomainConceptComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  v4 = [a1 keyPath];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F2A3A8]];

  if (v5)
  {
    [a1 simplePredicate];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKListUserDomainConceptComparisonFilter+HealthDaemon.m" lineNumber:25 description:@"Unreachable code has been executed"];

    [MEMORY[0x1E4F65D58] falsePredicate];
  v6 = };

  return v6;
}

- (__CFString)propertyForKeyPath
{
  v4 = [a1 keyPath];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F2A3A8]];

  if (v5)
  {
    v6 = @"list_type";
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKListUserDomainConceptComparisonFilter+HealthDaemon.m" lineNumber:34 description:@"Unreachable code has been executed"];

    v6 = &stru_1F1728D60;
  }

  return v6;
}

@end