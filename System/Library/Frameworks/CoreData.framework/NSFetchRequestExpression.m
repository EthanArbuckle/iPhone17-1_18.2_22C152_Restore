@interface NSFetchRequestExpression
+ (BOOL)supportsSecureCoding;
+ (NSExpression)expressionForFetch:(NSExpression *)fetch context:(NSExpression *)context countOnly:(BOOL)countFlag;
- (BOOL)isCountOnlyRequest;
- (BOOL)isEqual:(id)a3;
- (NSExpression)contextExpression;
- (NSExpression)requestExpression;
- (NSFetchRequestExpression)initWithCoder:(id)a3;
- (id)_expressionWithSubstitutionVariables:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)expressionValueWithObject:(id)a3 context:(id)a4;
- (id)initForFetch:(id)a3 context:(id)a4 countOnly:(BOOL)a5;
- (unint64_t)expressionType;
- (unint64_t)hash;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSFetchRequestExpression

- (id)initForFetch:(id)a3 context:(id)a4 countOnly:(BOOL)a5
{
  BOOL v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)NSFetchRequestExpression;
  v8 = [(NSFetchRequestExpression *)&v10 initWithExpressionType:50];
  if (v8)
  {
    v8->_fetchRequest = (NSExpression *)a3;
    v8->_managedObjectContext = (NSExpression *)a4;
    v8->_flags = (_fetchExpressionFlags)(*(_DWORD *)&v8->_flags & 0xFFFFFFFE | v5);
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSFetchRequestExpression;
  [(NSFetchRequestExpression *)&v3 dealloc];
}

+ (NSExpression)expressionForFetch:(NSExpression *)fetch context:(NSExpression *)context countOnly:(BOOL)countFlag
{
  id v5 = [[NSFetchRequestExpression alloc] initForFetch:fetch context:context countOnly:countFlag];

  return (NSExpression *)v5;
}

- (NSExpression)requestExpression
{
  return self->_fetchRequest;
}

- (NSExpression)contextExpression
{
  return self->_managedObjectContext;
}

- (BOOL)isCountOnlyRequest
{
  return *(_DWORD *)&self->_flags & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)allowEvaluation
{
  [(NSExpression *)self->_managedObjectContext allowEvaluation];
  [(NSExpression *)self->_fetchRequest allowEvaluation];
  v3.receiver = self;
  v3.super_class = (Class)NSFetchRequestExpression;
  [(NSFetchRequestExpression *)&v3 allowEvaluation];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSFetchRequestExpression;
  -[NSFetchRequestExpression encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_fetchRequest forKey:@"NSFRExpression"];
  [a3 encodeObject:self->_managedObjectContext forKey:@"NSMOCExpression"];
  [a3 encodeBool:*(_DWORD *)&self->_flags & 1 forKey:@"NSCountOnlyFlag"];
}

- (NSFetchRequestExpression)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSFetchRequestExpression;
  v4 = -[NSFetchRequestExpression initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    v4->_fetchRequest = (NSExpression *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSFRExpression"];
    objc_super v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_managedObjectContext = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"NSMOCExpression");
    v4->_flags = (_fetchExpressionFlags)(*(_DWORD *)&v4->_flags & 0xFFFFFFFE | [a3 decodeBoolForKey:@"NSCountOnlyFlag"]);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [NSFetchRequestExpression alloc];
  fetchRequest = self->_fetchRequest;
  managedObjectContext = self->_managedObjectContext;
  uint64_t v7 = *(_DWORD *)&self->_flags & 1;

  return [(NSFetchRequestExpression *)v4 initForFetch:fetchRequest context:managedObjectContext countOnly:v7];
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  uint64_t v6 = self;
  if (([(NSFetchRequestExpression *)self _allowsEvaluation] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This expression has evaluation disabled" userInfo:0]);
  }
  id v7 = [(NSExpression *)v6->_fetchRequest expressionValueWithObject:a3 context:a4];
  id v8 = [(NSExpression *)v6->_managedObjectContext expressionValueWithObject:a3 context:a4];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    int v10 = 1;
  }
  else
  {
    uint64_t v15 = 0;
    if (*(unsigned char *)&v6->_flags)
    {
      uint64_t v12 = [v8 countForFetchRequest:v7 error:&v15];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v12;
      }
      uint64_t v6 = (NSFetchRequestExpression *)[NSNumber numberWithUnsignedLong:v13];
    }
    else
    {
      uint64_t v11 = [v8 executeFetchRequest:v7 error:&v15];
      if (v11) {
        uint64_t v6 = (NSFetchRequestExpression *)v11;
      }
      else {
        uint64_t v6 = (NSFetchRequestExpression *)NSArray_EmptyArray;
      }
    }
    int v10 = 0;
  }

  if (v10)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"NSFetchRequestExpression could not evaluate its request or context."];
    return 0;
  }
  return v6;
}

- (id)description
{
  if (self)
  {
    if (*((_DWORD *)self + 18)) {
      v2 = @"YES";
    }
    else {
      v2 = @"NO";
    }
    return (id)[NSString stringWithFormat:@"FETCH(%@, %@, %@)", *((void *)self + 7), *((void *)self + 8), v2];
  }
  return self;
}

- (unint64_t)expressionType
{
  return 50;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int v5 = [(NSFetchRequestExpression *)self isCountOnlyRequest];
  if (v5 != [a3 isCountOnlyRequest]
    || !-[NSExpression isEqual:](-[NSFetchRequestExpression requestExpression](self, "requestExpression"), "isEqual:", [a3 requestExpression]))
  {
    return 0;
  }
  uint64_t v6 = [(NSFetchRequestExpression *)self contextExpression];
  uint64_t v7 = [a3 contextExpression];

  return [(NSExpression *)v6 isEqual:v7];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSExpression *)[(NSFetchRequestExpression *)self requestExpression] hash];
  return [(NSExpression *)[(NSFetchRequestExpression *)self contextExpression] hash] ^ v3;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if (a4)
  {
    if ((a4 & 4) != 0)
    {
      [a3 visitPredicateExpression:self];
      [(NSExpression *)[(NSFetchRequestExpression *)self requestExpression] acceptVisitor:a3 flags:a4];
      uint64_t v7 = [(NSFetchRequestExpression *)self contextExpression];
      [(NSExpression *)v7 acceptVisitor:a3 flags:a4];
    }
    else
    {
      [(NSExpression *)[(NSFetchRequestExpression *)self requestExpression] acceptVisitor:a3 flags:a4];
      [(NSExpression *)[(NSFetchRequestExpression *)self contextExpression] acceptVisitor:a3 flags:a4];
      [a3 visitPredicateExpression:self];
    }
  }
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot substitute a nil substitution dictionary." userInfo:0]);
  }
  id v3 = [[NSFetchRequestExpression alloc] initForFetch:[(NSExpression *)[(NSFetchRequestExpression *)self requestExpression] _expressionWithSubstitutionVariables:a3] context:[(NSExpression *)[(NSFetchRequestExpression *)self contextExpression] _expressionWithSubstitutionVariables:a3] countOnly:*(_DWORD *)&self->_flags & 1];

  return v3;
}

@end