@interface GEOCompanionRouteDetails
+ (BOOL)isValid:(id)a3;
+ (Class)routeDescriptionsType;
+ (Class)stepType;
+ (Class)waypointsType;
+ (id)syntheticRouteDetailsWithWaypoints:(id)a3 transportType:(int)a4 destinationName:(id)a5;
- (BOOL)_hasIncompatibleManeuverType:(unint64_t)a3;
- (BOOL)_needsWaypointRemoval:(unint64_t)a3;
- (BOOL)canNavigate;
- (BOOL)disallowStandaloneFallback;
- (BOOL)hasAnchorPointsData;
- (BOOL)hasCanNavigate;
- (BOOL)hasDecoderData;
- (BOOL)hasDestination;
- (BOOL)hasDestinationName;
- (BOOL)hasDisallowStandaloneFallback;
- (BOOL)hasDistance;
- (BOOL)hasEtaResponse;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHistoricalDuration;
- (BOOL)hasIsTrace;
- (BOOL)hasName;
- (BOOL)hasOrigin;
- (BOOL)hasOriginalDuration;
- (BOOL)hasOriginalRouteID;
- (BOOL)hasOriginalSuggestedRoute;
- (BOOL)hasRequest;
- (BOOL)hasResponse;
- (BOOL)hasRevisionID;
- (BOOL)hasRouteID;
- (BOOL)hasRouteIndex;
- (BOOL)hasShowTransitSchedules;
- (BOOL)hasSource;
- (BOOL)hasStorageID;
- (BOOL)hasStyleAttributes;
- (BOOL)hasTrafficDescription;
- (BOOL)hasTransportType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSyntheticRoute;
- (BOOL)isTrace;
- (BOOL)readFrom:(id)a3;
- (BOOL)showTransitSchedules;
- (GEOCompanionRouteDetails)init;
- (GEOCompanionRouteDetails)initWithData:(id)a3;
- (GEOCompanionRouteDetails)initWithDictionary:(id)a3;
- (GEOCompanionRouteDetails)initWithJSON:(id)a3;
- (GEOCompanionRouteDetails)initWithRoute:(id)a3 destinationName:(id)a4 stringFormatter:(id)a5 traffic:(id)a6;
- (GEOCompanionWaypoint)companionDestination;
- (GEOCompanionWaypoint)companionOrigin;
- (GEOComposedWaypoint)composedDestination;
- (GEOComposedWaypoint)composedOrigin;
- (GEODirectionsRequest)request;
- (GEODirectionsResponse)response;
- (GEOETATrafficUpdateResponse)etaResponse;
- (GEOMapItemStorage)destination;
- (GEOMapItemStorage)origin;
- (GEOStyleAttributes)styleAttributes;
- (GEOTransitDecoderData)decoderData;
- (GEOTransitSuggestedRoute)originalSuggestedRoute;
- (NSArray)selectedRideIndices;
- (NSData)anchorPointsData;
- (NSData)originalRouteID;
- (NSData)revisionID;
- (NSData)routeID;
- (NSData)storageID;
- (NSMutableArray)routeDescriptions;
- (NSMutableArray)steps;
- (NSMutableArray)waypoints;
- (NSString)description;
- (NSString)destinationName;
- (NSString)name;
- (NSString)shortDescription;
- (NSString)trafficDescription;
- (double)coordinates;
- (double)coordinatesAtIndex:(unint64_t)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)companionWaypointAtIndex:(unint64_t)a3;
- (id)composedWaypointAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)routeDescriptionsAtIndex:(unint64_t)a3;
- (id)stepAtIndex:(unint64_t)a3;
- (id)stepWithID:(unint64_t)a3;
- (id)transportTypeAsString:(int)a3;
- (id)waypointsAtIndex:(unint64_t)a3;
- (int)StringAsTransportType:(id)a3;
- (int)transportType;
- (unint64_t)coordinatesCount;
- (unint64_t)hash;
- (unint64_t)routeDescriptionsCount;
- (unint64_t)selectedRideIndexsCount;
- (unint64_t)stepIndexWithID:(unint64_t)a3;
- (unint64_t)stepsCount;
- (unint64_t)trafficColorOffsetsCount;
- (unint64_t)trafficColorsCount;
- (unint64_t)waypointsCount;
- (unsigned)distance;
- (unsigned)historicalDuration;
- (unsigned)originalDuration;
- (unsigned)routeIndex;
- (unsigned)selectedRideIndexAtIndex:(unint64_t)a3;
- (unsigned)selectedRideIndexs;
- (unsigned)source;
- (unsigned)trafficColorAtIndex:(unint64_t)a3;
- (unsigned)trafficColorOffsetAtIndex:(unint64_t)a3;
- (unsigned)trafficColorOffsets;
- (unsigned)trafficColors;
- (void)_addNoFlagsRouteDescriptions:(uint64_t)a1;
- (void)_addNoFlagsStep:(uint64_t)a1;
- (void)_addNoFlagsWaypoints:(uint64_t)a1;
- (void)_initForPreHunterWithRoute:(id)a3 stringFormatter:(id)a4;
- (void)_readAnchorPointsData;
- (void)_readCoordinates;
- (void)_readDecoderData;
- (void)_readDestination;
- (void)_readDestinationName;
- (void)_readEtaResponse;
- (void)_readName;
- (void)_readOrigin;
- (void)_readOriginalRouteID;
- (void)_readOriginalSuggestedRoute;
- (void)_readRequest;
- (void)_readResponse;
- (void)_readRevisionID;
- (void)_readRouteDescriptions;
- (void)_readRouteID;
- (void)_readSelectedRideIndexs;
- (void)_readSteps;
- (void)_readStorageID;
- (void)_readStyleAttributes;
- (void)_readTrafficColorOffsets;
- (void)_readTrafficColors;
- (void)_readTrafficDescription;
- (void)_readWaypoints;
- (void)addCoordinates:(double)a3;
- (void)addRouteDescriptions:(id)a3;
- (void)addSelectedRideIndex:(unsigned int)a3;
- (void)addStep:(id)a3;
- (void)addTrafficColor:(unsigned int)a3;
- (void)addTrafficColorOffset:(unsigned int)a3;
- (void)addWaypoints:(id)a3;
- (void)clearCoordinates;
- (void)clearRouteDescriptions;
- (void)clearSelectedRideIndexs;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearSteps;
- (void)clearTrafficColorOffsets;
- (void)clearTrafficColors;
- (void)clearWaypoints;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnchorPointsData:(id)a3;
- (void)setCanNavigate:(BOOL)a3;
- (void)setCoordinates:(double *)a3 count:(unint64_t)a4;
- (void)setDecoderData:(id)a3;
- (void)setDestination:(id)a3;
- (void)setDestinationName:(id)a3;
- (void)setDisallowStandaloneFallback:(BOOL)a3;
- (void)setDistance:(unsigned int)a3;
- (void)setEtaResponse:(id)a3;
- (void)setHasCanNavigate:(BOOL)a3;
- (void)setHasDisallowStandaloneFallback:(BOOL)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)setHasHistoricalDuration:(BOOL)a3;
- (void)setHasIsTrace:(BOOL)a3;
- (void)setHasOriginalDuration:(BOOL)a3;
- (void)setHasRouteIndex:(BOOL)a3;
- (void)setHasShowTransitSchedules:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setHistoricalDuration:(unsigned int)a3;
- (void)setIsTrace:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setOriginalDuration:(unsigned int)a3;
- (void)setOriginalRouteID:(id)a3;
- (void)setOriginalSuggestedRoute:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setRevisionID:(id)a3;
- (void)setRouteDescriptions:(id)a3;
- (void)setRouteID:(id)a3;
- (void)setRouteIndex:(unsigned int)a3;
- (void)setSelectedRideIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setShowTransitSchedules:(BOOL)a3;
- (void)setSource:(unsigned int)a3;
- (void)setSteps:(id)a3;
- (void)setStorageID:(id)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setTrafficColorOffsets:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTrafficColors:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTrafficDescription:(id)a3;
- (void)setTransportType:(int)a3;
- (void)setWaypoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCompanionRouteDetails

- (GEOCompanionRouteDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionRouteDetails;
  v2 = [(GEOCompanionRouteDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionRouteDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionRouteDetails;
  v3 = [(GEOCompanionRouteDetails *)&v7 initWithData:a3];
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
  PBRepeatedDoubleClear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOCompanionRouteDetails;
  [(GEOCompanionRouteDetails *)&v3 dealloc];
}

- (void)_readDestinationName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 306) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestinationName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasDestinationName
{
  return self->_destinationName != 0;
}

- (NSString)destinationName
{
  -[GEOCompanionRouteDetails _readDestinationName]((uint64_t)self);
  destinationName = self->_destinationName;

  return destinationName;
}

- (void)setDestinationName:(id)a3
{
  *(void *)&self->_flags |= 0x200010000uLL;
  objc_storeStrong((id *)&self->_destinationName, a3);
}

- (unsigned)originalDuration
{
  return self->_originalDuration;
}

- (void)setOriginalDuration:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000004uLL;
  self->_originalDuration = a3;
}

- (void)setHasOriginalDuration:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000004;
  }
  self->_flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasOriginalDuration
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readSteps
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 307) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSteps_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (NSMutableArray)steps
{
  -[GEOCompanionRouteDetails _readSteps]((uint64_t)self);
  steps = self->_steps;

  return steps;
}

- (void)setSteps:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  steps = self->_steps;
  self->_steps = v4;
}

- (void)clearSteps
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  steps = self->_steps;

  [(NSMutableArray *)steps removeAllObjects];
}

- (void)addStep:(id)a3
{
  id v4 = a3;
  -[GEOCompanionRouteDetails _readSteps]((uint64_t)self);
  -[GEOCompanionRouteDetails _addNoFlagsStep:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsStep:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 224);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 224);
      *(void *)(a1 + 224) = v5;

      id v4 = *(void **)(a1 + 224);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)stepsCount
{
  -[GEOCompanionRouteDetails _readSteps]((uint64_t)self);
  steps = self->_steps;

  return [(NSMutableArray *)steps count];
}

- (id)stepAtIndex:(unint64_t)a3
{
  -[GEOCompanionRouteDetails _readSteps]((uint64_t)self);
  steps = self->_steps;

  return (id)[(NSMutableArray *)steps objectAtIndex:a3];
}

+ (Class)stepType
{
  return (Class)objc_opt_class();
}

- (void)_readCoordinates
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 305) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoordinates_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)coordinatesCount
{
  return self->_coordinates.count;
}

- (double)coordinates
{
  return self->_coordinates.list;
}

- (void)clearCoordinates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;

  PBRepeatedDoubleClear();
}

- (void)addCoordinates:(double)a3
{
  if (self) {
    PBRepeatedDoubleAdd();
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (double)coordinatesAtIndex:(unint64_t)a3
{
  -[GEOCompanionRouteDetails _readCoordinates]((uint64_t)self);
  p_coordinates = &self->_coordinates;
  unint64_t count = self->_coordinates.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_coordinates->list[a3];
}

- (void)setCoordinates:(double *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;

  MEMORY[0x1F4147320](&self->_coordinates, a3, a4);
}

- (void)_readRouteID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 307) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasRouteID
{
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEOCompanionRouteDetails _readRouteID]((uint64_t)self);
  routeID = self->_routeID;

  return routeID;
}

- (void)setRouteID:(id)a3
{
  *(void *)&self->_flags |= 0x208000000uLL;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (void)_readDestination
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 306) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestination_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasDestination
{
  return self->_destination != 0;
}

- (GEOMapItemStorage)destination
{
  -[GEOCompanionRouteDetails _readDestination]((uint64_t)self);
  destination = self->_destination;

  return destination;
}

- (void)setDestination:(id)a3
{
  *(void *)&self->_flags |= 0x200020000uLL;
  objc_storeStrong((id *)&self->_destination, a3);
}

- (void)_readOrigin
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 306) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOrigin_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasOrigin
{
  return self->_origin != 0;
}

- (GEOMapItemStorage)origin
{
  -[GEOCompanionRouteDetails _readOrigin]((uint64_t)self);
  origin = self->_origin;

  return origin;
}

- (void)setOrigin:(id)a3
{
  *(void *)&self->_flags |= 0x200400000uLL;
  objc_storeStrong((id *)&self->_origin, a3);
}

- (void)_readTrafficColors
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 305) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficColors_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)trafficColorsCount
{
  return self->_trafficColors.count;
}

- (unsigned)trafficColors
{
  return self->_trafficColors.list;
}

- (void)clearTrafficColors
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;

  PBRepeatedUInt32Clear();
}

- (void)addTrafficColor:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (unsigned)trafficColorAtIndex:(unint64_t)a3
{
  -[GEOCompanionRouteDetails _readTrafficColors]((uint64_t)self);
  p_trafficColors = &self->_trafficColors;
  unint64_t count = self->_trafficColors.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_trafficColors->list[a3];
}

- (void)setTrafficColors:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;

  MEMORY[0x1F4147400](&self->_trafficColors, a3, a4);
}

- (void)_readTrafficColorOffsets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 305) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficColorOffsets_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)trafficColorOffsetsCount
{
  return self->_trafficColorOffsets.count;
}

- (unsigned)trafficColorOffsets
{
  return self->_trafficColorOffsets.list;
}

- (void)clearTrafficColorOffsets
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;

  PBRepeatedUInt32Clear();
}

- (void)addTrafficColorOffset:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (unsigned)trafficColorOffsetAtIndex:(unint64_t)a3
{
  -[GEOCompanionRouteDetails _readTrafficColorOffsets]((uint64_t)self);
  p_trafficColorOffsets = &self->_trafficColorOffsets;
  unint64_t count = self->_trafficColorOffsets.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_trafficColorOffsets->list[a3];
}

- (void)setTrafficColorOffsets:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;

  MEMORY[0x1F4147400](&self->_trafficColorOffsets, a3, a4);
}

- (unsigned)historicalDuration
{
  return self->_historicalDuration;
}

- (void)setHistoricalDuration:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000002uLL;
  self->_historicalDuration = a3;
}

- (void)setHasHistoricalDuration:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000002;
  }
  self->_flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(void *)&self->_flags & 0xFFFFFFFDFFFFFFFDLL | v3);
}

- (BOOL)hasHistoricalDuration
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)canNavigate
{
  return self->_canNavigate;
}

- (void)setCanNavigate:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000040uLL;
  self->_canNavigate = a3;
}

- (void)setHasCanNavigate:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000040;
  }
  self->_flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasCanNavigate
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 306) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_5);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOCompanionRouteDetails _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(void *)&self->_flags |= 0x200080000uLL;
  objc_storeStrong((id *)&self->_name, a3);
}

- (unsigned)distance
{
  return self->_distance;
}

- (void)setDistance:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000001uLL;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  self->_flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x200000000);
}

- (BOOL)hasDistance
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readOriginalSuggestedRoute
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 306) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalSuggestedRoute_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasOriginalSuggestedRoute
{
  return self->_originalSuggestedRoute != 0;
}

- (GEOTransitSuggestedRoute)originalSuggestedRoute
{
  -[GEOCompanionRouteDetails _readOriginalSuggestedRoute]((uint64_t)self);
  originalSuggestedRoute = self->_originalSuggestedRoute;

  return originalSuggestedRoute;
}

- (void)setOriginalSuggestedRoute:(id)a3
{
  *(void *)&self->_flags |= 0x200200000uLL;
  objc_storeStrong((id *)&self->_originalSuggestedRoute, a3);
}

- (void)_readDecoderData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 305) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDecoderData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasDecoderData
{
  return self->_decoderData != 0;
}

- (GEOTransitDecoderData)decoderData
{
  -[GEOCompanionRouteDetails _readDecoderData]((uint64_t)self);
  decoderData = self->_decoderData;

  return decoderData;
}

- (void)setDecoderData:(id)a3
{
  *(void *)&self->_flags |= 0x200008000uLL;
  objc_storeStrong((id *)&self->_decoderData, a3);
}

- (BOOL)showTransitSchedules
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $7FBD6F428C719CB9236B8F56DD82782C flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x200) == 0 || self->_showTransitSchedules;
}

- (void)setShowTransitSchedules:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000200uLL;
  self->_showTransitSchedules = a3;
}

- (void)setHasShowTransitSchedules:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000200;
  }
  self->_$7FBD6F428C719CB9236B8F56DD82782C flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasShowTransitSchedules
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (int)transportType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $7FBD6F428C719CB9236B8F56DD82782C flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    return self->_transportType;
  }
  else {
    return 0;
  }
}

- (void)setTransportType:(int)a3
{
  *(void *)&self->_flags |= 0x200000020uLL;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000020;
  }
  self->_$7FBD6F428C719CB9236B8F56DD82782C flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasTransportType
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53DF0A8[a3];
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

- (void)_readRequest
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 306) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequest_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (GEODirectionsRequest)request
{
  -[GEOCompanionRouteDetails _readRequest]((uint64_t)self);
  request = self->_request;

  return request;
}

- (void)setRequest:(id)a3
{
  *(void *)&self->_flags |= 0x200800000uLL;
  objc_storeStrong((id *)&self->_request, a3);
}

- (void)_readResponse
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 307) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResponse_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (GEODirectionsResponse)response
{
  -[GEOCompanionRouteDetails _readResponse]((uint64_t)self);
  response = self->_response;

  return response;
}

- (void)setResponse:(id)a3
{
  *(void *)&self->_flags |= 0x201000000uLL;
  objc_storeStrong((id *)&self->_response, a3);
}

- (void)_readTrafficDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 307) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasTrafficDescription
{
  return self->_trafficDescription != 0;
}

- (NSString)trafficDescription
{
  -[GEOCompanionRouteDetails _readTrafficDescription]((uint64_t)self);
  trafficDescription = self->_trafficDescription;

  return trafficDescription;
}

- (void)setTrafficDescription:(id)a3
{
  *(void *)&self->_flags |= 0x280000000uLL;
  objc_storeStrong((id *)&self->_trafficDescription, a3);
}

- (void)_readOriginalRouteID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 306) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalRouteID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasOriginalRouteID
{
  return self->_originalRouteID != 0;
}

- (NSData)originalRouteID
{
  -[GEOCompanionRouteDetails _readOriginalRouteID]((uint64_t)self);
  originalRouteID = self->_originalRouteID;

  return originalRouteID;
}

- (void)setOriginalRouteID:(id)a3
{
  *(void *)&self->_flags |= 0x200100000uLL;
  objc_storeStrong((id *)&self->_originalRouteID, a3);
}

- (void)_readRouteDescriptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 307) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteDescriptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (NSMutableArray)routeDescriptions
{
  -[GEOCompanionRouteDetails _readRouteDescriptions]((uint64_t)self);
  routeDescriptions = self->_routeDescriptions;

  return routeDescriptions;
}

- (void)setRouteDescriptions:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  routeDescriptions = self->_routeDescriptions;
  self->_routeDescriptions = v4;
}

- (void)clearRouteDescriptions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  routeDescriptions = self->_routeDescriptions;

  [(NSMutableArray *)routeDescriptions removeAllObjects];
}

- (void)addRouteDescriptions:(id)a3
{
  id v4 = a3;
  -[GEOCompanionRouteDetails _readRouteDescriptions]((uint64_t)self);
  -[GEOCompanionRouteDetails _addNoFlagsRouteDescriptions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsRouteDescriptions:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 208);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 208);
      *(void *)(a1 + 208) = v5;

      id v4 = *(void **)(a1 + 208);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)routeDescriptionsCount
{
  -[GEOCompanionRouteDetails _readRouteDescriptions]((uint64_t)self);
  routeDescriptions = self->_routeDescriptions;

  return [(NSMutableArray *)routeDescriptions count];
}

- (id)routeDescriptionsAtIndex:(unint64_t)a3
{
  -[GEOCompanionRouteDetails _readRouteDescriptions]((uint64_t)self);
  routeDescriptions = self->_routeDescriptions;

  return (id)[(NSMutableArray *)routeDescriptions objectAtIndex:a3];
}

+ (Class)routeDescriptionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)isTrace
{
  return self->_isTrace;
}

- (void)setIsTrace:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000100uLL;
  self->_isTrace = a3;
}

- (void)setHasIsTrace:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000100;
  }
  self->_$7FBD6F428C719CB9236B8F56DD82782C flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasIsTrace
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (void)_readRevisionID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 307) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRevisionID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasRevisionID
{
  return self->_revisionID != 0;
}

- (NSData)revisionID
{
  -[GEOCompanionRouteDetails _readRevisionID]((uint64_t)self);
  revisionID = self->_revisionID;

  return revisionID;
}

- (void)setRevisionID:(id)a3
{
  *(void *)&self->_flags |= 0x202000000uLL;
  objc_storeStrong((id *)&self->_revisionID, a3);
}

- (void)_readWaypoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 308) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (NSMutableArray)waypoints
{
  -[GEOCompanionRouteDetails _readWaypoints]((uint64_t)self);
  waypoints = self->_waypoints;

  return waypoints;
}

- (void)setWaypoints:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  waypoints = self->_waypoints;
  self->_waypoints = v4;
}

- (void)clearWaypoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  waypoints = self->_waypoints;

  [(NSMutableArray *)waypoints removeAllObjects];
}

- (void)addWaypoints:(id)a3
{
  id v4 = a3;
  -[GEOCompanionRouteDetails _readWaypoints]((uint64_t)self);
  -[GEOCompanionRouteDetails _addNoFlagsWaypoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsWaypoints:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 256);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 256);
      *(void *)(a1 + 256) = v5;

      id v4 = *(void **)(a1 + 256);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)waypointsCount
{
  -[GEOCompanionRouteDetails _readWaypoints]((uint64_t)self);
  waypoints = self->_waypoints;

  return [(NSMutableArray *)waypoints count];
}

- (id)waypointsAtIndex:(unint64_t)a3
{
  -[GEOCompanionRouteDetails _readWaypoints]((uint64_t)self);
  waypoints = self->_waypoints;

  return (id)[(NSMutableArray *)waypoints objectAtIndex:a3];
}

+ (Class)waypointsType
{
  return (Class)objc_opt_class();
}

- (unsigned)routeIndex
{
  return self->_routeIndex;
}

- (void)setRouteIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000008uLL;
  self->_routeIndex = a3;
}

- (void)setHasRouteIndex:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000008;
  }
  self->_$7FBD6F428C719CB9236B8F56DD82782C flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasRouteIndex
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)_readEtaResponse
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 306) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaResponse_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasEtaResponse
{
  return self->_etaResponse != 0;
}

- (GEOETATrafficUpdateResponse)etaResponse
{
  -[GEOCompanionRouteDetails _readEtaResponse]((uint64_t)self);
  etaResponse = self->_etaResponse;

  return etaResponse;
}

- (void)setEtaResponse:(id)a3
{
  *(void *)&self->_flags |= 0x200040000uLL;
  objc_storeStrong((id *)&self->_etaResponse, a3);
}

- (BOOL)disallowStandaloneFallback
{
  return self->_disallowStandaloneFallback;
}

- (void)setDisallowStandaloneFallback:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200000080uLL;
  self->_disallowStandaloneFallback = a3;
}

- (void)setHasDisallowStandaloneFallback:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000080;
  }
  self->_$7FBD6F428C719CB9236B8F56DD82782C flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasDisallowStandaloneFallback
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 307) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOCompanionRouteDetails _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(void *)&self->_flags |= 0x240000000uLL;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readSelectedRideIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 305) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSelectedRideIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)selectedRideIndexsCount
{
  return self->_selectedRideIndexs.count;
}

- (unsigned)selectedRideIndexs
{
  return self->_selectedRideIndexs.list;
}

- (void)clearSelectedRideIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;

  PBRepeatedUInt32Clear();
}

- (void)addSelectedRideIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (unsigned)selectedRideIndexAtIndex:(unint64_t)a3
{
  -[GEOCompanionRouteDetails _readSelectedRideIndexs]((uint64_t)self);
  p_selectedRideIndexs = &self->_selectedRideIndexs;
  unint64_t count = self->_selectedRideIndexs.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_selectedRideIndexs->list[a3];
}

- (void)setSelectedRideIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;

  MEMORY[0x1F4147400](&self->_selectedRideIndexs, a3, a4);
}

- (unsigned)source
{
  return self->_source;
}

- (void)setSource:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000010uLL;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000010;
  }
  self->_$7FBD6F428C719CB9236B8F56DD82782C flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)_readStorageID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 307) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStorageID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasStorageID
{
  return self->_storageID != 0;
}

- (NSData)storageID
{
  -[GEOCompanionRouteDetails _readStorageID]((uint64_t)self);
  storageID = self->_storageID;

  return storageID;
}

- (void)setStorageID:(id)a3
{
  *(void *)&self->_flags |= 0x220000000uLL;
  objc_storeStrong((id *)&self->_storageID, a3);
}

- (void)_readAnchorPointsData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(unsigned char *)(a1 + 305) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnchorPointsData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasAnchorPointsData
{
  return self->_anchorPointsData != 0;
}

- (NSData)anchorPointsData
{
  -[GEOCompanionRouteDetails _readAnchorPointsData]((uint64_t)self);
  anchorPointsData = self->_anchorPointsData;

  return anchorPointsData;
}

- (void)setAnchorPointsData:(id)a3
{
  *(void *)&self->_flags |= 0x200004000uLL;
  objc_storeStrong((id *)&self->_anchorPointsData, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCompanionRouteDetails;
  id v4 = [(GEOCompanionRouteDetails *)&v8 description];
  id v5 = [(GEOCompanionRouteDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionRouteDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 destinationName];
    if (v5) {
      [v4 setObject:v5 forKey:@"destinationName"];
    }

    if ((*(unsigned char *)(a1 + 304) & 4) != 0)
    {
      objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 284)];
      [v4 setObject:v6 forKey:@"originalDuration"];
    }
    if ([*(id *)(a1 + 224) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 224), "count"));
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v8 = *(id *)(a1 + 224);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v99 objects:v105 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v100;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v100 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v99 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            id v14 = [v13 dictionaryRepresentation];
            }

            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v99 objects:v105 count:16];
        }
        while (v10);
      }

      [v4 setObject:v7 forKey:@"step"];
    }
    if (*(void *)(a1 + 24))
    {
      v15 = PBRepeatedDoubleNSArray();
      [v4 setObject:v15 forKey:@"coordinates"];
    }
    v16 = [(id)a1 routeID];
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 base64EncodedStringWithOptions:0];
        [v4 setObject:v18 forKey:@"routeID"];
      }
      else
      {
        [v4 setObject:v16 forKey:@"routeID"];
      }
    }

    v19 = [(id)a1 destination];
    v20 = v19;
    if (v19)
    {
      if (a2) {
        [v19 jsonRepresentation];
      }
      else {
      id v21 = [v19 dictionaryRepresentation];
      }

      [v4 setObject:v21 forKey:@"destination"];
    }

    v22 = [(id)a1 origin];
    v23 = v22;
    if (v22)
    {
      if (a2) {
        [v22 jsonRepresentation];
      }
      else {
      id v24 = [v22 dictionaryRepresentation];
      }

      [v4 setObject:v24 forKey:@"origin"];
    }

    if (*(void *)(a1 + 96))
    {
      v25 = PBRepeatedUInt32NSArray();
      [v4 setObject:v25 forKey:@"trafficColor"];
    }
    if (*(void *)(a1 + 72))
    {
      v26 = PBRepeatedUInt32NSArray();
      [v4 setObject:v26 forKey:@"trafficColorOffset"];
    }
    uint64_t v27 = *(void *)(a1 + 304);
    if ((v27 & 2) != 0)
    {
      v28 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 280)];
      [v4 setObject:v28 forKey:@"historicalDuration"];

      uint64_t v27 = *(void *)(a1 + 304);
    }
    if ((v27 & 0x40) != 0)
    {
      v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 300)];
      [v4 setObject:v29 forKey:@"canNavigate"];
    }
    v30 = [(id)a1 name];
    if (v30) {
      [v4 setObject:v30 forKey:@"name"];
    }

    if (*(unsigned char *)(a1 + 304))
    {
      v31 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 276)];
      [v4 setObject:v31 forKey:@"distance"];
    }
    v32 = [(id)a1 originalSuggestedRoute];
    v33 = v32;
    if (v32)
    {
      if (a2) {
        [v32 jsonRepresentation];
      }
      else {
      id v34 = [v32 dictionaryRepresentation];
      }

      [v4 setObject:v34 forKey:@"originalSuggestedRoute"];
    }

    v35 = [(id)a1 decoderData];
    v36 = v35;
    if (v35)
    {
      if (a2) {
        [v35 jsonRepresentation];
      }
      else {
      id v37 = [v35 dictionaryRepresentation];
      }

      [v4 setObject:v37 forKey:@"decoderData"];
    }

    uint64_t v38 = *(void *)(a1 + 304);
    if ((v38 & 0x200) != 0)
    {
      v39 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 303)];
      if (a2) {
        v40 = @"showTransitSchedules";
      }
      else {
        v40 = @"show_transit_schedules";
      }
      [v4 setObject:v39 forKey:v40];

      uint64_t v38 = *(void *)(a1 + 304);
    }
    if ((v38 & 0x20) != 0)
    {
      uint64_t v41 = *(int *)(a1 + 296);
      if (v41 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 296));
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v42 = off_1E53DF0A8[v41];
      }
      [v4 setObject:v42 forKey:@"transportType"];
    }
    v43 = [(id)a1 request];
    v44 = v43;
    if (v43)
    {
      if (a2) {
        [v43 jsonRepresentation];
      }
      else {
      id v45 = [v43 dictionaryRepresentation];
      }

      [v4 setObject:v45 forKey:@"request"];
    }

    v46 = [(id)a1 response];
    v47 = v46;
    if (v46)
    {
      if (a2) {
        [v46 jsonRepresentation];
      }
      else {
      id v48 = [v46 dictionaryRepresentation];
      }

      [v4 setObject:v48 forKey:@"response"];
    }

    v49 = [(id)a1 trafficDescription];
    if (v49) {
      [v4 setObject:v49 forKey:@"trafficDescription"];
    }

    v50 = [(id)a1 originalRouteID];
    v51 = v50;
    if (v50)
    {
      if (a2)
      {
        v52 = [v50 base64EncodedStringWithOptions:0];
        [v4 setObject:v52 forKey:@"originalRouteID"];
      }
      else
      {
        [v4 setObject:v50 forKey:@"originalRouteID"];
      }
    }

    if ([*(id *)(a1 + 208) count])
    {
      v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 208), "count"));
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v54 = *(id *)(a1 + 208);
      uint64_t v55 = [v54 countByEnumeratingWithState:&v95 objects:v104 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v96;
        do
        {
          for (uint64_t j = 0; j != v56; ++j)
          {
            if (*(void *)v96 != v57) {
              objc_enumerationMutation(v54);
            }
            v59 = *(void **)(*((void *)&v95 + 1) + 8 * j);
            if (a2) {
              [v59 jsonRepresentation];
            }
            else {
            id v60 = [v59 dictionaryRepresentation];
            }

            [v53 addObject:v60];
          }
          uint64_t v56 = [v54 countByEnumeratingWithState:&v95 objects:v104 count:16];
        }
        while (v56);
      }

      [v4 setObject:v53 forKey:@"routeDescriptions"];
    }
    if (*(unsigned char *)(a1 + 305))
    {
      v61 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 302)];
      [v4 setObject:v61 forKey:@"isTrace"];
    }
    v62 = [(id)a1 revisionID];
    v63 = v62;
    if (v62)
    {
      if (a2)
      {
        v64 = [v62 base64EncodedStringWithOptions:0];
        [v4 setObject:v64 forKey:@"revisionID"];
      }
      else
      {
        [v4 setObject:v62 forKey:@"revisionID"];
      }
    }

    if ([*(id *)(a1 + 256) count])
    {
      v65 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 256), "count"));
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v66 = *(id *)(a1 + 256);
      uint64_t v67 = [v66 countByEnumeratingWithState:&v91 objects:v103 count:16];
      if (v67)
      {
        uint64_t v68 = v67;
        uint64_t v69 = *(void *)v92;
        do
        {
          for (uint64_t k = 0; k != v68; ++k)
          {
            if (*(void *)v92 != v69) {
              objc_enumerationMutation(v66);
            }
            v71 = *(void **)(*((void *)&v91 + 1) + 8 * k);
            if (a2) {
              [v71 jsonRepresentation];
            }
            else {
            id v72 = [v71 dictionaryRepresentation];
            }

            [v65 addObject:v72];
          }
          uint64_t v68 = [v66 countByEnumeratingWithState:&v91 objects:v103 count:16];
        }
        while (v68);
      }

      [v4 setObject:v65 forKey:@"waypoints"];
    }
    if ((*(unsigned char *)(a1 + 304) & 8) != 0)
    {
      v73 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 288)];
      [v4 setObject:v73 forKey:@"routeIndex"];
    }
    v74 = [(id)a1 etaResponse];
    v75 = v74;
    if (v74)
    {
      if (a2) {
        [v74 jsonRepresentation];
      }
      else {
      id v76 = [v74 dictionaryRepresentation];
      }

      [v4 setObject:v76 forKey:@"etaResponse"];
    }

    if ((*(unsigned char *)(a1 + 304) & 0x80) != 0)
    {
      v77 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 301)];
      [v4 setObject:v77 forKey:@"disallowStandaloneFallback"];
    }
    v78 = [(id)a1 styleAttributes];
    v79 = v78;
    if (v78)
    {
      if (a2) {
        [v78 jsonRepresentation];
      }
      else {
      id v80 = [v78 dictionaryRepresentation];
      }

      [v4 setObject:v80 forKey:@"styleAttributes"];
    }

    if (*(void *)(a1 + 48))
    {
      v81 = PBRepeatedUInt32NSArray();
      [v4 setObject:v81 forKey:@"selectedRideIndex"];
    }
    if ((*(unsigned char *)(a1 + 304) & 0x10) != 0)
    {
      v82 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 292)];
      [v4 setObject:v82 forKey:@"source"];
    }
    v83 = [(id)a1 storageID];
    v84 = v83;
    if (v83)
    {
      if (a2)
      {
        v85 = [v83 base64EncodedStringWithOptions:0];
        [v4 setObject:v85 forKey:@"storageID"];
      }
      else
      {
        [v4 setObject:v83 forKey:@"storageID"];
      }
    }

    v86 = [(id)a1 anchorPointsData];
    v87 = v86;
    if (v86)
    {
      if (a2)
      {
        v88 = [v86 base64EncodedStringWithOptions:0];
        [v4 setObject:v88 forKey:@"anchorPointsData"];
      }
      else
      {
        [v4 setObject:v86 forKey:@"anchorPointsData"];
      }
    }

    id v89 = v4;
  }
  else
  {
    id v89 = 0;
  }

  return v89;
}

- (id)jsonRepresentation
{
  return -[GEOCompanionRouteDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionRouteDetails)initWithDictionary:(id)a3
{
  return (GEOCompanionRouteDetails *)-[GEOCompanionRouteDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_187;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_187;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"destinationName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (void *)[v6 copy];
    [a1 setDestinationName:v7];
  }
  id v8 = [v5 objectForKeyedSubscript:@"originalDuration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setOriginalDuration:", objc_msgSend(v8, "unsignedIntValue"));
  }

  uint64_t v9 = [v5 objectForKeyedSubscript:@"step"];
  objc_opt_class();
  id v128 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    v126 = v9;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v153 objects:v163 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v154;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v154 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v153 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = [GEOCompanionStep alloc];
            if (a3) {
              uint64_t v17 = [(GEOCompanionStep *)v16 initWithJSON:v15];
            }
            else {
              uint64_t v17 = [(GEOCompanionStep *)v16 initWithDictionary:v15];
            }
            v18 = (void *)v17;
            objc_msgSend(a1, "addStep:", v17, v126);
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v153 objects:v163 count:16];
      }
      while (v12);
    }

    uint64_t v9 = v126;
    id v5 = v128;
  }

  v19 = [v5 objectForKeyedSubscript:@"coordinates"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v149 objects:v162 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v150;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v150 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v149 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v25 doubleValue];
            objc_msgSend(a1, "addCoordinates:");
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v149 objects:v162 count:16];
      }
      while (v22);
    }

    id v5 = v128;
  }

  v26 = [v5 objectForKeyedSubscript:@"routeID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v26 options:0];
    [a1 setRouteID:v27];
  }
  v28 = [v5 objectForKeyedSubscript:@"destination"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = [GEOMapItemStorage alloc];
    if (a3) {
      uint64_t v30 = [(GEOMapItemStorage *)v29 initWithJSON:v28];
    }
    else {
      uint64_t v30 = [(GEOMapItemStorage *)v29 initWithDictionary:v28];
    }
    v31 = (void *)v30;
    objc_msgSend(a1, "setDestination:", v30, v126);
  }
  v32 = [v5 objectForKeyedSubscript:@"origin"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v33 = [GEOMapItemStorage alloc];
    if (a3) {
      uint64_t v34 = [(GEOMapItemStorage *)v33 initWithJSON:v32];
    }
    else {
      uint64_t v34 = [(GEOMapItemStorage *)v33 initWithDictionary:v32];
    }
    v35 = (void *)v34;
    objc_msgSend(a1, "setOrigin:", v34, v126);
  }
  v36 = [v5 objectForKeyedSubscript:@"trafficColor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    id v37 = v36;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v145 objects:v161 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v146;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v146 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = *(void **)(*((void *)&v145 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(a1, "addTrafficColor:", objc_msgSend(v42, "unsignedIntValue"));
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v145 objects:v161 count:16];
      }
      while (v39);
    }

    id v5 = v128;
  }

  v43 = [v5 objectForKeyedSubscript:@"trafficColorOffset"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    id v44 = v43;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v141 objects:v160 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v142;
      do
      {
        for (uint64_t m = 0; m != v46; ++m)
        {
          if (*(void *)v142 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = *(void **)(*((void *)&v141 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(a1, "addTrafficColorOffset:", objc_msgSend(v49, "unsignedIntValue"));
          }
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v141 objects:v160 count:16];
      }
      while (v46);
    }

    id v5 = v128;
  }

  v50 = [v5 objectForKeyedSubscript:@"historicalDuration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setHistoricalDuration:", objc_msgSend(v50, "unsignedIntValue"));
  }

  v51 = [v5 objectForKeyedSubscript:@"canNavigate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCanNavigate:", objc_msgSend(v51, "BOOLValue"));
  }

  v52 = [v5 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v53 = (void *)[v52 copy];
    [a1 setName:v53];
  }
  id v54 = [v5 objectForKeyedSubscript:@"distance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDistance:", objc_msgSend(v54, "unsignedIntValue"));
  }

  uint64_t v55 = [v5 objectForKeyedSubscript:@"originalSuggestedRoute"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v56 = [GEOTransitSuggestedRoute alloc];
    if (a3) {
      uint64_t v57 = [(GEOTransitSuggestedRoute *)v56 initWithJSON:v55];
    }
    else {
      uint64_t v57 = [(GEOTransitSuggestedRoute *)v56 initWithDictionary:v55];
    }
    v58 = (void *)v57;
    objc_msgSend(a1, "setOriginalSuggestedRoute:", v57, v126);
  }
  v59 = [v5 objectForKeyedSubscript:@"decoderData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v60 = [GEOTransitDecoderData alloc];
    if (a3) {
      uint64_t v61 = [(GEOTransitDecoderData *)v60 initWithJSON:v59];
    }
    else {
      uint64_t v61 = [(GEOTransitDecoderData *)v60 initWithDictionary:v59];
    }
    v62 = (void *)v61;
    objc_msgSend(a1, "setDecoderData:", v61, v126);
  }
  if (a3) {
    v63 = @"showTransitSchedules";
  }
  else {
    v63 = @"show_transit_schedules";
  }
  v64 = objc_msgSend(v5, "objectForKeyedSubscript:", v63, v126);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setShowTransitSchedules:", objc_msgSend(v64, "BOOLValue"));
  }

  v65 = [v5 objectForKeyedSubscript:@"transportType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v66 = v65;
    if ([v66 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v67 = 0;
    }
    else if ([v66 isEqualToString:@"TRANSIT"])
    {
      uint64_t v67 = 1;
    }
    else if ([v66 isEqualToString:@"WALKING"])
    {
      uint64_t v67 = 2;
    }
    else if ([v66 isEqualToString:@"BICYCLE"])
    {
      uint64_t v67 = 3;
    }
    else if ([v66 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v67 = 4;
    }
    else if ([v66 isEqualToString:@"FERRY"])
    {
      uint64_t v67 = 5;
    }
    else if ([v66 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v67 = 6;
    }
    else
    {
      uint64_t v67 = 0;
    }

    goto LABEL_108;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v67 = [v65 intValue];
LABEL_108:
    [a1 setTransportType:v67];
  }

  uint64_t v68 = [v5 objectForKeyedSubscript:@"request"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v69 = [GEODirectionsRequest alloc];
    if (a3) {
      uint64_t v70 = [(GEODirectionsRequest *)v69 initWithJSON:v68];
    }
    else {
      uint64_t v70 = [(GEODirectionsRequest *)v69 initWithDictionary:v68];
    }
    v71 = (void *)v70;
    [a1 setRequest:v70];
  }
  id v72 = [v5 objectForKeyedSubscript:@"response"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v73 = [GEODirectionsResponse alloc];
    if (a3) {
      uint64_t v74 = [(GEODirectionsResponse *)v73 initWithJSON:v72];
    }
    else {
      uint64_t v74 = [(GEODirectionsResponse *)v73 initWithDictionary:v72];
    }
    v75 = (void *)v74;
    [a1 setResponse:v74];
  }
  id v76 = [v5 objectForKeyedSubscript:@"trafficDescription"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v77 = (void *)[v76 copy];
    [a1 setTrafficDescription:v77];
  }
  v78 = [v5 objectForKeyedSubscript:@"originalRouteID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v79 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v78 options:0];
    [a1 setOriginalRouteID:v79];
  }
  id v80 = [v5 objectForKeyedSubscript:@"routeDescriptions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    v127 = v80;
    id v81 = v80;
    uint64_t v82 = [v81 countByEnumeratingWithState:&v137 objects:v159 count:16];
    if (v82)
    {
      uint64_t v83 = v82;
      uint64_t v84 = *(void *)v138;
      do
      {
        for (uint64_t n = 0; n != v83; ++n)
        {
          if (*(void *)v138 != v84) {
            objc_enumerationMutation(v81);
          }
          uint64_t v86 = *(void *)(*((void *)&v137 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v87 = [GEOFormattedString alloc];
            if (a3) {
              uint64_t v88 = [(GEOFormattedString *)v87 initWithJSON:v86];
            }
            else {
              uint64_t v88 = [(GEOFormattedString *)v87 initWithDictionary:v86];
            }
            id v89 = (void *)v88;
            objc_msgSend(a1, "addRouteDescriptions:", v88, v127);
          }
        }
        uint64_t v83 = [v81 countByEnumeratingWithState:&v137 objects:v159 count:16];
      }
      while (v83);
    }

    id v80 = v127;
    id v5 = v128;
  }

  v90 = [v5 objectForKeyedSubscript:@"isTrace"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsTrace:", objc_msgSend(v90, "BOOLValue"));
  }

  long long v91 = [v5 objectForKeyedSubscript:@"revisionID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v92 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v91 options:0];
    [a1 setRevisionID:v92];
  }
  long long v93 = [v5 objectForKeyedSubscript:@"waypoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    v127 = v93;
    id v94 = v93;
    uint64_t v95 = [v94 countByEnumeratingWithState:&v133 objects:v158 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v134;
      do
      {
        for (iuint64_t i = 0; ii != v96; ++ii)
        {
          if (*(void *)v134 != v97) {
            objc_enumerationMutation(v94);
          }
          uint64_t v99 = *(void *)(*((void *)&v133 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v100 = [GEOCompanionWaypoint alloc];
            if (a3) {
              uint64_t v101 = [(GEOCompanionWaypoint *)v100 initWithJSON:v99];
            }
            else {
              uint64_t v101 = [(GEOCompanionWaypoint *)v100 initWithDictionary:v99];
            }
            long long v102 = (void *)v101;
            objc_msgSend(a1, "addWaypoints:", v101, v127);
          }
        }
        uint64_t v96 = [v94 countByEnumeratingWithState:&v133 objects:v158 count:16];
      }
      while (v96);
    }

    long long v93 = v127;
    id v5 = v128;
  }

  v103 = [v5 objectForKeyedSubscript:@"routeIndex"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRouteIndex:", objc_msgSend(v103, "unsignedIntValue"));
  }

  v104 = [v5 objectForKeyedSubscript:@"etaResponse"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v105 = [GEOETATrafficUpdateResponse alloc];
    if (a3) {
      uint64_t v106 = [(GEOETATrafficUpdateResponse *)v105 initWithJSON:v104];
    }
    else {
      uint64_t v106 = [(GEOETATrafficUpdateResponse *)v105 initWithDictionary:v104];
    }
    v107 = (void *)v106;
    objc_msgSend(a1, "setEtaResponse:", v106, v127);
  }
  v108 = [v5 objectForKeyedSubscript:@"disallowStandaloneFallback"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDisallowStandaloneFallback:", objc_msgSend(v108, "BOOLValue"));
  }

  v109 = [v5 objectForKeyedSubscript:@"styleAttributes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v110 = [GEOStyleAttributes alloc];
    if (a3) {
      uint64_t v111 = [(GEOStyleAttributes *)v110 initWithJSON:v109];
    }
    else {
      uint64_t v111 = [(GEOStyleAttributes *)v110 initWithDictionary:v109];
    }
    v112 = (void *)v111;
    objc_msgSend(a1, "setStyleAttributes:", v111, v127);
  }
  v113 = [v5 objectForKeyedSubscript:@"selectedRideIndex"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    id v114 = v113;
    uint64_t v115 = [v114 countByEnumeratingWithState:&v129 objects:v157 count:16];
    if (v115)
    {
      uint64_t v116 = v115;
      uint64_t v117 = *(void *)v130;
      do
      {
        for (juint64_t j = 0; jj != v116; ++jj)
        {
          if (*(void *)v130 != v117) {
            objc_enumerationMutation(v114);
          }
          v119 = *(void **)(*((void *)&v129 + 1) + 8 * jj);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(a1, "addSelectedRideIndex:", objc_msgSend(v119, "unsignedIntValue"));
          }
        }
        uint64_t v116 = [v114 countByEnumeratingWithState:&v129 objects:v157 count:16];
      }
      while (v116);
    }
  }
  v120 = [v5 objectForKeyedSubscript:@"source"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSource:", objc_msgSend(v120, "unsignedIntValue"));
  }

  v121 = [v5 objectForKeyedSubscript:@"storageID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v122 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v121 options:0];
    [a1 setStorageID:v122];
  }
  v123 = [v5 objectForKeyedSubscript:@"anchorPointsData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v124 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v123 options:0];
    [a1 setAnchorPointsData:v124];
  }
  a1 = a1;

LABEL_187:
  return a1;
}

- (GEOCompanionRouteDetails)initWithJSON:(id)a3
{
  return (GEOCompanionRouteDetails *)-[GEOCompanionRouteDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_440;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_441;
    }
    GEOCompanionRouteDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOCompanionRouteDetailsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionRouteDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionRouteDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOCompanionRouteDetailsIsDirty((uint64_t)self) & 1) == 0)
  {
    id v24 = self->_reader;
    objc_sync_enter(v24);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v25 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v25];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v24);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOCompanionRouteDetails *)self readAll:0];
    if (self->_destinationName) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    objc_super v6 = self->_steps;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v36 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v7);
    }

    if (self->_coordinates.count)
    {
      uint64_t v34 = 0;
      PBDataWriterPlaceMark();
      if (self->_coordinates.count)
      {
        unint64_t v10 = 0;
        do
        {
          PBDataWriterWriteDoubleField();
          ++v10;
        }
        while (v10 < self->_coordinates.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_routeID) {
      PBDataWriterWriteDataField();
    }
    if (self->_destination) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_origin) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_trafficColors.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v11;
      }
      while (v11 < self->_trafficColors.count);
    }
    if (self->_trafficColorOffsets.count)
    {
      unint64_t v12 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v12;
      }
      while (v12 < self->_trafficColorOffsets.count);
    }
    $7FBD6F428C719CB9236B8F56DD82782C flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      $7FBD6F428C719CB9236B8F56DD82782C flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x40) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_originalSuggestedRoute) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_decoderData) {
      PBDataWriterWriteSubmessage();
    }
    $7FBD6F428C719CB9236B8F56DD82782C v14 = self->_flags;
    if ((*(_WORD *)&v14 & 0x200) != 0)
    {
      PBDataWriterWriteBOOLField();
      $7FBD6F428C719CB9236B8F56DD82782C v14 = self->_flags;
    }
    if ((*(unsigned char *)&v14 & 0x20) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_request) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_response) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_trafficDescription) {
      PBDataWriterWriteStringField();
    }
    if (self->_originalRouteID) {
      PBDataWriterWriteDataField();
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v15 = self->_routeDescriptions;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v16);
    }

    if (*((unsigned char *)&self->_flags + 1)) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_revisionID) {
      PBDataWriterWriteDataField();
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v19 = self->_waypoints;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v19);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v39 count:16];
      }
      while (v20);
    }

    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_etaResponse) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_styleAttributes) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_selectedRideIndexs.count)
    {
      unint64_t v23 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v23;
      }
      while (v23 < self->_selectedRideIndexs.count);
    }
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_storageID) {
      PBDataWriterWriteDataField();
    }
    if (self->_anchorPointsData) {
      PBDataWriterWriteDataField();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  -[GEOCompanionRouteDetails _readDecoderData]((uint64_t)self);
  if (![(GEOTransitDecoderData *)self->_decoderData hasGreenTeaWithValue:v3])
  {
    -[GEOCompanionRouteDetails _readDestination]((uint64_t)self);
    if (![(GEOMapItemStorage *)self->_destination hasGreenTeaWithValue:v3])
    {
      -[GEOCompanionRouteDetails _readEtaResponse]((uint64_t)self);
      if (![(GEOETATrafficUpdateResponse *)self->_etaResponse hasGreenTeaWithValue:v3])
      {
        -[GEOCompanionRouteDetails _readOrigin]((uint64_t)self);
        if (![(GEOMapItemStorage *)self->_origin hasGreenTeaWithValue:v3])
        {
          -[GEOCompanionRouteDetails _readOriginalSuggestedRoute]((uint64_t)self);
          if (![(GEOTransitSuggestedRoute *)self->_originalSuggestedRoute hasGreenTeaWithValue:v3])
          {
            -[GEOCompanionRouteDetails _readRequest]((uint64_t)self);
            if (![(GEODirectionsRequest *)self->_request hasGreenTeaWithValue:v3])
            {
              -[GEOCompanionRouteDetails _readResponse]((uint64_t)self);
              if (![(GEODirectionsResponse *)self->_response hasGreenTeaWithValue:v3])
              {
                -[GEOCompanionRouteDetails _readSteps]((uint64_t)self);
                long long v22 = 0u;
                long long v23 = 0u;
                long long v20 = 0u;
                long long v21 = 0u;
                uint64_t v7 = self->_steps;
                uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
                if (v8)
                {
                  uint64_t v9 = v8;
                  uint64_t v10 = *(void *)v21;
LABEL_12:
                  uint64_t v11 = 0;
                  while (1)
                  {
                    if (*(void *)v21 != v10) {
                      objc_enumerationMutation(v7);
                    }
                    if ([*(id *)(*((void *)&v20 + 1) + 8 * v11) hasGreenTeaWithValue:v3]) {
                      break;
                    }
                    if (v9 == ++v11)
                    {
                      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
                      if (v9) {
                        goto LABEL_12;
                      }
                      goto LABEL_18;
                    }
                  }
                }
                else
                {
LABEL_18:

                  -[GEOCompanionRouteDetails _readWaypoints]((uint64_t)self);
                  long long v18 = 0u;
                  long long v19 = 0u;
                  long long v16 = 0u;
                  long long v17 = 0u;
                  uint64_t v7 = self->_waypoints;
                  uint64_t v12 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
                  if (!v12)
                  {
LABEL_26:
                    BOOL v5 = 0;
LABEL_28:

                    return v5;
                  }
                  uint64_t v13 = v12;
                  uint64_t v14 = *(void *)v17;
LABEL_20:
                  uint64_t v15 = 0;
                  while (1)
                  {
                    if (*(void *)v17 != v14) {
                      objc_enumerationMutation(v7);
                    }
                    if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15), "hasGreenTeaWithValue:", v3, (void)v16))break; {
                    if (v13 == ++v15)
                    }
                    {
                      uint64_t v13 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
                      if (v13) {
                        goto LABEL_20;
                      }
                      goto LABEL_26;
                    }
                  }
                }
                BOOL v5 = 1;
                goto LABEL_28;
              }
            }
          }
        }
      }
    }
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  long long v33 = (id *)a3;
  [(GEOCompanionRouteDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v33 + 1, self->_reader);
  *((_DWORD *)v33 + 66) = self->_readerMarkPos;
  *((_DWORD *)v33 + 67) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_destinationName) {
    objc_msgSend(v33, "setDestinationName:");
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v33 + 71) = self->_originalDuration;
    v33[38] = (id)((unint64_t)v33[38] | 4);
  }
  if ([(GEOCompanionRouteDetails *)self stepsCount])
  {
    [v33 clearSteps];
    unint64_t v4 = [(GEOCompanionRouteDetails *)self stepsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOCompanionRouteDetails *)self stepAtIndex:i];
        [v33 addStep:v7];
      }
    }
  }
  if ([(GEOCompanionRouteDetails *)self coordinatesCount])
  {
    [v33 clearCoordinates];
    unint64_t v8 = [(GEOCompanionRouteDetails *)self coordinatesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        [(GEOCompanionRouteDetails *)self coordinatesAtIndex:j];
        objc_msgSend(v33, "addCoordinates:");
      }
    }
  }
  if (self->_routeID) {
    objc_msgSend(v33, "setRouteID:");
  }
  if (self->_destination) {
    objc_msgSend(v33, "setDestination:");
  }
  if (self->_origin) {
    objc_msgSend(v33, "setOrigin:");
  }
  if ([(GEOCompanionRouteDetails *)self trafficColorsCount])
  {
    [v33 clearTrafficColors];
    unint64_t v11 = [(GEOCompanionRouteDetails *)self trafficColorsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        objc_msgSend(v33, "addTrafficColor:", -[GEOCompanionRouteDetails trafficColorAtIndex:](self, "trafficColorAtIndex:", k));
    }
  }
  if ([(GEOCompanionRouteDetails *)self trafficColorOffsetsCount])
  {
    [v33 clearTrafficColorOffsets];
    unint64_t v14 = [(GEOCompanionRouteDetails *)self trafficColorOffsetsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        objc_msgSend(v33, "addTrafficColorOffset:", -[GEOCompanionRouteDetails trafficColorOffsetAtIndex:](self, "trafficColorOffsetAtIndex:", m));
    }
  }
  $7FBD6F428C719CB9236B8F56DD82782C flags = self->_flags;
  long long v18 = v33;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *((_DWORD *)v33 + 70) = self->_historicalDuration;
    v33[38] = (id)((unint64_t)v33[38] | 2);
    $7FBD6F428C719CB9236B8F56DD82782C flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    *((unsigned char *)v33 + 300) = self->_canNavigate;
    v33[38] = (id)((unint64_t)v33[38] | 0x40);
  }
  if (self->_name)
  {
    objc_msgSend(v33, "setName:");
    long long v18 = v33;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v18 + 69) = self->_distance;
    v18[38] = (id)((unint64_t)v18[38] | 1);
  }
  if (self->_originalSuggestedRoute)
  {
    objc_msgSend(v33, "setOriginalSuggestedRoute:");
    long long v18 = v33;
  }
  if (self->_decoderData)
  {
    objc_msgSend(v33, "setDecoderData:");
    long long v18 = v33;
  }
  $7FBD6F428C719CB9236B8F56DD82782C v19 = self->_flags;
  if ((*(_WORD *)&v19 & 0x200) != 0)
  {
    *((unsigned char *)v18 + 303) = self->_showTransitSchedules;
    v18[38] = (id)((unint64_t)v18[38] | 0x200);
    $7FBD6F428C719CB9236B8F56DD82782C v19 = self->_flags;
  }
  if ((*(unsigned char *)&v19 & 0x20) != 0)
  {
    *((_DWORD *)v18 + 74) = self->_transportType;
    v18[38] = (id)((unint64_t)v18[38] | 0x20);
  }
  if (self->_request) {
    objc_msgSend(v33, "setRequest:");
  }
  if (self->_response) {
    objc_msgSend(v33, "setResponse:");
  }
  if (self->_trafficDescription) {
    objc_msgSend(v33, "setTrafficDescription:");
  }
  if (self->_originalRouteID) {
    objc_msgSend(v33, "setOriginalRouteID:");
  }
  if ([(GEOCompanionRouteDetails *)self routeDescriptionsCount])
  {
    [v33 clearRouteDescriptions];
    unint64_t v20 = [(GEOCompanionRouteDetails *)self routeDescriptionsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        long long v23 = [(GEOCompanionRouteDetails *)self routeDescriptionsAtIndex:n];
        [v33 addRouteDescriptions:v23];
      }
    }
  }
  if (*((unsigned char *)&self->_flags + 1))
  {
    *((unsigned char *)v33 + 302) = self->_isTrace;
    v33[38] = (id)((unint64_t)v33[38] | 0x100);
  }
  if (self->_revisionID) {
    objc_msgSend(v33, "setRevisionID:");
  }
  if ([(GEOCompanionRouteDetails *)self waypointsCount])
  {
    [v33 clearWaypoints];
    unint64_t v24 = [(GEOCompanionRouteDetails *)self waypointsCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (iuint64_t i = 0; ii != v25; ++ii)
      {
        long long v27 = [(GEOCompanionRouteDetails *)self waypointsAtIndex:ii];
        [v33 addWaypoints:v27];
      }
    }
  }
  long long v28 = v33;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v33 + 72) = self->_routeIndex;
    v33[38] = (id)((unint64_t)v33[38] | 8);
  }
  if (self->_etaResponse)
  {
    objc_msgSend(v33, "setEtaResponse:");
    long long v28 = v33;
  }
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *((unsigned char *)v28 + 301) = self->_disallowStandaloneFallback;
    v28[38] = (id)((unint64_t)v28[38] | 0x80);
  }
  if (self->_styleAttributes) {
    objc_msgSend(v33, "setStyleAttributes:");
  }
  if ([(GEOCompanionRouteDetails *)self selectedRideIndexsCount])
  {
    [v33 clearSelectedRideIndexs];
    unint64_t v29 = [(GEOCompanionRouteDetails *)self selectedRideIndexsCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
        objc_msgSend(v33, "addSelectedRideIndex:", -[GEOCompanionRouteDetails selectedRideIndexAtIndex:](self, "selectedRideIndexAtIndex:", jj));
    }
  }
  long long v32 = v33;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v33 + 73) = self->_source;
    v33[38] = (id)((unint64_t)v33[38] | 0x10);
  }
  if (self->_storageID)
  {
    objc_msgSend(v33, "setStorageID:");
    long long v32 = v33;
  }
  if (self->_anchorPointsData)
  {
    objc_msgSend(v33, "setAnchorPointsData:");
    long long v32 = v33;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 4) & 2) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOCompanionRouteDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_47;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCompanionRouteDetails *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_destinationName copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v9;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 284) = self->_originalDuration;
    *(void *)(v5 + 304) |= 4uLL;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  unint64_t v11 = self->_steps;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v67 != v13) {
          objc_enumerationMutation(v11);
        }
        unint64_t v15 = (void *)[*(id *)(*((void *)&v66 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addStep:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v66 objects:v72 count:16];
    }
    while (v12);
  }

  PBRepeatedDoubleCopy();
  uint64_t v16 = [(NSData *)self->_routeID copyWithZone:a3];
  long long v17 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v16;

  id v18 = [(GEOMapItemStorage *)self->_destination copyWithZone:a3];
  $7FBD6F428C719CB9236B8F56DD82782C v19 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v18;

  id v20 = [(GEOMapItemStorage *)self->_origin copyWithZone:a3];
  unint64_t v21 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v20;

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  $7FBD6F428C719CB9236B8F56DD82782C flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 280) = self->_historicalDuration;
    *(void *)(v5 + 304) |= 2uLL;
    $7FBD6F428C719CB9236B8F56DD82782C flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 300) = self->_canNavigate;
    *(void *)(v5 + 304) |= 0x40uLL;
  }
  uint64_t v23 = [(NSString *)self->_name copyWithZone:a3];
  unint64_t v24 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v23;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 276) = self->_distance;
    *(void *)(v5 + 304) |= 1uLL;
  }
  id v25 = [(GEOTransitSuggestedRoute *)self->_originalSuggestedRoute copyWithZone:a3];
  uint64_t v26 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v25;

  id v27 = [(GEOTransitDecoderData *)self->_decoderData copyWithZone:a3];
  long long v28 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v27;

  $7FBD6F428C719CB9236B8F56DD82782C v29 = self->_flags;
  if ((*(_WORD *)&v29 & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 303) = self->_showTransitSchedules;
    *(void *)(v5 + 304) |= 0x200uLL;
    $7FBD6F428C719CB9236B8F56DD82782C v29 = self->_flags;
  }
  if ((*(unsigned char *)&v29 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 296) = self->_transportType;
    *(void *)(v5 + 304) |= 0x20uLL;
  }
  id v30 = [(GEODirectionsRequest *)self->_request copyWithZone:a3];
  long long v31 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v30;

  id v32 = [(GEODirectionsResponse *)self->_response copyWithZone:a3];
  long long v33 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v32;

  uint64_t v34 = [(NSString *)self->_trafficDescription copyWithZone:a3];
  long long v35 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v34;

  uint64_t v36 = [(NSData *)self->_originalRouteID copyWithZone:a3];
  long long v37 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v36;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v38 = self->_routeDescriptions;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v62 objects:v71 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v63 != v40) {
          objc_enumerationMutation(v38);
        }
        uint64_t v42 = (void *)[*(id *)(*((void *)&v62 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addRouteDescriptions:v42];
      }
      uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v62 objects:v71 count:16];
    }
    while (v39);
  }

  if (*((unsigned char *)&self->_flags + 1))
  {
    *(unsigned char *)(v5 + 302) = self->_isTrace;
    *(void *)(v5 + 304) |= 0x100uLL;
  }
  uint64_t v43 = [(NSData *)self->_revisionID copyWithZone:a3];
  id v44 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v43;

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v45 = self->_waypoints;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v46)
  {
    uint64_t v47 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v46; ++k)
      {
        if (*(void *)v59 != v47) {
          objc_enumerationMutation(v45);
        }
        v49 = objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * k), "copyWithZone:", a3, (void)v58);
        [(id)v5 addWaypoints:v49];
      }
      uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v46);
  }

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 288) = self->_routeIndex;
    *(void *)(v5 + 304) |= 8uLL;
  }
  id v50 = -[GEOETATrafficUpdateResponse copyWithZone:](self->_etaResponse, "copyWithZone:", a3, (void)v58);
  v51 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v50;

  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 301) = self->_disallowStandaloneFallback;
    *(void *)(v5 + 304) |= 0x80uLL;
  }
  id v52 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  v53 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v52;

  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 292) = self->_source;
    *(void *)(v5 + 304) |= 0x10uLL;
  }
  uint64_t v54 = [(NSData *)self->_storageID copyWithZone:a3];
  uint64_t v55 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v54;

  uint64_t v56 = [(NSData *)self->_anchorPointsData copyWithZone:a3];
  id v8 = *(id *)(v5 + 112);
  *(void *)(v5 + 112) = v56;
LABEL_47:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_108;
  }
  [(GEOCompanionRouteDetails *)self readAll:1];
  [v4 readAll:1];
  destinationName = self->_destinationName;
  if ((unint64_t)destinationName | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](destinationName, "isEqual:")) {
      goto LABEL_108;
    }
  }
  uint64_t v6 = *((void *)v4 + 38);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_originalDuration != *((_DWORD *)v4 + 71)) {
      goto LABEL_108;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_108;
  }
  steps = self->_steps;
  if ((unint64_t)steps | *((void *)v4 + 28) && !-[NSMutableArray isEqual:](steps, "isEqual:")) {
    goto LABEL_108;
  }
  if (!PBRepeatedDoubleIsEqual()) {
    goto LABEL_108;
  }
  routeID = self->_routeID;
  if ((unint64_t)routeID | *((void *)v4 + 27))
  {
    if (!-[NSData isEqual:](routeID, "isEqual:")) {
      goto LABEL_108;
    }
  }
  destinatiouint64_t n = self->_destination;
  if ((unint64_t)destination | *((void *)v4 + 17))
  {
    if (!-[GEOMapItemStorage isEqual:](destination, "isEqual:")) {
      goto LABEL_108;
    }
  }
  origiuint64_t n = self->_origin;
  if ((unint64_t)origin | *((void *)v4 + 22))
  {
    if (!-[GEOMapItemStorage isEqual:](origin, "isEqual:")) {
      goto LABEL_108;
    }
  }
  if (!PBRepeatedUInt32IsEqual() || !PBRepeatedUInt32IsEqual()) {
    goto LABEL_108;
  }
  $7FBD6F428C719CB9236B8F56DD82782C flags = self->_flags;
  uint64_t v12 = *((void *)v4 + 38);
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_historicalDuration != *((_DWORD *)v4 + 70)) {
      goto LABEL_108;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_108;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0) {
      goto LABEL_108;
    }
    if (self->_canNavigate)
    {
      if (!*((unsigned char *)v4 + 300)) {
        goto LABEL_108;
      }
    }
    else if (*((unsigned char *)v4 + 300))
    {
      goto LABEL_108;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_108;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_108;
    }
    $7FBD6F428C719CB9236B8F56DD82782C flags = self->_flags;
    uint64_t v12 = *((void *)v4 + 38);
  }
  if (*(unsigned char *)&flags)
  {
    if ((v12 & 1) == 0 || self->_distance != *((_DWORD *)v4 + 69)) {
      goto LABEL_108;
    }
  }
  else if (v12)
  {
    goto LABEL_108;
  }
  originalSuggestedRoute = self->_originalSuggestedRoute;
  if ((unint64_t)originalSuggestedRoute | *((void *)v4 + 21)
    && !-[GEOTransitSuggestedRoute isEqual:](originalSuggestedRoute, "isEqual:"))
  {
    goto LABEL_108;
  }
  decoderData = self->_decoderData;
  if ((unint64_t)decoderData | *((void *)v4 + 15))
  {
    if (!-[GEOTransitDecoderData isEqual:](decoderData, "isEqual:")) {
      goto LABEL_108;
    }
  }
  $7FBD6F428C719CB9236B8F56DD82782C v16 = self->_flags;
  uint64_t v17 = *((void *)v4 + 38);
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0) {
      goto LABEL_108;
    }
    if (self->_showTransitSchedules)
    {
      if (!*((unsigned char *)v4 + 303)) {
        goto LABEL_108;
      }
    }
    else if (*((unsigned char *)v4 + 303))
    {
      goto LABEL_108;
    }
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_108;
  }
  if ((*(unsigned char *)&v16 & 0x20) != 0)
  {
    if ((v17 & 0x20) == 0 || self->_transportType != *((_DWORD *)v4 + 74)) {
      goto LABEL_108;
    }
  }
  else if ((v17 & 0x20) != 0)
  {
    goto LABEL_108;
  }
  request = self->_request;
  if ((unint64_t)request | *((void *)v4 + 23) && !-[GEODirectionsRequest isEqual:](request, "isEqual:")) {
    goto LABEL_108;
  }
  response = self->_response;
  if ((unint64_t)response | *((void *)v4 + 24))
  {
    if (!-[GEODirectionsResponse isEqual:](response, "isEqual:")) {
      goto LABEL_108;
    }
  }
  trafficDescriptiouint64_t n = self->_trafficDescription;
  if ((unint64_t)trafficDescription | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](trafficDescription, "isEqual:")) {
      goto LABEL_108;
    }
  }
  originalRouteID = self->_originalRouteID;
  if ((unint64_t)originalRouteID | *((void *)v4 + 20))
  {
    if (!-[NSData isEqual:](originalRouteID, "isEqual:")) {
      goto LABEL_108;
    }
  }
  routeDescriptions = self->_routeDescriptions;
  if ((unint64_t)routeDescriptions | *((void *)v4 + 26))
  {
    if (!-[NSMutableArray isEqual:](routeDescriptions, "isEqual:")) {
      goto LABEL_108;
    }
  }
  uint64_t v23 = *((void *)v4 + 38);
  if (*((unsigned char *)&self->_flags + 1))
  {
    if ((v23 & 0x100) == 0) {
      goto LABEL_108;
    }
    if (self->_isTrace)
    {
      if (!*((unsigned char *)v4 + 302)) {
        goto LABEL_108;
      }
    }
    else if (*((unsigned char *)v4 + 302))
    {
      goto LABEL_108;
    }
  }
  else if ((v23 & 0x100) != 0)
  {
    goto LABEL_108;
  }
  revisionID = self->_revisionID;
  if ((unint64_t)revisionID | *((void *)v4 + 25) && !-[NSData isEqual:](revisionID, "isEqual:")) {
    goto LABEL_108;
  }
  waypoints = self->_waypoints;
  if ((unint64_t)waypoints | *((void *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](waypoints, "isEqual:")) {
      goto LABEL_108;
    }
  }
  $7FBD6F428C719CB9236B8F56DD82782C v26 = self->_flags;
  uint64_t v27 = *((void *)v4 + 38);
  if ((*(unsigned char *)&v26 & 8) != 0)
  {
    if ((v27 & 8) == 0 || self->_routeIndex != *((_DWORD *)v4 + 72)) {
      goto LABEL_108;
    }
  }
  else if ((v27 & 8) != 0)
  {
    goto LABEL_108;
  }
  etaResponse = self->_etaResponse;
  if ((unint64_t)etaResponse | *((void *)v4 + 18))
  {
    if (!-[GEOETATrafficUpdateResponse isEqual:](etaResponse, "isEqual:")) {
      goto LABEL_108;
    }
    $7FBD6F428C719CB9236B8F56DD82782C v26 = self->_flags;
    uint64_t v27 = *((void *)v4 + 38);
  }
  if ((*(unsigned char *)&v26 & 0x80) != 0)
  {
    if ((v27 & 0x80) != 0)
    {
      if (self->_disallowStandaloneFallback)
      {
        if (!*((unsigned char *)v4 + 301)) {
          goto LABEL_108;
        }
        goto LABEL_96;
      }
      if (!*((unsigned char *)v4 + 301)) {
        goto LABEL_96;
      }
    }
LABEL_108:
    char v33 = 0;
    goto LABEL_109;
  }
  if ((v27 & 0x80) != 0) {
    goto LABEL_108;
  }
LABEL_96:
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 30)
    && !-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:")
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_108;
  }
  uint64_t v30 = *((void *)v4 + 38);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((v30 & 0x10) == 0 || self->_source != *((_DWORD *)v4 + 73)) {
      goto LABEL_108;
    }
  }
  else if ((v30 & 0x10) != 0)
  {
    goto LABEL_108;
  }
  storageID = self->_storageID;
  if ((unint64_t)storageID | *((void *)v4 + 29) && !-[NSData isEqual:](storageID, "isEqual:")) {
    goto LABEL_108;
  }
  anchorPointsData = self->_anchorPointsData;
  if ((unint64_t)anchorPointsData | *((void *)v4 + 14)) {
    char v33 = -[NSData isEqual:](anchorPointsData, "isEqual:");
  }
  else {
    char v33 = 1;
  }
LABEL_109:

  return v33;
}

- (unint64_t)hash
{
  [(GEOCompanionRouteDetails *)self readAll:1];
  NSUInteger v38 = [(NSString *)self->_destinationName hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v37 = 2654435761 * self->_originalDuration;
  }
  else {
    uint64_t v37 = 0;
  }
  uint64_t v36 = [(NSMutableArray *)self->_steps hash];
  uint64_t v35 = PBRepeatedDoubleHash();
  uint64_t v34 = [(NSData *)self->_routeID hash];
  unint64_t v33 = [(GEOMapItemStorage *)self->_destination hash];
  unint64_t v32 = [(GEOMapItemStorage *)self->_origin hash];
  uint64_t v31 = PBRepeatedUInt32Hash();
  uint64_t v30 = PBRepeatedUInt32Hash();
  $7FBD6F428C719CB9236B8F56DD82782C flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    uint64_t v29 = 2654435761 * self->_historicalDuration;
    if ((*(unsigned char *)&flags & 0x40) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v29 = 0;
    if ((*(unsigned char *)&flags & 0x40) != 0)
    {
LABEL_6:
      uint64_t v28 = 2654435761 * self->_canNavigate;
      goto LABEL_9;
    }
  }
  uint64_t v28 = 0;
LABEL_9:
  NSUInteger v27 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v26 = 2654435761 * self->_distance;
  }
  else {
    uint64_t v26 = 0;
  }
  unint64_t v25 = [(GEOTransitSuggestedRoute *)self->_originalSuggestedRoute hash];
  unint64_t v24 = [(GEOTransitDecoderData *)self->_decoderData hash];
  $7FBD6F428C719CB9236B8F56DD82782C v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
    uint64_t v23 = 2654435761 * self->_showTransitSchedules;
    if ((*(unsigned char *)&v4 & 0x20) != 0) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v23 = 0;
    if ((*(unsigned char *)&v4 & 0x20) != 0)
    {
LABEL_14:
      uint64_t v22 = 2654435761 * self->_transportType;
      goto LABEL_17;
    }
  }
  uint64_t v22 = 0;
LABEL_17:
  unint64_t v21 = [(GEODirectionsRequest *)self->_request hash];
  unint64_t v20 = [(GEODirectionsResponse *)self->_response hash];
  NSUInteger v19 = [(NSString *)self->_trafficDescription hash];
  uint64_t v18 = [(NSData *)self->_originalRouteID hash];
  uint64_t v17 = [(NSMutableArray *)self->_routeDescriptions hash];
  if (*((unsigned char *)&self->_flags + 1)) {
    uint64_t v5 = [(NSData *)self->_revisionID hash];
  }
  else {
    uint64_t v5 = [(NSData *)self->_revisionID hash];
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(NSMutableArray *)self->_waypoints hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v8 = 2654435761 * self->_routeIndex;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = [(GEOETATrafficUpdateResponse *)self->_etaResponse hash];
  if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
    uint64_t v10 = 2654435761 * self->_disallowStandaloneFallback;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  uint64_t v12 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    uint64_t v13 = 2654435761 * self->_source;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v10 ^ v11 ^ v12 ^ v13 ^ [(NSData *)self->_storageID hash];
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ [(NSData *)self->_anchorPointsData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 16)) {
    -[GEOCompanionRouteDetails setDestinationName:](self, "setDestinationName:");
  }
  if ((*((unsigned char *)v4 + 304) & 4) != 0)
  {
    self->_originalDuratiouint64_t n = *((_DWORD *)v4 + 71);
    *(void *)&self->_flags |= 4uLL;
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v5 = *((id *)v4 + 28);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v59 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOCompanionRouteDetails *)self addStep:*(void *)(*((void *)&v58 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [v4 coordinatesCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
    {
      [v4 coordinatesAtIndex:j];
      -[GEOCompanionRouteDetails addCoordinates:](self, "addCoordinates:");
    }
  }
  if (*((void *)v4 + 27)) {
    [(GEOCompanionRouteDetails *)self setRouteID:"setRouteID:"];
  }
  destinatiouint64_t n = self->_destination;
  uint64_t v14 = *((void *)v4 + 17);
  if (destination)
  {
    if (v14) {
      -[GEOMapItemStorage mergeFrom:](destination, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[GEOCompanionRouteDetails setDestination:](self, "setDestination:");
  }
  origiuint64_t n = self->_origin;
  uint64_t v16 = *((void *)v4 + 22);
  if (origin)
  {
    if (v16) {
      -[GEOMapItemStorage mergeFrom:](origin, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[GEOCompanionRouteDetails setOrigin:](self, "setOrigin:");
  }
  uint64_t v17 = [v4 trafficColorsCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t k = 0; k != v18; ++k)
      -[GEOCompanionRouteDetails addTrafficColor:](self, "addTrafficColor:", [v4 trafficColorAtIndex:k]);
  }
  uint64_t v20 = [v4 trafficColorOffsetsCount];
  if (v20)
  {
    uint64_t v21 = v20;
    for (uint64_t m = 0; m != v21; ++m)
      -[GEOCompanionRouteDetails addTrafficColorOffset:](self, "addTrafficColorOffset:", [v4 trafficColorOffsetAtIndex:m]);
  }
  uint64_t v23 = *((void *)v4 + 38);
  if ((v23 & 2) != 0)
  {
    self->_historicalDuratiouint64_t n = *((_DWORD *)v4 + 70);
    *(void *)&self->_flags |= 2uLL;
    uint64_t v23 = *((void *)v4 + 38);
  }
  if ((v23 & 0x40) != 0)
  {
    self->_canNavigate = *((unsigned char *)v4 + 300);
    *(void *)&self->_flags |= 0x40uLL;
  }
  if (*((void *)v4 + 19)) {
    -[GEOCompanionRouteDetails setName:](self, "setName:");
  }
  if (*((unsigned char *)v4 + 304))
  {
    self->_distance = *((_DWORD *)v4 + 69);
    *(void *)&self->_flags |= 1uLL;
  }
  originalSuggestedRoute = self->_originalSuggestedRoute;
  uint64_t v25 = *((void *)v4 + 21);
  if (originalSuggestedRoute)
  {
    if (v25) {
      -[GEOTransitSuggestedRoute mergeFrom:](originalSuggestedRoute, "mergeFrom:");
    }
  }
  else if (v25)
  {
    [(GEOCompanionRouteDetails *)self setOriginalSuggestedRoute:"setOriginalSuggestedRoute:"];
  }
  decoderData = self->_decoderData;
  uint64_t v27 = *((void *)v4 + 15);
  if (decoderData)
  {
    if (v27) {
      -[GEOTransitDecoderData mergeFrom:](decoderData, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[GEOCompanionRouteDetails setDecoderData:](self, "setDecoderData:");
  }
  uint64_t v28 = *((void *)v4 + 38);
  if ((v28 & 0x200) != 0)
  {
    self->_showTransitSchedules = *((unsigned char *)v4 + 303);
    *(void *)&self->_flags |= 0x200uLL;
    uint64_t v28 = *((void *)v4 + 38);
  }
  if ((v28 & 0x20) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 74);
    *(void *)&self->_flags |= 0x20uLL;
  }
  request = self->_request;
  uint64_t v30 = *((void *)v4 + 23);
  if (request)
  {
    if (v30) {
      -[GEODirectionsRequest mergeFrom:](request, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[GEOCompanionRouteDetails setRequest:](self, "setRequest:");
  }
  response = self->_response;
  uint64_t v32 = *((void *)v4 + 24);
  if (response)
  {
    if (v32) {
      -[GEODirectionsResponse mergeFrom:](response, "mergeFrom:");
    }
  }
  else if (v32)
  {
    -[GEOCompanionRouteDetails setResponse:](self, "setResponse:");
  }
  if (*((void *)v4 + 31)) {
    -[GEOCompanionRouteDetails setTrafficDescription:](self, "setTrafficDescription:");
  }
  if (*((void *)v4 + 20)) {
    [(GEOCompanionRouteDetails *)self setOriginalRouteID:"setOriginalRouteID:"];
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v33 = *((id *)v4 + 26);
  uint64_t v34 = [v33 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v55;
    do
    {
      for (uint64_t n = 0; n != v35; ++n)
      {
        if (*(void *)v55 != v36) {
          objc_enumerationMutation(v33);
        }
        [(GEOCompanionRouteDetails *)self addRouteDescriptions:*(void *)(*((void *)&v54 + 1) + 8 * n)];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v35);
  }

  if (*((unsigned char *)v4 + 305))
  {
    self->_isTrace = *((unsigned char *)v4 + 302);
    *(void *)&self->_flags |= 0x100uLL;
  }
  if (*((void *)v4 + 25)) {
    -[GEOCompanionRouteDetails setRevisionID:](self, "setRevisionID:");
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v38 = *((id *)v4 + 32);
  uint64_t v39 = [v38 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v51;
    do
    {
      for (iuint64_t i = 0; ii != v40; ++ii)
      {
        if (*(void *)v51 != v41) {
          objc_enumerationMutation(v38);
        }
        -[GEOCompanionRouteDetails addWaypoints:](self, "addWaypoints:", *(void *)(*((void *)&v50 + 1) + 8 * ii), (void)v50);
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v40);
  }

  if ((*((unsigned char *)v4 + 304) & 8) != 0)
  {
    self->_routeIndex = *((_DWORD *)v4 + 72);
    *(void *)&self->_flags |= 8uLL;
  }
  etaResponse = self->_etaResponse;
  uint64_t v44 = *((void *)v4 + 18);
  if (etaResponse)
  {
    if (v44) {
      -[GEOETATrafficUpdateResponse mergeFrom:](etaResponse, "mergeFrom:");
    }
  }
  else if (v44)
  {
    -[GEOCompanionRouteDetails setEtaResponse:](self, "setEtaResponse:");
  }
  if ((*((unsigned char *)v4 + 304) & 0x80) != 0)
  {
    self->_disallowStandaloneFallbacuint64_t k = *((unsigned char *)v4 + 301);
    *(void *)&self->_flags |= 0x80uLL;
  }
  styleAttributes = self->_styleAttributes;
  uint64_t v46 = *((void *)v4 + 30);
  if (styleAttributes)
  {
    if (v46) {
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
    }
  }
  else if (v46)
  {
    -[GEOCompanionRouteDetails setStyleAttributes:](self, "setStyleAttributes:");
  }
  uint64_t v47 = objc_msgSend(v4, "selectedRideIndexsCount", (void)v50);
  if (v47)
  {
    uint64_t v48 = v47;
    for (juint64_t j = 0; jj != v48; ++jj)
      -[GEOCompanionRouteDetails addSelectedRideIndex:](self, "addSelectedRideIndex:", [v4 selectedRideIndexAtIndex:jj]);
  }
  if ((*((unsigned char *)v4 + 304) & 0x10) != 0)
  {
    self->_source = *((_DWORD *)v4 + 73);
    *(void *)&self->_flags |= 0x10uLL;
  }
  if (*((void *)v4 + 29)) {
    -[GEOCompanionRouteDetails setStorageID:](self, "setStorageID:");
  }
  if (*((void *)v4 + 14)) {
    -[GEOCompanionRouteDetails setAnchorPointsData:](self, "setAnchorPointsData:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_trafficDescription, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_storageID, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_routeDescriptions, 0);
  objc_storeStrong((id *)&self->_revisionID, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_originalSuggestedRoute, 0);
  objc_storeStrong((id *)&self->_originalRouteID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_etaResponse, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_decoderData, 0);
  objc_storeStrong((id *)&self->_anchorPointsData, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)_needsWaypointRemoval:(unint64_t)a3
{
  if (a3 < 4)
  {
    id v4 = [(GEOCompanionRouteDetails *)self waypoints];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    id v4 = [(GEOCompanionRouteDetails *)self origin];
    if (v4)
    {
      BOOL v5 = 1;
    }
    else
    {
      uint64_t v6 = [(GEOCompanionRouteDetails *)self destination];
      BOOL v5 = v6 != 0;
    }
  }

  return v5;
}

- (BOOL)_hasIncompatibleManeuverType:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 > 5) {
    return 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [(GEOCompanionRouteDetails *)self steps];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7)
  {
    BOOL v5 = 0;
    goto LABEL_30;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v19;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      int v12 = [v11 hasDriveStep];
      char v13 = v12;
      if (v12)
      {
        BOOL v3 = [v11 driveStep];
        if ([v3 maneuverType] == 88) {
          goto LABEL_28;
        }
      }
      int v14 = [v11 hasWalkStep];
      if (v14)
      {
        id v4 = [v11 walkStep];
        if ([v4 maneuverType] == 88)
        {

          if (v13) {
LABEL_28:
          }

LABEL_29:
          BOOL v5 = 1;
          goto LABEL_30;
        }
        if ([v11 hasCyclingStep])
        {
LABEL_15:
          uint64_t v16 = [v11 cyclingStep];
          BOOL v15 = [v16 maneuverType] == 88;

          if (!v14)
          {
            if ((v13 & 1) == 0) {
              goto LABEL_17;
            }
            goto LABEL_22;
          }
        }
        else
        {
          BOOL v15 = 0;
        }

        if ((v13 & 1) == 0) {
          goto LABEL_17;
        }
        goto LABEL_22;
      }
      if ([v11 hasCyclingStep]) {
        goto LABEL_15;
      }
      BOOL v15 = 0;
      if ((v13 & 1) == 0)
      {
LABEL_17:
        if (v15) {
          goto LABEL_29;
        }
        continue;
      }
LABEL_22:

      if (v15) {
        goto LABEL_29;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    BOOL v5 = 0;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_30:

  return v5;
}

- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v16 = GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      long long v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138412802;
      uint64_t v45 = v18;
      __int16 v46 = 2048;
      uint64_t v47 = self;
      __int16 v48 = 2048;
      unint64_t v49 = 0;
      _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", buf, 0x20u);
    }
    goto LABEL_16;
  }
  BOOL v5 = [(GEOCompanionRouteDetails *)self hasOriginalSuggestedRoute];
  if (a3 > 2 || !v5)
  {
    int v6 = [(GEOCompanionRouteDetails *)self transportType];
    if ((a3 > 3 || v6 != 3)
      && ![(GEOCompanionRouteDetails *)self _needsWaypointRemoval:a3]
      && ![(GEOCompanionRouteDetails *)self _hasIncompatibleManeuverType:a3])
    {
      uint64_t v36 = GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v37 = (objc_class *)objc_opt_class();
        id v38 = NSStringFromClass(v37);
        *(_DWORD *)buf = 138412802;
        uint64_t v45 = v38;
        __int16 v46 = 2048;
        uint64_t v47 = self;
        __int16 v48 = 2048;
        unint64_t v49 = a3;
        _os_log_impl(&dword_188D96000, v36, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", buf, 0x20u);
      }
LABEL_16:
      uint64_t v11 = self;
      goto LABEL_30;
    }
  }
  uint64_t v7 = GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138412802;
    uint64_t v45 = v9;
    __int16 v46 = 2048;
    uint64_t v47 = self;
    __int16 v48 = 2048;
    unint64_t v49 = a3;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "%@<%p> is not compatible with protocol version %lu", buf, 0x20u);
  }
  uint64_t v10 = (GEOCompanionRouteDetails *)[(GEOCompanionRouteDetails *)self copy];
  uint64_t v11 = v10;
  if (a3 < 4)
  {
    [(GEOCompanionRouteDetails *)v10 clearWaypoints];
    int v12 = GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      long long v19 = (objc_class *)objc_opt_class();
      int v14 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138412546;
      uint64_t v45 = v14;
      __int16 v46 = 2048;
      uint64_t v47 = self;
      BOOL v15 = "%@<%p> | Removed waypoints from route";
      goto LABEL_19;
    }
  }
  else
  {
    [(GEOCompanionRouteDetails *)v10 setOrigin:0];
    [(GEOCompanionRouteDetails *)v11 setDestination:0];
    int v12 = GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      char v13 = (objc_class *)objc_opt_class();
      int v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412546;
      uint64_t v45 = v14;
      __int16 v46 = 2048;
      uint64_t v47 = self;
      BOOL v15 = "%@<%p> | Removed origin/destination from route";
LABEL_19:
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_INFO, v15, buf, 0x16u);
    }
  }

  id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
  long long v21 = [(GEOCompanionRouteDetails *)self steps];
  uint64_t v22 = objc_msgSend(v20, "initWithCapacity:", objc_msgSend(v21, "count"));

  uint64_t v23 = (void *)MEMORY[0x18C1203C0]();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v24 = [(GEOCompanionRouteDetails *)self steps];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = [*(id *)(*((void *)&v39 + 1) + 8 * i) instanceCompatibleWithProtocolVersion:a3];
        if (v29) {
          [v22 addObject:v29];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v26);
  }

  [(GEOCompanionRouteDetails *)v11 setSteps:v22];
  uint64_t v30 = [(GEOCompanionRouteDetails *)self response];
  uint64_t v31 = [v30 instanceCompatibleWithProtocolVersion:a3];

  [(GEOCompanionRouteDetails *)v11 setResponse:v31];
  uint64_t v32 = [v31 decoderData];
  [(GEOCompanionRouteDetails *)v11 setDecoderData:v32];

  id v33 = [(GEOCompanionRouteDetails *)self originalSuggestedRoute];
  uint64_t v34 = [v33 instanceCompatibleWithProtocolVersion:a3];
  [(GEOCompanionRouteDetails *)v11 setOriginalSuggestedRoute:v34];

LABEL_30:

  return v11;
}

- (GEOCompanionRouteDetails)initWithRoute:(id)a3 destinationName:(id)a4 stringFormatter:(id)a5 traffic:(id)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v65.receiver = self;
  v65.super_class = (Class)GEOCompanionRouteDetails;
  int v12 = [(GEOCompanionRouteDetails *)&v65 init];
  if (v12)
  {
    char v13 = [v9 routeInitializerData];
    int v14 = [v13 directionsRequest];
    [(GEOCompanionRouteDetails *)v12 setRequest:v14];

    BOOL v15 = [v9 routeInitializerData];
    uint64_t v16 = [v15 directionsResponse];

    [(GEOCompanionRouteDetails *)v12 setResponse:v16];
    -[GEOCompanionRouteDetails setRouteIndex:](v12, "setRouteIndex:", [v9 indexInResponse]);
    uint64_t v17 = [v9 routeInitializerData];
    long long v18 = [v17 etaTrafficUpdateResponse];
    [(GEOCompanionRouteDetails *)v12 setEtaResponse:v18];

    long long v19 = [v9 styleAttributes];
    [(GEOCompanionRouteDetails *)v12 setStyleAttributes:v19];

    -[GEOCompanionRouteDetails setSource:](v12, "setSource:", [v9 source]);
    id v20 = [v9 storageID];
    long long v21 = objc_msgSend(v20, "_maps_data");
    [(GEOCompanionRouteDetails *)v12 setStorageID:v21];

    uint64_t v22 = [v9 anchorPoints];
    if (v22)
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F28DB0];
      unint64_t v24 = [v9 anchorPoints];
      uint64_t v25 = [v23 archivedDataWithRootObject:v24 requiringSecureCoding:1 error:0];
      [(GEOCompanionRouteDetails *)v12 setAnchorPointsData:v25];
    }
    else
    {
      [(GEOCompanionRouteDetails *)v12 setAnchorPointsData:0];
    }

    if ([v9 transportType] == 1
      || [v9 isWalkingOnlyTransitRoute])
    {
      uint64_t v26 = [v9 originalSuggestedRoute];
      [(GEOCompanionRouteDetails *)v12 setOriginalSuggestedRoute:v26];

      uint64_t v27 = [v16 decoderData];
      [(GEOCompanionRouteDetails *)v12 setDecoderData:v27];

      -[GEOCompanionRouteDetails setShowTransitSchedules:](v12, "setShowTransitSchedules:", [v9 shouldShowSchedule]);
    }
    long long v56 = v16;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v28 = [v9 waypoints];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v62 != v31) {
            objc_enumerationMutation(v28);
          }
          id v33 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          if (([v33 isServerProvidedWaypoint] & 1) == 0)
          {
            uint64_t v34 = [[GEOCompanionWaypoint alloc] initWithComposedWaypoint:v33];
            [(GEOCompanionRouteDetails *)v12 addWaypoints:v34];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v30);
    }

    if ([(GEOCompanionRouteDetails *)v12 waypointsCount] <= 1)
    {
      uint64_t v35 = GEOGetCompanionExtrasLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v68 = v9;
        _os_log_impl(&dword_188D96000, v35, OS_LOG_TYPE_FAULT, "Composed route did not have 2 or more waypoints when expected: %@", buf, 0xCu);
      }
    }
    if (v10) {
      goto LABEL_26;
    }
    uint64_t v36 = [v9 destination];
    uint64_t v37 = [v36 mapItemStorage];
    id v10 = [v37 name];
    id v38 = [v10 length] ? v10 : 0;
    id v39 = v38;

    if (v39) {
LABEL_26:
    }
      [(GEOCompanionRouteDetails *)v12 setDestinationName:v10];
    else {
      id v10 = 0;
    }
    long long v40 = [v9 uniqueRouteID];
    long long v41 = v40;
    if (!v40)
    {
      long long v41 = [MEMORY[0x1E4F29128] UUID];
    }
    long long v42 = objc_msgSend(v41, "_maps_data");
    [(GEOCompanionRouteDetails *)v12 setRouteID:v42];

    if (!v40) {
    uint64_t v43 = [v9 revisionIdentifier];
    }
    if (v43)
    {
      uint64_t v44 = [v9 revisionIdentifier];
      uint64_t v45 = objc_msgSend(v44, "_maps_data");
      [(GEOCompanionRouteDetails *)v12 setRevisionID:v45];
    }
    else
    {
      uint64_t v44 = [(GEOCompanionRouteDetails *)v12 routeID];
      [(GEOCompanionRouteDetails *)v12 setRevisionID:v44];
    }

    __int16 v46 = [v9 serverRouteID];
    [(GEOCompanionRouteDetails *)v12 setOriginalRouteID:v46];

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v47 = [v9 rideSelections];
    uint64_t v48 = [v47 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v49; ++j)
        {
          if (*(void *)v58 != v50) {
            objc_enumerationMutation(v47);
          }
          -[GEOCompanionRouteDetails addSelectedRideIndex:](v12, "addSelectedRideIndex:", [*(id *)(*((void *)&v57 + 1) + 8 * j) unsignedIntValue]);
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v49);
    }

    [(GEOCompanionRouteDetails *)v12 _initForPreHunterWithRoute:v9 stringFormatter:v11];
    long long v52 = [(GEOCompanionRouteDetails *)v12 response];
    long long v53 = [v52 preJupiterCompatibleDirectionsResponseWithRoute:v9];
    [(GEOCompanionRouteDetails *)v12 setResponse:v53];

    long long v54 = v12;
  }

  return v12;
}

- (void)_initForPreHunterWithRoute:(id)a3 stringFormatter:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 name];
  [(GEOCompanionRouteDetails *)self setName:v8];

  [v6 distance];
  [(GEOCompanionRouteDetails *)self setDistance:v9];
  -[GEOCompanionRouteDetails setTransportType:](self, "setTransportType:", [v6 transportType]);
  id v10 = [v6 trafficDescription];
  [(GEOCompanionRouteDetails *)self setTrafficDescription:v10];

  id v11 = [v6 routeDescriptions];
  int v12 = (void *)[v11 mutableCopy];
  [(GEOCompanionRouteDetails *)self setRouteDescriptions:v12];

  if ([v6 hasExpectedTime]) {
    -[GEOCompanionRouteDetails setOriginalDuration:](self, "setOriginalDuration:", [v6 expectedTime]);
  }
  if ([v6 hasHistoricTravelTime]) {
    -[GEOCompanionRouteDetails setHistoricalDuration:](self, "setHistoricalDuration:", [v6 historicTravelTime]);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  char v13 = objc_msgSend(v6, "steps", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = [[GEOCompanionStep alloc] initWithStep:*(void *)(*((void *)&v29 + 1) + 8 * v17) route:v6 stringFormatter:v7];
        [(GEOCompanionRouteDetails *)self addStep:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  unsigned int v19 = [v6 pointCount];
  if (v19)
  {
    uint64_t v20 = 0;
    uint64_t v21 = v19;
    do
    {
      [v6 pointAt:v20];
      double v23 = v22;
      -[GEOCompanionRouteDetails addCoordinates:](self, "addCoordinates:");
      [(GEOCompanionRouteDetails *)self addCoordinates:v23];
      ++v20;
    }
    while (v21 != v20);
  }
  unint64_t v24 = [v6 origin];
  uint64_t v25 = [v24 mapItemStorage];
  [(GEOCompanionRouteDetails *)self setOrigin:v25];

  uint64_t v26 = [v6 destination];
  uint64_t v27 = [v26 mapItemStorage];
  [(GEOCompanionRouteDetails *)self setDestination:v27];

  uint64_t v28 = [v6 traffic];
  if ([v28 trafficColorsCount]) {
    -[GEOCompanionRouteDetails setTrafficColors:count:](self, "setTrafficColors:count:", [v28 trafficColors], objc_msgSend(v28, "trafficColorsCount"));
  }
  if ([v28 trafficColorOffsetsCount]) {
    -[GEOCompanionRouteDetails setTrafficColorOffsets:count:](self, "setTrafficColorOffsets:count:", [v28 trafficColorOffsets], objc_msgSend(v28, "trafficColorOffsetsCount"));
  }
}

- (NSString)shortDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(GEOCompanionRouteDetails *)self destinationName];
  id v6 = [(GEOCompanionRouteDetails *)self name];
  uint64_t v7 = [(GEOCompanionRouteDetails *)self transportType];
  if (v7 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = off_1E53E5998[(int)v7];
  }
  double v9 = [(GEOCompanionRouteDetails *)self routeID];
  id v10 = [v3 stringWithFormat:@"<%@:%p %@ - %@ - %@ - %@>", v4, self, v5, v6, v8, v9];

  return (NSString *)v10;
}

- (BOOL)isSyntheticRoute
{
  return ![(GEOCompanionRouteDetails *)self hasRouteID];
}

- (GEOComposedWaypoint)composedOrigin
{
  v2 = [(GEOCompanionRouteDetails *)self companionOrigin];
  if (v2) {
    BOOL v3 = [[GEOComposedWaypoint alloc] initWithCompanionWaypoint:v2];
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (GEOComposedWaypoint)composedDestination
{
  v2 = [(GEOCompanionRouteDetails *)self companionDestination];
  if (v2) {
    BOOL v3 = [[GEOComposedWaypoint alloc] initWithCompanionWaypoint:v2];
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)composedWaypointAtIndex:(unint64_t)a3
{
  if ([(GEOCompanionRouteDetails *)self waypointsCount] >= 2
    && [(GEOCompanionRouteDetails *)self waypointsCount] > a3)
  {
    BOOL v5 = [GEOComposedWaypoint alloc];
    id v6 = [(GEOCompanionRouteDetails *)self waypoints];
    uint64_t v7 = [v6 objectAtIndexedSubscript:a3];
    uint64_t v8 = [(GEOComposedWaypoint *)v5 initWithCompanionWaypoint:v7];

    goto LABEL_10;
  }
  if (a3 == 1)
  {
    uint64_t v9 = [(GEOCompanionRouteDetails *)self composedDestination];
    goto LABEL_8;
  }
  if (!a3)
  {
    uint64_t v9 = [(GEOCompanionRouteDetails *)self composedOrigin];
LABEL_8:
    uint64_t v8 = (GEOComposedWaypoint *)v9;
    goto LABEL_10;
  }
  uint64_t v8 = 0;
LABEL_10:

  return v8;
}

- (GEOCompanionWaypoint)companionOrigin
{
  BOOL v3 = [(GEOCompanionRouteDetails *)self waypoints];
  unint64_t v4 = [v3 count];

  if (v4 < 2)
  {
    id v6 = [(GEOCompanionRouteDetails *)self origin];

    if (v6)
    {
      id v6 = objc_alloc_init(GEOCompanionWaypoint);
      uint64_t v7 = [(GEOCompanionRouteDetails *)self origin];
      [(GEOCompanionWaypoint *)v6 setMapItem:v7];

      [(GEOCompanionWaypoint *)v6 setIsCurrentLocation:[(GEOCompanionRouteDetails *)self canNavigate]];
    }
  }
  else
  {
    BOOL v5 = [(GEOCompanionRouteDetails *)self waypoints];
    id v6 = [v5 firstObject];
  }

  return v6;
}

- (GEOCompanionWaypoint)companionDestination
{
  BOOL v3 = [(GEOCompanionRouteDetails *)self waypoints];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [(GEOCompanionRouteDetails *)self waypoints];
    id v6 = [v5 lastObject];
  }
  else
  {
    id v6 = [(GEOCompanionRouteDetails *)self destination];

    if (!v6) {
      goto LABEL_6;
    }
    id v6 = objc_alloc_init(GEOCompanionWaypoint);
    BOOL v5 = [(GEOCompanionRouteDetails *)self destination];
    [(GEOCompanionWaypoint *)v6 setMapItem:v5];
  }

LABEL_6:

  return v6;
}

- (id)companionWaypointAtIndex:(unint64_t)a3
{
  if ([(GEOCompanionRouteDetails *)self waypointsCount] >= 2
    && [(GEOCompanionRouteDetails *)self waypointsCount] > a3)
  {
    BOOL v5 = [(GEOCompanionRouteDetails *)self waypoints];
    id v6 = [v5 objectAtIndexedSubscript:a3];

    goto LABEL_10;
  }
  if (a3 == 1)
  {
    uint64_t v7 = [(GEOCompanionRouteDetails *)self companionDestination];
    goto LABEL_8;
  }
  if (!a3)
  {
    uint64_t v7 = [(GEOCompanionRouteDetails *)self companionOrigin];
LABEL_8:
    id v6 = (void *)v7;
    goto LABEL_10;
  }
  id v6 = 0;
LABEL_10:

  return v6;
}

+ (id)syntheticRouteDetailsWithWaypoints:(id)a3 transportType:(int)a4 destinationName:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = objc_alloc_init(GEOCompanionRouteDetails);
  id v10 = (void *)[v7 mutableCopy];
  [(GEOCompanionRouteDetails *)v9 setWaypoints:v10];

  id v11 = [v7 lastObject];
  int v12 = [v11 mapItem];
  char v13 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v12];
  [(GEOCompanionRouteDetails *)v9 setDestination:v13];

  if ((unint64_t)[v7 count] >= 2)
  {
    uint64_t v14 = [v7 firstObject];
    uint64_t v15 = [v14 mapItem];
    uint64_t v16 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v15];
    [(GEOCompanionRouteDetails *)v9 setOrigin:v16];
  }
  [(GEOCompanionRouteDetails *)v9 setTransportType:v6];
  [(GEOCompanionRouteDetails *)v9 setDestinationName:v8];

  return v9;
}

- (unint64_t)stepIndexWithID:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = [(GEOCompanionRouteDetails *)self steps];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = [(GEOCompanionRouteDetails *)self steps];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v17;
        while (2)
        {
          uint64_t v13 = 0;
          uint64_t v14 = v10 + v11;
          do
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v8);
            }
            if ([*(id *)(*((void *)&v16 + 1) + 8 * v13) stepID] >= a3)
            {
              unint64_t v3 = v11 + v13;
              goto LABEL_13;
            }
            ++v13;
          }
          while (v10 != v13);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
          uint64_t v11 = v14;
          if (v10) {
            continue;
          }
          break;
        }
      }

      id v8 = [(GEOCompanionRouteDetails *)self steps];
      unint64_t v3 = [v8 count] - 1;
LABEL_13:
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v3;
}

- (id)stepWithID:(unint64_t)a3
{
  unint64_t v4 = [(GEOCompanionRouteDetails *)self stepIndexWithID:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v5 = 0;
  }
  else
  {
    unint64_t v6 = v4;
    uint64_t v7 = [(GEOCompanionRouteDetails *)self steps];
    BOOL v5 = [v7 objectAtIndexedSubscript:v6];
  }

  return v5;
}

- (NSArray)selectedRideIndices
{
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[GEOCompanionRouteDetails selectedRideIndexsCount](self, "selectedRideIndexsCount"));
  if ([(GEOCompanionRouteDetails *)self selectedRideIndexsCount])
  {
    unint64_t v4 = 0;
    do
    {
      BOOL v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GEOCompanionRouteDetails selectedRideIndexAtIndex:](self, "selectedRideIndexAtIndex:", v4));
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(GEOCompanionRouteDetails *)self selectedRideIndexsCount]);
  }
  unint64_t v6 = (void *)[v3 copy];

  return (NSArray *)v6;
}

@end