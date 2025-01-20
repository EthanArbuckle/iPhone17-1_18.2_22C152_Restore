@interface GVVerticalRank
- (CGSize)sizeForDummy;
- (GVVerticalRank)initWithSeparation:(CGSize)a3;
- (double)height;
- (double)width;
- (void)centerNode:(id)a3 at:(double)a4;
- (void)centerNodesWithRespectoTo:(id)a3;
@end

@implementation GVVerticalRank

- (GVVerticalRank)initWithSeparation:(CGSize)a3
{
  double height = a3.height;
  v5.receiver = self;
  v5.super_class = (Class)GVVerticalRank;
  result = [(GVRank *)&v5 initWithSeparation:a3.width];
  if (result) {
    result->super.separation = height;
  }
  return result;
}

- (double)width
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
      [*(id *)(*((void *)&v10 + 1) + 8 * i) w];
      if (v6 < v8) {
        double v6 = v8;
      }
    }
    uint64_t v4 = [(NSMutableArray *)nodes countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v6;
}

- (double)height
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
        [*(id *)(*((void *)&v11 + 1) + 8 * v8) h];
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
  result.double height = v9;
  result.width = v10;
  return result;
}

- (void)centerNodesWithRespectoTo:(id)a3
{
  if (self->super.prev == a3)
  {
    uint64_t v4 = (void *)[(NSMutableArray *)self->super.nodes mutableCopy];
    [v4 sortUsingComparator:&__block_literal_global_152];
    uint64_t v5 = &__block_literal_global_56;
  }
  else
  {
    if (self->super.next != a3) {
      -[GVVerticalRank centerNodesWithRespectoTo:]();
    }
    uint64_t v4 = (void *)[(NSMutableArray *)self->super.nodes mutableCopy];
    [v4 sortUsingComparator:&__block_literal_global_154];
    uint64_t v5 = &__block_literal_global_59;
  }
  double v6 = (void *)[v4 reverseObjectEnumerator];
  uint64_t v7 = [v6 nextObject];
  if (v7)
  {
    double v8 = (void *)v7;
    do
    {
      id v9 = [(GVRank *)self->super.prev neighborsOfNode:v8];
      if ([v9 count])
      {
        double v10 = (uint64_t (*)(uint64_t, void *))*((void *)v5 + 2);
        unint64_t v11 = v10((uint64_t)v5, v8);
        medianY(v9);
        double v13 = v12;
        [v8 cy];
        double v15 = v13 - v14;
        if (v13 - v14 >= 0.0)
        {
          uint64_t v18 = [v8 next];
          if (v18)
          {
            v19 = (void *)v18;
            while (v10((uint64_t)v5, v19) < v11)
            {
              v19 = (void *)[v19 next];
              if (!v19) {
                goto LABEL_32;
              }
            }
            [v19 y];
            double v36 = v35;
            for (uint64_t i = v19; ; uint64_t i = v38)
            {
              v38 = (void *)[i prev];
              if (v38 == (void *)[v8 prev]) {
                break;
              }
              [v38 h];
              double v36 = v36 - (v39 + self->super.separation);
            }
            [v8 y];
            double v41 = v36 - v40;
            if (v15 >= v41) {
              double v15 = v41;
            }
          }
LABEL_32:
          [v8 x];
          [v8 setX:v15 + v42];
          if ([v8 next])
          {
            do
            {
              v43 = (void *)[v8 next];
              [v43 x];
              double v45 = v44;
              [v8 y];
              double v47 = v46;
              [v8 h];
              if (v45 >= v47 + v48 + self->super.separation) {
                break;
              }
              [v8 y];
              double v50 = v49;
              [v8 h];
              [v43 setX:v50 + v51 + self->super.separation];
              double v8 = v43;
            }
            while ([v43 next]);
          }
        }
        else
        {
          uint64_t v16 = [v8 prev];
          if (v16)
          {
            v17 = (void *)v16;
            while (v10((uint64_t)v5, v17) < v11)
            {
              v17 = (void *)[v17 prev];
              if (!v17) {
                goto LABEL_23;
              }
            }
            [v17 y];
            for (double j = v20; v17 != v8; v17 = (void *)[v17 next])
            {
              [v17 h];
              double j = j + v22 + self->super.separation;
            }
            [v8 y];
            double v24 = j - v23;
            if (v15 < v24) {
              double v15 = v24;
            }
          }
LABEL_23:
          [v8 y];
          [v8 setY:v15 + v25];
          if ([v8 prev])
          {
            do
            {
              v26 = (void *)[v8 prev];
              [v26 y];
              double v28 = v27;
              [v8 y];
              double v30 = v29 - self->super.separation;
              [v26 h];
              if (v28 <= v30 - v31) {
                break;
              }
              [v8 y];
              double v33 = v32 - self->super.separation;
              [v26 h];
              [v26 setY:v33 - v34];
              double v8 = v26;
            }
            while ([v26 prev]);
          }
        }
      }
      double v8 = (void *)[v6 nextObject];
    }
    while (v8);
  }
}

- (void)centerNode:(id)a3 at:(double)a4
{
  [a3 cy];
  double v8 = a4 - v7;
  if (a4 - v7 >= 0.0)
  {
    uint64_t v18 = (void *)[a3 next];
    if (v18)
    {
      [v18 y];
      double v20 = v19;
      [a3 h];
      double v22 = v20 - v21 - self->super.separation;
      [a3 y];
      double v24 = v22 - v23;
      if (v8 >= v24) {
        double v17 = v24;
      }
      else {
        double v17 = v8;
      }
LABEL_10:
      [a3 y];
      double v26 = v25 + v17;
      [a3 setY:v26];
      return;
    }
  }
  else
  {
    id v9 = (void *)[a3 prev];
    if (v9)
    {
      double v10 = v9;
      [v9 y];
      double v12 = v11;
      [v10 h];
      double v14 = v12 + v13 + self->super.separation;
      [a3 y];
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

  [a3 setCy:a4];
}

- (void)centerNodesWithRespectoTo:.cold.1()
{
  __assert_rtn("-[GVVerticalRank centerNodesWithRespectoTo:]", "GVLayout.m", 605, "rank == prev || rank == next");
}

@end