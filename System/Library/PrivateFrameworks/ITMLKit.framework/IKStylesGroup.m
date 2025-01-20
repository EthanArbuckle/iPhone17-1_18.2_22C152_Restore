@interface IKStylesGroup
+ (id)stylesGroupWithMarkup:(id)a3 filterBlockedStyles:(BOOL)a4;
- (IKStylesGroup)initWithCSSRule:(id)a3 mediaQueryList:(id)a4 filterBlockedStyles:(BOOL)a5;
- (IKStylesGroup)initWithMarkup:(id)a3 parseSubGroups:(BOOL)a4 mediaQueryList:(id)a5 filterBlockedStyles:(BOOL)a6;
- (NSArray)mediaQueryList;
- (NSArray)orderedStylesOrGroups;
- (NSDictionary)indexedSelectors;
- (NSIndexSet)groupIndexes;
- (void)_computeIndexedSelectorsFromStylesOrGroups:(id)a3;
@end

@implementation IKStylesGroup

+ (id)stylesGroupWithMarkup:(id)a3 filterBlockedStyles:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v14 = 0;
    v7 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"/\\*(.|[\r\n])*?\\*/" options:1 error:&v14];
    if (!v14)
    {
      uint64_t v8 = objc_msgSend(v7, "stringByReplacingMatchesInString:options:range:withTemplate:", v6, 0, 0, objc_msgSend(v6, "length"), @" ");

      id v6 = (id)v8;
    }
    v9 = (void *)[objc_alloc((Class)a1) initWithMarkup:v6 parseSubGroups:1 mediaQueryList:0 filterBlockedStyles:v4];
    v10 = [v9 orderedStylesOrGroups];
    if ([v10 count]) {
      v11 = v9;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (IKStylesGroup)initWithCSSRule:(id)a3 mediaQueryList:(id)a4 filterBlockedStyles:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)IKStylesGroup;
  v10 = [(IKStylesGroup *)&v25 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mediaQueryList, a4);
    id v12 = [MEMORY[0x1E4F1CA48] array];
    v13 = [v8 selectorList];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      unint64_t v15 = 0;
      do
      {
        v16 = [v8 selectorList];
        v17 = [v16 selectorAtIndex:v15];

        if (v17 && (![v17 type] || objc_msgSend(v17, "type") == 3))
        {
          v18 = [v17 name];
          v19 = +[IKViewElementStyle elementStyleWithSelector:v18 cssRule:v8 filterBlockedStyles:v5];

          if (v19) {
            [v12 addObject:v19];
          }
        }
        ++v15;
        v20 = [v8 selectorList];
        unint64_t v21 = [v20 count];
      }
      while (v15 < v21);
    }
    uint64_t v22 = [v12 copy];
    orderedStylesOrGroups = v11->_orderedStylesOrGroups;
    v11->_orderedStylesOrGroups = (NSArray *)v22;

    [(IKStylesGroup *)v11 _computeIndexedSelectorsFromStylesOrGroups:v11->_orderedStylesOrGroups];
  }

  return v11;
}

- (IKStylesGroup)initWithMarkup:(id)a3 parseSubGroups:(BOOL)a4 mediaQueryList:(id)a5 filterBlockedStyles:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a5;
  v42.receiver = self;
  v42.super_class = (Class)IKStylesGroup;
  v11 = [(IKStylesGroup *)&v42 init];
  id v12 = v11;
  if (v11)
  {
    id v39 = a5;
    v40 = v11;
    v13 = [MEMORY[0x1E4F1CA48] array];
    id v41 = v9;
    uint64_t v14 = +[IKCSSParser parse:v9];
    unint64_t v15 = v14;
    if (v14)
    {
      v16 = [v14 ruleList];
      uint64_t v17 = [v16 count];

      if (v17)
      {
        unint64_t v18 = 0;
        do
        {
          v19 = [v15 ruleList];
          v20 = [v19 ruleAtIndex:v18];

          unint64_t v21 = [v20 mediaQuery];

          if (v21)
          {
            uint64_t v22 = [v20 mediaQuery];
            v23 = +[IKStyleMediaQuery mediaQueryListWithCSSMediaQuery:v22];

            v24 = [[IKStylesGroup alloc] initWithCSSRule:v20 mediaQueryList:v23 filterBlockedStyles:v6];
            if (v24) {
              [v13 addObject:v24];
            }
          }
          else
          {
            objc_super v25 = [v20 selectorList];
            uint64_t v26 = [v25 count];

            if (v26)
            {
              unint64_t v27 = 0;
              do
              {
                v28 = [v20 selectorList];
                v29 = [v28 selectorAtIndex:v27];

                if (v29 && (![v29 type] || objc_msgSend(v29, "type") == 3))
                {
                  v30 = [v29 name];
                  v31 = +[IKViewElementStyle elementStyleWithSelector:v30 cssRule:v20 filterBlockedStyles:v6];

                  if (v31) {
                    [v13 addObject:v31];
                  }
                }
                ++v27;
                v32 = [v20 selectorList];
                unint64_t v33 = [v32 count];
              }
              while (v27 < v33);
            }
          }

          ++v18;
          v34 = [v15 ruleList];
          unint64_t v35 = [v34 count];
        }
        while (v18 < v35);
      }
    }
    id v12 = v40;
    objc_storeStrong((id *)&v40->_mediaQueryList, v39);
    uint64_t v36 = [v13 copy];
    orderedStylesOrGroups = v40->_orderedStylesOrGroups;
    v40->_orderedStylesOrGroups = (NSArray *)v36;

    [(IKStylesGroup *)v12 _computeIndexedSelectorsFromStylesOrGroups:v12->_orderedStylesOrGroups];
    id v9 = v41;
  }

  return v12;
}

- (void)_computeIndexedSelectorsFromStylesOrGroups:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F28E60] indexSet];
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __60__IKStylesGroup__computeIndexedSelectorsFromStylesOrGroups___block_invoke;
  v26[3] = &unk_1E6DE4850;
  id v7 = v6;
  id v27 = v7;
  id v8 = v5;
  id v28 = v8;
  unint64_t v21 = v4;
  [v4 enumerateObjectsUsingBlock:v26];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = [v7 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        unint64_t v15 = [v7 objectForKey:v14];
        v16 = (void *)[v15 copy];
        [v7 setObject:v16 forKey:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v29 count:16];
    }
    while (v11);
  }

  if ([v7 count])
  {
    uint64_t v17 = (NSDictionary *)[v7 copy];
    indexedSelectors = self->_indexedSelectors;
    self->_indexedSelectors = v17;
  }
  else
  {
    indexedSelectors = self->_indexedSelectors;
    self->_indexedSelectors = 0;
  }

  if ([v8 count])
  {
    v19 = (NSIndexSet *)[v8 copy];
    groupIndexes = self->_groupIndexes;
    self->_groupIndexes = v19;
  }
  else
  {
    groupIndexes = self->_groupIndexes;
    self->_groupIndexes = 0;
  }
}

void __60__IKStylesGroup__computeIndexedSelectorsFromStylesOrGroups___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [v7 classDescriptorString];
    BOOL v6 = [*(id *)(a1 + 32) objectForKey:v5];
    if (!v6)
    {
      BOOL v6 = [MEMORY[0x1E4F28E60] indexSet];
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
    }
    [v6 addIndex:a3];
  }
  else
  {
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

- (NSArray)mediaQueryList
{
  return self->_mediaQueryList;
}

- (NSArray)orderedStylesOrGroups
{
  return self->_orderedStylesOrGroups;
}

- (NSDictionary)indexedSelectors
{
  return self->_indexedSelectors;
}

- (NSIndexSet)groupIndexes
{
  return self->_groupIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIndexes, 0);
  objc_storeStrong((id *)&self->_indexedSelectors, 0);
  objc_storeStrong((id *)&self->_orderedStylesOrGroups, 0);
  objc_storeStrong((id *)&self->_mediaQueryList, 0);
}

@end