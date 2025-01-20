@interface _CROrConjunctionPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)subpredicates;
- (_CROrConjunctionPredicate)initWithCoder:(id)a3;
- (_CROrConjunctionPredicate)initWithSubpredicates:(id)a3;
- (id)asNSPredicate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CROrConjunctionPredicate

- (_CROrConjunctionPredicate)initWithSubpredicates:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CROrConjunctionPredicate;
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
  id v4 = (_CROrConjunctionPredicate *)a3;
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
  v2 = [(NSArray *)self->_subpredicates _cn_map:&__block_literal_global_114];
  v3 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CROrConjunctionPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = +[CRSearchPredicate secureCodableSubclasses];
  BOOL v6 = [v4 decodeObjectOfClasses:v5 forKey:@"subpredicates"];

  v7 = [(_CROrConjunctionPredicate *)self initWithSubpredicates:v6];
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