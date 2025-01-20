@interface NSEqualityPredicateOperator
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNegation;
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (NSEqualityPredicateOperator)initWithCoder:(id)a3;
- (NSEqualityPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 negate:(BOOL)a5;
- (NSEqualityPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 negate:(BOOL)a5 options:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)predicateFormat;
- (unint64_t)options;
- (void)_setOptions:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setNegation:(BOOL)a3;
@end

@implementation NSEqualityPredicateOperator

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  if (!((unint64_t)a3 | (unint64_t)a4)) {
    return !self->_negate;
  }
  if (!a3 || !a4) {
    return self->_negate;
  }
  if (!self->_options || !_NSIsNSString() || !_NSIsNSString()) {
    return objc_msgSend(a3, -[NSPredicateOperator selector](self, "selector"), a4) ^ self->_negate;
  }
  unint64_t options = self->_options;
  if ((options & 4) != 0)
  {
    CFStringCompareFlags v10 = 2;
  }
  else
  {
    unint64_t v9 = self->_options & 1 | (((self->_options >> 1) & 1) << 7);
    if (v9) {
      CFStringCompareFlags v10 = v9 | 0x100;
    }
    else {
      CFStringCompareFlags v10 = 0;
    }
  }
  if ((options & 8) != 0) {
    v11 = +[_NSPredicateOperatorUtilities retainedLocale];
  }
  else {
    v11 = 0;
  }
  v13.length = [a3 length];
  v13.location = 0;
  BOOL v12 = CFStringCompareWithOptionsAndLocale((CFStringRef)a3, (CFStringRef)a4, v13, v10, v11) != kCFCompareEqualTo;

  return v12 ^ !self->_negate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)predicateFormat
{
  id v3 = [(NSPredicateOperator *)self symbol];
  if (self->_options) {
    id v4 = (id)[v3 mutableCopy];
  }
  else {
    id v4 = v3;
  }
  v5 = v4;
  if (self->_options)
  {
    [v4 appendString:@"["];
    unint64_t options = self->_options;
    if (options)
    {
      [v5 appendString:@"c"];
      unint64_t options = self->_options;
      if ((options & 2) == 0)
      {
LABEL_7:
        if ((options & 8) == 0) {
          goto LABEL_8;
        }
        goto LABEL_17;
      }
    }
    else if ((options & 2) == 0)
    {
      goto LABEL_7;
    }
    [v5 appendString:@"d"];
    unint64_t options = self->_options;
    if ((options & 8) == 0)
    {
LABEL_8:
      if ((options & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }
LABEL_17:
    [v5 appendString:@"l"];
    unint64_t options = self->_options;
    if ((options & 4) == 0)
    {
LABEL_9:
      if ((options & 0x10) == 0)
      {
LABEL_11:
        [v5 appendString:@"]"];
        goto LABEL_12;
      }
LABEL_10:
      [v5 appendString:@"w"];
      goto LABEL_11;
    }
LABEL_18:
    [v5 appendString:@"n"];
    if ((self->_options & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_12:

  return v5;
}

- (NSEqualityPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 negate:(BOOL)a5 options:(unint64_t)a6
{
  result = [(NSEqualityPredicateOperator *)self initWithOperatorType:a3 modifier:a4 negate:a5];
  if (result) {
    result->_unint64_t options = a6;
  }
  return result;
}

- (NSEqualityPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 negate:(BOOL)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSEqualityPredicateOperator;
  result = [(NSPredicateOperator *)&v7 initWithOperatorType:a3 modifier:a4];
  if (result) {
    result->_negate = a5;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSEqualityPredicateOperator;
  [(NSPredicateOperator *)&v5 encodeWithCoder:a3];
  [a3 encodeBool:self->_negate forKey:@"NSNegate"];
  [a3 encodeInteger:self->_options forKey:@"NSOptions"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t v5 = [(NSPredicateOperator *)self operatorType];
  unint64_t v6 = [(NSPredicateOperator *)self modifier];
  BOOL negate = self->_negate;
  unint64_t options = self->_options;

  return (id)[v4 initWithOperatorType:v5 modifier:v6 negate:negate options:options];
}

- (NSEqualityPredicateOperator)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v7.receiver = self;
  v7.super_class = (Class)NSEqualityPredicateOperator;
  unint64_t v5 = [(NSPredicateOperator *)&v7 initWithCoder:a3];
  if (v5)
  {
    v5->_BOOL negate = [a3 decodeBoolForKey:@"NSNegate"];
    v5->_unint64_t options = [a3 decodeIntegerForKey:@"NSOptions"];
  }
  return v5;
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
  int v7 = [(NSEqualityPredicateOperator *)self isNegation];
  if (v7 != [a3 isNegation]) {
    return 0;
  }
  unint64_t v9 = [(NSEqualityPredicateOperator *)self options];
  return v9 == [a3 options];
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)isNegation
{
  return self->_negate;
}

- (void)setNegation:(BOOL)a3
{
  self->_BOOL negate = a3;
}

- (void)_setOptions:(unint64_t)a3
{
  self->_unint64_t options = a3;
}

@end