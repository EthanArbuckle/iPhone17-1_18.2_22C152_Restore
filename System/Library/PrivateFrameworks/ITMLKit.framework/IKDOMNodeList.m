@interface IKDOMNodeList
+ (IKDOMNodeList)nodeListWithAppContext:(id)a3 contextNode:(id)a4 xpath:(id)a5;
- (IKDOMNode)contextNode;
- (IKDOMNodeList)initWithAppContext:(id)a3 contextNode:(id)a4 evaluationBlock:(id)a5;
- (NSArray)nodes;
- (id)evaluationBlock;
- (id)item:(int64_t)a3;
- (int64_t)length;
- (void)_updateNodes;
- (void)domDidUpdateForContextNode:(id)a3;
- (void)setContextNode:(id)a3;
- (void)setNodes:(id)a3;
@end

@implementation IKDOMNodeList

+ (IKDOMNodeList)nodeListWithAppContext:(id)a3 contextNode:(id)a4 xpath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__IKDOMNodeList_nodeListWithAppContext_contextNode_xpath___block_invoke;
  v15[3] = &unk_1E6DE4C60;
  id v16 = v8;
  id v12 = v8;
  v13 = (void *)[v11 initWithAppContext:v10 contextNode:v9 evaluationBlock:v15];

  return (IKDOMNodeList *)v13;
}

id __58__IKDOMNodeList_nodeListWithAppContext_contextNode_xpath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v9 = 0;
  v3 = [a2 nodesForXPath:v2 error:&v9];
  id v4 = v9;
  v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    v5 = v3;
  }
  id v6 = v5;

  if (v4)
  {
    v7 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[IKDOMDocument getElementById:]((uint64_t)v4, v7);
    }
  }
  return v6;
}

- (IKDOMNodeList)initWithAppContext:(id)a3 contextNode:(id)a4 evaluationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)IKDOMNodeList;
  id v11 = [(IKJSObject *)&v18 initWithAppContext:v8];
  if (v11)
  {
    id v12 = [v8 jsContext];
    v13 = [v12 virtualMachine];

    v14 = [v9 managedSelf];
    [v13 addManagedReference:v14 withOwner:v11];

    [v9 addDOMObserver:v11];
    objc_storeStrong((id *)&v11->_contextNode, a4);
    uint64_t v15 = [v10 copy];
    id evaluationBlock = v11->_evaluationBlock;
    v11->_id evaluationBlock = (id)v15;
  }
  return v11;
}

- (int64_t)length
{
  [(IKDOMNodeList *)self _updateNodes];
  v3 = [(IKDOMNodeList *)self nodes];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)item:(int64_t)a3
{
  [(IKDOMNodeList *)self _updateNodes];
  if (a3 < 0 || [(IKDOMNodeList *)self length] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    v5 = [(IKDOMNodeList *)self nodes];
    id v6 = [v5 objectAtIndex:a3];
  }
  return v6;
}

- (void)domDidUpdateForContextNode:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int64_t v4 = [(IKJSObject *)self appContext];
  v5 = [v4 jsContext];
  id v6 = [v5 virtualMachine];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = [(IKDOMNodeList *)self nodes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v13 + 1) + 8 * v11) managedSelf];
        [v6 removeManagedReference:v12 withOwner:self];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [(IKDOMNodeList *)self setNodes:0];
}

- (void)_updateNodes
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(IKDOMNodeList *)self nodes];

  if (!v3)
  {
    int64_t v4 = [(IKDOMNodeList *)self evaluationBlock];

    id v5 = (id)MEMORY[0x1E4F1CBF0];
    if (v4)
    {
      id v6 = [(IKDOMNodeList *)self evaluationBlock];
      v7 = [(IKDOMNodeList *)self contextNode];
      uint64_t v8 = ((void (**)(void, void *))v6)[2](v6, v7);
      uint64_t v9 = (void *)v8;
      if (v8) {
        uint64_t v10 = (void *)v8;
      }
      else {
        uint64_t v10 = v5;
      }
      id v5 = v10;
    }
    uint64_t v11 = [(IKJSObject *)self appContext];
    id v12 = [v11 jsContext];
    long long v13 = [v12 virtualMachine];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = v5;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "managedSelf", (void)v20);
          [v13 addManagedReference:v19 withOwner:self];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }

    [(IKDOMNodeList *)self setNodes:v14];
  }
}

- (IKDOMNode)contextNode
{
  return self->_contextNode;
}

- (void)setContextNode:(id)a3
{
}

- (id)evaluationBlock
{
  return self->_evaluationBlock;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong(&self->_evaluationBlock, 0);
  objc_storeStrong((id *)&self->_contextNode, 0);
}

@end