@interface HKHealthQueryChartCacheQueryRequest
- (HKHealthQueryChartCacheQueryRequest)initWithStartDate:(id)a3 endDate:(id)a4 statisticsInterval:(id)a5;
- (HKHealthQueryChartCacheQueryRequest)initWithStartDate:(id)a3 endDate:(id)a4 statisticsInterval:(id)a5 audience:(unint64_t)a6;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateComponents)statisticsInterval;
- (unint64_t)audience;
@end

@implementation HKHealthQueryChartCacheQueryRequest

- (NSDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (HKHealthQueryChartCacheQueryRequest)initWithStartDate:(id)a3 endDate:(id)a4 statisticsInterval:(id)a5 audience:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKHealthQueryChartCacheQueryRequest;
  v14 = [(HKHealthQueryChartCacheQueryRequest *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_startDate, a3);
    objc_storeStrong((id *)&v15->_endDate, a4);
    objc_storeStrong((id *)&v15->_statisticsInterval, a5);
    v15->_audience = a6;
  }

  return v15;
}

- (HKHealthQueryChartCacheQueryRequest)initWithStartDate:(id)a3 endDate:(id)a4 statisticsInterval:(id)a5
{
  return [(HKHealthQueryChartCacheQueryRequest *)self initWithStartDate:a3 endDate:a4 statisticsInterval:a5 audience:0];
}

- (unint64_t)audience
{
  return self->_audience;
}

@end