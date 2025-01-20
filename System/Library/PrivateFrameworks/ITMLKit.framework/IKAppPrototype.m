@interface IKAppPrototype
- (IKAppPrototype)initWithPrototype:(id)a3 dataItem:(id)a4;
- (IKAppPrototypeIdentifier)identifier;
- (IKDOMPrototype)prototype;
- (NSDictionary)groupingValues;
- (NSIndexSet)usageIndexes;
- (id)_sparseObjectFromObject:(id)a3 usingPropertyPaths:(id)a4;
- (id)dsepm_viewElement;
- (void)addUsageForIndex:(int64_t)a3;
- (void)dsepm_setViewElement:(id)a3;
- (void)removeUsageForIndex:(int64_t)a3;
- (void)updateUsageIndexesWithChangeSet:(id)a3;
@end

@implementation IKAppPrototype

- (id)dsepm_viewElement
{
  return objc_getAssociatedObject(self, "dsepm_viewElement");
}

- (void)dsepm_setViewElement:(id)a3
{
}

- (IKAppPrototype)initWithPrototype:(id)a3 dataItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IKAppPrototype;
  v8 = [(IKAppPrototype *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_prototype, v6);
    v10 = [v6 grouping];
    if (v10)
    {
      v11 = [v7 dataDictionary];
      v12 = [v6 grouping];
      uint64_t v13 = [(IKAppPrototype *)v9 _sparseObjectFromObject:v11 usingPropertyPaths:v12];
      groupingValues = v9->_groupingValues;
      v9->_groupingValues = (NSDictionary *)v13;
    }
    else
    {
      v11 = v9->_groupingValues;
      v9->_groupingValues = 0;
    }

    v15 = [IKAppPrototypeIdentifier alloc];
    v16 = [v6 identifier];
    v17 = [v6 selector];
    uint64_t v18 = [(IKAppPrototypeIdentifier *)v15 initWithIdentifier:v16 selector:v17 groupingValues:v9->_groupingValues];
    identifier = v9->_identifier;
    v9->_identifier = (IKAppPrototypeIdentifier *)v18;
  }
  return v9;
}

- (NSIndexSet)usageIndexes
{
  v2 = (void *)[(NSMutableIndexSet *)self->_usageIndexes copy];
  return (NSIndexSet *)v2;
}

- (void)addUsageForIndex:(int64_t)a3
{
  usageIndexes = self->_usageIndexes;
  if (!usageIndexes)
  {
    id v6 = [MEMORY[0x1E4F28E60] indexSet];
    id v7 = self->_usageIndexes;
    self->_usageIndexes = v6;

    usageIndexes = self->_usageIndexes;
  }
  [(NSMutableIndexSet *)usageIndexes addIndex:a3];
}

- (void)removeUsageForIndex:(int64_t)a3
{
}

- (void)updateUsageIndexesWithChangeSet:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28E60] indexSet];
  usageIndexes = self->_usageIndexes;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__IKAppPrototype_updateUsageIndexesWithChangeSet___block_invoke;
  v11[3] = &unk_1E6DE70B8;
  id v12 = v4;
  id v7 = v5;
  uint64_t v13 = v7;
  id v8 = v4;
  [(NSMutableIndexSet *)usageIndexes enumerateIndexesUsingBlock:v11];
  v9 = self->_usageIndexes;
  self->_usageIndexes = v7;
  v10 = v7;
}

uint64_t __50__IKAppPrototype_updateUsageIndexesWithChangeSet___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) newIndexForOldIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = result;
    v5 = *(void **)(a1 + 40);
    return [v5 addIndex:v4];
  }
  return result;
}

- (id)_sparseObjectFromObject:(id)a3 usingPropertyPaths:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (![v6 count])
    {
      id v32 = 0;
      goto LABEL_45;
    }
    v46 = v5;
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v45 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v58 objects:v64 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v59 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v14 = [v13 accessorSequence];
          v15 = [v14 firstObject];

          v16 = [v7 objectForKeyedSubscript:v15];
          if (!v16)
          {
            v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
            [v7 setObject:v16 forKeyedSubscript:v15];
          }
          v17 = [v13 propertyPathByRemovingFirstAccessor];
          [v16 addObject:v17];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v58 objects:v64 count:16];
      }
      while (v10);
    }

    objc_opt_class();
    id v5 = v46;
    if (objc_opt_isKindOfClass())
    {
      id v18 = v46;
      v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v18, "count"));
      if ([v18 count])
      {
        unint64_t v20 = 0;
        uint64_t v21 = MEMORY[0x1E4F1CC08];
        do
        {
          [v19 addObject:v21];
          ++v20;
        }
        while (v20 < [v18 count]);
      }
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      obuint64_t j = [v7 allKeys];
      uint64_t v22 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
      if (!v22) {
        goto LABEL_42;
      }
      uint64_t v23 = v22;
      v24 = v18;
      v47 = v19;
      uint64_t v25 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v55 != v25) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v54 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v28 = [v27 subscriptIndex];
            v29 = [v24 objectAtIndexedSubscript:v28];
            v30 = [v7 objectForKeyedSubscript:v27];
            v31 = [(IKAppPrototype *)self _sparseObjectFromObject:v29 usingPropertyPaths:v30];

            [v47 setObject:v31 atIndexedSubscript:v28];
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v23);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v32 = (id)MEMORY[0x1E4F1CC08];
        goto LABEL_44;
      }
      id v34 = v46;
      v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      obuint64_t j = [v7 allKeys];
      uint64_t v35 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
      if (!v35)
      {
LABEL_42:

        id v32 = (id)[v19 copy];
LABEL_44:
        id v6 = v45;

        goto LABEL_45;
      }
      uint64_t v36 = v35;
      v47 = v19;
      uint64_t v37 = *(void *)v51;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v51 != v37) {
            objc_enumerationMutation(obj);
          }
          v39 = *(void **)(*((void *)&v50 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v40 = [v39 property];
            v41 = [v34 objectForKeyedSubscript:v40];
            v42 = [v7 objectForKeyedSubscript:v39];
            v43 = [(IKAppPrototype *)self _sparseObjectFromObject:v41 usingPropertyPaths:v42];

            [v47 setObject:v43 forKeyedSubscript:v40];
          }
        }
        uint64_t v36 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
      }
      while (v36);
    }
    id v5 = v46;
    v19 = v47;
    goto LABEL_42;
  }
  v33 = (void *)MEMORY[0x1E4F1CC08];
  if (v5) {
    v33 = v5;
  }
  id v32 = v33;
LABEL_45:

  return v32;
}

- (IKAppPrototypeIdentifier)identifier
{
  return self->_identifier;
}

- (IKDOMPrototype)prototype
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prototype);
  return (IKDOMPrototype *)WeakRetained;
}

- (NSDictionary)groupingValues
{
  return self->_groupingValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingValues, 0);
  objc_destroyWeak((id *)&self->_prototype);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_usageIndexes, 0);
}

@end