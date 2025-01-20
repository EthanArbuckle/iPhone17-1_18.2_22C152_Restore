@interface GKNSPredicateRule
- (BOOL)evaluatePredicateWithSystem:(GKRuleSystem *)system;
- (GKNSPredicateRule)initWithPredicate:(NSPredicate *)predicate;
- (NSPredicate)predicate;
@end

@implementation GKNSPredicateRule

- (GKNSPredicateRule)initWithPredicate:(NSPredicate *)predicate
{
  v5 = predicate;
  v9.receiver = self;
  v9.super_class = (Class)GKNSPredicateRule;
  v6 = [(GKNSPredicateRule *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_predicate, predicate);
  }

  return v7;
}

- (BOOL)evaluatePredicateWithSystem:(GKRuleSystem *)system
{
  predicate = self->_predicate;
  v4 = system;
  v5 = [(GKRuleSystem *)v4 state];
  LOBYTE(predicate) = [(NSPredicate *)predicate evaluateWithObject:v4 substitutionVariables:v5];

  return (char)predicate;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
}

@end