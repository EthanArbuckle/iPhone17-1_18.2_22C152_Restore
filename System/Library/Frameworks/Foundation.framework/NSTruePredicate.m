@interface NSTruePredicate
+ (BOOL)supportsSecureCoding;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)defaultInstance;
- (BOOL)_allowsEvaluation;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSTruePredicate)initWithCoder:(id)a3;
- (id)predicateFormat;
- (unint64_t)hash;
- (unint64_t)retainCount;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSTruePredicate

+ (id)defaultInstance
{
  return &__NSTheOneTruePredicate;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  return 1;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return &__NSTheOneTruePredicate;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
}

- (unint64_t)hash
{
  return 1;
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

- (BOOL)_allowsEvaluation
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
  v5.super_class = (Class)NSTruePredicate;
  [(NSPredicate *)&v5 encodeWithCoder:a3];
}

- (NSTruePredicate)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  return (NSTruePredicate *)&__NSTheOneTruePredicate;
}

- (id)predicateFormat
{
  return @"TRUEPREDICATE";
}

@end