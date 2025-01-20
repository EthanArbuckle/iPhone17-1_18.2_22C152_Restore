@interface GEOGuidanceEventFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDistanceToManeuver;
- (BOOL)hasDuration;
- (BOOL)hasEnrouteNoticeIndex;
- (BOOL)hasEventIndex;
- (BOOL)hasJunctionViewGuidanceFeedback;
- (BOOL)hasRouteID;
- (BOOL)hasSignGuidanceFeedback;
- (BOOL)hasSpokenGuidanceFeedback;
- (BOOL)hasStepID;
- (BOOL)hasTimeToManeuver;
- (BOOL)hasTrafficCameraGuidanceFeedback;
- (BOOL)hasTrafficSpeed;
- (BOOL)hasVehicleSpeed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOGuidanceEventFeedback)init;
- (GEOGuidanceEventFeedback)initWithData:(id)a3;
- (GEOGuidanceEventFeedback)initWithDictionary:(id)a3;
- (GEOGuidanceEventFeedback)initWithJSON:(id)a3;
- (GEOJunctionViewGuidanceFeedback)junctionViewGuidanceFeedback;
- (GEOSignGuidanceFeedback)signGuidanceFeedback;
- (GEOSpokenGuidanceFeedback)spokenGuidanceFeedback;
- (GEOTrafficCameraInformation)trafficCameraGuidanceFeedback;
- (NSData)routeID;
- (float)distanceToManeuver;
- (float)duration;
- (float)timeToManeuver;
- (float)vehicleSpeed;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)trafficSpeedAsString:(int)a3;
- (int)StringAsTrafficSpeed:(id)a3;
- (int)trafficSpeed;
- (unint64_t)hash;
- (unsigned)enrouteNoticeIndex;
- (unsigned)eventIndex;
- (unsigned)stepID;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readJunctionViewGuidanceFeedback;
- (void)_readRouteID;
- (void)_readSignGuidanceFeedback;
- (void)_readSpokenGuidanceFeedback;
- (void)_readTrafficCameraGuidanceFeedback;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDistanceToManeuver:(float)a3;
- (void)setDuration:(float)a3;
- (void)setEnrouteNoticeIndex:(unsigned int)a3;
- (void)setEventIndex:(unsigned int)a3;
- (void)setHasDistanceToManeuver:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasEnrouteNoticeIndex:(BOOL)a3;
- (void)setHasEventIndex:(BOOL)a3;
- (void)setHasStepID:(BOOL)a3;
- (void)setHasTimeToManeuver:(BOOL)a3;
- (void)setHasTrafficSpeed:(BOOL)a3;
- (void)setHasVehicleSpeed:(BOOL)a3;
- (void)setJunctionViewGuidanceFeedback:(id)a3;
- (void)setRouteID:(id)a3;
- (void)setSignGuidanceFeedback:(id)a3;
- (void)setSpokenGuidanceFeedback:(id)a3;
- (void)setStepID:(unsigned int)a3;
- (void)setTimeToManeuver:(float)a3;
- (void)setTrafficCameraGuidanceFeedback:(id)a3;
- (void)setTrafficSpeed:(int)a3;
- (void)setVehicleSpeed:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOGuidanceEventFeedback

- (GEOGuidanceEventFeedback)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOGuidanceEventFeedback;
  v2 = [(GEOGuidanceEventFeedback *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOGuidanceEventFeedback)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOGuidanceEventFeedback;
  v3 = [(GEOGuidanceEventFeedback *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRouteID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 100) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteID_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRouteID
{
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEOGuidanceEventFeedback _readRouteID]((uint64_t)self);
  routeID = self->_routeID;

  return routeID;
}

- (void)setRouteID:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2200u;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8208;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasStepID
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)enrouteNoticeIndex
{
  return self->_enrouteNoticeIndex;
}

- (void)setEnrouteNoticeIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_enrouteNoticeIndex = a3;
}

- (void)setHasEnrouteNoticeIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8196;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasEnrouteNoticeIndex
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)eventIndex
{
  return self->_eventIndex;
}

- (void)setEventIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_eventIndex = a3;
}

- (void)setHasEventIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8200;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasEventIndex
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (float)distanceToManeuver
{
  return self->_distanceToManeuver;
}

- (void)setDistanceToManeuver:(float)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_distanceToManeuver = a3;
}

- (void)setHasDistanceToManeuver:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasDistanceToManeuver
{
  return *(_WORD *)&self->_flags & 1;
}

- (float)timeToManeuver
{
  return self->_timeToManeuver;
}

- (void)setTimeToManeuver:(float)a3
{
  *(_WORD *)&self->_flags |= 0x2020u;
  self->_timeToManeuver = a3;
}

- (void)setHasTimeToManeuver:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8224;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasTimeToManeuver
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (float)vehicleSpeed
{
  return self->_vehicleSpeed;
}

- (void)setVehicleSpeed:(float)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  self->_vehicleSpeed = a3;
}

- (void)setHasVehicleSpeed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8320;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasVehicleSpeed
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (int)trafficSpeed
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0) {
    return self->_trafficSpeed;
  }
  else {
    return 4;
  }
}

- (void)setTrafficSpeed:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  self->_trafficSpeed = a3;
}

- (void)setHasTrafficSpeed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8256;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasTrafficSpeed
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (id)trafficSpeedAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E4A78[a3];
  }

  return v3;
}

- (int)StringAsTrafficSpeed:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CLOSED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SLOW"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MEDIUM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FAST"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SPEED_NONE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (float)duration
{
  return self->_duration;
}

- (void)setDuration:(float)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8194;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readSignGuidanceFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 100) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSignGuidanceFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSignGuidanceFeedback
{
  return self->_signGuidanceFeedback != 0;
}

- (GEOSignGuidanceFeedback)signGuidanceFeedback
{
  -[GEOGuidanceEventFeedback _readSignGuidanceFeedback]((uint64_t)self);
  signGuidanceFeedback = self->_signGuidanceFeedback;

  return signGuidanceFeedback;
}

- (void)setSignGuidanceFeedback:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_signGuidanceFeedback, a3);
}

- (void)_readSpokenGuidanceFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 100) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenGuidanceFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSpokenGuidanceFeedback
{
  return self->_spokenGuidanceFeedback != 0;
}

- (GEOSpokenGuidanceFeedback)spokenGuidanceFeedback
{
  -[GEOGuidanceEventFeedback _readSpokenGuidanceFeedback]((uint64_t)self);
  spokenGuidanceFeedback = self->_spokenGuidanceFeedback;

  return spokenGuidanceFeedback;
}

- (void)setSpokenGuidanceFeedback:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2800u;
  objc_storeStrong((id *)&self->_spokenGuidanceFeedback, a3);
}

- (void)_readJunctionViewGuidanceFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 100) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readJunctionViewGuidanceFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasJunctionViewGuidanceFeedback
{
  return self->_junctionViewGuidanceFeedback != 0;
}

- (GEOJunctionViewGuidanceFeedback)junctionViewGuidanceFeedback
{
  -[GEOGuidanceEventFeedback _readJunctionViewGuidanceFeedback]((uint64_t)self);
  junctionViewGuidanceFeedback = self->_junctionViewGuidanceFeedback;

  return junctionViewGuidanceFeedback;
}

- (void)setJunctionViewGuidanceFeedback:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2100u;
  objc_storeStrong((id *)&self->_junctionViewGuidanceFeedback, a3);
}

- (void)_readTrafficCameraGuidanceFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 100) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficCameraGuidanceFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTrafficCameraGuidanceFeedback
{
  return self->_trafficCameraGuidanceFeedback != 0;
}

- (GEOTrafficCameraInformation)trafficCameraGuidanceFeedback
{
  -[GEOGuidanceEventFeedback _readTrafficCameraGuidanceFeedback]((uint64_t)self);
  trafficCameraGuidanceFeedback = self->_trafficCameraGuidanceFeedback;

  return trafficCameraGuidanceFeedback;
}

- (void)setTrafficCameraGuidanceFeedback:(id)a3
{
  *(_WORD *)&self->_flags |= 0x3000u;
  objc_storeStrong((id *)&self->_trafficCameraGuidanceFeedback, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOGuidanceEventFeedback;
  int v4 = [(GEOGuidanceEventFeedback *)&v8 description];
  v5 = [(GEOGuidanceEventFeedback *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOGuidanceEventFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
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
  v5 = [(id)a1 routeID];
  objc_super v6 = v5;
  if (v5)
  {
    if (a2)
    {
      objc_super v7 = [v5 base64EncodedStringWithOptions:0];
      [v4 setObject:v7 forKey:@"routeID"];
    }
    else
    {
      [v4 setObject:v5 forKey:@"routeID"];
    }
  }

  __int16 v9 = *(_WORD *)(a1 + 100);
  if ((v9 & 0x10) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
    [v4 setObject:v15 forKey:@"stepID"];

    __int16 v9 = *(_WORD *)(a1 + 100);
    if ((v9 & 4) == 0)
    {
LABEL_8:
      if ((v9 & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_23;
    }
  }
  else if ((v9 & 4) == 0)
  {
    goto LABEL_8;
  }
  v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
  if (a2) {
    v17 = @"enrouteNoticeIndex";
  }
  else {
    v17 = @"enroute_notice_index";
  }
  [v4 setObject:v16 forKey:v17];

  __int16 v9 = *(_WORD *)(a1 + 100);
  if ((v9 & 8) == 0)
  {
LABEL_9:
    if ((v9 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_23:
  v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 80)];
  if (a2) {
    v19 = @"eventIndex";
  }
  else {
    v19 = @"event_index";
  }
  [v4 setObject:v18 forKey:v19];

  __int16 v9 = *(_WORD *)(a1 + 100);
  if ((v9 & 1) == 0)
  {
LABEL_10:
    if ((v9 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_27:
  LODWORD(v8) = *(_DWORD *)(a1 + 68);
  v20 = [NSNumber numberWithFloat:v8];
  if (a2) {
    v21 = @"distanceToManeuver";
  }
  else {
    v21 = @"distance_to_maneuver";
  }
  [v4 setObject:v20 forKey:v21];

  __int16 v9 = *(_WORD *)(a1 + 100);
  if ((v9 & 0x20) == 0)
  {
LABEL_11:
    if ((v9 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_31:
  LODWORD(v8) = *(_DWORD *)(a1 + 88);
  v22 = [NSNumber numberWithFloat:v8];
  if (a2) {
    v23 = @"timeToManeuver";
  }
  else {
    v23 = @"time_to_maneuver";
  }
  [v4 setObject:v22 forKey:v23];

  __int16 v9 = *(_WORD *)(a1 + 100);
  if ((v9 & 0x80) == 0)
  {
LABEL_12:
    if ((v9 & 0x40) == 0) {
      goto LABEL_13;
    }
LABEL_39:
    uint64_t v26 = *(int *)(a1 + 92);
    if (v26 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 92));
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_1E53E4A78[v26];
    }
    if (a2) {
      v41 = @"trafficSpeed";
    }
    else {
      v41 = @"traffic_speed";
    }
    [v4 setObject:v27 forKey:v41];

    if ((*(_WORD *)(a1 + 100) & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_35:
  LODWORD(v8) = *(_DWORD *)(a1 + 96);
  v24 = [NSNumber numberWithFloat:v8];
  if (a2) {
    v25 = @"vehicleSpeed";
  }
  else {
    v25 = @"vehicle_speed";
  }
  [v4 setObject:v24 forKey:v25];

  __int16 v9 = *(_WORD *)(a1 + 100);
  if ((v9 & 0x40) != 0) {
    goto LABEL_39;
  }
LABEL_13:
  if ((v9 & 2) != 0)
  {
LABEL_14:
    LODWORD(v8) = *(_DWORD *)(a1 + 72);
    v10 = [NSNumber numberWithFloat:v8];
    [v4 setObject:v10 forKey:@"duration"];
  }
LABEL_15:
  v11 = [(id)a1 signGuidanceFeedback];
  v12 = v11;
  if (v11)
  {
    if (a2)
    {
      v13 = [v11 jsonRepresentation];
      v14 = @"signGuidanceFeedback";
    }
    else
    {
      v13 = [v11 dictionaryRepresentation];
      v14 = @"sign_guidance_feedback";
    }
    [v4 setObject:v13 forKey:v14];
  }
  v28 = [(id)a1 spokenGuidanceFeedback];
  v29 = v28;
  if (v28)
  {
    if (a2)
    {
      v30 = [v28 jsonRepresentation];
      v31 = @"spokenGuidanceFeedback";
    }
    else
    {
      v30 = [v28 dictionaryRepresentation];
      v31 = @"spoken_guidance_feedback";
    }
    [v4 setObject:v30 forKey:v31];
  }
  v32 = [(id)a1 junctionViewGuidanceFeedback];
  v33 = v32;
  if (v32)
  {
    if (a2)
    {
      v34 = [v32 jsonRepresentation];
      v35 = @"junctionViewGuidanceFeedback";
    }
    else
    {
      v34 = [v32 dictionaryRepresentation];
      v35 = @"junction_view_guidance_feedback";
    }
    [v4 setObject:v34 forKey:v35];
  }
  v36 = [(id)a1 trafficCameraGuidanceFeedback];
  v37 = v36;
  if (v36)
  {
    if (a2)
    {
      v38 = [v36 jsonRepresentation];
      v39 = @"trafficCameraGuidanceFeedback";
    }
    else
    {
      v38 = [v36 dictionaryRepresentation];
      v39 = @"traffic_camera_guidance_feedback";
    }
    [v4 setObject:v38 forKey:v39];
  }
LABEL_59:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOGuidanceEventFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOGuidanceEventFeedback)initWithDictionary:(id)a3
{
  return (GEOGuidanceEventFeedback *)-[GEOGuidanceEventFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_86;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_86;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"routeID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
    [a1 setRouteID:v7];
  }
  double v8 = [v5 objectForKeyedSubscript:@"stepID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStepID:", objc_msgSend(v8, "unsignedIntValue"));
  }

  if (a3) {
    __int16 v9 = @"enrouteNoticeIndex";
  }
  else {
    __int16 v9 = @"enroute_notice_index";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEnrouteNoticeIndex:", objc_msgSend(v10, "unsignedIntValue"));
  }

  if (a3) {
    v11 = @"eventIndex";
  }
  else {
    v11 = @"event_index";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEventIndex:", objc_msgSend(v12, "unsignedIntValue"));
  }

  if (a3) {
    v13 = @"distanceToManeuver";
  }
  else {
    v13 = @"distance_to_maneuver";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v14 floatValue];
    objc_msgSend(a1, "setDistanceToManeuver:");
  }

  if (a3) {
    v15 = @"timeToManeuver";
  }
  else {
    v15 = @"time_to_maneuver";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v16 floatValue];
    objc_msgSend(a1, "setTimeToManeuver:");
  }

  if (a3) {
    v17 = @"vehicleSpeed";
  }
  else {
    v17 = @"vehicle_speed";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v18 floatValue];
    objc_msgSend(a1, "setVehicleSpeed:");
  }

  if (a3) {
    v19 = @"trafficSpeed";
  }
  else {
    v19 = @"traffic_speed";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v20;
    if ([v21 isEqualToString:@"CLOSED"])
    {
      uint64_t v22 = 0;
    }
    else if ([v21 isEqualToString:@"SLOW"])
    {
      uint64_t v22 = 1;
    }
    else if ([v21 isEqualToString:@"MEDIUM"])
    {
      uint64_t v22 = 2;
    }
    else if ([v21 isEqualToString:@"FAST"])
    {
      uint64_t v22 = 3;
    }
    else if ([v21 isEqualToString:@"SPEED_NONE"])
    {
      uint64_t v22 = 4;
    }
    else
    {
      uint64_t v22 = 0;
    }

    goto LABEL_50;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v22 = [v20 intValue];
LABEL_50:
    [a1 setTrafficSpeed:v22];
  }

  v23 = [v5 objectForKeyedSubscript:@"duration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v23 floatValue];
    objc_msgSend(a1, "setDuration:");
  }

  if (a3) {
    v24 = @"signGuidanceFeedback";
  }
  else {
    v24 = @"sign_guidance_feedback";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v26 = [GEOSignGuidanceFeedback alloc];
    if (a3) {
      uint64_t v27 = [(GEOSignGuidanceFeedback *)v26 initWithJSON:v25];
    }
    else {
      uint64_t v27 = [(GEOSignGuidanceFeedback *)v26 initWithDictionary:v25];
    }
    v28 = (void *)v27;
    [a1 setSignGuidanceFeedback:v27];
  }
  if (a3) {
    v29 = @"spokenGuidanceFeedback";
  }
  else {
    v29 = @"spoken_guidance_feedback";
  }
  v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = [GEOSpokenGuidanceFeedback alloc];
    if (a3) {
      uint64_t v32 = [(GEOSpokenGuidanceFeedback *)v31 initWithJSON:v30];
    }
    else {
      uint64_t v32 = [(GEOSpokenGuidanceFeedback *)v31 initWithDictionary:v30];
    }
    v33 = (void *)v32;
    [a1 setSpokenGuidanceFeedback:v32];
  }
  if (a3) {
    v34 = @"junctionViewGuidanceFeedback";
  }
  else {
    v34 = @"junction_view_guidance_feedback";
  }
  v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36 = [GEOJunctionViewGuidanceFeedback alloc];
    if (a3) {
      uint64_t v37 = [(GEOJunctionViewGuidanceFeedback *)v36 initWithJSON:v35];
    }
    else {
      uint64_t v37 = [(GEOJunctionViewGuidanceFeedback *)v36 initWithDictionary:v35];
    }
    v38 = (void *)v37;
    [a1 setJunctionViewGuidanceFeedback:v37];
  }
  if (a3) {
    v39 = @"trafficCameraGuidanceFeedback";
  }
  else {
    v39 = @"traffic_camera_guidance_feedback";
  }
  v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41 = [GEOTrafficCameraInformation alloc];
    if (a3) {
      uint64_t v42 = [(GEOTrafficCameraInformation *)v41 initWithJSON:v40];
    }
    else {
      uint64_t v42 = [(GEOTrafficCameraInformation *)v41 initWithDictionary:v40];
    }
    v43 = (void *)v42;
    [a1 setTrafficCameraGuidanceFeedback:v42];
  }
LABEL_86:

  return a1;
}

- (GEOGuidanceEventFeedback)initWithJSON:(id)a3
{
  return (GEOGuidanceEventFeedback *)-[GEOGuidanceEventFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      double v8 = (int *)&readAll__recursiveTag_471;
    }
    else {
      double v8 = (int *)&readAll__nonRecursiveTag_472;
    }
    GEOGuidanceEventFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOGuidanceEventFeedbackCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOGuidanceEventFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOGuidanceEventFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x3F00) == 0)
    {
      objc_super v6 = self->_reader;
      objc_sync_enter(v6);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v8 writeData:v7];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v6);
      goto LABEL_31;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOGuidanceEventFeedback *)self readAll:0];
  if (self->_routeID) {
    PBDataWriterWriteDataField();
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_24;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_8:
    if ((flags & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_9:
    if ((flags & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_10:
    if ((flags & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteFloatField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_11:
    if ((flags & 0x40) == 0) {
      goto LABEL_12;
    }
LABEL_28:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_flags & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  PBDataWriterWriteFloatField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0) {
    goto LABEL_28;
  }
LABEL_12:
  if ((flags & 2) != 0) {
LABEL_13:
  }
    PBDataWriterWriteFloatField();
LABEL_14:
  if (self->_signGuidanceFeedback) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_spokenGuidanceFeedback) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_junctionViewGuidanceFeedback) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_trafficCameraGuidanceFeedback) {
    PBDataWriterWriteSubmessage();
  }
LABEL_31:
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOGuidanceEventFeedback *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_routeID) {
    objc_msgSend(v6, "setRouteID:");
  }
  __int16 flags = (__int16)self->_flags;
  id v5 = v6;
  if ((flags & 0x10) != 0)
  {
    *((_DWORD *)v6 + 21) = self->_stepID;
    *((_WORD *)v6 + 50) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_25;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 19) = self->_enrouteNoticeIndex;
  *((_WORD *)v6 + 50) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v6 + 20) = self->_eventIndex;
  *((_WORD *)v6 + 50) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_7:
    if ((flags & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v6 + 17) = LODWORD(self->_distanceToManeuver);
  *((_WORD *)v6 + 50) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_8:
    if ((flags & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v6 + 22) = LODWORD(self->_timeToManeuver);
  *((_WORD *)v6 + 50) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_9:
    if ((flags & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v6 + 24) = LODWORD(self->_vehicleSpeed);
  *((_WORD *)v6 + 50) |= 0x80u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_10:
    if ((flags & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_29:
  *((_DWORD *)v6 + 23) = self->_trafficSpeed;
  *((_WORD *)v6 + 50) |= 0x40u;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
LABEL_11:
    *((_DWORD *)v6 + 18) = LODWORD(self->_duration);
    *((_WORD *)v6 + 50) |= 2u;
  }
LABEL_12:
  if (self->_signGuidanceFeedback)
  {
    objc_msgSend(v6, "setSignGuidanceFeedback:");
    id v5 = v6;
  }
  if (self->_spokenGuidanceFeedback)
  {
    objc_msgSend(v6, "setSpokenGuidanceFeedback:");
    id v5 = v6;
  }
  if (self->_junctionViewGuidanceFeedback)
  {
    objc_msgSend(v6, "setJunctionViewGuidanceFeedback:");
    id v5 = v6;
  }
  if (self->_trafficCameraGuidanceFeedback)
  {
    objc_msgSend(v6, "setTrafficCameraGuidanceFeedback:");
    id v5 = v6;
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
    [(GEOGuidanceEventFeedback *)self readAll:0];
    uint64_t v9 = [(NSData *)self->_routeID copyWithZone:a3];
    v10 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v9;

    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(_DWORD *)(v5 + 84) = self->_stepID;
      *(_WORD *)(v5 + 100) |= 0x10u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 8) == 0) {
          goto LABEL_8;
        }
        goto LABEL_18;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 76) = self->_enrouteNoticeIndex;
    *(_WORD *)(v5 + 100) |= 4u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_8:
      if ((flags & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
LABEL_18:
    *(_DWORD *)(v5 + 80) = self->_eventIndex;
    *(_WORD *)(v5 + 100) |= 8u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_9:
      if ((flags & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
LABEL_19:
    *(float *)(v5 + 68) = self->_distanceToManeuver;
    *(_WORD *)(v5 + 100) |= 1u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_10:
      if ((flags & 0x80) == 0) {
        goto LABEL_11;
      }
      goto LABEL_21;
    }
LABEL_20:
    *(float *)(v5 + 88) = self->_timeToManeuver;
    *(_WORD *)(v5 + 100) |= 0x20u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x80) == 0)
    {
LABEL_11:
      if ((flags & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_22;
    }
LABEL_21:
    *(float *)(v5 + 96) = self->_vehicleSpeed;
    *(_WORD *)(v5 + 100) |= 0x80u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_12:
      if ((flags & 2) == 0)
      {
LABEL_14:
        id v12 = [(GEOSignGuidanceFeedback *)self->_signGuidanceFeedback copyWithZone:a3];
        v13 = *(void **)(v5 + 32);
        *(void *)(v5 + 32) = v12;

        id v14 = [(GEOSpokenGuidanceFeedback *)self->_spokenGuidanceFeedback copyWithZone:a3];
        v15 = *(void **)(v5 + 40);
        *(void *)(v5 + 40) = v14;

        id v16 = [(GEOJunctionViewGuidanceFeedback *)self->_junctionViewGuidanceFeedback copyWithZone:a3];
        v17 = *(void **)(v5 + 16);
        *(void *)(v5 + 16) = v16;

        id v18 = [(GEOTrafficCameraInformation *)self->_trafficCameraGuidanceFeedback copyWithZone:a3];
        id v8 = *(id *)(v5 + 48);
        *(void *)(v5 + 48) = v18;
        goto LABEL_15;
      }
LABEL_13:
      *(float *)(v5 + 72) = self->_duration;
      *(_WORD *)(v5 + 100) |= 2u;
      goto LABEL_14;
    }
LABEL_22:
    *(_DWORD *)(v5 + 92) = self->_trafficSpeed;
    *(_WORD *)(v5 + 100) |= 0x40u;
    if ((*(_WORD *)&self->_flags & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOGuidanceEventFeedbackReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_15:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  [(GEOGuidanceEventFeedback *)self readAll:1];
  [v4 readAll:1];
  routeID = self->_routeID;
  if ((unint64_t)routeID | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](routeID, "isEqual:")) {
      goto LABEL_52;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 50);
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_stepID != *((_DWORD *)v4 + 21)) {
      goto LABEL_52;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
LABEL_52:
    char v12 = 0;
    goto LABEL_53;
  }
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_enrouteNoticeIndex != *((_DWORD *)v4 + 19)) {
      goto LABEL_52;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_eventIndex != *((_DWORD *)v4 + 20)) {
      goto LABEL_52;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_52;
  }
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_distanceToManeuver != *((float *)v4 + 17)) {
      goto LABEL_52;
    }
  }
  else if (v7)
  {
    goto LABEL_52;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_timeToManeuver != *((float *)v4 + 22)) {
      goto LABEL_52;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_vehicleSpeed != *((float *)v4 + 24)) {
      goto LABEL_52;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_trafficSpeed != *((_DWORD *)v4 + 23)) {
      goto LABEL_52;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_duration != *((float *)v4 + 18)) {
      goto LABEL_52;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_52;
  }
  signGuidanceFeedback = self->_signGuidanceFeedback;
  if ((unint64_t)signGuidanceFeedback | *((void *)v4 + 4)
    && !-[GEOSignGuidanceFeedback isEqual:](signGuidanceFeedback, "isEqual:"))
  {
    goto LABEL_52;
  }
  spokenGuidanceFeedback = self->_spokenGuidanceFeedback;
  if ((unint64_t)spokenGuidanceFeedback | *((void *)v4 + 5))
  {
    if (!-[GEOSpokenGuidanceFeedback isEqual:](spokenGuidanceFeedback, "isEqual:")) {
      goto LABEL_52;
    }
  }
  junctionViewGuidanceFeedback = self->_junctionViewGuidanceFeedback;
  if ((unint64_t)junctionViewGuidanceFeedback | *((void *)v4 + 2))
  {
    if (!-[GEOJunctionViewGuidanceFeedback isEqual:](junctionViewGuidanceFeedback, "isEqual:")) {
      goto LABEL_52;
    }
  }
  trafficCameraGuidanceFeedback = self->_trafficCameraGuidanceFeedback;
  if ((unint64_t)trafficCameraGuidanceFeedback | *((void *)v4 + 6)) {
    char v12 = -[GEOTrafficCameraInformation isEqual:](trafficCameraGuidanceFeedback, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_53:

  return v12;
}

- (unint64_t)hash
{
  [(GEOGuidanceEventFeedback *)self readAll:1];
  uint64_t v33 = [(NSData *)self->_routeID hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    uint64_t v4 = 2654435761 * self->_stepID;
    if ((flags & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_enrouteNoticeIndex;
      if ((flags & 8) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v6 = 0;
      if (flags) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((flags & 8) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_eventIndex;
  if ((flags & 1) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  float distanceToManeuver = self->_distanceToManeuver;
  double v8 = distanceToManeuver;
  if (distanceToManeuver < 0.0) {
    double v8 = -distanceToManeuver;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_15:
  if ((flags & 0x20) != 0)
  {
    float timeToManeuver = self->_timeToManeuver;
    double v14 = timeToManeuver;
    if (timeToManeuver < 0.0) {
      double v14 = -timeToManeuver;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if ((flags & 0x80) != 0)
  {
    float vehicleSpeed = self->_vehicleSpeed;
    double v19 = vehicleSpeed;
    if (vehicleSpeed < 0.0) {
      double v19 = -vehicleSpeed;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v17 += (unint64_t)v21;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  if ((flags & 0x40) != 0)
  {
    uint64_t v22 = 2654435761 * self->_trafficSpeed;
    if ((flags & 2) != 0) {
      goto LABEL_33;
    }
LABEL_38:
    unint64_t v27 = 0;
    goto LABEL_41;
  }
  uint64_t v22 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_38;
  }
LABEL_33:
  float duration = self->_duration;
  double v24 = duration;
  if (duration < 0.0) {
    double v24 = -duration;
  }
  long double v25 = floor(v24 + 0.5);
  double v26 = (v24 - v25) * 1.84467441e19;
  unint64_t v27 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
  if (v26 >= 0.0)
  {
    if (v26 > 0.0) {
      v27 += (unint64_t)v26;
    }
  }
  else
  {
    v27 -= (unint64_t)fabs(v26);
  }
LABEL_41:
  unint64_t v28 = v4 ^ v33 ^ v5 ^ v6 ^ v11 ^ v12 ^ v17 ^ v22 ^ v27;
  unint64_t v29 = [(GEOSignGuidanceFeedback *)self->_signGuidanceFeedback hash];
  unint64_t v30 = v28 ^ v29 ^ [(GEOSpokenGuidanceFeedback *)self->_spokenGuidanceFeedback hash];
  unint64_t v31 = [(GEOJunctionViewGuidanceFeedback *)self->_junctionViewGuidanceFeedback hash];
  return v30 ^ v31 ^ [(GEOTrafficCameraInformation *)self->_trafficCameraGuidanceFeedback hash];
}

- (void)mergeFrom:(id)a3
{
  double v14 = a3;
  [v14 readAll:0];
  uint64_t v4 = v14;
  if (v14[3])
  {
    [(GEOGuidanceEventFeedback *)self setRouteID:"setRouteID:"];
    uint64_t v4 = v14;
  }
  __int16 v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x10) != 0)
  {
    self->_stepID = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v5 = *((_WORD *)v4 + 50);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_enrouteNoticeIndex = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_flags |= 4u;
  __int16 v5 = *((_WORD *)v4 + 50);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_eventIndex = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_flags |= 8u;
  __int16 v5 = *((_WORD *)v4 + 50);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_float distanceToManeuver = *((float *)v4 + 17);
  *(_WORD *)&self->_flags |= 1u;
  __int16 v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_float timeToManeuver = *((float *)v4 + 22);
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_float vehicleSpeed = *((float *)v4 + 24);
  *(_WORD *)&self->_flags |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  self->_trafficSpeed = *((_DWORD *)v4 + 23);
  *(_WORD *)&self->_flags |= 0x40u;
  if ((*((_WORD *)v4 + 50) & 2) != 0)
  {
LABEL_11:
    self->_float duration = *((float *)v4 + 18);
    *(_WORD *)&self->_flags |= 2u;
  }
LABEL_12:
  signGuidanceFeedback = self->_signGuidanceFeedback;
  uint64_t v7 = v4[4];
  if (signGuidanceFeedback)
  {
    if (!v7) {
      goto LABEL_26;
    }
    -[GEOSignGuidanceFeedback mergeFrom:](signGuidanceFeedback, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_26;
    }
    -[GEOGuidanceEventFeedback setSignGuidanceFeedback:](self, "setSignGuidanceFeedback:");
  }
  uint64_t v4 = v14;
LABEL_26:
  spokenGuidanceFeedback = self->_spokenGuidanceFeedback;
  uint64_t v9 = v4[5];
  if (spokenGuidanceFeedback)
  {
    if (!v9) {
      goto LABEL_32;
    }
    -[GEOSpokenGuidanceFeedback mergeFrom:](spokenGuidanceFeedback, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_32;
    }
    -[GEOGuidanceEventFeedback setSpokenGuidanceFeedback:](self, "setSpokenGuidanceFeedback:");
  }
  uint64_t v4 = v14;
LABEL_32:
  junctionViewGuidanceFeedback = self->_junctionViewGuidanceFeedback;
  uint64_t v11 = v4[2];
  if (junctionViewGuidanceFeedback)
  {
    if (!v11) {
      goto LABEL_38;
    }
    -[GEOJunctionViewGuidanceFeedback mergeFrom:](junctionViewGuidanceFeedback, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_38;
    }
    -[GEOGuidanceEventFeedback setJunctionViewGuidanceFeedback:](self, "setJunctionViewGuidanceFeedback:");
  }
  uint64_t v4 = v14;
LABEL_38:
  trafficCameraGuidanceFeedback = self->_trafficCameraGuidanceFeedback;
  uint64_t v13 = v4[6];
  if (trafficCameraGuidanceFeedback)
  {
    if (!v13) {
      goto LABEL_44;
    }
    -[GEOTrafficCameraInformation mergeFrom:](trafficCameraGuidanceFeedback, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_44;
    }
    -[GEOGuidanceEventFeedback setTrafficCameraGuidanceFeedback:](self, "setTrafficCameraGuidanceFeedback:");
  }
  uint64_t v4 = v14;
LABEL_44:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficCameraGuidanceFeedback, 0);
  objc_storeStrong((id *)&self->_spokenGuidanceFeedback, 0);
  objc_storeStrong((id *)&self->_signGuidanceFeedback, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_junctionViewGuidanceFeedback, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end