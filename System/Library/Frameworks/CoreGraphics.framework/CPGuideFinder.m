@interface CPGuideFinder
+ (BOOL)guideSeparates:(id)a3 from:(id)a4;
+ (BOOL)gutterSeparates:(id)a3 from:(id)a4;
+ (void)reclusterBetweenGuides:(id)a3;
+ (void)reclusterPreservingAlignment:(id)a3;
- (BOOL)addStripTo:(id)a3 bottom:(double)a4 left:(double)a5 top:(double)a6 right:(double)a7;
- (BOOL)hasGutters;
- (BOOL)hasLeftGuides;
- (BOOL)hasRightGuides;
- (CPGuideFinder)initWithContentZone:(id)a3;
- (double)medianFontSizeOfFirstCharacter;
- (double)medianFontSizeOfLastCharacter;
- (id)gutters;
- (id)leftGuides;
- (id)rightGuides;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
- (void)findGuides;
- (void)findGutters;
- (void)findWordEdgeClusters;
- (void)func:(id)a3 and:(id)a4 and:(unsigned int)a5 and:(unsigned int)a6;
- (void)getWordEdges;
- (void)markTextLines;
- (void)setAlignForWordWithExtent:(id *)a3 stripArray:(id)a4 stripMax:(double)a5;
- (void)splitTextLines;
- (void)splitTextLinesAtBorderWords;
- (void)splitTextLinesBetweenBorderWords;
- (void)subdivideGutterFrom:(unsigned int)a3 to:(unsigned int)a4;
- (void)subdivideLeftGuideAt:(unsigned int)a3;
- (void)subdivideRightGuideAt:(unsigned int)a3;
- (void)subdivideStripInto:(id)a3 from:(double)a4 to:(double)a5 borderedBy:(id *)a6 ofCount:(unsigned int)a7 crossedBy:(id *)a8 ofCount:(unsigned int)a9;
@end

@implementation CPGuideFinder

- (id)rightGuides
{
  return self->rightGuides;
}

- (BOOL)hasRightGuides
{
  rightGuides = self->rightGuides;
  if (rightGuides) {
    LOBYTE(rightGuides) = [(NSMutableArray *)rightGuides count] != 0;
  }
  return (char)rightGuides;
}

- (id)leftGuides
{
  return self->leftGuides;
}

- (BOOL)hasLeftGuides
{
  leftGuides = self->leftGuides;
  if (leftGuides) {
    LOBYTE(leftGuides) = [(NSMutableArray *)leftGuides count] != 0;
  }
  return (char)leftGuides;
}

- (id)gutters
{
  return self->gutters;
}

- (BOOL)hasGutters
{
  gutters = self->gutters;
  if (gutters) {
    LOBYTE(gutters) = [(NSMutableArray *)gutters count] != 0;
  }
  return (char)gutters;
}

- (void)markTextLines
{
  long long v12 = *(_OWORD *)&self->gutters;
  rightGuides = self->rightGuides;
  if ([(CPGuideFinder *)self hasGutters])
  {
    LOBYTE(v3) = 0;
  }
  else if ([(CPGuideFinder *)self hasLeftGuides])
  {
    int v3 = ![(CPGuideFinder *)self hasRightGuides];
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  id v4 = [(CPZone *)self->contentZone textLinesInZone];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    do
    {
      v7 = (void *)[v4 objectAtIndex:v6];
      if ((int)[v7 levels] >= 3)
      {
        uint64_t v14 = [v7 firstWord];
        uint64_t v15 = [v7 lastWord];
        [v7 mapToWordPairs:markSplitByGuide passing:&v12];
        uint64_t v8 = v14;
        char v9 = v8 == [v7 firstWord] ? 1 : v3;
        if ((v9 & 1) == 0)
        {
          if ((v11 = 0, int v10 = *(_DWORD *)([v7 firstWord] + 12), v11 = v10, (v10 & 0x45) != 0)
            && (v10 & 0x8A) != 0
            || ([v7 mapToWordPairs:hasConsistentSpacing passing:&v11] & 1) == 0)
          {
            +[CPGuideFinder reclusterBetweenGuides:v7];
          }
        }
      }
      ++v6;
    }
    while (v5 != v6);
  }
}

- (void)splitTextLines
{
  [(CPGuideFinder *)self splitTextLinesAtBorderWords];

  [(CPGuideFinder *)self splitTextLinesBetweenBorderWords];
}

- (void)splitTextLinesBetweenBorderWords
{
  if ([(CPGuideFinder *)self hasGutters])
  {
    int v3 = 0;
  }
  else if ([(CPGuideFinder *)self hasLeftGuides])
  {
    int v3 = ![(CPGuideFinder *)self hasRightGuides];
  }
  else
  {
    int v3 = 1;
  }
  id v4 = [(CPZone *)self->contentZone textLinesInZone];
  uint64_t v5 = [v4 count];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v8 = v5;
    do
    {
      char v9 = (void *)[v4 objectAtIndex:v7];
      if ((int)[v9 levels] >= 3)
      {
        uint64_t v12 = [v9 firstWord];
        uint64_t v13 = [v9 lastWord];
        if (((v3 | [v9 removeTextLines:v4 whereTrue:isSplitByGuide passing:&v11] ^ 1) & 1) == 0)
        {
          uint64_t v10 = [v4 count];
          [(CPGuideFinder *)self func:v4 and:v9 and:v6 and:v10];
          uint64_t v6 = v10;
        }
      }
      ++v7;
    }
    while (v8 != v7);
  }
}

- (void)splitTextLinesAtBorderWords
{
  if ([(CPGuideFinder *)self hasGutters])
  {
    int v3 = 0;
  }
  else if ([(CPGuideFinder *)self hasLeftGuides])
  {
    int v3 = ![(CPGuideFinder *)self hasRightGuides];
  }
  else
  {
    int v3 = 1;
  }
  id v4 = [(CPZone *)self->contentZone textLinesInZone];
  uint64_t v5 = [v4 count];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = 0;
    uint64_t v8 = v5;
    do
    {
      char v9 = (void *)[v4 objectAtIndex:v7];
      v11[1] = objc_msgSend(v9, "lastWord", objc_msgSend(v9, "firstWord", 0, 0));
      if (((v3 | [v9 removeTextLines:v4 whereTrue:isAlignedWithGuide passing:v11] ^ 1) & 1) == 0)
      {
        uint64_t v10 = [v4 count];
        [(CPGuideFinder *)self func:v4 and:v9 and:v6 and:v10];
        uint64_t v6 = v10;
      }
      ++v7;
    }
    while (v8 != v7);
  }
}

- (void)func:(id)a3 and:(id)a4 and:(unsigned int)a5 and:(unsigned int)a6
{
  LODWORD(v7) = a5;
  int v10 = [a4 hasJustifiedAlignment];
  if (a6 <= v7 || (v10 & 1) != 0)
  {
LABEL_8:
    if (!v10) {
      return;
    }
  }
  else
  {
    uint64_t v11 = v7;
    id v12 = a4;
    while (1)
    {
      uint64_t v13 = (void *)[a3 objectAtIndex:v11];
      if (([v13 hasJustifiedAlignment] & 1) != 0
        || +[CPGuideFinder gutterSeparates:v12 from:v13])
      {
        break;
      }
      int v10 = [v12 changesFontAt:v13];
      if (++v11 < (unint64_t)a6)
      {
        id v12 = v13;
        if (!v10) {
          continue;
        }
      }
      goto LABEL_8;
    }
  }
  +[CPGuideFinder reclusterPreservingAlignment:a4];
  BOOL v14 = a6 >= v7;
  int v15 = a6 - v7;
  if (v15 != 0 && v14)
  {
    uint64_t v7 = v7;
    do
    {
      +[CPGuideFinder reclusterPreservingAlignment:](CPGuideFinder, "reclusterPreservingAlignment:", [a3 objectAtIndex:v7++]);
      --v15;
    }
    while (v15);
  }
}

- (void)findGuides
{
  [(NSMutableArray *)self->leftGuides removeAllObjects];
  [(NSMutableArray *)self->rightGuides removeAllObjects];
  [(CPGuideFinder *)self findWordEdgeClusters];
  unsigned int v3 = [(CPCluster *)self->anchors clusterCount];
  if (v3)
  {
    unsigned int v4 = v3;
    uint64_t v5 = 0;
    do
    {
      [(CPGuideFinder *)self subdivideLeftGuideAt:v5];
      uint64_t v5 = (v5 + 1);
    }
    while (v4 != v5);
  }
  unsigned int v6 = [(CPCluster *)self->rightHandSides clusterCount];
  if (v6)
  {
    unsigned int v7 = v6;
    uint64_t v8 = 0;
    do
    {
      [(CPGuideFinder *)self subdivideRightGuideAt:v8];
      uint64_t v8 = (v8 + 1);
    }
    while (v7 != v8);
  }
}

- (void)findGutters
{
  [(NSMutableArray *)self->gutters removeAllObjects];
  [(CPGuideFinder *)self findWordEdgeClusters];
  double medianFontSizeOfFirstCharacter = self->medianFontSizeOfFirstCharacter;
  double medianFontSizeOfLastCharacter = self->medianFontSizeOfLastCharacter;
  unsigned int v5 = [(CPCluster *)self->anchors clusterCount];
  unsigned int v6 = [(CPCluster *)self->rightHandSides clusterCount];
  if (v5)
  {
    unsigned int v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    double v12 = medianFontSizeOfLastCharacter * 0.2 + medianFontSizeOfFirstCharacter * 0.05;
    do
    {
      anchors = self->anchors;
      if (anchors)
      {
        [(CPCluster *)anchors clusterStatisticsAtIndex:v8];
        double v14 = *((double *)&v20 + 1);
      }
      else
      {
        long long v20 = 0u;
        double v14 = 0.0;
      }
      if (v9 >= v7)
      {
        uint64_t v16 = v9;
      }
      else
      {
        char v15 = 0;
        while (1)
        {
          uint64_t v16 = v9;
          rightHandSides = self->rightHandSides;
          if (rightHandSides)
          {
            [(CPCluster *)rightHandSides clusterStatisticsAtIndex:v9];
            double v18 = v19;
          }
          else
          {
            double v19 = 0.0;
            double v18 = 0.0;
          }
          if (v12 + v18 >= v14) {
            break;
          }
          uint64_t v9 = (v9 + 1);
          char v15 = 1;
          uint64_t v10 = v16;
          uint64_t v11 = v8;
          if (v7 == v9)
          {
            [(CPGuideFinder *)self subdivideGutterFrom:v16 to:v8];
            return;
          }
        }
        if (v15) {
          [(CPGuideFinder *)self subdivideGutterFrom:v10 to:v11];
        }
      }
      uint64_t v8 = (v8 + 1);
      uint64_t v9 = v16;
    }
    while (v8 != v5);
  }
}

- (void)findWordEdgeClusters
{
  if (!self->anchors)
  {
    [(CPGuideFinder *)self getWordEdges];
    self->anchors = [[CPCluster alloc] initWithProfile:&kCPClusterProfileWordAlignment];
    self->rightHandSides = [[CPCluster alloc] initWithProfile:&kCPClusterProfileWordAlignment];
    uint64_t v3 = (uint64_t)rint(fmax((double)objc_msgSend(-[CPZone textLinesInZone](self->contentZone, "textLinesInZone"), "count")* 0.05, 5.0));
    double v4 = self->medianFontSizeOfFirstCharacter * 0.05;
    double v5 = self->medianFontSizeOfLastCharacter * 0.2;
    [(CPCluster *)self->anchors setMinimumClusterSize:v3];
    [(CPCluster *)self->anchors setMaximumClusterSpread:v4];
    [(CPCluster *)self->rightHandSides setMinimumClusterSize:v3];
    [(CPCluster *)self->rightHandSides setMaximumClusterSpread:v5];
    [(CPCluster *)self->anchors findDensityClusters:self->anchorArray count:self->countOfWordsInZone];
    [(CPCluster *)self->rightHandSides findDensityClusters:self->rightHandSideArray count:self->countOfWordsInZone];
    if ([(CPCluster *)self->anchors clusterCount]
      || [(CPCluster *)self->rightHandSides clusterCount])
    {
      uint64_t countOfWordsInZone = self->countOfWordsInZone;
      if (countOfWordsInZone) {
        self->crossingWordArray = ($8F0B7056700046E0BB8E7B3C5F77D73E *)malloc_type_malloc(56 * countOfWordsInZone, 0x1030040FAAEECD9uLL);
      }
    }
  }
}

- (void)subdivideRightGuideAt:(unsigned int)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  size_t rightHandSides = (size_t)self->rightHandSides;
  if (rightHandSides)
  {
    [(id)rightHandSides clusterStatisticsAtIndex:*(void *)&a3];
    size_t rightHandSides = 56 * v13;
  }
  double v5 = malloc_type_malloc(rightHandSides, 0x1030040FAAEECD9uLL);
  crossingWordArray = self->crossingWordArray;
  v7[0] = v5;
  v7[1] = crossingWordArray;
  uint64_t v8 = 0;
  LODWORD(v8) = self->countOfWordsInZone;
  double v9 = *((double *)&v13 + 1);
  double v10 = *(double *)&v14;
  uint64_t v11 = *((void *)&v13 + 1);
  uint64_t v12 = v14;
  [(CPZone *)self->contentZone mapToWordPairsWithIndex:accumulateRightGuideIntersections passing:v7];
  if (v13 < -1227133513 * ((v7[0] - (void)v5) >> 3)) {
    __assert_rtn("-[CPGuideFinder subdivideRightGuideAt:]", "CPGuideFinder.m", 696, "borderWordCount <= rhsStats.count");
  }
  -[CPGuideFinder subdivideStripInto:from:to:borderedBy:ofCount:crossedBy:ofCount:](self, "subdivideStripInto:from:to:borderedBy:ofCount:crossedBy:ofCount:", self->rightGuides, v5, v9, v10);
  free(v5);
}

- (void)subdivideLeftGuideAt:(unsigned int)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  size_t anchors = (size_t)self->anchors;
  if (anchors)
  {
    [(id)anchors clusterStatisticsAtIndex:*(void *)&a3];
    size_t anchors = 56 * v13;
  }
  double v5 = malloc_type_malloc(anchors, 0x1030040FAAEECD9uLL);
  crossingWordArray = self->crossingWordArray;
  v7[0] = v5;
  v7[1] = crossingWordArray;
  uint64_t v8 = 0;
  LODWORD(v8) = self->countOfWordsInZone;
  uint64_t v9 = *((void *)&v13 + 1);
  uint64_t v10 = v14;
  double v11 = *((double *)&v13 + 1);
  double v12 = *(double *)&v14;
  [(CPZone *)self->contentZone mapToWordPairsWithIndex:accumulateLeftGuideIntersections passing:v7];
  if (v13 < -1227133513 * ((v7[0] - (void)v5) >> 3)) {
    __assert_rtn("-[CPGuideFinder subdivideLeftGuideAt:]", "CPGuideFinder.m", 669, "borderWordCount <= anchorStats.count");
  }
  -[CPGuideFinder subdivideStripInto:from:to:borderedBy:ofCount:crossedBy:ofCount:](self, "subdivideStripInto:from:to:borderedBy:ofCount:crossedBy:ofCount:", self->leftGuides, v5, v11, v12);
  free(v5);
}

- (void)subdivideGutterFrom:(unsigned int)a3 to:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  long long v6 = 0uLL;
  memset(v17, 0, sizeof(v17));
  size_t rightHandSides = self->rightHandSides;
  if (rightHandSides)
  {
    [(CPCluster *)rightHandSides clusterStatisticsAtIndex:*(void *)&a3];
    long long v6 = 0uLL;
  }
  *(_OWORD *)uint64_t v16 = v6;
  *(_OWORD *)&v16[16] = v6;
  size_t anchors = self->anchors;
  if (anchors)
  {
    [(CPCluster *)anchors clusterStatisticsAtIndex:v4];
    int v9 = *(_DWORD *)v16;
  }
  else
  {
    int v9 = 0;
  }
  uint64_t v10 = malloc_type_malloc(56 * (v9 + LODWORD(v17[0])), 0x1030040FAAEECD9uLL);
  crossingWordArray = self->crossingWordArray;
  v12[0] = v10;
  v12[1] = crossingWordArray;
  uint64_t v13 = 0;
  LODWORD(v13) = self->countOfWordsInZone;
  long long v14 = *(_OWORD *)((char *)v17 + 8);
  long long v15 = *(_OWORD *)&v16[8];
  [(CPZone *)self->contentZone mapToWordPairsWithIndex:accumulateGutterIntersections passing:v12];
  if (*(_DWORD *)v16 + LODWORD(v17[0]) < -1227133513 * ((v12[0] - (void)v10) >> 3)) {
    __assert_rtn("-[CPGuideFinder subdivideGutterFrom:to:]", "CPGuideFinder.m", 642, "borderWordCount <= rhsStats.count + anchorStats.count");
  }
  -[CPGuideFinder subdivideStripInto:from:to:borderedBy:ofCount:crossedBy:ofCount:](self, "subdivideStripInto:from:to:borderedBy:ofCount:crossedBy:ofCount:", self->gutters, v10, *((double *)&v14 + 1), *(double *)&v15);
  free(v10);
}

- (void)subdivideStripInto:(id)a3 from:(double)a4 to:(double)a5 borderedBy:(id *)a6 ofCount:(unsigned int)a7 crossedBy:(id *)a8 ofCount:(unsigned int)a9
{
  qsort(a6, a7, 0x38uLL, (int (__cdecl *)(const void *, const void *))compareWordExtentBottomAscendingLeftDescending);
  unsigned int v59 = a9;
  qsort(a8, a9, 0x38uLL, (int (__cdecl *)(const void *, const void *))compareWordExtentBottomAscendingLeftDescending);
  if (a7)
  {
    unsigned int v16 = a7;
    int v17 = 0;
    uint64_t v18 = 0;
    LODWORD(v19) = 0;
    unsigned int v20 = 0;
    var6 = 0;
    double v22 = 0.0;
    double v23 = 0.0;
    v55 = a8;
    p_double var3 = &a8->var3;
    double v24 = 0.0;
    unsigned int v58 = v16;
    unsigned int v25 = a9;
    do
    {
      uint64_t v26 = (int)v20;
      v27 = &a6[v20];
      if (v16 <= v20 + 1) {
        unsigned int v28 = v20 + 1;
      }
      else {
        unsigned int v28 = v16;
      }
      unsigned int v57 = v28;
      uint64_t v29 = v18;
      double v30 = v23;
      double v31 = v24;
      while (1)
      {
        double v24 = v31;
        double v23 = v30;
        uint64_t v18 = v29;
        uint64_t v32 = v26;
        v33 = &a6[v26];
        double var2 = v33->var2;
        double var3 = v33->var3;
        double var0 = v33->var0;
        double var1 = v33->var1;
        if ((int)v18 < 1) {
          goto LABEL_44;
        }
        if (v19 != v25 && var3 > v22) {
          break;
        }
        BOOL v38 = v18 <= 1 && v17 <= 0;
        int v39 = !v38;
        int var4 = a6[v26].var4;
        if ((var4 & 2) != 0 && var1 <= a5) {
          int v41 = 1;
        }
        else {
          int v41 = var4 & (var0 >= a4);
        }
        if (self->gutters == a3
          || (v41 & v39 & 1) != 0
          || (v42 = CPPDFStyleEqual((uint64_t)var6, (uint64_t)a6[v32].var6, 0xFFFF), unsigned int v16 = v58, v25 = v59, (v42 & 1) != 0))
        {
          if (var3 <= v23) {
            double v30 = v23;
          }
          else {
            double v30 = var3;
          }
          uint64_t v29 = (v18 + 1);
          double v31 = v24;
        }
        else
        {
          uint64_t v29 = 1;
          if (v18 < 5)
          {
            int v17 = 0;
            double v31 = var2;
            double v30 = var3;
          }
          else
          {
            double v31 = var2;
            double v30 = var3;
            BOOL v38 = v17 < 1;
            int v17 = 0;
            if (!v38)
            {
              if ([(CPGuideFinder *)self addStripTo:a3 bottom:v24 left:a4 top:v23 right:a5])
              {
                uint64_t v43 = v18;
                unint64_t v44 = v18 + 1;
                v45 = &v27[-v43];
                do
                {
                  [(CPGuideFinder *)self setAlignForWordWithExtent:v45 stripArray:a3 stripMax:a5];
                  --v44;
                  ++v45;
                }
                while (v44 > 1);
              }
              int v17 = 0;
              uint64_t v29 = 1;
              double v31 = var2;
              double v30 = var3;
              unsigned int v16 = v58;
              unsigned int v25 = v59;
            }
          }
        }
        v17 += v41;
        var6 = a6[v32].var6;
        uint64_t v26 = v32 + 1;
        ++v27;
        if ((int)v32 + 1 >= v16)
        {
          double v24 = v31;
          double v23 = v30;
          uint64_t v18 = v29;
          unsigned int v20 = v57;
          goto LABEL_45;
        }
      }
      if (v18 < 5 || v17 < 1)
      {
        int v17 = 0;
LABEL_44:
        unsigned int v20 = v26;
        goto LABEL_45;
      }
      if ([(CPGuideFinder *)self addStripTo:a3 bottom:v31 left:a4 top:v30 right:a5])
      {
        uint64_t v46 = v18;
        unint64_t v47 = v18 + 1;
        v48 = &v27[-v46];
        do
        {
          [(CPGuideFinder *)self setAlignForWordWithExtent:v48 stripArray:a3 stripMax:a5];
          --v47;
          ++v48;
        }
        while (v47 > 1);
        uint64_t v18 = 0;
      }
      int v17 = 0;
      unsigned int v20 = v32;
      unsigned int v16 = v58;
      unsigned int v25 = v59;
LABEL_45:
      if (v20 == v16) {
        break;
      }
      if (v19 < v25)
      {
        uint64_t v49 = ~v19 + v25 + (uint64_t)(int)v19;
        v50 = &p_var3[7 * (int)v19];
        uint64_t v19 = (int)v19;
        while (*v50 <= var2)
        {
          ++v19;
          v50 += 7;
          if (v19 >= v25)
          {
            double v22 = v55[v49].var2;
            LODWORD(v19) = v25;
            goto LABEL_60;
          }
        }
        double v22 = v55[v19].var2;
        if (var3 <= v22)
        {
          int v51 = a6[v32].var4;
          if ((v51 & 2) != 0 && var1 <= a5 || (v51 & 1) != 0 && var0 >= a4) {
            int v17 = 1;
          }
          var6 = a6[v32].var6;
          uint64_t v18 = 1;
          double v24 = var2;
          double v23 = var3;
        }
        ++v20;
      }
      if (v19 == v25)
      {
LABEL_60:
        int v52 = a6[v32].var4;
        if ((v52 & 2) != 0 && var1 <= a5 || (v52 & 1) != 0 && var0 >= a4) {
          int v17 = 1;
        }
        var6 = a6[v32].var6;
        ++v20;
        uint64_t v18 = 1;
        double v24 = var2;
        double v23 = var3;
      }
    }
    while (v20 < v16 && v19 <= v25);
    if ((int)v18 >= 5
      && v17 >= 1
      && [(CPGuideFinder *)self addStripTo:a3 bottom:v24 left:a4 top:v23 right:a5])
    {
      unint64_t v53 = v18 + 1;
      int v54 = v58 - v18;
      do
      {
        [(CPGuideFinder *)self setAlignForWordWithExtent:&a6[v54] stripArray:a3 stripMax:a5];
        --v53;
        ++v54;
      }
      while (v53 > 1);
    }
  }
}

- (void)setAlignForWordWithExtent:(id *)a3 stripArray:(id)a4 stripMax:(double)a5
{
  if (self->leftGuides == a4)
  {
    int v5 = 1;
  }
  else if (self->rightGuides == a4)
  {
    int v5 = 2;
  }
  else if (a3->var0 >= a5)
  {
    int v5 = 4;
  }
  else
  {
    int v5 = 8;
  }
  *a3->var5 |= v5;
}

- (BOOL)addStripTo:(id)a3 bottom:(double)a4 left:(double)a5 top:(double)a6 right:(double)a7
{
  double v11 = a5;
  double v12 = a4;
  double v13 = a7 - a5;
  double v14 = a6 - a4;
  char v7 = (vabdd_f64(a6, a4) == INFINITY) | (fabs(a4) == INFINITY) | (fabs(a5) == INFINITY) | (vabdd_f64(a7, a5) == INFINITY);
  if ((v7 & 1) == 0)
  {
    int v9 = (void *)[objc_alloc(MEMORY[0x1E4F29238]) initWithBytes:&v11 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    objc_msgSend(a3, "addObject:", v9, *(void *)&v11, *(void *)&v12, *(void *)&v13, *(void *)&v14);
  }
  return v7 ^ 1;
}

- (void)getWordEdges
{
  unsigned int v3 = [(CPZone *)self->contentZone wordCount];
  self->uint64_t countOfWordsInZone = v3;
  if (v3)
  {
    self->anchorArray = (double *)malloc_type_malloc(8 * v3, 0x100004000313F17uLL);
    self->rightHandSideArray = (double *)malloc_type_malloc(8 * self->countOfWordsInZone, 0x100004000313F17uLL);
    uint64_t v4 = malloc_type_malloc(8 * self->countOfWordsInZone, 0x100004000313F17uLL);
    int v5 = malloc_type_malloc(8 * self->countOfWordsInZone, 0x100004000313F17uLL);
    long long v6 = *(_OWORD *)&self->anchorArray;
    char v7 = v4;
    uint64_t v8 = v5;
    [(CPZone *)self->contentZone mapToWordsWithIndex:accumulateWordAlignmentData passing:&v6];
    qsort(self->anchorArray, self->countOfWordsInZone, 8uLL, (int (__cdecl *)(const void *, const void *))compareDouble);
    qsort(self->rightHandSideArray, self->countOfWordsInZone, 8uLL, (int (__cdecl *)(const void *, const void *))compareDouble);
    self->double medianFontSizeOfFirstCharacter = medianDouble((uint64_t)v4, self->countOfWordsInZone);
    self->double medianFontSizeOfLastCharacter = medianDouble((uint64_t)v5, self->countOfWordsInZone);
    free(v5);
    free(v4);
  }
}

- (double)medianFontSizeOfLastCharacter
{
  return self->medianFontSizeOfLastCharacter;
}

- (double)medianFontSizeOfFirstCharacter
{
  return self->medianFontSizeOfFirstCharacter;
}

- (void)dealloc
{
  [(CPGuideFinder *)self dispose];

  v3.receiver = self;
  v3.super_class = (Class)CPGuideFinder;
  [(CPGuideFinder *)&v3 dealloc];
}

- (void)finalize
{
  [(CPGuideFinder *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPGuideFinder;
  [(CPGuideFinder *)&v3 finalize];
}

- (void)dispose
{
  if (self->contentZone)
  {
    [(CPCluster *)self->anchors dispose];
    [(CPCluster *)self->rightHandSides dispose];
    free(self->anchorArray);
    free(self->rightHandSideArray);
    free(self->crossingWordArray);
    self->contentZone = 0;
  }
}

- (CPGuideFinder)initWithContentZone:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPGuideFinder;
  uint64_t v4 = [(CPGuideFinder *)&v7 init];
  int v5 = v4;
  if (v4)
  {
    v4->contentZone = (CPZone *)a3;
    v4->gutters = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->leftGuides = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->rightGuides = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v5;
}

+ (void)reclusterBetweenGuides:(id)a3
{
  if ([a3 wordCount])
  {
    uint64_t v4 = [a3 wordArray];
    int v6 = *(_DWORD *)(v4 + 8);
    int v5 = *(_DWORD *)(v4 + 12);
    int v7 = v5 & 0x55;
    int v22 = 0;
    int v8 = v5 & 0xAA;
    if ([a3 wordCount] < 2)
    {
      uint64_t v9 = 0;
      unsigned int v10 = 1;
      int v11 = v6;
    }
    else
    {
      uint64_t v9 = 0;
      unsigned int v10 = 1;
      int v11 = v6;
      do
      {
        int v12 = *(_DWORD *)(v4 + 48 * v10 + 12);
        int v13 = v12 & 0x55;
        if (v8 | v13)
        {
          int v22 = v10 - v9;
          +[CPCluster reclusterTextLine:a3 fromWordIndex:v9 count:&v22];
          uint64_t v14 = [a3 wordArray];
          uint64_t v4 = v14;
          uint64_t v15 = v14 + 48 * v9;
          int v16 = *(_DWORD *)(v15 + 12) | v7;
          *(_DWORD *)(v15 + 8) = v6;
          *(_DWORD *)(v15 + 12) = v16;
          uint64_t v9 = (v22 + v9);
          if (v22) {
            *(_DWORD *)(v14 + 48 * (v9 - 1) + 12) |= v8;
          }
          uint64_t v17 = v14 + 48 * v9;
          int v6 = *(_DWORD *)(v17 + 8);
          int v12 = *(_DWORD *)(v17 + 12);
          if (v11 <= v6) {
            int v11 = v6;
          }
          int v7 = v13;
          unsigned int v10 = v9;
        }
        ++v10;
        int v8 = v12 & 0xAA;
      }
      while (v10 < [a3 wordCount]);
    }
    int v22 = v10 - v9;
    +[CPCluster reclusterTextLine:a3 fromWordIndex:v9 count:&v22];
    uint64_t v18 = [a3 wordArray];
    uint64_t v19 = v18 + 48 * v9;
    int v20 = *(_DWORD *)(v19 + 12) | v7;
    *(_DWORD *)(v19 + 8) = v6;
    *(_DWORD *)(v19 + 12) = v20;
    if (v22)
    {
      uint64_t v21 = v18 + 48 * (v9 + v22 - 1);
      *(_DWORD *)(v21 + 12) |= v8;
    }
    if ((int)[a3 levels] <= v11) {
      [a3 setLevels:(v11 + 1)];
    }
  }
}

+ (void)reclusterPreservingAlignment:(id)a3
{
  unsigned int v4 = [a3 wordCount];
  if (v4)
  {
    unsigned int v5 = v4;
    size_t v6 = 48 * v4;
    int v7 = (char *)malloc_type_malloc(v6, 0xFC5354EAuLL);
    memcpy(v7, (const void *)[a3 wordArray], v6);
    +[CPCluster clusterTextLine:a3];
    unsigned int v8 = [a3 wordCount];
    uint64_t v9 = [a3 wordArray];
    if (v8)
    {
      unsigned int v10 = 0;
      unsigned int v11 = 0;
      do
      {
        int v12 = (_DWORD *)(v9 + 48 * v10);
        int v13 = *(_DWORD *)&v7[48 * v11];
        unsigned int v14 = v12[1];
        if (*v12 == v13)
        {
          uint64_t v15 = &v7[48 * v11];
          unsigned int v16 = *((_DWORD *)v15 + 1);
          int v17 = *((_DWORD *)v15 + 3);
          if (v14 == v16)
          {
            *(_DWORD *)(v9 + 48 * v10 + 12) = v17;
LABEL_9:
            ++v11;
            goto LABEL_13;
          }
          *(_DWORD *)(v9 + 48 * v10 + 12) |= v17 & 0x55;
          if (v14 > v16) {
            goto LABEL_11;
          }
        }
        else
        {
          unsigned int v18 = v14 + *v12;
          unsigned int v19 = *(_DWORD *)&v7[48 * v11 + 4] + v13;
          if (v18 == v19)
          {
            *(_DWORD *)(v9 + 48 * v10 + 12) |= *(_DWORD *)&v7[48 * v11 + 12] & 0xAA;
            goto LABEL_9;
          }
          if (v18 > v19)
          {
LABEL_11:
            ++v11;
            continue;
          }
        }
LABEL_13:
        ++v10;
      }
      while (v11 < v5 && v10 < v8);
    }
    free(v7);
  }
}

+ (BOOL)gutterSeparates:(id)a3 from:(id)a4
{
  uint64_t v5 = [a3 lastWord];
  uint64_t v6 = [a4 firstWord];
  BOOL result = 0;
  if (v5 && v6) {
    return (*(unsigned char *)(v5 + 12) & 0x88) != 0 || (*(unsigned char *)(v6 + 12) & 0x44) != 0;
  }
  return result;
}

+ (BOOL)guideSeparates:(id)a3 from:(id)a4
{
  uint64_t v5 = [a3 lastWord];
  uint64_t v6 = [a4 firstWord];
  BOOL result = 0;
  if (v5 && v6) {
    return (*(unsigned char *)(v5 + 12) & 0xAA) != 0 || (*(unsigned char *)(v6 + 12) & 0x55) != 0;
  }
  return result;
}

@end