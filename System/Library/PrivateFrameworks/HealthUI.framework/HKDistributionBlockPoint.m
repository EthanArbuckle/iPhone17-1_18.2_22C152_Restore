@interface HKDistributionBlockPoint
- (CGPoint)maxPoint;
- (CGPoint)minPoint;
- (HKDistributionBlockPoint)initWithChartPoint:(id)a3 xAxisTransform:(id)a4 yAxisTransform:(id)a5 gapZeroCount:(int64_t)a6;
- (HKDistributionBlockPoint)initWithTransform:(CGAffineTransform *)a3 blockPoint:(id)a4;
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (NSArray)distributionSegments;
- (NSString)description;
- (double)endXValue;
- (double)startXValue;
- (id)_applyTransformToSegments:(id)a3 transform:(CGAffineTransform *)a4;
- (id)_quickDate:(id)a3;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
@end

@implementation HKDistributionBlockPoint

- (HKDistributionBlockPoint)initWithChartPoint:(id)a3 xAxisTransform:(id)a4 yAxisTransform:(id)a5 gapZeroCount:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)HKDistributionBlockPoint;
  v13 = [(HKDistributionBlockPoint *)&v28 init];
  if (v13)
  {
    v14 = [v10 xValueAsGenericType];
    [v11 coordinateForValue:v14];
    double v16 = v15;
    v17 = [v10 minYValue];
    [v12 coordinateForValue:v17];
    double v19 = v18;

    v20 = [v10 maxYValue];
    [v12 coordinateForValue:v20];
    double v22 = v21;

    v13->_minPoint.x = v16;
    v13->_minPoint.y = v19;
    v13->_maxPoint.x = v16;
    v13->_maxPoint.y = v22;
    uint64_t v23 = +[HKQuantityDistributionSeries transformedSegmentsFromChartPoint:v10 forX:a6 minY:v16 maxY:v19 zeroCountForGap:v22];
    distributionSegments = v13->_distributionSegments;
    v13->_distributionSegments = (NSArray *)v23;

    uint64_t v25 = [v10 userInfo];
    userInfo = v13->_userInfo;
    v13->_userInfo = (HKGraphSeriesBlockCoordinateInfo *)v25;
  }
  return v13;
}

- (HKDistributionBlockPoint)initWithTransform:(CGAffineTransform *)a3 blockPoint:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HKDistributionBlockPoint;
  v7 = [(HKDistributionBlockPoint *)&v20 init];
  if (v7)
  {
    [v6 minPoint];
    *(float64x2_t *)(v7 + 24) = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v8), *(float64x2_t *)&a3->a, v9));
    [v6 maxPoint];
    *(float64x2_t *)(v7 + 40) = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v10), *(float64x2_t *)&a3->a, v11));
    id v12 = [v6 distributionSegments];
    long long v13 = *(_OWORD *)&a3->c;
    v19[0] = *(_OWORD *)&a3->a;
    v19[1] = v13;
    v19[2] = *(_OWORD *)&a3->tx;
    uint64_t v14 = [v7 _applyTransformToSegments:v12 transform:v19];
    double v15 = (void *)*((void *)v7 + 1);
    *((void *)v7 + 1) = v14;

    uint64_t v16 = [v6 userInfo];
    v17 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v16;
  }
  return (HKDistributionBlockPoint *)v7;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  id v6 = [HKDistributionBlockPoint alloc];
  long long v7 = *(_OWORD *)&a3->c;
  v9[0] = *(_OWORD *)&a3->a;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a3->tx;
  return [(HKDistributionBlockPoint *)v6 initWithTransform:v9 blockPoint:self];
}

- (double)startXValue
{
  return self->_minPoint.x;
}

- (double)endXValue
{
  return self->_minPoint.x;
}

- (id)_quickDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"MM/dd/YYYY-HH:mm:ss"];
  id v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v5 setTimeZone:v6];

  long long v7 = [v5 stringFromDate:v4];

  return v7;
}

- (NSString)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_minPoint.x];
  v3 = -[HKDistributionBlockPoint _quickDate:](self, "_quickDate:");
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_distributionSegments;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) CGPointValue];
        double v11 = objc_msgSend(NSString, "stringWithFormat:", @"%lg", v10);
        [v4 addObject:v11];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v12 = [v4 componentsJoinedByString:@";"];
  long long v13 = [NSString stringWithFormat:@"distribution_point{min %@ %lg min %lg, max %lg [%@]}", v3, *(void *)&self->_minPoint.x, *(void *)&self->_minPoint.y, *(void *)&self->_maxPoint.y, v12];

  return (NSString *)v13;
}

- (id)_applyTransformToSegments:(id)a3 transform:(CGAffineTransform *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "CGPointValue", (void)v16);
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v12), *(float64x2_t *)&a4->a, v13)));
        [v6 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (CGPoint)minPoint
{
  double x = self->_minPoint.x;
  double y = self->_minPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)maxPoint
{
  double x = self->_maxPoint.x;
  double y = self->_maxPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSArray)distributionSegments
{
  return self->_distributionSegments;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_distributionSegments, 0);
}

@end