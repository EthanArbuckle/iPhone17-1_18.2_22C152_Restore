@interface NSStringPredicateOperator
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSStringPredicateOperator)initWithCoder:(id)a3;
- (NSStringPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5;
- (id)_modifierString;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)flags;
- (unint64_t)options;
- (void)_setOptions:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSStringPredicateOperator

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSStringPredicateOperator;
  [(NSPredicateOperator *)&v5 encodeWithCoder:a3];
  [a3 encodeInteger:self->_flags forKey:@"NSFlags"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_class();
  unint64_t v5 = [(NSPredicateOperator *)self operatorType];
  unint64_t v6 = [(NSPredicateOperator *)self modifier];
  unint64_t flags = self->_flags;

  return (id)[v4 _newOperatorWithType:v5 modifier:v6 options:flags];
}

- (NSStringPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSStringPredicateOperator;
  unint64_t v6 = [(NSPredicateOperator *)&v9 initWithOperatorType:a3 modifier:a4];
  v7 = v6;
  if (v6) {
    [(NSStringPredicateOperator *)v6 _setOptions:a5];
  }
  return v7;
}

- (void)_setOptions:(unint64_t)a3
{
  self->_unint64_t flags = a3 & 0x1F;
}

- (unint64_t)options
{
  return self->_flags;
}

- (unint64_t)flags
{
  return self->_flags;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSStringPredicateOperator)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v7.receiver = self;
  v7.super_class = (Class)NSStringPredicateOperator;
  unint64_t v5 = [(NSPredicateOperator *)&v7 initWithCoder:a3];
  if (v5) {
    v5->_unint64_t flags = [a3 decodeIntegerForKey:@"NSFlags"];
  }
  return v5;
}

- (id)_modifierString
{
  if (!self->_flags) {
    return &stru_1ECA5C228;
  }
  v3 = +[NSString stringWithString:@"["];
  v4 = v3;
  unint64_t flags = self->_flags;
  if (flags)
  {
    [(NSMutableString *)v3 appendString:@"c"];
    unint64_t flags = self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_4:
      if ((flags & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_4;
  }
  [(NSMutableString *)v4 appendString:@"d"];
  unint64_t flags = self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
LABEL_14:
    [(NSMutableString *)v4 appendString:@"n"];
    if ((self->_flags & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  [(NSMutableString *)v4 appendString:@"l"];
  unint64_t flags = self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_14;
  }
LABEL_6:
  if ((flags & 0x10) != 0) {
LABEL_7:
  }
    [(NSMutableString *)v4 appendString:@"w"];
LABEL_8:
  [(NSMutableString *)v4 appendString:@"]"];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t v5 = [(NSPredicateOperator *)self operatorType];
  if (v5 != [a3 operatorType]) {
    return 0;
  }
  unint64_t v6 = [(NSPredicateOperator *)self modifier];
  if (v6 != [a3 modifier]) {
    return 0;
  }
  unint64_t v7 = [(NSStringPredicateOperator *)self flags];
  return v7 == [a3 flags];
}

@end