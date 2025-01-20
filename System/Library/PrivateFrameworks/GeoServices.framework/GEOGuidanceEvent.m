@interface GEOGuidanceEvent
+ (BOOL)isValid:(id)a3;
- (BOOL)hasArGuidance;
- (BOOL)hasDistanceReferenceEndpointOffsetCm;
- (BOOL)hasDistanceZilchIndex;
- (BOOL)hasEndValidDistance;
- (BOOL)hasEndValidDistanceOffsetCm;
- (BOOL)hasEnrouteNoticeIndex;
- (BOOL)hasEventType;
- (BOOL)hasIdentifier;
- (BOOL)hasImportanceInfo;
- (BOOL)hasJunctionView;
- (BOOL)hasLaneGuidance;
- (BOOL)hasMaxSpeed;
- (BOOL)hasMinSpeed;
- (BOOL)hasNavTrayGuidance;
- (BOOL)hasOffsetForDistanceString;
- (BOOL)hasPreserveEventInUpdates;
- (BOOL)hasSignGuidance;
- (BOOL)hasSpokenGuidance;
- (BOOL)hasStartValidDistance;
- (BOOL)hasStartValidDistanceOffsetCm;
- (BOOL)hasSticky;
- (BOOL)hasZilchPathIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)preserveEventInUpdates;
- (BOOL)readFrom:(id)a3;
- (BOOL)sticky;
- (GEOARGuidance)arGuidance;
- (GEOGuidanceEvent)init;
- (GEOGuidanceEvent)initWithData:(id)a3;
- (GEOGuidanceEvent)initWithDictionary:(id)a3;
- (GEOGuidanceEvent)initWithJSON:(id)a3;
- (GEOGuidanceImportanceMode)importanceInfo;
- (GEOJunctionView)junctionView;
- (GEONavTrayGuidance)navTrayGuidance;
- (GEOSignGuidance)signGuidance;
- (GEOSpokenGuidance)spokenGuidance;
- (GEOVisualLaneGuidance)laneGuidance;
- (PBUnknownFields)unknownFields;
- (double)maxSpeed;
- (double)minSpeed;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsEventType:(id)a3;
- (int)distanceZilchIndex;
- (int)endValidDistance;
- (int)eventType;
- (int)offsetForDistanceString;
- (int)startValidDistance;
- (unint64_t)hash;
- (unsigned)distanceReferenceEndpointOffsetCm;
- (unsigned)endValidDistanceOffsetCm;
- (unsigned)enrouteNoticeIndex;
- (unsigned)identifier;
- (unsigned)startValidDistanceOffsetCm;
- (unsigned)zilchPathIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArGuidance;
- (void)_readImportanceInfo;
- (void)_readJunctionView;
- (void)_readLaneGuidance;
- (void)_readNavTrayGuidance;
- (void)_readSignGuidance;
- (void)_readSpokenGuidance;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArGuidance:(id)a3;
- (void)setDistanceReferenceEndpointOffsetCm:(unsigned int)a3;
- (void)setDistanceZilchIndex:(int)a3;
- (void)setEndValidDistance:(int)a3;
- (void)setEndValidDistanceOffsetCm:(unsigned int)a3;
- (void)setEnrouteNoticeIndex:(unsigned int)a3;
- (void)setEventType:(int)a3;
- (void)setHasDistanceReferenceEndpointOffsetCm:(BOOL)a3;
- (void)setHasDistanceZilchIndex:(BOOL)a3;
- (void)setHasEndValidDistance:(BOOL)a3;
- (void)setHasEndValidDistanceOffsetCm:(BOOL)a3;
- (void)setHasEnrouteNoticeIndex:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasMaxSpeed:(BOOL)a3;
- (void)setHasMinSpeed:(BOOL)a3;
- (void)setHasOffsetForDistanceString:(BOOL)a3;
- (void)setHasPreserveEventInUpdates:(BOOL)a3;
- (void)setHasStartValidDistance:(BOOL)a3;
- (void)setHasStartValidDistanceOffsetCm:(BOOL)a3;
- (void)setHasSticky:(BOOL)a3;
- (void)setHasZilchPathIndex:(BOOL)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setImportanceInfo:(id)a3;
- (void)setJunctionView:(id)a3;
- (void)setLaneGuidance:(id)a3;
- (void)setMaxSpeed:(double)a3;
- (void)setMinSpeed:(double)a3;
- (void)setNavTrayGuidance:(id)a3;
- (void)setOffsetForDistanceString:(int)a3;
- (void)setPreserveEventInUpdates:(BOOL)a3;
- (void)setSignGuidance:(id)a3;
- (void)setSpokenGuidance:(id)a3;
- (void)setStartValidDistance:(int)a3;
- (void)setStartValidDistanceOffsetCm:(unsigned int)a3;
- (void)setSticky:(BOOL)a3;
- (void)setZilchPathIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOGuidanceEvent

- (GEOGuidanceEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOGuidanceEvent;
  v2 = [(GEOGuidanceEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOGuidanceEvent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOGuidanceEvent;
  v3 = [(GEOGuidanceEvent *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)startValidDistance
{
  return self->_startValidDistance;
}

- (void)setStartValidDistance:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800800u;
  self->_startValidDistance = a3;
}

- (void)setHasStartValidDistance:(BOOL)a3
{
  if (a3) {
    int v3 = 8390656;
  }
  else {
    int v3 = 0x800000;
  }
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasStartValidDistance
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (int)endValidDistance
{
  return self->_endValidDistance;
}

- (void)setEndValidDistance:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800020u;
  self->_endValidDistance = a3;
}

- (void)setHasEndValidDistance:(BOOL)a3
{
  if (a3) {
    int v3 = 8388640;
  }
  else {
    int v3 = 0x800000;
  }
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasEndValidDistance
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readSignGuidance
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 158) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSignGuidance_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasSignGuidance
{
  return self->_signGuidance != 0;
}

- (GEOSignGuidance)signGuidance
{
  -[GEOGuidanceEvent _readSignGuidance]((uint64_t)self);
  signGuidance = self->_signGuidance;

  return signGuidance;
}

- (void)setSignGuidance:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xA00000u;
  objc_storeStrong((id *)&self->_signGuidance, a3);
}

- (void)_readSpokenGuidance
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 158) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenGuidance_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasSpokenGuidance
{
  return self->_spokenGuidance != 0;
}

- (GEOSpokenGuidance)spokenGuidance
{
  -[GEOGuidanceEvent _readSpokenGuidance]((uint64_t)self);
  spokenGuidance = self->_spokenGuidance;

  return spokenGuidance;
}

- (void)setSpokenGuidance:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC00000u;
  objc_storeStrong((id *)&self->_spokenGuidance, a3);
}

- (void)_readLaneGuidance
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 158) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLaneGuidance_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasLaneGuidance
{
  return self->_laneGuidance != 0;
}

- (GEOVisualLaneGuidance)laneGuidance
{
  -[GEOGuidanceEvent _readLaneGuidance]((uint64_t)self);
  laneGuidance = self->_laneGuidance;

  return laneGuidance;
}

- (void)setLaneGuidance:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x880000u;
  objc_storeStrong((id *)&self->_laneGuidance, a3);
}

- (void)_readArGuidance
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 158) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArGuidance_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasArGuidance
{
  return self->_arGuidance != 0;
}

- (GEOARGuidance)arGuidance
{
  -[GEOGuidanceEvent _readArGuidance]((uint64_t)self);
  arGuidance = self->_arGuidance;

  return arGuidance;
}

- (void)setArGuidance:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x810000u;
  objc_storeStrong((id *)&self->_arGuidance, a3);
}

- (void)_readNavTrayGuidance
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 158) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNavTrayGuidance_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasNavTrayGuidance
{
  return self->_navTrayGuidance != 0;
}

- (GEONavTrayGuidance)navTrayGuidance
{
  -[GEOGuidanceEvent _readNavTrayGuidance]((uint64_t)self);
  navTrayGuidance = self->_navTrayGuidance;

  return navTrayGuidance;
}

- (void)setNavTrayGuidance:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x900000u;
  objc_storeStrong((id *)&self->_navTrayGuidance, a3);
}

- (void)_readJunctionView
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 158) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readJunctionView_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasJunctionView
{
  return self->_junctionView != 0;
}

- (GEOJunctionView)junctionView
{
  -[GEOGuidanceEvent _readJunctionView]((uint64_t)self);
  junctionView = self->_junctionView;

  return junctionView;
}

- (void)setJunctionView:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x840000u;
  objc_storeStrong((id *)&self->_junctionView, a3);
}

- (int)distanceZilchIndex
{
  return self->_distanceZilchIndex;
}

- (void)setDistanceZilchIndex:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800008u;
  self->_distanceZilchIndex = a3;
}

- (void)setHasDistanceZilchIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 8388616;
  }
  else {
    int v3 = 0x800000;
  }
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDistanceZilchIndex
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)minSpeed
{
  return self->_minSpeed;
}

- (void)setMinSpeed:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x800002u;
  self->_minSpeed = a3;
}

- (void)setHasMinSpeed:(BOOL)a3
{
  if (a3) {
    int v3 = 8388610;
  }
  else {
    int v3 = 0x800000;
  }
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasMinSpeed
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)maxSpeed
{
  return self->_maxSpeed;
}

- (void)setMaxSpeed:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x800001u;
  self->_maxSpeed = a3;
}

- (void)setHasMaxSpeed:(BOOL)a3
{
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x800000);
}

- (BOOL)hasMaxSpeed
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)eventType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $FCA46E1F49AB8635A99719300DB73115 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x80) != 0) {
    return self->_eventType;
  }
  else {
    return 0;
  }
}

- (void)setEventType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800080u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    int v3 = 8388736;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$FCA46E1F49AB8635A99719300DB73115 flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFF7FFF7F | v3);
}

- (BOOL)hasEventType
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E0210[a3];
  }

  return v3;
}

- (int)StringAsEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_GUIDANCE_EVENT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"START"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GET_ON_ROUTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RETURN_TO_ROUTE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MERGE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CONTINUE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"INITIAL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PREPARE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"EXECUTE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"LANE_MID_STEP"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LANE_MANEUVER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"END"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PRE_ARRIVAL_MODE_END"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ARRIVAL_CHARGING_STATION"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"CHARGING_AT_STATION"])
  {
    int v4 = 14;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800100u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  if (a3) {
    int v3 = 8388864;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$FCA46E1F49AB8635A99719300DB73115 flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasIdentifier
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (int)offsetForDistanceString
{
  return self->_offsetForDistanceString;
}

- (void)setOffsetForDistanceString:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800200u;
  self->_offsetForDistanceString = a3;
}

- (void)setHasOffsetForDistanceString:(BOOL)a3
{
  if (a3) {
    int v3 = 8389120;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$FCA46E1F49AB8635A99719300DB73115 flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasOffsetForDistanceString
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (BOOL)sticky
{
  return self->_sticky;
}

- (void)setSticky:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x804000u;
  self->_sticky = a3;
}

- (void)setHasSticky:(BOOL)a3
{
  if (a3) {
    int v3 = 8404992;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$FCA46E1F49AB8635A99719300DB73115 flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasSticky
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (unsigned)zilchPathIndex
{
  return self->_zilchPathIndex;
}

- (void)setZilchPathIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x801000u;
  self->_zilchPathIndex = a3;
}

- (void)setHasZilchPathIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 8392704;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$FCA46E1F49AB8635A99719300DB73115 flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasZilchPathIndex
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (unsigned)enrouteNoticeIndex
{
  return self->_enrouteNoticeIndex;
}

- (void)setEnrouteNoticeIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800040u;
  self->_enrouteNoticeIndex = a3;
}

- (void)setHasEnrouteNoticeIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 8388672;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$FCA46E1F49AB8635A99719300DB73115 flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasEnrouteNoticeIndex
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (unsigned)startValidDistanceOffsetCm
{
  return self->_startValidDistanceOffsetCm;
}

- (void)setStartValidDistanceOffsetCm:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800400u;
  self->_startValidDistanceOffsetCm = a3;
}

- (void)setHasStartValidDistanceOffsetCm:(BOOL)a3
{
  if (a3) {
    int v3 = 8389632;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$FCA46E1F49AB8635A99719300DB73115 flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasStartValidDistanceOffsetCm
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (unsigned)endValidDistanceOffsetCm
{
  return self->_endValidDistanceOffsetCm;
}

- (void)setEndValidDistanceOffsetCm:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800010u;
  self->_endValidDistanceOffsetCm = a3;
}

- (void)setHasEndValidDistanceOffsetCm:(BOOL)a3
{
  if (a3) {
    int v3 = 8388624;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$FCA46E1F49AB8635A99719300DB73115 flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasEndValidDistanceOffsetCm
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (unsigned)distanceReferenceEndpointOffsetCm
{
  return self->_distanceReferenceEndpointOffsetCm;
}

- (void)setDistanceReferenceEndpointOffsetCm:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800004u;
  self->_distanceReferenceEndpointOffsetCm = a3;
}

- (void)setHasDistanceReferenceEndpointOffsetCm:(BOOL)a3
{
  if (a3) {
    int v3 = 8388612;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$FCA46E1F49AB8635A99719300DB73115 flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDistanceReferenceEndpointOffsetCm
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)preserveEventInUpdates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $FCA46E1F49AB8635A99719300DB73115 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x2000) == 0 || self->_preserveEventInUpdates;
}

- (void)setPreserveEventInUpdates:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x802000u;
  self->_preserveEventInUpdates = a3;
}

- (void)setHasPreserveEventInUpdates:(BOOL)a3
{
  if (a3) {
    int v3 = 8396800;
  }
  else {
    int v3 = 0x800000;
  }
  self->_$FCA46E1F49AB8635A99719300DB73115 flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasPreserveEventInUpdates
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (void)_readImportanceInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 158) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImportanceInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasImportanceInfo
{
  return self->_importanceInfo != 0;
}

- (GEOGuidanceImportanceMode)importanceInfo
{
  -[GEOGuidanceEvent _readImportanceInfo]((uint64_t)self);
  importanceInfo = self->_importanceInfo;

  return importanceInfo;
}

- (void)setImportanceInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x820000u;
  objc_storeStrong((id *)&self->_importanceInfo, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOGuidanceEvent;
  int v4 = [(GEOGuidanceEvent *)&v8 description];
  v5 = [(GEOGuidanceEvent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOGuidanceEvent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_82;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int v5 = *(_DWORD *)(a1 + 156);
  if ((v5 & 0x800) != 0)
  {
    objc_super v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 144)];
    if (a2) {
      objc_super v7 = @"startValidDistance";
    }
    else {
      objc_super v7 = @"start_valid_distance";
    }
    [v4 setObject:v6 forKey:v7];

    int v5 = *(_DWORD *)(a1 + 156);
  }
  if ((v5 & 0x20) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 120)];
    if (a2) {
      v9 = @"endValidDistance";
    }
    else {
      v9 = @"end_valid_distance";
    }
    [v4 setObject:v8 forKey:v9];
  }
  v10 = [(id)a1 signGuidance];
  v11 = v10;
  if (v10)
  {
    if (a2)
    {
      v12 = [v10 jsonRepresentation];
      v13 = @"signGuidance";
    }
    else
    {
      v12 = [v10 dictionaryRepresentation];
      v13 = @"sign_guidance";
    }
    [v4 setObject:v12 forKey:v13];
  }
  v14 = [(id)a1 spokenGuidance];
  v15 = v14;
  if (v14)
  {
    if (a2)
    {
      v16 = [v14 jsonRepresentation];
      v17 = @"spokenGuidance";
    }
    else
    {
      v16 = [v14 dictionaryRepresentation];
      v17 = @"spoken_guidance";
    }
    [v4 setObject:v16 forKey:v17];
  }
  v18 = [(id)a1 laneGuidance];
  v19 = v18;
  if (v18)
  {
    if (a2)
    {
      v20 = [v18 jsonRepresentation];
      v21 = @"laneGuidance";
    }
    else
    {
      v20 = [v18 dictionaryRepresentation];
      v21 = @"lane_guidance";
    }
    [v4 setObject:v20 forKey:v21];
  }
  v22 = [(id)a1 arGuidance];
  v23 = v22;
  if (v22)
  {
    if (a2)
    {
      v24 = [v22 jsonRepresentation];
      v25 = @"arGuidance";
    }
    else
    {
      v24 = [v22 dictionaryRepresentation];
      v25 = @"ar_guidance";
    }
    [v4 setObject:v24 forKey:v25];
  }
  v26 = [(id)a1 navTrayGuidance];
  v27 = v26;
  if (v26)
  {
    if (a2)
    {
      v28 = [v26 jsonRepresentation];
      v29 = @"navTrayGuidance";
    }
    else
    {
      v28 = [v26 dictionaryRepresentation];
      v29 = @"nav_tray_guidance";
    }
    [v4 setObject:v28 forKey:v29];
  }
  v30 = [(id)a1 junctionView];
  v31 = v30;
  if (v30)
  {
    if (a2)
    {
      v32 = [v30 jsonRepresentation];
      v33 = @"junctionView";
    }
    else
    {
      v32 = [v30 dictionaryRepresentation];
      v33 = @"junction_view";
    }
    [v4 setObject:v32 forKey:v33];
  }
  int v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 8) != 0)
  {
    v41 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 112)];
    if (a2) {
      v42 = @"distanceZilchIndex";
    }
    else {
      v42 = @"distance_zilch_index";
    }
    [v4 setObject:v41 forKey:v42];

    int v34 = *(_DWORD *)(a1 + 156);
    if ((v34 & 2) == 0)
    {
LABEL_44:
      if ((v34 & 1) == 0) {
        goto LABEL_45;
      }
      goto LABEL_70;
    }
  }
  else if ((v34 & 2) == 0)
  {
    goto LABEL_44;
  }
  v43 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  if (a2) {
    v44 = @"minSpeed";
  }
  else {
    v44 = @"min_speed";
  }
  [v4 setObject:v43 forKey:v44];

  int v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 1) == 0)
  {
LABEL_45:
    if ((v34 & 0x80) == 0) {
      goto LABEL_46;
    }
    goto LABEL_74;
  }
LABEL_70:
  v45 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  if (a2) {
    v46 = @"maxSpeed";
  }
  else {
    v46 = @"max_speed";
  }
  [v4 setObject:v45 forKey:v46];

  int v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x80) == 0)
  {
LABEL_46:
    if ((v34 & 0x100) == 0) {
      goto LABEL_47;
    }
    goto LABEL_90;
  }
LABEL_74:
  uint64_t v47 = *(int *)(a1 + 128);
  if (v47 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 128));
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = off_1E53E0210[v47];
  }
  if (a2) {
    v56 = @"eventType";
  }
  else {
    v56 = @"event_type";
  }
  [v4 setObject:v48 forKey:v56];

  int v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x100) == 0)
  {
LABEL_47:
    if ((v34 & 0x200) == 0) {
      goto LABEL_48;
    }
    goto LABEL_91;
  }
LABEL_90:
  v57 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 132)];
  [v4 setObject:v57 forKey:@"identifier"];

  int v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x200) == 0)
  {
LABEL_48:
    if ((v34 & 0x4000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_95;
  }
LABEL_91:
  v58 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 136)];
  if (a2) {
    v59 = @"offsetForDistanceString";
  }
  else {
    v59 = @"offset_for_distance_string";
  }
  [v4 setObject:v58 forKey:v59];

  int v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x4000) == 0)
  {
LABEL_49:
    if ((v34 & 0x1000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_96;
  }
LABEL_95:
  v60 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 153)];
  [v4 setObject:v60 forKey:@"sticky"];

  int v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x1000) == 0)
  {
LABEL_50:
    if ((v34 & 0x40) == 0) {
      goto LABEL_51;
    }
    goto LABEL_100;
  }
LABEL_96:
  v61 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 148)];
  if (a2) {
    v62 = @"zilchPathIndex";
  }
  else {
    v62 = @"zilch_path_index";
  }
  [v4 setObject:v61 forKey:v62];

  int v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x40) == 0)
  {
LABEL_51:
    if ((v34 & 0x400) == 0) {
      goto LABEL_52;
    }
    goto LABEL_104;
  }
LABEL_100:
  v63 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 124)];
  if (a2) {
    v64 = @"enrouteNoticeIndex";
  }
  else {
    v64 = @"enroute_notice_index";
  }
  [v4 setObject:v63 forKey:v64];

  int v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x400) == 0)
  {
LABEL_52:
    if ((v34 & 0x10) == 0) {
      goto LABEL_53;
    }
    goto LABEL_108;
  }
LABEL_104:
  v65 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 140)];
  if (a2) {
    v66 = @"startValidDistanceOffsetCm";
  }
  else {
    v66 = @"start_valid_distance_offset_cm";
  }
  [v4 setObject:v65 forKey:v66];

  int v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x10) == 0)
  {
LABEL_53:
    if ((v34 & 4) == 0) {
      goto LABEL_54;
    }
LABEL_112:
    v69 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 108)];
    if (a2) {
      v70 = @"distanceReferenceEndpointOffsetCm";
    }
    else {
      v70 = @"distance_reference_endpoint_offset_cm";
    }
    [v4 setObject:v69 forKey:v70];

    if ((*(_DWORD *)(a1 + 156) & 0x2000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_55;
  }
LABEL_108:
  v67 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 116)];
  if (a2) {
    v68 = @"endValidDistanceOffsetCm";
  }
  else {
    v68 = @"end_valid_distance_offset_cm";
  }
  [v4 setObject:v67 forKey:v68];

  int v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 4) != 0) {
    goto LABEL_112;
  }
LABEL_54:
  if ((v34 & 0x2000) != 0)
  {
LABEL_55:
    v35 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 152)];
    if (a2) {
      v36 = @"preserveEventInUpdates";
    }
    else {
      v36 = @"preserve_event_in_updates";
    }
    [v4 setObject:v35 forKey:v36];
  }
LABEL_59:
  v37 = [(id)a1 importanceInfo];
  v38 = v37;
  if (v37)
  {
    if (a2)
    {
      v39 = [v37 jsonRepresentation];
      v40 = @"importanceInfo";
    }
    else
    {
      v39 = [v37 dictionaryRepresentation];
      v40 = @"importance_info";
    }
    [v4 setObject:v39 forKey:v40];
  }
  v49 = *(void **)(a1 + 16);
  if (v49)
  {
    v50 = [v49 dictionaryRepresentation];
    v51 = v50;
    if (a2)
    {
      v52 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v50, "count"));
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __46__GEOGuidanceEvent__dictionaryRepresentation___block_invoke;
      v71[3] = &unk_1E53D8860;
      id v53 = v52;
      id v72 = v53;
      [v51 enumerateKeysAndObjectsUsingBlock:v71];
      id v54 = v53;

      v51 = v54;
    }
    [v4 setObject:v51 forKey:@"Unknown Fields"];
  }
LABEL_82:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOGuidanceEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOGuidanceEvent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOGuidanceEvent)initWithDictionary:(id)a3
{
  return (GEOGuidanceEvent *)-[GEOGuidanceEvent _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_163;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_163;
  }
  if (a3) {
    objc_super v6 = @"startValidDistance";
  }
  else {
    objc_super v6 = @"start_valid_distance";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStartValidDistance:", objc_msgSend(v7, "intValue"));
  }

  if (a3) {
    objc_super v8 = @"endValidDistance";
  }
  else {
    objc_super v8 = @"end_valid_distance";
  }
  v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEndValidDistance:", objc_msgSend(v9, "intValue"));
  }

  if (a3) {
    id v10 = @"signGuidance";
  }
  else {
    id v10 = @"sign_guidance";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEOSignGuidance alloc];
    if (a3) {
      uint64_t v13 = [(GEOSignGuidance *)v12 initWithJSON:v11];
    }
    else {
      uint64_t v13 = [(GEOSignGuidance *)v12 initWithDictionary:v11];
    }
    v14 = (void *)v13;
    [a1 setSignGuidance:v13];
  }
  if (a3) {
    v15 = @"spokenGuidance";
  }
  else {
    v15 = @"spoken_guidance";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [GEOSpokenGuidance alloc];
    if (a3) {
      uint64_t v18 = [(GEOSpokenGuidance *)v17 initWithJSON:v16];
    }
    else {
      uint64_t v18 = [(GEOSpokenGuidance *)v17 initWithDictionary:v16];
    }
    v19 = (void *)v18;
    [a1 setSpokenGuidance:v18];
  }
  if (a3) {
    v20 = @"laneGuidance";
  }
  else {
    v20 = @"lane_guidance";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = [GEOVisualLaneGuidance alloc];
    if (a3) {
      uint64_t v23 = [(GEOVisualLaneGuidance *)v22 initWithJSON:v21];
    }
    else {
      uint64_t v23 = [(GEOVisualLaneGuidance *)v22 initWithDictionary:v21];
    }
    v24 = (void *)v23;
    [a1 setLaneGuidance:v23];
  }
  if (a3) {
    v25 = @"arGuidance";
  }
  else {
    v25 = @"ar_guidance";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = [GEOARGuidance alloc];
    if (a3) {
      uint64_t v28 = [(GEOARGuidance *)v27 initWithJSON:v26];
    }
    else {
      uint64_t v28 = [(GEOARGuidance *)v27 initWithDictionary:v26];
    }
    v29 = (void *)v28;
    [a1 setArGuidance:v28];
  }
  if (a3) {
    v30 = @"navTrayGuidance";
  }
  else {
    v30 = @"nav_tray_guidance";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = [GEONavTrayGuidance alloc];
    if (a3) {
      uint64_t v33 = [(GEONavTrayGuidance *)v32 initWithJSON:v31];
    }
    else {
      uint64_t v33 = [(GEONavTrayGuidance *)v32 initWithDictionary:v31];
    }
    int v34 = (void *)v33;
    [a1 setNavTrayGuidance:v33];
  }
  if (a3) {
    v35 = @"junctionView";
  }
  else {
    v35 = @"junction_view";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37 = [GEOJunctionView alloc];
    if (a3) {
      uint64_t v38 = [(GEOJunctionView *)v37 initWithJSON:v36];
    }
    else {
      uint64_t v38 = [(GEOJunctionView *)v37 initWithDictionary:v36];
    }
    v39 = (void *)v38;
    [a1 setJunctionView:v38];
  }
  if (a3) {
    v40 = @"distanceZilchIndex";
  }
  else {
    v40 = @"distance_zilch_index";
  }
  v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDistanceZilchIndex:", objc_msgSend(v41, "intValue"));
  }

  if (a3) {
    v42 = @"minSpeed";
  }
  else {
    v42 = @"min_speed";
  }
  v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v43 doubleValue];
    objc_msgSend(a1, "setMinSpeed:");
  }

  if (a3) {
    v44 = @"maxSpeed";
  }
  else {
    v44 = @"max_speed";
  }
  v45 = [v5 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v45 doubleValue];
    objc_msgSend(a1, "setMaxSpeed:");
  }

  if (a3) {
    v46 = @"eventType";
  }
  else {
    v46 = @"event_type";
  }
  uint64_t v47 = [v5 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v48 = v47;
    if ([v48 isEqualToString:@"UNKNOWN_GUIDANCE_EVENT_TYPE"])
    {
      uint64_t v49 = 0;
    }
    else if ([v48 isEqualToString:@"START"])
    {
      uint64_t v49 = 1;
    }
    else if ([v48 isEqualToString:@"GET_ON_ROUTE"])
    {
      uint64_t v49 = 2;
    }
    else if ([v48 isEqualToString:@"RETURN_TO_ROUTE"])
    {
      uint64_t v49 = 3;
    }
    else if ([v48 isEqualToString:@"MERGE"])
    {
      uint64_t v49 = 4;
    }
    else if ([v48 isEqualToString:@"CONTINUE"])
    {
      uint64_t v49 = 5;
    }
    else if ([v48 isEqualToString:@"INITIAL"])
    {
      uint64_t v49 = 6;
    }
    else if ([v48 isEqualToString:@"PREPARE"])
    {
      uint64_t v49 = 7;
    }
    else if ([v48 isEqualToString:@"EXECUTE"])
    {
      uint64_t v49 = 8;
    }
    else if ([v48 isEqualToString:@"LANE_MID_STEP"])
    {
      uint64_t v49 = 9;
    }
    else if ([v48 isEqualToString:@"LANE_MANEUVER"])
    {
      uint64_t v49 = 10;
    }
    else if ([v48 isEqualToString:@"END"])
    {
      uint64_t v49 = 11;
    }
    else if ([v48 isEqualToString:@"PRE_ARRIVAL_MODE_END"])
    {
      uint64_t v49 = 12;
    }
    else if ([v48 isEqualToString:@"ARRIVAL_CHARGING_STATION"])
    {
      uint64_t v49 = 13;
    }
    else if ([v48 isEqualToString:@"CHARGING_AT_STATION"])
    {
      uint64_t v49 = 14;
    }
    else
    {
      uint64_t v49 = 0;
    }

    goto LABEL_114;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v49 = [v47 intValue];
LABEL_114:
    [a1 setEventType:v49];
  }

  v50 = [v5 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIdentifier:", objc_msgSend(v50, "unsignedIntValue"));
  }

  if (a3) {
    v51 = @"offsetForDistanceString";
  }
  else {
    v51 = @"offset_for_distance_string";
  }
  v52 = [v5 objectForKeyedSubscript:v51];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setOffsetForDistanceString:", objc_msgSend(v52, "intValue"));
  }

  id v53 = [v5 objectForKeyedSubscript:@"sticky"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSticky:", objc_msgSend(v53, "BOOLValue"));
  }

  if (a3) {
    id v54 = @"zilchPathIndex";
  }
  else {
    id v54 = @"zilch_path_index";
  }
  v55 = [v5 objectForKeyedSubscript:v54];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setZilchPathIndex:", objc_msgSend(v55, "unsignedIntValue"));
  }

  if (a3) {
    v56 = @"enrouteNoticeIndex";
  }
  else {
    v56 = @"enroute_notice_index";
  }
  v57 = [v5 objectForKeyedSubscript:v56];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEnrouteNoticeIndex:", objc_msgSend(v57, "unsignedIntValue"));
  }

  if (a3) {
    v58 = @"startValidDistanceOffsetCm";
  }
  else {
    v58 = @"start_valid_distance_offset_cm";
  }
  v59 = [v5 objectForKeyedSubscript:v58];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStartValidDistanceOffsetCm:", objc_msgSend(v59, "unsignedIntValue"));
  }

  if (a3) {
    v60 = @"endValidDistanceOffsetCm";
  }
  else {
    v60 = @"end_valid_distance_offset_cm";
  }
  v61 = [v5 objectForKeyedSubscript:v60];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEndValidDistanceOffsetCm:", objc_msgSend(v61, "unsignedIntValue"));
  }

  if (a3) {
    v62 = @"distanceReferenceEndpointOffsetCm";
  }
  else {
    v62 = @"distance_reference_endpoint_offset_cm";
  }
  v63 = [v5 objectForKeyedSubscript:v62];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDistanceReferenceEndpointOffsetCm:", objc_msgSend(v63, "unsignedIntValue"));
  }

  if (a3) {
    v64 = @"preserveEventInUpdates";
  }
  else {
    v64 = @"preserve_event_in_updates";
  }
  v65 = [v5 objectForKeyedSubscript:v64];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPreserveEventInUpdates:", objc_msgSend(v65, "BOOLValue"));
  }

  if (a3) {
    v66 = @"importanceInfo";
  }
  else {
    v66 = @"importance_info";
  }
  v67 = [v5 objectForKeyedSubscript:v66];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v68 = [GEOGuidanceImportanceMode alloc];
    if (a3) {
      uint64_t v69 = [(GEOGuidanceImportanceMode *)v68 initWithJSON:v67];
    }
    else {
      uint64_t v69 = [(GEOGuidanceImportanceMode *)v68 initWithDictionary:v67];
    }
    v70 = (void *)v69;
    [a1 setImportanceInfo:v69];
  }
LABEL_163:

  return a1;
}

- (GEOGuidanceEvent)initWithJSON:(id)a3
{
  return (GEOGuidanceEvent *)-[GEOGuidanceEvent _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_2943;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2944;
    }
    GEOGuidanceEventReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOGuidanceEventCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOGuidanceEventIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOGuidanceEventReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOGuidanceEventIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
    goto LABEL_50;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOGuidanceEvent *)self readAll:0];
  $FCA46E1F49AB8635A99719300DB73115 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    $FCA46E1F49AB8635A99719300DB73115 flags = self->_flags;
  }
  id v6 = v10;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v6 = v10;
  }
  if (self->_signGuidance)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v10;
  }
  if (self->_spokenGuidance)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v10;
  }
  if (self->_laneGuidance)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v10;
  }
  if (self->_arGuidance)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v10;
  }
  if (self->_navTrayGuidance)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v10;
  }
  if (self->_junctionView)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v10;
  }
  $FCA46E1F49AB8635A99719300DB73115 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v6 = v10;
    $FCA46E1F49AB8635A99719300DB73115 v7 = self->_flags;
    if ((*(unsigned char *)&v7 & 2) == 0)
    {
LABEL_21:
      if ((*(unsigned char *)&v7 & 1) == 0) {
        goto LABEL_22;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)&v7 & 2) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteDoubleField();
  id v6 = v10;
  $FCA46E1F49AB8635A99719300DB73115 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 1) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v7 & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteDoubleField();
  id v6 = v10;
  $FCA46E1F49AB8635A99719300DB73115 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v7 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  id v6 = v10;
  $FCA46E1F49AB8635A99719300DB73115 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v7 & 0x200) == 0) {
      goto LABEL_25;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  id v6 = v10;
  $FCA46E1F49AB8635A99719300DB73115 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  id v6 = v10;
  $FCA46E1F49AB8635A99719300DB73115 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v7 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  id v6 = v10;
  $FCA46E1F49AB8635A99719300DB73115 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v7 & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  id v6 = v10;
  $FCA46E1F49AB8635A99719300DB73115 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v7 & 0x400) == 0) {
      goto LABEL_29;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  id v6 = v10;
  $FCA46E1F49AB8635A99719300DB73115 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v7 & 0x10) == 0) {
      goto LABEL_30;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  id v6 = v10;
  $FCA46E1F49AB8635A99719300DB73115 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v7 & 4) == 0) {
      goto LABEL_31;
    }
LABEL_47:
    PBDataWriterWriteUint32Field();
    id v6 = v10;
    if ((*(_DWORD *)&self->_flags & 0x2000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  id v6 = v10;
  $FCA46E1F49AB8635A99719300DB73115 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 4) != 0) {
    goto LABEL_47;
  }
LABEL_31:
  if ((*(_WORD *)&v7 & 0x2000) != 0)
  {
LABEL_32:
    PBDataWriterWriteBOOLField();
    id v6 = v10;
  }
LABEL_33:
  if (self->_importanceInfo)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v10;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_50:
}

- (void)copyTo:(id)a3
{
  $FCA46E1F49AB8635A99719300DB73115 v7 = (id *)a3;
  [(GEOGuidanceEvent *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 24) = self->_readerMarkPos;
  *((_DWORD *)v7 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v7;
  $FCA46E1F49AB8635A99719300DB73115 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    *((_DWORD *)v7 + 36) = self->_startValidDistance;
    *((_DWORD *)v7 + 39) |= 0x800u;
    $FCA46E1F49AB8635A99719300DB73115 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    *((_DWORD *)v7 + 30) = self->_endValidDistance;
    *((_DWORD *)v7 + 39) |= 0x20u;
  }
  if (self->_signGuidance)
  {
    objc_msgSend(v7, "setSignGuidance:");
    int v4 = v7;
  }
  if (self->_spokenGuidance)
  {
    objc_msgSend(v7, "setSpokenGuidance:");
    int v4 = v7;
  }
  if (self->_laneGuidance)
  {
    objc_msgSend(v7, "setLaneGuidance:");
    int v4 = v7;
  }
  if (self->_arGuidance)
  {
    objc_msgSend(v7, "setArGuidance:");
    int v4 = v7;
  }
  if (self->_navTrayGuidance)
  {
    objc_msgSend(v7, "setNavTrayGuidance:");
    int v4 = v7;
  }
  if (self->_junctionView)
  {
    objc_msgSend(v7, "setJunctionView:");
    int v4 = v7;
  }
  $FCA46E1F49AB8635A99719300DB73115 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 28) = self->_distanceZilchIndex;
    *((_DWORD *)v4 + 39) |= 8u;
    $FCA46E1F49AB8635A99719300DB73115 v6 = self->_flags;
    if ((*(unsigned char *)&v6 & 2) == 0)
    {
LABEL_19:
      if ((*(unsigned char *)&v6 & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)&v6 & 2) == 0)
  {
    goto LABEL_19;
  }
  v4[8] = *(id *)&self->_minSpeed;
  *((_DWORD *)v4 + 39) |= 2u;
  $FCA46E1F49AB8635A99719300DB73115 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 1) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_39;
  }
LABEL_38:
  v4[7] = *(id *)&self->_maxSpeed;
  *((_DWORD *)v4 + 39) |= 1u;
  $FCA46E1F49AB8635A99719300DB73115 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 32) = self->_eventType;
  *((_DWORD *)v4 + 39) |= 0x80u;
  $FCA46E1F49AB8635A99719300DB73115 v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_23;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 33) = self->_identifier;
  *((_DWORD *)v4 + 39) |= 0x100u;
  $FCA46E1F49AB8635A99719300DB73115 v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 34) = self->_offsetForDistanceString;
  *((_DWORD *)v4 + 39) |= 0x200u;
  $FCA46E1F49AB8635A99719300DB73115 v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((unsigned char *)v4 + 153) = self->_sticky;
  *((_DWORD *)v4 + 39) |= 0x4000u;
  $FCA46E1F49AB8635A99719300DB73115 v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_26;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 37) = self->_zilchPathIndex;
  *((_DWORD *)v4 + 39) |= 0x1000u;
  $FCA46E1F49AB8635A99719300DB73115 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_27;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 31) = self->_enrouteNoticeIndex;
  *((_DWORD *)v4 + 39) |= 0x40u;
  $FCA46E1F49AB8635A99719300DB73115 v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 35) = self->_startValidDistanceOffsetCm;
  *((_DWORD *)v4 + 39) |= 0x400u;
  $FCA46E1F49AB8635A99719300DB73115 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_29;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 29) = self->_endValidDistanceOffsetCm;
  *((_DWORD *)v4 + 39) |= 0x10u;
  $FCA46E1F49AB8635A99719300DB73115 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_47:
  *((_DWORD *)v4 + 27) = self->_distanceReferenceEndpointOffsetCm;
  *((_DWORD *)v4 + 39) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x2000) != 0)
  {
LABEL_30:
    *((unsigned char *)v4 + 152) = self->_preserveEventInUpdates;
    *((_DWORD *)v4 + 39) |= 0x2000u;
  }
LABEL_31:
  if (self->_importanceInfo)
  {
    objc_msgSend(v7, "setImportanceInfo:");
    int v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOGuidanceEvent *)self readAll:0];
    $FCA46E1F49AB8635A99719300DB73115 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) != 0)
    {
      *(_DWORD *)(v5 + 144) = self->_startValidDistance;
      *(_DWORD *)(v5 + 156) |= 0x800u;
      $FCA46E1F49AB8635A99719300DB73115 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x20) != 0)
    {
      *(_DWORD *)(v5 + 120) = self->_endValidDistance;
      *(_DWORD *)(v5 + 156) |= 0x20u;
    }
    id v10 = [(GEOSignGuidance *)self->_signGuidance copyWithZone:a3];
    v11 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v10;

    id v12 = [(GEOSpokenGuidance *)self->_spokenGuidance copyWithZone:a3];
    uint64_t v13 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v12;

    id v14 = [(GEOVisualLaneGuidance *)self->_laneGuidance copyWithZone:a3];
    v15 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v14;

    id v16 = [(GEOARGuidance *)self->_arGuidance copyWithZone:a3];
    v17 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v16;

    id v18 = [(GEONavTrayGuidance *)self->_navTrayGuidance copyWithZone:a3];
    v19 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v18;

    id v20 = [(GEOJunctionView *)self->_junctionView copyWithZone:a3];
    v21 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v20;

    $FCA46E1F49AB8635A99719300DB73115 v22 = self->_flags;
    if ((*(unsigned char *)&v22 & 8) != 0)
    {
      *(_DWORD *)(v5 + 112) = self->_distanceZilchIndex;
      *(_DWORD *)(v5 + 156) |= 8u;
      $FCA46E1F49AB8635A99719300DB73115 v22 = self->_flags;
      if ((*(unsigned char *)&v22 & 2) == 0)
      {
LABEL_11:
        if ((*(unsigned char *)&v22 & 1) == 0) {
          goto LABEL_12;
        }
        goto LABEL_27;
      }
    }
    else if ((*(unsigned char *)&v22 & 2) == 0)
    {
      goto LABEL_11;
    }
    *(double *)(v5 + 64) = self->_minSpeed;
    *(_DWORD *)(v5 + 156) |= 2u;
    $FCA46E1F49AB8635A99719300DB73115 v22 = self->_flags;
    if ((*(unsigned char *)&v22 & 1) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&v22 & 0x80) == 0) {
        goto LABEL_13;
      }
      goto LABEL_28;
    }
LABEL_27:
    *(double *)(v5 + 56) = self->_maxSpeed;
    *(_DWORD *)(v5 + 156) |= 1u;
    $FCA46E1F49AB8635A99719300DB73115 v22 = self->_flags;
    if ((*(unsigned char *)&v22 & 0x80) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&v22 & 0x100) == 0) {
        goto LABEL_14;
      }
      goto LABEL_29;
    }
LABEL_28:
    *(_DWORD *)(v5 + 128) = self->_eventType;
    *(_DWORD *)(v5 + 156) |= 0x80u;
    $FCA46E1F49AB8635A99719300DB73115 v22 = self->_flags;
    if ((*(_WORD *)&v22 & 0x100) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&v22 & 0x200) == 0) {
        goto LABEL_15;
      }
      goto LABEL_30;
    }
LABEL_29:
    *(_DWORD *)(v5 + 132) = self->_identifier;
    *(_DWORD *)(v5 + 156) |= 0x100u;
    $FCA46E1F49AB8635A99719300DB73115 v22 = self->_flags;
    if ((*(_WORD *)&v22 & 0x200) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&v22 & 0x4000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_31;
    }
LABEL_30:
    *(_DWORD *)(v5 + 136) = self->_offsetForDistanceString;
    *(_DWORD *)(v5 + 156) |= 0x200u;
    $FCA46E1F49AB8635A99719300DB73115 v22 = self->_flags;
    if ((*(_WORD *)&v22 & 0x4000) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v22 & 0x1000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_32;
    }
LABEL_31:
    *(unsigned char *)(v5 + 153) = self->_sticky;
    *(_DWORD *)(v5 + 156) |= 0x4000u;
    $FCA46E1F49AB8635A99719300DB73115 v22 = self->_flags;
    if ((*(_WORD *)&v22 & 0x1000) == 0)
    {
LABEL_17:
      if ((*(unsigned char *)&v22 & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_33;
    }
LABEL_32:
    *(_DWORD *)(v5 + 148) = self->_zilchPathIndex;
    *(_DWORD *)(v5 + 156) |= 0x1000u;
    $FCA46E1F49AB8635A99719300DB73115 v22 = self->_flags;
    if ((*(unsigned char *)&v22 & 0x40) == 0)
    {
LABEL_18:
      if ((*(_WORD *)&v22 & 0x400) == 0) {
        goto LABEL_19;
      }
      goto LABEL_34;
    }
LABEL_33:
    *(_DWORD *)(v5 + 124) = self->_enrouteNoticeIndex;
    *(_DWORD *)(v5 + 156) |= 0x40u;
    $FCA46E1F49AB8635A99719300DB73115 v22 = self->_flags;
    if ((*(_WORD *)&v22 & 0x400) == 0)
    {
LABEL_19:
      if ((*(unsigned char *)&v22 & 0x10) == 0) {
        goto LABEL_20;
      }
      goto LABEL_35;
    }
LABEL_34:
    *(_DWORD *)(v5 + 140) = self->_startValidDistanceOffsetCm;
    *(_DWORD *)(v5 + 156) |= 0x400u;
    $FCA46E1F49AB8635A99719300DB73115 v22 = self->_flags;
    if ((*(unsigned char *)&v22 & 0x10) == 0)
    {
LABEL_20:
      if ((*(unsigned char *)&v22 & 4) == 0) {
        goto LABEL_21;
      }
      goto LABEL_36;
    }
LABEL_35:
    *(_DWORD *)(v5 + 116) = self->_endValidDistanceOffsetCm;
    *(_DWORD *)(v5 + 156) |= 0x10u;
    $FCA46E1F49AB8635A99719300DB73115 v22 = self->_flags;
    if ((*(unsigned char *)&v22 & 4) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v22 & 0x2000) == 0)
      {
LABEL_23:
        id v23 = [(GEOGuidanceImportanceMode *)self->_importanceInfo copyWithZone:a3];
        v24 = *(void **)(v5 + 32);
        *(void *)(v5 + 32) = v23;

        v25 = self->_unknownFields;
        id v8 = *(id *)(v5 + 16);
        *(void *)(v5 + 16) = v25;
        goto LABEL_24;
      }
LABEL_22:
      *(unsigned char *)(v5 + 152) = self->_preserveEventInUpdates;
      *(_DWORD *)(v5 + 156) |= 0x2000u;
      goto LABEL_23;
    }
LABEL_36:
    *(_DWORD *)(v5 + 108) = self->_distanceReferenceEndpointOffsetCm;
    *(_DWORD *)(v5 + 156) |= 4u;
    if ((*(_DWORD *)&self->_flags & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  $FCA46E1F49AB8635A99719300DB73115 v7 = reader;
  objc_sync_enter(v7);
  if ((*((unsigned char *)&self->_flags + 2) & 0x80) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOGuidanceEventReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_24:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_91;
  }
  [(GEOGuidanceEvent *)self readAll:1];
  [v4 readAll:1];
  $FCA46E1F49AB8635A99719300DB73115 flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 39);
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_startValidDistance != *((_DWORD *)v4 + 36)) {
      goto LABEL_91;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_91;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_endValidDistance != *((_DWORD *)v4 + 30)) {
      goto LABEL_91;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_91;
  }
  signGuidance = self->_signGuidance;
  if ((unint64_t)signGuidance | *((void *)v4 + 10) && !-[GEOSignGuidance isEqual:](signGuidance, "isEqual:")) {
    goto LABEL_91;
  }
  spokenGuidance = self->_spokenGuidance;
  if ((unint64_t)spokenGuidance | *((void *)v4 + 11))
  {
    if (!-[GEOSpokenGuidance isEqual:](spokenGuidance, "isEqual:")) {
      goto LABEL_91;
    }
  }
  laneGuidance = self->_laneGuidance;
  if ((unint64_t)laneGuidance | *((void *)v4 + 6))
  {
    if (!-[GEOVisualLaneGuidance isEqual:](laneGuidance, "isEqual:")) {
      goto LABEL_91;
    }
  }
  arGuidance = self->_arGuidance;
  if ((unint64_t)arGuidance | *((void *)v4 + 3))
  {
    if (!-[GEOARGuidance isEqual:](arGuidance, "isEqual:")) {
      goto LABEL_91;
    }
  }
  navTrayGuidance = self->_navTrayGuidance;
  if ((unint64_t)navTrayGuidance | *((void *)v4 + 9))
  {
    if (!-[GEONavTrayGuidance isEqual:](navTrayGuidance, "isEqual:")) {
      goto LABEL_91;
    }
  }
  junctionView = self->_junctionView;
  if ((unint64_t)junctionView | *((void *)v4 + 5))
  {
    if (!-[GEOJunctionView isEqual:](junctionView, "isEqual:")) {
      goto LABEL_91;
    }
  }
  $FCA46E1F49AB8635A99719300DB73115 v13 = self->_flags;
  int v14 = *((_DWORD *)v4 + 39);
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_distanceZilchIndex != *((_DWORD *)v4 + 28)) {
      goto LABEL_91;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_91;
  }
  if ((*(unsigned char *)&v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_minSpeed != *((double *)v4 + 8)) {
      goto LABEL_91;
    }
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_91;
  }
  if (*(unsigned char *)&v13)
  {
    if ((v14 & 1) == 0 || self->_maxSpeed != *((double *)v4 + 7)) {
      goto LABEL_91;
    }
  }
  else if (v14)
  {
    goto LABEL_91;
  }
  if ((*(unsigned char *)&v13 & 0x80) != 0)
  {
    if ((v14 & 0x80) == 0 || self->_eventType != *((_DWORD *)v4 + 32)) {
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x80) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&v13 & 0x100) != 0)
  {
    if ((v14 & 0x100) == 0 || self->_identifier != *((_DWORD *)v4 + 33)) {
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x100) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&v13 & 0x200) != 0)
  {
    if ((v14 & 0x200) == 0 || self->_offsetForDistanceString != *((_DWORD *)v4 + 34)) {
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x200) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
    if ((v14 & 0x4000) == 0) {
      goto LABEL_91;
    }
    if (self->_sticky)
    {
      if (!*((unsigned char *)v4 + 153)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 153))
    {
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x4000) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
    if ((v14 & 0x1000) == 0 || self->_zilchPathIndex != *((_DWORD *)v4 + 37)) {
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x1000) != 0)
  {
    goto LABEL_91;
  }
  if ((*(unsigned char *)&v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_enrouteNoticeIndex != *((_DWORD *)v4 + 31)) {
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&v13 & 0x400) != 0)
  {
    if ((v14 & 0x400) == 0 || self->_startValidDistanceOffsetCm != *((_DWORD *)v4 + 35)) {
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x400) != 0)
  {
    goto LABEL_91;
  }
  if ((*(unsigned char *)&v13 & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_endValidDistanceOffsetCm != *((_DWORD *)v4 + 29)) {
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_91;
  }
  if ((*(unsigned char *)&v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_distanceReferenceEndpointOffsetCm != *((_DWORD *)v4 + 27)) {
      goto LABEL_91;
    }
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
    if ((v14 & 0x2000) == 0) {
      goto LABEL_97;
    }
LABEL_91:
    char v15 = 0;
    goto LABEL_92;
  }
  if ((v14 & 0x2000) == 0) {
    goto LABEL_91;
  }
  if (!self->_preserveEventInUpdates)
  {
    if (!*((unsigned char *)v4 + 152)) {
      goto LABEL_97;
    }
    goto LABEL_91;
  }
  if (!*((unsigned char *)v4 + 152)) {
    goto LABEL_91;
  }
LABEL_97:
  importanceInfo = self->_importanceInfo;
  if ((unint64_t)importanceInfo | *((void *)v4 + 4)) {
    char v15 = -[GEOGuidanceImportanceMode isEqual:](importanceInfo, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_92:

  return v15;
}

- (unint64_t)hash
{
  [(GEOGuidanceEvent *)self readAll:1];
  $FCA46E1F49AB8635A99719300DB73115 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    uint64_t v34 = 2654435761 * self->_startValidDistance;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v34 = 0;
    if ((*(unsigned char *)&flags & 0x20) != 0)
    {
LABEL_3:
      uint64_t v33 = 2654435761 * self->_endValidDistance;
      goto LABEL_6;
    }
  }
  uint64_t v33 = 0;
LABEL_6:
  unint64_t v32 = [(GEOSignGuidance *)self->_signGuidance hash];
  unint64_t v4 = [(GEOSpokenGuidance *)self->_spokenGuidance hash];
  unint64_t v5 = [(GEOVisualLaneGuidance *)self->_laneGuidance hash];
  unint64_t v6 = [(GEOARGuidance *)self->_arGuidance hash];
  unint64_t v7 = [(GEONavTrayGuidance *)self->_navTrayGuidance hash];
  unint64_t v8 = [(GEOJunctionView *)self->_junctionView hash];
  $FCA46E1F49AB8635A99719300DB73115 v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 8) != 0)
  {
    uint64_t v10 = 2654435761 * self->_distanceZilchIndex;
    if ((*(unsigned char *)&v9 & 2) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    unint64_t v15 = 0;
    goto LABEL_16;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&v9 & 2) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  double minSpeed = self->_minSpeed;
  double v12 = -minSpeed;
  if (minSpeed >= 0.0) {
    double v12 = self->_minSpeed;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_16:
  if (*(unsigned char *)&v9)
  {
    double maxSpeed = self->_maxSpeed;
    double v18 = -maxSpeed;
    if (maxSpeed >= 0.0) {
      double v18 = self->_maxSpeed;
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
  if ((*(unsigned char *)&v9 & 0x80) != 0)
  {
    uint64_t v21 = 2654435761 * self->_eventType;
    if ((*(_WORD *)&v9 & 0x100) != 0)
    {
LABEL_26:
      uint64_t v22 = 2654435761 * self->_identifier;
      if ((*(_WORD *)&v9 & 0x200) != 0) {
        goto LABEL_27;
      }
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((*(_WORD *)&v9 & 0x100) != 0) {
      goto LABEL_26;
    }
  }
  uint64_t v22 = 0;
  if ((*(_WORD *)&v9 & 0x200) != 0)
  {
LABEL_27:
    uint64_t v23 = 2654435761 * self->_offsetForDistanceString;
    if ((*(_WORD *)&v9 & 0x4000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v23 = 0;
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
LABEL_28:
    uint64_t v24 = 2654435761 * self->_sticky;
    if ((*(_WORD *)&v9 & 0x1000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v24 = 0;
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
LABEL_29:
    uint64_t v25 = 2654435761 * self->_zilchPathIndex;
    if ((*(unsigned char *)&v9 & 0x40) != 0) {
      goto LABEL_30;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v25 = 0;
  if ((*(unsigned char *)&v9 & 0x40) != 0)
  {
LABEL_30:
    uint64_t v26 = 2654435761 * self->_enrouteNoticeIndex;
    if ((*(_WORD *)&v9 & 0x400) != 0) {
      goto LABEL_31;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v26 = 0;
  if ((*(_WORD *)&v9 & 0x400) != 0)
  {
LABEL_31:
    uint64_t v27 = 2654435761 * self->_startValidDistanceOffsetCm;
    if ((*(unsigned char *)&v9 & 0x10) != 0) {
      goto LABEL_32;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v27 = 0;
  if ((*(unsigned char *)&v9 & 0x10) != 0)
  {
LABEL_32:
    uint64_t v28 = 2654435761 * self->_endValidDistanceOffsetCm;
    if ((*(unsigned char *)&v9 & 4) != 0) {
      goto LABEL_33;
    }
LABEL_43:
    uint64_t v29 = 0;
    if ((*(_WORD *)&v9 & 0x2000) != 0) {
      goto LABEL_34;
    }
LABEL_44:
    uint64_t v30 = 0;
    return v33 ^ v34 ^ v32 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v15 ^ v16 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ [(GEOGuidanceImportanceMode *)self->_importanceInfo hash];
  }
LABEL_42:
  uint64_t v28 = 0;
  if ((*(unsigned char *)&v9 & 4) == 0) {
    goto LABEL_43;
  }
LABEL_33:
  uint64_t v29 = 2654435761 * self->_distanceReferenceEndpointOffsetCm;
  if ((*(_WORD *)&v9 & 0x2000) == 0) {
    goto LABEL_44;
  }
LABEL_34:
  uint64_t v30 = 2654435761 * self->_preserveEventInUpdates;
  return v33 ^ v34 ^ v32 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v15 ^ v16 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ [(GEOGuidanceImportanceMode *)self->_importanceInfo hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = (int *)a3;
  [v21 readAll:0];
  unint64_t v4 = v21;
  int v5 = v21[39];
  if ((v5 & 0x800) != 0)
  {
    self->_startValidDistance = v21[36];
    *(_DWORD *)&self->_flags |= 0x800u;
    int v5 = v21[39];
  }
  if ((v5 & 0x20) != 0)
  {
    self->_endValidDistance = v21[30];
    *(_DWORD *)&self->_flags |= 0x20u;
  }
  signGuidance = self->_signGuidance;
  uint64_t v7 = *((void *)v21 + 10);
  if (signGuidance)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOSignGuidance mergeFrom:](signGuidance, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOGuidanceEvent setSignGuidance:](self, "setSignGuidance:");
  }
  unint64_t v4 = v21;
LABEL_11:
  spokenGuidance = self->_spokenGuidance;
  uint64_t v9 = *((void *)v4 + 11);
  if (spokenGuidance)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[GEOSpokenGuidance mergeFrom:](spokenGuidance, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[GEOGuidanceEvent setSpokenGuidance:](self, "setSpokenGuidance:");
  }
  unint64_t v4 = v21;
LABEL_17:
  laneGuidance = self->_laneGuidance;
  uint64_t v11 = *((void *)v4 + 6);
  if (laneGuidance)
  {
    if (!v11) {
      goto LABEL_23;
    }
    -[GEOVisualLaneGuidance mergeFrom:](laneGuidance, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_23;
    }
    -[GEOGuidanceEvent setLaneGuidance:](self, "setLaneGuidance:");
  }
  unint64_t v4 = v21;
LABEL_23:
  arGuidance = self->_arGuidance;
  uint64_t v13 = *((void *)v4 + 3);
  if (arGuidance)
  {
    if (!v13) {
      goto LABEL_29;
    }
    -[GEOARGuidance mergeFrom:](arGuidance, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_29;
    }
    -[GEOGuidanceEvent setArGuidance:](self, "setArGuidance:");
  }
  unint64_t v4 = v21;
LABEL_29:
  navTrayGuidance = self->_navTrayGuidance;
  uint64_t v15 = *((void *)v4 + 9);
  if (navTrayGuidance)
  {
    if (!v15) {
      goto LABEL_35;
    }
    -[GEONavTrayGuidance mergeFrom:](navTrayGuidance, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_35;
    }
    -[GEOGuidanceEvent setNavTrayGuidance:](self, "setNavTrayGuidance:");
  }
  unint64_t v4 = v21;
LABEL_35:
  junctionView = self->_junctionView;
  uint64_t v17 = *((void *)v4 + 5);
  if (junctionView)
  {
    if (!v17) {
      goto LABEL_41;
    }
    -[GEOJunctionView mergeFrom:](junctionView, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_41;
    }
    -[GEOGuidanceEvent setJunctionView:](self, "setJunctionView:");
  }
  unint64_t v4 = v21;
LABEL_41:
  int v18 = v4[39];
  if ((v18 & 8) != 0)
  {
    self->_distanceZilchIndex = v4[28];
    *(_DWORD *)&self->_flags |= 8u;
    int v18 = v4[39];
    if ((v18 & 2) == 0)
    {
LABEL_43:
      if ((v18 & 1) == 0) {
        goto LABEL_44;
      }
      goto LABEL_60;
    }
  }
  else if ((v18 & 2) == 0)
  {
    goto LABEL_43;
  }
  self->_double minSpeed = *((double *)v4 + 8);
  *(_DWORD *)&self->_flags |= 2u;
  int v18 = v4[39];
  if ((v18 & 1) == 0)
  {
LABEL_44:
    if ((v18 & 0x80) == 0) {
      goto LABEL_45;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_double maxSpeed = *((double *)v4 + 7);
  *(_DWORD *)&self->_flags |= 1u;
  int v18 = v4[39];
  if ((v18 & 0x80) == 0)
  {
LABEL_45:
    if ((v18 & 0x100) == 0) {
      goto LABEL_46;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_eventType = v4[32];
  *(_DWORD *)&self->_flags |= 0x80u;
  int v18 = v4[39];
  if ((v18 & 0x100) == 0)
  {
LABEL_46:
    if ((v18 & 0x200) == 0) {
      goto LABEL_47;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_identifier = v4[33];
  *(_DWORD *)&self->_flags |= 0x100u;
  int v18 = v4[39];
  if ((v18 & 0x200) == 0)
  {
LABEL_47:
    if ((v18 & 0x4000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_offsetForDistanceString = v4[34];
  *(_DWORD *)&self->_flags |= 0x200u;
  int v18 = v4[39];
  if ((v18 & 0x4000) == 0)
  {
LABEL_48:
    if ((v18 & 0x1000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_sticky = *((unsigned char *)v4 + 153);
  *(_DWORD *)&self->_flags |= 0x4000u;
  int v18 = v4[39];
  if ((v18 & 0x1000) == 0)
  {
LABEL_49:
    if ((v18 & 0x40) == 0) {
      goto LABEL_50;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_zilchPathIndex = v4[37];
  *(_DWORD *)&self->_flags |= 0x1000u;
  int v18 = v4[39];
  if ((v18 & 0x40) == 0)
  {
LABEL_50:
    if ((v18 & 0x400) == 0) {
      goto LABEL_51;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_enrouteNoticeIndex = v4[31];
  *(_DWORD *)&self->_flags |= 0x40u;
  int v18 = v4[39];
  if ((v18 & 0x400) == 0)
  {
LABEL_51:
    if ((v18 & 0x10) == 0) {
      goto LABEL_52;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_startValidDistanceOffsetCm = v4[35];
  *(_DWORD *)&self->_flags |= 0x400u;
  int v18 = v4[39];
  if ((v18 & 0x10) == 0)
  {
LABEL_52:
    if ((v18 & 4) == 0) {
      goto LABEL_53;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_endValidDistanceOffsetCm = v4[29];
  *(_DWORD *)&self->_flags |= 0x10u;
  int v18 = v4[39];
  if ((v18 & 4) == 0)
  {
LABEL_53:
    if ((v18 & 0x2000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_69:
  self->_distanceReferenceEndpointOffsetCm = v4[27];
  *(_DWORD *)&self->_flags |= 4u;
  if ((v4[39] & 0x2000) != 0)
  {
LABEL_54:
    self->_preserveEventInUpdates = *((unsigned char *)v4 + 152);
    *(_DWORD *)&self->_flags |= 0x2000u;
  }
LABEL_55:
  importanceInfo = self->_importanceInfo;
  uint64_t v20 = *((void *)v4 + 4);
  if (importanceInfo)
  {
    if (!v20) {
      goto LABEL_74;
    }
    -[GEOGuidanceImportanceMode mergeFrom:](importanceInfo, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_74;
    }
    -[GEOGuidanceEvent setImportanceInfo:](self, "setImportanceInfo:");
  }
  unint64_t v4 = v21;
LABEL_74:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      int v5 = reader;
      objc_sync_enter(v5);
      GEOGuidanceEventReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2948);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x808000u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOGuidanceEvent *)self readAll:0];
    [(GEOSignGuidance *)self->_signGuidance clearUnknownFields:1];
    [(GEOSpokenGuidance *)self->_spokenGuidance clearUnknownFields:1];
    [(GEOVisualLaneGuidance *)self->_laneGuidance clearUnknownFields:1];
    [(GEOARGuidance *)self->_arGuidance clearUnknownFields:1];
    [(GEONavTrayGuidance *)self->_navTrayGuidance clearUnknownFields:1];
    [(GEOJunctionView *)self->_junctionView clearUnknownFields:1];
    importanceInfo = self->_importanceInfo;
    [(GEOGuidanceImportanceMode *)importanceInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenGuidance, 0);
  objc_storeStrong((id *)&self->_signGuidance, 0);
  objc_storeStrong((id *)&self->_navTrayGuidance, 0);
  objc_storeStrong((id *)&self->_laneGuidance, 0);
  objc_storeStrong((id *)&self->_junctionView, 0);
  objc_storeStrong((id *)&self->_importanceInfo, 0);
  objc_storeStrong((id *)&self->_arGuidance, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end