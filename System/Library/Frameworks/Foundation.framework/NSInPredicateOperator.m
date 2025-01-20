@interface NSInPredicateOperator
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (NSInPredicateOperator)initWithCoder:(id)a3;
- (NSInPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringVersion;
- (id)symbol;
- (unint64_t)flags;
- (unint64_t)options;
- (void)_setOptions:(unint64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSInPredicateOperator

- (id)symbol
{
  unint64_t v3 = [(NSPredicateOperator *)self operatorType];
  if (v3 == 10)
  {
    v4 = @"IN";
  }
  else
  {
    if (v3 != 99) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"In operator with invalid type %lu", v3), 0 reason userInfo]);
    }
    v4 = @"CONTAINS";
  }
  id v5 = (id)[(__CFString *)v4 mutableCopy];
  v6 = v5;
  if (!self->_flags) {
    return v6;
  }
  [v5 appendString:@"["];
  unint64_t flags = self->_flags;
  if (flags)
  {
    [v6 appendString:@"c"];
    unint64_t flags = self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_8:
      if ((flags & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_16;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_8;
  }
  [v6 appendString:@"d"];
  unint64_t flags = self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_9:
    if ((flags & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v6 appendString:@"l"];
  unint64_t flags = self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_10:
    if ((flags & 0x10) == 0) {
      goto LABEL_11;
    }
LABEL_18:
    [v6 appendString:@"w"];
    if (!self->_flags) {
      return v6;
    }
    goto LABEL_12;
  }
LABEL_17:
  [v6 appendString:@"n"];
  unint64_t flags = self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_18;
  }
LABEL_11:
  if (flags) {
LABEL_12:
  }
    [v6 appendString:@"]"];
  return v6;
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  unint64_t v7 = [(NSPredicateOperator *)self operatorType];
  if (v7 == 10)
  {
    id v8 = a4;
    a4 = a3;
  }
  else
  {
    id v8 = a3;
    if (v7 != 99)
    {
      v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      v11 = +[NSString stringWithFormat:@"In operator with invalid type %lu", v7];
      v12 = v9;
      uint64_t v13 = v10;
      goto LABEL_24;
    }
  }
  BOOL result = 0;
  if (v8 && a4)
  {
    if (v8 == (id)[MEMORY[0x1E4F1CA98] null]) {
      return 0;
    }
    if (_NSIsNSString())
    {
      if (_NSIsNSString())
      {
        id v15 = [(NSInPredicateOperator *)self stringVersion];
        return [v15 performPrimitiveOperationUsingObject:v8 andObject:a4];
      }
      v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3C8];
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Can't look for value (%@) in string (%@); value is not a string ",
              a4,
              v8);
      v12 = v16;
      uint64_t v13 = v17;
LABEL_24:
      objc_exception_throw((id)[v12 exceptionWithName:v13 reason:v11 userInfo:0]);
    }
    if ((_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && !_NSIsNSOrderedSet())
    {
      if (_NSIsNSDictionary()) {
        return objc_msgSend((id)objc_msgSend(v8, "allKeysForObject:", a4), "count") != 0;
      }
      v18 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v19 = *MEMORY[0x1E4F1C3C8];
      v11 = +[NSString stringWithFormat:@"Can't use in/contains operator with collection %@ (not a collection)", v8];
      v12 = v18;
      uint64_t v13 = v19;
      goto LABEL_24;
    }
    return [v8 containsObject:a4];
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSInPredicateOperator;
  -[NSPredicateOperator encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeInteger:self->_flags forKey:@"NSFlags"];
}

- (NSInPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSInPredicateOperator;
  uint64_t v6 = [(NSPredicateOperator *)&v9 initWithOperatorType:a3 modifier:a4];
  unint64_t v7 = v6;
  if (v6) {
    [(NSInPredicateOperator *)v6 _setOptions:a5];
  }
  return v7;
}

- (void)_setOptions:(unint64_t)a3
{
  self->_unint64_t flags = a3 & 0x1F;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_class();
  unint64_t v5 = [(NSPredicateOperator *)self operatorType];
  unint64_t v6 = [(NSPredicateOperator *)self modifier];
  unint64_t flags = self->_flags;

  return (id)[v4 _newOperatorWithType:v5 modifier:v6 options:flags];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  self->_stringVersion = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSInPredicateOperator;
  [(NSInPredicateOperator *)&v3 dealloc];
}

- (unint64_t)options
{
  return self->_flags;
}

- (id)stringVersion
{
  if (!self->_stringVersion)
  {
    objc_super v3 = [[NSSubstringPredicateOperator alloc] initWithOperatorType:[(NSPredicateOperator *)self operatorType] modifier:[(NSPredicateOperator *)self modifier] variant:self->_flags position:2];
    uint64_t v4 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_stringVersion, (unint64_t *)&v4, (unint64_t)v3);
    if (v4) {
  }
    }
  return self->_stringVersion;
}

- (NSInPredicateOperator)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSInPredicateOperator;
  uint64_t v4 = -[NSPredicateOperator initWithCoder:](&v6, sel_initWithCoder_);
  if (v4) {
    v4->_unint64_t flags = [a3 decodeIntegerForKey:@"NSFlags"];
  }
  return v4;
}

- (unint64_t)flags
{
  return self->_flags;
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
  unint64_t v7 = [(NSInPredicateOperator *)self flags];
  return v7 == [a3 flags];
}

@end