@interface NSPredicateOperator
+ (BOOL)supportsSecureCoding;
+ (NSPredicateOperator)operatorWithCustomSelector:(SEL)a3 modifier:(unint64_t)a4;
+ (NSPredicateOperator)operatorWithType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5;
+ (SEL)_getSelectorForType:(unint64_t)a3;
+ (id)_getSymbolForType:(unint64_t)a3;
+ (id)_newOperatorWithType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)performOperationUsingObject:(id)a3 andObject:(id)a4;
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (NSPredicateOperator)initWithCoder:(id)a3;
- (NSPredicateOperator)initWithOperatorType:(unint64_t)a3;
- (NSPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4;
- (SEL)selector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)symbol;
- (unint64_t)hash;
- (unint64_t)modifier;
- (unint64_t)operatorType;
- (unint64_t)options;
- (void)_setModifier:(unint64_t)a3;
- (void)_setOptions:(unint64_t)a3;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPredicateOperator

- (unint64_t)operatorType
{
  return self->_operatorType;
}

- (BOOL)performOperationUsingObject:(id)a3 andObject:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = (id)[MEMORY[0x1E4F1CA98] null];
  if (v7 == a3) {
    id v8 = 0;
  }
  else {
    id v8 = a3;
  }
  if (v7 == a4) {
    a4 = 0;
  }
  unint64_t modifier = self->_modifier;
  if (!modifier)
  {
    LOBYTE(v10) = [(NSPredicateOperator *)self performPrimitiveOperationUsingObject:v8 andObject:a4];
    return v10;
  }
  if (v8)
  {
    if ((_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0)
    {
      v18 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v19 = *MEMORY[0x1E4F1C3C8];
      v20 = @"The left hand side for an ALL or ANY operator must be either an NSArray or an NSSet.";
LABEL_44:
      objc_exception_throw((id)[v18 exceptionWithName:v19 reason:v20 userInfo:0]);
    }
    if (_NSIsNSSet()) {
      a3 = (id)[v8 allObjects];
    }
    if (_NSIsNSOrderedSet()) {
      a3 = (id)[a3 array];
    }
    unint64_t modifier = self->_modifier;
  }
  else
  {
    a3 = 0;
  }
  if (modifier == 2)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v10 = [a3 countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (!v10) {
      return v10;
    }
    uint64_t v15 = v10;
    uint64_t v16 = *(void *)v24;
LABEL_33:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v24 != v16) {
        objc_enumerationMutation(a3);
      }
      if ([(NSPredicateOperator *)self performPrimitiveOperationUsingObject:*(void *)(*((void *)&v23 + 1) + 8 * v17) andObject:a4])
      {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [a3 countByEnumeratingWithState:&v23 objects:v22 count:16];
        LOBYTE(v10) = 0;
        if (v15) {
          goto LABEL_33;
        }
        return v10;
      }
    }
LABEL_40:
    LOBYTE(v10) = 1;
    return v10;
  }
  if (modifier != 1)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    v20 = @"Bad comparison predicate modifier";
    goto LABEL_44;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v11 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
  if (!v11) {
    goto LABEL_40;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v29;
LABEL_24:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v29 != v13) {
      objc_enumerationMutation(a3);
    }
    LODWORD(v10) = [(NSPredicateOperator *)self performPrimitiveOperationUsingObject:*(void *)(*((void *)&v28 + 1) + 8 * v14) andObject:a4];
    if (!v10) {
      return v10;
    }
    if (v12 == ++v14)
    {
      uint64_t v12 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
      LOBYTE(v10) = 1;
      if (v12) {
        goto LABEL_24;
      }
      return v10;
    }
  }
}

- (SEL)selector
{
  return +[NSPredicateOperator _getSelectorForType:self->_operatorType];
}

+ (SEL)_getSelectorForType:(unint64_t)a3
{
  v3 = &selRef_compare_;
  if ((uint64_t)a3 <= 3)
  {
    if (a3 < 4) {
      return *v3;
    }
    goto LABEL_13;
  }
  if ((uint64_t)a3 > 98)
  {
    if (a3 == 99)
    {
LABEL_11:
      v3 = &selRef_containsObject_;
      return *v3;
    }
    if (a3 == 100) {
      return *v3;
    }
LABEL_13:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unknown predicate type %ld", a3), 0 reason userInfo]);
  }
  if (a3 - 4 >= 2)
  {
    if (a3 == 10) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  v3 = &selRef_isEqual_;
  return *v3;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if ((a4 & 2) != 0) {
    [a3 visitPredicateOperator:self];
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  return [NSStringFromSelector([(NSPredicateOperator *)self selector]) hash] ^ v3;
}

- (id)symbol
{
  return +[NSPredicateOperator _getSymbolForType:self->_operatorType];
}

+ (id)_getSymbolForType:(unint64_t)a3
{
  id result = @"<";
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      return @"<=";
    case 2uLL:
      return @">";
    case 3uLL:
      return @">=";
    case 4uLL:
      return @"==";
    case 5uLL:
      return @"!=";
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      goto LABEL_12;
    case 0xAuLL:
      return @"IN";
    default:
      if (a3 == 99) {
        return @"CONTAINS";
      }
      if (a3 != 100) {
LABEL_12:
      }
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unknown predicate type %ld", a3), 0 reason userInfo]);
      return @"BETWEEN";
  }
}

+ (id)_newOperatorWithType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5
{
  if ((uint64_t)a3 <= 98)
  {
    switch(a3)
    {
      case 0uLL:
        id v7 = [NSComparisonPredicateOperator alloc];
        uint64_t v8 = 0;
        unint64_t v9 = a4;
        uint64_t v10 = 0;
        goto LABEL_16;
      case 1uLL:
        id v7 = [NSComparisonPredicateOperator alloc];
        uint64_t v8 = 1;
        unint64_t v9 = a4;
        uint64_t v10 = 1;
        goto LABEL_16;
      case 2uLL:
        id v7 = [NSComparisonPredicateOperator alloc];
        uint64_t v8 = 2;
        unint64_t v9 = a4;
        uint64_t v10 = 2;
        goto LABEL_16;
      case 3uLL:
        id v7 = [NSComparisonPredicateOperator alloc];
        uint64_t v8 = 3;
        unint64_t v9 = a4;
        uint64_t v10 = 3;
LABEL_16:
        return [(NSComparisonPredicateOperator *)v7 initWithOperatorType:v8 modifier:v9 variant:v10 options:a5];
      case 4uLL:
        uint64_t v15 = [NSEqualityPredicateOperator alloc];
        uint64_t v16 = 4;
        unint64_t v17 = a4;
        uint64_t v18 = 0;
        goto LABEL_21;
      case 5uLL:
        uint64_t v15 = [NSEqualityPredicateOperator alloc];
        uint64_t v16 = 5;
        unint64_t v17 = a4;
        uint64_t v18 = 1;
LABEL_21:
        return [(NSEqualityPredicateOperator *)v15 initWithOperatorType:v16 modifier:v17 negate:v18 options:a5];
      case 6uLL:
        uint64_t v19 = [NSMatchingPredicateOperator alloc];
        uint64_t v20 = 6;
        goto LABEL_37;
      case 7uLL:
        uint64_t v19 = [NSLikePredicateOperator alloc];
        uint64_t v20 = 7;
        goto LABEL_37;
      case 8uLL:
        v21 = [NSSubstringPredicateOperator alloc];
        uint64_t v22 = 8;
        unint64_t v23 = a4;
        unint64_t v24 = a5;
        uint64_t v25 = 0;
        goto LABEL_28;
      case 9uLL:
        v21 = [NSSubstringPredicateOperator alloc];
        uint64_t v22 = 9;
        unint64_t v23 = a4;
        unint64_t v24 = a5;
        uint64_t v25 = 1;
LABEL_28:
        return [(NSSubstringPredicateOperator *)v21 initWithOperatorType:v22 modifier:v23 variant:v24 position:v25];
      case 0xAuLL:
        uint64_t v11 = [NSInPredicateOperator alloc];
        uint64_t v12 = 10;
        goto LABEL_33;
      default:
        goto LABEL_40;
    }
  }
  if ((uint64_t)a3 <= 999)
  {
    if (a3 == 99)
    {
      uint64_t v11 = [NSInPredicateOperator alloc];
      uint64_t v12 = 99;
      goto LABEL_33;
    }
    if (a3 == 100)
    {
      uint64_t v11 = [NSBetweenPredicateOperator alloc];
      uint64_t v12 = 100;
LABEL_33:
      return [(NSInPredicateOperator *)v11 initWithOperatorType:v12 modifier:a4 options:a5];
    }
LABEL_40:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unknown predicate type %ld", a3), 0 reason userInfo]);
  }
  if (a3 == 1000)
  {
    uint64_t v19 = [NSTokenMatchingPredicateOperator alloc];
    uint64_t v20 = 1000;
LABEL_37:
    return [(NSMatchingPredicateOperator *)v19 initWithOperatorType:v20 modifier:a4 variant:a5];
  }
  else
  {
    if (a3 != 2000) {
      goto LABEL_40;
    }
    uint64_t v13 = [NSBoundedByPredicateOperator alloc];
    return [(NSPredicateOperator *)v13 initWithOperatorType:2000 modifier:a4];
  }
}

- (NSPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSPredicateOperator;
  id result = [(NSPredicateOperator *)&v7 init];
  if (result)
  {
    result->_operatorType = a3;
    result->_unint64_t modifier = a4;
  }
  return result;
}

- (void)_setModifier:(unint64_t)a3
{
  self->_unint64_t modifier = a3;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  [a3 encodeInteger:self->_operatorType forKey:@"NSOperatorType"];
  unint64_t modifier = self->_modifier;

  [a3 encodeInteger:modifier forKey:@"NSModifier"];
}

- (unint64_t)modifier
{
  return self->_modifier;
}

- (NSPredicateOperator)initWithOperatorType:(unint64_t)a3
{
  return [(NSPredicateOperator *)self initWithOperatorType:a3 modifier:0];
}

- (NSPredicateOperator)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  uint64_t v5 = [a3 decodeIntegerForKey:@"NSOperatorType"];
  uint64_t v6 = [a3 decodeIntegerForKey:@"NSModifier"];

  return [(NSPredicateOperator *)self initWithOperatorType:v5 modifier:v6];
}

+ (NSPredicateOperator)operatorWithType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5
{
  uint64_t v5 = (void *)[a1 _newOperatorWithType:a3 modifier:a4 options:a5];

  return (NSPredicateOperator *)v5;
}

+ (NSPredicateOperator)operatorWithCustomSelector:(SEL)a3 modifier:(unint64_t)a4
{
  v4 = [[NSCustomPredicateOperator alloc] initWithCustomSelector:a3 modifier:a4];

  return (NSPredicateOperator *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = NSClassFromString((NSString *)@"NSPredicate");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
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
  return v6 == [a3 modifier];
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  unint64_t v6 = NSClassFromString((NSString *)@"NSPredicateOperator");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)_setOptions:(unint64_t)a3
{
  unint64_t v5 = NSClassFromString((NSString *)@"NSPredicateOperator");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (unint64_t)options
{
  return 0;
}

@end