@interface GEOComposedTransitStationRouteStep
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)endGeoCoordinate;
- ($1AB5FA073B851C12C2339EC22442E995)startGeoCoordinate;
- (BOOL)displayStop;
- (BOOL)hasDisplayStop;
- (BOOL)isArrivalUncertain;
- (GEOComposedTransitStationRouteStep)initWithCoder:(id)a3;
- (GEOComposedTransitStationRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 step:(id)a5 stepIndex:(unint64_t)a6 duration:(unsigned int)a7 pointRange:(_NSRange)a8;
- (GEOPBTransitAccessPoint)accessPoint;
- (GEOTransitTransferInfo)transitTransfer;
- (NSString)exitSign;
- (unsigned)expectedTime;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedTransitStationRouteStep

- (GEOComposedTransitStationRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 step:(id)a5 stepIndex:(unint64_t)a6 duration:(unsigned int)a7 pointRange:(_NSRange)a8
{
  uint64_t v8 = *(void *)&a7;
  id v13 = a4;
  id v14 = a5;
  v26.receiver = self;
  v26.super_class = (Class)GEOComposedTransitStationRouteStep;
  v15 = -[GEOComposedTransitRouteStep initWithComposedRoute:decoderData:routeSegmentType:step:stepIndex:duration:pointRange:](&v26, sel_initWithComposedRoute_decoderData_routeSegmentType_step_stepIndex_duration_pointRange_, a3, v13, 5, v14, a6, v8, a8.location, a8.length);
  if (v15)
  {
    v16 = [v14 transferInfos];
    v17 = [v16 firstObject];

    if (v17) {
      v15->_expectedTime = [v17 transferTime];
    }
    if ([v14 enterExitInfosCount])
    {
      uint64_t v18 = [v14 enterExitInfoAtIndex:0];
      enterExitInfo = v15->_enterExitInfo;
      v15->_enterExitInfo = (GEOTransitEnterExitInfo *)v18;

      if ([(GEOTransitEnterExitInfo *)v15->_enterExitInfo hasAccessPointIndex])
      {
        unsigned int v20 = [(GEOTransitEnterExitInfo *)v15->_enterExitInfo accessPointIndex];
        if ([v13 accessPointsCount] > (unint64_t)v20)
        {
          v21 = [v13 accessPoints];
          uint64_t v22 = objc_msgSend(v21, "objectAtIndex:", -[GEOTransitEnterExitInfo accessPointIndex](v15->_enterExitInfo, "accessPointIndex"));
          accessPoint = v15->_accessPoint;
          v15->_accessPoint = (GEOPBTransitAccessPoint *)v22;
        }
      }
      if ([(GEOTransitEnterExitInfo *)v15->_enterExitInfo hasUncertainArrival]) {
        v15->_isArrivalUncertain = [(GEOTransitEnterExitInfo *)v15->_enterExitInfo uncertainArrival];
      }
    }
    v24 = v15;
  }
  return v15;
}

- (NSString)exitSign
{
  return (NSString *)[(GEOPBTransitAccessPoint *)self->_accessPoint bestExitName];
}

- (BOOL)displayStop
{
  return [(GEOTransitEnterExitInfo *)self->_enterExitInfo displayStop];
}

- (BOOL)hasDisplayStop
{
  return [(GEOTransitEnterExitInfo *)self->_enterExitInfo hasDisplayStop];
}

- ($1AB5FA073B851C12C2339EC22442E995)startGeoCoordinate
{
  if ([(GEOComposedTransitRouteStep *)self maneuver] == 7)
  {
    v3 = [(GEOComposedTransitStationRouteStep *)self accessPoint];

    if (v3)
    {
      v4 = [(GEOComposedTransitStationRouteStep *)self accessPoint];
      v5 = [v4 location];
      [v5 coordinate];
      double v7 = v6;
      double v9 = v8;
      *(double *)&uint64_t v10 = 1.79769313e308;
    }
    else
    {
      id v14 = [(GEOComposedRouteStep *)self getPreviousStep];
      if (v14)
      {
        v15 = [(GEOComposedRouteStep *)self getPreviousStep];
        uint64_t v16 = [v15 endPointIndex];
      }
      else
      {
        uint64_t v16 = 0;
      }

      v4 = [(GEOComposedRouteStep *)self composedRoute];
      [v4 pointAt:v16];
      double v7 = v17;
      double v9 = v18;
      uint64_t v10 = v19;
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)GEOComposedTransitStationRouteStep;
    [(GEOComposedTransitRouteStep *)&v23 startGeoCoordinate];
    double v7 = v11;
    double v9 = v12;
    uint64_t v10 = v13;
  }
  double v20 = v7;
  double v21 = v9;
  double v22 = *(double *)&v10;
  result.var2 = v22;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endGeoCoordinate
{
  if ([(GEOComposedTransitRouteStep *)self maneuver] == 8)
  {
    v3 = [(GEOComposedTransitStationRouteStep *)self accessPoint];

    if (v3)
    {
      v4 = [(GEOComposedTransitStationRouteStep *)self accessPoint];
      v5 = [v4 location];
      [v5 coordinate];
      double v7 = v6;
      double v9 = v8;
      *(double *)&uint64_t v10 = 1.79769313e308;
    }
    else
    {
      id v14 = [(GEOComposedRouteStep *)self getNextStep];
      if (v14)
      {
        v15 = [(GEOComposedRouteStep *)self getNextStep];
        unsigned int v16 = [v15 startPointIndex];
      }
      else
      {
        v15 = [(GEOComposedRouteStep *)self composedRoute];
        unsigned int v16 = [v15 pointCount] - 1;
      }

      v4 = [(GEOComposedRouteStep *)self composedRoute];
      [v4 pointAt:v16];
      double v7 = v17;
      double v9 = v18;
      uint64_t v10 = v19;
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)GEOComposedTransitStationRouteStep;
    [(GEOComposedTransitRouteStep *)&v23 endGeoCoordinate];
    double v7 = v11;
    double v9 = v12;
    uint64_t v10 = v13;
  }
  double v20 = v7;
  double v21 = v9;
  double v22 = *(double *)&v10;
  result.var2 = v22;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTransitStationRouteStep)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedTransitStationRouteStep;
  v5 = [(GEOComposedTransitRouteStep *)&v14 initWithCoder:v4];
  if (v5)
  {
    v5->_expectedTime = [v4 decodeIntegerForKey:@"_expectedTime"];
    v5->_isArrivalUncertain = [v4 decodeBoolForKey:@"_isArrivalUncertain"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_transitTransfer"];
    transitTransfer = v5->_transitTransfer;
    v5->_transitTransfer = (GEOTransitTransferInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_enterExitInfo"];
    enterExitInfo = v5->_enterExitInfo;
    v5->_enterExitInfo = (GEOTransitEnterExitInfo *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accessPoint"];
    accessPoint = v5->_accessPoint;
    v5->_accessPoint = (GEOPBTransitAccessPoint *)v10;

    double v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTransitStationRouteStep;
  id v4 = a3;
  [(GEOComposedTransitRouteStep *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_expectedTime, @"_expectedKey", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_isArrivalUncertain forKey:@"_isArrivalUncertain"];
  [v4 encodeObject:self->_transitTransfer forKey:@"_transitTransfer"];
  [v4 encodeObject:self->_enterExitInfo forKey:@"_enterExitInfo"];
  [v4 encodeObject:self->_accessPoint forKey:@"_accessPoint"];
}

- (GEOPBTransitAccessPoint)accessPoint
{
  return self->_accessPoint;
}

- (GEOTransitTransferInfo)transitTransfer
{
  return self->_transitTransfer;
}

- (BOOL)isArrivalUncertain
{
  return self->_isArrivalUncertain;
}

- (unsigned)expectedTime
{
  return self->_expectedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPoint, 0);
  objc_storeStrong((id *)&self->_enterExitInfo, 0);

  objc_storeStrong((id *)&self->_transitTransfer, 0);
}

@end