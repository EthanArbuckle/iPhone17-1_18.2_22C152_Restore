@interface GEORPDirectionsFeedbackContext
+ (BOOL)isValid:(id)a3;
+ (Class)directionsRequestType;
+ (Class)directionsResponseType;
+ (Class)directionsWaypointPlaceInfoType;
+ (Class)rerouteLocationType;
+ (Class)routeType;
- (BOOL)hasEndWaypoint;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsRouteToPerson;
- (BOOL)hasStartWaypoint;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRouteToPerson;
- (BOOL)readFrom:(id)a3;
- (GEORPDirectionsFeedbackContext)init;
- (GEORPDirectionsFeedbackContext)initWithData:(id)a3;
- (GEORPDirectionsFeedbackContext)initWithDictionary:(id)a3;
- (GEORPDirectionsFeedbackContext)initWithJSON:(id)a3;
- (GEORPUserSearchInput)endWaypoint;
- (GEORPUserSearchInput)startWaypoint;
- (NSMutableArray)directionsRequests;
- (NSMutableArray)directionsResponses;
- (NSMutableArray)directionsWaypointPlaceInfos;
- (NSMutableArray)rerouteLocations;
- (NSMutableArray)routes;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)directionsRequestAtIndex:(unint64_t)a3;
- (id)directionsResponseAtIndex:(unint64_t)a3;
- (id)directionsWaypointPlaceInfoAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)rerouteLocationAtIndex:(unint64_t)a3;
- (id)routeAtIndex:(unint64_t)a3;
- (unint64_t)directionsRequestsCount;
- (unint64_t)directionsResponsesCount;
- (unint64_t)directionsWaypointPlaceInfosCount;
- (unint64_t)hash;
- (unint64_t)rerouteLocationsCount;
- (unint64_t)routesCount;
- (void)_addNoFlagsDirectionsRequest:(uint64_t)a1;
- (void)_addNoFlagsDirectionsResponse:(uint64_t)a1;
- (void)_addNoFlagsDirectionsWaypointPlaceInfo:(uint64_t)a1;
- (void)_addNoFlagsRerouteLocation:(uint64_t)a1;
- (void)_addNoFlagsRoute:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDirectionsRequests;
- (void)_readDirectionsResponses;
- (void)_readDirectionsWaypointPlaceInfos;
- (void)_readEndWaypoint;
- (void)_readRerouteLocations;
- (void)_readRoutes;
- (void)_readStartWaypoint;
- (void)addDirectionsRequest:(id)a3;
- (void)addDirectionsResponse:(id)a3;
- (void)addDirectionsWaypointPlaceInfo:(id)a3;
- (void)addRerouteLocation:(id)a3;
- (void)addRoute:(id)a3;
- (void)clearDirectionsRequests;
- (void)clearDirectionsResponses;
- (void)clearDirectionsWaypointPlaceInfos;
- (void)clearRerouteLocations;
- (void)clearRoutes;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDirectionsRequests:(id)a3;
- (void)setDirectionsResponses:(id)a3;
- (void)setDirectionsWaypointPlaceInfos:(id)a3;
- (void)setEndWaypoint:(id)a3;
- (void)setHasIsRouteToPerson:(BOOL)a3;
- (void)setIsRouteToPerson:(BOOL)a3;
- (void)setRerouteLocations:(id)a3;
- (void)setRoutes:(id)a3;
- (void)setStartWaypoint:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPDirectionsFeedbackContext

- (GEORPDirectionsFeedbackContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPDirectionsFeedbackContext;
  v2 = [(GEORPDirectionsFeedbackContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPDirectionsFeedbackContext)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPDirectionsFeedbackContext;
  v3 = [(GEORPDirectionsFeedbackContext *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionsRequests
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsRequests_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)directionsRequests
{
  -[GEORPDirectionsFeedbackContext _readDirectionsRequests]((uint64_t)self);
  directionsRequests = self->_directionsRequests;

  return directionsRequests;
}

- (void)setDirectionsRequests:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  directionsRequests = self->_directionsRequests;
  self->_directionsRequests = v4;
}

- (void)clearDirectionsRequests
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  directionsRequests = self->_directionsRequests;

  [(NSMutableArray *)directionsRequests removeAllObjects];
}

- (void)addDirectionsRequest:(id)a3
{
  id v4 = a3;
  -[GEORPDirectionsFeedbackContext _readDirectionsRequests]((uint64_t)self);
  -[GEORPDirectionsFeedbackContext _addNoFlagsDirectionsRequest:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsDirectionsRequest:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)directionsRequestsCount
{
  -[GEORPDirectionsFeedbackContext _readDirectionsRequests]((uint64_t)self);
  directionsRequests = self->_directionsRequests;

  return [(NSMutableArray *)directionsRequests count];
}

- (id)directionsRequestAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsFeedbackContext _readDirectionsRequests]((uint64_t)self);
  directionsRequests = self->_directionsRequests;

  return (id)[(NSMutableArray *)directionsRequests objectAtIndex:a3];
}

+ (Class)directionsRequestType
{
  return (Class)objc_opt_class();
}

- (void)_readDirectionsResponses
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsResponses_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)directionsResponses
{
  -[GEORPDirectionsFeedbackContext _readDirectionsResponses]((uint64_t)self);
  directionsResponses = self->_directionsResponses;

  return directionsResponses;
}

- (void)setDirectionsResponses:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  directionsResponses = self->_directionsResponses;
  self->_directionsResponses = v4;
}

- (void)clearDirectionsResponses
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  directionsResponses = self->_directionsResponses;

  [(NSMutableArray *)directionsResponses removeAllObjects];
}

- (void)addDirectionsResponse:(id)a3
{
  id v4 = a3;
  -[GEORPDirectionsFeedbackContext _readDirectionsResponses]((uint64_t)self);
  -[GEORPDirectionsFeedbackContext _addNoFlagsDirectionsResponse:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsDirectionsResponse:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)directionsResponsesCount
{
  -[GEORPDirectionsFeedbackContext _readDirectionsResponses]((uint64_t)self);
  directionsResponses = self->_directionsResponses;

  return [(NSMutableArray *)directionsResponses count];
}

- (id)directionsResponseAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsFeedbackContext _readDirectionsResponses]((uint64_t)self);
  directionsResponses = self->_directionsResponses;

  return (id)[(NSMutableArray *)directionsResponses objectAtIndex:a3];
}

+ (Class)directionsResponseType
{
  return (Class)objc_opt_class();
}

- (void)_readDirectionsWaypointPlaceInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsWaypointPlaceInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)directionsWaypointPlaceInfos
{
  -[GEORPDirectionsFeedbackContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;

  return directionsWaypointPlaceInfos;
}

- (void)setDirectionsWaypointPlaceInfos:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;
  self->_directionsWaypointPlaceInfos = v4;
}

- (void)clearDirectionsWaypointPlaceInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;

  [(NSMutableArray *)directionsWaypointPlaceInfos removeAllObjects];
}

- (void)addDirectionsWaypointPlaceInfo:(id)a3
{
  id v4 = a3;
  -[GEORPDirectionsFeedbackContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  -[GEORPDirectionsFeedbackContext _addNoFlagsDirectionsWaypointPlaceInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsDirectionsWaypointPlaceInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)directionsWaypointPlaceInfosCount
{
  -[GEORPDirectionsFeedbackContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;

  return [(NSMutableArray *)directionsWaypointPlaceInfos count];
}

- (id)directionsWaypointPlaceInfoAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsFeedbackContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;

  return (id)[(NSMutableArray *)directionsWaypointPlaceInfos objectAtIndex:a3];
}

+ (Class)directionsWaypointPlaceInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readStartWaypoint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStartWaypoint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasStartWaypoint
{
  return self->_startWaypoint != 0;
}

- (GEORPUserSearchInput)startWaypoint
{
  -[GEORPDirectionsFeedbackContext _readStartWaypoint]((uint64_t)self);
  startWaypoint = self->_startWaypoint;

  return startWaypoint;
}

- (void)setStartWaypoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_startWaypoint, a3);
}

- (void)_readEndWaypoint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEndWaypoint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasEndWaypoint
{
  return self->_endWaypoint != 0;
}

- (GEORPUserSearchInput)endWaypoint
{
  -[GEORPDirectionsFeedbackContext _readEndWaypoint]((uint64_t)self);
  endWaypoint = self->_endWaypoint;

  return endWaypoint;
}

- (void)setEndWaypoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_endWaypoint, a3);
}

- (void)_readRoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)routes
{
  -[GEORPDirectionsFeedbackContext _readRoutes]((uint64_t)self);
  routes = self->_routes;

  return routes;
}

- (void)setRoutes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  routes = self->_routes;
  self->_routes = v4;
}

- (void)clearRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  routes = self->_routes;

  [(NSMutableArray *)routes removeAllObjects];
}

- (void)addRoute:(id)a3
{
  id v4 = a3;
  -[GEORPDirectionsFeedbackContext _readRoutes]((uint64_t)self);
  -[GEORPDirectionsFeedbackContext _addNoFlagsRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsRoute:(uint64_t)a1
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

- (unint64_t)routesCount
{
  -[GEORPDirectionsFeedbackContext _readRoutes]((uint64_t)self);
  routes = self->_routes;

  return [(NSMutableArray *)routes count];
}

- (id)routeAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsFeedbackContext _readRoutes]((uint64_t)self);
  routes = self->_routes;

  return (id)[(NSMutableArray *)routes objectAtIndex:a3];
}

+ (Class)routeType
{
  return (Class)objc_opt_class();
}

- (void)_readRerouteLocations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRerouteLocations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)rerouteLocations
{
  -[GEORPDirectionsFeedbackContext _readRerouteLocations]((uint64_t)self);
  rerouteLocations = self->_rerouteLocations;

  return rerouteLocations;
}

- (void)setRerouteLocations:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  rerouteLocations = self->_rerouteLocations;
  self->_rerouteLocations = v4;
}

- (void)clearRerouteLocations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  rerouteLocations = self->_rerouteLocations;

  [(NSMutableArray *)rerouteLocations removeAllObjects];
}

- (void)addRerouteLocation:(id)a3
{
  id v4 = a3;
  -[GEORPDirectionsFeedbackContext _readRerouteLocations]((uint64_t)self);
  -[GEORPDirectionsFeedbackContext _addNoFlagsRerouteLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsRerouteLocation:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)rerouteLocationsCount
{
  -[GEORPDirectionsFeedbackContext _readRerouteLocations]((uint64_t)self);
  rerouteLocations = self->_rerouteLocations;

  return [(NSMutableArray *)rerouteLocations count];
}

- (id)rerouteLocationAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsFeedbackContext _readRerouteLocations]((uint64_t)self);
  rerouteLocations = self->_rerouteLocations;

  return (id)[(NSMutableArray *)rerouteLocations objectAtIndex:a3];
}

+ (Class)rerouteLocationType
{
  return (Class)objc_opt_class();
}

- (BOOL)isRouteToPerson
{
  return self->_isRouteToPerson;
}

- (void)setIsRouteToPerson:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_isRouteToPerson = a3;
}

- (void)setHasIsRouteToPerson:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasIsRouteToPerson
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPDirectionsFeedbackContext;
  id v4 = [(GEORPDirectionsFeedbackContext *)&v8 description];
  id v5 = [(GEORPDirectionsFeedbackContext *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPDirectionsFeedbackContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v6 = *(id *)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v83 objects:v91 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v84;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v84 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v83 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v83 objects:v91 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"directionsRequest";
      }
      else {
        v13 = @"directions_request";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v79 objects:v90 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v80;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v80 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v79 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v79 objects:v90 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"directionsResponse";
      }
      else {
        v22 = @"directions_response";
      }
      [v4 setObject:v14 forKey:v22];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v24 = *(id *)(a1 + 40);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v75 objects:v89 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v76;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v76 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v75 + 1) + 8 * k);
            if (a2) {
              [v29 jsonRepresentation];
            }
            else {
            v30 = [v29 dictionaryRepresentation];
            }
            [v23 addObject:v30];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v75 objects:v89 count:16];
        }
        while (v26);
      }

      if (a2) {
        v31 = @"directionsWaypointPlaceInfo";
      }
      else {
        v31 = @"directions_waypoint_place_info";
      }
      [v4 setObject:v23 forKey:v31];
    }
    v32 = [(id)a1 startWaypoint];
    v33 = v32;
    if (v32)
    {
      if (a2)
      {
        v34 = [v32 jsonRepresentation];
        v35 = @"startWaypoint";
      }
      else
      {
        v34 = [v32 dictionaryRepresentation];
        v35 = @"start_waypoint";
      }
      [v4 setObject:v34 forKey:v35];
    }
    v36 = [(id)a1 endWaypoint];
    v37 = v36;
    if (v36)
    {
      if (a2)
      {
        v38 = [v36 jsonRepresentation];
        v39 = @"endWaypoint";
      }
      else
      {
        v38 = [v36 dictionaryRepresentation];
        v39 = @"end_waypoint";
      }
      [v4 setObject:v38 forKey:v39];
    }
    if ([*(id *)(a1 + 64) count])
    {
      v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v41 = *(id *)(a1 + 64);
      uint64_t v42 = [v41 countByEnumeratingWithState:&v71 objects:v88 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v72;
        do
        {
          for (uint64_t m = 0; m != v43; ++m)
          {
            if (*(void *)v72 != v44) {
              objc_enumerationMutation(v41);
            }
            v46 = *(void **)(*((void *)&v71 + 1) + 8 * m);
            if (a2) {
              [v46 jsonRepresentation];
            }
            else {
            v47 = [v46 dictionaryRepresentation];
            }
            [v40 addObject:v47];
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v71 objects:v88 count:16];
        }
        while (v43);
      }

      [v4 setObject:v40 forKey:@"route"];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v49 = *(id *)(a1 + 56);
      uint64_t v50 = [v49 countByEnumeratingWithState:&v67 objects:v87 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v68;
        do
        {
          for (uint64_t n = 0; n != v51; ++n)
          {
            if (*(void *)v68 != v52) {
              objc_enumerationMutation(v49);
            }
            v54 = *(void **)(*((void *)&v67 + 1) + 8 * n);
            if (a2) {
              [v54 jsonRepresentation];
            }
            else {
            v55 = [v54 dictionaryRepresentation];
            }
            [v48 addObject:v55];
          }
          uint64_t v51 = [v49 countByEnumeratingWithState:&v67 objects:v87 count:16];
        }
        while (v51);
      }

      [v4 setObject:v48 forKey:@"rerouteLocation"];
    }
    if (*(_WORD *)(a1 + 96))
    {
      v56 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 92)];
      if (a2) {
        v57 = @"isRouteToPerson";
      }
      else {
        v57 = @"is_route_to_person";
      }
      [v4 setObject:v56 forKey:v57];
    }
    v58 = *(void **)(a1 + 16);
    if (v58)
    {
      v59 = [v58 dictionaryRepresentation];
      v60 = v59;
      if (a2)
      {
        v61 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v59, "count"));
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __60__GEORPDirectionsFeedbackContext__dictionaryRepresentation___block_invoke;
        v65[3] = &unk_1E53D8860;
        id v62 = v61;
        id v66 = v62;
        [v60 enumerateKeysAndObjectsUsingBlock:v65];
        id v63 = v62;

        v60 = v63;
      }
      [v4 setObject:v60 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPDirectionsFeedbackContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEORPDirectionsFeedbackContext__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (GEORPDirectionsFeedbackContext)initWithDictionary:(id)a3
{
  return (GEORPDirectionsFeedbackContext *)-[GEORPDirectionsFeedbackContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"directionsRequest";
      }
      else {
        id v6 = @"directions_request";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v72 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v89 objects:v97 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v90;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v90 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v89 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEODirectionsRequest alloc];
                if (a3) {
                  uint64_t v15 = [(GEODirectionsRequest *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEODirectionsRequest *)v14 initWithDictionary:v13];
                }
                uint64_t v16 = (void *)v15;
                [a1 addDirectionsRequest:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v89 objects:v97 count:16];
          }
          while (v10);
        }

        id v5 = v72;
      }

      if (a3) {
        uint64_t v17 = @"directionsResponse";
      }
      else {
        uint64_t v17 = @"directions_response";
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v85 objects:v96 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v86;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v86 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v85 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v25 = [GEODirectionsResponse alloc];
                if (a3) {
                  uint64_t v26 = [(GEODirectionsResponse *)v25 initWithJSON:v24];
                }
                else {
                  uint64_t v26 = [(GEODirectionsResponse *)v25 initWithDictionary:v24];
                }
                uint64_t v27 = (void *)v26;
                [a1 addDirectionsResponse:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v85 objects:v96 count:16];
          }
          while (v21);
        }

        id v5 = v72;
      }

      if (a3) {
        v28 = @"directionsWaypointPlaceInfo";
      }
      else {
        v28 = @"directions_waypoint_place_info";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v30 = v29;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v81 objects:v95 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v82;
          do
          {
            for (uint64_t k = 0; k != v32; ++k)
            {
              if (*(void *)v82 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v81 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v36 = [GEORPPlaceRequestResponse alloc];
                if (a3) {
                  uint64_t v37 = [(GEORPPlaceRequestResponse *)v36 initWithJSON:v35];
                }
                else {
                  uint64_t v37 = [(GEORPPlaceRequestResponse *)v36 initWithDictionary:v35];
                }
                v38 = (void *)v37;
                [a1 addDirectionsWaypointPlaceInfo:v37];
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v81 objects:v95 count:16];
          }
          while (v32);
        }

        id v5 = v72;
      }

      if (a3) {
        v39 = @"startWaypoint";
      }
      else {
        v39 = @"start_waypoint";
      }
      v40 = [v5 objectForKeyedSubscript:v39];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v41 = [GEORPUserSearchInput alloc];
        if (a3) {
          uint64_t v42 = [(GEORPUserSearchInput *)v41 initWithJSON:v40];
        }
        else {
          uint64_t v42 = [(GEORPUserSearchInput *)v41 initWithDictionary:v40];
        }
        uint64_t v43 = (void *)v42;
        [a1 setStartWaypoint:v42];
      }
      if (a3) {
        uint64_t v44 = @"endWaypoint";
      }
      else {
        uint64_t v44 = @"end_waypoint";
      }
      v45 = [v5 objectForKeyedSubscript:v44];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v46 = [GEORPUserSearchInput alloc];
        if (a3) {
          uint64_t v47 = [(GEORPUserSearchInput *)v46 initWithJSON:v45];
        }
        else {
          uint64_t v47 = [(GEORPUserSearchInput *)v46 initWithDictionary:v45];
        }
        v48 = (void *)v47;
        [a1 setEndWaypoint:v47];
      }
      id v49 = [v5 objectForKeyedSubscript:@"route"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v50 = v49;
        uint64_t v51 = [v50 countByEnumeratingWithState:&v77 objects:v94 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v78;
          do
          {
            for (uint64_t m = 0; m != v52; ++m)
            {
              if (*(void *)v78 != v53) {
                objc_enumerationMutation(v50);
              }
              uint64_t v55 = *(void *)(*((void *)&v77 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v56 = [GEOWaypointRoute alloc];
                if (a3) {
                  uint64_t v57 = [(GEOWaypointRoute *)v56 initWithJSON:v55];
                }
                else {
                  uint64_t v57 = [(GEOWaypointRoute *)v56 initWithDictionary:v55];
                }
                v58 = (void *)v57;
                [a1 addRoute:v57];
              }
            }
            uint64_t v52 = [v50 countByEnumeratingWithState:&v77 objects:v94 count:16];
          }
          while (v52);
        }

        id v5 = v72;
      }

      v59 = [v5 objectForKeyedSubscript:@"rerouteLocation"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v60 = v59;
        uint64_t v61 = [v60 countByEnumeratingWithState:&v73 objects:v93 count:16];
        if (v61)
        {
          uint64_t v62 = v61;
          uint64_t v63 = *(void *)v74;
          do
          {
            for (uint64_t n = 0; n != v62; ++n)
            {
              if (*(void *)v74 != v63) {
                objc_enumerationMutation(v60);
              }
              uint64_t v65 = *(void *)(*((void *)&v73 + 1) + 8 * n);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v66 = [GEOLatLng alloc];
                if (a3) {
                  uint64_t v67 = [(GEOLatLng *)v66 initWithJSON:v65];
                }
                else {
                  uint64_t v67 = [(GEOLatLng *)v66 initWithDictionary:v65];
                }
                long long v68 = (void *)v67;
                [a1 addRerouteLocation:v67];
              }
            }
            uint64_t v62 = [v60 countByEnumeratingWithState:&v73 objects:v93 count:16];
          }
          while (v62);
        }

        id v5 = v72;
      }

      if (a3) {
        long long v69 = @"isRouteToPerson";
      }
      else {
        long long v69 = @"is_route_to_person";
      }
      long long v70 = [v5 objectForKeyedSubscript:v69];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsRouteToPerson:", objc_msgSend(v70, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORPDirectionsFeedbackContext)initWithJSON:(id)a3
{
  return (GEORPDirectionsFeedbackContext *)-[GEORPDirectionsFeedbackContext _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_819;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_820;
    }
    GEORPDirectionsFeedbackContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPDirectionsFeedbackContextCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDirectionsFeedbackContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDirectionsFeedbackContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPDirectionsFeedbackContextIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v26 = self->_reader;
    objc_sync_enter(v26);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v27 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v27];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v26);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPDirectionsFeedbackContext *)self readAll:0];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v6 = self->_directionsRequests;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v45 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v7);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v10 = self->_directionsResponses;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v40 objects:v51 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v40 objects:v51 count:16];
      }
      while (v11);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v14 = self->_directionsWaypointPlaceInfos;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v36 objects:v50 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v37;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v36 objects:v50 count:16];
      }
      while (v15);
    }

    if (self->_startWaypoint) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_endWaypoint) {
      PBDataWriterWriteSubmessage();
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v18 = self->_routes;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t m = 0; m != v19; ++m)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v49 count:16];
      }
      while (v19);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v22 = self->_rerouteLocations;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v28 objects:v48 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v29;
      do
      {
        for (uint64_t n = 0; n != v23; ++n)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v22);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v28 objects:v48 count:16];
      }
      while (v23);
    }

    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v28);
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  -[GEORPDirectionsFeedbackContext _readDirectionsRequests]((uint64_t)self);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v5 = self->_directionsRequests;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v44;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v44 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v43 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_43;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEORPDirectionsFeedbackContext _readDirectionsResponses]((uint64_t)self);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = self->_directionsResponses;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v40 != v12) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v39 + 1) + 8 * v13) hasGreenTeaWithValue:v3]) {
        goto LABEL_43;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v39 objects:v50 count:16];
        if (v11) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  -[GEORPDirectionsFeedbackContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = self->_directionsWaypointPlaceInfos;
  uint64_t v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v36;
LABEL_19:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v36 != v16) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v35 + 1) + 8 * v17) hasGreenTeaWithValue:v3]) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v35 objects:v49 count:16];
        if (v15) {
          goto LABEL_19;
        }
        goto LABEL_25;
      }
    }
LABEL_43:

    return 1;
  }
LABEL_25:

  -[GEORPDirectionsFeedbackContext _readEndWaypoint]((uint64_t)self);
  if (![(GEORPUserSearchInput *)self->_endWaypoint hasGreenTeaWithValue:v3])
  {
    -[GEORPDirectionsFeedbackContext _readRerouteLocations]((uint64_t)self);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v5 = self->_rerouteLocations;
    uint64_t v18 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v31 objects:v48 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
LABEL_28:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v31 + 1) + 8 * v21) hasGreenTeaWithValue:v3]) {
          break;
        }
        if (v19 == ++v21)
        {
          uint64_t v19 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v31 objects:v48 count:16];
          if (v19) {
            goto LABEL_28;
          }
          goto LABEL_34;
        }
      }
    }
    else
    {
LABEL_34:

      -[GEORPDirectionsFeedbackContext _readRoutes]((uint64_t)self);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v5 = self->_routes;
      uint64_t v22 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v47 count:16];
      if (!v22)
      {
LABEL_42:

        -[GEORPDirectionsFeedbackContext _readStartWaypoint]((uint64_t)self);
        return [(GEORPUserSearchInput *)self->_startWaypoint hasGreenTeaWithValue:v3];
      }
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v28;
LABEL_36:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v25), "hasGreenTeaWithValue:", v3, (void)v27)) {
          break;
        }
        if (v23 == ++v25)
        {
          uint64_t v23 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v47 count:16];
          if (v23) {
            goto LABEL_36;
          }
          goto LABEL_42;
        }
      }
    }
    goto LABEL_43;
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  uint64_t v24 = (id *)a3;
  [(GEORPDirectionsFeedbackContext *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v24 + 1, self->_reader);
  *((_DWORD *)v24 + 20) = self->_readerMarkPos;
  *((_DWORD *)v24 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPDirectionsFeedbackContext *)self directionsRequestsCount])
  {
    [v24 clearDirectionsRequests];
    unint64_t v4 = [(GEORPDirectionsFeedbackContext *)self directionsRequestsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPDirectionsFeedbackContext *)self directionsRequestAtIndex:i];
        [v24 addDirectionsRequest:v7];
      }
    }
  }
  if ([(GEORPDirectionsFeedbackContext *)self directionsResponsesCount])
  {
    [v24 clearDirectionsResponses];
    unint64_t v8 = [(GEORPDirectionsFeedbackContext *)self directionsResponsesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORPDirectionsFeedbackContext *)self directionsResponseAtIndex:j];
        [v24 addDirectionsResponse:v11];
      }
    }
  }
  if ([(GEORPDirectionsFeedbackContext *)self directionsWaypointPlaceInfosCount])
  {
    [v24 clearDirectionsWaypointPlaceInfos];
    unint64_t v12 = [(GEORPDirectionsFeedbackContext *)self directionsWaypointPlaceInfosCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEORPDirectionsFeedbackContext *)self directionsWaypointPlaceInfoAtIndex:k];
        [v24 addDirectionsWaypointPlaceInfo:v15];
      }
    }
  }
  if (self->_startWaypoint) {
    objc_msgSend(v24, "setStartWaypoint:");
  }
  if (self->_endWaypoint) {
    objc_msgSend(v24, "setEndWaypoint:");
  }
  if ([(GEORPDirectionsFeedbackContext *)self routesCount])
  {
    [v24 clearRoutes];
    unint64_t v16 = [(GEORPDirectionsFeedbackContext *)self routesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(GEORPDirectionsFeedbackContext *)self routeAtIndex:m];
        [v24 addRoute:v19];
      }
    }
  }
  if ([(GEORPDirectionsFeedbackContext *)self rerouteLocationsCount])
  {
    [v24 clearRerouteLocations];
    unint64_t v20 = [(GEORPDirectionsFeedbackContext *)self rerouteLocationsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(GEORPDirectionsFeedbackContext *)self rerouteLocationAtIndex:n];
        [v24 addRerouteLocation:v23];
      }
    }
  }
  if (*(_WORD *)&self->_flags)
  {
    *((unsigned char *)v24 + 92) = self->_isRouteToPerson;
    *((_WORD *)v24 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPDirectionsFeedbackContextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_43;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPDirectionsFeedbackContext *)self readAll:0];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  unint64_t v9 = self->_directionsRequests;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v57 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v56 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addDirectionsRequest:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v10);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v14 = self->_directionsResponses;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v53 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v52 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addDirectionsResponse:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v15);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v19 = self->_directionsWaypointPlaceInfos;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v49 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v48 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addDirectionsWaypointPlaceInfo:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v48 objects:v62 count:16];
    }
    while (v20);
  }

  id v24 = [(GEORPUserSearchInput *)self->_startWaypoint copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v24;

  id v26 = [(GEORPUserSearchInput *)self->_endWaypoint copyWithZone:a3];
  long long v27 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v26;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v28 = self->_routes;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v44 objects:v61 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v45;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v45 != v30) {
          objc_enumerationMutation(v28);
        }
        long long v32 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addRoute:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v44 objects:v61 count:16];
    }
    while (v29);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v33 = self->_rerouteLocations;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v40 objects:v60 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v41;
    do
    {
      for (uint64_t n = 0; n != v34; ++n)
      {
        if (*(void *)v41 != v35) {
          objc_enumerationMutation(v33);
        }
        long long v37 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * n), "copyWithZone:", a3, (void)v40);
        [(id)v5 addRerouteLocation:v37];
      }
      uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v40 objects:v60 count:16];
    }
    while (v34);
  }

  if (*(_WORD *)&self->_flags)
  {
    *(unsigned char *)(v5 + 92) = self->_isRouteToPerson;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  long long v38 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v38;
LABEL_43:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEORPDirectionsFeedbackContext *)self readAll:1];
  [v4 readAll:1];
  directionsRequests = self->_directionsRequests;
  if ((unint64_t)directionsRequests | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](directionsRequests, "isEqual:")) {
      goto LABEL_18;
    }
  }
  directionsResponses = self->_directionsResponses;
  if ((unint64_t)directionsResponses | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](directionsResponses, "isEqual:")) {
      goto LABEL_18;
    }
  }
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;
  if ((unint64_t)directionsWaypointPlaceInfos | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](directionsWaypointPlaceInfos, "isEqual:")) {
      goto LABEL_18;
    }
  }
  startWaypoint = self->_startWaypoint;
  if ((unint64_t)startWaypoint | *((void *)v4 + 9))
  {
    if (!-[GEORPUserSearchInput isEqual:](startWaypoint, "isEqual:")) {
      goto LABEL_18;
    }
  }
  endWaypoint = self->_endWaypoint;
  if ((unint64_t)endWaypoint | *((void *)v4 + 6))
  {
    if (!-[GEORPUserSearchInput isEqual:](endWaypoint, "isEqual:")) {
      goto LABEL_18;
    }
  }
  routes = self->_routes;
  if ((unint64_t)routes | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](routes, "isEqual:")) {
      goto LABEL_18;
    }
  }
  rerouteLocations = self->_rerouteLocations;
  if ((unint64_t)rerouteLocations | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](rerouteLocations, "isEqual:")) {
      goto LABEL_18;
    }
  }
  __int16 v12 = *((_WORD *)v4 + 48);
  BOOL v13 = (v12 & 1) == 0;
  if (*(_WORD *)&self->_flags)
  {
    if ((v12 & 1) == 0)
    {
LABEL_18:
      BOOL v13 = 0;
      goto LABEL_19;
    }
    if (self->_isRouteToPerson)
    {
      if (!*((unsigned char *)v4 + 92)) {
        goto LABEL_18;
      }
    }
    else if (*((unsigned char *)v4 + 92))
    {
      goto LABEL_18;
    }
    BOOL v13 = 1;
  }
LABEL_19:

  return v13;
}

- (unint64_t)hash
{
  [(GEORPDirectionsFeedbackContext *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_directionsRequests hash];
  uint64_t v4 = [(NSMutableArray *)self->_directionsResponses hash];
  uint64_t v5 = [(NSMutableArray *)self->_directionsWaypointPlaceInfos hash];
  unint64_t v6 = [(GEORPUserSearchInput *)self->_startWaypoint hash];
  unint64_t v7 = [(GEORPUserSearchInput *)self->_endWaypoint hash];
  uint64_t v8 = [(NSMutableArray *)self->_routes hash];
  uint64_t v9 = [(NSMutableArray *)self->_rerouteLocations hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v10 = 2654435761 * self->_isRouteToPerson;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEORPDirectionsFeedbackContext *)self addDirectionsRequest:*(void *)(*((void *)&v50 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v7);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v10 = *((id *)v4 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEORPDirectionsFeedbackContext *)self addDirectionsResponse:*(void *)(*((void *)&v46 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v12);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v15 = *((id *)v4 + 5);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEORPDirectionsFeedbackContext *)self addDirectionsWaypointPlaceInfo:*(void *)(*((void *)&v42 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v56 count:16];
    }
    while (v17);
  }

  startWaypoint = self->_startWaypoint;
  uint64_t v21 = *((void *)v4 + 9);
  if (startWaypoint)
  {
    if (v21) {
      -[GEORPUserSearchInput mergeFrom:](startWaypoint, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[GEORPDirectionsFeedbackContext setStartWaypoint:](self, "setStartWaypoint:");
  }
  endWaypoint = self->_endWaypoint;
  uint64_t v23 = *((void *)v4 + 6);
  if (endWaypoint)
  {
    if (v23) {
      -[GEORPUserSearchInput mergeFrom:](endWaypoint, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[GEORPDirectionsFeedbackContext setEndWaypoint:](self, "setEndWaypoint:");
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v24 = *((id *)v4 + 8);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v55 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v39;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(v24);
        }
        [(GEORPDirectionsFeedbackContext *)self addRoute:*(void *)(*((void *)&v38 + 1) + 8 * m)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v55 count:16];
    }
    while (v26);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v29 = *((id *)v4 + 7);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v34 objects:v54 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v35;
    do
    {
      for (uint64_t n = 0; n != v31; ++n)
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(v29);
        }
        -[GEORPDirectionsFeedbackContext addRerouteLocation:](self, "addRerouteLocation:", *(void *)(*((void *)&v34 + 1) + 8 * n), (void)v34);
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v34 objects:v54 count:16];
    }
    while (v31);
  }

  if (*((_WORD *)v4 + 48))
  {
    self->_isRouteToPersouint64_t n = *((unsigned char *)v4 + 92);
    *(_WORD *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEORPDirectionsFeedbackContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_824);
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
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x202u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPDirectionsFeedbackContext *)self readAll:0];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v7 = self->_directionsRequests;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v49;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v49 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v48 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v9);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v12 = self->_directionsResponses;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v45;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v45 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v44 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
      }
      while (v14);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v17 = self->_directionsWaypointPlaceInfos;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v41;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * v21++) clearUnknownFields:1];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
      }
      while (v19);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v22 = self->_routes;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v37;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v36 + 1) + 8 * v26++) clearUnknownFields:1];
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
      }
      while (v24);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v27 = self->_rerouteLocations;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v33;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v33 != v30) {
            objc_enumerationMutation(v27);
          }
          objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v31++), "clearUnknownFields:", 1, (void)v32);
        }
        while (v29 != v31);
        uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
      }
      while (v29);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startWaypoint, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_rerouteLocations, 0);
  objc_storeStrong((id *)&self->_endWaypoint, 0);
  objc_storeStrong((id *)&self->_directionsWaypointPlaceInfos, 0);
  objc_storeStrong((id *)&self->_directionsResponses, 0);
  objc_storeStrong((id *)&self->_directionsRequests, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end