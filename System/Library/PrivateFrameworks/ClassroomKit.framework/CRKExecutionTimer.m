@interface CRKExecutionTimer
+ (id)startedTimerWithDescription:(id)a3;
- (CRKExecutionTimer)initWithDescription:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)timerDescription;
- (id)stop;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)start;
@end

@implementation CRKExecutionTimer

+ (id)startedTimerWithDescription:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDescription:v4];

  [v5 start];

  return v5;
}

- (CRKExecutionTimer)initWithDescription:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKExecutionTimer;
  v5 = [(CRKExecutionTimer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    timerDescription = v5->_timerDescription;
    v5->_timerDescription = (NSString *)v6;
  }
  return v5;
}

- (void)start
{
  id v4 = [(CRKExecutionTimer *)self startDate];

  if (v4)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v6 = [(CRKExecutionTimer *)self startDate];
    [v5 handleFailureInMethod:a2, self, @"CRKExecutionTimer.m", 37, @"Timer was already started at %@", v6 object file lineNumber description];
  }
  id v7 = (id)objc_opt_new();
  [(CRKExecutionTimer *)self setStartDate:v7];
}

- (id)stop
{
  id v4 = [(CRKExecutionTimer *)self endDate];

  if (v4)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    v15 = [(CRKExecutionTimer *)self endDate];
    [v14 handleFailureInMethod:a2, self, @"CRKExecutionTimer.m", 42, @"Timer was already stopped at %@", v15 object file lineNumber description];
  }
  v5 = objc_opt_new();
  [(CRKExecutionTimer *)self setEndDate:v5];

  uint64_t v6 = [(CRKExecutionTimer *)self endDate];
  id v7 = [(CRKExecutionTimer *)self startDate];
  [v6 timeIntervalSinceDate:v7];
  uint64_t v9 = v8;

  v10 = NSString;
  v11 = [(CRKExecutionTimer *)self timerDescription];
  v12 = [v10 stringWithFormat:@"'%@' took %.2f seconds", v11, v9];

  return v12;
}

- (NSString)timerDescription
{
  return self->_timerDescription;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_timerDescription, 0);
}

@end