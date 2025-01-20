@interface NSConstantValueExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSConstantValueExpression)initWithCoder:(id)a3;
- (NSConstantValueExpression)initWithObject:(id)a3;
- (id)constantValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)predicateFormat;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSConstantValueExpression

- (id)predicateFormat
{
  id constantValue = self->constantValue;
  if (!constantValue) {
    return @"nil";
  }
  if (_NSIsNSValue()) {
    goto LABEL_3;
  }
  if (_NSIsNSString())
  {
    return +[_NSPredicateUtilities _parserableStringDescription:]((uint64_t)_NSPredicateUtilities, (uint64_t)constantValue);
  }
  else if (_NSIsNSDate())
  {
    return +[_NSPredicateUtilities _parserableDateDescription:]((uint64_t)_NSPredicateUtilities, constantValue);
  }
  else
  {
    if ((_NSIsNSArray() & 1) == 0
      && (_NSIsNSSet() & 1) == 0
      && (_NSIsNSOrderedSet() & 1) == 0
      && !_NSIsNSDictionary())
    {
LABEL_3:
      return (id)[constantValue description];
    }
    return +[_NSPredicateUtilities _parserableCollectionDescription:]((uint64_t)_NSPredicateUtilities, constantValue);
  }
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (![(NSExpression *)self _allowsEvaluation]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This expression has evaluation disabled" userInfo:0]);
  }
  return self->constantValue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  id v2 = [(NSConstantValueExpression *)self constantValue];

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(NSConstantValueExpression *)self constantValue];
    uint64_t v6 = [a3 constantValue];
    if (!(v5 | v6) || v6 && (LODWORD(v6) = [(id)v6 isEqual:v5], v6)) {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)constantValue
{
  return self->constantValue;
}

- (NSConstantValueExpression)initWithObject:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSConstantValueExpression;
  v4 = [(NSExpression *)&v6 initWithExpressionType:0];
  v4->id constantValue = a3;
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSConstantValueExpression;
  [(NSConstantValueExpression *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v9.receiver = self;
  v9.super_class = (Class)NSConstantValueExpression;
  [(NSExpression *)&v9 encodeWithCoder:a3];
  uint64_t v5 = self;
  uint64_t v6 = objc_opt_class();
  id constantValue = self->constantValue;
  if (v5 == v6)
  {
    id constantValue = NSStringFromClass((Class)self->constantValue);
    v8 = @"NSConstantValueClassName";
  }
  else
  {
    v8 = @"NSConstantValue";
  }
  [a3 encodeObject:constantValue forKey:v8];
}

- (unint64_t)expressionType
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id constantValue = self->constantValue;

  return (id)[v4 initWithObject:constantValue];
}

- (NSConstantValueExpression)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v15.receiver = self;
  v15.super_class = (Class)NSConstantValueExpression;
  id v5 = [(NSExpression *)&v15 initWithCoder:a3];
  if (v5)
  {
    uint64_t v6 = (void *)[a3 allowedClasses];
    id v7 = +[_NSPredicateUtilities _constantValueClassesForSecureCoding];
    if (v6 && [v6 count])
    {
      id v7 = (id)[v7 mutableCopy];
      [v7 unionSet:v6];
      [v7 removeObject:objc_opt_class()];
      [v7 removeObject:objc_opt_class()];
    }
    else
    {
      id v8 = v7;
    }
    *((void *)v5 + 3) = (id)[a3 decodeObjectOfClasses:v7 forKey:@"NSConstantValue"];

    Class v9 = (Class)*((void *)v5 + 3);
    if (!v9)
    {
      uint64_t v10 = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSConstantValueClassName"];
      if (v10)
      {
        Class v9 = NSClassFromString(v10);
        *((void *)v5 + 3) = v9;
        if (!v9) {
          return (NSConstantValueExpression *)v5;
        }
      }
      else
      {
        Class v9 = (Class)*((void *)v5 + 3);
        if (!v9) {
          return (NSConstantValueExpression *)v5;
        }
      }
    }
    if (!object_isClass(v9)
      || (Name = class_getName(*((Class *)v5 + 3)), !strncmp("_NSPredicateUtilities", Name, 0x15uLL)))
    {
      if (!+[_NSPredicateUtilities _predicateEnforceRestrictionsOnTarget:forComponentName:]((uint64_t)_NSPredicateUtilities, *((objc_class **)v5 + 3), @"NSConstantValueExpression"))return (NSConstantValueExpression *)v5; {
    }
      }
    else
    {
      self;
      v12 = _NSOSLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        uint64_t v14 = *((void *)v5 + 3);
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v14;
        _os_log_fault_impl(&dword_181795000, v12, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSConstantValueExpression on a Class '%{public}@' is deprecated and will be removed in a future release.  NSConstantValueExpression should operate on instances.", buf, 0xCu);
      }
      self;
      if ((_CFPredicatePolicyData_getFlags() & 8) == 0) {
        return (NSConstantValueExpression *)v5;
      }
    }
    +[_NSPredicateUtilities _predicateSecurityAction]();
  }
  return (NSConstantValueExpression *)v5;
}

- (id)expressionValueWithObject:(id)a3
{
  if (![(NSExpression *)self _allowsEvaluation]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This expression has evaluation disabled" userInfo:0]);
  }
  return self->constantValue;
}

@end