@interface AFTreeNode
+ (id)absoluteIndexPathsForTreeNodes:(id)a3;
- (AFTreeNode)init;
- (AFTreeNode)parentNode;
- (BOOL)containsNodeAtIndexPath:(id)a3;
- (NSMutableArray)_childNodes;
- (id)absoluteIndexPath;
- (id)childNodeAtIndex:(int64_t)a3;
- (id)description;
- (id)indexPathFromAncestorNode:(id)a3;
- (id)indexPathOfNodeWithItem:(id)a3;
- (id)item;
- (id)lastChildNode;
- (id)nodeAtIndexPath:(id)a3;
- (int64_t)indexOfChildNode:(id)a3;
- (int64_t)numberOfChildNodes;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_appendDescriptionToString:(id)a3 withIndentation:(id)a4;
- (void)_setParentNode:(id)a3;
- (void)addChildNode:(id)a3;
- (void)enumerateChildNodesUsingBlock:(id)a3;
- (void)enumerateChildNodesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateDescendentNodesUsingBlock:(id)a3;
- (void)insertChildNode:(id)a3 atIndex:(int64_t)a4;
- (void)removeChildNode:(id)a3;
- (void)removeChildNodeAtIndex:(int64_t)a3;
- (void)removeFromParentNode;
- (void)replaceChildNodeAtIndex:(int64_t)a3 withNode:(id)a4;
- (void)setItem:(id)a3;
@end

@implementation AFTreeNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childNodes, 0);
  objc_destroyWeak((id *)&self->_parentNode);
  objc_storeStrong(&self->_item, 0);
}

- (NSMutableArray)_childNodes
{
  return self->_childNodes;
}

- (void)_setParentNode:(id)a3
{
}

- (AFTreeNode)parentNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentNode);
  return (AFTreeNode *)WeakRetained;
}

- (void)setItem:(id)a3
{
}

- (id)item
{
  return self->_item;
}

- (void)enumerateDescendentNodesUsingBlock:(id)a3
{
  v4 = (void (**)(id, AFTreeNode *, unsigned char *))a3;
  if (v4)
  {
    char v10 = 0;
    v5 = objc_alloc_init(AFQueue);
    v6 = [(AFTreeNode *)self _childNodes];
    [(AFQueue *)v5 enqueueObjects:v6];

    do
    {
      v7 = [(AFQueue *)v5 frontObject];

      if (!v7) {
        break;
      }
      v8 = [(AFQueue *)v5 dequeueObject];
      if (v8 != self)
      {
        v4[2](v4, v8, &v10);
        v9 = [(AFTreeNode *)v8 _childNodes];
        [(AFQueue *)v5 enqueueObjects:v9];
      }
    }
    while (!v10);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = [(AFTreeNode *)self _childNodes];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (void)enumerateChildNodesUsingBlock:(id)a3
{
}

- (void)enumerateChildNodesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = [(AFTreeNode *)self _childNodes];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__AFTreeNode_enumerateChildNodesWithOptions_usingBlock___block_invoke;
    v8[3] = &unk_1E59266D8;
    id v9 = v6;
    [v7 enumerateObjectsWithOptions:a3 usingBlock:v8];
  }
}

uint64_t __56__AFTreeNode_enumerateChildNodesWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)replaceChildNodeAtIndex:(int64_t)a3 withNode:(id)a4
{
  id v6 = a4;
  [(AFTreeNode *)self removeChildNodeAtIndex:a3];
  [(AFTreeNode *)self insertChildNode:v6 atIndex:a3];
}

- (void)removeChildNode:(id)a3
{
  id v5 = a3;
  id v6 = [(AFTreeNode *)self _childNodes];
  uint64_t v7 = [v6 indexOfObject:v5];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"AFTreeNode.m" lineNumber:203 description:@"Cannot remove a child that we don't contain"];
  }
  [(AFTreeNode *)self removeChildNodeAtIndex:v7];
}

- (void)removeChildNodeAtIndex:(int64_t)a3
{
  id v6 = [(AFTreeNode *)self _childNodes];
  id v10 = [v6 objectAtIndex:a3];

  uint64_t v7 = [v10 parentNode];

  if (v7 != self)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"AFTreeNode.m" lineNumber:194 description:@"Cannot remove a child if we're not its parent"];
  }
  v8 = [(AFTreeNode *)self _childNodes];
  [v8 removeObjectAtIndex:a3];

  [v10 _setParentNode:0];
}

- (void)addChildNode:(id)a3
{
  id v4 = a3;
  id v5 = [(AFTreeNode *)self _childNodes];
  -[AFTreeNode insertChildNode:atIndex:](self, "insertChildNode:atIndex:", v4, [v5 count]);
}

- (void)insertChildNode:(id)a3 atIndex:(int64_t)a4
{
  uint64_t v7 = (AFTreeNode *)a3;
  if (v7 == self)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, v7, @"AFTreeNode.m", 168, @"Invalid parameter not satisfying: %@", @"child != self" object file lineNumber description];
  }
  v8 = [MEMORY[0x1E4F1CA80] setWithObject:self];
  uint64_t v9 = [(AFTreeNode *)self parentNode];
  if (v9)
  {
    id v10 = (void *)v9;
    do
    {
      [v8 addObject:v10];
      uint64_t v11 = [v10 parentNode];

      id v10 = (void *)v11;
    }
    while (v11);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __38__AFTreeNode_insertChildNode_atIndex___block_invoke;
  v15[3] = &unk_1E59266B0;
  v17 = self;
  SEL v18 = a2;
  id v16 = v8;
  id v12 = v8;
  [(AFTreeNode *)v7 enumerateDescendentNodesUsingBlock:v15];
  [(AFTreeNode *)v7 removeFromParentNode];
  v13 = [(AFTreeNode *)self _childNodes];
  [v13 insertObject:v7 atIndex:a4];

  [(AFTreeNode *)v7 _setParentNode:self];
}

void __38__AFTreeNode_insertChildNode_atIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) containsObject:a2])
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"AFTreeNode.m" lineNumber:178 description:@"Attempt to create cycle"];
  }
}

- (id)lastChildNode
{
  v2 = [(AFTreeNode *)self _childNodes];
  id v3 = [v2 lastObject];

  return v3;
}

- (id)childNodeAtIndex:(int64_t)a3
{
  id v4 = [(AFTreeNode *)self _childNodes];
  id v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (int64_t)indexOfChildNode:(id)a3
{
  id v4 = a3;
  id v5 = [(AFTreeNode *)self _childNodes];
  int64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (int64_t)numberOfChildNodes
{
  v2 = [(AFTreeNode *)self _childNodes];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)removeFromParentNode
{
  id v3 = [(AFTreeNode *)self parentNode];
  [v3 removeChildNode:self];
}

- (id)indexPathOfNodeWithItem:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10841;
  v20 = __Block_byref_object_dispose__10842;
  id v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __38__AFTreeNode_indexPathOfNodeWithItem___block_invoke;
  v14[3] = &unk_1E5926660;
  id v5 = v4;
  id v15 = v5;
  int64_t v6 = (unsigned int (**)(void, void))MEMORY[0x19F3A50D0](v14);
  if (((unsigned int (**)(void, AFTreeNode *))v6)[2](v6, self))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28D58]);
    v8 = (void *)v17[5];
    v17[5] = (uint64_t)v7;
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__AFTreeNode_indexPathOfNodeWithItem___block_invoke_2;
    v11[3] = &unk_1E5926688;
    id v12 = v6;
    v13 = &v16;
    v11[4] = self;
    [(AFTreeNode *)self enumerateDescendentNodesUsingBlock:v11];
    v8 = v12;
  }

  id v9 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v9;
}

uint64_t __38__AFTreeNode_indexPathOfNodeWithItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 item];
  if (v4 == *(void **)(a1 + 32))
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v5 = [v3 item];
    uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];
  }
  return v6;
}

void __38__AFTreeNode_indexPathOfNodeWithItem___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    uint64_t v5 = [v8 indexPathFromAncestorNode:a1[4]];
    uint64_t v6 = *(void *)(a1[6] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *a3 = 1;
  }
}

- (id)nodeAtIndexPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"AFTreeNode.m", 106, @"Invalid parameter not satisfying: %@", @"relativeIndexPath" object file lineNumber description];
  }
  uint64_t v6 = self;
  if ([v5 length])
  {
    unint64_t v7 = 0;
    do
    {
      -[AFTreeNode childNodeAtIndex:](v6, "childNodeAtIndex:", [v5 indexAtPosition:v7]);
      id v8 = (AFTreeNode *)objc_claimAutoreleasedReturnValue();

      ++v7;
      uint64_t v6 = v8;
    }
    while (v7 < [v5 length]);
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (BOOL)containsNodeAtIndexPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"AFTreeNode.m", 86, @"Invalid parameter not satisfying: %@", @"relativeIndexPath" object file lineNumber description];
  }
  uint64_t v6 = self;
  if ([v5 length])
  {
    unint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [v5 indexAtPosition:v7];
      uint64_t v9 = [(AFTreeNode *)v6 numberOfChildNodes];
      BOOL v10 = v8 < v9;
      if (v8 >= v9) {
        break;
      }
      uint64_t v11 = [(AFTreeNode *)v6 childNodeAtIndex:v8];

      ++v7;
      uint64_t v6 = (AFTreeNode *)v11;
      if (v7 >= [v5 length])
      {
        BOOL v10 = 1;
        uint64_t v6 = (AFTreeNode *)v11;
        break;
      }
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (id)absoluteIndexPath
{
  id v3 = [(AFTreeNode *)self parentNode];

  if (v3)
  {
    id v4 = [(AFTreeNode *)self parentNode];
    id v5 = [v4 absoluteIndexPath];
    uint64_t v6 = [(AFTreeNode *)self parentNode];
    objc_msgSend(v5, "indexPathByAddingIndex:", objc_msgSend(v6, "indexOfChildNode:", self));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28D58]);
  }
  return v7;
}

- (id)indexPathFromAncestorNode:(id)a3
{
  id v4 = (AFTreeNode *)a3;
  if (self == v4)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28D58]);
  }
  else
  {
    id v5 = [(AFTreeNode *)self parentNode];

    if (!v5)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
      v13 = [NSString stringWithFormat:@"Cannot generate an index path relative to node %@, which isn't an ancestor", v4];
      id v14 = [v11 exceptionWithName:v12 reason:v13 userInfo:0];

      objc_exception_throw(v14);
    }
    uint64_t v6 = [(AFTreeNode *)self parentNode];
    id v7 = [v6 indexPathFromAncestorNode:v4];
    uint64_t v8 = [(AFTreeNode *)self parentNode];
    objc_msgSend(v7, "indexPathByAddingIndex:", objc_msgSend(v8, "indexOfChildNode:", self));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  [(AFTreeNode *)self _appendDescriptionToString:v3 withIndentation:&stru_1EEE35D28];
  return v3;
}

- (void)_appendDescriptionToString:(id)a3 withIndentation:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 appendString:v7];
  uint64_t v8 = objc_opt_class();
  id v9 = [(AFTreeNode *)self item];
  BOOL v10 = [(AFTreeNode *)self _childNodes];
  objc_msgSend(v6, "appendFormat:", @"<%@ %p: item=%@; %lu children=("), v8, self, v9, objc_msgSend(v10, "count");

  uint64_t v11 = [(AFTreeNode *)self _childNodes];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    v13 = [v7 stringByAppendingString:@"  "];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = self;
    uint64_t v15 = [(AFTreeNode *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v20 + 1) + 8 * v18);
          [v6 appendString:@"\n"];
          [v19 _appendDescriptionToString:v6 withIndentation:v13];
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [(AFTreeNode *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }

    [v6 appendString:v7];
    [v6 appendString:@"\n>"]);
  }
  else
  {
    [v6 appendString:@"none>"]);
  }
}

- (AFTreeNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)AFTreeNode;
  v2 = [(AFTreeNode *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    childNodes = v2->_childNodes;
    v2->_childNodes = (NSMutableArray *)v3;
  }
  return v2;
}

+ (id)absoluteIndexPathsForTreeNodes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "absoluteIndexPath", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

@end