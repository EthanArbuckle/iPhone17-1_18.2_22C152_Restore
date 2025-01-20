@interface HDHeadphoneExposureUpdateDoseResult
+ (id)resultForNoChange;
+ (id)resultForUpdate:(id)a3;
- (HDHeadphoneExposureStatisticsResult)statistics;
- (id)_initWithStatistics:(id)a3;
- (void)setStatistics:(id)a3;
@end

@implementation HDHeadphoneExposureUpdateDoseResult

+ (id)resultForNoChange
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithStatistics:0];
  return v2;
}

+ (id)resultForUpdate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithStatistics:v4];

  return v5;
}

- (id)_initWithStatistics:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDHeadphoneExposureUpdateDoseResult;
  v6 = [(HDHeadphoneExposureUpdateDoseResult *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_statistics, a3);
    v8 = v7;
  }

  return v7;
}

- (HDHeadphoneExposureStatisticsResult)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end