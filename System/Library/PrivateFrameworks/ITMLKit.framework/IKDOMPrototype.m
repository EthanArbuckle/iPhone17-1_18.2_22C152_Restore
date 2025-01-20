@interface IKDOMPrototype
+ (id)_groupingForDOMElement:(id)a3;
+ (id)prototypeWithDOMElement:(id)a3;
- (IKDOMPrototype)initWithDOMElement:(id)a3 selector:(id)a4;
- (NSArray)grouping;
- (NSString)selector;
- (NSString)type;
- (_IKDOMPrototypeDerivationRules)rules;
- (id)_derivativeWithDataItem:(id)a3;
- (id)instantiateDOMElement;
- (id)variantForDataItem:(id)a3;
@end

@implementation IKDOMPrototype

+ (id)prototypeWithDOMElement:(id)a3
{
  id v4 = a3;
  v5 = [v4 jsNodeData];
  int v6 = [v5 containsUpdates];

  if (v6)
  {
    objc_msgSend(v4, "domp_setPrototype:", 0);
    objc_msgSend(v4, "domp_setDerivativeDOMElementsBySelector:", 0);
    [v4 clearUpdates];
  }
  v7 = objc_msgSend(v4, "domp_prototype");
  v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)[objc_alloc((Class)a1) initWithDOMElement:v4 selector:0];
  }
  v10 = v9;

  return v10;
}

- (IKDOMPrototype)initWithDOMElement:(id)a3 selector:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)IKDOMPrototype;
  v8 = [(IKDOMConditional *)&v17 initWithDOMElement:v6];
  if (v8)
  {
    id v9 = [v6 getAttribute:@"prototype"];
    v10 = v9;
    if (!v9)
    {
      v10 = [NSString string];
    }
    objc_storeStrong((id *)&v8->_type, v10);
    if (!v9) {

    }
    uint64_t v11 = [v7 copy];
    selector = v8->_selector;
    v8->_selector = (NSString *)v11;

    v13 = [(IKDOMConditional *)v8 domElement];
    uint64_t v14 = +[_IKDOMPrototypeDerivationRules derivationRulesForDOMElement:v13];
    rules = v8->_rules;
    v8->_rules = (_IKDOMPrototypeDerivationRules *)v14;

    objc_msgSend(v6, "domp_setPrototype:", v8);
  }

  return v8;
}

- (NSArray)grouping
{
  if (!self->_flags.parsedGrouping)
  {
    self->_flags.parsedGrouping = 1;
    v3 = objc_opt_class();
    id v4 = [(IKDOMConditional *)self domElement];
    v5 = [v3 _groupingForDOMElement:v4];
    grouping = self->_grouping;
    self->_grouping = v5;
  }
  id v7 = self->_grouping;
  return v7;
}

- (id)variantForDataItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [(IKDOMPrototype *)v5 rules];

  if (v6)
  {
    do
    {
      id v7 = [(IKDOMPrototype *)v5 _derivativeWithDataItem:v4];

      v8 = [(IKDOMPrototype *)v7 rules];

      v5 = v7;
    }
    while (v8);
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (id)instantiateDOMElement
{
  v2 = [(IKDOMConditional *)self domElement];
  v3 = [v2 cloneNode:1];

  return v3;
}

+ (id)_groupingForDOMElement:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  v21 = v3;
  v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v3];
  uint64_t v6 = [v5 firstObject];
  if (v6)
  {
    id v7 = (void *)v6;
    v22 = v5;
    do
    {
      [v5 removeObjectAtIndex:0];
      v8 = +[IKDOMBindingController parsedBindingForDOMElement:v7];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v9 = [v8 keysWithAnyOfAttributes:2];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            v15 = [v8 keyValues];
            v16 = [v15 objectForKeyedSubscript:v14];

            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v4 addObject:v16];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v11);
      }

      objc_super v17 = [v7 childElements];
      v5 = v22;
      [v22 addObjectsFromArray:v17];

      uint64_t v18 = [v22 firstObject];

      id v7 = (void *)v18;
    }
    while (v18);
  }
  if ([v4 count]) {
    v19 = (void *)[v4 copy];
  }
  else {
    v19 = 0;
  }

  return v19;
}

- (id)_derivativeWithDataItem:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F28E78] string];
  v47 = v46 = self;
  v5 = [(IKDOMPrototype *)self rules];
  uint64_t v6 = [v5 mutationRules];
  id v7 = [v6 sortedArrayUsingSelector:sel_compare_];

  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v58 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if ([v13 passesForDataItem:v4 default:0])
        {
          if ([v8 count]) {
            uint64_t v14 = @"_%@";
          }
          else {
            uint64_t v14 = @"%@";
          }
          v15 = [v13 identifier];
          objc_msgSend(v47, "appendFormat:", v14, v15);

          [v8 addObject:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v10);
  }

  v16 = [(IKDOMConditional *)self domElement];
  objc_super v17 = objc_msgSend(v16, "domp_derivativeDOMElementsBySelector");

  uint64_t v18 = v47;
  uint64_t v19 = [v17 objectForKeyedSubscript:v47];
  if (v19)
  {
    id v20 = (id)v19;
    v21 = [(id)objc_opt_class() prototypeWithDOMElement:v19];
  }
  else
  {
    v45 = v17;
    v22 = [(IKDOMConditional *)v46 domElement];
    long long v23 = [v22 cloneNode:1];

    long long v24 = [(IKDOMConditional *)v46 domElement];
    [v23 _setAliasOf:v24];

    id v20 = v23;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v25 = [(IKDOMPrototype *)v46 rules];
    long long v26 = [v25 indexPath];

    uint64_t v27 = [v26 countByEnumeratingWithState:&v53 objects:v62 count:16];
    uint64_t v28 = v20;
    if (v27)
    {
      uint64_t v29 = v27;
      uint64_t v30 = *(void *)v54;
      uint64_t v28 = v20;
      do
      {
        uint64_t v31 = 0;
        v32 = v28;
        do
        {
          if (*(void *)v54 != v30) {
            objc_enumerationMutation(v26);
          }
          v33 = *(void **)(*((void *)&v53 + 1) + 8 * v31);
          v34 = [v32 childElements];
          uint64_t v28 = objc_msgSend(v34, "objectAtIndexedSubscript:", objc_msgSend(v33, "integerValue"));

          ++v31;
          v32 = v28;
        }
        while (v29 != v31);
        uint64_t v29 = [v26 countByEnumeratingWithState:&v53 objects:v62 count:16];
      }
      while (v29);
    }

    +[_IKDOMPrototypeDerivationRules removeRulesFromDOMElement:v28];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v35 = v8;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v49 objects:v61 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v50 != v38) {
            objc_enumerationMutation(v35);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * j) applyOnDOMElement:v28];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v49 objects:v61 count:16];
      }
      while (v37);
    }

    objc_super v17 = v45;
    if (!v45)
    {
      objc_super v17 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
      v40 = [(IKDOMConditional *)v46 domElement];
      objc_msgSend(v40, "domp_setDerivativeDOMElementsBySelector:", v17);
    }
    uint64_t v18 = v47;
    [v17 setObject:v20 forKeyedSubscript:v47];
    v41 = [(IKDOMPrototype *)v46 selector];
    if (v41)
    {
      v42 = [(IKDOMPrototype *)v46 selector];
      v43 = [v42 stringByAppendingFormat:@"_%@", v47];
    }
    else
    {
      v43 = (void *)[v47 copy];
    }

    v21 = [[IKDOMPrototype alloc] initWithDOMElement:v20 selector:v43];
  }

  return v21;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)selector
{
  return self->_selector;
}

- (_IKDOMPrototypeDerivationRules)rules
{
  return self->_rules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_selector, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
}

@end