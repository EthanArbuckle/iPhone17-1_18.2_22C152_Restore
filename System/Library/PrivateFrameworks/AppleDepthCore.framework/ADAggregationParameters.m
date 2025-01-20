@interface ADAggregationParameters
- (double)maxPointCloudAge;
- (unsigned)aggregationSize;
- (void)setAggregationSize:(unsigned int)a3;
- (void)setMaxPointCloudAge:(double)a3;
@end

@implementation ADAggregationParameters

- (void)setMaxPointCloudAge:(double)a3
{
  self->_maxPointCloudAge = a3;
}

- (void)setAggregationSize:(unsigned int)a3
{
  self->_aggregationSize = a3;
}

- (double)maxPointCloudAge
{
  return self->_maxPointCloudAge;
}

- (unsigned)aggregationSize
{
  return self->_aggregationSize;
}

@end