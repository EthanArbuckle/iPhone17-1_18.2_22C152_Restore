@interface GKDecisionNode
- (GKDecisionNode)createBranchWithPredicate:(NSPredicate *)predicate attribute:(id)attribute;
- (GKDecisionNode)createBranchWithValue:(NSNumber *)value attribute:(id)attribute;
- (GKDecisionNode)createBranchWithWeight:(NSInteger)weight attribute:(id)attribute;
- (GKDecisionNode)initWithNode:(void *)a3 tree:(id)a4;
- (id)attribute;
- (id)branches;
- (id)createChildWithAttribute:(id)a3 randomSource:(id)a4 withBranch:(id)a5;
- (id)description;
- (id)getNodeAtBranch:(id)a3;
- (void)dealloc;
- (void)setAttribute:(id)a3;
@end

@implementation GKDecisionNode

- (GKDecisionNode)initWithNode:(void *)a3 tree:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)GKDecisionNode;
  v7 = [(GKDecisionNode *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_node = a3;
    objc_storeStrong((id *)a3 + 10, v7);
    objc_storeWeak((id *)&v8->_tree, v6);
  }

  return v8;
}

- (void)dealloc
{
  self->_node = 0;
  objc_storeWeak((id *)&self->_tree, 0);
  v3.receiver = self;
  v3.super_class = (Class)GKDecisionNode;
  [(GKDecisionNode *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"attribute: %@, child count: %lu\n", *((void *)self->_node + 6), (uint64_t)(*((void *)self->_node + 1) - *(void *)self->_node) >> 4];
}

- (id)branches
{
  node = self->_node;
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = (void *)*node;
  v5 = (void *)node[1];
  while (v4 != v5)
  {
    if (*v4) {
      objc_msgSend(v3, "addObject:");
    }
    v4 += 2;
  }

  return v3;
}

- (void)setAttribute:(id)a3
{
  id v5 = a3;
  node = (id *)self->_node;
  if (node)
  {
    id v7 = v5;
    objc_storeStrong(node + 6, a3);
    id v5 = v7;
  }
}

- (id)attribute
{
  node = (id *)self->_node;
  if (node)
  {
    id v3 = node[6];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)createChildWithAttribute:(id)a3 randomSource:(id)a4 withBranch:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  node = (id **)self->_node;
  if (!node)
  {
    [NSString stringWithFormat:@"GKDecisionTree: Cannot create new child with branch: %@ and attribute: %@ from nil node.", v11, v9];
    id v34 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v34);
  }
  if (node[1] != *node)
  {
    [**node superclass];
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [NSString stringWithFormat:@"GKDecisionTree: Cannot create child for node type: %@, with branch: %@", objc_msgSend(**(id **)self->_node, "superclass"), v11];
      id v35 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v35);
    }
    node = (id **)self->_node;
    v13 = node[8];
    if (!v10 && v13)
    {
      [NSString stringWithFormat:@"GKDecisionTree: Cannot create child for random node type with branch: %@", v11];
      id v36 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v36);
    }
    if (v10 && !v13)
    {
      [NSString stringWithFormat:@"GKDecisionTree: Cannot create child for node type: %@ with random branch", objc_msgSend(**node, "superclass")];
      id v37 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v37);
    }
  }
  if (v10)
  {
    if (node[8]) {
      v14 = -[GKRandomDistribution initWithRandomSource:lowestValue:highestValue:]([GKRandomDistribution alloc], "initWithRandomSource:lowestValue:highestValue:", v10, 0, [v11 integerValue] + objc_msgSend(*((id *)self->_node + 8), "highestValue"));
    }
    else {
      v14 = -[GKRandomDistribution initWithRandomSource:lowestValue:highestValue:]([GKRandomDistribution alloc], "initWithRandomSource:lowestValue:highestValue:", v10, 0, [v11 integerValue]);
    }
    v22 = self->_node;
    v23 = (void *)v22[8];
    v22[8] = v14;

    operator new();
  }
  v16 = node;
  v15 = *node;
  if (v16[1] == v15) {
    goto LABEL_19;
  }
  uint64_t v17 = 0;
  unint64_t v18 = 0;
  v19 = 0;
  do
  {
    int v20 = [v11 isEqual:v15[v17]];
    v21 = (id **)self->_node;
    v15 = *v21;
    if (v20) {
      v19 = (id *)v15[v17 + 1];
    }
    ++v18;
    v17 += 2;
  }
  while (v18 < ((char *)v21[1] - (char *)v15) >> 4);
  if (!v19) {
LABEL_19:
  }
    operator new();
  objc_storeStrong(v19 + 6, a3);
  v24 = (void **)self->_node;
  id v25 = v11;
  *(void *)&long long v38 = v25;
  *((void *)&v38 + 1) = v19;
  v26 = v24[1];
  if (v26 >= v24[2])
  {
    v29 = std::vector<std::pair<objc_object * {__strong},GKCDecisionNode *>>::__push_back_slow_path<std::pair<objc_object * {__strong},GKCDecisionNode *>>(v24, &v38);
    v28 = (void *)v38;
  }
  else
  {
    id v27 = v25;
    v28 = 0;
    *(void *)&long long v38 = 0;
    v29 = v26 + 2;
    void *v26 = v27;
    v26[1] = v19;
  }
  v24[1] = v29;

  v30 = [GKDecisionNode alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tree);
  v32 = [(GKDecisionNode *)v30 initWithNode:v19 tree:WeakRetained];

  return v32;
}

- (GKDecisionNode)createBranchWithValue:(NSNumber *)value attribute:(id)attribute
{
  v4 = [(GKDecisionNode *)self createChildWithAttribute:attribute randomSource:0 withBranch:value];

  return (GKDecisionNode *)v4;
}

- (GKDecisionNode)createBranchWithPredicate:(NSPredicate *)predicate attribute:(id)attribute
{
  v4 = [(GKDecisionNode *)self createChildWithAttribute:attribute randomSource:0 withBranch:predicate];

  return (GKDecisionNode *)v4;
}

- (GKDecisionNode)createBranchWithWeight:(NSInteger)weight attribute:(id)attribute
{
  id v6 = attribute;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tree);
  v8 = [WeakRetained randomSource];

  if (!v8)
  {
    id v9 = +[GKRandomSource sharedRandom];
    id v10 = objc_loadWeakRetained((id *)&self->_tree);
    [v10 setRandomSource:v9];
  }
  id v11 = objc_loadWeakRetained((id *)&self->_tree);
  v12 = [v11 randomSource];
  v13 = [NSNumber numberWithInteger:weight];
  v14 = [(GKDecisionNode *)self createChildWithAttribute:v6 randomSource:v12 withBranch:v13];

  return (GKDecisionNode *)v14;
}

- (id)getNodeAtBranch:(id)a3
{
  id v4 = a3;
  node = (uint64_t *)self->_node;
  uint64_t v6 = *node;
  uint64_t v7 = node[1];
  if (*node == v7)
  {
LABEL_4:
    v8 = 0;
  }
  else
  {
    while (![*(id *)v6 isEqual:v4])
    {
      v6 += 16;
      if (v6 == v7) {
        goto LABEL_4;
      }
    }
    id v9 = *(void **)(*(void *)(v6 + 8) + 80);
    if (v9)
    {
      v8 = v9;
    }
    else
    {
      id v10 = [GKDecisionNode alloc];
      uint64_t v11 = *(void *)(v6 + 8);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_tree);
      v8 = [(GKDecisionNode *)v10 initWithNode:v11 tree:WeakRetained];
    }
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end