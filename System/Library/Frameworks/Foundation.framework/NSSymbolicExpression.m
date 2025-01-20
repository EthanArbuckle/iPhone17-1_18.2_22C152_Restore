@interface NSSymbolicExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSSymbolicExpression)initWithCoder:(id)a3;
- (NSSymbolicExpression)initWithString:(id)a3;
- (id)constantValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)predicateFormat;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSymbolicExpression

- (NSSymbolicExpression)initWithString:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSSymbolicExpression;
  v4 = [(NSExpression *)&v7 initWithExpressionType:11];
  if (!a3 || (v5 = v4, (_NSIsNSString() & 1) == 0)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't create a symbolic expression with a nil token" userInfo:0]);
  }
  v5->_token = (NSString *)a3;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)expressionType
{
  return 11;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSSymbolicExpression;
  [(NSExpression *)&v5 encodeWithCoder:a3];
  [a3 encodeObject:self->_token forKey:@"NSToken"];
}

- (NSSymbolicExpression)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v6.receiver = self;
  v6.super_class = (Class)NSSymbolicExpression;
  result = [(NSExpression *)&v6 initWithCoder:a3];
  if (result) {
    return -[NSSymbolicExpression initWithString:](result, "initWithString:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSToken"]);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  token = self->_token;

  return (id)[v4 initWithString:token];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSSymbolicExpression;
  [(NSSymbolicExpression *)&v3 dealloc];
}

- (id)predicateFormat
{
  return self->_token;
}

- (id)constantValue
{
  return self->_token;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  token = self->_token;
  uint64_t v6 = *((void *)a3 + 3);

  return [(NSString *)token isEqual:v6];
}

- (unint64_t)hash
{
  return [(NSString *)self->_token hash];
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (![(NSExpression *)self _allowsEvaluation]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This expression has evaluation disabled" userInfo:0]);
  }
  return self;
}

@end