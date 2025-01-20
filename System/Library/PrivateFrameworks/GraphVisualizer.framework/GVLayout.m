@interface GVLayout
+ (CGSize)layoutGraph:(id)a3 withDirection:(int)a4 separation:(CGSize)a5;
- (CGSize)doLayout:(id)a3 direction:(int)a4 separation:(CGSize)a5;
- (CGSize)separation;
- (GVGraph)graph;
- (NSMutableArray)ranks;
- (NSMutableArray)selfEdges;
- (int)direction;
- (unint64_t)crossings;
- (unint64_t)medianValueOf:(id)a3 withRespectTo:(id)a4;
- (void)_removeCycleDFS:(id)a3 visistedNodes:(id)a4 nodesInStack:(id)a5;
- (void)assignCoordinates;
- (void)assignNodeCoordinates;
- (void)assignNodePriorities;
- (void)assignRankCoordinates;
- (void)assignRanks;
- (void)balanceRanks;
- (void)buildRankIterators;
- (void)commitOrder;
- (void)dealloc;
- (void)initializeNodeCoordinates;
- (void)initializeOrder;
- (void)initializeRanks;
- (void)makeFeasibleTree;
- (void)medianPosition:(unint64_t)a3;
- (void)medianSort:(id)a3 withRespectTo:(id)a4;
- (void)normalizeRanks;
- (void)orderVertices;
- (void)packCutX:(unint64_t)a3;
- (void)packCutY:(unint64_t)a3;
- (void)removeCycles;
- (void)removeSelfEdges;
- (void)restoreOrder;
- (void)saveOrder;
- (void)setDirection:(int)a3;
- (void)setGraph:(id)a3;
- (void)setRanks:(id)a3;
- (void)setSelfEdges:(id)a3;
- (void)setSeparation:(CGSize)a3;
- (void)straightenX;
- (void)straightenY;
- (void)transpose;
- (void)undoRemoveCycles;
- (void)undoRemoveSelfEdges;
- (void)weightedMedian:(unint64_t)a3;
@end

@implementation GVLayout

- (void)dealloc
{
  savedOrder = self->savedOrder;
  if (savedOrder) {
    free(savedOrder);
  }
  v4.receiver = self;
  v4.super_class = (Class)GVLayout;
  [(GVLayout *)&v4 dealloc];
}

+ (CGSize)layoutGraph:(id)a3 withDirection:(int)a4 separation:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v7 = *(void *)&a4;
  v9 = objc_alloc_init(GVLayout);
  -[GVLayout doLayout:direction:separation:](v9, "doLayout:direction:separation:", a3, v7, width, height);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGSize)doLayout:(id)a3 direction:(int)a4 separation:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  double v10 = (void *)MEMORY[0x1E01BCE50](self, a2);
  self->graph = (GVGraph *)a3;
  self->direction = a4;
  self->separation.CGFloat width = width;
  self->separation.CGFloat height = height;
  [(GVLayout *)self removeSelfEdges];
  [(GVLayout *)self removeCycles];
  [(GVLayout *)self assignRanks];
  [(GVLayout *)self orderVertices];
  [(GVLayout *)self assignCoordinates];
  [(GVLayout *)self undoRemoveCycles];
  [(GVLayout *)self undoRemoveCycles];
  [(GVGraph *)self->graph bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  BOOL v20 = fabs(v11) <= 2.22044605e-16;
  double v19 = fabs(v13);
  BOOL v20 = v20 && v19 <= 2.22044605e-16;
  if (!v20)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v21 = [(GVGraph *)self->graph nodes];
    uint64_t v22 = [(NSMutableOrderedSet *)v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          [v26 x];
          [v26 setX:v27 - v12];
          [v26 y];
          [v26 setY:v28 - v14];
        }
        uint64_t v23 = [(NSMutableOrderedSet *)v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v23);
    }
  }
  double v29 = v16;
  double v30 = v18;
  result.CGFloat height = v30;
  result.CGFloat width = v29;
  return result;
}

- (void)removeSelfEdges
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->selfEdges = (NSMutableArray *)[MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(GVGraph *)self->graph edges];
  uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v9 = [v8 from];
        if (v9 == [v8 to])
        {
          [(NSMutableArray *)self->selfEdges addObject:v8];
          -[GVGraph removeEdgeFrom:to:](self->graph, "removeEdgeFrom:to:", [v8 from], objc_msgSend(v8, "to"));
        }
      }
      uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)undoRemoveSelfEdges
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  selfEdges = self->selfEdges;
  uint64_t v4 = [(NSMutableArray *)selfEdges countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(selfEdges);
        }
        -[GVGraph addEdgeFrom:to:](self->graph, "addEdgeFrom:to:", [*(id *)(*((void *)&v8 + 1) + 8 * i) from], objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "to"));
      }
      uint64_t v5 = [(NSMutableArray *)selfEdges countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->selfEdges removeAllObjects];
}

- (void)_removeCycleDFS:(id)a3 visistedNodes:(id)a4 nodesInStack:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(a4, "containsObject:") & 1) == 0)
  {
    [a4 addObject:a3];
    [a5 addObject:a3];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v9 = objc_msgSend(a3, "outNodes", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if ([a5 containsObject:v14])
          {
            [(GVGraph *)self->graph reverseEdge:[(GVGraph *)self->graph edgeFrom:a3 to:v14]];
          }
          else if (([a4 containsObject:v14] & 1) == 0)
          {
            [(GVLayout *)self _removeCycleDFS:v14 visistedNodes:a4 nodesInStack:a5];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
    [a5 removeObject:a3];
  }
}

- (void)removeCycles
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = objc_msgSend(-[GVGraph allNodes](self->graph, "allNodes"), "mutableCopy");
  [v5 sortUsingComparator:&__block_literal_global_156];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GVLayout *)self _removeCycleDFS:*(void *)(*((void *)&v10 + 1) + 8 * v9++) visistedNodes:v3 nodesInStack:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)undoRemoveCycles
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(GVGraph *)self->graph edges];
  uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(GVGraph *)self->graph undoReverseEdge:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)assignRanks
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(GVLayout *)self makeFeasibleTree];
  [(GVLayout *)self minimizeCutValues];
  [(GVLayout *)self normalizeRanks];
  [(GVLayout *)self balanceRanks];
  [(GVLayout *)self buildRankIterators];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = [(GVGraph *)self->graph edges];
  uint64_t v3 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      uint64_t v17 = v4;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
        long long v8 = (GVDummyNode *)[v7 from];
        long long v9 = (void *)[v7 to];
        uint64_t v10 = [(GVNode *)v8 rank];
        uint64_t v11 = [v9 rank];
        if ((unint64_t)(v11 - v10) >= 2)
        {
          unint64_t v12 = v11;
          [(GVNode *)v8 removeEdgeTo:v9];
          unint64_t v13 = v10 + 1;
          if (v13 >= v12)
          {
            uint64_t v15 = v8;
          }
          else
          {
            do
            {
              uint64_t v14 = (void *)[(NSMutableArray *)self->ranks objectAtIndexedSubscript:v13];
              uint64_t v15 = objc_alloc_init(GVDummyNode);
              [v14 sizeForDummy];
              -[GVNode setSize:](v15, "setSize:");
              [(GVGraph *)self->graph addNode:v15];
              [(GVNode *)v8 addEdgeTo:v15];
              objc_msgSend((id)objc_msgSend(v7, "dummies"), "addObject:", v15);
              [v14 addNode:v15];
              [(GVNode *)v15 setRank:v13];

              ++v13;
              long long v8 = v15;
            }
            while (v12 != v13);
          }
          [(GVNode *)v15 addEdgeTo:v9];
          uint64_t v5 = v16;
          uint64_t v4 = v17;
        }
        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }
}

- (void)initializeRanks
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableOrderedSet *)[(GVGraph *)self->graph nodes] count];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v5 = [(GVGraph *)self->graph nodes];
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "setIndex:", objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "inDegree"));
      }
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v7);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v10 = [(GVGraph *)self->graph nodes];
  uint64_t v11 = [(NSMutableOrderedSet *)v10 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        if (![v15 index]) {
          [v4 addObject:v15];
        }
      }
      uint64_t v12 = [(NSMutableOrderedSet *)v10 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v12);
  }
  while ([v4 count])
  {
    uint64_t v16 = (void *)[v4 firstObject];
    [v4 removeObjectAtIndex:0];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v17 = (void *)[v16 inNodes];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v50 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v19; ++k)
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v37 + 1) + 8 * k);
          uint64_t v23 = [v16 rank];
          uint64_t v24 = [v22 rank];
          if (v23 <= v24 + 1) {
            uint64_t v25 = v24 + 1;
          }
          else {
            uint64_t v25 = v23;
          }
          [v16 setRank:v25];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v50 count:16];
      }
      while (v19);
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v26 = objc_msgSend(v16, "outNodes", 0);
    uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v34;
      do
      {
        for (uint64_t m = 0; m != v28; ++m)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = *(void **)(*((void *)&v33 + 1) + 8 * m);
          uint64_t v32 = [v31 index];
          [v31 setIndex:v32 - 1];
          if (v32 <= 1) {
            [v4 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
      }
      while (v28);
    }
  }
}

- (void)makeFeasibleTree
{
}

uint64_t __28__GVLayout_makeFeasibleTree__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = [MEMORY[0x1E4F1CA80] setWithObject:a2];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0xFFFFFFFFLL;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__GVLayout_makeFeasibleTree__block_invoke_2;
  v9[3] = &unk_1E6CD5438;
  v9[4] = v7;
  v9[5] = v10;
  v9[6] = a3;
  v9[7] = a4;
  [a2 traversePreorder:2 withCallback:v9 randomize:0];
  _Block_object_dispose(v10, 8);
  return v7;
}

uint64_t __28__GVLayout_makeFeasibleTree__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if (!a3) {
    return 0;
  }
  uint64_t v6 = [a3 rank];
  uint64_t v7 = [a2 rank];
  uint64_t v8 = v6 - v7;
  if (v6 - v7 < 0) {
    uint64_t v8 = v7 - v6;
  }
  unint64_t v9 = v8 - 1;
  if (v9)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v9 < *(void *)(v10 + 24))
    {
      *(void *)(v10 + 24) = v9;
      **(void **)(a1 + 48) = a3;
      **(void **)(a1 + 56) = a2;
    }
    return 1;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:a2];
    return 0;
  }
}

- (void)normalizeRanks
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v3 = [(GVGraph *)self->graph nodes];
  uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    uint64_t v7 = -2147483647;
    uint64_t v8 = 0x7FFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v10 rank] > v7) {
          uint64_t v7 = [v10 rank];
        }
        if ([v10 rank] < v8) {
          uint64_t v8 = [v10 rank];
        }
      }
      uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v7 = -2147483647;
    uint64_t v8 = 0x7FFFFFFFLL;
  }
  uint64_t v11 = v7 - v8 + 1;
  self->ranks = (NSMutableArray *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
  uint64_t v12 = objc_opt_class();
  if (v7 - v8 != -1)
  {
    uint64_t v13 = (objc_class *)v12;
    do
    {
      -[NSMutableArray addObject:](self->ranks, "addObject:", objc_msgSend([v13 alloc], "initWithSeparation:", self->separation.width, self->separation.height));
      --v11;
    }
    while (v11);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v14 = [(GVGraph *)self->graph nodes];
  uint64_t v15 = [(NSMutableOrderedSet *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v20 + 1) + 8 * j);
        objc_msgSend(v19, "setRank:", objc_msgSend(v19, "rank") - v8);
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->ranks, "objectAtIndexedSubscript:", objc_msgSend(v19, "rank")), "addNode:", v19);
      }
      uint64_t v16 = [(NSMutableOrderedSet *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }
}

- (void)balanceRanks
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = [(GVGraph *)self->graph nodes];
  uint64_t v3 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v6, "inNodes"), "count"))
        {
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          uint64_t v7 = (void *)[v6 inNodes];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v32;
            uint64_t v11 = -2147483647;
            do
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v32 != v10) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v13 = [*(id *)(*((void *)&v31 + 1) + 8 * j) rank];
                if (v13 > v11) {
                  uint64_t v11 = v13;
                }
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v40 count:16];
            }
            while (v9);
          }
          else
          {
            uint64_t v11 = -2147483647;
          }
          unint64_t v14 = v11 + 1;
        }
        else
        {
          unint64_t v14 = -2147483647;
        }
        if (objc_msgSend((id)objc_msgSend(v6, "outNodes"), "count"))
        {
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v15 = (void *)[v6 outNodes];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v28;
            uint64_t v19 = 0x7FFFFFFFLL;
            do
            {
              for (uint64_t k = 0; k != v17; ++k)
              {
                if (*(void *)v28 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v21 = [*(id *)(*((void *)&v27 + 1) + 8 * k) rank];
                if (v21 < v19) {
                  uint64_t v19 = v21;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
            }
            while (v17);
          }
          else
          {
            uint64_t v19 = 0x7FFFFFFFLL;
          }
          if (v14 != -2147483647)
          {
            unint64_t v22 = v19 - 1;
            if (v14 != v22)
            {
              uint64_t v23 = [v6 rank];
              while (v14 <= v22)
              {
                unint64_t v24 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->ranks, "objectAtIndexedSubscript:", v14), "nodes"), "count");
                if (v24 < objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->ranks, "objectAtIndexedSubscript:", v23), "nodes"), "count"))uint64_t v23 = v14; {
                ++v14;
                }
              }
              objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->ranks, "objectAtIndexedSubscript:", objc_msgSend(v6, "rank")), "removeNode:", v6);
              [v6 setRank:v23];
              objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->ranks, "objectAtIndexedSubscript:", objc_msgSend(v6, "rank")), "addNode:", v6);
            }
          }
        }
      }
      uint64_t v4 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v4);
  }
}

- (void)buildRankIterators
{
  uint64_t v3 = (void *)[(NSMutableArray *)self->ranks objectEnumerator];
  uint64_t v4 = (void *)[v3 nextObject];
  if (v4)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = v4;
      [v4 setPrev:v5];
      uint64_t v4 = (void *)[v3 nextObject];
      uint64_t v5 = v6;
    }
    while (v4);
  }
  uint64_t v7 = (void *)[(NSMutableArray *)self->ranks reverseObjectEnumerator];
  uint64_t v8 = (void *)[v7 nextObject];
  if (v8)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = v8;
      [v8 setNext:v9];
      uint64_t v8 = (void *)[v7 nextObject];
      uint64_t v9 = v10;
    }
    while (v8);
  }
}

- (void)orderVertices
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(GVLayout *)self initializeOrder];
  uint64_t v3 = (char *)&v15
     - ((8 * [(NSMutableOrderedSet *)[(GVGraph *)self->graph nodes] count] + 15) & 0xFFFFFFFFFFFFFFF0);
  if ([(NSMutableOrderedSet *)[(GVGraph *)self->graph nodes] count])
  {
    unint64_t v4 = 0;
    do
    {
      *(void *)&v3[8 * v4] = objc_msgSend((id)-[NSMutableOrderedSet objectAtIndexedSubscript:](-[GVGraph nodes](self->graph, "nodes"), "objectAtIndexedSubscript:", v4), "index");
      ++v4;
    }
    while (v4 < [(NSMutableOrderedSet *)[(GVGraph *)self->graph nodes] count]);
  }
  if (self->currentCrossings)
  {
    for (uint64_t i = 0; i != 24; ++i)
    {
      [(GVLayout *)self weightedMedian:i];
      [(GVLayout *)self transpose];
    }
    [(GVLayout *)self commitOrder];
    unint64_t v6 = [(GVLayout *)self crossings];
    if (v6 < self->currentCrossings)
    {
      self->currentCrossings = v6;
      [(GVLayout *)self saveOrder];
    }
    if ([(NSMutableOrderedSet *)[(GVGraph *)self->graph nodes] count])
    {
      unint64_t v7 = 0;
      do
      {
        objc_msgSend((id)-[NSMutableOrderedSet objectAtIndexedSubscript:](-[GVGraph nodes](self->graph, "nodes"), "objectAtIndexedSubscript:", v7), "setIndex:", *(void *)&v3[8 * v7]);
        ++v7;
      }
      while (v7 < [(NSMutableOrderedSet *)[(GVGraph *)self->graph nodes] count]);
    }
    for (uint64_t j = 1; j != 25; ++j)
    {
      [(GVLayout *)self weightedMedian:j];
      [(GVLayout *)self transpose];
    }
    [(GVLayout *)self commitOrder];
    unint64_t v9 = [(GVLayout *)self crossings];
    if (v9 >= self->currentCrossings) {
      [(GVLayout *)self restoreOrder];
    }
    else {
      self->currentCrossings = v9;
    }
    [(GVLayout *)self commitOrder];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  ranks = self->ranks;
  uint64_t v11 = [(NSMutableArray *)ranks countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(ranks);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) buildNodeIterators];
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)ranks countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (unint64_t)crossings
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  ranks = self->ranks;
  uint64_t v3 = [(NSMutableArray *)ranks countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  unint64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(ranks);
      }
      v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) inCrossings];
    }
    uint64_t v4 = [(NSMutableArray *)ranks countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (void)saveOrder
{
  if (!self->savedOrder) {
    self->savedOrder = (unint64_t *)malloc_type_malloc(8* [(NSMutableOrderedSet *)[(GVGraph *)self->graph nodes] count], 0x100004000313F17uLL);
  }
  if ([(NSMutableOrderedSet *)[(GVGraph *)self->graph nodes] count])
  {
    unint64_t v3 = 0;
    do
    {
      self->savedOrder[v3] = objc_msgSend((id)-[NSMutableOrderedSet objectAtIndexedSubscript:](-[GVGraph nodes](self->graph, "nodes"), "objectAtIndexedSubscript:", v3), "index");
      ++v3;
    }
    while (v3 < [(NSMutableOrderedSet *)[(GVGraph *)self->graph nodes] count]);
  }
}

- (void)restoreOrder
{
  if (self->savedOrder && [(NSMutableOrderedSet *)[(GVGraph *)self->graph nodes] count])
  {
    unint64_t v3 = 0;
    do
    {
      objc_msgSend((id)-[NSMutableOrderedSet objectAtIndexedSubscript:](-[GVGraph nodes](self->graph, "nodes"), "objectAtIndexedSubscript:", v3), "setIndex:", self->savedOrder[v3]);
      ++v3;
    }
    while (v3 < [(NSMutableOrderedSet *)[(GVGraph *)self->graph nodes] count]);
  }
}

- (void)commitOrder
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  ranks = self->ranks;
  uint64_t v3 = [(NSMutableArray *)ranks countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(ranks);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) sortByIndex];
      }
      uint64_t v4 = [(NSMutableArray *)ranks countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)initializeOrder
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (char *)&v38 - ((8 * [(NSMutableArray *)self->ranks count] + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v3, 8 * [(NSMutableArray *)self->ranks count]);
  uint64_t v4 = 0;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __27__GVLayout_initializeOrder__block_invoke;
  v54[3] = &__block_descriptor_40_e30_B32__0__GVNode_8__GVNode_16Q24l;
  v54[4] = v3;
  self->currentCrossings = 0xFFFFFFFFLL;
  while (1)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v5 = [(GVGraph *)self->graph nodes];
    uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v51 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v50 + 1) + 8 * i) setIndex:-1];
        }
        uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v7);
    }
    long long v10 = (void *)[(NSMutableArray *)self->ranks objectEnumerator];
    for (j = v10; ; long long v10 = j)
    {
      uint64_t v12 = (void *)[v10 nextObject];
      if (!v12) {
        break;
      }
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      uint64_t v13 = (void *)[v12 nodes];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v57 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v47;
        do
        {
          for (uint64_t k = 0; k != v15; ++k)
          {
            if (*(void *)v47 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v46 + 1) + 8 * k);
            if ([v18 index] <= 0) {
              [v18 traversePreorder:0 withCallback:v54 randomize:1];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v46 objects:v57 count:16];
        }
        while (v15);
      }
    }
    [(GVLayout *)self commitOrder];
    unint64_t v19 = [(GVLayout *)self crossings];
    if (v19 < self->currentCrossings)
    {
      unint64_t v20 = v19;
      [(GVLayout *)self saveOrder];
      self->currentCrossings = v20;
      if (!v20) {
        break;
      }
    }
    if (++v4 == 10)
    {
      for (unint64_t m = 0; ; ++m)
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        unint64_t v22 = [(GVGraph *)self->graph nodes];
        uint64_t v23 = [(NSMutableOrderedSet *)v22 countByEnumeratingWithState:&v42 objects:v56 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v43;
          do
          {
            for (uint64_t n = 0; n != v24; ++n)
            {
              if (*(void *)v43 != v25) {
                objc_enumerationMutation(v22);
              }
              [*(id *)(*((void *)&v42 + 1) + 8 * n) setIndex:-1];
            }
            uint64_t v24 = [(NSMutableOrderedSet *)v22 countByEnumeratingWithState:&v42 objects:v56 count:16];
          }
          while (v24);
        }
        long long v27 = (void *)[(NSMutableArray *)self->ranks reverseObjectEnumerator];
        for (iuint64_t i = v27; ; v27 = ii)
        {
          long long v29 = (void *)[v27 nextObject];
          if (!v29) {
            break;
          }
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v30 = objc_msgSend(v29, "nodes", 0);
          uint64_t v31 = [v30 countByEnumeratingWithState:&v38 objects:v55 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v39;
            do
            {
              for (juint64_t j = 0; jj != v32; ++jj)
              {
                if (*(void *)v39 != v33) {
                  objc_enumerationMutation(v30);
                }
                long long v35 = *(void **)(*((void *)&v38 + 1) + 8 * jj);
                if ([v35 index] <= 0) {
                  [v35 traversePreorder:1 withCallback:v54 randomize:1];
                }
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v38 objects:v55 count:16];
            }
            while (v32);
          }
        }
        [(GVLayout *)self commitOrder];
        unint64_t v36 = [(GVLayout *)self crossings];
        if (v36 >= self->currentCrossings)
        {
          if (m > 8) {
            return;
          }
        }
        else
        {
          unint64_t v37 = v36;
          [(GVLayout *)self saveOrder];
          self->currentCrossings = v37;
          if (!v37 || m >= 9) {
            return;
          }
        }
      }
    }
  }
}

BOOL __27__GVLayout_initializeOrder__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 index];
  if (v4 < 0)
  {
    objc_msgSend(a2, "setIndex:", *(void *)(*(void *)(a1 + 32) + 8 * objc_msgSend(a2, "rank")));
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [a2 rank];
    ++*(void *)(v5 + 8 * v6);
  }
  return v4 >= 0;
}

- (unint64_t)medianValueOf:(id)a3 withRespectTo:(id)a4
{
  uint64_t v4 = (void *)[a4 neighborsOfNode:a3];
  unint64_t v5 = [v4 count];
  if (!v5) {
    return -1;
  }
  unint64_t v6 = v5;
  unint64_t v7 = v5 >> 1;
  if (v5)
  {
    uint64_t v12 = (void *)[v4 objectAtIndexedSubscript:v7];
    return [v12 index];
  }
  else if (v5 == 2)
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0), "index");
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 1), "index");
    uint64_t v10 = v9 + v8;
    if (v9 + v8 < 0 != __OFADD__(v9, v8)) {
      ++v10;
    }
    return v10 >> 1;
  }
  else
  {
    uint64_t v13 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v7 - 1), "index");
    uint64_t v14 = v13 - objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0), "index");
    uint64_t v15 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v6 - 1), "index");
    uint64_t v16 = v15 - objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v7), "index");
    uint64_t v17 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v7 - 1), "index") * v16;
    return (v17 + objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v7), "index") * v14) / (v16 + v14);
  }
}

- (void)medianSort:(id)a3 withRespectTo:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a3, "nodes"), "count") >= 2)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unint64_t v7 = objc_msgSend(a3, "nodes", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "setIndex:", -[GVLayout medianValueOf:withRespectTo:](self, "medianValueOf:withRespectTo:", *(void *)(*((void *)&v16 + 1) + 8 * v11), a4));
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
    uint64_t v12 = objc_msgSend((id)objc_msgSend(a3, "nodes"), "mutableCopy");
    [v12 sortUsingComparator:&__block_literal_global_150];
    uint64_t v13 = -1;
    do
      ++v13;
    while (objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", v13), "index") < 0);
    if (objc_msgSend((id)objc_msgSend(a3, "nodes"), "count"))
    {
      unint64_t v14 = 0;
      do
      {
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "nodes"), "objectAtIndexedSubscript:", v14), "index") & 0x8000000000000000) == 0) {
          objc_msgSend((id)objc_msgSend(a3, "nodes"), "setObject:atIndexedSubscript:", objc_msgSend(v12, "objectAtIndexedSubscript:", v13++), v14);
        }
        ++v14;
      }
      while (v14 < objc_msgSend((id)objc_msgSend(a3, "nodes"), "count"));
    }
    if (objc_msgSend((id)objc_msgSend(a3, "nodes"), "count"))
    {
      unint64_t v15 = 0;
      do
      {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "nodes"), "objectAtIndexedSubscript:", v15), "setIndex:", v15);
        ++v15;
      }
      while (v15 < objc_msgSend((id)objc_msgSend(a3, "nodes"), "count"));
    }
  }
}

- (void)weightedMedian:(unint64_t)a3
{
  ranks = self->ranks;
  if (a3)
  {
    for (uint64_t i = (void *)-[NSMutableArray lastObject](ranks, "lastObject"); ; uint64_t i = (void *)[v8 prev])
    {
      uint64_t v8 = i;
      if (![i prev]) {
        break;
      }
      -[GVLayout medianSort:withRespectTo:](self, "medianSort:withRespectTo:", [v8 prev], v8);
    }
  }
  else
  {
    for (uint64_t j = (void *)-[NSMutableArray firstObject](ranks, "firstObject"); ; uint64_t j = (void *)[v6 next])
    {
      unint64_t v6 = j;
      if (![j next]) {
        break;
      }
      -[GVLayout medianSort:withRespectTo:](self, "medianSort:withRespectTo:", [v6 next], v6);
    }
  }
}

- (void)transpose
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  do
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    ranks = self->ranks;
    uint64_t v4 = [(NSMutableArray *)ranks countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v4) {
      break;
    }
    uint64_t v5 = v4;
    BOOL v6 = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(ranks);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v9, "nodes"), "count") != 1)
        {
          uint64_t v10 = 0;
          do
          {
            uint64_t v11 = [v9 inCrossings];
            unint64_t v12 = [v9 outCrossings] + v11;
            unint64_t v13 = v10 + 1;
            [v9 exchangeNodeAtIndex:v10 withNodeAtIndex:v10 + 1];
            uint64_t v14 = [v9 inCrossings];
            unint64_t v15 = [v9 outCrossings] + v14;
            if (v12 <= v15) {
              [v9 exchangeNodeAtIndex:v10 + 1 withNodeAtIndex:v10];
            }
            ++v10;
          }
          while (v13 < objc_msgSend((id)objc_msgSend(v9, "nodes"), "count") - 1);
          BOOL v6 = v12 > v15;
        }
      }
      uint64_t v5 = [(NSMutableArray *)ranks countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  while (v6);
}

- (void)assignCoordinates
{
  [(GVLayout *)self assignNodePriorities];
  [(GVLayout *)self assignNodeCoordinates];

  [(GVLayout *)self assignRankCoordinates];
}

- (void)assignNodePriorities
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(GVGraph *)self->graph nodes];
  uint64_t v3 = [(NSMutableOrderedSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) computePriority];
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableOrderedSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)initializeNodeCoordinates
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (self->direction > 1u)
  {
    long long v37 = 0uLL;
    long long v38 = 0uLL;
    long long v35 = 0uLL;
    long long v36 = 0uLL;
    ranks = self->ranks;
    uint64_t v18 = [(NSMutableArray *)ranks countByEnumeratingWithState:&v35 objects:v48 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(ranks);
          }
          unint64_t v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          uint64_t v23 = objc_msgSend(v22, "nodes", 0);
          uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v47 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v32;
            double v27 = 0.0;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v32 != v26) {
                  objc_enumerationMutation(v23);
                }
                long long v29 = *(void **)(*((void *)&v31 + 1) + 8 * j);
                [v29 setY:v27];
                [v29 h];
                double v27 = v27 + v30 + self->separation.height;
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v47 count:16];
            }
            while (v25);
          }
        }
        uint64_t v19 = [(NSMutableArray *)ranks countByEnumeratingWithState:&v35 objects:v48 count:16];
      }
      while (v19);
    }
  }
  else
  {
    long long v45 = 0uLL;
    long long v46 = 0uLL;
    long long v43 = 0uLL;
    long long v44 = 0uLL;
    uint64_t v3 = self->ranks;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v44;
      do
      {
        for (uint64_t k = 0; k != v5; ++k)
        {
          if (*(void *)v44 != v6) {
            objc_enumerationMutation(v3);
          }
          long long v8 = *(void **)(*((void *)&v43 + 1) + 8 * k);
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v9 = (void *)[v8 nodes];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v49 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v40;
            double v13 = 0.0;
            do
            {
              for (uint64_t m = 0; m != v11; ++m)
              {
                if (*(void *)v40 != v12) {
                  objc_enumerationMutation(v9);
                }
                unint64_t v15 = *(void **)(*((void *)&v39 + 1) + 8 * m);
                [v15 setX:v13];
                [v15 w];
                double v13 = v13 + v16 + self->separation.width;
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v49 count:16];
            }
            while (v11);
          }
        }
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v43 objects:v50 count:16];
      }
      while (v5);
    }
  }
}

- (void)medianPosition:(unint64_t)a3
{
  ranks = self->ranks;
  if (a3)
  {
    for (uint64_t i = (void *)-[NSMutableArray lastObject](ranks, "lastObject"); ; uint64_t i = (void *)[v7 prev])
    {
      long long v7 = i;
      if (![i prev]) {
        break;
      }
      objc_msgSend((id)objc_msgSend(v7, "prev"), "centerNodesWithRespectoTo:", v7);
    }
  }
  else
  {
    for (uint64_t j = (void *)-[NSMutableArray firstObject](ranks, "firstObject"); ; uint64_t j = (void *)[v5 next])
    {
      uint64_t v5 = j;
      if (![j next]) {
        break;
      }
      objc_msgSend((id)objc_msgSend(v5, "next"), "centerNodesWithRespectoTo:", v5);
    }
  }
}

- (void)packCutX:(unint64_t)a3
{
  ranks = self->ranks;
  if (a3)
  {
    uint64_t v15 = objc_msgSend((id)-[NSMutableArray firstObject](ranks, "firstObject"), "next");
    if (v15)
    {
      double v16 = (void *)v15;
      do
      {
        for (uint64_t i = objc_msgSend((id)objc_msgSend(v16, "nodes"), "lastObject"); ; uint64_t i = objc_msgSend(v18, "prev"))
        {
          uint64_t v18 = (void *)i;
          if (!i) {
            break;
          }
          uint64_t v19 = objc_msgSend((id)objc_msgSend(v16, "prev"), "neighborsOfNode:", i);
          if ([v19 count])
          {
            medianX(v19);
            objc_msgSend(v16, "centerNode:at:", v18);
          }
        }
        double v16 = (void *)[v16 next];
      }
      while (v16);
    }
    uint64_t v20 = objc_msgSend((id)-[NSMutableArray firstObject](self->ranks, "firstObject"), "next");
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      do
      {
        for (uint64_t j = objc_msgSend((id)objc_msgSend(v21, "nodes"), "firstObject"); ; uint64_t j = objc_msgSend(v23, "next"))
        {
          uint64_t v23 = (void *)j;
          if (!j) {
            break;
          }
          uint64_t v24 = objc_msgSend((id)objc_msgSend(v21, "prev"), "neighborsOfNode:", j);
          if ([v24 count])
          {
            medianX(v24);
            objc_msgSend(v21, "centerNode:at:", v23);
          }
        }
        uint64_t v21 = (void *)[v21 next];
      }
      while (v21);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend((id)-[NSMutableArray lastObject](ranks, "lastObject"), "prev");
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      do
      {
        for (uint64_t k = objc_msgSend((id)objc_msgSend(v6, "nodes"), "lastObject"); ; uint64_t k = objc_msgSend(v8, "prev"))
        {
          long long v8 = (void *)k;
          if (!k) {
            break;
          }
          long long v9 = objc_msgSend((id)objc_msgSend(v6, "next"), "neighborsOfNode:", k);
          if ([v9 count])
          {
            medianX(v9);
            objc_msgSend(v6, "centerNode:at:", v8);
          }
        }
        uint64_t v6 = (void *)[v6 prev];
      }
      while (v6);
    }
    uint64_t v10 = objc_msgSend((id)-[NSMutableArray lastObject](self->ranks, "lastObject"), "prev");
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      do
      {
        for (uint64_t m = objc_msgSend((id)objc_msgSend(v11, "nodes"), "firstObject"); ; uint64_t m = objc_msgSend(v13, "next"))
        {
          double v13 = (void *)m;
          if (!m) {
            break;
          }
          uint64_t v14 = objc_msgSend((id)objc_msgSend(v11, "next"), "neighborsOfNode:", m);
          if ([v14 count])
          {
            medianX(v14);
            objc_msgSend(v11, "centerNode:at:", v13);
          }
        }
        uint64_t v11 = (void *)[v11 prev];
      }
      while (v11);
    }
  }
}

- (void)packCutY:(unint64_t)a3
{
  ranks = self->ranks;
  if (a3)
  {
    uint64_t v15 = objc_msgSend((id)-[NSMutableArray firstObject](ranks, "firstObject"), "next");
    if (v15)
    {
      double v16 = (void *)v15;
      do
      {
        for (uint64_t i = objc_msgSend((id)objc_msgSend(v16, "nodes"), "lastObject"); ; uint64_t i = objc_msgSend(v18, "prev"))
        {
          uint64_t v18 = (void *)i;
          if (!i) {
            break;
          }
          uint64_t v19 = objc_msgSend((id)objc_msgSend(v16, "prev"), "neighborsOfNode:", i);
          if ([v19 count])
          {
            medianY(v19);
            objc_msgSend(v16, "centerNode:at:", v18);
          }
        }
        double v16 = (void *)[v16 next];
      }
      while (v16);
    }
    uint64_t v20 = objc_msgSend((id)-[NSMutableArray firstObject](self->ranks, "firstObject"), "next");
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      do
      {
        for (uint64_t j = objc_msgSend((id)objc_msgSend(v21, "nodes"), "firstObject"); ; uint64_t j = objc_msgSend(v23, "next"))
        {
          uint64_t v23 = (void *)j;
          if (!j) {
            break;
          }
          uint64_t v24 = objc_msgSend((id)objc_msgSend(v21, "prev"), "neighborsOfNode:", j);
          if ([v24 count])
          {
            medianY(v24);
            objc_msgSend(v21, "centerNode:at:", v23);
          }
        }
        uint64_t v21 = (void *)[v21 next];
      }
      while (v21);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend((id)-[NSMutableArray lastObject](ranks, "lastObject"), "prev");
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      do
      {
        for (uint64_t k = objc_msgSend((id)objc_msgSend(v6, "nodes"), "lastObject"); ; uint64_t k = objc_msgSend(v8, "prev"))
        {
          long long v8 = (void *)k;
          if (!k) {
            break;
          }
          long long v9 = objc_msgSend((id)objc_msgSend(v6, "next"), "neighborsOfNode:", k);
          if ([v9 count])
          {
            medianY(v9);
            objc_msgSend(v6, "centerNode:at:", v8);
          }
        }
        uint64_t v6 = (void *)[v6 prev];
      }
      while (v6);
    }
    uint64_t v10 = objc_msgSend((id)-[NSMutableArray lastObject](self->ranks, "lastObject"), "prev");
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      do
      {
        for (uint64_t m = objc_msgSend((id)objc_msgSend(v11, "nodes"), "firstObject"); ; uint64_t m = objc_msgSend(v13, "next"))
        {
          double v13 = (void *)m;
          if (!m) {
            break;
          }
          uint64_t v14 = objc_msgSend((id)objc_msgSend(v11, "next"), "neighborsOfNode:", m);
          if ([v14 count])
          {
            medianY(v14);
            objc_msgSend(v11, "centerNode:at:", v13);
          }
        }
        uint64_t v11 = (void *)[v11 prev];
      }
      while (v11);
    }
  }
}

- (void)straightenX
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  ranks = self->ranks;
  uint64_t v3 = [(NSMutableArray *)ranks countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v24;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(ranks);
        }
        long long v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v9 width];
        if (v10 >= v7)
        {
          uint64_t v5 = v9;
          double v7 = v10;
        }
      }
      uint64_t v4 = [(NSMutableArray *)ranks countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v11 = [v5 next];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    do
    {
      uint64_t v13 = objc_msgSend((id)objc_msgSend(v12, "nodes"), "firstObject");
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        do
        {
          if ([v14 inDegree] == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "inNodes"), "objectAtIndexedSubscript:", 0), "outDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "inNodes"), "objectAtIndexedSubscript:", 0), "cx");
            objc_msgSend(v12, "centerNode:at:", v14);
          }
          uint64_t v14 = (void *)[v14 next];
        }
        while (v14);
      }
      uint64_t v15 = objc_msgSend((id)objc_msgSend(v12, "nodes"), "lastObject");
      if (v15)
      {
        double v16 = (void *)v15;
        do
        {
          if ([v16 inDegree] == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "inNodes"), "objectAtIndexedSubscript:", 0), "outDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "inNodes"), "objectAtIndexedSubscript:", 0), "cx");
            objc_msgSend(v12, "centerNode:at:", v16);
          }
          double v16 = (void *)[v16 prev];
        }
        while (v16);
      }
      uint64_t v12 = (void *)[v12 next];
    }
    while (v12);
  }
  uint64_t v17 = [v5 prev];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    do
    {
      uint64_t v19 = objc_msgSend((id)objc_msgSend(v18, "nodes"), "firstObject");
      if (v19)
      {
        uint64_t v20 = (void *)v19;
        do
        {
          if ([v20 outDegree] == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "outNodes"), "objectAtIndexedSubscript:", 0), "inDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "outNodes"), "objectAtIndexedSubscript:", 0), "cx");
            objc_msgSend(v18, "centerNode:at:", v20);
          }
          uint64_t v20 = (void *)[v20 next];
        }
        while (v20);
      }
      uint64_t v21 = objc_msgSend((id)objc_msgSend(v18, "nodes"), "lastObject");
      if (v21)
      {
        unint64_t v22 = (void *)v21;
        do
        {
          if ([v22 outDegree] == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "outNodes"), "objectAtIndexedSubscript:", 0), "inDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "outNodes"), "objectAtIndexedSubscript:", 0), "cx");
            objc_msgSend(v18, "centerNode:at:", v22);
          }
          unint64_t v22 = (void *)[v22 prev];
        }
        while (v22);
      }
      uint64_t v18 = (void *)[v18 prev];
    }
    while (v18);
  }
}

- (void)straightenY
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  ranks = self->ranks;
  uint64_t v3 = [(NSMutableArray *)ranks countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v24;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(ranks);
        }
        long long v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v9 height];
        if (v10 >= v7)
        {
          uint64_t v5 = v9;
          double v7 = v10;
        }
      }
      uint64_t v4 = [(NSMutableArray *)ranks countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v11 = [v5 next];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    do
    {
      uint64_t v13 = objc_msgSend((id)objc_msgSend(v12, "nodes"), "firstObject");
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        do
        {
          if ([v14 inDegree] == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "inNodes"), "objectAtIndexedSubscript:", 0), "outDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "inNodes"), "objectAtIndexedSubscript:", 0), "cy");
            objc_msgSend(v12, "centerNode:at:", v14);
          }
          uint64_t v14 = (void *)[v14 next];
        }
        while (v14);
      }
      uint64_t v15 = objc_msgSend((id)objc_msgSend(v12, "nodes"), "lastObject");
      if (v15)
      {
        double v16 = (void *)v15;
        do
        {
          if ([v16 inDegree] == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "inNodes"), "objectAtIndexedSubscript:", 0), "outDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "inNodes"), "objectAtIndexedSubscript:", 0), "cy");
            objc_msgSend(v12, "centerNode:at:", v16);
          }
          double v16 = (void *)[v16 prev];
        }
        while (v16);
      }
      uint64_t v12 = (void *)[v12 next];
    }
    while (v12);
  }
  uint64_t v17 = [v5 prev];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    do
    {
      uint64_t v19 = objc_msgSend((id)objc_msgSend(v18, "nodes"), "firstObject");
      if (v19)
      {
        uint64_t v20 = (void *)v19;
        do
        {
          if ([v20 outDegree] == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "outNodes"), "objectAtIndexedSubscript:", 0), "inDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "outNodes"), "objectAtIndexedSubscript:", 0), "cy");
            objc_msgSend(v18, "centerNode:at:", v20);
          }
          uint64_t v20 = (void *)[v20 next];
        }
        while (v20);
      }
      uint64_t v21 = objc_msgSend((id)objc_msgSend(v18, "nodes"), "lastObject");
      if (v21)
      {
        unint64_t v22 = (void *)v21;
        do
        {
          if ([v22 outDegree] == 1
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "outNodes"), "objectAtIndexedSubscript:", 0), "inDegree") == 1)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "outNodes"), "objectAtIndexedSubscript:", 0), "cy");
            objc_msgSend(v18, "centerNode:at:", v22);
          }
          unint64_t v22 = (void *)[v22 prev];
        }
        while (v22);
      }
      uint64_t v18 = (void *)[v18 prev];
    }
    while (v18);
  }
}

- (void)assignNodeCoordinates
{
  [(GVLayout *)self initializeNodeCoordinates];
  if (self->direction >= 2u)
  {
    for (uint64_t i = 0; i != 8; ++i)
    {
      [(GVLayout *)self medianPosition:i];
      [(GVLayout *)self packCutY:i];
      [(GVLayout *)self straightenY];
    }
  }
  else
  {
    for (uint64_t j = 0; j != 8; ++j)
    {
      [(GVLayout *)self medianPosition:j];
      [(GVLayout *)self packCutX:j];
      [(GVLayout *)self straightenX];
    }
  }
}

- (void)assignRankCoordinates
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = self->direction - 1;
  ranks = self->ranks;
  if (v3 > 1) {
    uint64_t v5 = (void *)[(NSMutableArray *)ranks reverseObjectEnumerator];
  }
  else {
    uint64_t v5 = (void *)[(NSMutableArray *)ranks objectEnumerator];
  }
  uint64_t v6 = v5;
  directiouint64_t n = self->direction;
  uint64_t v8 = [v5 nextObject];
  long long v9 = (void *)v8;
  if (direction >= 2)
  {
    if (v8)
    {
      double v29 = 0.0;
      do
      {
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        double v30 = (void *)[v9 nodes];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v52 objects:v65 count:16];
        double v32 = 0.0;
        if (v31)
        {
          uint64_t v33 = v31;
          uint64_t v34 = *(void *)v53;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v53 != v34) {
                objc_enumerationMutation(v30);
              }
              [*(id *)(*((void *)&v52 + 1) + 8 * i) size];
              if (v32 < v36) {
                double v32 = v36;
              }
            }
            uint64_t v33 = [v30 countByEnumeratingWithState:&v52 objects:v65 count:16];
          }
          while (v33);
        }
        unint64_t v37 = objc_msgSend((id)objc_msgSend(v9, "nodes"), "count");
        double v38 = 0.0;
        if (v37 >= 6) {
          double v38 = self->separation.width * 0.5;
        }
        double v39 = v29 + v38;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v40 = objc_msgSend(v9, "nodes", 0);
        uint64_t v41 = [v40 countByEnumeratingWithState:&v48 objects:v64 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v49;
          do
          {
            for (uint64_t j = 0; j != v42; ++j)
            {
              if (*(void *)v49 != v43) {
                objc_enumerationMutation(v40);
              }
              [*(id *)(*((void *)&v48 + 1) + 8 * j) setCx:v32 * 0.5 + v39];
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v48 objects:v64 count:16];
          }
          while (v42);
        }
        unint64_t v45 = objc_msgSend((id)objc_msgSend(v9, "nodes"), "count");
        double width = self->separation.width;
        double v47 = width * 0.5;
        if (v45 <= 5) {
          double v47 = 0.0;
        }
        double v29 = v39 + v47 + v32 + width;
        long long v9 = (void *)[v6 nextObject];
      }
      while (v9);
    }
  }
  else if (v8)
  {
    double v10 = 0.0;
    do
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v11 = (void *)[v9 nodes];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v67 count:16];
      double v13 = 0.0;
      if (v12)
      {
        uint64_t v14 = v12;
        uint64_t v15 = *(void *)v61;
        do
        {
          for (uint64_t k = 0; k != v14; ++k)
          {
            if (*(void *)v61 != v15) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(*((void *)&v60 + 1) + 8 * k) size];
            if (v13 < v17) {
              double v13 = v17;
            }
          }
          uint64_t v14 = [v11 countByEnumeratingWithState:&v60 objects:v67 count:16];
        }
        while (v14);
      }
      unint64_t v18 = objc_msgSend((id)objc_msgSend(v9, "nodes"), "count");
      double v19 = 0.0;
      if (v18 >= 6) {
        double v19 = self->separation.height * 0.5;
      }
      double v20 = v10 + v19;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v21 = (void *)[v9 nodes];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v56 objects:v66 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v57;
        do
        {
          for (uint64_t m = 0; m != v23; ++m)
          {
            if (*(void *)v57 != v24) {
              objc_enumerationMutation(v21);
            }
            [*(id *)(*((void *)&v56 + 1) + 8 * m) setCy:v13 * 0.5 + v20];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v56 objects:v66 count:16];
        }
        while (v23);
      }
      unint64_t v26 = objc_msgSend((id)objc_msgSend(v9, "nodes"), "count");
      double height = self->separation.height;
      double v28 = height * 0.5;
      if (v26 <= 5) {
        double v28 = 0.0;
      }
      double v10 = v20 + v28 + v13 + height;
      long long v9 = (void *)[v6 nextObject];
    }
    while (v9);
  }
}

- (GVGraph)graph
{
  return self->graph;
}

- (void)setGraph:(id)a3
{
  self->graph = (GVGraph *)a3;
}

- (int)direction
{
  return self->direction;
}

- (void)setDirection:(int)a3
{
  self->directiouint64_t n = a3;
}

- (CGSize)separation
{
  double width = self->separation.width;
  double height = self->separation.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSeparation:(CGSize)a3
{
  self->separatiouint64_t n = a3;
}

- (NSMutableArray)selfEdges
{
  return self->selfEdges;
}

- (void)setSelfEdges:(id)a3
{
}

- (NSMutableArray)ranks
{
  return self->ranks;
}

- (void)setRanks:(id)a3
{
}

@end