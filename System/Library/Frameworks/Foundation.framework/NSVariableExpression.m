@interface NSVariableExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSVariableExpression)initWithCoder:(id)a3;
- (NSVariableExpression)initWithObject:(id)a3;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)predicateFormat;
- (id)variable;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSVariableExpression

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSVariableExpression)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v7.receiver = self;
  v7.super_class = (Class)NSVariableExpression;
  v5 = [(NSExpression *)&v7 initWithCoder:a3];
  if (v5) {
    v5->_variable = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSVariable"];
  }
  return v5;
}

- (unint64_t)expressionType
{
  return 2;
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  }
  v3 = self;
  uint64_t v4 = [a3 objectForKey:self->_variable];
  if (!v4) {
    return v3;
  }
  v5 = (void *)v4;
  if ([MEMORY[0x1E4F1CA98] null] == v4)
  {
    objc_super v7 = 0;
  }
  else
  {
    if (objc_opt_isKindOfClass()) {
      return v5;
    }
    objc_super v7 = v5;
  }

  return +[NSExpression expressionForConstantValue:v7];
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = (void *)[a3 variable];
  id v6 = [(NSVariableExpression *)self variable];

  return [v5 isEqual:v6];
}

- (id)variable
{
  return self->_variable;
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (![(NSExpression *)self _allowsEvaluation])
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    v12 = (NSString *)@"This expression has evaluation disabled";
    goto LABEL_12;
  }
  uint64_t v7 = [a4 objectForKey:self->_variable];
  if (!v7)
  {
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v12 = +[NSString stringWithFormat:@"Can't get value for '%@' in bindings %@.", self->_variable, a4];
    v10 = v13;
    uint64_t v11 = v14;
LABEL_12:
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v12 userInfo:0]);
  }
  uint64_t v8 = (void *)v7;
  if ([MEMORY[0x1E4F1CA98] null] == v7) {
    return 0;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return v8;
  }

  return (id)[v8 expressionValueWithObject:a3 context:a4];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSVariableExpression;
  [(NSVariableExpression *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  variable = self->_variable;

  return (id)[v4 initWithObject:variable];
}

- (NSVariableExpression)initWithObject:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSVariableExpression;
  id v4 = [(NSExpression *)&v6 initWithExpressionType:2];
  v4->_variable = (NSString *)a3;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSVariableExpression;
  [(NSExpression *)&v5 encodeWithCoder:a3];
  [a3 encodeObject:self->_variable forKey:@"NSVariable"];
}

- (id)predicateFormat
{
  id v2 = [(NSVariableExpression *)self variable];
  BOOL v3 = +[_NSPredicateUtilities _isReservedWordInParser:v2];
  id v4 = &stru_1ECA5C228;
  if (v3) {
    id v4 = @"#";
  }
  return +[NSString stringWithFormat:@"$%@%@", v4, v2];
}

- (unint64_t)hash
{
  id v2 = [(NSVariableExpression *)self variable];

  return [v2 hash];
}

@end