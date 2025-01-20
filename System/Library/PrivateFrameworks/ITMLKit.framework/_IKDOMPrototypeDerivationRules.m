@interface _IKDOMPrototypeDerivationRules
+ (id)derivationRulesForDOMElement:(id)a3;
+ (void)removeRulesFromDOMElement:(id)a3;
- (NSArray)indexPath;
- (NSArray)mutationRules;
- (_IKDOMPrototypeDerivationRules)initWithIndexPath:(id)a3 mutationRules:(id)a4;
@end

@implementation _IKDOMPrototypeDerivationRules

+ (id)derivationRulesForDOMElement:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:");
  while (1)
  {
    uint64_t v33 = [v3 count];
    if (!v33) {
      break;
    }
    v4 = [v3 objectAtIndexedSubscript:0];
    [v3 removeObjectAtIndex:0];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v5 = [v4 childElements];
    id v6 = (id)[v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v40;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v40 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v10 = [v9 nodeName];
          int v11 = [v10 isEqualToString:@"rules"];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_13;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    v12 = [v4 childElements];
    [v3 addObjectsFromArray:v12];

    if (v6) {
      goto LABEL_16;
    }
  }
  id v6 = 0;
LABEL_16:
  v13 = (void *)MEMORY[0x1E4F1CA48];
  v14 = [v6 childElements];
  v15 = objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v16 = [v6 childElements];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = +[IKDOMMutationRule mutationRuleWithDOMElement:*(void *)(*((void *)&v35 + 1) + 8 * j) mutable:0];
        if (v21) {
          [v15 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v18);
  }

  v22 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v23 = [v6 parentNode];
  id v24 = (id)v23;
  while (v24 && v24 != v34)
  {
    v25 = v24;
    v26 = [v24 parentNode];
    v27 = [v26 childElements];
    uint64_t v28 = [v27 indexOfObject:v25];

    v29 = [NSNumber numberWithInteger:v28];
    [v22 insertObject:v29 atIndex:0];

    id v24 = [v25 parentNode];
  }
  if (v33) {
    v30 = (void *)[objc_alloc((Class)a1) initWithIndexPath:v22 mutationRules:v15];
  }
  else {
    v30 = 0;
  }

  return v30;
}

+ (void)removeRulesFromDOMElement:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 childElements];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 nodeName];
        int v11 = [v10 isEqualToString:@"rules"];

        if (v11) {
          id v12 = (id)[v3 removeChild:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (_IKDOMPrototypeDerivationRules)initWithIndexPath:(id)a3 mutationRules:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_IKDOMPrototypeDerivationRules;
  v8 = [(_IKDOMPrototypeDerivationRules *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    indexPath = v8->_indexPath;
    v8->_indexPath = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    mutationRules = v8->_mutationRules;
    v8->_mutationRules = (NSArray *)v11;
  }
  return v8;
}

- (NSArray)mutationRules
{
  return self->_mutationRules;
}

- (NSArray)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_mutationRules, 0);
}

@end