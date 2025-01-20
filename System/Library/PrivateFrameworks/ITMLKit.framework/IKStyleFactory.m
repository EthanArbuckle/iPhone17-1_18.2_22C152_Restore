@interface IKStyleFactory
+ (id)styleFactoryWithMarkup:(id)a3 filterBlockedStyles:(BOOL)a4;
- (IKStyleFactory)initWithStylesGroup:(id)a3;
- (IKStylesGroup)stylesGroup;
- (NSMutableDictionary)styleListsByClassSelector;
- (id)_collapsedStyleListForSelectors:(id)a3 targetSelector:(id)a4 stylesGroup:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)styleListForClassSelector:(id)a3;
- (void)setViewElementStylesDirty;
@end

@implementation IKStyleFactory

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(IKStyleFactory *)self stylesGroup];
  v6 = (void *)[v4 initWithStylesGroup:v5];

  return v6;
}

+ (id)styleFactoryWithMarkup:(id)a3 filterBlockedStyles:(BOOL)a4
{
  v5 = +[IKStylesGroup stylesGroupWithMarkup:a3 filterBlockedStyles:a4];
  if (v5) {
    v6 = (void *)[objc_alloc((Class)a1) initWithStylesGroup:v5];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (IKStyleFactory)initWithStylesGroup:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IKStyleFactory;
  v6 = [(IKStyleFactory *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stylesGroup, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    styleListsByClassSelector = v7->_styleListsByClassSelector;
    v7->_styleListsByClassSelector = (NSMutableDictionary *)v8;

    v15[0] = @"*";
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v11 = [(IKStyleFactory *)v7 _collapsedStyleListForSelectors:v10 targetSelector:@"*" stylesGroup:v7->_stylesGroup];

    if ([v11 count])
    {
      v12 = [[IKStyleList alloc] initWithClassSelector:@"*" styles:v11 baseStyleList:0];
      [(NSMutableDictionary *)v7->_styleListsByClassSelector setObject:v12 forKeyedSubscript:@"*"];
    }
  }

  return v7;
}

- (id)styleListForClassSelector:(id)a3
{
  id v4 = a3;
  id v5 = [(IKStyleFactory *)self styleListsByClassSelector];
  v6 = [v5 objectForKeyedSubscript:@"*"];

  v7 = v6;
  uint64_t v8 = +[IKViewElementStyle normalizeClassSelectorString:v4];

  v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v10 = [v8 componentsSeparatedByCharactersInSet:v9];

  v11 = v7;
  if ([v10 count])
  {
    v12 = [v10 componentsJoinedByString:@" "];
    v13 = [(IKStyleFactory *)self styleListsByClassSelector];
    v11 = [v13 objectForKeyedSubscript:v12];

    if (!v11)
    {
      objc_super v14 = [(IKStyleFactory *)self stylesGroup];
      v15 = [(IKStyleFactory *)self _collapsedStyleListForSelectors:v10 targetSelector:v12 stylesGroup:v14];

      if ([v15 count])
      {
        v11 = [[IKStyleList alloc] initWithClassSelector:v12 styles:v15 baseStyleList:v7];
        if (v11)
        {
          v16 = [(IKStyleFactory *)self styleListsByClassSelector];
          [v16 setObject:v11 forKeyedSubscript:v12];
        }
      }
      else
      {
        v11 = 0;
      }
    }
  }

  return v11;
}

- (void)setViewElementStylesDirty
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(IKStyleFactory *)self styleListsByClassSelector];
  v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setNeedsReresolution];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_collapsedStyleListForSelectors:(id)a3 targetSelector:(id)a4 stylesGroup:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  long long v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __77__IKStyleFactory__collapsedStyleListForSelectors_targetSelector_stylesGroup___block_invoke;
  v49[3] = &unk_1E6DE4090;
  id v12 = v11;
  id v50 = v12;
  id v13 = v8;
  id v51 = v13;
  id v14 = v10;
  id v52 = v14;
  v33 = (void *)MEMORY[0x1E4E65800](v49);
  v34 = [v9 orderedStylesOrGroups];
  v36 = v9;
  v15 = [v9 indexedSelectors];
  v16 = [MEMORY[0x1E4F28E60] indexSet];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v17 = v7;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v46 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [v15 objectForKeyedSubscript:*(void *)(*((void *)&v45 + 1) + 8 * i)];
        if ([v22 count]) {
          [v16 addIndexes:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v19);
  }

  v23 = [v36 groupIndexes];

  if (v23)
  {
    v24 = [v36 groupIndexes];
    [v16 addIndexes:v24];
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __77__IKStyleFactory__collapsedStyleListForSelectors_targetSelector_stylesGroup___block_invoke_2;
  v37[3] = &unk_1E6DE4878;
  id v38 = v34;
  id v39 = v12;
  v40 = self;
  id v41 = v17;
  id v43 = v14;
  id v44 = v33;
  id v42 = v13;
  id v25 = v14;
  v26 = v33;
  id v27 = v13;
  id v28 = v17;
  id v29 = v12;
  id v30 = v34;
  [v16 enumerateIndexesUsingBlock:v37];
  v26[2](v26);
  v31 = (void *)[v25 copy];

  return v31;
}

void __77__IKStyleFactory__collapsedStyleListForSelectors_targetSelector_stylesGroup___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = +[IKViewElementStyle elementStyleWithSelector:*(void *)(a1 + 40) aggregatingStyles:*(void *)(a1 + 32)];
    [*(id *)(a1 + 48) addObject:v2];
    [*(id *)(a1 + 32) removeAllObjects];
  }
}

void __77__IKStyleFactory__collapsedStyleListForSelectors_targetSelector_stylesGroup___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) objectAtIndex:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 40) addObject:v7];
  }
  else
  {
    id v3 = v7;
    uint64_t v4 = [*(id *)(a1 + 48) _collapsedStyleListForSelectors:*(void *)(a1 + 56) targetSelector:*(void *)(a1 + 64) stylesGroup:v3];
    uint64_t v5 = [v4 firstObject];

    if (v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
      uint64_t v6 = [v3 mediaQueryList];
      [v5 setMediaQueryList:v6];

      [*(id *)(a1 + 72) addObject:v5];
    }
  }
}

- (IKStylesGroup)stylesGroup
{
  return self->_stylesGroup;
}

- (NSMutableDictionary)styleListsByClassSelector
{
  return self->_styleListsByClassSelector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleListsByClassSelector, 0);
  objc_storeStrong((id *)&self->_stylesGroup, 0);
}

@end