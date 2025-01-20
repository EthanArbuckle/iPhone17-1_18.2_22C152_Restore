@interface _HKSampleQueryResult
- (NSArray)samples;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateInterval)dateInterval;
- (_HKSampleQueryResult)initWithStartDate:(id)a3 endDate:(id)a4 samples:(id)a5;
@end

@implementation _HKSampleQueryResult

- (_HKSampleQueryResult)initWithStartDate:(id)a3 endDate:(id)a4 samples:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_HKSampleQueryResult;
  v12 = [(_HKSampleQueryResult *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_startDate, a3);
    objc_storeStrong((id *)&v13->_endDate, a4);
    uint64_t v14 = [v11 copy];
    samples = v13->_samples;
    v13->_samples = (NSArray *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v10];
    dateInterval = v13->_dateInterval;
    v13->_dateInterval = (NSDateInterval *)v16;
  }
  return v13;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSArray)samples
{
  return self->_samples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end