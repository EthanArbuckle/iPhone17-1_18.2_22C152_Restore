@interface CPCompoundGraphicMaker
+ (BOOL)makeCompoundGraphicsInZonesOf:(id)a3;
- (BOOL)findClusterLevel;
- (BOOL)groupOverlappingGraphics;
- (BOOL)makeCompoundGraphics;
- (BOOL)makeCompoundGraphicsFromShapeGroups;
- (CPCompoundGraphicMaker)initWithGraphicsIn:(id)a3 ofClass:(Class)a4;
- (void)addGroupInfoWithIndex:(unsigned int)a3 bounds:(CGRect)a4;
- (void)coalesceShapeGroups;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
- (void)makeCompoundGraphicFromShapesAtIndex:(unsigned int)a3 count:(unsigned int)a4;
@end

@implementation CPCompoundGraphicMaker

- (BOOL)makeCompoundGraphics
{
  if (self->shapeCount < 2) {
    return 0;
  }
  objc_msgSend(-[CPObject page](self->parentChunk, "page"), "pageCropBox");
  double v6 = v4 + v5;
  if (v4 + v5 <= 0.0) {
    double v6 = 1.0;
  }
  self->pageSpread = v6;
  uint64_t v7 = self->shapeCount - 1;
  v8 = (char *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
  [*self->shapes renderedBounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (self->shapesAreVectorGraphics)
  {
    if (v7)
    {
      uint64_t v17 = 0;
      do
      {
        [self->shapes[v17 + 1] renderedBounds];
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        v52.origin.x = v10;
        v52.origin.y = v12;
        v52.size.width = v14;
        v52.size.height = v16;
        v56.origin.x = v19;
        v56.origin.y = v21;
        v56.size.width = v23;
        v56.size.height = v25;
        CGRect v53 = CGRectUnion(v52, v56);
        *(double *)&v8[v17 * 8] = (v53.size.width + v53.size.height) / self->pageSpread;
        ++v17;
        double v16 = v25;
        double v14 = v23;
        CGFloat v12 = v21;
        CGFloat v10 = v19;
      }
      while (v7 != v17);
    }
    goto LABEL_29;
  }
  if (v7)
  {
    for (uint64_t i = 0; v7 != i; ++i)
    {
      CGFloat v27 = v10;
      CGFloat v28 = v12;
      double v29 = v14;
      double v30 = v16;
      [self->shapes[i + 1] renderedBounds];
      CGFloat v10 = v31;
      CGFloat v12 = v32;
      double v14 = v33;
      double v16 = v34;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      objc_opt_class();
      char v36 = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        if ((v36 & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_22;
          }
LABEL_20:
          double v37 = v10;
          double v38 = v12;
          double v39 = v14;
          double v40 = v16;
          double v41 = v27;
          double v42 = v28;
          double v43 = v29;
          double v44 = v30;
          goto LABEL_21;
        }
        if (fabs(v29 * v30) >= fabs(v14 * v16)) {
          goto LABEL_20;
        }
      }
      else if ((v36 & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
LABEL_22:
        v54.origin.x = v27;
        v54.origin.y = v28;
        v54.size.width = v29;
        v54.size.height = v30;
        v57.origin.x = v10;
        v57.origin.y = v12;
        v57.size.width = v14;
        v57.size.height = v16;
        CGRect v55 = CGRectIntersection(v54, v57);
        double v46 = fabs(v55.size.width * v55.size.height);
        double v47 = fabs(v29 * v30) + fabs(v14 * v16) - v46;
        if (v47 >= v46) {
          double v48 = v47;
        }
        else {
          double v48 = v46;
        }
        double v49 = 1.0;
        if (v48 > 0.0) {
          double v49 = 1.0 - v46 / v48;
        }
        *(double *)&v8[i * 8] = v49;
        continue;
      }
      double v37 = v27;
      double v38 = v28;
      double v39 = v29;
      double v40 = v30;
      double v41 = v10;
      double v42 = v12;
      double v43 = v14;
      double v44 = v16;
LABEL_21:
      nonOverlapOfFirst(v37, v38, v39, v40, v41, v42, v43, v44);
      *(void *)&v8[i * 8] = v45;
    }
  }
LABEL_29:
  v50 = [[CPCluster alloc] initWithProfile:&kCPClusterProfileCompoundGraphic];
  self->cluster = v50;
  [(CPCluster *)v50 findClustersFromDifferences:v8 count:v7];
  if ([(CPCompoundGraphicMaker *)self findClusterLevel]) {
    BOOL v2 = [(CPCompoundGraphicMaker *)self groupOverlappingGraphics];
  }
  else {
    BOOL v2 = 0;
  }
  free(v8);
  return v2;
}

- (BOOL)groupOverlappingGraphics
{
  cluster = self->cluster;
  if (cluster)
  {
    [(CPCluster *)cluster largestClusterStatistics];
    size_t v4 = 40 * (v38 + 2);
  }
  else
  {
    size_t v4 = 80;
  }
  self->groupInfoArradouble y = ($DEE827FB4129A4F8C30FAEB1E954309B *)malloc_type_malloc(v4, 0x1000040B4E0BC51uLL);
  unsigned int v5 = [(CPCluster *)self->cluster clusterCount];
  if (v5)
  {
    unsigned int v6 = v5;
    int v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    unsigned int v36 = v5;
    while (1)
    {
      CGFloat v10 = self->cluster;
      if (!v10)
      {
        unsigned int v11 = 0;
        unsigned int v37 = 0;
        goto LABEL_31;
      }
      [(CPCluster *)v10 clusterStatisticsAtIndex:v9];
      unsigned int v11 = v37;
      if (v37 >= 2)
      {
        unsigned int v12 = v37 + v8;
        id v13 = self->shapes[v8];
        self->groupInfoCount = 0;
        uint64_t v14 = (v8 + 1);
        if (v14 <= v37 + v8 && v13 != 0) {
          break;
        }
      }
LABEL_31:
      uint64_t v8 = v11 + v8;
      uint64_t v9 = (v9 + 1);
      if (v9 == v6) {
        return v7 & 1;
      }
    }
    uint64_t v16 = 0;
    double width = 0.0;
    int v18 = 1;
    double x = INFINITY;
    uint64_t v20 = v8;
    double y = INFINITY;
    double height = 0.0;
    while (1)
    {
      if (v18 == 1)
      {
        [v13 renderedBounds];
        double x = v23;
        double y = v24;
        double width = v25;
        double height = v26;
        uint64_t v16 = [v13 zOrder];
      }
      if (v14 >= v12) {
        break;
      }
      id v13 = self->shapes[v14];
      if (!v13) {
        goto LABEL_23;
      }
      if (!self->shapesAreVectorGraphics) {
        goto LABEL_21;
      }
      if ([v13 zOrder] > v16 + 1) {
        goto LABEL_23;
      }
      if (!self->shapesAreVectorGraphics) {
        goto LABEL_21;
      }
      [v13 renderedBounds];
      v42.origin.double x = v27;
      v42.origin.double y = v28;
      v42.size.double width = v29;
      v42.size.double height = v30;
      v39.origin.double x = x;
      v39.origin.double y = y;
      v39.size.double width = width;
      v39.size.double height = height;
      if (CGRectIntersectsRect(v39, v42))
      {
LABEL_21:
        [v13 renderedBounds];
        v43.origin.double x = v31;
        v43.origin.double y = v32;
        v43.size.double width = v33;
        v43.size.double height = v34;
        v40.origin.double x = x;
        v40.origin.double y = y;
        v40.size.double width = width;
        v40.size.double height = height;
        CGRect v41 = CGRectUnion(v40, v43);
        double x = v41.origin.x;
        double y = v41.origin.y;
        double width = v41.size.width;
        double height = v41.size.height;
        ++v18;
        uint64_t v16 = [v13 zOrder];
        goto LABEL_25;
      }
      -[CPCompoundGraphicMaker addGroupInfoWithIndex:bounds:](self, "addGroupInfoWithIndex:bounds:", v20, x, y, width, height);
LABEL_24:
      int v18 = 1;
      uint64_t v20 = v14;
LABEL_25:
      uint64_t v14 = (v20 + v18);
      if (v14 > v12 || !v13)
      {
        unsigned int v6 = v36;
        unsigned int v11 = v37;
        goto LABEL_31;
      }
    }
    id v13 = 0;
LABEL_23:
    -[CPCompoundGraphicMaker addGroupInfoWithIndex:bounds:](self, "addGroupInfoWithIndex:bounds:", v20, x, y, width, height);
    -[CPCompoundGraphicMaker addGroupInfoWithIndex:bounds:](self, "addGroupInfoWithIndex:bounds:", v14, INFINITY, INFINITY, 0.0, 0.0);
    v7 |= [(CPCompoundGraphicMaker *)self makeCompoundGraphicsFromShapeGroups];
    self->groupInfoCount = 0;
    goto LABEL_24;
  }
  LOBYTE(v7) = 0;
  return v7 & 1;
}

- (BOOL)makeCompoundGraphicsFromShapeGroups
{
  if (self->shapesAreVectorGraphics) {
    [(CPCompoundGraphicMaker *)self coalesceShapeGroups];
  }
  unint64_t groupInfoCount = self->groupInfoCount;
  if (groupInfoCount < 2) {
    return 0;
  }
  uint64_t v4 = 0;
  BOOL v5 = 0;
  for (unint64_t i = 1; i < groupInfoCount; ++i)
  {
    groupInfoArradouble y = self->groupInfoArray;
    if (groupInfoArray[v4 + 1].var0 - groupInfoArray[v4].var0 >= 2
      && (!self->shapesAreVectorGraphics
       || groupInfoArray[v4].var1.size.width + groupInfoArray[v4].var1.size.height <= self->pageSpread * 0.4))
    {
      -[CPCompoundGraphicMaker makeCompoundGraphicFromShapesAtIndex:count:](self, "makeCompoundGraphicFromShapesAtIndex:count:");
      unint64_t groupInfoCount = self->groupInfoCount;
      BOOL v5 = 1;
    }
    ++v4;
  }
  return v5;
}

- (void)coalesceShapeGroups
{
  unsigned int groupInfoCount = self->groupInfoCount;
  if (groupInfoCount >= 2)
  {
    groupInfoArraCGFloat y = self->groupInfoArray;
    CGFloat width = groupInfoArray->var1.size.width;
    CGFloat height = groupInfoArray->var1.size.height;
    CGFloat x = groupInfoArray->var1.origin.x;
    CGFloat y = groupInfoArray->var1.origin.y;
    for (unsigned int i = 1; i < groupInfoCount; ++i)
    {
      p_var0 = (double *)&groupInfoArray[i].var0;
      CGFloat v11 = p_var0[1];
      CGFloat v12 = p_var0[2];
      CGFloat v13 = p_var0[3];
      CGFloat v14 = p_var0[4];
      v18.origin.CGFloat x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      v20.origin.CGFloat x = v11;
      v20.origin.CGFloat y = v12;
      v20.size.CGFloat width = v13;
      v20.size.CGFloat height = v14;
      if (CGRectIntersectsRect(v18, v20))
      {
        unsigned int v15 = groupInfoCount - 1;
        self->unsigned int groupInfoCount = groupInfoCount - 1;
        unsigned int groupInfoCount = i;
        unsigned int v16 = v15 - i;
        if (v16)
        {
          memmove(&groupInfoArray[i], p_var0 + 5, 40 * v16);
          groupInfoArraCGFloat y = self->groupInfoArray;
          unsigned int groupInfoCount = self->groupInfoCount;
        }
        v19.origin.CGFloat x = x;
        v19.origin.CGFloat y = y;
        v19.size.CGFloat width = width;
        v19.size.CGFloat height = height;
        v21.origin.CGFloat x = v11;
        v21.origin.CGFloat y = v12;
        v21.size.CGFloat width = v13;
        v21.size.CGFloat height = v14;
        groupInfoArray[i - 1].var1 = CGRectUnion(v19, v21);
        if (i == 1) {
          unsigned int i = 0;
        }
        else {
          i -= 2;
        }
        uint64_t v17 = (double *)&groupInfoArray[i].var0;
        CGFloat x = v17[1];
        CGFloat y = v17[2];
        CGFloat width = v17[3];
        CGFloat height = v17[4];
      }
      else
      {
        CGFloat height = v14;
        CGFloat width = v13;
        CGFloat y = v12;
        CGFloat x = v11;
      }
    }
  }
}

- (void)makeCompoundGraphicFromShapesAtIndex:(unsigned int)a3 count:(unsigned int)a4
{
  CGFloat v12 = objc_alloc_init(CPCompoundGraphic);
  unsigned int v7 = a4 + a3;
  if (v7 > a3)
  {
    char v8 = 0;
    uint64_t v9 = a3;
LABEL_3:
    int v10 = v7 - v9;
    do
    {
      id v11 = self->shapes[v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(CPChunk *)v12 addChildrenOf:v11];
        [v11 remove];
        ++v9;
        char v8 = 1;
        if (v7 != v9) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
      [(CPChunk *)v12 add:v11];
      ++v9;
      --v10;
    }
    while (v10);
    if ((v8 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_10:
    [(CPChunk *)v12 sortUsingSelector:sel_compareZ_];
  }
LABEL_11:
  [(CPChunk *)self->parentChunk add:v12];
}

- (void)addGroupInfoWithIndex:(unsigned int)a3 bounds:(CGRect)a4
{
  groupInfoArraCGFloat y = self->groupInfoArray;
  groupInfoArray[self->groupInfoCount].var0 = a3;
  unsigned int groupInfoCount = self->groupInfoCount;
  groupInfoArray[groupInfoCount].var1 = a4;
  self->unsigned int groupInfoCount = groupInfoCount + 1;
}

- (BOOL)findClusterLevel
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->shapesAreVectorGraphics) {
    double v3 = 0.4;
  }
  else {
    double v3 = 0.75;
  }
  if (self->shapesAreVectorGraphics) {
    double v4 = 0.2;
  }
  else {
    double v4 = 0.5;
  }
  unsigned int v5 = [(CPCluster *)self->cluster levels];
  if (v5)
  {
    unsigned int v6 = v5;
    char v7 = 0;
    uint64_t v8 = 0;
    while (1)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      cluster = self->cluster;
      if (cluster)
      {
        [(CPCluster *)cluster differenceClusterStatisticsAtIndex:v8];
        double v11 = *((double *)&v19 + 1);
        double v10 = *(double *)&v20;
      }
      else
      {
        double v10 = 0.0;
        double v11 = 0.0;
      }
      BOOL v12 = v10 > v3 && v11 < v4;
      v7 |= v12;
      if (v11 >= v4 || v10 > v3) {
        break;
      }
      uint64_t v8 = (v8 + 1);
      if (v6 == v8)
      {
        LODWORD(v8) = v6;
        break;
      }
    }
    if (v7)
    {
      LODWORD(v19) = 1;
      *((double *)&v19 + 1) = v4;
      *(double *)&long long v20 = v4;
      *((double *)&v20 + 1) = v4;
      int v21 = 1;
      double v22 = v3;
      double v23 = v3;
      double v24 = v3;
      LODWORD(v8) = v8
                  + [(CPCluster *)self->cluster applyDifferenceHints:&v19 count:2];
    }
    else if (v8 >= 2)
    {
      CGFloat v14 = self->cluster;
      if (v14)
      {
        [(CPCluster *)v14 differenceClusterStatisticsAtIndex:(v8 - 1)];
        double v15 = *(double *)&v18;
        CGFloat v14 = self->cluster;
      }
      else
      {
        long long v17 = 0u;
        long long v18 = 0u;
        double v15 = 0.0;
      }
      LODWORD(v8) = 1;
      LODWORD(v19) = 1;
      if (v15 < v4) {
        double v15 = v4;
      }
      *((double *)&v19 + 1) = v15;
      *(double *)&long long v20 = v15;
      *((double *)&v20 + 1) = v15;
      -[CPCluster applyDifferenceHints:count:](v14, "applyDifferenceHints:count:", &v19, 1, v17, v18);
    }
  }
  else
  {
    LODWORD(v8) = 0;
  }
  return v8 != 0;
}

- (void)dealloc
{
  [(CPCompoundGraphicMaker *)self dispose];

  v3.receiver = self;
  v3.super_class = (Class)CPCompoundGraphicMaker;
  [(CPCompoundGraphicMaker *)&v3 dealloc];
}

- (void)finalize
{
  [(CPCompoundGraphicMaker *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPCompoundGraphicMaker;
  [(CPCompoundGraphicMaker *)&v3 finalize];
}

- (void)dispose
{
  if (!self->disposed)
  {
    [(CPCluster *)self->cluster dispose];
    free(self->groupInfoArray);
    free(self->shapes);
    self->disposed = 1;
  }
}

- (CPCompoundGraphicMaker)initWithGraphicsIn:(id)a3 ofClass:(Class)a4
{
  v17.receiver = self;
  v17.super_class = (Class)CPCompoundGraphicMaker;
  unsigned int v6 = [(CPCompoundGraphicMaker *)&v17 init];
  char v7 = v6;
  if (v6)
  {
    v6->parentChunk = (CPChunk *)a3;
    v6->shapesAreVectorGraphics = objc_opt_class() == (void)a4;
    unsigned int v8 = [(CPObject *)v7->parentChunk countOfClass:a4];
    v7->uint64_t shapeCount = v8;
    if (v8)
    {
      v7->shapes = (id *)malloc_type_malloc(8 * v8, 0x80040B8603338uLL);
      id v9 = [(CPObject *)v7->parentChunk children];
      shapes = (uint64_t *)v7->shapes;
      uint64_t shapeCount = v7->shapeCount;
      uint64_t v12 = [v9 count];
      if (v12)
      {
        uint64_t v13 = 0;
        CGFloat v14 = &shapes[shapeCount];
        do
        {
          uint64_t v15 = [v9 objectAtIndex:v13];
          if (objc_opt_isKindOfClass())
          {
            *shapes++ = v15;
            if (shapes == v14) {
              break;
            }
          }
          ++v13;
        }
        while (v12 != v13);
      }
      qsort(v7->shapes, v7->shapeCount, 8uLL, (int (__cdecl *)(const void *, const void *))compareZOrder);
    }
  }
  return v7;
}

+ (BOOL)makeCompoundGraphicsInZonesOf:(id)a3
{
  double v4 = [[CPCompoundGraphicMaker alloc] initWithGraphicsIn:a3 ofClass:objc_opt_class()];
  BOOL v5 = [(CPCompoundGraphicMaker *)v4 makeCompoundGraphics];
  [(CPCompoundGraphicMaker *)v4 dispose];

  unsigned int v6 = [[CPCompoundGraphicMaker alloc] initWithGraphicsIn:a3 ofClass:objc_opt_class()];
  int v7 = [(CPCompoundGraphicMaker *)v6 makeCompoundGraphics] || v5;
  [(CPCompoundGraphicMaker *)v6 dispose];

  unsigned int v8 = (void *)[a3 children];
  uint64_t v9 = [v8 count];
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      uint64_t v11 = [v8 objectAtIndex:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v7 |= +[CPCompoundGraphicMaker makeCompoundGraphicsInZonesOf:v11];
      }
    }
  }
  return v7 & 1;
}

@end