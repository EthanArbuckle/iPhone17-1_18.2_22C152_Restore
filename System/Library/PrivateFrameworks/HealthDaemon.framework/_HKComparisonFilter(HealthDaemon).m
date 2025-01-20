@interface _HKComparisonFilter(HealthDaemon)
- (id)simplePredicate;
- (uint64_t)propertyForKeyPath;
@end

@implementation _HKComparisonFilter(HealthDaemon)

- (id)simplePredicate
{
  v3 = a1;
  uint64_t v4 = [a1 operatorType];
  switch(v4)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      if (v3)
      {
        v5 = (void *)MEMORY[0x1E4F65D00];
        v6 = [v3 propertyForKeyPath];
        v7 = [v3 value];
        [v3 operatorType];
        uint64_t v8 = [v5 predicateWithProperty:v6 value:v7 comparisonType:HDSQLiteComparisonTypeForPredicateOperator()];
        goto LABEL_15;
      }
      break;
    case 6:
    case 10:
      if (v3)
      {
        v10 = (void *)MEMORY[0x1E4F65D10];
        v6 = [v3 propertyForKeyPath];
        v7 = [v3 value];
        uint64_t v8 = [v10 containsPredicateWithProperty:v6 values:v7];
        goto LABEL_15;
      }
      break;
    case 7:
      if (v3)
      {
        v11 = (void *)MEMORY[0x1E4F65D00];
        v6 = [v3 propertyForKeyPath];
        v7 = [v3 value];
        uint64_t v8 = [v11 predicateWithProperty:v6 likePattern:v7];
        goto LABEL_15;
      }
      break;
    case 8:
      if (v3)
      {
        v12 = (void *)MEMORY[0x1E4F65D00];
        v6 = [v3 propertyForKeyPath];
        v7 = [v3 value];
        uint64_t v8 = [v12 predicateWithProperty:v6 beginsWithString:v7];
        goto LABEL_15;
      }
      break;
    case 9:
      if (v3)
      {
        v13 = (void *)MEMORY[0x1E4F65D00];
        v6 = [v3 propertyForKeyPath];
        v7 = [v3 value];
        uint64_t v8 = [v13 predicateWithProperty:v6 endsWithString:v7];
        goto LABEL_15;
      }
      break;
    default:
      if (v4 == 99)
      {
        if (v3)
        {
          v9 = (void *)MEMORY[0x1E4F65D00];
          v6 = [v3 propertyForKeyPath];
          v7 = [v3 value];
          uint64_t v8 = [v9 predicateWithProperty:v6 containsString:v7];
LABEL_15:
          v3 = (void *)v8;
        }
      }
      else
      {
        v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2 object:v3 file:@"HKFilter+HealthDaemon.m" lineNumber:130 description:@"Unreachable code has been executed"];

        v3 = [MEMORY[0x1E4F65D58] falsePredicate];
      }
      break;
  }

  return v3;
}

- (uint64_t)propertyForKeyPath
{
  return 0;
}

@end