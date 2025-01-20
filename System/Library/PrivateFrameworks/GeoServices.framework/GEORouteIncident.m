@interface GEORouteIncident
+ (BOOL)isValid:(id)a3;
+ (Class)userReportIdType;
- (BOOL)endTimeReliable;
- (BOOL)hasArtwork;
- (BOOL)hasCrossStreet;
- (BOOL)hasDelaySeconds;
- (BOOL)hasEndTime;
- (BOOL)hasEndTimeReliable;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIncidentId;
- (BOOL)hasInfo;
- (BOOL)hasLaneClosureCount;
- (BOOL)hasLaneClosureType;
- (BOOL)hasPosition;
- (BOOL)hasRestrictionInfo;
- (BOOL)hasShouldDisplayOnMap;
- (BOOL)hasSignificance;
- (BOOL)hasStartTime;
- (BOOL)hasStreet;
- (BOOL)hasType;
- (BOOL)hasUpdateTime;
- (BOOL)hasUserReportsCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldDisplayOnMap;
- (GEOLatLng)position;
- (GEOPBTransitArtwork)artwork;
- (GEORestrictionInfo)restrictionInfo;
- (GEORouteIncident)init;
- (GEORouteIncident)initWithData:(id)a3;
- (GEORouteIncident)initWithDictionary:(id)a3;
- (GEORouteIncident)initWithJSON:(id)a3;
- (NSMutableArray)userReportIds;
- (NSString)crossStreet;
- (NSString)incidentId;
- (NSString)info;
- (NSString)street;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)laneClosureTypeAsString:(int)a3;
- (id)significanceAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (id)userReportIdAtIndex:(unint64_t)a3;
- (int)StringAsLaneClosureType:(id)a3;
- (int)StringAsSignificance:(id)a3;
- (int)StringAsType:(id)a3;
- (int)laneClosureType;
- (int)significance;
- (int)type;
- (int64_t)endTime;
- (int64_t)startTime;
- (int64_t)updateTime;
- (unint64_t)hash;
- (unint64_t)userReportIdsCount;
- (unsigned)delaySeconds;
- (unsigned)laneClosureCount;
- (unsigned)userReportsCount;
- (void)_addNoFlagsUserReportId:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArtwork;
- (void)_readCrossStreet;
- (void)_readIncidentId;
- (void)_readInfo;
- (void)_readPosition;
- (void)_readRestrictionInfo;
- (void)_readStreet;
- (void)_readUserReportIds;
- (void)addUserReportId:(id)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearUserReportIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArtwork:(id)a3;
- (void)setCrossStreet:(id)a3;
- (void)setDelaySeconds:(unsigned int)a3;
- (void)setEndTime:(int64_t)a3;
- (void)setEndTimeReliable:(BOOL)a3;
- (void)setHasDelaySeconds:(BOOL)a3;
- (void)setHasEndTime:(BOOL)a3;
- (void)setHasEndTimeReliable:(BOOL)a3;
- (void)setHasLaneClosureCount:(BOOL)a3;
- (void)setHasLaneClosureType:(BOOL)a3;
- (void)setHasShouldDisplayOnMap:(BOOL)a3;
- (void)setHasSignificance:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasUpdateTime:(BOOL)a3;
- (void)setHasUserReportsCount:(BOOL)a3;
- (void)setIncidentId:(id)a3;
- (void)setInfo:(id)a3;
- (void)setLaneClosureCount:(unsigned int)a3;
- (void)setLaneClosureType:(int)a3;
- (void)setPosition:(id)a3;
- (void)setRestrictionInfo:(id)a3;
- (void)setShouldDisplayOnMap:(BOOL)a3;
- (void)setSignificance:(int)a3;
- (void)setStartTime:(int64_t)a3;
- (void)setStreet:(id)a3;
- (void)setType:(int)a3;
- (void)setUpdateTime:(int64_t)a3;
- (void)setUserReportIds:(id)a3;
- (void)setUserReportsCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORouteIncident

- (GEORouteIncident)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORouteIncident;
  v2 = [(GEORouteIncident *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORouteIncident)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORouteIncident;
  v3 = [(GEORouteIncident *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPosition
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 154) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPosition_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasPosition
{
  return self->_position != 0;
}

- (GEOLatLng)position
{
  -[GEORouteIncident _readPosition]((uint64_t)self);
  position = self->_position;

  return position;
}

- (void)setPosition:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x110000u;
  objc_storeStrong((id *)&self->_position, a3);
}

- (void)_readIncidentId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 153) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentId_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasIncidentId
{
  return self->_incidentId != 0;
}

- (NSString)incidentId
{
  -[GEORouteIncident _readIncidentId]((uint64_t)self);
  incidentId = self->_incidentId;

  return incidentId;
}

- (void)setIncidentId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x104000u;
  objc_storeStrong((id *)&self->_incidentId, a3);
}

- (void)_readInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 153) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasInfo
{
  return self->_info != 0;
}

- (NSString)info
{
  -[GEORouteIncident _readInfo]((uint64_t)self);
  info = self->_info;

  return info;
}

- (void)setInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x108000u;
  objc_storeStrong((id *)&self->_info, a3);
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x80) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100080u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    int v3 = 1048704;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$24DAC98BB42E806208BFDF9810E4926F flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (id)typeAsString:(int)a3
{
  v4 = @"ACCIDENT";
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v4 = @"CONSTRUCTION";
      return v4;
    case 2:
      v4 = @"ROAD_CLOSURE";
      return v4;
    case 3:
      v4 = @"EVENT";
      return v4;
    case 4:
      v4 = @"HAZARD";
      return v4;
    case 5:
      v4 = @"LANE_CLOSURE";
      return v4;
    case 6:
      v4 = @"RAMP_CLOSURE";
      return v4;
    case 7:
      v4 = @"TRAFFIC";
      return v4;
    case 8:
      v4 = @"WALKING_CLOSURE";
      return v4;
    case 9:
      v4 = @"CONGESTION_ZONE_RESTRICTION";
      return v4;
    case 10:
      v4 = @"LICENSE_PLATE_RESTRICTION";
      return v4;
    case 11:
    case 12:
      goto LABEL_9;
    case 13:
      v4 = @"SPEED_TRAP";
      return v4;
    case 14:
      v4 = @"AREA_INCIDENT";
      return v4;
    default:
      if (a3 == 100)
      {
        v4 = @"TIME_BASED_RESTRICTION";
      }
      else
      {
LABEL_9:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      }
      return v4;
  }
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ACCIDENT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONSTRUCTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ROAD_CLOSURE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EVENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HAZARD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LANE_CLOSURE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RAMP_CLOSURE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TRAFFIC"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"WALKING_CLOSURE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CONGESTION_ZONE_RESTRICTION"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LICENSE_PLATE_RESTRICTION"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SPEED_TRAP"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AREA_INCIDENT"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"TIME_BASED_RESTRICTION"])
  {
    int v4 = 100;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readStreet
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 154) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStreet_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasStreet
{
  return self->_street != 0;
}

- (NSString)street
{
  -[GEORouteIncident _readStreet]((uint64_t)self);
  street = self->_street;

  return street;
}

- (void)setStreet:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x140000u;
  objc_storeStrong((id *)&self->_street, a3);
}

- (void)_readCrossStreet
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 153) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCrossStreet_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasCrossStreet
{
  return self->_crossStreet != 0;
}

- (NSString)crossStreet
{
  -[GEORouteIncident _readCrossStreet]((uint64_t)self);
  crossStreet = self->_crossStreet;

  return crossStreet;
}

- (void)setCrossStreet:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x102000u;
  objc_storeStrong((id *)&self->_crossStreet, a3);
}

- (int64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x100002u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    int v3 = 1048578;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$24DAC98BB42E806208BFDF9810E4926F flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasStartTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int64_t)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x100001u;
  self->_endTime = a3;
}

- (void)setHasEndTime:(BOOL)a3
{
  self->_$24DAC98BB42E806208BFDF9810E4926F flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x100000);
}

- (BOOL)hasEndTime
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int64_t)updateTime
{
  return self->_updateTime;
}

- (void)setUpdateTime:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x100004u;
  self->_updateTime = a3;
}

- (void)setHasUpdateTime:(BOOL)a3
{
  if (a3) {
    int v3 = 1048580;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$24DAC98BB42E806208BFDF9810E4926F flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasUpdateTime
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)laneClosureType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    return self->_laneClosureType;
  }
  else {
    return 1;
  }
}

- (void)setLaneClosureType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100020u;
  self->_laneClosureType = a3;
}

- (void)setHasLaneClosureType:(BOOL)a3
{
  if (a3) {
    int v3 = 1048608;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$24DAC98BB42E806208BFDF9810E4926F flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasLaneClosureType
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)laneClosureTypeAsString:(int)a3
{
  if ((a3 - 1) >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E0620[a3 - 1];
  }

  return v3;
}

- (int)StringAsLaneClosureType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LEFT_LANE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CENTER_LANE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RIGHT_LANE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SHOULDER_LANE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CARPOOL_LANE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"BUS_LANE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"OTHER_LANE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ON_RAMP"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"OFF_RAMP"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (unsigned)laneClosureCount
{
  return self->_laneClosureCount;
}

- (void)setLaneClosureCount:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100010u;
  self->_laneClosureCount = a3;
}

- (void)setHasLaneClosureCount:(BOOL)a3
{
  if (a3) {
    int v3 = 1048592;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$24DAC98BB42E806208BFDF9810E4926F flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFEFFFEF | v3);
}

- (BOOL)hasLaneClosureCount
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (BOOL)endTimeReliable
{
  return self->_endTimeReliable;
}

- (void)setEndTimeReliable:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x100200u;
  self->_endTimeReliable = a3;
}

- (void)setHasEndTimeReliable:(BOOL)a3
{
  if (a3) {
    int v3 = 1049088;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$24DAC98BB42E806208BFDF9810E4926F flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasEndTimeReliable
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (int)significance
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x40) != 0) {
    return self->_significance;
  }
  else {
    return 0;
  }
}

- (void)setSignificance:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100040u;
  self->_significance = a3;
}

- (void)setHasSignificance:(BOOL)a3
{
  if (a3) {
    int v3 = 1048640;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$24DAC98BB42E806208BFDF9810E4926F flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasSignificance
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)significanceAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E0668[a3];
  }

  return v3;
}

- (int)StringAsSignificance:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_IMPACT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOW_IMPACT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MODERATE_LOCAL_IMPACT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HIGH_LOCAL_IMPACT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MODERATE_REGIONAL_IMPACT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"WIDE_REGIONAL_IMPACT"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readRestrictionInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 154) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRestrictionInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasRestrictionInfo
{
  return self->_restrictionInfo != 0;
}

- (GEORestrictionInfo)restrictionInfo
{
  -[GEORouteIncident _readRestrictionInfo]((uint64_t)self);
  restrictionInfo = self->_restrictionInfo;

  return restrictionInfo;
}

- (void)setRestrictionInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x120000u;
  objc_storeStrong((id *)&self->_restrictionInfo, a3);
}

- (unsigned)userReportsCount
{
  return self->_userReportsCount;
}

- (void)setUserReportsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100100u;
  self->_userReportsCount = a3;
}

- (void)setHasUserReportsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 1048832;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$24DAC98BB42E806208BFDF9810E4926F flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasUserReportsCount
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (BOOL)shouldDisplayOnMap
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x400) == 0 || self->_shouldDisplayOnMap;
}

- (void)setShouldDisplayOnMap:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x100400u;
  self->_shouldDisplayOnMap = a3;
}

- (void)setHasShouldDisplayOnMap:(BOOL)a3
{
  if (a3) {
    int v3 = 1049600;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$24DAC98BB42E806208BFDF9810E4926F flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasShouldDisplayOnMap
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)_readUserReportIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 154) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserReportIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)userReportIds
{
  -[GEORouteIncident _readUserReportIds]((uint64_t)self);
  userReportIds = self->_userReportIds;

  return userReportIds;
}

- (void)setUserReportIds:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  userReportIds = self->_userReportIds;
  self->_userReportIds = v4;
}

- (void)clearUserReportIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  userReportIds = self->_userReportIds;

  [(NSMutableArray *)userReportIds removeAllObjects];
}

- (void)addUserReportId:(id)a3
{
  id v4 = a3;
  -[GEORouteIncident _readUserReportIds]((uint64_t)self);
  -[GEORouteIncident _addNoFlagsUserReportId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsUserReportId:(uint64_t)a1
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

- (unint64_t)userReportIdsCount
{
  -[GEORouteIncident _readUserReportIds]((uint64_t)self);
  userReportIds = self->_userReportIds;

  return [(NSMutableArray *)userReportIds count];
}

- (id)userReportIdAtIndex:(unint64_t)a3
{
  -[GEORouteIncident _readUserReportIds]((uint64_t)self);
  userReportIds = self->_userReportIds;

  return (id)[(NSMutableArray *)userReportIds objectAtIndex:a3];
}

+ (Class)userReportIdType
{
  return (Class)objc_opt_class();
}

- (unsigned)delaySeconds
{
  return self->_delaySeconds;
}

- (void)setDelaySeconds:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100008u;
  self->_delaySeconds = a3;
}

- (void)setHasDelaySeconds:(BOOL)a3
{
  if (a3) {
    int v3 = 1048584;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$24DAC98BB42E806208BFDF9810E4926F flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDelaySeconds
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)_readArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 153) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtwork_tags_6205);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasArtwork
{
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEORouteIncident _readArtwork]((uint64_t)self);
  artwork = self->_artwork;

  return artwork;
}

- (void)setArtwork:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x101000u;
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORouteIncident;
  id v4 = [(GEORouteIncident *)&v8 description];
  id v5 = [(GEORouteIncident *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteIncident _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_82;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 position];
  objc_super v6 = v5;
  if (v5)
  {
    if (a2) {
      [v5 jsonRepresentation];
    }
    else {
    id v7 = [v5 dictionaryRepresentation];
    }
    [v4 setObject:v7 forKey:@"position"];
  }
  objc_super v8 = [(id)a1 incidentId];
  if (v8) {
    [v4 setObject:v8 forKey:@"incidentId"];
  }

  v9 = [(id)a1 info];
  if (v9) {
    [v4 setObject:v9 forKey:@"info"];
  }

  if ((*(unsigned char *)(a1 + 152) & 0x80) != 0)
  {
    int v10 = *(_DWORD *)(a1 + 140);
    v11 = @"ACCIDENT";
    switch(v10)
    {
      case 0:
        break;
      case 1:
        v11 = @"CONSTRUCTION";
        break;
      case 2:
        v11 = @"ROAD_CLOSURE";
        break;
      case 3:
        v11 = @"EVENT";
        break;
      case 4:
        v11 = @"HAZARD";
        break;
      case 5:
        v11 = @"LANE_CLOSURE";
        break;
      case 6:
        v11 = @"RAMP_CLOSURE";
        break;
      case 7:
        v11 = @"TRAFFIC";
        break;
      case 8:
        v11 = @"WALKING_CLOSURE";
        break;
      case 9:
        v11 = @"CONGESTION_ZONE_RESTRICTION";
        break;
      case 10:
        v11 = @"LICENSE_PLATE_RESTRICTION";
        break;
      case 11:
      case 12:
        goto LABEL_16;
      case 13:
        v11 = @"SPEED_TRAP";
        break;
      case 14:
        v11 = @"AREA_INCIDENT";
        break;
      default:
        if (v10 == 100)
        {
          v11 = @"TIME_BASED_RESTRICTION";
        }
        else
        {
LABEL_16:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 140));
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    [v4 setObject:v11 forKey:@"type"];
  }
  v12 = [(id)a1 street];
  if (v12) {
    [v4 setObject:v12 forKey:@"street"];
  }

  v13 = [(id)a1 crossStreet];
  if (v13) {
    [v4 setObject:v13 forKey:@"crossStreet"];
  }

  int v14 = *(_DWORD *)(a1 + 152);
  if ((v14 & 2) != 0)
  {
    v15 = [NSNumber numberWithLongLong:*(void *)(a1 + 80)];
    [v4 setObject:v15 forKey:@"startTime"];

    int v14 = *(_DWORD *)(a1 + 152);
    if ((v14 & 1) == 0)
    {
LABEL_35:
      if ((v14 & 4) == 0) {
        goto LABEL_36;
      }
      goto LABEL_43;
    }
  }
  else if ((v14 & 1) == 0)
  {
    goto LABEL_35;
  }
  v16 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  [v4 setObject:v16 forKey:@"endTime"];

  int v14 = *(_DWORD *)(a1 + 152);
  if ((v14 & 4) == 0)
  {
LABEL_36:
    if ((v14 & 0x20) == 0) {
      goto LABEL_37;
    }
    goto LABEL_44;
  }
LABEL_43:
  v17 = [NSNumber numberWithLongLong:*(void *)(a1 + 96)];
  [v4 setObject:v17 forKey:@"updateTime"];

  int v14 = *(_DWORD *)(a1 + 152);
  if ((v14 & 0x20) == 0)
  {
LABEL_37:
    if ((v14 & 0x10) == 0) {
      goto LABEL_38;
    }
    goto LABEL_48;
  }
LABEL_44:
  unsigned int v18 = *(_DWORD *)(a1 + 132) - 1;
  if (v18 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 132));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E53E0620[v18];
  }
  [v4 setObject:v19 forKey:@"laneClosureType"];

  int v14 = *(_DWORD *)(a1 + 152);
  if ((v14 & 0x10) == 0)
  {
LABEL_38:
    if ((v14 & 0x200) == 0) {
      goto LABEL_39;
    }
    goto LABEL_49;
  }
LABEL_48:
  v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 128)];
  [v4 setObject:v20 forKey:@"laneClosureCount"];

  int v14 = *(_DWORD *)(a1 + 152);
  if ((v14 & 0x200) == 0)
  {
LABEL_39:
    if ((v14 & 0x40) == 0) {
      goto LABEL_54;
    }
LABEL_50:
    uint64_t v22 = *(int *)(a1 + 136);
    if (v22 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 136));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E53E0668[v22];
    }
    [v4 setObject:v23 forKey:@"significance"];

    goto LABEL_54;
  }
LABEL_49:
  v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 148)];
  [v4 setObject:v21 forKey:@"endTimeReliable"];

  if ((*(_DWORD *)(a1 + 152) & 0x40) != 0) {
    goto LABEL_50;
  }
LABEL_54:
  v24 = [(id)a1 restrictionInfo];
  v25 = v24;
  if (v24)
  {
    if (a2) {
      [v24 jsonRepresentation];
    }
    else {
    v26 = [v24 dictionaryRepresentation];
    }
    [v4 setObject:v26 forKey:@"restrictionInfo"];
  }
  int v27 = *(_DWORD *)(a1 + 152);
  if ((v27 & 0x100) != 0)
  {
    v28 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 144)];
    [v4 setObject:v28 forKey:@"userReportsCount"];

    int v27 = *(_DWORD *)(a1 + 152);
  }
  if ((v27 & 0x400) != 0)
  {
    v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 149)];
    [v4 setObject:v29 forKey:@"shouldDisplayOnMap"];
  }
  if (*(void *)(a1 + 104))
  {
    v30 = [(id)a1 userReportIds];
    if (a2) {
      v31 = @"userReportId";
    }
    else {
      v31 = @"user_report_id";
    }
    [v4 setObject:v30 forKey:v31];
  }
  if ((*(unsigned char *)(a1 + 152) & 8) != 0)
  {
    v32 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 124)];
    if (a2) {
      v33 = @"delaySeconds";
    }
    else {
      v33 = @"delay_seconds";
    }
    [v4 setObject:v32 forKey:v33];
  }
  v34 = [(id)a1 artwork];
  v35 = v34;
  if (v34)
  {
    if (a2) {
      [v34 jsonRepresentation];
    }
    else {
    v36 = [v34 dictionaryRepresentation];
    }
    [v4 setObject:v36 forKey:@"artwork"];
  }
  v37 = *(void **)(a1 + 16);
  if (v37)
  {
    v38 = [v37 dictionaryRepresentation];
    v39 = v38;
    if (a2)
    {
      v40 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __46__GEORouteIncident__dictionaryRepresentation___block_invoke;
      v44[3] = &unk_1E53D8860;
      id v41 = v40;
      id v45 = v41;
      [v39 enumerateKeysAndObjectsUsingBlock:v44];
      id v42 = v41;

      v39 = v42;
    }
    [v4 setObject:v39 forKey:@"Unknown Fields"];
  }
LABEL_82:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORouteIncident _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEORouteIncident__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (GEORouteIncident)initWithDictionary:(id)a3
{
  return (GEORouteIncident *)-[GEORouteIncident _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_136;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_136;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"position"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v8 = [(GEOLatLng *)v7 initWithJSON:v6];
    }
    else {
      uint64_t v8 = [(GEOLatLng *)v7 initWithDictionary:v6];
    }
    v9 = (void *)v8;
    [a1 setPosition:v8];
  }
  id v10 = [v5 objectForKeyedSubscript:@"incidentId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (void *)[v10 copy];
    [a1 setIncidentId:v11];
  }
  v12 = [v5 objectForKeyedSubscript:@"info"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (void *)[v12 copy];
    [a1 setInfo:v13];
  }
  int v14 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"ACCIDENT"])
    {
      uint64_t v16 = 0;
    }
    else if ([v15 isEqualToString:@"CONSTRUCTION"])
    {
      uint64_t v16 = 1;
    }
    else if ([v15 isEqualToString:@"ROAD_CLOSURE"])
    {
      uint64_t v16 = 2;
    }
    else if ([v15 isEqualToString:@"EVENT"])
    {
      uint64_t v16 = 3;
    }
    else if ([v15 isEqualToString:@"HAZARD"])
    {
      uint64_t v16 = 4;
    }
    else if ([v15 isEqualToString:@"LANE_CLOSURE"])
    {
      uint64_t v16 = 5;
    }
    else if ([v15 isEqualToString:@"RAMP_CLOSURE"])
    {
      uint64_t v16 = 6;
    }
    else if ([v15 isEqualToString:@"TRAFFIC"])
    {
      uint64_t v16 = 7;
    }
    else if ([v15 isEqualToString:@"WALKING_CLOSURE"])
    {
      uint64_t v16 = 8;
    }
    else if ([v15 isEqualToString:@"CONGESTION_ZONE_RESTRICTION"])
    {
      uint64_t v16 = 9;
    }
    else if ([v15 isEqualToString:@"LICENSE_PLATE_RESTRICTION"])
    {
      uint64_t v16 = 10;
    }
    else if ([v15 isEqualToString:@"SPEED_TRAP"])
    {
      uint64_t v16 = 13;
    }
    else if ([v15 isEqualToString:@"AREA_INCIDENT"])
    {
      uint64_t v16 = 14;
    }
    else if ([v15 isEqualToString:@"TIME_BASED_RESTRICTION"])
    {
      uint64_t v16 = 100;
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_46;
    }
    uint64_t v16 = [v14 intValue];
  }
  [a1 setType:v16];
LABEL_46:

  v17 = [v5 objectForKeyedSubscript:@"street"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v18 = (void *)[v17 copy];
    [a1 setStreet:v18];
  }
  v19 = [v5 objectForKeyedSubscript:@"crossStreet"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = (void *)[v19 copy];
    [a1 setCrossStreet:v20];
  }
  v21 = [v5 objectForKeyedSubscript:@"startTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStartTime:", objc_msgSend(v21, "longLongValue"));
  }

  uint64_t v22 = [v5 objectForKeyedSubscript:@"endTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEndTime:", objc_msgSend(v22, "longLongValue"));
  }

  v23 = [v5 objectForKeyedSubscript:@"updateTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setUpdateTime:", objc_msgSend(v23, "longLongValue"));
  }

  v24 = [v5 objectForKeyedSubscript:@"laneClosureType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = v24;
    if ([v25 isEqualToString:@"LEFT_LANE"])
    {
      uint64_t v26 = 1;
    }
    else if ([v25 isEqualToString:@"CENTER_LANE"])
    {
      uint64_t v26 = 2;
    }
    else if ([v25 isEqualToString:@"RIGHT_LANE"])
    {
      uint64_t v26 = 3;
    }
    else if ([v25 isEqualToString:@"SHOULDER_LANE"])
    {
      uint64_t v26 = 4;
    }
    else if ([v25 isEqualToString:@"CARPOOL_LANE"])
    {
      uint64_t v26 = 5;
    }
    else if ([v25 isEqualToString:@"BUS_LANE"])
    {
      uint64_t v26 = 6;
    }
    else if ([v25 isEqualToString:@"OTHER_LANE"])
    {
      uint64_t v26 = 7;
    }
    else if ([v25 isEqualToString:@"ON_RAMP"])
    {
      uint64_t v26 = 8;
    }
    else if ([v25 isEqualToString:@"OFF_RAMP"])
    {
      uint64_t v26 = 9;
    }
    else
    {
      uint64_t v26 = 1;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_80;
    }
    uint64_t v26 = [v24 intValue];
  }
  [a1 setLaneClosureType:v26];
LABEL_80:

  int v27 = [v5 objectForKeyedSubscript:@"laneClosureCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLaneClosureCount:", objc_msgSend(v27, "unsignedIntValue"));
  }

  v28 = [v5 objectForKeyedSubscript:@"endTimeReliable"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEndTimeReliable:", objc_msgSend(v28, "BOOLValue"));
  }

  v29 = [v5 objectForKeyedSubscript:@"significance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v29;
    if ([v30 isEqualToString:@"UNKNOWN_IMPACT"])
    {
      uint64_t v31 = 0;
    }
    else if ([v30 isEqualToString:@"LOW_IMPACT"])
    {
      uint64_t v31 = 1;
    }
    else if ([v30 isEqualToString:@"MODERATE_LOCAL_IMPACT"])
    {
      uint64_t v31 = 2;
    }
    else if ([v30 isEqualToString:@"HIGH_LOCAL_IMPACT"])
    {
      uint64_t v31 = 3;
    }
    else if ([v30 isEqualToString:@"MODERATE_REGIONAL_IMPACT"])
    {
      uint64_t v31 = 4;
    }
    else if ([v30 isEqualToString:@"WIDE_REGIONAL_IMPACT"])
    {
      uint64_t v31 = 5;
    }
    else
    {
      uint64_t v31 = 0;
    }

    goto LABEL_101;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v31 = [v29 intValue];
LABEL_101:
    [a1 setSignificance:v31];
  }

  v32 = [v5 objectForKeyedSubscript:@"restrictionInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v33 = [GEORestrictionInfo alloc];
    if (a3) {
      uint64_t v34 = [(GEORestrictionInfo *)v33 initWithJSON:v32];
    }
    else {
      uint64_t v34 = [(GEORestrictionInfo *)v33 initWithDictionary:v32];
    }
    v35 = (void *)v34;
    [a1 setRestrictionInfo:v34];
  }
  v36 = [v5 objectForKeyedSubscript:@"userReportsCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setUserReportsCount:", objc_msgSend(v36, "unsignedIntValue"));
  }

  v37 = [v5 objectForKeyedSubscript:@"shouldDisplayOnMap"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setShouldDisplayOnMap:", objc_msgSend(v37, "BOOLValue"));
  }

  if (a3) {
    v38 = @"userReportId";
  }
  else {
    v38 = @"user_report_id";
  }
  v39 = [v5 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v40 = v39;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v55 != v43) {
            objc_enumerationMutation(v40);
          }
          id v45 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v46 = objc_msgSend(v45, "copy", (void)v54);
            [a1 addUserReportId:v46];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v42);
    }
  }
  if (a3) {
    v47 = @"delaySeconds";
  }
  else {
    v47 = @"delay_seconds";
  }
  v48 = objc_msgSend(v5, "objectForKeyedSubscript:", v47, (void)v54);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDelaySeconds:", objc_msgSend(v48, "unsignedIntValue"));
  }

  v49 = [v5 objectForKeyedSubscript:@"artwork"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v50 = [GEOPBTransitArtwork alloc];
    if (a3) {
      uint64_t v51 = [(GEOPBTransitArtwork *)v50 initWithJSON:v49];
    }
    else {
      uint64_t v51 = [(GEOPBTransitArtwork *)v50 initWithDictionary:v49];
    }
    v52 = (void *)v51;
    [a1 setArtwork:v51];
  }
LABEL_136:

  return a1;
}

- (GEORouteIncident)initWithJSON:(id)a3
{
  return (GEORouteIncident *)-[GEORouteIncident _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_6264;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_6265;
    }
    GEORouteIncidentReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLatLng *)self->_position readAll:1];
    [(GEORestrictionInfo *)self->_restrictionInfo readAll:1];
    [(GEOPBTransitArtwork *)self->_artwork readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteIncidentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteIncidentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORouteIncidentIsDirty((uint64_t)self) & 1) == 0)
  {
    v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
    goto LABEL_49;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORouteIncident *)self readAll:0];
  if (self->_position) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_incidentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_info) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_street) {
    PBDataWriterWriteStringField();
  }
  if (self->_crossStreet) {
    PBDataWriterWriteStringField();
  }
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    PBDataWriterWriteSfixed64Field();
    $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_17:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_18;
      }
      goto LABEL_43;
    }
  }
  else if ((*(unsigned char *)&flags & 1) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteSfixed64Field();
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteSfixed64Field();
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_21;
    }
LABEL_46:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_flags & 0x40) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0) {
    goto LABEL_46;
  }
LABEL_21:
  if ((*(unsigned char *)&flags & 0x40) != 0) {
LABEL_22:
  }
    PBDataWriterWriteInt32Field();
LABEL_23:
  if (self->_restrictionInfo) {
    PBDataWriterWriteSubmessage();
  }
  $24DAC98BB42E806208BFDF9810E4926F v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    $24DAC98BB42E806208BFDF9810E4926F v7 = self->_flags;
  }
  if ((*(_WORD *)&v7 & 0x400) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = self->_userReportIds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_artwork) {
    PBDataWriterWriteSubmessage();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
LABEL_49:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORouteIncident _readPosition]((uint64_t)self);
  position = self->_position;

  return [(GEOLatLng *)position hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v12 = (id *)a3;
  [(GEORouteIncident *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 28) = self->_readerMarkPos;
  *((_DWORD *)v12 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_position) {
    objc_msgSend(v12, "setPosition:");
  }
  if (self->_incidentId) {
    objc_msgSend(v12, "setIncidentId:");
  }
  id v4 = v12;
  if (self->_info)
  {
    objc_msgSend(v12, "setInfo:");
    id v4 = v12;
  }
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *((_DWORD *)v4 + 35) = self->_type;
    *((_DWORD *)v4 + 38) |= 0x80u;
  }
  if (self->_street)
  {
    objc_msgSend(v12, "setStreet:");
    id v4 = v12;
  }
  if (self->_crossStreet)
  {
    objc_msgSend(v12, "setCrossStreet:");
    id v4 = v12;
  }
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    v4[10] = self->_startTime;
    *((_DWORD *)v4 + 38) |= 2u;
    $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_15:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&flags & 1) == 0)
  {
    goto LABEL_15;
  }
  v4[5] = self->_endTime;
  *((_DWORD *)v4 + 38) |= 1u;
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  v4[12] = self->_updateTime;
  *((_DWORD *)v4 + 38) |= 4u;
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 33) = self->_laneClosureType;
  *((_DWORD *)v4 + 38) |= 0x20u;
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 32) = self->_laneClosureCount;
  *((_DWORD *)v4 + 38) |= 0x10u;
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_43:
  *((unsigned char *)v4 + 148) = self->_endTimeReliable;
  *((_DWORD *)v4 + 38) |= 0x200u;
  if ((*(_DWORD *)&self->_flags & 0x40) != 0)
  {
LABEL_20:
    *((_DWORD *)v4 + 34) = self->_significance;
    *((_DWORD *)v4 + 38) |= 0x40u;
  }
LABEL_21:
  if (self->_restrictionInfo)
  {
    objc_msgSend(v12, "setRestrictionInfo:");
    id v4 = v12;
  }
  $24DAC98BB42E806208BFDF9810E4926F v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x100) != 0)
  {
    *((_DWORD *)v4 + 36) = self->_userReportsCount;
    *((_DWORD *)v4 + 38) |= 0x100u;
    $24DAC98BB42E806208BFDF9810E4926F v6 = self->_flags;
  }
  if ((*(_WORD *)&v6 & 0x400) != 0)
  {
    *((unsigned char *)v4 + 149) = self->_shouldDisplayOnMap;
    *((_DWORD *)v4 + 38) |= 0x400u;
  }
  if ([(GEORouteIncident *)self userReportIdsCount])
  {
    [v12 clearUserReportIds];
    unint64_t v7 = [(GEORouteIncident *)self userReportIdsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(GEORouteIncident *)self userReportIdAtIndex:i];
        [v12 addUserReportId:v10];
      }
    }
  }
  uint64_t v11 = v12;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v12 + 31) = self->_delaySeconds;
    *((_DWORD *)v12 + 38) |= 8u;
  }
  if (self->_artwork)
  {
    objc_msgSend(v12, "setArtwork:");
    uint64_t v11 = v12;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
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
      GEORouteIncidentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_29;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORouteIncident *)self readAll:0];
  id v9 = [(GEOLatLng *)self->_position copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  uint64_t v11 = [(NSString *)self->_incidentId copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  uint64_t v13 = [(NSString *)self->_info copyWithZone:a3];
  long long v14 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v13;

  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_type;
    *(_DWORD *)(v5 + 152) |= 0x80u;
  }
  uint64_t v15 = [(NSString *)self->_street copyWithZone:a3];
  long long v16 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v15;

  uint64_t v17 = [(NSString *)self->_crossStreet copyWithZone:a3];
  unsigned int v18 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v17;

  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *(void *)(v5 + 80) = self->_startTime;
    *(_DWORD *)(v5 + 152) |= 2u;
    $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&flags & 1) == 0)
  {
    goto LABEL_9;
  }
  *(void *)(v5 + 40) = self->_endTime;
  *(_DWORD *)(v5 + 152) |= 1u;
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(void *)(v5 + 96) = self->_updateTime;
  *(_DWORD *)(v5 + 152) |= 4u;
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v5 + 132) = self->_laneClosureType;
  *(_DWORD *)(v5 + 152) |= 0x20u;
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_13;
    }
LABEL_35:
    *(unsigned char *)(v5 + 148) = self->_endTimeReliable;
    *(_DWORD *)(v5 + 152) |= 0x200u;
    if ((*(_DWORD *)&self->_flags & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_34:
  *(_DWORD *)(v5 + 128) = self->_laneClosureCount;
  *(_DWORD *)(v5 + 152) |= 0x10u;
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0) {
    goto LABEL_35;
  }
LABEL_13:
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
LABEL_14:
    *(_DWORD *)(v5 + 136) = self->_significance;
    *(_DWORD *)(v5 + 152) |= 0x40u;
  }
LABEL_15:
  id v20 = [(GEORestrictionInfo *)self->_restrictionInfo copyWithZone:a3];
  v21 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v20;

  $24DAC98BB42E806208BFDF9810E4926F v22 = self->_flags;
  if ((*(_WORD *)&v22 & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 144) = self->_userReportsCount;
    *(_DWORD *)(v5 + 152) |= 0x100u;
    $24DAC98BB42E806208BFDF9810E4926F v22 = self->_flags;
  }
  if ((*(_WORD *)&v22 & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 149) = self->_shouldDisplayOnMap;
    *(_DWORD *)(v5 + 152) |= 0x400u;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v23 = self->_userReportIds;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v23);
        }
        int v27 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "copyWithZone:", a3, (void)v32);
        [(id)v5 addUserReportId:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v24);
  }

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_delaySeconds;
    *(_DWORD *)(v5 + 152) |= 8u;
  }
  id v28 = -[GEOPBTransitArtwork copyWithZone:](self->_artwork, "copyWithZone:", a3, (void)v32);
  v29 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v28;

  id v30 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v30;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_81;
  }
  [(GEORouteIncident *)self readAll:1];
  [v4 readAll:1];
  position = self->_position;
  if ((unint64_t)position | *((void *)v4 + 8))
  {
    if (!-[GEOLatLng isEqual:](position, "isEqual:")) {
      goto LABEL_81;
    }
  }
  incidentId = self->_incidentId;
  if ((unint64_t)incidentId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](incidentId, "isEqual:")) {
      goto LABEL_81;
    }
  }
  info = self->_info;
  if ((unint64_t)info | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](info, "isEqual:")) {
      goto LABEL_81;
    }
  }
  int v8 = *((_DWORD *)v4 + 38);
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_type != *((_DWORD *)v4 + 35)) {
      goto LABEL_81;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_81;
  }
  street = self->_street;
  if ((unint64_t)street | *((void *)v4 + 11) && !-[NSString isEqual:](street, "isEqual:")) {
    goto LABEL_81;
  }
  crossStreet = self->_crossStreet;
  if ((unint64_t)crossStreet | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](crossStreet, "isEqual:")) {
      goto LABEL_81;
    }
  }
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  int v12 = *((_DWORD *)v4 + 38);
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_startTime != *((void *)v4 + 10)) {
      goto LABEL_81;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_81;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v12 & 1) == 0 || self->_endTime != *((void *)v4 + 5)) {
      goto LABEL_81;
    }
  }
  else if (v12)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_updateTime != *((void *)v4 + 12)) {
      goto LABEL_81;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_laneClosureType != *((_DWORD *)v4 + 33)) {
      goto LABEL_81;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_laneClosureCount != *((_DWORD *)v4 + 32)) {
      goto LABEL_81;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v12 & 0x200) == 0) {
      goto LABEL_81;
    }
    if (self->_endTimeReliable)
    {
      if (!*((unsigned char *)v4 + 148)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 148))
    {
      goto LABEL_81;
    }
  }
  else if ((v12 & 0x200) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_significance != *((_DWORD *)v4 + 34)) {
      goto LABEL_81;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_81;
  }
  restrictionInfo = self->_restrictionInfo;
  if ((unint64_t)restrictionInfo | *((void *)v4 + 9))
  {
    if (!-[GEORestrictionInfo isEqual:](restrictionInfo, "isEqual:")) {
      goto LABEL_81;
    }
    $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
    int v12 = *((_DWORD *)v4 + 38);
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0 || self->_userReportsCount != *((_DWORD *)v4 + 36)) {
      goto LABEL_81;
    }
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0) {
      goto LABEL_81;
    }
    if (self->_shouldDisplayOnMap)
    {
      if (!*((unsigned char *)v4 + 149)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 149))
    {
      goto LABEL_81;
    }
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_81;
  }
  userReportIds = self->_userReportIds;
  if (!((unint64_t)userReportIds | *((void *)v4 + 13))) {
    goto LABEL_74;
  }
  if (!-[NSMutableArray isEqual:](userReportIds, "isEqual:"))
  {
LABEL_81:
    char v16 = 0;
    goto LABEL_82;
  }
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  int v12 = *((_DWORD *)v4 + 38);
LABEL_74:
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_delaySeconds != *((_DWORD *)v4 + 31)) {
      goto LABEL_81;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_81;
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((void *)v4 + 3)) {
    char v16 = -[GEOPBTransitArtwork isEqual:](artwork, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_82:

  return v16;
}

- (unint64_t)hash
{
  [(GEORouteIncident *)self readAll:1];
  unint64_t v23 = [(GEOLatLng *)self->_position hash];
  NSUInteger v22 = [(NSString *)self->_incidentId hash];
  NSUInteger v21 = [(NSString *)self->_info hash];
  if ((*(unsigned char *)&self->_flags & 0x80) != 0) {
    uint64_t v20 = 2654435761 * self->_type;
  }
  else {
    uint64_t v20 = 0;
  }
  NSUInteger v19 = [(NSString *)self->_street hash];
  NSUInteger v18 = [(NSString *)self->_crossStreet hash];
  $24DAC98BB42E806208BFDF9810E4926F flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    uint64_t v17 = 2654435761 * self->_startTime;
    if (*(unsigned char *)&flags)
    {
LABEL_6:
      uint64_t v16 = 2654435761 * self->_endTime;
      if ((*(unsigned char *)&flags & 4) != 0) {
        goto LABEL_7;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if (*(unsigned char *)&flags) {
      goto LABEL_6;
    }
  }
  uint64_t v16 = 0;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
LABEL_7:
    uint64_t v15 = 2654435761 * self->_updateTime;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v15 = 0;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
LABEL_8:
    uint64_t v4 = 2654435761 * self->_laneClosureType;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_9:
    uint64_t v5 = 2654435761 * self->_laneClosureCount;
    if ((*(_WORD *)&flags & 0x200) != 0) {
      goto LABEL_10;
    }
LABEL_17:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&flags & 0x40) != 0) {
      goto LABEL_11;
    }
    goto LABEL_18;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((*(_WORD *)&flags & 0x200) == 0) {
    goto LABEL_17;
  }
LABEL_10:
  uint64_t v6 = 2654435761 * self->_endTimeReliable;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
LABEL_11:
    uint64_t v7 = 2654435761 * self->_significance;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
LABEL_19:
  unint64_t v8 = [(GEORestrictionInfo *)self->_restrictionInfo hash];
  $24DAC98BB42E806208BFDF9810E4926F v9 = self->_flags;
  if ((*(_WORD *)&v9 & 0x100) != 0)
  {
    uint64_t v10 = 2654435761 * self->_userReportsCount;
    if ((*(_WORD *)&v9 & 0x400) != 0) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(_WORD *)&v9 & 0x400) != 0)
    {
LABEL_21:
      uint64_t v11 = 2654435761 * self->_shouldDisplayOnMap;
      goto LABEL_24;
    }
  }
  uint64_t v11 = 0;
LABEL_24:
  uint64_t v12 = [(NSMutableArray *)self->_userReportIds hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v13 = 2654435761 * self->_delaySeconds;
  }
  else {
    uint64_t v13 = 0;
  }
  return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(GEOPBTransitArtwork *)self->_artwork hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  position = self->_position;
  uint64_t v6 = *((void *)v4 + 8);
  if (position)
  {
    if (v6) {
      -[GEOLatLng mergeFrom:](position, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORouteIncident setPosition:](self, "setPosition:");
  }
  if (*((void *)v4 + 6)) {
    -[GEORouteIncident setIncidentId:](self, "setIncidentId:");
  }
  if (*((void *)v4 + 7)) {
    -[GEORouteIncident setInfo:](self, "setInfo:");
  }
  if ((*((unsigned char *)v4 + 152) & 0x80) != 0)
  {
    self->_type = *((_DWORD *)v4 + 35);
    *(_DWORD *)&self->_flags |= 0x80u;
  }
  if (*((void *)v4 + 11)) {
    -[GEORouteIncident setStreet:](self, "setStreet:");
  }
  if (*((void *)v4 + 4)) {
    -[GEORouteIncident setCrossStreet:](self, "setCrossStreet:");
  }
  int v7 = *((_DWORD *)v4 + 38);
  if ((v7 & 2) != 0)
  {
    self->_startTime = *((void *)v4 + 10);
    *(_DWORD *)&self->_flags |= 2u;
    int v7 = *((_DWORD *)v4 + 38);
    if ((v7 & 1) == 0)
    {
LABEL_18:
      if ((v7 & 4) == 0) {
        goto LABEL_19;
      }
      goto LABEL_29;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_18;
  }
  self->_endTime = *((void *)v4 + 5);
  *(_DWORD *)&self->_flags |= 1u;
  int v7 = *((_DWORD *)v4 + 38);
  if ((v7 & 4) == 0)
  {
LABEL_19:
    if ((v7 & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_updateTime = *((void *)v4 + 12);
  *(_DWORD *)&self->_flags |= 4u;
  int v7 = *((_DWORD *)v4 + 38);
  if ((v7 & 0x20) == 0)
  {
LABEL_20:
    if ((v7 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_laneClosureType = *((_DWORD *)v4 + 33);
  *(_DWORD *)&self->_flags |= 0x20u;
  int v7 = *((_DWORD *)v4 + 38);
  if ((v7 & 0x10) == 0)
  {
LABEL_21:
    if ((v7 & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_laneClosureCount = *((_DWORD *)v4 + 32);
  *(_DWORD *)&self->_flags |= 0x10u;
  int v7 = *((_DWORD *)v4 + 38);
  if ((v7 & 0x200) == 0)
  {
LABEL_22:
    if ((v7 & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_32:
  self->_endTimeReliable = *((unsigned char *)v4 + 148);
  *(_DWORD *)&self->_flags |= 0x200u;
  if ((*((_DWORD *)v4 + 38) & 0x40) != 0)
  {
LABEL_23:
    self->_significance = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_flags |= 0x40u;
  }
LABEL_24:
  restrictionInfo = self->_restrictionInfo;
  uint64_t v9 = *((void *)v4 + 9);
  if (restrictionInfo)
  {
    if (v9) {
      -[GEORestrictionInfo mergeFrom:](restrictionInfo, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEORouteIncident setRestrictionInfo:](self, "setRestrictionInfo:");
  }
  int v10 = *((_DWORD *)v4 + 38);
  if ((v10 & 0x100) != 0)
  {
    self->_userReportsCount = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_flags |= 0x100u;
    int v10 = *((_DWORD *)v4 + 38);
  }
  if ((v10 & 0x400) != 0)
  {
    self->_shouldDisplayOnMap = *((unsigned char *)v4 + 149);
    *(_DWORD *)&self->_flags |= 0x400u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = *((id *)v4 + 13);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        -[GEORouteIncident addUserReportId:](self, "addUserReportId:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  if ((*((unsigned char *)v4 + 152) & 8) != 0)
  {
    self->_delaySeconds = *((_DWORD *)v4 + 31);
    *(_DWORD *)&self->_flags |= 8u;
  }
  artwork = self->_artwork;
  uint64_t v17 = *((void *)v4 + 3);
  if (artwork)
  {
    if (v17) {
      -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEORouteIncident setArtwork:](self, "setArtwork:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORouteIncidentReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6269);
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
  *(_DWORD *)&self->_flags |= 0x100800u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORouteIncident *)self readAll:0];
    [(GEOLatLng *)self->_position clearUnknownFields:1];
    [(GEORestrictionInfo *)self->_restrictionInfo clearUnknownFields:1];
    artwork = self->_artwork;
    [(GEOPBTransitArtwork *)artwork clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userReportIds, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_restrictionInfo, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_incidentId, 0);
  objc_storeStrong((id *)&self->_crossStreet, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end