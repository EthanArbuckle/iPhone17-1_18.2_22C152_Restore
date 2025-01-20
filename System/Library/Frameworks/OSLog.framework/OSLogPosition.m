@interface OSLogPosition
- (NSDate)date;
- (OSLogPosition)initWithDate:(id)a3;
- (OSLogPosition)initWithEventSource:(id)a3 timeIntervalSinceEnd:(double)a4;
- (OSLogPosition)initWithTimeIntervalSinceLatestBoot:(double)a3;
- (double)offset;
- (int64_t)precision;
@end

@implementation OSLogPosition

- (void).cxx_destruct
{
}

- (double)offset
{
  return self->_offset;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)precision
{
  return self->_precision;
}

- (OSLogPosition)initWithTimeIntervalSinceLatestBoot:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OSLogPosition;
  v4 = [(OSLogPosition *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_precision = 2;
    v4->_offset = a3;
    v6 = v4;
  }

  return v5;
}

- (OSLogPosition)initWithEventSource:(id)a3 timeIntervalSinceEnd:(double)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OSLogPosition;
  v7 = [(OSLogPosition *)&v14 init];
  objc_super v8 = v7;
  if (v7)
  {
    v7->_precision = 1;
    v9 = [v6 newestDate];
    uint64_t v10 = [v9 dateByAddingTimeInterval:a4];
    date = v8->_date;
    v8->_date = (NSDate *)v10;

    v12 = v8;
  }

  return v8;
}

- (OSLogPosition)initWithDate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OSLogPosition;
  id v6 = [(OSLogPosition *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_precision = 1;
    objc_storeStrong((id *)&v6->_date, a3);
    objc_super v8 = v7;
  }

  return v7;
}

@end