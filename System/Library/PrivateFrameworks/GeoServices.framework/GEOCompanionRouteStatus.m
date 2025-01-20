@interface GEOCompanionRouteStatus
+ (BOOL)isValid:(id)a3;
- (BOOL)guidancePromptsEnabled;
- (BOOL)hasAlightMessage;
- (BOOL)hasArrivedAtIntermediateWaypointInRoute:(id)a3;
- (BOOL)hasDisplayedStepID;
- (BOOL)hasDistanceRemainingOnRoute;
- (BOOL)hasDistanceToManeuver;
- (BOOL)hasDistanceToRoute;
- (BOOL)hasEffectiveDistanceToManeuver;
- (BOOL)hasEffectiveStepID;
- (BOOL)hasFeedbackType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasGuidancePromptsEnabled;
- (BOOL)hasHapticsType;
- (BOOL)hasIsConnectedToCarplay;
- (BOOL)hasIsOffline;
- (BOOL)hasLocation;
- (BOOL)hasLowGuidanceNavigation;
- (BOOL)hasRemainingTime;
- (BOOL)hasRouteID;
- (BOOL)hasRouteLocationIndex;
- (BOOL)hasRouteLocationOffset;
- (BOOL)hasRouteMatchCoordinate;
- (BOOL)hasStepID;
- (BOOL)hasTimestamp;
- (BOOL)isConnectedToCarplay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNavigating;
- (BOOL)isOffline;
- (BOOL)isRecalculating;
- (BOOL)lowGuidanceNavigation;
- (BOOL)readFrom:(id)a3;
- (GEOCompanionRouteStatus)init;
- (GEOCompanionRouteStatus)initWithData:(id)a3;
- (GEOCompanionRouteStatus)initWithDictionary:(id)a3;
- (GEOCompanionRouteStatus)initWithJSON:(id)a3;
- (GEOCompanionRouteStatus)initWithRoute:(id)a3 routeID:(id)a4;
- (GEOCompanionRouteStatus)initWithRouteID:(id)a3;
- (GEOCompanionTransitAlightMessage)alightMessage;
- (GEOLatLng)routeMatchCoordinate;
- (GEOLocation)location;
- (NSArray)selectedRideIndices;
- (NSData)routeID;
- (NSString)description;
- (double)timestamp;
- (float)routeLocationOffset;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)feedbackTypeAsString:(int)a3;
- (id)hapticsTypeAsString:(int)a3;
- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3;
- (id)jsonRepresentation;
- (int)StringAsFeedbackType:(id)a3;
- (int)StringAsHapticsType:(id)a3;
- (int)feedbackType;
- (int)hapticsType;
- (unint64_t)hash;
- (unint64_t)selectedRideIndexsCount;
- (unsigned)displayedStepID;
- (unsigned)distanceRemainingOnRoute;
- (unsigned)distanceToManeuver;
- (unsigned)distanceToRoute;
- (unsigned)effectiveDistanceToManeuver;
- (unsigned)effectiveStepID;
- (unsigned)effectiveStepIDInRoute:(id)a3;
- (unsigned)remainingTime;
- (unsigned)routeLocationIndex;
- (unsigned)selectedRideIndexAtIndex:(unint64_t)a3;
- (unsigned)selectedRideIndexs;
- (unsigned)stepID;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readAlightMessage;
- (void)_readLocation;
- (void)_readRouteID;
- (void)_readRouteMatchCoordinate;
- (void)_readSelectedRideIndexs;
- (void)_updateClusteredSectionSelectedRideIndicesFromRoute:(id)a3;
- (void)addSelectedRideIndex:(unsigned int)a3;
- (void)clearSelectedRideIndexs;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAlightMessage:(id)a3;
- (void)setDisplayedStepID:(unsigned int)a3;
- (void)setDistanceRemainingOnRoute:(unsigned int)a3;
- (void)setDistanceToManeuver:(unsigned int)a3;
- (void)setDistanceToRoute:(unsigned int)a3;
- (void)setFeedbackType:(int)a3;
- (void)setGuidancePromptsEnabled:(BOOL)a3;
- (void)setHapticsType:(int)a3;
- (void)setHasDisplayedStepID:(BOOL)a3;
- (void)setHasDistanceRemainingOnRoute:(BOOL)a3;
- (void)setHasDistanceToManeuver:(BOOL)a3;
- (void)setHasDistanceToRoute:(BOOL)a3;
- (void)setHasFeedbackType:(BOOL)a3;
- (void)setHasGuidancePromptsEnabled:(BOOL)a3;
- (void)setHasHapticsType:(BOOL)a3;
- (void)setHasIsConnectedToCarplay:(BOOL)a3;
- (void)setHasIsOffline:(BOOL)a3;
- (void)setHasLowGuidanceNavigation:(BOOL)a3;
- (void)setHasRemainingTime:(BOOL)a3;
- (void)setHasRouteLocationIndex:(BOOL)a3;
- (void)setHasRouteLocationOffset:(BOOL)a3;
- (void)setHasStepID:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsConnectedToCarplay:(BOOL)a3;
- (void)setIsOffline:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setLowGuidanceNavigation:(BOOL)a3;
- (void)setRemainingTime:(unsigned int)a3;
- (void)setRouteID:(id)a3;
- (void)setRouteLocationIndex:(unsigned int)a3;
- (void)setRouteLocationOffset:(float)a3;
- (void)setRouteMatchCoordinate:(id)a3;
- (void)setSelectedRideIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setStepID:(unsigned int)a3;
- (void)setTimestamp:(double)a3;
- (void)updateClusteredSectionSelectedRideIndicesFromRoute:(id)a3 routeID:(id)a4;
- (void)updateFeedbackWithNavigationState:(int)a3 locationUnreliable:(BOOL)a4 announcementStage:(unint64_t)a5 nextAnnouncementStage:(unint64_t)a6 nextAnnouncementTime:(double)a7;
- (void)updateWithRoute:(id)a3 routeID:(id)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOCompanionRouteStatus

- (GEOCompanionRouteStatus)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionRouteStatus;
  v2 = [(GEOCompanionRouteStatus *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionRouteStatus)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionRouteStatus;
  v3 = [(GEOCompanionRouteStatus *)&v7 initWithData:a3];
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
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOCompanionRouteStatus;
  [(GEOCompanionRouteStatus *)&v3 dealloc];
}

- (int)feedbackType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    return self->_feedbackType;
  }
  else {
    return 0;
  }
}

- (void)setFeedbackType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100020u;
  self->_feedbackType = a3;
}

- (void)setHasFeedbackType:(BOOL)a3
{
  if (a3) {
    int v3 = 1048608;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasFeedbackType
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)feedbackTypeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53DF0E0[a3];
  }

  return v3;
}

- (int)StringAsFeedbackType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NOT_NAVIGATING"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PREVIEW"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PROCEED_TO_ROUTE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ANNOUNCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONTINUE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"PREPARE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PRE_EXECUTE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"EXECUTE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RECALCULATING"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LOST_LOCATION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ARRIVED"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100400u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  if (a3) {
    int v3 = 1049600;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasStepID
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (unsigned)distanceToManeuver
{
  return self->_distanceToManeuver;
}

- (void)setDistanceToManeuver:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100008u;
  self->_distanceToManeuver = a3;
}

- (void)setHasDistanceToManeuver:(BOOL)a3
{
  if (a3) {
    int v3 = 1048584;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDistanceToManeuver
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)distanceToRoute
{
  return self->_distanceToRoute;
}

- (void)setDistanceToRoute:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100010u;
  self->_distanceToRoute = a3;
}

- (void)setHasDistanceToRoute:(BOOL)a3
{
  if (a3) {
    int v3 = 1048592;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFEFFFEF | v3);
}

- (BOOL)hasDistanceToRoute
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (unsigned)distanceRemainingOnRoute
{
  return self->_distanceRemainingOnRoute;
}

- (void)setDistanceRemainingOnRoute:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100004u;
  self->_distanceRemainingOnRoute = a3;
}

- (void)setHasDistanceRemainingOnRoute:(BOOL)a3
{
  if (a3) {
    int v3 = 1048580;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDistanceRemainingOnRoute
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100080u;
  self->_remainingTime = a3;
}

- (void)setHasRemainingTime:(BOOL)a3
{
  if (a3) {
    int v3 = 1048704;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasRemainingTime
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 138) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteStatusReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLocation)location
{
  -[GEOCompanionRouteStatus _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x120000u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (unsigned)routeLocationIndex
{
  return self->_routeLocationIndex;
}

- (void)setRouteLocationIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100100u;
  self->_routeLocationIndex = a3;
}

- (void)setHasRouteLocationIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 1048832;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasRouteLocationIndex
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (float)routeLocationOffset
{
  return self->_routeLocationOffset;
}

- (void)setRouteLocationOffset:(float)a3
{
  *(_DWORD *)&self->_flags |= 0x100200u;
  self->_routeLocationOffset = a3;
}

- (void)setHasRouteLocationOffset:(BOOL)a3
{
  if (a3) {
    int v3 = 1049088;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasRouteLocationOffset
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x100001u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x100000);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readRouteMatchCoordinate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 138) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteStatusReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteMatchCoordinate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasRouteMatchCoordinate
{
  return self->_routeMatchCoordinate != 0;
}

- (GEOLatLng)routeMatchCoordinate
{
  -[GEOCompanionRouteStatus _readRouteMatchCoordinate]((uint64_t)self);
  routeMatchCoordinate = self->_routeMatchCoordinate;

  return routeMatchCoordinate;
}

- (void)setRouteMatchCoordinate:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x180000u;
  objc_storeStrong((id *)&self->_routeMatchCoordinate, a3);
}

- (void)_readRouteID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 138) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteStatusReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteID_tags_698);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasRouteID
{
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEOCompanionRouteStatus _readRouteID]((uint64_t)self);
  routeID = self->_routeID;

  return routeID;
}

- (void)setRouteID:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x140000u;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (BOOL)guidancePromptsEnabled
{
  return self->_guidancePromptsEnabled;
}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x100800u;
  self->_guidancePromptsEnabled = a3;
}

- (void)setHasGuidancePromptsEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 1050624;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasGuidancePromptsEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readSelectedRideIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 137) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteStatusReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSelectedRideIndexs_tags_699);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
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
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;

  PBRepeatedUInt32Clear();
}

- (void)addSelectedRideIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (unsigned)selectedRideIndexAtIndex:(unint64_t)a3
{
  -[GEOCompanionRouteStatus _readSelectedRideIndexs]((uint64_t)self);
  p_selectedRideIndexs = &self->_selectedRideIndexs;
  unint64_t count = self->_selectedRideIndexs.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
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
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;

  MEMORY[0x1F4147400](&self->_selectedRideIndexs, a3, a4);
}

- (BOOL)lowGuidanceNavigation
{
  return self->_lowGuidanceNavigation;
}

- (void)setLowGuidanceNavigation:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x104000u;
  self->_lowGuidanceNavigation = a3;
}

- (void)setHasLowGuidanceNavigation:(BOOL)a3
{
  if (a3) {
    int v3 = 1064960;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasLowGuidanceNavigation
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (int)hapticsType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x40) != 0) {
    return self->_hapticsType;
  }
  else {
    return 0;
  }
}

- (void)setHapticsType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100040u;
  self->_hapticsType = a3;
}

- (void)setHasHapticsType:(BOOL)a3
{
  if (a3) {
    int v3 = 1048640;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasHapticsType
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)hapticsTypeAsString:(int)a3
{
  int v4 = @"NO_TURN";
  switch(a3)
  {
    case 0:
      goto LABEL_24;
    case 1:
      int v4 = @"LEFT_TURN";
      break;
    case 2:
      int v4 = @"RIGHT_TURN";
      break;
    case 3:
      int v4 = @"STRAIGHT_AHEAD";
      break;
    case 4:
      int v4 = @"U_TURN";
      break;
    case 5:
      int v4 = @"FOLLOW_ROAD";
      break;
    case 6:
      int v4 = @"ENTER_ROUNDABOUT";
      break;
    case 7:
      int v4 = @"EXIT_ROUNDABOUT";
      break;
    case 11:
      int v4 = @"OFF_RAMP";
      break;
    case 12:
      int v4 = @"ON_RAMP";
      break;
    case 16:
      int v4 = @"ARRIVE_END_OF_NAVIGATION";
      break;
    case 17:
      int v4 = @"START_ROUTE";
      break;
    case 18:
      int v4 = @"ARRIVE_AT_DESTINATION";
      break;
    case 20:
      int v4 = @"KEEP_LEFT";
      break;
    case 21:
      int v4 = @"KEEP_RIGHT";
      break;
    case 22:
      int v4 = @"ENTER_FERRY";
      break;
    case 23:
      int v4 = @"EXIT_FERRY";
      break;
    case 24:
      int v4 = @"CHANGE_FERRY";
      break;
    case 25:
      int v4 = @"START_ROUTE_WITH_U_TURN";
      break;
    case 26:
      int v4 = @"U_TURN_AT_ROUNDABOUT";
      break;
    case 27:
      int v4 = @"LEFT_TURN_AT_END";
      break;
    case 28:
      int v4 = @"RIGHT_TURN_AT_END";
      break;
    case 29:
      int v4 = @"HIGHWAY_OFF_RAMP_LEFT";
      break;
    case 30:
      int v4 = @"HIGHWAY_OFF_RAMP_RIGHT";
      break;
    case 33:
      int v4 = @"ARRIVE_AT_DESTINATION_LEFT";
      break;
    case 34:
      int v4 = @"ARRIVE_AT_DESTINATION_RIGHT";
      break;
    case 35:
      int v4 = @"U_TURN_WHEN_POSSIBLE";
      break;
    case 39:
      int v4 = @"ARRIVE_END_OF_DIRECTIONS";
      break;
    case 41:
      int v4 = @"ROUNDABOUT_EXIT_1";
      break;
    case 42:
      int v4 = @"ROUNDABOUT_EXIT_2";
      break;
    case 43:
      int v4 = @"ROUNDABOUT_EXIT_3";
      break;
    case 44:
      int v4 = @"ROUNDABOUT_EXIT_4";
      break;
    case 45:
      int v4 = @"ROUNDABOUT_EXIT_5";
      break;
    case 46:
      int v4 = @"ROUNDABOUT_EXIT_6";
      break;
    case 47:
      int v4 = @"ROUNDABOUT_EXIT_7";
      break;
    case 48:
      int v4 = @"ROUNDABOUT_EXIT_8";
      break;
    case 49:
      int v4 = @"ROUNDABOUT_EXIT_9";
      break;
    case 50:
      int v4 = @"ROUNDABOUT_EXIT_10";
      break;
    case 51:
      int v4 = @"ROUNDABOUT_EXIT_11";
      break;
    case 52:
      int v4 = @"ROUNDABOUT_EXIT_12";
      break;
    case 53:
      int v4 = @"ROUNDABOUT_EXIT_13";
      break;
    case 54:
      int v4 = @"ROUNDABOUT_EXIT_14";
      break;
    case 55:
      int v4 = @"ROUNDABOUT_EXIT_15";
      break;
    case 56:
      int v4 = @"ROUNDABOUT_EXIT_16";
      break;
    case 57:
      int v4 = @"ROUNDABOUT_EXIT_17";
      break;
    case 58:
      int v4 = @"ROUNDABOUT_EXIT_18";
      break;
    case 59:
      int v4 = @"ROUNDABOUT_EXIT_19";
      break;
    case 60:
      int v4 = @"SHARP_LEFT_TURN";
      break;
    case 61:
      int v4 = @"SHARP_RIGHT_TURN";
      break;
    case 62:
      int v4 = @"SLIGHT_LEFT_TURN";
      break;
    case 63:
      int v4 = @"SLIGHT_RIGHT_TURN";
      break;
    case 64:
      int v4 = @"CHANGE_HIGHWAY";
      break;
    case 65:
      int v4 = @"CHANGE_HIGHWAY_LEFT";
      break;
    case 66:
      int v4 = @"CHANGE_HIGHWAY_RIGHT";
      break;
    case 80:
      int v4 = @"TOLL_STATION";
      break;
    case 81:
      int v4 = @"ENTER_TUNNEL";
      break;
    case 82:
      int v4 = @"WAYPOINT_STOP";
      break;
    case 83:
      int v4 = @"WAYPOINT_STOP_LEFT";
      break;
    case 84:
      int v4 = @"WAYPOINT_STOP_RIGHT";
      break;
    case 85:
      int v4 = @"RESUME_ROUTE";
      break;
    case 86:
      int v4 = @"RESUME_ROUTE_WITH_U_TURN";
      break;
    case 87:
      int v4 = @"CUSTOM";
      break;
    case 88:
      int v4 = @"TURN_AROUND";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_24:
      break;
  }
  return v4;
}

- (int)StringAsHapticsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_TURN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LEFT_TURN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RIGHT_TURN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"STRAIGHT_AHEAD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"U_TURN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FOLLOW_ROAD"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ENTER_ROUNDABOUT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"EXIT_ROUNDABOUT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"OFF_RAMP"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ON_RAMP"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ARRIVE_END_OF_NAVIGATION"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"START_ROUTE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ARRIVE_AT_DESTINATION"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"KEEP_LEFT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"KEEP_RIGHT"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ENTER_FERRY"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"EXIT_FERRY"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"CHANGE_FERRY"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"START_ROUTE_WITH_U_TURN"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"U_TURN_AT_ROUNDABOUT"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"LEFT_TURN_AT_END"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"RIGHT_TURN_AT_END"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"HIGHWAY_OFF_RAMP_LEFT"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"HIGHWAY_OFF_RAMP_RIGHT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"ARRIVE_AT_DESTINATION_LEFT"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"ARRIVE_AT_DESTINATION_RIGHT"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"U_TURN_WHEN_POSSIBLE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"ARRIVE_END_OF_DIRECTIONS"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_1"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_2"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_3"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_4"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_5"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_6"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_7"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_8"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_9"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_10"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_11"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_12"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_13"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_14"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_15"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_16"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_17"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_18"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_19"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"SHARP_LEFT_TURN"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"SHARP_RIGHT_TURN"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"SLIGHT_LEFT_TURN"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"SLIGHT_RIGHT_TURN"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"CHANGE_HIGHWAY"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"CHANGE_HIGHWAY_LEFT"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"CHANGE_HIGHWAY_RIGHT"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"TOLL_STATION"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"ENTER_TUNNEL"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_STOP"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_STOP_LEFT"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_STOP_RIGHT"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"RESUME_ROUTE"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"RESUME_ROUTE_WITH_U_TURN"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"CUSTOM"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"TURN_AROUND"])
  {
    int v4 = 88;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isConnectedToCarplay
{
  return self->_isConnectedToCarplay;
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x101000u;
  self->_isConnectedToCarplay = a3;
}

- (void)setHasIsConnectedToCarplay:(BOOL)a3
{
  if (a3) {
    int v3 = 1052672;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsConnectedToCarplay
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (void)_readAlightMessage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 138) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteStatusReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlightMessage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasAlightMessage
{
  return self->_alightMessage != 0;
}

- (GEOCompanionTransitAlightMessage)alightMessage
{
  -[GEOCompanionRouteStatus _readAlightMessage]((uint64_t)self);
  alightMessage = self->_alightMessage;

  return alightMessage;
}

- (void)setAlightMessage:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x110000u;
  objc_storeStrong((id *)&self->_alightMessage, a3);
}

- (BOOL)isOffline
{
  return self->_isOffline;
}

- (void)setIsOffline:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x102000u;
  self->_isOffline = a3;
}

- (void)setHasIsOffline:(BOOL)a3
{
  if (a3) {
    int v3 = 1056768;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsOffline
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (unsigned)displayedStepID
{
  return self->_displayedStepID;
}

- (void)setDisplayedStepID:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100002u;
  self->_displayedStepID = a3;
}

- (void)setHasDisplayedStepID:(BOOL)a3
{
  if (a3) {
    int v3 = 1048578;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$AD490B0E691E6F105FFA9F0D440E4C82 flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasDisplayedStepID
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (NSString)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCompanionRouteStatus;
  int v4 = [(GEOCompanionRouteStatus *)&v8 description];
  v5 = [(GEOCompanionRouteStatus *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionRouteStatus _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_59;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x20) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 108);
    if (v6 >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 108));
      objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v7 = off_1E53DF0E0[v6];
    }
    [v4 setObject:v7 forKey:@"feedbackType"];

    int v5 = *(_DWORD *)(a1 + 136);
  }
  if ((v5 & 0x400) != 0)
  {
    v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 128)];
    [v4 setObject:v11 forKey:@"stepID"];

    int v5 = *(_DWORD *)(a1 + 136);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 100)];
  [v4 setObject:v12 forKey:@"distanceToManeuver"];

  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 104)];
  [v4 setObject:v13 forKey:@"distanceToRoute"];

  int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_19:
  v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 96)];
  [v4 setObject:v14 forKey:@"distanceRemainingOnRoute"];

  if ((*(_DWORD *)(a1 + 136) & 0x80) != 0)
  {
LABEL_12:
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 116)];
    [v4 setObject:v8 forKey:@"remainingTime"];
  }
LABEL_13:
  v9 = [(id)a1 location];
  v10 = v9;
  if (v9)
  {
    if (a2) {
      [v9 jsonRepresentation];
    }
    else {
    v15 = [v9 dictionaryRepresentation];
    }
    [v4 setObject:v15 forKey:@"location"];
  }
  int v17 = *(_DWORD *)(a1 + 136);
  if ((v17 & 0x100) != 0)
  {
    v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 120)];
    [v4 setObject:v21 forKey:@"routeLocationIndex"];

    int v17 = *(_DWORD *)(a1 + 136);
    if ((v17 & 0x200) == 0)
    {
LABEL_25:
      if ((v17 & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((v17 & 0x200) == 0)
  {
    goto LABEL_25;
  }
  LODWORD(v16) = *(_DWORD *)(a1 + 124);
  v22 = [NSNumber numberWithFloat:v16];
  [v4 setObject:v22 forKey:@"routeLocationOffset"];

  if (*(_DWORD *)(a1 + 136))
  {
LABEL_26:
    v18 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
    [v4 setObject:v18 forKey:@"timestamp"];
  }
LABEL_27:
  v19 = [(id)a1 routeMatchCoordinate];
  v20 = v19;
  if (v19)
  {
    if (a2) {
      [v19 jsonRepresentation];
    }
    else {
    v23 = [v19 dictionaryRepresentation];
    }
    [v4 setObject:v23 forKey:@"routeMatchCoordinate"];
  }
  v24 = [(id)a1 routeID];
  v25 = v24;
  if (v24)
  {
    if (a2)
    {
      v26 = [v24 base64EncodedStringWithOptions:0];
      [v4 setObject:v26 forKey:@"routeID"];
    }
    else
    {
      [v4 setObject:v24 forKey:@"routeID"];
    }
  }

  if ((*(unsigned char *)(a1 + 137) & 8) != 0)
  {
    v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 132)];
    [v4 setObject:v27 forKey:@"guidancePromptsEnabled"];
  }
  if (*(void *)(a1 + 24))
  {
    v28 = PBRepeatedUInt32NSArray();
    [v4 setObject:v28 forKey:@"selectedRideIndex"];
  }
  int v29 = *(_DWORD *)(a1 + 136);
  if ((v29 & 0x4000) == 0)
  {
    if ((v29 & 0x40) == 0) {
      goto LABEL_45;
    }
LABEL_51:
    v34 = @"NO_TURN";
    switch(*(_DWORD *)(a1 + 112))
    {
      case 0:
        break;
      case 1:
        v34 = @"LEFT_TURN";
        break;
      case 2:
        v34 = @"RIGHT_TURN";
        break;
      case 3:
        v34 = @"STRAIGHT_AHEAD";
        break;
      case 4:
        v34 = @"U_TURN";
        break;
      case 5:
        v34 = @"FOLLOW_ROAD";
        break;
      case 6:
        v34 = @"ENTER_ROUNDABOUT";
        break;
      case 7:
        v34 = @"EXIT_ROUNDABOUT";
        break;
      case 0xB:
        v34 = @"OFF_RAMP";
        break;
      case 0xC:
        v34 = @"ON_RAMP";
        break;
      case 0x10:
        v34 = @"ARRIVE_END_OF_NAVIGATION";
        break;
      case 0x11:
        v34 = @"START_ROUTE";
        break;
      case 0x12:
        v34 = @"ARRIVE_AT_DESTINATION";
        break;
      case 0x14:
        v34 = @"KEEP_LEFT";
        break;
      case 0x15:
        v34 = @"KEEP_RIGHT";
        break;
      case 0x16:
        v34 = @"ENTER_FERRY";
        break;
      case 0x17:
        v34 = @"EXIT_FERRY";
        break;
      case 0x18:
        v34 = @"CHANGE_FERRY";
        break;
      case 0x19:
        v34 = @"START_ROUTE_WITH_U_TURN";
        break;
      case 0x1A:
        v34 = @"U_TURN_AT_ROUNDABOUT";
        break;
      case 0x1B:
        v34 = @"LEFT_TURN_AT_END";
        break;
      case 0x1C:
        v34 = @"RIGHT_TURN_AT_END";
        break;
      case 0x1D:
        v34 = @"HIGHWAY_OFF_RAMP_LEFT";
        break;
      case 0x1E:
        v34 = @"HIGHWAY_OFF_RAMP_RIGHT";
        break;
      case 0x21:
        v34 = @"ARRIVE_AT_DESTINATION_LEFT";
        break;
      case 0x22:
        v34 = @"ARRIVE_AT_DESTINATION_RIGHT";
        break;
      case 0x23:
        v34 = @"U_TURN_WHEN_POSSIBLE";
        break;
      case 0x27:
        v34 = @"ARRIVE_END_OF_DIRECTIONS";
        break;
      case 0x29:
        v34 = @"ROUNDABOUT_EXIT_1";
        break;
      case 0x2A:
        v34 = @"ROUNDABOUT_EXIT_2";
        break;
      case 0x2B:
        v34 = @"ROUNDABOUT_EXIT_3";
        break;
      case 0x2C:
        v34 = @"ROUNDABOUT_EXIT_4";
        break;
      case 0x2D:
        v34 = @"ROUNDABOUT_EXIT_5";
        break;
      case 0x2E:
        v34 = @"ROUNDABOUT_EXIT_6";
        break;
      case 0x2F:
        v34 = @"ROUNDABOUT_EXIT_7";
        break;
      case 0x30:
        v34 = @"ROUNDABOUT_EXIT_8";
        break;
      case 0x31:
        v34 = @"ROUNDABOUT_EXIT_9";
        break;
      case 0x32:
        v34 = @"ROUNDABOUT_EXIT_10";
        break;
      case 0x33:
        v34 = @"ROUNDABOUT_EXIT_11";
        break;
      case 0x34:
        v34 = @"ROUNDABOUT_EXIT_12";
        break;
      case 0x35:
        v34 = @"ROUNDABOUT_EXIT_13";
        break;
      case 0x36:
        v34 = @"ROUNDABOUT_EXIT_14";
        break;
      case 0x37:
        v34 = @"ROUNDABOUT_EXIT_15";
        break;
      case 0x38:
        v34 = @"ROUNDABOUT_EXIT_16";
        break;
      case 0x39:
        v34 = @"ROUNDABOUT_EXIT_17";
        break;
      case 0x3A:
        v34 = @"ROUNDABOUT_EXIT_18";
        break;
      case 0x3B:
        v34 = @"ROUNDABOUT_EXIT_19";
        break;
      case 0x3C:
        v34 = @"SHARP_LEFT_TURN";
        break;
      case 0x3D:
        v34 = @"SHARP_RIGHT_TURN";
        break;
      case 0x3E:
        v34 = @"SLIGHT_LEFT_TURN";
        break;
      case 0x3F:
        v34 = @"SLIGHT_RIGHT_TURN";
        break;
      case 0x40:
        v34 = @"CHANGE_HIGHWAY";
        break;
      case 0x41:
        v34 = @"CHANGE_HIGHWAY_LEFT";
        break;
      case 0x42:
        v34 = @"CHANGE_HIGHWAY_RIGHT";
        break;
      case 0x50:
        v34 = @"TOLL_STATION";
        break;
      case 0x51:
        v34 = @"ENTER_TUNNEL";
        break;
      case 0x52:
        v34 = @"WAYPOINT_STOP";
        break;
      case 0x53:
        v34 = @"WAYPOINT_STOP_LEFT";
        break;
      case 0x54:
        v34 = @"WAYPOINT_STOP_RIGHT";
        break;
      case 0x55:
        v34 = @"RESUME_ROUTE";
        break;
      case 0x56:
        v34 = @"RESUME_ROUTE_WITH_U_TURN";
        break;
      case 0x57:
        v34 = @"CUSTOM";
        break;
      case 0x58:
        v34 = @"TURN_AROUND";
        break;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 112));
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    [v4 setObject:v34 forKey:@"hapticsType"];

    if ((*(_DWORD *)(a1 + 136) & 0x1000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  v33 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 135)];
  [v4 setObject:v33 forKey:@"lowGuidanceNavigation"];

  int v29 = *(_DWORD *)(a1 + 136);
  if ((v29 & 0x40) != 0) {
    goto LABEL_51;
  }
LABEL_45:
  if ((v29 & 0x1000) != 0)
  {
LABEL_46:
    v30 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 133)];
    [v4 setObject:v30 forKey:@"isConnectedToCarplay"];
  }
LABEL_47:
  v31 = [(id)a1 alightMessage];
  v32 = v31;
  if (v31)
  {
    if (a2) {
      [v31 jsonRepresentation];
    }
    else {
    v35 = [v31 dictionaryRepresentation];
    }
    [v4 setObject:v35 forKey:@"alightMessage"];
  }
  int v36 = *(_DWORD *)(a1 + 136);
  if ((v36 & 0x2000) != 0)
  {
    v37 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 134)];
    [v4 setObject:v37 forKey:@"isOffline"];

    int v36 = *(_DWORD *)(a1 + 136);
  }
  if ((v36 & 2) != 0)
  {
    v38 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
    [v4 setObject:v38 forKey:@"displayedStepID"];
  }
LABEL_59:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCompanionRouteStatus _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionRouteStatus)initWithDictionary:(id)a3
{
  return (GEOCompanionRouteStatus *)-[GEOCompanionRouteStatus _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_218;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_218;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"feedbackType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"NOT_NAVIGATING"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"PREVIEW"])
    {
      uint64_t v8 = 8;
    }
    else if ([v7 isEqualToString:@"PROCEED_TO_ROUTE"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"ANNOUNCE"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"CONTINUE"])
    {
      uint64_t v8 = 10;
    }
    else if ([v7 isEqualToString:@"PREPARE"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"PRE_EXECUTE"])
    {
      uint64_t v8 = 9;
    }
    else if ([v7 isEqualToString:@"EXECUTE"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"RECALCULATING"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"LOST_LOCATION"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"ARRIVED"])
    {
      uint64_t v8 = 7;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_31;
    }
    uint64_t v8 = [v6 intValue];
  }
  [a1 setFeedbackType:v8];
LABEL_31:

  v9 = [v5 objectForKeyedSubscript:@"stepID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStepID:", objc_msgSend(v9, "unsignedIntValue"));
  }

  v10 = [v5 objectForKeyedSubscript:@"distanceToManeuver"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDistanceToManeuver:", objc_msgSend(v10, "unsignedIntValue"));
  }

  v11 = [v5 objectForKeyedSubscript:@"distanceToRoute"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDistanceToRoute:", objc_msgSend(v11, "unsignedIntValue"));
  }

  v12 = [v5 objectForKeyedSubscript:@"distanceRemainingOnRoute"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDistanceRemainingOnRoute:", objc_msgSend(v12, "unsignedIntValue"));
  }

  v13 = [v5 objectForKeyedSubscript:@"remainingTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRemainingTime:", objc_msgSend(v13, "unsignedIntValue"));
  }

  v14 = [v5 objectForKeyedSubscript:@"location"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [GEOLocation alloc];
    if (a3) {
      uint64_t v16 = [(GEOLocation *)v15 initWithJSON:v14];
    }
    else {
      uint64_t v16 = [(GEOLocation *)v15 initWithDictionary:v14];
    }
    int v17 = (void *)v16;
    [a1 setLocation:v16];
  }
  v18 = [v5 objectForKeyedSubscript:@"routeLocationIndex"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRouteLocationIndex:", objc_msgSend(v18, "unsignedIntValue"));
  }

  v19 = [v5 objectForKeyedSubscript:@"routeLocationOffset"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v19 floatValue];
    objc_msgSend(a1, "setRouteLocationOffset:");
  }

  v20 = [v5 objectForKeyedSubscript:@"timestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v20 doubleValue];
    objc_msgSend(a1, "setTimestamp:");
  }

  v21 = [v5 objectForKeyedSubscript:@"routeMatchCoordinate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v23 = [(GEOLatLng *)v22 initWithJSON:v21];
    }
    else {
      uint64_t v23 = [(GEOLatLng *)v22 initWithDictionary:v21];
    }
    v24 = (void *)v23;
    [a1 setRouteMatchCoordinate:v23];
  }
  v25 = [v5 objectForKeyedSubscript:@"routeID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v25 options:0];
    [a1 setRouteID:v26];
  }
  v27 = [v5 objectForKeyedSubscript:@"guidancePromptsEnabled"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setGuidancePromptsEnabled:", objc_msgSend(v27, "BOOLValue"));
  }

  v28 = [v5 objectForKeyedSubscript:@"selectedRideIndex"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v29 = v28;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v48 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(a1, "addSelectedRideIndex:", objc_msgSend(v34, "unsignedIntValue", (void)v47));
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v31);
    }
  }
  v35 = [v5 objectForKeyedSubscript:@"lowGuidanceNavigation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLowGuidanceNavigation:", objc_msgSend(v35, "BOOLValue"));
  }

  int v36 = [v5 objectForKeyedSubscript:@"hapticsType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v37 = v36;
    if ([v37 isEqualToString:@"NO_TURN"])
    {
      uint64_t v38 = 0;
    }
    else if ([v37 isEqualToString:@"LEFT_TURN"])
    {
      uint64_t v38 = 1;
    }
    else if ([v37 isEqualToString:@"RIGHT_TURN"])
    {
      uint64_t v38 = 2;
    }
    else if ([v37 isEqualToString:@"STRAIGHT_AHEAD"])
    {
      uint64_t v38 = 3;
    }
    else if ([v37 isEqualToString:@"U_TURN"])
    {
      uint64_t v38 = 4;
    }
    else if ([v37 isEqualToString:@"FOLLOW_ROAD"])
    {
      uint64_t v38 = 5;
    }
    else if ([v37 isEqualToString:@"ENTER_ROUNDABOUT"])
    {
      uint64_t v38 = 6;
    }
    else if ([v37 isEqualToString:@"EXIT_ROUNDABOUT"])
    {
      uint64_t v38 = 7;
    }
    else if ([v37 isEqualToString:@"OFF_RAMP"])
    {
      uint64_t v38 = 11;
    }
    else if ([v37 isEqualToString:@"ON_RAMP"])
    {
      uint64_t v38 = 12;
    }
    else if ([v37 isEqualToString:@"ARRIVE_END_OF_NAVIGATION"])
    {
      uint64_t v38 = 16;
    }
    else if ([v37 isEqualToString:@"START_ROUTE"])
    {
      uint64_t v38 = 17;
    }
    else if ([v37 isEqualToString:@"ARRIVE_AT_DESTINATION"])
    {
      uint64_t v38 = 18;
    }
    else if ([v37 isEqualToString:@"KEEP_LEFT"])
    {
      uint64_t v38 = 20;
    }
    else if ([v37 isEqualToString:@"KEEP_RIGHT"])
    {
      uint64_t v38 = 21;
    }
    else if ([v37 isEqualToString:@"ENTER_FERRY"])
    {
      uint64_t v38 = 22;
    }
    else if ([v37 isEqualToString:@"EXIT_FERRY"])
    {
      uint64_t v38 = 23;
    }
    else if ([v37 isEqualToString:@"CHANGE_FERRY"])
    {
      uint64_t v38 = 24;
    }
    else if ([v37 isEqualToString:@"START_ROUTE_WITH_U_TURN"])
    {
      uint64_t v38 = 25;
    }
    else if ([v37 isEqualToString:@"U_TURN_AT_ROUNDABOUT"])
    {
      uint64_t v38 = 26;
    }
    else if ([v37 isEqualToString:@"LEFT_TURN_AT_END"])
    {
      uint64_t v38 = 27;
    }
    else if ([v37 isEqualToString:@"RIGHT_TURN_AT_END"])
    {
      uint64_t v38 = 28;
    }
    else if ([v37 isEqualToString:@"HIGHWAY_OFF_RAMP_LEFT"])
    {
      uint64_t v38 = 29;
    }
    else if ([v37 isEqualToString:@"HIGHWAY_OFF_RAMP_RIGHT"])
    {
      uint64_t v38 = 30;
    }
    else if ([v37 isEqualToString:@"ARRIVE_AT_DESTINATION_LEFT"])
    {
      uint64_t v38 = 33;
    }
    else if ([v37 isEqualToString:@"ARRIVE_AT_DESTINATION_RIGHT"])
    {
      uint64_t v38 = 34;
    }
    else if ([v37 isEqualToString:@"U_TURN_WHEN_POSSIBLE"])
    {
      uint64_t v38 = 35;
    }
    else if ([v37 isEqualToString:@"ARRIVE_END_OF_DIRECTIONS"])
    {
      uint64_t v38 = 39;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_1"])
    {
      uint64_t v38 = 41;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_2"])
    {
      uint64_t v38 = 42;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_3"])
    {
      uint64_t v38 = 43;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_4"])
    {
      uint64_t v38 = 44;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_5"])
    {
      uint64_t v38 = 45;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_6"])
    {
      uint64_t v38 = 46;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_7"])
    {
      uint64_t v38 = 47;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_8"])
    {
      uint64_t v38 = 48;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_9"])
    {
      uint64_t v38 = 49;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_10"])
    {
      uint64_t v38 = 50;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_11"])
    {
      uint64_t v38 = 51;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_12"])
    {
      uint64_t v38 = 52;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_13"])
    {
      uint64_t v38 = 53;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_14"])
    {
      uint64_t v38 = 54;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_15"])
    {
      uint64_t v38 = 55;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_16"])
    {
      uint64_t v38 = 56;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_17"])
    {
      uint64_t v38 = 57;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_18"])
    {
      uint64_t v38 = 58;
    }
    else if ([v37 isEqualToString:@"ROUNDABOUT_EXIT_19"])
    {
      uint64_t v38 = 59;
    }
    else if ([v37 isEqualToString:@"SHARP_LEFT_TURN"])
    {
      uint64_t v38 = 60;
    }
    else if ([v37 isEqualToString:@"SHARP_RIGHT_TURN"])
    {
      uint64_t v38 = 61;
    }
    else if ([v37 isEqualToString:@"SLIGHT_LEFT_TURN"])
    {
      uint64_t v38 = 62;
    }
    else if ([v37 isEqualToString:@"SLIGHT_RIGHT_TURN"])
    {
      uint64_t v38 = 63;
    }
    else if ([v37 isEqualToString:@"CHANGE_HIGHWAY"])
    {
      uint64_t v38 = 64;
    }
    else if ([v37 isEqualToString:@"CHANGE_HIGHWAY_LEFT"])
    {
      uint64_t v38 = 65;
    }
    else if ([v37 isEqualToString:@"CHANGE_HIGHWAY_RIGHT"])
    {
      uint64_t v38 = 66;
    }
    else if ([v37 isEqualToString:@"TOLL_STATION"])
    {
      uint64_t v38 = 80;
    }
    else if ([v37 isEqualToString:@"ENTER_TUNNEL"])
    {
      uint64_t v38 = 81;
    }
    else if ([v37 isEqualToString:@"WAYPOINT_STOP"])
    {
      uint64_t v38 = 82;
    }
    else if ([v37 isEqualToString:@"WAYPOINT_STOP_LEFT"])
    {
      uint64_t v38 = 83;
    }
    else if ([v37 isEqualToString:@"WAYPOINT_STOP_RIGHT"])
    {
      uint64_t v38 = 84;
    }
    else if ([v37 isEqualToString:@"RESUME_ROUTE"])
    {
      uint64_t v38 = 85;
    }
    else if ([v37 isEqualToString:@"RESUME_ROUTE_WITH_U_TURN"])
    {
      uint64_t v38 = 86;
    }
    else if ([v37 isEqualToString:@"CUSTOM"])
    {
      uint64_t v38 = 87;
    }
    else if ([v37 isEqualToString:@"TURN_AROUND"])
    {
      uint64_t v38 = 88;
    }
    else
    {
      uint64_t v38 = 0;
    }

    goto LABEL_205;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v38 = [v36 intValue];
LABEL_205:
    objc_msgSend(a1, "setHapticsType:", v38, (void)v47);
  }

  v39 = [v5 objectForKeyedSubscript:@"isConnectedToCarplay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsConnectedToCarplay:", objc_msgSend(v39, "BOOLValue"));
  }

  v40 = [v5 objectForKeyedSubscript:@"alightMessage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41 = [GEOCompanionTransitAlightMessage alloc];
    if (a3) {
      uint64_t v42 = [(GEOCompanionTransitAlightMessage *)v41 initWithJSON:v40];
    }
    else {
      uint64_t v42 = [(GEOCompanionTransitAlightMessage *)v41 initWithDictionary:v40];
    }
    v43 = (void *)v42;
    objc_msgSend(a1, "setAlightMessage:", v42, (void)v47);
  }
  v44 = [v5 objectForKeyedSubscript:@"isOffline"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsOffline:", objc_msgSend(v44, "BOOLValue"));
  }

  v45 = [v5 objectForKeyedSubscript:@"displayedStepID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDisplayedStepID:", objc_msgSend(v45, "unsignedIntValue"));
  }

LABEL_218:
  return a1;
}

- (GEOCompanionRouteStatus)initWithJSON:(id)a3
{
  return (GEOCompanionRouteStatus *)-[GEOCompanionRouteStatus _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_754;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_755;
    }
    GEOCompanionRouteStatusReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLocation *)self->_location readAll:1];
    [(GEOLatLng *)self->_routeMatchCoordinate readAll:1];
    [(GEOCompanionTransitAlightMessage *)self->_alightMessage readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionRouteStatusIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionRouteStatusReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOCompanionRouteStatusIsDirty((uint64_t)self) & 1) == 0)
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v13 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
    goto LABEL_48;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCompanionRouteStatus *)self readAll:0];
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  }
  uint64_t v6 = v13;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v6 = v13;
    $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&flags & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)&flags & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v13;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v13;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v13;
  if ((*(_DWORD *)&self->_flags & 0x80) != 0)
  {
LABEL_10:
    PBDataWriterWriteUint32Field();
    uint64_t v6 = v13;
  }
LABEL_11:
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    uint64_t v6 = v13;
  }
  $AD490B0E691E6F105FFA9F0D440E4C82 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v6 = v13;
    $AD490B0E691E6F105FFA9F0D440E4C82 v7 = self->_flags;
    if ((*(_WORD *)&v7 & 0x200) == 0)
    {
LABEL_15:
      if ((*(unsigned char *)&v7 & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&v7 & 0x200) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteFloatField();
  uint64_t v6 = v13;
  if (*(_DWORD *)&self->_flags)
  {
LABEL_16:
    PBDataWriterWriteDoubleField();
    uint64_t v6 = v13;
  }
LABEL_17:
  if (self->_routeMatchCoordinate)
  {
    PBDataWriterWriteSubmessage();
    uint64_t v6 = v13;
  }
  if (self->_routeID)
  {
    PBDataWriterWriteDataField();
    uint64_t v6 = v13;
  }
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v6 = v13;
  }
  if (self->_selectedRideIndexs.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      uint64_t v6 = v13;
      ++v8;
    }
    while (v8 < self->_selectedRideIndexs.count);
  }
  $AD490B0E691E6F105FFA9F0D440E4C82 v9 = self->_flags;
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v6 = v13;
    $AD490B0E691E6F105FFA9F0D440E4C82 v9 = self->_flags;
    if ((*(unsigned char *)&v9 & 0x40) == 0)
    {
LABEL_28:
      if ((*(_WORD *)&v9 & 0x1000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&v9 & 0x40) == 0)
  {
    goto LABEL_28;
  }
  PBDataWriterWriteInt32Field();
  uint64_t v6 = v13;
  if ((*(_DWORD *)&self->_flags & 0x1000) != 0)
  {
LABEL_29:
    PBDataWriterWriteBOOLField();
    uint64_t v6 = v13;
  }
LABEL_30:
  if (self->_alightMessage)
  {
    PBDataWriterWriteSubmessage();
    uint64_t v6 = v13;
  }
  $AD490B0E691E6F105FFA9F0D440E4C82 v10 = self->_flags;
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v6 = v13;
    $AD490B0E691E6F105FFA9F0D440E4C82 v10 = self->_flags;
  }
  if ((*(unsigned char *)&v10 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
LABEL_48:
    uint64_t v6 = v13;
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOCompanionRouteStatus _readLocation]((uint64_t)self);
  if ([(GEOLocation *)self->_location hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOCompanionRouteStatus _readRouteMatchCoordinate]((uint64_t)self);
  routeMatchCoordinate = self->_routeMatchCoordinate;

  return [(GEOLatLng *)routeMatchCoordinate hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v13 = (id *)a3;
  [(GEOCompanionRouteStatus *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 20) = self->_readerMarkPos;
  *((_DWORD *)v13 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v13;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    *((_DWORD *)v13 + 27) = self->_feedbackType;
    *((_DWORD *)v13 + 34) |= 0x20u;
    $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&flags & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v13 + 32) = self->_stepID;
  *((_DWORD *)v13 + 34) |= 0x400u;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v13 + 25) = self->_distanceToManeuver;
  *((_DWORD *)v13 + 34) |= 8u;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v13 + 26) = self->_distanceToRoute;
  *((_DWORD *)v13 + 34) |= 0x10u;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_41:
  *((_DWORD *)v13 + 24) = self->_distanceRemainingOnRoute;
  *((_DWORD *)v13 + 34) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x80) != 0)
  {
LABEL_7:
    *((_DWORD *)v13 + 29) = self->_remainingTime;
    *((_DWORD *)v13 + 34) |= 0x80u;
  }
LABEL_8:
  if (self->_location)
  {
    objc_msgSend(v13, "setLocation:");
    int v4 = v13;
  }
  $AD490B0E691E6F105FFA9F0D440E4C82 v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x100) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_routeLocationIndex;
    *((_DWORD *)v4 + 34) |= 0x100u;
    $AD490B0E691E6F105FFA9F0D440E4C82 v6 = self->_flags;
    if ((*(_WORD *)&v6 & 0x200) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&v6 & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*(_WORD *)&v6 & 0x200) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v4 + 31) = LODWORD(self->_routeLocationOffset);
  *((_DWORD *)v4 + 34) |= 0x200u;
  if (*(_DWORD *)&self->_flags)
  {
LABEL_13:
    v4[9] = *(id *)&self->_timestamp;
    *((_DWORD *)v4 + 34) |= 1u;
  }
LABEL_14:
  if (self->_routeMatchCoordinate)
  {
    objc_msgSend(v13, "setRouteMatchCoordinate:");
    int v4 = v13;
  }
  if (self->_routeID)
  {
    objc_msgSend(v13, "setRouteID:");
    int v4 = v13;
  }
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    *((unsigned char *)v4 + 132) = self->_guidancePromptsEnabled;
    *((_DWORD *)v4 + 34) |= 0x800u;
  }
  if ([(GEOCompanionRouteStatus *)self selectedRideIndexsCount])
  {
    [v13 clearSelectedRideIndexs];
    unint64_t v7 = [(GEOCompanionRouteStatus *)self selectedRideIndexsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
        objc_msgSend(v13, "addSelectedRideIndex:", -[GEOCompanionRouteStatus selectedRideIndexAtIndex:](self, "selectedRideIndexAtIndex:", i));
    }
  }
  $AD490B0E691E6F105FFA9F0D440E4C82 v10 = self->_flags;
  v11 = v13;
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    *((unsigned char *)v13 + 135) = self->_lowGuidanceNavigation;
    *((_DWORD *)v13 + 34) |= 0x4000u;
    $AD490B0E691E6F105FFA9F0D440E4C82 v10 = self->_flags;
    if ((*(unsigned char *)&v10 & 0x40) == 0)
    {
LABEL_26:
      if ((*(_WORD *)&v10 & 0x1000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&v10 & 0x40) == 0)
  {
    goto LABEL_26;
  }
  *((_DWORD *)v13 + 28) = self->_hapticsType;
  *((_DWORD *)v13 + 34) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x1000) != 0)
  {
LABEL_27:
    *((unsigned char *)v13 + 133) = self->_isConnectedToCarplay;
    *((_DWORD *)v13 + 34) |= 0x1000u;
  }
LABEL_28:
  if (self->_alightMessage)
  {
    objc_msgSend(v13, "setAlightMessage:");
    v11 = v13;
  }
  $AD490B0E691E6F105FFA9F0D440E4C82 v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    *((unsigned char *)v11 + 134) = self->_isOffline;
    *((_DWORD *)v11 + 34) |= 0x2000u;
    $AD490B0E691E6F105FFA9F0D440E4C82 v12 = self->_flags;
  }
  if ((*(unsigned char *)&v12 & 2) != 0)
  {
    *((_DWORD *)v11 + 23) = self->_displayedStepID;
    *((_DWORD *)v11 + 34) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOCompanionRouteStatusReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCompanionRouteStatus *)self readAll:0];
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_feedbackType;
    *(_DWORD *)(v5 + 136) |= 0x20u;
    $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&flags & 0x400) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 128) = self->_stepID;
  *(_DWORD *)(v5 + 136) |= 0x400u;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 100) = self->_distanceToManeuver;
  *(_DWORD *)(v5 + 136) |= 8u;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 104) = self->_distanceToRoute;
  *(_DWORD *)(v5 + 136) |= 0x10u;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_31:
  *(_DWORD *)(v5 + 96) = self->_distanceRemainingOnRoute;
  *(_DWORD *)(v5 + 136) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x80) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 116) = self->_remainingTime;
    *(_DWORD *)(v5 + 136) |= 0x80u;
  }
LABEL_12:
  id v10 = [(GEOLocation *)self->_location copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  $AD490B0E691E6F105FFA9F0D440E4C82 v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_routeLocationIndex;
    *(_DWORD *)(v5 + 136) |= 0x100u;
    $AD490B0E691E6F105FFA9F0D440E4C82 v12 = self->_flags;
    if ((*(_WORD *)&v12 & 0x200) == 0)
    {
LABEL_14:
      if ((*(unsigned char *)&v12 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&v12 & 0x200) == 0)
  {
    goto LABEL_14;
  }
  *(float *)(v5 + 124) = self->_routeLocationOffset;
  *(_DWORD *)(v5 + 136) |= 0x200u;
  if (*(_DWORD *)&self->_flags)
  {
LABEL_15:
    *(double *)(v5 + 72) = self->_timestamp;
    *(_DWORD *)(v5 + 136) |= 1u;
  }
LABEL_16:
  id v13 = [(GEOLatLng *)self->_routeMatchCoordinate copyWithZone:a3];
  v14 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v13;

  uint64_t v15 = [(NSData *)self->_routeID copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    *(unsigned char *)(v5 + 132) = self->_guidancePromptsEnabled;
    *(_DWORD *)(v5 + 136) |= 0x800u;
  }
  PBRepeatedUInt32Copy();
  $AD490B0E691E6F105FFA9F0D440E4C82 v17 = self->_flags;
  if ((*(_WORD *)&v17 & 0x4000) == 0)
  {
    if ((*(unsigned char *)&v17 & 0x40) == 0) {
      goto LABEL_20;
    }
LABEL_37:
    *(_DWORD *)(v5 + 112) = self->_hapticsType;
    *(_DWORD *)(v5 + 136) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 0x1000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  *(unsigned char *)(v5 + 135) = self->_lowGuidanceNavigation;
  *(_DWORD *)(v5 + 136) |= 0x4000u;
  $AD490B0E691E6F105FFA9F0D440E4C82 v17 = self->_flags;
  if ((*(unsigned char *)&v17 & 0x40) != 0) {
    goto LABEL_37;
  }
LABEL_20:
  if ((*(_WORD *)&v17 & 0x1000) != 0)
  {
LABEL_21:
    *(unsigned char *)(v5 + 133) = self->_isConnectedToCarplay;
    *(_DWORD *)(v5 + 136) |= 0x1000u;
  }
LABEL_22:
  id v18 = [(GEOCompanionTransitAlightMessage *)self->_alightMessage copyWithZone:a3];
  v19 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v18;

  $AD490B0E691E6F105FFA9F0D440E4C82 v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x2000) != 0)
  {
    *(unsigned char *)(v5 + 134) = self->_isOffline;
    *(_DWORD *)(v5 + 136) |= 0x2000u;
    $AD490B0E691E6F105FFA9F0D440E4C82 v20 = self->_flags;
  }
  if ((*(unsigned char *)&v20 & 2) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_displayedStepID;
    *(_DWORD *)(v5 + 136) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_100;
  }
  [(GEOCompanionRouteStatus *)self readAll:1];
  [v4 readAll:1];
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 34);
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_feedbackType != *((_DWORD *)v4 + 27)) {
      goto LABEL_100;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_stepID != *((_DWORD *)v4 + 32)) {
      goto LABEL_100;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_100;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_distanceToManeuver != *((_DWORD *)v4 + 25)) {
      goto LABEL_100;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_100;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_distanceToRoute != *((_DWORD *)v4 + 26)) {
      goto LABEL_100;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_100;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_distanceRemainingOnRoute != *((_DWORD *)v4 + 24)) {
      goto LABEL_100;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_100;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_remainingTime != *((_DWORD *)v4 + 29)) {
      goto LABEL_100;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_100;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 6))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:")) {
      goto LABEL_100;
    }
    $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 34);
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_routeLocationIndex != *((_DWORD *)v4 + 30)) {
      goto LABEL_100;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_routeLocationOffset != *((float *)v4 + 31)) {
      goto LABEL_100;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_100;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((double *)v4 + 9)) {
      goto LABEL_100;
    }
  }
  else if (v6)
  {
    goto LABEL_100;
  }
  routeMatchCoordinate = self->_routeMatchCoordinate;
  if ((unint64_t)routeMatchCoordinate | *((void *)v4 + 8)
    && !-[GEOLatLng isEqual:](routeMatchCoordinate, "isEqual:"))
  {
    goto LABEL_100;
  }
  routeID = self->_routeID;
  if ((unint64_t)routeID | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](routeID, "isEqual:")) {
      goto LABEL_100;
    }
  }
  int v10 = *((_DWORD *)v4 + 34);
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0)
  {
    if ((v10 & 0x800) == 0) {
      goto LABEL_100;
    }
    if (self->_guidancePromptsEnabled)
    {
      if (!*((unsigned char *)v4 + 132)) {
        goto LABEL_100;
      }
    }
    else if (*((unsigned char *)v4 + 132))
    {
      goto LABEL_100;
    }
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_100;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_100;
  }
  $AD490B0E691E6F105FFA9F0D440E4C82 v11 = self->_flags;
  int v12 = *((_DWORD *)v4 + 34);
  if ((*(_WORD *)&v11 & 0x4000) != 0)
  {
    if ((v12 & 0x4000) == 0) {
      goto LABEL_100;
    }
    if (self->_lowGuidanceNavigation)
    {
      if (!*((unsigned char *)v4 + 135)) {
        goto LABEL_100;
      }
    }
    else if (*((unsigned char *)v4 + 135))
    {
      goto LABEL_100;
    }
  }
  else if ((v12 & 0x4000) != 0)
  {
    goto LABEL_100;
  }
  if ((*(unsigned char *)&v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_hapticsType != *((_DWORD *)v4 + 28)) {
      goto LABEL_100;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0) {
      goto LABEL_100;
    }
    if (self->_isConnectedToCarplay)
    {
      if (!*((unsigned char *)v4 + 133)) {
        goto LABEL_100;
      }
    }
    else if (*((unsigned char *)v4 + 133))
    {
      goto LABEL_100;
    }
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_100;
  }
  alightMessage = self->_alightMessage;
  if ((unint64_t)alightMessage | *((void *)v4 + 5))
  {
    if (!-[GEOCompanionTransitAlightMessage isEqual:](alightMessage, "isEqual:")) {
      goto LABEL_100;
    }
    $AD490B0E691E6F105FFA9F0D440E4C82 v11 = self->_flags;
    int v12 = *((_DWORD *)v4 + 34);
  }
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    if ((v12 & 0x2000) != 0)
    {
      if (self->_isOffline)
      {
        if (!*((unsigned char *)v4 + 134)) {
          goto LABEL_100;
        }
        goto LABEL_95;
      }
      if (!*((unsigned char *)v4 + 134)) {
        goto LABEL_95;
      }
    }
LABEL_100:
    BOOL v14 = 0;
    goto LABEL_101;
  }
  if ((v12 & 0x2000) != 0) {
    goto LABEL_100;
  }
LABEL_95:
  if ((*(unsigned char *)&v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_displayedStepID != *((_DWORD *)v4 + 23)) {
      goto LABEL_100;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = (v12 & 2) == 0;
  }
LABEL_101:

  return v14;
}

- (unint64_t)hash
{
  [(GEOCompanionRouteStatus *)self readAll:1];
  $AD490B0E691E6F105FFA9F0D440E4C82 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    uint64_t v36 = 2654435761 * self->_feedbackType;
    if ((*(_WORD *)&flags & 0x400) != 0)
    {
LABEL_3:
      uint64_t v35 = 2654435761 * self->_stepID;
      if ((*(unsigned char *)&flags & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v36 = 0;
    if ((*(_WORD *)&flags & 0x400) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v35 = 0;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
LABEL_4:
    uint64_t v34 = 2654435761 * self->_distanceToManeuver;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v34 = 0;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_5:
    uint64_t v33 = 2654435761 * self->_distanceToRoute;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v32 = 0;
    if ((*(unsigned char *)&flags & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v33 = 0;
  if ((*(unsigned char *)&flags & 4) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v32 = 2654435761 * self->_distanceRemainingOnRoute;
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
LABEL_7:
    uint64_t v31 = 2654435761 * self->_remainingTime;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v31 = 0;
LABEL_14:
  unint64_t v30 = [(GEOLocation *)self->_location hash];
  $AD490B0E691E6F105FFA9F0D440E4C82 v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
    uint64_t v29 = 2654435761 * self->_routeLocationIndex;
    if ((*(_WORD *)&v4 & 0x200) != 0) {
      goto LABEL_16;
    }
LABEL_21:
    unint64_t v9 = 0;
    goto LABEL_24;
  }
  uint64_t v29 = 0;
  if ((*(_WORD *)&v4 & 0x200) == 0) {
    goto LABEL_21;
  }
LABEL_16:
  float routeLocationOffset = self->_routeLocationOffset;
  double v6 = routeLocationOffset;
  if (routeLocationOffset < 0.0) {
    double v6 = -routeLocationOffset;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_24:
  unint64_t v28 = v9;
  if (*(unsigned char *)&v4)
  {
    double timestamp = self->_timestamp;
    double v12 = -timestamp;
    if (timestamp >= 0.0) {
      double v12 = self->_timestamp;
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
  unint64_t v27 = [(GEOLatLng *)self->_routeMatchCoordinate hash];
  uint64_t v15 = [(NSData *)self->_routeID hash];
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0) {
    uint64_t v16 = 2654435761 * self->_guidancePromptsEnabled;
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v17 = PBRepeatedUInt32Hash();
  $AD490B0E691E6F105FFA9F0D440E4C82 v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x4000) == 0)
  {
    uint64_t v19 = 0;
    if ((*(unsigned char *)&v18 & 0x40) != 0) {
      goto LABEL_37;
    }
LABEL_40:
    uint64_t v20 = 0;
    if ((*(_WORD *)&v18 & 0x1000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_41;
  }
  uint64_t v19 = 2654435761 * self->_lowGuidanceNavigation;
  if ((*(unsigned char *)&v18 & 0x40) == 0) {
    goto LABEL_40;
  }
LABEL_37:
  uint64_t v20 = 2654435761 * self->_hapticsType;
  if ((*(_WORD *)&v18 & 0x1000) != 0)
  {
LABEL_38:
    uint64_t v21 = 2654435761 * self->_isConnectedToCarplay;
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v21 = 0;
LABEL_42:
  unint64_t v22 = [(GEOCompanionTransitAlightMessage *)self->_alightMessage hash];
  $AD490B0E691E6F105FFA9F0D440E4C82 v23 = self->_flags;
  if ((*(_WORD *)&v23 & 0x2000) != 0)
  {
    uint64_t v24 = 2654435761 * self->_isOffline;
    if ((*(unsigned char *)&v23 & 2) != 0) {
      goto LABEL_44;
    }
LABEL_46:
    uint64_t v25 = 0;
    return v35 ^ v36 ^ v34 ^ v33 ^ v32 ^ v31 ^ v29 ^ v28 ^ v10 ^ v30 ^ v27 ^ v15 ^ v16 ^ v17 ^ v19 ^ v20 ^ v21 ^ v22 ^ v24 ^ v25;
  }
  uint64_t v24 = 0;
  if ((*(unsigned char *)&v23 & 2) == 0) {
    goto LABEL_46;
  }
LABEL_44:
  uint64_t v25 = 2654435761 * self->_displayedStepID;
  return v35 ^ v36 ^ v34 ^ v33 ^ v32 ^ v31 ^ v29 ^ v28 ^ v10 ^ v30 ^ v27 ^ v15 ^ v16 ^ v17 ^ v19 ^ v20 ^ v21 ^ v22 ^ v24 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  id v19 = a3;
  [v19 readAll:0];
  id v4 = v19;
  int v5 = *((_DWORD *)v19 + 34);
  if ((v5 & 0x20) != 0)
  {
    self->_feedbackType = *((_DWORD *)v19 + 27);
    *(_DWORD *)&self->_flags |= 0x20u;
    int v5 = *((_DWORD *)v19 + 34);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((v5 & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_stepID = *((_DWORD *)v19 + 32);
  *(_DWORD *)&self->_flags |= 0x400u;
  int v5 = *((_DWORD *)v19 + 34);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_distanceToManeuver = *((_DWORD *)v19 + 25);
  *(_DWORD *)&self->_flags |= 8u;
  int v5 = *((_DWORD *)v19 + 34);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_distanceToRoute = *((_DWORD *)v19 + 26);
  *(_DWORD *)&self->_flags |= 0x10u;
  int v5 = *((_DWORD *)v19 + 34);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_distanceRemainingOnRoute = *((_DWORD *)v19 + 24);
  *(_DWORD *)&self->_flags |= 4u;
  if ((*((_DWORD *)v19 + 34) & 0x80) != 0)
  {
LABEL_7:
    self->_remainingTime = *((_DWORD *)v19 + 29);
    *(_DWORD *)&self->_flags |= 0x80u;
  }
LABEL_8:
  location = self->_location;
  uint64_t v7 = *((void *)v19 + 6);
  if (location)
  {
    if (!v7) {
      goto LABEL_20;
    }
    -[GEOLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_20;
    }
    -[GEOCompanionRouteStatus setLocation:](self, "setLocation:");
  }
  id v4 = v19;
LABEL_20:
  int v8 = *((_DWORD *)v4 + 34);
  if ((v8 & 0x100) != 0)
  {
    self->_routeLocationIndex = *((_DWORD *)v4 + 30);
    *(_DWORD *)&self->_flags |= 0x100u;
    int v8 = *((_DWORD *)v4 + 34);
    if ((v8 & 0x200) == 0)
    {
LABEL_22:
      if ((v8 & 1) == 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  else if ((v8 & 0x200) == 0)
  {
    goto LABEL_22;
  }
  self->_float routeLocationOffset = *((float *)v4 + 31);
  *(_DWORD *)&self->_flags |= 0x200u;
  if (*((_DWORD *)v4 + 34))
  {
LABEL_23:
    self->_double timestamp = *((double *)v4 + 9);
    *(_DWORD *)&self->_flags |= 1u;
  }
LABEL_24:
  routeMatchCoordinate = self->_routeMatchCoordinate;
  uint64_t v10 = *((void *)v4 + 8);
  if (routeMatchCoordinate)
  {
    if (!v10) {
      goto LABEL_33;
    }
    -[GEOLatLng mergeFrom:](routeMatchCoordinate, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_33;
    }
    [(GEOCompanionRouteStatus *)self setRouteMatchCoordinate:"setRouteMatchCoordinate:"];
  }
  id v4 = v19;
LABEL_33:
  if (*((void *)v4 + 7))
  {
    [(GEOCompanionRouteStatus *)self setRouteID:"setRouteID:"];
    id v4 = v19;
  }
  if ((*((unsigned char *)v4 + 137) & 8) != 0)
  {
    self->_guidancePromptsEnabled = *((unsigned char *)v4 + 132);
    *(_DWORD *)&self->_flags |= 0x800u;
  }
  uint64_t v11 = [v4 selectedRideIndexsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t i = 0; i != v12; ++i)
      -[GEOCompanionRouteStatus addSelectedRideIndex:](self, "addSelectedRideIndex:", [v19 selectedRideIndexAtIndex:i]);
  }
  id v14 = v19;
  int v15 = *((_DWORD *)v19 + 34);
  if ((v15 & 0x4000) != 0)
  {
    self->_lowGuidanceNavigation = *((unsigned char *)v19 + 135);
    *(_DWORD *)&self->_flags |= 0x4000u;
    int v15 = *((_DWORD *)v19 + 34);
    if ((v15 & 0x40) == 0)
    {
LABEL_42:
      if ((v15 & 0x1000) == 0) {
        goto LABEL_44;
      }
      goto LABEL_43;
    }
  }
  else if ((v15 & 0x40) == 0)
  {
    goto LABEL_42;
  }
  self->_hapticsType = *((_DWORD *)v19 + 28);
  *(_DWORD *)&self->_flags |= 0x40u;
  if ((*((_DWORD *)v19 + 34) & 0x1000) != 0)
  {
LABEL_43:
    self->_isConnectedToCarplay = *((unsigned char *)v19 + 133);
    *(_DWORD *)&self->_flags |= 0x1000u;
  }
LABEL_44:
  alightMessage = self->_alightMessage;
  uint64_t v17 = *((void *)v19 + 5);
  if (alightMessage)
  {
    if (!v17) {
      goto LABEL_53;
    }
    -[GEOCompanionTransitAlightMessage mergeFrom:](alightMessage, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_53;
    }
    -[GEOCompanionRouteStatus setAlightMessage:](self, "setAlightMessage:");
  }
  id v14 = v19;
LABEL_53:
  int v18 = *((_DWORD *)v14 + 34);
  if ((v18 & 0x2000) != 0)
  {
    self->_isOffline = *((unsigned char *)v14 + 134);
    *(_DWORD *)&self->_flags |= 0x2000u;
    int v18 = *((_DWORD *)v14 + 34);
  }
  if ((v18 & 2) != 0)
  {
    self->_displayedStepID = *((_DWORD *)v14 + 23);
    *(_DWORD *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeMatchCoordinate, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_alightMessage, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    double v6 = GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      int v21 = 138412802;
      unint64_t v22 = v17;
      __int16 v23 = 2048;
      uint64_t v24 = self;
      __int16 v25 = 2048;
      unint64_t v26 = 0;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", (uint8_t *)&v21, 0x20u);
    }
    goto LABEL_13;
  }
  BOOL v5 = [(GEOCompanionRouteStatus *)self hasDisplayedStepID];
  double v6 = GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (a3 > 4 || !v5)
  {
    if (v7)
    {
      int v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      int v21 = 138412802;
      unint64_t v22 = v19;
      __int16 v23 = 2048;
      uint64_t v24 = self;
      __int16 v25 = 2048;
      unint64_t v26 = a3;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", (uint8_t *)&v21, 0x20u);
    }
LABEL_13:

    uint64_t v10 = self;
    goto LABEL_14;
  }
  if (v7)
  {
    int v8 = (objc_class *)objc_opt_class();
    unint64_t v9 = NSStringFromClass(v8);
    int v21 = 138412802;
    unint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = self;
    __int16 v25 = 2048;
    unint64_t v26 = a3;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is not compatible with protocol version %lu", (uint8_t *)&v21, 0x20u);
  }
  uint64_t v10 = (GEOCompanionRouteStatus *)[(GEOCompanionRouteStatus *)self copy];
  uint64_t v11 = GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    long double v13 = NSStringFromClass(v12);
    unint64_t v14 = [(GEOCompanionRouteStatus *)self displayedStepID];
    unsigned int v15 = [(GEOCompanionRouteStatus *)self stepID];
    int v21 = 138413058;
    unint64_t v22 = v13;
    __int16 v23 = 2048;
    uint64_t v24 = self;
    __int16 v25 = 2048;
    unint64_t v26 = v14;
    __int16 v27 = 2048;
    uint64_t v28 = v15;
    _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_INFO, "%@<%p> | Copying displayedStepID %lu into stepID (was %lu)", (uint8_t *)&v21, 0x2Au);
  }
  [(GEOCompanionRouteStatus *)v10 setStepID:[(GEOCompanionRouteStatus *)v10 displayedStepID]];
LABEL_14:

  return v10;
}

- (GEOCompanionRouteStatus)initWithRouteID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOCompanionRouteStatus;
  BOOL v5 = [(GEOCompanionRouteStatus *)&v9 init];
  double v6 = v5;
  if (v5)
  {
    [(GEOCompanionRouteStatus *)v5 setRouteID:v4];
    BOOL v7 = v6;
  }

  return v6;
}

- (GEOCompanionRouteStatus)initWithRoute:(id)a3 routeID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOCompanionRouteStatus;
  int v8 = [(GEOCompanionRouteStatus *)&v13 init];
  if (v8)
  {
    -[GEOCompanionRouteStatus setRemainingTime:](v8, "setRemainingTime:", [v6 expectedTime]);
    [v6 distance];
    [(GEOCompanionRouteStatus *)v8 setDistanceRemainingOnRoute:v9];
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    [v10 timeIntervalSinceReferenceDate];
    -[GEOCompanionRouteStatus setTimestamp:](v8, "setTimestamp:");

    [(GEOCompanionRouteStatus *)v8 setRouteID:v7];
    [(GEOCompanionRouteStatus *)v8 _updateClusteredSectionSelectedRideIndicesFromRoute:v6];
    uint64_t v11 = v8;
  }

  return v8;
}

- (void)updateWithRoute:(id)a3 routeID:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  -[GEOCompanionRouteStatus setRemainingTime:](self, "setRemainingTime:", [v9 expectedTime]);
  [v9 distance];
  [(GEOCompanionRouteStatus *)self setDistanceRemainingOnRoute:v7];
  int v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceReferenceDate];
  -[GEOCompanionRouteStatus setTimestamp:](self, "setTimestamp:");

  [(GEOCompanionRouteStatus *)self setRouteID:v6];
  [(GEOCompanionRouteStatus *)self setStepID:0];
  [(GEOCompanionRouteStatus *)self setHasStepID:0];
  [(GEOCompanionRouteStatus *)self setDistanceToManeuver:0];
  [(GEOCompanionRouteStatus *)self setHasDistanceToManeuver:0];
  [(GEOCompanionRouteStatus *)self setDistanceToRoute:0];
  [(GEOCompanionRouteStatus *)self setHasDistanceToRoute:0];
  [(GEOCompanionRouteStatus *)self _updateClusteredSectionSelectedRideIndicesFromRoute:v9];
}

- (void)updateClusteredSectionSelectedRideIndicesFromRoute:(id)a3 routeID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  double v7 = [(GEOCompanionRouteStatus *)self routeID];
  int v8 = [v6 isEqualToData:v7];

  if (v8) {
    [(GEOCompanionRouteStatus *)self _updateClusteredSectionSelectedRideIndicesFromRoute:v9];
  }
}

- (void)_updateClusteredSectionSelectedRideIndicesFromRoute:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(GEOCompanionRouteStatus *)self clearSelectedRideIndexs];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v5 = objc_msgSend(v4, "rideSelections", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOCompanionRouteStatus addSelectedRideIndex:](self, "addSelectedRideIndex:", [*(id *)(*((void *)&v10 + 1) + 8 * v9++) unsignedIntValue]);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)updateFeedbackWithNavigationState:(int)a3 locationUnreliable:(BOOL)a4 announcementStage:(unint64_t)a5 nextAnnouncementStage:(unint64_t)a6 nextAnnouncementTime:(double)a7
{
  __int16 v8 = a6;
  __int16 v9 = a5;
  uint64_t v11 = *(void *)&a3;
  long long v13 = [MEMORY[0x1E4F1C9C8] date];
  [v13 timeIntervalSinceReferenceDate];
  -[GEOCompanionRouteStatus setTimestamp:](self, "setTimestamp:");

  if (a4)
  {
    uint64_t v11 = 6;
  }
  else
  {
    switch((int)v11)
    {
      case 0:
        break;
      case 1:
      case 3:
      case 8:
        uint64_t v11 = 1;
        break;
      case 2:
        if ((unsigned __int16)(v9 - 2) > 3u) {
          uint64_t v14 = 2;
        }
        else {
          uint64_t v14 = dword_18A63A470[(__int16)(v9 - 2)];
        }
        [(GEOCompanionRouteStatus *)self setFeedbackType:v14];
        if (a7 > 2.0 || v8 != 5) {
          return;
        }
        uint64_t v11 = 9;
        break;
      case 4:
      case 5:
        uint64_t v11 = 5;
        break;
      case 6:
      case 7:
        uint64_t v11 = 7;
        break;
      default:
        return;
    }
  }

  [(GEOCompanionRouteStatus *)self setFeedbackType:v11];
}

- (BOOL)hasArrivedAtIntermediateWaypointInRoute:(id)a3
{
  id v4 = a3;
  if ([(GEOCompanionRouteStatus *)self feedbackType] == 7)
  {
    BOOL v5 = objc_msgSend(v4, "stepWithID:", -[GEOCompanionRouteStatus effectiveStepID](self, "effectiveStepID"));
    if ([v5 hasLegID]) {
      unint64_t v6 = [v5 legID] + 1;
    }
    else {
      unint64_t v6 = 0;
    }
    __int16 v8 = [v4 waypoints];
    unint64_t v9 = [v8 count] - 1;

    BOOL v7 = v6 < v9;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isNavigating
{
  int v3 = [(GEOCompanionRouteStatus *)self hasFeedbackType];
  if (v3)
  {
    int v3 = [(GEOCompanionRouteStatus *)self feedbackType];
    if (v3) {
      LOBYTE(v3) = [(GEOCompanionRouteStatus *)self feedbackType] != 8;
    }
  }
  return v3;
}

- (BOOL)isRecalculating
{
  BOOL v3 = [(GEOCompanionRouteStatus *)self hasFeedbackType];
  if (v3) {
    LOBYTE(v3) = [(GEOCompanionRouteStatus *)self feedbackType] == 5;
  }
  return v3;
}

- (BOOL)hasEffectiveStepID
{
  int v3 = [(GEOCompanionRouteStatus *)self feedbackType];
  if (v3 == 1 || v3 == 8) {
    return 1;
  }

  return [(GEOCompanionRouteStatus *)self hasStepID];
}

- (unsigned)effectiveStepID
{
  int v3 = [(GEOCompanionRouteStatus *)self feedbackType];
  if (v3 == 1 || v3 == 8) {
    return 0;
  }

  return [(GEOCompanionRouteStatus *)self stepID];
}

- (unsigned)effectiveStepIDInRoute:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_msgSend(v4, "stepWithID:", -[GEOCompanionRouteStatus effectiveStepID](self, "effectiveStepID"));

  if (v5) {
    unsigned int v6 = [v5 stepID];
  }
  else {
    unsigned int v6 = -1;
  }

  return v6;
}

- (BOOL)hasEffectiveDistanceToManeuver
{
  if ([(GEOCompanionRouteStatus *)self feedbackType] == 1)
  {
    return [(GEOCompanionRouteStatus *)self hasDistanceToRoute];
  }
  else
  {
    return [(GEOCompanionRouteStatus *)self hasDistanceToManeuver];
  }
}

- (unsigned)effectiveDistanceToManeuver
{
  if ([(GEOCompanionRouteStatus *)self feedbackType] == 1)
  {
    return [(GEOCompanionRouteStatus *)self distanceToRoute];
  }
  else
  {
    return [(GEOCompanionRouteStatus *)self distanceToManeuver];
  }
}

- (NSArray)selectedRideIndices
{
  int v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[GEOCompanionRouteStatus selectedRideIndexsCount](self, "selectedRideIndexsCount"));
  if ([(GEOCompanionRouteStatus *)self selectedRideIndexsCount])
  {
    unint64_t v4 = 0;
    do
    {
      BOOL v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GEOCompanionRouteStatus selectedRideIndexAtIndex:](self, "selectedRideIndexAtIndex:", v4));
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(GEOCompanionRouteStatus *)self selectedRideIndexsCount]);
  }
  unsigned int v6 = (void *)[v3 copy];

  return (NSArray *)v6;
}

@end