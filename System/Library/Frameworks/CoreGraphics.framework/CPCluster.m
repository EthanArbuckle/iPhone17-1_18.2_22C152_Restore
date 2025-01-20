@interface CPCluster
+ (unsigned)createOrderIndexFor:(double *)a3 ofSize:(unsigned int)a4;
+ (void)clusterTextLine:(id)a3;
+ (void)clusterTextLine:(id)a3 withCluster:(id)a4 atLevel:(unsigned int)a5 withMaximumWordGap:(double *)a6 andMaximumLetterGap:(double *)a7;
+ (void)reclusterTextLine:(id)a3 fromWordIndex:(unsigned int)a4 count:(unsigned int *)a5;
- ($CAD616572B4749F850842224FCF53B5F)clusterStatisticsAtIndex:(SEL)a3;
- ($CAD616572B4749F850842224FCF53B5F)differenceClusterStatisticsAtIndex:(SEL)a3;
- ($CAD616572B4749F850842224FCF53B5F)largestClusterStatistics;
- (BOOL)applyDifferenceHints:(id *)a3 count:(unsigned int)a4;
- (BOOL)coalesceFrom:(unsigned int)a3 to:(unsigned int)a4;
- (BOOL)joinClosestLevelPairFrom:(unsigned int)a3 to:(unsigned int)a4;
- (BOOL)joinLevelsFrom:(unsigned int)a3 to:(unsigned int)a4;
- (BOOL)splitLevelAtIndex:(unsigned int)a3 betweenValue:(double)a4 andValue:(double)a5;
- (CPCluster)init;
- (CPCluster)initWithProfile:(id *)a3;
- (unsigned)clusterCount;
- (unsigned)levels;
- (void)analyzeDensities;
- (void)analyzeDifferences;
- (void)assembleDataStats;
- (void)assembleDensityDifferenceStats;
- (void)assembleDifferenceStats;
- (void)computeDataFromDifferences;
- (void)computeDifferencesFromData;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
- (void)findClusters:(double *)a3 count:(unsigned int)a4;
- (void)findClustersFromCharacterSequence:(id)a3 withSpaceHint:(BOOL)a4;
- (void)findClustersFromDifferences:(double *)a3 count:(unsigned int)a4;
- (void)findDensityClusters:(double *)a3 count:(unsigned int)a4;
- (void)makeWords:(id *)a3 count:(unsigned int)a4 fromCharacterSequence:(id)a5 charOffset:(unsigned int)a6;
- (void)resetAnalysis;
- (void)setMaximumClusterSpread:(double)a3;
- (void)setMinimumClusterSize:(unsigned int)a3;
- (void)setMinimumRecognizedInterClusterDifference:(double)a3;
- (void)setMinimumRecognizedInterLevel2ndDifference:(double)a3;
- (void)splitSecondDifferences;
- (void)tryLevel0SplitBetween:(double)a3 and:(double)a4 usingHints:(id *)a5;
@end

@implementation CPCluster

- ($CAD616572B4749F850842224FCF53B5F)largestClusterStatistics
{
  result = ($CAD616572B4749F850842224FCF53B5F *)[(CPCluster *)self assembleDataStats];
  xStats = self->xStats;
  if (!xStats) {
    goto LABEL_10;
  }
  uint64_t clusterCount = self->clusterCount;
  if (!clusterCount) {
    goto LABEL_10;
  }
  uint64_t v8 = 0;
  LODWORD(v9) = 0;
  unsigned int v10 = 0;
  v11 = self->xStats;
  do
  {
    unsigned int var0 = v11->var0;
    ++v11;
    unsigned int v12 = var0;
    if (var0 <= v10)
    {
      uint64_t v9 = v9;
    }
    else
    {
      unsigned int v10 = v12;
      uint64_t v9 = v8;
    }
    ++v8;
  }
  while (clusterCount != v8);
  if (v10)
  {
    v14 = &xStats[v9];
    long long v15 = *(_OWORD *)&v14->var2;
    *(_OWORD *)&retstr->unsigned int var0 = *(_OWORD *)&v14->var0;
    *(_OWORD *)&retstr->var2 = v15;
  }
  else
  {
LABEL_10:
    *(_OWORD *)&retstr->unsigned int var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }
  return result;
}

- ($CAD616572B4749F850842224FCF53B5F)differenceClusterStatisticsAtIndex:(SEL)a3
{
  uint64_t v4 = *(void *)&self[4].var0;
  if (v4)
  {
    v5 = (_OWORD *)(v4 + 32 * a4);
    long long v6 = v5[1];
    *(_OWORD *)&retstr->unsigned int var0 = *v5;
    *(_OWORD *)&retstr->var2 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->unsigned int var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }
  return self;
}

- ($CAD616572B4749F850842224FCF53B5F)clusterStatisticsAtIndex:(SEL)a3
{
  result = ($CAD616572B4749F850842224FCF53B5F *)[(CPCluster *)self assembleDataStats];
  xStats = self->xStats;
  if (xStats)
  {
    uint64_t v9 = &xStats[a4];
    long long v10 = *(_OWORD *)&v9->var2;
    *(_OWORD *)&retstr->unsigned int var0 = *(_OWORD *)&v9->var0;
    *(_OWORD *)&retstr->var2 = v10;
  }
  else
  {
    *(_OWORD *)&retstr->unsigned int var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }
  return result;
}

- (unsigned)levels
{
  return self->levels;
}

- (unsigned)clusterCount
{
  if (self->minClusterSize || self->maxClusterSpread != 1.79769313e308)
  {
    [(CPCluster *)self assembleDataStats];
    return self->clusterCount;
  }
  else
  {
    unsigned int interClusterMinIndex = self->interClusterMinIndex;
    unsigned int xCount = self->xCount;
    BOOL v6 = xCount >= interClusterMinIndex;
    unsigned int v7 = xCount - interClusterMinIndex;
    if (v6) {
      unsigned int result = v7;
    }
    else {
      unsigned int result = 0;
    }
    self->uint64_t clusterCount = result;
  }
  return result;
}

- (BOOL)applyDifferenceHints:(id *)a3 count:(unsigned int)a4
{
  char v4 = 0;
  if (a3 && a4 && self->levels)
  {
    char v7 = 0;
    uint64_t v8 = a4;
    p_double var2 = &a3->var2;
    double v10 = 0.0;
    uint64_t v11 = a4;
    do
    {
      if (*((_DWORD *)p_var2 - 4))
      {
        if ((v7 & 1) != 0 && *(p_var2 - 1) <= v10)
        {
          char v4 = 0;
          return v4 & 1;
        }
        double v10 = *p_var2;
        char v7 = 1;
      }
      p_var2 += 4;
      --v11;
    }
    while (v11);
    unint64_t v12 = 0;
    LOBYTE(v13) = 0;
    unint64_t v14 = 0;
    char v15 = 0;
    int v16 = 0;
    char v4 = 0;
    double v17 = 0.0;
    do
    {
      if (a3[v12].var0)
      {
        v18 = &a3[v12];
        double var1 = v18->var1;
        unsigned int levels = self->levels;
        dxStats = self->dxStats;
        uint64_t v22 = levels - 1;
        if (levels == 1)
        {
          LODWORD(v23) = 0;
        }
        else
        {
          uint64_t v23 = 0;
          v24 = &dxStats->var2;
          while (*v24 < var1)
          {
            ++v23;
            v24 += 4;
            if (v22 == v23)
            {
              LODWORD(v23) = levels - 1;
              break;
            }
          }
        }
        double var2 = v18->var2;
        p_double var1 = &dxStats[v22].var1;
        do
        {
          if (!--levels) {
            break;
          }
          double v27 = *p_var1;
          p_var1 -= 4;
        }
        while (v27 > var2);
        double v28 = dxStats[v23].var1;
        v29 = &dxStats[levels];
        if (var1 >= v28) {
          double v30 = var1;
        }
        else {
          double v30 = v28;
        }
        if (var2 <= v29->var2) {
          double v31 = var2;
        }
        else {
          double v31 = v29->var2;
        }
        if (v12) {
          unint64_t v32 = v23;
        }
        else {
          unint64_t v32 = 0;
        }
        if (v32 < levels)
        {
          BOOL v13 = -[CPCluster joinLevelsFrom:to:](self, "joinLevelsFrom:to:", v32);
          if (v32) {
            BOOL v33 = 0;
          }
          else {
            BOOL v33 = v13;
          }
          v16 |= v33;
        }
        if ((v15 & (v32 <= v14)) == 1)
        {
          BOOL v13 = [(CPCluster *)self splitLevelAtIndex:v32 betweenValue:v17 andValue:v30];
          BOOL v34 = !v13;
          if (v13) {
            v16 |= v32 == 0;
          }
          LOBYTE(v13) = v13;
          if (v34) {
            unint64_t v32 = v32;
          }
          else {
            unint64_t v32 = (v32 + 1);
          }
        }
        if (v12 < v32)
        {
          while ([(CPCluster *)self joinClosestLevelPairFrom:v14 to:v32])
          {
            v16 |= v14 == 0;
            unint64_t v32 = (v32 - 1);
            if (v32 <= v12)
            {
              LOBYTE(v13) = 1;
              unint64_t v35 = v32;
              goto LABEL_47;
            }
          }
          LOBYTE(v13) = 0;
        }
        unint64_t v35 = v32;
LABEL_47:
        if (v12 > v35)
        {
          uint64_t v36 = (32 * v35) | 8;
          while (1)
          {
            BOOL v13 = [(CPCluster *)self splitLevelAtIndex:v35 betweenValue:*(double *)((char *)&self->dxStats->var0 + v36) andValue:v30];
            if (!v13) {
              break;
            }
            v16 |= v35++ == 0;
            v36 += 32;
            if (v12 == v35)
            {
              unint64_t v32 = v12;
              goto LABEL_53;
            }
          }
          unint64_t v32 = v35;
        }
LABEL_53:
        v4 |= v13;
        char v15 = 1;
        unint64_t v14 = v32;
        double v17 = v31;
      }
      ++v12;
    }
    while (v12 != v8);
    if (v16)
    {
      free(self->xStats);
      self->xStats = 0;
    }
  }
  return v4 & 1;
}

- (void)findDensityClusters:(double *)a3 count:(unsigned int)a4
{
  if (a4)
  {
    self->unsigned int xCount = a4;
    self->x = a3;
    [(CPCluster *)self computeDifferencesFromData];
    [(CPCluster *)self analyzeDensities];
  }
}

- (void)findClustersFromDifferences:(double *)a3 count:(unsigned int)a4
{
  self->unsigned int xCount = a4 + 1;
  self->dx = a3;
  [(CPCluster *)self analyzeDifferences];
}

- (void)findClusters:(double *)a3 count:(unsigned int)a4
{
  if (a4)
  {
    self->unsigned int xCount = a4;
    self->x = a3;
    [(CPCluster *)self computeDifferencesFromData];
    [(CPCluster *)self analyzeDifferences];
  }
}

- (void)analyzeDensities
{
  if (!self->x) {
    __assert_rtn("-[CPCluster analyzeDensities]", "CPCluster.m", 844, "x");
  }
  unsigned int xCount = self->xCount;
  if (xCount >= 2)
  {
    self->dxOrderIndex = +[CPCluster createOrderIndexFor:self->dx ofSize:xCount - 1];
    uint64_t v4 = self->xCount;
    if (v4 == 2)
    {
      [(CPCluster *)self resetAnalysis];
      return;
    }
    v5 = (unsigned int *)malloc_type_malloc(4 * v4, 0x100004052888210uLL);
    unsigned int *v5 = self->xCount - 1;
    unsigned int v6 = self->xCount;
    double v7 = self->dx[self->dxOrderIndex[v6 - 2]];
    self->unsigned int interClusterMinIndex = v6 - 1;
    self->uint64_t clusterCount = 0;
    if (v6)
    {
      unsigned int v8 = 0;
      double v9 = 0.0;
      while (1)
      {
        unsigned int v10 = v6;
        while (1)
        {
          unsigned int v6 = v10 - 1;
          uint64_t clusterCount = self->clusterCount;
          LODWORD(v12) = clusterCount + 1;
          self->uint64_t clusterCount = clusterCount + 1;
          if ((clusterCount + 1) < 2) {
            break;
          }
          if (v7 == 0.0) {
            goto LABEL_45;
          }
          unsigned int v13 = self->dxOrderIndex[v6];
          if (*v5 <= v13) {
            unsigned int v14 = clusterCount;
          }
          else {
            unsigned int v14 = 0;
          }
          if (v14 >= 2)
          {
            unsigned int v15 = 0;
            unsigned int v14 = clusterCount;
            do
            {
              if (v5[(v14 + v15) >> 1] <= v13) {
                unsigned int v15 = (v14 + v15) >> 1;
              }
              else {
                unsigned int v14 = (v14 + v15) >> 1;
              }
            }
            while (v15 + 1 < v14);
          }
          unsigned int v16 = clusterCount - v14;
          if (clusterCount != v14)
          {
            uint64_t clusterCount = v14;
            memmove(&v5[v14 + 1], &v5[v14], 4 * v16);
          }
          v5[clusterCount] = v13;
          if (v10 == 1
            || (v17 = self->dx[self->dxOrderIndex[v10 - 2]] < v7, double v7 = self->dx[self->dxOrderIndex[v10 - 2]], v17))
          {
            if (v7 <= self->maxClusterSpread)
            {
              LODWORD(v12) = self->clusterCount;
              break;
            }
          }
          --v10;
          if (!v6) {
            goto LABEL_45;
          }
        }
        if (!v12) {
          break;
        }
        unsigned __int8 v18 = 0;
        unsigned int v19 = 0;
        unsigned int minClusterSize = self->minClusterSize;
        double v21 = 0.0;
        uint64_t v22 = v5;
        uint64_t v12 = v12;
        do
        {
          unsigned int v24 = *v22++;
          uint64_t v23 = v24;
          unsigned int v25 = v24 + 1;
          unsigned int v26 = v24 + 1 - v19;
          if (v26 >= minClusterSize && self->x[v23] - self->x[v19] <= self->maxClusterSpread)
          {
            double v21 = v21 + (double)(v26 - minClusterSize) * (double)(v26 - minClusterSize);
            if (v26 <= v8)
            {
              v18 |= v26 == v8;
            }
            else
            {
              self->unsigned int interClusterMinIndex = v6;
              unsigned int v8 = v25 - v19;
            }
          }
          unsigned int v19 = v25;
          --v12;
        }
        while (v12);
        if ((v18 & (v21 > v9)) == 0) {
          goto LABEL_41;
        }
        self->unsigned int interClusterMinIndex = v6;
        unsigned int interClusterMinIndex = v10 - 1;
LABEL_42:
        if (interClusterMinIndex == v6) {
          double v9 = v21;
        }
        if (v10 == 1) {
          goto LABEL_45;
        }
      }
      double v21 = 0.0;
LABEL_41:
      unsigned int interClusterMinIndex = self->interClusterMinIndex;
      goto LABEL_42;
    }
LABEL_45:
    free(v5);
    [(CPCluster *)self assembleDensityDifferenceStats];
  }
}

- (void)assembleDensityDifferenceStats
{
  if (!self->dxStats)
  {
    unsigned int v3 = self->interClusterMinIndex + 1 >= self->xCount ? 1 : 2;
    self->unsigned int levels = v3;
    uint64_t v4 = ($CAD616572B4749F850842224FCF53B5F *)malloc_type_malloc(32 * v3, 0x100004089CA3EB1uLL);
    self->dxStats = v4;
    v4->unsigned int var0 = self->interClusterMinIndex;
    uint64_t interClusterMinIndex = self->interClusterMinIndex;
    if (interClusterMinIndex)
    {
      dx = self->dx;
      dxOrderIndex = self->dxOrderIndex;
      uint64_t v8 = dxOrderIndex[(interClusterMinIndex - 1)];
      v4->double var1 = dx[*dxOrderIndex];
      v4->double var2 = dx[v8];
      double v9 = 0.0;
      uint64_t v10 = interClusterMinIndex;
      do
      {
        int v11 = *dxOrderIndex++;
        double v9 = v9 + dx[v11];
        --v10;
      }
      while (v10);
      v4->var3 = v9 / (double)interClusterMinIndex;
    }
    else
    {
      v4->double var1 = 0.0;
      v4->double var2 = 0.0;
      v4->var3 = 0.0;
    }
    if (self->levels >= 2)
    {
      unsigned int v12 = self->xCount + ~interClusterMinIndex;
      v4[1].unsigned int var0 = v12;
      unsigned int v13 = self->dx;
      unsigned int v14 = self->dxOrderIndex;
      uint64_t v15 = self->interClusterMinIndex;
      v4[1].double var1 = v13[v14[v15]];
      unsigned int xCount = self->xCount;
      v4[1].double var2 = v13[v14[xCount - 2]];
      double v17 = 0.0;
      if ((int)v15 + 1 < xCount)
      {
        unsigned int v18 = xCount - 1;
        do
        {
          double v17 = v17 + v13[v14[v15]];
          LODWORD(v15) = v15 + 1;
        }
        while (v18 != v15);
      }
      v4[1].var3 = v17 / (double)v12;
    }
  }
}

- (void)setMinimumRecognizedInterLevel2ndDifference:(double)a3
{
  self->minInterLevel2ndDiff = a3;
}

- (void)setMinimumRecognizedInterClusterDifference:(double)a3
{
  self->minInterClusterDiff = a3;
}

- (void)setMaximumClusterSpread:(double)a3
{
  self->maxClusterSpread = a3;
}

- (void)setMinimumClusterSize:(unsigned int)a3
{
  self->unsigned int minClusterSize = a3;
}

- (void)assembleDataStats
{
  if (!self->xStats)
  {
    unsigned int interClusterMinIndex = self->interClusterMinIndex;
    unsigned int xCount = self->xCount;
    BOOL v23 = xCount >= interClusterMinIndex;
    unsigned int v5 = xCount - interClusterMinIndex;
    if (v5 != 0 && v23)
    {
      self->unsigned int clusterCount = v5;
      [(CPCluster *)self computeDataFromDifferences];
      if (!self->x) {
        __assert_rtn("-[CPCluster assembleDataStats]", "CPCluster.m", 720, "x");
      }
      unsigned int v6 = malloc_type_malloc(4 * self->clusterCount, 0x100004052888210uLL);
      double v7 = v6;
      unsigned int clusterCount = self->clusterCount;
      uint64_t v9 = clusterCount - 1;
      if (clusterCount == 1) {
        uint64_t v9 = 0;
      }
      else {
        memcpy(v6, &self->dxOrderIndex[self->interClusterMinIndex], 4 * (clusterCount - 1));
      }
      v7[v9] = self->xCount - 1;
      qsort(v7, self->clusterCount, 4uLL, (int (__cdecl *)(const void *, const void *))compareUnsigned);
      if (self->minClusterSize) {
        BOOL v10 = 0;
      }
      else {
        BOOL v10 = self->maxClusterSpread == 1.79769313e308;
      }
      int v11 = ($CAD616572B4749F850842224FCF53B5F *)malloc_type_malloc(32 * self->clusterCount, 0x100004089CA3EB1uLL);
      self->xStats = v11;
      unint64_t v12 = self->clusterCount;
      if (v12)
      {
        unint64_t v13 = 0;
        unsigned int v14 = 0;
        unsigned int v15 = 0;
        unsigned int v16 = self->xCount;
        do
        {
          if (v15 >= v16) {
            __assert_rtn("-[CPCluster assembleDataStats]", "CPCluster.m", 753, "minIndex<xCount");
          }
          uint64_t v17 = v7[v13];
          unsigned int v18 = v17 + 1 - v15;
          x = self->x;
          double v20 = x[v15];
          double v21 = x[v17];
          if (v10 || v18 >= self->minClusterSize && v21 - v20 <= self->maxClusterSpread)
          {
            uint64_t v22 = &v11[v14];
            v22->unsigned int var0 = v18;
            v22->double var1 = v20;
            v22->double var2 = v21;
            unsigned int v16 = self->xCount;
            BOOL v23 = v15 >= v16 || v17 >= v16;
            if (v23) {
              __assert_rtn("-[CPCluster assembleDataStats]", "CPCluster.m", 764, "minIndex<xCount && maxIndex<xCount");
            }
            double v24 = 0.0;
            while (v15 <= v17)
              double v24 = v24 + x[v15++];
            v11[v14++].var3 = v24 / (double)v18;
            unint64_t v12 = self->clusterCount;
          }
          ++v13;
          unsigned int v15 = v17 + 1;
        }
        while (v13 < v12);
      }
      else
      {
        unsigned int v14 = 0;
      }
      self->unsigned int clusterCount = v14;
      free(v7);
    }
  }
}

- (void)analyzeDifferences
{
  unsigned int xCount = self->xCount;
  if (xCount >= 2)
  {
    self->dxOrderIndex = +[CPCluster createOrderIndexFor:self->dx ofSize:xCount - 1];
    unsigned int v4 = self->xCount;
    uint64_t v5 = v4 - 2;
    if (v4 == 2)
    {
      [(CPCluster *)self resetAnalysis];
    }
    else
    {
      unsigned int v6 = (double *)malloc_type_malloc(8 * (v4 - 2), 0x100004000313F17uLL);
      uint64_t v7 = 0;
      self->ddx = v6;
      dx = self->dx;
      dxOrderIndex = self->dxOrderIndex;
      unsigned int v12 = *dxOrderIndex;
      BOOL v10 = dxOrderIndex + 1;
      uint64_t v11 = v12;
      do
      {
        double v13 = dx[v11];
        uint64_t v11 = v10[v7];
        v6[v7++] = dx[v11] - v13;
      }
      while (v5 != v7);
      self->ddxOrderIndex = +[CPCluster createOrderIndexFor:v6 ofSize:v5];
      [(CPCluster *)self splitSecondDifferences];
      [(CPCluster *)self assembleDifferenceStats];
      if (self->profile->var7)
      {
        unsigned int levels = self->levels;
        if (levels >= 2)
        {
          [(CPCluster *)self coalesceFrom:0 to:levels - 1];
        }
      }
    }
  }
}

- (void)resetAnalysis
{
  self->interLevelMinIndex = 0;
  self->unsigned int levels = 1;
  self->unsigned int interClusterMinIndex = 1;
  unsigned int v3 = ($CAD616572B4749F850842224FCF53B5F *)malloc_type_malloc(0x20uLL, 0x100004089CA3EB1uLL);
  self->dxStats = v3;
  v3->unsigned int var0 = 1;
  dx = self->dx;
  v3->double var1 = *dx;
  v3->double var2 = *dx;
  v3->var3 = *dx;
}

- (BOOL)coalesceFrom:(unsigned int)a3 to:(unsigned int)a4
{
  unsigned int levels = self->levels;
  if (levels <= a4) {
    unsigned int v5 = levels - 1;
  }
  else {
    unsigned int v5 = a4;
  }
  if (v5 <= a3)
  {
    char v24 = 0;
    return v24 & 1;
  }
  profile = self->profile;
  unint64_t v9 = a3;
  double var10 = profile->var10;
  double var9 = profile->var9;
  double var8 = profile->var8;
  double var11 = profile->var11;
  double var12 = profile->var12;
  double var13 = profile->var13;
  double var14 = profile->var14;
  double var15 = profile->var15;
  double var16 = profile->var16;
  double var17 = profile->var17;
  double var18 = profile->var18;
  BOOL var19 = profile->var19;
  unsigned int v18 = malloc_type_malloc(4 * (v5 - a3 + 1), 0x100004052888210uLL);
  double v20 = v18;
  uint64_t v21 = 0;
  unsigned int v22 = 0;
  dxStats = self->dxStats;
  do
  {
    v22 += dxStats[(v9 + v21)].var0;
    v18[v21++] = v22;
  }
  while ((int)v9 + (int)v21 <= v5);
  char v24 = 0;
  double v25 = 1.0;
  double v26 = var18 + 1.0;
  double v27 = 1.0 - var18;
  BOOL v28 = var18 < 0.0;
  if (var18 < 0.0) {
    double v27 = 1.0;
  }
  double v54 = v27;
  if (v28) {
    double v25 = v26;
  }
  double v52 = v25;
  unint64_t v29 = v9;
  do
  {
    if (v29 == a3)
    {
      int v30 = 0;
      double v31 = var8;
      double v32 = var10;
      double v33 = var12;
      double v34 = var14;
      double v35 = var16;
    }
    else
    {
      int v30 = v20[v29 + ~a3];
      double v31 = var9;
      double v32 = var11;
      double v33 = var13;
      double v34 = var15;
      double v35 = var17;
    }
    uint64_t v36 = self->dxStats;
    unint64_t v37 = (v29 + 1);
    LODWORD(v19) = v36[v37].var0;
    unsigned int var0 = v36[v29].var0;
    if (v31 * (double)var0 < (double)*(unint64_t *)&v19)
    {
      if (v29 > a3)
      {
        v39 = &v36[v29];
        double var1 = v39->var1;
        double v41 = v36[v37].var1 - v39->var2;
        uint64_t v42 = (v29 - 1);
        if (v52 * (var1 - v36[v42].var2) >= v54 * v41) {
          unint64_t v29 = v29;
        }
        else {
          unint64_t v29 = v42;
        }
        unint64_t v37 = (v29 + 1);
      }
LABEL_31:
      if ([(CPCluster *)self joinLevelsFrom:v29 to:v37])
      {
        memmove(&v20[v29 - a3], &v20[v29 - a3 + 1], 4 * (v5 - v29));
        --v5;
        unint64_t v37 = (__PAIR64__(v29, a3) - v29) >> 32;
        char v24 = 1;
      }
      goto LABEL_33;
    }
    p_unsigned int var0 = (double *)&v36[v29].var0;
    double v44 = v36[v37].var1;
    double v45 = p_var0[1];
    if (v45 > 0.0 || v44 >= self->minInterClusterDiff) {
      double v45 = 0.0;
    }
    double v46 = v44 - v45;
    double v47 = v32 * (p_var0[2] - v45);
    double v19 = p_var0[3] - v45;
    double v48 = v33 * v19;
    BOOL v49 = v46 < v47 || v46 < v48;
    if (v49
      || v34 * (double)(v22 - v30) > (double)(var0 + 1)
      || v44 * (double)v22 < v35 * (v36[v5].var2 - v36[v9].var1)
      || v44 < self->minInterClusterDiff)
    {
      goto LABEL_31;
    }
LABEL_33:
    unint64_t v29 = v37;
  }
  while (v37 < v5);
  if (var19 && v5 > a3 + 1) {
    v24 |= -[CPCluster joinLevelsFrom:to:](self, "joinLevelsFrom:to:");
  }
  free(v20);
  return v24 & 1;
}

- (BOOL)splitLevelAtIndex:(unsigned int)a3 betweenValue:(double)a4 andValue:(double)a5
{
  unsigned int levels = self->levels;
  if (levels <= a3)
  {
    LOBYTE(v35) = 0;
  }
  else
  {
    dxStats = self->dxStats;
    uint64_t v9 = a3;
    BOOL v10 = &dxStats[a3];
    double var1 = v10->var1;
    double var2 = v10->var2;
    if (var1 > a4) {
      a4 = v10->var1;
    }
    if (var2 < a5) {
      a5 = v10->var2;
    }
    unsigned int xCount = self->xCount;
    double v14 = a5;
    double v15 = a4;
    if (xCount < 3) {
      goto LABEL_30;
    }
    uint64_t v16 = 0;
    char v17 = 0;
    unsigned int v18 = 0;
    dx = self->dx;
    dxOrderIndex = self->dxOrderIndex;
    uint64_t v21 = xCount - 2;
    unsigned int v23 = *dxOrderIndex;
    unsigned int v22 = dxOrderIndex + 1;
    double v24 = dx[v23];
    double v25 = 0.0;
    double v14 = a5;
    double v15 = a4;
    double v26 = 0.0;
    double v27 = 0.0;
    unsigned int v28 = 0;
LABEL_8:
    double v29 = v24;
    do
    {
      double v24 = dx[v22[v16]];
      if (v29 >= var1) {
        ++v28;
      }
      double v30 = -0.0;
      if (v29 >= var1) {
        double v30 = v29;
      }
      BOOL v31 = v24 <= a5;
      uint64_t v32 = v16 + 1;
      double v27 = v27 + v30;
      if (v26 == 0.0) {
        BOOL v31 = 1;
      }
      BOOL v33 = v29 < a4 || !v31;
      if (!v33 && v24 - v29 >= v26)
      {
        char v17 = 1;
        double v25 = v27;
        unsigned int v18 = v28;
        double v14 = dx[v22[v16]];
        double v15 = v29;
        double v26 = v24 - v29;
        BOOL v33 = v21 - 1 == v16++;
        if (v33) {
          goto LABEL_43;
        }
        goto LABEL_8;
      }
      double v29 = dx[v22[v16++]];
    }
    while (v21 != v32);
    double v29 = v15;
    double v24 = v14;
    unsigned int v28 = v18;
    double v27 = v25;
    if ((v17 & 1) == 0)
    {
LABEL_30:
      unint64_t v36 = 0;
      unsigned int v37 = 0;
      if (xCount <= 1) {
        unsigned int xCount = 1;
      }
      uint64_t v38 = 4 * (xCount - 1);
      double v39 = 0.0;
      do
      {
        double v27 = v39;
        unsigned int v28 = v37;
        if (v38 == v36)
        {
          double v29 = var2;
          double v24 = v14;
          goto LABEL_43;
        }
        double v24 = self->dx[self->dxOrderIndex[v36 / 4]];
        double v40 = v39 + v24;
        if (v24 >= var1)
        {
          ++v37;
          double v39 = v39 + v24;
        }
        v36 += 4;
      }
      while (v24 < a4);
      if (v24 - a4 <= a5 - v24)
      {
        double v29 = v24;
        double v24 = v14;
        unsigned int v28 = v37;
        double v27 = v39;
      }
      else
      {
        if (v24 >= var1) {
          double v27 = v40 - v24;
        }
        double v29 = v15;
      }
    }
LABEL_43:
    double v41 = &dxStats[v9];
    unsigned int var0 = v41->var0;
    if (v28) {
      double var1 = v27 / (double)v28;
    }
    double v43 = var2;
    if (var0 >= v28) {
      unsigned int v44 = var0 - v28;
    }
    else {
      unsigned int v44 = 0;
    }
    if (var0 > v28) {
      double v43 = -(v27 - (double)var0 * v41->var3) / (double)v44;
    }
    double v35 = ($CAD616572B4749F850842224FCF53B5F *)malloc_type_realloc(dxStats, 32 * (levels + 1), 0x100004089CA3EB1uLL);
    if (v35)
    {
      self->dxStats = v35;
      unsigned int v45 = self->levels;
      self->unsigned int levels = v45 + 1;
      if (a3 + 2 < v45 + 1)
      {
        memmove(&v35[v9 + 2], &v35[v9 + 1], 32 * (v45 + ~a3));
        double v35 = self->dxStats;
      }
      double v46 = &v35[v9];
      v46->unsigned int var0 = v28;
      v46->double var2 = v29;
      v46->var3 = var1;
      double v47 = &v35[a3 + 1];
      v47->unsigned int var0 = v44;
      v47->double var1 = v24;
      v47->double var2 = var2;
      v47->var3 = v43;
      if (!a3) {
        self->unsigned int interClusterMinIndex = v28;
      }
      LOBYTE(v35) = 1;
    }
  }
  return (char)v35;
}

- (BOOL)joinClosestLevelPairFrom:(unsigned int)a3 to:(unsigned int)a4
{
  unsigned int levels = self->levels;
  if (levels < 2) {
    return 0;
  }
  if (levels <= a4) {
    unsigned int v6 = levels - 1;
  }
  else {
    unsigned int v6 = a4;
  }
  if (v6 > a3)
  {
    uint64_t v7 = 0;
    unsigned int v8 = a3;
    p_double var1 = &self->dxStats[a3 + 1].var1;
    unint64_t v10 = a3 - (unint64_t)v6;
    double v11 = 0.0;
    do
    {
      double v12 = *(p_var1 - 3);
      BOOL v13 = *p_var1 - v12 < v11 || v7 == 0;
      if (v13) {
        *(void *)&a3 = v8 + v7;
      }
      else {
        *(void *)&a3 = a3;
      }
      if (v13) {
        double v11 = *p_var1 - v12;
      }
      ++v7;
      p_var1 += 4;
    }
    while (v10 + v7);
  }
  return [(CPCluster *)self joinLevelsFrom:*(void *)&a3 to:a3 + 1];
}

- (BOOL)joinLevelsFrom:(unsigned int)a3 to:(unsigned int)a4
{
  unsigned int levels = self->levels;
  if (levels < 2) {
    return 0;
  }
  LODWORD(v6) = levels - 1;
  uint64_t v6 = levels <= a4 ? v6 : a4;
  int v7 = a3 - v6;
  if (a3 >= v6) {
    return 0;
  }
  unsigned int v9 = 0;
  dxStats = self->dxStats;
  double v11 = &dxStats[a3];
  double v12 = 0.0;
  int v13 = v6 + 1;
  do
  {
    double v12 = v12 + v11->var3 * (double)v11->var0;
    v9 += v11->var0;
    --v13;
    ++v11;
  }
  while (a3 != v13);
  double v14 = &dxStats[a3];
  v14->unsigned int var0 = v9;
  v14->double var2 = dxStats[v6].var2;
  v14->var3 = v12 / (double)v9;
  memmove(&dxStats[a3 + 1], &dxStats[(v6 + 1)], 32 * (self->levels + ~v6));
  self->levels += v7;
  if (!a3) {
    self->unsigned int interClusterMinIndex = v9;
  }
  return 1;
}

- (void)assembleDifferenceStats
{
  if (!self->dxStats)
  {
    unsigned int interLevelMinIndex = self->interLevelMinIndex;
    unsigned int xCount = self->xCount;
    if (interLevelMinIndex + 1 >= xCount)
    {
      unsigned int var0 = 0;
      self->unsigned int levels = 0;
    }
    else
    {
      unsigned int v5 = xCount + ~interLevelMinIndex;
      self->unsigned int levels = v5;
      uint64_t v6 = malloc_type_malloc(4 * v5, 0x100004052888210uLL);
      int v7 = v6;
      unsigned int levels = self->levels;
      uint64_t v9 = levels - 1;
      if (levels == 1) {
        uint64_t v9 = 0;
      }
      else {
        memcpy(v6, &self->ddxOrderIndex[self->interLevelMinIndex], 4 * (levels - 1));
      }
      v7[v9] = self->xCount - 2;
      qsort(v7, self->levels, 4uLL, (int (__cdecl *)(const void *, const void *))compareUnsigned);
      double v11 = ($CAD616572B4749F850842224FCF53B5F *)malloc_type_malloc(32 * self->levels, 0x100004089CA3EB1uLL);
      self->dxStats = v11;
      if (self->levels)
      {
        unint64_t v12 = 0;
        unsigned int v13 = 0;
        dx = self->dx;
        dxOrderIndex = self->dxOrderIndex;
        do
        {
          uint64_t v16 = v7[v12];
          unsigned int v17 = v16 + 1 - v13;
          unsigned int v18 = &v11[v12];
          v18->unsigned int var0 = v17;
          uint64_t v19 = dxOrderIndex[v16];
          v18->double var1 = dx[dxOrderIndex[v13]];
          v18->double var2 = dx[v19];
          double v20 = 0.0;
          while (v13 <= v16)
            double v20 = v20 + dx[dxOrderIndex[v13++]];
          v18->var3 = v20 / (double)v17;
          ++v12;
          unsigned int v13 = v16 + 1;
        }
        while (v12 < self->levels);
      }
      free(v7);
      unsigned int var0 = self->levels;
      if (var0) {
        unsigned int var0 = self->dxStats->var0;
      }
    }
    self->unsigned int interClusterMinIndex = var0;
  }
}

- (void)splitSecondDifferences
{
  unsigned int xCount = self->xCount;
  unsigned int v3 = xCount - 4;
  if (xCount < 4) {
    return;
  }
  profile = self->profile;
  double var0 = profile->var0;
  unsigned int var1 = profile->var1;
  double var2 = profile->var2;
  double var3 = profile->var3;
  unsigned int var4 = profile->var4;
  double var5 = profile->var5;
  double var6 = profile->var6;
  uint64_t v13 = xCount - 3;
  double v14 = (double *)malloc_type_malloc(8 * v13, 0x100004000313F17uLL);
  double v15 = v14;
  uint64_t v16 = 0;
  ddx = self->ddx;
  ddxOrderIndex = self->ddxOrderIndex;
  unsigned int v21 = *ddxOrderIndex;
  uint64_t v19 = ddxOrderIndex + 1;
  uint64_t v20 = v21;
  do
  {
    double v22 = ddx[v20];
    uint64_t v20 = v19[v16];
    v14[v16++] = ddx[v20] - v22;
  }
  while (v13 != v16);
  unsigned int v23 = +[CPCluster createOrderIndexFor:v14 ofSize:xCount - 3];
  uint64_t v24 = xCount - 2;
  double v25 = (double *)malloc_type_malloc(8 * v24, 0x100004000313F17uLL);
  uint64_t v26 = 0;
  double v27 = self->ddx;
  unsigned int v28 = self->ddxOrderIndex;
  double v29 = 0.0;
  do
  {
    double v29 = v29 + v27[v28[v26]];
    v25[v26] = v29 / (double)(v26 + 1);
    ++v26;
  }
  while (v24 != v26);
  unsigned int v30 = 0;
  double v31 = v15[v23[v3]];
  double v32 = v27[v28[v13]];
  int v33 = v13 - 1;
  unsigned int v34 = v13;
  do
  {
    uint64_t v35 = v23[v33];
    if (v35 < v34)
    {
      if (var0 * (double)v24 > (double)(v35 + 2)
        || ((uint64_t v36 = v28[v35 + 1], v37 = v27[v36], v37 >= var2 * v27[v28[v35]])
          ? (BOOL v38 = v13 >= v35 + var1)
          : (BOOL v38 = 1),
            v38 || (v37 > 0.0 ? (BOOL v39 = v37 < var3 * v25[v35]) : (BOOL v39 = 1), v39 || v37 < self->minInterLevel2ndDiff)))
      {
        BOOL v40 = 0;
        if (!v30) {
          goto LABEL_29;
        }
      }
      else
      {
        BOOL v40 = self->dx[self->dxOrderIndex[(v36 + 1)]] >= self->minInterClusterDiff;
        if (!v30)
        {
LABEL_29:
          if (!v40)
          {
            unsigned int v30 = 0;
            goto LABEL_32;
          }
LABEL_30:
          double v31 = v15[v35];
          double v32 = v27[v28[v35]];
          unsigned int v30 = 1;
          unsigned int v34 = v23[v33];
          goto LABEL_32;
        }
      }
      double minInterLevel2ndDiff = self->minInterLevel2ndDiff;
      if (minInterLevel2ndDiff != 0.0 || !v40)
      {
        if (minInterLevel2ndDiff == 0.0) {
          LOBYTE(v40) = 0;
        }
        if (v40) {
          goto LABEL_30;
        }
      }
      else if (v15[v35] >= var5 * v31 && v27[v28[v35 + 1]] >= var6 * v32)
      {
        goto LABEL_30;
      }
      ++v30;
    }
LABEL_32:
    if (!v33) {
      break;
    }
    --v33;
  }
  while (v30 <= var4);
  self->unsigned int interLevelMinIndex = v34 + 1;
  free(v25);
  free(v23);

  free(v15);
}

- (void)computeDataFromDifferences
{
  uint64_t xCount = self->xCount;
  if (xCount && !self->x && (xCount == 1 || self->dx != 0))
  {
    unsigned int v5 = (double *)malloc_type_malloc(8 * xCount, 0x100004000313F17uLL);
    self->x = v5;
    self->ownData = 1;
    double *v5 = 0.0;
    uint64_t v6 = self->xCount - 1;
    if (self->xCount != 1)
    {
      dx = self->dx;
      unsigned int v8 = v5 + 1;
      double v9 = 0.0;
      do
      {
        double v10 = *dx++;
        double v9 = v9 + v10;
        *v8++ = v9;
        --v6;
      }
      while (v6);
    }
  }
}

- (void)computeDifferencesFromData
{
  unsigned int xCount = self->xCount;
  if (xCount >= 2 && self->x && !self->dx)
  {
    uint64_t v4 = xCount - 1;
    unsigned int v5 = (double *)malloc_type_malloc(8 * v4, 0x100004000313F17uLL);
    self->dx = v5;
    self->ownDifferences = 1;
    uint64_t v6 = self->x + 1;
    do
    {
      *v5++ = *v6 - *(v6 - 1);
      ++v6;
      --v4;
    }
    while (v4);
  }
}

- (void)dealloc
{
  [(CPCluster *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPCluster;
  [(CPCluster *)&v3 dealloc];
}

- (void)finalize
{
  [(CPCluster *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPCluster;
  [(CPCluster *)&v3 finalize];
}

- (void)dispose
{
  if (self->profile)
  {
    free(self->dxStats);
    free(self->xStats);
    free(self->ddxOrderIndex);
    free(self->ddx);
    free(self->dxOrderIndex);
    if (self->ownData) {
      free(self->x);
    }
    if (self->ownDifferences) {
      free(self->dx);
    }
    self->profile = 0;
  }
}

- (CPCluster)initWithProfile:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPCluster;
  unsigned int result = [(CPCluster *)&v5 init];
  if (result)
  {
    result->profile = a3;
    result->maxClusterSpread = 1.79769313e308;
  }
  return result;
}

- (CPCluster)init
{
  return [(CPCluster *)self initWithProfile:&kCPClusterProfileDefault];
}

+ (unsigned)createOrderIndexFor:(double *)a3 ofSize:(unsigned int)a4
{
  size_t v6 = a4;
  int v7 = (unsigned int *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  unsigned int v8 = v7;
  if (a4)
  {
    uint64_t v9 = 0;
    do
    {
      v7[v9] = v9;
      ++v9;
    }
    while (v6 != v9);
  }
  qsort_r(v7, v6, 4uLL, a3, (int (__cdecl *)(void *, const void *, const void *))compareDoubleIndirect);
  return v8;
}

- (void)makeWords:(id *)a3 count:(unsigned int)a4 fromCharacterSequence:(id)a5 charOffset:(unsigned int)a6
{
  unsigned int v8 = a4;
  if ([(CPCluster *)self clusterCount] < a4) {
    unsigned int v8 = [(CPCluster *)self clusterCount];
  }
  if (v8)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = v8;
    while (1)
    {
      a3[v11].double var0 = v12 + a6;
      if (v12) {
        break;
      }
      a3[v11].double var2 = -1;
      if (self) {
        goto LABEL_15;
      }
      uint64_t v17 = 0;
      long long v23 = 0u;
      long long v24 = 0u;
LABEL_16:
      unsigned int v18 = &a3[v11];
      v18->unsigned int var1 = v17;
      objc_msgSend(a5, "boundsFrom:length:", v12, v17, v23, v24);
      v18->var4.origin.x = v19;
      v18->var4.origin.y = v20;
      v18->var4.size.width = v21;
      v18->var4.size.height = v22;
      uint64_t v12 = (v17 + v12);
      ++v11;
      v18->double var3 = 0;
      if (v11 == v13) {
        return;
      }
    }
    uint64_t levels = self->levels;
    if (levels)
    {
      uint64_t v15 = 0;
      p_double var2 = &self->dxStats->var2;
      while (self->dx[(v12 - 1)] > *p_var2)
      {
        ++v15;
        p_var2 += 4;
        if (levels == v15) {
          goto LABEL_14;
        }
      }
      LODWORD(levels) = v15;
    }
LABEL_14:
    a3[v11].double var2 = levels;
LABEL_15:
    [(CPCluster *)self clusterStatisticsAtIndex:v11];
    uint64_t v17 = v23;
    goto LABEL_16;
  }
}

- (void)findClustersFromCharacterSequence:(id)a3 withSpaceHint:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v7 = [a3 length];
  unsigned int v8 = v7;
  if (v7) {
    uint64_t v9 = v7 - 1;
  }
  else {
    uint64_t v9 = 0;
  }
  if (v7 < 2) {
    double v10 = 0;
  }
  else {
    double v10 = (double *)malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
  }
  uint64_t v11 = (double *)malloc_type_malloc(0x40uLL, 0x100004089CA3EB1uLL);
  v40[0] = v10;
  v40[1] = v11;
  double v41 = 0.0;
  double v42 = 0.0;
  [a3 mapToPairsWithIndex:assembleClusterGaps passing:v40];
  double v12 = v41;
  double v13 = v42;
  double v14 = v41 / 5.0;
  [(CPCluster *)self setMinimumRecognizedInterClusterDifference:v14 + v14 * 0.00000011920929 + 1.17549435e-38];
  [(CPCluster *)self setMinimumRecognizedInterLevel2ndDifference:v14 + v14 * 0.00000011920929 + 1.17549435e-38];
  [(CPCluster *)self findClustersFromDifferences:v10 count:v9];
  char v15 = 1;
  self->ownDifferences = 1;
  if (v8 >= 2 && v12 > 0.0 && !*((_DWORD *)v11 + 8))
  {
    dxStats = self->dxStats;
    double var2 = dxStats->var2;
    if (var2 > v14 && dxStats->var3 <= 0.0 && (self->levels == 1 || dxStats[1].var1 >= v13 * 2.5))
    {
      -[CPCluster tryLevel0SplitBetween:and:usingHints:](self, "tryLevel0SplitBetween:and:usingHints:", v11, dxStats->var1);
      goto LABEL_10;
    }
    if (v4)
    {
      double v23 = v12 * 0.5;
      double var1 = dxStats->var1;
      unsigned int levels = self->levels;
      if (levels < 2)
      {
        if (var1 > v23 || v12 * 0.85 > var2) {
          goto LABEL_10;
        }
      }
      else
      {
        double v26 = dxStats[1].var1;
        double var3 = dxStats[1].var3;
        if (var2 >= v23)
        {
          int v29 = 0;
        }
        else
        {
          if (levels < 3 || dxStats[2].var2 >= v13 * 2.5)
          {
            int v29 = 0;
          }
          else if (v26 <= v23)
          {
            int v29 = 0;
            double v14 = dxStats[1].var3;
          }
          else
          {
            double v28 = dxStats[2].var3;
            int v29 = 1;
            *((_DWORD *)v11 + 8) = 1;
            v11[5] = v28;
            v11[6] = v28;
            v11[7] = v28;
          }
          unsigned int v31 = *(_DWORD *)v11;
          if (*(_DWORD *)v11)
          {
            if (v11[2] < v14)
            {
              *(_DWORD *)uint64_t v11 = v31 + 1;
              double v32 = (v14 + (double)v31 * v11[3]) / (double)(v31 + 1);
              v11[2] = v14;
              v11[3] = v32;
            }
          }
          else
          {
            *(_DWORD *)uint64_t v11 = 1;
            v11[1] = v14;
            v11[2] = v14;
            v11[3] = v14;
          }
        }
        if (v12 < var1 + var1 || v26 < v13 + v13 || var3 < v13 * 5.0 || v29 != 0) {
          goto LABEL_10;
        }
        if (v12 * 0.85 > var2)
        {
          if (v12 >= var2 + var2 && dxStats[1].var0 <= 0xB)
          {
            double v37 = ($CAD616572B4749F850842224FCF53B5F *)malloc_type_realloc(dxStats, 32 * (self->levels + 1), 0x100004089CA3EB1uLL);
            if (v37)
            {
              self->dxStats = v37;
              unsigned int v38 = self->levels;
              self->unsigned int levels = v38 + 1;
              memmove(&v37[2], &v37[1], 32 * (v38 - 1));
              BOOL v39 = self->dxStats;
              v39[1].double var0 = 0;
              v39[1].double var1 = v12;
              v39[1].double var2 = v13;
              v39[1].double var3 = (v12 + v13) * 0.5;
            }
          }
          goto LABEL_10;
        }
      }
      -[CPCluster tryLevel0SplitBetween:and:usingHints:](self, "tryLevel0SplitBetween:and:usingHints:", v11);
      char v15 = 0;
    }
  }
LABEL_10:
  unsigned int v16 = self->levels;
  BOOL v17 = [(CPCluster *)self applyDifferenceHints:v11 count:2];
  if ((v15 & 1) == 0 && v17 && self->levels > v16)
  {
    if (v8 >= 2)
    {
      unsigned int v18 = self->dxStats;
      if (v9 <= 1) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = v9;
      }
      int v20 = 2;
      do
      {
        if (*v10 <= v18->var2)
        {
          if (v20 == 1) {
            goto LABEL_27;
          }
          int v20 = 0;
        }
        else if (*v10 <= v18[1].var2)
        {
          if (!v20) {
            goto LABEL_27;
          }
          int v20 = 1;
        }
        else
        {
          int v20 = 2;
        }
        ++v10;
        --v19;
      }
      while (v19);
    }
    [(CPCluster *)self joinLevelsFrom:0 to:1];
  }
LABEL_27:
  free(v11);
}

- (void)tryLevel0SplitBetween:(double)a3 and:(double)a4 usingHints:(id *)a5
{
  if (!a5->var0)
  {
    a5->double var0 = 1;
    a5->double var1 = a3;
    a5->double var2 = a3;
    a5->double var3 = a3;
    goto LABEL_5;
  }
  if (a5->var2 < a4)
  {
LABEL_5:
    a5[1].double var0 = 1;
    a5[1].double var1 = a4;
    a5[1].double var2 = a4;
    a5[1].double var3 = a4;
  }
}

+ (void)reclusterTextLine:(id)a3 fromWordIndex:(unsigned int)a4 count:(unsigned int *)a5
{
  if (a5 && *a5)
  {
    unsigned int v8 = *a5 + a4;
    uint64_t v9 = (unsigned int *)[a3 wordAtIndex:*(void *)&a4];
    double v10 = (_DWORD *)[a3 wordAtIndex:v8 - 1];
    uint64_t v11 = *v9;
    uint64_t v12 = (*v10 - v11 + v10[1]);
    double v37 = 1.70141173e38;
    double v38 = 1.70141173e38;
    double v13 = objc_msgSend((id)objc_msgSend(a3, "charSequence"), "newSubsequenceFrom:length:", v11, v12);
    unsigned int v14 = v9[3];
    if ((v14 & 4) != 0)
    {
      BOOL v16 = 0;
    }
    else
    {
      BOOL v15 = (v14 & 1) == 0 || (v10[3] & 2) == 0;
      BOOL v16 = (v10[3] & 8) == 0 && v15;
    }
    BOOL v17 = [[CPCluster alloc] initWithProfile:&kCPClusterProfileCharAdvance];
    [(CPCluster *)v17 findClustersFromCharacterSequence:v13 withSpaceHint:v16];
    uint64_t v18 = [(CPCluster *)v17 clusterCount];
    unsigned int v19 = [a3 wordCount];
    uint64_t v20 = [a3 wordArrayOfSize:v19 + v18 - *a5];
    uint64_t v21 = v20;
    if (*a5 != v18)
    {
      if (v19 > v8) {
        memmove((void *)(v20 + 48 * a4 + 48 * v18), (const void *)(v20 + 48 * v8), 48 * (v19 - v8));
      }
      *a5 = v18;
    }
    [(CPCluster *)v17 makeWords:v21 + 48 * a4 count:v18 fromCharacterSequence:v13 charOffset:v11];
    uint64_t v22 = [(CPCluster *)v17 levels];
    if (!a4) {
      [a3 setIrregular:0];
    }
    if (v22)
    {
      [a1 clusterTextLine:a3 withCluster:v17 atLevel:v22 withMaximumWordGap:&v37 andMaximumLetterGap:&v38];
      if (v22 == 1)
      {
        double v24 = v37;
        double v23 = v38;
        if (v37 < v38)
        {
          double v37 = v38;
          *(float *)&double v23 = v38;
          objc_msgSend(a3, "setMaximumWordGap:", v23, v24);
        }
      }
    }
    if (a4)
    {
      int v25 = objc_msgSend(a3, "levels", v23, v24);
      unsigned int v26 = v25;
      if (v22 && v25 >= 1)
      {
        double v27 = v38;
        [a3 maximumLetterGap];
        if (v27 > v28)
        {
          HIDWORD(v29) = HIDWORD(v38);
          *(float *)&double v29 = v38;
          [a3 setMaximumLetterGap:v29];
        }
        if (v22 >= 2 && v26 >= 2)
        {
          double v30 = v37;
          [a3 maximumWordGap];
          if (v30 > v31)
          {
            HIDWORD(v32) = HIDWORD(v37);
            *(float *)&double v32 = v37;
            [a3 setMaximumWordGap:v32];
          }
        }
      }
      if (v22 <= v26) {
        goto LABEL_37;
      }
      [a3 setLevels:v22];
      if (v26 != 1)
      {
        if (v26) {
          goto LABEL_37;
        }
        HIDWORD(v33) = HIDWORD(v38);
        *(float *)&double v33 = v38;
        [a3 setMaximumLetterGap:v33];
        if (v22 < 2) {
          goto LABEL_37;
        }
      }
    }
    else
    {
      objc_msgSend(a3, "setLevels:", v22, v23, v24);
      HIDWORD(v34) = HIDWORD(v38);
      *(float *)&double v34 = v38;
      [a3 setMaximumLetterGap:v34];
    }
    HIDWORD(v35) = HIDWORD(v37);
    *(float *)&double v35 = v37;
    [a3 setMaximumWordGap:v35];
LABEL_37:
    [(CPCluster *)v17 dispose];

    [v13 dispose];
  }
}

+ (void)clusterTextLine:(id)a3
{
  double v13 = 1.70141173e38;
  double v14 = 1.70141173e38;
  objc_super v5 = [[CPCluster alloc] initWithProfile:&kCPClusterProfileCharAdvance];
  uint64_t v6 = [a3 charSequence];
  -[CPCluster findClustersFromCharacterSequence:withSpaceHint:](v5, "findClustersFromCharacterSequence:withSpaceHint:", v6, [a3 hasJustifiedAlignment] ^ 1);
  uint64_t v7 = [(CPCluster *)v5 clusterCount];
  -[CPCluster makeWords:count:fromCharacterSequence:charOffset:](v5, "makeWords:count:fromCharacterSequence:charOffset:", [a3 wordArrayOfSize:v7], v7, v6, 0);
  uint64_t v8 = [(CPCluster *)v5 levels];
  if (v8)
  {
    [a1 clusterTextLine:a3 withCluster:v5 atLevel:v8 withMaximumWordGap:&v13 andMaximumLetterGap:&v14];
    if (v8 == 1)
    {
      double v10 = v13;
      double v9 = v14;
      if (v13 < v14) {
        double v13 = v14;
      }
    }
  }
  objc_msgSend(a3, "setLevels:", v8, v9, v10, *(void *)&v13);
  HIDWORD(v11) = HIDWORD(v14);
  *(float *)&double v11 = v14;
  [a3 setMaximumLetterGap:v11];
  HIDWORD(v12) = HIDWORD(v13);
  *(float *)&double v12 = v13;
  [a3 setMaximumWordGap:v12];
  [(CPCluster *)v5 dispose];
}

+ (void)clusterTextLine:(id)a3 withCluster:(id)a4 atLevel:(unsigned int)a5 withMaximumWordGap:(double *)a6 andMaximumLetterGap:(double *)a7
{
  if (a4) {
    [a4 differenceClusterStatisticsAtIndex:0];
  }
  *a7 = fabs(0.0) * 0.00000011920929 + 1.17549435e-38 + 0.0;
  if (a5 >= 2)
  {
    if (a4)
    {
      [a4 differenceClusterStatisticsAtIndex:1];
      *a6 = fabs(0.0) * 0.00000011920929 + 1.17549435e-38 + 0.0;
    }
    else
    {
      *a6 = 1.17549435e-38;
    }
    objc_msgSend(a3, "setIrregular:", 1, (unsigned __int128)0);
  }
}

@end