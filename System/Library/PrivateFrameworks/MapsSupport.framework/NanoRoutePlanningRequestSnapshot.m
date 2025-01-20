@interface NanoRoutePlanningRequestSnapshot
- (BOOL)isEqual:(id)a3;
- (NSArray)waypoints;
- (NSDate)timestamp;
- (NanoRoutePlanningRequestSnapshot)init;
- (id)deltaFromSnapshot:(id)a3;
- (int)transportType;
- (void)setTimestamp:(id)a3;
- (void)setTransportType:(int)a3;
- (void)setWaypoints:(id)a3;
@end

@implementation NanoRoutePlanningRequestSnapshot

- (NanoRoutePlanningRequestSnapshot)init
{
  v6.receiver = self;
  v6.super_class = (Class)NanoRoutePlanningRequestSnapshot;
  v2 = [(NanoRoutePlanningRequestSnapshot *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSDate date];
    timestamp = v2->_timestamp;
    v2->_timestamp = (NSDate *)v3;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unsigned int v6 = [(NanoRoutePlanningRequestSnapshot *)self transportType];
    if (v6 == [v5 transportType])
    {
      v7 = [(NanoRoutePlanningRequestSnapshot *)self waypoints];
      v8 = [v5 waypoints];
      unsigned __int8 v9 = +[MNComparison isValue:v7 equalTo:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)deltaFromSnapshot:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    unsigned int v6 = objc_alloc_init(NanoRoutePlanningRequestDelta);
    -[NanoRoutePlanningRequestDelta setTransportTypeChanged:](v6, "setTransportTypeChanged:", -[NanoRoutePlanningRequestSnapshot transportType](self, "transportType") != [v5 transportType]);
    v7 = [(NanoRoutePlanningRequestSnapshot *)self waypoints];
    v8 = [v5 waypoints];

    [(NanoRoutePlanningRequestDelta *)v6 setWaypointsChanged:+[MNComparison isValue:v7 equalTo:v8] ^ 1];
  }
  else
  {
    unsigned int v6 = +[NanoRoutePlanningRequestDelta everythingChanged];
  }

  return v6;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end