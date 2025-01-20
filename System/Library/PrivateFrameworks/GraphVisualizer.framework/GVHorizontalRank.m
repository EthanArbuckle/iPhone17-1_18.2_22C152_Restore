@interface GVHorizontalRank
- (CGSize)sizeForDummy;
- (GVHorizontalRank)initWithSeparation:(CGSize)a3;
- (double)height;
- (double)width;
- (void)centerNode:(id)a3 at:(double)a4;
- (void)centerNodesWithRespectoTo:(id)a3;
@end

@implementation GVHorizontalRank

- (GVHorizontalRank)initWithSeparation:(CGSize)a3
{
  double width = a3.width;
  v5.receiver = self;
  v5.super_class = (Class)GVHorizontalRank;
  result = -[GVRank initWithSeparation:](&v5, sel_initWithSeparation_, a3.width, a3.height);
  if (result) {
    result->super.separation = width;
  }
  return result;
}

- (double)width
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = self->super.separation * (double)(unint64_t)([(NSMutableArray *)self->super.nodes count] - 1);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  nodes = self->super.nodes;
  uint64_t v5 = [(NSMutableArray *)nodes countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(nodes);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v8) w];
        double v3 = v3 + v9;
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)nodes countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (double)height
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  nodes = self->super.nodes;
  uint64_t v3 = [(NSMutableArray *)nodes countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0.0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v11;
  double v6 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(nodes);
      }
      [*(id *)(*((void *)&v10 + 1) + 8 * i) h];
      if (v6 < v8) {
        double v6 = v8;
      }
    }
    uint64_t v4 = [(NSMutableArray *)nodes countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v6;
}

- (CGSize)sizeForDummy
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  nodes = self->super.nodes;
  uint64_t v3 = [(NSMutableArray *)nodes countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(nodes);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) h];
        if (v6 < v8) {
          double v6 = v8;
        }
      }
      uint64_t v4 = [(NSMutableArray *)nodes countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }
  double v9 = 20.0;
  double v10 = v6;
  result.height = v10;
  result.double width = v9;
  return result;
}

- (void)centerNodesWithRespectoTo:(id)a3
{
  if (self->super.prev == a3)
  {
    uint64_t v5 = (void *)[(NSMutableArray *)self->super.nodes mutableCopy];
    [v5 sortUsingComparator:&__block_literal_global_152];
    double v6 = &__block_literal_global;
  }
  else
  {
    if (self->super.next != a3) {
      -[GVHorizontalRank centerNodesWithRespectoTo:]();
    }
    uint64_t v5 = (void *)[(NSMutableArray *)self->super.nodes mutableCopy];
    [v5 sortUsingComparator:&__block_literal_global_154];
    double v6 = &__block_literal_global_49;
  }
  uint64_t v7 = (void *)[v5 reverseObjectEnumerator];
  uint64_t v8 = [v7 nextObject];
  if (v8)
  {
    double v9 = (void *)v8;
    do
    {
      double v10 = (void *)[a3 neighborsOfNode:v9];
      if ([v10 count])
      {
        long long v11 = (uint64_t (*)(uint64_t, void *))*((void *)v6 + 2);
        unint64_t v12 = v11((uint64_t)v6, v9);
        medianX(v10);
        double v14 = v13;
        [v9 cx];
        double v16 = v14 - v15;
        if (v14 - v15 >= 0.0)
        {
          uint64_t v19 = [v9 next];
          if (v19)
          {
            v20 = (void *)v19;
            while (v11((uint64_t)v6, v20) < v12)
            {
              v20 = (void *)[v20 next];
              if (!v20) {
                goto LABEL_32;
              }
            }
            [v20 x];
            double v37 = v36;
            for (uint64_t i = v20; ; uint64_t i = v39)
            {
              v39 = (void *)[i prev];
              if (v39 == (void *)[v9 prev]) {
                break;
              }
              [v39 w];
              double v37 = v37 - (v40 + self->super.separation);
            }
            [v9 x];
            double v42 = v37 - v41;
            if (v16 >= v42) {
              double v16 = v42;
            }
          }
LABEL_32:
          [v9 x];
          [v9 setX:v16 + v43];
          if ([v9 next])
          {
            do
            {
              v44 = (void *)[v9 next];
              [v44 x];
              double v46 = v45;
              [v9 x];
              double v48 = v47;
              [v9 w];
              if (v46 >= v48 + v49 + self->super.separation) {
                break;
              }
              [v9 x];
              double v51 = v50;
              [v9 w];
              [v44 setX:v51 + v52 + self->super.separation];
              double v9 = v44;
            }
            while ([v44 next]);
          }
        }
        else
        {
          uint64_t v17 = [v9 prev];
          if (v17)
          {
            v18 = (void *)v17;
            while (v11((uint64_t)v6, v18) < v12)
            {
              v18 = (void *)[v18 prev];
              if (!v18) {
                goto LABEL_23;
              }
            }
            [v18 x];
            for (double j = v21; v18 != v9; v18 = (void *)[v18 next])
            {
              [v18 w];
              double j = j + v23 + self->super.separation;
            }
            [v9 x];
            double v25 = j - v24;
            if (v16 < v25) {
              double v16 = v25;
            }
          }
LABEL_23:
          [v9 x];
          [v9 setX:v16 + v26];
          if ([v9 prev])
          {
            do
            {
              v27 = (void *)[v9 prev];
              [v27 x];
              double v29 = v28;
              [v9 x];
              double v31 = v30 - self->super.separation;
              [v27 w];
              if (v29 <= v31 - v32) {
                break;
              }
              [v9 x];
              double v34 = v33 - self->super.separation;
              [v27 w];
              [v27 setX:v34 - v35];
              double v9 = v27;
            }
            while ([v27 prev]);
          }
        }
      }
      double v9 = (void *)[v7 nextObject];
    }
    while (v9);
  }
}

- (void)centerNode:(id)a3 at:(double)a4
{
  [a3 cx];
  double v8 = a4 - v7;
  if (a4 - v7 >= 0.0)
  {
    v18 = (void *)[a3 next];
    if (v18)
    {
      [v18 x];
      double v20 = v19;
      [a3 w];
      double v22 = v20 - v21 - self->super.separation;
      [a3 x];
      double v24 = v22 - v23;
      if (v8 >= v24) {
        double v17 = v24;
      }
      else {
        double v17 = v8;
      }
LABEL_10:
      [a3 x];
      double v26 = v25 + v17;
      [a3 setX:v26];
      return;
    }
  }
  else
  {
    double v9 = (void *)[a3 prev];
    if (v9)
    {
      double v10 = v9;
      [v9 x];
      double v12 = v11;
      [v10 w];
      double v14 = v12 + v13 + self->super.separation;
      [a3 x];
      double v16 = v14 - v15;
      if (v8 >= v16) {
        double v17 = v8;
      }
      else {
        double v17 = v16;
      }
      goto LABEL_10;
    }
  }

  [a3 setCx:a4];
}

- (void)centerNodesWithRespectoTo:.cold.1()
{
  __assert_rtn("-[GVHorizontalRank centerNodesWithRespectoTo:]", "GVLayout.m", 423, "rank == prev || rank == next");
}

@end