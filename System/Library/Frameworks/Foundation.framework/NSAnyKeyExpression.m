@interface NSAnyKeyExpression
+ (BOOL)_allowsEvaluation;
+ (BOOL)supportsSecureCoding;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)defaultInstance;
+ (void)initialize;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (NSAnyKeyExpression)initWithCoder:(id)a3;
- (id)_initPrivate;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)predicateFormat;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (unint64_t)retainCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSAnyKeyExpression

+ (void)initialize
{
  if (!_NSAnyKeyExpressionSingleton)
  {
    id v2 = NSAllocateObject((Class)a1, 0, 0);
    _NSAnyKeyExpressionSingleton = (uint64_t)v2;
    [v2 _initPrivate];
  }
}

- (id)_initPrivate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSAnyKeyExpression;
  return [(NSExpression *)&v3 initWithExpressionType:15];
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)_NSAnyKeyExpressionSingleton;
}

+ (id)defaultInstance
{
  return (id)_NSAnyKeyExpressionSingleton;
}

- (unint64_t)expressionType
{
  return 15;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_allowsEvaluation
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSAnyKeyExpression;
  [(NSExpression *)&v5 encodeWithCoder:a3];
}

- (NSAnyKeyExpression)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  return (NSAnyKeyExpression *)_NSAnyKeyExpressionSingleton;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (unint64_t)hash
{
  return 8674;
}

- (id)predicateFormat
{
  return @"ANYKEY";
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
}

@end