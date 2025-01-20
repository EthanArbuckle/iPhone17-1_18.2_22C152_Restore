@interface NSSQLSubqueryExpressionIntermediatePredicateVisitor
- (BOOL)checkPredicate:(id)a3;
- (void)dealloc;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation NSSQLSubqueryExpressionIntermediatePredicateVisitor

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSSQLSubqueryExpressionIntermediatePredicateVisitor;
  [(NSSQLSubqueryExpressionIntermediatePredicateVisitor *)&v3 dealloc];
}

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v5 = [a3 expressionType];
  if (v5 == 3
    || v5 == 4
    && (sel_valueForKey_ == (char *)[a3 selector]
     || sel_valueForKeyPath_ == (char *)[a3 selector]))
  {
    if (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self->_scope, a3)) {
      self->_foundKeypath = 1;
    }
  }
}

- (BOOL)checkPredicate:(id)a3
{
  [a3 acceptVisitor:self flags:1];
  BOOL result = !self->_foundKeypath;
  self->_foundKeypath = 0;
  return result;
}

@end