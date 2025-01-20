@interface GEOComposedEnrouteNotice
+ (BOOL)supportsSecureCoding;
- ($212C09783140BCCD23384160D545CE0D)routeCoordinate;
- (BOOL)hasGroupIdentifier;
- (BOOL)hasGroupItemHorizontalDisplayOrder;
- (BOOL)hasGroupItemVerticalDisplayOrder;
- (BOOL)hasHighlightDistance;
- (BOOL)hasPriority;
- (GEOComposedEnrouteNotice)initWithCoder:(id)a3;
- (GEOComposedEnrouteNotice)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 onRoute:(id)a6;
- (GEOComposedEnrouteNotice)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 onRoute:(id)a6 withPolylineCoordinate:(id)a7;
- (GEOComposedEnrouteNotice)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 onRoute:(id)a6 withPosition:(id)a7;
- (GEOComposedRouteAnnotation)routeAnnotation;
- (GEOComposedTrafficCamera)trafficCamera;
- (GEOComposedTrafficSignal)trafficSignal;
- (NSArray)guidanceEvents;
- (NSString)identifier;
- (id)description;
- (int)noticeType;
- (unsigned)groupIdentifier;
- (unsigned)groupItemHorizontalDisplayOrder;
- (unsigned)groupItemVerticalDisplayOrder;
- (unsigned)highlightDistance;
- (unsigned)priority;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedEnrouteNotice

- (GEOComposedEnrouteNotice)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 onRoute:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v31.receiver = self;
  v31.super_class = (Class)GEOComposedEnrouteNotice;
  v12 = [(GEOComposedEnrouteNotice *)&v31 init];
  v13 = v12;
  if (v12)
  {
    id v27 = v10;
    p_enrouteNotice = (id *)&v12->_enrouteNotice;
    objc_storeStrong((id *)&v12->_enrouteNotice, a3);
    v29 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15 = [(GEOEnrouteNotice *)v13->_enrouteNotice guidances];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      unint64_t v17 = 0;
      do
      {
        v18 = [*p_enrouteNotice guidances];
        v19 = [v18 objectAtIndexedSubscript:v17];

        if ([v19 hasStartValidDistanceOffsetCm]
          && [v19 hasEndValidDistanceOffsetCm])
        {
          v20 = [GEOComposedGuidanceEvent alloc];
          v21 = [v11 coordinates];
          v22 = [(GEOComposedGuidanceEvent *)v20 initWithGeoGuidanceEvent:v19 step:0 legIndex:a5 coordinates:v21];

          if (v22)
          {
            [v22 setSource:3];
            [v22 setSourceIndex:v17];
            [v22 setEnrouteNoticeIndex:a4];
            [(NSArray *)v29 addObject:v22];
          }
        }
        else
        {
          v22 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedEnrouteNotice");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_ERROR, "Directions response error: a guidance event for an enroute notice must set start_valid_distance_offset_cm and end_valid_distance_offset_cm", buf, 2u);
          }
        }

        ++v17;
        v23 = [*p_enrouteNotice guidances];
        unint64_t v24 = [v23 count];
      }
      while (v17 < v24);
    }
    guidanceEvents = v13->_guidanceEvents;
    v13->_guidanceEvents = v29;

    id v10 = v27;
  }

  return v13;
}

- (GEOComposedEnrouteNotice)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 onRoute:(id)a6 withPosition:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  v14 = [(GEOComposedEnrouteNotice *)self initWithEnrouteNotice:a3 enrouteNoticeIndex:a4 legIndex:a5 onRoute:v13];
  [v12 lat];
  double v16 = v15;
  [v12 lng];
  double v18 = v17;

  v19 = [[GEORouteMatcher alloc] initWithRoute:v13 auditToken:0];
  v14->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)-[GEORouteMatcher closestRouteCoordinateForLocationCoordinate:](v19, "closestRouteCoordinateForLocationCoordinate:", v16, v18);

  return v14;
}

- (GEOComposedEnrouteNotice)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 onRoute:(id)a6 withPolylineCoordinate:(id)a7
{
  result = [(GEOComposedEnrouteNotice *)self initWithEnrouteNotice:a3 enrouteNoticeIndex:a4 legIndex:a5 onRoute:a6];
  result->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a7;
  return result;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(GEOEnrouteNotice *)self->_enrouteNotice hasType])
  {
    v4 = NSString;
    uint64_t v5 = [(GEOEnrouteNotice *)self->_enrouteNotice type];
    if (v5 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E53DB1D0[(int)v5];
    }
    v7 = [v4 stringWithFormat:@"[%@]", v6];
    [v3 addObject:v7];
  }
  if ([(GEOEnrouteNotice *)self->_enrouteNotice hasObjectIdentifier])
  {
    v8 = NSString;
    v9 = [(GEOEnrouteNotice *)self->_enrouteNotice objectIdentifier];
    id v10 = [v8 stringWithFormat:@"(%@)", v9];
    [v3 addObject:v10];
  }
  id v11 = [(GEOComposedEnrouteNotice *)self guidanceEvents];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    id v13 = NSString;
    v14 = [(GEOComposedEnrouteNotice *)self guidanceEvents];
    double v15 = [v13 stringWithFormat:@"Guidance Events: %@", v14];
    [v3 addObject:v15];
  }
  double v16 = [v3 componentsJoinedByString:@" "];

  return v16;
}

- (int)noticeType
{
  return [(GEOEnrouteNotice *)self->_enrouteNotice type];
}

- (NSString)identifier
{
  return [(GEOEnrouteNotice *)self->_enrouteNotice objectIdentifier];
}

- (GEOComposedTrafficCamera)trafficCamera
{
  if ([(GEOEnrouteNotice *)self->_enrouteNotice type] == 1) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }

  return (GEOComposedTrafficCamera *)v3;
}

- (GEOComposedTrafficSignal)trafficSignal
{
  if ([(GEOEnrouteNotice *)self->_enrouteNotice type] == 2) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }

  return (GEOComposedTrafficSignal *)v3;
}

- (GEOComposedRouteAnnotation)routeAnnotation
{
  if ([(GEOEnrouteNotice *)self->_enrouteNotice type] == 3) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }

  return (GEOComposedRouteAnnotation *)v3;
}

- (BOOL)hasHighlightDistance
{
  return [(GEOEnrouteNotice *)self->_enrouteNotice hasHighlightDistance];
}

- (unsigned)highlightDistance
{
  return [(GEOEnrouteNotice *)self->_enrouteNotice highlightDistance];
}

- (BOOL)hasGroupIdentifier
{
  return [(GEOEnrouteNotice *)self->_enrouteNotice hasObjectGroupId];
}

- (unsigned)groupIdentifier
{
  return [(GEOEnrouteNotice *)self->_enrouteNotice objectGroupId];
}

- (BOOL)hasGroupItemHorizontalDisplayOrder
{
  return [(GEOEnrouteNotice *)self->_enrouteNotice hasGroupItemHorizontalDisplayOrder];
}

- (unsigned)groupItemHorizontalDisplayOrder
{
  return [(GEOEnrouteNotice *)self->_enrouteNotice groupItemHorizontalDisplayOrder];
}

- (BOOL)hasGroupItemVerticalDisplayOrder
{
  return [(GEOEnrouteNotice *)self->_enrouteNotice hasGroupItemVerticalDisplayOrder];
}

- (unsigned)groupItemVerticalDisplayOrder
{
  return [(GEOEnrouteNotice *)self->_enrouteNotice groupItemVerticalDisplayOrder];
}

- (BOOL)hasPriority
{
  return [(GEOEnrouteNotice *)self->_enrouteNotice hasPriority];
}

- (unsigned)priority
{
  return [(GEOEnrouteNotice *)self->_enrouteNotice priority];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedEnrouteNotice)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedEnrouteNotice;
  uint64_t v5 = [(GEOComposedEnrouteNotice *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_enrouteNotice"];
    enrouteNotice = v5->_enrouteNotice;
    v5->_enrouteNotice = (GEOEnrouteNotice *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_guidanceEvents"];
    guidanceEvents = v5->_guidanceEvents;
    v5->_guidanceEvents = (NSArray *)v8;

    unint64_t v14 = 0;
    id v10 = (const void *)[v4 decodeBytesForKey:@"_routeCoordinate" returnedLength:&v14];
    if (v14 && v10)
    {
      if (v14 >= 8) {
        size_t v11 = 8;
      }
      else {
        size_t v11 = v14;
      }
      memcpy(&v5->_routeCoordinate, v10, v11);
    }
    uint64_t v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  enrouteNotice = self->_enrouteNotice;
  id v5 = a3;
  [v5 encodeObject:enrouteNotice forKey:@"_enrouteNotice"];
  [v5 encodeObject:self->_guidanceEvents forKey:@"_guidanceEvents"];
  [v5 encodeBytes:&self->_routeCoordinate length:8 forKey:@"_routeCoordinate"];
}

- (NSArray)guidanceEvents
{
  return self->_guidanceEvents;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_routeCoordinate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidanceEvents, 0);

  objc_storeStrong((id *)&self->_enrouteNotice, 0);
}

@end