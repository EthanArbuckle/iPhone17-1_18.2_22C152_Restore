@interface MMCSOperationStateTimeRange
+ (id)describedSortedRanges:(id)a3;
+ (id)descriptionWithOperationState:(unint64_t)a3 absoluteStart:(double)a4 duration:(double)a5;
+ (id)stringForOperationState:(unint64_t)a3;
- (MMCSOperationStateTimeRange)initWithOperationState:(unint64_t)a3 startDate:(id)a4 duration:(double)a5;
- (NSDate)startDate;
- (NSString)description;
- (double)absoluteStart;
- (double)absoluteStop;
- (double)duration;
- (double)executing;
- (double)queueing;
- (double)relativeStart;
- (int64_t)compareStartTime:(id)a3;
- (int64_t)compareStopTime:(id)a3;
- (unint64_t)operationState;
- (void)setStartDate:(id)a3;
@end

@implementation MMCSOperationStateTimeRange

- (MMCSOperationStateTimeRange)initWithOperationState:(unint64_t)a3 startDate:(id)a4 duration:(double)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MMCSOperationStateTimeRange;
  v10 = [(MMCSOperationStateTimeRange *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_operationState = a3;
    objc_storeStrong((id *)&v10->_startDate, a4);
    v11->_duration = a5;
  }

  return v11;
}

+ (id)stringForOperationState:(unint64_t)a3
{
  if (a3 > 2) {
    return @"unknown";
  }
  else {
    return *(&off_1E6C2FED0 + a3);
  }
}

+ (id)descriptionWithOperationState:(unint64_t)a3 absoluteStart:(double)a4 duration:(double)a5
{
  v7 = NSString;
  v8 = [a1 stringForOperationState:a3];
  mmcs_operation_metric_reference_time();
  v10 = [v7 stringWithFormat:@"[%@ %0.3lf, %0.3lf]", v8, a4 - v9, *(void *)&a5];

  return v10;
}

- (NSString)description
{
  v3 = objc_opt_class();
  unint64_t operationState = self->_operationState;
  [(MMCSOperationStateTimeRange *)self absoluteStart];
  return (NSString *)objc_msgSend(v3, "descriptionWithOperationState:absoluteStart:duration:", operationState);
}

+ (id)describedSortedRanges:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28E78] string];
  uint64_t v6 = [v4 count];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    double v9 = 0.0;
    do
    {
      v10 = [v4 objectAtIndexedSubscript:v8];
      v11 = v10;
      if (v8)
      {
        [v10 absoluteStart];
        if (v12 > v9)
        {
          [v5 appendString:@" "];
          [v11 absoluteStart];
          v14 = [a1 descriptionWithOperationState:2 absoluteStart:v9 duration:v13 - v9];
          [v5 appendString:v14];
        }
        [v5 appendString:@" "];
        v15 = [v11 description];
        [v5 appendString:v15];
      }
      else
      {
        v16 = [v10 description];
        [v5 appendString:v16];

        [v11 absoluteStop];
        double v9 = v17;
      }

      ++v8;
    }
    while (v7 != v8);
  }

  return v5;
}

- (double)absoluteStart
{
  v2 = [(MMCSOperationStateTimeRange *)self startDate];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (double)queueing
{
  double result = 0.0;
  if (!self->_operationState) {
    return self->_duration;
  }
  return result;
}

- (double)executing
{
  double result = 0.0;
  if (self->_operationState == 1) {
    return self->_duration;
  }
  return result;
}

- (int64_t)compareStartTime:(id)a3
{
  id v4 = a3;
  [(MMCSOperationStateTimeRange *)self absoluteStart];
  double v6 = v5;
  [v4 absoluteStart];
  double v8 = v7;

  if (v6 < v8) {
    return -1;
  }
  else {
    return v6 > v8;
  }
}

- (int64_t)compareStopTime:(id)a3
{
  id v4 = a3;
  [(MMCSOperationStateTimeRange *)self absoluteStop];
  double v6 = v5;
  [v4 absoluteStop];
  double v8 = v7;

  if (v6 < v8) {
    return -1;
  }
  else {
    return v6 > v8;
  }
}

- (double)absoluteStop
{
  [(MMCSOperationStateTimeRange *)self absoluteStart];
  double v4 = v3;
  [(MMCSOperationStateTimeRange *)self duration];
  return v4 + v5;
}

- (double)relativeStart
{
  [(MMCSOperationStateTimeRange *)self absoluteStart];
  double v3 = v2;
  mmcs_operation_metric_reference_time();
  return v3 - v4;
}

- (unint64_t)operationState
{
  return self->_operationState;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
}

@end