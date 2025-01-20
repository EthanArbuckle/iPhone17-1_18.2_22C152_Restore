@interface GEOSearchRedoButtonThreshold
- (GEOSearchRedoButtonThreshold)init;
- (GEOSearchRedoButtonThreshold)initWithNumberOfVisiblePOIsThreshold:(unint64_t)a3 zoomInPercentThreshold:(double)a4 zoomOutPercentThreshold:(double)a5 panDeltaThresholdInMeters:(double)a6;
- (GEOSearchRedoButtonThreshold)initWithSearchRedoButtonThreshold:(id)a3;
- (double)panDeltaThresholdInMeters;
- (double)zoomInPercentThreshold;
- (double)zoomOutPercentThreshold;
- (unint64_t)numberOfVisiblePoisThreshold;
@end

@implementation GEOSearchRedoButtonThreshold

- (GEOSearchRedoButtonThreshold)init
{
  result = (GEOSearchRedoButtonThreshold *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOSearchRedoButtonThreshold)initWithSearchRedoButtonThreshold:(id)a3
{
  v4 = (double *)a3;
  if (v4)
  {
    uint64_t v5 = *((unsigned int *)v4 + 10);
    double v6 = v4[3];
    double v7 = v4[4];
    double v8 = v4[2];
  }
  else
  {
    uint64_t v5 = 0;
    double v7 = 0.0;
    double v6 = 0.0;
    double v8 = 0.0;
  }

  return [(GEOSearchRedoButtonThreshold *)self initWithNumberOfVisiblePOIsThreshold:v5 zoomInPercentThreshold:v6 zoomOutPercentThreshold:v7 panDeltaThresholdInMeters:v8];
}

- (GEOSearchRedoButtonThreshold)initWithNumberOfVisiblePOIsThreshold:(unint64_t)a3 zoomInPercentThreshold:(double)a4 zoomOutPercentThreshold:(double)a5 panDeltaThresholdInMeters:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)GEOSearchRedoButtonThreshold;
  result = [(GEOSearchRedoButtonThreshold *)&v11 init];
  if (result)
  {
    result->_numberOfVisiblePoisThreshold = a3;
    result->_zoomInPercentThreshold = a4;
    result->_zoomOutPercentThreshold = a5;
    result->_panDeltaThresholdInMeters = a6;
  }
  return result;
}

- (unint64_t)numberOfVisiblePoisThreshold
{
  return self->_numberOfVisiblePoisThreshold;
}

- (double)zoomInPercentThreshold
{
  return self->_zoomInPercentThreshold;
}

- (double)zoomOutPercentThreshold
{
  return self->_zoomOutPercentThreshold;
}

- (double)panDeltaThresholdInMeters
{
  return self->_panDeltaThresholdInMeters;
}

@end