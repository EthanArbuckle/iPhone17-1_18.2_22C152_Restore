@interface MTLCommandQueueSPIStats
- (MTLCommandQueueSPIStats)initWithValues:(id)a3;
- (NSDictionary)values;
@end

@implementation MTLCommandQueueSPIStats

- (MTLCommandQueueSPIStats)initWithValues:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLCommandQueueSPIStats;
  result = [(MTLCommandQueueSPIStats *)&v5 init];
  if (result) {
    result->_values = (NSDictionary *)a3;
  }
  return result;
}

- (NSDictionary)values
{
  return self->_values;
}

@end