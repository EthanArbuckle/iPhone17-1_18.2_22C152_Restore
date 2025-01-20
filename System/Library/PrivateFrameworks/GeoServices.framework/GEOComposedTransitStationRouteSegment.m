@interface GEOComposedTransitStationRouteSegment
- (BOOL)hasEnterStationManeuver;
- (BOOL)hasExitStationManeuver;
- (BOOL)isTransfer;
- (GEOComposedTransitStationRouteSegment)initWithComposedRoute:(id)a3 decoderData:(id)a4 stepRange:(_NSRange)a5 transitStepRange:(_NSRange)a6 pointRange:(_NSRange)a7 segmentIndex:(unint64_t)a8;
- (int64_t)type;
@end

@implementation GEOComposedTransitStationRouteSegment

- (GEOComposedTransitStationRouteSegment)initWithComposedRoute:(id)a3 decoderData:(id)a4 stepRange:(_NSRange)a5 transitStepRange:(_NSRange)a6 pointRange:(_NSRange)a7 segmentIndex:(unint64_t)a8
{
  v9.receiver = self;
  v9.super_class = (Class)GEOComposedTransitStationRouteSegment;
  return -[GEOComposedTransitBaseRouteSegment initWithComposedRoute:stepRange:transitStepRange:pointRange:segmentIndex:](&v9, sel_initWithComposedRoute_stepRange_transitStepRange_pointRange_segmentIndex_, a3, a5.location, a5.length, a6.location, a6.length, a7.location, a7.length, a8);
}

- (int64_t)type
{
  return 5;
}

- (BOOL)isTransfer
{
  uint64_t v3 = [(GEOComposedRouteSegment *)self stepRange];
  unint64_t v5 = v3 + v4;
  unint64_t v6 = [(GEOComposedRouteSegment *)self stepRange];
  if (v6 >= v5)
  {
    return 1;
  }
  else
  {
    unint64_t v7 = v6;
    BOOL v8 = 0;
    while (1)
    {
      objc_super v9 = [(GEOComposedRouteSegment *)self composedRoute];
      v10 = [v9 steps];
      v11 = [v10 objectAtIndex:v7];

      if ([v11 maneuver] == 7 || objc_msgSend(v11, "maneuver") == 8) {
        break;
      }

      BOOL v8 = ++v7 >= v5;
      if (v5 == v7) {
        return 1;
      }
    }
  }
  return v8;
}

- (BOOL)hasEnterStationManeuver
{
  uint64_t v3 = [(GEOComposedRouteSegment *)self stepRange];
  unint64_t v5 = v3 + v4;
  unint64_t v6 = [(GEOComposedRouteSegment *)self stepRange];
  if (v6 >= v5)
  {
    return 0;
  }
  else
  {
    unint64_t v7 = v6;
    BOOL v8 = 1;
    do
    {
      objc_super v9 = [(GEOComposedRouteSegment *)self composedRoute];
      v10 = [v9 steps];
      v11 = [v10 objectAtIndex:v7];

      LODWORD(v9) = [v11 maneuver];
      if (v9 == 7) {
        break;
      }
      BOOL v8 = ++v7 < v5;
    }
    while (v5 != v7);
  }
  return v8;
}

- (BOOL)hasExitStationManeuver
{
  uint64_t v3 = [(GEOComposedRouteSegment *)self stepRange];
  unint64_t v5 = v3 + v4;
  unint64_t v6 = [(GEOComposedRouteSegment *)self stepRange];
  if (v6 >= v5)
  {
    return 0;
  }
  else
  {
    unint64_t v7 = v6;
    BOOL v8 = 1;
    do
    {
      objc_super v9 = [(GEOComposedRouteSegment *)self composedRoute];
      v10 = [v9 steps];
      v11 = [v10 objectAtIndex:v7];

      LODWORD(v9) = [v11 maneuver];
      if (v9 == 8) {
        break;
      }
      BOOL v8 = ++v7 < v5;
    }
    while (v5 != v7);
  }
  return v8;
}

@end