@interface _CDDateRange
+ (id)periodWithEnd:(id)a3 duration:(double)a4;
+ (id)periodWithStart:(id)a3 duration:(double)a4;
+ (id)periodWithStart:(id)a3 end:(id)a4;
- (BOOL)contains:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (_CDDateRange)initWithStart:(id)a3 andEnd:(id)a4;
- (double)duration;
- (id)description;
@end

@implementation _CDDateRange

- (_CDDateRange)initWithStart:(id)a3 andEnd:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CDDateRange;
  v9 = [(_CDDateRange *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
  }

  return v10;
}

+ (id)periodWithStart:(id)a3 duration:(double)a4
{
  id v5 = a3;
  v6 = [_CDDateRange alloc];
  id v7 = [v5 dateByAddingTimeInterval:a4];
  id v8 = [(_CDDateRange *)v6 initWithStart:v5 andEnd:v7];

  return v8;
}

+ (id)periodWithEnd:(id)a3 duration:(double)a4
{
  id v5 = a3;
  v6 = [_CDDateRange alloc];
  id v7 = [v5 dateByAddingTimeInterval:-a4];
  id v8 = [(_CDDateRange *)v6 initWithStart:v7 andEnd:v5];

  return v8;
}

+ (id)periodWithStart:(id)a3 end:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[_CDDateRange alloc] initWithStart:v6 andEnd:v5];

  return v7;
}

- (double)duration
{
  v3 = [(_CDDateRange *)self endDate];
  v4 = [(_CDDateRange *)self startDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (BOOL)contains:(id)a3
{
  id v4 = a3;
  double v5 = [(_CDDateRange *)self startDate];
  uint64_t v6 = [v4 compare:v5];

  if (v6 == -1)
  {
    BOOL v8 = 0;
  }
  else
  {
    id v7 = [(_CDDateRange *)self endDate];
    BOOL v8 = [v4 compare:v7] != 1;
  }
  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  id v4 = objc_opt_new();
  [v4 setTimeZone:v3];
  [v4 setDateStyle:2];
  [v4 setTimeStyle:3];
  double v5 = NSString;
  uint64_t v6 = [(_CDDateRange *)self startDate];
  id v7 = [v4 stringFromDate:v6];
  BOOL v8 = [(_CDDateRange *)self endDate];
  v9 = [v4 stringFromDate:v8];
  v10 = [v5 stringWithFormat:@"%@ to %@", v7, v9];

  return v10;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end