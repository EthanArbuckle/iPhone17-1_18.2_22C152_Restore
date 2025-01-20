@interface NSTokenMatchingPredicateOperator
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (SEL)selector;
- (id)symbol;
@end

@implementation NSTokenMatchingPredicateOperator

- (id)symbol
{
  id v2 = [(NSStringPredicateOperator *)self _modifierString];

  return (id)[@"TOKENMATCHES" stringByAppendingString:v2];
}

- (SEL)selector
{
  return sel_tokenmatches_;
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  if (!a3 || !a4) {
    return 0;
  }
  char v6 = [(NSStringPredicateOperator *)self flags];
  if ((v6 & 4) != 0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = v6 & 3;
    if ((v6 & 8) != 0)
    {
      v8 = +[_NSPredicateOperatorUtilities retainedLocale];
      goto LABEL_9;
    }
  }
  v8 = 0;
LABEL_9:
  if (_NSIsNSString())
  {
    v10 = +[_NSPredicateUtilities _processAndTokenize:flags:locale:]((uint64_t)_NSPredicateUtilities, (__CFString *)a3, v7, v8);
  }
  else
  {
    if ((_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && !_NSIsNSOrderedSet()) {
      goto LABEL_24;
    }
    v10 = +[_NSPredicateUtilities _collapseAndTokenize:flags:locale:]((uint64_t)_NSPredicateUtilities, a3, v7, v8);
  }
  v11 = v10;
  if (!_NSIsNSString())
  {
    if ((_NSIsNSArray() & 1) != 0 || (_NSIsNSSet() & 1) != 0 || _NSIsNSOrderedSet())
    {
      v12 = +[_NSPredicateUtilities _collapseAndTokenize:flags:locale:]((uint64_t)_NSPredicateUtilities, a4, v7, v8);
      goto LABEL_21;
    }
LABEL_24:

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unable to tokenize : %@", 0), 0 reason userInfo]);
  }
  v12 = +[_NSPredicateUtilities _processAndTokenize:flags:locale:]((uint64_t)_NSPredicateUtilities, (__CFString *)a4, v7, v8);
LABEL_21:
  v13 = v12;

  return [v11 intersectsSet:v13];
}

@end