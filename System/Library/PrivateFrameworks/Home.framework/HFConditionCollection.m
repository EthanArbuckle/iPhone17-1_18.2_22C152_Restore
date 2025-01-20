@interface HFConditionCollection
+ (id)_findBestConditionMatchForPredicates:(id)a3;
+ (id)_findBestMatchingConditionsForPredicates:(id)a3;
+ (id)_flattenedSubpredicatesForAndPredicate:(id)a3;
+ (id)_singleConditionForPredicate:(id)a3 knownConditionsOnly:(BOOL)a4;
+ (id)conditionCollectionForPredicate:(id)a3;
- (HFConditionCollection)init;
- (HFConditionCollection)initWithConditions:(id)a3;
- (NSArray)conditions;
- (NSPredicate)predicate;
- (void)addCondition:(id)a3;
- (void)removeCondition:(id)a3;
- (void)setConditions:(id)a3;
@end

@implementation HFConditionCollection

+ (id)conditionCollectionForPredicate:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFFA08] set];
  v6 = [a1 _singleConditionForPredicate:v4 knownConditionsOnly:0];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFFA08] setWithObject:v6];

    v5 = (void *)v7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 compoundPredicateType] == 1)
    {
      v8 = [a1 _flattenedSubpredicatesForAndPredicate:v4];
      v9 = (void *)MEMORY[0x263EFFA08];
      v10 = [a1 _findBestMatchingConditionsForPredicates:v8];
      uint64_t v11 = [v9 setWithArray:v10];

      v5 = (void *)v11;
    }
  }
  id v12 = objc_alloc((Class)objc_opt_class());
  v13 = [v5 allObjects];
  v14 = (void *)[v12 initWithConditions:v13];

  return v14;
}

+ (id)_flattenedSubpredicatesForAndPredicate:(id)a3
{
  id v4 = [a3 subpredicates];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HFConditionCollection__flattenedSubpredicatesForAndPredicate___block_invoke;
  v7[3] = &__block_descriptor_40_e30___NSArray_16__0__NSPredicate_8l;
  v7[4] = a1;
  v5 = objc_msgSend(v4, "na_flatMap:", v7);

  return v5;
}

id __64__HFConditionCollection__flattenedSubpredicatesForAndPredicate___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6 && [v6 compoundPredicateType] == 1)
  {
    uint64_t v7 = [*(id *)(a1 + 32) _flattenedSubpredicatesForAndPredicate:v6];
  }
  else
  {
    v10[0] = v4;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  v8 = (void *)v7;

  return v8;
}

+ (id)_findBestMatchingConditionsForPredicates:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  v5 = objc_opt_new();
  while ([v4 count])
  {
    id v6 = [a1 _findBestConditionMatchForPredicates:v4];
    uint64_t v7 = [v6 matchedCondition];
    [v5 addObject:v7];

    v8 = [v6 matchedPredicates];
    [v4 removeObjectsInArray:v8];
  }
  return v5;
}

+ (id)_findBestConditionMatchForPredicates:(id)a3
{
  id v4 = a3;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __62__HFConditionCollection__findBestConditionMatchForPredicates___block_invoke;
  v19[3] = &unk_26408DA50;
  id v5 = v4;
  id v20 = v5;
  id v21 = a1;
  id v6 = __62__HFConditionCollection__findBestConditionMatchForPredicates___block_invoke((uint64_t)v19);
  if (v6)
  {
    id v7 = +[_HFCompoundConditionMatch matchWithCondition:v6 matchedPredicates:v5];
  }
  else
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__1;
    v17 = __Block_byref_object_dispose__1;
    id v18 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __62__HFConditionCollection__findBestConditionMatchForPredicates___block_invoke_25;
    v9[3] = &unk_26408DA78;
    uint64_t v11 = &v13;
    id v12 = a1;
    id v10 = v5;
    [v10 enumerateObjectsWithOptions:2 usingBlock:v9];
    id v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }

  return v7;
}

id __62__HFConditionCollection__findBestConditionMatchForPredicates___block_invoke(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) count] < 2)
  {
    uint64_t v7 = objc_opt_class();
    id v3 = [*(id *)(a1 + 32) firstObject];
    id v4 = (void *)v7;
    id v5 = v3;
    BOOL v6 = 0;
  }
  else
  {
    BOOL v2 = (unint64_t)[*(id *)(a1 + 32) count] < 8;
    id v3 = (void *)[objc_alloc(MEMORY[0x263F08730]) initWithType:1 subpredicates:*(void *)(a1 + 32)];
    id v4 = objc_opt_class();
    id v5 = v3;
    BOOL v6 = v2;
  }
  v8 = [v4 _singleConditionForPredicate:v5 knownConditionsOnly:v6];

  return v8;
}

void __62__HFConditionCollection__findBestConditionMatchForPredicates___block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v12 = (id)[*(id *)(a1 + 32) mutableCopy];
  [v12 removeObjectAtIndex:a3];
  id v5 = [*(id *)(a1 + 48) _findBestConditionMatchForPredicates:v12];
  BOOL v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v7 + 40))
  {
    v8 = [v5 matchedPredicates];
    unint64_t v9 = [v8 count];
    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) matchedPredicates];
    unint64_t v11 = [v10 count];

    if (v9 <= v11) {
      goto LABEL_5;
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  objc_storeStrong((id *)(v7 + 40), v6);
LABEL_5:
}

+ (id)_singleConditionForPredicate:(id)a3 knownConditionsOnly:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (_MergedGlobals_214 != -1) {
    dispatch_once(&_MergedGlobals_214, &__block_literal_global_30_0);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (id)qword_26AB2EC48;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_alloc(*(Class *)(*((void *)&v15 + 1) + 8 * i));
        uint64_t v12 = objc_msgSend(v11, "initWithPredicate:", v5, (void)v15);
        if (v12)
        {
          uint64_t v13 = (HFUnknownCondition *)v12;

          goto LABEL_15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if (a4) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = [(HFCondition *)[HFUnknownCondition alloc] initWithPredicate:v5];
  }
LABEL_15:

  return v13;
}

void __74__HFConditionCollection__singleConditionForPredicate_knownConditionsOnly___block_invoke_2()
{
  v2[7] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:7];
  v1 = (void *)qword_26AB2EC48;
  qword_26AB2EC48 = v0;
}

- (HFConditionCollection)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithConditions_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFConditionCollection.m", 184, @"%s is unavailable; use %@ instead",
    "-[HFConditionCollection init]",
    v5);

  return 0;
}

- (HFConditionCollection)initWithConditions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFConditionCollection;
  id v6 = [(HFConditionCollection *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_conditions, a3);
  }

  return v7;
}

- (void)addCondition:(id)a3
{
  id v4 = a3;
  id v6 = [(HFConditionCollection *)self conditions];
  id v5 = [v6 arrayByAddingObject:v4];

  [(HFConditionCollection *)self setConditions:v5];
}

- (void)removeCondition:(id)a3
{
  id v4 = a3;
  id v5 = [(HFConditionCollection *)self conditions];
  id v7 = (id)[v5 mutableCopy];

  [v7 removeObject:v4];
  id v6 = (void *)[v7 copy];
  [(HFConditionCollection *)self setConditions:v6];
}

- (NSPredicate)predicate
{
  BOOL v2 = [(HFConditionCollection *)self conditions];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_48);

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__HFConditionCollection_predicate__block_invoke_2;
  v7[3] = &unk_26408DAC0;
  id v8 = v3;
  id v4 = v3;
  id v5 = __34__HFConditionCollection_predicate__block_invoke_2((uint64_t)v7);

  return (NSPredicate *)v5;
}

uint64_t __34__HFConditionCollection_predicate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 predicate];
}

id __34__HFConditionCollection_predicate__block_invoke_2(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) count] < 2)
  {
    if ([*(id *)(a1 + 32) count] == 1)
    {
      BOOL v2 = [*(id *)(a1 + 32) firstObject];
    }
    else
    {
      BOOL v2 = 0;
    }
  }
  else
  {
    BOOL v2 = (void *)[objc_alloc(MEMORY[0x263F08730]) initWithType:1 subpredicates:*(void *)(a1 + 32)];
  }
  return v2;
}

- (NSArray)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end