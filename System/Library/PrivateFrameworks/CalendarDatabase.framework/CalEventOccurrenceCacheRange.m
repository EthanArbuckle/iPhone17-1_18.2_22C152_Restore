@interface CalEventOccurrenceCacheRange
- (CalEventOccurrenceCacheRange)initWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSTimeZone)timeZone;
@end

@implementation CalEventOccurrenceCacheRange

- (CalEventOccurrenceCacheRange)initWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CalEventOccurrenceCacheRange;
  v12 = [(CalEventOccurrenceCacheRange *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_startDate, a3);
    objc_storeStrong((id *)&v13->_endDate, a4);
    objc_storeStrong((id *)&v13->_timeZone, a5);
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

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end