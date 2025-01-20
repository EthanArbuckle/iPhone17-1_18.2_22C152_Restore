@interface NSKeyPathExpression
- (NSKeyPathExpression)initWithKeyPath:(id)a3;
- (NSKeyPathExpression)initWithOperand:(id)a3 andKeyPath:(id)a4;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)keyPath;
- (id)pathExpression;
- (id)predicateFormat;
- (unint64_t)expressionType;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)dealloc;
@end

@implementation NSKeyPathExpression

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (![(NSFunctionExpression *)self _allowsEvaluation]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This expression has evaluation disabled" userInfo:0]);
  }
  v7 = [(NSFunctionExpression *)self selector];
  if (v7 != sel_valueForKeyPath_ && v7 != sel_valueForKey_)
  {
    self;
    if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
    {
      self;
      v9 = _NSOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_181795000, v9, OS_LOG_TYPE_FAULT, "NSPredicate: NSKeyPathExpression: malformed selector", buf, 2u);
      }
      +[_NSPredicateUtilities _predicateSecurityAction]();
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)NSKeyPathExpression;
  return [(NSFunctionExpression *)&v11 expressionValueWithObject:a3 context:a4];
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSKeyPathExpression;
  [(NSFunctionExpression *)&v4 acceptVisitor:a3 flags:a4];
}

- (id)predicateFormat
{
  id v3 = [(NSKeyPathExpression *)self pathExpression];
  [(NSFunctionExpression *)self operand];
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0) {
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "predicateFormat"), objc_msgSend(v3, "predicateFormat"));
  }

  return (id)[v3 predicateFormat];
}

- (id)pathExpression
{
  id v2 = [(NSFunctionExpression *)self arguments];

  return (id)[v2 objectAtIndex:0];
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)NSKeyPathExpression;
  [(NSFunctionExpression *)&v2 dealloc];
}

- (NSKeyPathExpression)initWithKeyPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_alloc_init(NSSelfExpression);
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a3, 0);
  v7 = sel_valueForKeyPath_;
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend((id)objc_msgSend(a3, "keyPath"), "rangeOfString:", @".");
    if (!v8) {
      v7 = sel_valueForKey_;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)NSKeyPathExpression;
  v9 = [(NSFunctionExpression *)&v11 initWithExpressionType:3 operand:v5 selector:v7 argumentArray:v6];

  return v9;
}

- (NSKeyPathExpression)initWithOperand:(id)a3 andKeyPath:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a4, 0);
  v9.receiver = self;
  v9.super_class = (Class)NSKeyPathExpression;
  v7 = [(NSFunctionExpression *)&v9 initWithExpressionType:4 operand:a3 selector:sel_valueForKeyPath_ argumentArray:v6];

  return v7;
}

- (unint64_t)expressionType
{
  if (self->super.super._expressionType == 4) {
    return 4;
  }
  else {
    return 3;
  }
}

- (id)keyPath
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(NSFunctionExpression *)self operand];
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "objectAtIndex:", 0);
    return (id)[v3 keyPath];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NSKeyPathExpression;
    return [(NSExpression *)&v5 keyPath];
  }
}

@end