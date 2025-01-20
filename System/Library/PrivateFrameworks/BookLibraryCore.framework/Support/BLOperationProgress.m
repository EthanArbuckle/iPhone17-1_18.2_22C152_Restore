@interface BLOperationProgress
- (BLOperationProgress)init;
- (NSString)description;
- (double)estimatedTimeRemaining;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)currentValue;
- (int64_t)maxValue;
- (int64_t)normalizedCurrentValue;
- (int64_t)normalizedMaxValue;
- (int64_t)units;
- (void)_updateStatisticsFromSnapshots;
- (void)resetSnapshots;
- (void)setCurrentValue:(int64_t)a3;
- (void)setEstimatedTimeRemaining:(double)a3;
- (void)setMaxValue:(int64_t)a3;
- (void)setUnits:(int64_t)a3;
- (void)snapshot;
@end

@implementation BLOperationProgress

- (BLOperationProgress)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLOperationProgress;
  v2 = [(BLOperationProgress *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.BookLibrary.BLOperationProgress", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_estimatedTimeRemaining = -1.0;
    v2->_changeRate = -1.0;
    v2->_normalizedCurrentValue = -1;
    v2->_normalizedMaxValue = -1;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100028D84;
  v9[3] = &unk_1001A11A8;
  id v6 = v4;
  id v10 = v6;
  v11 = self;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v9);
  id v7 = v6;

  return v7;
}

- (int64_t)currentValue
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100028E88;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)estimatedTimeRemaining
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  unint64_t v9 = 0xBFF0000000000000;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100028F4C;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)maxValue
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002900C;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)normalizedCurrentValue
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000290CC;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)normalizedMaxValue
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100029198;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)resetSnapshots
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002922C;
  block[3] = &unk_1001A0FE8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
}

- (void)setCurrentValue:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000292E4;
  v4[3] = &unk_1001A1408;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v4);
}

- (void)setEstimatedTimeRemaining:(double)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029368;
  v4[3] = &unk_1001A1408;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v4);
}

- (void)setMaxValue:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000293EC;
  v4[3] = &unk_1001A1408;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v4);
}

- (void)setUnits:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002946C;
  v4[3] = &unk_1001A1408;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v4);
}

- (void)snapshot
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000294EC;
  block[3] = &unk_1001A0FE8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
}

- (int64_t)units
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000296B4;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)description
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1000297B8;
  id v10 = sub_1000297C8;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000297D0;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)_updateStatisticsFromSnapshots
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v3 = [(NSMutableArray *)self->_snapshotTimes count];
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
      uint64_t v8 = [(NSMutableArray *)self->_snapshotTimes objectAtIndex:i];
      [v8 doubleValue];
      double v10 = v9;
      id v11 = [(NSMutableArray *)self->_snapshotTimes objectAtIndex:i - 1];
      [v11 doubleValue];
      double v13 = v10 - v12;

      v14 = [(NSMutableArray *)self->_snapshotValues objectAtIndex:i];
      v15 = [v14 longLongValue];
      v16 = [(NSMutableArray *)self->_snapshotValues objectAtIndex:i - 1];
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
  objc_storeStrong((id *)&self->_snapshotValues, 0);
  objc_storeStrong((id *)&self->_snapshotTimes, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end