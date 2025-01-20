@interface NSVariableAssignmentExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSVariableAssignmentExpression)initWithAssignmentExpression:(id)a3 expression:(id)a4;
- (NSVariableAssignmentExpression)initWithAssignmentVariable:(id)a3 expression:(id)a4;
- (NSVariableAssignmentExpression)initWithCoder:(id)a3;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)assignmentVariable;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)predicateFormat;
- (id)subexpression;
- (id)variable;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSVariableAssignmentExpression

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSVariableAssignmentExpression;
  [(NSVariableAssignmentExpression *)&v3 dealloc];
}

- (NSVariableAssignmentExpression)initWithAssignmentVariable:(id)a3 expression:(id)a4
{
  v6 = [+[NSVariableExpression allocWithZone:[(NSVariableAssignmentExpression *)self zone]] initWithObject:a3];
  v7 = [(NSVariableAssignmentExpression *)self initWithAssignmentExpression:v6 expression:a4];

  return v7;
}

- (NSVariableAssignmentExpression)initWithAssignmentExpression:(id)a3 expression:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSVariableAssignmentExpression;
  v6 = [(NSExpression *)&v8 initWithExpressionType:12];
  v6->_assignmentVariable = (NSVariableExpression *)a3;
  v6->_subexpression = (NSExpression *)a4;
  return v6;
}

- (unint64_t)expressionType
{
  return 12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)allowEvaluation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(NSExpression *)self->_assignmentVariable allowEvaluation];
  [(NSExpression *)self->_subexpression allowEvaluation];
  v3.receiver = self;
  v3.super_class = (Class)NSVariableAssignmentExpression;
  [(NSExpression *)&v3 allowEvaluation];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSVariableAssignmentExpression;
  [(NSExpression *)&v5 encodeWithCoder:a3];
  objc_msgSend(a3, "encodeObject:forKey:", -[NSVariableExpression variable](self->_assignmentVariable, "variable"), @"NSAssignmentVariable");
  [a3 encodeObject:self->_subexpression forKey:@"NSSubexpression"];
}

- (NSVariableAssignmentExpression)initWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v14.receiver = self;
  v14.super_class = (Class)NSVariableAssignmentExpression;
  objc_super v5 = [(NSExpression *)&v14 initWithCoder:a3];
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
    uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSAssignmentVariable"];
    v10 = [[NSVariableExpression alloc] initWithObject:v9];
    v5->_assignmentVariable = v10;
    *(_DWORD *)&v10->super._expressionFlags |= 1u;
    v5->_subexpression = (NSExpression *)(id)[a3 decodeObjectOfClasses:v8 forKey:@"NSSubexpression"];
    if (objc_opt_isKindOfClass())
    {
      if (v9)
      {
        v11 = 0;
        if (!v7)
        {
LABEL_14:
          if (v11)
          {

            objc_exception_throw(v11);
          }
          return v5;
        }
LABEL_13:

        goto LABEL_14;
      }
      v12 = @"Malformed assignment expression (bad variable)";
    }
    else
    {
      v12 = @"Malformed assignment expression (bad expression)";
    }
    v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:@"NSInvalidUnarchiveOperationException" reason:v12 userInfo:0];
    if (!v7) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(NSVariableExpression *)self->_assignmentVariable copy];
  objc_super v5 = (void *)[(NSExpression *)self->_subexpression copy];
  uint64_t v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAssignmentExpression:v4 expression:v5];

  return v6;
}

- (id)assignmentVariable
{
  return self->_assignmentVariable;
}

- (id)variable
{
  return [(NSVariableExpression *)self->_assignmentVariable variable];
}

- (id)subexpression
{
  return self->_subexpression;
}

- (id)predicateFormat
{
  BOOL v3 = [(NSExpression *)self->_subexpression _shouldUseParensWithDescription];
  if (v3) {
    uint64_t v4 = CFSTR("(");
  }
  else {
    uint64_t v4 = &stru_1ECA5C228;
  }
  if (v3) {
    objc_super v5 = @"");
  }
  else {
    objc_super v5 = &stru_1ECA5C228;
  }
  return +[NSString stringWithFormat:@"%@ := %@%@%@", [(NSExpression *)self->_assignmentVariable description], v4, [(NSExpression *)self->_subexpression description], v5];
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !objc_msgSend((id)objc_msgSend(a3, "variable"), "isEqual:", -[NSVariableAssignmentExpression variable](self, "variable")))
  {
    return 0;
  }
  objc_super v5 = (void *)[a3 subexpression];
  id v6 = [(NSVariableAssignmentExpression *)self subexpression];

  return [v5 isEqual:v6];
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend(-[NSVariableAssignmentExpression variable](self, "variable"), "hash");
  return objc_msgSend(-[NSVariableAssignmentExpression subexpression](self, "subexpression"), "hash") ^ v3;
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (![(NSExpression *)self _allowsEvaluation])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    v11 = @"This expression has evaluation disabled";
    goto LABEL_6;
  }
  if (!a4)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    v11 = @"must have a bindings dictionary to do variable assignments";
LABEL_6:
    objc_exception_throw((id)[v9 exceptionWithName:v10 reason:v11 userInfo:0]);
  }
  id v7 = [(NSExpression *)self->_subexpression expressionValueWithObject:a3 context:a4];
  objc_msgSend(a4, "setObject:forKey:", v7, -[NSVariableAssignmentExpression variable](self, "variable"));
  return v7;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if (a4)
  {
    if ((a4 & 4) != 0)
    {
      [a3 visitPredicateExpression:self];
      [(NSExpression *)self->_assignmentVariable acceptVisitor:a3 flags:a4];
      subexpression = self->_subexpression;
      [(NSExpression *)subexpression acceptVisitor:a3 flags:a4];
    }
    else
    {
      [(NSExpression *)self->_assignmentVariable acceptVisitor:a3 flags:a4];
      [(NSExpression *)self->_subexpression acceptVisitor:a3 flags:a4];
      [a3 visitPredicateExpression:self];
    }
  }
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  }
  uint64_t v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssignmentExpression:expression:", objc_msgSend(-[NSVariableAssignmentExpression assignmentVariable](self, "assignmentVariable"), "_expressionWithSubstitutionVariables:", a3), objc_msgSend(-[NSVariableAssignmentExpression subexpression](self, "subexpression"), "_expressionWithSubstitutionVariables:", a3));

  return v3;
}

@end