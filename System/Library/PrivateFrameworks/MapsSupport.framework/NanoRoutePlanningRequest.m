@interface NanoRoutePlanningRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestForDirectionsToCustomRoute:(id)a3 currentLocation:(id)a4 companionRouteContext:(id)a5;
+ (id)requestForDirectionsWithCompanionRouteDetails:(id)a3 companionRouteContext:(id)a4;
+ (id)requestForPlaceholderDirections;
+ (id)requestWithTraceAtPath:(id)a3;
+ (id)requestWithWaypoints:(id)a3 viaTransportType:(int)a4 traits:(id)a5 companionRouteContext:(id)a6;
- (BOOL)startNavigationAutomatically;
- (GEOApplicationAuditToken)auditToken;
- (GEOAutomobileOptions)automobileOptions;
- (GEOCompanionRouteContext)companionRouteContext;
- (GEOCyclingOptions)cyclingOptions;
- (GEOMapServiceTraits)traits;
- (GEOTransitOptions)transitOptions;
- (GEOWalkingOptions)walkingOptions;
- (NSArray)waypoints;
- (NSDate)arrivalDate;
- (NSDate)departureDate;
- (NSString)tracePath;
- (NanoDirectionWaypoint)destinationWaypoint;
- (NanoDirectionWaypoint)originWaypoint;
- (NanoRoutePlanningRequest)init;
- (NanoRoutePlanningRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)requestedCompanionRouteDetails;
- (id)routeAttributes;
- (id)snapshot;
- (int)resolvedTransportType;
- (int)transportType;
- (unint64_t)maximumNumberOfRoutes;
- (unint64_t)preferredMode;
- (void)_addTimepointIfNeededToRouteAttributes:(id)a3;
- (void)_populateCopy:(id)a3;
- (void)_populateRouteAttributes:(id)a3 forTransportType:(int)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setArrivalDate:(id)a3;
- (void)setAutomobileOptions:(id)a3;
- (void)setCompanionRouteContext:(id)a3;
- (void)setCyclingOptions:(id)a3;
- (void)setDepartureDate:(id)a3;
- (void)setMaximumNumberOfRoutes:(unint64_t)a3;
- (void)setPreferredMode:(unint64_t)a3;
- (void)setStartNavigationAutomatically:(BOOL)a3;
- (void)setTracePath:(id)a3;
- (void)setTraits:(id)a3;
- (void)setTransitOptions:(id)a3;
- (void)setTransportType:(int)a3;
- (void)setWalkingOptions:(id)a3;
- (void)setWaypoints:(id)a3;
@end

@implementation NanoRoutePlanningRequest

- (id)routeAttributes
{
  uint64_t v3 = [(NanoRoutePlanningRequest *)self resolvedTransportType];
  v4 = +[GEORouteAttributes defaultRouteAttributesForTransportType:v3];
  [(NanoRoutePlanningRequest *)self _populateRouteAttributes:v4 forTransportType:v3];

  return v4;
}

- (void)_populateRouteAttributes:(id)a3 forTransportType:(int)a4
{
  id v6 = a3;
  id v9 = v6;
  switch(a4)
  {
    case 0:
    case 4:
    case 6:
      v7 = [(NanoRoutePlanningRequest *)self automobileOptions];
      [v9 setAutomobileOptions:v7];
      goto LABEL_5;
    case 1:
      v7 = [(NanoRoutePlanningRequest *)self transitOptions];
      [v9 setTransitOptions:v7];
LABEL_5:

      [(NanoRoutePlanningRequest *)self _addTimepointIfNeededToRouteAttributes:v9];
      goto LABEL_8;
    case 2:
    case 5:
      v8 = [(NanoRoutePlanningRequest *)self walkingOptions];
      [v9 setWalkingOptions:v8];
      goto LABEL_7;
    case 3:
      v8 = [(NanoRoutePlanningRequest *)self cyclingOptions];
      [v9 setCyclingOptions:v8];
LABEL_7:

LABEL_8:
      id v6 = v9;
      break;
    default:
      break;
  }
}

- (void)_addTimepointIfNeededToRouteAttributes:(id)a3
{
  id v4 = a3;
  v5 = [(NanoRoutePlanningRequest *)self departureDate];

  if (v5)
  {
    char v19 = 0;
    __int16 v18 = 0;
    id v6 = [(NanoRoutePlanningRequest *)self departureDate];
    [v6 timeIntervalSinceReferenceDate];
    uint64_t v8 = v7;

    int v9 = 0;
    uint64_t v17 = 0;
    v10 = &v17;
LABEL_5:
    v10[1] = v8;
    *((_DWORD *)v10 + 4) = v9;
    *((unsigned char *)v10 + 20) = 6;
    [v4 setTimepoint:v14];
    goto LABEL_6;
  }
  v11 = [(NanoRoutePlanningRequest *)self arrivalDate];

  if (v11)
  {
    char v16 = 0;
    __int16 v15 = 0;
    v12 = [(NanoRoutePlanningRequest *)self arrivalDate];
    [v12 timeIntervalSinceReferenceDate];
    uint64_t v8 = v13;

    uint64_t v14 = 0;
    int v9 = 1;
    v10 = &v14;
    goto LABEL_5;
  }
LABEL_6:
}

- (NanoRoutePlanningRequest)init
{
  v15.receiver = self;
  v15.super_class = (Class)NanoRoutePlanningRequest;
  v2 = [(NanoRoutePlanningRequest *)&v15 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)GEOApplicationAuditToken);
    id v4 = (GEOApplicationAuditToken *)[v3 initWithProxiedApplicationBundleId:MapsAppBundleId];
    auditToken = v2->_auditToken;
    v2->_auditToken = v4;

    uint64_t v6 = [(GEOApplicationAuditToken *)v2->_auditToken overrideTokenWithOfflineCohortId:@"com.apple.Maps"];
    uint64_t v7 = v2->_auditToken;
    v2->_auditToken = (GEOApplicationAuditToken *)v6;

    v2->_transportType = 4;
    uint64_t v8 = +[GEOCompanionRouteContext context];
    companionRouteContext = v2->_companionRouteContext;
    v2->_companionRouteContext = (GEOCompanionRouteContext *)v8;

    uint64_t v10 = 3;
    if (v2->_transportType == 1) {
      uint64_t v10 = 5;
    }
    v2->_maximumNumberOfRoutes = v10;
    v11 = +[GEOMapService sharedService];
    uint64_t v12 = [v11 defaultTraits];
    traits = v2->_traits;
    v2->_traits = (GEOMapServiceTraits *)v12;
  }
  return v2;
}

+ (id)requestWithWaypoints:(id)a3 viaTransportType:(int)a4 traits:(id)a5 companionRouteContext:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = objc_alloc_init(NanoRoutePlanningMutableRequest);
  id v13 = [v11 copy];

  [(NanoRoutePlanningRequest *)v12 setWaypoints:v13];
  [(NanoRoutePlanningRequest *)v12 setTransportType:v7];
  [(NanoRoutePlanningRequest *)v12 setTraits:v10];

  if (v9) {
    [(NanoRoutePlanningRequest *)v12 setCompanionRouteContext:v9];
  }
  id v14 = [(NanoRoutePlanningMutableRequest *)v12 copy];

  return v14;
}

+ (id)requestForDirectionsToCustomRoute:(id)a3 currentLocation:(id)a4 companionRouteContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v8];

  id v11 = objc_opt_new();
  uint64_t v12 = +[NanoDirectionWaypoint directionWaypointForCurrentLocation:v10];
  v18[0] = v12;
  id v13 = +[NanoDirectionWaypoint directionWaypointToCustomRoute:v9];
  v18[1] = v13;
  id v14 = +[NSArray arrayWithObjects:v18 count:2];
  [v11 setWaypoints:v14];

  id v15 = [v9 transportType];
  [v11 setTransportType:v15];
  [v11 setCompanionRouteContext:v7];

  id v16 = [v11 copy];

  return v16;
}

+ (id)requestForDirectionsWithCompanionRouteDetails:(id)a3 companionRouteContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(NanoRoutePlanningMutableRequest);
  id v8 = [v6 waypoints];
  id v9 = sub_100029020(v8, &stru_1000820B8);

  [(NanoRoutePlanningRequest *)v7 setWaypoints:v9];
  id v10 = [v6 destinationName];
  id v11 = [(NanoRoutePlanningRequest *)v7 destinationWaypoint];
  [v11 setName:v10];

  id v12 = [v6 transportType];
  [(NanoRoutePlanningRequest *)v7 setTransportType:v12];
  [(NanoRoutePlanningRequest *)v7 setCompanionRouteContext:v5];

  id v13 = [(NanoRoutePlanningMutableRequest *)v7 copy];

  return v13;
}

+ (id)requestForPlaceholderDirections
{
  v2 = objc_alloc_init(NanoRoutePlanningMutableRequest);
  [(NanoRoutePlanningRequest *)v2 setCompanionRouteContext:0];
  id v3 = [(NanoRoutePlanningMutableRequest *)v2 copy];

  return v3;
}

- (id)requestedCompanionRouteDetails
{
  id v3 = [(NanoRoutePlanningRequest *)self destinationWaypoint];
  id v4 = [v3 name];

  uint64_t transportType = self->_transportType;
  id v6 = [(NanoRoutePlanningRequest *)self waypoints];
  id v7 = sub_100029020(v6, &stru_1000820F8);

  id v8 = +[GEOCompanionRouteDetails syntheticRouteDetailsWithWaypoints:v7 transportType:transportType destinationName:v4];

  return v8;
}

- (NanoDirectionWaypoint)originWaypoint
{
  v2 = [(NanoRoutePlanningRequest *)self waypoints];
  id v3 = [v2 firstObject];

  return (NanoDirectionWaypoint *)v3;
}

- (NanoDirectionWaypoint)destinationWaypoint
{
  v2 = [(NanoRoutePlanningRequest *)self waypoints];
  id v3 = [v2 lastObject];

  return (NanoDirectionWaypoint *)v3;
}

- (NSArray)waypoints
{
  waypoints = self->_waypoints;
  if (!waypoints)
  {
    self->_waypoints = (NSArray *)&__NSArray0__struct;
    waypoints = (NSArray *)&__NSArray0__struct;
  }

  return waypoints;
}

- (int)resolvedTransportType
{
  if ([(NanoRoutePlanningRequest *)self transportType] == 4)
  {
    uint64_t v3 = GEOGetUserTransportTypePreference();
    if ((unint64_t)(v3 - 1) >= 4) {
      return 0;
    }
    else {
      return dword_100064480[v3 - 1];
    }
  }
  else
  {
    return [(NanoRoutePlanningRequest *)self transportType];
  }
}

- (id)snapshot
{
  uint64_t v3 = objc_alloc_init(NanoRoutePlanningRequestSnapshot);
  [(NanoRoutePlanningRequestSnapshot *)v3 setTransportType:[(NanoRoutePlanningRequest *)self transportType]];
  id v4 = [(NanoRoutePlanningRequest *)self waypoints];
  [(NanoRoutePlanningRequestSnapshot *)v3 setWaypoints:v4];

  return v3;
}

+ (id)requestWithTraceAtPath:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)MNTraceLoader);
  uint64_t v18 = 0;
  id v5 = [v4 loadTraceWithPath:v3 outError:&v18];
  if (v5)
  {
    id v6 = objc_alloc_init(NanoRoutePlanningMutableRequest);
    [(NanoRoutePlanningRequest *)v6 setPreferredMode:3];
    [(NanoRoutePlanningRequest *)v6 setTracePath:v3];
    id v7 = [v5 directions];
    id v8 = [v7 firstObject];

    id v9 = [v8 waypoints];
    id v10 = sub_100029020(v9, &stru_100082138);
    [(NanoRoutePlanningRequest *)v6 setWaypoints:v10];

    id v11 = [v8 request];
    id v12 = [v11 routeAttributes];

    -[NanoRoutePlanningRequest setTransportType:](v6, "setTransportType:", [v12 mainTransportType]);
    id v13 = [v12 automobileOptions];
    [(NanoRoutePlanningRequest *)v6 setAutomobileOptions:v13];

    id v14 = [v12 transitOptions];
    [(NanoRoutePlanningRequest *)v6 setTransitOptions:v14];

    id v15 = [v12 walkingOptions];
    [(NanoRoutePlanningRequest *)v6 setWalkingOptions:v15];

    id v16 = [v12 cyclingOptions];
    [(NanoRoutePlanningRequest *)v6 setCyclingOptions:v16];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(NanoRoutePlanningRequest);
  [(NanoRoutePlanningRequest *)self _populateCopy:v4];
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(NanoRoutePlanningMutableRequest);
  [(NanoRoutePlanningRequest *)self _populateCopy:v4];
  return v4;
}

- (void)_populateCopy:(id)a3
{
  objc_storeStrong((id *)a3 + 2, self->_auditToken);
  id v5 = (id *)a3;
  objc_storeStrong(v5 + 3, self->_companionRouteContext);
  v5[4] = self->_preferredMode;
  objc_storeStrong(v5 + 5, self->_waypoints);
  *((_DWORD *)v5 + 3) = self->_transportType;
  v5[6] = self->_maximumNumberOfRoutes;
  objc_storeStrong(v5 + 7, self->_traits);
  *((unsigned char *)v5 + 8) = self->_startNavigationAutomatically;
  objc_storeStrong(v5 + 8, self->_departureDate);
  objc_storeStrong(v5 + 9, self->_arrivalDate);
  objc_storeStrong(v5 + 10, self->_automobileOptions);
  objc_storeStrong(v5 + 11, self->_transitOptions);
  objc_storeStrong(v5 + 12, self->_walkingOptions);
  objc_storeStrong(v5 + 13, self->_cyclingOptions);
  objc_storeStrong(v5 + 14, self->_tracePath);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NanoRoutePlanningRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)NanoRoutePlanningRequest;
  id v5 = [(NanoRoutePlanningRequest *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_auditToken"];
    auditToken = v5->_auditToken;
    v5->_auditToken = (GEOApplicationAuditToken *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_companionRouteContext"];
    companionRouteContext = v5->_companionRouteContext;
    v5->_companionRouteContext = (GEOCompanionRouteContext *)v8;

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_preferredMode"];
    v5->_preferredMode = (unint64_t)[v10 unsignedIntegerValue];

    uint64_t v11 = objc_opt_class();
    id v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_waypoints"];
    waypoints = v5->_waypoints;
    v5->_waypoints = (NSArray *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_transportType"];
    v5->_uint64_t transportType = [v15 integerValue];

    id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_maximumNumberOfRoutes"];
    v5->_maximumNumberOfRoutes = (unint64_t)[v16 unsignedIntegerValue];

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_traits"];
    traits = v5->_traits;
    v5->_traits = (GEOMapServiceTraits *)v17;

    char v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_startNavigationAutomatically"];
    v5->_startNavigationAutomatically = [v19 BOOLValue];

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_departureDate"];
    departureDate = v5->_departureDate;
    v5->_departureDate = (NSDate *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_arrivalDate"];
    arrivalDate = v5->_arrivalDate;
    v5->_arrivalDate = (NSDate *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_automobileOptions"];
    automobileOptions = v5->_automobileOptions;
    v5->_automobileOptions = (GEOAutomobileOptions *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_transitOptions"];
    transitOptions = v5->_transitOptions;
    v5->_transitOptions = (GEOTransitOptions *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_walkingOptions"];
    walkingOptions = v5->_walkingOptions;
    v5->_walkingOptions = (GEOWalkingOptions *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cyclingOptions"];
    cyclingOptions = v5->_cyclingOptions;
    v5->_cyclingOptions = (GEOCyclingOptions *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tracePath"];
    tracePath = v5->_tracePath;
    v5->_tracePath = (NSString *)v32;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  auditToken = self->_auditToken;
  id v9 = a3;
  [v9 encodeObject:auditToken forKey:@"_auditToken"];
  [v9 encodeObject:self->_companionRouteContext forKey:@"_companionRouteContext"];
  id v5 = +[NSNumber numberWithUnsignedInteger:self->_preferredMode];
  [v9 encodeObject:v5 forKey:@"_preferredMode"];

  [v9 encodeObject:self->_waypoints forKey:@"_waypoints"];
  uint64_t v6 = +[NSNumber numberWithInt:self->_transportType];
  [v9 encodeObject:v6 forKey:@"_transportType"];

  id v7 = +[NSNumber numberWithUnsignedInteger:self->_maximumNumberOfRoutes];
  [v9 encodeObject:v7 forKey:@"_maximumNumberOfRoutes"];

  [v9 encodeObject:self->_traits forKey:@"_traits"];
  uint64_t v8 = +[NSNumber numberWithBool:self->_startNavigationAutomatically];
  [v9 encodeObject:v8 forKey:@"_startNavigationAutomatically"];

  [v9 encodeObject:self->_departureDate forKey:@"_departureDate"];
  [v9 encodeObject:self->_arrivalDate forKey:@"_arrivalDate"];
  [v9 encodeObject:self->_automobileOptions forKey:@"_automobileOptions"];
  [v9 encodeObject:self->_transitOptions forKey:@"_transitOptions"];
  [v9 encodeObject:self->_walkingOptions forKey:@"_walkingOptions"];
  [v9 encodeObject:self->_cyclingOptions forKey:@"_cyclingOptions"];
  [v9 encodeObject:self->_tracePath forKey:@"_tracePath"];
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)NanoRoutePlanningRequest;
  id v3 = [(NanoRoutePlanningRequest *)&v9 description];
  uint64_t v4 = [(NanoRoutePlanningRequest *)self transportType];
  if (v4 >= 7)
  {
    id v5 = +[NSString stringWithFormat:@"(unknown: %i)", v4];
  }
  else
  {
    id v5 = off_100082158[(int)v4];
  }
  uint64_t v6 = [(NanoRoutePlanningRequest *)self waypoints];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (%@, %lu waypoints, auto-start: %d)", v3, v5, [v6 count], -[NanoRoutePlanningRequest startNavigationAutomatically](self, "startNavigationAutomatically"));

  return v7;
}

- (id)debugDescription
{
  v15.receiver = self;
  v15.super_class = (Class)NanoRoutePlanningRequest;
  id v3 = [(NanoRoutePlanningRequest *)&v15 debugDescription];
  uint64_t v4 = [(NanoRoutePlanningRequest *)self transportType];
  if (v4 >= 7)
  {
    id v5 = +[NSString stringWithFormat:@"(unknown: %i)", v4];
  }
  else
  {
    id v5 = off_100082158[(int)v4];
  }
  uint64_t v6 = [(NanoRoutePlanningRequest *)self waypoints];
  id v7 = [v6 count];
  unsigned int v8 = [(NanoRoutePlanningRequest *)self startNavigationAutomatically];
  id v9 = [(NanoRoutePlanningRequest *)self waypoints];
  id v10 = v9;
  if (v9)
  {
    if ([v9 count])
    {
      uint64_t v11 = [v10 componentsJoinedByString:@", "];
      id v12 = +[NSString stringWithFormat:@"<%p> [%@]", v10, v11];
    }
    else
    {
      id v12 = +[NSString stringWithFormat:@"<%p> (empty)", v10];
    }
  }
  else
  {
    id v12 = @"<nil>";
  }

  uint64_t v13 = +[NSString stringWithFormat:@"%@ (%@, %lu waypoints, auto-start: %d)\n\t%@", v3, v5, v7, v8, v12];

  return v13;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (GEOCompanionRouteContext)companionRouteContext
{
  return self->_companionRouteContext;
}

- (void)setCompanionRouteContext:(id)a3
{
}

- (unint64_t)preferredMode
{
  return self->_preferredMode;
}

- (void)setPreferredMode:(unint64_t)a3
{
  self->_preferredMode = a3;
}

- (void)setWaypoints:(id)a3
{
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_uint64_t transportType = a3;
}

- (unint64_t)maximumNumberOfRoutes
{
  return self->_maximumNumberOfRoutes;
}

- (void)setMaximumNumberOfRoutes:(unint64_t)a3
{
  self->_maximumNumberOfRoutes = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (BOOL)startNavigationAutomatically
{
  return self->_startNavigationAutomatically;
}

- (void)setStartNavigationAutomatically:(BOOL)a3
{
  self->_startNavigationAutomatically = a3;
}

- (NSDate)departureDate
{
  return self->_departureDate;
}

- (void)setDepartureDate:(id)a3
{
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (void)setArrivalDate:(id)a3
{
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (void)setAutomobileOptions:(id)a3
{
}

- (GEOTransitOptions)transitOptions
{
  return self->_transitOptions;
}

- (void)setTransitOptions:(id)a3
{
}

- (GEOWalkingOptions)walkingOptions
{
  return self->_walkingOptions;
}

- (void)setWalkingOptions:(id)a3
{
}

- (GEOCyclingOptions)cyclingOptions
{
  return self->_cyclingOptions;
}

- (void)setCyclingOptions:(id)a3
{
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (void)setTracePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_departureDate, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_companionRouteContext, 0);

  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end