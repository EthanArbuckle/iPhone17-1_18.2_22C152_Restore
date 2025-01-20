@interface GKRule
+ (GKRule)ruleWithBlockPredicate:(void *)predicate action:(void *)action;
+ (GKRule)ruleWithPredicate:(NSPredicate *)predicate assertingFact:(id)fact grade:(float)grade;
+ (GKRule)ruleWithPredicate:(NSPredicate *)predicate retractingFact:(id)fact grade:(float)grade;
- (BOOL)evaluatePredicateWithSystem:(GKRuleSystem *)system;
- (NSInteger)salience;
- (void)setSalience:(NSInteger)salience;
@end

@implementation GKRule

- (BOOL)evaluatePredicateWithSystem:(GKRuleSystem *)system
{
  return 0;
}

+ (GKRule)ruleWithPredicate:(NSPredicate *)predicate assertingFact:(id)fact grade:(float)grade
{
  id v7 = fact;
  v8 = predicate;
  v9 = [_GKNSPredicateRule alloc];
  *(float *)&double v10 = grade;
  v11 = [(_GKNSPredicateRule *)v9 initWithPredicate:v8 fact:v7 grade:1 asserting:v10];

  return (GKRule *)v11;
}

+ (GKRule)ruleWithPredicate:(NSPredicate *)predicate retractingFact:(id)fact grade:(float)grade
{
  id v7 = fact;
  v8 = predicate;
  v9 = [_GKNSPredicateRule alloc];
  *(float *)&double v10 = grade;
  v11 = [(_GKNSPredicateRule *)v9 initWithPredicate:v8 fact:v7 grade:0 asserting:v10];

  return (GKRule *)v11;
}

+ (GKRule)ruleWithBlockPredicate:(void *)predicate action:(void *)action
{
  v5 = action;
  v6 = predicate;
  id v7 = [[_GKBlockRule alloc] initWithPredicate:v6 action:v5];

  return (GKRule *)v7;
}

- (NSInteger)salience
{
  return self->_salience;
}

- (void)setSalience:(NSInteger)salience
{
  self->_salience = salience;
}

@end