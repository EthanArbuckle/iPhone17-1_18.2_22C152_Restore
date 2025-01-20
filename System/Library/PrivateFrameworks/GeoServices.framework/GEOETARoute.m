@interface GEOETARoute
+ (BOOL)isValid:(id)a3;
+ (Class)enrouteNoticeType;
+ (Class)guidanceEventType;
+ (Class)incidentOnRouteInfoType;
+ (Class)incidentsOffReRoutesType;
+ (Class)incidentsOnETARouteType;
+ (Class)incidentsOnReRoutesType;
+ (Class)invalidSectionZilchPointsType;
+ (Class)reroutedRouteType;
+ (Class)routeCameraInputInfoType;
+ (Class)routeLineStyleInfoType;
+ (Class)stepType;
+ (Class)trafficColorInfoType;
+ (Class)zilchPointsType;
- (BOOL)hasDestinationWaypointInfo;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHistoricTravelTime;
- (BOOL)hasNavigabilityInfo;
- (BOOL)hasOriginWaypointInfo;
- (BOOL)hasPathLeg;
- (BOOL)hasRouteID;
- (BOOL)hasRouteNoLongerValid;
- (BOOL)hasStaticTravelTime;
- (BOOL)hasTrafficBannerText;
- (BOOL)hasTravelTimeAggressiveEstimate;
- (BOOL)hasTravelTimeBestEstimate;
- (BOOL)hasTravelTimeConservativeEstimate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)routeNoLongerValid;
- (GEOETARoute)init;
- (GEOETARoute)initWithData:(id)a3;
- (GEOETARoute)initWithDictionary:(id)a3;
- (GEOETARoute)initWithJSON:(id)a3;
- (GEONavigabilityInfo)navigabilityInfo;
- (GEOTrafficBannerText)trafficBannerText;
- (GEOWaypointInfo)destinationWaypointInfo;
- (GEOWaypointInfo)originWaypointInfo;
- (NSData)pathLeg;
- (NSData)routeID;
- (NSMutableArray)enrouteNotices;
- (NSMutableArray)guidanceEvents;
- (NSMutableArray)incidentOnRouteInfos;
- (NSMutableArray)incidentsOffReRoutes;
- (NSMutableArray)incidentsOnETARoutes;
- (NSMutableArray)incidentsOnReRoutes;
- (NSMutableArray)invalidSectionZilchPoints;
- (NSMutableArray)reroutedRoutes;
- (NSMutableArray)routeCameraInputInfos;
- (NSMutableArray)routeLineStyleInfos;
- (NSMutableArray)steps;
- (NSMutableArray)trafficColorInfos;
- (NSMutableArray)zilchPoints;
- (PBUnknownFields)unknownFields;
- (double)expectedTime;
- (double)remainingTimeAlongRoute:(unsigned int)a3 currentStepRemainingDistance:(double)a4;
- (double)remainingTimeFromStepID:(unsigned int)a3 toEndStepID:(unsigned int)a4 currentStepRemainingDistance:(double)a5;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)enrouteNoticeAtIndex:(unint64_t)a3;
- (id)guidanceEventAtIndex:(unint64_t)a3;
- (id)incidentOnRouteInfoAtIndex:(unint64_t)a3;
- (id)incidentsOffReRoutesAtIndex:(unint64_t)a3;
- (id)incidentsOnETARouteAtIndex:(unint64_t)a3;
- (id)incidentsOnReRoutesAtIndex:(unint64_t)a3;
- (id)invalidSectionZilchPointsAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)reroutedRouteAtIndex:(unint64_t)a3;
- (id)routeCameraInputInfoAtIndex:(unint64_t)a3;
- (id)routeLineStyleInfoAtIndex:(unint64_t)a3;
- (id)stepAtIndex:(unint64_t)a3;
- (id)trafficColorInfoAtIndex:(unint64_t)a3;
- (id)zilchPointsAtIndex:(unint64_t)a3;
- (unint64_t)enrouteNoticesCount;
- (unint64_t)guidanceEventsCount;
- (unint64_t)hash;
- (unint64_t)incidentEndOffsetsInETARoutesCount;
- (unint64_t)incidentIndexsCount;
- (unint64_t)incidentOnRouteInfosCount;
- (unint64_t)incidentsOffReRoutesCount;
- (unint64_t)incidentsOnETARoutesCount;
- (unint64_t)incidentsOnReRoutesCount;
- (unint64_t)invalidSectionZilchPointsCount;
- (unint64_t)reroutedRoutesCount;
- (unint64_t)routeCameraInputInfosCount;
- (unint64_t)routeLineStyleInfosCount;
- (unint64_t)stepIndexOfStepWithID:(unsigned int)a3;
- (unint64_t)stepsCount;
- (unint64_t)trafficColorInfosCount;
- (unint64_t)trafficColorOffsetsCount;
- (unint64_t)trafficColorsCount;
- (unint64_t)zilchPointsCount;
- (unsigned)historicTravelTime;
- (unsigned)incidentEndOffsetsInETARouteAtIndex:(unint64_t)a3;
- (unsigned)incidentEndOffsetsInETARoutes;
- (unsigned)incidentIndexAtIndex:(unint64_t)a3;
- (unsigned)incidentIndexs;
- (unsigned)staticTravelTime;
- (unsigned)trafficColorAtIndex:(unint64_t)a3;
- (unsigned)trafficColorOffsetAtIndex:(unint64_t)a3;
- (unsigned)trafficColorOffsets;
- (unsigned)trafficColors;
- (unsigned)travelTimeAggressiveEstimate;
- (unsigned)travelTimeBestEstimate;
- (unsigned)travelTimeConservativeEstimate;
- (void)_addNoFlagsEnrouteNotice:(uint64_t)a1;
- (void)_addNoFlagsGuidanceEvent:(uint64_t)a1;
- (void)_addNoFlagsIncidentOnRouteInfo:(uint64_t)a1;
- (void)_addNoFlagsIncidentsOffReRoutes:(uint64_t)a1;
- (void)_addNoFlagsIncidentsOnETARoute:(uint64_t)a1;
- (void)_addNoFlagsIncidentsOnReRoutes:(uint64_t)a1;
- (void)_addNoFlagsInvalidSectionZilchPoints:(uint64_t)a1;
- (void)_addNoFlagsReroutedRoute:(uint64_t)a1;
- (void)_addNoFlagsRouteCameraInputInfo:(uint64_t)a1;
- (void)_addNoFlagsRouteLineStyleInfo:(uint64_t)a1;
- (void)_addNoFlagsStep:(uint64_t)a1;
- (void)_addNoFlagsTrafficColorInfo:(uint64_t)a1;
- (void)_addNoFlagsZilchPoints:(uint64_t)a1;
- (void)_readDestinationWaypointInfo;
- (void)_readEnrouteNotices;
- (void)_readGuidanceEvents;
- (void)_readIncidentEndOffsetsInETARoutes;
- (void)_readIncidentIndexs;
- (void)_readIncidentOnRouteInfos;
- (void)_readIncidentsOffReRoutes;
- (void)_readIncidentsOnETARoutes;
- (void)_readIncidentsOnReRoutes;
- (void)_readInvalidSectionZilchPoints;
- (void)_readNavigabilityInfo;
- (void)_readOriginWaypointInfo;
- (void)_readPathLeg;
- (void)_readReroutedRoutes;
- (void)_readRouteCameraInputInfos;
- (void)_readRouteID;
- (void)_readRouteLineStyleInfos;
- (void)_readSteps;
- (void)_readTrafficBannerText;
- (void)_readTrafficColorInfos;
- (void)_readTrafficColorOffsets;
- (void)_readTrafficColors;
- (void)_readZilchPoints;
- (void)addEnrouteNotice:(id)a3;
- (void)addGuidanceEvent:(id)a3;
- (void)addIncidentEndOffsetsInETARoute:(unsigned int)a3;
- (void)addIncidentIndex:(unsigned int)a3;
- (void)addIncidentOnRouteInfo:(id)a3;
- (void)addIncidentsOffReRoutes:(id)a3;
- (void)addIncidentsOnETARoute:(id)a3;
- (void)addIncidentsOnReRoutes:(id)a3;
- (void)addInvalidSectionZilchPoints:(id)a3;
- (void)addReroutedRoute:(id)a3;
- (void)addRouteCameraInputInfo:(id)a3;
- (void)addRouteLineStyleInfo:(id)a3;
- (void)addStep:(id)a3;
- (void)addTrafficColor:(unsigned int)a3;
- (void)addTrafficColorInfo:(id)a3;
- (void)addTrafficColorOffset:(unsigned int)a3;
- (void)addZilchPoints:(id)a3;
- (void)clearEnrouteNotices;
- (void)clearGuidanceEvents;
- (void)clearIncidentEndOffsetsInETARoutes;
- (void)clearIncidentIndexs;
- (void)clearIncidentOnRouteInfos;
- (void)clearIncidentsOffReRoutes;
- (void)clearIncidentsOnETARoutes;
- (void)clearIncidentsOnReRoutes;
- (void)clearInvalidSectionZilchPoints;
- (void)clearReroutedRoutes;
- (void)clearRouteCameraInputInfos;
- (void)clearRouteLineStyleInfos;
- (void)clearSteps;
- (void)clearTrafficColorInfos;
- (void)clearTrafficColorOffsets;
- (void)clearTrafficColors;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearZilchPoints;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDestinationWaypointInfo:(id)a3;
- (void)setEnrouteNotices:(id)a3;
- (void)setGuidanceEvents:(id)a3;
- (void)setHasHistoricTravelTime:(BOOL)a3;
- (void)setHasRouteNoLongerValid:(BOOL)a3;
- (void)setHasStaticTravelTime:(BOOL)a3;
- (void)setHasTravelTimeAggressiveEstimate:(BOOL)a3;
- (void)setHasTravelTimeBestEstimate:(BOOL)a3;
- (void)setHasTravelTimeConservativeEstimate:(BOOL)a3;
- (void)setHistoricTravelTime:(unsigned int)a3;
- (void)setIncidentEndOffsetsInETARoutes:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setIncidentIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setIncidentOnRouteInfos:(id)a3;
- (void)setIncidentsOffReRoutes:(id)a3;
- (void)setIncidentsOnETARoutes:(id)a3;
- (void)setIncidentsOnReRoutes:(id)a3;
- (void)setInvalidSectionZilchPoints:(id)a3;
- (void)setNavigabilityInfo:(id)a3;
- (void)setOriginWaypointInfo:(id)a3;
- (void)setPathLeg:(id)a3;
- (void)setReroutedRoutes:(id)a3;
- (void)setRouteCameraInputInfos:(id)a3;
- (void)setRouteID:(id)a3;
- (void)setRouteLineStyleInfos:(id)a3;
- (void)setRouteNoLongerValid:(BOOL)a3;
- (void)setStaticTravelTime:(unsigned int)a3;
- (void)setSteps:(id)a3;
- (void)setTrafficBannerText:(id)a3;
- (void)setTrafficColorInfos:(id)a3;
- (void)setTrafficColorOffsets:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTrafficColors:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTravelTimeAggressiveEstimate:(unsigned int)a3;
- (void)setTravelTimeBestEstimate:(unsigned int)a3;
- (void)setTravelTimeConservativeEstimate:(unsigned int)a3;
- (void)setZilchPoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOETARoute

- (double)expectedTime
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(GEOETARoute *)self steps];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    double v5 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        double v5 = v5 + (double)[*(id *)(*((void *)&v8 + 1) + 8 * i) expectedTime];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)remainingTimeFromStepID:(unsigned int)a3 toEndStepID:(unsigned int)a4 currentStepRemainingDistance:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  unint64_t v9 = -[GEOETARoute stepIndexOfStepWithID:](self, "stepIndexOfStepWithID:");
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = v9;
  }
  unint64_t v11 = [(GEOETARoute *)self stepIndexOfStepWithID:v6];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = [(GEOETARoute *)self steps];
    unint64_t v11 = [v12 count] - 1;
  }
  for (double i = 0.0; v10 <= v11; ++v10)
  {
    v14 = [(GEOETARoute *)self stepAtIndex:v10];
    double v15 = (double)[v14 expectedTime];
    if ([v14 stepID] == a3)
    {
      if ([v14 hasTimeCheckpoints])
      {
        v16 = [v14 timeCheckpoints];
      }
      else
      {
        v16 = 0;
      }
      double v15 = GEORemainingTimeForRemainingDistanceAlongStep(v16, a5, v15, (float)[v14 distanceCm] * 0.01);
    }
    double i = i + v15;
  }
  return i;
}

- (double)remainingTimeAlongRoute:(unsigned int)a3 currentStepRemainingDistance:(double)a4
{
  unint64_t v7 = -[GEOETARoute stepIndexOfStepWithID:](self, "stepIndexOfStepWithID:");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = v7;
  }
  for (double i = 0.0; v8 < [(GEOETARoute *)self stepsCount]; ++v8)
  {
    unint64_t v10 = [(GEOETARoute *)self stepAtIndex:v8];
    double v11 = (double)[v10 expectedTime];
    if ([v10 stepID] == a3)
    {
      if ([v10 hasTimeCheckpoints])
      {
        v12 = [v10 timeCheckpoints];
      }
      else
      {
        v12 = 0;
      }
      double v11 = GEORemainingTimeForRemainingDistanceAlongStep(v12, a4, v11, (float)[v10 distanceCm] * 0.01);
    }
    double i = i + v11;
  }
  return i;
}

- (unint64_t)stepIndexOfStepWithID:(unsigned int)a3
{
  uint64_t v4 = [(GEOETARoute *)self steps];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__GEOETARoute_GEORouteExtras__stepIndexOfStepWithID___block_invoke;
  v7[3] = &__block_descriptor_36_e27_B32__0__GEOETAStep_8Q16_B24l;
  unsigned int v8 = a3;
  unint64_t v5 = [v4 indexOfObjectPassingTest:v7];

  return v5;
}

BOOL __53__GEOETARoute_GEORouteExtras__stepIndexOfStepWithID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v5 = *(_DWORD *)(a1 + 32);
  int v6 = [a2 stepID];
  if (v5 == v6) {
    *a4 = 1;
  }
  return v5 == v6;
}

- (GEOETARoute)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOETARoute;
  v2 = [(GEOETARoute *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (GEOETARoute)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOETARoute;
  uint64_t v3 = [(GEOETARoute *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    int v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOETARoute;
  [(GEOETARoute *)&v3 dealloc];
}

- (void)_readRouteID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 310) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteID_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasRouteID
{
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEOETARoute _readRouteID]((uint64_t)self);
  routeID = self->_routeID;

  return routeID;
}

- (void)setRouteID:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40800000u;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (void)_readSteps
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 311) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSteps_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)steps
{
  -[GEOETARoute _readSteps]((uint64_t)self);
  steps = self->_steps;

  return steps;
}

- (void)setSteps:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  steps = self->_steps;
  self->_steps = v4;
}

- (void)clearSteps
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  steps = self->_steps;

  [(NSMutableArray *)steps removeAllObjects];
}

- (void)addStep:(id)a3
{
  id v4 = a3;
  -[GEOETARoute _readSteps]((uint64_t)self);
  -[GEOETARoute _addNoFlagsStep:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsStep:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 240);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 240);
      *(void *)(a1 + 240) = v5;

      id v4 = *(void **)(a1 + 240);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)stepsCount
{
  -[GEOETARoute _readSteps]((uint64_t)self);
  steps = self->_steps;

  return [(NSMutableArray *)steps count];
}

- (id)stepAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readSteps]((uint64_t)self);
  steps = self->_steps;

  return (id)[(NSMutableArray *)steps objectAtIndex:a3];
}

+ (Class)stepType
{
  return (Class)objc_opt_class();
}

- (void)_readZilchPoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 311) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readZilchPoints_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)zilchPoints
{
  -[GEOETARoute _readZilchPoints]((uint64_t)self);
  zilchPoints = self->_zilchPoints;

  return zilchPoints;
}

- (void)setZilchPoints:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  zilchPoints = self->_zilchPoints;
  self->_zilchPoints = v4;
}

- (void)clearZilchPoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  zilchPoints = self->_zilchPoints;

  [(NSMutableArray *)zilchPoints removeAllObjects];
}

- (void)addZilchPoints:(id)a3
{
  id v4 = a3;
  -[GEOETARoute _readZilchPoints]((uint64_t)self);
  -[GEOETARoute _addNoFlagsZilchPoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsZilchPoints:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 264);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 264);
      *(void *)(a1 + 264) = v5;

      id v4 = *(void **)(a1 + 264);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)zilchPointsCount
{
  -[GEOETARoute _readZilchPoints]((uint64_t)self);
  zilchPoints = self->_zilchPoints;

  return [(NSMutableArray *)zilchPoints count];
}

- (id)zilchPointsAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readZilchPoints]((uint64_t)self);
  zilchPoints = self->_zilchPoints;

  return (id)[(NSMutableArray *)zilchPoints objectAtIndex:a3];
}

+ (Class)zilchPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readPathLeg
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 310) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPathLeg_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasPathLeg
{
  return self->_pathLeg != 0;
}

- (NSData)pathLeg
{
  -[GEOETARoute _readPathLeg]((uint64_t)self);
  pathLeg = self->_pathLeg;

  return pathLeg;
}

- (void)setPathLeg:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40200000u;
  objc_storeStrong((id *)&self->_pathLeg, a3);
}

- (BOOL)routeNoLongerValid
{
  return self->_routeNoLongerValid;
}

- (void)setRouteNoLongerValid:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x40000020u;
  self->_routeNoLongerValid = a3;
}

- (void)setHasRouteNoLongerValid:(BOOL)a3
{
  if (a3) {
    int v3 = 1073741856;
  }
  else {
    int v3 = 0x40000000;
  }
  self->_flags = ($C98F32EDFC9B1C2D78E34865DB4AC25D)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasRouteNoLongerValid
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readReroutedRoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 310) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReroutedRoutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)reroutedRoutes
{
  -[GEOETARoute _readReroutedRoutes]((uint64_t)self);
  reroutedRoutes = self->_reroutedRoutes;

  return reroutedRoutes;
}

- (void)setReroutedRoutes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  reroutedRoutes = self->_reroutedRoutes;
  self->_reroutedRoutes = v4;
}

- (void)clearReroutedRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  reroutedRoutes = self->_reroutedRoutes;

  [(NSMutableArray *)reroutedRoutes removeAllObjects];
}

- (void)addReroutedRoute:(id)a3
{
  id v4 = a3;
  -[GEOETARoute _readReroutedRoutes]((uint64_t)self);
  -[GEOETARoute _addNoFlagsReroutedRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsReroutedRoute:(uint64_t)a1
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

- (unint64_t)reroutedRoutesCount
{
  -[GEOETARoute _readReroutedRoutes]((uint64_t)self);
  reroutedRoutes = self->_reroutedRoutes;

  return [(NSMutableArray *)reroutedRoutes count];
}

- (id)reroutedRouteAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readReroutedRoutes]((uint64_t)self);
  reroutedRoutes = self->_reroutedRoutes;

  return (id)[(NSMutableArray *)reroutedRoutes objectAtIndex:a3];
}

+ (Class)reroutedRouteType
{
  return (Class)objc_opt_class();
}

- (void)_readInvalidSectionZilchPoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 310) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInvalidSectionZilchPoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)invalidSectionZilchPoints
{
  -[GEOETARoute _readInvalidSectionZilchPoints]((uint64_t)self);
  invalidSectionZilchPoints = self->_invalidSectionZilchPoints;

  return invalidSectionZilchPoints;
}

- (void)setInvalidSectionZilchPoints:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  invalidSectionZilchPoints = self->_invalidSectionZilchPoints;
  self->_invalidSectionZilchPoints = v4;
}

- (void)clearInvalidSectionZilchPoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  invalidSectionZilchPoints = self->_invalidSectionZilchPoints;

  [(NSMutableArray *)invalidSectionZilchPoints removeAllObjects];
}

- (void)addInvalidSectionZilchPoints:(id)a3
{
  id v4 = a3;
  -[GEOETARoute _readInvalidSectionZilchPoints]((uint64_t)self);
  -[GEOETARoute _addNoFlagsInvalidSectionZilchPoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsInvalidSectionZilchPoints:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 176);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = v5;

      id v4 = *(void **)(a1 + 176);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)invalidSectionZilchPointsCount
{
  -[GEOETARoute _readInvalidSectionZilchPoints]((uint64_t)self);
  invalidSectionZilchPoints = self->_invalidSectionZilchPoints;

  return [(NSMutableArray *)invalidSectionZilchPoints count];
}

- (id)invalidSectionZilchPointsAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readInvalidSectionZilchPoints]((uint64_t)self);
  invalidSectionZilchPoints = self->_invalidSectionZilchPoints;

  return (id)[(NSMutableArray *)invalidSectionZilchPoints objectAtIndex:a3];
}

+ (Class)invalidSectionZilchPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficColors
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 309) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficColors_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
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
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;

  PBRepeatedUInt32Clear();
}

- (void)addTrafficColor:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (unsigned)trafficColorAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readTrafficColors]((uint64_t)self);
  p_trafficColors = &self->_trafficColors;
  unint64_t count = self->_trafficColors.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    unint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_trafficColors->list[a3];
}

- (void)setTrafficColors:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;

  MEMORY[0x1F4147400](&self->_trafficColors, a3, a4);
}

- (void)_readTrafficColorOffsets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 309) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficColorOffsets_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
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
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;

  PBRepeatedUInt32Clear();
}

- (void)addTrafficColorOffset:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (unsigned)trafficColorOffsetAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readTrafficColorOffsets]((uint64_t)self);
  p_trafficColorOffsets = &self->_trafficColorOffsets;
  unint64_t count = self->_trafficColorOffsets.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    unint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_trafficColorOffsets->list[a3];
}

- (void)setTrafficColorOffsets:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;

  MEMORY[0x1F4147400](&self->_trafficColorOffsets, a3, a4);
}

- (void)_readRouteLineStyleInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 311) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteLineStyleInfos_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)routeLineStyleInfos
{
  -[GEOETARoute _readRouteLineStyleInfos]((uint64_t)self);
  routeLineStyleInfos = self->_routeLineStyleInfos;

  return routeLineStyleInfos;
}

- (void)setRouteLineStyleInfos:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  routeLineStyleInfos = self->_routeLineStyleInfos;
  self->_routeLineStyleInfos = v4;
}

- (void)clearRouteLineStyleInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  routeLineStyleInfos = self->_routeLineStyleInfos;

  [(NSMutableArray *)routeLineStyleInfos removeAllObjects];
}

- (void)addRouteLineStyleInfo:(id)a3
{
  id v4 = a3;
  -[GEOETARoute _readRouteLineStyleInfos]((uint64_t)self);
  -[GEOETARoute _addNoFlagsRouteLineStyleInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsRouteLineStyleInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 232);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 232);
      *(void *)(a1 + 232) = v5;

      id v4 = *(void **)(a1 + 232);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)routeLineStyleInfosCount
{
  -[GEOETARoute _readRouteLineStyleInfos]((uint64_t)self);
  routeLineStyleInfos = self->_routeLineStyleInfos;

  return [(NSMutableArray *)routeLineStyleInfos count];
}

- (id)routeLineStyleInfoAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readRouteLineStyleInfos]((uint64_t)self);
  routeLineStyleInfos = self->_routeLineStyleInfos;

  return (id)[(NSMutableArray *)routeLineStyleInfos objectAtIndex:a3];
}

+ (Class)routeLineStyleInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readRouteCameraInputInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 311) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteCameraInputInfos_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)routeCameraInputInfos
{
  -[GEOETARoute _readRouteCameraInputInfos]((uint64_t)self);
  routeCameraInputInfos = self->_routeCameraInputInfos;

  return routeCameraInputInfos;
}

- (void)setRouteCameraInputInfos:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  routeCameraInputInfos = self->_routeCameraInputInfos;
  self->_routeCameraInputInfos = v4;
}

- (void)clearRouteCameraInputInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  routeCameraInputInfos = self->_routeCameraInputInfos;

  [(NSMutableArray *)routeCameraInputInfos removeAllObjects];
}

- (void)addRouteCameraInputInfo:(id)a3
{
  id v4 = a3;
  -[GEOETARoute _readRouteCameraInputInfos]((uint64_t)self);
  -[GEOETARoute _addNoFlagsRouteCameraInputInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsRouteCameraInputInfo:(uint64_t)a1
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

- (unint64_t)routeCameraInputInfosCount
{
  -[GEOETARoute _readRouteCameraInputInfos]((uint64_t)self);
  routeCameraInputInfos = self->_routeCameraInputInfos;

  return [(NSMutableArray *)routeCameraInputInfos count];
}

- (id)routeCameraInputInfoAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readRouteCameraInputInfos]((uint64_t)self);
  routeCameraInputInfos = self->_routeCameraInputInfos;

  return (id)[(NSMutableArray *)routeCameraInputInfos objectAtIndex:a3];
}

+ (Class)routeCameraInputInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidentsOnETARoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 310) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentsOnETARoutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)incidentsOnETARoutes
{
  -[GEOETARoute _readIncidentsOnETARoutes]((uint64_t)self);
  incidentsOnETARoutes = self->_incidentsOnETARoutes;

  return incidentsOnETARoutes;
}

- (void)setIncidentsOnETARoutes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  incidentsOnETARoutes = self->_incidentsOnETARoutes;
  self->_incidentsOnETARoutes = v4;
}

- (void)clearIncidentsOnETARoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  incidentsOnETARoutes = self->_incidentsOnETARoutes;

  [(NSMutableArray *)incidentsOnETARoutes removeAllObjects];
}

- (void)addIncidentsOnETARoute:(id)a3
{
  id v4 = a3;
  -[GEOETARoute _readIncidentsOnETARoutes]((uint64_t)self);
  -[GEOETARoute _addNoFlagsIncidentsOnETARoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsIncidentsOnETARoute:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 160);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = v5;

      id v4 = *(void **)(a1 + 160);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)incidentsOnETARoutesCount
{
  -[GEOETARoute _readIncidentsOnETARoutes]((uint64_t)self);
  incidentsOnETARoutes = self->_incidentsOnETARoutes;

  return [(NSMutableArray *)incidentsOnETARoutes count];
}

- (id)incidentsOnETARouteAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readIncidentsOnETARoutes]((uint64_t)self);
  incidentsOnETARoutes = self->_incidentsOnETARoutes;

  return (id)[(NSMutableArray *)incidentsOnETARoutes objectAtIndex:a3];
}

+ (Class)incidentsOnETARouteType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidentsOnReRoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 310) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentsOnReRoutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)incidentsOnReRoutes
{
  -[GEOETARoute _readIncidentsOnReRoutes]((uint64_t)self);
  incidentsOnReRoutes = self->_incidentsOnReRoutes;

  return incidentsOnReRoutes;
}

- (void)setIncidentsOnReRoutes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  incidentsOnReRoutes = self->_incidentsOnReRoutes;
  self->_incidentsOnReRoutes = v4;
}

- (void)clearIncidentsOnReRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  incidentsOnReRoutes = self->_incidentsOnReRoutes;

  [(NSMutableArray *)incidentsOnReRoutes removeAllObjects];
}

- (void)addIncidentsOnReRoutes:(id)a3
{
  id v4 = a3;
  -[GEOETARoute _readIncidentsOnReRoutes]((uint64_t)self);
  -[GEOETARoute _addNoFlagsIncidentsOnReRoutes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsIncidentsOnReRoutes:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 168);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = v5;

      id v4 = *(void **)(a1 + 168);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)incidentsOnReRoutesCount
{
  -[GEOETARoute _readIncidentsOnReRoutes]((uint64_t)self);
  incidentsOnReRoutes = self->_incidentsOnReRoutes;

  return [(NSMutableArray *)incidentsOnReRoutes count];
}

- (id)incidentsOnReRoutesAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readIncidentsOnReRoutes]((uint64_t)self);
  incidentsOnReRoutes = self->_incidentsOnReRoutes;

  return (id)[(NSMutableArray *)incidentsOnReRoutes objectAtIndex:a3];
}

+ (Class)incidentsOnReRoutesType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidentsOffReRoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 309) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentsOffReRoutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)incidentsOffReRoutes
{
  -[GEOETARoute _readIncidentsOffReRoutes]((uint64_t)self);
  incidentsOffReRoutes = self->_incidentsOffReRoutes;

  return incidentsOffReRoutes;
}

- (void)setIncidentsOffReRoutes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  incidentsOffReRoutes = self->_incidentsOffReRoutes;
  self->_incidentsOffReRoutes = v4;
}

- (void)clearIncidentsOffReRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  incidentsOffReRoutes = self->_incidentsOffReRoutes;

  [(NSMutableArray *)incidentsOffReRoutes removeAllObjects];
}

- (void)addIncidentsOffReRoutes:(id)a3
{
  id v4 = a3;
  -[GEOETARoute _readIncidentsOffReRoutes]((uint64_t)self);
  -[GEOETARoute _addNoFlagsIncidentsOffReRoutes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsIncidentsOffReRoutes:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 152);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 152);
      *(void *)(a1 + 152) = v5;

      id v4 = *(void **)(a1 + 152);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)incidentsOffReRoutesCount
{
  -[GEOETARoute _readIncidentsOffReRoutes]((uint64_t)self);
  incidentsOffReRoutes = self->_incidentsOffReRoutes;

  return [(NSMutableArray *)incidentsOffReRoutes count];
}

- (id)incidentsOffReRoutesAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readIncidentsOffReRoutes]((uint64_t)self);
  incidentsOffReRoutes = self->_incidentsOffReRoutes;

  return (id)[(NSMutableArray *)incidentsOffReRoutes objectAtIndex:a3];
}

+ (Class)incidentsOffReRoutesType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidentIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 309) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentIndexs_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (unint64_t)incidentIndexsCount
{
  return self->_incidentIndexs.count;
}

- (unsigned)incidentIndexs
{
  return self->_incidentIndexs.list;
}

- (void)clearIncidentIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;

  PBRepeatedUInt32Clear();
}

- (void)addIncidentIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (unsigned)incidentIndexAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readIncidentIndexs]((uint64_t)self);
  p_incidentIndexs = &self->_incidentIndexs;
  unint64_t count = self->_incidentIndexs.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    unint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_incidentIndexs->list[a3];
}

- (void)setIncidentIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;

  MEMORY[0x1F4147400](&self->_incidentIndexs, a3, a4);
}

- (void)_readIncidentEndOffsetsInETARoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 308) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentEndOffsetsInETARoutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (unint64_t)incidentEndOffsetsInETARoutesCount
{
  return self->_incidentEndOffsetsInETARoutes.count;
}

- (unsigned)incidentEndOffsetsInETARoutes
{
  return self->_incidentEndOffsetsInETARoutes.list;
}

- (void)clearIncidentEndOffsetsInETARoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;

  PBRepeatedUInt32Clear();
}

- (void)addIncidentEndOffsetsInETARoute:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (unsigned)incidentEndOffsetsInETARouteAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readIncidentEndOffsetsInETARoutes]((uint64_t)self);
  p_incidentEndOffsetsInETARoutes = &self->_incidentEndOffsetsInETARoutes;
  unint64_t count = self->_incidentEndOffsetsInETARoutes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    unint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_incidentEndOffsetsInETARoutes->list[a3];
}

- (void)setIncidentEndOffsetsInETARoutes:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;

  MEMORY[0x1F4147400](&self->_incidentEndOffsetsInETARoutes, a3, a4);
}

- (void)_readTrafficBannerText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 311) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficBannerText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasTrafficBannerText
{
  return self->_trafficBannerText != 0;
}

- (GEOTrafficBannerText)trafficBannerText
{
  -[GEOETARoute _readTrafficBannerText]((uint64_t)self);
  trafficBannerText = self->_trafficBannerText;

  return trafficBannerText;
}

- (void)setTrafficBannerText:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x48000000u;
  objc_storeStrong((id *)&self->_trafficBannerText, a3);
}

- (unsigned)historicTravelTime
{
  return self->_historicTravelTime;
}

- (void)setHistoricTravelTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x40000001u;
  self->_historicTravelTime = a3;
}

- (void)setHasHistoricTravelTime:(BOOL)a3
{
  self->_flags = ($C98F32EDFC9B1C2D78E34865DB4AC25D)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x40000000);
}

- (BOOL)hasHistoricTravelTime
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unsigned)travelTimeAggressiveEstimate
{
  return self->_travelTimeAggressiveEstimate;
}

- (void)setTravelTimeAggressiveEstimate:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x40000004u;
  self->_travelTimeAggressiveEstimate = a3;
}

- (void)setHasTravelTimeAggressiveEstimate:(BOOL)a3
{
  if (a3) {
    int v3 = 1073741828;
  }
  else {
    int v3 = 0x40000000;
  }
  self->_flags = ($C98F32EDFC9B1C2D78E34865DB4AC25D)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasTravelTimeAggressiveEstimate
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)travelTimeBestEstimate
{
  return self->_travelTimeBestEstimate;
}

- (void)setTravelTimeBestEstimate:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x40000008u;
  self->_travelTimeBestEstimate = a3;
}

- (void)setHasTravelTimeBestEstimate:(BOOL)a3
{
  if (a3) {
    int v3 = 1073741832;
  }
  else {
    int v3 = 0x40000000;
  }
  self->_flags = ($C98F32EDFC9B1C2D78E34865DB4AC25D)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTravelTimeBestEstimate
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)travelTimeConservativeEstimate
{
  return self->_travelTimeConservativeEstimate;
}

- (void)setTravelTimeConservativeEstimate:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x40000010u;
  self->_travelTimeConservativeEstimate = a3;
}

- (void)setHasTravelTimeConservativeEstimate:(BOOL)a3
{
  if (a3) {
    int v3 = 1073741840;
  }
  else {
    int v3 = 0x40000000;
  }
  self->_flags = ($C98F32EDFC9B1C2D78E34865DB4AC25D)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasTravelTimeConservativeEstimate
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (unsigned)staticTravelTime
{
  return self->_staticTravelTime;
}

- (void)setStaticTravelTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x40000002u;
  self->_staticTravelTime = a3;
}

- (void)setHasStaticTravelTime:(BOOL)a3
{
  if (a3) {
    int v3 = 1073741826;
  }
  else {
    int v3 = 0x40000000;
  }
  self->_flags = ($C98F32EDFC9B1C2D78E34865DB4AC25D)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasStaticTravelTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readEnrouteNotices
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 309) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEnrouteNotices_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)enrouteNotices
{
  -[GEOETARoute _readEnrouteNotices]((uint64_t)self);
  enrouteNotices = self->_enrouteNotices;

  return enrouteNotices;
}

- (void)setEnrouteNotices:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  enrouteNotices = self->_enrouteNotices;
  self->_enrouteNotices = v4;
}

- (void)clearEnrouteNotices
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  enrouteNotices = self->_enrouteNotices;

  [(NSMutableArray *)enrouteNotices removeAllObjects];
}

- (void)addEnrouteNotice:(id)a3
{
  id v4 = a3;
  -[GEOETARoute _readEnrouteNotices]((uint64_t)self);
  -[GEOETARoute _addNoFlagsEnrouteNotice:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsEnrouteNotice:(uint64_t)a1
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

- (unint64_t)enrouteNoticesCount
{
  -[GEOETARoute _readEnrouteNotices]((uint64_t)self);
  enrouteNotices = self->_enrouteNotices;

  return [(NSMutableArray *)enrouteNotices count];
}

- (id)enrouteNoticeAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readEnrouteNotices]((uint64_t)self);
  enrouteNotices = self->_enrouteNotices;

  return (id)[(NSMutableArray *)enrouteNotices objectAtIndex:a3];
}

+ (Class)enrouteNoticeType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficColorInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 311) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficColorInfos_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)trafficColorInfos
{
  -[GEOETARoute _readTrafficColorInfos]((uint64_t)self);
  trafficColorInfos = self->_trafficColorInfos;

  return trafficColorInfos;
}

- (void)setTrafficColorInfos:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  trafficColorInfos = self->_trafficColorInfos;
  self->_trafficColorInfos = v4;
}

- (void)clearTrafficColorInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  trafficColorInfos = self->_trafficColorInfos;

  [(NSMutableArray *)trafficColorInfos removeAllObjects];
}

- (void)addTrafficColorInfo:(id)a3
{
  id v4 = a3;
  -[GEOETARoute _readTrafficColorInfos]((uint64_t)self);
  -[GEOETARoute _addNoFlagsTrafficColorInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsTrafficColorInfo:(uint64_t)a1
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

- (unint64_t)trafficColorInfosCount
{
  -[GEOETARoute _readTrafficColorInfos]((uint64_t)self);
  trafficColorInfos = self->_trafficColorInfos;

  return [(NSMutableArray *)trafficColorInfos count];
}

- (id)trafficColorInfoAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readTrafficColorInfos]((uint64_t)self);
  trafficColorInfos = self->_trafficColorInfos;

  return (id)[(NSMutableArray *)trafficColorInfos objectAtIndex:a3];
}

+ (Class)trafficColorInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidentOnRouteInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 309) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentOnRouteInfos_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)incidentOnRouteInfos
{
  -[GEOETARoute _readIncidentOnRouteInfos]((uint64_t)self);
  incidentOnRouteInfos = self->_incidentOnRouteInfos;

  return incidentOnRouteInfos;
}

- (void)setIncidentOnRouteInfos:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  incidentOnRouteInfos = self->_incidentOnRouteInfos;
  self->_incidentOnRouteInfos = v4;
}

- (void)clearIncidentOnRouteInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  incidentOnRouteInfos = self->_incidentOnRouteInfos;

  [(NSMutableArray *)incidentOnRouteInfos removeAllObjects];
}

- (void)addIncidentOnRouteInfo:(id)a3
{
  id v4 = a3;
  -[GEOETARoute _readIncidentOnRouteInfos]((uint64_t)self);
  -[GEOETARoute _addNoFlagsIncidentOnRouteInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsIncidentOnRouteInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 144);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = v5;

      id v4 = *(void **)(a1 + 144);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)incidentOnRouteInfosCount
{
  -[GEOETARoute _readIncidentOnRouteInfos]((uint64_t)self);
  incidentOnRouteInfos = self->_incidentOnRouteInfos;

  return [(NSMutableArray *)incidentOnRouteInfos count];
}

- (id)incidentOnRouteInfoAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readIncidentOnRouteInfos]((uint64_t)self);
  incidentOnRouteInfos = self->_incidentOnRouteInfos;

  return (id)[(NSMutableArray *)incidentOnRouteInfos objectAtIndex:a3];
}

+ (Class)incidentOnRouteInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginWaypointInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 310) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginWaypointInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasOriginWaypointInfo
{
  return self->_originWaypointInfo != 0;
}

- (GEOWaypointInfo)originWaypointInfo
{
  -[GEOETARoute _readOriginWaypointInfo]((uint64_t)self);
  originWaypointInfo = self->_originWaypointInfo;

  return originWaypointInfo;
}

- (void)setOriginWaypointInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40100000u;
  objc_storeStrong((id *)&self->_originWaypointInfo, a3);
}

- (void)_readDestinationWaypointInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 309) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestinationWaypointInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDestinationWaypointInfo
{
  return self->_destinationWaypointInfo != 0;
}

- (GEOWaypointInfo)destinationWaypointInfo
{
  -[GEOETARoute _readDestinationWaypointInfo]((uint64_t)self);
  destinationWaypointInfo = self->_destinationWaypointInfo;

  return destinationWaypointInfo;
}

- (void)setDestinationWaypointInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40000800u;
  objc_storeStrong((id *)&self->_destinationWaypointInfo, a3);
}

- (void)_readNavigabilityInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 310) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNavigabilityInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasNavigabilityInfo
{
  return self->_navigabilityInfo != 0;
}

- (GEONavigabilityInfo)navigabilityInfo
{
  -[GEOETARoute _readNavigabilityInfo]((uint64_t)self);
  navigabilityInfo = self->_navigabilityInfo;

  return navigabilityInfo;
}

- (void)setNavigabilityInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40080000u;
  objc_storeStrong((id *)&self->_navigabilityInfo, a3);
}

- (void)_readGuidanceEvents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(unsigned char *)(a1 + 309) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuidanceEvents_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)guidanceEvents
{
  -[GEOETARoute _readGuidanceEvents]((uint64_t)self);
  guidanceEvents = self->_guidanceEvents;

  return guidanceEvents;
}

- (void)setGuidanceEvents:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  guidanceEvents = self->_guidanceEvents;
  self->_guidanceEvents = v4;
}

- (void)clearGuidanceEvents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  guidanceEvents = self->_guidanceEvents;

  [(NSMutableArray *)guidanceEvents removeAllObjects];
}

- (void)addGuidanceEvent:(id)a3
{
  id v4 = a3;
  -[GEOETARoute _readGuidanceEvents]((uint64_t)self);
  -[GEOETARoute _addNoFlagsGuidanceEvent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsGuidanceEvent:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 136);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = v5;

      id v4 = *(void **)(a1 + 136);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)guidanceEventsCount
{
  -[GEOETARoute _readGuidanceEvents]((uint64_t)self);
  guidanceEvents = self->_guidanceEvents;

  return [(NSMutableArray *)guidanceEvents count];
}

- (id)guidanceEventAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readGuidanceEvents]((uint64_t)self);
  guidanceEvents = self->_guidanceEvents;

  return (id)[(NSMutableArray *)guidanceEvents objectAtIndex:a3];
}

+ (Class)guidanceEventType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOETARoute;
  id v4 = [(GEOETARoute *)&v8 description];
  id v5 = [(GEOETARoute *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETARoute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v234 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v165 = 0;
    goto LABEL_245;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 routeID];
  objc_super v6 = v5;
  if (v5)
  {
    if (a2)
    {
      id v7 = [v5 base64EncodedStringWithOptions:0];
      [v4 setObject:v7 forKey:@"routeID"];
    }
    else
    {
      [v4 setObject:v5 forKey:@"routeID"];
    }
  }

  if ([*(id *)(a1 + 240) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 240), "count"));
    long long v217 = 0u;
    long long v218 = 0u;
    long long v219 = 0u;
    long long v220 = 0u;
    id v9 = *(id *)(a1 + 240);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v217 objects:v233 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v218;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v218 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v217 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          id v15 = [v14 dictionaryRepresentation];
          }

          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v217 objects:v233 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"step"];
  }
  if (*(void *)(a1 + 264))
  {
    if (a2)
    {
      v16 = (void *)MEMORY[0x1E4F1CA48];
      v17 = [(id)a1 zilchPoints];
      v18 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

      long long v215 = 0u;
      long long v216 = 0u;
      long long v213 = 0u;
      long long v214 = 0u;
      v19 = [(id)a1 zilchPoints];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v213 objects:v232 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v214;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v214 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = [*(id *)(*((void *)&v213 + 1) + 8 * j) base64EncodedStringWithOptions:0];
            [v18 addObject:v24];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v213 objects:v232 count:16];
        }
        while (v21);
      }
    }
    else
    {
      v18 = [(id)a1 zilchPoints];
    }
    [v4 setObject:v18 forKey:@"zilchPoints"];
  }
  v25 = [(id)a1 pathLeg];
  v26 = v25;
  if (v25)
  {
    if (a2)
    {
      v27 = [v25 base64EncodedStringWithOptions:0];
      [v4 setObject:v27 forKey:@"pathLeg"];
    }
    else
    {
      [v4 setObject:v25 forKey:@"path_leg"];
    }
  }

  if ((*(unsigned char *)(a1 + 308) & 0x20) != 0)
  {
    v28 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 304)];
    [v4 setObject:v28 forKey:@"routeNoLongerValid"];
  }
  if ([*(id *)(a1 + 208) count])
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 208), "count"));
    long long v209 = 0u;
    long long v210 = 0u;
    long long v211 = 0u;
    long long v212 = 0u;
    id v30 = *(id *)(a1 + 208);
    uint64_t v31 = [v30 countByEnumeratingWithState:&v209 objects:v231 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v210;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v210 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v209 + 1) + 8 * k);
          if (a2) {
            [v35 jsonRepresentation];
          }
          else {
          id v36 = [v35 dictionaryRepresentation];
          }

          [v29 addObject:v36];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v209 objects:v231 count:16];
      }
      while (v32);
    }

    [v4 setObject:v29 forKey:@"reroutedRoute"];
  }
  if (*(void *)(a1 + 176))
  {
    if (a2)
    {
      v37 = (void *)MEMORY[0x1E4F1CA48];
      v38 = [(id)a1 invalidSectionZilchPoints];
      v39 = objc_msgSend(v37, "arrayWithCapacity:", objc_msgSend(v38, "count"));

      long long v207 = 0u;
      long long v208 = 0u;
      long long v205 = 0u;
      long long v206 = 0u;
      v40 = [(id)a1 invalidSectionZilchPoints];
      uint64_t v41 = [v40 countByEnumeratingWithState:&v205 objects:v230 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v206;
        do
        {
          for (uint64_t m = 0; m != v42; ++m)
          {
            if (*(void *)v206 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = [*(id *)(*((void *)&v205 + 1) + 8 * m) base64EncodedStringWithOptions:0];
            [v39 addObject:v45];
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v205 objects:v230 count:16];
        }
        while (v42);
      }
    }
    else
    {
      v39 = [(id)a1 invalidSectionZilchPoints];
    }
    [v4 setObject:v39 forKey:@"invalidSectionZilchPoints"];
  }
  if (*(void *)(a1 + 104))
  {
    v46 = PBRepeatedUInt32NSArray();
    [v4 setObject:v46 forKey:@"trafficColor"];
  }
  if (*(void *)(a1 + 80))
  {
    v47 = PBRepeatedUInt32NSArray();
    [v4 setObject:v47 forKey:@"trafficColorOffset"];
  }
  if ([*(id *)(a1 + 232) count])
  {
    v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 232), "count"));
    long long v201 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    long long v204 = 0u;
    id v49 = *(id *)(a1 + 232);
    uint64_t v50 = [v49 countByEnumeratingWithState:&v201 objects:v229 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v202;
      do
      {
        for (uint64_t n = 0; n != v51; ++n)
        {
          if (*(void *)v202 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = *(void **)(*((void *)&v201 + 1) + 8 * n);
          if (a2) {
            [v54 jsonRepresentation];
          }
          else {
          id v55 = [v54 dictionaryRepresentation];
          }

          [v48 addObject:v55];
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v201 objects:v229 count:16];
      }
      while (v51);
    }

    if (a2) {
      v56 = @"routeLineStyleInfo";
    }
    else {
      v56 = @"route_line_style_info";
    }
    [v4 setObject:v48 forKey:v56];
  }
  if ([*(id *)(a1 + 224) count])
  {
    v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 224), "count"));
    long long v197 = 0u;
    long long v198 = 0u;
    long long v199 = 0u;
    long long v200 = 0u;
    id v58 = *(id *)(a1 + 224);
    uint64_t v59 = [v58 countByEnumeratingWithState:&v197 objects:v228 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v198;
      do
      {
        for (iuint64_t i = 0; ii != v60; ++ii)
        {
          if (*(void *)v198 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = *(void **)(*((void *)&v197 + 1) + 8 * ii);
          if (a2) {
            [v63 jsonRepresentation];
          }
          else {
          id v64 = [v63 dictionaryRepresentation];
          }

          [v57 addObject:v64];
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&v197 objects:v228 count:16];
      }
      while (v60);
    }

    if (a2) {
      v65 = @"routeCameraInputInfo";
    }
    else {
      v65 = @"route_camera_input_info";
    }
    [v4 setObject:v57 forKey:v65];
  }
  if ([*(id *)(a1 + 160) count])
  {
    v66 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
    long long v193 = 0u;
    long long v194 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    id v67 = *(id *)(a1 + 160);
    uint64_t v68 = [v67 countByEnumeratingWithState:&v193 objects:v227 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v194;
      do
      {
        for (juint64_t j = 0; jj != v69; ++jj)
        {
          if (*(void *)v194 != v70) {
            objc_enumerationMutation(v67);
          }
          v72 = *(void **)(*((void *)&v193 + 1) + 8 * jj);
          if (a2) {
            [v72 jsonRepresentation];
          }
          else {
          id v73 = [v72 dictionaryRepresentation];
          }

          [v66 addObject:v73];
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v193 objects:v227 count:16];
      }
      while (v69);
    }

    [v4 setObject:v66 forKey:@"incidentsOnETARoute"];
  }
  if ([*(id *)(a1 + 168) count])
  {
    v74 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 168), "count"));
    long long v189 = 0u;
    long long v190 = 0u;
    long long v191 = 0u;
    long long v192 = 0u;
    id v75 = *(id *)(a1 + 168);
    uint64_t v76 = [v75 countByEnumeratingWithState:&v189 objects:v226 count:16];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = *(void *)v190;
      do
      {
        for (kuint64_t k = 0; kk != v77; ++kk)
        {
          if (*(void *)v190 != v78) {
            objc_enumerationMutation(v75);
          }
          v80 = *(void **)(*((void *)&v189 + 1) + 8 * kk);
          if (a2) {
            [v80 jsonRepresentation];
          }
          else {
          id v81 = [v80 dictionaryRepresentation];
          }

          [v74 addObject:v81];
        }
        uint64_t v77 = [v75 countByEnumeratingWithState:&v189 objects:v226 count:16];
      }
      while (v77);
    }

    [v4 setObject:v74 forKey:@"incidentsOnReRoutes"];
  }
  if ([*(id *)(a1 + 152) count])
  {
    v82 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 152), "count"));
    long long v185 = 0u;
    long long v186 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    id v83 = *(id *)(a1 + 152);
    uint64_t v84 = [v83 countByEnumeratingWithState:&v185 objects:v225 count:16];
    if (v84)
    {
      uint64_t v85 = v84;
      uint64_t v86 = *(void *)v186;
      do
      {
        for (muint64_t m = 0; mm != v85; ++mm)
        {
          if (*(void *)v186 != v86) {
            objc_enumerationMutation(v83);
          }
          v88 = *(void **)(*((void *)&v185 + 1) + 8 * mm);
          if (a2) {
            [v88 jsonRepresentation];
          }
          else {
          id v89 = [v88 dictionaryRepresentation];
          }

          [v82 addObject:v89];
        }
        uint64_t v85 = [v83 countByEnumeratingWithState:&v185 objects:v225 count:16];
      }
      while (v85);
    }

    [v4 setObject:v82 forKey:@"incidentsOffReRoutes"];
  }
  if (*(void *)(a1 + 56))
  {
    v90 = PBRepeatedUInt32NSArray();
    if (a2) {
      v91 = @"incidentIndex";
    }
    else {
      v91 = @"incident_index";
    }
    [v4 setObject:v90 forKey:v91];
  }
  if (*(void *)(a1 + 32))
  {
    v92 = PBRepeatedUInt32NSArray();
    [v4 setObject:v92 forKey:@"incidentEndOffsetsInETARoute"];
  }
  v93 = [(id)a1 trafficBannerText];
  v94 = v93;
  if (v93)
  {
    if (a2)
    {
      v95 = [v93 jsonRepresentation];
      v96 = @"trafficBannerText";
    }
    else
    {
      v95 = [v93 dictionaryRepresentation];
      v96 = @"traffic_banner_text";
    }
    id v97 = v95;

    [v4 setObject:v97 forKey:v96];
  }

  int v98 = *(_DWORD *)(a1 + 308);
  if (v98)
  {
    v132 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 284)];
    [v4 setObject:v132 forKey:@"historicTravelTime"];

    int v98 = *(_DWORD *)(a1 + 308);
    if ((v98 & 4) == 0)
    {
LABEL_144:
      if ((v98 & 8) == 0) {
        goto LABEL_145;
      }
      goto LABEL_204;
    }
  }
  else if ((v98 & 4) == 0)
  {
    goto LABEL_144;
  }
  v133 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 292)];
  if (a2) {
    v134 = @"travelTimeAggressiveEstimate";
  }
  else {
    v134 = @"travel_time_aggressive_estimate";
  }
  [v4 setObject:v133 forKey:v134];

  int v98 = *(_DWORD *)(a1 + 308);
  if ((v98 & 8) == 0)
  {
LABEL_145:
    if ((v98 & 0x10) == 0) {
      goto LABEL_146;
    }
LABEL_208:
    v137 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 300)];
    if (a2) {
      v138 = @"travelTimeConservativeEstimate";
    }
    else {
      v138 = @"travel_time_conservative_estimate";
    }
    [v4 setObject:v137 forKey:v138];

    if ((*(_DWORD *)(a1 + 308) & 2) == 0) {
      goto LABEL_151;
    }
    goto LABEL_147;
  }
LABEL_204:
  v135 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 296)];
  if (a2) {
    v136 = @"travelTimeBestEstimate";
  }
  else {
    v136 = @"travel_time_best_estimate";
  }
  [v4 setObject:v135 forKey:v136];

  int v98 = *(_DWORD *)(a1 + 308);
  if ((v98 & 0x10) != 0) {
    goto LABEL_208;
  }
LABEL_146:
  if ((v98 & 2) != 0)
  {
LABEL_147:
    v99 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 288)];
    if (a2) {
      v100 = @"staticTravelTime";
    }
    else {
      v100 = @"static_travel_time";
    }
    [v4 setObject:v99 forKey:v100];
  }
LABEL_151:
  if ([*(id *)(a1 + 128) count])
  {
    v101 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    long long v181 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    id v102 = *(id *)(a1 + 128);
    uint64_t v103 = [v102 countByEnumeratingWithState:&v181 objects:v224 count:16];
    if (v103)
    {
      uint64_t v104 = v103;
      uint64_t v105 = *(void *)v182;
      do
      {
        for (nuint64_t n = 0; nn != v104; ++nn)
        {
          if (*(void *)v182 != v105) {
            objc_enumerationMutation(v102);
          }
          v107 = *(void **)(*((void *)&v181 + 1) + 8 * nn);
          if (a2) {
            [v107 jsonRepresentation];
          }
          else {
          id v108 = [v107 dictionaryRepresentation];
          }

          [v101 addObject:v108];
        }
        uint64_t v104 = [v102 countByEnumeratingWithState:&v181 objects:v224 count:16];
      }
      while (v104);
    }

    if (a2) {
      v109 = @"enrouteNotice";
    }
    else {
      v109 = @"enroute_notice";
    }
    [v4 setObject:v101 forKey:v109];
  }
  if ([*(id *)(a1 + 256) count])
  {
    v110 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 256), "count"));
    long long v177 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    id v111 = *(id *)(a1 + 256);
    uint64_t v112 = [v111 countByEnumeratingWithState:&v177 objects:v223 count:16];
    if (v112)
    {
      uint64_t v113 = v112;
      uint64_t v114 = *(void *)v178;
      do
      {
        for (uint64_t i1 = 0; i1 != v113; ++i1)
        {
          if (*(void *)v178 != v114) {
            objc_enumerationMutation(v111);
          }
          v116 = *(void **)(*((void *)&v177 + 1) + 8 * i1);
          if (a2) {
            [v116 jsonRepresentation];
          }
          else {
          id v117 = [v116 dictionaryRepresentation];
          }

          [v110 addObject:v117];
        }
        uint64_t v113 = [v111 countByEnumeratingWithState:&v177 objects:v223 count:16];
      }
      while (v113);
    }

    if (a2) {
      v118 = @"trafficColorInfo";
    }
    else {
      v118 = @"traffic_color_info";
    }
    [v4 setObject:v110 forKey:v118];
  }
  if ([*(id *)(a1 + 144) count])
  {
    v119 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 144), "count"));
    long long v173 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    id v120 = *(id *)(a1 + 144);
    uint64_t v121 = [v120 countByEnumeratingWithState:&v173 objects:v222 count:16];
    if (v121)
    {
      uint64_t v122 = v121;
      uint64_t v123 = *(void *)v174;
      do
      {
        for (uint64_t i2 = 0; i2 != v122; ++i2)
        {
          if (*(void *)v174 != v123) {
            objc_enumerationMutation(v120);
          }
          v125 = *(void **)(*((void *)&v173 + 1) + 8 * i2);
          if (a2) {
            [v125 jsonRepresentation];
          }
          else {
          id v126 = [v125 dictionaryRepresentation];
          }

          [v119 addObject:v126];
        }
        uint64_t v122 = [v120 countByEnumeratingWithState:&v173 objects:v222 count:16];
      }
      while (v122);
    }

    if (a2) {
      v127 = @"incidentOnRouteInfo";
    }
    else {
      v127 = @"incident_on_route_info";
    }
    [v4 setObject:v119 forKey:v127];
  }
  v128 = [(id)a1 originWaypointInfo];
  v129 = v128;
  if (v128)
  {
    if (a2)
    {
      v130 = [v128 jsonRepresentation];
      v131 = @"originWaypointInfo";
    }
    else
    {
      v130 = [v128 dictionaryRepresentation];
      v131 = @"origin_waypoint_info";
    }
    id v139 = v130;

    [v4 setObject:v139 forKey:v131];
  }

  v140 = [(id)a1 destinationWaypointInfo];
  v141 = v140;
  if (v140)
  {
    if (a2)
    {
      v142 = [v140 jsonRepresentation];
      v143 = @"destinationWaypointInfo";
    }
    else
    {
      v142 = [v140 dictionaryRepresentation];
      v143 = @"destination_waypoint_info";
    }
    id v144 = v142;

    [v4 setObject:v144 forKey:v143];
  }

  v145 = [(id)a1 navigabilityInfo];
  v146 = v145;
  if (v145)
  {
    if (a2)
    {
      v147 = [v145 jsonRepresentation];
      v148 = @"navigabilityInfo";
    }
    else
    {
      v147 = [v145 dictionaryRepresentation];
      v148 = @"navigability_info";
    }
    id v149 = v147;

    [v4 setObject:v149 forKey:v148];
  }

  if ([*(id *)(a1 + 136) count])
  {
    v150 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    long long v169 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    id v151 = *(id *)(a1 + 136);
    uint64_t v152 = [v151 countByEnumeratingWithState:&v169 objects:v221 count:16];
    if (v152)
    {
      uint64_t v153 = v152;
      uint64_t v154 = *(void *)v170;
      do
      {
        for (uint64_t i3 = 0; i3 != v153; ++i3)
        {
          if (*(void *)v170 != v154) {
            objc_enumerationMutation(v151);
          }
          v156 = *(void **)(*((void *)&v169 + 1) + 8 * i3);
          if (a2) {
            [v156 jsonRepresentation];
          }
          else {
          id v157 = [v156 dictionaryRepresentation];
          }

          [v150 addObject:v157];
        }
        uint64_t v153 = [v151 countByEnumeratingWithState:&v169 objects:v221 count:16];
      }
      while (v153);
    }

    if (a2) {
      v158 = @"guidanceEvent";
    }
    else {
      v158 = @"guidance_event";
    }
    [v4 setObject:v150 forKey:v158];
  }
  v159 = *(void **)(a1 + 16);
  if (v159)
  {
    v160 = [v159 dictionaryRepresentation];
    v161 = v160;
    if (a2)
    {
      v162 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v160, "count"));
      v167[0] = MEMORY[0x1E4F143A8];
      v167[1] = 3221225472;
      v167[2] = __41__GEOETARoute__dictionaryRepresentation___block_invoke;
      v167[3] = &unk_1E53D8860;
      id v163 = v162;
      id v168 = v163;
      [v161 enumerateKeysAndObjectsUsingBlock:v167];
      id v164 = v163;

      v161 = v164;
    }
    [v4 setObject:v161 forKey:@"Unknown Fields"];
  }
  id v165 = v4;

LABEL_245:

  return v165;
}

- (id)jsonRepresentation
{
  return -[GEOETARoute _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOETARoute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOETARoute)initWithDictionary:(id)a3
{
  return (GEOETARoute *)-[GEOETARoute _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v293 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1 && (id v6 = (id)[a1 init], v6, v6))
  {
    id v7 = [v5 objectForKeyedSubscript:@"routeID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
      [v6 setRouteID:v8];
    }
    id v9 = [v5 objectForKeyedSubscript:@"step"];
    objc_opt_class();
    id v207 = v5;
    if (objc_opt_isKindOfClass())
    {
      long long v275 = 0u;
      long long v274 = 0u;
      long long v273 = 0u;
      long long v272 = 0u;
      long long v205 = v9;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v272 objects:v292 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v273;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v273 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v272 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [GEOETAStep alloc];
              if (a3) {
                uint64_t v17 = [(GEOETAStep *)v16 initWithJSON:v15];
              }
              else {
                uint64_t v17 = [(GEOETAStep *)v16 initWithDictionary:v15];
              }
              v18 = (void *)v17;
              objc_msgSend(v6, "addStep:", v17, v205);
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v272 objects:v292 count:16];
        }
        while (v12);
      }

      id v9 = v205;
      id v5 = v207;
    }

    v19 = [v5 objectForKeyedSubscript:@"zilchPoints"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v270 = 0u;
      long long v271 = 0u;
      long long v268 = 0u;
      long long v269 = 0u;
      long long v205 = v19;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v268 objects:v291 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v269;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v269 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v268 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v26 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v25 options:0];
              [v6 addZilchPoints:v26];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v268 objects:v291 count:16];
        }
        while (v22);
      }

      v19 = v205;
      id v5 = v207;
    }

    if (a3) {
      v27 = @"pathLeg";
    }
    else {
      v27 = @"path_leg";
    }
    v28 = objc_msgSend(v5, "objectForKeyedSubscript:", v27, v205);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v28 options:0];
      [v6 setPathLeg:v29];
    }
    id v30 = [v5 objectForKeyedSubscript:@"routeNoLongerValid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setRouteNoLongerValid:", objc_msgSend(v30, "BOOLValue"));
    }

    uint64_t v31 = [v5 objectForKeyedSubscript:@"reroutedRoute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v266 = 0u;
      long long v267 = 0u;
      long long v264 = 0u;
      long long v265 = 0u;
      long long v206 = v31;
      id v32 = v31;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v264 objects:v290 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v265;
        do
        {
          for (uint64_t k = 0; k != v34; ++k)
          {
            if (*(void *)v265 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v264 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v38 = [GEORoute alloc];
              if (a3) {
                uint64_t v39 = [(GEORoute *)v38 initWithJSON:v37];
              }
              else {
                uint64_t v39 = [(GEORoute *)v38 initWithDictionary:v37];
              }
              v40 = (void *)v39;
              objc_msgSend(v6, "addReroutedRoute:", v39, v206);
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v264 objects:v290 count:16];
        }
        while (v34);
      }

      uint64_t v31 = v206;
      id v5 = v207;
    }

    uint64_t v41 = [v5 objectForKeyedSubscript:@"invalidSectionZilchPoints"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v262 = 0u;
      long long v263 = 0u;
      long long v260 = 0u;
      long long v261 = 0u;
      long long v206 = v41;
      id v42 = v41;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v260 objects:v289 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v261;
        do
        {
          for (uint64_t m = 0; m != v44; ++m)
          {
            if (*(void *)v261 != v45) {
              objc_enumerationMutation(v42);
            }
            uint64_t v47 = *(void *)(*((void *)&v260 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v48 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v47 options:0];
              [v6 addInvalidSectionZilchPoints:v48];
            }
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v260 objects:v289 count:16];
        }
        while (v44);
      }

      id v5 = v207;
    }

    id v49 = [v5 objectForKeyedSubscript:@"trafficColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v258 = 0u;
      long long v259 = 0u;
      long long v256 = 0u;
      long long v257 = 0u;
      id v50 = v49;
      uint64_t v51 = [v50 countByEnumeratingWithState:&v256 objects:v288 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v257;
        do
        {
          for (uint64_t n = 0; n != v52; ++n)
          {
            if (*(void *)v257 != v53) {
              objc_enumerationMutation(v50);
            }
            id v55 = *(void **)(*((void *)&v256 + 1) + 8 * n);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(v6, "addTrafficColor:", objc_msgSend(v55, "unsignedIntValue"));
            }
          }
          uint64_t v52 = [v50 countByEnumeratingWithState:&v256 objects:v288 count:16];
        }
        while (v52);
      }
    }
    v56 = [v5 objectForKeyedSubscript:@"trafficColorOffset"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v254 = 0u;
      long long v255 = 0u;
      long long v252 = 0u;
      long long v253 = 0u;
      id v57 = v56;
      uint64_t v58 = [v57 countByEnumeratingWithState:&v252 objects:v287 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v253;
        do
        {
          for (iuint64_t i = 0; ii != v59; ++ii)
          {
            if (*(void *)v253 != v60) {
              objc_enumerationMutation(v57);
            }
            v62 = *(void **)(*((void *)&v252 + 1) + 8 * ii);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(v6, "addTrafficColorOffset:", objc_msgSend(v62, "unsignedIntValue"));
            }
          }
          uint64_t v59 = [v57 countByEnumeratingWithState:&v252 objects:v287 count:16];
        }
        while (v59);
      }
    }
    if (a3) {
      v63 = @"routeLineStyleInfo";
    }
    else {
      v63 = @"route_line_style_info";
    }
    id v64 = objc_msgSend(v5, "objectForKeyedSubscript:", v63, v206);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v250 = 0u;
      long long v251 = 0u;
      long long v248 = 0u;
      long long v249 = 0u;
      id v65 = v64;
      uint64_t v66 = [v65 countByEnumeratingWithState:&v248 objects:v286 count:16];
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = *(void *)v249;
        do
        {
          for (juint64_t j = 0; jj != v67; ++jj)
          {
            if (*(void *)v249 != v68) {
              objc_enumerationMutation(v65);
            }
            uint64_t v70 = *(void *)(*((void *)&v248 + 1) + 8 * jj);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v71 = [GEORouteLineStyleInfo alloc];
              if (a3) {
                uint64_t v72 = [(GEORouteLineStyleInfo *)v71 initWithJSON:v70];
              }
              else {
                uint64_t v72 = [(GEORouteLineStyleInfo *)v71 initWithDictionary:v70];
              }
              id v73 = (void *)v72;
              [v6 addRouteLineStyleInfo:v72];
            }
          }
          uint64_t v67 = [v65 countByEnumeratingWithState:&v248 objects:v286 count:16];
        }
        while (v67);
      }

      id v5 = v207;
    }

    if (a3) {
      v74 = @"routeCameraInputInfo";
    }
    else {
      v74 = @"route_camera_input_info";
    }
    id v75 = [v5 objectForKeyedSubscript:v74];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v246 = 0u;
      long long v247 = 0u;
      long long v244 = 0u;
      long long v245 = 0u;
      id v76 = v75;
      uint64_t v77 = [v76 countByEnumeratingWithState:&v244 objects:v285 count:16];
      if (v77)
      {
        uint64_t v78 = v77;
        uint64_t v79 = *(void *)v245;
        do
        {
          for (kuint64_t k = 0; kk != v78; ++kk)
          {
            if (*(void *)v245 != v79) {
              objc_enumerationMutation(v76);
            }
            uint64_t v81 = *(void *)(*((void *)&v244 + 1) + 8 * kk);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v82 = [GEORouteLineStyleInfo alloc];
              if (a3) {
                uint64_t v83 = [(GEORouteLineStyleInfo *)v82 initWithJSON:v81];
              }
              else {
                uint64_t v83 = [(GEORouteLineStyleInfo *)v82 initWithDictionary:v81];
              }
              uint64_t v84 = (void *)v83;
              [v6 addRouteCameraInputInfo:v83];
            }
          }
          uint64_t v78 = [v76 countByEnumeratingWithState:&v244 objects:v285 count:16];
        }
        while (v78);
      }

      id v5 = v207;
    }

    uint64_t v85 = [v5 objectForKeyedSubscript:@"incidentsOnETARoute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v242 = 0u;
      long long v243 = 0u;
      long long v240 = 0u;
      long long v241 = 0u;
      id v86 = v85;
      uint64_t v87 = [v86 countByEnumeratingWithState:&v240 objects:v284 count:16];
      if (v87)
      {
        uint64_t v88 = v87;
        uint64_t v89 = *(void *)v241;
        do
        {
          for (muint64_t m = 0; mm != v88; ++mm)
          {
            if (*(void *)v241 != v89) {
              objc_enumerationMutation(v86);
            }
            uint64_t v91 = *(void *)(*((void *)&v240 + 1) + 8 * mm);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v92 = [GEORouteIncident alloc];
              if (a3) {
                uint64_t v93 = [(GEORouteIncident *)v92 initWithJSON:v91];
              }
              else {
                uint64_t v93 = [(GEORouteIncident *)v92 initWithDictionary:v91];
              }
              v94 = (void *)v93;
              [v6 addIncidentsOnETARoute:v93];
            }
          }
          uint64_t v88 = [v86 countByEnumeratingWithState:&v240 objects:v284 count:16];
        }
        while (v88);
      }

      id v5 = v207;
    }

    v95 = [v5 objectForKeyedSubscript:@"incidentsOnReRoutes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v238 = 0u;
      long long v239 = 0u;
      long long v236 = 0u;
      long long v237 = 0u;
      id v96 = v95;
      uint64_t v97 = [v96 countByEnumeratingWithState:&v236 objects:v283 count:16];
      if (v97)
      {
        uint64_t v98 = v97;
        uint64_t v99 = *(void *)v237;
        do
        {
          for (nuint64_t n = 0; nn != v98; ++nn)
          {
            if (*(void *)v237 != v99) {
              objc_enumerationMutation(v96);
            }
            uint64_t v101 = *(void *)(*((void *)&v236 + 1) + 8 * nn);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v102 = [GEORouteIncident alloc];
              if (a3) {
                uint64_t v103 = [(GEORouteIncident *)v102 initWithJSON:v101];
              }
              else {
                uint64_t v103 = [(GEORouteIncident *)v102 initWithDictionary:v101];
              }
              uint64_t v104 = (void *)v103;
              [v6 addIncidentsOnReRoutes:v103];
            }
          }
          uint64_t v98 = [v96 countByEnumeratingWithState:&v236 objects:v283 count:16];
        }
        while (v98);
      }

      id v5 = v207;
    }

    uint64_t v105 = [v5 objectForKeyedSubscript:@"incidentsOffReRoutes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v234 = 0u;
      long long v235 = 0u;
      long long v232 = 0u;
      long long v233 = 0u;
      id v106 = v105;
      uint64_t v107 = [v106 countByEnumeratingWithState:&v232 objects:v282 count:16];
      if (v107)
      {
        uint64_t v108 = v107;
        uint64_t v109 = *(void *)v233;
        do
        {
          for (uint64_t i1 = 0; i1 != v108; ++i1)
          {
            if (*(void *)v233 != v109) {
              objc_enumerationMutation(v106);
            }
            uint64_t v111 = *(void *)(*((void *)&v232 + 1) + 8 * i1);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v112 = [GEORouteIncident alloc];
              if (a3) {
                uint64_t v113 = [(GEORouteIncident *)v112 initWithJSON:v111];
              }
              else {
                uint64_t v113 = [(GEORouteIncident *)v112 initWithDictionary:v111];
              }
              uint64_t v114 = (void *)v113;
              [v6 addIncidentsOffReRoutes:v113];
            }
          }
          uint64_t v108 = [v106 countByEnumeratingWithState:&v232 objects:v282 count:16];
        }
        while (v108);
      }

      id v5 = v207;
    }

    if (a3) {
      v115 = @"incidentIndex";
    }
    else {
      v115 = @"incident_index";
    }
    v116 = [v5 objectForKeyedSubscript:v115];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v230 = 0u;
      long long v231 = 0u;
      long long v228 = 0u;
      long long v229 = 0u;
      id v117 = v116;
      uint64_t v118 = [v117 countByEnumeratingWithState:&v228 objects:v281 count:16];
      if (v118)
      {
        uint64_t v119 = v118;
        uint64_t v120 = *(void *)v229;
        do
        {
          for (uint64_t i2 = 0; i2 != v119; ++i2)
          {
            if (*(void *)v229 != v120) {
              objc_enumerationMutation(v117);
            }
            uint64_t v122 = *(void **)(*((void *)&v228 + 1) + 8 * i2);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(v6, "addIncidentIndex:", objc_msgSend(v122, "unsignedIntValue"));
            }
          }
          uint64_t v119 = [v117 countByEnumeratingWithState:&v228 objects:v281 count:16];
        }
        while (v119);
      }
    }
    uint64_t v123 = [v5 objectForKeyedSubscript:@"incidentEndOffsetsInETARoute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v226 = 0u;
      long long v227 = 0u;
      long long v224 = 0u;
      long long v225 = 0u;
      id v124 = v123;
      uint64_t v125 = [v124 countByEnumeratingWithState:&v224 objects:v280 count:16];
      if (v125)
      {
        uint64_t v126 = v125;
        uint64_t v127 = *(void *)v225;
        do
        {
          for (uint64_t i3 = 0; i3 != v126; ++i3)
          {
            if (*(void *)v225 != v127) {
              objc_enumerationMutation(v124);
            }
            v129 = *(void **)(*((void *)&v224 + 1) + 8 * i3);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(v6, "addIncidentEndOffsetsInETARoute:", objc_msgSend(v129, "unsignedIntValue"));
            }
          }
          uint64_t v126 = [v124 countByEnumeratingWithState:&v224 objects:v280 count:16];
        }
        while (v126);
      }
    }
    if (a3) {
      v130 = @"trafficBannerText";
    }
    else {
      v130 = @"traffic_banner_text";
    }
    v131 = [v5 objectForKeyedSubscript:v130];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v132 = [GEOTrafficBannerText alloc];
      if (a3) {
        uint64_t v133 = [(GEOTrafficBannerText *)v132 initWithJSON:v131];
      }
      else {
        uint64_t v133 = [(GEOTrafficBannerText *)v132 initWithDictionary:v131];
      }
      v135 = (void *)v133;
      [v6 setTrafficBannerText:v133];
    }
    v136 = [v5 objectForKeyedSubscript:@"historicTravelTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setHistoricTravelTime:", objc_msgSend(v136, "unsignedIntValue"));
    }

    if (a3) {
      v137 = @"travelTimeAggressiveEstimate";
    }
    else {
      v137 = @"travel_time_aggressive_estimate";
    }
    v138 = [v5 objectForKeyedSubscript:v137];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setTravelTimeAggressiveEstimate:", objc_msgSend(v138, "unsignedIntValue"));
    }

    if (a3) {
      id v139 = @"travelTimeBestEstimate";
    }
    else {
      id v139 = @"travel_time_best_estimate";
    }
    v140 = [v5 objectForKeyedSubscript:v139];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setTravelTimeBestEstimate:", objc_msgSend(v140, "unsignedIntValue"));
    }

    if (a3) {
      v141 = @"travelTimeConservativeEstimate";
    }
    else {
      v141 = @"travel_time_conservative_estimate";
    }
    v142 = [v5 objectForKeyedSubscript:v141];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setTravelTimeConservativeEstimate:", objc_msgSend(v142, "unsignedIntValue"));
    }

    if (a3) {
      v143 = @"staticTravelTime";
    }
    else {
      v143 = @"static_travel_time";
    }
    id v144 = [v5 objectForKeyedSubscript:v143];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setStaticTravelTime:", objc_msgSend(v144, "unsignedIntValue"));
    }

    if (a3) {
      v145 = @"enrouteNotice";
    }
    else {
      v145 = @"enroute_notice";
    }
    v146 = [v5 objectForKeyedSubscript:v145];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v222 = 0u;
      long long v223 = 0u;
      long long v220 = 0u;
      long long v221 = 0u;
      id v147 = v146;
      uint64_t v148 = [v147 countByEnumeratingWithState:&v220 objects:v279 count:16];
      if (v148)
      {
        uint64_t v149 = v148;
        uint64_t v150 = *(void *)v221;
        do
        {
          for (uint64_t i4 = 0; i4 != v149; ++i4)
          {
            if (*(void *)v221 != v150) {
              objc_enumerationMutation(v147);
            }
            uint64_t v152 = *(void *)(*((void *)&v220 + 1) + 8 * i4);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v153 = [GEOEnrouteNotice alloc];
              if (a3) {
                uint64_t v154 = [(GEOEnrouteNotice *)v153 initWithJSON:v152];
              }
              else {
                uint64_t v154 = [(GEOEnrouteNotice *)v153 initWithDictionary:v152];
              }
              v155 = (void *)v154;
              [v6 addEnrouteNotice:v154];
            }
          }
          uint64_t v149 = [v147 countByEnumeratingWithState:&v220 objects:v279 count:16];
        }
        while (v149);
      }

      id v5 = v207;
    }

    if (a3) {
      v156 = @"trafficColorInfo";
    }
    else {
      v156 = @"traffic_color_info";
    }
    id v157 = [v5 objectForKeyedSubscript:v156];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v218 = 0u;
      long long v219 = 0u;
      long long v216 = 0u;
      long long v217 = 0u;
      id v158 = v157;
      uint64_t v159 = [v158 countByEnumeratingWithState:&v216 objects:v278 count:16];
      if (v159)
      {
        uint64_t v160 = v159;
        uint64_t v161 = *(void *)v217;
        do
        {
          for (uint64_t i5 = 0; i5 != v160; ++i5)
          {
            if (*(void *)v217 != v161) {
              objc_enumerationMutation(v158);
            }
            uint64_t v163 = *(void *)(*((void *)&v216 + 1) + 8 * i5);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v164 = [GEOTrafficColorInfo alloc];
              if (a3) {
                uint64_t v165 = [(GEOTrafficColorInfo *)v164 initWithJSON:v163];
              }
              else {
                uint64_t v165 = [(GEOTrafficColorInfo *)v164 initWithDictionary:v163];
              }
              v166 = (void *)v165;
              [v6 addTrafficColorInfo:v165];
            }
          }
          uint64_t v160 = [v158 countByEnumeratingWithState:&v216 objects:v278 count:16];
        }
        while (v160);
      }

      id v5 = v207;
    }

    if (a3) {
      v167 = @"incidentOnRouteInfo";
    }
    else {
      v167 = @"incident_on_route_info";
    }
    id v168 = [v5 objectForKeyedSubscript:v167];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v214 = 0u;
      long long v215 = 0u;
      long long v212 = 0u;
      long long v213 = 0u;
      id v169 = v168;
      uint64_t v170 = [v169 countByEnumeratingWithState:&v212 objects:v277 count:16];
      if (v170)
      {
        uint64_t v171 = v170;
        uint64_t v172 = *(void *)v213;
        do
        {
          for (uint64_t i6 = 0; i6 != v171; ++i6)
          {
            if (*(void *)v213 != v172) {
              objc_enumerationMutation(v169);
            }
            uint64_t v174 = *(void *)(*((void *)&v212 + 1) + 8 * i6);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v175 = [GEOIncidentOnRouteInfo alloc];
              if (a3) {
                uint64_t v176 = [(GEOIncidentOnRouteInfo *)v175 initWithJSON:v174];
              }
              else {
                uint64_t v176 = [(GEOIncidentOnRouteInfo *)v175 initWithDictionary:v174];
              }
              long long v177 = (void *)v176;
              [v6 addIncidentOnRouteInfo:v176];
            }
          }
          uint64_t v171 = [v169 countByEnumeratingWithState:&v212 objects:v277 count:16];
        }
        while (v171);
      }

      id v5 = v207;
    }

    if (a3) {
      long long v178 = @"originWaypointInfo";
    }
    else {
      long long v178 = @"origin_waypoint_info";
    }
    long long v179 = [v5 objectForKeyedSubscript:v178];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v180 = [GEOWaypointInfo alloc];
      if (a3) {
        uint64_t v181 = [(GEOWaypointInfo *)v180 initWithJSON:v179];
      }
      else {
        uint64_t v181 = [(GEOWaypointInfo *)v180 initWithDictionary:v179];
      }
      long long v182 = (void *)v181;
      [v6 setOriginWaypointInfo:v181];
    }
    if (a3) {
      long long v183 = @"destinationWaypointInfo";
    }
    else {
      long long v183 = @"destination_waypoint_info";
    }
    long long v184 = [v5 objectForKeyedSubscript:v183];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v185 = [GEOWaypointInfo alloc];
      if (a3) {
        uint64_t v186 = [(GEOWaypointInfo *)v185 initWithJSON:v184];
      }
      else {
        uint64_t v186 = [(GEOWaypointInfo *)v185 initWithDictionary:v184];
      }
      long long v187 = (void *)v186;
      [v6 setDestinationWaypointInfo:v186];
    }
    if (a3) {
      long long v188 = @"navigabilityInfo";
    }
    else {
      long long v188 = @"navigability_info";
    }
    long long v189 = [v5 objectForKeyedSubscript:v188];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v190 = [GEONavigabilityInfo alloc];
      if (a3) {
        uint64_t v191 = [(GEONavigabilityInfo *)v190 initWithJSON:v189];
      }
      else {
        uint64_t v191 = [(GEONavigabilityInfo *)v190 initWithDictionary:v189];
      }
      long long v192 = (void *)v191;
      [v6 setNavigabilityInfo:v191];
    }
    if (a3) {
      long long v193 = @"guidanceEvent";
    }
    else {
      long long v193 = @"guidance_event";
    }
    long long v194 = [v5 objectForKeyedSubscript:v193];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v210 = 0u;
      long long v211 = 0u;
      long long v208 = 0u;
      long long v209 = 0u;
      id v195 = v194;
      uint64_t v196 = [v195 countByEnumeratingWithState:&v208 objects:v276 count:16];
      if (v196)
      {
        uint64_t v197 = v196;
        uint64_t v198 = *(void *)v209;
        do
        {
          for (uint64_t i7 = 0; i7 != v197; ++i7)
          {
            if (*(void *)v209 != v198) {
              objc_enumerationMutation(v195);
            }
            uint64_t v200 = *(void *)(*((void *)&v208 + 1) + 8 * i7);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v201 = [GEOGuidanceEvent alloc];
              if (a3) {
                uint64_t v202 = [(GEOGuidanceEvent *)v201 initWithJSON:v200];
              }
              else {
                uint64_t v202 = [(GEOGuidanceEvent *)v201 initWithDictionary:v200];
              }
              long long v203 = (void *)v202;
              [v6 addGuidanceEvent:v202];
            }
          }
          uint64_t v197 = [v195 countByEnumeratingWithState:&v208 objects:v276 count:16];
        }
        while (v197);
      }

      id v5 = v207;
    }

    id v134 = v6;
  }
  else
  {
    id v134 = 0;
  }

  return v134;
}

- (GEOETARoute)initWithJSON:(id)a3
{
  return (GEOETARoute *)-[GEOETARoute _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1051;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1052;
    }
    GEOETARouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOETARouteCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETARouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETARouteReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETARouteIsDirty((uint64_t)self) & 1) == 0)
  {
    v63 = self->_reader;
    objc_sync_enter(v63);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v64 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v64];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v63);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOETARoute *)self readAll:0];
    if (self->_routeID) {
      PBDataWriterWriteDataField();
    }
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v6 = self->_steps;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v114 objects:v130 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v115;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v115 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v114 objects:v130 count:16];
      }
      while (v7);
    }

    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v10 = self->_zilchPoints;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v110 objects:v129 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v111;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v111 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteDataField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v110 objects:v129 count:16];
      }
      while (v11);
    }

    if (self->_pathLeg) {
      PBDataWriterWriteDataField();
    }
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v14 = self->_reroutedRoutes;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v106 objects:v128 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v107;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v107 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v106 objects:v128 count:16];
      }
      while (v15);
    }

    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    v18 = self->_invalidSectionZilchPoints;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v102 objects:v127 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v103;
      do
      {
        for (uint64_t m = 0; m != v19; ++m)
        {
          if (*(void *)v103 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteDataField();
        }
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v102 objects:v127 count:16];
      }
      while (v19);
    }

    if (self->_trafficColors.count)
    {
      uint64_t v101 = 0;
      PBDataWriterPlaceMark();
      if (self->_trafficColors.count)
      {
        unint64_t v22 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v22;
        }
        while (v22 < self->_trafficColors.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_trafficColorOffsets.count)
    {
      uint64_t v101 = 0;
      PBDataWriterPlaceMark();
      if (self->_trafficColorOffsets.count)
      {
        unint64_t v23 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v23;
        }
        while (v23 < self->_trafficColorOffsets.count);
      }
      PBDataWriterRecallMark();
    }
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    v24 = self->_routeLineStyleInfos;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v97 objects:v126 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v98;
      do
      {
        for (uint64_t n = 0; n != v25; ++n)
        {
          if (*(void *)v98 != v26) {
            objc_enumerationMutation(v24);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v97 objects:v126 count:16];
      }
      while (v25);
    }

    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v28 = self->_routeCameraInputInfos;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v93 objects:v125 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v94;
      do
      {
        for (iuint64_t i = 0; ii != v29; ++ii)
        {
          if (*(void *)v94 != v30) {
            objc_enumerationMutation(v28);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v93 objects:v125 count:16];
      }
      while (v29);
    }

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v32 = self->_incidentsOnETARoutes;
    uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v89 objects:v124 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v90;
      do
      {
        for (juint64_t j = 0; jj != v33; ++jj)
        {
          if (*(void *)v90 != v34) {
            objc_enumerationMutation(v32);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v89 objects:v124 count:16];
      }
      while (v33);
    }

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v36 = self->_incidentsOnReRoutes;
    uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v85 objects:v123 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v86;
      do
      {
        for (kuint64_t k = 0; kk != v37; ++kk)
        {
          if (*(void *)v86 != v38) {
            objc_enumerationMutation(v36);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v85 objects:v123 count:16];
      }
      while (v37);
    }

    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v40 = self->_incidentsOffReRoutes;
    uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v81 objects:v122 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v82;
      do
      {
        for (muint64_t m = 0; mm != v41; ++mm)
        {
          if (*(void *)v82 != v42) {
            objc_enumerationMutation(v40);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v81 objects:v122 count:16];
      }
      while (v41);
    }

    if (self->_incidentIndexs.count)
    {
      uint64_t v101 = 0;
      PBDataWriterPlaceMark();
      if (self->_incidentIndexs.count)
      {
        unint64_t v44 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v44;
        }
        while (v44 < self->_incidentIndexs.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_incidentEndOffsetsInETARoutes.count)
    {
      uint64_t v101 = 0;
      PBDataWriterPlaceMark();
      if (self->_incidentEndOffsetsInETARoutes.count)
      {
        unint64_t v45 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v45;
        }
        while (v45 < self->_incidentEndOffsetsInETARoutes.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_trafficBannerText) {
      PBDataWriterWriteSubmessage();
    }
    $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
    if (*(unsigned char *)&flags)
    {
      PBDataWriterWriteUint32Field();
      $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x10) != 0)
    {
      PBDataWriterWriteUint32Field();
      $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    uint64_t v47 = self->_enrouteNotices;
    uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v77 objects:v121 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v78;
      do
      {
        for (nuint64_t n = 0; nn != v48; ++nn)
        {
          if (*(void *)v78 != v49) {
            objc_enumerationMutation(v47);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v77 objects:v121 count:16];
      }
      while (v48);
    }

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v51 = self->_trafficColorInfos;
    uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v73 objects:v120 count:16];
    if (v52)
    {
      uint64_t v53 = *(void *)v74;
      do
      {
        for (uint64_t i1 = 0; i1 != v52; ++i1)
        {
          if (*(void *)v74 != v53) {
            objc_enumerationMutation(v51);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v73 objects:v120 count:16];
      }
      while (v52);
    }

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v55 = self->_incidentOnRouteInfos;
    uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v69 objects:v119 count:16];
    if (v56)
    {
      uint64_t v57 = *(void *)v70;
      do
      {
        for (uint64_t i2 = 0; i2 != v56; ++i2)
        {
          if (*(void *)v70 != v57) {
            objc_enumerationMutation(v55);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v69 objects:v119 count:16];
      }
      while (v56);
    }

    if (self->_originWaypointInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_destinationWaypointInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_navigabilityInfo) {
      PBDataWriterWriteSubmessage();
    }
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v59 = self->_guidanceEvents;
    uint64_t v60 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v65 objects:v118 count:16];
    if (v60)
    {
      uint64_t v61 = *(void *)v66;
      do
      {
        for (uint64_t i3 = 0; i3 != v60; ++i3)
        {
          if (*(void *)v66 != v61) {
            objc_enumerationMutation(v59);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v60 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v65 objects:v118 count:16];
      }
      while (v60);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v65);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  -[GEOETARoute _readDestinationWaypointInfo]((uint64_t)self);
  if ([(GEOWaypointInfo *)self->_destinationWaypointInfo hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOETARoute _readIncidentsOffReRoutes]((uint64_t)self);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = self->_incidentsOffReRoutes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v36 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v35 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_36;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v35 objects:v42 count:16];
        if (v7) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  -[GEOETARoute _readIncidentsOnETARoutes]((uint64_t)self);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = self->_incidentsOnETARoutes;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
LABEL_12:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v31 + 1) + 8 * v13) hasGreenTeaWithValue:v3]) {
        goto LABEL_36;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v31 objects:v41 count:16];
        if (v11) {
          goto LABEL_12;
        }
        break;
      }
    }
  }

  -[GEOETARoute _readIncidentsOnReRoutes]((uint64_t)self);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = self->_incidentsOnReRoutes;
  uint64_t v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
LABEL_20:
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
          goto LABEL_20;
        }
        goto LABEL_26;
      }
    }
LABEL_36:

    return 1;
  }
LABEL_26:

  -[GEOETARoute _readOriginWaypointInfo]((uint64_t)self);
  if (![(GEOWaypointInfo *)self->_originWaypointInfo hasGreenTeaWithValue:v3])
  {
    -[GEOETARoute _readReroutedRoutes]((uint64_t)self);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = self->_reroutedRoutes;
    uint64_t v18 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v39 count:16];
    if (!v18)
    {
LABEL_35:

      -[GEOETARoute _readTrafficBannerText]((uint64_t)self);
      return [(GEOTrafficBannerText *)self->_trafficBannerText hasGreenTeaWithValue:v3];
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
LABEL_29:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v24 != v20) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v21), "hasGreenTeaWithValue:", v3, (void)v23)) {
        goto LABEL_36;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v39 count:16];
        if (v19) {
          goto LABEL_29;
        }
        goto LABEL_35;
      }
    }
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  long long v69 = (id *)a3;
  [(GEOETARoute *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v69 + 1, self->_reader);
  *((_DWORD *)v69 + 68) = self->_readerMarkPos;
  *((_DWORD *)v69 + 69) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_routeID) {
    objc_msgSend(v69, "setRouteID:");
  }
  if ([(GEOETARoute *)self stepsCount])
  {
    [v69 clearSteps];
    unint64_t v4 = [(GEOETARoute *)self stepsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOETARoute *)self stepAtIndex:i];
        [v69 addStep:v7];
      }
    }
  }
  if ([(GEOETARoute *)self zilchPointsCount])
  {
    [v69 clearZilchPoints];
    unint64_t v8 = [(GEOETARoute *)self zilchPointsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOETARoute *)self zilchPointsAtIndex:j];
        [v69 addZilchPoints:v11];
      }
    }
  }
  if (self->_pathLeg) {
    objc_msgSend(v69, "setPathLeg:");
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    *((unsigned char *)v69 + 304) = self->_routeNoLongerValid;
    *((_DWORD *)v69 + 77) |= 0x20u;
  }
  if ([(GEOETARoute *)self reroutedRoutesCount])
  {
    [v69 clearReroutedRoutes];
    unint64_t v12 = [(GEOETARoute *)self reroutedRoutesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOETARoute *)self reroutedRouteAtIndex:k];
        [v69 addReroutedRoute:v15];
      }
    }
  }
  if ([(GEOETARoute *)self invalidSectionZilchPointsCount])
  {
    [v69 clearInvalidSectionZilchPoints];
    unint64_t v16 = [(GEOETARoute *)self invalidSectionZilchPointsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(GEOETARoute *)self invalidSectionZilchPointsAtIndex:m];
        [v69 addInvalidSectionZilchPoints:v19];
      }
    }
  }
  if ([(GEOETARoute *)self trafficColorsCount])
  {
    [v69 clearTrafficColors];
    unint64_t v20 = [(GEOETARoute *)self trafficColorsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
        objc_msgSend(v69, "addTrafficColor:", -[GEOETARoute trafficColorAtIndex:](self, "trafficColorAtIndex:", n));
    }
  }
  if ([(GEOETARoute *)self trafficColorOffsetsCount])
  {
    [v69 clearTrafficColorOffsets];
    unint64_t v23 = [(GEOETARoute *)self trafficColorOffsetsCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (iuint64_t i = 0; ii != v24; ++ii)
        objc_msgSend(v69, "addTrafficColorOffset:", -[GEOETARoute trafficColorOffsetAtIndex:](self, "trafficColorOffsetAtIndex:", ii));
    }
  }
  if ([(GEOETARoute *)self routeLineStyleInfosCount])
  {
    [v69 clearRouteLineStyleInfos];
    unint64_t v26 = [(GEOETARoute *)self routeLineStyleInfosCount];
    if (v26)
    {
      unint64_t v27 = v26;
      for (juint64_t j = 0; jj != v27; ++jj)
      {
        long long v29 = [(GEOETARoute *)self routeLineStyleInfoAtIndex:jj];
        [v69 addRouteLineStyleInfo:v29];
      }
    }
  }
  if ([(GEOETARoute *)self routeCameraInputInfosCount])
  {
    [v69 clearRouteCameraInputInfos];
    unint64_t v30 = [(GEOETARoute *)self routeCameraInputInfosCount];
    if (v30)
    {
      unint64_t v31 = v30;
      for (kuint64_t k = 0; kk != v31; ++kk)
      {
        long long v33 = [(GEOETARoute *)self routeCameraInputInfoAtIndex:kk];
        [v69 addRouteCameraInputInfo:v33];
      }
    }
  }
  if ([(GEOETARoute *)self incidentsOnETARoutesCount])
  {
    [v69 clearIncidentsOnETARoutes];
    unint64_t v34 = [(GEOETARoute *)self incidentsOnETARoutesCount];
    if (v34)
    {
      unint64_t v35 = v34;
      for (muint64_t m = 0; mm != v35; ++mm)
      {
        long long v37 = [(GEOETARoute *)self incidentsOnETARouteAtIndex:mm];
        [v69 addIncidentsOnETARoute:v37];
      }
    }
  }
  if ([(GEOETARoute *)self incidentsOnReRoutesCount])
  {
    [v69 clearIncidentsOnReRoutes];
    unint64_t v38 = [(GEOETARoute *)self incidentsOnReRoutesCount];
    if (v38)
    {
      unint64_t v39 = v38;
      for (nuint64_t n = 0; nn != v39; ++nn)
      {
        uint64_t v41 = [(GEOETARoute *)self incidentsOnReRoutesAtIndex:nn];
        [v69 addIncidentsOnReRoutes:v41];
      }
    }
  }
  if ([(GEOETARoute *)self incidentsOffReRoutesCount])
  {
    [v69 clearIncidentsOffReRoutes];
    unint64_t v42 = [(GEOETARoute *)self incidentsOffReRoutesCount];
    if (v42)
    {
      unint64_t v43 = v42;
      for (uint64_t i1 = 0; i1 != v43; ++i1)
      {
        unint64_t v45 = [(GEOETARoute *)self incidentsOffReRoutesAtIndex:i1];
        [v69 addIncidentsOffReRoutes:v45];
      }
    }
  }
  if ([(GEOETARoute *)self incidentIndexsCount])
  {
    [v69 clearIncidentIndexs];
    unint64_t v46 = [(GEOETARoute *)self incidentIndexsCount];
    if (v46)
    {
      unint64_t v47 = v46;
      for (uint64_t i2 = 0; i2 != v47; ++i2)
        objc_msgSend(v69, "addIncidentIndex:", -[GEOETARoute incidentIndexAtIndex:](self, "incidentIndexAtIndex:", i2));
    }
  }
  if ([(GEOETARoute *)self incidentEndOffsetsInETARoutesCount])
  {
    [v69 clearIncidentEndOffsetsInETARoutes];
    unint64_t v49 = [(GEOETARoute *)self incidentEndOffsetsInETARoutesCount];
    if (v49)
    {
      unint64_t v50 = v49;
      for (uint64_t i3 = 0; i3 != v50; ++i3)
        objc_msgSend(v69, "addIncidentEndOffsetsInETARoute:", -[GEOETARoute incidentEndOffsetsInETARouteAtIndex:](self, "incidentEndOffsetsInETARouteAtIndex:", i3));
    }
  }
  if (self->_trafficBannerText) {
    objc_msgSend(v69, "setTrafficBannerText:");
  }
  $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    *((_DWORD *)v69 + 71) = self->_historicTravelTime;
    *((_DWORD *)v69 + 77) |= 1u;
    $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) == 0)
    {
LABEL_63:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_64;
      }
      goto LABEL_94;
    }
  }
  else if ((*(unsigned char *)&flags & 4) == 0)
  {
    goto LABEL_63;
  }
  *((_DWORD *)v69 + 73) = self->_travelTimeAggressiveEstimate;
  *((_DWORD *)v69 + 77) |= 4u;
  $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_64:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_65;
    }
LABEL_95:
    *((_DWORD *)v69 + 75) = self->_travelTimeConservativeEstimate;
    *((_DWORD *)v69 + 77) |= 0x10u;
    if ((*(_DWORD *)&self->_flags & 2) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
LABEL_94:
  *((_DWORD *)v69 + 74) = self->_travelTimeBestEstimate;
  *((_DWORD *)v69 + 77) |= 8u;
  $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    goto LABEL_95;
  }
LABEL_65:
  if ((*(unsigned char *)&flags & 2) != 0)
  {
LABEL_66:
    *((_DWORD *)v69 + 72) = self->_staticTravelTime;
    *((_DWORD *)v69 + 77) |= 2u;
  }
LABEL_67:
  if ([(GEOETARoute *)self enrouteNoticesCount])
  {
    [v69 clearEnrouteNotices];
    unint64_t v53 = [(GEOETARoute *)self enrouteNoticesCount];
    if (v53)
    {
      unint64_t v54 = v53;
      for (uint64_t i4 = 0; i4 != v54; ++i4)
      {
        uint64_t v56 = [(GEOETARoute *)self enrouteNoticeAtIndex:i4];
        [v69 addEnrouteNotice:v56];
      }
    }
  }
  if ([(GEOETARoute *)self trafficColorInfosCount])
  {
    [v69 clearTrafficColorInfos];
    unint64_t v57 = [(GEOETARoute *)self trafficColorInfosCount];
    if (v57)
    {
      unint64_t v58 = v57;
      for (uint64_t i5 = 0; i5 != v58; ++i5)
      {
        uint64_t v60 = [(GEOETARoute *)self trafficColorInfoAtIndex:i5];
        [v69 addTrafficColorInfo:v60];
      }
    }
  }
  if ([(GEOETARoute *)self incidentOnRouteInfosCount])
  {
    [v69 clearIncidentOnRouteInfos];
    unint64_t v61 = [(GEOETARoute *)self incidentOnRouteInfosCount];
    if (v61)
    {
      unint64_t v62 = v61;
      for (uint64_t i6 = 0; i6 != v62; ++i6)
      {
        id v64 = [(GEOETARoute *)self incidentOnRouteInfoAtIndex:i6];
        [v69 addIncidentOnRouteInfo:v64];
      }
    }
  }
  if (self->_originWaypointInfo) {
    objc_msgSend(v69, "setOriginWaypointInfo:");
  }
  if (self->_destinationWaypointInfo) {
    objc_msgSend(v69, "setDestinationWaypointInfo:");
  }
  if (self->_navigabilityInfo) {
    objc_msgSend(v69, "setNavigabilityInfo:");
  }
  if ([(GEOETARoute *)self guidanceEventsCount])
  {
    [v69 clearGuidanceEvents];
    unint64_t v65 = [(GEOETARoute *)self guidanceEventsCount];
    if (v65)
    {
      unint64_t v66 = v65;
      for (uint64_t i7 = 0; i7 != v66; ++i7)
      {
        long long v68 = [(GEOETARoute *)self guidanceEventAtIndex:i7];
        [v69 addGuidanceEvent:v68];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 3) & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOETARouteReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_105;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOETARoute *)self readAll:0];
  uint64_t v9 = [(NSData *)self->_routeID copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v9;

  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  uint64_t v11 = self->_steps;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v137 objects:v153 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v138;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v138 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v137 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addStep:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v137 objects:v153 count:16];
    }
    while (v12);
  }

  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  unint64_t v16 = self->_zilchPoints;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v133 objects:v152 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v134;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v134 != v18) {
          objc_enumerationMutation(v16);
        }
        unint64_t v20 = (void *)[*(id *)(*((void *)&v133 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addZilchPoints:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v133 objects:v152 count:16];
    }
    while (v17);
  }

  uint64_t v21 = [(NSData *)self->_pathLeg copyWithZone:a3];
  unint64_t v22 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v21;

  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 304) = self->_routeNoLongerValid;
    *(_DWORD *)(v5 + 308) |= 0x20u;
  }
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  unint64_t v23 = self->_reroutedRoutes;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v129 objects:v151 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v130;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v130 != v25) {
          objc_enumerationMutation(v23);
        }
        unint64_t v27 = (void *)[*(id *)(*((void *)&v129 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addReroutedRoute:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v129 objects:v151 count:16];
    }
    while (v24);
  }

  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v28 = self->_invalidSectionZilchPoints;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v125 objects:v150 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v126;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v126 != v30) {
          objc_enumerationMutation(v28);
        }
        long long v32 = (void *)[*(id *)(*((void *)&v125 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addInvalidSectionZilchPoints:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v125 objects:v150 count:16];
    }
    while (v29);
  }

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v33 = self->_routeLineStyleInfos;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v121 objects:v149 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v122;
    do
    {
      for (uint64_t n = 0; n != v34; ++n)
      {
        if (*(void *)v122 != v35) {
          objc_enumerationMutation(v33);
        }
        long long v37 = (void *)[*(id *)(*((void *)&v121 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addRouteLineStyleInfo:v37];
      }
      uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v121 objects:v149 count:16];
    }
    while (v34);
  }

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  unint64_t v38 = self->_routeCameraInputInfos;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v117 objects:v148 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v118;
    do
    {
      for (iuint64_t i = 0; ii != v39; ++ii)
      {
        if (*(void *)v118 != v40) {
          objc_enumerationMutation(v38);
        }
        unint64_t v42 = (void *)[*(id *)(*((void *)&v117 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addRouteCameraInputInfo:v42];
      }
      uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v117 objects:v148 count:16];
    }
    while (v39);
  }

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  unint64_t v43 = self->_incidentsOnETARoutes;
  uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v113 objects:v147 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v114;
    do
    {
      for (juint64_t j = 0; jj != v44; ++jj)
      {
        if (*(void *)v114 != v45) {
          objc_enumerationMutation(v43);
        }
        unint64_t v47 = (void *)[*(id *)(*((void *)&v113 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v5 addIncidentsOnETARoute:v47];
      }
      uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v113 objects:v147 count:16];
    }
    while (v44);
  }

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  uint64_t v48 = self->_incidentsOnReRoutes;
  uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v109 objects:v146 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v110;
    do
    {
      for (kuint64_t k = 0; kk != v49; ++kk)
      {
        if (*(void *)v110 != v50) {
          objc_enumerationMutation(v48);
        }
        uint64_t v52 = (void *)[*(id *)(*((void *)&v109 + 1) + 8 * kk) copyWithZone:a3];
        [(id)v5 addIncidentsOnReRoutes:v52];
      }
      uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v109 objects:v146 count:16];
    }
    while (v49);
  }

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  unint64_t v53 = self->_incidentsOffReRoutes;
  uint64_t v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v105 objects:v145 count:16];
  if (v54)
  {
    uint64_t v55 = *(void *)v106;
    do
    {
      for (muint64_t m = 0; mm != v54; ++mm)
      {
        if (*(void *)v106 != v55) {
          objc_enumerationMutation(v53);
        }
        unint64_t v57 = (void *)[*(id *)(*((void *)&v105 + 1) + 8 * mm) copyWithZone:a3];
        [(id)v5 addIncidentsOffReRoutes:v57];
      }
      uint64_t v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v105 objects:v145 count:16];
    }
    while (v54);
  }

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  id v58 = [(GEOTrafficBannerText *)self->_trafficBannerText copyWithZone:a3];
  uint64_t v59 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v58;

  $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    *(_DWORD *)(v5 + 284) = self->_historicTravelTime;
    *(_DWORD *)(v5 + 308) |= 1u;
    $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) == 0)
    {
LABEL_72:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_73;
      }
      goto LABEL_108;
    }
  }
  else if ((*(unsigned char *)&flags & 4) == 0)
  {
    goto LABEL_72;
  }
  *(_DWORD *)(v5 + 292) = self->_travelTimeAggressiveEstimate;
  *(_DWORD *)(v5 + 308) |= 4u;
  $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_73:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_74;
    }
LABEL_109:
    *(_DWORD *)(v5 + 300) = self->_travelTimeConservativeEstimate;
    *(_DWORD *)(v5 + 308) |= 0x10u;
    if ((*(_DWORD *)&self->_flags & 2) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_108:
  *(_DWORD *)(v5 + 296) = self->_travelTimeBestEstimate;
  *(_DWORD *)(v5 + 308) |= 8u;
  $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    goto LABEL_109;
  }
LABEL_74:
  if ((*(unsigned char *)&flags & 2) != 0)
  {
LABEL_75:
    *(_DWORD *)(v5 + 288) = self->_staticTravelTime;
    *(_DWORD *)(v5 + 308) |= 2u;
  }
LABEL_76:
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  unint64_t v61 = self->_enrouteNotices;
  uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v101 objects:v144 count:16];
  if (v62)
  {
    uint64_t v63 = *(void *)v102;
    do
    {
      for (nuint64_t n = 0; nn != v62; ++nn)
      {
        if (*(void *)v102 != v63) {
          objc_enumerationMutation(v61);
        }
        unint64_t v65 = (void *)[*(id *)(*((void *)&v101 + 1) + 8 * nn) copyWithZone:a3];
        [(id)v5 addEnrouteNotice:v65];
      }
      uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v101 objects:v144 count:16];
    }
    while (v62);
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  unint64_t v66 = self->_trafficColorInfos;
  uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v97 objects:v143 count:16];
  if (v67)
  {
    uint64_t v68 = *(void *)v98;
    do
    {
      for (uint64_t i1 = 0; i1 != v67; ++i1)
      {
        if (*(void *)v98 != v68) {
          objc_enumerationMutation(v66);
        }
        long long v70 = (void *)[*(id *)(*((void *)&v97 + 1) + 8 * i1) copyWithZone:a3];
        [(id)v5 addTrafficColorInfo:v70];
      }
      uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v97 objects:v143 count:16];
    }
    while (v67);
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v71 = self->_incidentOnRouteInfos;
  uint64_t v72 = [(NSMutableArray *)v71 countByEnumeratingWithState:&v93 objects:v142 count:16];
  if (v72)
  {
    uint64_t v73 = *(void *)v94;
    do
    {
      for (uint64_t i2 = 0; i2 != v72; ++i2)
      {
        if (*(void *)v94 != v73) {
          objc_enumerationMutation(v71);
        }
        long long v75 = (void *)[*(id *)(*((void *)&v93 + 1) + 8 * i2) copyWithZone:a3];
        [(id)v5 addIncidentOnRouteInfo:v75];
      }
      uint64_t v72 = [(NSMutableArray *)v71 countByEnumeratingWithState:&v93 objects:v142 count:16];
    }
    while (v72);
  }

  id v76 = [(GEOWaypointInfo *)self->_originWaypointInfo copyWithZone:a3];
  long long v77 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v76;

  id v78 = [(GEOWaypointInfo *)self->_destinationWaypointInfo copyWithZone:a3];
  long long v79 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v78;

  id v80 = [(GEONavigabilityInfo *)self->_navigabilityInfo copyWithZone:a3];
  long long v81 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v80;

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v82 = self->_guidanceEvents;
  uint64_t v83 = [(NSMutableArray *)v82 countByEnumeratingWithState:&v89 objects:v141 count:16];
  if (v83)
  {
    uint64_t v84 = *(void *)v90;
    do
    {
      for (uint64_t i3 = 0; i3 != v83; ++i3)
      {
        if (*(void *)v90 != v84) {
          objc_enumerationMutation(v82);
        }
        long long v86 = objc_msgSend(*(id *)(*((void *)&v89 + 1) + 8 * i3), "copyWithZone:", a3, (void)v89);
        [(id)v5 addGuidanceEvent:v86];
      }
      uint64_t v83 = [(NSMutableArray *)v82 countByEnumeratingWithState:&v89 objects:v141 count:16];
    }
    while (v83);
  }

  long long v87 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v87;
LABEL_105:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_77;
  }
  [(GEOETARoute *)self readAll:1];
  [v4 readAll:1];
  routeID = self->_routeID;
  if ((unint64_t)routeID | *((void *)v4 + 27))
  {
    if (!-[NSData isEqual:](routeID, "isEqual:")) {
      goto LABEL_77;
    }
  }
  steps = self->_steps;
  if ((unint64_t)steps | *((void *)v4 + 30))
  {
    if (!-[NSMutableArray isEqual:](steps, "isEqual:")) {
      goto LABEL_77;
    }
  }
  zilchPoints = self->_zilchPoints;
  if ((unint64_t)zilchPoints | *((void *)v4 + 33))
  {
    if (!-[NSMutableArray isEqual:](zilchPoints, "isEqual:")) {
      goto LABEL_77;
    }
  }
  pathLeg = self->_pathLeg;
  if ((unint64_t)pathLeg | *((void *)v4 + 25))
  {
    if (!-[NSData isEqual:](pathLeg, "isEqual:")) {
      goto LABEL_77;
    }
  }
  int v9 = *((_DWORD *)v4 + 77);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((v9 & 0x20) != 0)
    {
      if (self->_routeNoLongerValid)
      {
        if (!*((unsigned char *)v4 + 304)) {
          goto LABEL_77;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 304)) {
        goto LABEL_18;
      }
    }
LABEL_77:
    char v27 = 0;
    goto LABEL_78;
  }
  if ((v9 & 0x20) != 0) {
    goto LABEL_77;
  }
LABEL_18:
  reroutedRoutes = self->_reroutedRoutes;
  if ((unint64_t)reroutedRoutes | *((void *)v4 + 26)
    && !-[NSMutableArray isEqual:](reroutedRoutes, "isEqual:"))
  {
    goto LABEL_77;
  }
  invalidSectionZilchPoints = self->_invalidSectionZilchPoints;
  if ((unint64_t)invalidSectionZilchPoints | *((void *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](invalidSectionZilchPoints, "isEqual:")) {
      goto LABEL_77;
    }
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_77;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_77;
  }
  routeLineStyleInfos = self->_routeLineStyleInfos;
  if ((unint64_t)routeLineStyleInfos | *((void *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](routeLineStyleInfos, "isEqual:")) {
      goto LABEL_77;
    }
  }
  routeCameraInputInfos = self->_routeCameraInputInfos;
  if ((unint64_t)routeCameraInputInfos | *((void *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](routeCameraInputInfos, "isEqual:")) {
      goto LABEL_77;
    }
  }
  incidentsOnETARoutes = self->_incidentsOnETARoutes;
  if ((unint64_t)incidentsOnETARoutes | *((void *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](incidentsOnETARoutes, "isEqual:")) {
      goto LABEL_77;
    }
  }
  incidentsOnReRoutes = self->_incidentsOnReRoutes;
  if ((unint64_t)incidentsOnReRoutes | *((void *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](incidentsOnReRoutes, "isEqual:")) {
      goto LABEL_77;
    }
  }
  incidentsOffReRoutes = self->_incidentsOffReRoutes;
  if ((unint64_t)incidentsOffReRoutes | *((void *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](incidentsOffReRoutes, "isEqual:")) {
      goto LABEL_77;
    }
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_77;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_77;
  }
  trafficBannerText = self->_trafficBannerText;
  if ((unint64_t)trafficBannerText | *((void *)v4 + 31))
  {
    if (!-[GEOTrafficBannerText isEqual:](trafficBannerText, "isEqual:")) {
      goto LABEL_77;
    }
  }
  $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
  int v19 = *((_DWORD *)v4 + 77);
  if (*(unsigned char *)&flags)
  {
    if ((v19 & 1) == 0 || self->_historicTravelTime != *((_DWORD *)v4 + 71)) {
      goto LABEL_77;
    }
  }
  else if (v19)
  {
    goto LABEL_77;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v19 & 4) == 0 || self->_travelTimeAggressiveEstimate != *((_DWORD *)v4 + 73)) {
      goto LABEL_77;
    }
  }
  else if ((v19 & 4) != 0)
  {
    goto LABEL_77;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v19 & 8) == 0 || self->_travelTimeBestEstimate != *((_DWORD *)v4 + 74)) {
      goto LABEL_77;
    }
  }
  else if ((v19 & 8) != 0)
  {
    goto LABEL_77;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v19 & 0x10) == 0 || self->_travelTimeConservativeEstimate != *((_DWORD *)v4 + 75)) {
      goto LABEL_77;
    }
  }
  else if ((v19 & 0x10) != 0)
  {
    goto LABEL_77;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v19 & 2) == 0 || self->_staticTravelTime != *((_DWORD *)v4 + 72)) {
      goto LABEL_77;
    }
  }
  else if ((v19 & 2) != 0)
  {
    goto LABEL_77;
  }
  enrouteNotices = self->_enrouteNotices;
  if ((unint64_t)enrouteNotices | *((void *)v4 + 16)
    && !-[NSMutableArray isEqual:](enrouteNotices, "isEqual:"))
  {
    goto LABEL_77;
  }
  trafficColorInfos = self->_trafficColorInfos;
  if ((unint64_t)trafficColorInfos | *((void *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](trafficColorInfos, "isEqual:")) {
      goto LABEL_77;
    }
  }
  incidentOnRouteInfos = self->_incidentOnRouteInfos;
  if ((unint64_t)incidentOnRouteInfos | *((void *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](incidentOnRouteInfos, "isEqual:")) {
      goto LABEL_77;
    }
  }
  originWaypointInfo = self->_originWaypointInfo;
  if ((unint64_t)originWaypointInfo | *((void *)v4 + 24))
  {
    if (!-[GEOWaypointInfo isEqual:](originWaypointInfo, "isEqual:")) {
      goto LABEL_77;
    }
  }
  destinationWaypointInfo = self->_destinationWaypointInfo;
  if ((unint64_t)destinationWaypointInfo | *((void *)v4 + 15))
  {
    if (!-[GEOWaypointInfo isEqual:](destinationWaypointInfo, "isEqual:")) {
      goto LABEL_77;
    }
  }
  navigabilityInfo = self->_navigabilityInfo;
  if ((unint64_t)navigabilityInfo | *((void *)v4 + 23))
  {
    if (!-[GEONavigabilityInfo isEqual:](navigabilityInfo, "isEqual:")) {
      goto LABEL_77;
    }
  }
  guidanceEvents = self->_guidanceEvents;
  if ((unint64_t)guidanceEvents | *((void *)v4 + 17)) {
    char v27 = -[NSMutableArray isEqual:](guidanceEvents, "isEqual:");
  }
  else {
    char v27 = 1;
  }
LABEL_78:

  return v27;
}

- (unint64_t)hash
{
  [(GEOETARoute *)self readAll:1];
  uint64_t v33 = [(NSData *)self->_routeID hash];
  uint64_t v32 = [(NSMutableArray *)self->_steps hash];
  uint64_t v31 = [(NSMutableArray *)self->_zilchPoints hash];
  uint64_t v30 = [(NSData *)self->_pathLeg hash];
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    uint64_t v29 = 2654435761 * self->_routeNoLongerValid;
  }
  else {
    uint64_t v29 = 0;
  }
  uint64_t v28 = [(NSMutableArray *)self->_reroutedRoutes hash];
  uint64_t v27 = [(NSMutableArray *)self->_invalidSectionZilchPoints hash];
  uint64_t v26 = PBRepeatedUInt32Hash();
  uint64_t v25 = PBRepeatedUInt32Hash();
  uint64_t v3 = [(NSMutableArray *)self->_routeLineStyleInfos hash];
  uint64_t v4 = [(NSMutableArray *)self->_routeCameraInputInfos hash];
  uint64_t v5 = [(NSMutableArray *)self->_incidentsOnETARoutes hash];
  uint64_t v6 = [(NSMutableArray *)self->_incidentsOnReRoutes hash];
  uint64_t v7 = [(NSMutableArray *)self->_incidentsOffReRoutes hash];
  uint64_t v8 = PBRepeatedUInt32Hash();
  uint64_t v9 = PBRepeatedUInt32Hash();
  unint64_t v10 = [(GEOTrafficBannerText *)self->_trafficBannerText hash];
  $C98F32EDFC9B1C2D78E34865DB4AC25D flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    uint64_t v12 = 2654435761 * self->_historicTravelTime;
    if ((*(unsigned char *)&flags & 4) != 0)
    {
LABEL_6:
      uint64_t v13 = 2654435761 * self->_travelTimeAggressiveEstimate;
      if ((*(unsigned char *)&flags & 8) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v13 = 0;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
LABEL_7:
    uint64_t v14 = 2654435761 * self->_travelTimeBestEstimate;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v15 = 0;
    if ((*(unsigned char *)&flags & 2) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v16 = 0;
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v14 = 0;
  if ((*(unsigned char *)&flags & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v15 = 2654435761 * self->_travelTimeConservativeEstimate;
  if ((*(unsigned char *)&flags & 2) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v16 = 2654435761 * self->_staticTravelTime;
LABEL_15:
  unint64_t v17 = v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  uint64_t v18 = v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(NSMutableArray *)self->_enrouteNotices hash];
  uint64_t v19 = v18 ^ [(NSMutableArray *)self->_trafficColorInfos hash];
  uint64_t v20 = v19 ^ [(NSMutableArray *)self->_incidentOnRouteInfos hash];
  unint64_t v21 = v20 ^ [(GEOWaypointInfo *)self->_originWaypointInfo hash];
  unint64_t v22 = v17 ^ v21 ^ [(GEOWaypointInfo *)self->_destinationWaypointInfo hash];
  unint64_t v23 = [(GEONavigabilityInfo *)self->_navigabilityInfo hash];
  return v22 ^ v23 ^ [(NSMutableArray *)self->_guidanceEvents hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 27)) {
    [(GEOETARoute *)self setRouteID:"setRouteID:"];
  }
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v5 = *((id *)v4 + 30);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v139 objects:v155 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v140;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v140 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOETARoute *)self addStep:*(void *)(*((void *)&v139 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v139 objects:v155 count:16];
    }
    while (v7);
  }

  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v10 = *((id *)v4 + 33);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v135 objects:v154 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v136;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v136 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOETARoute *)self addZilchPoints:*(void *)(*((void *)&v135 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v135 objects:v154 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 25)) {
    -[GEOETARoute setPathLeg:](self, "setPathLeg:");
  }
  if ((*((unsigned char *)v4 + 308) & 0x20) != 0)
  {
    self->_routeNoLongerValid = *((unsigned char *)v4 + 304);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v15 = *((id *)v4 + 26);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v131 objects:v153 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v132;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v132 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEOETARoute *)self addReroutedRoute:*(void *)(*((void *)&v131 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v131 objects:v153 count:16];
    }
    while (v17);
  }

  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v20 = *((id *)v4 + 22);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v127 objects:v152 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v128;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v128 != v23) {
          objc_enumerationMutation(v20);
        }
        [(GEOETARoute *)self addInvalidSectionZilchPoints:*(void *)(*((void *)&v127 + 1) + 8 * m)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v127 objects:v152 count:16];
    }
    while (v22);
  }

  uint64_t v25 = [v4 trafficColorsCount];
  if (v25)
  {
    uint64_t v26 = v25;
    for (uint64_t n = 0; n != v26; ++n)
      -[GEOETARoute addTrafficColor:](self, "addTrafficColor:", [v4 trafficColorAtIndex:n]);
  }
  uint64_t v28 = [v4 trafficColorOffsetsCount];
  if (v28)
  {
    uint64_t v29 = v28;
    for (iuint64_t i = 0; ii != v29; ++ii)
      -[GEOETARoute addTrafficColorOffset:](self, "addTrafficColorOffset:", [v4 trafficColorOffsetAtIndex:ii]);
  }
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v31 = *((id *)v4 + 29);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v123 objects:v151 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v124;
    do
    {
      for (juint64_t j = 0; jj != v33; ++jj)
      {
        if (*(void *)v124 != v34) {
          objc_enumerationMutation(v31);
        }
        [(GEOETARoute *)self addRouteLineStyleInfo:*(void *)(*((void *)&v123 + 1) + 8 * jj)];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v123 objects:v151 count:16];
    }
    while (v33);
  }

  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v36 = *((id *)v4 + 28);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v119 objects:v150 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v120;
    do
    {
      for (kuint64_t k = 0; kk != v38; ++kk)
      {
        if (*(void *)v120 != v39) {
          objc_enumerationMutation(v36);
        }
        [(GEOETARoute *)self addRouteCameraInputInfo:*(void *)(*((void *)&v119 + 1) + 8 * kk)];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v119 objects:v150 count:16];
    }
    while (v38);
  }

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v41 = *((id *)v4 + 20);
  uint64_t v42 = [v41 countByEnumeratingWithState:&v115 objects:v149 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v116;
    do
    {
      for (muint64_t m = 0; mm != v43; ++mm)
      {
        if (*(void *)v116 != v44) {
          objc_enumerationMutation(v41);
        }
        [(GEOETARoute *)self addIncidentsOnETARoute:*(void *)(*((void *)&v115 + 1) + 8 * mm)];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v115 objects:v149 count:16];
    }
    while (v43);
  }

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v46 = *((id *)v4 + 21);
  uint64_t v47 = [v46 countByEnumeratingWithState:&v111 objects:v148 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v112;
    do
    {
      for (nuint64_t n = 0; nn != v48; ++nn)
      {
        if (*(void *)v112 != v49) {
          objc_enumerationMutation(v46);
        }
        [(GEOETARoute *)self addIncidentsOnReRoutes:*(void *)(*((void *)&v111 + 1) + 8 * nn)];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v111 objects:v148 count:16];
    }
    while (v48);
  }

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v51 = *((id *)v4 + 19);
  uint64_t v52 = [v51 countByEnumeratingWithState:&v107 objects:v147 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v108;
    do
    {
      for (uint64_t i1 = 0; i1 != v53; ++i1)
      {
        if (*(void *)v108 != v54) {
          objc_enumerationMutation(v51);
        }
        [(GEOETARoute *)self addIncidentsOffReRoutes:*(void *)(*((void *)&v107 + 1) + 8 * i1)];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v107 objects:v147 count:16];
    }
    while (v53);
  }

  uint64_t v56 = [v4 incidentIndexsCount];
  if (v56)
  {
    uint64_t v57 = v56;
    for (uint64_t i2 = 0; i2 != v57; ++i2)
      -[GEOETARoute addIncidentIndex:](self, "addIncidentIndex:", [v4 incidentIndexAtIndex:i2]);
  }
  uint64_t v59 = [v4 incidentEndOffsetsInETARoutesCount];
  if (v59)
  {
    uint64_t v60 = v59;
    for (uint64_t i3 = 0; i3 != v60; ++i3)
      -[GEOETARoute addIncidentEndOffsetsInETARoute:](self, "addIncidentEndOffsetsInETARoute:", [v4 incidentEndOffsetsInETARouteAtIndex:i3]);
  }
  trafficBannerText = self->_trafficBannerText;
  uint64_t v63 = *((void *)v4 + 31);
  if (trafficBannerText)
  {
    if (v63) {
      -[GEOTrafficBannerText mergeFrom:](trafficBannerText, "mergeFrom:");
    }
  }
  else if (v63)
  {
    -[GEOETARoute setTrafficBannerText:](self, "setTrafficBannerText:");
  }
  int v64 = *((_DWORD *)v4 + 77);
  if (v64)
  {
    self->_historicTravelTime = *((_DWORD *)v4 + 71);
    *(_DWORD *)&self->_flags |= 1u;
    int v64 = *((_DWORD *)v4 + 77);
    if ((v64 & 4) == 0)
    {
LABEL_89:
      if ((v64 & 8) == 0) {
        goto LABEL_90;
      }
      goto LABEL_119;
    }
  }
  else if ((v64 & 4) == 0)
  {
    goto LABEL_89;
  }
  self->_travelTimeAggressiveEstimate = *((_DWORD *)v4 + 73);
  *(_DWORD *)&self->_flags |= 4u;
  int v64 = *((_DWORD *)v4 + 77);
  if ((v64 & 8) == 0)
  {
LABEL_90:
    if ((v64 & 0x10) == 0) {
      goto LABEL_91;
    }
    goto LABEL_120;
  }
LABEL_119:
  self->_travelTimeBestEstimate = *((_DWORD *)v4 + 74);
  *(_DWORD *)&self->_flags |= 8u;
  int v64 = *((_DWORD *)v4 + 77);
  if ((v64 & 0x10) == 0)
  {
LABEL_91:
    if ((v64 & 2) == 0) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }
LABEL_120:
  self->_travelTimeConservativeEstimate = *((_DWORD *)v4 + 75);
  *(_DWORD *)&self->_flags |= 0x10u;
  if ((*((_DWORD *)v4 + 77) & 2) != 0)
  {
LABEL_92:
    self->_staticTravelTime = *((_DWORD *)v4 + 72);
    *(_DWORD *)&self->_flags |= 2u;
  }
LABEL_93:
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v65 = *((id *)v4 + 16);
  uint64_t v66 = [v65 countByEnumeratingWithState:&v103 objects:v146 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v104;
    do
    {
      for (uint64_t i4 = 0; i4 != v67; ++i4)
      {
        if (*(void *)v104 != v68) {
          objc_enumerationMutation(v65);
        }
        [(GEOETARoute *)self addEnrouteNotice:*(void *)(*((void *)&v103 + 1) + 8 * i4)];
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v103 objects:v146 count:16];
    }
    while (v67);
  }

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v70 = *((id *)v4 + 32);
  uint64_t v71 = [v70 countByEnumeratingWithState:&v99 objects:v145 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v100;
    do
    {
      for (uint64_t i5 = 0; i5 != v72; ++i5)
      {
        if (*(void *)v100 != v73) {
          objc_enumerationMutation(v70);
        }
        [(GEOETARoute *)self addTrafficColorInfo:*(void *)(*((void *)&v99 + 1) + 8 * i5)];
      }
      uint64_t v72 = [v70 countByEnumeratingWithState:&v99 objects:v145 count:16];
    }
    while (v72);
  }

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v75 = *((id *)v4 + 18);
  uint64_t v76 = [v75 countByEnumeratingWithState:&v95 objects:v144 count:16];
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v96;
    do
    {
      for (uint64_t i6 = 0; i6 != v77; ++i6)
      {
        if (*(void *)v96 != v78) {
          objc_enumerationMutation(v75);
        }
        [(GEOETARoute *)self addIncidentOnRouteInfo:*(void *)(*((void *)&v95 + 1) + 8 * i6)];
      }
      uint64_t v77 = [v75 countByEnumeratingWithState:&v95 objects:v144 count:16];
    }
    while (v77);
  }

  originWaypointInfo = self->_originWaypointInfo;
  uint64_t v81 = *((void *)v4 + 24);
  if (originWaypointInfo)
  {
    if (v81) {
      -[GEOWaypointInfo mergeFrom:](originWaypointInfo, "mergeFrom:");
    }
  }
  else if (v81)
  {
    -[GEOETARoute setOriginWaypointInfo:](self, "setOriginWaypointInfo:");
  }
  destinationWaypointInfo = self->_destinationWaypointInfo;
  uint64_t v83 = *((void *)v4 + 15);
  if (destinationWaypointInfo)
  {
    if (v83) {
      -[GEOWaypointInfo mergeFrom:](destinationWaypointInfo, "mergeFrom:");
    }
  }
  else if (v83)
  {
    -[GEOETARoute setDestinationWaypointInfo:](self, "setDestinationWaypointInfo:");
  }
  navigabilityInfo = self->_navigabilityInfo;
  uint64_t v85 = *((void *)v4 + 23);
  if (navigabilityInfo)
  {
    if (v85) {
      -[GEONavigabilityInfo mergeFrom:](navigabilityInfo, "mergeFrom:");
    }
  }
  else if (v85)
  {
    -[GEOETARoute setNavigabilityInfo:](self, "setNavigabilityInfo:");
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v86 = *((id *)v4 + 17);
  uint64_t v87 = [v86 countByEnumeratingWithState:&v91 objects:v143 count:16];
  if (v87)
  {
    uint64_t v88 = v87;
    uint64_t v89 = *(void *)v92;
    do
    {
      for (uint64_t i7 = 0; i7 != v88; ++i7)
      {
        if (*(void *)v92 != v89) {
          objc_enumerationMutation(v86);
        }
        -[GEOETARoute addGuidanceEvent:](self, "addGuidanceEvent:", *(void *)(*((void *)&v91 + 1) + 8 * i7), (void)v91);
      }
      uint64_t v88 = [v86 countByEnumeratingWithState:&v91 objects:v143 count:16];
    }
    while (v88);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 0x40) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOETARouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1056);
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
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40000040u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOETARoute *)self readAll:0];
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    uint64_t v7 = self->_steps;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v102 objects:v116 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v103;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v103 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v102 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v102 objects:v116 count:16];
      }
      while (v9);
    }

    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    uint64_t v12 = self->_reroutedRoutes;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v98 objects:v115 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v99;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v99 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v98 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v98 objects:v115 count:16];
      }
      while (v14);
    }

    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    uint64_t v17 = self->_routeLineStyleInfos;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v94 objects:v114 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v95;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v95 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v94 + 1) + 8 * v21++) clearUnknownFields:1];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v94 objects:v114 count:16];
      }
      while (v19);
    }

    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    uint64_t v22 = self->_routeCameraInputInfos;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v90 objects:v113 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v91;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v91 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v90 + 1) + 8 * v26++) clearUnknownFields:1];
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v90 objects:v113 count:16];
      }
      while (v24);
    }

    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    uint64_t v27 = self->_incidentsOnETARoutes;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v86 objects:v112 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v87;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v87 != v30) {
            objc_enumerationMutation(v27);
          }
          [*(id *)(*((void *)&v86 + 1) + 8 * v31++) clearUnknownFields:1];
        }
        while (v29 != v31);
        uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v86 objects:v112 count:16];
      }
      while (v29);
    }

    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v32 = self->_incidentsOnReRoutes;
    uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v82 objects:v111 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v83;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v83 != v35) {
            objc_enumerationMutation(v32);
          }
          [*(id *)(*((void *)&v82 + 1) + 8 * v36++) clearUnknownFields:1];
        }
        while (v34 != v36);
        uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v82 objects:v111 count:16];
      }
      while (v34);
    }

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v37 = self->_incidentsOffReRoutes;
    uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v78 objects:v110 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v79;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v79 != v40) {
            objc_enumerationMutation(v37);
          }
          [*(id *)(*((void *)&v78 + 1) + 8 * v41++) clearUnknownFields:1];
        }
        while (v39 != v41);
        uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v78 objects:v110 count:16];
      }
      while (v39);
    }

    [(GEOTrafficBannerText *)self->_trafficBannerText clearUnknownFields:1];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v42 = self->_enrouteNotices;
    uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v74 objects:v109 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v75;
      do
      {
        uint64_t v46 = 0;
        do
        {
          if (*(void *)v75 != v45) {
            objc_enumerationMutation(v42);
          }
          [*(id *)(*((void *)&v74 + 1) + 8 * v46++) clearUnknownFields:1];
        }
        while (v44 != v46);
        uint64_t v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v74 objects:v109 count:16];
      }
      while (v44);
    }

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v47 = self->_trafficColorInfos;
    uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v70 objects:v108 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v71;
      do
      {
        uint64_t v51 = 0;
        do
        {
          if (*(void *)v71 != v50) {
            objc_enumerationMutation(v47);
          }
          [*(id *)(*((void *)&v70 + 1) + 8 * v51++) clearUnknownFields:1];
        }
        while (v49 != v51);
        uint64_t v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v70 objects:v108 count:16];
      }
      while (v49);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v52 = self->_incidentOnRouteInfos;
    uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v66 objects:v107 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v67;
      do
      {
        uint64_t v56 = 0;
        do
        {
          if (*(void *)v67 != v55) {
            objc_enumerationMutation(v52);
          }
          [*(id *)(*((void *)&v66 + 1) + 8 * v56++) clearUnknownFields:1];
        }
        while (v54 != v56);
        uint64_t v54 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v66 objects:v107 count:16];
      }
      while (v54);
    }

    [(GEOWaypointInfo *)self->_originWaypointInfo clearUnknownFields:1];
    [(GEOWaypointInfo *)self->_destinationWaypointInfo clearUnknownFields:1];
    [(GEONavigabilityInfo *)self->_navigabilityInfo clearUnknownFields:1];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v57 = self->_guidanceEvents;
    uint64_t v58 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v62 objects:v106 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v63;
      do
      {
        uint64_t v61 = 0;
        do
        {
          if (*(void *)v63 != v60) {
            objc_enumerationMutation(v57);
          }
          objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * v61++), "clearUnknownFields:", 1, (void)v62);
        }
        while (v59 != v61);
        uint64_t v59 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v62 objects:v106 count:16];
      }
      while (v59);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchPoints, 0);
  objc_storeStrong((id *)&self->_trafficColorInfos, 0);
  objc_storeStrong((id *)&self->_trafficBannerText, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_routeLineStyleInfos, 0);
  objc_storeStrong((id *)&self->_routeCameraInputInfos, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_reroutedRoutes, 0);
  objc_storeStrong((id *)&self->_pathLeg, 0);
  objc_storeStrong((id *)&self->_originWaypointInfo, 0);
  objc_storeStrong((id *)&self->_navigabilityInfo, 0);
  objc_storeStrong((id *)&self->_invalidSectionZilchPoints, 0);
  objc_storeStrong((id *)&self->_incidentsOnReRoutes, 0);
  objc_storeStrong((id *)&self->_incidentsOnETARoutes, 0);
  objc_storeStrong((id *)&self->_incidentsOffReRoutes, 0);
  objc_storeStrong((id *)&self->_incidentOnRouteInfos, 0);
  objc_storeStrong((id *)&self->_guidanceEvents, 0);
  objc_storeStrong((id *)&self->_enrouteNotices, 0);
  objc_storeStrong((id *)&self->_destinationWaypointInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end