@interface HKSortedQueryAnchor
+ (BOOL)supportsSecureCoding;
+ (id)sortConstraintsWithSortDescriptors:(id)a3 sample:(id)a4;
+ (id)sortedQueryAnchorRelaxingConstraintsWithAnchor:(id)a3 error:(id *)a4;
+ (id)sortedQueryAnchorWithSortDescriptors:(id)a3;
+ (id)sortedQueryAnchorWithSortDescriptors:(id)a3 followingSample:(id)a4 objectID:(int64_t)a5;
+ (id)sortedQueryAnchorWithSortDescriptors:(id)a3 includingSample:(id)a4 objectID:(int64_t)a5;
+ (id)sortedQueryAnchorWithSortDescriptors:(id)a3 objectID:(int64_t)a4;
- (BOOL)canRelax;
- (BOOL)isCompatibleWithSortDescriptors:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HKSortedQueryAnchor)init;
- (HKSortedQueryAnchor)initWithCoder:(id)a3;
- (HKSortedQueryAnchor)initWithSortConstraints:(id)a3 objectID:(id)a4;
- (NSArray)sortConstraints;
- (NSNumber)objectID;
- (id)predicate;
- (id)querySortDescriptors;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSortedQueryAnchor

+ (id)sortedQueryAnchorWithSortDescriptors:(id)a3 objectID:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"HKSortedQueryAnchor.m", 37, @"Invalid parameter not satisfying: %@", @"sortDescriptors" object file lineNumber description];
  }
  v8 = objc_msgSend(v7, "hk_map:", &__block_literal_global_111);
  id v9 = objc_alloc((Class)a1);
  v10 = [NSNumber numberWithLongLong:a4];
  v11 = (void *)[v9 initWithSortConstraints:v8 objectID:v10];

  return v11;
}

HKQuerySortConstraint *__69__HKSortedQueryAnchor_sortedQueryAnchorWithSortDescriptors_objectID___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKQuerySortConstraint sortConstraintWithSortDescriptor:a2 predicate:0];
}

+ (id)sortedQueryAnchorWithSortDescriptors:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"HKSortedQueryAnchor.m", 46, @"Invalid parameter not satisfying: %@", @"sortDescriptors" object file lineNumber description];
  }
  v6 = objc_msgSend(v5, "hk_map:", &__block_literal_global_17_0);
  id v7 = (void *)[objc_alloc((Class)a1) initWithSortConstraints:v6 objectID:0];

  return v7;
}

HKQuerySortConstraint *__60__HKSortedQueryAnchor_sortedQueryAnchorWithSortDescriptors___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKQuerySortConstraint sortConstraintWithSortDescriptor:a2 predicate:0];
}

- (HKSortedQueryAnchor)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSortedQueryAnchor)initWithSortConstraints:(id)a3 objectID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HKSortedQueryAnchor.m", 58, @"Invalid parameter not satisfying: %@", @"sortConstraints" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)HKSortedQueryAnchor;
  id v9 = [(HKSortedQueryAnchor *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    sortConstraints = v9->_sortConstraints;
    v9->_sortConstraints = (NSArray *)v10;

    uint64_t v12 = [v8 copy];
    objectID = v9->_objectID;
    v9->_objectID = (NSNumber *)v12;
  }
  return v9;
}

+ (id)sortConstraintsWithSortDescriptors:(id)a3 sample:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__HKSortedQueryAnchor_sortConstraintsWithSortDescriptors_sample___block_invoke;
  v9[3] = &unk_1E58C7C68;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a3, "hk_map:", v9);

  return v7;
}

id __65__HKSortedQueryAnchor_sortConstraintsWithSortDescriptors_sample___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F28B98];
  id v4 = a2;
  id v5 = [v4 key];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v4 key];
  id v8 = [v6 valueForKey:v7];
  id v9 = objc_msgSend(v3, "hk_equalityPredicateWithKey:value:", v5, v8);

  id v10 = +[HKQuerySortConstraint sortConstraintWithSortDescriptor:v4 predicate:v9];

  return v10;
}

+ (id)sortedQueryAnchorWithSortDescriptors:(id)a3 includingSample:(id)a4 objectID:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() sortConstraintsWithSortDescriptors:v9 sample:v8];

  id v11 = objc_alloc((Class)a1);
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v13 = [NSNumber numberWithLongLong:a5 - 1];
  v14 = (void *)[v11 initWithSortConstraints:v12 objectID:v13];

  return v14;
}

+ (id)sortedQueryAnchorWithSortDescriptors:(id)a3 followingSample:(id)a4 objectID:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() sortConstraintsWithSortDescriptors:v9 sample:v8];

  id v11 = objc_alloc((Class)a1);
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v13 = [NSNumber numberWithLongLong:a5];
  v14 = (void *)[v11 initWithSortConstraints:v12 objectID:v13];

  return v14;
}

+ (id)sortedQueryAnchorRelaxingConstraintsWithAnchor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 sortConstraints];
  id v8 = objc_msgSend(v7, "hk_reversed");

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__HKSortedQueryAnchor_sortedQueryAnchorRelaxingConstraintsWithAnchor_error___block_invoke;
  v15[3] = &unk_1E58C7C90;
  v15[4] = v16;
  id v9 = objc_msgSend(v8, "hk_map:error:", v15, a4);
  id v10 = objc_msgSend(v9, "hk_reversed");

  if (v10)
  {
    id v11 = objc_msgSend(v10, "hk_filter:", &__block_literal_global_29_1);
    uint64_t v12 = [v11 count];

    if (v12 > 0)
    {
      v13 = (void *)[objc_alloc((Class)a1) initWithSortConstraints:v10 objectID:0];
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Unable to relax query anchor");
  }
  v13 = 0;
LABEL_6:

  _Block_object_dispose(v16, 8);

  return v13;
}

id __76__HKSortedQueryAnchor_sortedQueryAnchorRelaxingConstraintsWithAnchor_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) && ([v5 canRelax] & 1) != 0)
  {
    id v7 = +[HKQuerySortConstraint sortConstraintByRelaxingSortConstraint:v6 error:a3];
    id v8 = v7;
    if (v7)
    {
      if ([v7 canRelax]) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      }
      id v9 = v8;
    }
  }
  else
  {
    id v8 = (void *)[v6 copy];
  }

  return v8;
}

BOOL __76__HKSortedQueryAnchor_sortedQueryAnchorRelaxingConstraintsWithAnchor_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 predicate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)querySortDescriptors
{
  v2 = [(HKSortedQueryAnchor *)self sortConstraints];
  BOOL v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_36);
  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"HKObjectSortIdentifierDataID" ascending:1];
  id v5 = [v3 arrayByAddingObject:v4];

  return v5;
}

uint64_t __43__HKSortedQueryAnchor_querySortDescriptors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sortDescriptor];
}

- (id)predicate
{
  v2 = [(HKSortedQueryAnchor *)self sortConstraints];
  BOOL v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_39_0);

  id v4 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v3];

  return v4;
}

uint64_t __32__HKSortedQueryAnchor_predicate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 predicate];
}

- (BOOL)isCompatibleWithSortDescriptors:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSortedQueryAnchor *)self sortConstraints];
  id v6 = objc_msgSend(v5, "hk_map:", &__block_literal_global_42_0);
  char v7 = [v6 isEqualToArray:v4];

  return v7;
}

uint64_t __55__HKSortedQueryAnchor_isCompatibleWithSortDescriptors___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sortDescriptor];
}

- (BOOL)canRelax
{
  BOOL v3 = [(HKSortedQueryAnchor *)self sortConstraints];
  id v4 = objc_msgSend(v3, "hk_filter:", &__block_literal_global_44_1);
  uint64_t v5 = [v4 count];

  id v6 = [(HKSortedQueryAnchor *)self objectID];

  if (v6) {
    uint64_t v7 = v5 + 1;
  }
  else {
    uint64_t v7 = v5;
  }
  return v7 > 1;
}

uint64_t __31__HKSortedQueryAnchor_canRelax__block_invoke(uint64_t a1, void *a2)
{
  return [a2 canRelax];
}

- (unint64_t)hash
{
  BOOL v3 = [(HKSortedQueryAnchor *)self sortConstraints];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(HKSortedQueryAnchor *)self objectID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKSortedQueryAnchor *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      sortConstraints = self->_sortConstraints;
      uint64_t v7 = [(HKSortedQueryAnchor *)v5 sortConstraints];
      if (sortConstraints == (NSArray *)v7)
      {
      }
      else
      {
        id v8 = (void *)v7;
        uint64_t v9 = [(HKSortedQueryAnchor *)v5 sortConstraints];
        if (!v9) {
          goto LABEL_14;
        }
        id v10 = (void *)v9;
        id v11 = self->_sortConstraints;
        uint64_t v12 = [(HKSortedQueryAnchor *)v5 sortConstraints];
        LODWORD(v11) = [(NSArray *)v11 isEqual:v12];

        if (!v11) {
          goto LABEL_15;
        }
      }
      objectID = self->_objectID;
      uint64_t v15 = [(HKSortedQueryAnchor *)v5 objectID];
      if (objectID == (NSNumber *)v15)
      {

LABEL_17:
        BOOL v13 = 1;
        goto LABEL_18;
      }
      id v8 = (void *)v15;
      uint64_t v16 = [(HKSortedQueryAnchor *)v5 objectID];
      if (v16)
      {
        char v17 = (void *)v16;
        v18 = self->_objectID;
        v19 = [(HKSortedQueryAnchor *)v5 objectID];
        LOBYTE(v18) = [(NSNumber *)v18 isEqual:v19];

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

- (HKSortedQueryAnchor)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v7 = [v5 setWithArray:v6];
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"SortConstraints"];

  if (v8)
  {
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ObjectID"];
    v14.receiver = self;
    v14.super_class = (Class)HKSortedQueryAnchor;
    id v10 = [(HKSortedQueryAnchor *)&v14 init];
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_sortConstraints, v8);
      objc_storeStrong(p_isa + 1, v9);
    }
    self = p_isa;

    uint64_t v12 = self;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  sortConstraints = self->_sortConstraints;
  id v5 = a3;
  [v5 encodeObject:sortConstraints forKey:@"SortConstraints"];
  [v5 encodeObject:self->_objectID forKey:@"ObjectID"];
}

- (NSNumber)objectID
{
  return self->_objectID;
}

- (NSArray)sortConstraints
{
  return self->_sortConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortConstraints, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

@end