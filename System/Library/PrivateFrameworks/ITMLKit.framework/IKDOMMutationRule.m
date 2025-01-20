@interface IKDOMMutationRule
+ (id)_applyGeneralizationOnDOMElement:(id)a3 withDOMElement:(id)a4;
+ (id)_applySpecializationOnDOMElement:(id)a3 withDOMElement:(id)a4;
+ (id)mutationRuleWithDOMElement:(id)a3 mutable:(BOOL)a4;
- (BOOL)isMutable;
- (IKDOMMutationRule)initWithDOMElement:(id)a3 mutable:(BOOL)a4;
- (int64_t)compare:(id)a3;
- (void)applyOnDOMElement:(id)a3;
@end

@implementation IKDOMMutationRule

+ (id)mutationRuleWithDOMElement:(id)a3 mutable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 nodeName];
  if (([v7 isEqualToString:@"specialize"] & 1) != 0
    || [v7 isEqualToString:@"generalize"])
  {
    v8 = (void *)[objc_alloc((Class)a1) initWithDOMElement:v6 mutable:v4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (IKDOMMutationRule)initWithDOMElement:(id)a3 mutable:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)IKDOMMutationRule;
  result = [(IKDOMConditional *)&v6 initWithDOMElement:a3];
  if (result) {
    result->_mutable = a4;
  }
  return result;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(IKDOMConditional *)self domElement];
  objc_super v6 = [v5 tagName];
  int v7 = [v6 isEqualToString:@"specialize"];

  v8 = [v4 domElement];

  v9 = [v8 tagName];
  int v10 = [v9 isEqualToString:@"specialize"];

  int64_t v11 = -1;
  if (!v10) {
    int64_t v11 = 1;
  }
  if (v7 != v10) {
    return v11;
  }
  else {
    return 0;
  }
}

- (void)applyOnDOMElement:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v40 = v4;
  objc_super v6 = [v4 childElements];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v6);
        }
        int64_t v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v12 = [v11 getAttribute:@"tag"];
        if ([v12 length]) {
          [v5 setObject:v11 forKeyedSubscript:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v8);
  }

  v13 = [(IKDOMConditional *)self domElement];
  v14 = [v13 ownerDocument];

  v15 = [(IKDOMConditional *)self domElement];
  v16 = [v15 tagName];
  int v17 = [v16 isEqualToString:@"specialize"];

  v39 = v14;
  int v41 = v17;
  if ([(IKDOMMutationRule *)self isMutable])
  {
    if (v17) {
      v18 = @"generalize";
    }
    else {
      v18 = @"specialize";
    }
    v19 = [v14 createElement:v18];
    v20 = [(IKDOMConditional *)self domElement];
    v21 = [v20 getAttribute:@"state"];

    if ([v21 length]) {
      [v19 setAttributeValue:v21 withName:@"notInState"];
    }
    v22 = [(IKDOMConditional *)self domElement];
    v23 = [v22 getAttribute:@"notInState"];

    if ([v23 length]) {
      [v19 setAttributeValue:v23 withName:@"state"];
    }
    v43 = v19;
  }
  else
  {
    v43 = 0;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v42 = self;
  v24 = [(IKDOMConditional *)self domElement];
  v25 = [v24 childElements];

  uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v45 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        v31 = [v30 getAttribute:@"tag"];
        if (v31)
        {
          uint64_t v32 = [v5 objectForKeyedSubscript:v31];
          if (v32)
          {
            v33 = (void *)v32;
            v34 = objc_opt_class();
            if (v41) {
              [v34 _applySpecializationOnDOMElement:v33 withDOMElement:v30];
            }
            else {
            v35 = [v34 _applyGeneralizationOnDOMElement:v33 withDOMElement:v30];
            }
            if (v35 == v33)
            {
              v36 = v43;
              if (v43)
              {
                v37 = v30;
LABEL_35:
                id v38 = (id)[v36 appendChild:v37];
              }
            }
            else
            {
              [v5 setObject:v35 forKeyedSubscript:v31];
              v36 = v43;
              if (v43)
              {
                v37 = v33;
                goto LABEL_35;
              }
            }
          }
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v27);
  }

  if (v43) {
    [(IKDOMConditional *)v42 mutateWithDOMElement:v43];
  }
}

+ (id)_applySpecializationOnDOMElement:(id)a3 withDOMElement:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 nodeName];
  int v8 = [v7 isEqualToString:@"placeholder"];

  if (v8)
  {
    uint64_t v9 = [v5 parentNode];
    uint64_t v10 = [v6 cloneNode:1];
    id v11 = (id)[v9 replaceChild:v10 :v5];
    v12 = v5;
    id v5 = (id)v10;
  }
  else
  {
    v13 = [v5 nodeName];
    v14 = [v6 nodeName];
    int v15 = [v13 isEqualToString:v14];

    if (!v15) {
      goto LABEL_13;
    }
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    v12 = [v5 getAttribute:@"class"];
    if ([v12 length])
    {
      v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      int v17 = [v12 componentsSeparatedByCharactersInSet:v16];
      [v9 addObjectsFromArray:v17];
    }
    v18 = [v6 getAttribute:@"class"];
    if ([v18 length])
    {
      v19 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v20 = [v18 componentsSeparatedByCharactersInSet:v19];
      [v9 addObjectsFromArray:v20];
    }
    if ([v9 count])
    {
      v21 = [v9 allObjects];
      v22 = [v21 componentsJoinedByString:@" "];
      [v5 setAttributeValue:v22 withName:@"class"];
    }
    else
    {
      [v5 setAttributeValue:0 withName:@"class"];
    }
  }
LABEL_13:

  return v5;
}

+ (id)_applyGeneralizationOnDOMElement:(id)a3 withDOMElement:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 nodeName];
  int v8 = [v7 isEqualToString:@"placeholder"];

  if (v8)
  {
    uint64_t v9 = [v5 parentNode];
    uint64_t v10 = [v6 cloneNode:1];
    id v11 = (id)[v9 replaceChild:v10 :v5];
    v12 = v5;
    id v5 = (id)v10;
  }
  else
  {
    v13 = [v5 nodeName];
    v14 = [v6 nodeName];
    int v15 = [v13 isEqualToString:v14];

    if (!v15) {
      goto LABEL_13;
    }
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    v12 = [v5 getAttribute:@"class"];
    if ([v12 length])
    {
      v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      int v17 = [v12 componentsSeparatedByCharactersInSet:v16];
      [v9 addObjectsFromArray:v17];
    }
    v18 = [v6 getAttribute:@"class"];
    if ([v18 length])
    {
      v19 = (void *)MEMORY[0x1E4F1CAD0];
      v20 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v21 = [v18 componentsSeparatedByCharactersInSet:v20];
      v22 = [v19 setWithArray:v21];
      [v9 minusSet:v22];
    }
    if ([v9 count])
    {
      v23 = [v9 allObjects];
      v24 = [v23 componentsJoinedByString:@" "];
      [v5 setAttributeValue:v24 withName:@"class"];
    }
    else
    {
      [v5 setAttributeValue:0 withName:@"class"];
    }
  }
LABEL_13:

  return v5;
}

- (BOOL)isMutable
{
  return self->_mutable;
}

@end