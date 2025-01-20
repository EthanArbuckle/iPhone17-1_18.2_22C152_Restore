@interface GKGridGraph
+ (BOOL)supportsSecureCoding;
+ (GKGridGraph)graphFromGridStartingAt:(vector_int2)position width:(int)width height:(int)height diagonalsAllowed:(BOOL)diagonalsAllowed;
+ (GKGridGraph)graphFromGridStartingAt:(vector_int2)position width:(int)width height:(int)height diagonalsAllowed:(BOOL)diagonalsAllowed nodeClass:(Class)nodeClass;
- (BOOL)diagonalsAllowed;
- (Class)classForGenericArgumentAtIndex:(NSUInteger)index;
- (GKGridGraph)initFromGridStartingAt:(vector_int2)position width:(int)width height:(int)height diagonalsAllowed:(BOOL)diagonalsAllowed;
- (GKGridGraph)initFromGridStartingAt:(vector_int2)position width:(int)width height:(int)height diagonalsAllowed:(BOOL)diagonalsAllowed nodeClass:(Class)nodeClass;
- (GKGridGraph)initWithCoder:(id)a3;
- (NSUInteger)gridHeight;
- (NSUInteger)gridWidth;
- (id)nodeAtGridPosition:(vector_int2)position;
- (id)nodeAtGridPositionNoNilCheck:(GKGridGraph *)self;
- (vector_int2)gridOrigin;
- (void)cGridGraph;
- (void)connectNodeToAdjacentNodes:(GKGridGraphNode *)node;
- (void)encodeWithCoder:(id)a3;
- (void)makeCGraph;
- (void)removeNodes:(id)a3;
@end

@implementation GKGridGraph

- (void)makeCGraph
{
}

- (vector_int2)gridOrigin
{
  return *(vector_int2 *)((char *)self->_cGridGraph + 40);
}

- (NSUInteger)gridWidth
{
  return *((unsigned int *)self->_cGridGraph + 12);
}

- (NSUInteger)gridHeight
{
  return *((unsigned int *)self->_cGridGraph + 13);
}

- (void)cGridGraph
{
  return self->_cGridGraph;
}

+ (GKGridGraph)graphFromGridStartingAt:(vector_int2)position width:(int)width height:(int)height diagonalsAllowed:(BOOL)diagonalsAllowed
{
  v6 = [[GKGridGraph alloc] initFromGridStartingAt:*(void *)&width width:*(void *)&height height:diagonalsAllowed diagonalsAllowed:*(double *)&position];

  return v6;
}

- (GKGridGraph)initFromGridStartingAt:(vector_int2)position width:(int)width height:(int)height diagonalsAllowed:(BOOL)diagonalsAllowed
{
  return [(GKGridGraph *)self initFromGridStartingAt:*(void *)&width width:*(void *)&height height:diagonalsAllowed diagonalsAllowed:objc_opt_class() nodeClass:*(double *)&position];
}

+ (GKGridGraph)graphFromGridStartingAt:(vector_int2)position width:(int)width height:(int)height diagonalsAllowed:(BOOL)diagonalsAllowed nodeClass:(Class)nodeClass
{
  v7 = [[GKGridGraph alloc] initFromGridStartingAt:*(void *)&width width:*(void *)&height height:diagonalsAllowed diagonalsAllowed:nodeClass nodeClass:*(double *)&position];

  return v7;
}

- (GKGridGraph)initFromGridStartingAt:(vector_int2)position width:(int)width height:(int)height diagonalsAllowed:(BOOL)diagonalsAllowed nodeClass:(Class)nodeClass
{
  if (([(objc_class *)nodeClass isSubclassOfClass:objc_opt_class()] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"initFromGridStartingAt: nodeClass does not descend from GKGridGraph"];
  }
  v16.receiver = self;
  v16.super_class = (Class)GKGridGraph;
  id v13 = [(GKGraph *)&v16 init];
  v14 = (GKGridGraph *)v13;
  if (v13) {
    GKCGridGraph::init(*((void *)v13 + 4), width, height, diagonalsAllowed, nodeClass, *(double *)&position);
  }
  return v14;
}

- (id)nodeAtGridPosition:(vector_int2)position
{
  WeakRetained = (id *)GKCGridGraph::nodeAtGridPosition((uint64_t)self->_cGridGraph, *(double *)&position);
  if (WeakRetained) {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 9);
  }

  return WeakRetained;
}

- (id)nodeAtGridPositionNoNilCheck:(GKGridGraph *)self
{
  uint64_t v3 = GKCGridGraph::nodeAtGridPositionNoNullCheck((int32x2_t *)self->_cGridGraph, v2);
  id WeakRetained = objc_loadWeakRetained((id *)(v3 + 72));

  return WeakRetained;
}

- (void)connectNodeToAdjacentNodes:(GKGridGraphNode *)node
{
  v4 = node;
  GKCGridGraph::connectNodeToAdjacentNodes((GKCGridGraph *)self->_cGridGraph, (int32x2_t *)[(GKGridGraphNode *)v4 cGridGraphNode]);
}

- (void)removeNodes:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        (*(void (**)(void *, uint64_t))(*(void *)self->_cGridGraph + 16))(self->_cGridGraph, objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "cGraphNode", (void)v8));
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGridGraph)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GKGridGraph;
  id v5 = [(GKGraph *)&v28 initWithCoder:v4];
  if (v5)
  {
    unsigned int v6 = [v4 decodeIntForKey:@"gridOriginX"];
    unsigned int v7 = [v4 decodeIntForKey:@"gridOriginY"];
    int v8 = [v4 decodeIntForKey:@"gridWidth"];
    int v9 = [v4 decodeIntForKey:@"gridHeight"];
    char v22 = [v4 decodeBoolForKey:@"diagonalsAllowed"];
    long long v10 = (void *)*((void *)v5 + 4);
    uint64_t v11 = objc_opt_class();
    GKCGridGraph::initDontConstructNodes(v10, v8, v9, v22, v11, COERCE_DOUBLE(__PAIR64__(v7, v6)));
    v12 = [MEMORY[0x263EFF980] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v13 = [v5 nodes];
    int v20 = v9;
    int v21 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v13);
          }
          v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ((GKCGridGraph::addNodeToGridNodes(*((int32x2_t **)v5 + 4), (int32x2_t *)[v17 cGridGraphNode]) & 1) == 0)objc_msgSend(v12, "addObject:", v17); {
        }
          }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v14);
    }

    v23.receiver = v5;
    v23.super_class = (Class)GKGridGraph;
    [(GKGraph *)&v23 removeNodes:v12];
    uint64_t v18 = *((void *)v5 + 4);
    *(_DWORD *)(v18 + 48) = v21;
    *(_DWORD *)(v18 + 52) = v20;
    *(unsigned char *)(v18 + 56) = v22;
  }
  return (GKGridGraph *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)GKGridGraph;
  [(GKGraph *)&v5 encodeWithCoder:v4];
  [v4 encodeInt:*((void *)self->_cGridGraph + 5) forKey:@"gridOriginX"];
  [v4 encodeInt:*((unsigned int *)self->_cGridGraph + 11) forKey:@"gridOriginY"];
  [v4 encodeInt:*((unsigned int *)self->_cGridGraph + 12) forKey:@"gridWidth"];
  [v4 encodeInt:*((unsigned int *)self->_cGridGraph + 13) forKey:@"gridHeight"];
  [v4 encodeBool:*((unsigned __int8 *)self->_cGridGraph + 56) forKey:@"diagonalsAllowed"];
}

- (Class)classForGenericArgumentAtIndex:(NSUInteger)index
{
  return (Class)*((id *)self->_cGridGraph + 11);
}

- (BOOL)diagonalsAllowed
{
  return self->_diagonalsAllowed;
}

@end