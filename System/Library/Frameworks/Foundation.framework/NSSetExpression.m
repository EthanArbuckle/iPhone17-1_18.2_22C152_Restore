@interface NSSetExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSSetExpression)initWithCoder:(id)a3;
- (NSSetExpression)initWithType:(unint64_t)a3 leftExpression:(id)a4 rightExpression:(id)a5;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)leftExpression;
- (id)predicateFormat;
- (id)rightExpression;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSetExpression

- (NSSetExpression)initWithType:(unint64_t)a3 leftExpression:(id)a4 rightExpression:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSSetExpression;
  v7 = [(NSExpression *)&v9 initWithExpressionType:a3];
  if (v7)
  {
    v7->_left = (NSExpression *)a4;
    v7->_right = (NSExpression *)a5;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  self->_left = 0;
  self->_right = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSetExpression;
  [(NSSetExpression *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)allowEvaluation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(NSExpression *)self->_left allowEvaluation];
  [(NSExpression *)self->_right allowEvaluation];
  v3.receiver = self;
  v3.super_class = (Class)NSSetExpression;
  [(NSExpression *)&v3 allowEvaluation];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSSetExpression;
  [(NSExpression *)&v5 encodeWithCoder:a3];
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSetExpression leftExpression](self, "leftExpression"), @"NSLeftExpression");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSetExpression rightExpression](self, "rightExpression"), @"NSRightExpression");
}

- (NSSetExpression)initWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v12.receiver = self;
  v12.super_class = (Class)NSSetExpression;
  objc_super v5 = [(NSExpression *)&v12 initWithCoder:a3];
  if (v5)
  {
    uint64_t v6 = (void *)[a3 allowedClasses];
    uint64_t v7 = [v6 count];
    if (v7)
    {
      id v8 = (id)[v6 mutableCopy];
      objc_msgSend(v8, "unionSet:", +[_NSPredicateUtilities _expressionClassesForSecureCoding](_NSPredicateUtilities, "_expressionClassesForSecureCoding"));
    }
    else
    {
      id v8 = +[_NSPredicateUtilities _expressionClassesForSecureCoding];
    }
    v5->_left = (NSExpression *)(id)[a3 decodeObjectOfClasses:v8 forKey:@"NSLeftExpression"];
    v5->_right = (NSExpression *)(id)[a3 decodeObjectOfClasses:v8 forKey:@"NSRightExpression"];
    if (objc_opt_isKindOfClass())
    {
      if (objc_opt_isKindOfClass())
      {
        objc_super v9 = 0;
        if (!v7)
        {
LABEL_14:
          if (v9)
          {

            objc_exception_throw(v9);
          }
          return v5;
        }
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v10 = @"Malformed set expression (bad right hand side)";
    }
    else
    {
      uint64_t v10 = @"Malformed set expression (bad left hand side)";
    }
    objc_super v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v10 userInfo:0];
    if (!v7) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend(-[NSSetExpression leftExpression](self, "leftExpression", a3), "copy");
  objc_super v5 = objc_msgSend(-[NSSetExpression rightExpression](self, "rightExpression"), "copy");
  uint64_t v6 = [[NSSetExpression alloc] initWithType:[(NSExpression *)self expressionType] leftExpression:v4 rightExpression:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  NSExpressionType v5 = [(NSExpression *)self expressionType];
  if (v5 != [a3 expressionType]
    || !objc_msgSend(-[NSSetExpression leftExpression](self, "leftExpression"), "isEqual:", objc_msgSend(a3, "leftExpression")))
  {
    return 0;
  }
  id v6 = [(NSSetExpression *)self rightExpression];
  uint64_t v7 = [a3 rightExpression];

  return [v6 isEqual:v7];
}

- (id)predicateFormat
{
  NSExpressionType v3 = [(NSExpression *)self expressionType];
  uint64_t v4 = @"MINUS";
  if (v3 == NSIntersectSetExpressionType) {
    uint64_t v4 = @"INTERSECT";
  }
  if (v3 == NSUnionSetExpressionType) {
    NSExpressionType v5 = @"UNION";
  }
  else {
    NSExpressionType v5 = v4;
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ %@ %@", objc_msgSend(-[NSSetExpression leftExpression](self, "leftExpression"), "predicateFormat"), v5, objc_msgSend(-[NSSetExpression rightExpression](self, "rightExpression"), "predicateFormat"));
}

- (id)leftExpression
{
  return self->_left;
}

- (id)rightExpression
{
  return self->_right;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if (a4)
  {
    if ((a4 & 4) != 0)
    {
      [a3 visitPredicateExpression:self];
      objc_msgSend(-[NSSetExpression leftExpression](self, "leftExpression"), "acceptVisitor:flags:", a3, a4);
      id v7 = [(NSSetExpression *)self rightExpression];
      [v7 acceptVisitor:a3 flags:a4];
    }
    else
    {
      objc_msgSend(-[NSSetExpression leftExpression](self, "leftExpression"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSSetExpression rightExpression](self, "rightExpression"), "acceptVisitor:flags:", a3, a4);
      [a3 visitPredicateExpression:self];
    }
  }
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  }
  NSExpressionType v3 = -[NSSetExpression initWithType:leftExpression:rightExpression:]([NSSetExpression alloc], "initWithType:leftExpression:rightExpression:", -[NSExpression expressionType](self, "expressionType"), objc_msgSend(-[NSSetExpression leftExpression](self, "leftExpression"), "_expressionWithSubstitutionVariables:", a3), objc_msgSend(-[NSSetExpression rightExpression](self, "rightExpression"), "_expressionWithSubstitutionVariables:", a3));

  return v3;
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (![(NSExpression *)self _allowsEvaluation])
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    v20 = (NSString *)@"This expression has evaluation disabled";
    goto LABEL_33;
  }
  id v7 = (id)objc_msgSend((id)objc_msgSend(-[NSSetExpression leftExpression](self, "leftExpression"), "expressionValueWithObject:context:", a3, a4), "mutableCopy");
  id v8 = objc_msgSend(-[NSSetExpression rightExpression](self, "rightExpression"), "expressionValueWithObject:context:", a3, a4);
  if ((_NSIsNSSet() & 1) == 0)
  {
    if (_NSIsNSArray())
    {
      objc_super v9 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v10 = (uint64_t)v7;
    }
    else
    {
      if (!_NSIsNSOrderedSet())
      {
        v23 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v24 = *MEMORY[0x1E4F1C3C8];
        v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Can't evaluate set expression; left subexpression not a set (lhs = %@ rhs = %@)",
                v7,
                v8);
        goto LABEL_32;
      }
      v11 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v10 = [v7 array];
      objc_super v9 = v11;
    }
    id v7 = (id)[v9 setWithArray:v10];
  }
  if (v8 && (_NSIsNSSet() & 1) == 0)
  {
    if (_NSIsNSArray())
    {
      objc_super v12 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v13 = v8;
LABEL_17:
      id v8 = (void *)[v12 setWithArray:v13];
      goto LABEL_18;
    }
    if (_NSIsNSOrderedSet())
    {
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v15 = [v8 array];
LABEL_16:
      uint64_t v13 = (void *)v15;
      objc_super v12 = v14;
      goto LABEL_17;
    }
    if (_NSIsNSDictionary())
    {
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v15 = [v8 allValues];
      goto LABEL_16;
    }
    v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Can't evaluate set expression; right subexpression not a set (lhs = %@ rhs = %@)",
            v7,
            v8);
LABEL_32:
    v20 = v25;
    v18 = v23;
    uint64_t v19 = v24;
    goto LABEL_33;
  }
LABEL_18:
  NSExpressionType v16 = [(NSExpression *)self expressionType];
  switch(v16)
  {
    case NSMinusSetExpressionType:
      if (v8) {
        [v7 minusSet:v8];
      }
      break;
    case NSIntersectSetExpressionType:
      if (v8) {
        [v7 intersectSet:v8];
      }
      break;
    case NSUnionSetExpressionType:
      if (v8) {
        [v7 unionSet:v8];
      }
      return v7;
    default:
      v21 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v22 = *MEMORY[0x1E4F1C3C8];
      v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Can't evaluate set expression; unknown expression type (%lu)",
              v16);
      v18 = v21;
      uint64_t v19 = v22;
LABEL_33:
      objc_exception_throw((id)[v18 exceptionWithName:v19 reason:v20 userInfo:0]);
  }
  return v7;
}

@end