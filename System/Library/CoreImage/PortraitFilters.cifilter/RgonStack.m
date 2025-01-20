@interface RgonStack
- (RgonStack)init;
- (RgonStack)initWithCoder:(id)a3;
- (double)binSize;
- (double)zMax;
- (double)zMin;
- (float)DistToPointX:(float)a3 Y:(float)a4 Z:(float)a5;
- (int)containsPointPlanarConditionalX2:(float)a3 Y:(float)a4 Z:(float)a5 epsilonDark:(float)a6 epsilonLight:(float)a7 epsilonMid:(float)a8 shouldPrint:(BOOL)a9;
- (int)containsPointPlanarConditionalX:(float)a3 Y:(float)a4 Z:(float)a5 epsilonDark:(float)a6 epsilonLight:(float)a7;
- (int)containsPointPlanarX:(float)a3 Y:(float)a4 Z:(float)a5;
- (int)containsPointX:(float)a3 Y:(float)a4 Z:(float)a5;
- (int)zDarkThr;
- (int)zMaxindex;
- (int)zMinindex;
- (void)AdjustForPointX:(double)a3 Y:(double)a4 Z:(double)a5;
- (void)CalculateEdges;
- (void)CalculateVertices;
- (void)PrintConstraints;
- (void)PrintFacets;
- (void)PrintVertices;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)normalVectorForRgon1:(id)a3 withZ1:(float)a4 rgon2:(id)a5 withZ2:(float)a6 atIndex:(int)a7 placedInto:(float *)a8;
- (void)setBinSize:(double)a3;
- (void)setZDarkThr:(int)a3;
- (void)setZMax:(double)a3;
- (void)setZMaxindex:(int)a3;
- (void)setZMin:(double)a3;
- (void)setZMinindex:(int)a3;
- (void)test0;
@end

@implementation RgonStack

- (RgonStack)init
{
  v6.receiver = self;
  v6.super_class = (Class)RgonStack;
  v2 = [(RgonStack *)&v6 init];
  v2->binCount = 0;
  int v3 = 256;
  v2->stack = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:256];
  do
  {
    v4 = objc_alloc_init(Rgon);
    [(NSMutableArray *)v2->stack addObject:v4];

    --v3;
  }
  while (v3);
  v2->zMax = -100000.0;
  *(_OWORD *)&v2->binSize = xmmword_56370;
  v2->zDarkThr = 0;
  return v2;
}

- (RgonStack)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RgonStack;
  v4 = [(RgonStack *)&v10 init];
  if (v4)
  {
    v4->stack = (NSMutableArray *)[a3 decodeObjectForKey:@"RGON_STACK"];
    v4->binCount = [a3 decodeIntegerForKey:@"BIN_COUNT"];
    v4->binOffset = [a3 decodeIntegerForKey:@"BIN_OFFSET"];
    [a3 decodeDoubleForKey:@"BIN_SIZE"];
    v4->binSize = v5;
    [a3 decodeDoubleForKey:@"LOW_Z"];
    v4->zMin = v6;
    [a3 decodeDoubleForKey:@"HIGH_Z"];
    v4->zMax = v7;
    [a3 decodeDoubleForKey:@"DARKTHR_Z"];
    v4->zDarkThr = (int)v8;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->stack forKey:@"RGON_STACK"];
  [a3 encodeInteger:self->binCount forKey:@"BIN_COUNT"];
  [a3 encodeInteger:self->binOffset forKey:@"BIN_OFFSET"];
  [a3 encodeDouble:@"BIN_SIZE" forKey:self->binSize];
  [a3 encodeDouble:@"LOW_Z" forKey:self->zMin];
  [a3 encodeDouble:@"HIGH_Z" forKey:self->zMax];
  double zDarkThr = (double)self->zDarkThr;

  [a3 encodeDouble:@"DARKTHR_Z" forKey:zDarkThr];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RgonStack;
  [(RgonStack *)&v3 dealloc];
}

- (void)AdjustForPointX:(double)a3 Y:(double)a4 Z:(double)a5
{
  if (self->zMin > a5) {
    self->zMin = a5;
  }
  if (self->zMax < a5) {
    self->zMax = a5;
  }
  id v8 = [(NSMutableArray *)self->stack objectAtIndex:(int)(a5 / self->binSize + 0.5)];
  [v8 count];
  if (!(uint64_t)v9) {
    ++self->binCount;
  }

  *(float *)&double v9 = a3;
  *(float *)&double v10 = a4;
  [v8 AdjustForPointX:v9 Y:v10];
}

- (int)containsPointX:(float)a3 Y:(float)a4 Z:(float)a5
{
  double v8 = a5 / self->binSize;
  signed int v9 = vcvtpd_s64_f64(v8);
  unint64_t v10 = (unint64_t)[(NSMutableArray *)self->stack objectAtIndex:(int)vcvtmd_s64_f64(v8)];
  unint64_t v11 = (unint64_t)[(NSMutableArray *)self->stack objectAtIndex:v9];
  unsigned int v14 = v10 | v11;
  if (v10 | v11)
  {
    v15 = (void *)v11;
    if (v10)
    {
      *(float *)&double v12 = a3;
      *(float *)&double v13 = a4;
      LODWORD(v10) = [(id)v10 containsPointX:v12 Y:v13] != 0;
    }
    if (v15)
    {
      *(float *)&double v12 = a3;
      *(float *)&double v13 = a4;
      unsigned int v14 = [v15 containsPointX:v12 Y:v13] != 0;
    }
    else
    {
      unsigned int v14 = 0;
    }
  }
  else
  {
    LODWORD(v10) = 0;
  }
  return v10 | v14;
}

- (float)DistToPointX:(float)a3 Y:(float)a4 Z:(float)a5
{
  id v7 = [(NSMutableArray *)self->stack objectAtIndex:(int)(a5 / self->binSize)];
  if (!v7) {
    return 1000.0;
  }
  *(float *)&double v8 = a3;
  *(float *)&double v9 = a4;

  [v7 DistToPointX:v8 Y:v9];
  return result;
}

- (void)CalculateVertices
{
  for (uint64_t i = 0; i != 256; ++i)
  {
    id v4 = [(NSMutableArray *)self->stack objectAtIndex:i];
    [v4 count];
    if (v5 > 3.0) {
      [v4 CalculateVertices];
    }
  }
}

- (void)CalculateEdges
{
  for (uint64_t i = 0; i != 256; ++i)
  {
    id v4 = [(NSMutableArray *)self->stack objectAtIndex:i];
    [v4 count];
    if (v5 > 3.0) {
      [v4 CalculateEdges];
    }
  }
}

- (void)PrintVertices
{
  puts(" \n rgon stack print vertices");
  for (uint64_t i = 0; i != 256; ++i)
  {
    id v4 = [(NSMutableArray *)self->stack objectAtIndex:i];
    [v4 count];
    if (v5 > 3.0)
    {
      float v6 = self->binSize * (double)(int)i;
      [v4 PrintVerticesWithZCoord:v6];
      printf("\n,");
    }
  }

  puts(" \n end rgon stack print vertices");
}

- (void)PrintConstraints
{
  puts(" \n rgon stack print constraints");
  for (uint64_t i = 0; i != 256; ++i)
  {
    id v4 = [(NSMutableArray *)self->stack objectAtIndex:i];
    [v4 count];
    if (v5 > 3.0) {
      [v4 PrintConstraints];
    }
  }

  puts(" \n end rgon stack print constraints");
}

- (void)PrintFacets
{
  id v26 = +[NSMutableArray array];
  id v25 = +[NSMutableArray array];
  uint64_t v3 = 0;
  int v4 = 0;
  do
  {
    id v5 = [(NSMutableArray *)self->stack objectAtIndex:v3];
    [v5 count];
    if (v6 > 3.0)
    {
      [v26 addObject:v5];
      objc_msgSend(v25, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
      ++v4;
    }
    ++v3;
  }
  while (v3 != 256);
  printf(" rgon stack print facets of stack with  %d rgons\n", v4);
  if (v4 >= 2)
  {
    uint64_t v22 = v4;
    v23 = self;
    uint64_t v7 = 1;
    do
    {
      id v8 = [v26 objectAtIndex:v7 - 1];
      id v9 = [v26 objectAtIndex:v7];
      objc_msgSend(objc_msgSend(v25, "objectAtIndex:", v7 - 1), "floatValue");
      float v11 = self->binSize * v10;
      uint64_t v24 = v7;
      objc_msgSend(objc_msgSend(v25, "objectAtIndex:", v7), "floatValue");
      float v13 = self->binSize * v12;
      unsigned int v14 = (char *)[v8 rgonPtr];
      v15 = (char *)[v9 rgonPtr];
      double v16 = v11;
      double v17 = v13;
      v18 = (float *)(v14 + 16);
      v19 = (float *)(v15 + 16);
      for (uint64_t i = 1; i != 33; ++i)
      {
        printf(" Line[ { ");
        printf(" {%5.2f,%5.2f,%5.2f},", *(v18 - 1), *v18, v16);
        uint64_t v21 = 28 * (i & 0x1F);
        printf(" {%5.2f,%5.2f,%5.2f},", *(float *)&v14[v21 + 12], *(float *)&v14[v21 + 16], v16);
        printf(" {%5.2f,%5.2f,%5.2f},", *(float *)&v15[v21 + 12], *(float *)&v15[v21 + 16], v17);
        printf(" {%5.2f,%5.2f,%5.2f},", *(v19 - 1), *v19, v17);
        printf(" {%5.2f,%5.2f,%5.2f} ", *(v18 - 1), *v18, v16);
        puts(" }] ,");
        v18 += 7;
        v19 += 7;
      }
      self = v23;
      uint64_t v7 = v24 + 1;
    }
    while (v24 + 1 != v22);
  }

  puts("\n end rgon stack print");
}

- (void)test0
{
}

- (int)containsPointPlanarX:(float)a3 Y:(float)a4 Z:(float)a5
{
  double v9 = a5 / self->binSize;
  int v10 = vcvtmd_s64_f64(v9);
  signed int v11 = vcvtpd_s64_f64(v9);
  id v12 = [(NSMutableArray *)self->stack objectAtIndex:v10];
  id v13 = [(NSMutableArray *)self->stack objectAtIndex:v11];
  if (v12) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14) {
    return 0;
  }
  double v16 = v13;
  double v17 = (char *)[v12 rgonPtr];
  v18 = (char *)[v16 rgonPtr];
  unint64_t v19 = 0;
  v20 = (float *)(v17 + 16);
  uint64_t v21 = (float *)(v18 + 16);
  do
  {
    unint64_t v22 = v19;
    if (v19 == 32) {
      break;
    }
    ++v19;
    float v23 = *(v20 - 1);
    uint64_t v24 = (float *)&v17[28 * ((v22 + 1) & 0x1F)];
    float v25 = v23 - v24[3];
    float v26 = *v20 - v24[4];
    float v27 = v23 - *(v21 - 1);
    float v28 = *v20 - *v21;
    double binSize = self->binSize;
    float v30 = binSize * (double)(v10 - v11);
    float v31 = (float)(v28 * -0.0) + (float)(v26 * v30);
    float v32 = (float)(v27 * 0.0) - (float)(v25 * v30);
    float v33 = (float)(v25 * v28) - (float)(v26 * v27);
    float v34 = (float)((float)(*v20 * v32) + (float)(v31 * v23)) + (float)(v33 * (float)v10) * binSize;
    v20 += 7;
    v21 += 7;
  }
  while ((float)((float)((float)((float)(v32 * a4) + (float)(v31 * a3)) + (float)(v33 * a5)) - v34) <= 20.0);
  return v22 > 0x1F;
}

- (int)containsPointPlanarConditionalX:(float)a3 Y:(float)a4 Z:(float)a5 epsilonDark:(float)a6 epsilonLight:(float)a7
{
  double zMin = self->zMin;
  double zMax = self->zMax;
  if (zMax == zMin) {
    return 0;
  }
  double v15 = a5;
  double v16 = a5 / self->binSize;
  int v17 = vcvtmd_s64_f64(v16);
  signed int v18 = vcvtpd_s64_f64(v16);
  unint64_t v19 = (unint64_t)[(NSMutableArray *)self->stack objectAtIndex:v17];
  unint64_t v20 = (unint64_t)[(NSMutableArray *)self->stack objectAtIndex:v18];
  if (!(v19 | v20)) {
    return 0;
  }
  uint64_t v21 = (void *)v20;
  [(id)v20 count];
  if (v22 < 30.0)
  {
    [(id)v19 count];
    if (v23 < 10.0) {
      return 0;
    }
  }
  [(id)v19 count];
  if (v24 < 30.0)
  {
    [v21 count];
    if (v25 < 10.0) {
      return 0;
    }
  }
  float v27 = (v15 - zMin) / (zMax - zMin);
  float v28 = (float)((float)(1.0 - v27) * a6) + (float)(v27 * a7);
  v29 = (char *)[(id)v19 rgonPtr];
  float v30 = (char *)[v21 rgonPtr];
  unint64_t v31 = 0;
  float v32 = (float *)(v30 + 16);
  float v33 = (float *)(v29 + 16);
  do
  {
    unint64_t v34 = v31;
    if (v31 == 32) {
      break;
    }
    ++v31;
    float v35 = *(v33 - 1);
    v36 = (float *)&v29[28 * ((v34 + 1) & 0x1F)];
    float v37 = -(float)(*(v33 - 3) - (float)((float)(v35 - v36[3]) * 0.0));
    float v38 = *(v33 - 4) + (float)((float)(*v33 - v36[4]) * 0.0);
    float v39 = v35 - *(v32 - 1);
    float v40 = *v33 - *v32;
    double binSize = self->binSize;
    float v42 = binSize * (double)(v17 - v18);
    float v43 = (float)(v40 * -0.0) + (float)(v38 * v42);
    float v44 = (float)(v39 * 0.0) - (float)(v37 * v42);
    float v45 = (float)(v37 * v40) - (float)(v38 * v39);
    float v46 = (float)((float)(*v33 * v44) + (float)(v43 * v35)) + (float)(v45 * (float)v17) * binSize;
    v32 += 7;
    v33 += 7;
  }
  while ((float)((float)((float)((float)(v44 * a4) + (float)(v43 * a3)) + (float)(v45 * a5)) - v46) <= v28);
  return v34 > 0x1F;
}

- (int)containsPointPlanarConditionalX2:(float)a3 Y:(float)a4 Z:(float)a5 epsilonDark:(float)a6 epsilonLight:(float)a7 epsilonMid:(float)a8 shouldPrint:(BOOL)a9
{
  double zMin = self->zMin;
  double zMax = self->zMax;
  if (zMax == zMin) {
    return 0;
  }
  double v16 = a5;
  double v17 = a5 / self->binSize;
  int v18 = vcvtmd_s64_f64(v17);
  signed int v19 = vcvtpd_s64_f64(v17);
  unint64_t v20 = (unint64_t)[(NSMutableArray *)self->stack objectAtIndex:v18];
  unint64_t v21 = (unint64_t)[(NSMutableArray *)self->stack objectAtIndex:v19];
  if (!(v20 | v21)) {
    return 0;
  }
  double v23 = (void *)v21;
  double v24 = zMax - zMin;
  double v25 = (v16 - zMin) / (zMax - zMin);
  *(float *)&double v25 = v25;
  float v26 = (float)((float)(1.0 - *(float *)&v25) * a6) + (float)(*(float *)&v25 * a7);
  int v46 = -1;
  v47[0] = -1;
  *(float *)&double v25 = a3;
  *(float *)&double v24 = a4;
  *(float *)&double v22 = v26;
  unsigned int v27 = [(id)v20 containsPointX:v47 Y:v25 withTolerance:v24 returnIndex:v22];
  *(float *)&double v28 = a3;
  *(float *)&double v29 = a4;
  *(float *)&double v30 = v26;
  unsigned int v31 = [v23 containsPointX:&v46 Y:v28 withTolerance:v29 returnIndex:v30];
  if (v27) {
    BOOL v32 = v31 == 0;
  }
  else {
    BOOL v32 = 1;
  }
  if (v32)
  {
    if (v27 | v31)
    {
      float v33 = (v16 - (double)v18 * self->binSize) / self->binSize;
      float v45 = v33;
      unint64_t v34 = (char *)[(id)v20 rgonPtr];
      float v35 = (char *)[v23 rgonPtr];
      unint64_t v36 = 0;
      *(float *)v37.i32 = 1.0 - v45;
      float32x2_t v38 = (float32x2_t)vdup_lane_s32(v37, 0);
      do
      {
        float v39 = (float32x2_t *)&v47[v36 / 4 + 1];
        v39[1] = vmla_f32(vmul_n_f32(*(float32x2_t *)&v35[v36 + 8], v45), *(float32x2_t *)&v34[v36 + 8], v38);
        v39[2].f32[0] = (float)(*(float *)&v35[v36 + 16] * v45) + (float)(*(float *)v37.i32 * *(float *)&v34[v36 + 16]);
        v36 += 28;
      }
      while (v36 != 896);
      uint64_t v40 = 0;
      int v41 = 0;
      do
      {
        if (*(float *)&v47[v40 + 4] != 0.0 || *(float *)&v47[v40 + 6] != 0.0) {
          ++v41;
        }
        v40 += 7;
      }
      while (v40 != 28);
      if (v41 >= 3)
      {
        uint64_t v43 = 0;
        while (1)
        {
          float v44 = (float *)&v47[7 * dword_56398[v43] + 1];
          if ((float)((float)(v44[1] * a4) + (float)(*v44 * a3)) < (float)(v44[2] - v26)) {
            break;
          }
          if (++v43 == 32) {
            return 1;
          }
        }
      }
    }
    return 0;
  }
  return 1;
}

- (void)normalVectorForRgon1:(id)a3 withZ1:(float)a4 rgon2:(id)a5 withZ2:(float)a6 atIndex:(int)a7 placedInto:(float *)a8
{
  id v13 = (char *)[a3 rgonPtr];
  BOOL v14 = (char *)[a5 rgonPtr];
  uint64_t v15 = 0;
  uint64_t v16 = 28 * a7;
  double v17 = (float *)&v13[v16 + 44];
  int v18 = (float *)&v13[v16 + 12];
  signed int v19 = (float *)&v14[v16];
  float v21 = v19[3];
  unint64_t v20 = v19 + 3;
  float v22 = *v18 - v21;
  float v23 = *(v17 - 7);
  double v24 = v20 + 1;
  float v25 = v23 - v20[1];
  float v26 = *(v17 - 1) - *v18;
  float v27 = *v17 - v23;
  float v30 = (float)(v25 * 0.0) - (float)((float)(a4 - a6) * v27);
  float v31 = (float)(v22 * -0.0) + (float)((float)(a4 - a6) * v26);
  float v32 = (float)(v22 * v27) - (float)(v25 * v26);
  float v28 = sqrtf((float)((float)(v31 * v31) + (float)(v30 * v30)) + (float)(v32 * v32));
  if (v28 < 0.00001) {
    float v28 = 1.0;
  }
  do
  {
    a8[v15] = (float)(*(float *)((char *)&v30 + v15 * 4) * 3.0) / v28;
    ++v15;
  }
  while (v15 != 3);
  double v29 = (float *)&v14[28 * a7 + 28];
  a8[3] = (float)((float)((float)(*v18 + *v20) + *(v17 - 1)) + v29[3]) * 0.25;
  a8[4] = (float)((float)((float)(*(v17 - 7) + *v24) + *v17) + v29[4]) * 0.25;
  a8[5] = (float)(a4 + a6) * 0.5;
  printf("Hue[.4],Line[{{%5.2f,%5.2f,%5.2f}, {%5.2f,%5.2f,%5.2f} }],\n", *v20, *v24, a6, v29[3], v29[4], a6);
}

- (double)zMin
{
  return self->zMin;
}

- (void)setZMin:(double)a3
{
  self->double zMin = a3;
}

- (double)zMax
{
  return self->zMax;
}

- (void)setZMax:(double)a3
{
  self->double zMax = a3;
}

- (int)zMinindex
{
  return self->zMinindex;
}

- (void)setZMinindex:(int)a3
{
  self->zMinindex = a3;
}

- (int)zMaxindex
{
  return self->zMaxindex;
}

- (void)setZMaxindex:(int)a3
{
  self->zMaxindex = a3;
}

- (double)binSize
{
  return self->binSize;
}

- (void)setBinSize:(double)a3
{
  self->double binSize = a3;
}

- (int)zDarkThr
{
  return self->zDarkThr;
}

- (void)setZDarkThr:(int)a3
{
  self->double zDarkThr = a3;
}

@end