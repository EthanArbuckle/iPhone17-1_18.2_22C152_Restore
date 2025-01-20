@interface CLSNowPlayingStreamEventClusteringParameters
- (CLSNowPlayingStreamEventClusteringParameters)init;
- (double)minimumClusterTimeInSeconds;
- (unint64_t)algorithm;
- (void)setAlgorithm:(unint64_t)a3;
- (void)setMinimumClusterTimeInSeconds:(double)a3;
@end

@implementation CLSNowPlayingStreamEventClusteringParameters

- (void)setAlgorithm:(unint64_t)a3
{
  self->_algorithm = a3;
}

- (unint64_t)algorithm
{
  return self->_algorithm;
}

- (void)setMinimumClusterTimeInSeconds:(double)a3
{
  self->_minimumClusteringTimeInSeconds = a3;
}

- (double)minimumClusterTimeInSeconds
{
  return self->_minimumClusteringTimeInSeconds;
}

- (CLSNowPlayingStreamEventClusteringParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSNowPlayingStreamEventClusteringParameters;
  result = [(CLSNowPlayingStreamEventClusteringParameters *)&v3 init];
  if (result)
  {
    result->_minimumClusteringTimeInSeconds = 1800.0;
    result->_algorithm = 1;
  }
  return result;
}

@end