@interface HFComparisonResult
+ (HFComparisonResult)resultWithDifference:(id)a3 priority:(unint64_t)a4;
- (BOOL)containsCriticalDifference;
- (BOOL)hasNoDifferencesHigherThanPriority:(unint64_t)a3;
- (HFComparisonResult)initWithObjectA:(id)a3 objectB:(id)a4;
- (NSArray)realDifferences;
- (NSMutableDictionary)mutableDifferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionBuilder;
- (id)filteredIgnoringKeys:(id)a3;
- (id)highestPriorityDifference;
- (id)newDifferenceWithKey:(id)a3 priority:(unint64_t)a4 block:(id)a5;
- (id)objectA;
- (id)objectB;
- (void)add:(id)a3;
- (void)addAll:(id)a3;
- (void)setMutableDifferences:(id)a3;
- (void)setObjectA:(id)a3;
- (void)setObjectB:(id)a3;
@end

@implementation HFComparisonResult

- (HFComparisonResult)initWithObjectA:(id)a3 objectB:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HFComparisonResult;
  v8 = [(HFComparisonResult *)&v20 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_objectA, v6);
    objc_storeWeak(&v9->_objectB, v7);
    v10 = [MEMORY[0x263EFF9A0] dictionary];
    [(HFComparisonResult *)v9 setMutableDifferences:v10];

    objc_opt_class();
    id v11 = v6;
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    objc_opt_class();
    id v14 = v7;
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    if (v13 && v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_12;
      }
    }
    else if ((v13 != 0) != (v16 != 0))
    {
LABEL_12:
      v17 = HFComparisonResultClassesKey;
      goto LABEL_16;
    }
    if ((v11 == 0) != (v14 != 0))
    {
LABEL_17:

      goto LABEL_18;
    }
    v17 = HFComparisonResultCompareToNilKey;
LABEL_16:
    v18 = +[HFDifference difference:*v17 priority:4];
    [(HFComparisonResult *)v9 add:v18];

    goto LABEL_17;
  }
LABEL_18:

  return v9;
}

+ (HFComparisonResult)resultWithDifference:(id)a3 priority:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithObjectA:0 objectB:0];
  id v7 = +[HFDifference difference:v5 priority:a4];

  [v6 add:v7];
  return (HFComparisonResult *)v6;
}

- (id)filteredIgnoringKeys:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(HFComparisonResult *)self copy];
  id v6 = [v5 mutableDifferences];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__HFComparisonResult_filteredIgnoringKeys___block_invoke;
  v11[3] = &unk_264099EE0;
  id v12 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_filter:", v11);
  v9 = (void *)[v8 mutableCopy];
  [v5 setMutableDifferences:v9];

  return v5;
}

uint64_t __43__HFComparisonResult_filteredIgnoringKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)add:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HFComparisonResult *)self mutableDifferences];
    id v6 = [v4 key];
    [v5 setObject:v4 forKey:v6];

    realDifferences = self->_realDifferences;
    self->_realDifferences = 0;
  }
}

- (id)newDifferenceWithKey:(id)a3 priority:(unint64_t)a4 block:(id)a5
{
  id v6 = +[HFDifference difference:a3 priority:a4 withBlock:a5];
  [(HFComparisonResult *)self add:v6];
  return v6;
}

- (void)addAll:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __29__HFComparisonResult_addAll___block_invoke;
  v3[3] = &unk_264099F08;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

uint64_t __29__HFComparisonResult_addAll___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) add:a2];
}

- (NSArray)realDifferences
{
  realDifferences = self->_realDifferences;
  if (!realDifferences)
  {
    id v4 = [(HFComparisonResult *)self differences];
    id v5 = [v4 allValues];
    objc_msgSend(v5, "na_filter:", &__block_literal_global_189);
    id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_realDifferences;
    self->_realDifferences = v6;

    realDifferences = self->_realDifferences;
  }
  return realDifferences;
}

BOOL __37__HFComparisonResult_realDifferences__block_invoke(uint64_t a1, void *a2)
{
  return [a2 priority] != 0;
}

- (BOOL)containsCriticalDifference
{
  v2 = [(HFComparisonResult *)self realDifferences];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_6_8);

  return v3;
}

BOOL __48__HFComparisonResult_containsCriticalDifference__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 priority] > 3;
}

- (id)highestPriorityDifference
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  v2 = [(HFComparisonResult *)self differences];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__HFComparisonResult_highestPriorityDifference__block_invoke;
  v5[3] = &unk_264099F50;
  v5[4] = &v6;
  objc_msgSend(v2, "na_each:", v5);

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__HFComparisonResult_highestPriorityDifference__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if ([v7 priority])
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v5 + 40))
    {
      unint64_t v6 = [v7 priority];
      if (v6 <= [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) priority]) {
        goto LABEL_6;
      }
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    }
    objc_storeStrong((id *)(v5 + 40), a3);
  }
LABEL_6:
}

- (BOOL)hasNoDifferencesHigherThanPriority:(unint64_t)a3
{
  id v4 = [(HFComparisonResult *)self highestPriorityDifference];
  uint64_t v5 = v4;
  if (v4) {
    BOOL v6 = [v4 priority] <= a3;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (id)descriptionBuilder
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F58188]) initWithObject:self];
  id v4 = [(HFComparisonResult *)self objectA];
  id v5 = (id)[v3 appendObject:v4 withName:@"objectA" skipIfNil:1];

  BOOL v6 = [(HFComparisonResult *)self objectB];
  id v7 = (id)[v3 appendObject:v6 withName:@"objectB" skipIfNil:1];

  uint64_t v8 = [(HFComparisonResult *)self realDifferences];
  [v3 appendArraySection:v8 withName:@"differences" skipIfEmpty:0];

  return v3;
}

- (id)description
{
  v2 = [(HFComparisonResult *)self descriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(HFComparisonResult *)self objectA];
  [v4 setObjectA:v5];

  BOOL v6 = [(HFComparisonResult *)self objectB];
  [v4 setObjectB:v6];

  id v7 = (void *)[(NSMutableDictionary *)self->_mutableDifferences copy];
  [v4 setMutableDifferences:v7];

  return v4;
}

- (id)objectA
{
  id WeakRetained = objc_loadWeakRetained(&self->_objectA);
  return WeakRetained;
}

- (void)setObjectA:(id)a3
{
}

- (id)objectB
{
  id WeakRetained = objc_loadWeakRetained(&self->_objectB);
  return WeakRetained;
}

- (void)setObjectB:(id)a3
{
}

- (NSMutableDictionary)mutableDifferences
{
  return self->_mutableDifferences;
}

- (void)setMutableDifferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDifferences, 0);
  objc_destroyWeak(&self->_objectB);
  objc_destroyWeak(&self->_objectA);
  objc_storeStrong((id *)&self->_realDifferences, 0);
}

@end