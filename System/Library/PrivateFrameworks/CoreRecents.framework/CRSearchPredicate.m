@interface CRSearchPredicate
+ (BOOL)supportsSecureCoding;
+ (NSSet)secureCodableSubclasses;
+ (id)predicateForKey:(id)a3 inCollection:(id)a4;
+ (id)predicateForKey:(id)a3 matchingText:(id)a4 comparison:(unint64_t)a5;
+ (id)predicateSatisfyingAllSubpredicates:(id)a3;
+ (id)predicateSatisfyingAnySubpredicate:(id)a3;
- (CRSearchPredicate)init;
- (CRSearchPredicate)initWithCoder:(id)a3;
- (id)asNSPredicate;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRSearchPredicate

+ (id)predicateForKey:(id)a3 inCollection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_CRSearchCollectionPredicate alloc] initWithKey:v6 collection:v5];

  return v7;
}

- (CRSearchPredicate)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRSearchPredicate;
  v2 = [(CRSearchPredicate *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (id)predicateForKey:(id)a3 matchingText:(id)a4 comparison:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[_CRMatchTextPredicate alloc] initWithKey:v8 text:v7 comparison:a5];

  return v9;
}

+ (id)predicateSatisfyingAllSubpredicates:(id)a3
{
  id v3 = a3;
  v4 = [[_CRAndConjunctionPredicate alloc] initWithSubpredicates:v3];

  return v4;
}

+ (id)predicateSatisfyingAnySubpredicate:(id)a3
{
  id v3 = a3;
  v4 = [[_CROrConjunctionPredicate alloc] initWithSubpredicates:v3];

  return v4;
}

- (id)asNSPredicate
{
  v2 = self;
  CNAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)description
{
  v2 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v3 = [v2 build];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRSearchPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CNAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CNAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

+ (NSSet)secureCodableSubclasses
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:5];
  id v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7, v8, v9);

  return (NSSet *)v4;
}

@end