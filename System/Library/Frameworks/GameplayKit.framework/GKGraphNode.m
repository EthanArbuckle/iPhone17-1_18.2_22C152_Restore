@interface GKGraphNode
+ (BOOL)supportsSecureCoding;
+ (id)node;
- (GKGraphNode)init;
- (GKGraphNode)initWithCoder:(id)a3;
- (NSArray)connectedNodes;
- (NSArray)findPathFromNode:(GKGraphNode *)startNode;
- (NSArray)findPathToNode:(GKGraphNode *)goalNode;
- (float)costToNode:(GKGraphNode *)node;
- (float)estimatedCostToNode:(GKGraphNode *)node;
- (id)mutConnectedNodes;
- (void)addConnection:(id)a3 bidirectional:(BOOL)a4;
- (void)addConnectionsToNodes:(NSArray *)nodes bidirectional:(BOOL)bidirectional;
- (void)cGraphNode;
- (void)dealloc;
- (void)deleteCGraphNode;
- (void)encodeWithCoder:(id)a3;
- (void)makeCGraphNode;
- (void)removeConnection:(id)a3;
- (void)removeConnectionsToNodes:(NSArray *)nodes bidirectional:(BOOL)bidirectional;
@end

@implementation GKGraphNode

- (void)cGraphNode
{
  return self->_cGraphNode;
}

- (void)makeCGraphNode
{
}

- (void)deleteCGraphNode
{
  cGraphNode = self->_cGraphNode;
  if (cGraphNode) {
    (*(void (**)(void *, SEL))(*(void *)cGraphNode + 8))(cGraphNode, a2);
  }
  self->_cGraphNode = 0;
}

- (NSArray)connectedNodes
{
  return (NSArray *)self->_connectedNodes;
}

- (id)mutConnectedNodes
{
  return self->_connectedNodes;
}

+ (id)node
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (GKGraphNode)init
{
  v7.receiver = self;
  v7.super_class = (Class)GKGraphNode;
  id v2 = [(GKGraphNode *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    connectedNodes = v2->_connectedNodes;
    v2->_connectedNodes = (NSMutableArray *)v3;

    uint64_t v5 = [(GKGraphNode *)v2 makeCGraphNode];
    v2->_cGraphNode = (void *)v5;
    objc_storeWeak((id *)(v5 + 56), v2);
  }
  return v2;
}

- (void)dealloc
{
  [(GKGraphNode *)self deleteCGraphNode];
  v3.receiver = self;
  v3.super_class = (Class)GKGraphNode;
  [(GKGraphNode *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)addConnection:(id)a3 bidirectional:(BOOL)a4
{
  id v6 = a3;
  GKCGraphNode::addConnectionToNode((id *)self->_cGraphNode, (id *)[v6 cGraphNode], a4);
}

- (void)addConnectionsToNodes:(NSArray *)nodes bidirectional:(BOOL)bidirectional
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = nodes;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        GKCGraphNode::addConnectionToNode((id *)self->_cGraphNode, (id *)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "cGraphNode", (void)v10), bidirectional);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)removeConnection:(id)a3
{
  id v4 = a3;
  GKCGraphNode::removeConnectionToNode((id *)self->_cGraphNode, (id *)[v4 cGraphNode], 0);
}

- (void)removeConnectionsToNodes:(NSArray *)nodes bidirectional:(BOOL)bidirectional
{
  uint64_t v9 = nodes;
  int v6 = [(NSArray *)v9 count];
  if (v6 >= 1)
  {
    unint64_t v7 = v6 + 1;
    do
    {
      uint64_t v8 = [(NSArray *)v9 objectAtIndexedSubscript:(v7 - 2)];
      GKCGraphNode::removeConnectionToNode((id *)self->_cGraphNode, (id *)[v8 cGraphNode], bidirectional);

      --v7;
    }
    while (v7 > 1);
  }
}

- (float)estimatedCostToNode:(GKGraphNode *)node
{
  return 0.0;
}

- (float)costToNode:(GKGraphNode *)node
{
  return 1.0;
}

- (NSArray)findPathToNode:(GKGraphNode *)goalNode
{
  id v4 = goalNode;
  __p = 0;
  long long v10 = 0;
  uint64_t v11 = 0;
  GKFindPath((unint64_t)[(GKGraphNode *)self cGraphNode], (uint64_t *)[(GKGraphNode *)v4 cGraphNode], (char **)&__p);
  uint64_t v5 = [MEMORY[0x263EFF980] arrayWithCapacity:(v10 - (unsigned char *)__p) >> 3];
  int v6 = (char *)__p;
  if (__p != v10)
  {
    do
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)v6 + 56));
      [v5 addObject:WeakRetained];

      v6 += 8;
    }
    while (v6 != v10);
  }
  if (__p)
  {
    long long v10 = (char *)__p;
    operator delete(__p);
  }

  return (NSArray *)v5;
}

- (NSArray)findPathFromNode:(GKGraphNode *)startNode
{
  objc_super v3 = [(GKGraphNode *)startNode findPathFromNode:self];

  return (NSArray *)v3;
}

- (GKGraphNode)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(GKGraphNode *)self init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    unint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:11];
    objc_msgSend(v6, "addObjectsFromArray:", v7, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);

    uint64_t v8 = [v4 allowedClasses];
    [v6 unionSet:v8];

    uint64_t v9 = [v4 decodeObjectOfClasses:v6 forKey:@"_connectedNodes"];
    [(GKGraphNode *)v5 addConnectionsToNodes:v9 bidirectional:0];
    long long v10 = [v4 decodeObjectOfClasses:v6 forKey:@"_obstacle"];
    uint64_t v11 = [v4 decodeObjectOfClasses:v6 forKey:@"_extrudedObstacle"];
    if (v10) {
      *((void *)v5->_cGraphNode + 4) = [v10 cPolygonObstacle];
    }
    if (v11) {
      *((void *)v5->_cGraphNode + 5) = [v11 cPolygonObstacle];
    }
    *((_DWORD *)v5->_cGraphNode + 12) = [v4 decodeIntForKey:@"_vertIndex"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeObject:self->_connectedNodes forKey:@"_connectedNodes"];
  cGraphNode = self->_cGraphNode;
  uint64_t v5 = cGraphNode[4];
  if (v5)
  {
    [v7 encodeObject:*(void *)(v5 + 64) forKey:@"_obstacle"];
    cGraphNode = self->_cGraphNode;
  }
  uint64_t v6 = cGraphNode[5];
  if (v6)
  {
    [v7 encodeObject:*(void *)(v6 + 64) forKey:@"_extrudedObstacle"];
    cGraphNode = self->_cGraphNode;
  }
  [v7 encodeInt:*((unsigned int *)cGraphNode + 12) forKey:@"_vertIndex"];
}

- (void).cxx_destruct
{
}

@end