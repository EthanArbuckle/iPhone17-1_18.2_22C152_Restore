@interface MSPMutableHistoryEntryRoute
+ (Class)immutableObjectClass;
+ (Class)mutableObjectClass;
+ (id)immutableObjectProtocol;
+ (id)mutableObjectProtocol;
- (BOOL)_isUserVisibleDuplicateOfSameClassObject:(id)a3;
- (BOOL)navigationWasInterrupted;
- (GEOAutomobileOptions)automobileOptions;
- (GEOComposedWaypoint)endWaypoint;
- (GEOComposedWaypoint)startWaypoint;
- (GEOCyclingOptions)cyclingOptions;
- (GEOTransitOptions)transitOptions;
- (GEOURLRouteHandle)routeHandle;
- (GEOWalkingOptions)walkingOptions;
- (MSPMutableHistoryEntryRoute)initWithStorage:(id)a3;
- (MSPRouteInformationSource)routeInformationSource;
- (NSArray)waypoints;
- (NSData)archivedSharedTripData;
- (NSString)identifier;
- (id)_routeRequestStorage;
- (id)transferToImmutableIfValidWithError:(id *)a3;
- (int64_t)transportType;
- (void)setNavigationInterrupted:(BOOL)a3;
- (void)setRouteInformationSource:(id)a3;
@end

@implementation MSPMutableHistoryEntryRoute

+ (Class)immutableObjectClass
{
  return 0;
}

+ (id)immutableObjectProtocol
{
  return &unk_1F1210AC8;
}

+ (Class)mutableObjectClass
{
  return (Class)objc_opt_class();
}

+ (id)mutableObjectProtocol
{
  return 0;
}

- (MSPMutableHistoryEntryRoute)initWithStorage:(id)a3
{
  v4 = (MSPHistoryEntryStorage *)a3;
  if (!v4)
  {
    v4 = objc_alloc_init(MSPHistoryEntryStorage);
    [(MSPHistoryEntryStorage *)v4 setSearchType:2];
    v5 = objc_alloc_init(MSPDirectionsSearch);
    [(MSPHistoryEntryStorage *)v4 setDirectionsSearch:v5];
  }
  v27.receiver = self;
  v27.super_class = (Class)MSPMutableHistoryEntryRoute;
  v6 = [(MSPMutableHistoryEntry *)&v27 initWithStorage:v4];
  v7 = v6;
  if (!v6) {
    goto LABEL_14;
  }
  v8 = [(MSPMutableHistoryEntry *)v6 storage];
  if ([v8 searchType] == 2)
  {
    v9 = [(MSPMutableHistoryEntry *)v7 storage];
    v10 = [v9 directionsSearch];
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  v12 = [(MSPMutableHistoryEntry *)v7 storage];
  if ([v12 searchType] != 5)
  {

    if (!v11) {
      goto LABEL_15;
    }
LABEL_12:
    v16 = [(MSPMutableHistoryEntry *)v7 storage];
    v17 = [v16 directionsSearch];
    uint64_t v24 = [v17 routeRequestStorage];
    routeInformationSource = v7->_routeInformationSource;
    v7->_routeInformationSource = (MSPRouteInformationSource *)v24;
    goto LABEL_13;
  }
  v13 = [(MSPMutableHistoryEntry *)v7 storage];
  v14 = [v13 ridesharingTrip];

  if (v11) {
    goto LABEL_12;
  }
  if (!v14)
  {
LABEL_15:
    v25 = 0;
    goto LABEL_16;
  }
  v15 = [MSPRidesharingInformationSource alloc];
  v16 = [(MSPMutableHistoryEntry *)v7 storage];
  v17 = [v16 ridesharingTrip];
  routeInformationSource = [v17 startWaypoint];
  v19 = [(MSPMutableHistoryEntry *)v7 storage];
  v20 = [v19 ridesharingTrip];
  v21 = [v20 endWaypoint];
  uint64_t v22 = [(MSPRidesharingInformationSource *)v15 initWithStartWaypoint:routeInformationSource endWaypoint:v21];
  v23 = v7->_routeInformationSource;
  v7->_routeInformationSource = (MSPRouteInformationSource *)v22;

LABEL_13:
LABEL_14:
  v25 = v7;
LABEL_16:

  return v25;
}

- (NSString)identifier
{
  v2 = [(MSPMutableHistoryEntry *)self storage];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (id)_routeRequestStorage
{
  v2 = [(MSPMutableHistoryEntry *)self storage];
  v3 = [v2 directionsSearch];
  v4 = [v3 routeRequestStorage];

  return v4;
}

- (void)setRouteInformationSource:(id)a3
{
  v20 = (MSPRouteInformationSource *)a3;
  [(MSPMutableHistoryEntry *)self _noteWillMutate];
  if (self->_routeInformationSource != v20)
  {
    objc_storeStrong((id *)&self->_routeInformationSource, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(MSPMutableHistoryEntry *)self storage];
      [v5 setSearchType:2];

      v6 = [(MSPMutableHistoryEntry *)self storage];
      [v6 setRidesharingTrip:0];

      v7 = objc_alloc_init(MSPDirectionsSearch);
      v8 = [(MSPMutableHistoryEntry *)self storage];
      [v8 setDirectionsSearch:v7];

      v9 = (void *)[(MSPRouteInformationSource *)v20 copy];
      v10 = [(MSPMutableHistoryEntry *)self storage];
      BOOL v11 = [v10 directionsSearch];
      [v11 setRouteRequestStorage:v9];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_7;
      }
      v12 = v20;
      v13 = [(MSPMutableHistoryEntry *)self storage];
      [v13 setSearchType:5];

      v14 = [(MSPMutableHistoryEntry *)self storage];
      [v14 setDirectionsSearch:0];

      v15 = objc_alloc_init(MSPRidesharingTrip);
      v16 = [(MSPMutableHistoryEntry *)self storage];
      [v16 setRidesharingTrip:v15];

      v17 = [(MSPRouteInformationSource *)v12 _startWaypoint];
      v18 = [(MSPMutableHistoryEntry *)self storage];
      v19 = [v18 ridesharingTrip];
      [v19 setStartWaypoint:v17];

      v9 = [(MSPRouteInformationSource *)v12 _endWaypoint];

      v10 = [(MSPMutableHistoryEntry *)self storage];
      BOOL v11 = [v10 ridesharingTrip];
      [v11 setEndWaypoint:v9];
    }
  }
LABEL_7:

  MEMORY[0x1F41817F8]();
}

- (GEOComposedWaypoint)startWaypoint
{
  v3 = [(MSPMutableHistoryEntry *)self storage];
  v4 = [v3 ridesharingTrip];
  v5 = [v4 startWaypoint];

  if (!v5)
  {
    v6 = [(MSPMutableHistoryEntryRoute *)self _routeRequestStorage];
    v7 = [v6 waypoints];
    if ((unint64_t)[v7 count] < 2)
    {
      v5 = 0;
    }
    else
    {
      v8 = [(MSPMutableHistoryEntryRoute *)self _routeRequestStorage];
      v9 = [v8 waypoints];
      v5 = [v9 firstObject];
    }
  }

  return (GEOComposedWaypoint *)v5;
}

- (GEOComposedWaypoint)endWaypoint
{
  v3 = [(MSPMutableHistoryEntry *)self storage];
  v4 = [v3 ridesharingTrip];
  v5 = [v4 endWaypoint];

  if (!v5)
  {
    v6 = [(MSPMutableHistoryEntryRoute *)self _routeRequestStorage];
    v7 = [v6 waypoints];
    v5 = [v7 lastObject];
  }

  return (GEOComposedWaypoint *)v5;
}

- (NSArray)waypoints
{
  v2 = [(MSPMutableHistoryEntryRoute *)self _routeRequestStorage];
  v3 = [v2 waypoints];

  return (NSArray *)v3;
}

- (int64_t)transportType
{
  v3 = [(MSPMutableHistoryEntry *)self storage];
  v4 = [v3 ridesharingTrip];

  if (v4) {
    return 4;
  }
  v6 = [(MSPMutableHistoryEntryRoute *)self _routeRequestStorage];
  int v7 = [v6 hasTransportType];

  if (!v7) {
    return 0;
  }
  v8 = [(MSPMutableHistoryEntryRoute *)self _routeRequestStorage];
  unsigned int v9 = [v8 transportType] - 1;
  if (v9 > 5) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = qword_1B886D9D0[v9];
  }

  return v5;
}

- (GEOURLRouteHandle)routeHandle
{
  v2 = [(MSPMutableHistoryEntryRoute *)self routeInformationSource];
  v3 = [v2 ifGEOStorageRouteRequestStorage];
  v4 = [v3 routeHandle];

  return (GEOURLRouteHandle *)v4;
}

- (GEOAutomobileOptions)automobileOptions
{
  v2 = [(MSPMutableHistoryEntryRoute *)self _routeRequestStorage];
  v3 = [v2 automobileOptions];

  return (GEOAutomobileOptions *)v3;
}

- (GEOTransitOptions)transitOptions
{
  v2 = [(MSPMutableHistoryEntryRoute *)self _routeRequestStorage];
  v3 = [v2 transitOptions];

  return (GEOTransitOptions *)v3;
}

- (GEOWalkingOptions)walkingOptions
{
  v2 = [(MSPMutableHistoryEntryRoute *)self _routeRequestStorage];
  v3 = [v2 walkingOptions];

  return (GEOWalkingOptions *)v3;
}

- (GEOCyclingOptions)cyclingOptions
{
  v2 = [(MSPMutableHistoryEntryRoute *)self _routeRequestStorage];
  v3 = [v2 cyclingOptions];

  return (GEOCyclingOptions *)v3;
}

- (BOOL)navigationWasInterrupted
{
  v2 = [(MSPMutableHistoryEntry *)self storage];
  v3 = [v2 directionsSearch];
  char v4 = [v3 navigationInterrupted];

  return v4;
}

- (void)setNavigationInterrupted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MSPMutableHistoryEntry *)self storage];
  char v4 = [v5 directionsSearch];
  [v4 setNavigationInterrupted:v3];
}

- (NSData)archivedSharedTripData
{
  return 0;
}

- (id)transferToImmutableIfValidWithError:(id *)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [(MSPMutableHistoryEntryRoute *)self routeInformationSource];

  if (!v6)
  {
    v8 = @"routeInformationSource";
    goto LABEL_7;
  }
  int v7 = [(MSPMutableHistoryEntryRoute *)self endWaypoint];

  if (!v7) {
    [v5 addObject:@"endWaypoint"];
  }
  if (![(MSPMutableHistoryEntryRoute *)self transportType])
  {
    v8 = @"transportType";
LABEL_7:
    [v5 addObject:v8];
  }
  if ([v5 count])
  {
    if (a3)
    {
      unsigned int v9 = (void *)MEMORY[0x1E4F28C58];
      v12[0] = @"MSPContainerUntransferableObject";
      v12[1] = @"MSPContainerUnavailableKeys";
      v13[0] = self;
      v13[1] = v5;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
      *a3 = [v9 errorWithDomain:@"com.apple.MapsSupport.MSPContainer" code:1 userInfo:v10];

      a3 = 0;
    }
  }
  else
  {
    [(MSPMutableHistoryEntry *)self _markImmutable];
    a3 = self;
  }

  return a3;
}

- (BOOL)_isUserVisibleDuplicateOfSameClassObject:(id)a3
{
  id v5 = a3;
  v6 = [(MSPMutableHistoryEntryRoute *)self startWaypoint];
  if (v6)
  {
    int v7 = [(MSPMutableHistoryEntryRoute *)self startWaypoint];
    uint64_t v3 = [v7 isCurrentLocation];

    int v8 = v3 ^ 1;
  }
  else
  {
    int v8 = 0;
  }

  unsigned int v9 = [v5 startWaypoint];
  if (v9)
  {
    v10 = [v5 startWaypoint];
    uint64_t v3 = [v10 isCurrentLocation];

    int v11 = v3 ^ 1;
  }
  else
  {
    int v11 = 0;
  }

  if ((v8 | v11) == 1)
  {
    v12 = [(MSPMutableHistoryEntryRoute *)self startWaypoint];
    if (v12)
    {
      uint64_t v3 = [v5 startWaypoint];
      if (v3)
      {
        v13 = [(MSPMutableHistoryEntryRoute *)self startWaypoint];
        v14 = [v13 geoMapItem];
        v15 = [v5 startWaypoint];
        v16 = [v15 geoMapItem];
        char IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose();
      }
      else
      {
        char IsEqualToMapItemForPurpose = 0;
      }
    }
    else
    {
      char IsEqualToMapItemForPurpose = 0;
    }
  }
  else
  {
    char IsEqualToMapItemForPurpose = 1;
  }
  v18 = [(MSPMutableHistoryEntryRoute *)self endWaypoint];
  int v19 = [v18 isCurrentLocation];
  if (v19)
  {
    uint64_t v3 = [v5 endWaypoint];
    if ([(id)v3 isCurrentLocation])
    {
      char v20 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  v21 = [(MSPMutableHistoryEntryRoute *)self endWaypoint];
  uint64_t v22 = [v21 geoMapItem];
  v23 = [v5 endWaypoint];
  uint64_t v24 = [v23 geoMapItem];
  char v20 = GEOMapItemIsEqualToMapItemForPurpose();

  if (v19) {
    goto LABEL_20;
  }
LABEL_21:

  return IsEqualToMapItemForPurpose & v20;
}

- (MSPRouteInformationSource)routeInformationSource
{
  return self->_routeInformationSource;
}

- (void).cxx_destruct
{
}

@end