@interface FMTokenBucket
- (BOOL)_consumeTokens:(int64_t)a3;
- (BOOL)operationAllowed;
- (BOOL)operationAllowedWithCost:(double)a3;
- (FMTokenBucket)initWithFillRate:(double)a3 capacity:(double)a4;
- (FMTokenBucket)initWithFillRate:(double)a3 capacity:(double)a4 initialAllocation:(double)a5;
- (double)capacity;
- (double)fillRate;
- (double)interArrivalTime;
- (double)lastArrivalTime;
- (double)lastBucketFill;
- (double)operationCost;
- (double)timeIntervalUntilOperationAllowed;
- (double)timeIntervalUntilOperationAllowedWithCost:(double)a3;
- (double)tokenBucket;
- (double)totalInterArrivalTime;
- (double)totalTokensConsumed;
- (double)totalTokensGenerated;
- (double)wastedTokens;
- (id)dumpStatistics;
- (int64_t)countOfOperationsAllowed;
- (int64_t)countOfOperationsAllowedWithCost:(double)a3;
- (int64_t)operationsAllowed;
- (int64_t)totalOperations;
- (void)_replenishTokens;
- (void)reset;
- (void)setCapacity:(double)a3;
- (void)setFillRate:(double)a3;
- (void)setInterArrivalTime:(double)a3;
- (void)setLastArrivalTime:(double)a3;
- (void)setLastBucketFill:(double)a3;
- (void)setOperationCost:(double)a3;
- (void)setOperationsAllowed:(int64_t)a3;
- (void)setTokenBucket:(double)a3;
- (void)setTotalInterArrivalTime:(double)a3;
- (void)setTotalOperations:(int64_t)a3;
- (void)setTotalTokensConsumed:(double)a3;
- (void)setTotalTokensGenerated:(double)a3;
- (void)setWastedTokens:(double)a3;
@end

@implementation FMTokenBucket

- (FMTokenBucket)initWithFillRate:(double)a3 capacity:(double)a4
{
  return [(FMTokenBucket *)self initWithFillRate:a3 capacity:a4 initialAllocation:a4];
}

- (FMTokenBucket)initWithFillRate:(double)a3 capacity:(double)a4 initialAllocation:(double)a5
{
  v5 = 0;
  if (a5 <= a4 && a3 > 0.0 && a4 > 0.0 && a5 >= 0.0)
  {
    v12.receiver = self;
    v12.super_class = (Class)FMTokenBucket;
    v9 = [(FMTokenBucket *)&v12 init];
    v10 = v9;
    if (v9)
    {
      v9->_tokenBucket = a5;
      v9->_fillRate = a3;
      v9->_capacity = a4;
      v9->_operationCost = 1.0;
      v9->_lastBucketFill = CFAbsoluteTimeGetCurrent();
      v10->_lastArrivalTime = -INFINITY;
    }
    self = v10;
    v5 = self;
  }

  return v5;
}

- (void)_replenishTokens
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(FMTokenBucket *)self tokenBucket];
  double v5 = v4;
  [(FMTokenBucket *)self capacity];
  if (v5 < v6)
  {
    [(FMTokenBucket *)self fillRate];
    double v8 = v7;
    [(FMTokenBucket *)self lastBucketFill];
    double v10 = v8 * (Current - v9);
    [(FMTokenBucket *)self totalTokensGenerated];
    [(FMTokenBucket *)self setTotalTokensGenerated:v11 + v10];
    [(FMTokenBucket *)self tokenBucket];
    double v13 = v10 + v12;
    [(FMTokenBucket *)self capacity];
    double v15 = vabdd_f64(v13, v14);
    [(FMTokenBucket *)self wastedTokens];
    [(FMTokenBucket *)self setWastedTokens:v16 + v15];
    [(FMTokenBucket *)self capacity];
    double v18 = v17;
    [(FMTokenBucket *)self tokenBucket];
    double v20 = v10 + v19;
    if (v18 < v20) {
      double v20 = v18;
    }
    [(FMTokenBucket *)self setTokenBucket:v20];
  }
  [(FMTokenBucket *)self setLastBucketFill:Current];
}

- (BOOL)_consumeTokens:(int64_t)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(FMTokenBucket *)self lastArrivalTime];
  double v7 = v6;
  double v8 = 0.0;
  if (v7 != -INFINITY)
  {
    [(FMTokenBucket *)self lastArrivalTime];
    double v8 = Current - v9;
  }
  [(FMTokenBucket *)self setInterArrivalTime:v8];
  [(FMTokenBucket *)self interArrivalTime];
  double v11 = v10;
  [(FMTokenBucket *)self totalInterArrivalTime];
  [(FMTokenBucket *)self setTotalInterArrivalTime:v11 + v12];
  [(FMTokenBucket *)self setLastArrivalTime:Current];
  [(FMTokenBucket *)self setTotalOperations:[(FMTokenBucket *)self totalOperations] + 1];
  double v13 = (double)a3;
  [(FMTokenBucket *)self tokenBucket];
  double v15 = v14;
  if (v14 >= (double)a3)
  {
    [(FMTokenBucket *)self tokenBucket];
    [(FMTokenBucket *)self setTokenBucket:v16 - v13];
    [(FMTokenBucket *)self totalTokensConsumed];
    [(FMTokenBucket *)self setTotalTokensConsumed:v17 + v13];
    [(FMTokenBucket *)self setOperationsAllowed:[(FMTokenBucket *)self operationsAllowed] + 1];
  }
  return v15 >= v13;
}

- (BOOL)operationAllowedWithCost:(double)a3
{
  [(FMTokenBucket *)self _replenishTokens];
  return [(FMTokenBucket *)self _consumeTokens:(uint64_t)a3];
}

- (BOOL)operationAllowed
{
  [(FMTokenBucket *)self operationCost];
  return -[FMTokenBucket operationAllowedWithCost:](self, "operationAllowedWithCost:");
}

- (double)timeIntervalUntilOperationAllowed
{
  [(FMTokenBucket *)self operationCost];
  -[FMTokenBucket timeIntervalUntilOperationAllowedWithCost:](self, "timeIntervalUntilOperationAllowedWithCost:");
  return result;
}

- (double)timeIntervalUntilOperationAllowedWithCost:(double)a3
{
  [(FMTokenBucket *)self _replenishTokens];
  [(FMTokenBucket *)self tokenBucket];
  double v6 = v5;
  double result = 0.0;
  if (v6 < a3)
  {
    [(FMTokenBucket *)self tokenBucket];
    double v9 = a3 - v8;
    [(FMTokenBucket *)self fillRate];
    return v9 / v10;
  }
  return result;
}

- (int64_t)countOfOperationsAllowed
{
  [(FMTokenBucket *)self operationCost];
  return -[FMTokenBucket countOfOperationsAllowedWithCost:](self, "countOfOperationsAllowedWithCost:");
}

- (int64_t)countOfOperationsAllowedWithCost:(double)a3
{
  [(FMTokenBucket *)self _replenishTokens];
  [(FMTokenBucket *)self tokenBucket];
  return vcvtmd_s64_f64(v5 / a3);
}

- (void)reset
{
  [(FMTokenBucket *)self setOperationsAllowed:0];
  [(FMTokenBucket *)self setTotalOperations:0];
  [(FMTokenBucket *)self setTotalInterArrivalTime:0.0];
  [(FMTokenBucket *)self setTokenBucket:self->_capacity];
  [(FMTokenBucket *)self setLastArrivalTime:-INFINITY];
  [(FMTokenBucket *)self setInterArrivalTime:0.0];
  [(FMTokenBucket *)self setLastBucketFill:CFAbsoluteTimeGetCurrent()];
  [(FMTokenBucket *)self setWastedTokens:0.0];
  [(FMTokenBucket *)self setTotalTokensGenerated:0.0];
  [(FMTokenBucket *)self setTotalTokensConsumed:0.0];
}

- (id)dumpStatistics
{
  v3 = NSString;
  int64_t v4 = [(FMTokenBucket *)self totalOperations];
  int64_t v5 = [(FMTokenBucket *)self operationsAllowed];
  int64_t v6 = [(FMTokenBucket *)self totalOperations];
  int64_t v7 = v6 - [(FMTokenBucket *)self operationsAllowed];
  [(FMTokenBucket *)self interArrivalTime];
  uint64_t v9 = v8;
  [(FMTokenBucket *)self totalInterArrivalTime];
  double v11 = v10 / (double)[(FMTokenBucket *)self totalOperations];
  [(FMTokenBucket *)self wastedTokens];
  uint64_t v13 = v12;
  [(FMTokenBucket *)self totalTokensGenerated];
  uint64_t v15 = v14;
  [(FMTokenBucket *)self totalTokensConsumed];
  return (id)[v3 stringWithFormat:@"Total operations, %ld, Allowed operations, %ld, Denied operations, %ld, Operation inter-arrival time, %f, Average inter-arrival time, %f, Wasted tokens, %f, Total tokens generated, %f, Total tokens consumed, %f", v4, v5, v7, v9, *(void *)&v11, v13, v15, v16];
}

- (double)interArrivalTime
{
  return self->_interArrivalTime;
}

- (void)setInterArrivalTime:(double)a3
{
  self->_interArrivalTime = a3;
}

- (double)fillRate
{
  return self->_fillRate;
}

- (void)setFillRate:(double)a3
{
  self->_fillRate = a3;
}

- (double)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(double)a3
{
  self->_capacity = a3;
}

- (double)operationCost
{
  return self->_operationCost;
}

- (void)setOperationCost:(double)a3
{
  self->_operationCost = a3;
}

- (double)tokenBucket
{
  return self->_tokenBucket;
}

- (void)setTokenBucket:(double)a3
{
  self->_tokenBucket = a3;
}

- (double)lastArrivalTime
{
  return self->_lastArrivalTime;
}

- (void)setLastArrivalTime:(double)a3
{
  self->_lastArrivalTime = a3;
}

- (double)totalInterArrivalTime
{
  return self->_totalInterArrivalTime;
}

- (void)setTotalInterArrivalTime:(double)a3
{
  self->_totalInterArrivalTime = a3;
}

- (double)wastedTokens
{
  return self->_wastedTokens;
}

- (void)setWastedTokens:(double)a3
{
  self->_wastedTokens = a3;
}

- (double)totalTokensGenerated
{
  return self->_totalTokensGenerated;
}

- (void)setTotalTokensGenerated:(double)a3
{
  self->_totalTokensGenerated = a3;
}

- (double)totalTokensConsumed
{
  return self->_totalTokensConsumed;
}

- (void)setTotalTokensConsumed:(double)a3
{
  self->_totalTokensConsumed = a3;
}

- (int64_t)totalOperations
{
  return self->_totalOperations;
}

- (void)setTotalOperations:(int64_t)a3
{
  self->_totalOperations = a3;
}

- (int64_t)operationsAllowed
{
  return self->_operationsAllowed;
}

- (void)setOperationsAllowed:(int64_t)a3
{
  self->_operationsAllowed = a3;
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