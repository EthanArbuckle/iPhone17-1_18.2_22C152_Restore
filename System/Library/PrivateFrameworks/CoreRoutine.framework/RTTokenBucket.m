@interface RTTokenBucket
- (BOOL)_consumeTokens:(unint64_t)a3;
- (BOOL)operationAllowed;
- (BOOL)operationAllowedWithCost:(double)a3;
- (RTTokenBucket)init;
- (RTTokenBucket)initWithFillRate:(double)a3 capacity:(double)a4;
- (RTTokenBucket)initWithFillRate:(double)a3 capacity:(double)a4 initialAllocation:(double)a5;
- (double)interArrivalTime;
- (double)lastBucketFill;
- (double)timeIntervalUntilOperationAllowed;
- (double)timeIntervalUntilOperationAllowedWithCost:(double)a3;
- (id)dumpStatistics;
- (unint64_t)countOfOperationsAllowed;
- (unint64_t)countOfOperationsAllowedWithCost:(double)a3;
- (void)_replenishTokens;
- (void)reset;
- (void)setInterArrivalTime:(double)a3;
- (void)setLastBucketFill:(double)a3;
@end

@implementation RTTokenBucket

- (BOOL)operationAllowed
{
  return [(RTTokenBucket *)self operationAllowedWithCost:self->_operationCost];
}

- (BOOL)operationAllowedWithCost:(double)a3
{
  [(RTTokenBucket *)self _replenishTokens];
  return [(RTTokenBucket *)self _consumeTokens:(unint64_t)a3];
}

- (void)_replenishTokens
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double tokenBucket = self->_tokenBucket;
  double capacity = self->_capacity;
  if (tokenBucket < capacity)
  {
    double v6 = self->_fillRate * (Current - self->_lastBucketFill);
    double v7 = self->_totalTokensGenerated + v6;
    double v8 = tokenBucket + v6;
    self->_wastedTokens = self->_wastedTokens + vabdd_f64(v8, capacity);
    self->_totalTokensGenerated = v7;
    if (capacity >= v8) {
      double capacity = v8;
    }
    self->_double tokenBucket = capacity;
  }
  self->_lastBucketFill = Current;
}

- (BOOL)_consumeTokens:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      v14 = "-[RTTokenBucket _consumeTokens:]";
      __int16 v15 = 1024;
      int v16 = 106;
      _os_log_error_impl(&dword_1A8FEF000, v5, OS_LOG_TYPE_ERROR, "Token count less than 1. (in %s:%d)", (uint8_t *)&v13, 0x12u);
    }
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double tokenBucket = self->_tokenBucket;
  double lastArrivalTime = self->_lastArrivalTime;
  double v9 = Current - lastArrivalTime;
  if (lastArrivalTime == -INFINITY) {
    double v9 = 0.0;
  }
  self->_interArrivalTime = v9;
  double v10 = v9 + self->_totalInterArrivalTime;
  self->_double lastArrivalTime = Current;
  self->_totalInterArrivalTime = v10;
  ++self->_totalOperations;
  double v11 = (double)a3;
  if (tokenBucket >= (double)a3)
  {
    self->_double tokenBucket = tokenBucket - v11;
    self->_totalTokensConsumed = self->_totalTokensConsumed + v11;
    ++self->_operationsAllowed;
  }
  return tokenBucket >= v11;
}

- (RTTokenBucket)initWithFillRate:(double)a3 capacity:(double)a4 initialAllocation:(double)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0.0)
  {
    double v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTTokenBucket initWithFillRate:capacity:initialAllocation:]";
      __int16 v20 = 1024;
      int v21 = 64;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "Rate must be greater than 0. (in %s:%d)", buf, 0x12u);
    }
  }
  if (a4 <= 0.0)
  {
    double v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTTokenBucket initWithFillRate:capacity:initialAllocation:]";
      __int16 v20 = 1024;
      int v21 = 65;
      _os_log_error_impl(&dword_1A8FEF000, v10, OS_LOG_TYPE_ERROR, "Capacity must be greater than 0. (in %s:%d)", buf, 0x12u);
    }
  }
  if (a5 < 0.0)
  {
    double v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTTokenBucket initWithFillRate:capacity:initialAllocation:]";
      __int16 v20 = 1024;
      int v21 = 66;
      _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, "Initial allocation must be greater than 0. (in %s:%d)", buf, 0x12u);
    }
  }
  if (a5 > a4)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTTokenBucket initWithFillRate:capacity:initialAllocation:]";
      __int16 v20 = 1024;
      int v21 = 67;
      _os_log_error_impl(&dword_1A8FEF000, v12, OS_LOG_TYPE_ERROR, "Initial allocation must be less than capacity. (in %s:%d)", buf, 0x12u);
    }
  }
  int v13 = 0;
  if (a5 <= a4 && a3 > 0.0 && a4 > 0.0 && a5 >= 0.0)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTTokenBucket;
    v14 = [(RTTokenBucket *)&v17 init];
    __int16 v15 = v14;
    if (v14)
    {
      v14->_double tokenBucket = a5;
      v14->_fillRate = a3;
      v14->_double capacity = a4;
      v14->_operationCost = 1.0;
      v14->_lastBucketFill = CFAbsoluteTimeGetCurrent();
      v15->_double lastArrivalTime = -INFINITY;
    }
    self = v15;
    int v13 = self;
  }

  return v13;
}

- (RTTokenBucket)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithFillRate_capacity_initialAllocation_);
}

- (RTTokenBucket)initWithFillRate:(double)a3 capacity:(double)a4
{
  return [(RTTokenBucket *)self initWithFillRate:a3 capacity:a4 initialAllocation:a4];
}

- (double)timeIntervalUntilOperationAllowed
{
  [(RTTokenBucket *)self timeIntervalUntilOperationAllowedWithCost:self->_operationCost];
  return result;
}

- (double)timeIntervalUntilOperationAllowedWithCost:(double)a3
{
  [(RTTokenBucket *)self _replenishTokens];
  double tokenBucket = self->_tokenBucket;
  double result = 0.0;
  if (tokenBucket < a3) {
    return (a3 - tokenBucket) / self->_fillRate;
  }
  return result;
}

- (unint64_t)countOfOperationsAllowed
{
  return [(RTTokenBucket *)self countOfOperationsAllowedWithCost:self->_operationCost];
}

- (unint64_t)countOfOperationsAllowedWithCost:(double)a3
{
  return vcvtmd_u64_f64(self->_tokenBucket / a3);
}

- (void)reset
{
  self->_totalOperations = 0;
  self->_operationsAllowed = 0;
  self->_double tokenBucket = self->_capacity;
  *(_OWORD *)&self->_double lastArrivalTime = xmmword_1A90371A0;
  self->_interArrivalTime = 0.0;
  self->_lastBucketFill = CFAbsoluteTimeGetCurrent();
  self->_totalTokensGenerated = 0.0;
  self->_totalTokensConsumed = 0.0;
  self->_wastedTokens = 0.0;
}

- (id)dumpStatistics
{
  return (id)[NSString stringWithFormat:@"Total operations, %ld, Allowed operations, %ld, Denied operations, %ld, Operation inter-arrival time, %f, Average inter-arrival time, %f, Wasted tokens, %f, Total tokens generated, %f, Total tokens consumed, %f", self->_totalOperations, self->_operationsAllowed, self->_totalOperations - self->_operationsAllowed, *(void *)&self->_interArrivalTime, self->_totalInterArrivalTime / (double)self->_totalOperations, *(void *)&self->_wastedTokens, *(void *)&self->_totalTokensGenerated, *(void *)&self->_totalTokensConsumed];
}

- (double)interArrivalTime
{
  return self->_interArrivalTime;
}

- (void)setInterArrivalTime:(double)a3
{
  self->_interArrivalTime = a3;
}

- (double)lastBucketFill
{
  return self->_lastBucketFill;
}

- (void)setLastBucketFill:(double)a3
{
  self->_lastBucketFill = a3;
}

@end