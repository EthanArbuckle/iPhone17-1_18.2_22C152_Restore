@interface IKDOMConditional
- (BOOL)passesForDataItem:(id)a3 default:(BOOL)a4;
- (IKDOMConditional)initWithDOMElement:(id)a3;
- (IKDOMElement)domElement;
- (NSArray)exclusionExpressions;
- (NSArray)inclusionExpressions;
- (NSSet)dependentPathStrings;
- (NSString)identifier;
- (void)mutateWithDOMElement:(id)a3;
@end

@implementation IKDOMConditional

- (IKDOMConditional)initWithDOMElement:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKDOMConditional;
  v5 = [(IKDOMConditional *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_domElement, v4);
    v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = [v7 UUIDString];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;
  }
  return v6;
}

- (NSArray)inclusionExpressions
{
  inclusionExpressions = self->_inclusionExpressions;
  if (!inclusionExpressions)
  {
    id v4 = [(IKDOMConditional *)self domElement];
    v5 = [v4 getAttribute:@"state"];
    v6 = +[_IKDOMConditionalExpression parseExpressionsFromString:v5];
    v7 = self->_inclusionExpressions;
    self->_inclusionExpressions = v6;

    inclusionExpressions = self->_inclusionExpressions;
  }
  return inclusionExpressions;
}

- (NSArray)exclusionExpressions
{
  exclusionExpressions = self->_exclusionExpressions;
  if (!exclusionExpressions)
  {
    id v4 = [(IKDOMConditional *)self domElement];
    v5 = [v4 getAttribute:@"notInState"];
    v6 = +[_IKDOMConditionalExpression parseExpressionsFromString:v5];
    v7 = self->_exclusionExpressions;
    self->_exclusionExpressions = v6;

    exclusionExpressions = self->_exclusionExpressions;
  }
  return exclusionExpressions;
}

- (NSSet)dependentPathStrings
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  dependentPathStrings = self->_dependentPathStrings;
  if (!dependentPathStrings)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v5 = [(IKDOMConditional *)self inclusionExpressions];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v24 + 1) + 8 * v9) dependentPathStrings];
          [v4 unionSet:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v11 = [(IKDOMConditional *)self exclusionExpressions];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v20 + 1) + 8 * v15) dependentPathStrings];
          [v4 unionSet:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v13);
    }

    v17 = (NSSet *)[v4 copy];
    v18 = self->_dependentPathStrings;
    self->_dependentPathStrings = v17;

    dependentPathStrings = self->_dependentPathStrings;
  }
  return dependentPathStrings;
}

- (BOOL)passesForDataItem:(id)a3 default:(BOOL)a4
{
  id v6 = a3;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__IKDOMConditional_passesForDataItem_default___block_invoke;
  v18[3] = &unk_1E6DE3D80;
  id v19 = v6;
  id v7 = v6;
  uint64_t v8 = (uint64_t (**)(void, void))MEMORY[0x1E4E65800](v18);
  uint64_t v9 = [(IKDOMConditional *)self inclusionExpressions];
  uint64_t v10 = [v9 count];

  objc_super v11 = [(IKDOMConditional *)self exclusionExpressions];
  uint64_t v12 = [v11 count];

  if (v12) {
    char v13 = 0;
  }
  else {
    char v13 = a4;
  }
  if (v10)
  {
    uint64_t v14 = [(IKDOMConditional *)self inclusionExpressions];
    char v13 = ((uint64_t (**)(void, void *))v8)[2](v8, v14);
  }
  if (v12) {
    LOBYTE(v15) = 1;
  }
  else {
    LOBYTE(v15) = v13;
  }
  if (v12 && (v13 & 1) == 0)
  {
    v16 = [(IKDOMConditional *)self exclusionExpressions];
    int v15 = ((uint64_t (**)(void, void *))v8)[2](v8, v16) ^ 1;
  }
  return v15;
}

uint64_t __46__IKDOMConditional_passesForDataItem_default___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "passesForDataItem:", *(void *)(a1 + 32), (void)v10))
        {
          uint64_t v8 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return v8;
}

- (void)mutateWithDOMElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKDOMConditional *)self domElement];
  uint64_t v6 = [v5 parentNode];
  uint64_t v7 = [(IKDOMConditional *)self domElement];
  id v8 = (id)[v6 replaceChild:v4 :v7];

  objc_storeWeak((id *)&self->_domElement, v4);
  inclusionExpressions = self->_inclusionExpressions;
  self->_inclusionExpressions = 0;

  exclusionExpressions = self->_exclusionExpressions;
  self->_exclusionExpressions = 0;

  dependentPathStrings = self->_dependentPathStrings;
  self->_dependentPathStrings = 0;
}

- (IKDOMElement)domElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domElement);
  return (IKDOMElement *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_domElement);
  objc_storeStrong((id *)&self->_dependentPathStrings, 0);
  objc_storeStrong((id *)&self->_exclusionExpressions, 0);
  objc_storeStrong((id *)&self->_inclusionExpressions, 0);
}

@end