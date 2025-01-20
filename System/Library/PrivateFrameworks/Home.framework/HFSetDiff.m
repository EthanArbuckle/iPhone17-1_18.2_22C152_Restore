@interface HFSetDiff
+ (id)diffFromSet:(id)a3 toSet:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSSet)additions;
- (NSSet)deletions;
- (NSSet)fromSet;
- (NSSet)toSet;
- (NSSet)updates;
- (id)_initWithFromSet:(id)a3 toSet:(id)a4 additions:(id)a5 deletions:(id)a6 updates:(id)a7;
- (id)description;
- (id)diffByMergingDiff:(id)a3 keyGenerator:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation HFSetDiff

+ (id)diffFromSet:(id)a3 toSet:(id)a4
{
  v5 = (void *)MEMORY[0x263EFF9C0];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 setWithSet:v6];
  [v8 minusSet:v7];
  v9 = [MEMORY[0x263EFF9C0] setWithSet:v7];
  [v9 minusSet:v6];
  v10 = [MEMORY[0x263EFF9C0] setWithSet:v6];
  [v10 minusSet:v8];
  [v10 minusSet:v9];
  v11 = [HFSetDiff alloc];
  v12 = (void *)[v6 mutableCopy];

  id v13 = [(HFSetDiff *)v11 _initWithFromSet:v7 toSet:v12 additions:v8 deletions:v9 updates:v10];
  return v13;
}

- (id)_initWithFromSet:(id)a3 toSet:(id)a4 additions:(id)a5 deletions:(id)a6 updates:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HFSetDiff;
  v17 = [(HFSetDiff *)&v21 init];
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fromSet, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
  }

  return p_isa;
}

- (NSSet)additions
{
  return &self->_additions->super;
}

- (NSSet)deletions
{
  return &self->_deletions->super;
}

- (NSSet)updates
{
  return &self->_updates->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_deletions, 0);
  objc_storeStrong((id *)&self->_additions, 0);
  objc_storeStrong((id *)&self->_toSet, 0);
  objc_storeStrong((id *)&self->_fromSet, 0);
}

- (unint64_t)hash
{
  v2 = [(HFSetDiff *)self fromSet];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)diffByMergingDiff:(id)a3 keyGenerator:(id)a4
{
  v34[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HFSetDiff *)self toSet];
  v9 = [(HFSetDiff *)self deletions];
  v10 = [v8 setByAddingObjectsFromSet:v9];
  v11 = objc_msgSend(v10, "na_dictionaryWithKeyGenerator:", v7);

  v12 = [v6 toSet];
  id v13 = [v6 deletions];
  id v14 = [v12 setByAddingObjectsFromSet:v13];
  id v15 = objc_msgSend(v14, "na_dictionaryWithKeyGenerator:", v7);

  id v16 = (void *)MEMORY[0x263EFFA08];
  v17 = [v11 allKeys];
  v34[0] = v17;
  v18 = [v15 allKeys];
  v34[1] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  id v20 = objc_msgSend(v19, "na_arrayByFlattening");
  objc_super v21 = [v16 setWithArray:v20];

  v22 = (void *)[(HFSetDiff *)self mutableCopy];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __44__HFSetDiff_diffByMergingDiff_keyGenerator___block_invoke;
  v29[3] = &unk_26409B468;
  id v30 = v11;
  id v31 = v15;
  id v32 = v6;
  id v33 = v22;
  id v23 = v22;
  id v24 = v6;
  id v25 = v15;
  id v26 = v11;
  objc_msgSend(v21, "na_each:", v29);
  v27 = (void *)[v23 copy];

  return v27;
}

void __44__HFSetDiff_diffByMergingDiff_keyGenerator___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v12 = [v3 objectForKey:v4];
  v5 = [*(id *)(a1 + 40) objectForKey:v4];

  id v6 = [*(id *)(a1 + 48) deletions];
  char v7 = [v6 containsObject:v5];

  if (!v12 || !v5)
  {
    if (v12) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v5 == 0;
    }
    if (v10) {
      char v11 = 1;
    }
    else {
      char v11 = v7;
    }
    if (v11) {
      goto LABEL_14;
    }
    v8 = (id *)(a1 + 56);
    goto LABEL_13;
  }
  v9 = *(void **)(a1 + 56);
  v8 = (id *)(a1 + 56);
  [v9 deleteObject:v12];
  if ((v7 & 1) == 0) {
LABEL_13:
  }
    [*v8 addObject:v5];
LABEL_14:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HFSetDiff *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(HFSetDiff *)v5 fromSet];
      char v7 = [(HFSetDiff *)self fromSet];
      if (v6 == v7)
      {
        int v10 = 1;
      }
      else
      {
        v8 = [(HFSetDiff *)v5 fromSet];
        v9 = [(HFSetDiff *)self fromSet];
        int v10 = [v8 isEqual:v9];
      }
      id v12 = [(HFSetDiff *)v5 toSet];
      id v13 = [(HFSetDiff *)self toSet];
      if (v12 == v13)
      {
        BOOL v11 = v10 != 0;
      }
      else
      {
        id v14 = [(HFSetDiff *)v5 toSet];
        id v15 = [(HFSetDiff *)self toSet];
        char v16 = [v14 isEqual:v15];
        if (v10) {
          BOOL v11 = v16;
        }
        else {
          BOOL v11 = 0;
        }
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HFMutableSetDiff alloc];
  char v16 = [(HFSetDiff *)self fromSet];
  v5 = (void *)[v16 copy];
  id v6 = [(HFSetDiff *)self toSet];
  char v7 = (void *)[v6 mutableCopy];
  v8 = [(HFSetDiff *)self additions];
  v9 = (void *)[v8 mutableCopy];
  int v10 = [(HFSetDiff *)self deletions];
  BOOL v11 = (void *)[v10 mutableCopy];
  id v12 = [(HFSetDiff *)self updates];
  id v13 = (void *)[v12 mutableCopy];
  id v14 = [(HFSetDiff *)v4 _initWithFromSet:v5 toSet:v7 additions:v9 deletions:v11 updates:v13];

  return v14;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = [(HFSetDiff *)self fromSet];
  v5 = [(HFSetDiff *)self toSet];
  id v6 = [(HFSetDiff *)self additions];
  char v7 = [(HFSetDiff *)self deletions];
  v8 = [(HFSetDiff *)self updates];
  v9 = [v3 stringWithFormat:@"From Set: %@\n To Set: %@\n Additions: %@\n Deletions: %@\n Updates:%@", v4, v5, v6, v7, v8];

  return v9;
}

- (NSSet)fromSet
{
  return self->_fromSet;
}

- (NSSet)toSet
{
  return &self->_toSet->super;
}

@end