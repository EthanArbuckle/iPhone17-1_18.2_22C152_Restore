@interface VCPHoughTransform
- (VCPHoughTransform)initWithEdgeMap:(float *)a3 mapWidth:(int)a4 mapHeight:(int)a5 angleStep:(float)a6;
- (int)DetectLinesWithThreshold:(int)a3 output:(id)a4;
- (void)Transform;
- (void)dealloc;
@end

@implementation VCPHoughTransform

- (VCPHoughTransform)initWithEdgeMap:(float *)a3 mapWidth:(int)a4 mapHeight:(int)a5 angleStep:(float)a6
{
  v21.receiver = self;
  v21.super_class = (Class)VCPHoughTransform;
  v10 = [(VCPHoughTransform *)&v21 init];
  v11 = v10;
  v12 = 0;
  if (a5 >= 1 && a4 >= 1 && a3 && v10)
  {
    v10->_verbose = 0;
    v10->_edgeMap = a3;
    v10->_mapWidth = a4;
    v10->_mapHeight = a5;
    if (a4 <= a5) {
      int v13 = a5;
    }
    else {
      int v13 = a4;
    }
    unsigned int v14 = llround((double)v13 * 1.41421356 * 0.5);
    v10->_accHalfHeight = v14;
    unsigned int v15 = llroundf(180.0 / a6);
    v14 *= 2;
    v10->_accWidth = v15;
    v10->_accHeight = v14;
    v10->_angleStep = a6;
    int v16 = v14 * v15;
    if (v16 < 0) {
      size_t v17 = -1;
    }
    else {
      size_t v17 = 4 * v16;
    }
    v18 = (int *)operator new[](v17, MEMORY[0x1E4FBA2D0]);
    v11->_accumulator = v18;
    if (v18)
    {
      [(VCPHoughTransform *)v11 Transform];
      v19 = v11;
    }
    else
    {
      v19 = 0;
    }
    v12 = v19;
  }

  return v12;
}

- (void)dealloc
{
  accumulator = self->_accumulator;
  if (accumulator) {
    MEMORY[0x1C186C790](accumulator, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPHoughTransform;
  [(VCPHoughTransform *)&v4 dealloc];
}

- (int)DetectLinesWithThreshold:(int)a3 output:(id)a4
{
  id v42 = a4;
  int accHeight = self->_accHeight;
  if (accHeight >= 1)
  {
    int v7 = 0;
    int accWidth = self->_accWidth;
    int v9 = -4;
    do
    {
      if (accWidth >= 1)
      {
        int v10 = 0;
        while (1)
        {
          accumulator = self->_accumulator;
          int v12 = accumulator[v10 + accWidth * v7];
          if (v12 >= a3)
          {
            int v13 = v9 * accWidth - 4;
            int v14 = -4;
            while (v14 + v7 < 0 || v14 + v7 >= self->_accHeight)
            {
LABEL_14:
              v13 += accWidth;
              BOOL v21 = v14++ < 3;
              if (!v21)
              {
                uint64_t v16 = accumulator[v10 + accWidth * v7];
                goto LABEL_16;
              }
            }
            int v15 = -5;
            while (1)
            {
              if (v10 + v15 + 1 >= 0 && v10 + v15 + 1 < accWidth)
              {
                uint64_t v16 = accumulator[v10 + 5 + v13 + v15];
                if ((int)v16 > v12) {
                  break;
                }
              }
              if (++v15 >= 3) {
                goto LABEL_14;
              }
            }
LABEL_16:
            if ((int)v16 <= v12)
            {
              float v17 = self->_angleStep * (float)v10;
              float v18 = (float)(v7 - self->_accHalfHeight);
              float v19 = v17 * 0.017453;
              double v20 = v18;
              BOOL v21 = v17 < 45.0 || v17 > 135.0;
              if (v21)
              {
                double mapHeight = (double)self->_mapHeight;
                __float2 v23 = __sincosf_stret(v19);
                double mapWidth = (double)self->_mapWidth;
                double v31 = (v20 + mapHeight * 0.5 * v23.__sinval) / v23.__cosval / mapWidth + 0.5;
                double v30 = (v20 + mapHeight * -0.5 * v23.__sinval) / v23.__cosval / mapWidth + 0.5;
                double v29 = 1.0;
                double v28 = 0.0;
              }
              else
              {
                double v25 = (double)self->_mapWidth;
                __float2 v26 = __sincosf_stret(v19);
                double v27 = (double)self->_mapHeight;
                double v28 = (v20 + v25 * 0.5 * v26.__cosval) / v26.__sinval / v27 + 0.5;
                double v29 = (v20 + v25 * -0.5 * v26.__cosval) / v26.__sinval / v27 + 0.5;
                double v30 = 1.0;
                double v31 = 0.0;
              }
              v32 = [MEMORY[0x1E4F1CA60] dictionary];
              if (!v32)
              {
                int v40 = -108;
                goto LABEL_30;
              }
              v43.x = v31;
              v43.y = v28;
              v33 = NSStringFromPoint(v43);
              [v32 setObject:v33 forKey:@"Point0"];

              v44.x = v30;
              v44.y = v29;
              v34 = NSStringFromPoint(v44);
              [v32 setObject:v34 forKey:@"Point1"];

              *(float *)&double v35 = v18;
              v36 = [NSNumber numberWithFloat:v35];
              [v32 setObject:v36 forKey:@"Radius"];

              *(float *)&double v37 = v17;
              v38 = [NSNumber numberWithFloat:v37];
              [v32 setObject:v38 forKey:@"Theta"];

              v39 = [NSNumber numberWithInt:v16];
              [v32 setObject:v39 forKey:@"Length"];

              [v42 addObject:v32];
              int accWidth = self->_accWidth;
            }
          }
          if (++v10 >= accWidth)
          {
            int accHeight = self->_accHeight;
            break;
          }
        }
      }
      ++v7;
      ++v9;
    }
    while (v7 < accHeight);
  }
  [v42 sortUsingComparator:&__block_literal_global_67];
  int v40 = 0;
LABEL_30:

  return v40;
}

uint64_t __53__VCPHoughTransform_DetectLinesWithThreshold_output___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 objectForKey:@"Length"];
  v6 = [v4 objectForKey:@"Length"];
  uint64_t v7 = [v5 integerValue];
  if (v7 < [v6 integerValue]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }

  return v8;
}

- (void)Transform
{
  edgeMap = self->_edgeMap;
  int mapHeight = self->_mapHeight;
  uint64_t mapWidth = self->_mapWidth;
  bzero(self->_accumulator, 4 * self->_accHeight * (uint64_t)self->_accWidth);
  if (mapHeight >= 1)
  {
    int v6 = 0;
    double v7 = 0.0;
    do
    {
      if ((int)mapWidth >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          if (edgeMap[v8] != 0.0)
          {
            int accWidth = self->_accWidth;
            if (accWidth >= 1)
            {
              uint64_t v10 = 0;
              float angleStep = self->_angleStep;
              accumulator = self->_accumulator;
              do
              {
                __double2 v13 = __sincos_stret((float)(angleStep * (float)(int)v10) * 0.0174532924);
                signed int accHeight = llround((v7 - (double)mapHeight * 0.5) * v13.__sinval+ ((double)(int)v8 - (double)(int)mapWidth * 0.5) * v13.__cosval+ (double)self->_accHalfHeight);
                if (self->_accHeight < accHeight) {
                  signed int accHeight = self->_accHeight;
                }
                ++accumulator[v10 + accHeight * accWidth];
                int accWidth = self->_accWidth;
                ++v10;
              }
              while ((int)v10 < accWidth);
            }
          }
          ++v8;
        }
        while (v8 != mapWidth);
      }
      edgeMap += mapWidth;
      double v7 = v7 + 1.0;
      ++v6;
    }
    while (v6 != mapHeight);
  }
}

@end