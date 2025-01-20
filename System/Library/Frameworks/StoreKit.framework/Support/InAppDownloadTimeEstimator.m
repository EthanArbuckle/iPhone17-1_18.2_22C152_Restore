@interface InAppDownloadTimeEstimator
- (InAppDownloadTimeEstimator)initWithMaxValue:(unint64_t)a3;
- (double)estimatedTimeRemaining;
- (void)_updateStatisticsFromSnapshots;
- (void)setCurrentValue:(unint64_t)a3;
@end

@implementation InAppDownloadTimeEstimator

- (InAppDownloadTimeEstimator)initWithMaxValue:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)InAppDownloadTimeEstimator;
  v4 = [(InAppDownloadTimeEstimator *)&v12 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.storekit.time", 0);
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v5;

    v4->_changeRate = -1.0;
    v4->_currentValue = 0;
    v4->_estimatedTimeRemaining = -1.0;
    v4->_maxValue = a3;
    uint64_t v7 = objc_opt_new();
    times = v4->_times;
    v4->_times = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    values = v4->_values;
    v4->_values = (NSMutableArray *)v9;
  }
  return v4;
}

- (double)estimatedTimeRemaining
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  unint64_t v9 = 0xBFF0000000000000;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100025464;
  v5[3] = &unk_1003571D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setCurrentValue:(unint64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000254EC;
  v4[3] = &unk_1003571F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)_updateStatisticsFromSnapshots
{
  id v3 = [(NSMutableArray *)self->_times count];
  double v4 = -1.0;
  if ((unint64_t)v3 < 6)
  {
    double v18 = -1.0;
  }
  else
  {
    unint64_t v5 = (unint64_t)v3;
    double v6 = 0.0;
    for (uint64_t i = 1; i != v5; ++i)
    {
      uint64_t v8 = [(NSMutableArray *)self->_times objectAtIndexedSubscript:i];
      [v8 doubleValue];
      double v10 = v9;
      v11 = [(NSMutableArray *)self->_times objectAtIndexedSubscript:i - 1];
      [v11 doubleValue];
      double v13 = v10 - v12;

      v14 = [(NSMutableArray *)self->_values objectAtIndexedSubscript:i];
      v15 = [v14 longLongValue];
      v16 = [(NSMutableArray *)self->_values objectAtIndexedSubscript:i - 1];
      uint64_t v17 = v15 - (unsigned char *)[v16 longLongValue];

      double v6 = v6 + (double)v17 / v13;
    }
    double v18 = v6 / (double)v5;
    if (v18 > 0.00000011920929)
    {
      int64_t v19 = self->_maxValue - self->_currentValue;
      if ((v19 & 0x8000000000000000) == 0) {
        double v4 = (double)v19 / v18;
      }
    }
  }
  self->_changeRate = v18;
  self->_estimatedTimeRemaining = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_times, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end