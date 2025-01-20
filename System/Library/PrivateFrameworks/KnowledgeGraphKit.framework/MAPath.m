@interface MAPath
+ (id)path;
+ (id)pathWithEdges:(id)a3;
- (BOOL)containsEdge:(id)a3;
- (BOOL)containsNode:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqualToPath:(id)a3;
- (MAPath)init;
- (double)edgesWeight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)edgeAtIndex:(unint64_t)a3;
- (id)edgesForLabel:(id)a3;
- (id)graphRepresentation;
- (id)nodeAtIndex:(unint64_t)a3;
- (id)nodesForLabel:(id)a3;
- (id)sourceNode;
- (id)targetNode;
- (unint64_t)edgesCount;
- (unint64_t)nodesCount;
- (void)addFirstEdge:(id)a3;
- (void)addLastEdge:(id)a3;
- (void)enumerateWithBlock:(id)a3;
- (void)removeAllEdges;
- (void)removeFirstEdge;
- (void)removeLastEdge;
- (void)setEdges:(id)a3;
@end

@implementation MAPath

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_edges, 0);
}

- (void)enumerateWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  char v17 = 0;
  v5 = [(MAPath *)self sourceNode];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = self->_edges;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    v11 = v5;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
      v4[2](v4, v11, v12, &v17);
      v5 = objc_msgSend(v12, "oppositeNode:", v11, (void)v13);

      if (v17) {
        break;
      }
      ++v10;
      v11 = v5;
      if (v8 == v10)
      {
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v6 = [(MAPath *)self targetNode];
    if (v6) {
      v4[2](v4, v6, 0, &v17);
    }
  }
}

- (id)graphRepresentation
{
  v3 = +[MAGraph graph];
  v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __29__MAPath_graphRepresentation__block_invoke;
  v15[3] = &unk_1E68DC240;
  id v5 = v3;
  id v16 = v5;
  id v6 = v4;
  id v17 = v6;
  [(MAPath *)self enumerateWithBlock:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __29__MAPath_graphRepresentation__block_invoke_2;
  v12[3] = &unk_1E68DC240;
  id v13 = v6;
  id v7 = v5;
  id v14 = v7;
  id v8 = v6;
  [(MAPath *)self enumerateWithBlock:v12];
  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

void __29__MAPath_graphRepresentation__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 addNodeFromBase:v4];
  [*(id *)(a1 + 40) setObject:v5 forKey:v4];
}

void __29__MAPath_graphRepresentation__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v12 = v4;
    id v6 = [v4 sourceNode];
    id v7 = [v5 objectForKey:v6];

    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v12 targetNode];
    id v10 = [v8 objectForKey:v9];

    if (v7 && v10) {
      id v11 = (id)[*(id *)(a1 + 40) addEdgeFromBase:v12 sourceNode:v7 targetNode:v10];
    }
    else {
      [MEMORY[0x1E4F1CA00] raise:@"MAPathInvalidGraph", @"Graph invalid for edge \"%@\"", v12 format];
    }

    id v4 = v12;
  }
}

- (void)removeAllEdges
{
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableArray *)obj->_edges removeAllObjects];
  objc_sync_exit(obj);
}

- (void)setEdges:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(NSMutableArray *)v5->_edges removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[MAPath addLastEdge:](v5, "addLastEdge:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)removeLastEdge
{
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableArray *)obj->_edges removeLastObject];
  objc_sync_exit(obj);
}

- (void)removeFirstEdge
{
  obj = self;
  objc_sync_enter(obj);
  if ([(NSMutableArray *)obj->_edges count]) {
    [(NSMutableArray *)obj->_edges removeObjectAtIndex:0];
  }
  objc_sync_exit(obj);
}

- (void)addLastEdge:(id)a3
{
  id v14 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSMutableArray *)v4->_edges count];
  edges = v4->_edges;
  if (v5)
  {
    uint64_t v7 = [(NSMutableArray *)edges lastObject];
    uint64_t v8 = [v14 commonNode:v7];
    if (v8)
    {
      [(NSMutableArray *)v4->_edges addObject:v14];
      nodes = v4->_nodes;
      long long v10 = [v14 oppositeNode:v8];
      [(NSMutableSet *)nodes addObject:v10];
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:@"MAPathInvalidPath", @"Edge does not connect to \"%@\"", v7 format];
    }
  }
  else
  {
    [(NSMutableArray *)edges addObject:v14];
    long long v11 = v4->_nodes;
    long long v12 = [v14 sourceNode];
    [(NSMutableSet *)v11 addObject:v12];

    long long v13 = v4->_nodes;
    uint64_t v7 = [v14 targetNode];
    [(NSMutableSet *)v13 addObject:v7];
  }

  objc_sync_exit(v4);
}

- (void)addFirstEdge:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSMutableArray *)v4->_edges count];
  edges = v4->_edges;
  if (v5)
  {
    uint64_t v7 = [(NSMutableArray *)edges firstObject];
    uint64_t v8 = [v9 commonNode:v7];

    if (v8) {
      [(NSMutableArray *)v4->_edges insertObject:v9 atIndex:0];
    }
    else {
      [MEMORY[0x1E4F1CA00] raise:@"MAPathInvalidPath", @"Edge does not connect to \"%@\"", v7 format];
    }
  }
  else
  {
    [(NSMutableArray *)edges addObject:v9];
  }
  objc_sync_exit(v4);
}

- (BOOL)containsNode:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = self->_edges;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "sourceNode", (void)v16);
        if ([v11 isEqual:v4])
        {

LABEL_13:
          BOOL v14 = 1;
          goto LABEL_14;
        }
        long long v12 = [v10 targetNode];
        char v13 = [v12 isEqual:v4];

        if (v13) {
          goto LABEL_13;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      BOOL v14 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_14:

  return v14;
}

- (BOOL)containsEdge:(id)a3
{
  return [(NSMutableArray *)self->_edges containsObject:a3];
}

- (double)edgesWeight
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_edges;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "weight", (void)v10);
        double v6 = v6 + v8;
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (BOOL)isEmpty
{
  return [(NSMutableArray *)self->_edges count] == 0;
}

- (unint64_t)edgesCount
{
  return [(NSMutableArray *)self->_edges count];
}

- (unint64_t)nodesCount
{
  unint64_t result = [(NSMutableArray *)self->_edges count];
  if (result) {
    return [(NSMutableArray *)self->_edges count] + 1;
  }
  return result;
}

- (id)edgeAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_edges count] <= a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"MAPathInvalidIndex", @"Out of bounds path edge index \"%ld\"", a3);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_edges objectAtIndex:a3];
  }
  return v5;
}

- (id)nodeAtIndex:(unint64_t)a3
{
  if (!a3)
  {
    uint64_t v5 = [(MAPath *)self sourceNode];
    goto LABEL_5;
  }
  if ([(MAPath *)self nodesCount] - 1 == a3)
  {
    uint64_t v5 = [(MAPath *)self targetNode];
LABEL_5:
    double v6 = (void *)v5;
    goto LABEL_6;
  }
  if ([(MAPath *)self nodesCount] > a3)
  {
    float v8 = [(NSMutableArray *)self->_edges objectAtIndex:a3];
    id v9 = [(NSMutableArray *)self->_edges objectAtIndex:a3 - 1];
    double v6 = [v8 sourceNode];
    long long v10 = [v9 sourceNode];
    if (([v6 isSameNodeAsNode:v10] & 1) == 0)
    {
      long long v11 = [v9 targetNode];
      char v12 = [v6 isSameNodeAsNode:v11];

      if (v12)
      {
LABEL_14:

        goto LABEL_6;
      }
      [v8 targetNode];
      v6 = long long v10 = v6;
    }

    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"MAPathInvalidIndex", @"Out of bounds path node index \"%ld\"", a3);
  double v6 = 0;
LABEL_6:
  return v6;
}

- (id)edgesForLabel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  char v12 = __24__MAPath_edgesForLabel___block_invoke;
  long long v13 = &unk_1E68DC240;
  id v14 = v4;
  id v15 = v5;
  id v6 = v5;
  id v7 = v4;
  [(MAPath *)self enumerateWithBlock:&v10];
  float v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithSet:", v6, v10, v11, v12, v13);

  return v8;
}

void __24__MAPath_edgesForLabel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 label];
    int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

    if (v8) {
      [*(id *)(a1 + 40) addObject:v6];
    }
  }
}

- (id)nodesForLabel:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  char v12 = __24__MAPath_nodesForLabel___block_invoke;
  long long v13 = &unk_1E68DC240;
  id v14 = v4;
  id v15 = v5;
  id v6 = v5;
  id v7 = v4;
  [(MAPath *)self enumerateWithBlock:&v10];
  int v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithSet:", v6, v10, v11, v12, v13);

  return v8;
}

void __24__MAPath_nodesForLabel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = [v8 label];
    int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

    if (v7) {
      [*(id *)(a1 + 40) addObject:v5];
    }
  }
}

- (id)targetNode
{
  if ([(NSMutableArray *)self->_edges count])
  {
    uint64_t v3 = [(NSMutableArray *)self->_edges count];
    id v4 = [(NSMutableArray *)self->_edges lastObject];
    id v5 = v4;
    if (v3 == 1)
    {
      id v6 = [v4 targetNode];
    }
    else
    {
      int v7 = [(NSMutableArray *)self->_edges objectAtIndex:[(NSMutableArray *)self->_edges count] - 2];
      id v8 = [v5 commonNode:v7];
      id v6 = [v5 oppositeNode:v8];
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)sourceNode
{
  if ([(NSMutableArray *)self->_edges count])
  {
    uint64_t v3 = [(NSMutableArray *)self->_edges count];
    id v4 = [(NSMutableArray *)self->_edges firstObject];
    id v5 = v4;
    if (v3 == 1)
    {
      id v6 = [v4 sourceNode];
    }
    else
    {
      int v7 = [(NSMutableArray *)self->_edges objectAtIndex:1];
      id v8 = [v5 commonNode:v7];
      id v6 = [v5 oppositeNode:v8];
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_edges];
  id v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (BOOL)isEqualToPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MAPath *)self nodesCount];
  if (v5 != [v4 nodesCount]
    || (unint64_t v6 = -[MAPath edgesCount](self, "edgesCount"), v6 != [v4 edgesCount]))
  {
LABEL_12:
    char v14 = 0;
    goto LABEL_13;
  }
  if ([(MAPath *)self nodesCount])
  {
    uint64_t v7 = 0;
    do
    {
      id v8 = [(MAPath *)self nodeAtIndex:v7];
      id v9 = [v4 nodeAtIndex:v7];
      char v10 = [v8 isEqualToNode:v9];

      if ((v10 & 1) == 0) {
        goto LABEL_12;
      }
    }
    while (++v7 < [(MAPath *)self nodesCount]);
  }
  if ([(MAPath *)self edgesCount])
  {
    unint64_t v11 = 0;
    do
    {
      char v12 = [(MAPath *)self edgeAtIndex:v11];
      long long v13 = [v4 edgeAtIndex:v11];
      char v14 = [v12 isEqualToEdge:v13];

      if ((v14 & 1) == 0) {
        break;
      }
      ++v11;
    }
    while (v11 < [(MAPath *)self edgesCount]);
  }
  else
  {
    char v14 = 1;
  }
LABEL_13:

  return v14;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __21__MAPath_description__block_invoke;
  v6[3] = &unk_1E68DC218;
  id v4 = v3;
  id v7 = v4;
  [(MAPath *)self enumerateWithBlock:v6];

  return v4;
}

void __21__MAPath_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  unint64_t v6 = *(void **)(a1 + 32);
  id v7 = [v14 visualString];
  [v6 appendFormat:@"%@", v7];

  if (v5)
  {
    id v8 = [v5 sourceNode];
    id v9 = *(void **)(a1 + 32);
    if ([v8 isEqual:v14]) {
      char v10 = &stru_1F2802F38;
    }
    else {
      char v10 = @"<";
    }
    unint64_t v11 = [v5 visualString];
    int v12 = [v8 isEqual:v14];
    long long v13 = @">";
    if (!v12) {
      long long v13 = &stru_1F2802F38;
    }
    [v9 appendFormat:@"%@-%@-%@", v10, v11, v13];
  }
}

- (MAPath)init
{
  v8.receiver = self;
  v8.super_class = (Class)MAPath;
  v2 = [(MAPath *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    edges = v2->_edges;
    v2->_edges = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    nodes = v2->_nodes;
    v2->_nodes = (NSMutableSet *)v5;
  }
  return v2;
}

+ (id)pathWithEdges:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setEdges:v3];

  return v4;
}

+ (id)path
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

@end