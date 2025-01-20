@interface CKQuadTree
- (CKQuadTree)init;
- (CKQuadTree)initWithPoints:(id)a3;
- (CKQuadTreeNode)rootNode;
- (void)visit:(id)a3;
@end

@implementation CKQuadTree

- (void).cxx_destruct
{
}

- (CKQuadTreeNode)rootNode
{
  return self->_rootNode;
}

- (void)visit:(id)a3
{
}

- (CKQuadTree)initWithPoints:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"CKQuadTree.m", 142, @"Invalid parameter not satisfying: %@", @"points" object file lineNumber description];
  }
  v38.receiver = self;
  v38.super_class = (Class)CKQuadTree;
  v6 = [(CKQuadTree *)&v38 init];
  if (v6)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v35;
      double v11 = 1.79769313e308;
      double v12 = 2.22507386e-308;
      double v13 = 2.22507386e-308;
      double v14 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * i) CGPointValue];
          if (v16 > v13) {
            double v13 = v16;
          }
          if (v16 < v14) {
            double v14 = v16;
          }
          if (v17 > v12) {
            double v12 = v17;
          }
          if (v17 < v11) {
            double v11 = v17;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 1.79769313e308;
      double v12 = 2.22507386e-308;
      double v13 = 2.22507386e-308;
      double v14 = 1.79769313e308;
    }

    double v18 = v13 - v14;
    if (v13 - v14 < v12 - v11) {
      double v18 = v12 - v11;
    }
    double v19 = ceil(v18 + 1.0);
    v20 = -[CKQuadTreeNode initWithBounds:]([CKQuadTreeNode alloc], "initWithBounds:", floor(v14), floor(v11), v19, v19);
    rootNode = v6->_rootNode;
    v6->_rootNode = v20;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v22 = v7;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = v6->_rootNode;
          [*(id *)(*((void *)&v30 + 1) + 8 * j) CGPointValue];
          -[CKQuadTreeNode insertPoint:](v27, "insertPoint:");
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v24);
    }
  }
  return v6;
}

- (CKQuadTree)init
{
  return [(CKQuadTree *)self initWithPoints:0];
}

@end