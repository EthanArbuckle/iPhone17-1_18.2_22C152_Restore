@interface GVRank
- (CGSize)sizeForDummy;
- (GVRank)initWithSeparation:(CGSize)a3;
- (GVRank)next;
- (GVRank)prev;
- (double)height;
- (double)width;
- (id)neighborsOfNode:(id)a3;
- (id)nodes;
- (unint64_t)inCrossings;
- (unint64_t)outCrossings;
- (void)addNode:(id)a3;
- (void)buildNodeIterators;
- (void)dealloc;
- (void)exchangeNodeAtIndex:(unint64_t)a3 withNodeAtIndex:(unint64_t)a4;
- (void)inCrossings;
- (void)outCrossings;
- (void)removeNode:(id)a3;
- (void)setNext:(id)a3;
- (void)setPrev:(id)a3;
- (void)sortByIndex;
@end

@implementation GVRank

- (GVRank)initWithSeparation:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GVRank;
  v3 = [(GVRank *)&v5 init];
  if (v3)
  {
    v3->nodes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->prev = 0;
    v3->next = 0;
  }
  return v3;
}

- (void)dealloc
{
  [(NSMutableArray *)self->nodes dealloc];
  v3.receiver = self;
  v3.super_class = (Class)GVRank;
  [(GVRank *)&v3 dealloc];
}

- (id)nodes
{
  return self->nodes;
}

- (void)addNode:(id)a3
{
  -[NSMutableArray addObject:](self->nodes, "addObject:");
  objc_msgSend(a3, "setIndex:", -[NSMutableArray count](self->nodes, "count") - 1);
  if ([a3 index]) {
    uint64_t v5 = -[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", [a3 index] - 1);
  }
  else {
    uint64_t v5 = 0;
  }
  [a3 setPrev:v5];

  [a3 setNext:0];
}

- (void)removeNode:(id)a3
{
  -[NSMutableArray removeObject:](self->nodes, "removeObject:");
  if ([a3 prev]) {
    objc_msgSend((id)objc_msgSend(a3, "prev"), "setNext:", objc_msgSend(a3, "next"));
  }
  if ([a3 next]) {
    objc_msgSend((id)objc_msgSend(a3, "next"), "setPrev:", objc_msgSend(a3, "prev"));
  }
  [a3 setPrev:0];
  [a3 setNext:0];
  if ([(NSMutableArray *)self->nodes count])
  {
    unint64_t v5 = 0;
    do
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", v5), "setIndex:", v5);
      ++v5;
    }
    while (v5 < [(NSMutableArray *)self->nodes count]);
  }
}

- (id)neighborsOfNode:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  nodes = self->nodes;
  uint64_t v7 = [(NSMutableArray *)nodes countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(nodes);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (([a3 hasEdgeTo:v11] & 1) != 0 || objc_msgSend(a3, "hasEdgeFrom:", v11)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)nodes countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

- (void)sortByIndex
{
  [(NSMutableArray *)self->nodes sortUsingComparator:&__block_literal_global_150];
  if ([(NSMutableArray *)self->nodes count])
  {
    unint64_t v3 = 0;
    do
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", v3), "setIndex:", v3);
      ++v3;
    }
    while (v3 < [(NSMutableArray *)self->nodes count]);
  }
}

- (void)exchangeNodeAtIndex:(unint64_t)a3 withNodeAtIndex:(unint64_t)a4
{
  uint64_t v7 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:");
  uint64_t v8 = (void *)[(NSMutableArray *)self->nodes objectAtIndexedSubscript:a4];
  [v7 setIndex:a4];
  [(NSMutableArray *)self->nodes setObject:v7 atIndexedSubscript:a4];
  [v8 setIndex:a3];
  nodes = self->nodes;

  [(NSMutableArray *)nodes setObject:v8 atIndexedSubscript:a3];
}

- (void)buildNodeIterators
{
  unint64_t v3 = (void *)[(NSMutableArray *)self->nodes objectEnumerator];
  v4 = (void *)[v3 nextObject];
  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = v4;
      [v4 setPrev:v5];
      v4 = (void *)[v3 nextObject];
      unint64_t v5 = v6;
    }
    while (v4);
  }
  uint64_t v7 = (void *)[(NSMutableArray *)self->nodes reverseObjectEnumerator];
  uint64_t v8 = (void *)[v7 nextObject];
  if (v8)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = v8;
      [v8 setNext:v9];
      uint64_t v8 = (void *)[v7 nextObject];
      uint64_t v9 = v10;
    }
    while (v8);
  }
}

- (unint64_t)inCrossings
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->nodes count]) {
    return 0;
  }
  unint64_t v3 = 0;
  unint64_t v4 = 0;
  do
  {
    unint64_t v5 = v3++;
    if (v3 < [(NSMutableArray *)self->nodes count])
    {
      unint64_t v22 = v3;
      do
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id obj = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", v5), "inNodes");
        uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v28;
          unint64_t v17 = v5;
          unint64_t v18 = v3;
          do
          {
            uint64_t v6 = 0;
            do
            {
              if (*(void *)v28 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * v6);
              long long v23 = 0u;
              long long v24 = 0u;
              long long v25 = 0u;
              long long v26 = 0u;
              uint64_t v8 = objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", v22, v17, v18), "inNodes");
              uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v9)
              {
                uint64_t v10 = v9;
                uint64_t v11 = *(void *)v24;
                do
                {
                  uint64_t v12 = 0;
                  do
                  {
                    if (*(void *)v24 != v11) {
                      objc_enumerationMutation(v8);
                    }
                    long long v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
                    uint64_t v14 = [v7 rank];
                    if (v14 != [v13 rank]) {
                      -[GVRank inCrossings]();
                    }
                    uint64_t v15 = [v13 index];
                    if (v15 < [v7 index]) {
                      ++v4;
                    }
                    ++v12;
                  }
                  while (v10 != v12);
                  uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
                }
                while (v10);
              }
              ++v6;
            }
            while (v6 != v20);
            unint64_t v5 = v17;
            unint64_t v3 = v18;
            uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
          }
          while (v20);
        }
        ++v22;
      }
      while (v22 < [(NSMutableArray *)self->nodes count]);
    }
  }
  while (v3 < [(NSMutableArray *)self->nodes count]);
  return v4;
}

- (unint64_t)outCrossings
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->nodes count]) {
    return 0;
  }
  unint64_t v3 = 0;
  unint64_t v4 = 0;
  do
  {
    unint64_t v5 = v3++;
    if (v3 < [(NSMutableArray *)self->nodes count])
    {
      unint64_t v22 = v3;
      do
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id obj = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", v5), "outNodes");
        uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v28;
          unint64_t v17 = v5;
          unint64_t v18 = v3;
          do
          {
            uint64_t v6 = 0;
            do
            {
              if (*(void *)v28 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * v6);
              long long v23 = 0u;
              long long v24 = 0u;
              long long v25 = 0u;
              long long v26 = 0u;
              uint64_t v8 = objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->nodes, "objectAtIndexedSubscript:", v22, v17, v18), "outNodes");
              uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v9)
              {
                uint64_t v10 = v9;
                uint64_t v11 = *(void *)v24;
                do
                {
                  uint64_t v12 = 0;
                  do
                  {
                    if (*(void *)v24 != v11) {
                      objc_enumerationMutation(v8);
                    }
                    long long v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
                    uint64_t v14 = [v7 rank];
                    if (v14 != [v13 rank]) {
                      -[GVRank outCrossings]();
                    }
                    uint64_t v15 = [v13 index];
                    if (v15 < [v7 index]) {
                      ++v4;
                    }
                    ++v12;
                  }
                  while (v10 != v12);
                  uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
                }
                while (v10);
              }
              ++v6;
            }
            while (v6 != v20);
            unint64_t v5 = v17;
            unint64_t v3 = v18;
            uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
          }
          while (v20);
        }
        ++v22;
      }
      while (v22 < [(NSMutableArray *)self->nodes count]);
    }
  }
  while (v3 < [(NSMutableArray *)self->nodes count]);
  return v4;
}

- (double)width
{
  return 0.0;
}

- (double)height
{
  return 0.0;
}

- (CGSize)sizeForDummy
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (GVRank)prev
{
  return self->prev;
}

- (void)setPrev:(id)a3
{
  self->prev = (GVRank *)a3;
}

- (GVRank)next
{
  return self->next;
}

- (void)setNext:(id)a3
{
  self->next = (GVRank *)a3;
}

- (void)inCrossings
{
  __assert_rtn("-[GVRank inCrossings]", "GVLayout.m", 329, "inNodeI.rank == inNodeJ.rank");
}

- (void)outCrossings
{
  __assert_rtn("-[GVRank outCrossings]", "GVLayout.m", 345, "outNodeI.rank == outNodeJ.rank");
}

@end