@interface AXPIPointSmoother
+ (CGPoint)_averagePointsInArray:(id)a3;
- (AXPIPointSmoother)init;
- (AXPIPointSmootherClientDelegate)delegate;
- (BOOL)shouldOffsetBufferPoints;
- (BOOL)useGaussianBlur;
- (BOOL)useMedianFilter;
- (BOOL)useWeightedMovingAverage;
- (CGPoint)medianFilterPointForPoint:(CGPoint)a3;
- (CGPoint)point;
- (CGSize)_deltaForPoint:(CGPoint)a3;
- (NSMutableArray)medianPointBuffer;
- (NSMutableArray)pointBuffer;
- (double)smoothingMaxDelta;
- (double)xOffset;
- (double)xOrder;
- (double)yOffset;
- (double)yOrder;
- (id)_gaussianBlurredArrayFromArray:(id)a3;
- (id)_gaussianBlurredPointBuffer;
- (unint64_t)bufferSize;
- (unint64_t)framesPerSecond;
- (unint64_t)lastTimePointAdded;
- (unint64_t)lowFPSDetectedCount;
- (void)addPoint:(CGPoint)a3;
- (void)removeAllPoints;
- (void)setBufferSize:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFramesPerSecond:(unint64_t)a3;
- (void)setLastTimePointAdded:(unint64_t)a3;
- (void)setLowFPSDetectedCount:(unint64_t)a3;
- (void)setMedianPointBuffer:(id)a3;
- (void)setPointBuffer:(id)a3;
- (void)setShouldOffsetBufferPoints:(BOOL)a3;
- (void)setSmoothingMaxDelta:(double)a3;
- (void)setUseGaussianBlur:(BOOL)a3;
- (void)setUseMedianFilter:(BOOL)a3;
- (void)setUseWeightedMovingAverage:(BOOL)a3;
- (void)setXOffset:(double)a3;
- (void)setXOrder:(double)a3;
- (void)setYOffset:(double)a3;
- (void)setYOrder:(double)a3;
- (void)updateFPS;
@end

@implementation AXPIPointSmoother

- (AXPIPointSmoother)init
{
  v9.receiver = self;
  v9.super_class = (Class)AXPIPointSmoother;
  v2 = [(AXPIPointSmoother *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_bufferSize = 1;
    *(_OWORD *)&v2->_smoothingMaxDelta = xmmword_239111020;
    v2->_shouldOffsetBufferPoints = 0;
    v2->_xOffset = 0.0;
    v2->_yOffset = 0.0;
    v2->_yOrder = 1.0;
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v2->_bufferSize];
    pointBuffer = v3->_pointBuffer;
    v3->_pointBuffer = (NSMutableArray *)v4;

    uint64_t v6 = objc_opt_new();
    medianPointBuffer = v3->_medianPointBuffer;
    v3->_medianPointBuffer = (NSMutableArray *)v6;
  }
  return v3;
}

- (CGPoint)medianFilterPointForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = [(AXPIPointSmoother *)self medianPointBuffer];
  uint64_t v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPoint:", x, y);
  [v5 addObject:v6];

  if ((unint64_t)[v5 count] >= 8)
  {
    do
      [v5 removeObjectAtIndex:0];
    while ((unint64_t)[v5 count] > 7);
  }
  if ((unint64_t)[v5 count] >= 7)
  {
    v7 = objc_msgSend(v5, "ax_mappedArrayUsingBlock:", &__block_literal_global_5);
    v8 = [v7 sortedArrayUsingSelector:sel_compare_];

    objc_super v9 = objc_msgSend(v5, "ax_mappedArrayUsingBlock:", &__block_literal_global_6);
    v10 = [v9 sortedArrayUsingSelector:sel_compare_];

    v11 = objc_msgSend(v8, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v8, "count") >> 1);
    v12 = objc_msgSend(v10, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v10, "count") >> 1);
    [v11 floatValue];
    double x = v13;
    [v12 floatValue];
    double y = v14;
  }
  double v15 = x;
  double v16 = y;
  result.double y = v16;
  result.double x = v15;
  return result;
}

uint64_t __47__AXPIPointSmoother_medianFilterPointForPoint___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  [a2 pointValue];
  return objc_msgSend(v2, "numberWithDouble:");
}

uint64_t __47__AXPIPointSmoother_medianFilterPointForPoint___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  [a2 pointValue];
  return [v2 numberWithDouble:v3];
}

- (void)addPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(AXPIPointSmoother *)self updateFPS];
  if ([(AXPIPointSmoother *)self useMedianFilter])
  {
    -[AXPIPointSmoother medianFilterPointForPoint:](self, "medianFilterPointForPoint:", x, y);
    double x = v6;
    double y = v7;
  }
  v8 = [(AXPIPointSmoother *)self pointBuffer];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    [(AXPIPointSmoother *)self smoothingMaxDelta];
    if (v10 > 0.0)
    {
      v11 = [(AXPIPointSmoother *)self pointBuffer];
      v12 = [(AXPIPointSmoother *)self pointBuffer];
      float v13 = objc_msgSend(v11, "subarrayWithRange:", 0, objc_msgSend(v12, "count"));

      [(id)objc_opt_class() _averagePointsInArray:v13];
      AX_CGPointGetDistanceToPoint();
      double v15 = v14;
      [(AXPIPointSmoother *)self smoothingMaxDelta];
      double v17 = v16;
      if ([(AXPIPointSmoother *)self bufferSize])
      {
        unint64_t v18 = 0;
        BOOL v19 = v15 >= v17;
        uint64_t v20 = -1;
        while (1)
        {
          v21 = [(AXPIPointSmoother *)self pointBuffer];
          unint64_t v22 = [v21 count];

          if (v18 >= v22 || !v19) {
            break;
          }
          ++v18;
          v23 = [(AXPIPointSmoother *)self pointBuffer];
          v24 = [(AXPIPointSmoother *)self pointBuffer];
          uint64_t v25 = objc_msgSend(v23, "subarrayWithRange:", v18, objc_msgSend(v24, "count") + v20);

          [(id)objc_opt_class() _averagePointsInArray:v25];
          AX_CGPointGetDistanceToPoint();
          double v27 = v26;
          [(AXPIPointSmoother *)self smoothingMaxDelta];
          BOOL v19 = v27 >= v28;
          --v20;
          float v13 = (void *)v25;
          if (v18 >= [(AXPIPointSmoother *)self bufferSize]) {
            goto LABEL_12;
          }
        }
        uint64_t v25 = (uint64_t)v13;
        if (!v18) {
          goto LABEL_13;
        }
LABEL_12:
        v29 = [(AXPIPointSmoother *)self pointBuffer];
        objc_msgSend(v29, "removeObjectsInRange:", 0, v18);

        float v13 = (void *)v25;
      }
LABEL_13:
    }
    while (1)
    {
      v31 = [(AXPIPointSmoother *)self pointBuffer];
      unint64_t v32 = [v31 count];
      unint64_t v33 = [(AXPIPointSmoother *)self bufferSize];

      if (v32 < v33) {
        break;
      }
      v30 = [(AXPIPointSmoother *)self pointBuffer];
      [v30 removeObjectAtIndex:0];
    }
  }
  if ([(AXPIPointSmoother *)self shouldOffsetBufferPoints])
  {
    -[AXPIPointSmoother _deltaForPoint:](self, "_deltaForPoint:", x, y);
    double x = x + v34;
    double y = y + v35;
  }
  id v37 = [(AXPIPointSmoother *)self pointBuffer];
  v36 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPoint:", x, y);
  [v37 addObject:v36];
}

- (id)_gaussianBlurredArrayFromArray:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 count];
  if (v4 >= [&unk_26EC8F190 count])
  {
    unint64_t v7 = [&unk_26EC8F190 count] + 1;
    unint64_t v8 = v7 >> 1;
    id v5 = (id)objc_opt_new();
    unint64_t v9 = (v7 >> 1) - 1;
    if (v7 >> 1 != 1)
    {
      uint64_t v10 = 0;
      do
      {
        v11 = [v3 objectAtIndexedSubscript:v10];
        [v5 addObject:v11];

        ++v10;
      }
      while (v9 != v10);
    }
    if (v9 < [v3 count] - v8)
    {
      unint64_t v12 = (v7 & 0xFFFFFFFFFFFFFFFELL) - 1;
      do
      {
        float v13 = objc_opt_new();
        unint64_t v14 = v9 - v8 + 1;
        unint64_t v15 = v12;
        if (v14 < v9 + v8)
        {
          do
          {
            double v16 = [v3 objectAtIndexedSubscript:v14];
            [v13 addObject:v16];

            ++v14;
            --v15;
          }
          while (v15);
        }
        if ([v13 count])
        {
          unint64_t v17 = 0;
          double v18 = 0.0;
          do
          {
            BOOL v19 = [&unk_26EC8F190 objectAtIndexedSubscript:v17];
            [v19 doubleValue];
            double v21 = v20;

            unint64_t v22 = [v13 objectAtIndexedSubscript:v17];
            [v22 doubleValue];
            double v24 = v23;

            double v18 = v18 + v21 * v24;
            ++v17;
          }
          while ([v13 count] > v17);
        }
        else
        {
          double v18 = 0.0;
        }
        uint64_t v25 = [NSNumber numberWithDouble:v18];
        [v5 addObject:v25];

        ++v9;
      }
      while (v9 < [v3 count] - v8);
    }
    for (unint64_t i = [v3 count] - v8; i < objc_msgSend(v3, "count"); ++i)
    {
      double v27 = [v3 objectAtIndexedSubscript:i];
      [v5 addObject:v27];
    }
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

- (id)_gaussianBlurredPointBuffer
{
  id v3 = [(AXPIPointSmoother *)self pointBuffer];
  uint64_t v4 = objc_msgSend(v3, "ax_mappedArrayUsingBlock:", &__block_literal_global_16);
  id v5 = objc_msgSend(v3, "ax_mappedArrayUsingBlock:", &__block_literal_global_18);
  double v18 = (void *)v4;
  double v6 = [(AXPIPointSmoother *)self _gaussianBlurredArrayFromArray:v4];
  unint64_t v7 = [(AXPIPointSmoother *)self _gaussianBlurredArrayFromArray:v5];
  unint64_t v8 = objc_opt_new();
  if ([v6 count])
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = [v6 objectAtIndexedSubscript:v9];
      v11 = [v7 objectAtIndexedSubscript:v9];
      unint64_t v12 = (void *)MEMORY[0x263F08D40];
      [v10 doubleValue];
      uint64_t v14 = v13;
      [v11 doubleValue];
      v19[0] = v14;
      v19[1] = v15;
      double v16 = [v12 valueWithBytes:v19 objCType:"{CGPoint=dd}"];
      [v8 addObject:v16];

      ++v9;
    }
    while ([v6 count] > v9);
  }

  return v8;
}

uint64_t __48__AXPIPointSmoother__gaussianBlurredPointBuffer__block_invoke(uint64_t a1, void *a2)
{
  [a2 CGPointValue];
  v2 = NSNumber;
  return objc_msgSend(v2, "numberWithDouble:");
}

uint64_t __48__AXPIPointSmoother__gaussianBlurredPointBuffer__block_invoke_2(uint64_t a1, void *a2)
{
  [a2 CGPointValue];
  id v3 = NSNumber;
  return [v3 numberWithDouble:v2];
}

- (CGPoint)point
{
  if ([(AXPIPointSmoother *)self useGaussianBlur]) {
    [(AXPIPointSmoother *)self _gaussianBlurredPointBuffer];
  }
  else {
  id v3 = [(AXPIPointSmoother *)self pointBuffer];
  }
  if ([(AXPIPointSmoother *)self useWeightedMovingAverage])
  {
    double v4 = *MEMORY[0x263F00148];
    double v5 = *(double *)(MEMORY[0x263F00148] + 8);
    uint64_t v6 = [v3 count];
    uint64_t v7 = [v3 count];
    if ([v3 count])
    {
      unint64_t v8 = 0;
      double v9 = (double)((unint64_t)(v6 + v6 * v7) >> 1);
      do
      {
        uint64_t v10 = [v3 objectAtIndexedSubscript:v8];
        [v10 CGPointValue];
        double v12 = v11;
        double v14 = v13;

        double v4 = v4 + v12 * (double)(int)++v8 / v9;
        double v5 = v5 + v14 * (double)(int)v8 / v9;
      }
      while ([v3 count] > v8);
    }
  }
  else
  {
    [(id)objc_opt_class() _averagePointsInArray:v3];
    double v4 = v15;
    double v5 = v16;
  }
  if (![(AXPIPointSmoother *)self shouldOffsetBufferPoints])
  {
    -[AXPIPointSmoother _deltaForPoint:](self, "_deltaForPoint:", v4, v5);
    double v4 = v4 + v17;
    double v5 = v5 + v18;
  }

  double v19 = v4;
  double v20 = v5;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (CGSize)_deltaForPoint:(CGPoint)a3
{
  CGFloat v4 = *MEMORY[0x263F001A8];
  CGFloat v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  unint64_t v8 = [(AXPIPointSmoother *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  CGFloat v10 = v7;
  CGFloat v11 = v6;
  CGFloat v12 = v5;
  CGFloat v13 = v4;
  if (v9)
  {
    double v14 = [(AXPIPointSmoother *)self delegate];
    [v14 rotatedScreenBounds];
    CGFloat v13 = v15;
    CGFloat v12 = v16;
    CGFloat v11 = v17;
    CGFloat v10 = v18;
  }
  v44.origin.double x = v13;
  v44.origin.double y = v12;
  v44.size.width = v11;
  v44.size.height = v10;
  v47.origin.double x = v4;
  v47.origin.double y = v5;
  v47.size.width = v6;
  v47.size.height = v7;
  if (CGRectEqualToRect(v44, v47))
  {
    double v19 = [MEMORY[0x263F82B60] mainScreen];
    [v19 bounds];
    CGFloat v13 = v20;
    CGFloat v12 = v21;
    CGFloat v11 = v22;
    CGFloat v10 = v23;
  }
  v45.origin.double x = v13;
  v45.origin.double y = v12;
  v45.size.width = v11;
  v45.size.height = v10;
  CGFloat MidX = CGRectGetMidX(v45);
  v46.origin.double x = v13;
  v46.origin.double y = v12;
  v46.size.width = v11;
  v46.size.height = v10;
  double v25 = fmax(MidX, 1.0);
  double v26 = fmax(CGRectGetMidY(v46), 1.0);
  *(float *)&CGFloat MidX = vabdd_f64(v25, a3.x) / v25;
  [(AXPIPointSmoother *)self xOrder];
  float v28 = v27;
  double v29 = powf(*(float *)&MidX, v28);
  [(AXPIPointSmoother *)self xOffset];
  double v31 = v30;
  double v32 = v30 * v29;
  [(AXPIPointSmoother *)self yOrder];
  float v35 = v34;
  float v33 = vabdd_f64(v26, a3.y) / v26;
  double v36 = powf(v33, v35);
  [(AXPIPointSmoother *)self yOffset];
  double v38 = v37 * v36;
  double v39 = -(v31 * v29);
  if (a3.x > v25) {
    double v39 = v32;
  }
  double v40 = -(v37 * v36);
  if (a3.y <= v26) {
    double v38 = v40;
  }
  double v41 = v39;
  result.height = v38;
  result.width = v41;
  return result;
}

- (void)removeAllPoints
{
  id v2 = [(AXPIPointSmoother *)self pointBuffer];
  [v2 removeAllObjects];
}

- (unint64_t)bufferSize
{
  if ([(AXPIPointSmoother *)self lowFPSDetectedCount] <= 0x31) {
    unint64_t bufferSize = self->_bufferSize;
  }
  else {
    unint64_t bufferSize = 1;
  }
  if (bufferSize <= 1) {
    return 1;
  }
  else {
    return bufferSize;
  }
}

- (void)updateFPS
{
  uint64_t v3 = mach_absolute_time();
  [(AXPIPointSmoother *)self lastTimePointAdded];
  [(AXPIPointSmoother *)self setFramesPerSecond:(unint64_t)(1.0 / ((double)(unint64_t)AXMachTimeToNanoseconds() / 1000000000.0))];
  [(AXPIPointSmoother *)self setLastTimePointAdded:v3];
  if ([(AXPIPointSmoother *)self framesPerSecond] > 0xA)
  {
    uint64_t v5 = 0;
  }
  else
  {
    unint64_t v4 = [(AXPIPointSmoother *)self lowFPSDetectedCount];
    if (v4 + 1 < 0x32) {
      uint64_t v5 = v4 + 1;
    }
    else {
      uint64_t v5 = 50;
    }
  }
  [(AXPIPointSmoother *)self setLowFPSDetectedCount:v5];
}

+ (CGPoint)_averagePointsInArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    double v7 = 0.0;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) CGPointValue];
        double v8 = v8 + v10;
        double v7 = v7 + v11;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
  }
  unint64_t v12 = [v3 count];

  double v13 = v8 / (double)v12;
  double v14 = v7 / (double)v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_unint64_t bufferSize = a3;
}

- (AXPIPointSmootherClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXPIPointSmootherClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useWeightedMovingAverage
{
  return self->_useWeightedMovingAverage;
}

- (void)setUseWeightedMovingAverage:(BOOL)a3
{
  self->_useWeightedMovingAverage = a3;
}

- (BOOL)useMedianFilter
{
  return self->_useMedianFilter;
}

- (void)setUseMedianFilter:(BOOL)a3
{
  self->_useMedianFilter = a3;
}

- (BOOL)useGaussianBlur
{
  return self->_useGaussianBlur;
}

- (void)setUseGaussianBlur:(BOOL)a3
{
  self->_useGaussianBlur = a3;
}

- (double)smoothingMaxDelta
{
  return self->_smoothingMaxDelta;
}

- (void)setSmoothingMaxDelta:(double)a3
{
  self->_smoothingMaxDelta = a3;
}

- (BOOL)shouldOffsetBufferPoints
{
  return self->_shouldOffsetBufferPoints;
}

- (void)setShouldOffsetBufferPoints:(BOOL)a3
{
  self->_shouldOffsetBufferPoints = a3;
}

- (double)xOrder
{
  return self->_xOrder;
}

- (void)setXOrder:(double)a3
{
  self->_xOrder = a3;
}

- (double)yOrder
{
  return self->_yOrder;
}

- (void)setYOrder:(double)a3
{
  self->_yOrder = a3;
}

- (double)xOffset
{
  return self->_xOffset;
}

- (void)setXOffset:(double)a3
{
  self->_xOffset = a3;
}

- (double)yOffset
{
  return self->_yOffset;
}

- (void)setYOffset:(double)a3
{
  self->_yOffset = a3;
}

- (NSMutableArray)pointBuffer
{
  return self->_pointBuffer;
}

- (void)setPointBuffer:(id)a3
{
}

- (NSMutableArray)medianPointBuffer
{
  return self->_medianPointBuffer;
}

- (void)setMedianPointBuffer:(id)a3
{
}

- (unint64_t)framesPerSecond
{
  return self->_framesPerSecond;
}

- (void)setFramesPerSecond:(unint64_t)a3
{
  self->_framesPerSecond = a3;
}

- (unint64_t)lastTimePointAdded
{
  return self->_lastTimePointAdded;
}

- (void)setLastTimePointAdded:(unint64_t)a3
{
  self->_lastTimePointAdded = a3;
}

- (unint64_t)lowFPSDetectedCount
{
  return self->_lowFPSDetectedCount;
}

- (void)setLowFPSDetectedCount:(unint64_t)a3
{
  self->_lowFPSDetectedCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medianPointBuffer, 0);
  objc_storeStrong((id *)&self->_pointBuffer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end