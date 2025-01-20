@interface NSKeyPathSpecifierExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSKeyPathSpecifierExpression)initWithCoder:(id)a3;
- (NSKeyPathSpecifierExpression)initWithObject:(id)a3;
- (id)constantValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)keyPath;
- (id)predicateFormat;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSKeyPathSpecifierExpression

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a4) {
    [a3 visitPredicateExpression:self];
  }
  if (v4 & 0x10) != 0 && (objc_opt_respondsToSelector())
  {
    v7 = (void *)MEMORY[0x185308110]();
    v8 = objc_msgSend(-[NSKeyPathSpecifierExpression keyPath](self, "keyPath"), "componentsSeparatedByString:", @".");
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v15 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      v12 = &stru_1ECA5C228;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          [a3 visitPredicateExpression:self keyPathScope:v12 key:v14];
          if ([(__CFString *)v12 length]) {
            v12 = (__CFString *)[(__CFString *)v12 stringByAppendingString:@"."];
          }
          v12 = (__CFString *)[(__CFString *)v12 stringByAppendingString:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v15 count:16];
      }
      while (v10);
    }
  }
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (![(NSExpression *)self _allowsEvaluation]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This expression has evaluation disabled" userInfo:0]);
  }
  return self->_value;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)constantValue
{
  return self->_value;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyPathSpecifierExpression;
  [(NSKeyPathSpecifierExpression *)&v3 dealloc];
}

- (id)keyPath
{
  return self->_value;
}

- (NSKeyPathSpecifierExpression)initWithObject:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSKeyPathSpecifierExpression;
  uint64_t v4 = [(NSExpression *)&v6 initWithExpressionType:10];
  v4->_value = (NSString *)a3;
  return v4;
}

- (unint64_t)expressionType
{
  return 10;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSKeyPathSpecifierExpression;
  [(NSExpression *)&v5 encodeWithCoder:a3];
  [a3 encodeObject:self->_value forKey:@"NSKeyPath"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  value = self->_value;

  return (id)[v4 initWithObject:value];
}

- (NSKeyPathSpecifierExpression)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v7.receiver = self;
  v7.super_class = (Class)NSKeyPathSpecifierExpression;
  objc_super v5 = [(NSExpression *)&v7 initWithCoder:a3];
  if (v5) {
    v5->_value = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSKeyPath"];
  }
  return v5;
}

- (id)predicateFormat
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(NSString *)self->_value componentsSeparatedByString:@"."];
  id v4 = +[NSMutableString stringWithCapacity:[(NSString *)self->_value length]];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        if (v7) {
          [(NSMutableString *)v4 appendString:@"."];
        }
        if (+[_NSPredicateUtilities _isReservedWordInParser:v10])
        {
          [(NSMutableString *)v4 appendString:@"#"];
        }
        [(NSMutableString *)v4 appendString:v10];
        ++v9;
        char v7 = 1;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v6);
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = (void *)[a3 keyPath];
  id v6 = [(NSKeyPathSpecifierExpression *)self keyPath];

  return [v5 isEqual:v6];
}

- (unint64_t)hash
{
  id v2 = [(NSKeyPathSpecifierExpression *)self keyPath];

  return [v2 hash];
}

@end