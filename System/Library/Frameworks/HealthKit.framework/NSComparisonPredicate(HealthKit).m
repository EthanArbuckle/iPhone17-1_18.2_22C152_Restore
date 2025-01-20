@interface NSComparisonPredicate(HealthKit)
+ (id)hk_equalityPredicateWithKey:()HealthKit value:;
+ (id)hk_inequalityPredicateWithKey:()HealthKit value:ascending:;
@end

@implementation NSComparisonPredicate(HealthKit)

+ (id)hk_inequalityPredicateWithKey:()HealthKit value:ascending:
{
  if (a5) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = (void *)MEMORY[0x1E4F28C68];
  id v8 = a4;
  v9 = [v7 expressionForKeyPath:a3];
  v10 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v8];

  v11 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v9 rightExpression:v10 modifier:0 type:v6 options:0];

  return v11;
}

+ (id)hk_equalityPredicateWithKey:()HealthKit value:
{
  v5 = (void *)MEMORY[0x1E4F28C68];
  id v6 = a4;
  v7 = [v5 expressionForKeyPath:a3];
  id v8 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v6];

  v9 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v7 rightExpression:v8 modifier:0 type:4 options:0];

  return v9;
}

@end