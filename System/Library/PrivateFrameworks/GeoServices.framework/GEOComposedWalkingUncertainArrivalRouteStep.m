@interface GEOComposedWalkingUncertainArrivalRouteStep
+ (BOOL)supportsSecureCoding;
- (BOOL)isUncertainArrival;
- (GEOComposedWalkingUncertainArrivalRouteStep)initWithCoder:(id)a3;
- (GEOComposedWalkingUncertainArrivalRouteStep)initWithComposedRoute:(id)a3 aggregatedGEOSteps:(id)a4 stepIndex:(unint64_t)a5 pointRange:(_NSRange)a6 maneuverPointRange:(_NSRange)a7;
- (double)_calculateAggregatedStepsDistance;
- (double)distance;
- (unsigned)_calculateAggregatedStepsDuration;
- (unsigned)duration;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedWalkingUncertainArrivalRouteStep

- (GEOComposedWalkingUncertainArrivalRouteStep)initWithComposedRoute:(id)a3 aggregatedGEOSteps:(id)a4 stepIndex:(unint64_t)a5 pointRange:(_NSRange)a6 maneuverPointRange:(_NSRange)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v13 = a4;
  id v14 = a3;
  v15 = [v13 lastObject];
  v19.receiver = self;
  v19.super_class = (Class)GEOComposedWalkingUncertainArrivalRouteStep;
  v16 = -[GEOComposedWalkingRouteStep initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:pointRange:maneuverPointRange:](&v19, sel_initWithComposedRoute_geoRouteLeg_geoStep_stepIndex_pointRange_maneuverPointRange_, v14, 0, v15, a5, location, length, a7.location, a7.length);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_aggregatedGEOSteps, a4);
    v17 = v16;
  }

  return v16;
}

- (BOOL)isUncertainArrival
{
  return 1;
}

- (unsigned)duration
{
  unsigned int result = self->_aggregatedStepsDuration;
  if (!result)
  {
    unsigned int result = [(GEOComposedWalkingUncertainArrivalRouteStep *)self _calculateAggregatedStepsDuration];
    self->_aggregatedStepsDuration = result;
  }
  return result;
}

- (unsigned)_calculateAggregatedStepsDuration
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_aggregatedGEOSteps;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "expectedTime", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (double)distance
{
  double result = self->_aggregatedStepsDistance;
  if (result == 0.0)
  {
    [(GEOComposedWalkingUncertainArrivalRouteStep *)self _calculateAggregatedStepsDistance];
    self->_aggregatedStepsDistance = result;
  }
  return result;
}

- (double)_calculateAggregatedStepsDistance
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_aggregatedGEOSteps;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "distanceMeters", (void)v10);
        double v6 = v6 + v8;
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedWalkingUncertainArrivalRouteStep)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOComposedWalkingUncertainArrivalRouteStep;
  uint64_t v5 = [(GEOComposedRouteStep *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_aggregatedGEOSteps"];
    aggregatedGEOSteps = v5->_aggregatedGEOSteps;
    v5->_aggregatedGEOSteps = (NSArray *)v6;

    [v4 decodeDoubleForKey:@"_aggregatedStepsDistance"];
    v5->_aggregatedStepsDistance = v8;
    v5->_aggregatedStepsDuration = [v4 decodeIntegerForKey:@"_aggregatedStepsDuration"];
    long long v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedWalkingUncertainArrivalRouteStep;
  id v4 = a3;
  [(GEOComposedRouteStep *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_aggregatedGEOSteps, @"_aggregatedGEOSteps", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"_aggregatedStepsDistance" forKey:self->_aggregatedStepsDistance];
  [v4 encodeInteger:self->_aggregatedStepsDuration forKey:@"_aggregatedStepsDuration"];
}

- (void).cxx_destruct
{
}

@end