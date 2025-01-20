@interface VSTreeNode
+ (id)keyPathsForValuesAffectingIndexPath;
+ (id)keyPathsForValuesAffectingLeaf;
+ (id)treeNodeWithRepresentedObject:(id)a3;
- (BOOL)isLeaf;
- (NSIndexPath)indexPath;
- (NSMutableArray)children;
- (NSMutableArray)mutableChildNodes;
- (VSTreeNode)init;
- (VSTreeNode)initWithRepresentedObject:(id)a3;
- (VSTreeNode)parentNode;
- (id)_descendantNodesAtDepth:(unint64_t)a3;
- (id)descendantNodeAtIndexPath:(id)a3;
- (id)representedObject;
- (void)enumerateDescendantsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)insertChildNodes:(id)a3 atIndexes:(id)a4;
- (void)removeChildNodesAtIndexes:(id)a3;
- (void)setChildren:(id)a3;
- (void)setParentNode:(id)a3;
@end

@implementation VSTreeNode

+ (id)treeNodeWithRepresentedObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithRepresentedObject:v4];

  return v5;
}

- (VSTreeNode)initWithRepresentedObject:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VSTreeNode;
  v6 = [(VSTreeNode *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_representedObject, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    children = v7->_children;
    v7->_children = v8;
  }
  return v7;
}

- (VSTreeNode)init
{
  return [(VSTreeNode *)self initWithRepresentedObject:0];
}

+ (id)keyPathsForValuesAffectingIndexPath
{
  if (keyPathsForValuesAffectingIndexPath___vs_lazy_init_predicate != -1) {
    dispatch_once(&keyPathsForValuesAffectingIndexPath___vs_lazy_init_predicate, &__block_literal_global_10);
  }
  v2 = (void *)keyPathsForValuesAffectingIndexPath___vs_lazy_init_variable;

  return v2;
}

uint64_t __49__VSTreeNode_keyPathsForValuesAffectingIndexPath__block_invoke()
{
  keyPathsForValuesAffectingIndexPath___vs_lazy_init_variable = __49__VSTreeNode_keyPathsForValuesAffectingIndexPath__block_invoke_2();

  return MEMORY[0x1F41817F8]();
}

id __49__VSTreeNode_keyPathsForValuesAffectingIndexPath__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v0 addObject:@"parentNode.indexPath"];
  v1 = (void *)[v0 copy];

  return v1;
}

- (NSIndexPath)indexPath
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28D58]);
  id v4 = [(VSTreeNode *)self parentNode];
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 childNodes];
    v7 = [v5 indexPath];
    uint64_t v8 = objc_msgSend(v7, "indexPathByAddingIndex:", objc_msgSend(v6, "indexOfObject:", self));

    id v3 = (id)v8;
  }

  return (NSIndexPath *)v3;
}

+ (id)keyPathsForValuesAffectingLeaf
{
  if (keyPathsForValuesAffectingLeaf___vs_lazy_init_predicate != -1) {
    dispatch_once(&keyPathsForValuesAffectingLeaf___vs_lazy_init_predicate, &__block_literal_global_12);
  }
  v2 = (void *)keyPathsForValuesAffectingLeaf___vs_lazy_init_variable;

  return v2;
}

uint64_t __44__VSTreeNode_keyPathsForValuesAffectingLeaf__block_invoke()
{
  keyPathsForValuesAffectingLeaf___vs_lazy_init_variable = __44__VSTreeNode_keyPathsForValuesAffectingLeaf__block_invoke_2();

  return MEMORY[0x1F41817F8]();
}

id __44__VSTreeNode_keyPathsForValuesAffectingLeaf__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v0 addObject:@"childNodes"];
  v1 = (void *)[v0 copy];

  return v1;
}

- (BOOL)isLeaf
{
  v2 = [(VSTreeNode *)self childNodes];
  uint64_t v3 = [v2 count];

  return v3 == 0;
}

- (void)insertChildNodes:(id)a3 atIndexes:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The insertedChildren parameter must not be nil."];
    if (v6) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The indexes parameter must not be nil."];
LABEL_3:
  [v8 makeObjectsPerformSelector:sel_setParentNode_ withObject:self];
  v7 = [(VSTreeNode *)self children];
  [v7 insertObjects:v8 atIndexes:v6];
}

- (void)removeChildNodesAtIndexes:(id)a3
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The indexes parameter must not be nil."];
  }
  id v4 = [(VSTreeNode *)self children];
  id v5 = [v4 objectsAtIndexes:v6];
  [v5 makeObjectsPerformSelector:sel_setParentNode_ withObject:0];
  [v4 removeObjectsAtIndexes:v6];
}

- (NSMutableArray)mutableChildNodes
{
  return (NSMutableArray *)[(VSTreeNode *)self mutableArrayValueForKey:@"childNodes"];
}

- (id)descendantNodeAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The indexPath parameter must not be nil."];
  }
  id v5 = self;
  uint64_t v6 = [v4 length];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    while (1)
    {
      v9 = [(VSTreeNode *)v5 childNodes];
      unint64_t v10 = [v4 indexAtPosition:v8];
      if (v10 >= [v9 count]) {
        break;
      }
      objc_super v11 = [v9 objectAtIndex:v10];

      ++v8;
      id v5 = v11;
      if (v7 == v8) {
        goto LABEL_10;
      }
    }

    objc_super v11 = 0;
  }
  else
  {
    objc_super v11 = v5;
  }
LABEL_10:

  return v11;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (VSTreeNode)parentNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentNode);

  return (VSTreeNode *)WeakRetained;
}

- (void)setParentNode:(id)a3
{
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parentNode);

  objc_storeStrong(&self->_representedObject, 0);
}

- (id)_descendantNodesAtDepth:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [(VSTreeNode *)self childNodes];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = a3 - 1;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) _descendantNodesAtDepth:v9];
          [v5 addObjectsFromArray:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    v13 = (void *)[v5 copy];
    if (!v13) {
      goto LABEL_10;
    }
  }
  else
  {
    v13 = [(VSTreeNode *)self childNodes];
    if (!v13) {
LABEL_10:
    }
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The collectedDescendants parameter must not be nil."];
  }

  return v13;
}

- (void)enumerateDescendantsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void *, unsigned char *))a4;
  if (v6)
  {
    if ((a3 & 1) == 0)
    {
LABEL_3:
      char v28 = 0;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v7 = [(VSTreeNode *)self childNodes];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
LABEL_5:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
          v6[2](v6, v12, &v28);
          if (v28) {
            break;
          }
          [v12 enumerateDescendantsWithOptions:a3 usingBlock:v6];
          if (v28) {
            break;
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
            if (v9) {
              goto LABEL_5;
            }
            break;
          }
        }
      }

      goto LABEL_26;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The block parameter must not be nil."];
    if ((a3 & 1) == 0) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  id v14 = 0;
  char v28 = 0;
  do
  {
    long long v15 = [(VSTreeNode *)self _descendantNodesAtDepth:v13];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = v15;
    uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
LABEL_17:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v14);
        }
        v6[2](v6, *(void **)(*((void *)&v24 + 1) + 8 * v19), &v28);
        if (v28) {
          break;
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
          if (v17) {
            goto LABEL_17;
          }
          break;
        }
      }
    }

    if (v28) {
      break;
    }
    ++v13;
  }
  while ([v14 count]);

LABEL_26:
}

@end