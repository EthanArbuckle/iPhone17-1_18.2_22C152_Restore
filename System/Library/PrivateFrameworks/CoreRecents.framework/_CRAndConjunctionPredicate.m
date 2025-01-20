@interface _CRAndConjunctionPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)subpredicates;
- (_CRAndConjunctionPredicate)initWithCoder:(id)a3;
- (_CRAndConjunctionPredicate)initWithSubpredicates:(id)a3;
- (id)asNSPredicate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CRAndConjunctionPredicate

- (_CRAndConjunctionPredicate)initWithSubpredicates:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CRAndConjunctionPredicate;
  v5 = [(CRSearchPredicate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    subpredicates = v5->_subpredicates;
    v5->_subpredicates = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CRAndConjunctionPredicate *)a3;
  BOOL v6 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (subpredicates = self->_subpredicates, (unint64_t)subpredicates | (unint64_t)v4->_subpredicates)
      && !-[NSArray isEqual:](subpredicates, "isEqual:"))
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [MEMORY[0x1E4F5A418] arrayHash:self->_subpredicates] + 527;
}

- (id)asNSPredicate
{
  v2 = [(NSArray *)self->_subpredicates _cn_map:&__block_literal_global];
  v3 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CRAndConjunctionPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = +[CRSearchPredicate secureCodableSubclasses];
  BOOL v6 = [v4 decodeObjectOfClasses:v5 forKey:@"subpredicates"];

  v7 = [(_CRAndConjunctionPredicate *)self initWithSubpredicates:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSArray)subpredicates
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end