@interface LKOperation
- (LKOperation)init;
- (NSDate)endTime;
- (NSDate)startTime;
- (double)duration;
- (id)dictionary;
- (void)setDuration:(double)a3;
- (void)setEndTime:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation LKOperation

- (LKOperation)init
{
  v7.receiver = self;
  v7.super_class = (Class)LKOperation;
  v2 = [(LKOperation *)&v7 init];
  v3 = v2;
  if (v2)
  {
    startTime = v2->_startTime;
    v2->_startTime = 0;

    endTime = v3->_endTime;
    v3->_endTime = 0;

    v3->_duration = 0.0;
  }
  return v3;
}

- (void)setStartTime:(id)a3
{
  v5 = (NSDate *)a3;
  startTime = self->_startTime;
  p_startTime = &self->_startTime;
  if (startTime != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_startTime, a3);
    v5 = v8;
  }
}

- (void)setEndTime:(id)a3
{
  v5 = (NSDate *)a3;
  endTime = self->_endTime;
  p_endTime = &self->_endTime;
  if (endTime != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_endTime, a3);
    v5 = v8;
  }
}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3) {
    self->_duration = a3;
  }
}

- (id)dictionary
{
  v3 = objc_opt_new();
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
  v5 = [(LKOperation *)self startTime];
  v6 = [v4 stringFromDate:v5];
  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:@"startTime"];
  }
  else
  {
    objc_super v7 = objc_opt_new();
    [v3 setObject:v7 forKeyedSubscript:@"startTime"];
  }
  v8 = [(LKOperation *)self endTime];
  v9 = [v4 stringFromDate:v8];
  if (v9)
  {
    [v3 setObject:v9 forKeyedSubscript:@"endTime"];
  }
  else
  {
    v10 = objc_opt_new();
    [v3 setObject:v10 forKeyedSubscript:@"endTime"];
  }
  v11 = NSNumber;
  [(LKOperation *)self duration];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  v13 = [MEMORY[0x263F087B0] notANumber];
  char v14 = [v12 isEqualToNumber:v13];

  if (v14)
  {
    v15 = objc_opt_new();
    [v3 setObject:v15 forKeyedSubscript:@"duration"];
  }
  else
  {
    [v3 setObject:v12 forKeyedSubscript:@"duration"];
  }
  v16 = (void *)[v3 copy];

  return v16;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end