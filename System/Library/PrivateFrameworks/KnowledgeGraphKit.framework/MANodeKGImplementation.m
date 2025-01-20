@interface MANodeKGImplementation
- (BOOL)hasEdgeOfType:(unint64_t)a3 matchingFilter:(id)a4;
- (BOOL)hasEdgeOfType:(unint64_t)a3 withNode:(id)a4;
- (MANodeKGImplementation)initWithNode:(id)a3;
- (id)edgeIdentifiersOfType:(unint64_t)a3 matchingFilter:(id)a4;
- (unint64_t)countOfEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4;
- (void)enumerateEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5;
- (void)enumerateEdgesOfType:(unint64_t)a3 withNode:(id)a4 usingBlock:(id)a5;
- (void)enumerateNeighborEdgesAndNodesMatchingFilter:(id)a3 usingBlock:(id)a4;
- (void)enumerateNeighborEdgesAndNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5;
- (void)enumerateNeighborNodesMatchingFilter:(id)a3 usingBlock:(id)a4;
- (void)enumerateNeighborNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5;
- (void)enumerateNodesRelatedWithRelation:(id)a3 usingBlock:(id)a4;
@end

@implementation MANodeKGImplementation

- (void)enumerateNeighborNodesMatchingFilter:(id)a3 usingBlock:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = +[MAElementFilter any];
  v9 = [v8 anyDirectionRelation];
  v10 = [v9 excludeSource];
  v14[0] = v10;
  v11 = [v7 relation];

  v14[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v13 = +[MARelation chain:v12];

  [(MANodeKGImplementation *)self enumerateNodesRelatedWithRelation:v13 usingBlock:v6];
}

- (void)enumerateNodesRelatedWithRelation:(id)a3 usingBlock:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1D25FA040]();
  v8 = self->_node;
  v9 = [[MANodeCollection alloc] initWithNode:v8];

  v10 = +[MANodeCollection nodesRelatedToNodes:v9 withRelation:v11];
  [v10 enumerateNodesUsingBlock:v6];
}

- (void)enumerateNeighborEdgesAndNodesMatchingFilter:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  id v6 = +[MAElementFilter any];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__MANodeKGImplementation_enumerateNeighborEdgesAndNodesMatchingFilter_usingBlock___block_invoke;
  v8[3] = &unk_1E68DBAF0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(MANodeKGImplementation *)self enumerateEdgesOfType:3 matchingFilter:v6 usingBlock:v8];
}

void __82__MANodeKGImplementation_enumerateNeighborEdgesAndNodesMatchingFilter_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [v4 oppositeNode:*(void *)(*(void *)(a1 + 32) + 8)];
  if (([*(id *)(*(void *)(a1 + 32) + 8) isSameNodeAsNode:v3] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)edgeIdentifiersOfType:(unint64_t)a3 matchingFilter:(id)a4
{
  node = self->_node;
  id v7 = a4;
  v8 = [(MANode *)node graphReference];
  id v9 = [v8 concreteGraph];

  v10 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:[(MANode *)self->_node identifier]];
  id v11 = [v9 edgeIdentifiersOfType:a3 onNodesForIdentifiers:v10 matchingFilter:v7];

  return v11;
}

- (void)enumerateEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1D25FA040]();
  v10 = [(MANode *)self->_node graphReference];
  id v11 = [v10 concreteGraph];

  v12 = [(MANodeKGImplementation *)self edgeIdentifiersOfType:a3 matchingFilter:v13];
  [v11 enumerateEdgesWithIdentifiers:v12 usingBlock:v8];
}

- (void)enumerateNeighborNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = [a4 relationWithType:a3];
  [(MANodeKGImplementation *)self enumerateNodesRelatedWithRelation:v9 usingBlock:v8];
}

- (void)enumerateNeighborEdgesAndNodesThroughEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__MANodeKGImplementation_enumerateNeighborEdgesAndNodesThroughEdgesOfType_matchingFilter_usingBlock___block_invoke;
  v10[3] = &unk_1E68DBAF0;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(MANodeKGImplementation *)self enumerateEdgesOfType:a3 matchingFilter:a4 usingBlock:v10];
}

void __101__MANodeKGImplementation_enumerateNeighborEdgesAndNodesThroughEdgesOfType_matchingFilter_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  id v5 = [v4 oppositeNode:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)hasEdgeOfType:(unint64_t)a3 withNode:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1D25FA040]();
  id v8 = [(MANode *)self->_node graphReference];
  id v9 = [v8 concreteGraph];

  v10 = objc_msgSend(v9, "edgeIdentifiersOfType:sourceNodeIdentifier:targetNodeIdentifier:", a3, -[MANode identifier](self->_node, "identifier"), objc_msgSend(v6, "identifier"));
  LOBYTE(self) = [v10 isEmpty] ^ 1;

  return (char)self;
}

- (void)enumerateEdgesOfType:(unint64_t)a3 withNode:(id)a4 usingBlock:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1D25FA040]();
  v10 = [(MANode *)self->_node graphReference];
  id v11 = [v10 concreteGraph];

  v12 = objc_msgSend(v11, "edgeIdentifiersOfType:sourceNodeIdentifier:targetNodeIdentifier:", a3, -[MANode identifier](self->_node, "identifier"), objc_msgSend(v13, "identifier"));
  [v11 enumerateEdgesWithIdentifiers:v12 usingBlock:v8];
}

- (BOOL)hasEdgeOfType:(unint64_t)a3 matchingFilter:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1D25FA040]();
  id v8 = [(MANodeKGImplementation *)self edgeIdentifiersOfType:a3 matchingFilter:v6];
  LOBYTE(self) = [v8 isEmpty] ^ 1;

  return (char)self;
}

- (unint64_t)countOfEdgesOfType:(unint64_t)a3 matchingFilter:(id)a4
{
  id v4 = [(MANodeKGImplementation *)self edgeIdentifiersOfType:a3 matchingFilter:a4];
  unint64_t v5 = [v4 count];

  return v5;
}

- (MANodeKGImplementation)initWithNode:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MANodeKGImplementation;
  result = [(MANodeKGImplementation *)&v5 init];
  if (result) {
    result->_node = (MANode *)a3;
  }
  return result;
}

@end