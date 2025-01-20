@interface NSExpression
+ (BOOL)supportsSecureCoding;
+ (NSExpression)expressionForAggregate:(NSArray *)subexpressions;
+ (NSExpression)expressionForAnyKey;
+ (NSExpression)expressionForBlock:(void *)block arguments:(NSArray *)arguments;
+ (NSExpression)expressionForConstantValue:(id)obj;
+ (NSExpression)expressionForEvaluatedObject;
+ (NSExpression)expressionForFunction:(NSExpression *)target selectorName:(NSString *)name arguments:(NSArray *)parameters;
+ (NSExpression)expressionForFunction:(NSString *)name arguments:(NSArray *)parameters;
+ (NSExpression)expressionForIntersectSet:(NSExpression *)left with:(NSExpression *)right;
+ (NSExpression)expressionForKeyPath:(NSString *)keyPath;
+ (NSExpression)expressionForMinusSet:(NSExpression *)left with:(NSExpression *)right;
+ (NSExpression)expressionForSubquery:(NSExpression *)expression usingIteratorVariable:(NSString *)variable predicate:(NSPredicate *)predicate;
+ (NSExpression)expressionForUnionSet:(NSExpression *)left with:(NSExpression *)right;
+ (NSExpression)expressionForVariable:(NSString *)string;
+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat;
+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat argumentArray:(NSArray *)arguments;
+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat arguments:(va_list)argList;
+ (id)_newKeyPathExpressionForString:(id)a3;
+ (id)expressionForSymbolicString:(id)a3;
+ (id)expressionForTernaryWithPredicate:(id)a3 trueExpression:(id)a4 falseExpression:(id)a5;
+ (id)expressionForVariableNameAssignment:(id)a3 expression:(id)a4;
- (BOOL)_allowsEvaluation;
- (BOOL)_shouldUseParensWithDescription;
- (NSArray)arguments;
- (NSExpression)falseExpression;
- (NSExpression)initWithCoder:(NSCoder *)coder;
- (NSExpression)initWithExpressionType:(NSExpressionType)type;
- (NSExpression)leftExpression;
- (NSExpression)operand;
- (NSExpression)rightExpression;
- (NSExpression)trueExpression;
- (NSExpressionType)expressionType;
- (NSPredicate)predicate;
- (NSString)function;
- (NSString)keyPath;
- (NSString)variable;
- (SEL)selector;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)collection;
- (id)constantValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)object context:(NSMutableDictionary *)context;
- (id)predicateFormat;
- (id)subexpression;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)encodeWithCoder:(id)a3;
- (void)expressionBlock;
@end

@implementation NSExpression

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if (a4) {
    [a3 visitPredicateExpression:self];
  }
}

- (BOOL)_allowsEvaluation
{
  return (*(unsigned char *)&self->_expressionFlags & 1) == 0;
}

- (BOOL)_shouldUseParensWithDescription
{
  return 0;
}

+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat
{
  va_start(va, expressionFormat);
  return (NSExpression *)objc_msgSend(a1, "expressionWithFormat:arguments:", expressionFormat, va, va);
}

+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat arguments:(va_list)argList
{
  v4 = +[NSPredicate predicateWithFormat:arguments:](NSPredicate, "predicateWithFormat:arguments:", +[NSString stringWithFormat:@"%@ == 1", expressionFormat], argList);

  return (NSExpression *)[(NSPredicate *)v4 leftExpression];
}

- (NSExpression)initWithExpressionType:(NSExpressionType)type
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSExpression;
  result = [(NSExpression *)&v5 init];
  if (result) {
    result->_expressionType = type;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  NSExpressionType v5 = [(NSExpression *)self expressionType];

  [a3 encodeInteger:v5 forKey:@"NSExpressionType"];
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (!a3) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Cannot substitute a nil substitution dictionary.", 0, v3, v4));
  }
  return self;
}

+ (NSExpression)expressionForConstantValue:(id)obj
{
  uint64_t v3 = [[NSConstantValueExpression alloc] initWithObject:obj];

  return (NSExpression *)v3;
}

- (void)allowEvaluation
{
  *(_DWORD *)&self->_expressionFlags &= ~1u;
}

- (NSExpression)initWithCoder:(NSCoder *)coder
{
  if (![(NSCoder *)coder allowsKeyedCoding])
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  NSExpressionType v5 = [(NSExpression *)self initWithExpressionType:[(NSCoder *)coder decodeIntegerForKey:@"NSExpressionType"]];
  if (v5 && [(NSCoder *)coder requiresSecureCoding]) {
    *(_DWORD *)&v5->_expressionFlags |= 1u;
  }
  return v5;
}

+ (NSExpression)expressionForKeyPath:(NSString *)keyPath
{
  uint64_t v3 = (void *)[a1 _newKeyPathExpressionForString:keyPath];
  uint64_t v4 = [[NSKeyPathExpression alloc] initWithKeyPath:v3];

  return &v4->super.super;
}

+ (id)_newKeyPathExpressionForString:(id)a3
{
  uint64_t v4 = [NSKeyPathSpecifierExpression alloc];

  return [(NSKeyPathSpecifierExpression *)v4 initWithObject:a3];
}

+ (NSExpression)expressionForEvaluatedObject
{
  v2 = objc_alloc_init(NSSelfExpression);

  return (NSExpression *)v2;
}

+ (NSExpression)expressionForSubquery:(NSExpression *)expression usingIteratorVariable:(NSString *)variable predicate:(NSPredicate *)predicate
{
  NSExpressionType v5 = [[NSSubqueryExpression alloc] initWithExpression:expression usingIteratorVariable:variable predicate:predicate];

  return (NSExpression *)v5;
}

+ (NSExpression)expressionForVariable:(NSString *)string
{
  uint64_t v3 = [[NSVariableExpression alloc] initWithObject:string];

  return (NSExpression *)v3;
}

+ (NSExpression)expressionForFunction:(NSString *)name arguments:(NSArray *)parameters
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  SEL v6 = NSSelectorFromString(name);
  self;
  if ([*(id *)_CFPredicatePolicyData() objectForKey:name])
  {
    LODWORD(v7) = 0;
  }
  else
  {
    self;
    v8 = _NSOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = name;
      _os_log_fault_impl(&dword_181795000, v8, OS_LOG_TYPE_FAULT, "NSPredicate: Use of '%{public}@' as an NSExpression function is forbidden.", buf, 0xCu);
    }
    self;
    unint64_t v7 = ((unint64_t)_CFPredicatePolicyData_getFlags() >> 3) & 1;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || v7) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ is not a supported method.", name), 0 reason userInfo]);
  }
  return (NSExpression *)[[NSFunctionExpression alloc] initWithSelector:v6 argumentArray:parameters];
}

+ (id)expressionForTernaryWithPredicate:(id)a3 trueExpression:(id)a4 falseExpression:(id)a5
{
  NSExpressionType v5 = [[NSTernaryExpression alloc] initWithPredicate:a3 trueExpression:a4 falseExpression:a5];

  return v5;
}

+ (NSExpression)expressionForFunction:(NSExpression *)target selectorName:(NSString *)name arguments:(NSArray *)parameters
{
  NSExpressionType v5 = [[NSFunctionExpression alloc] initWithTarget:target selectorName:name arguments:parameters];

  return (NSExpression *)v5;
}

+ (NSExpression)expressionWithFormat:(NSString *)expressionFormat argumentArray:(NSArray *)arguments
{
  uint64_t v4 = +[NSPredicate predicateWithFormat:argumentArray:](NSPredicate, "predicateWithFormat:argumentArray:", +[NSString stringWithFormat:@"%@ == 1", expressionFormat], arguments);

  return (NSExpression *)[(NSPredicate *)v4 leftExpression];
}

+ (id)expressionForSymbolicString:(id)a3
{
  uint64_t v3 = [[NSSymbolicExpression alloc] initWithString:a3];

  return v3;
}

+ (NSExpression)expressionForAggregate:(NSArray *)subexpressions
{
  uint64_t v3 = [[NSAggregateExpression alloc] initWithCollection:subexpressions];

  return (NSExpression *)v3;
}

+ (id)expressionForVariableNameAssignment:(id)a3 expression:(id)a4
{
  uint64_t v4 = [[NSVariableAssignmentExpression alloc] initWithAssignmentVariable:a3 expression:a4];

  return v4;
}

+ (NSExpression)expressionForUnionSet:(NSExpression *)left with:(NSExpression *)right
{
  uint64_t v4 = [[NSSetExpression alloc] initWithType:5 leftExpression:left rightExpression:right];

  return (NSExpression *)v4;
}

+ (NSExpression)expressionForIntersectSet:(NSExpression *)left with:(NSExpression *)right
{
  uint64_t v4 = [[NSSetExpression alloc] initWithType:6 leftExpression:left rightExpression:right];

  return (NSExpression *)v4;
}

+ (NSExpression)expressionForMinusSet:(NSExpression *)left with:(NSExpression *)right
{
  uint64_t v4 = [[NSSetExpression alloc] initWithType:7 leftExpression:left rightExpression:right];

  return (NSExpression *)v4;
}

+ (NSExpression)expressionForBlock:(void *)block arguments:(NSArray *)arguments
{
  uint64_t v4 = [[NSBlockExpression alloc] initWithType:19 block:block arguments:arguments];

  return (NSExpression *)v4;
}

+ (NSExpression)expressionForAnyKey
{
  v2 = objc_alloc_init(NSAnyKeyExpression);

  return (NSExpression *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSExpressionType v5 = NSClassFromString((NSString *)@"NSPredicate");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (id)expressionValueWithObject:(id)object context:(NSMutableDictionary *)context
{
  SEL v6 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)predicateFormat
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpressionType)expressionType
{
  return self->_expressionType;
}

- (NSString)keyPath
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)constantValue
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)variable
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)function
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)operand
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (SEL)selector
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSArray)arguments
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)leftExpression
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)rightExpression
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSPredicate)predicate
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)collection
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)subexpression
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)trueExpression
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSExpression)falseExpression
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)expressionBlock
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSExpression");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end