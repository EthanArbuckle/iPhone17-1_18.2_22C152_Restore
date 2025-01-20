@interface DBDateRange
+ (BOOL)_validDate:(id)a3;
- (BOOL)containsDate:(id)a3;
- (BOOL)hasEnd;
- (BOOL)hasStart;
- (BOOL)validRange;
- (DBDateRange)initWithStart:(id)a3 end:(id)a4;
- (NSDate)end;
- (NSDate)start;
- (double)endTimeIntervalSinceReferenceDate;
- (double)startTimeIntervalSinceReferenceDate;
- (id)description;
- (void)setEnd:(id)a3;
- (void)setStart:(id)a3;
@end

@implementation DBDateRange

+ (BOOL)_validDate:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF910] distantFuture];
  BOOL v5 = +[DBComparison isValue:v3 equalTo:v4];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = [MEMORY[0x263EFF910] distantPast];
    BOOL v8 = +[DBComparison isValue:v3 equalTo:v7];

    BOOL v6 = !v8;
  }

  return v6;
}

- (DBDateRange)initWithStart:(id)a3 end:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DBDateRange;
  v9 = [(DBDateRange *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_start, a3);
    objc_storeStrong((id *)&v10->_end, a4);
  }

  return v10;
}

- (double)startTimeIntervalSinceReferenceDate
{
  v2 = [(DBDateRange *)self start];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (double)endTimeIntervalSinceReferenceDate
{
  v2 = [(DBDateRange *)self end];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (BOOL)validRange
{
  [(DBDateRange *)self startTimeIntervalSinceReferenceDate];
  double v4 = v3;
  [(DBDateRange *)self endTimeIntervalSinceReferenceDate];
  return v4 < v5;
}

- (BOOL)hasStart
{
  v2 = [(DBDateRange *)self start];
  BOOL v3 = +[DBDateRange _validDate:v2];

  return v3;
}

- (BOOL)hasEnd
{
  v2 = [(DBDateRange *)self end];
  BOOL v3 = +[DBDateRange _validDate:v2];

  return v3;
}

- (BOOL)containsDate:(id)a3
{
  id v4 = a3;
  double v5 = [(DBDateRange *)self start];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  id v8 = [(DBDateRange *)self end];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  [v4 timeIntervalSinceReferenceDate];
  double v12 = v11;

  return v12 < v10 && v7 < v12;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(DBDateRange *)self start];
  double v6 = +[DBDateFormatter formattedDateTimeStamp:v5];
  double v7 = [(DBDateRange *)self end];
  id v8 = +[DBDateFormatter formattedDateTimeStamp:v7];
  double v9 = [v3 stringWithFormat:@"<%@: %p start=%@ end=%@>", v4, self, v6, v8];

  return v9;
}

- (NSDate)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
}

- (NSDate)end
{
  return self->_end;
}

- (void)setEnd:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end