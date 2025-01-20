@interface NSBlockExpression
+ (BOOL)supportsSecureCoding;
- (NSBlockExpression)initWithCoder:(id)a3;
- (NSBlockExpression)initWithType:(unint64_t)a3 block:(id)a4 arguments:(id)a5;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)arguments;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionBlock;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)predicateFormat;
- (unint64_t)expressionType;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSBlockExpression

- (NSBlockExpression)initWithType:(unint64_t)a3 block:(id)a4 arguments:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSBlockExpression;
  v7 = [(NSExpression *)&v9 initWithExpressionType:a3];
  if (v7)
  {
    v7->_block = (id)[a4 copy];
    v7->_arguments = (NSArray *)[a5 copy];
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  self->_block = 0;
  self->_arguments = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBlockExpression;
  [(NSBlockExpression *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [NSBlockExpression alloc];
  unint64_t v5 = [(NSBlockExpression *)self expressionType];
  id block = self->_block;
  arguments = self->_arguments;

  return [(NSBlockExpression *)v4 initWithType:v5 block:block arguments:arguments];
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSBlockExpression)initWithCoder:(id)a3
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSBlockExpression cannot be encoded or decoded" userInfo:0]);
}

- (id)expressionBlock
{
  return self->_block;
}

- (id)arguments
{
  return self->_arguments;
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (![(NSExpression *)self _allowsEvaluation]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This expression has evaluation disabled" userInfo:0]);
  }
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_arguments, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  arguments = self->_arguments;
  uint64_t v9 = [(NSArray *)arguments countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(arguments);
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "expressionValueWithObject:context:", a3, a4));
      }
      uint64_t v9 = [(NSArray *)arguments countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v9);
  }
  v12 = (void *)(*((uint64_t (**)(void))self->_block + 2))();

  return v12;
}

- (id)predicateFormat
{
  return +[NSString stringWithFormat:@"BLOCK(%p, %@)", self->_block, self->_arguments];
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  arguments = self->_arguments;
  uint64_t v7 = [(NSArray *)arguments countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(arguments);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "_expressionWithSubstitutionVariables:", a3));
      }
      uint64_t v8 = [(NSArray *)arguments countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v8);
  }
  v11 = [[NSBlockExpression alloc] initWithType:[(NSBlockExpression *)self expressionType] block:self->_block arguments:v5];

  return v11;
}

- (unint64_t)expressionType
{
  return 19;
}

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
    id v7 = [(NSBlockExpression *)self arguments];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) acceptVisitor:a3 flags:a4];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v12 count:16];
      }
      while (v9);
    }
    if ((a4 & 4) == 0) {
      [a3 visitPredicateExpression:self];
    }
  }
}

@end