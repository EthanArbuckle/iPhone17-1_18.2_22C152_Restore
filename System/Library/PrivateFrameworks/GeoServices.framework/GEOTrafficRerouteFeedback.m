@interface GEOTrafficRerouteFeedback
+ (BOOL)isValid:(id)a3;
+ (Class)oldRouteIncidentsType;
- (BOOL)backgrounded;
- (BOOL)hasActionType;
- (BOOL)hasAlertType;
- (BOOL)hasBackgrounded;
- (BOOL)hasBannerDurationSeconds;
- (BOOL)hasDisplayedBannerId;
- (BOOL)hasDistanceToDestination;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasOldRouteHistoricTravelTime;
- (BOOL)hasOldRouteID;
- (BOOL)hasOldRouteTravelTime;
- (BOOL)hasRerouteType;
- (BOOL)hasReroutedRouteHistoricTravelTime;
- (BOOL)hasReroutedRouteID;
- (BOOL)hasReroutedRouteTravelTime;
- (BOOL)hasResponseId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTrafficRerouteFeedback)init;
- (GEOTrafficRerouteFeedback)initWithData:(id)a3;
- (GEOTrafficRerouteFeedback)initWithDictionary:(id)a3;
- (GEOTrafficRerouteFeedback)initWithJSON:(id)a3;
- (NSData)oldRouteID;
- (NSData)reroutedRouteID;
- (NSData)responseId;
- (NSMutableArray)oldRouteIncidents;
- (NSString)displayedBannerId;
- (double)bannerDurationSeconds;
- (double)distanceToDestination;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)actionTypeAsString:(int)a3;
- (id)alertTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)oldRouteIncidentsAtIndex:(unint64_t)a3;
- (id)rerouteTypeAsString:(int)a3;
- (int)StringAsActionType:(id)a3;
- (int)StringAsAlertType:(id)a3;
- (int)StringAsRerouteType:(id)a3;
- (int)actionType;
- (int)alertType;
- (int)rerouteType;
- (unint64_t)hash;
- (unint64_t)oldRouteIncidentsCount;
- (unsigned)oldRouteHistoricTravelTime;
- (unsigned)oldRouteTravelTime;
- (unsigned)reroutedRouteHistoricTravelTime;
- (unsigned)reroutedRouteTravelTime;
- (void)_addNoFlagsOldRouteIncidents:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDisplayedBannerId;
- (void)_readOldRouteID;
- (void)_readOldRouteIncidents;
- (void)_readReroutedRouteID;
- (void)_readResponseId;
- (void)addOldRouteIncidents:(id)a3;
- (void)clearOldRouteIncidents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setActionType:(int)a3;
- (void)setAlertType:(int)a3;
- (void)setBackgrounded:(BOOL)a3;
- (void)setBannerDurationSeconds:(double)a3;
- (void)setDisplayedBannerId:(id)a3;
- (void)setDistanceToDestination:(double)a3;
- (void)setHasActionType:(BOOL)a3;
- (void)setHasAlertType:(BOOL)a3;
- (void)setHasBackgrounded:(BOOL)a3;
- (void)setHasBannerDurationSeconds:(BOOL)a3;
- (void)setHasDistanceToDestination:(BOOL)a3;
- (void)setHasOldRouteHistoricTravelTime:(BOOL)a3;
- (void)setHasOldRouteTravelTime:(BOOL)a3;
- (void)setHasRerouteType:(BOOL)a3;
- (void)setHasReroutedRouteHistoricTravelTime:(BOOL)a3;
- (void)setHasReroutedRouteTravelTime:(BOOL)a3;
- (void)setOldRouteHistoricTravelTime:(unsigned int)a3;
- (void)setOldRouteID:(id)a3;
- (void)setOldRouteIncidents:(id)a3;
- (void)setOldRouteTravelTime:(unsigned int)a3;
- (void)setRerouteType:(int)a3;
- (void)setReroutedRouteHistoricTravelTime:(unsigned int)a3;
- (void)setReroutedRouteID:(id)a3;
- (void)setReroutedRouteTravelTime:(unsigned int)a3;
- (void)setResponseId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTrafficRerouteFeedback

- (GEOTrafficRerouteFeedback)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTrafficRerouteFeedback;
  v2 = [(GEOTrafficRerouteFeedback *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTrafficRerouteFeedback)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTrafficRerouteFeedback;
  v3 = [(GEOTrafficRerouteFeedback *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)oldRouteTravelTime
{
  return self->_oldRouteTravelTime;
}

- (void)setOldRouteTravelTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8020u;
  self->_oldRouteTravelTime = a3;
}

- (void)setHasOldRouteTravelTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32736;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasOldRouteTravelTime
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (unsigned)reroutedRouteTravelTime
{
  return self->_reroutedRouteTravelTime;
}

- (void)setReroutedRouteTravelTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8100u;
  self->_reroutedRouteTravelTime = a3;
}

- (void)setHasReroutedRouteTravelTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32512;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasReroutedRouteTravelTime
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (unsigned)oldRouteHistoricTravelTime
{
  return self->_oldRouteHistoricTravelTime;
}

- (void)setOldRouteHistoricTravelTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8010u;
  self->_oldRouteHistoricTravelTime = a3;
}

- (void)setHasOldRouteHistoricTravelTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32752;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasOldRouteHistoricTravelTime
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)reroutedRouteHistoricTravelTime
{
  return self->_reroutedRouteHistoricTravelTime;
}

- (void)setReroutedRouteHistoricTravelTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8080u;
  self->_reroutedRouteHistoricTravelTime = a3;
}

- (void)setHasReroutedRouteHistoricTravelTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32640;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasReroutedRouteHistoricTravelTime
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (void)_readOldRouteIncidents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 116) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficRerouteFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOldRouteIncidents_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)oldRouteIncidents
{
  -[GEOTrafficRerouteFeedback _readOldRouteIncidents]((uint64_t)self);
  oldRouteIncidents = self->_oldRouteIncidents;

  return oldRouteIncidents;
}

- (void)setOldRouteIncidents:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  oldRouteIncidents = self->_oldRouteIncidents;
  self->_oldRouteIncidents = v4;
}

- (void)clearOldRouteIncidents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  oldRouteIncidents = self->_oldRouteIncidents;

  [(NSMutableArray *)oldRouteIncidents removeAllObjects];
}

- (void)addOldRouteIncidents:(id)a3
{
  id v4 = a3;
  -[GEOTrafficRerouteFeedback _readOldRouteIncidents]((uint64_t)self);
  -[GEOTrafficRerouteFeedback _addNoFlagsOldRouteIncidents:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsOldRouteIncidents:(uint64_t)a1
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

- (unint64_t)oldRouteIncidentsCount
{
  -[GEOTrafficRerouteFeedback _readOldRouteIncidents]((uint64_t)self);
  oldRouteIncidents = self->_oldRouteIncidents;

  return [(NSMutableArray *)oldRouteIncidents count];
}

- (id)oldRouteIncidentsAtIndex:(unint64_t)a3
{
  -[GEOTrafficRerouteFeedback _readOldRouteIncidents]((uint64_t)self);
  oldRouteIncidents = self->_oldRouteIncidents;

  return (id)[(NSMutableArray *)oldRouteIncidents objectAtIndex:a3];
}

+ (Class)oldRouteIncidentsType
{
  return (Class)objc_opt_class();
}

- (void)_readOldRouteID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 116) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficRerouteFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOldRouteID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasOldRouteID
{
  return self->_oldRouteID != 0;
}

- (NSData)oldRouteID
{
  -[GEOTrafficRerouteFeedback _readOldRouteID]((uint64_t)self);
  oldRouteID = self->_oldRouteID;

  return oldRouteID;
}

- (void)setOldRouteID:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8800u;
  objc_storeStrong((id *)&self->_oldRouteID, a3);
}

- (void)_readReroutedRouteID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 116) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficRerouteFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReroutedRouteID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasReroutedRouteID
{
  return self->_reroutedRouteID != 0;
}

- (NSData)reroutedRouteID
{
  -[GEOTrafficRerouteFeedback _readReroutedRouteID]((uint64_t)self);
  reroutedRouteID = self->_reroutedRouteID;

  return reroutedRouteID;
}

- (void)setReroutedRouteID:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA000u;
  objc_storeStrong((id *)&self->_reroutedRouteID, a3);
}

- (int)actionType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_actionType;
  }
  else {
    return 0;
  }
}

- (void)setActionType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x8004u;
  self->_actionType = a3;
}

- (void)setHasActionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32764;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasActionType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)actionTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E4BE0[a3];
  }

  return v3;
}

- (int)StringAsActionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ACTION_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ACCEPTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DISMISSED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TIMED_OUT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SHOWN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DROVE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"UP_VOTE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DOWN_VOTE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)alertType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0) {
    return self->_alertType;
  }
  else {
    return 0;
  }
}

- (void)setAlertType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x8008u;
  self->_alertType = a3;
}

- (void)setHasAlertType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32760;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasAlertType
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)alertTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E4C20[a3];
  }

  return v3;
}

- (int)StringAsAlertType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ALERT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BLOCKAGE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HEAVY_TRAFFIC_WITH_REROUTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HEAVY_TRAFFIC_NO_REROUTE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SUGGEST_NEW_ROUTE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_INCIDENT"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)backgrounded
{
  return self->_backgrounded;
}

- (void)setBackgrounded:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x8200u;
  self->_backgrounded = a3;
}

- (void)setHasBackgrounded:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32256;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasBackgrounded
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (int)rerouteType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0) {
    return self->_rerouteType;
  }
  else {
    return 0;
  }
}

- (void)setRerouteType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x8040u;
  self->_rerouteType = a3;
}

- (void)setHasRerouteType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32704;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasRerouteType
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (id)rerouteTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E4C50[a3];
  }

  return v3;
}

- (int)StringAsRerouteType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_REROUTE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LIVE_ALT_REROUTE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DODGEBALL_REROUTE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readResponseId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 116) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficRerouteFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResponseId_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasResponseId
{
  return self->_responseId != 0;
}

- (NSData)responseId
{
  -[GEOTrafficRerouteFeedback _readResponseId]((uint64_t)self);
  responseId = self->_responseId;

  return responseId;
}

- (void)setResponseId:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC000u;
  objc_storeStrong((id *)&self->_responseId, a3);
}

- (double)bannerDurationSeconds
{
  return self->_bannerDurationSeconds;
}

- (void)setBannerDurationSeconds:(double)a3
{
  *(_WORD *)&self->_flags |= 0x8001u;
  self->_bannerDurationSeconds = a3;
}

- (void)setHasBannerDurationSeconds:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0x7FFE | a3 | 0x8000;
}

- (BOOL)hasBannerDurationSeconds
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readDisplayedBannerId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 116) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficRerouteFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayedBannerId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDisplayedBannerId
{
  return self->_displayedBannerId != 0;
}

- (NSString)displayedBannerId
{
  -[GEOTrafficRerouteFeedback _readDisplayedBannerId]((uint64_t)self);
  displayedBannerId = self->_displayedBannerId;

  return displayedBannerId;
}

- (void)setDisplayedBannerId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8400u;
  objc_storeStrong((id *)&self->_displayedBannerId, a3);
}

- (double)distanceToDestination
{
  return self->_distanceToDestination;
}

- (void)setDistanceToDestination:(double)a3
{
  *(_WORD *)&self->_flags |= 0x8002u;
  self->_distanceToDestination = a3;
}

- (void)setHasDistanceToDestination:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32766;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDistanceToDestination
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTrafficRerouteFeedback;
  int v4 = [(GEOTrafficRerouteFeedback *)&v8 description];
  id v5 = [(GEOTrafficRerouteFeedback *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTrafficRerouteFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_71;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 116);
  if ((v5 & 0x20) != 0)
  {
    objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 96)];
    [v4 setObject:v6 forKey:@"oldRouteTravelTime"];

    __int16 v5 = *(_WORD *)(a1 + 116);
  }
  if ((v5 & 0x100) != 0)
  {
    v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 108)];
    [v4 setObject:v19 forKey:@"reroutedRouteTravelTime"];

    __int16 v5 = *(_WORD *)(a1 + 116);
    if ((v5 & 0x10) == 0)
    {
LABEL_6:
      if ((v5 & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_6;
  }
  v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
  [v4 setObject:v20 forKey:@"oldRouteHistoricTravelTime"];

  if ((*(_WORD *)(a1 + 116) & 0x80) != 0)
  {
LABEL_7:
    id v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 104)];
    [v4 setObject:v7 forKey:@"reroutedRouteHistoricTravelTime"];
  }
LABEL_8:
  if ([*(id *)(a1 + 48) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          v15 = [v14 dictionaryRepresentation];
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"oldRouteIncidents"];
  }
  v16 = [(id)a1 oldRouteID];
  v17 = v16;
  if (v16)
  {
    if (a2)
    {
      v18 = [v16 base64EncodedStringWithOptions:0];
      [v4 setObject:v18 forKey:@"oldRouteID"];
    }
    else
    {
      [v4 setObject:v16 forKey:@"oldRouteID"];
    }
  }

  v21 = [(id)a1 reroutedRouteID];
  v22 = v21;
  if (v21)
  {
    if (a2)
    {
      v23 = [v21 base64EncodedStringWithOptions:0];
      [v4 setObject:v23 forKey:@"reroutedRouteID"];
    }
    else
    {
      [v4 setObject:v21 forKey:@"reroutedRouteID"];
    }
  }

  __int16 v24 = *(_WORD *)(a1 + 116);
  if ((v24 & 4) != 0)
  {
    uint64_t v25 = *(int *)(a1 + 84);
    if (v25 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_1E53E4BE0[v25];
    }
    [v4 setObject:v26 forKey:@"actionType"];

    __int16 v24 = *(_WORD *)(a1 + 116);
    if ((v24 & 8) == 0)
    {
LABEL_33:
      if ((v24 & 0x200) == 0) {
        goto LABEL_34;
      }
      goto LABEL_44;
    }
  }
  else if ((v24 & 8) == 0)
  {
    goto LABEL_33;
  }
  uint64_t v27 = *(int *)(a1 + 88);
  if (v27 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 88));
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = off_1E53E4C20[v27];
  }
  [v4 setObject:v28 forKey:@"alertType"];

  __int16 v24 = *(_WORD *)(a1 + 116);
  if ((v24 & 0x200) == 0)
  {
LABEL_34:
    if ((v24 & 0x40) == 0) {
      goto LABEL_52;
    }
LABEL_45:
    uint64_t v30 = *(int *)(a1 + 100);
    if (v30 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 100));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E53E4C50[v30];
    }
    if (a2) {
      v32 = @"rerouteType";
    }
    else {
      v32 = @"reroute_type";
    }
    [v4 setObject:v31 forKey:v32];

    goto LABEL_52;
  }
LABEL_44:
  v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 112)];
  [v4 setObject:v29 forKey:@"backgrounded"];

  if ((*(_WORD *)(a1 + 116) & 0x40) != 0) {
    goto LABEL_45;
  }
LABEL_52:
  v33 = [(id)a1 responseId];
  v34 = v33;
  if (v33)
  {
    if (a2)
    {
      v35 = [v33 base64EncodedStringWithOptions:0];
      [v4 setObject:v35 forKey:@"responseId"];
    }
    else
    {
      [v4 setObject:v33 forKey:@"response_id"];
    }
  }

  if (*(_WORD *)(a1 + 116))
  {
    v36 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    if (a2) {
      v37 = @"bannerDurationSeconds";
    }
    else {
      v37 = @"banner_duration_seconds";
    }
    [v4 setObject:v36 forKey:v37];
  }
  v38 = [(id)a1 displayedBannerId];
  if (v38)
  {
    if (a2) {
      v39 = @"displayedBannerId";
    }
    else {
      v39 = @"displayed_banner_id";
    }
    [v4 setObject:v38 forKey:v39];
  }

  if ((*(_WORD *)(a1 + 116) & 2) != 0)
  {
    v40 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    if (a2) {
      v41 = @"distanceToDestination";
    }
    else {
      v41 = @"distance_to_destination";
    }
    [v4 setObject:v40 forKey:v41];
  }
LABEL_71:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTrafficRerouteFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTrafficRerouteFeedback)initWithDictionary:(id)a3
{
  return (GEOTrafficRerouteFeedback *)-[GEOTrafficRerouteFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_107;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_107;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"oldRouteTravelTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setOldRouteTravelTime:", objc_msgSend(v6, "unsignedIntValue"));
  }

  id v7 = [v5 objectForKeyedSubscript:@"reroutedRouteTravelTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setReroutedRouteTravelTime:", objc_msgSend(v7, "unsignedIntValue"));
  }

  objc_super v8 = [v5 objectForKeyedSubscript:@"oldRouteHistoricTravelTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setOldRouteHistoricTravelTime:", objc_msgSend(v8, "unsignedIntValue"));
  }

  id v9 = [v5 objectForKeyedSubscript:@"reroutedRouteHistoricTravelTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setReroutedRouteHistoricTravelTime:", objc_msgSend(v9, "unsignedIntValue"));
  }

  uint64_t v10 = [v5 objectForKeyedSubscript:@"oldRouteIncidents"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v46 = v5;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v17 = [GEORouteIncident alloc];
            if (a3) {
              uint64_t v18 = [(GEORouteIncident *)v17 initWithJSON:v16];
            }
            else {
              uint64_t v18 = [(GEORouteIncident *)v17 initWithDictionary:v16];
            }
            v19 = (void *)v18;
            [a1 addOldRouteIncidents:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v13);
    }

    id v5 = v46;
  }

  v20 = [v5 objectForKeyedSubscript:@"oldRouteID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v20 options:0];
    [a1 setOldRouteID:v21];
  }
  v22 = [v5 objectForKeyedSubscript:@"reroutedRouteID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v22 options:0];
    [a1 setReroutedRouteID:v23];
  }
  __int16 v24 = [v5 objectForKeyedSubscript:@"actionType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = v24;
    if ([v25 isEqualToString:@"UNKNOWN_ACTION_TYPE"])
    {
      uint64_t v26 = 0;
    }
    else if ([v25 isEqualToString:@"ACCEPTED"])
    {
      uint64_t v26 = 1;
    }
    else if ([v25 isEqualToString:@"DISMISSED"])
    {
      uint64_t v26 = 2;
    }
    else if ([v25 isEqualToString:@"TIMED_OUT"])
    {
      uint64_t v26 = 3;
    }
    else if ([v25 isEqualToString:@"SHOWN"])
    {
      uint64_t v26 = 4;
    }
    else if ([v25 isEqualToString:@"DROVE"])
    {
      uint64_t v26 = 5;
    }
    else if ([v25 isEqualToString:@"UP_VOTE"])
    {
      uint64_t v26 = 6;
    }
    else if ([v25 isEqualToString:@"DOWN_VOTE"])
    {
      uint64_t v26 = 7;
    }
    else
    {
      uint64_t v26 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_51;
    }
    uint64_t v26 = [v24 intValue];
  }
  [a1 setActionType:v26];
LABEL_51:

  uint64_t v27 = [v5 objectForKeyedSubscript:@"alertType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = v27;
    if ([v28 isEqualToString:@"UNKNOWN_ALERT_TYPE"])
    {
      uint64_t v29 = 0;
    }
    else if ([v28 isEqualToString:@"BLOCKAGE"])
    {
      uint64_t v29 = 1;
    }
    else if ([v28 isEqualToString:@"HEAVY_TRAFFIC_WITH_REROUTE"])
    {
      uint64_t v29 = 2;
    }
    else if ([v28 isEqualToString:@"HEAVY_TRAFFIC_NO_REROUTE"])
    {
      uint64_t v29 = 3;
    }
    else if ([v28 isEqualToString:@"SUGGEST_NEW_ROUTE"])
    {
      uint64_t v29 = 4;
    }
    else if ([v28 isEqualToString:@"TRAFFIC_INCIDENT"])
    {
      uint64_t v29 = 5;
    }
    else
    {
      uint64_t v29 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_69;
    }
    uint64_t v29 = [v27 intValue];
  }
  [a1 setAlertType:v29];
LABEL_69:

  uint64_t v30 = [v5 objectForKeyedSubscript:@"backgrounded"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBackgrounded:", objc_msgSend(v30, "BOOLValue"));
  }

  if (a3) {
    v31 = @"rerouteType";
  }
  else {
    v31 = @"reroute_type";
  }
  v32 = [v5 objectForKeyedSubscript:v31];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = v32;
    if ([v33 isEqualToString:@"UNKNOWN_REROUTE_TYPE"])
    {
      uint64_t v34 = 0;
    }
    else if ([v33 isEqualToString:@"LIVE_ALT_REROUTE"])
    {
      uint64_t v34 = 1;
    }
    else if ([v33 isEqualToString:@"DODGEBALL_REROUTE"])
    {
      uint64_t v34 = 2;
    }
    else
    {
      uint64_t v34 = 0;
    }

    goto LABEL_85;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v34 = [v32 intValue];
LABEL_85:
    [a1 setRerouteType:v34];
  }

  if (a3) {
    v35 = @"responseId";
  }
  else {
    v35 = @"response_id";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v36 options:0];
    [a1 setResponseId:v37];
  }
  if (a3) {
    v38 = @"bannerDurationSeconds";
  }
  else {
    v38 = @"banner_duration_seconds";
  }
  v39 = [v5 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v39 doubleValue];
    objc_msgSend(a1, "setBannerDurationSeconds:");
  }

  if (a3) {
    v40 = @"displayedBannerId";
  }
  else {
    v40 = @"displayed_banner_id";
  }
  v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v42 = (void *)[v41 copy];
    [a1 setDisplayedBannerId:v42];
  }
  if (a3) {
    long long v43 = @"distanceToDestination";
  }
  else {
    long long v43 = @"distance_to_destination";
  }
  long long v44 = [v5 objectForKeyedSubscript:v43];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v44 doubleValue];
    objc_msgSend(a1, "setDistanceToDestination:");
  }

LABEL_107:
  return a1;
}

- (GEOTrafficRerouteFeedback)initWithJSON:(id)a3
{
  return (GEOTrafficRerouteFeedback *)-[GEOTrafficRerouteFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_1398;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1399;
    }
    GEOTrafficRerouteFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTrafficRerouteFeedbackCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTrafficRerouteFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTrafficRerouteFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if (*(_WORD *)&self->_flags <= 0x3FFu)
    {
      uint64_t v12 = self->_reader;
      objc_sync_enter(v12);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      uint64_t v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v13];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v12);
      goto LABEL_40;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTrafficRerouteFeedback *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x100) == 0)
    {
LABEL_5:
      if ((flags & 0x10) == 0) {
        goto LABEL_6;
      }
LABEL_37:
      PBDataWriterWriteUint32Field();
      if ((*(_WORD *)&self->_flags & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x100) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_37;
  }
LABEL_6:
  if ((flags & 0x80) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_oldRouteIncidents;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if (self->_oldRouteID) {
    PBDataWriterWriteDataField();
  }
  if (self->_reroutedRouteID) {
    PBDataWriterWriteDataField();
  }
  __int16 v11 = (__int16)self->_flags;
  if ((v11 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v11 = (__int16)self->_flags;
  }
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v11 = (__int16)self->_flags;
  }
  if ((v11 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v11 = (__int16)self->_flags;
  }
  if ((v11 & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_responseId) {
    PBDataWriterWriteDataField();
  }
  if (*(_WORD *)&self->_flags) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_displayedBannerId) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
LABEL_40:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOTrafficRerouteFeedback _readOldRouteIncidents]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_oldRouteIncidents;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  __int16 v11 = (id *)a3;
  [(GEOTrafficRerouteFeedback *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 18) = self->_readerMarkPos;
  *((_DWORD *)v11 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *((_DWORD *)v11 + 24) = self->_oldRouteTravelTime;
    *((_WORD *)v11 + 58) |= 0x20u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x100) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
LABEL_32:
      *((_DWORD *)v11 + 23) = self->_oldRouteHistoricTravelTime;
      *((_WORD *)v11 + 58) |= 0x10u;
      if ((*(_WORD *)&self->_flags & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v11 + 27) = self->_reroutedRouteTravelTime;
  *((_WORD *)v11 + 58) |= 0x100u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_32;
  }
LABEL_4:
  if ((flags & 0x80) != 0)
  {
LABEL_5:
    *((_DWORD *)v11 + 26) = self->_reroutedRouteHistoricTravelTime;
    *((_WORD *)v11 + 58) |= 0x80u;
  }
LABEL_6:
  if ([(GEOTrafficRerouteFeedback *)self oldRouteIncidentsCount])
  {
    [v11 clearOldRouteIncidents];
    unint64_t v5 = [(GEOTrafficRerouteFeedback *)self oldRouteIncidentsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOTrafficRerouteFeedback *)self oldRouteIncidentsAtIndex:i];
        [v11 addOldRouteIncidents:v8];
      }
    }
  }
  if (self->_oldRouteID) {
    objc_msgSend(v11, "setOldRouteID:");
  }
  uint64_t v9 = v11;
  if (self->_reroutedRouteID)
  {
    objc_msgSend(v11, "setReroutedRouteID:");
    uint64_t v9 = v11;
  }
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 4) != 0)
  {
    *((_DWORD *)v9 + 21) = self->_actionType;
    *((_WORD *)v9 + 58) |= 4u;
    __int16 v10 = (__int16)self->_flags;
    if ((v10 & 8) == 0)
    {
LABEL_16:
      if ((v10 & 0x200) == 0) {
        goto LABEL_17;
      }
      goto LABEL_36;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v9 + 22) = self->_alertType;
  *((_WORD *)v9 + 58) |= 8u;
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 0x200) == 0)
  {
LABEL_17:
    if ((v10 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_36:
  *((unsigned char *)v9 + 112) = self->_backgrounded;
  *((_WORD *)v9 + 58) |= 0x200u;
  if ((*(_WORD *)&self->_flags & 0x40) != 0)
  {
LABEL_18:
    *((_DWORD *)v9 + 25) = self->_rerouteType;
    *((_WORD *)v9 + 58) |= 0x40u;
  }
LABEL_19:
  if (self->_responseId)
  {
    objc_msgSend(v11, "setResponseId:");
    uint64_t v9 = v11;
  }
  if (*(_WORD *)&self->_flags)
  {
    v9[2] = *(id *)&self->_bannerDurationSeconds;
    *((_WORD *)v9 + 58) |= 1u;
  }
  if (self->_displayedBannerId)
  {
    objc_msgSend(v11, "setDisplayedBannerId:");
    uint64_t v9 = v11;
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    v9[4] = *(id *)&self->_distanceToDestination;
    *((_WORD *)v9 + 58) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTrafficRerouteFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTrafficRerouteFeedback *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_oldRouteTravelTime;
    *(_WORD *)(v5 + 116) |= 0x20u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x100) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x100) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 108) = self->_reroutedRouteTravelTime;
  *(_WORD *)(v5 + 116) |= 0x100u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_8:
    if ((flags & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_29:
  *(_DWORD *)(v5 + 92) = self->_oldRouteHistoricTravelTime;
  *(_WORD *)(v5 + 116) |= 0x10u;
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 104) = self->_reroutedRouteHistoricTravelTime;
    *(_WORD *)(v5 + 116) |= 0x80u;
  }
LABEL_10:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  __int16 v10 = self->_oldRouteIncidents;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (void)v25);
        [(id)v5 addOldRouteIncidents:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(NSData *)self->_oldRouteID copyWithZone:a3];
  long long v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  uint64_t v17 = [(NSData *)self->_reroutedRouteID copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v17;

  __int16 v19 = (__int16)self->_flags;
  if ((v19 & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_actionType;
    *(_WORD *)(v5 + 116) |= 4u;
    __int16 v19 = (__int16)self->_flags;
    if ((v19 & 8) == 0)
    {
LABEL_19:
      if ((v19 & 0x200) == 0) {
        goto LABEL_20;
      }
LABEL_33:
      *(unsigned char *)(v5 + 112) = self->_backgrounded;
      *(_WORD *)(v5 + 116) |= 0x200u;
      if ((*(_WORD *)&self->_flags & 0x40) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((v19 & 8) == 0)
  {
    goto LABEL_19;
  }
  *(_DWORD *)(v5 + 88) = self->_alertType;
  *(_WORD *)(v5 + 116) |= 8u;
  __int16 v19 = (__int16)self->_flags;
  if ((v19 & 0x200) != 0) {
    goto LABEL_33;
  }
LABEL_20:
  if ((v19 & 0x40) != 0)
  {
LABEL_21:
    *(_DWORD *)(v5 + 100) = self->_rerouteType;
    *(_WORD *)(v5 + 116) |= 0x40u;
  }
LABEL_22:
  uint64_t v20 = -[NSData copyWithZone:](self->_responseId, "copyWithZone:", a3, (void)v25);
  v21 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v20;

  if (*(_WORD *)&self->_flags)
  {
    *(double *)(v5 + 16) = self->_bannerDurationSeconds;
    *(_WORD *)(v5 + 116) |= 1u;
  }
  uint64_t v22 = [(NSString *)self->_displayedBannerId copyWithZone:a3];
  v23 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v22;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(double *)(v5 + 32) = self->_distanceToDestination;
    *(_WORD *)(v5 + 116) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_67;
  }
  [(GEOTrafficRerouteFeedback *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 58);
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_oldRouteTravelTime != *((_DWORD *)v4 + 24)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x100) == 0 || self->_reroutedRouteTravelTime != *((_DWORD *)v4 + 27)) {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_oldRouteHistoricTravelTime != *((_DWORD *)v4 + 23)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_reroutedRouteHistoricTravelTime != *((_DWORD *)v4 + 26)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_67;
  }
  oldRouteIncidents = self->_oldRouteIncidents;
  if ((unint64_t)oldRouteIncidents | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](oldRouteIncidents, "isEqual:"))
  {
    goto LABEL_67;
  }
  oldRouteID = self->_oldRouteID;
  if ((unint64_t)oldRouteID | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](oldRouteID, "isEqual:")) {
      goto LABEL_67;
    }
  }
  reroutedRouteID = self->_reroutedRouteID;
  if ((unint64_t)reroutedRouteID | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](reroutedRouteID, "isEqual:")) {
      goto LABEL_67;
    }
  }
  __int16 v10 = (__int16)self->_flags;
  __int16 v11 = *((_WORD *)v4 + 58);
  if ((v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_actionType != *((_DWORD *)v4 + 21)) {
      goto LABEL_67;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_67;
  }
  if ((v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_alertType != *((_DWORD *)v4 + 22)) {
      goto LABEL_67;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x200) == 0) {
      goto LABEL_67;
    }
    if (self->_backgrounded)
    {
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_67;
      }
    }
    else if (*((unsigned char *)v4 + 112))
    {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x200) != 0)
  {
    goto LABEL_67;
  }
  if ((v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_rerouteType != *((_DWORD *)v4 + 25)) {
      goto LABEL_67;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_67;
  }
  responseId = self->_responseId;
  if ((unint64_t)responseId | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](responseId, "isEqual:")) {
      goto LABEL_67;
    }
    __int16 v10 = (__int16)self->_flags;
    __int16 v11 = *((_WORD *)v4 + 58);
  }
  if (v10)
  {
    if ((v11 & 1) == 0 || self->_bannerDurationSeconds != *((double *)v4 + 2)) {
      goto LABEL_67;
    }
  }
  else if (v11)
  {
    goto LABEL_67;
  }
  displayedBannerId = self->_displayedBannerId;
  if ((unint64_t)displayedBannerId | *((void *)v4 + 3))
  {
    if (-[NSString isEqual:](displayedBannerId, "isEqual:"))
    {
      __int16 v10 = (__int16)self->_flags;
      __int16 v11 = *((_WORD *)v4 + 58);
      goto LABEL_62;
    }
LABEL_67:
    BOOL v14 = 0;
    goto LABEL_68;
  }
LABEL_62:
  if ((v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_distanceToDestination != *((double *)v4 + 4)) {
      goto LABEL_67;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = (v11 & 2) == 0;
  }
LABEL_68:

  return v14;
}

- (unint64_t)hash
{
  [(GEOTrafficRerouteFeedback *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    uint64_t v28 = 2654435761 * self->_oldRouteTravelTime;
    if ((*(_WORD *)&self->_flags & 0x100) != 0)
    {
LABEL_3:
      uint64_t v27 = 2654435761 * self->_reroutedRouteTravelTime;
      if ((flags & 0x10) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v26 = 0;
      if ((flags & 0x80) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v28 = 0;
    if ((*(_WORD *)&self->_flags & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v27 = 0;
  if ((flags & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v26 = 2654435761 * self->_oldRouteHistoricTravelTime;
  if ((flags & 0x80) != 0)
  {
LABEL_5:
    uint64_t v25 = 2654435761 * self->_reroutedRouteHistoricTravelTime;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v25 = 0;
LABEL_10:
  uint64_t v24 = [(NSMutableArray *)self->_oldRouteIncidents hash];
  uint64_t v23 = [(NSData *)self->_oldRouteID hash];
  uint64_t v22 = [(NSData *)self->_reroutedRouteID hash];
  __int16 v4 = (__int16)self->_flags;
  if ((v4 & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_actionType;
    if ((v4 & 8) != 0)
    {
LABEL_12:
      uint64_t v6 = 2654435761 * self->_alertType;
      if ((*(_WORD *)&self->_flags & 0x200) != 0) {
        goto LABEL_13;
      }
LABEL_17:
      uint64_t v7 = 0;
      if ((v4 & 0x40) != 0) {
        goto LABEL_14;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((v4 & 8) != 0) {
      goto LABEL_12;
    }
  }
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_flags & 0x200) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  uint64_t v7 = 2654435761 * self->_backgrounded;
  if ((v4 & 0x40) != 0)
  {
LABEL_14:
    uint64_t v8 = 2654435761 * self->_rerouteType;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v8 = 0;
LABEL_19:
  uint64_t v9 = [(NSData *)self->_responseId hash];
  if (*(_WORD *)&self->_flags)
  {
    double bannerDurationSeconds = self->_bannerDurationSeconds;
    double v12 = -bannerDurationSeconds;
    if (bannerDurationSeconds >= 0.0) {
      double v12 = self->_bannerDurationSeconds;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_displayedBannerId hash];
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    double distanceToDestination = self->_distanceToDestination;
    double v18 = -distanceToDestination;
    if (distanceToDestination >= 0.0) {
      double v18 = self->_distanceToDestination;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  return v27 ^ v28 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x20) != 0)
  {
    self->_oldRouteTravelTime = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_flags |= 0x20u;
    __int16 v5 = *((_WORD *)v4 + 58);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_reroutedRouteTravelTime = *((_DWORD *)v4 + 27);
  *(_WORD *)&self->_flags |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_33:
  self->_oldRouteHistoricTravelTime = *((_DWORD *)v4 + 23);
  *(_WORD *)&self->_flags |= 0x10u;
  if ((*((_WORD *)v4 + 58) & 0x80) != 0)
  {
LABEL_5:
    self->_reroutedRouteHistoricTravelTime = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_flags |= 0x80u;
  }
LABEL_6:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *((id *)v4 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOTrafficRerouteFeedback addOldRouteIncidents:](self, "addOldRouteIncidents:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (*((void *)v4 + 5)) {
    [(GEOTrafficRerouteFeedback *)self setOldRouteID:"setOldRouteID:"];
  }
  if (*((void *)v4 + 7)) {
    [(GEOTrafficRerouteFeedback *)self setReroutedRouteID:"setReroutedRouteID:"];
  }
  __int16 v11 = *((_WORD *)v4 + 58);
  if ((v11 & 4) != 0)
  {
    self->_actionType = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 4u;
    __int16 v11 = *((_WORD *)v4 + 58);
    if ((v11 & 8) == 0)
    {
LABEL_19:
      if ((v11 & 0x200) == 0) {
        goto LABEL_20;
      }
      goto LABEL_37;
    }
  }
  else if ((v11 & 8) == 0)
  {
    goto LABEL_19;
  }
  self->_alertType = *((_DWORD *)v4 + 22);
  *(_WORD *)&self->_flags |= 8u;
  __int16 v11 = *((_WORD *)v4 + 58);
  if ((v11 & 0x200) == 0)
  {
LABEL_20:
    if ((v11 & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_37:
  self->_backgrounded = *((unsigned char *)v4 + 112);
  *(_WORD *)&self->_flags |= 0x200u;
  if ((*((_WORD *)v4 + 58) & 0x40) != 0)
  {
LABEL_21:
    self->_rerouteType = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 0x40u;
  }
LABEL_22:
  if (*((void *)v4 + 8)) {
    -[GEOTrafficRerouteFeedback setResponseId:](self, "setResponseId:");
  }
  if (*((_WORD *)v4 + 58))
  {
    self->_double bannerDurationSeconds = *((double *)v4 + 2);
    *(_WORD *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[GEOTrafficRerouteFeedback setDisplayedBannerId:](self, "setDisplayedBannerId:");
  }
  if ((*((_WORD *)v4 + 58) & 2) != 0)
  {
    self->_double distanceToDestination = *((double *)v4 + 4);
    *(_WORD *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseId, 0);
  objc_storeStrong((id *)&self->_reroutedRouteID, 0);
  objc_storeStrong((id *)&self->_oldRouteIncidents, 0);
  objc_storeStrong((id *)&self->_oldRouteID, 0);
  objc_storeStrong((id *)&self->_displayedBannerId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end