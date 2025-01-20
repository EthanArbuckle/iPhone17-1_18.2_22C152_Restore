@interface AXSDTimeStamp
- (AXSDTimeStamp)initWithResult:(id)a3;
- (AXSDTimeStamp)initWithTime:(double)a3 andDuration:(double)a4;
- (double)duration;
- (double)time;
@end

@implementation AXSDTimeStamp

- (AXSDTimeStamp)initWithTime:(double)a3 andDuration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AXSDTimeStamp;
  result = [(AXSDTimeStamp *)&v7 init];
  if (result)
  {
    result->_duration = a4;
    result->_time = a3;
  }
  return result;
}

- (AXSDTimeStamp)initWithResult:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXSDTimeStamp;
  v5 = [(AXSDTimeStamp *)&v9 init];
  if (v5)
  {
    if (v4)
    {
      [v4 timeRange];
      double v6 = (double)0 / (double)0;
      double v7 = v6;
    }
    else
    {
      double v6 = NAN;
      double v7 = NAN;
    }
    v5->_duration = v7;
    v5->_time = v6;
  }

  return v5;
}

- (double)time
{
  return self->_time;
}

- (double)duration
{
  return self->_duration;
}

@end