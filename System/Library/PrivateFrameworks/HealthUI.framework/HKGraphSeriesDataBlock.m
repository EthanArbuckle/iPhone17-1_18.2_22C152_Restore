@interface HKGraphSeriesDataBlock
+ (id)emptyDataBlock;
- (HKValueRange)yValueRange;
- (NSArray)chartPoints;
- (void)setChartPoints:(id)a3;
@end

@implementation HKGraphSeriesDataBlock

- (void)setChartPoints:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (NSArray *)[v4 copy];
  chartPoints = self->_chartPoints;
  self->_chartPoints = v5;

  if ([v4 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      double v11 = 1.79769313e308;
      double v12 = 2.22507386e-308;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "minYValue", (void)v25);
          [v15 doubleValue];
          double v17 = v16;

          v18 = [v14 maxYValue];
          [v18 doubleValue];
          double v20 = v19;

          if (v11 >= v17) {
            double v11 = v17;
          }
          if (v12 < v20) {
            double v12 = v20;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 1.79769313e308;
      double v12 = 2.22507386e-308;
    }

    v21 = [NSNumber numberWithDouble:v11];
    v22 = [NSNumber numberWithDouble:v12];
    v23 = +[HKValueRange valueRangeWithMinValue:v21 maxValue:v22];
    yValueRange = self->_yValueRange;
    self->_yValueRange = v23;
  }
}

+ (id)emptyDataBlock
{
  v2 = objc_alloc_init(HKGraphSeriesDataBlock);
  [(HKGraphSeriesDataBlock *)v2 setChartPoints:MEMORY[0x1E4F1CBF0]];
  return v2;
}

- (NSArray)chartPoints
{
  return self->_chartPoints;
}

- (HKValueRange)yValueRange
{
  return self->_yValueRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yValueRange, 0);
  objc_storeStrong((id *)&self->_chartPoints, 0);
}

@end