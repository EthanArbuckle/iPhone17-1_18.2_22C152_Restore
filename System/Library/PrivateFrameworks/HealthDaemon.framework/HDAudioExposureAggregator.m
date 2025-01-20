@interface HDAudioExposureAggregator
- (BOOL)shouldFreezeCurrentSeries:(id)a3 lastDatum:(id)a4 seriesLength:(int64_t)a5 configuration:(id)a6 aggregationInterval:(double)a7;
- (void)addDatum:(id)a3 toAccumulatedData:(id)a4;
@end

@implementation HDAudioExposureAggregator

- (void)addDatum:(id)a3 toAccumulatedData:(id)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 lastObject];
  if (v8)
  {
    v9 = [(HDActiveQuantityDataAggregator *)self quantityType];
    v10 = [v6 quantity];
    v11 = [v9 canonicalUnit];
    [v10 doubleValueForUnit:v11];
    double v13 = v12;

    if (v13 >= 80.0) {
      goto LABEL_5;
    }
    v14 = [v8 quantity];
    v15 = [v9 canonicalUnit];
    [v14 doubleValueForUnit:v15];
    double v17 = v16;

    if (v17 >= 80.0) {
      goto LABEL_5;
    }
    v18 = [v6 dateInterval];
    v19 = [v18 endDate];
    v20 = [v8 dateInterval];
    v21 = [v20 startDate];
    [v19 timeIntervalSinceDate:v21];
    double v23 = v22;

    if (v23 <= 30.0)
    {
      v28[0] = v8;
      v28[1] = v6;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
      v25 = HDMergedQuantitySensorData(v24, v9);

      v26 = v7;
      if (v25)
      {
        [v7 removeLastObject];
        v26 = v7;
        id v27 = v25;
      }
      else
      {
        id v27 = v6;
      }
      [v26 addObject:v27];
    }
    else
    {
LABEL_5:
      [v7 addObject:v6];
    }
  }
  else
  {
    [v7 addObject:v6];
  }
}

- (BOOL)shouldFreezeCurrentSeries:(id)a3 lastDatum:(id)a4 seriesLength:(int64_t)a5 configuration:(id)a6 aggregationInterval:(double)a7
{
  id v9 = a3;
  id v10 = a6;
  v11 = [(HDActiveQuantityDataAggregator *)self quantityType];
  uint64_t v12 = [v11 code];

  BOOL v17 = 0;
  if (v12 == 173)
  {
    double v13 = [v9 endDate];
    [v13 timeIntervalSinceNow];
    double v15 = -v14;

    [v10 maximumSeriesDuration];
    if (v16 < v15) {
      BOOL v17 = 1;
    }
  }

  return v17;
}

@end