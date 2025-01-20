@interface NSCompoundPredicateOperator
+ (id)andPredicateOperator;
+ (id)notPredicateOperator;
+ (id)orPredicateOperator;
+ (void)initialize;
- (BOOL)evaluatePredicates:(id)a3 withObject:(id)a4;
- (BOOL)evaluatePredicates:(id)a3 withObject:(id)a4 substitutionVariables:(id)a5;
- (id)symbol;
@end

@implementation NSCompoundPredicateOperator

- (BOOL)evaluatePredicates:(id)a3 withObject:(id)a4 substitutionVariables:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = [(NSPredicateOperator *)self operatorType];
  if (v8 == 2)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = [a3 countByEnumeratingWithState:&v24 objects:v23 count:16];
    if (!v9) {
      return v9;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
LABEL_7:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(a3);
      }
      if ([*(id *)(*((void *)&v24 + 1) + 8 * v12) evaluateWithObject:a4 substitutionVariables:a5]) {
        goto LABEL_23;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [a3 countByEnumeratingWithState:&v24 objects:v23 count:16];
        LOBYTE(v9) = 0;
        if (v10) {
          goto LABEL_7;
        }
        return v9;
      }
    }
  }
  if (v8 != 1)
  {
    if (v8) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Bad compound predicate predicateOperator type" userInfo:0]);
    }
    LOBYTE(v9) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "evaluateWithObject:substitutionVariables:", a4, a5) ^ 1;
    return v9;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = [a3 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (!v13)
  {
LABEL_23:
    LOBYTE(v9) = 1;
    return v9;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v20;
LABEL_16:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v20 != v15) {
      objc_enumerationMutation(a3);
    }
    LODWORD(v9) = [*(id *)(*((void *)&v19 + 1) + 8 * v16) evaluateWithObject:a4 substitutionVariables:a5];
    if (!v9) {
      return v9;
    }
    if (v14 == ++v16)
    {
      uint64_t v14 = [a3 countByEnumeratingWithState:&v19 objects:v18 count:16];
      LOBYTE(v9) = 1;
      if (v14) {
        goto LABEL_16;
      }
      return v9;
    }
  }
}

+ (id)andPredicateOperator
{
  return (id)_MergedGlobals_94;
}

+ (id)orPredicateOperator
{
  return (id)qword_1EB1ED1D0;
}

- (id)symbol
{
  unint64_t v2 = [(NSPredicateOperator *)self operatorType];
  if (v2 >= 3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"expressionValueWithObject: must be called on a subclass of NSExpression" userInfo:0]);
  }
  return off_1E51F6F58[v2];
}

+ (id)notPredicateOperator
{
  return (id)qword_1EB1ED1D8;
}

+ (void)initialize
{
  if (NSCompoundPredicateOperator == a1)
  {
    _MergedGlobals_94 = [(NSPredicateOperator *)[NSCompoundPredicateOperator alloc] initWithOperatorType:1];
    qword_1EB1ED1D0 = [(NSPredicateOperator *)[NSCompoundPredicateOperator alloc] initWithOperatorType:2];
    qword_1EB1ED1D8 = [(NSPredicateOperator *)[NSCompoundPredicateOperator alloc] initWithOperatorType:0];
  }
}

- (BOOL)evaluatePredicates:(id)a3 withObject:(id)a4
{
  return [(NSCompoundPredicateOperator *)self evaluatePredicates:a3 withObject:a4 substitutionVariables:0];
}

@end