@interface CNCalculatesMultiValueDiff
+ (id)diffMultiValue:(id)a3 toMultiValue:(id)a4;
- (CNCalculatesMultiValueDiff)initWithMultiValue1:(id)a3 multiValue2:(id)a4;
- (id)updates;
- (void)appendAddUpdates;
- (void)appendRemoveUpdates;
- (void)appendReorderUpdates;
- (void)appendReplaceUpdates;
- (void)calculateDiff;
- (void)setupAddedIdentifiers;
- (void)setupCalculatedFinalIdentifiers;
- (void)setupFinalIdentifiers;
- (void)setupOriginalIdentifiers;
- (void)setupRemovedIdentifiers;
- (void)setupSameIdentifiers;
@end

@implementation CNCalculatesMultiValueDiff

+ (id)diffMultiValue:(id)a3 toMultiValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqual:v6])
  {
    v7 = [MEMORY[0x1E4F1C978] array];
  }
  else
  {
    id v9 = v5;
    id v10 = v6;
    v7 = CNResultWithAutoreleasePool();
  }

  return v7;
}

id __58__CNCalculatesMultiValueDiff_diffMultiValue_toMultiValue___block_invoke(uint64_t a1)
{
  v1 = [[CNCalculatesMultiValueDiff alloc] initWithMultiValue1:*(void *)(a1 + 32) multiValue2:*(void *)(a1 + 40)];
  [(CNCalculatesMultiValueDiff *)v1 calculateDiff];
  v2 = [(CNCalculatesMultiValueDiff *)v1 updates];

  return v2;
}

- (CNCalculatesMultiValueDiff)initWithMultiValue1:(id)a3 multiValue2:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNCalculatesMultiValueDiff;
  id v9 = [(CNCalculatesMultiValueDiff *)&v15 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_multiValue1, a3);
    objc_storeStrong((id *)&v10->_multiValue2, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    updates = v10->_updates;
    v10->_updates = v11;

    v13 = v10;
  }

  return v10;
}

- (void)setupOriginalIdentifiers
{
  id v7 = [(NSArray *)self->_multiValue1 _cn_filter:&__block_literal_global_19];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  v4 = objc_msgSend(v7, "_cn_map:", &__block_literal_global_148);
  id v5 = (NSOrderedSet *)[v3 initWithArray:v4];
  originalIdentifiers = self->_originalIdentifiers;
  self->_originalIdentifiers = v5;
}

BOOL __54__CNCalculatesMultiValueDiff_setupOriginalIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 storeIdentifier];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)setupFinalIdentifiers
{
  id v7 = [(NSArray *)self->_multiValue2 _cn_filter:&__block_literal_global_6_1];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  v4 = objc_msgSend(v7, "_cn_map:", &__block_literal_global_148);
  id v5 = (NSOrderedSet *)[v3 initWithArray:v4];
  finalIdentifiers = self->_finalIdentifiers;
  self->_finalIdentifiers = v5;
}

BOOL __51__CNCalculatesMultiValueDiff_setupFinalIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 storeIdentifier];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)setupRemovedIdentifiers
{
  BOOL v3 = (NSMutableOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithOrderedSet:self->_originalIdentifiers];
  removedIdentifiers = self->_removedIdentifiers;
  self->_removedIdentifiers = v3;

  id v5 = self->_removedIdentifiers;
  finalIdentifiers = self->_finalIdentifiers;

  [(NSMutableOrderedSet *)v5 minusOrderedSet:finalIdentifiers];
}

- (void)setupAddedIdentifiers
{
  BOOL v3 = (NSMutableOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithOrderedSet:self->_finalIdentifiers];
  addedIdentifiers = self->_addedIdentifiers;
  self->_addedIdentifiers = v3;

  id v5 = self->_addedIdentifiers;
  originalIdentifiers = self->_originalIdentifiers;

  [(NSMutableOrderedSet *)v5 minusOrderedSet:originalIdentifiers];
}

- (void)setupSameIdentifiers
{
  BOOL v3 = (NSMutableOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithOrderedSet:self->_originalIdentifiers];
  sameIdentifiers = self->_sameIdentifiers;
  self->_sameIdentifiers = v3;

  id v5 = self->_sameIdentifiers;
  finalIdentifiers = self->_finalIdentifiers;

  [(NSMutableOrderedSet *)v5 intersectOrderedSet:finalIdentifiers];
}

- (void)setupCalculatedFinalIdentifiers
{
  BOOL v3 = (NSMutableOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithOrderedSet:self->_originalIdentifiers];
  calculatedFinalIdentifiers = self->_calculatedFinalIdentifiers;
  self->_calculatedFinalIdentifiers = v3;

  [(NSMutableOrderedSet *)self->_calculatedFinalIdentifiers minusOrderedSet:self->_removedIdentifiers];
  id v5 = self->_calculatedFinalIdentifiers;
  addedIdentifiers = self->_addedIdentifiers;

  [(NSMutableOrderedSet *)v5 unionOrderedSet:addedIdentifiers];
}

- (void)appendRemoveUpdates
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_removedIdentifiers;
  uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = +[CNLabeledValue entryForIdentifier:inArray:](CNLabeledValue, "entryForIdentifier:inArray:", *(void *)(*((void *)&v10 + 1) + 8 * v7), self->_multiValue1, (void)v10);
        id v9 = +[CNMultiValueUpdate removeValue:v8];
        [(NSMutableArray *)self->_updates addObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)appendAddUpdates
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_addedIdentifiers;
  uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = +[CNLabeledValue entryForIdentifier:inArray:](CNLabeledValue, "entryForIdentifier:inArray:", *(void *)(*((void *)&v10 + 1) + 8 * v7), self->_multiValue2, (void)v10);
        id v9 = +[CNMultiValueUpdate addValue:v8];
        [(NSMutableArray *)self->_updates addObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)appendReplaceUpdates
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = self->_sameIdentifiers;
  uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = +[CNLabeledValue entryForIdentifier:inArray:](CNLabeledValue, "entryForIdentifier:inArray:", v8, self->_multiValue1, (void)v12);
        long long v10 = +[CNLabeledValue entryForIdentifier:v8 inArray:self->_multiValue2];
        if (([v9 isEqual:v10] & 1) == 0)
        {
          long long v11 = +[CNMultiValueUpdate replaceValue:v9 withValue:v10];
          [(NSMutableArray *)self->_updates addObject:v11];
        }
      }
      uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)appendReorderUpdates
{
  if (([(NSMutableOrderedSet *)self->_calculatedFinalIdentifiers isEqual:self->_finalIdentifiers] & 1) == 0)
  {
    BOOL v3 = self->_multiValue2;
    uint64_t v4 = [(NSOrderedSet *)self->_finalIdentifiers array];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__CNCalculatesMultiValueDiff_appendReorderUpdates__block_invoke;
    v8[3] = &unk_1E56B4788;
    id v9 = v3;
    uint64_t v5 = v3;
    uint64_t v6 = objc_msgSend(v4, "_cn_map:", v8);

    uint64_t v7 = +[CNMultiValueUpdate reorderValues:v6];
    [(NSMutableArray *)self->_updates addObject:v7];
  }
}

id __50__CNCalculatesMultiValueDiff_appendReorderUpdates__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNLabeledValue entryForIdentifier:a2 inArray:*(void *)(a1 + 32)];
}

- (void)calculateDiff
{
  [(CNCalculatesMultiValueDiff *)self setupOriginalIdentifiers];
  [(CNCalculatesMultiValueDiff *)self setupFinalIdentifiers];
  [(CNCalculatesMultiValueDiff *)self setupAddedIdentifiers];
  [(CNCalculatesMultiValueDiff *)self setupRemovedIdentifiers];
  [(CNCalculatesMultiValueDiff *)self setupSameIdentifiers];
  [(CNCalculatesMultiValueDiff *)self setupCalculatedFinalIdentifiers];
  [(CNCalculatesMultiValueDiff *)self appendRemoveUpdates];
  [(CNCalculatesMultiValueDiff *)self appendAddUpdates];
  [(CNCalculatesMultiValueDiff *)self appendReplaceUpdates];

  [(CNCalculatesMultiValueDiff *)self appendReorderUpdates];
}

- (id)updates
{
  return self->_updates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_calculatedFinalIdentifiers, 0);
  objc_storeStrong((id *)&self->_sameIdentifiers, 0);
  objc_storeStrong((id *)&self->_removedIdentifiers, 0);
  objc_storeStrong((id *)&self->_addedIdentifiers, 0);
  objc_storeStrong((id *)&self->_finalIdentifiers, 0);
  objc_storeStrong((id *)&self->_originalIdentifiers, 0);
  objc_storeStrong((id *)&self->_multiValue2, 0);

  objc_storeStrong((id *)&self->_multiValue1, 0);
}

@end