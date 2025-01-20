@interface NSFalsePredicate
+ (BOOL)supportsSecureCoding;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)defaultInstance;
- (BOOL)_allowsEvaluation;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSFalsePredicate)initWithCoder:(id)a3;
- (id)predicateFormat;
- (unint64_t)hash;
- (unint64_t)retainCount;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSFalsePredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultInstance
{
  return &__NSTheOneFalsePredicate;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSFalsePredicate;
  [(NSPredicate *)&v5 encodeWithCoder:a3];
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return &__NSTheOneFalsePredicate;
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  return 0;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
}

- (unint64_t)hash
{
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (BOOL)_allowsEvaluation
{
  return 1;
}

- (NSFalsePredicate)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  return (NSFalsePredicate *)&__NSTheOneFalsePredicate;
}

- (id)predicateFormat
{
  return @"FALSEPREDICATE";
}

@end