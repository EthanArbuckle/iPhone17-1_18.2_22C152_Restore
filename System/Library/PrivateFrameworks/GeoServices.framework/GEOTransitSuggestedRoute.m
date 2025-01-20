@interface GEOTransitSuggestedRoute
+ (BOOL)isValid:(id)a3;
+ (Class)routePlanningArtworkType;
+ (Class)sectionOptionType;
+ (Class)sectionType;
+ (Class)stepsType;
- (BOOL)hasAbsEndTime;
- (BOOL)hasAbsStartTime;
- (BOOL)hasAdvisoriesInfo;
- (BOOL)hasDisplayStrings;
- (BOOL)hasEngineDebugData;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasRank;
- (BOOL)hasRouteHandle;
- (BOOL)hasSupportsRouteUpdates;
- (BOOL)hasTransitIncidentMessage;
- (BOOL)hasTravelTimeAggressiveEstimate;
- (BOOL)hasTravelTimeConservativeEstimate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWalkingOnlyRoute;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsRouteUpdates;
- (GEOAdvisoriesInfo)advisoriesInfo;
- (GEOPBTransitRoutingIncidentMessage)transitIncidentMessage;
- (GEOTransitEngineDebugData)engineDebugData;
- (GEOTransitRouteDisplayStrings)displayStrings;
- (GEOTransitSuggestedRoute)init;
- (GEOTransitSuggestedRoute)initWithData:(id)a3;
- (GEOTransitSuggestedRoute)initWithDictionary:(id)a3;
- (GEOTransitSuggestedRoute)initWithJSON:(id)a3;
- (NSData)routeHandle;
- (NSMutableArray)routePlanningArtworks;
- (NSMutableArray)sectionOptions;
- (NSMutableArray)sections;
- (NSMutableArray)steps;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)nextOptionForOption:(id)a3 withRideIndex:(unint64_t)a4;
- (id)routeBadgesAsString:(int)a3;
- (id)routePlanningArtworkAtIndex:(unint64_t)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (id)sectionOptionAtIndex:(unint64_t)a3;
- (id)stepsAtIndex:(unint64_t)a3;
- (int)StringAsRouteBadges:(id)a3;
- (int)routeBadgeAtIndex:(unint64_t)a3;
- (int)routeBadges;
- (unint64_t)hash;
- (unint64_t)routeBadgesCount;
- (unint64_t)routePlanningArtworksCount;
- (unint64_t)sectionOptionsCount;
- (unint64_t)sectionsCount;
- (unint64_t)stepsCount;
- (unsigned)absEndTime;
- (unsigned)absStartTime;
- (unsigned)rank;
- (unsigned)travelTimeAggressiveEstimate;
- (unsigned)travelTimeConservativeEstimate;
- (void)_addNoFlagsRoutePlanningArtwork:(uint64_t)a1;
- (void)_addNoFlagsSection:(uint64_t)a1;
- (void)_addNoFlagsSectionOption:(uint64_t)a1;
- (void)_addNoFlagsSteps:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAdvisoriesInfo;
- (void)_readDisplayStrings;
- (void)_readEngineDebugData;
- (void)_readRouteBadges;
- (void)_readRouteHandle;
- (void)_readRoutePlanningArtworks;
- (void)_readSectionOptions;
- (void)_readSections;
- (void)_readSteps;
- (void)_readTransitIncidentMessage;
- (void)addRouteBadge:(int)a3;
- (void)addRoutePlanningArtwork:(id)a3;
- (void)addSection:(id)a3;
- (void)addSectionOption:(id)a3;
- (void)addSteps:(id)a3;
- (void)clearRouteBadges;
- (void)clearRoutePlanningArtworks;
- (void)clearSectionOptions;
- (void)clearSections;
- (void)clearSteps;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbsEndTime:(unsigned int)a3;
- (void)setAbsStartTime:(unsigned int)a3;
- (void)setAdvisoriesInfo:(id)a3;
- (void)setDisplayStrings:(id)a3;
- (void)setEngineDebugData:(id)a3;
- (void)setHasAbsEndTime:(BOOL)a3;
- (void)setHasAbsStartTime:(BOOL)a3;
- (void)setHasRank:(BOOL)a3;
- (void)setHasSupportsRouteUpdates:(BOOL)a3;
- (void)setHasTravelTimeAggressiveEstimate:(BOOL)a3;
- (void)setHasTravelTimeConservativeEstimate:(BOOL)a3;
- (void)setRank:(unsigned int)a3;
- (void)setRouteBadges:(int *)a3 count:(unint64_t)a4;
- (void)setRouteHandle:(id)a3;
- (void)setRoutePlanningArtworks:(id)a3;
- (void)setSectionOptions:(id)a3;
- (void)setSections:(id)a3;
- (void)setSteps:(id)a3;
- (void)setSupportsRouteUpdates:(BOOL)a3;
- (void)setTransitIncidentMessage:(id)a3;
- (void)setTravelTimeAggressiveEstimate:(unsigned int)a3;
- (void)setTravelTimeConservativeEstimate:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitSuggestedRoute

- (GEOTransitSuggestedRoute)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitSuggestedRoute;
  v2 = [(GEOTransitSuggestedRoute *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitSuggestedRoute)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitSuggestedRoute;
  v3 = [(GEOTransitSuggestedRoute *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEOTransitSuggestedRoute;
  [(GEOTransitSuggestedRoute *)&v3 dealloc];
}

- (unsigned)absStartTime
{
  return self->_absStartTime;
}

- (void)setAbsStartTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20002u;
  self->_absStartTime = a3;
}

- (void)setHasAbsStartTime:(BOOL)a3
{
  if (a3) {
    int v3 = 131074;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($A76889D6E2F3CF6FA600569BC086DEAC)(*(_DWORD *)&self->_flags & 0xFFFDFFFD | v3);
}

- (BOOL)hasAbsStartTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)absEndTime
{
  return self->_absEndTime;
}

- (void)setAbsEndTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20001u;
  self->_absEndTime = a3;
}

- (void)setHasAbsEndTime:(BOOL)a3
{
  self->_flags = ($A76889D6E2F3CF6FA600569BC086DEAC)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x20000);
}

- (BOOL)hasAbsEndTime
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readSteps
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSteps_tags_1920);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)steps
{
  -[GEOTransitSuggestedRoute _readSteps]((uint64_t)self);
  steps = self->_steps;

  return steps;
}

- (void)setSteps:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  steps = self->_steps;
  self->_steps = v4;
}

- (void)clearSteps
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  steps = self->_steps;

  [(NSMutableArray *)steps removeAllObjects];
}

- (void)addSteps:(id)a3
{
  id v4 = a3;
  -[GEOTransitSuggestedRoute _readSteps]((uint64_t)self);
  -[GEOTransitSuggestedRoute _addNoFlagsSteps:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (void)_addNoFlagsSteps:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      id v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)stepsCount
{
  -[GEOTransitSuggestedRoute _readSteps]((uint64_t)self);
  steps = self->_steps;

  return [(NSMutableArray *)steps count];
}

- (id)stepsAtIndex:(unint64_t)a3
{
  -[GEOTransitSuggestedRoute _readSteps]((uint64_t)self);
  steps = self->_steps;

  return (id)[(NSMutableArray *)steps objectAtIndex:a3];
}

+ (Class)stepsType
{
  return (Class)objc_opt_class();
}

- (void)_readRouteHandle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteHandle_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasRouteHandle
{
  return self->_routeHandle != 0;
}

- (NSData)routeHandle
{
  -[GEOTransitSuggestedRoute _readRouteHandle]((uint64_t)self);
  routeHandle = self->_routeHandle;

  return routeHandle;
}

- (void)setRouteHandle:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20800u;
  objc_storeStrong((id *)&self->_routeHandle, a3);
}

- (unsigned)rank
{
  return self->_rank;
}

- (void)setRank:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20004u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  if (a3) {
    int v3 = 131076;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($A76889D6E2F3CF6FA600569BC086DEAC)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasRank
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readTransitIncidentMessage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 158) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitIncidentMessage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasTransitIncidentMessage
{
  return self->_transitIncidentMessage != 0;
}

- (GEOPBTransitRoutingIncidentMessage)transitIncidentMessage
{
  -[GEOTransitSuggestedRoute _readTransitIncidentMessage]((uint64_t)self);
  transitIncidentMessage = self->_transitIncidentMessage;

  return transitIncidentMessage;
}

- (void)setTransitIncidentMessage:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x30000u;
  objc_storeStrong((id *)&self->_transitIncidentMessage, a3);
}

- (void)_readAdvisoriesInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdvisoriesInfo_tags_1921);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasAdvisoriesInfo
{
  return self->_advisoriesInfo != 0;
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  -[GEOTransitSuggestedRoute _readAdvisoriesInfo]((uint64_t)self);
  advisoriesInfo = self->_advisoriesInfo;

  return advisoriesInfo;
}

- (void)setAdvisoriesInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20100u;
  objc_storeStrong((id *)&self->_advisoriesInfo, a3);
}

- (void)_readRoutePlanningArtworks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutePlanningArtworks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)routePlanningArtworks
{
  -[GEOTransitSuggestedRoute _readRoutePlanningArtworks]((uint64_t)self);
  routePlanningArtworks = self->_routePlanningArtworks;

  return routePlanningArtworks;
}

- (void)setRoutePlanningArtworks:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  routePlanningArtworks = self->_routePlanningArtworks;
  self->_routePlanningArtworks = v4;
}

- (void)clearRoutePlanningArtworks
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  routePlanningArtworks = self->_routePlanningArtworks;

  [(NSMutableArray *)routePlanningArtworks removeAllObjects];
}

- (void)addRoutePlanningArtwork:(id)a3
{
  id v4 = a3;
  -[GEOTransitSuggestedRoute _readRoutePlanningArtworks]((uint64_t)self);
  -[GEOTransitSuggestedRoute _addNoFlagsRoutePlanningArtwork:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (void)_addNoFlagsRoutePlanningArtwork:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      id v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)routePlanningArtworksCount
{
  -[GEOTransitSuggestedRoute _readRoutePlanningArtworks]((uint64_t)self);
  routePlanningArtworks = self->_routePlanningArtworks;

  return [(NSMutableArray *)routePlanningArtworks count];
}

- (id)routePlanningArtworkAtIndex:(unint64_t)a3
{
  -[GEOTransitSuggestedRoute _readRoutePlanningArtworks]((uint64_t)self);
  routePlanningArtworks = self->_routePlanningArtworks;

  return (id)[(NSMutableArray *)routePlanningArtworks objectAtIndex:a3];
}

+ (Class)routePlanningArtworkType
{
  return (Class)objc_opt_class();
}

- (void)_readDisplayStrings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayStrings_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasDisplayStrings
{
  return self->_displayStrings != 0;
}

- (GEOTransitRouteDisplayStrings)displayStrings
{
  -[GEOTransitSuggestedRoute _readDisplayStrings]((uint64_t)self);
  displayStrings = self->_displayStrings;

  return displayStrings;
}

- (void)setDisplayStrings:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20200u;
  objc_storeStrong((id *)&self->_displayStrings, a3);
}

- (void)_readRouteBadges
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 156) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteBadges_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (unint64_t)routeBadgesCount
{
  return self->_routeBadges.count;
}

- (int)routeBadges
{
  return self->_routeBadges.list;
}

- (void)clearRouteBadges
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;

  PBRepeatedInt32Clear();
}

- (void)addRouteBadge:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (int)routeBadgeAtIndex:(unint64_t)a3
{
  -[GEOTransitSuggestedRoute _readRouteBadges]((uint64_t)self);
  p_routeBadges = &self->_routeBadges;
  unint64_t count = self->_routeBadges.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_routeBadges->list[a3];
}

- (void)setRouteBadges:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;

  MEMORY[0x1F4147390](&self->_routeBadges, a3, a4);
}

- (id)routeBadgesAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DB568[a3];
  }

  return v3;
}

- (int)StringAsRouteBadges:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ROUTE_BADGE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ROUTE_BADGE_FASTEST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ROUTE_BADGE_FEWEST_TRANSFERS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ROUTE_BADGE_LEAST_WALKING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ROUTE_BADGE_LOWEST_FARE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readSectionOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSectionOptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)sectionOptions
{
  -[GEOTransitSuggestedRoute _readSectionOptions]((uint64_t)self);
  sectionOptions = self->_sectionOptions;

  return sectionOptions;
}

- (void)setSectionOptions:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  sectionOptions = self->_sectionOptions;
  self->_sectionOptions = v4;
}

- (void)clearSectionOptions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  sectionOptions = self->_sectionOptions;

  [(NSMutableArray *)sectionOptions removeAllObjects];
}

- (void)addSectionOption:(id)a3
{
  id v4 = a3;
  -[GEOTransitSuggestedRoute _readSectionOptions]((uint64_t)self);
  -[GEOTransitSuggestedRoute _addNoFlagsSectionOption:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (void)_addNoFlagsSectionOption:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)sectionOptionsCount
{
  -[GEOTransitSuggestedRoute _readSectionOptions]((uint64_t)self);
  sectionOptions = self->_sectionOptions;

  return [(NSMutableArray *)sectionOptions count];
}

- (id)sectionOptionAtIndex:(unint64_t)a3
{
  -[GEOTransitSuggestedRoute _readSectionOptions]((uint64_t)self);
  sectionOptions = self->_sectionOptions;

  return (id)[(NSMutableArray *)sectionOptions objectAtIndex:a3];
}

+ (Class)sectionOptionType
{
  return (Class)objc_opt_class();
}

- (void)_readSections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSections_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)sections
{
  -[GEOTransitSuggestedRoute _readSections]((uint64_t)self);
  sections = self->_sections;

  return sections;
}

- (void)setSections:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  sections = self->_sections;
  self->_sections = v4;
}

- (void)clearSections
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  sections = self->_sections;

  [(NSMutableArray *)sections removeAllObjects];
}

- (void)addSection:(id)a3
{
  id v4 = a3;
  -[GEOTransitSuggestedRoute _readSections]((uint64_t)self);
  -[GEOTransitSuggestedRoute _addNoFlagsSection:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (void)_addNoFlagsSection:(uint64_t)a1
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

- (unint64_t)sectionsCount
{
  -[GEOTransitSuggestedRoute _readSections]((uint64_t)self);
  sections = self->_sections;

  return [(NSMutableArray *)sections count];
}

- (id)sectionAtIndex:(unint64_t)a3
{
  -[GEOTransitSuggestedRoute _readSections]((uint64_t)self);
  sections = self->_sections;

  return (id)[(NSMutableArray *)sections objectAtIndex:a3];
}

+ (Class)sectionType
{
  return (Class)objc_opt_class();
}

- (unsigned)travelTimeAggressiveEstimate
{
  return self->_travelTimeAggressiveEstimate;
}

- (void)setTravelTimeAggressiveEstimate:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20008u;
  self->_travelTimeAggressiveEstimate = a3;
}

- (void)setHasTravelTimeAggressiveEstimate:(BOOL)a3
{
  if (a3) {
    int v3 = 131080;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($A76889D6E2F3CF6FA600569BC086DEAC)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTravelTimeAggressiveEstimate
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)travelTimeConservativeEstimate
{
  return self->_travelTimeConservativeEstimate;
}

- (void)setTravelTimeConservativeEstimate:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20010u;
  self->_travelTimeConservativeEstimate = a3;
}

- (void)setHasTravelTimeConservativeEstimate:(BOOL)a3
{
  if (a3) {
    int v3 = 131088;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($A76889D6E2F3CF6FA600569BC086DEAC)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasTravelTimeConservativeEstimate
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)_readEngineDebugData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEngineDebugData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasEngineDebugData
{
  return self->_engineDebugData != 0;
}

- (GEOTransitEngineDebugData)engineDebugData
{
  -[GEOTransitSuggestedRoute _readEngineDebugData]((uint64_t)self);
  engineDebugData = self->_engineDebugData;

  return engineDebugData;
}

- (void)setEngineDebugData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20400u;
  objc_storeStrong((id *)&self->_engineDebugData, a3);
}

- (BOOL)supportsRouteUpdates
{
  return self->_supportsRouteUpdates;
}

- (void)setSupportsRouteUpdates:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20020u;
  self->_supportsRouteUpdates = a3;
}

- (void)setHasSupportsRouteUpdates:(BOOL)a3
{
  if (a3) {
    int v3 = 131104;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($A76889D6E2F3CF6FA600569BC086DEAC)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasSupportsRouteUpdates
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (NSString)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitSuggestedRoute;
  id v4 = [(GEOTransitSuggestedRoute *)&v8 description];
  id v5 = [(GEOTransitSuggestedRoute *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitSuggestedRoute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = &OBJC_IVAR___GEOTransitSectionOption__defaultSectionIndex;
    int v6 = *(_DWORD *)(a1 + 156);
    unint64_t v7 = 0x1E4F28000uLL;
    if ((v6 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 136)];
      if (a2) {
        v9 = @"absStartTime";
      }
      else {
        v9 = @"abs_start_time";
      }
      [v4 setObject:v8 forKey:v9];

      int v6 = *(_DWORD *)(a1 + 156);
    }
    if (v6)
    {
      v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 132)];
      if (a2) {
        v11 = @"absEndTime";
      }
      else {
        v11 = @"abs_end_time";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if ([*(id *)(a1 + 104) count])
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v13 = *(id *)(a1 + 104);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v100 objects:v107 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v101;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v101 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v100 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v12 addObject:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v100 objects:v107 count:16];
        }
        while (v15);
      }

      [v4 setObject:v12 forKey:@"steps"];
      id v5 = &OBJC_IVAR___GEOTransitSectionOption__defaultSectionIndex;
    }
    v20 = [(id)a1 routeHandle];
    v21 = v20;
    if (v20)
    {
      if (a2)
      {
        v22 = [v20 base64EncodedStringWithOptions:0];
        [v4 setObject:v22 forKey:@"routeHandle"];
      }
      else
      {
        [v4 setObject:v20 forKey:@"route_handle"];
      }
    }

    if ((*(unsigned char *)(a1 + 156) & 4) != 0)
    {
      v23 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 140)];
      [v4 setObject:v23 forKey:@"rank"];
    }
    v24 = [(id)a1 transitIncidentMessage];
    v25 = v24;
    if (v24)
    {
      if (a2)
      {
        v26 = [v24 jsonRepresentation];
        v27 = @"transitIncidentMessage";
      }
      else
      {
        v26 = [v24 dictionaryRepresentation];
        v27 = @"transit_incident_message";
      }
      [v4 setObject:v26 forKey:v27];
    }
    v28 = [(id)a1 advisoriesInfo];
    v29 = v28;
    if (v28)
    {
      if (a2)
      {
        v30 = [v28 jsonRepresentation];
        v31 = @"advisoriesInfo";
      }
      else
      {
        v30 = [v28 dictionaryRepresentation];
        v31 = @"advisories_info";
      }
      [v4 setObject:v30 forKey:v31];
    }
    if ([*(id *)(a1 + 80) count])
    {
      v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id v33 = *(id *)(a1 + 80);
      uint64_t v34 = [v33 countByEnumeratingWithState:&v96 objects:v106 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v97;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v97 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = *(void **)(*((void *)&v96 + 1) + 8 * j);
            if (a2) {
              [v38 jsonRepresentation];
            }
            else {
            v39 = [v38 dictionaryRepresentation];
            }
            [v32 addObject:v39];
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v96 objects:v106 count:16];
        }
        while (v35);
      }

      if (a2) {
        v40 = @"routePlanningArtwork";
      }
      else {
        v40 = @"route_planning_artwork";
      }
      [v4 setObject:v32 forKey:v40];

      id v5 = &OBJC_IVAR___GEOTransitSectionOption__defaultSectionIndex;
    }
    v41 = [(id)a1 displayStrings];
    v42 = v41;
    if (v41)
    {
      if (a2)
      {
        v43 = [v41 jsonRepresentation];
        v44 = @"displayStrings";
      }
      else
      {
        v43 = [v41 dictionaryRepresentation];
        v44 = @"display_strings";
      }
      [v4 setObject:v43 forKey:v44];
    }
    if (*(void *)(a1 + 32))
    {
      v45 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v46 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v47 = 0;
        do
        {
          uint64_t v48 = *(int *)(*v46 + 4 * v47);
          if (v48 >= 5)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v48);
            v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v49 = off_1E53DB568[v48];
          }
          [v45 addObject:v49];

          ++v47;
          v46 = (void *)(a1 + 24);
        }
        while (v47 < *(void *)(a1 + 32));
      }
      if (a2) {
        v50 = @"routeBadge";
      }
      else {
        v50 = @"route_badge";
      }
      [v4 setObject:v45 forKey:v50];

      unint64_t v7 = 0x1E4F28000;
      id v5 = &OBJC_IVAR___GEOTransitSectionOption__defaultSectionIndex;
    }
    if ([*(id *)(a1 + 88) count])
    {
      v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v52 = *(id *)(a1 + 88);
      uint64_t v53 = [v52 countByEnumeratingWithState:&v92 objects:v105 count:16];
      if (v53)
      {
        uint64_t v54 = v53;
        uint64_t v55 = *(void *)v93;
        do
        {
          for (uint64_t k = 0; k != v54; ++k)
          {
            if (*(void *)v93 != v55) {
              objc_enumerationMutation(v52);
            }
            v57 = *(void **)(*((void *)&v92 + 1) + 8 * k);
            if (a2) {
              [v57 jsonRepresentation];
            }
            else {
            v58 = [v57 dictionaryRepresentation];
            }
            [v51 addObject:v58];
          }
          uint64_t v54 = [v52 countByEnumeratingWithState:&v92 objects:v105 count:16];
        }
        while (v54);
      }

      if (a2) {
        v59 = @"sectionOption";
      }
      else {
        v59 = @"section_option";
      }
      [v4 setObject:v51 forKey:v59];

      unint64_t v7 = 0x1E4F28000;
    }
    if ([*(id *)(a1 + 96) count])
    {
      v60 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v61 = *(id *)(a1 + 96);
      uint64_t v62 = [v61 countByEnumeratingWithState:&v88 objects:v104 count:16];
      if (v62)
      {
        uint64_t v63 = v62;
        uint64_t v64 = *(void *)v89;
        do
        {
          for (uint64_t m = 0; m != v63; ++m)
          {
            if (*(void *)v89 != v64) {
              objc_enumerationMutation(v61);
            }
            v66 = *(void **)(*((void *)&v88 + 1) + 8 * m);
            if (a2) {
              [v66 jsonRepresentation];
            }
            else {
            v67 = [v66 dictionaryRepresentation];
            }
            [v60 addObject:v67];
          }
          uint64_t v63 = [v61 countByEnumeratingWithState:&v88 objects:v104 count:16];
        }
        while (v63);
      }

      [v4 setObject:v60 forKey:@"section"];
      unint64_t v7 = 0x1E4F28000uLL;
    }
    int v68 = *(_DWORD *)(a1 + v5[65]);
    if ((v68 & 8) != 0)
    {
      v69 = [*(id *)(v7 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 144)];
      if (a2) {
        v70 = @"travelTimeAggressiveEstimate";
      }
      else {
        v70 = @"travel_time_aggressive_estimate";
      }
      [v4 setObject:v69 forKey:v70];

      int v68 = *(_DWORD *)(a1 + 156);
    }
    if ((v68 & 0x10) != 0)
    {
      v71 = [*(id *)(v7 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 148)];
      if (a2) {
        v72 = @"travelTimeConservativeEstimate";
      }
      else {
        v72 = @"travel_time_conservative_estimate";
      }
      [v4 setObject:v71 forKey:v72];
    }
    v73 = [(id)a1 engineDebugData];
    v74 = v73;
    if (v73)
    {
      if (a2)
      {
        v75 = [v73 jsonRepresentation];
        v76 = @"engineDebugData";
      }
      else
      {
        v75 = [v73 dictionaryRepresentation];
        v76 = @"engine_debug_data";
      }
      [v4 setObject:v75 forKey:v76];
    }
    if ((*(unsigned char *)(a1 + v5[65]) & 0x20) != 0)
    {
      v77 = [*(id *)(v7 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 152)];
      if (a2) {
        v78 = @"supportsRouteUpdates";
      }
      else {
        v78 = @"supports_route_updates";
      }
      [v4 setObject:v77 forKey:v78];
    }
    v79 = *(void **)(a1 + 16);
    if (v79)
    {
      v80 = [v79 dictionaryRepresentation];
      v81 = v80;
      if (a2)
      {
        v82 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v80, "count"));
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __54__GEOTransitSuggestedRoute__dictionaryRepresentation___block_invoke;
        v86[3] = &unk_1E53D8860;
        id v83 = v82;
        id v87 = v83;
        [v81 enumerateKeysAndObjectsUsingBlock:v86];
        id v84 = v83;

        v81 = v84;
      }
      [v4 setObject:v81 forKey:@"Unknown Fields"];
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
  return -[GEOTransitSuggestedRoute _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOTransitSuggestedRoute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOTransitSuggestedRoute)initWithDictionary:(id)a3
{
  return (GEOTransitSuggestedRoute *)-[GEOTransitSuggestedRoute _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    int v6 = (void *)[a1 init];
    if (v6)
    {
      if (a3) {
        unint64_t v7 = @"absStartTime";
      }
      else {
        unint64_t v7 = @"abs_start_time";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v6, "setAbsStartTime:", objc_msgSend(v8, "unsignedIntValue"));
      }

      if (a3) {
        v9 = @"absEndTime";
      }
      else {
        v9 = @"abs_end_time";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v6, "setAbsEndTime:", objc_msgSend(v10, "unsignedIntValue"));
      }

      v11 = [v5 objectForKeyedSubscript:@"steps"];
      objc_opt_class();
      id v94 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v111 objects:v119 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v112;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v112 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v111 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v18 = [GEOTransitStep alloc];
                if (a3) {
                  uint64_t v19 = [(GEOTransitStep *)v18 initWithJSON:v17];
                }
                else {
                  uint64_t v19 = [(GEOTransitStep *)v18 initWithDictionary:v17];
                }
                v20 = (void *)v19;
                [v6 addSteps:v19];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v111 objects:v119 count:16];
          }
          while (v14);
        }

        id v5 = v94;
      }

      if (a3) {
        v21 = @"routeHandle";
      }
      else {
        v21 = @"route_handle";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v22 options:0];
        [v6 setRouteHandle:v23];
      }
      v24 = [v5 objectForKeyedSubscript:@"rank"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v6, "setRank:", objc_msgSend(v24, "unsignedIntValue"));
      }

      if (a3) {
        v25 = @"transitIncidentMessage";
      }
      else {
        v25 = @"transit_incident_message";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27 = [GEOPBTransitRoutingIncidentMessage alloc];
        if (v27) {
          v28 = (void *)-[GEOPBTransitRoutingIncidentMessage _initWithDictionary:isJSON:]((uint64_t)v27, v26, a3);
        }
        else {
          v28 = 0;
        }
        [v6 setTransitIncidentMessage:v28];
      }
      if (a3) {
        v29 = @"advisoriesInfo";
      }
      else {
        v29 = @"advisories_info";
      }
      v30 = [v5 objectForKeyedSubscript:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v31 = [GEOAdvisoriesInfo alloc];
        if (a3) {
          uint64_t v32 = [(GEOAdvisoriesInfo *)v31 initWithJSON:v30];
        }
        else {
          uint64_t v32 = [(GEOAdvisoriesInfo *)v31 initWithDictionary:v30];
        }
        id v33 = (void *)v32;
        [v6 setAdvisoriesInfo:v32];
      }
      if (a3) {
        uint64_t v34 = @"routePlanningArtwork";
      }
      else {
        uint64_t v34 = @"route_planning_artwork";
      }
      uint64_t v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        id v36 = v35;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v107 objects:v118 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v108;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v108 != v39) {
                objc_enumerationMutation(v36);
              }
              uint64_t v41 = *(void *)(*((void *)&v107 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v42 = [GEOTransitSegmentArtworkSet alloc];
                if (a3) {
                  uint64_t v43 = [(GEOTransitSegmentArtworkSet *)v42 initWithJSON:v41];
                }
                else {
                  uint64_t v43 = [(GEOTransitSegmentArtworkSet *)v42 initWithDictionary:v41];
                }
                v44 = (void *)v43;
                [v6 addRoutePlanningArtwork:v43];
              }
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v107 objects:v118 count:16];
          }
          while (v38);
        }

        id v5 = v94;
      }

      if (a3) {
        v45 = @"displayStrings";
      }
      else {
        v45 = @"display_strings";
      }
      v46 = [v5 objectForKeyedSubscript:v45];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v47 = [GEOTransitRouteDisplayStrings alloc];
        if (a3) {
          uint64_t v48 = [(GEOTransitRouteDisplayStrings *)v47 initWithJSON:v46];
        }
        else {
          uint64_t v48 = [(GEOTransitRouteDisplayStrings *)v47 initWithDictionary:v46];
        }
        v49 = (void *)v48;
        [v6 setDisplayStrings:v48];
      }
      if (a3) {
        v50 = @"routeBadge";
      }
      else {
        v50 = @"route_badge";
      }
      v51 = [v5 objectForKeyedSubscript:v50];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v93 = v51;
        id v52 = v51;
        uint64_t v53 = [v52 countByEnumeratingWithState:&v103 objects:v117 count:16];
        if (!v53) {
          goto LABEL_101;
        }
        uint64_t v54 = v53;
        uint64_t v55 = *(void *)v104;
        while (1)
        {
          for (uint64_t k = 0; k != v54; ++k)
          {
            if (*(void *)v104 != v55) {
              objc_enumerationMutation(v52);
            }
            v57 = *(void **)(*((void *)&v103 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v58 = v57;
              if ([v58 isEqualToString:@"ROUTE_BADGE_UNKNOWN"])
              {
                uint64_t v59 = 0;
              }
              else if ([v58 isEqualToString:@"ROUTE_BADGE_FASTEST"])
              {
                uint64_t v59 = 1;
              }
              else if ([v58 isEqualToString:@"ROUTE_BADGE_FEWEST_TRANSFERS"])
              {
                uint64_t v59 = 2;
              }
              else if ([v58 isEqualToString:@"ROUTE_BADGE_LEAST_WALKING"])
              {
                uint64_t v59 = 3;
              }
              else if ([v58 isEqualToString:@"ROUTE_BADGE_LOWEST_FARE"])
              {
                uint64_t v59 = 4;
              }
              else
              {
                uint64_t v59 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v59 = [v57 intValue];
            }
            objc_msgSend(v6, "addRouteBadge:", v59, v93);
          }
          uint64_t v54 = [v52 countByEnumeratingWithState:&v103 objects:v117 count:16];
          if (!v54)
          {
LABEL_101:

            v51 = v93;
            id v5 = v94;
            break;
          }
        }
      }

      if (a3) {
        v60 = @"sectionOption";
      }
      else {
        v60 = @"section_option";
      }
      id v61 = objc_msgSend(v5, "objectForKeyedSubscript:", v60, v93);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        id v62 = v61;
        uint64_t v63 = [v62 countByEnumeratingWithState:&v99 objects:v116 count:16];
        if (v63)
        {
          uint64_t v64 = v63;
          uint64_t v65 = *(void *)v100;
          do
          {
            for (uint64_t m = 0; m != v64; ++m)
            {
              if (*(void *)v100 != v65) {
                objc_enumerationMutation(v62);
              }
              uint64_t v67 = *(void *)(*((void *)&v99 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v68 = [GEOTransitSectionOption alloc];
                if (a3) {
                  uint64_t v69 = [(GEOTransitSectionOption *)v68 initWithJSON:v67];
                }
                else {
                  uint64_t v69 = [(GEOTransitSectionOption *)v68 initWithDictionary:v67];
                }
                v70 = (void *)v69;
                [v6 addSectionOption:v69];
              }
            }
            uint64_t v64 = [v62 countByEnumeratingWithState:&v99 objects:v116 count:16];
          }
          while (v64);
        }

        id v5 = v94;
      }

      v71 = [v5 objectForKeyedSubscript:@"section"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id v72 = v71;
        uint64_t v73 = [v72 countByEnumeratingWithState:&v95 objects:v115 count:16];
        if (v73)
        {
          uint64_t v74 = v73;
          uint64_t v75 = *(void *)v96;
          do
          {
            for (uint64_t n = 0; n != v74; ++n)
            {
              if (*(void *)v96 != v75) {
                objc_enumerationMutation(v72);
              }
              uint64_t v77 = *(void *)(*((void *)&v95 + 1) + 8 * n);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v78 = [GEOTransitSection alloc];
                if (a3) {
                  uint64_t v79 = [(GEOTransitSection *)v78 initWithJSON:v77];
                }
                else {
                  uint64_t v79 = [(GEOTransitSection *)v78 initWithDictionary:v77];
                }
                v80 = (void *)v79;
                [v6 addSection:v79];
              }
            }
            uint64_t v74 = [v72 countByEnumeratingWithState:&v95 objects:v115 count:16];
          }
          while (v74);
        }

        id v5 = v94;
      }

      if (a3) {
        v81 = @"travelTimeAggressiveEstimate";
      }
      else {
        v81 = @"travel_time_aggressive_estimate";
      }
      v82 = [v5 objectForKeyedSubscript:v81];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v6, "setTravelTimeAggressiveEstimate:", objc_msgSend(v82, "unsignedIntValue"));
      }

      if (a3) {
        id v83 = @"travelTimeConservativeEstimate";
      }
      else {
        id v83 = @"travel_time_conservative_estimate";
      }
      id v84 = [v5 objectForKeyedSubscript:v83];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v6, "setTravelTimeConservativeEstimate:", objc_msgSend(v84, "unsignedIntValue"));
      }

      if (a3) {
        v85 = @"engineDebugData";
      }
      else {
        v85 = @"engine_debug_data";
      }
      v86 = [v5 objectForKeyedSubscript:v85];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v87 = [GEOTransitEngineDebugData alloc];
        if (a3) {
          uint64_t v88 = [(GEOTransitEngineDebugData *)v87 initWithJSON:v86];
        }
        else {
          uint64_t v88 = [(GEOTransitEngineDebugData *)v87 initWithDictionary:v86];
        }
        long long v89 = (void *)v88;
        [v6 setEngineDebugData:v88];
      }
      if (a3) {
        long long v90 = @"supportsRouteUpdates";
      }
      else {
        long long v90 = @"supports_route_updates";
      }
      long long v91 = [v5 objectForKeyedSubscript:v90];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v6, "setSupportsRouteUpdates:", objc_msgSend(v91, "BOOLValue"));
      }
    }
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (GEOTransitSuggestedRoute)initWithJSON:(id)a3
{
  return (GEOTransitSuggestedRoute *)-[GEOTransitSuggestedRoute _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_1987;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1988;
    }
    GEOTransitSuggestedRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitSuggestedRouteCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitSuggestedRouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitSuggestedRouteReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitSuggestedRouteIsDirty((uint64_t)self) & 1) == 0)
  {
    v25 = self->_reader;
    objc_sync_enter(v25);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v26 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v26];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v25);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitSuggestedRoute *)self readAll:0];
    $A76889D6E2F3CF6FA600569BC086DEAC flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      $A76889D6E2F3CF6FA600569BC086DEAC flags = self->_flags;
    }
    if (*(unsigned char *)&flags) {
      PBDataWriterWriteUint32Field();
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    unint64_t v7 = self->_steps;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v40;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v40 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v8);
    }

    if (self->_routeHandle) {
      PBDataWriterWriteDataField();
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_transitIncidentMessage) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_advisoriesInfo) {
      PBDataWriterWriteSubmessage();
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v11 = self->_routePlanningArtworks;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v36;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v12);
    }

    if (self->_displayStrings) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_routeBadges.count)
    {
      unint64_t v15 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v15;
      }
      while (v15 < self->_routeBadges.count);
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v16 = self->_sectionOptions;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v32;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v16);
          }
          PBDataWriterWriteSubmessage();
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v44 count:16];
      }
      while (v17);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v20 = self->_sections;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v43 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v28;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v20);
          }
          PBDataWriterWriteSubmessage();
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v43 count:16];
      }
      while (v21);
    }

    $A76889D6E2F3CF6FA600569BC086DEAC v24 = self->_flags;
    if ((*(unsigned char *)&v24 & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      $A76889D6E2F3CF6FA600569BC086DEAC v24 = self->_flags;
    }
    if ((*(unsigned char *)&v24 & 0x10) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_engineDebugData) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v27);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOTransitSuggestedRoute _readAdvisoriesInfo]((uint64_t)self);
  if ([(GEOAdvisoriesInfo *)self->_advisoriesInfo hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOTransitSuggestedRoute _readSteps]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v6 = self->_steps;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v5 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v5 = 0;
LABEL_13:

  return v5;
}

- (void)copyTo:(id)a3
{
  v26 = (id *)a3;
  [(GEOTransitSuggestedRoute *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v26 + 1, self->_reader);
  *((_DWORD *)v26 + 30) = self->_readerMarkPos;
  *((_DWORD *)v26 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  $A76889D6E2F3CF6FA600569BC086DEAC flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *((_DWORD *)v26 + 34) = self->_absStartTime;
    *((_DWORD *)v26 + 39) |= 2u;
    $A76889D6E2F3CF6FA600569BC086DEAC flags = self->_flags;
  }
  if (*(unsigned char *)&flags)
  {
    *((_DWORD *)v26 + 33) = self->_absEndTime;
    *((_DWORD *)v26 + 39) |= 1u;
  }
  if ([(GEOTransitSuggestedRoute *)self stepsCount])
  {
    [v26 clearSteps];
    unint64_t v5 = [(GEOTransitSuggestedRoute *)self stepsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOTransitSuggestedRoute *)self stepsAtIndex:i];
        [v26 addSteps:v8];
      }
    }
  }
  if (self->_routeHandle) {
    objc_msgSend(v26, "setRouteHandle:");
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v26 + 35) = self->_rank;
    *((_DWORD *)v26 + 39) |= 4u;
  }
  if (self->_transitIncidentMessage) {
    objc_msgSend(v26, "setTransitIncidentMessage:");
  }
  if (self->_advisoriesInfo) {
    objc_msgSend(v26, "setAdvisoriesInfo:");
  }
  if ([(GEOTransitSuggestedRoute *)self routePlanningArtworksCount])
  {
    [v26 clearRoutePlanningArtworks];
    unint64_t v9 = [(GEOTransitSuggestedRoute *)self routePlanningArtworksCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        long long v12 = [(GEOTransitSuggestedRoute *)self routePlanningArtworkAtIndex:j];
        [v26 addRoutePlanningArtwork:v12];
      }
    }
  }
  if (self->_displayStrings) {
    objc_msgSend(v26, "setDisplayStrings:");
  }
  if ([(GEOTransitSuggestedRoute *)self routeBadgesCount])
  {
    [v26 clearRouteBadges];
    unint64_t v13 = [(GEOTransitSuggestedRoute *)self routeBadgesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
        objc_msgSend(v26, "addRouteBadge:", -[GEOTransitSuggestedRoute routeBadgeAtIndex:](self, "routeBadgeAtIndex:", k));
    }
  }
  if ([(GEOTransitSuggestedRoute *)self sectionOptionsCount])
  {
    [v26 clearSectionOptions];
    unint64_t v16 = [(GEOTransitSuggestedRoute *)self sectionOptionsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(GEOTransitSuggestedRoute *)self sectionOptionAtIndex:m];
        [v26 addSectionOption:v19];
      }
    }
  }
  if ([(GEOTransitSuggestedRoute *)self sectionsCount])
  {
    [v26 clearSections];
    unint64_t v20 = [(GEOTransitSuggestedRoute *)self sectionsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(GEOTransitSuggestedRoute *)self sectionAtIndex:n];
        [v26 addSection:v23];
      }
    }
  }
  $A76889D6E2F3CF6FA600569BC086DEAC v24 = self->_flags;
  v25 = v26;
  if ((*(unsigned char *)&v24 & 8) != 0)
  {
    *((_DWORD *)v26 + 36) = self->_travelTimeAggressiveEstimate;
    *((_DWORD *)v26 + 39) |= 8u;
    $A76889D6E2F3CF6FA600569BC086DEAC v24 = self->_flags;
  }
  if ((*(unsigned char *)&v24 & 0x10) != 0)
  {
    *((_DWORD *)v26 + 37) = self->_travelTimeConservativeEstimate;
    *((_DWORD *)v26 + 39) |= 0x10u;
  }
  if (self->_engineDebugData)
  {
    objc_msgSend(v26, "setEngineDebugData:");
    v25 = v26;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    *((unsigned char *)v25 + 152) = self->_supportsRouteUpdates;
    *((_DWORD *)v25 + 39) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
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
      GEOTransitSuggestedRouteReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_46;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitSuggestedRoute *)self readAll:0];
  $A76889D6E2F3CF6FA600569BC086DEAC flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_absStartTime;
    *(_DWORD *)(v5 + 156) |= 2u;
    $A76889D6E2F3CF6FA600569BC086DEAC flags = self->_flags;
  }
  if (*(unsigned char *)&flags)
  {
    *(_DWORD *)(v5 + 132) = self->_absEndTime;
    *(_DWORD *)(v5 + 156) |= 1u;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  unint64_t v10 = self->_steps;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v56 != v12) {
          objc_enumerationMutation(v10);
        }
        unint64_t v14 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addSteps:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(NSData *)self->_routeHandle copyWithZone:a3];
  unint64_t v16 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v15;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_rank;
    *(_DWORD *)(v5 + 156) |= 4u;
  }
  id v17 = [(GEOPBTransitRoutingIncidentMessage *)self->_transitIncidentMessage copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v17;

  id v19 = [(GEOAdvisoriesInfo *)self->_advisoriesInfo copyWithZone:a3];
  unint64_t v20 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v19;

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  unint64_t v21 = self->_routePlanningArtworks;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v52 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addRoutePlanningArtwork:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v22);
  }

  id v26 = [(GEOTransitRouteDisplayStrings *)self->_displayStrings copyWithZone:a3];
  long long v27 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v26;

  PBRepeatedInt32Copy();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v28 = self->_sectionOptions;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v48 != v30) {
          objc_enumerationMutation(v28);
        }
        long long v32 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addSectionOption:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v29);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v33 = self->_sections;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v34; ++m)
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(v33);
        }
        long long v37 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * m), "copyWithZone:", a3, (void)v43);
        [(id)v5 addSection:v37];
      }
      uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v43 objects:v59 count:16];
    }
    while (v34);
  }

  $A76889D6E2F3CF6FA600569BC086DEAC v38 = self->_flags;
  if ((*(unsigned char *)&v38 & 8) != 0)
  {
    *(_DWORD *)(v5 + 144) = self->_travelTimeAggressiveEstimate;
    *(_DWORD *)(v5 + 156) |= 8u;
    $A76889D6E2F3CF6FA600569BC086DEAC v38 = self->_flags;
  }
  if ((*(unsigned char *)&v38 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_travelTimeConservativeEstimate;
    *(_DWORD *)(v5 + 156) |= 0x10u;
  }
  id v39 = -[GEOTransitEngineDebugData copyWithZone:](self->_engineDebugData, "copyWithZone:", a3, (void)v43);
  long long v40 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v39;

  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 152) = self->_supportsRouteUpdates;
    *(_DWORD *)(v5 + 156) |= 0x20u;
  }
  long long v41 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v41;
LABEL_46:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_50;
  }
  [(GEOTransitSuggestedRoute *)self readAll:1];
  [v4 readAll:1];
  $A76889D6E2F3CF6FA600569BC086DEAC flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 39);
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_absStartTime != *((_DWORD *)v4 + 34)) {
      goto LABEL_50;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_50;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v6 & 1) == 0 || self->_absEndTime != *((_DWORD *)v4 + 33)) {
      goto LABEL_50;
    }
  }
  else if (v6)
  {
    goto LABEL_50;
  }
  steps = self->_steps;
  if ((unint64_t)steps | *((void *)v4 + 13) && !-[NSMutableArray isEqual:](steps, "isEqual:")) {
    goto LABEL_50;
  }
  routeHandle = self->_routeHandle;
  if ((unint64_t)routeHandle | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](routeHandle, "isEqual:")) {
      goto LABEL_50;
    }
  }
  int v9 = *((_DWORD *)v4 + 39);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_rank != *((_DWORD *)v4 + 35)) {
      goto LABEL_50;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_50;
  }
  transitIncidentMessage = self->_transitIncidentMessage;
  if ((unint64_t)transitIncidentMessage | *((void *)v4 + 14)
    && !-[GEOPBTransitRoutingIncidentMessage isEqual:](transitIncidentMessage, "isEqual:"))
  {
    goto LABEL_50;
  }
  advisoriesInfo = self->_advisoriesInfo;
  if ((unint64_t)advisoriesInfo | *((void *)v4 + 6))
  {
    if (!-[GEOAdvisoriesInfo isEqual:](advisoriesInfo, "isEqual:")) {
      goto LABEL_50;
    }
  }
  routePlanningArtworks = self->_routePlanningArtworks;
  if ((unint64_t)routePlanningArtworks | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](routePlanningArtworks, "isEqual:")) {
      goto LABEL_50;
    }
  }
  displayStrings = self->_displayStrings;
  if ((unint64_t)displayStrings | *((void *)v4 + 7))
  {
    if (!-[GEOTransitRouteDisplayStrings isEqual:](displayStrings, "isEqual:")) {
      goto LABEL_50;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_50;
  }
  sectionOptions = self->_sectionOptions;
  if ((unint64_t)sectionOptions | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](sectionOptions, "isEqual:")) {
      goto LABEL_50;
    }
  }
  sections = self->_sections;
  if ((unint64_t)sections | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](sections, "isEqual:")) {
      goto LABEL_50;
    }
  }
  $A76889D6E2F3CF6FA600569BC086DEAC v16 = self->_flags;
  int v17 = *((_DWORD *)v4 + 39);
  if ((*(unsigned char *)&v16 & 8) != 0)
  {
    if ((v17 & 8) == 0 || self->_travelTimeAggressiveEstimate != *((_DWORD *)v4 + 36)) {
      goto LABEL_50;
    }
  }
  else if ((v17 & 8) != 0)
  {
    goto LABEL_50;
  }
  if ((*(unsigned char *)&v16 & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0 || self->_travelTimeConservativeEstimate != *((_DWORD *)v4 + 37)) {
      goto LABEL_50;
    }
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_50;
  }
  engineDebugData = self->_engineDebugData;
  if ((unint64_t)engineDebugData | *((void *)v4 + 8))
  {
    if (!-[GEOTransitEngineDebugData isEqual:](engineDebugData, "isEqual:")) {
      goto LABEL_50;
    }
    $A76889D6E2F3CF6FA600569BC086DEAC v16 = self->_flags;
    int v17 = *((_DWORD *)v4 + 39);
  }
  if ((*(unsigned char *)&v16 & 0x20) != 0)
  {
    if ((v17 & 0x20) != 0)
    {
      if (self->_supportsRouteUpdates)
      {
        if (!*((unsigned char *)v4 + 152)) {
          goto LABEL_50;
        }
      }
      else if (*((unsigned char *)v4 + 152))
      {
        goto LABEL_50;
      }
      BOOL v19 = 1;
      goto LABEL_51;
    }
LABEL_50:
    BOOL v19 = 0;
    goto LABEL_51;
  }
  BOOL v19 = (v17 & 0x20) == 0;
LABEL_51:

  return v19;
}

- (unint64_t)hash
{
  [(GEOTransitSuggestedRoute *)self readAll:1];
  $A76889D6E2F3CF6FA600569BC086DEAC flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    uint64_t v21 = 2654435761 * self->_absStartTime;
    if (*(unsigned char *)&flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if (*(unsigned char *)&flags)
    {
LABEL_3:
      uint64_t v20 = 2654435761 * self->_absEndTime;
      goto LABEL_6;
    }
  }
  uint64_t v20 = 0;
LABEL_6:
  uint64_t v19 = [(NSMutableArray *)self->_steps hash];
  uint64_t v18 = [(NSData *)self->_routeHandle hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v17 = 2654435761 * self->_rank;
  }
  else {
    uint64_t v17 = 0;
  }
  unint64_t v16 = [(GEOPBTransitRoutingIncidentMessage *)self->_transitIncidentMessage hash];
  unint64_t v15 = [(GEOAdvisoriesInfo *)self->_advisoriesInfo hash];
  uint64_t v4 = [(NSMutableArray *)self->_routePlanningArtworks hash];
  unint64_t v5 = [(GEOTransitRouteDisplayStrings *)self->_displayStrings hash];
  uint64_t v6 = PBRepeatedInt32Hash();
  uint64_t v7 = [(NSMutableArray *)self->_sectionOptions hash];
  uint64_t v8 = [(NSMutableArray *)self->_sections hash];
  $A76889D6E2F3CF6FA600569BC086DEAC v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 8) != 0)
  {
    uint64_t v10 = 2654435761 * self->_travelTimeAggressiveEstimate;
    if ((*(unsigned char *)&v9 & 0x10) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&v9 & 0x10) != 0)
    {
LABEL_11:
      uint64_t v11 = 2654435761 * self->_travelTimeConservativeEstimate;
      goto LABEL_14;
    }
  }
  uint64_t v11 = 0;
LABEL_14:
  unint64_t v12 = [(GEOTransitEngineDebugData *)self->_engineDebugData hash];
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    uint64_t v13 = 2654435761 * self->_supportsRouteUpdates;
  }
  else {
    uint64_t v13 = 0;
  }
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 2) != 0)
  {
    self->_absStartTime = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_flags |= 2u;
    int v5 = *((_DWORD *)v4 + 39);
  }
  if (v5)
  {
    self->_absEndTime = *((_DWORD *)v4 + 33);
    *(_DWORD *)&self->_flags |= 1u;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v6 = *((id *)v4 + 13);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v51 != v9) {
          objc_enumerationMutation(v6);
        }
        [(GEOTransitSuggestedRoute *)self addSteps:*(void *)(*((void *)&v50 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v8);
  }

  if (*((void *)v4 + 9)) {
    [(GEOTransitSuggestedRoute *)self setRouteHandle:"setRouteHandle:"];
  }
  if ((*((unsigned char *)v4 + 156) & 4) != 0)
  {
    self->_ranuint64_t k = *((_DWORD *)v4 + 35);
    *(_DWORD *)&self->_flags |= 4u;
  }
  transitIncidentMessage = self->_transitIncidentMessage;
  unint64_t v12 = (void *)*((void *)v4 + 14);
  if (transitIncidentMessage)
  {
    if (v12) {
      -[GEOPBTransitRoutingIncidentMessage mergeFrom:]((uint64_t)transitIncidentMessage, v12);
    }
  }
  else if (v12)
  {
    [(GEOTransitSuggestedRoute *)self setTransitIncidentMessage:*((void *)v4 + 14)];
  }
  advisoriesInfo = self->_advisoriesInfo;
  uint64_t v14 = *((void *)v4 + 6);
  if (advisoriesInfo)
  {
    if (v14) {
      -[GEOAdvisoriesInfo mergeFrom:](advisoriesInfo, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[GEOTransitSuggestedRoute setAdvisoriesInfo:](self, "setAdvisoriesInfo:");
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v15 = *((id *)v4 + 10);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v47 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEOTransitSuggestedRoute *)self addRoutePlanningArtwork:*(void *)(*((void *)&v46 + 1) + 8 * j)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v17);
  }

  displayStrings = self->_displayStrings;
  uint64_t v21 = *((void *)v4 + 7);
  if (displayStrings)
  {
    if (v21) {
      -[GEOTransitRouteDisplayStrings mergeFrom:](displayStrings, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[GEOTransitSuggestedRoute setDisplayStrings:](self, "setDisplayStrings:");
  }
  uint64_t v22 = [v4 routeBadgesCount];
  if (v22)
  {
    uint64_t v23 = v22;
    for (uint64_t k = 0; k != v23; ++k)
      -[GEOTransitSuggestedRoute addRouteBadge:](self, "addRouteBadge:", [v4 routeBadgeAtIndex:k]);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v25 = *((id *)v4 + 11);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v43;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(v25);
        }
        [(GEOTransitSuggestedRoute *)self addSectionOption:*(void *)(*((void *)&v42 + 1) + 8 * m)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v27);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v30 = *((id *)v4 + 12);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v38 objects:v54 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v39;
    do
    {
      for (uint64_t n = 0; n != v32; ++n)
      {
        if (*(void *)v39 != v33) {
          objc_enumerationMutation(v30);
        }
        -[GEOTransitSuggestedRoute addSection:](self, "addSection:", *(void *)(*((void *)&v38 + 1) + 8 * n), (void)v38);
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v38 objects:v54 count:16];
    }
    while (v32);
  }

  int v35 = *((_DWORD *)v4 + 39);
  if ((v35 & 8) != 0)
  {
    self->_travelTimeAggressiveEstimate = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_flags |= 8u;
    int v35 = *((_DWORD *)v4 + 39);
  }
  if ((v35 & 0x10) != 0)
  {
    self->_travelTimeConservativeEstimate = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  engineDebugData = self->_engineDebugData;
  uint64_t v37 = *((void *)v4 + 8);
  if (engineDebugData)
  {
    if (v37) {
      -[GEOTransitEngineDebugData mergeFrom:](engineDebugData, "mergeFrom:");
    }
  }
  else if (v37)
  {
    -[GEOTransitSuggestedRoute setEngineDebugData:](self, "setEngineDebugData:");
  }
  if ((*((unsigned char *)v4 + 156) & 0x20) != 0)
  {
    self->_supportsRouteUpdates = *((unsigned char *)v4 + 152);
    *(_DWORD *)&self->_flags |= 0x20u;
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
      int v5 = reader;
      objc_sync_enter(v5);
      GEOTransitSuggestedRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1992);
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
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20040u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitSuggestedRoute *)self readAll:0];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v7 = self->_steps;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v9);
    }

    -[GEOPBTransitRoutingIncidentMessage clearUnknownFields:]((uint64_t)self->_transitIncidentMessage, 1);
    [(GEOAdvisoriesInfo *)self->_advisoriesInfo clearUnknownFields:1];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    unint64_t v12 = self->_routePlanningArtworks;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v14);
    }

    [(GEOTransitRouteDisplayStrings *)self->_displayStrings clearUnknownFields:1];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v17 = self->_sectionOptions;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * v21++) clearUnknownFields:1];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
      }
      while (v19);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v22 = self->_sections;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v28;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(v22);
          }
          objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v26++), "clearUnknownFields:", 1, (void)v27);
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
      }
      while (v24);
    }

    [(GEOTransitEngineDebugData *)self->_engineDebugData clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitIncidentMessage, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_sectionOptions, 0);
  objc_storeStrong((id *)&self->_routePlanningArtworks, 0);
  objc_storeStrong((id *)&self->_routeHandle, 0);
  objc_storeStrong((id *)&self->_engineDebugData, 0);
  objc_storeStrong((id *)&self->_displayStrings, 0);
  objc_storeStrong((id *)&self->_advisoriesInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a3 - 3;
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v7)
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      unint64_t v12 = NSStringFromClass(v11);
      int v23 = 138412802;
      uint64_t v24 = v12;
      __int16 v25 = 2048;
      uint64_t v26 = self;
      __int16 v27 = 2048;
      unint64_t v28 = a3;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is not compatible with protocol version %lu", (uint8_t *)&v23, 0x20u);
    }
    uint64_t v10 = (GEOTransitSuggestedRoute *)[(GEOTransitSuggestedRoute *)self copy];
    uint64_t v13 = [(GEOTransitSuggestedRoute *)v10 displayStrings];
    uint64_t v14 = [v13 planningDescription];
    migrateFormattedString(v14, a3);

    uint64_t v15 = [(GEOTransitSuggestedRoute *)v10 displayStrings];
    uint64_t v16 = [v15 duration];
    migrateFormattedString(v16, a3);

    uint64_t v17 = [(GEOTransitSuggestedRoute *)v10 displayStrings];
    uint64_t v18 = [v17 travelDescription];
    migrateFormattedString(v18, a3);

    uint64_t v19 = [(GEOTransitSuggestedRoute *)v10 displayStrings];
    uint64_t v20 = [v19 badge];
    migrateFormattedString(v20, a3);

    uint64_t v21 = [(GEOTransitSuggestedRoute *)v10 steps];
    migrateTransitSteps(v21, a3);
  }
  else
  {
    if (v7)
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      int v23 = 138412802;
      uint64_t v24 = v9;
      __int16 v25 = 2048;
      uint64_t v26 = self;
      __int16 v27 = 2048;
      unint64_t v28 = a3;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", (uint8_t *)&v23, 0x20u);
    }
    uint64_t v10 = self;
  }

  return v10;
}

- (BOOL)isWalkingOnlyRoute
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(GEOTransitSuggestedRoute *)self steps];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) segmentTypeForManeuver] == 6)
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (id)nextOptionForOption:(id)a3 withRideIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 sectionsCount] <= a4) {
    unsigned int v7 = [v6 defaultSectionIndex];
  }
  else {
    unsigned int v7 = [v6 sectionAtIndex:a4];
  }
  unsigned int v8 = v7;

  if ([(GEOTransitSuggestedRoute *)self sectionsCount] <= v8)
  {
    long long v9 = 0;
  }
  else
  {
    long long v9 = [(GEOTransitSuggestedRoute *)self sectionAtIndex:v8];
  }
  if ([v9 hasNextOptionsIndex])
  {
    long long v10 = -[GEOTransitSuggestedRoute sectionOptionAtIndex:](self, "sectionOptionAtIndex:", (int)[v9 nextOptionsIndex]);
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

@end