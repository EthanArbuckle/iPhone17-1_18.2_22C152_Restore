@interface GVGraph
- (BOOL)hasEdgeFrom:(id)a3 to:(id)a4;
- (BOOL)hasNode:(id)a3;
- (BOOL)render:(id)a3;
- (CGRect)bounds;
- (GVGraph)init;
- (NSMutableOrderedSet)edges;
- (NSMutableOrderedSet)nodes;
- (id)allEdges;
- (id)allNodes;
- (id)connectedSubgraphs;
- (id)description;
- (id)edgeFrom:(id)a3 to:(id)a4;
- (void)addEdgeFrom:(id)a3 to:(id)a4;
- (void)addEdgeFrom:(id)a3 to:(id)a4 reversed:(BOOL)a5;
- (void)addNode:(id)a3;
- (void)dealloc;
- (void)iterateOverAllEdges:(id)a3;
- (void)iterateOverAllNodes:(id)a3;
- (void)removeEdgeFrom:(id)a3 to:(id)a4;
- (void)removeNode:(id)a3;
- (void)reverseEdge:(id)a3;
- (void)setEdges:(id)a3;
- (void)setNodes:(id)a3;
- (void)undoReverseEdge:(id)a3;
@end

@implementation GVGraph

- (GVGraph)init
{
  v4.receiver = self;
  v4.super_class = (Class)GVGraph;
  v2 = [(GVGraph *)&v4 init];
  if (v2)
  {
    v2->nodes = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v2->edges = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GVGraph;
  [(GVGraph *)&v3 dealloc];
}

- (id)allNodes
{
  return (id)[(NSMutableOrderedSet *)self->nodes array];
}

- (BOOL)hasNode:(id)a3
{
  return [(NSMutableOrderedSet *)self->nodes containsObject:a3];
}

- (void)addNode:(id)a3
{
}

- (void)removeNode:(id)a3
{
}

- (id)allEdges
{
  return (id)[(NSMutableOrderedSet *)self->edges array];
}

- (id)edgeFrom:(id)a3 to:(id)a4
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  uint64_t v13 = 0;
  edges = self->edges;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __23__GVGraph_edgeFrom_to___block_invoke;
  v7[3] = &unk_1E6CD53F0;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = &v8;
  [(NSMutableOrderedSet *)edges enumerateObjectsUsingBlock:v7];
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __23__GVGraph_edgeFrom_to___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 from];
  if (result == a1[4])
  {
    uint64_t result = [a2 to];
    if (result == a1[5])
    {
      *(void *)(*(void *)(a1[6] + 8) + 40) = a2;
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)hasEdgeFrom:(id)a3 to:(id)a4
{
  if (!-[NSMutableOrderedSet containsObject:](self->nodes, "containsObject:")
    || ![(NSMutableOrderedSet *)self->nodes containsObject:a4])
  {
    return 0;
  }

  return [a3 hasEdgeTo:a4];
}

- (void)addEdgeFrom:(id)a3 to:(id)a4
{
  -[NSMutableOrderedSet addObject:](self->nodes, "addObject:");
  [(NSMutableOrderedSet *)self->nodes addObject:a4];
  if (([a3 hasEdgeTo:a4] & 1) == 0)
  {
    [(NSMutableOrderedSet *)self->edges addObject:[[GVEdge alloc] initWithFromNode:a3 to:a4]];
    [a3 addEdgeTo:a4];
  }
}

- (void)removeEdgeFrom:(id)a3 to:(id)a4
{
  if (-[GVGraph hasEdgeFrom:to:](self, "hasEdgeFrom:to:"))
  {
    [(NSMutableOrderedSet *)self->edges removeObject:[(GVGraph *)self edgeFrom:a3 to:a4]];
    [a3 removeEdgeTo:a4];
  }
}

- (void)addEdgeFrom:(id)a3 to:(id)a4 reversed:(BOOL)a5
{
  BOOL v5 = a5;
  -[NSMutableOrderedSet addObject:](self->nodes, "addObject:");
  [(NSMutableOrderedSet *)self->nodes addObject:a4];
  if (([a3 hasEdgeTo:a4] & 1) == 0)
  {
    v9 = [[GVEdge alloc] initWithFromNode:a3 to:a4];
    [(GVEdge *)v9 setReversed:v5];
    [(NSMutableOrderedSet *)self->edges addObject:v9];
    [a3 addEdgeTo:a4];
  }
}

- (void)reverseEdge:(id)a3
{
  if (([a3 reversed] & 1) == 0)
  {
    uint64_t v5 = [a3 from];
    uint64_t v6 = [a3 to];
    [(GVGraph *)self removeEdgeFrom:v5 to:v6];
    [(GVGraph *)self addEdgeFrom:v6 to:v5 reversed:1];
  }
}

- (void)undoReverseEdge:(id)a3
{
  if ([a3 reversed])
  {
    uint64_t v5 = [a3 from];
    uint64_t v6 = [a3 to];
    [(GVGraph *)self removeEdgeFrom:v5 to:v6];
    [(GVGraph *)self addEdgeFrom:v6 to:v5 reversed:0];
  }
}

- (id)connectedSubgraphs
{
  return 0;
}

- (CGRect)bounds
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  nodes = self->nodes;
  uint64_t v3 = [(NSMutableOrderedSet *)nodes countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v27;
    double v6 = 1.79769313e308;
    double v7 = -1.79769313e308;
    double v8 = -1.79769313e308;
    double v9 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(nodes);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v11 x];
        if (v9 >= v12) {
          double v9 = v12;
        }
        [v11 x];
        double v14 = v13;
        [v11 w];
        double v16 = v14 + v15;
        if (v8 < v16) {
          double v8 = v16;
        }
        [v11 y];
        if (v6 >= v17) {
          double v6 = v17;
        }
        [v11 y];
        double v19 = v18;
        [v11 h];
        double v21 = v19 + v20;
        if (v7 < v21) {
          double v7 = v21;
        }
      }
      uint64_t v4 = [(NSMutableOrderedSet *)nodes countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 1.79769313e308;
    double v7 = -1.79769313e308;
    double v8 = -1.79769313e308;
    double v9 = 1.79769313e308;
  }
  double v22 = v8 - v9;
  double v23 = v7 - v6;
  double v24 = v9;
  double v25 = v6;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (BOOL)render:(id)a3
{
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = [a3 direction];
  }
  else {
    uint64_t v5 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    [a3 separation];
  }
  else
  {
    double v6 = 50.0;
    double v7 = 50.0;
  }
  +[GVLayout layoutGraph:withDirection:separation:](GVLayout, "layoutGraph:withDirection:separation:", self, v5, v6, v7);
  int v10 = [a3 setCanvasWidth:v8 height:v9];
  if (v10) {
    +[GVInternalRenderer render:self renderer:a3];
  }
  return v10;
}

- (void)iterateOverAllEdges:(id)a3
{
}

- (void)iterateOverAllNodes:(id)a3
{
}

- (id)description
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend((id)objc_msgSend(NSString, "string"), "stringByAppendingString:", @"\nNodes:\n\n");
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  nodes = self->nodes;
  uint64_t v5 = [(NSMutableOrderedSet *)nodes countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(nodes);
        }
        uint64_t v3 = objc_msgSend((id)objc_msgSend(v3, "stringByAppendingString:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "description")), "stringByAppendingString:", @"\n");
      }
      uint64_t v6 = [(NSMutableOrderedSet *)nodes countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
  double v9 = (void *)[v3 stringByAppendingString:@"\nEdges:\n\n"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  edges = self->edges;
  uint64_t v11 = [(NSMutableOrderedSet *)edges countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(edges);
        }
        double v9 = objc_msgSend((id)objc_msgSend(v9, "stringByAppendingString:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "description")), "stringByAppendingString:", @"\n");
      }
      uint64_t v12 = [(NSMutableOrderedSet *)edges countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
  return v9;
}

- (NSMutableOrderedSet)nodes
{
  return self->nodes;
}

- (void)setNodes:(id)a3
{
}

- (NSMutableOrderedSet)edges
{
  return self->edges;
}

- (void)setEdges:(id)a3
{
}

@end