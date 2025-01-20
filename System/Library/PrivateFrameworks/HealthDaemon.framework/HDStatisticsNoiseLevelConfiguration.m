@interface HDStatisticsNoiseLevelConfiguration
- (BOOL)enableOverlapProcessing;
- (HDStatisticsNoiseLevelConfiguration)initWithOverlapProcessingEnabled:(BOOL)a3;
- (void)setEnableOverlapProcessing:(BOOL)a3;
@end

@implementation HDStatisticsNoiseLevelConfiguration

- (HDStatisticsNoiseLevelConfiguration)initWithOverlapProcessingEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDStatisticsNoiseLevelConfiguration;
  result = [(HDStatisticsNoiseLevelConfiguration *)&v5 init];
  if (result) {
    result->_enableOverlapProcessing = a3;
  }
  return result;
}

- (BOOL)enableOverlapProcessing
{
  return self->_enableOverlapProcessing;
}

- (void)setEnableOverlapProcessing:(BOOL)a3
{
  self->_enableOverlapProcessing = a3;
}

@end