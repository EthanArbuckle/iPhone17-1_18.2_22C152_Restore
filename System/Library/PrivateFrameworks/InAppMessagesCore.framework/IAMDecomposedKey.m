@interface IAMDecomposedKey
- (BOOL)hasPredicates;
- (BOOL)predicatesMatchFigaroEventProperties:(id)a3;
- (IAMDecomposedKey)init;
- (NSMutableDictionary)ruleDestructuredIdentifiers;
- (void)addPredicateCondition:(id)a3;
- (void)constructCompoundPredicateIfNeeded;
- (void)setRuleDestructuredIdentifiers:(id)a3;
@end

@implementation IAMDecomposedKey

- (IAMDecomposedKey)init
{
  v7.receiver = self;
  v7.super_class = (Class)IAMDecomposedKey;
  v2 = [(IAMDecomposedKey *)&v7 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(IAMDecomposedKey *)v2 setRuleDestructuredIdentifiers:v3];

    uint64_t v4 = objc_opt_new();
    rawPredicateConditions = v2->rawPredicateConditions;
    v2->rawPredicateConditions = (NSMutableArray *)v4;

    v2->compoundPredicateNeedsInitialization = 1;
  }
  return v2;
}

- (void)addPredicateCondition:(id)a3
{
  rawPredicateConditions = self->rawPredicateConditions;
  v5 = (void *)[a3 copy];
  [(NSMutableArray *)rawPredicateConditions addObject:v5];

  self->compoundPredicateNeedsInitialization = 1;
}

- (BOOL)hasPredicates
{
  return [(NSMutableArray *)self->rawPredicateConditions count] != 0;
}

- (BOOL)predicatesMatchFigaroEventProperties:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->rawPredicateConditions count])
  {
    [(IAMDecomposedKey *)self constructCompoundPredicateIfNeeded];
    char v5 = [(NSCompoundPredicate *)self->compoundPredicate evaluateWithObject:v4];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (void)constructCompoundPredicateIfNeeded
{
  if (self->compoundPredicateNeedsInitialization)
  {
    id v5 = [(NSMutableArray *)self->rawPredicateConditions iam_compactMap:&__block_literal_global_0];
    v3 = (NSCompoundPredicate *)[objc_alloc(MEMORY[0x263F08730]) initWithType:1 subpredicates:v5];
    compoundPredicate = self->compoundPredicate;
    self->compoundPredicate = v3;

    self->compoundPredicateNeedsInitialization = 0;
  }
}

id __54__IAMDecomposedKey_constructCompoundPredicateIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [MEMORY[0x263F08A98] predicateWithFormat:v2];

  return v3;
}

- (NSMutableDictionary)ruleDestructuredIdentifiers
{
  return self->_ruleDestructuredIdentifiers;
}

- (void)setRuleDestructuredIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleDestructuredIdentifiers, 0);
  objc_storeStrong((id *)&self->compoundPredicate, 0);
  objc_storeStrong((id *)&self->rawPredicateConditions, 0);
}

@end