@interface GKGraph
+ (BOOL)supportsSecureCoding;
+ (GKGraph)graphWithNodes:(NSArray *)nodes;
+ (id)graph;
- (GKGraph)init;
- (GKGraph)initWithCoder:(id)a3;
- (GKGraph)initWithNodes:(NSArray *)nodes;
- (NSArray)findPathFromNode:(GKGraphNode *)startNode toNode:(GKGraphNode *)endNode;
- (NSArray)nodes;
- (NSMutableDictionary)_info;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)nodesMut;
- (void)addNodes:(NSArray *)nodes;
- (void)cGraph;
- (void)connectNodeToLowestCostNode:(GKGraphNode *)node bidirectional:(BOOL)bidirectional;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)makeCGraph;
- (void)removeNodes:(NSArray *)nodes;
- (void)set_info:(id)a3;
@end

@implementation GKGraph

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)makeCGraph
{
}

- (void)cGraph
{
  return self->_cGraph;
}

- (NSArray)nodes
{
  return (NSArray *)self->_nodes;
}

- (id)nodesMut
{
  return self->_nodes;
}

+ (id)graph
{
  v2 = objc_alloc_init(GKGraph);

  return v2;
}

- (void)dealloc
{
  cGraph = self->_cGraph;
  if (cGraph) {
    (*(void (**)(void *, SEL))(*(void *)cGraph + 8))(cGraph, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKGraph;
  [(GKGraph *)&v4 dealloc];
}

- (GKGraph)init
{
  v7.receiver = self;
  v7.super_class = (Class)GKGraph;
  v2 = [(GKGraph *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    nodes = v2->_nodes;
    v2->_nodes = (NSMutableArray *)v3;

    uint64_t v5 = [(GKGraph *)v2 makeCGraph];
    v2->_cGraph = (void *)v5;
    objc_storeWeak((id *)(v5 + 32), v2);
  }
  return v2;
}

+ (GKGraph)graphWithNodes:(NSArray *)nodes
{
  uint64_t v3 = nodes;
  objc_super v4 = [[GKGraph alloc] initWithNodes:v3];

  return v4;
}

- (GKGraph)initWithNodes:(NSArray *)nodes
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v4 = nodes;
  uint64_t v5 = [(GKGraph *)self init];
  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = v4;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          GKCGraph::addNode((GKCGraph *)v5->_cGraph, (id *)objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "cGraphNode", (void)v11));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

- (void)connectNodeToLowestCostNode:(GKGraphNode *)node bidirectional:(BOOL)bidirectional
{
  v6 = node;
  GKCGraph::connectNodeToLowestCostNode((GKCGraph *)self->_cGraph, (id *)[(GKGraphNode *)v6 cGraphNode], bidirectional);
}

- (void)removeNodes:(NSArray *)nodes
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v4 = nodes;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void *, uint64_t))(*(void *)self->_cGraph + 16))(self->_cGraph, objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "cGraphNode", (void)v8));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)addNodes:(NSArray *)nodes
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v4 = nodes;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        GKCGraph::addNode((GKCGraph *)self->_cGraph, (id *)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "cGraphNode", (void)v8));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (NSArray)findPathFromNode:(GKGraphNode *)startNode toNode:(GKGraphNode *)endNode
{
  objc_super v4 = [(GKGraphNode *)startNode findPathToNode:endNode];

  return (NSArray *)v4;
}

- (GKGraph)initWithCoder:(id)a3
{
  v34[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(GKGraph *)self initWithNodes:MEMORY[0x263EFFA68]];
  if (v5)
  {
    id v26 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v34[2] = objc_opt_class();
    v34[3] = objc_opt_class();
    v34[4] = objc_opt_class();
    v34[5] = objc_opt_class();
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:6];
    [v26 addObjectsFromArray:v6];

    uint64_t v7 = [v4 allowedClasses];
    [v26 unionSet:v7];

    long long v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    long long v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    id v32 = 0;
    long long v11 = [v4 decodeTopLevelObjectOfClasses:v10 forKey:@"_nodes" error:&v32];
    id v12 = v32;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v11;
      uint64_t v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v25, "count"));
      nodes = v5->_nodes;
      v5->_nodes = (NSMutableArray *)v13;

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v15 = (NSMutableArray *)v25;
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v29;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v29 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * v18);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(NSMutableArray *)v5->_nodes addObject:v19];
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v16);
      }
    }
    else
    {
      uint64_t v20 = [MEMORY[0x263EFF980] array];
      v15 = v5->_nodes;
      v5->_nodes = (NSMutableArray *)v20;
    }

    id v27 = v12;
    uint64_t v21 = [v4 decodeTopLevelObjectOfClasses:v26 forKey:@"_info" error:&v27];
    id v22 = v27;

    info = v5->__info;
    v5->__info = (NSMutableDictionary *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_nodes forKey:@"_nodes"];
  [v4 encodeObject:self->__info forKey:@"_info"];
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x237DF7AF0](self, a2);

  return [(GKGraph *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  id v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];

  return v4;
}

- (NSMutableDictionary)_info
{
  return self->__info;
}

- (void)set_info:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__info, 0);

  objc_storeStrong((id *)&self->_nodes, 0);
}

@end