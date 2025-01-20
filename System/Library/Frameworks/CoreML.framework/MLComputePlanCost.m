@interface MLComputePlanCost
- (MLComputePlanCost)initWithWeight:(double)a3;
- (double)weight;
@end

@implementation MLComputePlanCost

- (double)weight
{
  return self->_weight;
}

- (MLComputePlanCost)initWithWeight:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MLComputePlanCost;
  result = [(MLComputePlanCost *)&v5 init];
  if (result) {
    result->_weight = a3;
  }
  return result;
}

@end