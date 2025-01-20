@interface CRKASMAtomicRosterConstraint
+ (id)constraintWithRosterEvaluator:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFulfilledByRoster:(id)a3;
- (CRKASMAtomicRosterConstraint)initWithIdentifier:(id)a3 rosterEvaluator:(id)a4;
- (NSUUID)identifier;
- (id)rosterEvaluator;
- (unint64_t)hash;
@end

@implementation CRKASMAtomicRosterConstraint

- (CRKASMAtomicRosterConstraint)initWithIdentifier:(id)a3 rosterEvaluator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKASMAtomicRosterConstraint;
  v9 = [(CRKASMAtomicRosterConstraint *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    uint64_t v11 = MEMORY[0x22A620AF0](v8);
    id rosterEvaluator = v10->_rosterEvaluator;
    v10->_id rosterEvaluator = (id)v11;
  }
  return v10;
}

+ (id)constraintWithRosterEvaluator:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [MEMORY[0x263F08C38] UUID];
  id v7 = (void *)[v5 initWithIdentifier:v6 rosterEvaluator:v4];

  return v7;
}

- (BOOL)isFulfilledByRoster:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKASMAtomicRosterConstraint *)self rosterEvaluator];
  char v6 = ((uint64_t (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (unint64_t)hash
{
  v2 = [(CRKASMAtomicRosterConstraint *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [@"identifier" componentsSeparatedByString:@","];
  char v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_13;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  id v8 = self;
  v9 = (CRKASMAtomicRosterConstraint *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKASMAtomicRosterConstraint *)v9 isMemberOfClass:objc_opt_class()])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v23 = v10;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          v17 = v9;
          uint64_t v18 = [(CRKASMAtomicRosterConstraint *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKASMAtomicRosterConstraint *)v17 valueForKey:v16];

          if (v18 | v19)
          {
            int v20 = [(id)v18 isEqual:v19];

            if (!v20)
            {
              BOOL v21 = 0;
              goto LABEL_16;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v21 = 1;
LABEL_16:
      id v10 = v23;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)rosterEvaluator
{
  return self->_rosterEvaluator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rosterEvaluator, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end