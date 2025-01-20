@interface HKQuerySortConstraint
+ (BOOL)supportsSecureCoding;
+ (id)sortConstraintByRelaxingSortConstraint:(id)a3 error:(id *)a4;
+ (id)sortConstraintWithSortDescriptor:(id)a3 predicate:(id)a4;
- (BOOL)canRelax;
- (BOOL)isEqual:(id)a3;
- (HKQuerySortConstraint)init;
- (HKQuerySortConstraint)initWithCoder:(id)a3;
- (HKQuerySortConstraint)initWithSortDescriptor:(id)a3 predicate:(id)a4;
- (NSComparisonPredicate)predicate;
- (NSSortDescriptor)sortDescriptor;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKQuerySortConstraint

+ (id)sortConstraintWithSortDescriptor:(id)a3 predicate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = [v7 key];
    v10 = [v8 leftExpression];
    v11 = [v10 keyPath];
    char v12 = [v9 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, a1, @"HKQuerySortConstraint.m", 32, @"Invalid parameter not satisfying: %@", @"[sortDescriptor.key isEqualToString:predicate.leftExpression.keyPath]" object file lineNumber description];
    }
    if ([v8 predicateOperatorType] != 4
      && [v8 predicateOperatorType] != 2
      && [v8 predicateOperatorType])
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, a1, @"HKQuerySortConstraint.m", 35, @"Invalid parameter not satisfying: %@", @"predicate.predicateOperatorType == NSEqualToPredicateOperatorType || predicate.predicateOperatorType == NSGreaterThanPredicateOperatorType || predicate.predicateOperatorType == NSLessThanPredicateOperatorType" object file lineNumber description];
    }
  }
  v13 = (void *)[objc_alloc((Class)a1) initWithSortDescriptor:v7 predicate:v8];

  return v13;
}

+ (id)sortConstraintByRelaxingSortConstraint:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 predicate];

  if (v6)
  {
    id v7 = [v5 predicate];
    uint64_t v8 = [v7 predicateOperatorType];

    if (v8 == 4)
    {
      v9 = (void *)MEMORY[0x1E4F28B98];
      v10 = [v5 sortDescriptor];
      v11 = [v10 key];
      char v12 = [v5 predicate];
      v13 = [v12 rightExpression];
      v14 = [v13 constantValue];
      v15 = [v5 sortDescriptor];
      v16 = objc_msgSend(v9, "hk_inequalityPredicateWithKey:value:ascending:", v11, v14, objc_msgSend(v15, "ascending"));

      v17 = [v5 sortDescriptor];
      v18 = +[HKQuerySortConstraint sortConstraintWithSortDescriptor:v17 predicate:v16];
    }
    else
    {
      v16 = [v5 sortDescriptor];
      v18 = +[HKQuerySortConstraint sortConstraintWithSortDescriptor:v16 predicate:0];
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Unable to relax sort constraint");
    v18 = 0;
  }

  return v18;
}

- (BOOL)canRelax
{
  v2 = [(HKQuerySortConstraint *)self predicate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (HKQuerySortConstraint)init
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKQuerySortConstraint)initWithSortDescriptor:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKQuerySortConstraint;
  uint64_t v8 = [(HKQuerySortConstraint *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    sortDescriptor = v8->_sortDescriptor;
    v8->_sortDescriptor = (NSSortDescriptor *)v9;

    uint64_t v11 = [v7 copy];
    predicate = v8->_predicate;
    v8->_predicate = (NSComparisonPredicate *)v11;
  }
  return v8;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p sortDescriptor = %@, predicate = %@>", v5, self, self->_sortDescriptor, self->_predicate];

  return v6;
}

- (unint64_t)hash
{
  BOOL v3 = [(HKQuerySortConstraint *)self sortDescriptor];
  uint64_t v4 = [v3 hash];
  id v5 = [(HKQuerySortConstraint *)self predicate];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKQuerySortConstraint *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      sortDescriptor = self->_sortDescriptor;
      uint64_t v7 = [(HKQuerySortConstraint *)v5 sortDescriptor];
      if (sortDescriptor == (NSSortDescriptor *)v7)
      {
      }
      else
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = [(HKQuerySortConstraint *)v5 sortDescriptor];
        if (!v9) {
          goto LABEL_14;
        }
        v10 = (void *)v9;
        uint64_t v11 = self->_sortDescriptor;
        char v12 = [(HKQuerySortConstraint *)v5 sortDescriptor];
        LODWORD(v11) = [(NSSortDescriptor *)v11 isEqual:v12];

        if (!v11) {
          goto LABEL_15;
        }
      }
      predicate = self->_predicate;
      uint64_t v15 = [(HKQuerySortConstraint *)v5 predicate];
      if (predicate == (NSComparisonPredicate *)v15)
      {

LABEL_17:
        BOOL v13 = 1;
        goto LABEL_18;
      }
      uint64_t v8 = (void *)v15;
      uint64_t v16 = [(HKQuerySortConstraint *)v5 predicate];
      if (v16)
      {
        v17 = (void *)v16;
        v18 = self->_predicate;
        v19 = [(HKQuerySortConstraint *)v5 predicate];
        LOBYTE(v18) = [(NSComparisonPredicate *)v18 isEqual:v19];

        if (v18) {
          goto LABEL_17;
        }
LABEL_15:
        BOOL v13 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    BOOL v13 = 0;
  }
LABEL_19:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQuerySortConstraint)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SortDescriptor"];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Predicate"];
    self = [(HKQuerySortConstraint *)self initWithSortDescriptor:v5 predicate:v9];

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  sortDescriptor = self->_sortDescriptor;
  id v5 = a3;
  [v5 encodeObject:sortDescriptor forKey:@"SortDescriptor"];
  [v5 encodeObject:self->_predicate forKey:@"Predicate"];
}

- (NSSortDescriptor)sortDescriptor
{
  return self->_sortDescriptor;
}

- (NSComparisonPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_sortDescriptor, 0);
}

@end