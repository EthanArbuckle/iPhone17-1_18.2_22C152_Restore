@interface GEOETATrafficUpdateResponse
+ (BOOL)isValid:(id)a3;
+ (Class)arrivalParametersType;
+ (Class)cameraType;
+ (Class)internalErrorType;
+ (Class)routeType;
+ (Class)trafficSignalType;
- (BOOL)hasClientMetrics;
- (BOOL)hasDatasetAbStatus;
- (BOOL)hasDebugData;
- (BOOL)hasDisplayedEta;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasResponseAttributes;
- (BOOL)hasResponseId;
- (BOOL)hasSessionState;
- (BOOL)hasStatus;
- (BOOL)hasTripId;
- (BOOL)hasWaypointRoute;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOClientMetrics)clientMetrics;
- (GEOCommonResponseAttributes)responseAttributes;
- (GEOETATrafficUpdateResponse)init;
- (GEOETATrafficUpdateResponse)initWithData:(id)a3;
- (GEOETATrafficUpdateResponse)initWithDictionary:(id)a3;
- (GEOETATrafficUpdateResponse)initWithJSON:(id)a3;
- (GEOETATrafficUpdateWaypointRoute)waypointRoute;
- (GEOPDDatasetABStatus)datasetAbStatus;
- (GEOProblemDetail)problemDetailAtIndex:(unint64_t)a3;
- (GEOProblemDetail)problemDetails;
- (GEOUUID)tripId;
- (NSData)responseId;
- (NSData)sessionState;
- (NSMutableArray)arrivalParameters;
- (NSMutableArray)cameras;
- (NSMutableArray)internalErrors;
- (NSMutableArray)routes;
- (NSMutableArray)trafficSignals;
- (NSString)debugData;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_geoTrafficCameras;
- (id)_geoTrafficSignals;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)arrivalParametersAtIndex:(unint64_t)a3;
- (id)cameraAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)internalErrorAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)routeAtIndex:(unint64_t)a3;
- (id)statusAsString:(int)a3;
- (id)trafficSignalAtIndex:(unint64_t)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (uint64_t)_reserveProblemDetails:(uint64_t)a1;
- (unint64_t)arrivalParametersCount;
- (unint64_t)camerasCount;
- (unint64_t)hash;
- (unint64_t)internalErrorsCount;
- (unint64_t)problemDetailsCount;
- (unint64_t)routesCount;
- (unint64_t)trafficSignalsCount;
- (unsigned)displayedEta;
- (void)_addNoFlagsArrivalParameters:(uint64_t)a1;
- (void)_addNoFlagsCamera:(uint64_t)a1;
- (void)_addNoFlagsInternalError:(uint64_t)a1;
- (void)_addNoFlagsRoute:(uint64_t)a1;
- (void)_addNoFlagsTrafficSignal:(uint64_t)a1;
- (void)_readArrivalParameters;
- (void)_readCameras;
- (void)_readClientMetrics;
- (void)_readDatasetAbStatus;
- (void)_readDebugData;
- (void)_readInternalErrors;
- (void)_readProblemDetails;
- (void)_readResponseAttributes;
- (void)_readResponseId;
- (void)_readRoutes;
- (void)_readSessionState;
- (void)_readTrafficSignals;
- (void)_readTripId;
- (void)_readWaypointRoute;
- (void)addArrivalParameters:(id)a3;
- (void)addCamera:(id)a3;
- (void)addInternalError:(id)a3;
- (void)addProblemDetail:(GEOProblemDetail)a3;
- (void)addRoute:(id)a3;
- (void)addTrafficSignal:(id)a3;
- (void)clearArrivalParameters;
- (void)clearCameras;
- (void)clearInternalErrors;
- (void)clearProblemDetails;
- (void)clearRoutes;
- (void)clearTrafficSignals;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArrivalParameters:(id)a3;
- (void)setCameras:(id)a3;
- (void)setClientMetrics:(id)a3;
- (void)setDatasetAbStatus:(id)a3;
- (void)setDebugData:(id)a3;
- (void)setDisplayedEta:(unsigned int)a3;
- (void)setHasDisplayedEta:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setInternalErrors:(id)a3;
- (void)setProblemDetails:(GEOProblemDetail *)a3 count:(unint64_t)a4;
- (void)setResponseAttributes:(id)a3;
- (void)setResponseId:(id)a3;
- (void)setRoutes:(id)a3;
- (void)setSessionState:(id)a3;
- (void)setStatus:(int)a3;
- (void)setTrafficSignals:(id)a3;
- (void)setTripId:(id)a3;
- (void)setWaypointRoute:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOETATrafficUpdateResponse

- (id)_geoTrafficCameras
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v4 = [(GEOETATrafficUpdateResponse *)self cameras];
  v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(GEOETATrafficUpdateResponse *)self cameras];
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
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 identifier];

        if (v12)
        {
          v13 = [v11 identifier];
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
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v4 = [(GEOETATrafficUpdateResponse *)self trafficSignals];
  v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(GEOETATrafficUpdateResponse *)self trafficSignals];
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
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 identifier];

        if (v12)
        {
          v13 = [v11 identifier];
          [v5 setObject:v11 forKeyedSubscript:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (GEOETATrafficUpdateResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOETATrafficUpdateResponse;
  v2 = [(GEOETATrafficUpdateResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOETATrafficUpdateResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOETATrafficUpdateResponse;
  v3 = [(GEOETATrafficUpdateResponse *)&v7 initWithData:a3];
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
  [(GEOETATrafficUpdateResponse *)self clearProblemDetails];
  v3.receiver = self;
  v3.super_class = (Class)GEOETATrafficUpdateResponse;
  [(GEOETATrafficUpdateResponse *)&v3 dealloc];
}

- (int)status
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $C15DF3E37EA3BCFA7E57A3C077E4117A flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 2) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20002u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 131074;
  }
  else {
    int v3 = 0x20000;
  }
  self->_$C15DF3E37EA3BCFA7E57A3C077E4117A flags = ($C15DF3E37EA3BCFA7E57A3C077E4117A)(*(_DWORD *)&self->_flags & 0xFFFDFFFD | v3);
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 <= 29)
  {
    v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        v4 = @"STATUS_FAILED";
        break;
      case 2:
        v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_INCOMPLETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALID_REQUEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAILED_NO_RESULT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"NEEDS_REFINEMENT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"STATUS_DEDUPED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"VERSION_MISMATCH"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readRoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutes_tags_1641);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)routes
{
  -[GEOETATrafficUpdateResponse _readRoutes]((uint64_t)self);
  routes = self->_routes;

  return routes;
}

- (void)setRoutes:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  routes = self->_routes;
  self->_routes = v4;
}

- (void)clearRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  routes = self->_routes;

  [(NSMutableArray *)routes removeAllObjects];
}

- (void)addRoute:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateResponse _readRoutes]((uint64_t)self);
  -[GEOETATrafficUpdateResponse _addNoFlagsRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (void)_addNoFlagsRoute:(uint64_t)a1
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

- (unint64_t)routesCount
{
  -[GEOETATrafficUpdateResponse _readRoutes]((uint64_t)self);
  routes = self->_routes;

  return [(NSMutableArray *)routes count];
}

- (id)routeAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateResponse _readRoutes]((uint64_t)self);
  routes = self->_routes;

  return (id)[(NSMutableArray *)routes objectAtIndex:a3];
}

+ (Class)routeType
{
  return (Class)objc_opt_class();
}

- (void)_readWaypointRoute
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 174) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypointRoute_tags_1642);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasWaypointRoute
{
  return self->_waypointRoute != 0;
}

- (GEOETATrafficUpdateWaypointRoute)waypointRoute
{
  -[GEOETATrafficUpdateResponse _readWaypointRoute]((uint64_t)self);
  waypointRoute = self->_waypointRoute;

  return waypointRoute;
}

- (void)setWaypointRoute:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x30000u;
  objc_storeStrong((id *)&self->_waypointRoute, a3);
}

- (void)_readSessionState
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSessionState_tags_1643);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasSessionState
{
  return self->_sessionState != 0;
}

- (NSData)sessionState
{
  -[GEOETATrafficUpdateResponse _readSessionState]((uint64_t)self);
  sessionState = self->_sessionState;

  return sessionState;
}

- (void)setSessionState:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x22000u;
  objc_storeStrong((id *)&self->_sessionState, a3);
}

- (void)_readDatasetAbStatus
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 172) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDatasetAbStatus_tags_1644);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasDatasetAbStatus
{
  return self->_datasetAbStatus != 0;
}

- (GEOPDDatasetABStatus)datasetAbStatus
{
  -[GEOETATrafficUpdateResponse _readDatasetAbStatus]((uint64_t)self);
  datasetAbStatus = self->_datasetAbStatus;

  return datasetAbStatus;
}

- (void)setDatasetAbStatus:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20080u;
  objc_storeStrong((id *)&self->_datasetAbStatus, a3);
}

- (void)_readCameras
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 172) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCameras_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)cameras
{
  -[GEOETATrafficUpdateResponse _readCameras]((uint64_t)self);
  cameras = self->_cameras;

  return cameras;
}

- (void)setCameras:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  cameras = self->_cameras;
  self->_cameras = v4;
}

- (void)clearCameras
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  cameras = self->_cameras;

  [(NSMutableArray *)cameras removeAllObjects];
}

- (void)addCamera:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateResponse _readCameras]((uint64_t)self);
  -[GEOETATrafficUpdateResponse _addNoFlagsCamera:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (void)_addNoFlagsCamera:(uint64_t)a1
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

- (unint64_t)camerasCount
{
  -[GEOETATrafficUpdateResponse _readCameras]((uint64_t)self);
  cameras = self->_cameras;

  return [(NSMutableArray *)cameras count];
}

- (id)cameraAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateResponse _readCameras]((uint64_t)self);
  cameras = self->_cameras;

  return (id)[(NSMutableArray *)cameras objectAtIndex:a3];
}

+ (Class)cameraType
{
  return (Class)objc_opt_class();
}

- (void)_readResponseId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResponseId_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasResponseId
{
  return self->_responseId != 0;
}

- (NSData)responseId
{
  -[GEOETATrafficUpdateResponse _readResponseId]((uint64_t)self);
  responseId = self->_responseId;

  return responseId;
}

- (void)setResponseId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20800u;
  objc_storeStrong((id *)&self->_responseId, a3);
}

- (void)_readTripId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTripId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTripId
{
  return self->_tripId != 0;
}

- (GEOUUID)tripId
{
  -[GEOETATrafficUpdateResponse _readTripId]((uint64_t)self);
  tripId = self->_tripId;

  return tripId;
}

- (void)setTripId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x28000u;
  objc_storeStrong((id *)&self->_tripId, a3);
}

- (void)_readDebugData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDebugData_tags_1646);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasDebugData
{
  return self->_debugData != 0;
}

- (NSString)debugData
{
  -[GEOETATrafficUpdateResponse _readDebugData]((uint64_t)self);
  debugData = self->_debugData;

  return debugData;
}

- (void)setDebugData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20100u;
  objc_storeStrong((id *)&self->_debugData, a3);
}

- (void)_readTrafficSignals
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficSignals_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)trafficSignals
{
  -[GEOETATrafficUpdateResponse _readTrafficSignals]((uint64_t)self);
  trafficSignals = self->_trafficSignals;

  return trafficSignals;
}

- (void)setTrafficSignals:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  trafficSignals = self->_trafficSignals;
  self->_trafficSignals = v4;
}

- (void)clearTrafficSignals
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  trafficSignals = self->_trafficSignals;

  [(NSMutableArray *)trafficSignals removeAllObjects];
}

- (void)addTrafficSignal:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateResponse _readTrafficSignals]((uint64_t)self);
  -[GEOETATrafficUpdateResponse _addNoFlagsTrafficSignal:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
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
  -[GEOETATrafficUpdateResponse _readTrafficSignals]((uint64_t)self);
  trafficSignals = self->_trafficSignals;

  return [(NSMutableArray *)trafficSignals count];
}

- (id)trafficSignalAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateResponse _readTrafficSignals]((uint64_t)self);
  trafficSignals = self->_trafficSignals;

  return (id)[(NSMutableArray *)trafficSignals objectAtIndex:a3];
}

+ (Class)trafficSignalType
{
  return (Class)objc_opt_class();
}

- (void)_readArrivalParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 172) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArrivalParameters_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)arrivalParameters
{
  -[GEOETATrafficUpdateResponse _readArrivalParameters]((uint64_t)self);
  arrivalParameters = self->_arrivalParameters;

  return arrivalParameters;
}

- (void)setArrivalParameters:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  arrivalParameters = self->_arrivalParameters;
  self->_arrivalParameters = v4;
}

- (void)clearArrivalParameters
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  arrivalParameters = self->_arrivalParameters;

  [(NSMutableArray *)arrivalParameters removeAllObjects];
}

- (void)addArrivalParameters:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateResponse _readArrivalParameters]((uint64_t)self);
  -[GEOETATrafficUpdateResponse _addNoFlagsArrivalParameters:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
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
  -[GEOETATrafficUpdateResponse _readArrivalParameters]((uint64_t)self);
  arrivalParameters = self->_arrivalParameters;

  return [(NSMutableArray *)arrivalParameters count];
}

- (id)arrivalParametersAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateResponse _readArrivalParameters]((uint64_t)self);
  arrivalParameters = self->_arrivalParameters;

  return (id)[(NSMutableArray *)arrivalParameters objectAtIndex:a3];
}

+ (Class)arrivalParametersType
{
  return (Class)objc_opt_class();
}

- (void)_readProblemDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 172) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemDetails_tags_1649);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (unint64_t)problemDetailsCount
{
  return self->_problemDetailsCount;
}

- (GEOProblemDetail)problemDetails
{
  return self->_problemDetails;
}

- (uint64_t)_reserveProblemDetails:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 40);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (12 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 12 * v9, 0x31336121uLL);
    if (result)
    {
      *(void *)(a1 + 40) = v9;
      *(void *)(a1 + 24) = result;
      bzero((void *)(result + 12 * *(void *)(a1 + 32)), 12 * (v9 - *(void *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)clearProblemDetails
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  self->_problemDetailsSpace = 0;
  self->_problemDetailsCount = 0;
  free(self->_problemDetails);
  self->_problemDetails = 0;
}

- (void)addProblemDetail:(GEOProblemDetail)a3
{
  $7D24B5AD5894795FD85A0EE1D817D743 var2 = a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  -[GEOETATrafficUpdateResponse _readProblemDetails]((uint64_t)self);
  if (self && -[GEOETATrafficUpdateResponse _reserveProblemDetails:]((uint64_t)self, 1uLL))
  {
    unint64_t v6 = &self->_problemDetails[self->_problemDetailsCount];
    *(void *)&v6->var0 = v4;
    v6->$7D24B5AD5894795FD85A0EE1D817D743 var2 = var2;
    ++self->_problemDetailsCount;
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (GEOProblemDetail)problemDetailAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateResponse _readProblemDetails]((uint64_t)self);
  unint64_t problemDetailsCount = self->_problemDetailsCount;
  if (problemDetailsCount <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, problemDetailsCount);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  v10 = &self->_problemDetails[a3];
  uint64_t v11 = *(void *)&v10->var0;
  $7D24B5AD5894795FD85A0EE1D817D743 var2 = v10->var2;
  result.var0 = v11;
  result.var1 = HIDWORD(v11);
  result.$7D24B5AD5894795FD85A0EE1D817D743 var2 = var2;
  return result;
}

- (void)setProblemDetails:(GEOProblemDetail *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  [(GEOETATrafficUpdateResponse *)self clearProblemDetails];
  if (-[GEOETATrafficUpdateResponse _reserveProblemDetails:]((uint64_t)self, a4))
  {
    memcpy(self->_problemDetails, a3, 12 * a4);
    self->_unint64_t problemDetailsCount = a4;
  }
}

- (unsigned)displayedEta
{
  return self->_displayedEta;
}

- (void)setDisplayedEta:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20001u;
  self->_displayedEta = a3;
}

- (void)setHasDisplayedEta:(BOOL)a3
{
  self->_$C15DF3E37EA3BCFA7E57A3C077E4117A flags = ($C15DF3E37EA3BCFA7E57A3C077E4117A)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x20000);
}

- (BOOL)hasDisplayedEta
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readInternalErrors
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInternalErrors_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)internalErrors
{
  -[GEOETATrafficUpdateResponse _readInternalErrors]((uint64_t)self);
  internalErrors = self->_internalErrors;

  return internalErrors;
}

- (void)setInternalErrors:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  internalErrors = self->_internalErrors;
  self->_internalErrors = v4;
}

- (void)clearInternalErrors
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  internalErrors = self->_internalErrors;

  [(NSMutableArray *)internalErrors removeAllObjects];
}

- (void)addInternalError:(id)a3
{
  id v4 = a3;
  -[GEOETATrafficUpdateResponse _readInternalErrors]((uint64_t)self);
  -[GEOETATrafficUpdateResponse _addNoFlagsInternalError:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (void)_addNoFlagsInternalError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)internalErrorsCount
{
  -[GEOETATrafficUpdateResponse _readInternalErrors]((uint64_t)self);
  internalErrors = self->_internalErrors;

  return [(NSMutableArray *)internalErrors count];
}

- (id)internalErrorAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateResponse _readInternalErrors]((uint64_t)self);
  internalErrors = self->_internalErrors;

  return (id)[(NSMutableArray *)internalErrors objectAtIndex:a3];
}

+ (Class)internalErrorType
{
  return (Class)objc_opt_class();
}

- (void)_readResponseAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResponseAttributes_tags_1650);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasResponseAttributes
{
  return self->_responseAttributes != 0;
}

- (GEOCommonResponseAttributes)responseAttributes
{
  -[GEOETATrafficUpdateResponse _readResponseAttributes]((uint64_t)self);
  responseAttributes = self->_responseAttributes;

  return responseAttributes;
}

- (void)setResponseAttributes:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20400u;
  objc_storeStrong((id *)&self->_responseAttributes, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOETATrafficUpdateResponse;
  id v4 = [(GEOETATrafficUpdateResponse *)&v8 description];
  id v5 = [(GEOETATrafficUpdateResponse *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETATrafficUpdateResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_132;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)(a1 + 172) & 2) != 0)
  {
    int v5 = *(_DWORD *)(a1 + 168);
    if (v5 <= 29)
    {
      unint64_t v6 = @"STATUS_SUCCESS";
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          unint64_t v6 = @"STATUS_FAILED";
          break;
        case 2:
          unint64_t v6 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          unint64_t v6 = @"INVALID_REQUEST";
          break;
        default:
          if (v5 != 20) {
            goto LABEL_15;
          }
          unint64_t v6 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        unint64_t v6 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        unint64_t v6 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        unint64_t v6 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        unint64_t v6 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        [v4 setObject:v6 forKey:@"status"];

        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 168));
    unint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if ([*(id *)(a1 + 112) count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v8 = *(id *)(a1 + 112);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v97 objects:v104 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v98;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v98 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v97 + 1) + 8 * i);
          if (a2) {
            [v13 jsonRepresentation];
          }
          else {
          v14 = [v13 dictionaryRepresentation];
          }
          [v7 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v97 objects:v104 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"route"];
  }
  long long v15 = [(id)a1 waypointRoute];
  long long v16 = v15;
  if (v15)
  {
    if (a2)
    {
      long long v17 = [v15 jsonRepresentation];
      long long v18 = @"waypointRoute";
    }
    else
    {
      long long v17 = [v15 dictionaryRepresentation];
      long long v18 = @"waypoint_route";
    }
    [v4 setObject:v17 forKey:v18];
  }
  v19 = [(id)a1 sessionState];
  uint64_t v20 = v19;
  if (v19)
  {
    if (a2)
    {
      v21 = [v19 base64EncodedStringWithOptions:0];
      [v4 setObject:v21 forKey:@"sessionState"];
    }
    else
    {
      [v4 setObject:v19 forKey:@"session_state"];
    }
  }

  v22 = [(id)a1 datasetAbStatus];
  v23 = v22;
  if (v22)
  {
    if (a2)
    {
      v24 = [v22 jsonRepresentation];
      v25 = @"datasetAbStatus";
    }
    else
    {
      v24 = [v22 dictionaryRepresentation];
      v25 = @"dataset_ab_status";
    }
    [v4 setObject:v24 forKey:v25];
  }
  if ([*(id *)(a1 + 56) count])
  {
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v27 = *(id *)(a1 + 56);
    uint64_t v28 = [v27 countByEnumeratingWithState:&v93 objects:v103 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v94;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v94 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v93 + 1) + 8 * j);
          if (a2) {
            [v32 jsonRepresentation];
          }
          else {
          v33 = [v32 dictionaryRepresentation];
          }
          [v26 addObject:v33];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v93 objects:v103 count:16];
      }
      while (v29);
    }

    [v4 setObject:v26 forKey:@"camera"];
  }
  v34 = [(id)a1 responseId];
  v35 = v34;
  if (v34)
  {
    if (a2)
    {
      v36 = [v34 base64EncodedStringWithOptions:0];
      [v4 setObject:v36 forKey:@"responseId"];
    }
    else
    {
      [v4 setObject:v34 forKey:@"response_id"];
    }
  }

  v37 = [(id)a1 tripId];
  v38 = v37;
  if (v37)
  {
    if (a2)
    {
      v39 = [v37 jsonRepresentation];
      v40 = @"tripId";
    }
    else
    {
      v39 = [v37 dictionaryRepresentation];
      v40 = @"trip_id";
    }
    [v4 setObject:v39 forKey:v40];
  }
  v41 = [(id)a1 debugData];
  if (v41)
  {
    if (a2) {
      v42 = @"debugData";
    }
    else {
      v42 = @"debug_data";
    }
    [v4 setObject:v41 forKey:v42];
  }

  if ([*(id *)(a1 + 128) count])
  {
    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v44 = *(id *)(a1 + 128);
    uint64_t v45 = [v44 countByEnumeratingWithState:&v89 objects:v102 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v90;
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v90 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = *(void **)(*((void *)&v89 + 1) + 8 * k);
          if (a2) {
            [v49 jsonRepresentation];
          }
          else {
          v50 = [v49 dictionaryRepresentation];
          }
          [v43 addObject:v50];
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v89 objects:v102 count:16];
      }
      while (v46);
    }

    if (a2) {
      v51 = @"trafficSignal";
    }
    else {
      v51 = @"traffic_signal";
    }
    [v4 setObject:v43 forKey:v51];
  }
  if ([*(id *)(a1 + 48) count])
  {
    v52 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v53 = *(id *)(a1 + 48);
    uint64_t v54 = [v53 countByEnumeratingWithState:&v85 objects:v101 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v86;
      do
      {
        for (uint64_t m = 0; m != v55; ++m)
        {
          if (*(void *)v86 != v56) {
            objc_enumerationMutation(v53);
          }
          v58 = *(void **)(*((void *)&v85 + 1) + 8 * m);
          if (a2) {
            [v58 jsonRepresentation];
          }
          else {
          v59 = [v58 dictionaryRepresentation];
          }
          [v52 addObject:v59];
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v85 objects:v101 count:16];
      }
      while (v55);
    }

    if (a2) {
      v60 = @"arrivalParameters";
    }
    else {
      v60 = @"arrival_parameters";
    }
    [v4 setObject:v52 forKey:v60];
  }
  if (*(void *)(a1 + 32))
  {
    v61 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 32))
    {
      uint64_t v62 = 0;
      unint64_t v63 = 0;
      do
      {
        v64 = _GEOProblemDetailDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 24) + v62));
        [v61 addObject:v64];

        ++v63;
        v62 += 12;
      }
      while (v63 < *(void *)(a1 + 32));
    }
    [v4 setObject:v61 forKey:@"problemDetail"];
  }
  if (*(unsigned char *)(a1 + 172))
  {
    v65 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 164)];
    if (a2) {
      v66 = @"displayedEta";
    }
    else {
      v66 = @"displayed_eta";
    }
    [v4 setObject:v65 forKey:v66];
  }
  if (*(void *)(a1 + 88))
  {
    v67 = [(id)a1 internalErrors];
    if (a2) {
      v68 = @"internalError";
    }
    else {
      v68 = @"internal_error";
    }
    [v4 setObject:v67 forKey:v68];
  }
  v69 = [(id)a1 responseAttributes];
  v70 = v69;
  if (v69)
  {
    if (a2)
    {
      v71 = [v69 jsonRepresentation];
      v72 = @"responseAttributes";
    }
    else
    {
      v71 = [v69 dictionaryRepresentation];
      v72 = @"response_attributes";
    }
    [v4 setObject:v71 forKey:v72];
  }
  v73 = [(id)a1 clientMetrics];
  v74 = v73;
  if (v73)
  {
    if (a2) {
      [v73 jsonRepresentation];
    }
    else {
    v75 = [v73 dictionaryRepresentation];
    }
    [v4 setObject:v75 forKey:@"clientMetrics"];
  }
  v76 = *(void **)(a1 + 16);
  if (v76)
  {
    v77 = [v76 dictionaryRepresentation];
    v78 = v77;
    if (a2)
    {
      v79 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v77, "count"));
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __57__GEOETATrafficUpdateResponse__dictionaryRepresentation___block_invoke;
      v83[3] = &unk_1E53D8860;
      id v80 = v79;
      id v84 = v80;
      [v78 enumerateKeysAndObjectsUsingBlock:v83];
      id v81 = v80;

      v78 = v81;
    }
    [v4 setObject:v78 forKey:@"Unknown Fields"];
  }
LABEL_132:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOETATrafficUpdateResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOETATrafficUpdateResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOETATrafficUpdateResponse)initWithDictionary:(id)a3
{
  return (GEOETATrafficUpdateResponse *)-[GEOETATrafficUpdateResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (!a1) {
    goto LABEL_171;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_171;
  }
  id v7 = [v6 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v9 = 30;
    }
    else if ([v8 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v9 = 40;
    }
    else if ([v8 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v9 = 50;
    }
    else if ([v8 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v9 = 60;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_26:
    [a1 setStatus:v9];
  }

  id v10 = [v6 objectForKeyedSubscript:@"route"];
  objc_opt_class();
  id v99 = v6;
  if (objc_opt_isKindOfClass())
  {
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v95 = v10;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v122 objects:v131 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v123;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v123 != v14) {
            objc_enumerationMutation(v11);
          }
          unint64_t v3 = *(void *)(*((void *)&v122 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v16 = [GEOETARoute alloc];
            if (a3) {
              uint64_t v17 = [(GEOETARoute *)v16 initWithJSON:v3];
            }
            else {
              uint64_t v17 = [(GEOETARoute *)v16 initWithDictionary:v3];
            }
            unint64_t v3 = v17;
            objc_msgSend(a1, "addRoute:", v17, v95);
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v122 objects:v131 count:16];
      }
      while (v13);
    }

    id v10 = v95;
  }

  if (a3) {
    long long v18 = @"waypointRoute";
  }
  else {
    long long v18 = @"waypoint_route";
  }
  v19 = objc_msgSend(v6, "objectForKeyedSubscript:", v18, v95);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = [GEOETATrafficUpdateWaypointRoute alloc];
    if (a3) {
      uint64_t v21 = [(GEOETATrafficUpdateWaypointRoute *)v20 initWithJSON:v19];
    }
    else {
      uint64_t v21 = [(GEOETATrafficUpdateWaypointRoute *)v20 initWithDictionary:v19];
    }
    v22 = (void *)v21;
    [a1 setWaypointRoute:v21];
  }
  if (a3) {
    v23 = @"sessionState";
  }
  else {
    v23 = @"session_state";
  }
  v24 = [v6 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v24 options:0];
    [a1 setSessionState:v25];
  }
  if (a3) {
    v26 = @"datasetAbStatus";
  }
  else {
    v26 = @"dataset_ab_status";
  }
  id v27 = [v6 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v28 = [GEOPDDatasetABStatus alloc];
    if (a3) {
      uint64_t v29 = [(GEOPDDatasetABStatus *)v28 initWithJSON:v27];
    }
    else {
      uint64_t v29 = [(GEOPDDatasetABStatus *)v28 initWithDictionary:v27];
    }
    uint64_t v30 = (void *)v29;
    [a1 setDatasetAbStatus:v29];
  }
  v31 = [v6 objectForKeyedSubscript:@"camera"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v96 = v31;
    id v32 = v31;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v118 objects:v130 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v119;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v119 != v35) {
            objc_enumerationMutation(v32);
          }
          unint64_t v3 = *(void *)(*((void *)&v118 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v37 = [GEOTrafficCamera alloc];
            if (a3) {
              uint64_t v38 = [(GEOTrafficCamera *)v37 initWithJSON:v3];
            }
            else {
              uint64_t v38 = [(GEOTrafficCamera *)v37 initWithDictionary:v3];
            }
            unint64_t v3 = v38;
            objc_msgSend(a1, "addCamera:", v38, v96);
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v118 objects:v130 count:16];
      }
      while (v34);
    }

    v31 = v96;
  }

  if (a3) {
    v39 = @"responseId";
  }
  else {
    v39 = @"response_id";
  }
  v40 = objc_msgSend(v6, "objectForKeyedSubscript:", v39, v96);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v40 options:0];
    [a1 setResponseId:v41];
  }
  if (a3) {
    v42 = @"tripId";
  }
  else {
    v42 = @"trip_id";
  }
  v43 = [v6 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v44 = [GEOUUID alloc];
    if (v44) {
      uint64_t v45 = (void *)-[GEOUUID _initWithDictionary:isJSON:]((uint64_t)v44, v43);
    }
    else {
      uint64_t v45 = 0;
    }
    [a1 setTripId:v45];
  }
  if (a3) {
    uint64_t v46 = @"debugData";
  }
  else {
    uint64_t v46 = @"debug_data";
  }
  uint64_t v47 = [v6 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v48 = (void *)[v47 copy];
    [a1 setDebugData:v48];
  }
  if (a3) {
    v49 = @"trafficSignal";
  }
  else {
    v49 = @"traffic_signal";
  }
  v50 = [v6 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v97 = v50;
    id v51 = v50;
    uint64_t v52 = [v51 countByEnumeratingWithState:&v114 objects:v129 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v115;
      do
      {
        for (uint64_t k = 0; k != v53; ++k)
        {
          if (*(void *)v115 != v54) {
            objc_enumerationMutation(v51);
          }
          unint64_t v3 = *(void *)(*((void *)&v114 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v56 = [GEOTrafficSignal alloc];
            if (a3) {
              uint64_t v57 = [(GEOTrafficSignal *)v56 initWithJSON:v3];
            }
            else {
              uint64_t v57 = [(GEOTrafficSignal *)v56 initWithDictionary:v3];
            }
            unint64_t v3 = v57;
            objc_msgSend(a1, "addTrafficSignal:", v57, v97);
          }
        }
        uint64_t v53 = [v51 countByEnumeratingWithState:&v114 objects:v129 count:16];
      }
      while (v53);
    }

    v50 = v97;
  }

  if (a3) {
    v58 = @"arrivalParameters";
  }
  else {
    v58 = @"arrival_parameters";
  }
  v59 = objc_msgSend(v6, "objectForKeyedSubscript:", v58, v97);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v98 = v59;
    id v60 = v59;
    uint64_t v61 = [v60 countByEnumeratingWithState:&v110 objects:v128 count:16];
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = *(void *)v111;
      do
      {
        for (uint64_t m = 0; m != v62; ++m)
        {
          if (*(void *)v111 != v63) {
            objc_enumerationMutation(v60);
          }
          unint64_t v3 = *(void *)(*((void *)&v110 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v65 = [GEOArrivalParameters alloc];
            if (a3) {
              uint64_t v66 = [(GEOArrivalParameters *)v65 initWithJSON:v3];
            }
            else {
              uint64_t v66 = [(GEOArrivalParameters *)v65 initWithDictionary:v3];
            }
            unint64_t v3 = v66;
            objc_msgSend(a1, "addArrivalParameters:", v66, v98);
          }
        }
        uint64_t v62 = [v60 countByEnumeratingWithState:&v110 objects:v128 count:16];
      }
      while (v62);
    }

    v59 = v98;
  }

  v67 = [v6 objectForKeyedSubscript:@"problemDetail"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v98 = v67;
    id v68 = v67;
    uint64_t v69 = [v68 countByEnumeratingWithState:&v106 objects:v127 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v107;
      do
      {
        for (uint64_t n = 0; n != v70; ++n)
        {
          if (*(void *)v107 != v71) {
            objc_enumerationMutation(v68);
          }
          v73 = *(void **)(*((void *)&v106 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned int v105 = 0;
            uint64_t v104 = 0;
            _GEOProblemDetailFromDictionaryRepresentation(v73, (uint64_t)&v104);
            unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v105;
            objc_msgSend(a1, "addProblemDetail:", v104, v3);
          }
        }
        uint64_t v70 = [v68 countByEnumeratingWithState:&v106 objects:v127 count:16];
      }
      while (v70);
    }

    v67 = v98;
    id v6 = v99;
  }

  if (a3) {
    v74 = @"displayedEta";
  }
  else {
    v74 = @"displayed_eta";
  }
  v75 = objc_msgSend(v6, "objectForKeyedSubscript:", v74, v98);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDisplayedEta:", objc_msgSend(v75, "unsignedIntValue"));
  }

  if (a3) {
    v76 = @"internalError";
  }
  else {
    v76 = @"internal_error";
  }
  v77 = [v6 objectForKeyedSubscript:v76];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v78 = v77;
    uint64_t v79 = [v78 countByEnumeratingWithState:&v100 objects:v126 count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v101;
      do
      {
        for (iuint64_t i = 0; ii != v80; ++ii)
        {
          if (*(void *)v101 != v81) {
            objc_enumerationMutation(v78);
          }
          v83 = *(void **)(*((void *)&v100 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v84 = (void *)[v83 copy];
            [a1 addInternalError:v84];
          }
        }
        uint64_t v80 = [v78 countByEnumeratingWithState:&v100 objects:v126 count:16];
      }
      while (v80);
    }

    id v6 = v99;
  }

  if (a3) {
    long long v85 = @"responseAttributes";
  }
  else {
    long long v85 = @"response_attributes";
  }
  long long v86 = [v6 objectForKeyedSubscript:v85];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v87 = [GEOCommonResponseAttributes alloc];
    if (a3) {
      uint64_t v88 = [(GEOCommonResponseAttributes *)v87 initWithJSON:v86];
    }
    else {
      uint64_t v88 = [(GEOCommonResponseAttributes *)v87 initWithDictionary:v86];
    }
    long long v89 = (void *)v88;
    [a1 setResponseAttributes:v88];
  }
  long long v90 = [v6 objectForKeyedSubscript:@"clientMetrics"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v91 = [GEOClientMetrics alloc];
    if (a3) {
      uint64_t v92 = [(GEOClientMetrics *)v91 initWithJSON:v90];
    }
    else {
      uint64_t v92 = [(GEOClientMetrics *)v91 initWithDictionary:v90];
    }
    long long v93 = (void *)v92;
    [a1 setClientMetrics:v92];
  }
  a1 = a1;

LABEL_171:
  return a1;
}

- (GEOETATrafficUpdateResponse)initWithJSON:(id)a3
{
  return (GEOETATrafficUpdateResponse *)-[GEOETATrafficUpdateResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_1685;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_1686;
    }
    GEOETATrafficUpdateResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOETATrafficUpdateResponseCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETATrafficUpdateResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETATrafficUpdateResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETATrafficUpdateResponseIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v28 = self->_reader;
    objc_sync_enter(v28);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v29 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v29];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v28);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOETATrafficUpdateResponse *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v6 = self->_routes;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v48;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v48 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v7);
    }

    if (self->_waypointRoute) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_sessionState) {
      PBDataWriterWriteDataField();
    }
    if (self->_datasetAbStatus) {
      PBDataWriterWriteSubmessage();
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v10 = self->_cameras;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v44;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v11);
    }

    if (self->_responseId) {
      PBDataWriterWriteDataField();
    }
    if (self->_tripId) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_debugData) {
      PBDataWriterWriteStringField();
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v14 = self->_trafficSignals;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v39 objects:v53 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v40;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v39 objects:v53 count:16];
      }
      while (v15);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v18 = self->_arrivalParameters;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v35 objects:v52 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v36;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v35 objects:v52 count:16];
      }
      while (v19);
    }

    if (self->_problemDetailsCount)
    {
      uint64_t v22 = 0;
      unint64_t v23 = 0;
      do
      {
        uint64_t v34 = 0;
        PBDataWriterPlaceMark();
        GEOProblemDetailWriteTo((uint64_t)&self->_problemDetails[v22]);
        PBDataWriterRecallMark();
        ++v23;
        ++v22;
      }
      while (v23 < self->_problemDetailsCount);
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v24 = self->_internalErrors;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v51 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v31;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v24);
          }
          PBDataWriterWriteStringField();
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v51 count:16];
      }
      while (v25);
    }

    if (self->_responseAttributes) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_clientMetrics) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v30);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  -[GEOETATrafficUpdateResponse _readArrivalParameters]((uint64_t)self);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = self->_arrivalParameters;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v36 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v35 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v35 objects:v42 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    -[GEOETATrafficUpdateResponse _readCameras]((uint64_t)self);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v5 = self->_cameras;
    uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
LABEL_11:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v31 + 1) + 8 * v13) hasGreenTeaWithValue:v3]) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v31 objects:v41 count:16];
          if (v11) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:

      -[GEOETATrafficUpdateResponse _readRoutes]((uint64_t)self);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v5 = self->_routes;
      uint64_t v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v40 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v28;
LABEL_19:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v27 + 1) + 8 * v17) hasGreenTeaWithValue:v3]) {
            break;
          }
          if (v15 == ++v17)
          {
            uint64_t v15 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v40 count:16];
            if (v15) {
              goto LABEL_19;
            }
            goto LABEL_25;
          }
        }
      }
      else
      {
LABEL_25:

        -[GEOETATrafficUpdateResponse _readTrafficSignals]((uint64_t)self);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v5 = self->_trafficSignals;
        uint64_t v18 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v39 count:16];
        if (!v18)
        {
LABEL_33:

          -[GEOETATrafficUpdateResponse _readWaypointRoute]((uint64_t)self);
          return [(GEOETATrafficUpdateWaypointRoute *)self->_waypointRoute hasGreenTeaWithValue:v3];
        }
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v24;
LABEL_27:
        uint64_t v21 = 0;
        while (1)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v21), "hasGreenTeaWithValue:", v3, (void)v23)) {
            break;
          }
          if (v19 == ++v21)
          {
            uint64_t v19 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v39 count:16];
            if (v19) {
              goto LABEL_27;
            }
            goto LABEL_33;
          }
        }
      }
    }
  }

  return 1;
}

- (void)copyTo:(id)a3
{
  long long v30 = (id *)a3;
  [(GEOETATrafficUpdateResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v30 + 1, self->_reader);
  *((_DWORD *)v30 + 38) = self->_readerMarkPos;
  *((_DWORD *)v30 + 39) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v30 + 42) = self->_status;
    *((_DWORD *)v30 + 43) |= 2u;
  }
  if ([(GEOETATrafficUpdateResponse *)self routesCount])
  {
    [v30 clearRoutes];
    unint64_t v4 = [(GEOETATrafficUpdateResponse *)self routesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOETATrafficUpdateResponse *)self routeAtIndex:i];
        [v30 addRoute:v7];
      }
    }
  }
  if (self->_waypointRoute) {
    objc_msgSend(v30, "setWaypointRoute:");
  }
  if (self->_sessionState) {
    objc_msgSend(v30, "setSessionState:");
  }
  if (self->_datasetAbStatus) {
    objc_msgSend(v30, "setDatasetAbStatus:");
  }
  if ([(GEOETATrafficUpdateResponse *)self camerasCount])
  {
    [v30 clearCameras];
    unint64_t v8 = [(GEOETATrafficUpdateResponse *)self camerasCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOETATrafficUpdateResponse *)self cameraAtIndex:j];
        [v30 addCamera:v11];
      }
    }
  }
  if (self->_responseId) {
    objc_msgSend(v30, "setResponseId:");
  }
  if (self->_tripId) {
    objc_msgSend(v30, "setTripId:");
  }
  if (self->_debugData) {
    objc_msgSend(v30, "setDebugData:");
  }
  if ([(GEOETATrafficUpdateResponse *)self trafficSignalsCount])
  {
    [v30 clearTrafficSignals];
    unint64_t v12 = [(GEOETATrafficUpdateResponse *)self trafficSignalsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOETATrafficUpdateResponse *)self trafficSignalAtIndex:k];
        [v30 addTrafficSignal:v15];
      }
    }
  }
  if ([(GEOETATrafficUpdateResponse *)self arrivalParametersCount])
  {
    [v30 clearArrivalParameters];
    unint64_t v16 = [(GEOETATrafficUpdateResponse *)self arrivalParametersCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(GEOETATrafficUpdateResponse *)self arrivalParametersAtIndex:m];
        [v30 addArrivalParameters:v19];
      }
    }
  }
  if ([(GEOETATrafficUpdateResponse *)self problemDetailsCount])
  {
    [v30 clearProblemDetails];
    unint64_t v20 = [(GEOETATrafficUpdateResponse *)self problemDetailsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(GEOETATrafficUpdateResponse *)self problemDetailAtIndex:n];
        objc_msgSend(v30, "addProblemDetail:", v23, v24);
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v30 + 41) = self->_displayedEta;
    *((_DWORD *)v30 + 43) |= 1u;
  }
  if ([(GEOETATrafficUpdateResponse *)self internalErrorsCount])
  {
    [v30 clearInternalErrors];
    unint64_t v25 = [(GEOETATrafficUpdateResponse *)self internalErrorsCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        long long v28 = [(GEOETATrafficUpdateResponse *)self internalErrorAtIndex:ii];
        [v30 addInternalError:v28];
      }
    }
  }
  if (self->_responseAttributes) {
    objc_msgSend(v30, "setResponseAttributes:");
  }
  long long v29 = v30;
  if (self->_clientMetrics)
  {
    objc_msgSend(v30, "setClientMetrics:");
    long long v29 = v30;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 2) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOETATrafficUpdateResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_47;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOETATrafficUpdateResponse *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_status;
    *(_DWORD *)(v5 + 172) |= 2u;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  unint64_t v9 = self->_routes;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v70 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v69 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addRoute:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v10);
  }

  id v14 = [(GEOETATrafficUpdateWaypointRoute *)self->_waypointRoute copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v14;

  uint64_t v16 = [(NSData *)self->_sessionState copyWithZone:a3];
  unint64_t v17 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v16;

  id v18 = [(GEOPDDatasetABStatus *)self->_datasetAbStatus copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v18;

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  unint64_t v20 = self->_cameras;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v66 != v22) {
          objc_enumerationMutation(v20);
        }
        unsigned int v24 = (void *)[*(id *)(*((void *)&v65 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addCamera:v24];
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v65 objects:v76 count:16];
    }
    while (v21);
  }

  uint64_t v25 = [(NSData *)self->_responseId copyWithZone:a3];
  unint64_t v26 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v25;

  id v27 = [(GEOUUID *)self->_tripId copyWithZone:a3];
  long long v28 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v27;

  uint64_t v29 = [(NSString *)self->_debugData copyWithZone:a3];
  long long v30 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v29;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v31 = self->_trafficSignals;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v62 != v33) {
          objc_enumerationMutation(v31);
        }
        long long v35 = (void *)[*(id *)(*((void *)&v61 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addTrafficSignal:v35];
      }
      uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (v32);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v36 = self->_arrivalParameters;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v57 objects:v74 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v58;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v58 != v38) {
          objc_enumerationMutation(v36);
        }
        long long v40 = (void *)[*(id *)(*((void *)&v57 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addArrivalParameters:v40];
      }
      uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v57 objects:v74 count:16];
    }
    while (v37);
  }

  unint64_t problemDetailsCount = self->_problemDetailsCount;
  if (problemDetailsCount)
  {
    -[GEOETATrafficUpdateResponse _reserveProblemDetails:](v5, problemDetailsCount);
    memcpy(*(void **)(v5 + 24), self->_problemDetails, 12 * self->_problemDetailsCount);
    *(void *)(v5 + 32) = self->_problemDetailsCount;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 164) = self->_displayedEta;
    *(_DWORD *)(v5 + 172) |= 1u;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v42 = self->_internalErrors;
  uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v53 objects:v73 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v54;
    do
    {
      for (uint64_t n = 0; n != v43; ++n)
      {
        if (*(void *)v54 != v44) {
          objc_enumerationMutation(v42);
        }
        long long v46 = objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * n), "copyWithZone:", a3, (void)v53);
        [(id)v5 addInternalError:v46];
      }
      uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v53 objects:v73 count:16];
    }
    while (v43);
  }

  id v47 = [(GEOCommonResponseAttributes *)self->_responseAttributes copyWithZone:a3];
  long long v48 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v47;

  id v49 = [(GEOClientMetrics *)self->_clientMetrics copyWithZone:a3];
  long long v50 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v49;

  id v51 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v51;
LABEL_47:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  [(GEOETATrafficUpdateResponse *)self readAll:1];
  [v4 readAll:1];
  int v5 = *((_DWORD *)v4 + 43);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_status != *((_DWORD *)v4 + 42)) {
      goto LABEL_29;
    }
  }
  else if ((v5 & 2) != 0)
  {
    goto LABEL_29;
  }
  routes = self->_routes;
  if ((unint64_t)routes | (unint64_t)v4[14]
    && !-[NSMutableArray isEqual:](routes, "isEqual:"))
  {
    goto LABEL_29;
  }
  waypointRoute = self->_waypointRoute;
  if ((unint64_t)waypointRoute | (unint64_t)v4[18])
  {
    if (!-[GEOETATrafficUpdateWaypointRoute isEqual:](waypointRoute, "isEqual:")) {
      goto LABEL_29;
    }
  }
  sessionState = self->_sessionState;
  if ((unint64_t)sessionState | (unint64_t)v4[15])
  {
    if (!-[NSData isEqual:](sessionState, "isEqual:")) {
      goto LABEL_29;
    }
  }
  datasetAbStatus = self->_datasetAbStatus;
  if ((unint64_t)datasetAbStatus | (unint64_t)v4[9])
  {
    if (!-[GEOPDDatasetABStatus isEqual:](datasetAbStatus, "isEqual:")) {
      goto LABEL_29;
    }
  }
  cameras = self->_cameras;
  if ((unint64_t)cameras | (unint64_t)v4[7])
  {
    if (!-[NSMutableArray isEqual:](cameras, "isEqual:")) {
      goto LABEL_29;
    }
  }
  responseId = self->_responseId;
  if ((unint64_t)responseId | (unint64_t)v4[13])
  {
    if (!-[NSData isEqual:](responseId, "isEqual:")) {
      goto LABEL_29;
    }
  }
  tripId = self->_tripId;
  if ((unint64_t)tripId | (unint64_t)v4[17])
  {
    if (!-[GEOUUID isEqual:](tripId, "isEqual:")) {
      goto LABEL_29;
    }
  }
  debugData = self->_debugData;
  if ((unint64_t)debugData | (unint64_t)v4[10])
  {
    if (!-[NSString isEqual:](debugData, "isEqual:")) {
      goto LABEL_29;
    }
  }
  trafficSignals = self->_trafficSignals;
  if ((unint64_t)trafficSignals | (unint64_t)v4[16])
  {
    if (!-[NSMutableArray isEqual:](trafficSignals, "isEqual:")) {
      goto LABEL_29;
    }
  }
  arrivalParameters = self->_arrivalParameters;
  if ((unint64_t)arrivalParameters | (unint64_t)v4[6])
  {
    if (!-[NSMutableArray isEqual:](arrivalParameters, "isEqual:")) {
      goto LABEL_29;
    }
  }
  unint64_t problemDetailsCount = self->_problemDetailsCount;
  if ((const void *)problemDetailsCount != v4[4] || memcmp(self->_problemDetails, v4[3], 12 * problemDetailsCount)) {
    goto LABEL_29;
  }
  int v19 = *((_DWORD *)v4 + 43);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v19 & 1) == 0 || self->_displayedEta != *((_DWORD *)v4 + 41)) {
      goto LABEL_29;
    }
  }
  else if (v19)
  {
LABEL_29:
    char v17 = 0;
    goto LABEL_30;
  }
  internalErrors = self->_internalErrors;
  if ((unint64_t)internalErrors | (unint64_t)v4[11]
    && !-[NSMutableArray isEqual:](internalErrors, "isEqual:"))
  {
    goto LABEL_29;
  }
  responseAttributes = self->_responseAttributes;
  if ((unint64_t)responseAttributes | (unint64_t)v4[12])
  {
    if (!-[GEOCommonResponseAttributes isEqual:](responseAttributes, "isEqual:")) {
      goto LABEL_29;
    }
  }
  clientMetrics = self->_clientMetrics;
  if ((unint64_t)clientMetrics | (unint64_t)v4[8]) {
    char v17 = -[GEOClientMetrics isEqual:](clientMetrics, "isEqual:");
  }
  else {
    char v17 = 1;
  }
LABEL_30:

  return v17;
}

- (unint64_t)hash
{
  [(GEOETATrafficUpdateResponse *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v19 = 2654435761 * self->_status;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v18 = [(NSMutableArray *)self->_routes hash];
  unint64_t v17 = [(GEOETATrafficUpdateWaypointRoute *)self->_waypointRoute hash];
  uint64_t v16 = [(NSData *)self->_sessionState hash];
  unint64_t v3 = [(GEOPDDatasetABStatus *)self->_datasetAbStatus hash];
  uint64_t v4 = [(NSMutableArray *)self->_cameras hash];
  uint64_t v5 = [(NSData *)self->_responseId hash];
  unint64_t v6 = [(GEOUUID *)self->_tripId hash];
  NSUInteger v7 = [(NSString *)self->_debugData hash];
  uint64_t v8 = [(NSMutableArray *)self->_trafficSignals hash];
  uint64_t v9 = [(NSMutableArray *)self->_arrivalParameters hash];
  uint64_t v10 = PBHashBytes();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v11 = 2654435761 * self->_displayedEta;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v18 ^ v19 ^ v17 ^ v16 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  uint64_t v13 = [(NSMutableArray *)self->_internalErrors hash];
  unint64_t v14 = v13 ^ [(GEOCommonResponseAttributes *)self->_responseAttributes hash];
  return v12 ^ v14 ^ [(GEOClientMetrics *)self->_clientMetrics hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((unsigned char *)v4 + 172) & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 42);
    *(_DWORD *)&self->_flags |= 2u;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v5 = *((id *)v4 + 14);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v62 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOETATrafficUpdateResponse *)self addRoute:*(void *)(*((void *)&v61 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v7);
  }

  waypointRoute = self->_waypointRoute;
  uint64_t v11 = *((void *)v4 + 18);
  if (waypointRoute)
  {
    if (v11) {
      -[GEOETATrafficUpdateWaypointRoute mergeFrom:](waypointRoute, "mergeFrom:");
    }
  }
  else if (v11)
  {
    [(GEOETATrafficUpdateResponse *)self setWaypointRoute:"setWaypointRoute:"];
  }
  if (*((void *)v4 + 15)) {
    -[GEOETATrafficUpdateResponse setSessionState:](self, "setSessionState:");
  }
  datasetAbStatus = self->_datasetAbStatus;
  uint64_t v13 = *((void *)v4 + 9);
  if (datasetAbStatus)
  {
    if (v13) {
      -[GEOPDDatasetABStatus mergeFrom:](datasetAbStatus, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOETATrafficUpdateResponse setDatasetAbStatus:](self, "setDatasetAbStatus:");
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v14 = *((id *)v4 + 7);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v57 objects:v68 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v58 != v17) {
          objc_enumerationMutation(v14);
        }
        [(GEOETATrafficUpdateResponse *)self addCamera:*(void *)(*((void *)&v57 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v57 objects:v68 count:16];
    }
    while (v16);
  }

  if (*((void *)v4 + 13)) {
    -[GEOETATrafficUpdateResponse setResponseId:](self, "setResponseId:");
  }
  tripId = self->_tripId;
  unint64_t v20 = (void *)*((void *)v4 + 17);
  if (tripId)
  {
    if (v20) {
      -[GEOUUID mergeFrom:]((uint64_t)tripId, v20);
    }
  }
  else if (v20)
  {
    [(GEOETATrafficUpdateResponse *)self setTripId:*((void *)v4 + 17)];
  }
  if (*((void *)v4 + 10)) {
    -[GEOETATrafficUpdateResponse setDebugData:](self, "setDebugData:");
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v21 = *((id *)v4 + 16);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v67 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v54 != v24) {
          objc_enumerationMutation(v21);
        }
        [(GEOETATrafficUpdateResponse *)self addTrafficSignal:*(void *)(*((void *)&v53 + 1) + 8 * k)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v53 objects:v67 count:16];
    }
    while (v23);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v26 = *((id *)v4 + 6);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v66 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v50;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v50 != v29) {
          objc_enumerationMutation(v26);
        }
        [(GEOETATrafficUpdateResponse *)self addArrivalParameters:*(void *)(*((void *)&v49 + 1) + 8 * m)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v49 objects:v66 count:16];
    }
    while (v28);
  }

  uint64_t v31 = [v4 problemDetailsCount];
  if (v31)
  {
    uint64_t v32 = v31;
    for (uint64_t n = 0; n != v32; ++n)
    {
      uint64_t v34 = [v4 problemDetailAtIndex:n];
      -[GEOETATrafficUpdateResponse addProblemDetail:](self, "addProblemDetail:", v34, v35);
    }
  }
  if (*((unsigned char *)v4 + 172))
  {
    self->_displayedEta = *((_DWORD *)v4 + 41);
    *(_DWORD *)&self->_flags |= 1u;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v36 = *((id *)v4 + 11);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v45 objects:v65 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v46;
    do
    {
      for (iuint64_t i = 0; ii != v38; ++ii)
      {
        if (*(void *)v46 != v39) {
          objc_enumerationMutation(v36);
        }
        -[GEOETATrafficUpdateResponse addInternalError:](self, "addInternalError:", *(void *)(*((void *)&v45 + 1) + 8 * ii), (void)v45);
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v45 objects:v65 count:16];
    }
    while (v38);
  }

  responseAttributes = self->_responseAttributes;
  uint64_t v42 = *((void *)v4 + 12);
  if (responseAttributes)
  {
    if (v42) {
      -[GEOCommonResponseAttributes mergeFrom:](responseAttributes, "mergeFrom:");
    }
  }
  else if (v42)
  {
    -[GEOETATrafficUpdateResponse setResponseAttributes:](self, "setResponseAttributes:");
  }
  clientMetrics = self->_clientMetrics;
  uint64_t v44 = *((void *)v4 + 8);
  if (clientMetrics)
  {
    if (v44) {
      -[GEOClientMetrics mergeFrom:](clientMetrics, "mergeFrom:");
    }
  }
  else if (v44)
  {
    -[GEOETATrafficUpdateResponse setClientMetrics:](self, "setClientMetrics:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOETATrafficUpdateResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_1690);
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
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20004u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOETATrafficUpdateResponse *)self readAll:0];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v7 = self->_routes;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v42;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v41 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v9);
    }

    [(GEOETATrafficUpdateWaypointRoute *)self->_waypointRoute clearUnknownFields:1];
    [(GEOPDDatasetABStatus *)self->_datasetAbStatus clearUnknownFields:1];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    unint64_t v12 = self->_cameras;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v38;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v37 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v14);
    }

    tripId = self->_tripId;
    if (tripId)
    {
      uint64_t v18 = tripId->_unknownFields;
      tripId->_unknownFields = 0;
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v19 = self->_trafficSignals;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v33 objects:v46 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * v23++) clearUnknownFields:1];
        }
        while (v21 != v23);
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v33 objects:v46 count:16];
      }
      while (v21);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v24 = self->_arrivalParameters;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v29 objects:v45 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v30;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(v24);
          }
          objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v28++), "clearUnknownFields:", 1, (void)v29);
        }
        while (v26 != v28);
        uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v29 objects:v45 count:16];
      }
      while (v26);
    }

    [(GEOCommonResponseAttributes *)self->_responseAttributes clearUnknownFields:1];
    [(GEOClientMetrics *)self->_clientMetrics clearUnknownFields:1];
  }
}

- (void)_readClientMetrics
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 172) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientMetrics_tags_1691);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasClientMetrics
{
  return self->_clientMetrics != 0;
}

- (GEOClientMetrics)clientMetrics
{
  -[GEOETATrafficUpdateResponse _readClientMetrics]((uint64_t)self);
  clientMetrics = self->_clientMetrics;

  return clientMetrics;
}

- (void)setClientMetrics:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20040u;
  objc_storeStrong((id *)&self->_clientMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointRoute, 0);
  objc_storeStrong((id *)&self->_tripId, 0);
  objc_storeStrong((id *)&self->_trafficSignals, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_responseId, 0);
  objc_storeStrong((id *)&self->_responseAttributes, 0);
  objc_storeStrong((id *)&self->_internalErrors, 0);
  objc_storeStrong((id *)&self->_debugData, 0);
  objc_storeStrong((id *)&self->_datasetAbStatus, 0);
  objc_storeStrong((id *)&self->_clientMetrics, 0);
  objc_storeStrong((id *)&self->_cameras, 0);
  objc_storeStrong((id *)&self->_arrivalParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end