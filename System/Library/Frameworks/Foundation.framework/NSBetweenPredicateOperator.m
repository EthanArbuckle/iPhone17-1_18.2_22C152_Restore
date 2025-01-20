@interface NSBetweenPredicateOperator
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)operatorType;
@end

@implementation NSBetweenPredicateOperator

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_class();
  unint64_t v5 = [(NSBetweenPredicateOperator *)self operatorType];
  unint64_t v6 = [(NSPredicateOperator *)self modifier];

  return (id)[v4 _newOperatorWithType:v5 modifier:v6 options:0];
}

- (unint64_t)operatorType
{
  return 100;
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  BOOL result = 0;
  if (!a3 || !a4) {
    return result;
  }
  if ((_NSIsNSArray() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    v13 = +[NSString stringWithFormat:@"Can't use between operator with rhs %@ (not an array)", a4];
    goto LABEL_13;
  }
  if ([a4 count] != 2)
  {
    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    v13 = +[NSString stringWithFormat:@"Can't use between operator with rhs %@ (wrong number of elements)", a4];
LABEL_13:
    objc_exception_throw((id)[v11 exceptionWithName:v12 reason:v13 userInfo:0]);
  }
  v8 = [(NSPredicateOperator *)self selector];
  v9 = (void *)[a4 objectAtIndex:0];
  uint64_t v10 = [a4 objectAtIndex:1];
  if (objc_msgSend(v9, v8, v10) == (id)1)
  {
    v9 = (void *)[a4 objectAtIndex:1];
    uint64_t v10 = [a4 objectAtIndex:0];
  }
  return (unint64_t)objc_msgSend(v9, v8, a3) + 1 <= 1 && (unint64_t)objc_msgSend(a3, v8, v10) + 1 < 2;
}

@end