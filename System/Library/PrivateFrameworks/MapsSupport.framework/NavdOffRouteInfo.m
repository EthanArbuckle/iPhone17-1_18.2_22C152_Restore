@interface NavdOffRouteInfo
- (NavdOffRouteInfo)initWithCurrentDate:(id)a3 location:(id)a4 destination:(id)a5;
- (double)penalty;
- (id)description;
- (void)updateWithCurrentDate:(id)a3 location:(id)a4 isMostRecentReroute:(BOOL)a5 throttledReroutesCount:(unint64_t)a6;
@end

@implementation NavdOffRouteInfo

- (id)description
{
  id v2 = [objc_alloc((Class)NSMutableString) initWithFormat:@"Date: %@\r\nLast Update: %@\r\nCoordinates: <%.6f,%.6f>\r\nDistance To Destination: %f\r\n DistancePenalty: %f, Throttled reroutes Penalty: %f\r\nPenalty: %f", self->_date, self->_lastUpdate, *(void *)&self->_destinationCoordinate.latitude, *(void *)&self->_destinationCoordinate.longitude, *(void *)&self->_originalDistanceFromDestination, *(void *)&self->_distancePenalty, *(void *)&self->_throttledReroutesPenalty, *(void *)&self->_penalty];

  return v2;
}

- (NavdOffRouteInfo)initWithCurrentDate:(id)a3 location:(id)a4 destination:(id)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NavdOffRouteInfo;
  v10 = [(NavdOffRouteInfo *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_date, a3);
    v11->_destinationCoordinate.latitude = var0;
    v11->_destinationCoordinate.longitude = var1;
    GEOCalculateDistance();
    v11->_originalDistanceFromDestination = v12;
  }

  return v11;
}

- (void)updateWithCurrentDate:(id)a3 location:(id)a4 isMostRecentReroute:(BOOL)a5 throttledReroutesCount:(unint64_t)a6
{
  BOOL v7 = a5;
  id v31 = a3;
  objc_storeStrong((id *)&self->_lastUpdate, a3);
  if (v7)
  {
    GEOCalculateDistance();
    double v11 = v10;
    double originalDistanceFromDestination = self->_originalDistanceFromDestination;
    self->_distancePenalty = 0.0;
    GEOConfigGetDouble();
    double v13 = v11 - originalDistanceFromDestination;
    if (v13 > v14)
    {
      GEOConfigGetDouble();
      double v16 = v15;
      GEOConfigGetDouble();
      self->_distancePenalty = (v13 - v16) * v17;
    }
    GEOConfigGetDouble();
    self->_throttledReroutesPenalty = (1.0 - pow((double)(a6 + 1), -0.7)) * v18;
  }
  [v31 timeIntervalSinceDate:self->_date];
  double v20 = v19;
  GEOConfigGetDouble();
  double v22 = v21;
  GEOConfigGetDouble();
  double v24 = v23;
  GEOConfigGetDouble();
  double v26 = v25;
  GEOConfigGetDouble();
  double v28 = (v20 - v22) / (v24 - v26);
  if (v28 < 0.0) {
    double v28 = 0.0;
  }
  if (v28 > 1.0) {
    double v28 = 1.0;
  }
  double v29 = v27 + self->_distancePenalty + self->_throttledReroutesPenalty;
  float v30 = v28;
  self->_penalty = v29 + (0.0 - v29) * v30;
}

- (double)penalty
{
  return self->_penalty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdate, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end