@interface MANodeLegacyImplementation
- (BOOL)hasEdgeOfType:(unint64_t)a3 matchingFilter:(id)a4;
- (BOOL)hasEdgeOfType:(unint64_t)a3 withNode:(id)a4;
- (MANodeLegacyImplementation)initWithNode:(id)a3;
- (unint64_t)countOfEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4;
- (void)addEdge:(id)a3;
- (void)enumerateEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5;
- (void)enumerateEdgesOfType:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateEdgesOfType:(unint64_t)a3 withNode:(id)a4 usingBlock:(id)a5;
- (void)enumerateNeighborEdgesAndNodesMatchingFilter:(id)a3 usingBlock:(id)a4;
- (void)enumerateNeighborEdgesAndNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5;
- (void)enumerateNeighborNodesMatchingFilter:(id)a3 usingBlock:(id)a4;
- (void)enumerateNeighborNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5;
- (void)removeEdge:(id)a3;
@end

@implementation MANodeLegacyImplementation

- (void).cxx_destruct
{
}

- (void)enumerateNeighborNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__MANodeLegacyImplementation_enumerateNeighborNodesThroughEdgesOfType_matchingFilter_usingBlock___block_invoke;
  v10[3] = &unk_1E68DBAF0;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(MANodeLegacyImplementation *)self enumerateEdgesOfType:a3 matchingFilter:a4 usingBlock:v10];
}

void __97__MANodeLegacyImplementation_enumerateNeighborNodesThroughEdgesOfType_matchingFilter_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [a2 oppositeNode:*(void *)(*(void *)(a1 + 32) + 16)];
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);
}

- (void)enumerateNeighborEdgesAndNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __105__MANodeLegacyImplementation_enumerateNeighborEdgesAndNodesThroughEdgesOfType_matchingFilter_usingBlock___block_invoke;
  v10[3] = &unk_1E68DBAF0;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(MANodeLegacyImplementation *)self enumerateEdgesOfType:a3 matchingFilter:a4 usingBlock:v10];
}

void __105__MANodeLegacyImplementation_enumerateNeighborEdgesAndNodesThroughEdgesOfType_matchingFilter_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  id v5 = [v4 oppositeNode:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateNeighborNodesMatchingFilter:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__MANodeLegacyImplementation_enumerateNeighborNodesMatchingFilter_usingBlock___block_invoke;
  v8[3] = &unk_1E68DAA28;
  id v9 = v6;
  id v7 = v6;
  [(MANodeLegacyImplementation *)self enumerateNeighborEdgesAndNodesMatchingFilter:a3 usingBlock:v8];
}

uint64_t __78__MANodeLegacyImplementation_enumerateNeighborNodesMatchingFilter_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateNeighborEdgesAndNodesMatchingFilter:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MAElementFilter any];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__MANodeLegacyImplementation_enumerateNeighborEdgesAndNodesMatchingFilter_usingBlock___block_invoke;
    v16[3] = &unk_1E68DBAF0;
    v10 = &v17;
    v16[4] = self;
    id v17 = v7;
    id v11 = v7;
    [(MANodeLegacyImplementation *)self enumerateEdgesOfType:3 usingBlock:v16];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __86__MANodeLegacyImplementation_enumerateNeighborEdgesAndNodesMatchingFilter_usingBlock___block_invoke_2;
    v13[3] = &unk_1E68DAA00;
    v13[4] = self;
    v10 = &v14;
    id v14 = v6;
    id v15 = v7;
    id v12 = v7;
    [(MANodeLegacyImplementation *)self enumerateEdgesOfType:3 usingBlock:v13];
  }
}

void __86__MANodeLegacyImplementation_enumerateNeighborEdgesAndNodesMatchingFilter_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 oppositeNode:*(void *)(*(void *)(a1 + 32) + 16)];
  if (v3 != *(void **)(*(void *)(a1 + 32) + 16)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __86__MANodeLegacyImplementation_enumerateNeighborEdgesAndNodesMatchingFilter_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 oppositeNode:*(void *)(*(void *)(a1 + 32) + 16)];
  if (v3 != *(void **)(*(void *)(a1 + 32) + 16) && [*(id *)(a1 + 40) matchesNode:v3]) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)enumerateEdgesOfType:(unint64_t)a3 withNode:(id)a4 usingBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = +[MAElementFilter any];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__MANodeLegacyImplementation_enumerateEdgesOfType_withNode_usingBlock___block_invoke;
  v13[3] = &unk_1E68DA9D8;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [(MANodeLegacyImplementation *)self enumerateNeighborEdgesAndNodesThroughEdgesOfType:a3 matchingFilter:v10 usingBlock:v13];
}

void __71__MANodeLegacyImplementation_enumerateEdgesOfType_withNode_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) isSameNodeAsNode:a3]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)removeEdge:(id)a3
{
}

- (void)addEdge:(id)a3
{
}

- (BOOL)hasEdgeOfType:(unint64_t)a3 withNode:(id)a4
{
  id v6 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__MANodeLegacyImplementation_hasEdgeOfType_withNode___block_invoke;
  v9[3] = &unk_1E68DBC60;
  id v11 = &v12;
  v9[4] = self;
  id v7 = v6;
  id v10 = v7;
  [(MANodeLegacyImplementation *)self enumerateEdgesOfType:a3 usingBlock:v9];
  LOBYTE(a3) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return a3;
}

void __53__MANodeLegacyImplementation_hasEdgeOfType_withNode___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 oppositeNode:*(void *)(a1[4] + 16)];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5 == (void *)a1[5];

  *a3 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24);
}

- (void)enumerateEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[MAElementFilter any];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    [(MANodeLegacyImplementation *)self enumerateEdgesOfType:a3 usingBlock:v9];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__MANodeLegacyImplementation_enumerateEdgesOfType_matchingFilter_usingBlock___block_invoke;
    v12[3] = &unk_1E68DBAF0;
    id v13 = v8;
    id v14 = v9;
    [(MANodeLegacyImplementation *)self enumerateEdgesOfType:a3 usingBlock:v12];
  }
}

void __77__MANodeLegacyImplementation_enumerateEdgesOfType_matchingFilter_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "matchesEdge:")) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)enumerateEdgesOfType:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  switch(a3)
  {
    case 3uLL:
      edges = self->_edges;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __62__MANodeLegacyImplementation_enumerateEdgesOfType_usingBlock___block_invoke_3;
      v12[3] = &unk_1E68DA9B0;
      id v13 = v6;
      [(NSMutableArray *)edges enumerateObjectsUsingBlock:v12];
      id v9 = v13;
      goto LABEL_7;
    case 2uLL:
      int v11 = self->_edges;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __62__MANodeLegacyImplementation_enumerateEdgesOfType_usingBlock___block_invoke_2;
      v14[3] = &unk_1E68DA988;
      v14[4] = self;
      id v15 = v6;
      [(NSMutableArray *)v11 enumerateObjectsUsingBlock:v14];
      id v9 = v15;
      goto LABEL_7;
    case 1uLL:
      id v8 = self->_edges;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __62__MANodeLegacyImplementation_enumerateEdgesOfType_usingBlock___block_invoke;
      v16[3] = &unk_1E68DA988;
      v16[4] = self;
      id v17 = v6;
      [(NSMutableArray *)v8 enumerateObjectsUsingBlock:v16];
      id v9 = v17;
LABEL_7:

      break;
  }
}

void __62__MANodeLegacyImplementation_enumerateEdgesOfType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 targetNode];
  int v4 = [v3 isSameNodeAsNode:*(void *)(*(void *)(a1 + 32) + 16)];

  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __62__MANodeLegacyImplementation_enumerateEdgesOfType_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 sourceNode];
  int v4 = [v3 isSameNodeAsNode:*(void *)(*(void *)(a1 + 32) + 16)];

  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __62__MANodeLegacyImplementation_enumerateEdgesOfType_usingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasEdgeOfType:(unint64_t)a3 matchingFilter:(id)a4
{
  id v6 = a4;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__MANodeLegacyImplementation_hasEdgeOfType_matchingFilter___block_invoke;
  v8[3] = &unk_1E68DC9D0;
  void v8[4] = &v9;
  [(MANodeLegacyImplementation *)self enumerateEdgesOfType:a3 matchingFilter:v6 usingBlock:v8];
  LOBYTE(a3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return a3;
}

uint64_t __59__MANodeLegacyImplementation_hasEdgeOfType_matchingFilter___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- (unint64_t)countOfEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4
{
  id v6 = a4;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__MANodeLegacyImplementation_countOfEdgesOfType_matchingFilter___block_invoke;
  v9[3] = &unk_1E68DC9D0;
  v9[4] = &v10;
  [(MANodeLegacyImplementation *)self enumerateEdgesOfType:a3 matchingFilter:v6 usingBlock:v9];
  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __64__MANodeLegacyImplementation_countOfEdgesOfType_matchingFilter___block_invoke(uint64_t result)
{
  return result;
}

- (MANodeLegacyImplementation)initWithNode:(id)a3
{
  int v4 = (MANode *)a3;
  v10.receiver = self;
  v10.super_class = (Class)MANodeLegacyImplementation;
  id v5 = [(MANodeLegacyImplementation *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v5->_node = v4;
    unint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    edges = v6->_edges;
    v6->_edges = v7;
  }
  return v6;
}

@end