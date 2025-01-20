@interface GEOWaypointRoute
+ (BOOL)isValid:(id)a3;
+ (Class)arrivalParametersType;
+ (Class)incidentsOnRouteLegsType;
+ (Class)nameType;
+ (Class)routeLegType;
+ (Class)trafficBannerTextType;
+ (Class)trafficCameraType;
+ (Class)trafficSignalType;
- (BOOL)hasDistanceMeters;
- (BOOL)hasDrivingSide;
- (BOOL)hasFeature;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIdentifier;
- (BOOL)hasOutOfMapsAlertsInfo;
- (BOOL)hasRestrictionZoneInfo;
- (BOOL)hasRoutePlanningInfo;
- (BOOL)hasTransportType;
- (BOOL)hasTraversalTimes;
- (BOOL)hasTripTimes;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOOutOfMapsAlertsInfo)outOfMapsAlertsInfo;
- (GEORawRouteGeometry)rawRouteGeometry;
- (GEORestrictionZoneInfo)restrictionZoneInfo;
- (GEORoutePlanningInfo)routePlanningInfo;
- (GEOTraversalTimes)traversalTimes;
- (GEOTraversalTimes)tripTimes;
- (GEOWaypointRoute)init;
- (GEOWaypointRoute)initWithData:(id)a3;
- (GEOWaypointRoute)initWithDictionary:(id)a3;
- (GEOWaypointRoute)initWithJSON:(id)a3;
- (GEOWaypointRouteFeatures)feature;
- (NSMutableArray)arrivalParameters;
- (NSMutableArray)incidentsOnRouteLegs;
- (NSMutableArray)names;
- (NSMutableArray)routeLegs;
- (NSMutableArray)trafficBannerTexts;
- (NSMutableArray)trafficCameras;
- (NSMutableArray)trafficSignals;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_geoTrafficCameras;
- (id)_geoTrafficSignals;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)arrivalParametersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)drivingSideAsString:(int)a3;
- (id)incidentsOnRouteLegsAtIndex:(unint64_t)a3;
- (id)initialPromptTypesAsString:(int)a3;
- (id)jsonRepresentation;
- (id)nameAtIndex:(unint64_t)a3;
- (id)routeLegAtIndex:(unint64_t)a3;
- (id)trafficBannerTextAtIndex:(unint64_t)a3;
- (id)trafficCameraAtIndex:(unint64_t)a3;
- (id)trafficSignalAtIndex:(unint64_t)a3;
- (id)transportTypeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsDrivingSide:(id)a3;
- (int)StringAsInitialPromptTypes:(id)a3;
- (int)StringAsTransportType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)drivingSide;
- (int)initialPromptTypeAtIndex:(unint64_t)a3;
- (int)initialPromptTypes;
- (int)transportType;
- (int)type;
- (unint64_t)arrivalParametersCount;
- (unint64_t)hash;
- (unint64_t)incidentsOnRouteLegsCount;
- (unint64_t)initialPromptTypesCount;
- (unint64_t)namesCount;
- (unint64_t)routeLegsCount;
- (unint64_t)trafficBannerTextsCount;
- (unint64_t)trafficCamerasCount;
- (unint64_t)trafficSignalsCount;
- (unsigned)distanceMeters;
- (unsigned)identifier;
- (void)_addNoFlagsArrivalParameters:(uint64_t)a1;
- (void)_addNoFlagsIncidentsOnRouteLegs:(uint64_t)a1;
- (void)_addNoFlagsName:(uint64_t)a1;
- (void)_addNoFlagsRouteLeg:(uint64_t)a1;
- (void)_addNoFlagsTrafficBannerText:(uint64_t)a1;
- (void)_addNoFlagsTrafficCamera:(uint64_t)a1;
- (void)_addNoFlagsTrafficSignal:(uint64_t)a1;
- (void)_readArrivalParameters;
- (void)_readFeature;
- (void)_readIncidentsOnRouteLegs;
- (void)_readInitialPromptTypes;
- (void)_readNames;
- (void)_readOutOfMapsAlertsInfo;
- (void)_readRestrictionZoneInfo;
- (void)_readRouteLegs;
- (void)_readRoutePlanningInfo;
- (void)_readTrafficBannerTexts;
- (void)_readTrafficCameras;
- (void)_readTrafficSignals;
- (void)_readTraversalTimes;
- (void)_readTripTimes;
- (void)addArrivalParameters:(id)a3;
- (void)addIncidentsOnRouteLegs:(id)a3;
- (void)addInitialPromptType:(int)a3;
- (void)addName:(id)a3;
- (void)addRouteLeg:(id)a3;
- (void)addTrafficBannerText:(id)a3;
- (void)addTrafficCamera:(id)a3;
- (void)addTrafficSignal:(id)a3;
- (void)clearArrivalParameters;
- (void)clearIncidentsOnRouteLegs;
- (void)clearInitialPromptTypes;
- (void)clearNames;
- (void)clearRouteLegs;
- (void)clearTrafficBannerTexts;
- (void)clearTrafficCameras;
- (void)clearTrafficSignals;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArrivalParameters:(id)a3;
- (void)setDistanceMeters:(unsigned int)a3;
- (void)setDrivingSide:(int)a3;
- (void)setFeature:(id)a3;
- (void)setHasDistanceMeters:(BOOL)a3;
- (void)setHasDrivingSide:(BOOL)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setIncidentsOnRouteLegs:(id)a3;
- (void)setInitialPromptTypes:(int *)a3 count:(unint64_t)a4;
- (void)setNames:(id)a3;
- (void)setOutOfMapsAlertsInfo:(id)a3;
- (void)setRestrictionZoneInfo:(id)a3;
- (void)setRouteLegs:(id)a3;
- (void)setRoutePlanningInfo:(id)a3;
- (void)setTrafficBannerTexts:(id)a3;
- (void)setTrafficCameras:(id)a3;
- (void)setTrafficSignals:(id)a3;
- (void)setTransportType:(int)a3;
- (void)setTraversalTimes:(id)a3;
- (void)setTripTimes:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWaypointRoute

- (GEORawRouteGeometry)rawRouteGeometry
{
  v2 = [[GEORawRouteGeometry alloc] initWithGeoWaypointRoute:self];

  return v2;
}

- (GEOWaypointRoute)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWaypointRoute;
  v2 = [(GEOWaypointRoute *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWaypointRoute)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWaypointRoute;
  v3 = [(GEOWaypointRoute *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOWaypointRoute;
  [(GEOWaypointRoute *)&v3 dealloc];
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100004u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  if (a3) {
    int v3 = 1048580;
  }
  else {
    int v3 = 0x100000;
  }
  self->_flags = ($EFA9D2CD557EBB9C5A9F4F80D3257E6E)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasIdentifier
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readRouteLegs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteLegs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)routeLegs
{
  -[GEOWaypointRoute _readRouteLegs]((uint64_t)self);
  routeLegs = self->_routeLegs;

  return routeLegs;
}

- (void)setRouteLegs:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  routeLegs = self->_routeLegs;
  self->_routeLegs = v4;
}

- (void)clearRouteLegs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  routeLegs = self->_routeLegs;

  [(NSMutableArray *)routeLegs removeAllObjects];
}

- (void)addRouteLeg:(id)a3
{
  id v4 = a3;
  -[GEOWaypointRoute _readRouteLegs]((uint64_t)self);
  -[GEOWaypointRoute _addNoFlagsRouteLeg:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsRouteLeg:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      id v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)routeLegsCount
{
  -[GEOWaypointRoute _readRouteLegs]((uint64_t)self);
  routeLegs = self->_routeLegs;

  return [(NSMutableArray *)routeLegs count];
}

- (id)routeLegAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readRouteLegs]((uint64_t)self);
  routeLegs = self->_routeLegs;

  return (id)[(NSMutableArray *)routeLegs objectAtIndex:a3];
}

+ (Class)routeLegType
{
  return (Class)objc_opt_class();
}

- (int)transportType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 8) != 0) {
    return self->_transportType;
  }
  else {
    return 0;
  }
}

- (void)setTransportType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100008u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  if (a3) {
    int v3 = 1048584;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = ($EFA9D2CD557EBB9C5A9F4F80D3257E6E)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTransportType
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E0868[a3];
  }

  return v3;
}

- (int)StringAsTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)drivingSide
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 2) != 0) {
    return self->_drivingSide;
  }
  else {
    return 0;
  }
}

- (void)setDrivingSide:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100002u;
  self->_drivingSide = a3;
}

- (void)setHasDrivingSide:(BOOL)a3
{
  if (a3) {
    int v3 = 1048578;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = ($EFA9D2CD557EBB9C5A9F4F80D3257E6E)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasDrivingSide
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)drivingSideAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"LEFT_SIDE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"RIGHT_SIDE";
  }
  return v4;
}

- (int)StringAsDrivingSide:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RIGHT_SIDE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"LEFT_SIDE"];
  }

  return v4;
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100010u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    int v3 = 1048592;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = ($EFA9D2CD557EBB9C5A9F4F80D3257E6E)(*(_DWORD *)&self->_flags & 0xFFEFFFEF | v3);
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E08A0[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAIN_ROUTE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ALTERNATE_ROUTE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONTINGENCY_ROUTE_ALTERNATE_ORIGIN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONTINGENCY_ROUTE_MIDDLE_OF_ROUTE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAIN_NON_RECOMMENDED_ROUTE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ALTERNATE_NON_RECOMMENDED_ROUTE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)names
{
  -[GEOWaypointRoute _readNames]((uint64_t)self);
  names = self->_names;

  return names;
}

- (void)setNames:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  names = self->_names;
  self->_names = v4;
}

- (void)clearNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  names = self->_names;

  [(NSMutableArray *)names removeAllObjects];
}

- (void)addName:(id)a3
{
  id v4 = a3;
  -[GEOWaypointRoute _readNames]((uint64_t)self);
  -[GEOWaypointRoute _addNoFlagsName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)namesCount
{
  -[GEOWaypointRoute _readNames]((uint64_t)self);
  names = self->_names;

  return [(NSMutableArray *)names count];
}

- (id)nameAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readNames]((uint64_t)self);
  names = self->_names;

  return (id)[(NSMutableArray *)names objectAtIndex:a3];
}

+ (Class)nameType
{
  return (Class)objc_opt_class();
}

- (unsigned)distanceMeters
{
  return self->_distanceMeters;
}

- (void)setDistanceMeters:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100001u;
  self->_distanceMeters = a3;
}

- (void)setHasDistanceMeters:(BOOL)a3
{
  self->_$EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = ($EFA9D2CD557EBB9C5A9F4F80D3257E6E)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x100000);
}

- (BOOL)hasDistanceMeters
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readTraversalTimes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 186) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTraversalTimes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTraversalTimes
{
  return self->_traversalTimes != 0;
}

- (GEOTraversalTimes)traversalTimes
{
  -[GEOWaypointRoute _readTraversalTimes]((uint64_t)self);
  traversalTimes = self->_traversalTimes;

  return traversalTimes;
}

- (void)setTraversalTimes:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x140000u;
  objc_storeStrong((id *)&self->_traversalTimes, a3);
}

- (void)_readTripTimes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 186) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTripTimes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTripTimes
{
  return self->_tripTimes != 0;
}

- (GEOTraversalTimes)tripTimes
{
  -[GEOWaypointRoute _readTripTimes]((uint64_t)self);
  tripTimes = self->_tripTimes;

  return tripTimes;
}

- (void)setTripTimes:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x180000u;
  objc_storeStrong((id *)&self->_tripTimes, a3);
}

- (void)_readFeature
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeature_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasFeature
{
  return self->_feature != 0;
}

- (GEOWaypointRouteFeatures)feature
{
  -[GEOWaypointRoute _readFeature]((uint64_t)self);
  feature = self->_feature;

  return feature;
}

- (void)setFeature:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x100100u;
  objc_storeStrong((id *)&self->_feature, a3);
}

- (void)_readRoutePlanningInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutePlanningInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasRoutePlanningInfo
{
  return self->_routePlanningInfo != 0;
}

- (GEORoutePlanningInfo)routePlanningInfo
{
  -[GEOWaypointRoute _readRoutePlanningInfo]((uint64_t)self);
  routePlanningInfo = self->_routePlanningInfo;

  return routePlanningInfo;
}

- (void)setRoutePlanningInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x104000u;
  objc_storeStrong((id *)&self->_routePlanningInfo, a3);
}

- (void)_readArrivalParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 184) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArrivalParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)arrivalParameters
{
  -[GEOWaypointRoute _readArrivalParameters]((uint64_t)self);
  arrivalParameters = self->_arrivalParameters;

  return arrivalParameters;
}

- (void)setArrivalParameters:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  arrivalParameters = self->_arrivalParameters;
  self->_arrivalParameters = v4;
}

- (void)clearArrivalParameters
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  arrivalParameters = self->_arrivalParameters;

  [(NSMutableArray *)arrivalParameters removeAllObjects];
}

- (void)addArrivalParameters:(id)a3
{
  id v4 = a3;
  -[GEOWaypointRoute _readArrivalParameters]((uint64_t)self);
  -[GEOWaypointRoute _addNoFlagsArrivalParameters:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsArrivalParameters:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)arrivalParametersCount
{
  -[GEOWaypointRoute _readArrivalParameters]((uint64_t)self);
  arrivalParameters = self->_arrivalParameters;

  return [(NSMutableArray *)arrivalParameters count];
}

- (id)arrivalParametersAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readArrivalParameters]((uint64_t)self);
  arrivalParameters = self->_arrivalParameters;

  return (id)[(NSMutableArray *)arrivalParameters objectAtIndex:a3];
}

+ (Class)arrivalParametersType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficSignals
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 186) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficSignals_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)trafficSignals
{
  -[GEOWaypointRoute _readTrafficSignals]((uint64_t)self);
  trafficSignals = self->_trafficSignals;

  return trafficSignals;
}

- (void)setTrafficSignals:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  trafficSignals = self->_trafficSignals;
  self->_trafficSignals = v4;
}

- (void)clearTrafficSignals
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  trafficSignals = self->_trafficSignals;

  [(NSMutableArray *)trafficSignals removeAllObjects];
}

- (void)addTrafficSignal:(id)a3
{
  id v4 = a3;
  -[GEOWaypointRoute _readTrafficSignals]((uint64_t)self);
  -[GEOWaypointRoute _addNoFlagsTrafficSignal:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsTrafficSignal:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 128);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v5;

      id v4 = *(void **)(a1 + 128);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)trafficSignalsCount
{
  -[GEOWaypointRoute _readTrafficSignals]((uint64_t)self);
  trafficSignals = self->_trafficSignals;

  return [(NSMutableArray *)trafficSignals count];
}

- (id)trafficSignalAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readTrafficSignals]((uint64_t)self);
  trafficSignals = self->_trafficSignals;

  return (id)[(NSMutableArray *)trafficSignals objectAtIndex:a3];
}

+ (Class)trafficSignalType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficCameras
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 186) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficCameras_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)trafficCameras
{
  -[GEOWaypointRoute _readTrafficCameras]((uint64_t)self);
  trafficCameras = self->_trafficCameras;

  return trafficCameras;
}

- (void)setTrafficCameras:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  trafficCameras = self->_trafficCameras;
  self->_trafficCameras = v4;
}

- (void)clearTrafficCameras
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  trafficCameras = self->_trafficCameras;

  [(NSMutableArray *)trafficCameras removeAllObjects];
}

- (void)addTrafficCamera:(id)a3
{
  id v4 = a3;
  -[GEOWaypointRoute _readTrafficCameras]((uint64_t)self);
  -[GEOWaypointRoute _addNoFlagsTrafficCamera:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsTrafficCamera:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 120);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v5;

      id v4 = *(void **)(a1 + 120);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)trafficCamerasCount
{
  -[GEOWaypointRoute _readTrafficCameras]((uint64_t)self);
  trafficCameras = self->_trafficCameras;

  return [(NSMutableArray *)trafficCameras count];
}

- (id)trafficCameraAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readTrafficCameras]((uint64_t)self);
  trafficCameras = self->_trafficCameras;

  return (id)[(NSMutableArray *)trafficCameras objectAtIndex:a3];
}

+ (Class)trafficCameraType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidentsOnRouteLegs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentsOnRouteLegs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)incidentsOnRouteLegs
{
  -[GEOWaypointRoute _readIncidentsOnRouteLegs]((uint64_t)self);
  incidentsOnRouteLegs = self->_incidentsOnRouteLegs;

  return incidentsOnRouteLegs;
}

- (void)setIncidentsOnRouteLegs:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  incidentsOnRouteLegs = self->_incidentsOnRouteLegs;
  self->_incidentsOnRouteLegs = v4;
}

- (void)clearIncidentsOnRouteLegs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  incidentsOnRouteLegs = self->_incidentsOnRouteLegs;

  [(NSMutableArray *)incidentsOnRouteLegs removeAllObjects];
}

- (void)addIncidentsOnRouteLegs:(id)a3
{
  id v4 = a3;
  -[GEOWaypointRoute _readIncidentsOnRouteLegs]((uint64_t)self);
  -[GEOWaypointRoute _addNoFlagsIncidentsOnRouteLegs:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsIncidentsOnRouteLegs:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)incidentsOnRouteLegsCount
{
  -[GEOWaypointRoute _readIncidentsOnRouteLegs]((uint64_t)self);
  incidentsOnRouteLegs = self->_incidentsOnRouteLegs;

  return [(NSMutableArray *)incidentsOnRouteLegs count];
}

- (id)incidentsOnRouteLegsAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readIncidentsOnRouteLegs]((uint64_t)self);
  incidentsOnRouteLegs = self->_incidentsOnRouteLegs;

  return (id)[(NSMutableArray *)incidentsOnRouteLegs objectAtIndex:a3];
}

+ (Class)incidentsOnRouteLegsType
{
  return (Class)objc_opt_class();
}

- (void)_readRestrictionZoneInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRestrictionZoneInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasRestrictionZoneInfo
{
  return self->_restrictionZoneInfo != 0;
}

- (GEORestrictionZoneInfo)restrictionZoneInfo
{
  -[GEOWaypointRoute _readRestrictionZoneInfo]((uint64_t)self);
  restrictionZoneInfo = self->_restrictionZoneInfo;

  return restrictionZoneInfo;
}

- (void)setRestrictionZoneInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x101000u;
  objc_storeStrong((id *)&self->_restrictionZoneInfo, a3);
}

- (void)_readOutOfMapsAlertsInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOutOfMapsAlertsInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasOutOfMapsAlertsInfo
{
  return self->_outOfMapsAlertsInfo != 0;
}

- (GEOOutOfMapsAlertsInfo)outOfMapsAlertsInfo
{
  -[GEOWaypointRoute _readOutOfMapsAlertsInfo]((uint64_t)self);
  outOfMapsAlertsInfo = self->_outOfMapsAlertsInfo;

  return outOfMapsAlertsInfo;
}

- (void)setOutOfMapsAlertsInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x100800u;
  objc_storeStrong((id *)&self->_outOfMapsAlertsInfo, a3);
}

- (void)_readTrafficBannerTexts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 185) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficBannerTexts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)trafficBannerTexts
{
  -[GEOWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  trafficBannerTexts = self->_trafficBannerTexts;

  return trafficBannerTexts;
}

- (void)setTrafficBannerTexts:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  trafficBannerTexts = self->_trafficBannerTexts;
  self->_trafficBannerTexts = v4;
}

- (void)clearTrafficBannerTexts
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  trafficBannerTexts = self->_trafficBannerTexts;

  [(NSMutableArray *)trafficBannerTexts removeAllObjects];
}

- (void)addTrafficBannerText:(id)a3
{
  id v4 = a3;
  -[GEOWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  -[GEOWaypointRoute _addNoFlagsTrafficBannerText:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsTrafficBannerText:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 112);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      id v4 = *(void **)(a1 + 112);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)trafficBannerTextsCount
{
  -[GEOWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  trafficBannerTexts = self->_trafficBannerTexts;

  return [(NSMutableArray *)trafficBannerTexts count];
}

- (id)trafficBannerTextAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  trafficBannerTexts = self->_trafficBannerTexts;

  return (id)[(NSMutableArray *)trafficBannerTexts objectAtIndex:a3];
}

+ (Class)trafficBannerTextType
{
  return (Class)objc_opt_class();
}

- (void)_readInitialPromptTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 184) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInitialPromptTypes_tags_9045);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (unint64_t)initialPromptTypesCount
{
  return self->_initialPromptTypes.count;
}

- (int)initialPromptTypes
{
  return self->_initialPromptTypes.list;
}

- (void)clearInitialPromptTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;

  PBRepeatedInt32Clear();
}

- (void)addInitialPromptType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (int)initialPromptTypeAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readInitialPromptTypes]((uint64_t)self);
  p_initialPromptTypes = &self->_initialPromptTypes;
  unint64_t count = self->_initialPromptTypes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_initialPromptTypes->list[a3];
}

- (void)setInitialPromptTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;

  MEMORY[0x1F4147390](&self->_initialPromptTypes, a3, a4);
}

- (id)initialPromptTypesAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"PROMPT_DISCOVER_INCIDENTS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"PROMPT_UNKNOWN";
  }
  return v4;
}

- (int)StringAsInitialPromptTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PROMPT_UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"PROMPT_DISCOVER_INCIDENTS"];
  }

  return v4;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWaypointRoute;
  int v4 = [(GEOWaypointRoute *)&v8 description];
  id v5 = [(GEOWaypointRoute *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWaypointRoute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v119 = 0;
    goto LABEL_183;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)(a1 + 184) & 4) != 0)
  {
    id v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 172)];
    [v4 setObject:v5 forKey:@"identifier"];
  }
  v121 = v4;
  if ([*(id *)(a1 + 96) count])
  {
    objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    id v7 = *(id *)(a1 + 96);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v148 objects:v158 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v149;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v149 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v148 + 1) + 8 * i);
          if (a2) {
            [v12 jsonRepresentation];
          }
          else {
          id v13 = [v12 dictionaryRepresentation];
          }

          [v6 addObject:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v148 objects:v158 count:16];
      }
      while (v9);
    }

    if (a2) {
      v14 = @"routeLeg";
    }
    else {
      v14 = @"route_leg";
    }
    int v4 = v121;
    [v121 setObject:v6 forKey:v14];
  }
  int v15 = *(_DWORD *)(a1 + 184);
  if ((v15 & 8) == 0)
  {
    if ((v15 & 2) == 0) {
      goto LABEL_21;
    }
LABEL_30:
    int v19 = *(_DWORD *)(a1 + 168);
    if (v19)
    {
      if (v19 == 1)
      {
        v20 = @"LEFT_SIDE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 168));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v20 = @"RIGHT_SIDE";
    }
    if (a2) {
      v21 = @"drivingSide";
    }
    else {
      v21 = @"driving_side";
    }
    [v4 setObject:v20 forKey:v21];

    if ((*(_DWORD *)(a1 + 184) & 0x10) == 0) {
      goto LABEL_43;
    }
    goto LABEL_39;
  }
  uint64_t v16 = *(int *)(a1 + 176);
  if (v16 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 176));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E53E0868[v16];
  }
  if (a2) {
    v18 = @"transportType";
  }
  else {
    v18 = @"transport_type";
  }
  [v4 setObject:v17 forKey:v18];

  int v15 = *(_DWORD *)(a1 + 184);
  if ((v15 & 2) != 0) {
    goto LABEL_30;
  }
LABEL_21:
  if ((v15 & 0x10) != 0)
  {
LABEL_39:
    uint64_t v22 = *(int *)(a1 + 180);
    if (v22 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 180));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E53E08A0[v22];
    }
    [v4 setObject:v23 forKey:@"type"];
  }
LABEL_43:
  if ([*(id *)(a1 + 72) count])
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    long long v144 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    id v25 = *(id *)(a1 + 72);
    uint64_t v26 = [v25 countByEnumeratingWithState:&v144 objects:v157 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v145;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v145 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v144 + 1) + 8 * j);
          if (a2) {
            [v30 jsonRepresentation];
          }
          else {
          id v31 = [v30 dictionaryRepresentation];
          }

          [v24 addObject:v31];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v144 objects:v157 count:16];
      }
      while (v27);
    }

    int v4 = v121;
    [v121 setObject:v24 forKey:@"name"];
  }
  if (*(unsigned char *)(a1 + 184))
  {
    v32 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 164)];
    if (a2) {
      v33 = @"distanceMeters";
    }
    else {
      v33 = @"distance_meters";
    }
    [v4 setObject:v32 forKey:v33];
  }
  v34 = [(id)a1 traversalTimes];
  v35 = v34;
  if (v34)
  {
    if (a2)
    {
      v36 = [v34 jsonRepresentation];
      v37 = @"traversalTimes";
    }
    else
    {
      v36 = [v34 dictionaryRepresentation];
      v37 = @"traversal_times";
    }
    id v38 = v36;

    [v4 setObject:v38 forKey:v37];
  }

  v39 = [(id)a1 tripTimes];
  v40 = v39;
  if (v39)
  {
    if (a2)
    {
      v41 = [v39 jsonRepresentation];
      v42 = @"tripTimes";
    }
    else
    {
      v41 = [v39 dictionaryRepresentation];
      v42 = @"trip_times";
    }
    id v43 = v41;

    [v4 setObject:v43 forKey:v42];
  }

  v44 = [(id)a1 feature];
  v45 = v44;
  if (v44)
  {
    if (a2) {
      [v44 jsonRepresentation];
    }
    else {
    id v46 = [v44 dictionaryRepresentation];
    }

    [v4 setObject:v46 forKey:@"feature"];
  }

  v47 = [(id)a1 routePlanningInfo];
  v48 = v47;
  if (v47)
  {
    if (a2)
    {
      v49 = [v47 jsonRepresentation];
      v50 = @"routePlanningInfo";
    }
    else
    {
      v49 = [v47 dictionaryRepresentation];
      v50 = @"route_planning_info";
    }
    id v51 = v49;

    [v4 setObject:v51 forKey:v50];
  }

  if ([*(id *)(a1 + 48) count])
  {
    v52 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v140 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    id v53 = *(id *)(a1 + 48);
    uint64_t v54 = [v53 countByEnumeratingWithState:&v140 objects:v156 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v141;
      do
      {
        for (uint64_t k = 0; k != v55; ++k)
        {
          if (*(void *)v141 != v56) {
            objc_enumerationMutation(v53);
          }
          v58 = *(void **)(*((void *)&v140 + 1) + 8 * k);
          if (a2) {
            [v58 jsonRepresentation];
          }
          else {
          id v59 = [v58 dictionaryRepresentation];
          }

          [v52 addObject:v59];
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v140 objects:v156 count:16];
      }
      while (v55);
    }

    if (a2) {
      v60 = @"arrivalParameters";
    }
    else {
      v60 = @"arrival_parameters";
    }
    int v4 = v121;
    [v121 setObject:v52 forKey:v60];
  }
  if ([*(id *)(a1 + 128) count])
  {
    v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    long long v136 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id v62 = *(id *)(a1 + 128);
    uint64_t v63 = [v62 countByEnumeratingWithState:&v136 objects:v155 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v137;
      do
      {
        for (uint64_t m = 0; m != v64; ++m)
        {
          if (*(void *)v137 != v65) {
            objc_enumerationMutation(v62);
          }
          v67 = *(void **)(*((void *)&v136 + 1) + 8 * m);
          if (a2) {
            [v67 jsonRepresentation];
          }
          else {
          id v68 = [v67 dictionaryRepresentation];
          }

          [v61 addObject:v68];
        }
        uint64_t v64 = [v62 countByEnumeratingWithState:&v136 objects:v155 count:16];
      }
      while (v64);
    }

    if (a2) {
      v69 = @"trafficSignal";
    }
    else {
      v69 = @"traffic_signal";
    }
    int v4 = v121;
    [v121 setObject:v61 forKey:v69];
  }
  if ([*(id *)(a1 + 120) count])
  {
    v70 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    id v71 = *(id *)(a1 + 120);
    uint64_t v72 = [v71 countByEnumeratingWithState:&v132 objects:v154 count:16];
    if (v72)
    {
      uint64_t v73 = v72;
      uint64_t v74 = *(void *)v133;
      do
      {
        for (uint64_t n = 0; n != v73; ++n)
        {
          if (*(void *)v133 != v74) {
            objc_enumerationMutation(v71);
          }
          v76 = *(void **)(*((void *)&v132 + 1) + 8 * n);
          if (a2) {
            [v76 jsonRepresentation];
          }
          else {
          id v77 = [v76 dictionaryRepresentation];
          }

          [v70 addObject:v77];
        }
        uint64_t v73 = [v71 countByEnumeratingWithState:&v132 objects:v154 count:16];
      }
      while (v73);
    }

    if (a2) {
      v78 = @"trafficCamera";
    }
    else {
      v78 = @"traffic_camera";
    }
    int v4 = v121;
    [v121 setObject:v70 forKey:v78];
  }
  if ([*(id *)(a1 + 64) count])
  {
    v79 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v80 = *(id *)(a1 + 64);
    uint64_t v81 = [v80 countByEnumeratingWithState:&v128 objects:v153 count:16];
    if (v81)
    {
      uint64_t v82 = v81;
      uint64_t v83 = *(void *)v129;
      do
      {
        for (iuint64_t i = 0; ii != v82; ++ii)
        {
          if (*(void *)v129 != v83) {
            objc_enumerationMutation(v80);
          }
          v85 = *(void **)(*((void *)&v128 + 1) + 8 * ii);
          if (a2) {
            [v85 jsonRepresentation];
          }
          else {
          id v86 = [v85 dictionaryRepresentation];
          }

          [v79 addObject:v86];
        }
        uint64_t v82 = [v80 countByEnumeratingWithState:&v128 objects:v153 count:16];
      }
      while (v82);
    }

    if (a2) {
      v87 = @"incidentsOnRouteLegs";
    }
    else {
      v87 = @"incidents_on_route_legs";
    }
    int v4 = v121;
    [v121 setObject:v79 forKey:v87];
  }
  v88 = [(id)a1 restrictionZoneInfo];
  v89 = v88;
  if (v88)
  {
    if (a2)
    {
      v90 = [v88 jsonRepresentation];
      v91 = @"restrictionZoneInfo";
    }
    else
    {
      v90 = [v88 dictionaryRepresentation];
      v91 = @"restriction_zone_info";
    }
    id v92 = v90;

    [v4 setObject:v92 forKey:v91];
  }

  v93 = [(id)a1 outOfMapsAlertsInfo];
  v94 = v93;
  if (v93)
  {
    if (a2)
    {
      v95 = [v93 jsonRepresentation];
      v96 = @"outOfMapsAlertsInfo";
    }
    else
    {
      v95 = [v93 dictionaryRepresentation];
      v96 = @"out_of_maps_alerts_info";
    }
    id v97 = v95;

    [v4 setObject:v97 forKey:v96];
  }

  if ([*(id *)(a1 + 112) count])
  {
    v98 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    id v99 = *(id *)(a1 + 112);
    uint64_t v100 = [v99 countByEnumeratingWithState:&v124 objects:v152 count:16];
    if (v100)
    {
      uint64_t v101 = v100;
      uint64_t v102 = *(void *)v125;
      do
      {
        for (juint64_t j = 0; jj != v101; ++jj)
        {
          if (*(void *)v125 != v102) {
            objc_enumerationMutation(v99);
          }
          v104 = *(void **)(*((void *)&v124 + 1) + 8 * jj);
          if (a2) {
            [v104 jsonRepresentation];
          }
          else {
          id v105 = [v104 dictionaryRepresentation];
          }

          [v98 addObject:v105];
        }
        uint64_t v101 = [v99 countByEnumeratingWithState:&v124 objects:v152 count:16];
      }
      while (v101);
    }

    if (a2) {
      v106 = @"trafficBannerText";
    }
    else {
      v106 = @"traffic_banner_text";
    }
    int v4 = v121;
    [v121 setObject:v98 forKey:v106];
  }
  if (*(void *)(a1 + 32))
  {
    v107 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v108 = (void *)(a1 + 24);
    if (*(void *)(a1 + 32))
    {
      unint64_t v109 = 0;
      do
      {
        uint64_t v110 = *(unsigned int *)(*v108 + 4 * v109);
        if (v110)
        {
          if (v110 == 1)
          {
            v111 = @"PROMPT_DISCOVER_INCIDENTS";
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v110);
            v111 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v111 = @"PROMPT_UNKNOWN";
        }
        [v107 addObject:v111];

        ++v109;
        v108 = (void *)(a1 + 24);
      }
      while (v109 < *(void *)(a1 + 32));
    }
    if (a2) {
      v112 = @"initialPromptType";
    }
    else {
      v112 = @"initial_prompt_type";
    }
    int v4 = v121;
    [v121 setObject:v107 forKey:v112];
  }
  v113 = *(void **)(a1 + 16);
  if (v113)
  {
    v114 = [v113 dictionaryRepresentation];
    v115 = v114;
    if (a2)
    {
      v116 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v114, "count"));
      v122[0] = MEMORY[0x1E4F143A8];
      v122[1] = 3221225472;
      v122[2] = __46__GEOWaypointRoute__dictionaryRepresentation___block_invoke;
      v122[3] = &unk_1E53D8860;
      id v117 = v116;
      id v123 = v117;
      [v115 enumerateKeysAndObjectsUsingBlock:v122];
      id v118 = v117;

      v115 = v118;
    }
    [v4 setObject:v115 forKey:@"Unknown Fields"];
  }
  id v119 = v4;

LABEL_183:

  return v119;
}

- (id)jsonRepresentation
{
  return -[GEOWaypointRoute _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOWaypointRoute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOWaypointRoute)initWithDictionary:(id)a3
{
  return (GEOWaypointRoute *)-[GEOWaypointRoute _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v184 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_244;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_244;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIdentifier:", objc_msgSend(v6, "unsignedIntValue"));
  }

  if (a3) {
    id v7 = @"routeLeg";
  }
  else {
    id v7 = @"route_leg";
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  id v143 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v174 = 0u;
    long long v175 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v172 objects:v183 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v173;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v173 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v172 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v15 = [GEORoute alloc];
            if (a3) {
              uint64_t v16 = [(GEORoute *)v15 initWithJSON:v14];
            }
            else {
              uint64_t v16 = [(GEORoute *)v15 initWithDictionary:v14];
            }
            v17 = (void *)v16;
            [a1 addRouteLeg:v16];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v172 objects:v183 count:16];
      }
      while (v11);
    }

    id v5 = v143;
  }

  if (a3) {
    v18 = @"transportType";
  }
  else {
    v18 = @"transport_type";
  }
  int v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v19;
    if ([v20 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v21 = 0;
    }
    else if ([v20 isEqualToString:@"TRANSIT"])
    {
      uint64_t v21 = 1;
    }
    else if ([v20 isEqualToString:@"WALKING"])
    {
      uint64_t v21 = 2;
    }
    else if ([v20 isEqualToString:@"BICYCLE"])
    {
      uint64_t v21 = 3;
    }
    else if ([v20 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v21 = 4;
    }
    else if ([v20 isEqualToString:@"FERRY"])
    {
      uint64_t v21 = 5;
    }
    else if ([v20 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v21 = 6;
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_45;
    }
    uint64_t v21 = [v19 intValue];
  }
  [a1 setTransportType:v21];
LABEL_45:

  if (a3) {
    uint64_t v22 = @"drivingSide";
  }
  else {
    uint64_t v22 = @"driving_side";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v23;
    if ([v24 isEqualToString:@"RIGHT_SIDE"]) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = [v24 isEqualToString:@"LEFT_SIDE"];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_56;
    }
    uint64_t v25 = [v23 intValue];
  }
  [a1 setDrivingSide:v25];
LABEL_56:

  uint64_t v26 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = v26;
    if ([v27 isEqualToString:@"MAIN_ROUTE"])
    {
      uint64_t v28 = 0;
    }
    else if ([v27 isEqualToString:@"ALTERNATE_ROUTE"])
    {
      uint64_t v28 = 1;
    }
    else if ([v27 isEqualToString:@"CONTINGENCY_ROUTE_ALTERNATE_ORIGIN"])
    {
      uint64_t v28 = 2;
    }
    else if ([v27 isEqualToString:@"CONTINGENCY_ROUTE_MIDDLE_OF_ROUTE"])
    {
      uint64_t v28 = 3;
    }
    else if ([v27 isEqualToString:@"MAIN_NON_RECOMMENDED_ROUTE"])
    {
      uint64_t v28 = 4;
    }
    else if ([v27 isEqualToString:@"ALTERNATE_NON_RECOMMENDED_ROUTE"])
    {
      uint64_t v28 = 5;
    }
    else
    {
      uint64_t v28 = 0;
    }

    goto LABEL_73;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v28 = [v26 intValue];
LABEL_73:
    [a1 setType:v28];
  }

  v29 = [v5 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v170 = 0u;
    long long v171 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    long long v136 = v29;
    id v30 = v29;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v168 objects:v182 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v169;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v169 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v168 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v36 = [GEONameInfo alloc];
            if (a3) {
              uint64_t v37 = [(GEONameInfo *)v36 initWithJSON:v35];
            }
            else {
              uint64_t v37 = [(GEONameInfo *)v36 initWithDictionary:v35];
            }
            id v38 = (void *)v37;
            objc_msgSend(a1, "addName:", v37, v136);
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v168 objects:v182 count:16];
      }
      while (v32);
    }

    v29 = v136;
    id v5 = v143;
  }

  if (a3) {
    v39 = @"distanceMeters";
  }
  else {
    v39 = @"distance_meters";
  }
  v40 = objc_msgSend(v5, "objectForKeyedSubscript:", v39, v136);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDistanceMeters:", objc_msgSend(v40, "unsignedIntValue"));
  }

  if (a3) {
    v41 = @"traversalTimes";
  }
  else {
    v41 = @"traversal_times";
  }
  v42 = [v5 objectForKeyedSubscript:v41];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v43 = [GEOTraversalTimes alloc];
    if (a3) {
      uint64_t v44 = [(GEOTraversalTimes *)v43 initWithJSON:v42];
    }
    else {
      uint64_t v44 = [(GEOTraversalTimes *)v43 initWithDictionary:v42];
    }
    v45 = (void *)v44;
    [a1 setTraversalTimes:v44];
  }
  if (a3) {
    id v46 = @"tripTimes";
  }
  else {
    id v46 = @"trip_times";
  }
  v47 = [v5 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v48 = [GEOTraversalTimes alloc];
    if (a3) {
      uint64_t v49 = [(GEOTraversalTimes *)v48 initWithJSON:v47];
    }
    else {
      uint64_t v49 = [(GEOTraversalTimes *)v48 initWithDictionary:v47];
    }
    v50 = (void *)v49;
    [a1 setTripTimes:v49];
  }
  id v51 = [v5 objectForKeyedSubscript:@"feature"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v52 = [GEOWaypointRouteFeatures alloc];
    if (a3) {
      uint64_t v53 = [(GEOWaypointRouteFeatures *)v52 initWithJSON:v51];
    }
    else {
      uint64_t v53 = [(GEOWaypointRouteFeatures *)v52 initWithDictionary:v51];
    }
    uint64_t v54 = (void *)v53;
    [a1 setFeature:v53];
  }
  if (a3) {
    uint64_t v55 = @"routePlanningInfo";
  }
  else {
    uint64_t v55 = @"route_planning_info";
  }
  uint64_t v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v57 = [GEORoutePlanningInfo alloc];
    if (a3) {
      uint64_t v58 = [(GEORoutePlanningInfo *)v57 initWithJSON:v56];
    }
    else {
      uint64_t v58 = [(GEORoutePlanningInfo *)v57 initWithDictionary:v56];
    }
    id v59 = (void *)v58;
    [a1 setRoutePlanningInfo:v58];
  }
  if (a3) {
    v60 = @"arrivalParameters";
  }
  else {
    v60 = @"arrival_parameters";
  }
  v61 = [v5 objectForKeyedSubscript:v60];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v166 = 0u;
    long long v167 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v137 = v61;
    id v62 = v61;
    uint64_t v63 = [v62 countByEnumeratingWithState:&v164 objects:v181 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v165;
      do
      {
        for (uint64_t k = 0; k != v64; ++k)
        {
          if (*(void *)v165 != v65) {
            objc_enumerationMutation(v62);
          }
          uint64_t v67 = *(void *)(*((void *)&v164 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v68 = [GEOArrivalParameters alloc];
            if (a3) {
              uint64_t v69 = [(GEOArrivalParameters *)v68 initWithJSON:v67];
            }
            else {
              uint64_t v69 = [(GEOArrivalParameters *)v68 initWithDictionary:v67];
            }
            v70 = (void *)v69;
            objc_msgSend(a1, "addArrivalParameters:", v69, v137);
          }
        }
        uint64_t v64 = [v62 countByEnumeratingWithState:&v164 objects:v181 count:16];
      }
      while (v64);
    }

    v61 = v137;
    id v5 = v143;
  }

  if (a3) {
    id v71 = @"trafficSignal";
  }
  else {
    id v71 = @"traffic_signal";
  }
  uint64_t v72 = objc_msgSend(v5, "objectForKeyedSubscript:", v71, v137);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    long long v138 = v72;
    id v73 = v72;
    uint64_t v74 = [v73 countByEnumeratingWithState:&v160 objects:v180 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v161;
      do
      {
        for (uint64_t m = 0; m != v75; ++m)
        {
          if (*(void *)v161 != v76) {
            objc_enumerationMutation(v73);
          }
          uint64_t v78 = *(void *)(*((void *)&v160 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v79 = [GEOTrafficSignal alloc];
            if (a3) {
              uint64_t v80 = [(GEOTrafficSignal *)v79 initWithJSON:v78];
            }
            else {
              uint64_t v80 = [(GEOTrafficSignal *)v79 initWithDictionary:v78];
            }
            uint64_t v81 = (void *)v80;
            objc_msgSend(a1, "addTrafficSignal:", v80, v138);
          }
        }
        uint64_t v75 = [v73 countByEnumeratingWithState:&v160 objects:v180 count:16];
      }
      while (v75);
    }

    uint64_t v72 = v138;
    id v5 = v143;
  }

  if (a3) {
    uint64_t v82 = @"trafficCamera";
  }
  else {
    uint64_t v82 = @"traffic_camera";
  }
  uint64_t v83 = objc_msgSend(v5, "objectForKeyedSubscript:", v82, v138);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v158 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v139 = v83;
    id v84 = v83;
    uint64_t v85 = [v84 countByEnumeratingWithState:&v156 objects:v179 count:16];
    if (v85)
    {
      uint64_t v86 = v85;
      uint64_t v87 = *(void *)v157;
      do
      {
        for (uint64_t n = 0; n != v86; ++n)
        {
          if (*(void *)v157 != v87) {
            objc_enumerationMutation(v84);
          }
          uint64_t v89 = *(void *)(*((void *)&v156 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v90 = [GEOTrafficCamera alloc];
            if (a3) {
              uint64_t v91 = [(GEOTrafficCamera *)v90 initWithJSON:v89];
            }
            else {
              uint64_t v91 = [(GEOTrafficCamera *)v90 initWithDictionary:v89];
            }
            id v92 = (void *)v91;
            objc_msgSend(a1, "addTrafficCamera:", v91, v139);
          }
        }
        uint64_t v86 = [v84 countByEnumeratingWithState:&v156 objects:v179 count:16];
      }
      while (v86);
    }

    uint64_t v83 = v139;
    id v5 = v143;
  }

  if (a3) {
    v93 = @"incidentsOnRouteLegs";
  }
  else {
    v93 = @"incidents_on_route_legs";
  }
  v94 = objc_msgSend(v5, "objectForKeyedSubscript:", v93, v139);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v154 = 0u;
    long long v155 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    long long v140 = v94;
    id v95 = v94;
    uint64_t v96 = [v95 countByEnumeratingWithState:&v152 objects:v178 count:16];
    if (v96)
    {
      uint64_t v97 = v96;
      uint64_t v98 = *(void *)v153;
      do
      {
        for (iuint64_t i = 0; ii != v97; ++ii)
        {
          if (*(void *)v153 != v98) {
            objc_enumerationMutation(v95);
          }
          uint64_t v100 = *(void *)(*((void *)&v152 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v101 = [GEORouteIncident alloc];
            if (a3) {
              uint64_t v102 = [(GEORouteIncident *)v101 initWithJSON:v100];
            }
            else {
              uint64_t v102 = [(GEORouteIncident *)v101 initWithDictionary:v100];
            }
            v103 = (void *)v102;
            objc_msgSend(a1, "addIncidentsOnRouteLegs:", v102, v140);
          }
        }
        uint64_t v97 = [v95 countByEnumeratingWithState:&v152 objects:v178 count:16];
      }
      while (v97);
    }

    v94 = v140;
    id v5 = v143;
  }

  if (a3) {
    v104 = @"restrictionZoneInfo";
  }
  else {
    v104 = @"restriction_zone_info";
  }
  id v105 = objc_msgSend(v5, "objectForKeyedSubscript:", v104, v140);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v106 = [GEORestrictionZoneInfo alloc];
    if (a3) {
      uint64_t v107 = [(GEORestrictionZoneInfo *)v106 initWithJSON:v105];
    }
    else {
      uint64_t v107 = [(GEORestrictionZoneInfo *)v106 initWithDictionary:v105];
    }
    v108 = (void *)v107;
    [a1 setRestrictionZoneInfo:v107];
  }
  if (a3) {
    unint64_t v109 = @"outOfMapsAlertsInfo";
  }
  else {
    unint64_t v109 = @"out_of_maps_alerts_info";
  }
  uint64_t v110 = [v5 objectForKeyedSubscript:v109];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v111 = [GEOOutOfMapsAlertsInfo alloc];
    if (a3) {
      uint64_t v112 = [(GEOOutOfMapsAlertsInfo *)v111 initWithJSON:v110];
    }
    else {
      uint64_t v112 = [(GEOOutOfMapsAlertsInfo *)v111 initWithDictionary:v110];
    }
    v113 = (void *)v112;
    [a1 setOutOfMapsAlertsInfo:v112];
  }
  if (a3) {
    v114 = @"trafficBannerText";
  }
  else {
    v114 = @"traffic_banner_text";
  }
  v115 = [v5 objectForKeyedSubscript:v114];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v150 = 0u;
    long long v151 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v141 = v115;
    id v116 = v115;
    uint64_t v117 = [v116 countByEnumeratingWithState:&v148 objects:v177 count:16];
    if (v117)
    {
      uint64_t v118 = v117;
      uint64_t v119 = *(void *)v149;
      do
      {
        for (juint64_t j = 0; jj != v118; ++jj)
        {
          if (*(void *)v149 != v119) {
            objc_enumerationMutation(v116);
          }
          uint64_t v121 = *(void *)(*((void *)&v148 + 1) + 8 * jj);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v122 = [GEOTrafficBannerText alloc];
            if (a3) {
              uint64_t v123 = [(GEOTrafficBannerText *)v122 initWithJSON:v121];
            }
            else {
              uint64_t v123 = [(GEOTrafficBannerText *)v122 initWithDictionary:v121];
            }
            long long v124 = (void *)v123;
            objc_msgSend(a1, "addTrafficBannerText:", v123, v141);
          }
        }
        uint64_t v118 = [v116 countByEnumeratingWithState:&v148 objects:v177 count:16];
      }
      while (v118);
    }

    v115 = v141;
    id v5 = v143;
  }

  if (a3) {
    long long v125 = @"initialPromptType";
  }
  else {
    long long v125 = @"initial_prompt_type";
  }
  long long v126 = objc_msgSend(v5, "objectForKeyedSubscript:", v125, v141);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    long long v142 = v126;
    id v127 = v126;
    uint64_t v128 = [v127 countByEnumeratingWithState:&v144 objects:v176 count:16];
    if (!v128) {
      goto LABEL_242;
    }
    uint64_t v129 = v128;
    uint64_t v130 = *(void *)v145;
    while (1)
    {
      for (kuint64_t k = 0; kk != v129; ++kk)
      {
        if (*(void *)v145 != v130) {
          objc_enumerationMutation(v127);
        }
        long long v132 = *(void **)(*((void *)&v144 + 1) + 8 * kk);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v133 = v132;
          if ([v133 isEqualToString:@"PROMPT_UNKNOWN"]) {
            uint64_t v134 = 0;
          }
          else {
            uint64_t v134 = [v133 isEqualToString:@"PROMPT_DISCOVER_INCIDENTS"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v134 = [v132 intValue];
        }
        objc_msgSend(a1, "addInitialPromptType:", v134, v142);
      }
      uint64_t v129 = [v127 countByEnumeratingWithState:&v144 objects:v176 count:16];
      if (!v129)
      {
LABEL_242:

        long long v126 = v142;
        id v5 = v143;
        break;
      }
    }
  }

  a1 = a1;
LABEL_244:

  return a1;
}

- (GEOWaypointRoute)initWithJSON:(id)a3
{
  return (GEOWaypointRoute *)-[GEOWaypointRoute _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_9117;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_9118;
    }
    GEOWaypointRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOWaypointRouteCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWaypointRouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWaypointRouteReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWaypointRouteIsDirty((uint64_t)self) & 1) == 0)
  {
    v36 = self->_reader;
    objc_sync_enter(v36);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v37 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v37];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v36);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOWaypointRoute *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    objc_super v6 = self->_routeLegs;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v62 objects:v72 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v63;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v63 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v62 objects:v72 count:16];
      }
      while (v7);
    }

    $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v11 = self->_names;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v58 objects:v71 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v59;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v59 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v58 objects:v71 count:16];
      }
      while (v12);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_traversalTimes) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_tripTimes) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_feature) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_routePlanningInfo) {
      PBDataWriterWriteSubmessage();
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    int v15 = self->_arrivalParameters;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v54 objects:v70 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v55;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v55 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteSubmessage();
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v54 objects:v70 count:16];
      }
      while (v16);
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    int v19 = self->_trafficSignals;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v50 objects:v69 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v51;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v51 != v21) {
            objc_enumerationMutation(v19);
          }
          PBDataWriterWriteSubmessage();
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v50 objects:v69 count:16];
      }
      while (v20);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v23 = self->_trafficCameras;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v46 objects:v68 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v47;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v47 != v25) {
            objc_enumerationMutation(v23);
          }
          PBDataWriterWriteSubmessage();
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v46 objects:v68 count:16];
      }
      while (v24);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v27 = self->_incidentsOnRouteLegs;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v42 objects:v67 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v43;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v27);
          }
          PBDataWriterWriteSubmessage();
          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v42 objects:v67 count:16];
      }
      while (v28);
    }

    if (self->_restrictionZoneInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_outOfMapsAlertsInfo) {
      PBDataWriterWriteSubmessage();
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v31 = self->_trafficBannerTexts;
    uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v38 objects:v66 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v39;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v39 != v33) {
            objc_enumerationMutation(v31);
          }
          PBDataWriterWriteSubmessage();
          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v38 objects:v66 count:16];
      }
      while (v32);
    }

    if (self->_initialPromptTypes.count)
    {
      unint64_t v35 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v35;
      }
      while (v35 < self->_initialPromptTypes.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v38);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  -[GEOWaypointRoute _readArrivalParameters]((uint64_t)self);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v5 = self->_arrivalParameters;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v53;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v53 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v52 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_53;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOWaypointRoute _readIncidentsOnRouteLegs]((uint64_t)self);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v5 = self->_incidentsOnRouteLegs;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v49;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v49 != v12) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v48 + 1) + 8 * v13) hasGreenTeaWithValue:v3]) {
        goto LABEL_53;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v11) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  -[GEOWaypointRoute _readRestrictionZoneInfo]((uint64_t)self);
  if (![(GEORestrictionZoneInfo *)self->_restrictionZoneInfo hasGreenTeaWithValue:v3])
  {
    -[GEOWaypointRoute _readRouteLegs]((uint64_t)self);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v5 = self->_routeLegs;
    uint64_t v15 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v44 objects:v59 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v45;
LABEL_21:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v44 + 1) + 8 * v18) hasGreenTeaWithValue:v3]) {
          break;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v44 objects:v59 count:16];
          if (v16) {
            goto LABEL_21;
          }
          goto LABEL_27;
        }
      }
    }
    else
    {
LABEL_27:

      -[GEOWaypointRoute _readRoutePlanningInfo]((uint64_t)self);
      if ([(GEORoutePlanningInfo *)self->_routePlanningInfo hasGreenTeaWithValue:v3]) {
        return 1;
      }
      -[GEOWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v5 = self->_trafficBannerTexts;
      uint64_t v19 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v40 objects:v58 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v41;
LABEL_30:
        uint64_t v22 = 0;
        while (1)
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v40 + 1) + 8 * v22) hasGreenTeaWithValue:v3]) {
            break;
          }
          if (v20 == ++v22)
          {
            uint64_t v20 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v40 objects:v58 count:16];
            if (v20) {
              goto LABEL_30;
            }
            goto LABEL_36;
          }
        }
      }
      else
      {
LABEL_36:

        -[GEOWaypointRoute _readTrafficCameras]((uint64_t)self);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v5 = self->_trafficCameras;
        uint64_t v23 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v36 objects:v57 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v37;
LABEL_38:
          uint64_t v26 = 0;
          while (1)
          {
            if (*(void *)v37 != v25) {
              objc_enumerationMutation(v5);
            }
            if ([*(id *)(*((void *)&v36 + 1) + 8 * v26) hasGreenTeaWithValue:v3]) {
              break;
            }
            if (v24 == ++v26)
            {
              uint64_t v24 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v36 objects:v57 count:16];
              if (v24) {
                goto LABEL_38;
              }
              goto LABEL_44;
            }
          }
        }
        else
        {
LABEL_44:

          -[GEOWaypointRoute _readTrafficSignals]((uint64_t)self);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v5 = self->_trafficSignals;
          uint64_t v27 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v56 count:16];
          if (!v27)
          {
LABEL_52:
            BOOL v14 = 0;
LABEL_54:

            return v14;
          }
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v33;
LABEL_46:
          uint64_t v30 = 0;
          while (1)
          {
            if (*(void *)v33 != v29) {
              objc_enumerationMutation(v5);
            }
            if (objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v30), "hasGreenTeaWithValue:", v3, (void)v32)) {
              break;
            }
            if (v28 == ++v30)
            {
              uint64_t v28 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v56 count:16];
              if (v28) {
                goto LABEL_46;
              }
              goto LABEL_52;
            }
          }
        }
      }
    }
LABEL_53:
    BOOL v14 = 1;
    goto LABEL_54;
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  long long v36 = (id *)a3;
  [(GEOWaypointRoute *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v36 + 1, self->_reader);
  *((_DWORD *)v36 + 38) = self->_readerMarkPos;
  *((_DWORD *)v36 + 39) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v36 + 43) = self->_identifier;
    *((_DWORD *)v36 + 46) |= 4u;
  }
  if ([(GEOWaypointRoute *)self routeLegsCount])
  {
    [v36 clearRouteLegs];
    unint64_t v4 = [(GEOWaypointRoute *)self routeLegsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOWaypointRoute *)self routeLegAtIndex:i];
        [v36 addRouteLeg:v7];
      }
    }
  }
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_9;
    }
LABEL_57:
    *((_DWORD *)v36 + 42) = self->_drivingSide;
    *((_DWORD *)v36 + 46) |= 2u;
    if ((*(_DWORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  *((_DWORD *)v36 + 44) = self->_transportType;
  *((_DWORD *)v36 + 46) |= 8u;
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0) {
    goto LABEL_57;
  }
LABEL_9:
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v36 + 45) = self->_type;
    *((_DWORD *)v36 + 46) |= 0x10u;
  }
LABEL_11:
  if ([(GEOWaypointRoute *)self namesCount])
  {
    [v36 clearNames];
    unint64_t v9 = [(GEOWaypointRoute *)self namesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(GEOWaypointRoute *)self nameAtIndex:j];
        [v36 addName:v12];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v36 + 41) = self->_distanceMeters;
    *((_DWORD *)v36 + 46) |= 1u;
  }
  if (self->_traversalTimes) {
    objc_msgSend(v36, "setTraversalTimes:");
  }
  if (self->_tripTimes) {
    objc_msgSend(v36, "setTripTimes:");
  }
  if (self->_feature) {
    objc_msgSend(v36, "setFeature:");
  }
  if (self->_routePlanningInfo) {
    objc_msgSend(v36, "setRoutePlanningInfo:");
  }
  if ([(GEOWaypointRoute *)self arrivalParametersCount])
  {
    [v36 clearArrivalParameters];
    unint64_t v13 = [(GEOWaypointRoute *)self arrivalParametersCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(GEOWaypointRoute *)self arrivalParametersAtIndex:k];
        [v36 addArrivalParameters:v16];
      }
    }
  }
  if ([(GEOWaypointRoute *)self trafficSignalsCount])
  {
    [v36 clearTrafficSignals];
    unint64_t v17 = [(GEOWaypointRoute *)self trafficSignalsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = [(GEOWaypointRoute *)self trafficSignalAtIndex:m];
        [v36 addTrafficSignal:v20];
      }
    }
  }
  if ([(GEOWaypointRoute *)self trafficCamerasCount])
  {
    [v36 clearTrafficCameras];
    unint64_t v21 = [(GEOWaypointRoute *)self trafficCamerasCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(GEOWaypointRoute *)self trafficCameraAtIndex:n];
        [v36 addTrafficCamera:v24];
      }
    }
  }
  if ([(GEOWaypointRoute *)self incidentsOnRouteLegsCount])
  {
    [v36 clearIncidentsOnRouteLegs];
    unint64_t v25 = [(GEOWaypointRoute *)self incidentsOnRouteLegsCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(GEOWaypointRoute *)self incidentsOnRouteLegsAtIndex:ii];
        [v36 addIncidentsOnRouteLegs:v28];
      }
    }
  }
  if (self->_restrictionZoneInfo) {
    objc_msgSend(v36, "setRestrictionZoneInfo:");
  }
  if (self->_outOfMapsAlertsInfo) {
    objc_msgSend(v36, "setOutOfMapsAlertsInfo:");
  }
  if ([(GEOWaypointRoute *)self trafficBannerTextsCount])
  {
    [v36 clearTrafficBannerTexts];
    unint64_t v29 = [(GEOWaypointRoute *)self trafficBannerTextsCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
      {
        long long v32 = [(GEOWaypointRoute *)self trafficBannerTextAtIndex:jj];
        [v36 addTrafficBannerText:v32];
      }
    }
  }
  if ([(GEOWaypointRoute *)self initialPromptTypesCount])
  {
    [v36 clearInitialPromptTypes];
    unint64_t v33 = [(GEOWaypointRoute *)self initialPromptTypesCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (kuint64_t k = 0; kk != v34; ++kk)
        objc_msgSend(v36, "addInitialPromptType:", -[GEOWaypointRoute initialPromptTypeAtIndex:](self, "initialPromptTypeAtIndex:", kk));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOWaypointRouteReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_63;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWaypointRoute *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 172) = self->_identifier;
    *(_DWORD *)(v5 + 184) |= 4u;
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  unint64_t v9 = self->_routeLegs;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v83 objects:v93 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v84 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v83 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addRouteLeg:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v83 objects:v93 count:16];
    }
    while (v10);
  }

  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_16;
    }
LABEL_65:
    *(_DWORD *)(v5 + 168) = self->_drivingSide;
    *(_DWORD *)(v5 + 184) |= 2u;
    if ((*(_DWORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  *(_DWORD *)(v5 + 176) = self->_transportType;
  *(_DWORD *)(v5 + 184) |= 8u;
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0) {
    goto LABEL_65;
  }
LABEL_16:
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_17:
    *(_DWORD *)(v5 + 180) = self->_type;
    *(_DWORD *)(v5 + 184) |= 0x10u;
  }
LABEL_18:
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v15 = self->_names;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v79 objects:v92 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v80;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v80 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v79 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addName:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v79 objects:v92 count:16];
    }
    while (v16);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 164) = self->_distanceMeters;
    *(_DWORD *)(v5 + 184) |= 1u;
  }
  id v20 = [(GEOTraversalTimes *)self->_traversalTimes copyWithZone:a3];
  unint64_t v21 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v20;

  id v22 = [(GEOTraversalTimes *)self->_tripTimes copyWithZone:a3];
  uint64_t v23 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v22;

  id v24 = [(GEOWaypointRouteFeatures *)self->_feature copyWithZone:a3];
  unint64_t v25 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v24;

  id v26 = [(GEORoutePlanningInfo *)self->_routePlanningInfo copyWithZone:a3];
  uint64_t v27 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v26;

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v28 = self->_arrivalParameters;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v75 objects:v91 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v76;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v76 != v30) {
          objc_enumerationMutation(v28);
        }
        long long v32 = (void *)[*(id *)(*((void *)&v75 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addArrivalParameters:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v75 objects:v91 count:16];
    }
    while (v29);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  unint64_t v33 = self->_trafficSignals;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v71 objects:v90 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v72;
    do
    {
      for (uint64_t m = 0; m != v34; ++m)
      {
        if (*(void *)v72 != v35) {
          objc_enumerationMutation(v33);
        }
        long long v37 = (void *)[*(id *)(*((void *)&v71 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addTrafficSignal:v37];
      }
      uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v71 objects:v90 count:16];
    }
    while (v34);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v38 = self->_trafficCameras;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v67 objects:v89 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v68;
    do
    {
      for (uint64_t n = 0; n != v39; ++n)
      {
        if (*(void *)v68 != v40) {
          objc_enumerationMutation(v38);
        }
        long long v42 = (void *)[*(id *)(*((void *)&v67 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addTrafficCamera:v42];
      }
      uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v67 objects:v89 count:16];
    }
    while (v39);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v43 = self->_incidentsOnRouteLegs;
  uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v63 objects:v88 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v64;
    do
    {
      for (iuint64_t i = 0; ii != v44; ++ii)
      {
        if (*(void *)v64 != v45) {
          objc_enumerationMutation(v43);
        }
        long long v47 = (void *)[*(id *)(*((void *)&v63 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addIncidentsOnRouteLegs:v47];
      }
      uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v63 objects:v88 count:16];
    }
    while (v44);
  }

  id v48 = [(GEORestrictionZoneInfo *)self->_restrictionZoneInfo copyWithZone:a3];
  long long v49 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v48;

  id v50 = [(GEOOutOfMapsAlertsInfo *)self->_outOfMapsAlertsInfo copyWithZone:a3];
  long long v51 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v50;

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v52 = self->_trafficBannerTexts;
  uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v59 objects:v87 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v60;
    do
    {
      for (juint64_t j = 0; jj != v53; ++jj)
      {
        if (*(void *)v60 != v54) {
          objc_enumerationMutation(v52);
        }
        long long v56 = objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * jj), "copyWithZone:", a3, (void)v59);
        [(id)v5 addTrafficBannerText:v56];
      }
      uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v59 objects:v87 count:16];
    }
    while (v53);
  }

  PBRepeatedInt32Copy();
  long long v57 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v57;
LABEL_63:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_56;
  }
  [(GEOWaypointRoute *)self readAll:1];
  [v4 readAll:1];
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_identifier != *((_DWORD *)v4 + 43)) {
      goto LABEL_56;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_56;
  }
  routeLegs = self->_routeLegs;
  if ((unint64_t)routeLegs | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](routeLegs, "isEqual:")) {
      goto LABEL_56;
    }
    $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 46);
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_transportType != *((_DWORD *)v4 + 44)) {
      goto LABEL_56;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_drivingSide != *((_DWORD *)v4 + 42)) {
      goto LABEL_56;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 45)) {
      goto LABEL_56;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_56;
  }
  names = self->_names;
  if ((unint64_t)names | *((void *)v4 + 9))
  {
    if (-[NSMutableArray isEqual:](names, "isEqual:"))
    {
      $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = self->_flags;
      int v6 = *((_DWORD *)v4 + 46);
      goto LABEL_28;
    }
LABEL_56:
    char IsEqual = 0;
    goto LABEL_57;
  }
LABEL_28:
  if (*(unsigned char *)&flags)
  {
    if ((v6 & 1) == 0 || self->_distanceMeters != *((_DWORD *)v4 + 41)) {
      goto LABEL_56;
    }
  }
  else if (v6)
  {
    goto LABEL_56;
  }
  traversalTimes = self->_traversalTimes;
  if ((unint64_t)traversalTimes | *((void *)v4 + 17)
    && !-[GEOTraversalTimes isEqual:](traversalTimes, "isEqual:"))
  {
    goto LABEL_56;
  }
  tripTimes = self->_tripTimes;
  if ((unint64_t)tripTimes | *((void *)v4 + 18))
  {
    if (!-[GEOTraversalTimes isEqual:](tripTimes, "isEqual:")) {
      goto LABEL_56;
    }
  }
  feature = self->_feature;
  if ((unint64_t)feature | *((void *)v4 + 7))
  {
    if (!-[GEOWaypointRouteFeatures isEqual:](feature, "isEqual:")) {
      goto LABEL_56;
    }
  }
  routePlanningInfo = self->_routePlanningInfo;
  if ((unint64_t)routePlanningInfo | *((void *)v4 + 13))
  {
    if (!-[GEORoutePlanningInfo isEqual:](routePlanningInfo, "isEqual:")) {
      goto LABEL_56;
    }
  }
  arrivalParameters = self->_arrivalParameters;
  if ((unint64_t)arrivalParameters | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](arrivalParameters, "isEqual:")) {
      goto LABEL_56;
    }
  }
  trafficSignals = self->_trafficSignals;
  if ((unint64_t)trafficSignals | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](trafficSignals, "isEqual:")) {
      goto LABEL_56;
    }
  }
  trafficCameras = self->_trafficCameras;
  if ((unint64_t)trafficCameras | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](trafficCameras, "isEqual:")) {
      goto LABEL_56;
    }
  }
  incidentsOnRouteLegs = self->_incidentsOnRouteLegs;
  if ((unint64_t)incidentsOnRouteLegs | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](incidentsOnRouteLegs, "isEqual:")) {
      goto LABEL_56;
    }
  }
  restrictionZoneInfo = self->_restrictionZoneInfo;
  if ((unint64_t)restrictionZoneInfo | *((void *)v4 + 11))
  {
    if (!-[GEORestrictionZoneInfo isEqual:](restrictionZoneInfo, "isEqual:")) {
      goto LABEL_56;
    }
  }
  outOfMapsAlertsInfo = self->_outOfMapsAlertsInfo;
  if ((unint64_t)outOfMapsAlertsInfo | *((void *)v4 + 10))
  {
    if (!-[GEOOutOfMapsAlertsInfo isEqual:](outOfMapsAlertsInfo, "isEqual:")) {
      goto LABEL_56;
    }
  }
  trafficBannerTexts = self->_trafficBannerTexts;
  if ((unint64_t)trafficBannerTexts | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](trafficBannerTexts, "isEqual:")) {
      goto LABEL_56;
    }
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_57:

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOWaypointRoute *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_identifier;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_routeLegs hash];
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&flags & 2) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v6 = 2654435761 * self->_transportType;
  if ((*(unsigned char *)&flags & 2) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_drivingSide;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_type;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v8 = 0;
LABEL_11:
  uint64_t v9 = [(NSMutableArray *)self->_names hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v10 = 2654435761 * self->_distanceMeters;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(GEOTraversalTimes *)self->_traversalTimes hash];
  unint64_t v12 = [(GEOTraversalTimes *)self->_tripTimes hash];
  unint64_t v13 = v12 ^ [(GEOWaypointRouteFeatures *)self->_feature hash];
  unint64_t v14 = v11 ^ v13 ^ [(GEORoutePlanningInfo *)self->_routePlanningInfo hash];
  uint64_t v15 = [(NSMutableArray *)self->_arrivalParameters hash];
  uint64_t v16 = v15 ^ [(NSMutableArray *)self->_trafficSignals hash];
  uint64_t v17 = v16 ^ [(NSMutableArray *)self->_trafficCameras hash];
  uint64_t v18 = v14 ^ v17 ^ [(NSMutableArray *)self->_incidentsOnRouteLegs hash];
  unint64_t v19 = [(GEORestrictionZoneInfo *)self->_restrictionZoneInfo hash];
  unint64_t v20 = v19 ^ [(GEOOutOfMapsAlertsInfo *)self->_outOfMapsAlertsInfo hash];
  uint64_t v21 = v20 ^ [(NSMutableArray *)self->_trafficBannerTexts hash];
  return v18 ^ v21 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((unsigned char *)v4 + 184) & 4) != 0)
  {
    self->_identifier = *((_DWORD *)v4 + 43);
    *(_DWORD *)&self->_flags |= 4u;
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v5 = *((id *)v4 + 12);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v80 objects:v90 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v81 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOWaypointRoute *)self addRouteLeg:*(void *)(*((void *)&v80 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v80 objects:v90 count:16];
    }
    while (v7);
  }

  int v10 = *((_DWORD *)v4 + 46);
  if ((v10 & 8) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 44);
    *(_DWORD *)&self->_flags |= 8u;
    int v10 = *((_DWORD *)v4 + 46);
    if ((v10 & 2) == 0)
    {
LABEL_12:
      if ((v10 & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_12;
  }
  self->_drivingSide = *((_DWORD *)v4 + 42);
  *(_DWORD *)&self->_flags |= 2u;
  if ((*((_DWORD *)v4 + 46) & 0x10) != 0)
  {
LABEL_13:
    self->_type = *((_DWORD *)v4 + 45);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
LABEL_14:
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v11 = *((id *)v4 + 9);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v76 objects:v89 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v77;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v77 != v14) {
          objc_enumerationMutation(v11);
        }
        [(GEOWaypointRoute *)self addName:*(void *)(*((void *)&v76 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v76 objects:v89 count:16];
    }
    while (v13);
  }

  if (*((unsigned char *)v4 + 184))
  {
    self->_distanceMeters = *((_DWORD *)v4 + 41);
    *(_DWORD *)&self->_flags |= 1u;
  }
  traversalTimes = self->_traversalTimes;
  uint64_t v17 = *((void *)v4 + 17);
  if (traversalTimes)
  {
    if (v17) {
      -[GEOTraversalTimes mergeFrom:](traversalTimes, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEOWaypointRoute setTraversalTimes:](self, "setTraversalTimes:");
  }
  tripTimes = self->_tripTimes;
  uint64_t v19 = *((void *)v4 + 18);
  if (tripTimes)
  {
    if (v19) {
      -[GEOTraversalTimes mergeFrom:](tripTimes, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[GEOWaypointRoute setTripTimes:](self, "setTripTimes:");
  }
  feature = self->_feature;
  uint64_t v21 = *((void *)v4 + 7);
  if (feature)
  {
    if (v21) {
      -[GEOWaypointRouteFeatures mergeFrom:](feature, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[GEOWaypointRoute setFeature:](self, "setFeature:");
  }
  routePlanningInfo = self->_routePlanningInfo;
  uint64_t v23 = *((void *)v4 + 13);
  if (routePlanningInfo)
  {
    if (v23) {
      -[GEORoutePlanningInfo mergeFrom:](routePlanningInfo, "mergeFrom:");
    }
  }
  else if (v23)
  {
    [(GEOWaypointRoute *)self setRoutePlanningInfo:"setRoutePlanningInfo:"];
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v24 = *((id *)v4 + 6);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v72 objects:v88 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v73;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v73 != v27) {
          objc_enumerationMutation(v24);
        }
        [(GEOWaypointRoute *)self addArrivalParameters:*(void *)(*((void *)&v72 + 1) + 8 * k)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v72 objects:v88 count:16];
    }
    while (v26);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v29 = *((id *)v4 + 16);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v68 objects:v87 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v69;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v69 != v32) {
          objc_enumerationMutation(v29);
        }
        [(GEOWaypointRoute *)self addTrafficSignal:*(void *)(*((void *)&v68 + 1) + 8 * m)];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v68 objects:v87 count:16];
    }
    while (v31);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v34 = *((id *)v4 + 15);
  uint64_t v35 = [v34 countByEnumeratingWithState:&v64 objects:v86 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v65;
    do
    {
      for (uint64_t n = 0; n != v36; ++n)
      {
        if (*(void *)v65 != v37) {
          objc_enumerationMutation(v34);
        }
        [(GEOWaypointRoute *)self addTrafficCamera:*(void *)(*((void *)&v64 + 1) + 8 * n)];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v64 objects:v86 count:16];
    }
    while (v36);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v39 = *((id *)v4 + 8);
  uint64_t v40 = [v39 countByEnumeratingWithState:&v60 objects:v85 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v61;
    do
    {
      for (iuint64_t i = 0; ii != v41; ++ii)
      {
        if (*(void *)v61 != v42) {
          objc_enumerationMutation(v39);
        }
        [(GEOWaypointRoute *)self addIncidentsOnRouteLegs:*(void *)(*((void *)&v60 + 1) + 8 * ii)];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v60 objects:v85 count:16];
    }
    while (v41);
  }

  restrictionZoneInfo = self->_restrictionZoneInfo;
  uint64_t v45 = *((void *)v4 + 11);
  if (restrictionZoneInfo)
  {
    if (v45) {
      -[GEORestrictionZoneInfo mergeFrom:](restrictionZoneInfo, "mergeFrom:");
    }
  }
  else if (v45)
  {
    -[GEOWaypointRoute setRestrictionZoneInfo:](self, "setRestrictionZoneInfo:");
  }
  outOfMapsAlertsInfo = self->_outOfMapsAlertsInfo;
  uint64_t v47 = *((void *)v4 + 10);
  if (outOfMapsAlertsInfo)
  {
    if (v47) {
      -[GEOOutOfMapsAlertsInfo mergeFrom:](outOfMapsAlertsInfo, "mergeFrom:");
    }
  }
  else if (v47)
  {
    -[GEOWaypointRoute setOutOfMapsAlertsInfo:](self, "setOutOfMapsAlertsInfo:");
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v48 = *((id *)v4 + 14);
  uint64_t v49 = [v48 countByEnumeratingWithState:&v56 objects:v84 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v57;
    do
    {
      for (juint64_t j = 0; jj != v50; ++jj)
      {
        if (*(void *)v57 != v51) {
          objc_enumerationMutation(v48);
        }
        -[GEOWaypointRoute addTrafficBannerText:](self, "addTrafficBannerText:", *(void *)(*((void *)&v56 + 1) + 8 * jj), (void)v56);
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v56 objects:v84 count:16];
    }
    while (v50);
  }

  uint64_t v53 = [v4 initialPromptTypesCount];
  if (v53)
  {
    uint64_t v54 = v53;
    for (kuint64_t k = 0; kk != v54; ++kk)
      -[GEOWaypointRoute addInitialPromptType:](self, "addInitialPromptType:", objc_msgSend(v4, "initialPromptTypeAtIndex:", kk, (void)v56));
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOWaypointRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_9122);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100020u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOWaypointRoute *)self readAll:0];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v7 = self->_routeLegs;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v66 objects:v76 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v67;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v67 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v66 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v66 objects:v76 count:16];
      }
      while (v9);
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v12 = self->_names;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v62 objects:v75 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v63;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v63 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v62 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v62 objects:v75 count:16];
      }
      while (v14);
    }

    [(GEOTraversalTimes *)self->_traversalTimes clearUnknownFields:1];
    [(GEOTraversalTimes *)self->_tripTimes clearUnknownFields:1];
    [(GEOWaypointRouteFeatures *)self->_feature clearUnknownFields:1];
    [(GEORoutePlanningInfo *)self->_routePlanningInfo clearUnknownFields:1];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v17 = self->_arrivalParameters;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v58 objects:v74 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v59;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v59 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v58 + 1) + 8 * v21++) clearUnknownFields:1];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v58 objects:v74 count:16];
      }
      while (v19);
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v22 = self->_trafficSignals;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v54 objects:v73 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v55;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v55 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v54 + 1) + 8 * v26++) clearUnknownFields:1];
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v54 objects:v73 count:16];
      }
      while (v24);
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v27 = self->_trafficCameras;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v50 objects:v72 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v51;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v51 != v30) {
            objc_enumerationMutation(v27);
          }
          [*(id *)(*((void *)&v50 + 1) + 8 * v31++) clearUnknownFields:1];
        }
        while (v29 != v31);
        uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v50 objects:v72 count:16];
      }
      while (v29);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v32 = self->_incidentsOnRouteLegs;
    uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v46 objects:v71 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v47;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v47 != v35) {
            objc_enumerationMutation(v32);
          }
          [*(id *)(*((void *)&v46 + 1) + 8 * v36++) clearUnknownFields:1];
        }
        while (v34 != v36);
        uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v46 objects:v71 count:16];
      }
      while (v34);
    }

    [(GEORestrictionZoneInfo *)self->_restrictionZoneInfo clearUnknownFields:1];
    [(GEOOutOfMapsAlertsInfo *)self->_outOfMapsAlertsInfo clearUnknownFields:1];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v37 = self->_trafficBannerTexts;
    uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v42 objects:v70 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v43;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v43 != v40) {
            objc_enumerationMutation(v37);
          }
          objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * v41++), "clearUnknownFields:", 1, (void)v42);
        }
        while (v39 != v41);
        uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v42 objects:v70 count:16];
      }
      while (v39);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripTimes, 0);
  objc_storeStrong((id *)&self->_traversalTimes, 0);
  objc_storeStrong((id *)&self->_trafficSignals, 0);
  objc_storeStrong((id *)&self->_trafficCameras, 0);
  objc_storeStrong((id *)&self->_trafficBannerTexts, 0);
  objc_storeStrong((id *)&self->_routePlanningInfo, 0);
  objc_storeStrong((id *)&self->_routeLegs, 0);
  objc_storeStrong((id *)&self->_restrictionZoneInfo, 0);
  objc_storeStrong((id *)&self->_outOfMapsAlertsInfo, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_incidentsOnRouteLegs, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_arrivalParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)_geoTrafficCameras
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [(GEOWaypointRoute *)self trafficCameras];
  id v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(GEOWaypointRoute *)self trafficCameras];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 identifier];

        if (v12)
        {
          uint64_t v13 = [v11 identifier];
          [v5 setObject:v11 forKeyedSubscript:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_geoTrafficSignals
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [(GEOWaypointRoute *)self trafficSignals];
  id v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(GEOWaypointRoute *)self trafficSignals];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 identifier];

        if (v12)
        {
          uint64_t v13 = [v11 identifier];
          [v5 setObject:v11 forKeyedSubscript:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

@end