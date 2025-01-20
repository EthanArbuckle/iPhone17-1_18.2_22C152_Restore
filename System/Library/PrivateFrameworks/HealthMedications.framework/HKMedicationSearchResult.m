@interface HKMedicationSearchResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKConcept)specificProduct;
- (HKConcept)tradeNameProduct;
- (HKIntegerSet)traversedRelationships;
- (HKMedicationSearchResult)initWithCoder:(id)a3;
- (HKMedicationSearchResult)initWithSeedHgId:(id)a3 specificProduct:(id)a4 traversedRelationships:(id)a5 traversedDepth:(int64_t)a6;
- (NSArray)clinicalProducts;
- (NSArray)ingredientProducts;
- (NSArray)routedDoseFormProducts;
- (NSNumber)seedHgId;
- (id)_lock_clinicalProducts;
- (id)_lock_ingredientProducts;
- (id)_lock_routedDoseFormProducts;
- (id)_lock_tradeNameProduct;
- (int64_t)_lock_debug_traversedNodeCount;
- (int64_t)debug_traversedNodeCount;
- (int64_t)traversedDepth;
- (unint64_t)hash;
- (void)_lock_walkGraph;
- (void)_lock_walkGraphIfNecessary;
- (void)_visit:(id)a3 ofRoot:(id)a4 withMaxDepth:(int64_t)a5 handler:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationSearchResult

- (HKMedicationSearchResult)initWithSeedHgId:(id)a3 specificProduct:(id)a4 traversedRelationships:(id)a5 traversedDepth:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HKMedicationSearchResult;
  v13 = [(HKMedicationSearchResult *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    seedHgId = v13->_seedHgId;
    v13->_seedHgId = (NSNumber *)v14;

    uint64_t v16 = [v11 copy];
    specificProduct = v13->_specificProduct;
    v13->_specificProduct = (HKConcept *)v16;

    uint64_t v18 = [v12 copy];
    traversedRelationships = v13->_traversedRelationships;
    v13->_traversedRelationships = (HKIntegerSet *)v18;

    v13->_traversedDepth = a6;
    v13->_lock._os_unfair_lock_opaque = 0;
    v13->_lock_hasWalkedGraph = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_seedHgId hash];
  uint64_t v4 = [(HKConcept *)self->_specificProduct hash] ^ v3;
  return v4 ^ [(HKIntegerSet *)self->_traversedRelationships hash] ^ self->_traversedDepth;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMedicationSearchResult *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      seedHgId = self->_seedHgId;
      v7 = v5->_seedHgId;
      BOOL v12 = (seedHgId == v7 || v7 && -[NSNumber isEqual:](seedHgId, "isEqual:"))
         && ((specificProduct = self->_specificProduct, v9 = v5->_specificProduct, specificProduct == v9)
          || v9 && -[HKConcept isEqual:](specificProduct, "isEqual:"))
         && ((traversedRelationships = self->_traversedRelationships,
              id v11 = v5->_traversedRelationships,
              traversedRelationships == v11)
          || v11 && -[HKIntegerSet isEqual:](traversedRelationships, "isEqual:"))
         && self->_traversedDepth == v5->_traversedDepth;
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  seedHgId = self->_seedHgId;
  id v5 = a3;
  [v5 encodeObject:seedHgId forKey:@"SeedHgId"];
  [v5 encodeObject:self->_specificProduct forKey:@"SpecificProduct"];
  [v5 encodeObject:self->_traversedRelationships forKey:@"TraversedRelationships"];
  [v5 encodeInteger:self->_traversedDepth forKey:@"TraversedDepth"];
}

- (HKMedicationSearchResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKMedicationSearchResult;
  id v5 = [(HKMedicationSearchResult *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SeedHgId"];
    seedHgId = v5->_seedHgId;
    v5->_seedHgId = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SpecificProduct"];
    specificProduct = v5->_specificProduct;
    v5->_specificProduct = (HKConcept *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TraversedRelationships"];
    traversedRelationships = v5->_traversedRelationships;
    v5->_traversedRelationships = (HKIntegerSet *)v10;

    v5->_traversedDepth = [v4 decodeIntegerForKey:@"TraversedDepth"];
  }

  return v5;
}

- (NSNumber)seedHgId
{
  return self->_seedHgId;
}

- (HKConcept)specificProduct
{
  return self->_specificProduct;
}

- (HKIntegerSet)traversedRelationships
{
  return self->_traversedRelationships;
}

- (int64_t)traversedDepth
{
  return self->_traversedDepth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traversedRelationships, 0);
  objc_storeStrong((id *)&self->_specificProduct, 0);
  objc_storeStrong((id *)&self->_seedHgId, 0);
  objc_storeStrong((id *)&self->_lock_ingredientProducts, 0);
  objc_storeStrong((id *)&self->_lock_routedDoseFormProducts, 0);
  objc_storeStrong((id *)&self->_lock_clinicalProducts, 0);

  objc_storeStrong((id *)&self->_lock_tradeNameProduct, 0);
}

- (HKConcept)tradeNameProduct
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HKMedicationSearchResult *)self _lock_tradeNameProduct];
  os_unfair_lock_unlock(p_lock);

  return (HKConcept *)v4;
}

- (NSArray)routedDoseFormProducts
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HKMedicationSearchResult *)self _lock_routedDoseFormProducts];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (NSArray)ingredientProducts
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HKMedicationSearchResult *)self _lock_ingredientProducts];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (NSArray)clinicalProducts
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HKMedicationSearchResult *)self _lock_clinicalProducts];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (int64_t)debug_traversedNodeCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = [(HKMedicationSearchResult *)self _lock_debug_traversedNodeCount];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_visit:(id)a3 ofRoot:(id)a4 withMaxDepth:(int64_t)a5 handler:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (unsigned int (**)(id, void *))a6;
  unint64_t v12 = 0x1E4F1C000uLL;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v13 addObject:v10];
  uint64_t v14 = 0;
  v15 = 0;
  int64_t v25 = a5 & ~(a5 >> 63);
  while (1)
  {
    uint64_t v16 = v13;
    if (!objc_msgSend(v13, "count", v25)) {
      break;
    }
    uint64_t v26 = v14;

    id v13 = objc_alloc_init(*(Class *)(v12 + 2632));
    while ([v16 count])
    {
      v17 = [v16 firstObject];
      [v16 removeObjectAtIndex:0];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v27 = v17;
      uint64_t v18 = [v17 relationships];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (objc_msgSend(v9, "containsInteger:", objc_msgSend(v23, "type")))
            {
              v24 = [v23 destination];
              if (!v11[2](v11, v24))
              {

                goto LABEL_19;
              }
              [v13 addObject:v24];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
    }
    uint64_t v14 = v26 + 1;
    v15 = v16;
    unint64_t v12 = 0x1E4F1C000;
    if (v26 == v25) {
      goto LABEL_19;
    }
  }
  uint64_t v16 = v15;
LABEL_19:
}

- (id)_lock_tradeNameProduct
{
  [(HKMedicationSearchResult *)self _lock_walkGraphIfNecessary];
  lock_tradeNameProduct = self->_lock_tradeNameProduct;

  return lock_tradeNameProduct;
}

- (id)_lock_routedDoseFormProducts
{
  [(HKMedicationSearchResult *)self _lock_walkGraphIfNecessary];
  lock_routedDoseFormProducts = self->_lock_routedDoseFormProducts;

  return lock_routedDoseFormProducts;
}

- (id)_lock_ingredientProducts
{
  [(HKMedicationSearchResult *)self _lock_walkGraphIfNecessary];
  lock_ingredientProducts = self->_lock_ingredientProducts;

  return lock_ingredientProducts;
}

- (id)_lock_clinicalProducts
{
  [(HKMedicationSearchResult *)self _lock_walkGraphIfNecessary];
  lock_clinicalProducts = self->_lock_clinicalProducts;

  return lock_clinicalProducts;
}

- (int64_t)_lock_debug_traversedNodeCount
{
  return self->_lock_traversedNodeCount;
}

- (void)_lock_walkGraphIfNecessary
{
  if (!self->_lock_hasWalkedGraph)
  {
    [(HKMedicationSearchResult *)self _lock_walkGraph];
    self->_lock_hasWalkedGraph = 1;
  }
}

- (void)_lock_walkGraph
{
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(HKConcept *)self->_specificProduct identifier];
  uint64_t v7 = [v6 rawIdentifier];

  if (v7 == 842) {
    [v3 addObject:self->_specificProduct];
  }
  specificProduct = self->_specificProduct;
  traversedRelationships = self->_traversedRelationships;
  int64_t traversedDepth = self->_traversedDepth;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __54__HKMedicationSearchResult_Traversal___lock_walkGraph__block_invoke;
  v23 = &unk_1E62EBC28;
  v24 = self;
  id v25 = v4;
  id v26 = v5;
  id v27 = v3;
  id v11 = v3;
  id v12 = v5;
  id v13 = v4;
  [(HKMedicationSearchResult *)self _visit:traversedRelationships ofRoot:specificProduct withMaxDepth:traversedDepth handler:&v20];
  uint64_t v14 = (NSArray *)objc_msgSend(v13, "copy", v20, v21, v22, v23, v24);
  lock_routedDoseFormProducts = self->_lock_routedDoseFormProducts;
  self->_lock_routedDoseFormProducts = v14;

  uint64_t v16 = (NSArray *)[v12 copy];
  lock_ingredientProducts = self->_lock_ingredientProducts;
  self->_lock_ingredientProducts = v16;

  uint64_t v18 = (NSArray *)[v11 copy];
  lock_clinicalProducts = self->_lock_clinicalProducts;
  self->_lock_clinicalProducts = v18;
}

uint64_t __54__HKMedicationSearchResult_Traversal___lock_walkGraph__block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  ++*(void *)(a1[4] + 48);
  if (objc_msgSend(v4, "meds_isTradeNameProduct"))
  {
    uint64_t v5 = a1[4];
    uint64_t v7 = *(void *)(v5 + 16);
    uint64_t v6 = (id *)(v5 + 16);
    if (!v7)
    {
      objc_storeStrong(v6, a2);
      goto LABEL_11;
    }
  }
  if (objc_msgSend(v4, "meds_isRoutedDoseFormProduct"))
  {
    uint64_t v8 = (void *)a1[5];
LABEL_9:
    [v8 addObject:v4];
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "meds_isIngredientProduct"))
  {
    uint64_t v8 = (void *)a1[6];
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "meds_isClinicalProduct"))
  {
    uint64_t v8 = (void *)a1[7];
    goto LABEL_9;
  }
LABEL_11:

  return 1;
}

@end