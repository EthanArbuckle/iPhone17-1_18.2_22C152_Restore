@interface CLRacingRouteVariables
+ (BOOL)supportsSecureCoding;
- (BOOL)locationPointIsOutsideOfAcceptedRange;
- (BOOL)locationPointNotMatched;
- (BOOL)prematureRaceEndDetected;
- (BOOL)projectedOnNearestPoint;
- (BOOL)raceEndPointDetected;
- (BOOL)raceSessionExpired;
- (BOOL)raceStartPointDetected;
- (BOOL)racingRouteAnalyticsSent;
- (BOOL)referenceRouteTotalLengthDetermined;
- (BOOL)rollingBufferReachedEndOfReferenceRoute;
- (BOOL)routeConfigurationSuccessful;
- (BOOL)userIsOffRoute;
- (CLRacingRouteVariables)initWithCoder:(id)a3;
- (CLRacingRouteVariables)initWithRaceStartPointDetected:(BOOL)a3 raceEndPointDetected:(BOOL)a4 userIsOffRoute:(BOOL)a5 projectedOnNearestPoint:(BOOL)a6 raceSessionExpired:(BOOL)a7 rollingBufferReachedEndOfReferenceRoute:(BOOL)a8 routeConfigurationSuccessful:(BOOL)a9 racingRouteAnalyticsSent:(BOOL)a10 prematureRaceEndDetected:(BOOL)a11 referenceRouteTotalLengthDetermined:(BOOL)a12 locationPointIsOutsideOfAcceptedRange:(BOOL)a13 locationPointNotMatched:(BOOL)a14 routePointsBufferSize:(int)a15 numberOfRoutePointsToAdd:(int)a16 offRouteGraceDuration:(int)a17 matchedPointCounter:(int)a18 referenceRouteDataPointCounter:(int)a19 currentRouteDataPointCounter:(int)a20 offRouteDataPointCounter:(int)a21 inutileDataPointCounter:(int)a22 rollingBufferUpdateCounter:(int)a23 lastMatchedPointIndex:(int)a24 lastMatchedPointIndexOnReferenceRoute:(int)a25 rollingBufferStartIndexOnReferenceRoute:(int)a26 matrixCellIndexForLastMatchedPoint:(int)a27 referenceRouteTotalLength:(double)a28 timestampOfLastMatchedPointOnReferenceRoute:(double)a29 registeredTimeAtThresholdDistance:(double)a30 endOfRaceTimeThreshold:(double)a31 nearestNeighborMaximumAcceptedDistance:(double)a32;
- (double)endOfRaceTimeThreshold;
- (double)nearestNeighborMaximumAcceptedDistance;
- (double)referenceRouteTotalLength;
- (double)registeredTimeAtThresholdDistance;
- (double)timestampOfLastMatchedPointOnReferenceRoute;
- (id)copyWithZone:(_NSZone *)a3;
- (int)currentRouteDataPointCounter;
- (int)inutileDataPointCounter;
- (int)lastMatchedPointIndex;
- (int)lastMatchedPointIndexOnReferenceRoute;
- (int)matchedPointCounter;
- (int)matrixCellIndexForLastMatchedPoint;
- (int)numberOfRoutePointsToAdd;
- (int)offRouteDataPointCounter;
- (int)offRouteGraceDuration;
- (int)referenceRouteDataPointCounter;
- (int)rollingBufferStartIndexOnReferenceRoute;
- (int)rollingBufferUpdateCounter;
- (int)routePointsBufferSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLRacingRouteVariables

- (CLRacingRouteVariables)initWithRaceStartPointDetected:(BOOL)a3 raceEndPointDetected:(BOOL)a4 userIsOffRoute:(BOOL)a5 projectedOnNearestPoint:(BOOL)a6 raceSessionExpired:(BOOL)a7 rollingBufferReachedEndOfReferenceRoute:(BOOL)a8 routeConfigurationSuccessful:(BOOL)a9 racingRouteAnalyticsSent:(BOOL)a10 prematureRaceEndDetected:(BOOL)a11 referenceRouteTotalLengthDetermined:(BOOL)a12 locationPointIsOutsideOfAcceptedRange:(BOOL)a13 locationPointNotMatched:(BOOL)a14 routePointsBufferSize:(int)a15 numberOfRoutePointsToAdd:(int)a16 offRouteGraceDuration:(int)a17 matchedPointCounter:(int)a18 referenceRouteDataPointCounter:(int)a19 currentRouteDataPointCounter:(int)a20 offRouteDataPointCounter:(int)a21 inutileDataPointCounter:(int)a22 rollingBufferUpdateCounter:(int)a23 lastMatchedPointIndex:(int)a24 lastMatchedPointIndexOnReferenceRoute:(int)a25 rollingBufferStartIndexOnReferenceRoute:(int)a26 matrixCellIndexForLastMatchedPoint:(int)a27 referenceRouteTotalLength:(double)a28 timestampOfLastMatchedPointOnReferenceRoute:(double)a29 registeredTimeAtThresholdDistance:(double)a30 endOfRaceTimeThreshold:(double)a31 nearestNeighborMaximumAcceptedDistance:(double)a32
{
  v44.receiver = self;
  v44.super_class = (Class)CLRacingRouteVariables;
  result = [(CLRacingRouteVariables *)&v44 init];
  if (result)
  {
    result->_raceStartPointDetected = a3;
    result->_raceEndPointDetected = a4;
    result->_userIsOffRoute = a5;
    result->_projectedOnNearestPoint = a6;
    result->_raceSessionExpired = a7;
    result->_rollingBufferReachedEndOfReferenceRoute = a8;
    result->_routeConfigurationSuccessful = a9;
    result->_racingRouteAnalyticsSent = a10;
    result->_prematureRaceEndDetected = a11;
    result->_referenceRouteTotalLengthDetermined = a12;
    result->_locationPointIsOutsideOfAcceptedRange = a13;
    result->_locationPointNotMatched = a14;
    result->_routePointsBufferSize = a15;
    result->_numberOfRoutePointsToAdd = a16;
    result->_offRouteGraceDuration = a17;
    result->_matchedPointCounter = a18;
    result->_referenceRouteDataPointCounter = a19;
    result->_currentRouteDataPointCounter = a20;
    result->_offRouteDataPointCounter = a21;
    result->_inutileDataPointCounter = a22;
    result->_rollingBufferUpdateCounter = a23;
    result->_lastMatchedPointIndex = a24;
    result->_lastMatchedPointIndexOnReferenceRoute = a25;
    result->_rollingBufferStartIndexOnReferenceRoute = a26;
    result->_matrixCellIndexForLastMatchedPoint = a27;
    result->_referenceRouteTotalLength = a28;
    result->_timestampOfLastMatchedPointOnReferenceRoute = a29;
    result->_registeredTimeAtThresholdDistance = a30;
    result->_endOfRaceTimeThreshold = a31;
    result->_nearestNeighborMaximumAcceptedDistance = a32;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CLRacingRouteVariables alloc];
  LODWORD(v7) = self->_matrixCellIndexForLastMatchedPoint;
  *(_DWORD *)((char *)&v6 + 2) = *(_DWORD *)&self->_prematureRaceEndDetected;
  LOWORD(v6) = *(_WORD *)&self->_routeConfigurationSuccessful;
  return -[CLRacingRouteVariables initWithRaceStartPointDetected:raceEndPointDetected:userIsOffRoute:projectedOnNearestPoint:raceSessionExpired:rollingBufferReachedEndOfReferenceRoute:routeConfigurationSuccessful:racingRouteAnalyticsSent:prematureRaceEndDetected:referenceRouteTotalLengthDetermined:locationPointIsOutsideOfAcceptedRange:locationPointNotMatched:routePointsBufferSize:numberOfRoutePointsToAdd:offRouteGraceDuration:matchedPointCounter:referenceRouteDataPointCounter:currentRouteDataPointCounter:offRouteDataPointCounter:inutileDataPointCounter:rollingBufferUpdateCounter:lastMatchedPointIndex:lastMatchedPointIndexOnReferenceRoute:rollingBufferStartIndexOnReferenceRoute:matrixCellIndexForLastMatchedPoint:referenceRouteTotalLength:timestampOfLastMatchedPointOnReferenceRoute:registeredTimeAtThresholdDistance:endOfRaceTimeThreshold:nearestNeighborMaximumAcceptedDistance:](v4, "initWithRaceStartPointDetected:raceEndPointDetected:userIsOffRoute:projectedOnNearestPoint:raceSessionExpired:rollingBufferReachedEndOfReferenceRoute:routeConfigurationSuccessful:racingRouteAnalyticsSent:prematureRaceEndDetected:referenceRouteTotalLengthDetermined:locationPointIsOutsideOfAcceptedRange:locationPointNotMatched:routePointsBufferSize:numberOfRoutePointsToAdd:offRouteGraceDuration:matchedPointCounter:referenceRouteDataPointCounter:currentRouteDataPointCounter:offRouteDataPointCounter:inutileDataPointCounter:rollingBufferUpdateCounter:lastMatchedPointIndex:lastMatchedPointIndexOnReferenceRoute:rollingBufferStartIndexOnReferenceRoute:matrixCellIndexForLastMatchedPoint:referenceRouteTotalLength:timestampOfLastMatchedPointOnReferenceRoute:registeredTimeAtThresholdDistance:endOfRaceTimeThreshold:nearestNeighborMaximumAcceptedDistance:", self->_raceStartPointDetected, self->_raceEndPointDetected, self->_userIsOffRoute, self->_projectedOnNearestPoint, self->_raceSessionExpired, self->_rollingBufferReachedEndOfReferenceRoute, self->_referenceRouteTotalLength, self->_timestampOfLastMatchedPointOnReferenceRoute, self->_registeredTimeAtThresholdDistance, self->_endOfRaceTimeThreshold,
           self->_nearestNeighborMaximumAcceptedDistance,
           v6,
           *(void *)&self->_routePointsBufferSize,
           *(void *)&self->_offRouteGraceDuration,
           *(void *)&self->_referenceRouteDataPointCounter,
           *(void *)&self->_offRouteDataPointCounter,
           *(void *)&self->_rollingBufferUpdateCounter,
           *(void *)&self->_lastMatchedPointIndexOnReferenceRoute,
           v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", -[CLRacingRouteVariables raceStartPointDetected](self, "raceStartPointDetected"), @"raceStartPointDetected");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLRacingRouteVariables raceEndPointDetected](self, "raceEndPointDetected"), @"raceEndPointDetected");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLRacingRouteVariables userIsOffRoute](self, "userIsOffRoute"), @"userIsOffRoute");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLRacingRouteVariables projectedOnNearestPoint](self, "projectedOnNearestPoint"), @"projectedOnNearestPoint");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLRacingRouteVariables raceSessionExpired](self, "raceSessionExpired"), @"raceSessionExpired");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLRacingRouteVariables rollingBufferReachedEndOfReferenceRoute](self, "rollingBufferReachedEndOfReferenceRoute"), @"rollingBufferReachedEndOfReferenceRoute");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLRacingRouteVariables routeConfigurationSuccessful](self, "routeConfigurationSuccessful"), @"routeConfigurationSuccessful");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLRacingRouteVariables racingRouteAnalyticsSent](self, "racingRouteAnalyticsSent"), @"racingRouteAnalyticsSent");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLRacingRouteVariables prematureRaceEndDetected](self, "prematureRaceEndDetected"), @"prematureRaceEndDetected");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLRacingRouteVariables referenceRouteTotalLengthDetermined](self, "referenceRouteTotalLengthDetermined"), @"referenceRouteTotalLengthDetermined");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLRacingRouteVariables locationPointIsOutsideOfAcceptedRange](self, "locationPointIsOutsideOfAcceptedRange"), @"locationPointIsOutsideOfAcceptedRange");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLRacingRouteVariables locationPointNotMatched](self, "locationPointNotMatched"), @"locationPointNotMatched");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRacingRouteVariables routePointsBufferSize](self, "routePointsBufferSize"), @"routePointsBufferSize");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRacingRouteVariables numberOfRoutePointsToAdd](self, "numberOfRoutePointsToAdd"), @"numberOfRoutePointsToAdd");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRacingRouteVariables offRouteGraceDuration](self, "offRouteGraceDuration"), @"offRouteGraceDuration");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRacingRouteVariables matchedPointCounter](self, "matchedPointCounter"), @"matchedPointCounter");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRacingRouteVariables referenceRouteDataPointCounter](self, "referenceRouteDataPointCounter"), @"referenceRouteDataPointCounter");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRacingRouteVariables currentRouteDataPointCounter](self, "currentRouteDataPointCounter"), @"currentRouteDataPointCounter");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRacingRouteVariables offRouteDataPointCounter](self, "offRouteDataPointCounter"), @"offRouteDataPointCounter");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRacingRouteVariables inutileDataPointCounter](self, "inutileDataPointCounter"), @"inutileDataPointCounter");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRacingRouteVariables rollingBufferUpdateCounter](self, "rollingBufferUpdateCounter"), @"rollingBufferUpdateCounter");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRacingRouteVariables lastMatchedPointIndex](self, "lastMatchedPointIndex"), @"lastMatchedPointIndex");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRacingRouteVariables lastMatchedPointIndexOnReferenceRoute](self, "lastMatchedPointIndexOnReferenceRoute"), @"lastMatchedPointIndexOnReferenceRoute");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRacingRouteVariables rollingBufferStartIndexOnReferenceRoute](self, "rollingBufferStartIndexOnReferenceRoute"), @"rollingBufferStartIndexOnReferenceRoute");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRacingRouteVariables matrixCellIndexForLastMatchedPoint](self, "matrixCellIndexForLastMatchedPoint"), @"matrixCellIndexForLastMatchedPoint");
  [(CLRacingRouteVariables *)self referenceRouteTotalLength];
  objc_msgSend(a3, "encodeDouble:forKey:", @"referenceRouteTotalLength");
  [(CLRacingRouteVariables *)self timestampOfLastMatchedPointOnReferenceRoute];
  objc_msgSend(a3, "encodeDouble:forKey:", @"timestampOfLastMatchedPointOnReferenceRoute");
  [(CLRacingRouteVariables *)self registeredTimeAtThresholdDistance];
  objc_msgSend(a3, "encodeDouble:forKey:", @"registeredTimeAtThresholdDistance");
  [(CLRacingRouteVariables *)self endOfRaceTimeThreshold];
  objc_msgSend(a3, "encodeDouble:forKey:", @"endOfRaceTimeThreshold");
  [(CLRacingRouteVariables *)self nearestNeighborMaximumAcceptedDistance];

  objc_msgSend(a3, "encodeDouble:forKey:", @"nearestNeighborMaximumAcceptedDistance");
}

- (CLRacingRouteVariables)initWithCoder:(id)a3
{
  v41 = [CLRacingRouteVariables alloc];
  unsigned int v40 = [a3 decodeBoolForKey:@"raceStartPointDetected"];
  unsigned int v39 = [a3 decodeBoolForKey:@"raceEndPointDetected"];
  unsigned int v38 = [a3 decodeBoolForKey:@"userIsOffRoute"];
  unsigned int v37 = [a3 decodeBoolForKey:@"projectedOnNearestPoint"];
  unsigned int v36 = [a3 decodeBoolForKey:@"raceSessionExpired"];
  unsigned int v35 = [a3 decodeBoolForKey:@"rollingBufferReachedEndOfReferenceRoute"];
  char v34 = [a3 decodeBoolForKey:@"routeConfigurationSuccessful"];
  char v33 = [a3 decodeBoolForKey:@"racingRouteAnalyticsSent"];
  char v32 = [a3 decodeBoolForKey:@"prematureRaceEndDetected"];
  char v31 = [a3 decodeBoolForKey:@"referenceRouteTotalLengthDetermined"];
  char v30 = [a3 decodeBoolForKey:@"locationPointIsOutsideOfAcceptedRange"];
  char v29 = [a3 decodeBoolForKey:@"locationPointNotMatched"];
  unsigned int v28 = [a3 decodeIntForKey:@"routePointsBufferSize"];
  unsigned int v27 = [a3 decodeIntForKey:@"numberOfRoutePointsToAdd"];
  unsigned int v26 = [a3 decodeIntForKey:@"offRouteGraceDuration"];
  unsigned int v25 = [a3 decodeIntForKey:@"matchedPointCounter"];
  unsigned int v4 = [a3 decodeIntForKey:@"referenceRouteDataPointCounter"];
  unsigned int v5 = [a3 decodeIntForKey:@"currentRouteDataPointCounter"];
  unsigned int v6 = [a3 decodeIntForKey:@"offRouteDataPointCounter"];
  unsigned int v7 = [a3 decodeIntForKey:@"inutileDataPointCounter"];
  unsigned int v8 = [a3 decodeIntForKey:@"rollingBufferUpdateCounter"];
  unsigned int v9 = [a3 decodeIntForKey:@"lastMatchedPointIndex"];
  unsigned int v10 = [a3 decodeIntForKey:@"lastMatchedPointIndexOnReferenceRoute"];
  unsigned int v11 = [a3 decodeIntForKey:@"rollingBufferStartIndexOnReferenceRoute"];
  int v12 = [a3 decodeIntForKey:@"matrixCellIndexForLastMatchedPoint"];
  [a3 decodeDoubleForKey:@"referenceRouteTotalLength"];
  double v14 = v13;
  [a3 decodeDoubleForKey:@"timestampOfLastMatchedPointOnReferenceRoute"];
  double v16 = v15;
  [a3 decodeDoubleForKey:@"registeredTimeAtThresholdDistance"];
  double v18 = v17;
  [a3 decodeDoubleForKey:@"endOfRaceTimeThreshold"];
  double v20 = v19;
  [a3 decodeDoubleForKey:@"nearestNeighborMaximumAcceptedDistance"];
  LODWORD(v24) = v12;
  BYTE5(v23) = v29;
  BYTE4(v23) = v30;
  BYTE3(v23) = v31;
  BYTE2(v23) = v32;
  BYTE1(v23) = v33;
  LOBYTE(v23) = v34;
  return -[CLRacingRouteVariables initWithRaceStartPointDetected:raceEndPointDetected:userIsOffRoute:projectedOnNearestPoint:raceSessionExpired:rollingBufferReachedEndOfReferenceRoute:routeConfigurationSuccessful:racingRouteAnalyticsSent:prematureRaceEndDetected:referenceRouteTotalLengthDetermined:locationPointIsOutsideOfAcceptedRange:locationPointNotMatched:routePointsBufferSize:numberOfRoutePointsToAdd:offRouteGraceDuration:matchedPointCounter:referenceRouteDataPointCounter:currentRouteDataPointCounter:offRouteDataPointCounter:inutileDataPointCounter:rollingBufferUpdateCounter:lastMatchedPointIndex:lastMatchedPointIndexOnReferenceRoute:rollingBufferStartIndexOnReferenceRoute:matrixCellIndexForLastMatchedPoint:referenceRouteTotalLength:timestampOfLastMatchedPointOnReferenceRoute:registeredTimeAtThresholdDistance:endOfRaceTimeThreshold:nearestNeighborMaximumAcceptedDistance:](v41, "initWithRaceStartPointDetected:raceEndPointDetected:userIsOffRoute:projectedOnNearestPoint:raceSessionExpired:rollingBufferReachedEndOfReferenceRoute:routeConfigurationSuccessful:racingRouteAnalyticsSent:prematureRaceEndDetected:referenceRouteTotalLengthDetermined:locationPointIsOutsideOfAcceptedRange:locationPointNotMatched:routePointsBufferSize:numberOfRoutePointsToAdd:offRouteGraceDuration:matchedPointCounter:referenceRouteDataPointCounter:currentRouteDataPointCounter:offRouteDataPointCounter:inutileDataPointCounter:rollingBufferUpdateCounter:lastMatchedPointIndex:lastMatchedPointIndexOnReferenceRoute:rollingBufferStartIndexOnReferenceRoute:matrixCellIndexForLastMatchedPoint:referenceRouteTotalLength:timestampOfLastMatchedPointOnReferenceRoute:registeredTimeAtThresholdDistance:endOfRaceTimeThreshold:nearestNeighborMaximumAcceptedDistance:", v40, v39, v38, v37, v36, v35, v14, v16, v18, v20,
           v21,
           v23,
           __PAIR64__(v27, v28),
           __PAIR64__(v25, v26),
           __PAIR64__(v5, v4),
           __PAIR64__(v7, v6),
           __PAIR64__(v9, v8),
           __PAIR64__(v11, v10),
           v24);
}

- (BOOL)raceStartPointDetected
{
  return self->_raceStartPointDetected;
}

- (BOOL)raceEndPointDetected
{
  return self->_raceEndPointDetected;
}

- (BOOL)userIsOffRoute
{
  return self->_userIsOffRoute;
}

- (BOOL)projectedOnNearestPoint
{
  return self->_projectedOnNearestPoint;
}

- (BOOL)raceSessionExpired
{
  return self->_raceSessionExpired;
}

- (BOOL)rollingBufferReachedEndOfReferenceRoute
{
  return self->_rollingBufferReachedEndOfReferenceRoute;
}

- (BOOL)routeConfigurationSuccessful
{
  return self->_routeConfigurationSuccessful;
}

- (BOOL)racingRouteAnalyticsSent
{
  return self->_racingRouteAnalyticsSent;
}

- (BOOL)prematureRaceEndDetected
{
  return self->_prematureRaceEndDetected;
}

- (BOOL)referenceRouteTotalLengthDetermined
{
  return self->_referenceRouteTotalLengthDetermined;
}

- (BOOL)locationPointIsOutsideOfAcceptedRange
{
  return self->_locationPointIsOutsideOfAcceptedRange;
}

- (BOOL)locationPointNotMatched
{
  return self->_locationPointNotMatched;
}

- (int)routePointsBufferSize
{
  return self->_routePointsBufferSize;
}

- (int)numberOfRoutePointsToAdd
{
  return self->_numberOfRoutePointsToAdd;
}

- (int)offRouteGraceDuration
{
  return self->_offRouteGraceDuration;
}

- (int)matchedPointCounter
{
  return self->_matchedPointCounter;
}

- (int)referenceRouteDataPointCounter
{
  return self->_referenceRouteDataPointCounter;
}

- (int)currentRouteDataPointCounter
{
  return self->_currentRouteDataPointCounter;
}

- (int)offRouteDataPointCounter
{
  return self->_offRouteDataPointCounter;
}

- (int)inutileDataPointCounter
{
  return self->_inutileDataPointCounter;
}

- (int)rollingBufferUpdateCounter
{
  return self->_rollingBufferUpdateCounter;
}

- (int)lastMatchedPointIndex
{
  return self->_lastMatchedPointIndex;
}

- (int)lastMatchedPointIndexOnReferenceRoute
{
  return self->_lastMatchedPointIndexOnReferenceRoute;
}

- (int)rollingBufferStartIndexOnReferenceRoute
{
  return self->_rollingBufferStartIndexOnReferenceRoute;
}

- (int)matrixCellIndexForLastMatchedPoint
{
  return self->_matrixCellIndexForLastMatchedPoint;
}

- (double)referenceRouteTotalLength
{
  return self->_referenceRouteTotalLength;
}

- (double)timestampOfLastMatchedPointOnReferenceRoute
{
  return self->_timestampOfLastMatchedPointOnReferenceRoute;
}

- (double)registeredTimeAtThresholdDistance
{
  return self->_registeredTimeAtThresholdDistance;
}

- (double)endOfRaceTimeThreshold
{
  return self->_endOfRaceTimeThreshold;
}

- (double)nearestNeighborMaximumAcceptedDistance
{
  return self->_nearestNeighborMaximumAcceptedDistance;
}

@end