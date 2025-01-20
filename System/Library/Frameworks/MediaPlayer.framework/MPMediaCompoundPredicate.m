@interface MPMediaCompoundPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateMatchingPredicates:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MPMediaCompoundPredicate)initWithCoder:(id)a3;
- (MPMediaCompoundPredicate)initWithPredicates:(id)a3;
- (MPMediaCompoundPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4;
- (NSArray)predicates;
- (NSString)description;
- (id)ML3PredicateForContainer;
- (id)ML3PredicateForTrack;
- (id)_ML3PredicateForEntityTypeSelector:(SEL)a3;
- (id)protobufferEncodableObjectFromLibrary:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPMediaCompoundPredicate

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  v7.receiver = self;
  v7.super_class = (Class)MPMediaCompoundPredicate;
  if ([(MPMediaCompoundPredicate *)&v7 isEqual:v4]) {
    char v5 = [v4[1] isEqual:self->_predicates];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

id __77__MPMediaCompoundPredicate_ML3Additions___ML3PredicateForEntityTypeSelector___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F1CA48] array];
  char v5 = NSStringFromSelector(a2);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = objc_msgSend(*(id *)(a1 + 32), "predicates", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) valueForKey:v5];
        if (v11)
        {
          v12 = [MEMORY[0x1E4F1CA98] null];
          char v13 = [v11 isEqual:v12];

          if ((v13 & 1) == 0) {
            [v4 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v4;
}

- (NSArray)predicates
{
  return self->_predicates;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)MPMediaCompoundPredicate;
  unint64_t v3 = [(MPMediaCompoundPredicate *)&v5 hash];
  return [(NSArray *)self->_predicates hash] ^ v3;
}

- (id)_ML3PredicateForEntityTypeSelector:(SEL)a3
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__MPMediaCompoundPredicate_ML3Additions___ML3PredicateForEntityTypeSelector___block_invoke;
  v9[3] = &unk_1E57F2048;
  v9[4] = self;
  v4 = (void (**)(void, void))MEMORY[0x19971E0F0](v9, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = ((void (**)(void, SEL))v4)[2](v4, a3);
    if ([v5 count])
    {
      v6 = (id *)0x1E4F79A60;
LABEL_7:
      uint64_t v7 = [*v6 predicateMatchingPredicates:v5];
LABEL_9:

      goto LABEL_11;
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = ((void (**)(void, SEL))v4)[2](v4, a3);
    if ([v5 count])
    {
      v6 = (id *)0x1E4F79A68;
      goto LABEL_7;
    }
LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

- (id)ML3PredicateForTrack
{
  return [(MPMediaCompoundPredicate *)self _ML3PredicateForEntityTypeSelector:a2];
}

- (id)ML3PredicateForContainer
{
  return [(MPMediaCompoundPredicate *)self _ML3PredicateForEntityTypeSelector:a2];
}

- (void).cxx_destruct
{
}

+ (id)predicateMatchingPredicates:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPredicates:v3];

  return v4;
}

- (MPMediaCompoundPredicate)initWithPredicates:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMediaCompoundPredicate;
  objc_super v5 = [(MPMediaCompoundPredicate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    predicates = v5->_predicates;
    v5->_predicates = (NSArray *)v6;
  }
  return v5;
}

- (id)protobufferEncodableObjectFromLibrary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = objc_alloc_init(MPPCompoundPredicate);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_predicates;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "protobufferEncodableObjectFromLibrary:", v4, (void)v14);
        [(MPPCompoundPredicate *)v5 addPredicates:v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = objc_alloc_init(MPPMediaPredicate);
  [(MPPMediaPredicate *)v12 setType:2];
  [(MPPMediaPredicate *)v12 setCompoundPredicate:v5];

  return v12;
}

- (MPMediaCompoundPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"MPMediaQuery.m", 1660, @"Cannot decode object of type %@", objc_opt_class() object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)MPMediaCompoundPredicate;
  uint64_t v9 = [(MPMediaCompoundPredicate *)&v25 init];
  if (v9)
  {
    v10 = [v7 compoundPredicate];
    v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "predicatesCount"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v12 = [v10 predicates];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = MPPCreateMediaPredicateFromProtocolPredicateAndLibrary(*(void **)(*((void *)&v21 + 1) + 8 * v16), v8);
          [(NSArray *)v11 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v14);
    }

    predicates = v9->_predicates;
    v9->_predicates = v11;
  }
  return v9;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p> %@", objc_opt_class(), self, self->_predicates];
}

- (void)encodeWithCoder:(id)a3
{
}

- (MPMediaCompoundPredicate)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MPMediaCompoundPredicate;
  objc_super v5 = [(MPMediaCompoundPredicate *)&v20 init];
  if (v5)
  {
    uint64_t v6 = MSVPropertyListDataClasses();
    id v7 = [v6 setByAddingObject:objc_opt_class()];
    id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"MPPredicates"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      predicates = v8;
      uint64_t v10 = [(NSArray *)predicates countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
LABEL_5:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(predicates);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [(NSArray *)predicates countByEnumeratingWithState:&v16 objects:v21 count:16];
            if (v11) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:

        uint64_t v14 = [(NSArray *)predicates copy];
        predicates = v5->_predicates;
        v5->_predicates = (NSArray *)v14;
      }
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end