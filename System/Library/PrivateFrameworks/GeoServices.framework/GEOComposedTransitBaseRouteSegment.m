@interface GEOComposedTransitBaseRouteSegment
+ (BOOL)supportsSecureCoding;
- (GEOComposedTransitBaseRouteSegment)initWithCoder:(id)a3;
- (GEOComposedTransitBaseRouteSegment)initWithComposedRoute:(id)a3 stepRange:(_NSRange)a4 transitStepRange:(_NSRange)a5 pointRange:(_NSRange)a6 segmentIndex:(unint64_t)a7;
- (_NSRange)transitStepRange;
- (id)endingTransitStop;
- (id)startingTransitStop;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedTransitBaseRouteSegment

- (GEOComposedTransitBaseRouteSegment)initWithComposedRoute:(id)a3 stepRange:(_NSRange)a4 transitStepRange:(_NSRange)a5 pointRange:(_NSRange)a6 segmentIndex:(unint64_t)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v13.receiver = self;
  v13.super_class = (Class)GEOComposedTransitBaseRouteSegment;
  v9 = -[GEOComposedRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:](&v13, sel_initWithComposedRoute_stepRange_pointRange_segmentIndex_, a3, a4.location, a4.length, a6.location, a6.length, a7);
  v10 = v9;
  if (v9)
  {
    v9->_transitStepRange.NSUInteger location = location;
    v9->_transitStepRange.NSUInteger length = length;
    v11 = v9;
  }

  return v10;
}

- (id)startingTransitStop
{
  p_transitStepRange = &self->_transitStepRange;
  NSUInteger location = self->_transitStepRange.location;
  v5 = [(GEOComposedRouteSegment *)self composedRoute];
  v6 = [v5 suggestedRoute];
  unint64_t v7 = [v6 stepsCount];

  if (location >= v7)
  {
    v20 = 0;
    goto LABEL_17;
  }
  v8 = [(GEOComposedRouteSegment *)self composedRoute];
  v9 = [v8 suggestedRoute];
  v10 = [v9 stepsAtIndex:location];

  if ([v10 maneuverType] == 7)
  {
    NSUInteger v11 = location + 1;
    if (v11 < p_transitStepRange->location || v11 - p_transitStepRange->location >= p_transitStepRange->length) {
      goto LABEL_15;
    }
    objc_super v13 = [(GEOComposedRouteSegment *)self composedRoute];
    v14 = [v13 suggestedRoute];
    unint64_t v15 = [v14 stepsCount];

    if (v11 >= v15) {
      goto LABEL_15;
    }
    v16 = [(GEOComposedRouteSegment *)self composedRoute];
    v17 = [v16 suggestedRoute];
    uint64_t v18 = [v17 stepsAtIndex:v11];

    v10 = (void *)v18;
  }
  if ([v10 hasStartingStopIndex]) {
    unint64_t v19 = [v10 startingStopIndex];
  }
  else {
    unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v21 = [(GEOComposedRouteSegment *)self composedRoute];
  v22 = [v21 stops];
  unint64_t v23 = [v22 count];

  if (v19 >= v23)
  {
LABEL_15:
    v20 = 0;
    goto LABEL_16;
  }
  v24 = [(GEOComposedRouteSegment *)self composedRoute];
  v25 = [v24 stops];
  v20 = [v25 objectAtIndexedSubscript:v19];

LABEL_16:
LABEL_17:

  return v20;
}

- (id)endingTransitStop
{
  p_transitStepRange = &self->_transitStepRange;
  NSUInteger location = self->_transitStepRange.location;
  NSUInteger length = self->_transitStepRange.length;
  NSUInteger v5 = length + location;
  unint64_t v6 = length + location - 1;
  BOOL v7 = v6 < location || length - 1 >= length;
  if (v7
    || ([(GEOComposedRouteSegment *)self composedRoute],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 suggestedRoute],
        v10 = objc_claimAutoreleasedReturnValue(),
        unint64_t v11 = [v10 stepsCount],
        v10,
        v9,
        v6 >= v11))
  {
    unint64_t v23 = 0;
    goto LABEL_21;
  }
  v12 = [(GEOComposedRouteSegment *)self composedRoute];
  objc_super v13 = [v12 suggestedRoute];
  v14 = [v13 stepsAtIndex:v6];

  if ([v14 maneuverType] == 8)
  {
    if (v5 - 2 < p_transitStepRange->location || v5 - 2 - p_transitStepRange->location >= p_transitStepRange->length) {
      goto LABEL_19;
    }
    v16 = [(GEOComposedRouteSegment *)self composedRoute];
    v17 = [v16 suggestedRoute];
    unint64_t v18 = [v17 stepsCount];

    if (v5 - 2 >= v18) {
      goto LABEL_19;
    }
    unint64_t v19 = [(GEOComposedRouteSegment *)self composedRoute];
    v20 = [v19 suggestedRoute];
    uint64_t v21 = [v20 stepsAtIndex:v5 - 2];

    v14 = (void *)v21;
  }
  if ([v14 hasEndingStopIndex]) {
    unint64_t v22 = [v14 endingStopIndex];
  }
  else {
    unint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v24 = [(GEOComposedRouteSegment *)self composedRoute];
  v25 = [v24 stops];
  unint64_t v26 = [v25 count];

  if (v22 >= v26)
  {
LABEL_19:
    unint64_t v23 = 0;
    goto LABEL_20;
  }
  v27 = [(GEOComposedRouteSegment *)self composedRoute];
  v28 = [v27 stops];
  unint64_t v23 = [v28 objectAtIndexedSubscript:v22];

LABEL_20:
LABEL_21:

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTransitBaseRouteSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedTransitBaseRouteSegment;
  NSUInteger v5 = [(GEOComposedRouteSegment *)&v10 initWithCoder:v4];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_transitStepRange"];
    v5->_transitStepRange.NSUInteger location = [v6 rangeValue];
    v5->_transitStepRange.NSUInteger length = v7;
    v8 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GEOComposedTransitBaseRouteSegment;
  id v4 = a3;
  [(GEOComposedRouteSegment *)&v6 encodeWithCoder:v4];
  NSUInteger v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_transitStepRange.location, self->_transitStepRange.length, v6.receiver, v6.super_class);
  [v4 encodeObject:v5 forKey:@"_transitStepRange"];
}

- (_NSRange)transitStepRange
{
  p_transitStepRange = &self->_transitStepRange;
  NSUInteger location = self->_transitStepRange.location;
  NSUInteger length = p_transitStepRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end