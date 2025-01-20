@interface HUQuickControlCompoundItemPredicate
- (HUQuickControlCompoundItemPredicate)init;
- (HUQuickControlCompoundItemPredicate)initWithRequiredSubpredicates:(id)a3 optionalSubpredicates:(id)a4;
- (HUQuickControlCompoundItemPredicate)initWithRequiredSubpredicates:(id)a3 optionalSubpredicates:(id)a4 minimumNumberOfMatchedPredicates:(unint64_t)a5;
- (NSArray)optionalSubpredicates;
- (NSArray)requiredSubpredicates;
- (id)allSubpredicates;
- (id)matchingControlItemsForControlItems:(id)a3;
- (unint64_t)maximumNumberOfMatches;
- (unint64_t)minimumNumberOfMatchedPredicates;
@end

@implementation HUQuickControlCompoundItemPredicate

- (HUQuickControlCompoundItemPredicate)init
{
  return [(HUQuickControlCompoundItemPredicate *)self initWithRequiredSubpredicates:MEMORY[0x1E4F1CBF0] optionalSubpredicates:MEMORY[0x1E4F1CBF0]];
}

- (HUQuickControlCompoundItemPredicate)initWithRequiredSubpredicates:(id)a3 optionalSubpredicates:(id)a4
{
  return [(HUQuickControlCompoundItemPredicate *)self initWithRequiredSubpredicates:a3 optionalSubpredicates:a4 minimumNumberOfMatchedPredicates:1];
}

- (HUQuickControlCompoundItemPredicate)initWithRequiredSubpredicates:(id)a3 optionalSubpredicates:(id)a4 minimumNumberOfMatchedPredicates:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUQuickControlCompoundItemPredicate;
  v10 = [(HUQuickControlCompoundItemPredicate *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    requiredSubpredicates = v10->_requiredSubpredicates;
    v10->_requiredSubpredicates = (NSArray *)v11;

    uint64_t v13 = [v9 copy];
    optionalSubpredicates = v10->_optionalSubpredicates;
    v10->_optionalSubpredicates = (NSArray *)v13;

    v10->_minimumNumberOfMatchedPredicates = a5;
  }

  return v10;
}

- (id)allSubpredicates
{
  v3 = [(HUQuickControlCompoundItemPredicate *)self requiredSubpredicates];
  uint64_t v4 = [(HUQuickControlCompoundItemPredicate *)self optionalSubpredicates];
  v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
  }
  v7 = [v3 arrayByAddingObjectsFromArray:v6];

  return v7;
}

- (unint64_t)maximumNumberOfMatches
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(HUQuickControlCompoundItemPredicate *)self allSubpredicates];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) maximumNumberOfMatches];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)matchingControlItemsForControlItems:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 mutableCopy];
  unint64_t v5 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v6 = [(HUQuickControlCompoundItemPredicate *)self requiredSubpredicates];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v30;
    while (2)
    {
      uint64_t v11 = 0;
      unint64_t v12 = v8 + v9;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
        if (![v4 count]) {
          goto LABEL_13;
        }
        uint64_t v14 = [v13 matchingControlItemsForControlItems:v4];
        if (![v14 count])
        {

LABEL_13:
          unint64_t v12 = v9 + v11;
          goto LABEL_14;
        }
        [v4 removeObjectsInArray:v14];
        [v5 addObjectsFromArray:v14];

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
      unint64_t v9 = v12;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
LABEL_14:

  v15 = [(HUQuickControlCompoundItemPredicate *)self requiredSubpredicates];
  unint64_t v16 = [v15 count];

  if (v12 >= v16)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v17 = [(HUQuickControlCompoundItemPredicate *)self optionalSubpredicates];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
LABEL_18:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v25 + 1) + 8 * v21);
        if (![v4 count]) {
          break;
        }
        v23 = [v22 matchingControlItemsForControlItems:v4];
        if ([v23 count])
        {
          ++v12;
          [v5 addObjectsFromArray:v23];
          [v4 removeObjectsInArray:v23];
        }

        if (v19 == ++v21)
        {
          uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v19) {
            goto LABEL_18;
          }
          break;
        }
      }
    }
  }
  else
  {
    [v5 removeAllObjects];
  }
  if (v12 < -[HUQuickControlCompoundItemPredicate minimumNumberOfMatchedPredicates](self, "minimumNumberOfMatchedPredicates"))[v5 removeAllObjects]; {

  }
  return v5;
}

- (NSArray)requiredSubpredicates
{
  return self->_requiredSubpredicates;
}

- (NSArray)optionalSubpredicates
{
  return self->_optionalSubpredicates;
}

- (unint64_t)minimumNumberOfMatchedPredicates
{
  return self->_minimumNumberOfMatchedPredicates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalSubpredicates, 0);

  objc_storeStrong((id *)&self->_requiredSubpredicates, 0);
}

@end