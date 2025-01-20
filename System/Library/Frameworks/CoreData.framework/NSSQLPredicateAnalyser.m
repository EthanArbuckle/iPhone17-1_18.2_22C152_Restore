@interface NSSQLPredicateAnalyser
- (NSSQLPredicateAnalyser)init;
- (void)dealloc;
- (void)visitPredicate:(id)a3;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation NSSQLPredicateAnalyser

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v5 = [a3 expressionType];
  if (v5 != 3)
  {
    if (v5 != 4)
    {
      if ((unint64_t)(v5 - 5) >= 3)
      {
        if (v5 != 13) {
          return;
        }
        uint64_t v6 = 40;
      }
      else
      {
        uint64_t v6 = 32;
      }
      goto LABEL_10;
    }
    if (sel_valueForKey_ != (char *)[a3 selector]
      && sel_valueForKeyPath_ != (char *)[a3 selector])
    {
      return;
    }
  }
  uint64_t v6 = 16;
LABEL_10:
  v7 = *(Class *)((char *)&self->super.isa + v6);

  [v7 addObject:a3];
}

- (void)visitPredicate:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 comparisonPredicateModifier] == 1)
  {
    allModifierPredicates = self->_allModifierPredicates;
    [(NSMutableArray *)allModifierPredicates addObject:a3];
  }
}

- (NSSQLPredicateAnalyser)init
{
  v4.receiver = self;
  v4.super_class = (Class)NSSQLPredicateAnalyser;
  v2 = [(NSSQLPredicateAnalyser *)&v4 init];
  if (v2)
  {
    v2->_keys = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_allModifierPredicates = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_setExpressions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_subqueries = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_compoundPredicate = 0;
  }
  return v2;
}

- (void)dealloc
{
  self->_keys = 0;
  self->_allModifierPredicates = 0;

  self->_setExpressions = 0;
  self->_subqueries = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLPredicateAnalyser;
  [(NSSQLPredicateAnalyser *)&v3 dealloc];
}

@end