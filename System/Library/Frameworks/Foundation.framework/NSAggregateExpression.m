@interface NSAggregateExpression
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSAggregateExpression)initWithCoder:(id)a3;
- (NSAggregateExpression)initWithCollection:(id)a3;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)collection;
- (id)constantValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)predicateFormat;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSAggregateExpression

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if ((a4 & 4) != 0) {
      [a3 visitPredicateExpression:self];
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id collection = self->_collection;
    uint64_t v8 = [collection countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(collection);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) acceptVisitor:a3 flags:a4];
        }
        uint64_t v9 = [collection countByEnumeratingWithState:&v13 objects:v12 count:16];
      }
      while (v9);
    }
    if ((a4 & 4) == 0) {
      [a3 visitPredicateExpression:self];
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSAggregateExpression;
  [(NSExpression *)&v5 encodeWithCoder:a3];
  [a3 encodeObject:self->_collection forKey:@"NSCollection"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSAggregateExpression)initWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    v11 = (void *)MEMORY[0x1E4F1CA00];
    v12 = (__CFString *)*MEMORY[0x1E4F1C3C8];
    long long v13 = @"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers";
    goto LABEL_15;
  }
  v14.receiver = self;
  v14.super_class = (Class)NSAggregateExpression;
  objc_super v5 = [(NSExpression *)&v14 initWithCoder:a3];
  if (!v5) {
    return v5;
  }
  uint64_t v6 = (void *)[a3 allowedClasses];
  uint64_t v7 = [v6 count];
  if (v7)
  {
    id v8 = (id)[v6 mutableCopy];
    objc_msgSend(v8, "unionSet:", +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding](_NSPredicateUtilities, "_extendedExpressionClassesForSecureCoding"));
  }
  else
  {
    id v8 = +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding];
  }
  id v9 = (id)[a3 decodeObjectOfClasses:v8 forKey:@"NSCollection"];
  v5->_id collection = v9;
  if (v9
    && (_NSIsNSSet() & 1) == 0
    && (_NSIsNSArray() & 1) == 0
    && (_NSIsNSOrderedSet() & 1) == 0
    && (_NSIsNSDictionary() & 1) == 0)
  {

    if (v7) {
    v11 = (void *)MEMORY[0x1E4F1CA00];
    }
    v12 = @"NSInvalidUnarchiveOperationException";
    long long v13 = @"Malformed compound predicate (bad subpredicates collection)";
LABEL_15:
    objc_exception_throw((id)[v11 exceptionWithName:v12 reason:v13 userInfo:0]);
  }
  if (v7) {

  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSAggregateExpression;
  [(NSAggregateExpression *)&v3 dealloc];
}

- (unint64_t)expressionType
{
  return 14;
}

- (void)allowEvaluation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id collection = self->_collection;
  uint64_t v4 = [collection countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(collection);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) allowEvaluation];
      }
      uint64_t v5 = [collection countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v5);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSAggregateExpression;
  [(NSExpression *)&v8 allowEvaluation];
}

- (id)constantValue
{
  return self->_collection;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend(self->_collection, "isNSArray", a3);
  uint64_t v5 = (Class *)0x1E4F1CA48;
  if (!v4) {
    uint64_t v5 = (Class *)0x1E4F1CA80;
  }
  uint64_t v6 = objc_msgSend(objc_alloc(*v5), "initWithCapacity:", objc_msgSend(self->_collection, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id collection = self->_collection;
  uint64_t v8 = [collection countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(collection);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v16 + 1) + 8 * i) copy];
        [v6 addObject:v12];
      }
      uint64_t v9 = [collection countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v9);
  }
  long long v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCollection:v6];

  return v13;
}

- (NSAggregateExpression)initWithCollection:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Can't create an aggregate expression with an instance of %@", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSAggregateExpression;
  uint64_t v5 = [(NSExpression *)&v8 initWithExpressionType:14];
  v5->_id collection = a3;
  return v5;
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(NSExpression *)self _allowsEvaluation]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This expression has evaluation disabled" userInfo:0]);
  }
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id collection = self->_collection;
  uint64_t v9 = [collection countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(collection);
        }
        uint64_t v13 = [*(id *)(*((void *)&v16 + 1) + 8 * v12) expressionValueWithObject:a3 context:a4];
        if (!v13) {
          uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
        }
        [v7 addObject:v13];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [collection countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v10);
  }
  return v7;
}

- (id)predicateFormat
{
  id collection = self->_collection;
  if ((_NSIsNSArray() & 1) != 0
    || (_NSIsNSSet() & 1) != 0
    || (_NSIsNSOrderedSet() & 1) != 0
    || _NSIsNSDictionary())
  {
    return +[_NSPredicateUtilities _parserableCollectionDescription:]((uint64_t)_NSPredicateUtilities, collection);
  }
  else
  {
    return (id)[collection description];
  }
}

- (id)collection
{
  return self->_collection;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id collection = self->_collection;
  uint64_t v6 = *((void *)a3 + 3);

  return [collection isEqual:v6];
}

- (unint64_t)hash
{
  return [self->_collection hash];
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  }
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id collection = self->_collection;
  uint64_t v7 = [collection countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(collection);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "_expressionWithSubstitutionVariables:", a3));
      }
      uint64_t v8 = [collection countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v8);
  }
  return (id)[objc_alloc((Class)objc_opt_class()) initWithCollection:v5];
}

@end