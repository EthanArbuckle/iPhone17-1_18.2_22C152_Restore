@interface FIUIChartNumericSeries
- (CGPoint)_CGPointFromChartPoint:(id)a3;
- (id)CGPointsFromDataSet;
@end

@implementation FIUIChartNumericSeries

- (id)CGPointsFromDataSet
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(FIUIChartSeries *)self dataSet];
  v5 = [v4 points];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [(FIUIChartNumericSeries *)self _CGPointFromChartPoint:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:");
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (CGPoint)_CGPointFromChartPoint:(id)a3
{
  id v4 = a3;
  [(FIUIChartSeries *)self xValueForPointFromChartPoint:v4];
  double v6 = v5;
  uint64_t v7 = [v4 yValue];

  [(FIUIChartSeries *)self yValueForPointFromChartPointValue:v7];
  double v9 = v8;

  double v10 = v6;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

@end