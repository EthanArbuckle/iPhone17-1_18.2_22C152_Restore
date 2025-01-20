@interface GEOComposedWalkingRouteSegment
+ (BOOL)supportsSecureCoding;
- (GEOComposedTransitWalkingRouteStep)arrivalStep;
- (GEOComposedWalkingRouteSegment)initWithCoder:(id)a3;
- (GEOComposedWalkingRouteSegment)initWithComposedRoute:(id)a3 stepRange:(_NSRange)a4 pointRange:(_NSRange)a5 segmentIndex:(unint64_t)a6 transitIncidentMessageStepIndex:(unint64_t)a7;
- (GEOComposedWalkingRouteStep)lastWalkingStep;
- (id)_transitIncidentMessageStep;
- (int64_t)type;
- (unint64_t)transitIncidentMessageStepIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedWalkingRouteSegment

- (GEOComposedWalkingRouteSegment)initWithComposedRoute:(id)a3 stepRange:(_NSRange)a4 pointRange:(_NSRange)a5 segmentIndex:(unint64_t)a6 transitIncidentMessageStepIndex:(unint64_t)a7
{
  v8.receiver = self;
  v8.super_class = (Class)GEOComposedWalkingRouteSegment;
  result = -[GEOComposedRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:](&v8, sel_initWithComposedRoute_stepRange_pointRange_segmentIndex_, a3, a4.location, a4.length, a5.location, a5.length, a6);
  if (result) {
    result->_transitIncidentMessageStepIndex = a7;
  }
  return result;
}

- (int64_t)type
{
  return 2;
}

- (GEOComposedWalkingRouteStep)lastWalkingStep
{
  v2 = [(GEOComposedRouteSegment *)self steps];
  uint64_t v3 = [v2 count];
  if (v3 < 1)
  {
LABEL_5:
    v5 = 0;
  }
  else
  {
    uint64_t v4 = v3 + 1;
    while (1)
    {
      v5 = [v2 objectAtIndex:v4 - 2];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }

      if ((unint64_t)--v4 <= 1) {
        goto LABEL_5;
      }
    }
  }

  return (GEOComposedWalkingRouteStep *)v5;
}

- (GEOComposedTransitWalkingRouteStep)arrivalStep
{
  v2 = [(GEOComposedRouteSegment *)self steps];
  uint64_t v3 = [v2 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if ([v4 isArrivalStep]) {
      goto LABEL_5;
    }
  }
  id v4 = 0;
LABEL_5:

  return (GEOComposedTransitWalkingRouteStep *)v4;
}

- (id)_transitIncidentMessageStep
{
  unint64_t transitIncidentMessageStepIndex = self->_transitIncidentMessageStepIndex;
  id v4 = [(GEOComposedRouteSegment *)self composedRoute];
  unint64_t v5 = [v4 stepsCount];

  if (transitIncidentMessageStepIndex <= v5)
  {
    v7 = [(GEOComposedRouteSegment *)self composedRoute];
    objc_super v8 = [v7 stepAtIndex:self->_transitIncidentMessageStepIndex];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedWalkingRouteSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOComposedWalkingRouteSegment;
  unint64_t v5 = [(GEOComposedRouteSegment *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_unint64_t transitIncidentMessageStepIndex = [v4 decodeIntegerForKey:@"_transitIncidentMessageStepIndex"];
    id v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedWalkingRouteSegment;
  id v4 = a3;
  [(GEOComposedRouteSegment *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_transitIncidentMessageStepIndex, @"_transitIncidentMessageStepIndex", v5.receiver, v5.super_class);
}

- (unint64_t)transitIncidentMessageStepIndex
{
  return self->_transitIncidentMessageStepIndex;
}

@end