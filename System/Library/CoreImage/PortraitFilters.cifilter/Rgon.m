@interface Rgon
+ (id)newInterpolatedRgonFrom:(id)a3 withRgon:(id)a4 param:(float)a5;
- ($94F468A8D4C62B317260615823C2B210)intersectionEdge:(int)a3 withEdge:(int)a4;
- (BOOL)CollapseOrphans;
- (BOOL)IntersectionRgonOf:(id)a3 withRgon:(id)a4;
- (CGRect)boundsFloatRect;
- (NSArray)enclosedPoints;
- (Rgon)init;
- (Rgon)initWithCoder:(id)a3;
- (double)Density;
- (double)count;
- (float)Area;
- (float)AspectRatio;
- (float)CommonCenterForIndex:(int)a3;
- (float)Diameter;
- (float)DiameterAtFacetCountMeasuredFromVertical:(int)a3;
- (float)DistToPointX:(float)a3 Y:(float)a4;
- (float)DistanceBetweenCenters:(id)a3;
- (float)DistanceCenterToRGon:(id)a3;
- (float)DistanceFromRgon:(id)a3;
- (float)MeanVertexDistFromX:(float)a3 Y:(float)a4;
- (float)MinDiameter;
- (float)Perimeter;
- (float)Radius;
- (float)XCenter;
- (float)YCenter;
- (float)aspectRatio;
- (float)currentArea;
- (float)dASide:(int)a3 movesds:(float)a4;
- (float)dASide:(int)a3 movesds:(float)a4 retaining:(int)a5 pointsFromArray:(id)a6;
- (float)pointerToRgonArray;
- (float)rgonPtr;
- (float)vertexAtClockHour:(float)a3;
- (float)xmax;
- (float)xmin;
- (float)ymax;
- (float)ymin;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createWithCollapsedOrphans2;
- (id)unionRgonOf:(id)a3 withRgon:(id)a4;
- (int)AdjustForPointX:(float)a3 Y:(float)a4;
- (int)AspectIndex;
- (int)OutsideReturnFirstEdgeExcludingX:(float)a3 Y:(float)a4;
- (int)containsPointX:(float)a3 Y:(float)a4;
- (int)containsPointX:(float)a3 Y:(float)a4 inArray:(int *)a5 ofCount:(int)a6;
- (int)containsPointX:(float)a3 Y:(float)a4 withTolerance:(float)a5 returnIndex:(int *)a6;
- (int)maxAxisIndex;
- (int)pointX:(float)a3 Y:(float)a4 isOutsideBorderlinesInArray:(int *)a5 ofCount:(int)a6;
- (int64_t)pointCount;
- (void)CalculateAndReturnVertices:(float *)a3;
- (void)CalculateEdges;
- (void)CalculateFromVertices;
- (void)CalculateVertices;
- (void)Dilate:(float)a3;
- (void)DirectionalDilateByAmount:(float)a3 xDirection:(float)a4 yDirection:(float)a5;
- (void)IntersectionOfEdge:(int)a3 withEdge:(int)a4 resultPoint:(float)a5[2];
- (void)PrintConstraints;
- (void)PrintVertices;
- (void)PrintVerticesWithZCoord:(double)a3;
- (void)Reset;
- (void)RoundToPercent:(float)a3;
- (void)ShrinkByAmount:(float)a3;
- (void)UnionWith:(id)a3;
- (void)dealloc;
- (void)dentRgonInwardByAmount:(float)a3 xDirection:(float)a4 yDirection:(float)a5;
- (void)encodeWithCoder:(id)a3;
- (void)recalculateMaxMins;
- (void)setAspectRatio:(float)a3;
- (void)setCount:(double)a3;
- (void)setCurrentArea:(float)a3;
- (void)setMaxAxisIndex:(int)a3;
- (void)setPointCount:(int64_t)a3;
- (void)setPointerToRgonArray:(float *)a3;
- (void)setRgonPtr:(float *)(a3;
- (void)setXmax:(float)a3;
- (void)setXmin:(float)a3;
- (void)setYmax:(float)a3;
- (void)setYmin:(float)a3;
- (void)translateByAmount:(float)a3 xDirection:(float)a4 yDirection:(float)a5;
@end

@implementation Rgon

- (Rgon)init
{
  v8.receiver = self;
  v8.super_class = (Class)Rgon;
  v2 = [(Rgon *)&v8 init];
  if (v2)
  {
    uint64_t v3 = 0;
    float v4 = 0.0;
    do
    {
      __float2 v5 = __sincosf_stret(v4);
      v6 = &v2[v3];
      *((float *)v6 + 2) = -v5.__cosval;
      *((float *)v6 + 3) = -v5.__sinval;
      *((void *)v6 + 2) = 0;
      *((void *)v6 + 3) = 0;
      *(void *)(v6 + 28) = 3212836864;
      float v4 = v4 + 0.196349541;
      v3 += 28;
    }
    while (v3 != 896);
    [v2 setRgonPtr:v2 + 8];
    [v2 setPointerToRgonArray:v2 + 8];
    *((void *)v2 + 118) = 0;
    *((void *)v2 + 122) = 0;
    *((_DWORD *)v2 + 238) = 0;
    *(_OWORD *)(v2 + 956) = xmmword_56360;
  }
  return (Rgon *)v2;
}

- (Rgon)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)Rgon;
  float v4 = [(Rgon *)&v9 init];
  if (v4)
  {
    uint64_t v8 = 0;
    __float2 v5 = [a3 decodeBytesForKey:@"RGON_ARRAY" returnedLength:&v8];
    for (uint64_t i = 0; i != 896; ++i)
      *((unsigned char *)v4->rgonArray[0] + i) = v5[i];
    [(Rgon *)v4 setRgonPtr:v4->rgonArray];
  }
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)Rgon;
  [(Rgon *)&v2 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)Reset
{
  uint64_t v3 = 0;
  rgonArray = self->rgonArray;
  float v5 = 0.0;
  do
  {
    __float2 v6 = __sincosf_stret(v5);
    v7 = (char *)self + v3;
    *((float *)v7 + 2) = -v6.__cosval;
    *((float *)v7 + 3) = -v6.__sinval;
    *((void *)v7 + 2) = 0;
    *((void *)v7 + 3) = 0;
    *(void *)(v7 + 28) = 3212836864;
    float v5 = v5 + 0.196349541;
    v3 += 28;
  }
  while (v3 != 896);

  [(Rgon *)self setRgonPtr:rgonArray];
}

- (id)copyWithZone:(_NSZone *)a3
{
  float v4 = [+[Rgon allocWithZone:a3] init];
  float v5 = [(Rgon *)v4 rgonPtr];
  __float2 v6 = [(Rgon *)self rgonPtr];
  uint64_t v7 = 0;
  do
  {
    (*v5)[v7] = (*v6)[v7];
    ++v7;
  }
  while ((v7 * 4) != 896);
  [(Rgon *)v4 setPointerToRgonArray:&(*v5)[v7]];
  return v4;
}

- (float)vertexAtClockHour:(float)a3
{
  unsigned int v3 = llroundf((float)((float)(a3 + -3.0) / -12.0) * 32.0) + 32;
  int v4 = v3 & 0x1F;
  int v6 = -v3;
  BOOL v5 = v6 < 0;
  int v7 = v6 & 0x1F;
  if (v5) {
    int v8 = v4;
  }
  else {
    int v8 = -v7;
  }
  return &self->rgonArray[v8][3];
}

- (int)AdjustForPointX:(float)a3 Y:(float)a4
{
  uint64_t v4 = 0;
  BOOL v5 = &self->rgonArray[0][2];
  int v6 = -1;
  float v7 = -1.0;
  do
  {
    float v8 = (float)(*(v5 - 1) * a4) + (float)(a3 * *(v5 - 2));
    if (v5[1] == 0.0)
    {
      v5[1] = 1.0;
      if (v5[3] == -1.0) {
LABEL_6:
      }
        v5[3] = 1.0;
LABEL_7:
      *BOOL v5 = v8;
      int v6 = v4;
      goto LABEL_8;
    }
    if (v5[3] == -1.0) {
      goto LABEL_6;
    }
    float v9 = v8 - *v5;
    if (v9 < 0.0) {
      goto LABEL_7;
    }
    BOOL v10 = v7 < 0.0;
    if (v9 < v7) {
      BOOL v10 = 1;
    }
    if (v10)
    {
      int v6 = v4;
      float v7 = v8 - *v5;
    }
LABEL_8:
    ++v4;
    v5 += 7;
  }
  while (v4 != 32);
  self->count = self->count + 1.0;
  if (self->ymin > a4) {
    self->ymin = a4;
  }
  if (self->ymax < a4) {
    self->ymax = a4;
  }
  if (self->xmin > a3) {
    self->xmin = a3;
  }
  if (self->xmax < a3) {
    self->xmax = a3;
  }
  return v6;
}

- (void)CalculateVertices
{
  objc_super v2 = &self->rgonArray[0][2];
  for (uint64_t i = 1; i != 33; ++i)
  {
    uint64_t v4 = self->rgonArray[i & 0x1F];
    float v5 = *v2;
    float v6 = v4[2];
    float v7 = *v4;
    v4[3] = (float)((float)(v4[1] * *v2) - (float)(*(v2 - 1) * v6)) * 5.1258;
    v4[4] = (float)((float)(v6 * *(v2 - 2)) - (float)(v7 * v5)) * 5.1258;
    v2 += 7;
  }
}

- (float)dASide:(int)a3 movesds:(float)a4
{
  [(Rgon *)self Area];
  float v8 = v7;
  float v9 = objc_alloc_init(Rgon);
  rgonArray = self->rgonArray;
  v11 = rgonArray[a3];
  float v12 = *v11;
  float v13 = v11[1];
  float v14 = v11[2] + a4;
  for (int i = 1; i != 33; ++i)
  {
    if ((float)((float)(v13 * rgonArray[i & 0x1F][4]) + (float)(v12 * rgonArray[i & 0x1F][3])) > v14) {
      -[Rgon AdjustForPointX:Y:](v9, "AdjustForPointX:Y:");
    }
  }
  [(Rgon *)v9 CalculateVertices];
  [(Rgon *)v9 CalculateEdges];
  [(Rgon *)v9 Area];
  float v17 = v8 - v16;

  return v17;
}

- (float)dASide:(int)a3 movesds:(float)a4 retaining:(int)a5 pointsFromArray:(id)a6
{
  [(Rgon *)self Area];
  float v12 = v11;
  float v13 = objc_alloc_init(Rgon);
  uint64_t v14 = 0;
  v15 = (float *)((char *)self + 28 * a3);
  float v17 = v15[4];
  float v16 = v15 + 4;
  float v18 = *(v16 - 2);
  float v19 = *(v16 - 1);
  float v20 = v17 + a4;
  do
  {
    if ((float)((float)(v19 * self->rgonArray[v14][4]) + (float)(v18 * self->rgonArray[v14][3])) > v20) {
      -[Rgon AdjustForPointX:Y:](v13, "AdjustForPointX:Y:");
    }
    ++v14;
  }
  while (v14 != 32);
  objc_msgSend(objc_msgSend(a6, "objectAtIndex:", 0), "getValue:", &v35);
  double v21 = v18;
  double v22 = v19;
  float v23 = v36 * v22 + v21 * v35 - *v16;
  if (v23 >= a4)
  {
    unsigned int v25 = 0;
  }
  else
  {
    unint64_t v24 = 0;
    do
    {
      objc_msgSend(objc_msgSend(a6, "objectAtIndex:", v24), "getValue:", &v35);
      unsigned int v25 = v24 + 1;
      float v26 = v36 * v22 + v21 * v35 - *v16;
      if (v26 >= a4) {
        break;
      }
    }
    while (v24++ < 0x63);
  }
  if (a5 >= 1)
  {
    unint64_t v28 = v25 + a5;
    unint64_t v29 = v25;
    do
    {
      objc_msgSend(objc_msgSend(a6, "objectAtIndex:", v29), "getValue:", &v35);
      HIDWORD(v30) = HIDWORD(v35);
      HIDWORD(v31) = HIDWORD(v36);
      if (v36 * v22 + v21 * v35 > v20)
      {
        *(float *)&double v30 = v35;
        *(float *)&double v31 = v36;
        [(Rgon *)v13 AdjustForPointX:v30 Y:v31];
      }
      ++v29;
    }
    while (v29 < v28);
  }
  [(Rgon *)v13 CalculateVertices];
  [(Rgon *)v13 CalculateEdges];
  [(Rgon *)v13 Area];
  float v33 = v12 - v32;

  return v33;
}

- (void)CalculateAndReturnVertices:(float *)a3
{
  unsigned int v3 = &self->rgonArray[0][2];
  int v4 = 2;
  for (uint64_t i = 1; i != 33; ++i)
  {
    float v6 = self->rgonArray[i & 0x1F];
    float v7 = *v3;
    float v8 = v6[2];
    float v9 = *v6;
    float v10 = (float)((float)(v6[1] * *v3) - (float)(*(v3 - 1) * v8)) * 5.1258;
    v6[3] = v10;
    v6[4] = (float)((float)(v8 * *(v3 - 2)) - (float)(v9 * v7)) * 5.1258;
    a3[v4 & 0x3E] = v10;
    a3[v4 & 0x3E | 1] = v6[4];
    v3 += 7;
    v4 += 2;
  }
}

- (CGRect)boundsFloatRect
{
  objc_super v2 = &self->rgonArray[0][2];
  float v3 = 3.4028e38;
  float v4 = -3.4028e38;
  uint64_t v5 = 1;
  float v6 = -3.4028e38;
  float v7 = 3.4028e38;
  do
  {
    float v8 = self->rgonArray[v5 & 0x1F];
    float v9 = *v2;
    float v10 = v8[2];
    float v11 = *v8;
    float v12 = (float)((float)(v8[1] * *v2) - (float)(*(v2 - 1) * v10)) * 5.1258;
    v8[3] = v12;
    float v13 = (float)((float)(v10 * *(v2 - 2)) - (float)(v11 * v9)) * 5.1258;
    v8[4] = v13;
    if (v12 < v7) {
      float v7 = v12;
    }
    if (v12 > v6) {
      float v6 = v12;
    }
    if (v13 < v3) {
      float v3 = v13;
    }
    if (v13 > v4) {
      float v4 = v13;
    }
    v2 += 7;
    ++v5;
  }
  while (v5 != 33);
  double v14 = v7;
  double v15 = v3;
  double v16 = (float)(v6 - v7);
  double v17 = (float)(v4 - v3);
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)CalculateFromVertices
{
  uint64_t v3 = 0;
  float v4 = &self->rgonArray[1][4];
  do
  {
    *(float *)&double v5 = *(v4 - 8);
    *((float *)&v5 + 1) = *(v4 - 1);
    *(float *)&double v6 = *(v4 - 7);
    *((float *)&v6 + 1) = *v4;
    float v7 = (float *)&v10[v3];
    vst2_f32(v7, *(float32x2x2_t *)&v5);
    v3 += 16;
    v4 += 14;
  }
  while (v3 != 256);
  for (uint64_t i = 20; i != 916; i += 28)
    *(_DWORD *)((char *)&self->super.isa + i) = 0;
  for (uint64_t j = 0; j != 256; j += 8)
  {
    LODWORD(v5) = *(_DWORD *)&v10[j];
    LODWORD(v6) = *(_DWORD *)&v10[j + 4];
    [(Rgon *)self AdjustForPointX:v5 Y:v6];
  }
  [(Rgon *)self CalculateVertices];

  [(Rgon *)self CalculateEdges];
}

- (void)CalculateEdges
{
  objc_super v2 = (float32x2_t *)&self->rgonArray[0][5];
  for (uint64_t i = 1; i != 33; ++i)
  {
    float32x2_t *v2 = vsub_f32(*(float32x2_t *)&self->rgonArray[i & 0x1F][3], v2[-1]);
    objc_super v2 = (float32x2_t *)((char *)v2 + 28);
  }
}

- (void)DirectionalDilateByAmount:(float)a3 xDirection:(float)a4 yDirection:(float)a5
{
  for (uint64_t i = 0; i != 32; ++i)
  {
    float v7 = (float)(self->rgonArray[i][1] * a5) + (float)(self->rgonArray[i][0] * a4);
    if (v7 < 0.0) {
      self->rgonArray[i][2] = self->rgonArray[i][2] + (float)(a3 * v7);
    }
  }
  [(Rgon *)self CalculateVertices];
  [(Rgon *)self CalculateEdges];

  [(Rgon *)self recalculateMaxMins];
}

- (void)translateByAmount:(float)a3 xDirection:(float)a4 yDirection:(float)a5
{
  for (uint64_t i = 0; i != 32; ++i)
    self->rgonArray[i][2] = self->rgonArray[i][2]
                          + (float)(a3
                                  * (float)((float)(self->rgonArray[i][1] * a5) + (float)(self->rgonArray[i][0] * a4)));
  [(Rgon *)self CalculateVertices];

  [(Rgon *)self CalculateEdges];
}

- (void)dentRgonInwardByAmount:(float)a3 xDirection:(float)a4 yDirection:(float)a5
{
  [(Rgon *)self CalculateVertices];
  uint64_t v9 = 0;
  float v10 = (float)(self->rgonArray[0][4] * a5) + (float)(self->rgonArray[0][3] * a4);
  do
  {
    float v11 = self->rgonArray[v9 + 1][4] * a5;
    if ((float)(v11 + (float)(self->rgonArray[v9 + 1][3] * a4)) < v10) {
      float v10 = v11 + (float)(self->rgonArray[v9 + 1][3] * a4);
    }
    ++v9;
  }
  while (v9 != 31);
  for (uint64_t i = 0; i != 32; ++i)
  {
    float v13 = (float *)((char *)self + i * 28);
    float v15 = self->rgonArray[i][3];
    float v14 = self->rgonArray[i][4];
    float v16 = (float)((float)(v14 * a5) + (float)(v15 * a4)) - v10;
    if (v16 < a3)
    {
      float v17 = a3 - v16;
      v13[5] = v15 + (float)(a4 * v17);
      v13[6] = v14 + (float)(a5 * v17);
    }
  }
  [(Rgon *)self CalculateFromVertices];

  [(Rgon *)self CalculateEdges];
}

- (void)Dilate:(float)a3
{
  for (uint64_t i = 16; i != 912; i += 28)
    *(float *)((char *)&self->super.isa + i) = *(float *)((char *)&self->super.isa + i) - a3;
  [(Rgon *)self CalculateVertices];
  [(Rgon *)self CalculateEdges];

  [(Rgon *)self recalculateMaxMins];
}

- (void)recalculateMaxMins
{
  float ymax = self->ymax;
  for (uint64_t i = 24; i != 920; i += 28)
  {
    float v4 = *(float *)((char *)&self->super.isa + i);
    p_float ymax = &self->ymax;
    float v6 = v4;
    if (v4 <= ymax)
    {
      p_float ymax = &self->ymin;
      float v6 = ymax;
      if (v4 >= self->ymin) {
        continue;
      }
    }
    *p_float ymax = v4;
    float ymax = v6;
  }
}

- (int)containsPointX:(float)a3 Y:(float)a4 inArray:(int *)a5 ofCount:(int)a6
{
  uint64_t v6 = 0;
  int v7 = 0;
  rgonArray = self->rgonArray;
  do
  {
    if (self->rgonArray[v6][3] != 0.0 || self->rgonArray[v6][5] != 0.0) {
      ++v7;
    }
    ++v6;
  }
  while (v6 != 4);
  if (v7 < 3) {
    return 0;
  }
  if (a6 < 1) {
    return 1;
  }
  if ((float)((float)(rgonArray[*a5][1] * a4) + (float)(rgonArray[*a5][0] * a3)) < (float)(rgonArray[*a5][2] + -0.00001)) {
    return 0;
  }
  uint64_t v10 = 1;
  do
  {
    unint64_t v11 = v10;
    if (a6 == v10) {
      break;
    }
    float v12 = rgonArray[a5[v10]];
    float v13 = (float)(v12[1] * a4) + (float)(*v12 * a3);
    float v14 = v12[2] + -0.00001;
    uint64_t v10 = v11 + 1;
  }
  while (v13 >= v14);
  return v11 >= a6;
}

- (int)pointX:(float)a3 Y:(float)a4 isOutsideBorderlinesInArray:(int *)a5 ofCount:(int)a6
{
  uint64_t v6 = 0;
  int v7 = 0;
  rgonArray = self->rgonArray;
  do
  {
    if (self->rgonArray[v6][3] != 0.0 || self->rgonArray[v6][5] != 0.0) {
      ++v7;
    }
    ++v6;
  }
  while (v6 != 4);
  int result = 0;
  if (v7 >= 3 && a6 >= 1)
  {
    if ((float)((float)(rgonArray[*a5][1] * a4) + (float)(rgonArray[*a5][0] * a3)) >= (float)(rgonArray[*a5][2]
                                                                                             + -0.00001))
    {
      uint64_t v10 = 1;
      do
      {
        unint64_t v11 = v10;
        if (a6 == v10) {
          break;
        }
        float v12 = rgonArray[a5[v10]];
        float v13 = (float)(v12[1] * a4) + (float)(*v12 * a3);
        float v14 = v12[2] + -0.00001;
        uint64_t v10 = v11 + 1;
      }
      while (v13 >= v14);
      return v11 < a6;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (int)containsPointX:(float)a3 Y:(float)a4
{
  uint64_t v4 = 0;
  int v5 = 0;
  do
  {
    if (self->rgonArray[v4][3] != 0.0 || self->rgonArray[v4][5] != 0.0) {
      ++v5;
    }
    ++v4;
  }
  while (v4 != 4);
  if (v5 < 3) {
    return 0;
  }
  uint64_t lastFaceFlunked = self->lastFaceFlunked;
  uint64_t v8 = lastFaceFlunked + 31;
  do
  {
    uint64_t v9 = self->rgonArray[dword_56398[lastFaceFlunked]];
    float v10 = (float)(v9[1] * a4) + (float)(*v9 * a3);
    float v11 = v9[2] + -0.01;
  }
  while (v10 >= v11 && lastFaceFlunked++ < v8);
  return v10 >= v11;
}

- (int)containsPointX:(float)a3 Y:(float)a4 withTolerance:(float)a5 returnIndex:(int *)a6
{
  uint64_t v6 = 0;
  int v7 = 0;
  uint64_t lastFaceFlunked = self->lastFaceFlunked;
  do
  {
    if (self->rgonArray[v6][3] != 0.0 || self->rgonArray[v6][5] != 0.0) {
      ++v7;
    }
    ++v6;
  }
  while (v6 != 4);
  if (v7 >= 3)
  {
    uint64_t v11 = 0;
    while (1)
    {
      float v12 = self->rgonArray[dword_56398[lastFaceFlunked + v11]];
      if ((float)((float)(v12[1] * a4) + (float)(*v12 * a3)) < (float)(v12[2] - a5)) {
        break;
      }
      if (++v11 == 32)
      {
        int v9 = 0;
        int result = 1;
        if (a6) {
          goto LABEL_15;
        }
        return result;
      }
    }
    int result = 0;
    int v9 = lastFaceFlunked + v11;
    if (!a6) {
      return result;
    }
    goto LABEL_15;
  }
  int v9 = 0;
  int result = 0;
  if (a6) {
LABEL_15:
  }
    *a6 = v9;
  return result;
}

- (float)CommonCenterForIndex:(int)a3
{
  float v3 = 0.0;
  for (uint64_t i = 8; i != 904; i += 28)
    float v3 = v3 + *(float *)((char *)&self->super.isa + 4 * a3 + i);
  return v3 * 0.03125;
}

- (float)XCenter
{
  [(Rgon *)self CommonCenterForIndex:3];
  return result;
}

- (float)YCenter
{
  [(Rgon *)self CommonCenterForIndex:4];
  return result;
}

- (float)MeanVertexDistFromX:(float)a3 Y:(float)a4
{
  uint64_t v4 = 0;
  float v5 = 0.0;
  do
  {
    float v5 = v5
       + sqrtf((float)((float)(a4 - self->rgonArray[v4][4]) * (float)(a4 - self->rgonArray[v4][4]))+ (float)((float)(a3 - self->rgonArray[v4][3]) * (float)(a3 - self->rgonArray[v4][3])));
    ++v4;
  }
  while (v4 != 32);
  return v5 * 0.03125;
}

- (float)Radius
{
  [(Rgon *)self XCenter];
  int v4 = v3;
  [(Rgon *)self YCenter];
  int v6 = v5;
  [(Rgon *)self CalculateVertices];
  LODWORD(v7) = v4;
  LODWORD(v8) = v6;

  [(Rgon *)self MeanVertexDistFromX:v7 Y:v8];
  return result;
}

- (float)Diameter
{
  uint64_t v2 = 0;
  float result = 0.0;
  do
  {
    float v4 = fabsf(self->rgonArray[v2][2] + self->rgonArray[v2 + 16][2]);
    if (v4 > result) {
      float result = v4;
    }
    ++v2;
  }
  while (v2 != 16);
  return result;
}

- (float)MinDiameter
{
  uint64_t v2 = 0;
  float result = 3.4028e38;
  do
  {
    float v4 = fabsf(self->rgonArray[v2][2] + self->rgonArray[v2 + 16][2]);
    if (v4 < result) {
      float result = v4;
    }
    ++v2;
  }
  while (v2 != 16);
  return result;
}

- (int)AspectIndex
{
  uint64_t v4 = 0;
  LODWORD(v5) = 0;
  int v6 = &self->rgonArray[8][2];
  LODWORD(v2) = 1.0;
  while (1)
  {
    float v7 = *(v6 - 56) + v6[56];
    if (v7 == 0.0) {
      break;
    }
    float v8 = *v6;
    v6 += 7;
    float v9 = fabsf((float)(v8 + self->rgonArray[((_BYTE)v4 + 24) & 0x1F][2]) / v7);
    if (v9 >= *(float *)&v2)
    {
      uint64_t v5 = v5;
    }
    else
    {
      *(float *)&double v2 = v9;
      uint64_t v5 = v4;
    }
    if (++v4 == 16)
    {
      [(Rgon *)self setAspectRatio:v2];
      [(Rgon *)self setMaxAxisIndex:v5];
      return v5;
    }
  }
  LODWORD(v5) = -1;
  return v5;
}

- (float)DiameterAtFacetCountMeasuredFromVertical:(int)a3
{
  int v3 = (a3 + 24) & 0x1F;
  if (a3 + 24 <= 0) {
    int v3 = -(-(a3 + 24) & 0x1F);
  }
  return fabsf(self->rgonArray[v3][2]+ self->rgonArray[(char)(v3 + 16 - ((v3 + 16 + (((char)(v3 + 16) >> 10) & 0x1F)) & 0xE0))][2]);
}

- (void)RoundToPercent:(float)a3
{
  [(Rgon *)self XCenter];
  float v6 = v5;
  [(Rgon *)self YCenter];
  float v8 = v7;
  *(float *)&double v9 = v6;
  *(float *)&double v10 = v8;
  [(Rgon *)self MeanVertexDistFromX:v9 Y:v10];
  float v12 = v11 * 0.91;
  for (uint64_t i = 24; i != 920; i += 28)
    *(float *)((char *)self + i - 8) = *(float *)((char *)self + i - 8)
                                     + (float)(a3
                                             * (float)((float)((float)(*(float *)((char *)self + i - 12)
                                                                     * (float)(v8
                                                                             - *(float *)((char *)&self->super.isa + i)))
                                                             + (float)((float)(v6 - *(float *)((char *)self + i - 4))
                                                                     * *(float *)((char *)self + i - 16)))
                                                     - v12));

  [(Rgon *)self CalculateVertices];
}

- (float)DistToPointX:(float)a3 Y:(float)a4
{
  uint64_t v4 = &self->rgonArray[0][3];
  uint64_t v5 = 1;
  float v6 = 3.4028e38;
  LOBYTE(v7) = 1;
  do
  {
    float v8 = *v4 - a3;
    float v9 = v4[1] - a4;
    double v10 = self->rgonArray[v5 & 0x1F];
    float v11 = sqrtf((float)(v4[3] * v4[3]) + (float)(v4[2] * v4[2]));
    float v12 = sqrtf((float)(v9 * v9) + (float)(v8 * v8));
    float v13 = sqrtf((float)((float)(v10[4] - a4) * (float)(v10[4] - a4)) + (float)((float)(v10[3] - a3)
                                                                             * (float)(v10[3] - a3)));
    if ((float)((float)((float)(v11 * v11) + (float)(v12 * v12)) - (float)(v13 * v13)) <= 0.0
      || (float)((float)((float)(v11 * v11) + (float)(v13 * v13)) - (float)(v12 * v12)) <= 0.0)
    {
      if (v12 < v6) {
        float v6 = v12;
      }
      int v14 = 1;
      if (v13 < v6) {
        float v6 = v13;
      }
    }
    else
    {
      int v14 = 0;
    }
    float v15 = (float)(v9 * *(v4 - 2)) + (float)(*(v4 - 3) * v8);
    if (v15 >= v6) {
      int v14 = 1;
    }
    if (v15 <= 0.0) {
      int v14 = 1;
    }
    if (!v14) {
      float v6 = v15;
    }
    int v7 = (v15 <= 0.0) & v7;
    ++v5;
    v4 += 7;
  }
  while (v5 != 33);
  float result = 0.0;
  if (!v7) {
    return v6;
  }
  return result;
}

- (float)DistanceFromRgon:(id)a3
{
  uint64_t v5 = (char *)[a3 rgonPtr];
  uint64_t v8 = 0;
  float v9 = 3.4028e38;
  do
  {
    LODWORD(v6) = *(_DWORD *)&v5[v8 + 12];
    LODWORD(v7) = *(_DWORD *)&v5[v8 + 16];
    [(Rgon *)self DistToPointX:v6 Y:v7];
    if (*(float *)&v6 < v9) {
      float v9 = *(float *)&v6;
    }
    v8 += 28;
  }
  while (v8 != 896);
  for (uint64_t i = 0; i != 32; ++i)
  {
    *(float *)&double v6 = self->rgonArray[i][3];
    *(float *)&double v7 = self->rgonArray[i][4];
    [a3 DistToPointX:v6 Y:v7];
    if (*(float *)&v6 < v9) {
      float v9 = *(float *)&v6;
    }
  }
  return v9;
}

- (float)DistanceBetweenCenters:(id)a3
{
  [(Rgon *)self XCenter];
  float v6 = v5;
  [(Rgon *)self YCenter];
  float v8 = v7;
  [a3 XCenter];
  float v10 = v9;
  [a3 YCenter];
  return sqrtf((float)((float)(v11 - v8) * (float)(v11 - v8)) + (float)((float)(v10 - v6) * (float)(v10 - v6)));
}

- (float)Area
{
  uint64_t v2 = 0;
  float v3 = 0.0;
  do
  {
    float v3 = v3
       + (float)((float)(self->rgonArray[v2][3] * self->rgonArray[v2][6])
               - (float)(self->rgonArray[v2][4] * self->rgonArray[v2][5]));
    ++v2;
  }
  while (v2 != 32);
  return fabsf(v3 * 0.5);
}

- (double)Density
{
  double count = self->count;
  [(Rgon *)self Area];
  return count / v3;
}

- (float)Perimeter
{
  uint64_t v2 = 0;
  float v3 = 0.0;
  do
  {
    float v3 = v3
       + sqrtf((float)(self->rgonArray[v2][6] * self->rgonArray[v2][6])+ (float)(self->rgonArray[v2][5] * self->rgonArray[v2][5]));
    ++v2;
  }
  while (v2 != 32);
  return fabsf(v3);
}

- (float)AspectRatio
{
  [(Rgon *)self Diameter];
  float v4 = v3;
  float result = 0.0;
  if (v4 > 0.0)
  {
    [(Rgon *)self MinDiameter];
    return v6 / v4;
  }
  return result;
}

- (void)IntersectionOfEdge:(int)a3 withEdge:(int)a4 resultPoint:(float)a5[2]
{
  if (a4 != a3)
  {
    rgonArray = self->rgonArray;
    float v9 = (double)(2 * (a4 - a3)) * 3.14159265 * 0.03125;
    float v10 = 1.0 / sinf(v9);
    float v11 = rgonArray[a4];
    float v12 = rgonArray[a3];
    *a5 = v10 * (float)((float)(v11[1] * v12[2]) - (float)(v12[1] * v11[2]));
    a5[1] = v10 * (float)((float)(*v12 * v11[2]) - (float)(*v11 * v12[2]));
  }
}

- (void)PrintVertices
{
  for (uint64_t i = 0; i != 32; ++i)
    printf(" {%f , %f },", self->rgonArray[i][3], self->rgonArray[i][4]);
  printf(" {%f , %f }", self->rgonArray[0][3], self->rgonArray[0][4]);

  putchar(10);
}

- (void)PrintVerticesWithZCoord:(double)a3
{
  printf(" Line[ { ");
  for (uint64_t i = 0; i != 32; ++i)
    printf(" {%f,%f,%f},", self->rgonArray[i][3], self->rgonArray[i][4], a3);
  printf(" {%f,%f,%f}", self->rgonArray[0][3], self->rgonArray[0][4], a3);
  printf(" }] ");

  putchar(10);
}

- (void)PrintConstraints
{
  printf("\n{");
  for (uint64_t i = 16; i != 884; i += 28)
    printf(" %f,", *(float *)((char *)&self->super.isa + i));
  printf(" %f } \n", self->rgonArray[31][2]);
}

- (void)ShrinkByAmount:(float)a3
{
  for (uint64_t i = 16; i != 912; i += 28)
    *(float *)((char *)&self->super.isa + i) = *(float *)((char *)&self->super.isa + i) + a3;
  id v5 = [(Rgon *)self createWithCollapsedOrphans2];
  float v6 = (char *)[v5 rgonPtr];
  uint64_t v7 = 0;
  float v8 = v6 + 16;
  do
  {
    float v9 = (_DWORD *)((char *)self + v7);
    v9[4] = *(_DWORD *)&v8[v7 - 8];
    v9[5] = *(_DWORD *)&v8[v7 - 4];
    v9[6] = *(_DWORD *)&v8[v7];
    v7 += 28;
  }
  while (v7 != 896);

  [(Rgon *)self CalculateEdges];
}

- (int)OutsideReturnFirstEdgeExcludingX:(float)a3 Y:(float)a4
{
  uint64_t v5 = 0;
  for (uint64_t i = &self->rgonArray[0][2];
        (float)((float)(*(i - 1) * a4) + (float)(*(i - 2) * a3)) >= (float)(*i + -0.00001);
        i += 7)
  {
    if (++v5 == 32)
    {
      LODWORD(v5) = -1;
      return v5;
    }
  }
  return v5;
}

- ($94F468A8D4C62B317260615823C2B210)intersectionEdge:(int)a3 withEdge:(int)a4
{
  float v4 = 0.0;
  float v5 = 0.0;
  if (a4 != a3)
  {
    rgonArray = self->rgonArray;
    float v9 = (double)(2 * (a4 - a3)) * 3.14159265 * 0.03125;
    float v10 = 1.0 / sinf(v9);
    float v11 = rgonArray[a4];
    float v12 = rgonArray[a3];
    float v13 = v12[2];
    float v14 = v11[2];
    float v5 = v10 * (float)((float)(v11[1] * v13) - (float)(v12[1] * v14));
    float v4 = v10 * (float)((float)(v14 * *v12) - (float)(*v11 * v13));
  }
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (id)createWithCollapsedOrphans2
{
  float v3 = objc_alloc_init(Rgon);
  uint64_t v4 = 0;
  do
  {
    int v5 = -22;
    do
    {
      if (v5 != -11)
      {
        int v6 = v4 + v5 + 11;
        unsigned int v7 = v6 & 0x1F;
        int v9 = -v6;
        BOOL v8 = v9 < 0;
        int v10 = v9 & 0x1F;
        if (v8) {
          uint64_t v11 = v7;
        }
        else {
          uint64_t v11 = -v10;
        }
        [(Rgon *)self IntersectionOfEdge:v11 withEdge:v4 resultPoint:&v20];
        int v12 = v20;
        int v13 = v21;
        LODWORD(v14) = v20;
        LODWORD(v15) = v21;
        if ([(Rgon *)self containsPointX:v14 Y:v15])
        {
          LODWORD(v16) = v12;
          LODWORD(v17) = v13;
          [(Rgon *)v3 AdjustForPointX:v16 Y:v17];
        }
      }
    }
    while (!__CFADD__(v5++, 1));
    uint64_t v4 = (v4 + 1);
  }
  while (v4 != 32);
  [(Rgon *)v3 CalculateVertices];
  return v3;
}

- (BOOL)CollapseOrphans
{
  rgonArray = self->rgonArray;
  uint64_t v33 = 0;
  int v5 = &self->rgonArray[0][4];
  uint64_t v6 = -32;
  while (1)
  {
    *(float *)&double v2 = *(v5 - 1);
    *(float *)&double v3 = *v5;
    if (-[Rgon containsPointX:Y:](self, "containsPointX:Y:", v2, v3, rgonArray)) {
      break;
    }
    v5 += 7;
    BOOL v7 = __CFADD__(v6++, 1);
    if (v7) {
      return 0;
    }
  }
  unsigned int v8 = 0;
  float v9 = *(v5 - 1);
  float v10 = *v5;
  float v31 = v9;
  float v32 = v10;
  int v11 = ((_BYTE)v6 + 33) & 0x1F;
  float v12 = 0.0;
  int v13 = 1;
  while (v11 <= 30)
  {
    int v14 = 0;
    double v15 = &v31 + 2 * v13;
    double v16 = &self->rgonArray[v11][3];
    while (1)
    {
      *(float *)&double v2 = *v16;
      *(float *)&double v3 = v16[1];
      uint64_t v17 = [(Rgon *)self OutsideReturnFirstEdgeExcludingX:v2 Y:v3];
      if ((v17 & 0x80000000) == 0) {
        break;
      }
      uint64_t v29 = *(void *)v16;
      *(void *)double v15 = *(void *)v16;
      *(float *)&double v2 = asinf((float)(*(v16 - 3) * v16[5]) - (float)(*(v16 - 2) * v16[4]));
      if (v13 >= 3 && (float)(vabds_f32(*(float *)&v29, v9) + vabds_f32(*((float *)&v29 + 1), v10)) < 0.00000001) {
        int v14 = 1;
      }
      ++v11;
      float v12 = v12 + *(float *)&v2;
      if (v12 > 6.2832 && v13 > 2) {
        int v14 = 1;
      }
      ++v13;
      v15 += 2;
      v16 += 7;
      if (v11 - 1 >= 30) {
        goto LABEL_21;
      }
    }
LABEL_22:
    [(Rgon *)self IntersectionOfEdge:v11 - 1 withEdge:v17 resultPoint:&v33];
    LODWORD(v20) = HIDWORD(v33);
    LODWORD(v19) = v33;
    uint64_t v21 = [(Rgon *)self OutsideReturnFirstEdgeExcludingX:v19 Y:v20];
    if ((int)v21 < 1)
    {
LABEL_26:
      if (v21 && v13 <= 31)
      {
        uint64_t v30 = v33;
        *((void *)&v31 + v13) = v33;
        *(float *)&double v2 = asinf((float)(rgonArray[v11 - 1][0] * rgonArray[(int)v17][1])- (float)(rgonArray[v11 - 1][1] * rgonArray[(int)v17][0]));
        if (v13 >= 3 && (float)(vabds_f32(*(float *)&v30, v9) + vabds_f32(*((float *)&v30 + 1), v10)) < 0.00000001) {
          int v14 = 1;
        }
        float v12 = v12 + *(float *)&v2;
        if (v12 > 6.2832 && v13 > 2) {
          int v14 = 1;
        }
        ++v13;
      }
    }
    else
    {
      int v22 = 32;
      while (1)
      {
        LODWORD(v17) = v21;
        [(Rgon *)self IntersectionOfEdge:v11 - 1 withEdge:v21 resultPoint:&v33];
        if (!--v22) {
          break;
        }
        LODWORD(v3) = HIDWORD(v33);
        LODWORD(v2) = v33;
        uint64_t v21 = [(Rgon *)self OutsideReturnFirstEdgeExcludingX:v2 Y:v3];
        if ((int)v21 < 1) {
          goto LABEL_26;
        }
      }
    }
    if ((int)v17 >= v11)
    {
      int v11 = v17 + 1;
      if ((int)v17 + 1 <= 31 && !v14)
      {
        BOOL v7 = v8++ >= 0x1F;
        if (!v7) {
          continue;
        }
      }
    }
    goto LABEL_44;
  }
  int v14 = 0;
  uint64_t v17 = 0xFFFFFFFFLL;
  int v11 = 31;
LABEL_21:
  if (v11 != 31) {
    goto LABEL_22;
  }
  double v2 = *(double *)&self->rgonArray[31][3];
  *((double *)&v31 + v13++) = v2;
LABEL_44:
  if (v13 < 3) {
    return 0;
  }
  for (uint64_t i = 20; i != 916; i += 28)
    *(_DWORD *)((char *)&self->super.isa + i) = 0;
  uint64_t v25 = v13;
  float v26 = &v32;
  do
  {
    *(float *)&double v2 = *(v26 - 1);
    *(float *)&double v3 = *v26;
    [(Rgon *)self AdjustForPointX:v2 Y:v3];
    v26 += 2;
    --v25;
  }
  while (v25);
  [(Rgon *)self CalculateVertices];
  return 1;
}

- (void)UnionWith:(id)a3
{
  uint64_t v4 = (char *)[a3 rgonPtr];
  for (uint64_t i = 0; i != 896; i += 28)
  {
    LODWORD(v5) = *(_DWORD *)&v4[i + 12];
    LODWORD(v6) = *(_DWORD *)&v4[i + 16];
    [(Rgon *)self AdjustForPointX:v5 Y:v6];
  }

  [(Rgon *)self CalculateVertices];
}

- (id)unionRgonOf:(id)a3 withRgon:(id)a4
{
  id v5 = [a4 copy];
  [v5 UnionWith:a3];

  return v5;
}

+ (id)newInterpolatedRgonFrom:(id)a3 withRgon:(id)a4 param:(float)a5
{
  id v8 = [a4 copy];
  float v9 = (char *)[a3 rgonPtr];
  float v10 = (char *)[a4 rgonPtr];
  int v11 = (char *)[v8 rgonPtr];
  uint64_t v12 = 0;
  float v13 = 1.0 - a5;
  int v14 = v10 + 16;
  double v15 = v9 + 16;
  do
  {
    double v16 = (float *)&v11[v12 + 8];
    *double v16 = (float)(*(float *)&v14[v12 - 8] * a5) + (float)(v13 * *(float *)&v15[v12 - 8]);
    v16[1] = (float)(*(float *)&v14[v12 - 4] * a5) + (float)(v13 * *(float *)&v15[v12 - 4]);
    v16[2] = (float)(*(float *)&v14[v12] * a5) + (float)(v13 * *(float *)&v15[v12]);
    v12 += 28;
  }
  while (v12 != 896);
  return v8;
}

- (BOOL)IntersectionRgonOf:(id)a3 withRgon:(id)a4
{
  double v6 = (char *)[a3 rgonPtr];
  BOOL v7 = (char *)[a4 rgonPtr];
  for (uint64_t i = 0; i != 32; ++i)
  {
    float v9 = *(float *)&v6[i * 28 + 8];
    self->rgonArray[i][2] = v9;
    float v10 = *(float *)&v7[i * 28 + 8];
    if (v10 > v9) {
      self->rgonArray[i][2] = v10;
    }
  }
  [(Rgon *)self CalculateVertices];

  return [(Rgon *)self CollapseOrphans];
}

- (float)DistanceCenterToRGon:(id)a3
{
  [(Rgon *)self XCenter];
  int v6 = v5;
  [(Rgon *)self YCenter];
  int v8 = v7;
  [a3 XCenter];
  int v10 = v9;
  [a3 YCenter];
  LODWORD(v12) = v11;
  LODWORD(v13) = v10;
  [(Rgon *)self DistToPointX:v13 Y:v12];
  float v15 = v14;
  LODWORD(v16) = v6;
  LODWORD(v17) = v8;
  [a3 DistToPointX:v16 Y:v17];
  if (v15 < result) {
    return v15;
  }
  return result;
}

- (float)rgonPtr
{
  return self->rgonPtr;
}

- (void)setRgonPtr:(float *)(a3
{
  self->rgonPtr = a3;
}

- (int)maxAxisIndex
{
  return self->maxAxisIndex;
}

- (void)setMaxAxisIndex:(int)a3
{
  self->maxAxisIndex = a3;
}

- (float)aspectRatio
{
  return self->aspectRatio;
}

- (void)setAspectRatio:(float)a3
{
  self->aspectRatio = a3;
}

- (float)ymax
{
  return self->ymax;
}

- (void)setYmax:(float)a3
{
  self->float ymax = a3;
}

- (float)ymin
{
  return self->ymin;
}

- (void)setYmin:(float)a3
{
  self->ymin = a3;
}

- (float)xmax
{
  return self->xmax;
}

- (void)setXmax:(float)a3
{
  self->xmax = a3;
}

- (float)xmin
{
  return self->xmin;
}

- (void)setXmin:(float)a3
{
  self->xmin = a3;
}

- (float)currentArea
{
  return self->currentArea;
}

- (void)setCurrentArea:(float)a3
{
  self->currentArea = a3;
}

- (double)count
{
  return self->count;
}

- (void)setCount:(double)a3
{
  self->double count = a3;
}

- (int64_t)pointCount
{
  return self->pointCount;
}

- (void)setPointCount:(int64_t)a3
{
  self->pointCount = a3;
}

- (float)pointerToRgonArray
{
  return self->_pointerToRgonArray;
}

- (void)setPointerToRgonArray:(float *)a3
{
  self->_pointerToRgonArray = a3;
}

- (NSArray)enclosedPoints
{
  return self->_enclosedPoints;
}

@end