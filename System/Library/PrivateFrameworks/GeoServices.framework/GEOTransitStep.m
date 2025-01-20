@interface GEOTransitStep
+ (BOOL)isValid:(id)a3;
+ (Class)badgeType;
+ (Class)enterExitInfoType;
+ (Class)regionAlertType;
+ (Class)transferInfoType;
+ (Class)vehicleInfoType;
- (BOOL)hasAccessPointZilchIndex;
- (BOOL)hasAdvisoriesInfo;
- (BOOL)hasArrivalInfo;
- (BOOL)hasBaseFare;
- (BOOL)hasBoardingInfo;
- (BOOL)hasDefaultVehicleInfoIndex;
- (BOOL)hasDepartureFrequency;
- (BOOL)hasDistanceInMeters;
- (BOOL)hasEndingStopIndex;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasInstructions;
- (BOOL)hasListTransitIncidentMessageIndex;
- (BOOL)hasLocation;
- (BOOL)hasManeuverType;
- (BOOL)hasPrioritizeTilesPreloading;
- (BOOL)hasRouteDetailsSecondaryArtworkIndex;
- (BOOL)hasScheduleInfo;
- (BOOL)hasSignificanceForEndNode;
- (BOOL)hasStartingStopIndex;
- (BOOL)hasStartingTime;
- (BOOL)hasSteppingTransitIncidentMessageIndex;
- (BOOL)hasSurcharge;
- (BOOL)hasUpdateIdentifier;
- (BOOL)hasVehiclePositionInfo;
- (BOOL)hasWalkingIndex;
- (BOOL)hasZilchIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)prioritizeTilesPreloading;
- (BOOL)readFrom:(id)a3;
- (GEOAdvisoriesInfo)advisoriesInfo;
- (GEOInstructionSet)instructions;
- (GEOLatLng)location;
- (GEOTransitArrivalInfo)arrivalInfo;
- (GEOTransitBaseFare)baseFare;
- (GEOTransitBoardingInfo)boardingInfo;
- (GEOTransitScheduleInfo)scheduleInfo;
- (GEOTransitStep)init;
- (GEOTransitStep)initWithData:(id)a3;
- (GEOTransitStep)initWithDictionary:(id)a3;
- (GEOTransitStep)initWithJSON:(id)a3;
- (GEOTransitSurcharge)surcharge;
- (GEOTransitVehiclePositionInfo)vehiclePositionInfo;
- (NSData)updateIdentifier;
- (NSMutableArray)badges;
- (NSMutableArray)enterExitInfos;
- (NSMutableArray)regionAlerts;
- (NSMutableArray)transferInfos;
- (NSMutableArray)vehicleInfos;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)badgeAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)enterExitInfoAtIndex:(unint64_t)a3;
- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)maneuverTypeAsString:(int)a3;
- (id)regionAlertAtIndex:(unint64_t)a3;
- (id)significanceForEndNodeAsString:(int)a3;
- (id)transferInfoAtIndex:(unint64_t)a3;
- (id)vehicleInfoAtIndex:(unint64_t)a3;
- (int)StringAsManeuverType:(id)a3;
- (int)StringAsSignificanceForEndNode:(id)a3;
- (int)maneuverType;
- (int)significanceForEndNode;
- (int64_t)segmentTypeForManeuver;
- (unint64_t)badgesCount;
- (unint64_t)enterExitInfosCount;
- (unint64_t)hash;
- (unint64_t)regionAlertsCount;
- (unint64_t)routeDetailsPrimaryArtworkIndexsCount;
- (unint64_t)steppingArtworkIndexsCount;
- (unint64_t)transferInfosCount;
- (unint64_t)vehicleInfosCount;
- (unsigned)accessPointZilchIndex;
- (unsigned)defaultVehicleInfoIndex;
- (unsigned)departureFrequency;
- (unsigned)distanceInMeters;
- (unsigned)endingStopIndex;
- (unsigned)listTransitIncidentMessageIndex;
- (unsigned)routeDetailsPrimaryArtworkIndexAtIndex:(unint64_t)a3;
- (unsigned)routeDetailsPrimaryArtworkIndexs;
- (unsigned)routeDetailsSecondaryArtworkIndex;
- (unsigned)startingStopIndex;
- (unsigned)startingTime;
- (unsigned)steppingArtworkIndexAtIndex:(unint64_t)a3;
- (unsigned)steppingArtworkIndexs;
- (unsigned)steppingTransitIncidentMessageIndex;
- (unsigned)walkingIndex;
- (unsigned)zilchIndex;
- (void)_addNoFlagsBadge:(uint64_t)a1;
- (void)_addNoFlagsEnterExitInfo:(uint64_t)a1;
- (void)_addNoFlagsRegionAlert:(uint64_t)a1;
- (void)_addNoFlagsTransferInfo:(uint64_t)a1;
- (void)_addNoFlagsVehicleInfo:(uint64_t)a1;
- (void)_readAdvisoriesInfo;
- (void)_readArrivalInfo;
- (void)_readBadges;
- (void)_readBaseFare;
- (void)_readBoardingInfo;
- (void)_readEnterExitInfos;
- (void)_readInstructions;
- (void)_readLocation;
- (void)_readRegionAlerts;
- (void)_readRouteDetailsPrimaryArtworkIndexs;
- (void)_readScheduleInfo;
- (void)_readSteppingArtworkIndexs;
- (void)_readSurcharge;
- (void)_readTransferInfos;
- (void)_readUpdateIdentifier;
- (void)_readVehicleInfos;
- (void)_readVehiclePositionInfo;
- (void)addBadge:(id)a3;
- (void)addEnterExitInfo:(id)a3;
- (void)addRegionAlert:(id)a3;
- (void)addRouteDetailsPrimaryArtworkIndex:(unsigned int)a3;
- (void)addSteppingArtworkIndex:(unsigned int)a3;
- (void)addTransferInfo:(id)a3;
- (void)addVehicleInfo:(id)a3;
- (void)clearBadges;
- (void)clearEnterExitInfos;
- (void)clearRegionAlerts;
- (void)clearRouteDetailsPrimaryArtworkIndexs;
- (void)clearSteppingArtworkIndexs;
- (void)clearTransferInfos;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearVehicleInfos;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAccessPointZilchIndex:(unsigned int)a3;
- (void)setAdvisoriesInfo:(id)a3;
- (void)setArrivalInfo:(id)a3;
- (void)setBadges:(id)a3;
- (void)setBaseFare:(id)a3;
- (void)setBoardingInfo:(id)a3;
- (void)setDefaultVehicleInfoIndex:(unsigned int)a3;
- (void)setDepartureFrequency:(unsigned int)a3;
- (void)setDistanceInMeters:(unsigned int)a3;
- (void)setEndingStopIndex:(unsigned int)a3;
- (void)setEnterExitInfos:(id)a3;
- (void)setHasAccessPointZilchIndex:(BOOL)a3;
- (void)setHasDefaultVehicleInfoIndex:(BOOL)a3;
- (void)setHasDepartureFrequency:(BOOL)a3;
- (void)setHasDistanceInMeters:(BOOL)a3;
- (void)setHasEndingStopIndex:(BOOL)a3;
- (void)setHasListTransitIncidentMessageIndex:(BOOL)a3;
- (void)setHasManeuverType:(BOOL)a3;
- (void)setHasPrioritizeTilesPreloading:(BOOL)a3;
- (void)setHasRouteDetailsSecondaryArtworkIndex:(BOOL)a3;
- (void)setHasSignificanceForEndNode:(BOOL)a3;
- (void)setHasStartingStopIndex:(BOOL)a3;
- (void)setHasStartingTime:(BOOL)a3;
- (void)setHasSteppingTransitIncidentMessageIndex:(BOOL)a3;
- (void)setHasWalkingIndex:(BOOL)a3;
- (void)setHasZilchIndex:(BOOL)a3;
- (void)setInstructions:(id)a3;
- (void)setListTransitIncidentMessageIndex:(unsigned int)a3;
- (void)setLocation:(id)a3;
- (void)setManeuverType:(int)a3;
- (void)setPrioritizeTilesPreloading:(BOOL)a3;
- (void)setRegionAlerts:(id)a3;
- (void)setRouteDetailsPrimaryArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRouteDetailsSecondaryArtworkIndex:(unsigned int)a3;
- (void)setScheduleInfo:(id)a3;
- (void)setSignificanceForEndNode:(int)a3;
- (void)setStartingStopIndex:(unsigned int)a3;
- (void)setStartingTime:(unsigned int)a3;
- (void)setSteppingArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSteppingTransitIncidentMessageIndex:(unsigned int)a3;
- (void)setSurcharge:(id)a3;
- (void)setTransferInfos:(id)a3;
- (void)setUpdateIdentifier:(id)a3;
- (void)setVehicleInfos:(id)a3;
- (void)setVehiclePositionInfo:(id)a3;
- (void)setWalkingIndex:(unsigned int)a3;
- (void)setZilchIndex:(unsigned int)a3;
- (void)updateTransitStep:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitStep

- (GEOTransitStep)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitStep;
  v2 = [(GEOTransitStep *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitStep)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitStep;
  v3 = [(GEOTransitStep *)&v7 initWithData:a3];
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
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitStep;
  [(GEOTransitStep *)&v3 dealloc];
}

- (int)maneuverType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $5D35F1586042F4506E133FD2A7885CCE flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x40) != 0) {
    return self->_maneuverType;
  }
  else {
    return 0;
  }
}

- (void)setManeuverType:(int)a3
{
  *(void *)&self->_flags |= 0x200000040uLL;
  self->_maneuverType = a3;
}

- (void)setHasManeuverType:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000040;
  }
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasManeuverType
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)maneuverTypeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53DB4E0[a3];
  }

  return v3;
}

- (int)StringAsManeuverType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_MANEUVER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LEAVE_ORIGIN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BOARD_VEHICLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PASS_STOP"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ALIGHT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TRANSFER_STOP_TO_STOP"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"GOTO_STOP"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LEAVE_STOP"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BLOCK_TRANSFER"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ARRIVE_AT_DESTINATION"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)startingStopIndex
{
  return self->_startingStopIndex;
}

- (void)setStartingStopIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000200uLL;
  self->_startingStopIndex = a3;
}

- (void)setHasStartingStopIndex:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000200;
  }
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasStartingStopIndex
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (unsigned)endingStopIndex
{
  return self->_endingStopIndex;
}

- (void)setEndingStopIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000010uLL;
  self->_endingStopIndex = a3;
}

- (void)setHasEndingStopIndex:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000010;
  }
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasEndingStopIndex
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)_readVehicleInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 267) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVehicleInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (NSMutableArray)vehicleInfos
{
  -[GEOTransitStep _readVehicleInfos]((uint64_t)self);
  vehicleInfos = self->_vehicleInfos;

  return vehicleInfos;
}

- (void)setVehicleInfos:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  vehicleInfos = self->_vehicleInfos;
  self->_vehicleInfos = v4;
}

- (void)clearVehicleInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  vehicleInfos = self->_vehicleInfos;

  [(NSMutableArray *)vehicleInfos removeAllObjects];
}

- (void)addVehicleInfo:(id)a3
{
  id v4 = a3;
  -[GEOTransitStep _readVehicleInfos]((uint64_t)self);
  -[GEOTransitStep _addNoFlagsVehicleInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsVehicleInfo:(uint64_t)a1
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

- (unint64_t)vehicleInfosCount
{
  -[GEOTransitStep _readVehicleInfos]((uint64_t)self);
  vehicleInfos = self->_vehicleInfos;

  return [(NSMutableArray *)vehicleInfos count];
}

- (id)vehicleInfoAtIndex:(unint64_t)a3
{
  -[GEOTransitStep _readVehicleInfos]((uint64_t)self);
  vehicleInfos = self->_vehicleInfos;

  return (id)[(NSMutableArray *)vehicleInfos objectAtIndex:a3];
}

+ (Class)vehicleInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readEnterExitInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 266) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEnterExitInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (NSMutableArray)enterExitInfos
{
  -[GEOTransitStep _readEnterExitInfos]((uint64_t)self);
  enterExitInfos = self->_enterExitInfos;

  return enterExitInfos;
}

- (void)setEnterExitInfos:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  enterExitInfos = self->_enterExitInfos;
  self->_enterExitInfos = v4;
}

- (void)clearEnterExitInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  enterExitInfos = self->_enterExitInfos;

  [(NSMutableArray *)enterExitInfos removeAllObjects];
}

- (void)addEnterExitInfo:(id)a3
{
  id v4 = a3;
  -[GEOTransitStep _readEnterExitInfos]((uint64_t)self);
  -[GEOTransitStep _addNoFlagsEnterExitInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsEnterExitInfo:(uint64_t)a1
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

- (unint64_t)enterExitInfosCount
{
  -[GEOTransitStep _readEnterExitInfos]((uint64_t)self);
  enterExitInfos = self->_enterExitInfos;

  return [(NSMutableArray *)enterExitInfos count];
}

- (id)enterExitInfoAtIndex:(unint64_t)a3
{
  -[GEOTransitStep _readEnterExitInfos]((uint64_t)self);
  enterExitInfos = self->_enterExitInfos;

  return (id)[(NSMutableArray *)enterExitInfos objectAtIndex:a3];
}

+ (Class)enterExitInfoType
{
  return (Class)objc_opt_class();
}

- (BOOL)prioritizeTilesPreloading
{
  return self->_prioritizeTilesPreloading;
}

- (void)setPrioritizeTilesPreloading:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200004000uLL;
  self->_prioritizeTilesPreloading = a3;
}

- (void)setHasPrioritizeTilesPreloading:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200004000;
  }
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasPrioritizeTilesPreloading
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (unsigned)walkingIndex
{
  return self->_walkingIndex;
}

- (void)setWalkingIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200001000uLL;
  self->_walkingIndex = a3;
}

- (void)setHasWalkingIndex:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200001000;
  }
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasWalkingIndex
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (void)_readTransferInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 267) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransferInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (NSMutableArray)transferInfos
{
  -[GEOTransitStep _readTransferInfos]((uint64_t)self);
  transferInfos = self->_transferInfos;

  return transferInfos;
}

- (void)setTransferInfos:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  transferInfos = self->_transferInfos;
  self->_transferInfos = v4;
}

- (void)clearTransferInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  transferInfos = self->_transferInfos;

  [(NSMutableArray *)transferInfos removeAllObjects];
}

- (void)addTransferInfo:(id)a3
{
  id v4 = a3;
  -[GEOTransitStep _readTransferInfos]((uint64_t)self);
  -[GEOTransitStep _addNoFlagsTransferInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsTransferInfo:(uint64_t)a1
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

- (unint64_t)transferInfosCount
{
  -[GEOTransitStep _readTransferInfos]((uint64_t)self);
  transferInfos = self->_transferInfos;

  return [(NSMutableArray *)transferInfos count];
}

- (id)transferInfoAtIndex:(unint64_t)a3
{
  -[GEOTransitStep _readTransferInfos]((uint64_t)self);
  transferInfos = self->_transferInfos;

  return (id)[(NSMutableArray *)transferInfos objectAtIndex:a3];
}

+ (Class)transferInfoType
{
  return (Class)objc_opt_class();
}

- (unsigned)startingTime
{
  return self->_startingTime;
}

- (void)setStartingTime:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000400uLL;
  self->_startingTime = a3;
}

- (void)setHasStartingTime:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000400;
  }
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasStartingTime
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)_readArrivalInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 266) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArrivalInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasArrivalInfo
{
  return self->_arrivalInfo != 0;
}

- (GEOTransitArrivalInfo)arrivalInfo
{
  -[GEOTransitStep _readArrivalInfo]((uint64_t)self);
  arrivalInfo = self->_arrivalInfo;

  return arrivalInfo;
}

- (void)setArrivalInfo:(id)a3
{
  *(void *)&self->_flags |= 0x200080000uLL;
  objc_storeStrong((id *)&self->_arrivalInfo, a3);
}

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 267) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLatLng)location
{
  -[GEOTransitStep _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  *(void *)&self->_flags |= 0x202000000uLL;
  objc_storeStrong((id *)&self->_location, a3);
}

- (int)significanceForEndNode
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $5D35F1586042F4506E133FD2A7885CCE flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x100) != 0) {
    return self->_significanceForEndNode;
  }
  else {
    return 0;
  }
}

- (void)setSignificanceForEndNode:(int)a3
{
  *(void *)&self->_flags |= 0x200000100uLL;
  self->_significanceForEndNode = a3;
}

- (void)setHasSignificanceForEndNode:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000100;
  }
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasSignificanceForEndNode
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (id)significanceForEndNodeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53DB538[a3];
  }

  return v3;
}

- (int)StringAsSignificanceForEndNode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_SIGNIFICANCE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EXTRA_SMALL_SIGNIFICANCE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SMALL_SIGNIFICANCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MEDIUM_SIGNIFICANCE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LARGE_SIGNIFICANCE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EXTRA_LARGE_SIGNIFICANCE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readInstructions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 267) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInstructions_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasInstructions
{
  return self->_instructions != 0;
}

- (GEOInstructionSet)instructions
{
  -[GEOTransitStep _readInstructions]((uint64_t)self);
  instructions = self->_instructions;

  return instructions;
}

- (void)setInstructions:(id)a3
{
  *(void *)&self->_flags |= 0x201000000uLL;
  objc_storeStrong((id *)&self->_instructions, a3);
}

- (unsigned)zilchIndex
{
  return self->_zilchIndex;
}

- (void)setZilchIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200002000uLL;
  self->_zilchIndex = a3;
}

- (void)setHasZilchIndex:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200002000;
  }
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasZilchIndex
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (unsigned)distanceInMeters
{
  return self->_distanceInMeters;
}

- (void)setDistanceInMeters:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000008uLL;
  self->_distanceInMeters = a3;
}

- (void)setHasDistanceInMeters:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000008;
  }
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasDistanceInMeters
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)_readRouteDetailsPrimaryArtworkIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 266) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteDetailsPrimaryArtworkIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (unint64_t)routeDetailsPrimaryArtworkIndexsCount
{
  return self->_routeDetailsPrimaryArtworkIndexs.count;
}

- (unsigned)routeDetailsPrimaryArtworkIndexs
{
  return self->_routeDetailsPrimaryArtworkIndexs.list;
}

- (void)clearRouteDetailsPrimaryArtworkIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;

  PBRepeatedUInt32Clear();
}

- (void)addRouteDetailsPrimaryArtworkIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (unsigned)routeDetailsPrimaryArtworkIndexAtIndex:(unint64_t)a3
{
  -[GEOTransitStep _readRouteDetailsPrimaryArtworkIndexs]((uint64_t)self);
  p_routeDetailsPrimaryArtworkIndexs = &self->_routeDetailsPrimaryArtworkIndexs;
  unint64_t count = self->_routeDetailsPrimaryArtworkIndexs.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_routeDetailsPrimaryArtworkIndexs->list[a3];
}

- (void)setRouteDetailsPrimaryArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;

  MEMORY[0x1F4147400](&self->_routeDetailsPrimaryArtworkIndexs, a3, a4);
}

- (void)_readSteppingArtworkIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 266) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSteppingArtworkIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (unint64_t)steppingArtworkIndexsCount
{
  return self->_steppingArtworkIndexs.count;
}

- (unsigned)steppingArtworkIndexs
{
  return self->_steppingArtworkIndexs.list;
}

- (void)clearSteppingArtworkIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;

  PBRepeatedUInt32Clear();
}

- (void)addSteppingArtworkIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (unsigned)steppingArtworkIndexAtIndex:(unint64_t)a3
{
  -[GEOTransitStep _readSteppingArtworkIndexs]((uint64_t)self);
  p_steppingArtworkIndexs = &self->_steppingArtworkIndexs;
  unint64_t count = self->_steppingArtworkIndexs.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_steppingArtworkIndexs->list[a3];
}

- (void)setSteppingArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;

  MEMORY[0x1F4147400](&self->_steppingArtworkIndexs, a3, a4);
}

- (unsigned)routeDetailsSecondaryArtworkIndex
{
  return self->_routeDetailsSecondaryArtworkIndex;
}

- (void)setRouteDetailsSecondaryArtworkIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000080uLL;
  self->_routeDetailsSecondaryArtworkIndex = a3;
}

- (void)setHasRouteDetailsSecondaryArtworkIndex:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000080;
  }
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasRouteDetailsSecondaryArtworkIndex
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (unsigned)accessPointZilchIndex
{
  return self->_accessPointZilchIndex;
}

- (void)setAccessPointZilchIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000001uLL;
  self->_accessPointZilchIndex = a3;
}

- (void)setHasAccessPointZilchIndex:(BOOL)a3
{
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x200000000);
}

- (BOOL)hasAccessPointZilchIndex
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unsigned)defaultVehicleInfoIndex
{
  return self->_defaultVehicleInfoIndex;
}

- (void)setDefaultVehicleInfoIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000002uLL;
  self->_defaultVehicleInfoIndex = a3;
}

- (void)setHasDefaultVehicleInfoIndex:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000002;
  }
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFDFFFFFFFDLL | v3);
}

- (BOOL)hasDefaultVehicleInfoIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)departureFrequency
{
  return self->_departureFrequency;
}

- (void)setDepartureFrequency:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000004uLL;
  self->_departureFrequency = a3;
}

- (void)setHasDepartureFrequency:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000004;
  }
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasDepartureFrequency
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)steppingTransitIncidentMessageIndex
{
  return self->_steppingTransitIncidentMessageIndex;
}

- (void)setSteppingTransitIncidentMessageIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000800uLL;
  self->_steppingTransitIncidentMessageIndex = a3;
}

- (void)setHasSteppingTransitIncidentMessageIndex:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000800;
  }
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasSteppingTransitIncidentMessageIndex
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (unsigned)listTransitIncidentMessageIndex
{
  return self->_listTransitIncidentMessageIndex;
}

- (void)setListTransitIncidentMessageIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000020uLL;
  self->_listTransitIncidentMessageIndex = a3;
}

- (void)setHasListTransitIncidentMessageIndex:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000020;
  }
  self->_$5D35F1586042F4506E133FD2A7885CCE flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasListTransitIncidentMessageIndex
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readAdvisoriesInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 266) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdvisoriesInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasAdvisoriesInfo
{
  return self->_advisoriesInfo != 0;
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  -[GEOTransitStep _readAdvisoriesInfo]((uint64_t)self);
  advisoriesInfo = self->_advisoriesInfo;

  return advisoriesInfo;
}

- (void)setAdvisoriesInfo:(id)a3
{
  *(void *)&self->_flags |= 0x200040000uLL;
  objc_storeStrong((id *)&self->_advisoriesInfo, a3);
}

- (void)_readBaseFare
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 266) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBaseFare_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasBaseFare
{
  return self->_baseFare != 0;
}

- (GEOTransitBaseFare)baseFare
{
  -[GEOTransitStep _readBaseFare]((uint64_t)self);
  baseFare = self->_baseFare;

  return baseFare;
}

- (void)setBaseFare:(id)a3
{
  *(void *)&self->_flags |= 0x200200000uLL;
  objc_storeStrong((id *)&self->_baseFare, a3);
}

- (void)_readSurcharge
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 267) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSurcharge_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasSurcharge
{
  return self->_surcharge != 0;
}

- (GEOTransitSurcharge)surcharge
{
  -[GEOTransitStep _readSurcharge]((uint64_t)self);
  surcharge = self->_surcharge;

  return surcharge;
}

- (void)setSurcharge:(id)a3
{
  *(void *)&self->_flags |= 0x210000000uLL;
  objc_storeStrong((id *)&self->_surcharge, a3);
}

- (void)_readUpdateIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 267) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUpdateIdentifier_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasUpdateIdentifier
{
  return self->_updateIdentifier != 0;
}

- (NSData)updateIdentifier
{
  -[GEOTransitStep _readUpdateIdentifier]((uint64_t)self);
  updateIdentifier = self->_updateIdentifier;

  return updateIdentifier;
}

- (void)setUpdateIdentifier:(id)a3
{
  *(void *)&self->_flags |= 0x240000000uLL;
  objc_storeStrong((id *)&self->_updateIdentifier, a3);
}

- (void)_readVehiclePositionInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 268) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVehiclePositionInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasVehiclePositionInfo
{
  return self->_vehiclePositionInfo != 0;
}

- (GEOTransitVehiclePositionInfo)vehiclePositionInfo
{
  -[GEOTransitStep _readVehiclePositionInfo]((uint64_t)self);
  vehiclePositionInfo = self->_vehiclePositionInfo;

  return vehiclePositionInfo;
}

- (void)setVehiclePositionInfo:(id)a3
{
  *(void *)&self->_flags |= 0x300000000uLL;
  objc_storeStrong((id *)&self->_vehiclePositionInfo, a3);
}

- (void)_readScheduleInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 267) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readScheduleInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasScheduleInfo
{
  return self->_scheduleInfo != 0;
}

- (GEOTransitScheduleInfo)scheduleInfo
{
  -[GEOTransitStep _readScheduleInfo]((uint64_t)self);
  scheduleInfo = self->_scheduleInfo;

  return scheduleInfo;
}

- (void)setScheduleInfo:(id)a3
{
  *(void *)&self->_flags |= 0x208000000uLL;
  objc_storeStrong((id *)&self->_scheduleInfo, a3);
}

- (void)_readBoardingInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 266) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBoardingInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasBoardingInfo
{
  return self->_boardingInfo != 0;
}

- (GEOTransitBoardingInfo)boardingInfo
{
  -[GEOTransitStep _readBoardingInfo]((uint64_t)self);
  boardingInfo = self->_boardingInfo;

  return boardingInfo;
}

- (void)setBoardingInfo:(id)a3
{
  *(void *)&self->_flags |= 0x200400000uLL;
  objc_storeStrong((id *)&self->_boardingInfo, a3);
}

- (void)_readBadges
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 266) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBadges_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (NSMutableArray)badges
{
  -[GEOTransitStep _readBadges]((uint64_t)self);
  badges = self->_badges;

  return badges;
}

- (void)setBadges:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  badges = self->_badges;
  self->_badges = v4;
}

- (void)clearBadges
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  badges = self->_badges;

  [(NSMutableArray *)badges removeAllObjects];
}

- (void)addBadge:(id)a3
{
  id v4 = a3;
  -[GEOTransitStep _readBadges]((uint64_t)self);
  -[GEOTransitStep _addNoFlagsBadge:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsBadge:(uint64_t)a1
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

- (unint64_t)badgesCount
{
  -[GEOTransitStep _readBadges]((uint64_t)self);
  badges = self->_badges;

  return [(NSMutableArray *)badges count];
}

- (id)badgeAtIndex:(unint64_t)a3
{
  -[GEOTransitStep _readBadges]((uint64_t)self);
  badges = self->_badges;

  return (id)[(NSMutableArray *)badges objectAtIndex:a3];
}

+ (Class)badgeType
{
  return (Class)objc_opt_class();
}

- (void)_readRegionAlerts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(unsigned char *)(a1 + 267) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegionAlerts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (NSMutableArray)regionAlerts
{
  -[GEOTransitStep _readRegionAlerts]((uint64_t)self);
  regionAlerts = self->_regionAlerts;

  return regionAlerts;
}

- (void)setRegionAlerts:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  regionAlerts = self->_regionAlerts;
  self->_regionAlerts = v4;
}

- (void)clearRegionAlerts
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  regionAlerts = self->_regionAlerts;

  [(NSMutableArray *)regionAlerts removeAllObjects];
}

- (void)addRegionAlert:(id)a3
{
  id v4 = a3;
  -[GEOTransitStep _readRegionAlerts]((uint64_t)self);
  -[GEOTransitStep _addNoFlagsRegionAlert:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsRegionAlert:(uint64_t)a1
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

- (unint64_t)regionAlertsCount
{
  -[GEOTransitStep _readRegionAlerts]((uint64_t)self);
  regionAlerts = self->_regionAlerts;

  return [(NSMutableArray *)regionAlerts count];
}

- (id)regionAlertAtIndex:(unint64_t)a3
{
  -[GEOTransitStep _readRegionAlerts]((uint64_t)self);
  regionAlerts = self->_regionAlerts;

  return (id)[(NSMutableArray *)regionAlerts objectAtIndex:a3];
}

+ (Class)regionAlertType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitStep;
  id v4 = [(GEOTransitStep *)&v8 description];
  id v5 = [(GEOTransitStep *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v139 = 0;
    goto LABEL_220;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = &OBJC_IVAR___GEOTransitSectionOption__defaultSectionIndex;
  uint64_t v6 = *(void *)(a1 + 264);
  if ((v6 & 0x40) != 0)
  {
    uint64_t v7 = *(int *)(a1 + 228);
    if (v7 >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 228));
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E53DB4E0[v7];
    }
    if (a2) {
      v9 = @"maneuverType";
    }
    else {
      v9 = @"maneuver_type";
    }
    [v4 setObject:v8 forKey:v9];

    uint64_t v6 = *(void *)(a1 + 264);
  }
  unint64_t v10 = 0x1E4F28000uLL;
  if ((v6 & 0x200) != 0)
  {
    v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 240)];
    if (a2) {
      v12 = @"startingStopIndex";
    }
    else {
      v12 = @"starting_stop_index";
    }
    [v4 setObject:v11 forKey:v12];

    uint64_t v6 = *(void *)(a1 + 264);
  }
  if ((v6 & 0x10) != 0)
  {
    v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 220)];
    if (a2) {
      v14 = @"endingStopIndex";
    }
    else {
      v14 = @"ending_stop_index";
    }
    [v4 setObject:v13 forKey:v14];
  }
  if ([*(id *)(a1 + 176) count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 176), "count"));
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    id v16 = *(id *)(a1 + 176);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v159 objects:v167 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v160;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v160 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v159 + 1) + 8 * i);
          if (a2) {
            [v21 jsonRepresentation];
          }
          else {
          id v22 = [v21 dictionaryRepresentation];
          }

          [v15 addObject:v22];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v159 objects:v167 count:16];
      }
      while (v18);
    }

    if (a2) {
      v23 = @"vehicleInfo";
    }
    else {
      v23 = @"vehicle_info";
    }
    [v4 setObject:v15 forKey:v23];

    unint64_t v10 = 0x1E4F28000;
    id v5 = &OBJC_IVAR___GEOTransitSectionOption__defaultSectionIndex;
  }
  if ([*(id *)(a1 + 112) count])
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    id v25 = *(id *)(a1 + 112);
    uint64_t v26 = [v25 countByEnumeratingWithState:&v155 objects:v166 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v156;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v156 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v155 + 1) + 8 * j);
          if (a2) {
            [v30 jsonRepresentation];
          }
          else {
          id v31 = [v30 dictionaryRepresentation];
          }

          [v24 addObject:v31];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v155 objects:v166 count:16];
      }
      while (v27);
    }

    if (a2) {
      v32 = @"enterExitInfo";
    }
    else {
      v32 = @"enter_exit_info";
    }
    [v4 setObject:v24 forKey:v32];

    unint64_t v10 = 0x1E4F28000uLL;
    id v5 = &OBJC_IVAR___GEOTransitSectionOption__defaultSectionIndex;
  }
  uint64_t v33 = *(void *)(a1 + v5[20]);
  if ((v33 & 0x4000) != 0)
  {
    v34 = [*(id *)(v10 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 260)];
    if (a2) {
      v35 = @"prioritizeTilesPreloading";
    }
    else {
      v35 = @"prioritize_tiles_preloading";
    }
    [v4 setObject:v34 forKey:v35];

    uint64_t v33 = *(void *)(a1 + 264);
  }
  if ((v33 & 0x1000) != 0)
  {
    v36 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 252)];
    if (a2) {
      v37 = @"walkingIndex";
    }
    else {
      v37 = @"walking_index";
    }
    [v4 setObject:v36 forKey:v37];
  }
  if ([*(id *)(a1 + 160) count])
  {
    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    id v39 = *(id *)(a1 + 160);
    uint64_t v40 = [v39 countByEnumeratingWithState:&v151 objects:v165 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v152;
      do
      {
        for (uint64_t k = 0; k != v41; ++k)
        {
          if (*(void *)v152 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = *(void **)(*((void *)&v151 + 1) + 8 * k);
          if (a2) {
            [v44 jsonRepresentation];
          }
          else {
          id v45 = [v44 dictionaryRepresentation];
          }

          [v38 addObject:v45];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v151 objects:v165 count:16];
      }
      while (v41);
    }

    if (a2) {
      v46 = @"transferInfo";
    }
    else {
      v46 = @"transfer_info";
    }
    [v4 setObject:v38 forKey:v46];

    unint64_t v10 = 0x1E4F28000uLL;
    id v5 = &OBJC_IVAR___GEOTransitSectionOption__defaultSectionIndex;
  }
  if ((*(unsigned char *)(a1 + v5[20] + 1) & 4) != 0)
  {
    v47 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 244)];
    if (a2) {
      v48 = @"startingTime";
    }
    else {
      v48 = @"starting_time";
    }
    [v4 setObject:v47 forKey:v48];
  }
  v49 = [(id)a1 arrivalInfo];
  v50 = v49;
  if (v49)
  {
    if (a2)
    {
      v51 = [v49 jsonRepresentation];
      v52 = @"arrivalInfo";
    }
    else
    {
      v51 = [v49 dictionaryRepresentation];
      v52 = @"arrival_info";
    }
    id v53 = v51;

    [v4 setObject:v53 forKey:v52];
  }

  v54 = [(id)a1 location];
  v55 = v54;
  if (v54)
  {
    if (a2) {
      [v54 jsonRepresentation];
    }
    else {
    id v56 = [v54 dictionaryRepresentation];
    }

    [v4 setObject:v56 forKey:@"location"];
  }

  if (*(unsigned char *)(a1 + v5[20] + 1))
  {
    uint64_t v57 = *(int *)(a1 + 236);
    if (v57 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 236));
      v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v58 = off_1E53DB538[v57];
    }
    if (a2) {
      v59 = @"significanceForEndNode";
    }
    else {
      v59 = @"significance_for_end_node";
    }
    [v4 setObject:v58 forKey:v59];
  }
  v60 = [(id)a1 instructions];
  v61 = v60;
  if (v60)
  {
    if (a2) {
      [v60 jsonRepresentation];
    }
    else {
    id v62 = [v60 dictionaryRepresentation];
    }

    [v4 setObject:v62 forKey:@"instructions"];
  }

  uint64_t v63 = *(void *)(a1 + v5[20]);
  if ((v63 & 0x2000) != 0)
  {
    v64 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 256)];
    if (a2) {
      v65 = @"zilchIndex";
    }
    else {
      v65 = @"zilch_index";
    }
    [v4 setObject:v64 forKey:v65];

    uint64_t v63 = *(void *)(a1 + 264);
  }
  if ((v63 & 8) != 0)
  {
    v66 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 216)];
    if (a2) {
      v67 = @"distanceInMeters";
    }
    else {
      v67 = @"distance_in_meters";
    }
    [v4 setObject:v66 forKey:v67];
  }
  if (*(void *)(a1 + 32))
  {
    v68 = PBRepeatedUInt32NSArray();
    if (a2) {
      v69 = @"routeDetailsPrimaryArtworkIndex";
    }
    else {
      v69 = @"route_details_primary_artwork_index";
    }
    [v4 setObject:v68 forKey:v69];
  }
  if (*(void *)(a1 + 56))
  {
    v70 = PBRepeatedUInt32NSArray();
    if (a2) {
      v71 = @"steppingArtworkIndex";
    }
    else {
      v71 = @"stepping_artwork_index";
    }
    [v4 setObject:v70 forKey:v71];
  }
  uint64_t v72 = *(void *)(a1 + v5[20]);
  if ((v72 & 0x80) != 0)
  {
    v79 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 232)];
    if (a2) {
      v80 = @"routeDetailsSecondaryArtworkIndex";
    }
    else {
      v80 = @"route_details_secondary_artwork_index";
    }
    [v4 setObject:v79 forKey:v80];

    uint64_t v72 = *(void *)(a1 + 264);
    if ((v72 & 1) == 0)
    {
LABEL_125:
      if ((v72 & 2) == 0) {
        goto LABEL_126;
      }
      goto LABEL_144;
    }
  }
  else if ((v72 & 1) == 0)
  {
    goto LABEL_125;
  }
  v81 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 204)];
  if (a2) {
    v82 = @"accessPointZilchIndex";
  }
  else {
    v82 = @"access_point_zilch_index";
  }
  [v4 setObject:v81 forKey:v82];

  uint64_t v72 = *(void *)(a1 + 264);
  if ((v72 & 2) == 0)
  {
LABEL_126:
    if ((v72 & 4) == 0) {
      goto LABEL_127;
    }
    goto LABEL_148;
  }
LABEL_144:
  v83 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 208)];
  if (a2) {
    v84 = @"defaultVehicleInfoIndex";
  }
  else {
    v84 = @"default_vehicle_info_index";
  }
  [v4 setObject:v83 forKey:v84];

  uint64_t v72 = *(void *)(a1 + 264);
  if ((v72 & 4) == 0)
  {
LABEL_127:
    if ((v72 & 0x800) == 0) {
      goto LABEL_128;
    }
LABEL_152:
    v87 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 248)];
    if (a2) {
      v88 = @"steppingTransitIncidentMessageIndex";
    }
    else {
      v88 = @"stepping_transit_incident_message_index";
    }
    [v4 setObject:v87 forKey:v88];

    if ((*(void *)(a1 + 264) & 0x20) == 0) {
      goto LABEL_133;
    }
    goto LABEL_129;
  }
LABEL_148:
  v85 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 212)];
  if (a2) {
    v86 = @"departureFrequency";
  }
  else {
    v86 = @"departure_frequency";
  }
  [v4 setObject:v85 forKey:v86];

  uint64_t v72 = *(void *)(a1 + 264);
  if ((v72 & 0x800) != 0) {
    goto LABEL_152;
  }
LABEL_128:
  if ((v72 & 0x20) != 0)
  {
LABEL_129:
    v73 = [*(id *)(v10 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 224)];
    if (a2) {
      v74 = @"listTransitIncidentMessageIndex";
    }
    else {
      v74 = @"list_transit_incident_message_index";
    }
    [v4 setObject:v73 forKey:v74];
  }
LABEL_133:
  v75 = [(id)a1 advisoriesInfo];
  v76 = v75;
  if (v75)
  {
    if (a2)
    {
      v77 = [v75 jsonRepresentation];
      v78 = @"advisoriesInfo";
    }
    else
    {
      v77 = [v75 dictionaryRepresentation];
      v78 = @"advisories_info";
    }
    id v89 = v77;

    [v4 setObject:v89 forKey:v78];
  }

  v90 = [(id)a1 baseFare];
  v91 = v90;
  if (v90)
  {
    if (a2)
    {
      v92 = [v90 jsonRepresentation];
      v93 = @"baseFare";
    }
    else
    {
      v92 = [v90 dictionaryRepresentation];
      v93 = @"base_fare";
    }
    id v94 = v92;

    [v4 setObject:v94 forKey:v93];
  }

  v95 = [(id)a1 surcharge];
  v96 = v95;
  if (v95)
  {
    if (a2) {
      [v95 jsonRepresentation];
    }
    else {
    id v97 = [v95 dictionaryRepresentation];
    }

    [v4 setObject:v97 forKey:@"surcharge"];
  }

  v98 = [(id)a1 updateIdentifier];
  v99 = v98;
  if (v98)
  {
    if (a2)
    {
      v100 = [v98 base64EncodedStringWithOptions:0];
      [v4 setObject:v100 forKey:@"updateIdentifier"];
    }
    else
    {
      [v4 setObject:v98 forKey:@"update_identifier"];
    }
  }

  v101 = [(id)a1 vehiclePositionInfo];
  v102 = v101;
  if (v101)
  {
    if (a2)
    {
      v103 = [v101 jsonRepresentation];
      v104 = @"vehiclePositionInfo";
    }
    else
    {
      v103 = [v101 dictionaryRepresentation];
      v104 = @"vehicle_position_info";
    }
    id v105 = v103;

    [v4 setObject:v105 forKey:v104];
  }

  v106 = [(id)a1 scheduleInfo];
  v107 = v106;
  if (v106)
  {
    if (a2)
    {
      v108 = [v106 jsonRepresentation];
      v109 = @"scheduleInfo";
    }
    else
    {
      v108 = [v106 dictionaryRepresentation];
      v109 = @"schedule_info";
    }
    id v110 = v108;

    [v4 setObject:v110 forKey:v109];
  }

  v111 = [(id)a1 boardingInfo];
  v112 = v111;
  if (v111)
  {
    if (a2)
    {
      v113 = [v111 jsonRepresentation];
      v114 = @"boardingInfo";
    }
    else
    {
      v113 = [v111 dictionaryRepresentation];
      v114 = @"boarding_info";
    }
    id v115 = v113;

    [v4 setObject:v115 forKey:v114];
  }

  if ([*(id *)(a1 + 88) count])
  {
    v116 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id v117 = *(id *)(a1 + 88);
    uint64_t v118 = [v117 countByEnumeratingWithState:&v147 objects:v164 count:16];
    if (v118)
    {
      uint64_t v119 = v118;
      uint64_t v120 = *(void *)v148;
      do
      {
        for (uint64_t m = 0; m != v119; ++m)
        {
          if (*(void *)v148 != v120) {
            objc_enumerationMutation(v117);
          }
          v122 = *(void **)(*((void *)&v147 + 1) + 8 * m);
          if (a2) {
            [v122 jsonRepresentation];
          }
          else {
          id v123 = [v122 dictionaryRepresentation];
          }

          [v116 addObject:v123];
        }
        uint64_t v119 = [v117 countByEnumeratingWithState:&v147 objects:v164 count:16];
      }
      while (v119);
    }

    [v4 setObject:v116 forKey:@"badge"];
  }
  if ([*(id *)(a1 + 136) count])
  {
    v124 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    id v125 = *(id *)(a1 + 136);
    uint64_t v126 = [v125 countByEnumeratingWithState:&v143 objects:v163 count:16];
    if (v126)
    {
      uint64_t v127 = v126;
      uint64_t v128 = *(void *)v144;
      do
      {
        for (uint64_t n = 0; n != v127; ++n)
        {
          if (*(void *)v144 != v128) {
            objc_enumerationMutation(v125);
          }
          v130 = *(void **)(*((void *)&v143 + 1) + 8 * n);
          if (a2) {
            [v130 jsonRepresentation];
          }
          else {
          id v131 = [v130 dictionaryRepresentation];
          }

          [v124 addObject:v131];
        }
        uint64_t v127 = [v125 countByEnumeratingWithState:&v143 objects:v163 count:16];
      }
      while (v127);
    }

    if (a2) {
      v132 = @"regionAlert";
    }
    else {
      v132 = @"region_alert";
    }
    [v4 setObject:v124 forKey:v132];
  }
  v133 = *(void **)(a1 + 16);
  if (v133)
  {
    v134 = [v133 dictionaryRepresentation];
    v135 = v134;
    if (a2)
    {
      v136 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v134, "count"));
      v141[0] = MEMORY[0x1E4F143A8];
      v141[1] = 3221225472;
      v141[2] = __44__GEOTransitStep__dictionaryRepresentation___block_invoke;
      v141[3] = &unk_1E53D8860;
      id v137 = v136;
      id v142 = v137;
      [v135 enumerateKeysAndObjectsUsingBlock:v141];
      id v138 = v137;

      v135 = v138;
    }
    [v4 setObject:v135 forKey:@"Unknown Fields"];
  }
  id v139 = v4;

LABEL_220:

  return v139;
}

- (id)jsonRepresentation
{
  return -[GEOTransitStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOTransitStep__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (GEOTransitStep)initWithDictionary:(id)a3
{
  return (GEOTransitStep *)-[GEOTransitStep _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1 || (id v6 = (id)[a1 init], v6, !v6))
  {
    id v11 = 0;
    goto LABEL_300;
  }
  if (a3) {
    uint64_t v7 = @"maneuverType";
  }
  else {
    uint64_t v7 = @"maneuver_type";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"UNKNOWN_MANEUVER"])
    {
      uint64_t v10 = 0;
    }
    else if ([v9 isEqualToString:@"LEAVE_ORIGIN"])
    {
      uint64_t v10 = 1;
    }
    else if ([v9 isEqualToString:@"WALK"])
    {
      uint64_t v10 = 2;
    }
    else if ([v9 isEqualToString:@"BOARD_VEHICLE"])
    {
      uint64_t v10 = 3;
    }
    else if ([v9 isEqualToString:@"PASS_STOP"])
    {
      uint64_t v10 = 4;
    }
    else if ([v9 isEqualToString:@"ALIGHT"])
    {
      uint64_t v10 = 5;
    }
    else if ([v9 isEqualToString:@"TRANSFER_STOP_TO_STOP"])
    {
      uint64_t v10 = 6;
    }
    else if ([v9 isEqualToString:@"GOTO_STOP"])
    {
      uint64_t v10 = 7;
    }
    else if ([v9 isEqualToString:@"LEAVE_STOP"])
    {
      uint64_t v10 = 8;
    }
    else if ([v9 isEqualToString:@"BLOCK_TRANSFER"])
    {
      uint64_t v10 = 9;
    }
    else if ([v9 isEqualToString:@"ARRIVE_AT_DESTINATION"])
    {
      uint64_t v10 = 10;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_35;
    }
    uint64_t v10 = [v8 intValue];
  }
  [v6 setManeuverType:v10];
LABEL_35:

  if (a3) {
    v12 = @"startingStopIndex";
  }
  else {
    v12 = @"starting_stop_index";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setStartingStopIndex:", objc_msgSend(v13, "unsignedIntValue"));
  }

  if (a3) {
    v14 = @"endingStopIndex";
  }
  else {
    v14 = @"ending_stop_index";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setEndingStopIndex:", objc_msgSend(v15, "unsignedIntValue"));
  }

  if (a3) {
    id v16 = @"vehicleInfo";
  }
  else {
    id v16 = @"vehicle_info";
  }
  uint64_t v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  id v161 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v188 = 0u;
    long long v189 = 0u;
    long long v186 = 0u;
    long long v187 = 0u;
    long long v158 = v17;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v186 objects:v196 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v187;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v187 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v186 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v24 = [GEOTransitVehicleInfo alloc];
            if (a3) {
              uint64_t v25 = [(GEOTransitVehicleInfo *)v24 initWithJSON:v23];
            }
            else {
              uint64_t v25 = [(GEOTransitVehicleInfo *)v24 initWithDictionary:v23];
            }
            uint64_t v26 = (void *)v25;
            objc_msgSend(v6, "addVehicleInfo:", v25, v158);
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v186 objects:v196 count:16];
      }
      while (v20);
    }

    uint64_t v17 = v158;
  }

  if (a3) {
    uint64_t v27 = @"enterExitInfo";
  }
  else {
    uint64_t v27 = @"enter_exit_info";
  }
  uint64_t v28 = objc_msgSend(v5, "objectForKeyedSubscript:", v27, v158);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v184 = 0u;
    long long v185 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    long long v159 = v28;
    id v29 = v28;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v182 objects:v195 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v183;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v183 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v182 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v35 = [GEOTransitEnterExitInfo alloc];
            if (a3) {
              uint64_t v36 = [(GEOTransitEnterExitInfo *)v35 initWithJSON:v34];
            }
            else {
              uint64_t v36 = [(GEOTransitEnterExitInfo *)v35 initWithDictionary:v34];
            }
            v37 = (void *)v36;
            objc_msgSend(v6, "addEnterExitInfo:", v36, v159);
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v182 objects:v195 count:16];
      }
      while (v31);
    }

    uint64_t v28 = v159;
  }

  if (a3) {
    v38 = @"prioritizeTilesPreloading";
  }
  else {
    v38 = @"prioritize_tiles_preloading";
  }
  id v39 = objc_msgSend(v5, "objectForKeyedSubscript:", v38, v159);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setPrioritizeTilesPreloading:", objc_msgSend(v39, "BOOLValue"));
  }

  if (a3) {
    uint64_t v40 = @"walkingIndex";
  }
  else {
    uint64_t v40 = @"walking_index";
  }
  uint64_t v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setWalkingIndex:", objc_msgSend(v41, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v42 = @"transferInfo";
  }
  else {
    uint64_t v42 = @"transfer_info";
  }
  v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v180 = 0u;
    long long v181 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    long long v160 = v43;
    id v44 = v43;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v178 objects:v194 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v179;
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v179 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = *(void *)(*((void *)&v178 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v50 = [GEOTransitTransferInfo alloc];
            if (a3) {
              uint64_t v51 = [(GEOTransitTransferInfo *)v50 initWithJSON:v49];
            }
            else {
              uint64_t v51 = [(GEOTransitTransferInfo *)v50 initWithDictionary:v49];
            }
            v52 = (void *)v51;
            objc_msgSend(v6, "addTransferInfo:", v51, v160);
          }
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v178 objects:v194 count:16];
      }
      while (v46);
    }

    v43 = v160;
  }

  if (a3) {
    id v53 = @"startingTime";
  }
  else {
    id v53 = @"starting_time";
  }
  v54 = objc_msgSend(v5, "objectForKeyedSubscript:", v53, v160);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setStartingTime:", objc_msgSend(v54, "unsignedIntValue"));
  }

  if (a3) {
    v55 = @"arrivalInfo";
  }
  else {
    v55 = @"arrival_info";
  }
  id v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v57 = [GEOTransitArrivalInfo alloc];
    if (a3) {
      uint64_t v58 = [(GEOTransitArrivalInfo *)v57 initWithJSON:v56];
    }
    else {
      uint64_t v58 = [(GEOTransitArrivalInfo *)v57 initWithDictionary:v56];
    }
    v59 = (void *)v58;
    [v6 setArrivalInfo:v58];
  }
  v60 = [v5 objectForKeyedSubscript:@"location"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v61 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v62 = [(GEOLatLng *)v61 initWithJSON:v60];
    }
    else {
      uint64_t v62 = [(GEOLatLng *)v61 initWithDictionary:v60];
    }
    uint64_t v63 = (void *)v62;
    [v6 setLocation:v62];
  }
  if (a3) {
    v64 = @"significanceForEndNode";
  }
  else {
    v64 = @"significance_for_end_node";
  }
  v65 = [v5 objectForKeyedSubscript:v64];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v66 = v65;
    if ([v66 isEqualToString:@"NO_SIGNIFICANCE"])
    {
      uint64_t v67 = 0;
    }
    else if ([v66 isEqualToString:@"EXTRA_SMALL_SIGNIFICANCE"])
    {
      uint64_t v67 = 1;
    }
    else if ([v66 isEqualToString:@"SMALL_SIGNIFICANCE"])
    {
      uint64_t v67 = 2;
    }
    else if ([v66 isEqualToString:@"MEDIUM_SIGNIFICANCE"])
    {
      uint64_t v67 = 3;
    }
    else if ([v66 isEqualToString:@"LARGE_SIGNIFICANCE"])
    {
      uint64_t v67 = 4;
    }
    else if ([v66 isEqualToString:@"EXTRA_LARGE_SIGNIFICANCE"])
    {
      uint64_t v67 = 5;
    }
    else
    {
      uint64_t v67 = 0;
    }

    goto LABEL_144;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v67 = [v65 intValue];
LABEL_144:
    [v6 setSignificanceForEndNode:v67];
  }

  v68 = [v5 objectForKeyedSubscript:@"instructions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v69 = [GEOInstructionSet alloc];
    if (a3) {
      uint64_t v70 = [(GEOInstructionSet *)v69 initWithJSON:v68];
    }
    else {
      uint64_t v70 = [(GEOInstructionSet *)v69 initWithDictionary:v68];
    }
    v71 = (void *)v70;
    [v6 setInstructions:v70];
  }
  if (a3) {
    uint64_t v72 = @"zilchIndex";
  }
  else {
    uint64_t v72 = @"zilch_index";
  }
  v73 = [v5 objectForKeyedSubscript:v72];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setZilchIndex:", objc_msgSend(v73, "unsignedIntValue"));
  }

  if (a3) {
    v74 = @"distanceInMeters";
  }
  else {
    v74 = @"distance_in_meters";
  }
  v75 = [v5 objectForKeyedSubscript:v74];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setDistanceInMeters:", objc_msgSend(v75, "unsignedIntValue"));
  }

  if (a3) {
    v76 = @"routeDetailsPrimaryArtworkIndex";
  }
  else {
    v76 = @"route_details_primary_artwork_index";
  }
  v77 = [v5 objectForKeyedSubscript:v76];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v176 = 0u;
    long long v177 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    id v78 = v77;
    uint64_t v79 = [v78 countByEnumeratingWithState:&v174 objects:v193 count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v175;
      do
      {
        for (uint64_t m = 0; m != v80; ++m)
        {
          if (*(void *)v175 != v81) {
            objc_enumerationMutation(v78);
          }
          v83 = *(void **)(*((void *)&v174 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v6, "addRouteDetailsPrimaryArtworkIndex:", objc_msgSend(v83, "unsignedIntValue"));
          }
        }
        uint64_t v80 = [v78 countByEnumeratingWithState:&v174 objects:v193 count:16];
      }
      while (v80);
    }

    id v5 = v161;
  }

  if (a3) {
    v84 = @"steppingArtworkIndex";
  }
  else {
    v84 = @"stepping_artwork_index";
  }
  v85 = [v5 objectForKeyedSubscript:v84];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v172 = 0u;
    long long v173 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    id v86 = v85;
    uint64_t v87 = [v86 countByEnumeratingWithState:&v170 objects:v192 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      uint64_t v89 = *(void *)v171;
      do
      {
        for (uint64_t n = 0; n != v88; ++n)
        {
          if (*(void *)v171 != v89) {
            objc_enumerationMutation(v86);
          }
          v91 = *(void **)(*((void *)&v170 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v6, "addSteppingArtworkIndex:", objc_msgSend(v91, "unsignedIntValue"));
          }
        }
        uint64_t v88 = [v86 countByEnumeratingWithState:&v170 objects:v192 count:16];
      }
      while (v88);
    }

    id v5 = v161;
  }

  if (a3) {
    v92 = @"routeDetailsSecondaryArtworkIndex";
  }
  else {
    v92 = @"route_details_secondary_artwork_index";
  }
  v93 = [v5 objectForKeyedSubscript:v92];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setRouteDetailsSecondaryArtworkIndex:", objc_msgSend(v93, "unsignedIntValue"));
  }

  if (a3) {
    id v94 = @"accessPointZilchIndex";
  }
  else {
    id v94 = @"access_point_zilch_index";
  }
  v95 = [v5 objectForKeyedSubscript:v94];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setAccessPointZilchIndex:", objc_msgSend(v95, "unsignedIntValue"));
  }

  if (a3) {
    v96 = @"defaultVehicleInfoIndex";
  }
  else {
    v96 = @"default_vehicle_info_index";
  }
  id v97 = [v5 objectForKeyedSubscript:v96];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setDefaultVehicleInfoIndex:", objc_msgSend(v97, "unsignedIntValue"));
  }

  if (a3) {
    v98 = @"departureFrequency";
  }
  else {
    v98 = @"departure_frequency";
  }
  v99 = [v5 objectForKeyedSubscript:v98];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setDepartureFrequency:", objc_msgSend(v99, "unsignedIntValue"));
  }

  if (a3) {
    v100 = @"steppingTransitIncidentMessageIndex";
  }
  else {
    v100 = @"stepping_transit_incident_message_index";
  }
  v101 = [v5 objectForKeyedSubscript:v100];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setSteppingTransitIncidentMessageIndex:", objc_msgSend(v101, "unsignedIntValue"));
  }

  if (a3) {
    v102 = @"listTransitIncidentMessageIndex";
  }
  else {
    v102 = @"list_transit_incident_message_index";
  }
  v103 = [v5 objectForKeyedSubscript:v102];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setListTransitIncidentMessageIndex:", objc_msgSend(v103, "unsignedIntValue"));
  }

  if (a3) {
    v104 = @"advisoriesInfo";
  }
  else {
    v104 = @"advisories_info";
  }
  id v105 = [v5 objectForKeyedSubscript:v104];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v106 = [GEOAdvisoriesInfo alloc];
    if (a3) {
      uint64_t v107 = [(GEOAdvisoriesInfo *)v106 initWithJSON:v105];
    }
    else {
      uint64_t v107 = [(GEOAdvisoriesInfo *)v106 initWithDictionary:v105];
    }
    v108 = (void *)v107;
    [v6 setAdvisoriesInfo:v107];
  }
  if (a3) {
    v109 = @"baseFare";
  }
  else {
    v109 = @"base_fare";
  }
  id v110 = [v5 objectForKeyedSubscript:v109];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v111 = [GEOTransitBaseFare alloc];
    if (a3) {
      uint64_t v112 = [(GEOTransitBaseFare *)v111 initWithJSON:v110];
    }
    else {
      uint64_t v112 = [(GEOTransitBaseFare *)v111 initWithDictionary:v110];
    }
    v113 = (void *)v112;
    [v6 setBaseFare:v112];
  }
  v114 = [v5 objectForKeyedSubscript:@"surcharge"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v115 = [GEOTransitSurcharge alloc];
    if (a3) {
      uint64_t v116 = [(GEOTransitSurcharge *)v115 initWithJSON:v114];
    }
    else {
      uint64_t v116 = [(GEOTransitSurcharge *)v115 initWithDictionary:v114];
    }
    id v117 = (void *)v116;
    [v6 setSurcharge:v116];
  }
  if (a3) {
    uint64_t v118 = @"updateIdentifier";
  }
  else {
    uint64_t v118 = @"update_identifier";
  }
  uint64_t v119 = [v5 objectForKeyedSubscript:v118];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v120 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v119 options:0];
    [v6 setUpdateIdentifier:v120];
  }
  if (a3) {
    v121 = @"vehiclePositionInfo";
  }
  else {
    v121 = @"vehicle_position_info";
  }
  v122 = [v5 objectForKeyedSubscript:v121];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v123 = [GEOTransitVehiclePositionInfo alloc];
    if (a3) {
      uint64_t v124 = [(GEOTransitVehiclePositionInfo *)v123 initWithJSON:v122];
    }
    else {
      uint64_t v124 = [(GEOTransitVehiclePositionInfo *)v123 initWithDictionary:v122];
    }
    id v125 = (void *)v124;
    [v6 setVehiclePositionInfo:v124];
  }
  if (a3) {
    uint64_t v126 = @"scheduleInfo";
  }
  else {
    uint64_t v126 = @"schedule_info";
  }
  uint64_t v127 = [v5 objectForKeyedSubscript:v126];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v128 = [GEOTransitScheduleInfo alloc];
    if (a3) {
      uint64_t v129 = [(GEOTransitScheduleInfo *)v128 initWithJSON:v127];
    }
    else {
      uint64_t v129 = [(GEOTransitScheduleInfo *)v128 initWithDictionary:v127];
    }
    v130 = (void *)v129;
    [v6 setScheduleInfo:v129];
  }
  if (a3) {
    id v131 = @"boardingInfo";
  }
  else {
    id v131 = @"boarding_info";
  }
  v132 = [v5 objectForKeyedSubscript:v131];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v133 = [GEOTransitBoardingInfo alloc];
    if (a3) {
      uint64_t v134 = [(GEOTransitBoardingInfo *)v133 initWithJSON:v132];
    }
    else {
      uint64_t v134 = [(GEOTransitBoardingInfo *)v133 initWithDictionary:v132];
    }
    v135 = (void *)v134;
    [v6 setBoardingInfo:v134];
  }
  v136 = [v5 objectForKeyedSubscript:@"badge"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v168 = 0u;
    long long v169 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    id v137 = v136;
    uint64_t v138 = [v137 countByEnumeratingWithState:&v166 objects:v191 count:16];
    if (v138)
    {
      uint64_t v139 = v138;
      uint64_t v140 = *(void *)v167;
      do
      {
        for (iuint64_t i = 0; ii != v139; ++ii)
        {
          if (*(void *)v167 != v140) {
            objc_enumerationMutation(v137);
          }
          uint64_t v142 = *(void *)(*((void *)&v166 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v143 = [GEOTransitStepBadge alloc];
            if (a3) {
              uint64_t v144 = [(GEOTransitStepBadge *)v143 initWithJSON:v142];
            }
            else {
              uint64_t v144 = [(GEOTransitStepBadge *)v143 initWithDictionary:v142];
            }
            long long v145 = (void *)v144;
            [v6 addBadge:v144];
          }
        }
        uint64_t v139 = [v137 countByEnumeratingWithState:&v166 objects:v191 count:16];
      }
      while (v139);
    }

    id v5 = v161;
  }

  if (a3) {
    long long v146 = @"regionAlert";
  }
  else {
    long long v146 = @"region_alert";
  }
  long long v147 = [v5 objectForKeyedSubscript:v146];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v164 = 0u;
    long long v165 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    id v148 = v147;
    uint64_t v149 = [v148 countByEnumeratingWithState:&v162 objects:v190 count:16];
    if (v149)
    {
      uint64_t v150 = v149;
      uint64_t v151 = *(void *)v163;
      do
      {
        for (juint64_t j = 0; jj != v150; ++jj)
        {
          if (*(void *)v163 != v151) {
            objc_enumerationMutation(v148);
          }
          uint64_t v153 = *(void *)(*((void *)&v162 + 1) + 8 * jj);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v154 = [GEOTransitRegionAlert alloc];
            if (a3) {
              uint64_t v155 = [(GEOTransitRegionAlert *)v154 initWithJSON:v153];
            }
            else {
              uint64_t v155 = [(GEOTransitRegionAlert *)v154 initWithDictionary:v153];
            }
            long long v156 = (void *)v155;
            [v6 addRegionAlert:v155];
          }
        }
        uint64_t v150 = [v148 countByEnumeratingWithState:&v162 objects:v190 count:16];
      }
      while (v150);
    }

    id v5 = v161;
  }

  id v11 = v6;
LABEL_300:

  return v11;
}

- (GEOTransitStep)initWithJSON:(id)a3
{
  return (GEOTransitStep *)-[GEOTransitStep _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1643;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1644;
    }
    GEOTransitStepReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitStepCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitStepIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v32 = self->_reader;
    objc_sync_enter(v32);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v33 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v33];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v32);
    goto LABEL_97;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitStep *)self readAll:0];
  $5D35F1586042F4506E133FD2A7885CCE flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_5;
    }
LABEL_94:
    PBDataWriterWriteUint32Field();
    if ((*(void *)&self->_flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  $5D35F1586042F4506E133FD2A7885CCE flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0) {
    goto LABEL_94;
  }
LABEL_5:
  if ((*(unsigned char *)&flags & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v7 = self->_vehicleInfos;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v51 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v8);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v11 = self->_enterExitInfos;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v12);
  }

  $5D35F1586042F4506E133FD2A7885CCE v15 = self->_flags;
  if ((*(_WORD *)&v15 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $5D35F1586042F4506E133FD2A7885CCE v15 = self->_flags;
  }
  if ((*(_WORD *)&v15 & 0x1000) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v16 = self->_transferInfos;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v42 objects:v56 count:16];
    }
    while (v17);
  }

  if ((*((unsigned char *)&self->_flags + 1) & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_arrivalInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_location) {
    PBDataWriterWriteSubmessage();
  }
  if (*((unsigned char *)&self->_flags + 1)) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_instructions) {
    PBDataWriterWriteSubmessage();
  }
  $5D35F1586042F4506E133FD2A7885CCE v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x2000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $5D35F1586042F4506E133FD2A7885CCE v20 = self->_flags;
  }
  if ((*(unsigned char *)&v20 & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_routeDetailsPrimaryArtworkIndexs.count)
  {
    unint64_t v21 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v21;
    }
    while (v21 < self->_routeDetailsPrimaryArtworkIndexs.count);
  }
  if (self->_steppingArtworkIndexs.count)
  {
    unint64_t v22 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v22;
    }
    while (v22 < self->_steppingArtworkIndexs.count);
  }
  $5D35F1586042F4506E133FD2A7885CCE v23 = self->_flags;
  if ((*(unsigned char *)&v23 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    $5D35F1586042F4506E133FD2A7885CCE v23 = self->_flags;
  }
  if (*(unsigned char *)&v23)
  {
    PBDataWriterWriteUint32Field();
    $5D35F1586042F4506E133FD2A7885CCE v23 = self->_flags;
  }
  if ((*(unsigned char *)&v23 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    $5D35F1586042F4506E133FD2A7885CCE v23 = self->_flags;
  }
  if ((*(unsigned char *)&v23 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    $5D35F1586042F4506E133FD2A7885CCE v23 = self->_flags;
  }
  if ((*(_WORD *)&v23 & 0x800) != 0)
  {
    PBDataWriterWriteUint32Field();
    $5D35F1586042F4506E133FD2A7885CCE v23 = self->_flags;
  }
  if ((*(unsigned char *)&v23 & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_advisoriesInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_baseFare) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_surcharge) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_updateIdentifier) {
    PBDataWriterWriteDataField();
  }
  if (self->_vehiclePositionInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_scheduleInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_boardingInfo) {
    PBDataWriterWriteSubmessage();
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v24 = self->_badges;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v38 objects:v55 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v39;
    do
    {
      for (uint64_t m = 0; m != v25; ++m)
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(v24);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v38 objects:v55 count:16];
    }
    while (v25);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v28 = self->_regionAlerts;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v34 objects:v54 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v35;
    do
    {
      for (uint64_t n = 0; n != v29; ++n)
      {
        if (*(void *)v35 != v30) {
          objc_enumerationMutation(v28);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v34 objects:v54 count:16];
    }
    while (v29);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v34);
LABEL_97:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOTransitStep _readAdvisoriesInfo]((uint64_t)self);
  if ([(GEOAdvisoriesInfo *)self->_advisoriesInfo hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOTransitStep _readLocation]((uint64_t)self);
  if ([(GEOLatLng *)self->_location hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOTransitStep _readRegionAlerts]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_regionAlerts;
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
          goto LABEL_14;
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
LABEL_14:

  return v5;
}

- (void)copyTo:(id)a3
{
  long long v35 = (id *)a3;
  [(GEOTransitStep *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v35 + 1, self->_reader);
  *((_DWORD *)v35 + 48) = self->_readerMarkPos;
  *((_DWORD *)v35 + 49) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  $5D35F1586042F4506E133FD2A7885CCE flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_3;
    }
LABEL_76:
    *((_DWORD *)v35 + 60) = self->_startingStopIndex;
    v35[33] = (id)((unint64_t)v35[33] | 0x200);
    if ((*(void *)&self->_flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v35 + 57) = self->_maneuverType;
  v35[33] = (id)((unint64_t)v35[33] | 0x40);
  $5D35F1586042F4506E133FD2A7885CCE flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0) {
    goto LABEL_76;
  }
LABEL_3:
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_4:
    *((_DWORD *)v35 + 55) = self->_endingStopIndex;
    v35[33] = (id)((unint64_t)v35[33] | 0x10);
  }
LABEL_5:
  if ([(GEOTransitStep *)self vehicleInfosCount])
  {
    [v35 clearVehicleInfos];
    unint64_t v5 = [(GEOTransitStep *)self vehicleInfosCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOTransitStep *)self vehicleInfoAtIndex:i];
        [v35 addVehicleInfo:v8];
      }
    }
  }
  if ([(GEOTransitStep *)self enterExitInfosCount])
  {
    [v35 clearEnterExitInfos];
    unint64_t v9 = [(GEOTransitStep *)self enterExitInfosCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        long long v12 = [(GEOTransitStep *)self enterExitInfoAtIndex:j];
        [v35 addEnterExitInfo:v12];
      }
    }
  }
  $5D35F1586042F4506E133FD2A7885CCE v13 = self->_flags;
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
    *((unsigned char *)v35 + 260) = self->_prioritizeTilesPreloading;
    v35[33] = (id)((unint64_t)v35[33] | 0x4000);
    $5D35F1586042F4506E133FD2A7885CCE v13 = self->_flags;
  }
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
    *((_DWORD *)v35 + 63) = self->_walkingIndex;
    v35[33] = (id)((unint64_t)v35[33] | 0x1000);
  }
  if ([(GEOTransitStep *)self transferInfosCount])
  {
    [v35 clearTransferInfos];
    unint64_t v14 = [(GEOTransitStep *)self transferInfosCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(GEOTransitStep *)self transferInfoAtIndex:k];
        [v35 addTransferInfo:v17];
      }
    }
  }
  uint64_t v18 = v35;
  if ((*((unsigned char *)&self->_flags + 1) & 4) != 0)
  {
    *((_DWORD *)v35 + 61) = self->_startingTime;
    v35[33] = (id)((unint64_t)v35[33] | 0x400);
  }
  if (self->_arrivalInfo)
  {
    objc_msgSend(v35, "setArrivalInfo:");
    uint64_t v18 = v35;
  }
  if (self->_location)
  {
    objc_msgSend(v35, "setLocation:");
    uint64_t v18 = v35;
  }
  if (*((unsigned char *)&self->_flags + 1))
  {
    *((_DWORD *)v18 + 59) = self->_significanceForEndNode;
    v18[33] = (id)((unint64_t)v18[33] | 0x100);
  }
  if (self->_instructions)
  {
    objc_msgSend(v35, "setInstructions:");
    uint64_t v18 = v35;
  }
  $5D35F1586042F4506E133FD2A7885CCE v19 = self->_flags;
  if ((*(_WORD *)&v19 & 0x2000) != 0)
  {
    *((_DWORD *)v18 + 64) = self->_zilchIndex;
    v18[33] = (id)((unint64_t)v18[33] | 0x2000);
    $5D35F1586042F4506E133FD2A7885CCE v19 = self->_flags;
  }
  if ((*(unsigned char *)&v19 & 8) != 0)
  {
    *((_DWORD *)v18 + 54) = self->_distanceInMeters;
    v18[33] = (id)((unint64_t)v18[33] | 8);
  }
  if ([(GEOTransitStep *)self routeDetailsPrimaryArtworkIndexsCount])
  {
    [v35 clearRouteDetailsPrimaryArtworkIndexs];
    unint64_t v20 = [(GEOTransitStep *)self routeDetailsPrimaryArtworkIndexsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t m = 0; m != v21; ++m)
        objc_msgSend(v35, "addRouteDetailsPrimaryArtworkIndex:", -[GEOTransitStep routeDetailsPrimaryArtworkIndexAtIndex:](self, "routeDetailsPrimaryArtworkIndexAtIndex:", m));
    }
  }
  if ([(GEOTransitStep *)self steppingArtworkIndexsCount])
  {
    [v35 clearSteppingArtworkIndexs];
    unint64_t v23 = [(GEOTransitStep *)self steppingArtworkIndexsCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (uint64_t n = 0; n != v24; ++n)
        objc_msgSend(v35, "addSteppingArtworkIndex:", -[GEOTransitStep steppingArtworkIndexAtIndex:](self, "steppingArtworkIndexAtIndex:", n));
    }
  }
  $5D35F1586042F4506E133FD2A7885CCE v26 = self->_flags;
  if ((*(unsigned char *)&v26 & 0x80) != 0)
  {
    *((_DWORD *)v35 + 58) = self->_routeDetailsSecondaryArtworkIndex;
    v35[33] = (id)((unint64_t)v35[33] | 0x80);
    $5D35F1586042F4506E133FD2A7885CCE v26 = self->_flags;
    if ((*(unsigned char *)&v26 & 1) == 0)
    {
LABEL_45:
      if ((*(unsigned char *)&v26 & 2) == 0) {
        goto LABEL_46;
      }
      goto LABEL_80;
    }
  }
  else if ((*(unsigned char *)&v26 & 1) == 0)
  {
    goto LABEL_45;
  }
  *((_DWORD *)v35 + 51) = self->_accessPointZilchIndex;
  v35[33] = (id)((unint64_t)v35[33] | 1);
  $5D35F1586042F4506E133FD2A7885CCE v26 = self->_flags;
  if ((*(unsigned char *)&v26 & 2) == 0)
  {
LABEL_46:
    if ((*(unsigned char *)&v26 & 4) == 0) {
      goto LABEL_47;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)v35 + 52) = self->_defaultVehicleInfoIndex;
  v35[33] = (id)((unint64_t)v35[33] | 2);
  $5D35F1586042F4506E133FD2A7885CCE v26 = self->_flags;
  if ((*(unsigned char *)&v26 & 4) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v26 & 0x800) == 0) {
      goto LABEL_48;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)v35 + 53) = self->_departureFrequency;
  v35[33] = (id)((unint64_t)v35[33] | 4);
  $5D35F1586042F4506E133FD2A7885CCE v26 = self->_flags;
  if ((*(_WORD *)&v26 & 0x800) == 0)
  {
LABEL_48:
    if ((*(unsigned char *)&v26 & 0x20) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_82:
  *((_DWORD *)v35 + 62) = self->_steppingTransitIncidentMessageIndex;
  v35[33] = (id)((unint64_t)v35[33] | 0x800);
  if ((*(void *)&self->_flags & 0x20) != 0)
  {
LABEL_49:
    *((_DWORD *)v35 + 56) = self->_listTransitIncidentMessageIndex;
    v35[33] = (id)((unint64_t)v35[33] | 0x20);
  }
LABEL_50:
  if (self->_advisoriesInfo) {
    objc_msgSend(v35, "setAdvisoriesInfo:");
  }
  if (self->_baseFare) {
    objc_msgSend(v35, "setBaseFare:");
  }
  if (self->_surcharge) {
    objc_msgSend(v35, "setSurcharge:");
  }
  if (self->_updateIdentifier) {
    objc_msgSend(v35, "setUpdateIdentifier:");
  }
  if (self->_vehiclePositionInfo) {
    objc_msgSend(v35, "setVehiclePositionInfo:");
  }
  if (self->_scheduleInfo) {
    objc_msgSend(v35, "setScheduleInfo:");
  }
  if (self->_boardingInfo) {
    objc_msgSend(v35, "setBoardingInfo:");
  }
  if ([(GEOTransitStep *)self badgesCount])
  {
    [v35 clearBadges];
    unint64_t v27 = [(GEOTransitStep *)self badgesCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (iuint64_t i = 0; ii != v28; ++ii)
      {
        uint64_t v30 = [(GEOTransitStep *)self badgeAtIndex:ii];
        [v35 addBadge:v30];
      }
    }
  }
  if ([(GEOTransitStep *)self regionAlertsCount])
  {
    [v35 clearRegionAlerts];
    unint64_t v31 = [(GEOTransitStep *)self regionAlertsCount];
    if (v31)
    {
      unint64_t v32 = v31;
      for (juint64_t j = 0; jj != v32; ++jj)
      {
        long long v34 = [(GEOTransitStep *)self regionAlertAtIndex:jj];
        [v35 addRegionAlert:v34];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
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
      GEOTransitStepReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_64;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitStep *)self readAll:0];
  $5D35F1586042F4506E133FD2A7885CCE flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 228) = self->_maneuverType;
    *(void *)(v5 + 264) |= 0x40uLL;
    $5D35F1586042F4506E133FD2A7885CCE flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&flags & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(_WORD *)&flags & 0x200) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 240) = self->_startingStopIndex;
  *(void *)(v5 + 264) |= 0x200uLL;
  if ((*(void *)&self->_flags & 0x10) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 220) = self->_endingStopIndex;
    *(void *)(v5 + 264) |= 0x10uLL;
  }
LABEL_9:
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  unint64_t v10 = self->_vehicleInfos;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v76 objects:v84 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v77 != v12) {
          objc_enumerationMutation(v10);
        }
        unint64_t v14 = (void *)[*(id *)(*((void *)&v76 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addVehicleInfo:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v76 objects:v84 count:16];
    }
    while (v11);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  unint64_t v15 = self->_enterExitInfos;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v72 objects:v83 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v73;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v73 != v17) {
          objc_enumerationMutation(v15);
        }
        $5D35F1586042F4506E133FD2A7885CCE v19 = (void *)[*(id *)(*((void *)&v72 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addEnterExitInfo:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v72 objects:v83 count:16];
    }
    while (v16);
  }

  $5D35F1586042F4506E133FD2A7885CCE v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x4000) != 0)
  {
    *(unsigned char *)(v5 + 260) = self->_prioritizeTilesPreloading;
    *(void *)(v5 + 264) |= 0x4000uLL;
    $5D35F1586042F4506E133FD2A7885CCE v20 = self->_flags;
  }
  if ((*(_WORD *)&v20 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 252) = self->_walkingIndex;
    *(void *)(v5 + 264) |= 0x1000uLL;
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  unint64_t v21 = self->_transferInfos;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v68 objects:v82 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v69;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v69 != v23) {
          objc_enumerationMutation(v21);
        }
        uint64_t v25 = (void *)[*(id *)(*((void *)&v68 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addTransferInfo:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v68 objects:v82 count:16];
    }
    while (v22);
  }

  if ((*((unsigned char *)&self->_flags + 1) & 4) != 0)
  {
    *(_DWORD *)(v5 + 244) = self->_startingTime;
    *(void *)(v5 + 264) |= 0x400uLL;
  }
  id v26 = [(GEOTransitArrivalInfo *)self->_arrivalInfo copyWithZone:a3];
  unint64_t v27 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v26;

  id v28 = [(GEOLatLng *)self->_location copyWithZone:a3];
  uint64_t v29 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v28;

  if (*((unsigned char *)&self->_flags + 1))
  {
    *(_DWORD *)(v5 + 236) = self->_significanceForEndNode;
    *(void *)(v5 + 264) |= 0x100uLL;
  }
  id v30 = [(GEOInstructionSet *)self->_instructions copyWithZone:a3];
  unint64_t v31 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v30;

  $5D35F1586042F4506E133FD2A7885CCE v32 = self->_flags;
  if ((*(_WORD *)&v32 & 0x2000) != 0)
  {
    *(_DWORD *)(v5 + 256) = self->_zilchIndex;
    *(void *)(v5 + 264) |= 0x2000uLL;
    $5D35F1586042F4506E133FD2A7885CCE v32 = self->_flags;
  }
  if ((*(unsigned char *)&v32 & 8) != 0)
  {
    *(_DWORD *)(v5 + 216) = self->_distanceInMeters;
    *(void *)(v5 + 264) |= 8uLL;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  $5D35F1586042F4506E133FD2A7885CCE v33 = self->_flags;
  if ((*(unsigned char *)&v33 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 232) = self->_routeDetailsSecondaryArtworkIndex;
    *(void *)(v5 + 264) |= 0x80uLL;
    $5D35F1586042F4506E133FD2A7885CCE v33 = self->_flags;
    if ((*(unsigned char *)&v33 & 1) == 0)
    {
LABEL_44:
      if ((*(unsigned char *)&v33 & 2) == 0) {
        goto LABEL_45;
      }
      goto LABEL_70;
    }
  }
  else if ((*(unsigned char *)&v33 & 1) == 0)
  {
    goto LABEL_44;
  }
  *(_DWORD *)(v5 + 204) = self->_accessPointZilchIndex;
  *(void *)(v5 + 264) |= 1uLL;
  $5D35F1586042F4506E133FD2A7885CCE v33 = self->_flags;
  if ((*(unsigned char *)&v33 & 2) == 0)
  {
LABEL_45:
    if ((*(unsigned char *)&v33 & 4) == 0) {
      goto LABEL_46;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(_DWORD *)(v5 + 208) = self->_defaultVehicleInfoIndex;
  *(void *)(v5 + 264) |= 2uLL;
  $5D35F1586042F4506E133FD2A7885CCE v33 = self->_flags;
  if ((*(unsigned char *)&v33 & 4) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v33 & 0x800) == 0) {
      goto LABEL_47;
    }
LABEL_72:
    *(_DWORD *)(v5 + 248) = self->_steppingTransitIncidentMessageIndex;
    *(void *)(v5 + 264) |= 0x800uLL;
    if ((*(void *)&self->_flags & 0x20) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_71:
  *(_DWORD *)(v5 + 212) = self->_departureFrequency;
  *(void *)(v5 + 264) |= 4uLL;
  $5D35F1586042F4506E133FD2A7885CCE v33 = self->_flags;
  if ((*(_WORD *)&v33 & 0x800) != 0) {
    goto LABEL_72;
  }
LABEL_47:
  if ((*(unsigned char *)&v33 & 0x20) != 0)
  {
LABEL_48:
    *(_DWORD *)(v5 + 224) = self->_listTransitIncidentMessageIndex;
    *(void *)(v5 + 264) |= 0x20uLL;
  }
LABEL_49:
  id v34 = [(GEOAdvisoriesInfo *)self->_advisoriesInfo copyWithZone:a3];
  long long v35 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v34;

  id v36 = [(GEOTransitBaseFare *)self->_baseFare copyWithZone:a3];
  long long v37 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v36;

  id v38 = [(GEOTransitSurcharge *)self->_surcharge copyWithZone:a3];
  long long v39 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v38;

  uint64_t v40 = [(NSData *)self->_updateIdentifier copyWithZone:a3];
  long long v41 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v40;

  id v42 = [(GEOTransitVehiclePositionInfo *)self->_vehiclePositionInfo copyWithZone:a3];
  long long v43 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v42;

  id v44 = [(GEOTransitScheduleInfo *)self->_scheduleInfo copyWithZone:a3];
  long long v45 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v44;

  id v46 = [(GEOTransitBoardingInfo *)self->_boardingInfo copyWithZone:a3];
  long long v47 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v46;

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v48 = self->_badges;
  uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v64 objects:v81 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v65;
    do
    {
      for (uint64_t m = 0; m != v49; ++m)
      {
        if (*(void *)v65 != v50) {
          objc_enumerationMutation(v48);
        }
        long long v52 = (void *)[*(id *)(*((void *)&v64 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addBadge:v52];
      }
      uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v64 objects:v81 count:16];
    }
    while (v49);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v53 = self->_regionAlerts;
  uint64_t v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v60 objects:v80 count:16];
  if (v54)
  {
    uint64_t v55 = *(void *)v61;
    do
    {
      for (uint64_t n = 0; n != v54; ++n)
      {
        if (*(void *)v61 != v55) {
          objc_enumerationMutation(v53);
        }
        uint64_t v57 = objc_msgSend(*(id *)(*((void *)&v60 + 1) + 8 * n), "copyWithZone:", a3, (void)v60);
        [(id)v5 addRegionAlert:v57];
      }
      uint64_t v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v60 objects:v80 count:16];
    }
    while (v54);
  }

  uint64_t v58 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v58;
LABEL_64:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_114;
  }
  [(GEOTransitStep *)self readAll:1];
  [v4 readAll:1];
  $5D35F1586042F4506E133FD2A7885CCE flags = self->_flags;
  uint64_t v6 = *((void *)v4 + 33);
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_maneuverType != *((_DWORD *)v4 + 57)) {
      goto LABEL_114;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_startingStopIndex != *((_DWORD *)v4 + 60)) {
      goto LABEL_114;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_114;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_endingStopIndex != *((_DWORD *)v4 + 55)) {
      goto LABEL_114;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_114;
  }
  vehicleInfos = self->_vehicleInfos;
  if ((unint64_t)vehicleInfos | *((void *)v4 + 22)
    && !-[NSMutableArray isEqual:](vehicleInfos, "isEqual:"))
  {
    goto LABEL_114;
  }
  enterExitInfos = self->_enterExitInfos;
  if ((unint64_t)enterExitInfos | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](enterExitInfos, "isEqual:")) {
      goto LABEL_114;
    }
  }
  $5D35F1586042F4506E133FD2A7885CCE v9 = self->_flags;
  uint64_t v10 = *((void *)v4 + 33);
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0) {
      goto LABEL_114;
    }
    if (self->_prioritizeTilesPreloading)
    {
      if (!*((unsigned char *)v4 + 260)) {
        goto LABEL_114;
      }
    }
    else if (*((unsigned char *)v4 + 260))
    {
      goto LABEL_114;
    }
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_walkingIndex != *((_DWORD *)v4 + 63)) {
      goto LABEL_114;
    }
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_114;
  }
  transferInfos = self->_transferInfos;
  if ((unint64_t)transferInfos | *((void *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](transferInfos, "isEqual:")) {
      goto LABEL_114;
    }
    $5D35F1586042F4506E133FD2A7885CCE v9 = self->_flags;
    uint64_t v10 = *((void *)v4 + 33);
  }
  if ((*(_WORD *)&v9 & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0 || self->_startingTime != *((_DWORD *)v4 + 61)) {
      goto LABEL_114;
    }
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_114;
  }
  arrivalInfo = self->_arrivalInfo;
  if ((unint64_t)arrivalInfo | *((void *)v4 + 10)
    && !-[GEOTransitArrivalInfo isEqual:](arrivalInfo, "isEqual:"))
  {
    goto LABEL_114;
  }
  locatiouint64_t n = self->_location;
  if ((unint64_t)location | *((void *)v4 + 16))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:")) {
      goto LABEL_114;
    }
  }
  $5D35F1586042F4506E133FD2A7885CCE v14 = self->_flags;
  uint64_t v15 = *((void *)v4 + 33);
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_significanceForEndNode != *((_DWORD *)v4 + 59)) {
      goto LABEL_114;
    }
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_114;
  }
  instructions = self->_instructions;
  if ((unint64_t)instructions | *((void *)v4 + 15))
  {
    if (-[GEOInstructionSet isEqual:](instructions, "isEqual:"))
    {
      $5D35F1586042F4506E133FD2A7885CCE v14 = self->_flags;
      uint64_t v15 = *((void *)v4 + 33);
      goto LABEL_54;
    }
LABEL_114:
    char v28 = 0;
    goto LABEL_115;
  }
LABEL_54:
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
    if ((v15 & 0x2000) == 0 || self->_zilchIndex != *((_DWORD *)v4 + 64)) {
      goto LABEL_114;
    }
  }
  else if ((v15 & 0x2000) != 0)
  {
    goto LABEL_114;
  }
  if ((*(unsigned char *)&v14 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_distanceInMeters != *((_DWORD *)v4 + 54)) {
      goto LABEL_114;
    }
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_114;
  }
  if (!PBRepeatedUInt32IsEqual() || !PBRepeatedUInt32IsEqual()) {
    goto LABEL_114;
  }
  $5D35F1586042F4506E133FD2A7885CCE v17 = self->_flags;
  uint64_t v18 = *((void *)v4 + 33);
  if ((*(unsigned char *)&v17 & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0 || self->_routeDetailsSecondaryArtworkIndex != *((_DWORD *)v4 + 58)) {
      goto LABEL_114;
    }
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_114;
  }
  if (*(unsigned char *)&v17)
  {
    if ((v18 & 1) == 0 || self->_accessPointZilchIndex != *((_DWORD *)v4 + 51)) {
      goto LABEL_114;
    }
  }
  else if (v18)
  {
    goto LABEL_114;
  }
  if ((*(unsigned char *)&v17 & 2) != 0)
  {
    if ((v18 & 2) == 0 || self->_defaultVehicleInfoIndex != *((_DWORD *)v4 + 52)) {
      goto LABEL_114;
    }
  }
  else if ((v18 & 2) != 0)
  {
    goto LABEL_114;
  }
  if ((*(unsigned char *)&v17 & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_departureFrequency != *((_DWORD *)v4 + 53)) {
      goto LABEL_114;
    }
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_WORD *)&v17 & 0x800) != 0)
  {
    if ((v18 & 0x800) == 0 || self->_steppingTransitIncidentMessageIndex != *((_DWORD *)v4 + 62)) {
      goto LABEL_114;
    }
  }
  else if ((v18 & 0x800) != 0)
  {
    goto LABEL_114;
  }
  if ((*(unsigned char *)&v17 & 0x20) != 0)
  {
    if ((v18 & 0x20) == 0 || self->_listTransitIncidentMessageIndex != *((_DWORD *)v4 + 56)) {
      goto LABEL_114;
    }
  }
  else if ((v18 & 0x20) != 0)
  {
    goto LABEL_114;
  }
  advisoriesInfo = self->_advisoriesInfo;
  if ((unint64_t)advisoriesInfo | *((void *)v4 + 9)
    && !-[GEOAdvisoriesInfo isEqual:](advisoriesInfo, "isEqual:"))
  {
    goto LABEL_114;
  }
  baseFare = self->_baseFare;
  if ((unint64_t)baseFare | *((void *)v4 + 12))
  {
    if (!-[GEOTransitBaseFare isEqual:](baseFare, "isEqual:")) {
      goto LABEL_114;
    }
  }
  surcharge = self->_surcharge;
  if ((unint64_t)surcharge | *((void *)v4 + 19))
  {
    if (!-[GEOTransitSurcharge isEqual:](surcharge, "isEqual:")) {
      goto LABEL_114;
    }
  }
  updateIdentifier = self->_updateIdentifier;
  if ((unint64_t)updateIdentifier | *((void *)v4 + 21))
  {
    if (!-[NSData isEqual:](updateIdentifier, "isEqual:")) {
      goto LABEL_114;
    }
  }
  vehiclePositionInfo = self->_vehiclePositionInfo;
  if ((unint64_t)vehiclePositionInfo | *((void *)v4 + 23))
  {
    if (!-[GEOTransitVehiclePositionInfo isEqual:](vehiclePositionInfo, "isEqual:")) {
      goto LABEL_114;
    }
  }
  scheduleInfo = self->_scheduleInfo;
  if ((unint64_t)scheduleInfo | *((void *)v4 + 18))
  {
    if (!-[GEOTransitScheduleInfo isEqual:](scheduleInfo, "isEqual:")) {
      goto LABEL_114;
    }
  }
  boardingInfo = self->_boardingInfo;
  if ((unint64_t)boardingInfo | *((void *)v4 + 13))
  {
    if (!-[GEOTransitBoardingInfo isEqual:](boardingInfo, "isEqual:")) {
      goto LABEL_114;
    }
  }
  badges = self->_badges;
  if ((unint64_t)badges | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](badges, "isEqual:")) {
      goto LABEL_114;
    }
  }
  regionAlerts = self->_regionAlerts;
  if ((unint64_t)regionAlerts | *((void *)v4 + 17)) {
    char v28 = -[NSMutableArray isEqual:](regionAlerts, "isEqual:");
  }
  else {
    char v28 = 1;
  }
LABEL_115:

  return v28;
}

- (unint64_t)hash
{
  [(GEOTransitStep *)self readAll:1];
  $5D35F1586042F4506E133FD2A7885CCE flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
    uint64_t v39 = 0;
    if ((*(_WORD *)&flags & 0x200) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v38 = 0;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v39 = 2654435761 * self->_maneuverType;
  if ((*(_WORD *)&flags & 0x200) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v38 = 2654435761 * self->_startingStopIndex;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_4:
    uint64_t v37 = 2654435761 * self->_endingStopIndex;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v37 = 0;
LABEL_8:
  uint64_t v36 = [(NSMutableArray *)self->_vehicleInfos hash];
  uint64_t v35 = [(NSMutableArray *)self->_enterExitInfos hash];
  $5D35F1586042F4506E133FD2A7885CCE v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
    uint64_t v34 = 2654435761 * self->_prioritizeTilesPreloading;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v34 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
    {
LABEL_10:
      uint64_t v33 = 2654435761 * self->_walkingIndex;
      goto LABEL_13;
    }
  }
  uint64_t v33 = 0;
LABEL_13:
  uint64_t v32 = [(NSMutableArray *)self->_transferInfos hash];
  if ((*((unsigned char *)&self->_flags + 1) & 4) != 0) {
    uint64_t v31 = 2654435761 * self->_startingTime;
  }
  else {
    uint64_t v31 = 0;
  }
  unint64_t v30 = [(GEOTransitArrivalInfo *)self->_arrivalInfo hash];
  unint64_t v5 = [(GEOLatLng *)self->_location hash];
  if (*((unsigned char *)&self->_flags + 1)) {
    uint64_t v6 = 2654435761 * self->_significanceForEndNode;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(GEOInstructionSet *)self->_instructions hash];
  $5D35F1586042F4506E133FD2A7885CCE v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x2000) != 0)
  {
    uint64_t v9 = 2654435761 * self->_zilchIndex;
    if ((*(unsigned char *)&v8 & 8) != 0) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&v8 & 8) != 0)
    {
LABEL_21:
      uint64_t v10 = 2654435761 * self->_distanceInMeters;
      goto LABEL_24;
    }
  }
  uint64_t v10 = 0;
LABEL_24:
  uint64_t v11 = PBRepeatedUInt32Hash();
  uint64_t v12 = PBRepeatedUInt32Hash();
  $5D35F1586042F4506E133FD2A7885CCE v13 = self->_flags;
  if ((*(unsigned char *)&v13 & 0x80) != 0)
  {
    uint64_t v14 = 2654435761 * self->_routeDetailsSecondaryArtworkIndex;
    if (*(unsigned char *)&v13)
    {
LABEL_26:
      uint64_t v15 = 2654435761 * self->_accessPointZilchIndex;
      if ((*(unsigned char *)&v13 & 2) != 0) {
        goto LABEL_27;
      }
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if (*(unsigned char *)&v13) {
      goto LABEL_26;
    }
  }
  uint64_t v15 = 0;
  if ((*(unsigned char *)&v13 & 2) != 0)
  {
LABEL_27:
    uint64_t v16 = 2654435761 * self->_defaultVehicleInfoIndex;
    if ((*(unsigned char *)&v13 & 4) != 0) {
      goto LABEL_28;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&v13 & 4) != 0)
  {
LABEL_28:
    uint64_t v17 = 2654435761 * self->_departureFrequency;
    if ((*(_WORD *)&v13 & 0x800) != 0) {
      goto LABEL_29;
    }
LABEL_35:
    uint64_t v18 = 0;
    if ((*(unsigned char *)&v13 & 0x20) != 0) {
      goto LABEL_30;
    }
LABEL_36:
    uint64_t v19 = 0;
    goto LABEL_37;
  }
LABEL_34:
  uint64_t v17 = 0;
  if ((*(_WORD *)&v13 & 0x800) == 0) {
    goto LABEL_35;
  }
LABEL_29:
  uint64_t v18 = 2654435761 * self->_steppingTransitIncidentMessageIndex;
  if ((*(unsigned char *)&v13 & 0x20) == 0) {
    goto LABEL_36;
  }
LABEL_30:
  uint64_t v19 = 2654435761 * self->_listTransitIncidentMessageIndex;
LABEL_37:
  unint64_t v20 = v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  unint64_t v21 = [(GEOAdvisoriesInfo *)self->_advisoriesInfo hash];
  unint64_t v22 = v21 ^ [(GEOTransitBaseFare *)self->_baseFare hash];
  unint64_t v23 = v22 ^ [(GEOTransitSurcharge *)self->_surcharge hash];
  uint64_t v24 = v23 ^ [(NSData *)self->_updateIdentifier hash];
  unint64_t v25 = v24 ^ [(GEOTransitVehiclePositionInfo *)self->_vehiclePositionInfo hash];
  unint64_t v26 = v20 ^ v25 ^ [(GEOTransitScheduleInfo *)self->_scheduleInfo hash];
  unint64_t v27 = [(GEOTransitBoardingInfo *)self->_boardingInfo hash];
  uint64_t v28 = v27 ^ [(NSMutableArray *)self->_badges hash];
  return v26 ^ v28 ^ [(NSMutableArray *)self->_regionAlerts hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = *((void *)v4 + 33);
  if ((v5 & 0x40) != 0)
  {
    self->_maneuverType = *((_DWORD *)v4 + 57);
    *(void *)&self->_flags |= 0x40uLL;
    uint64_t v5 = *((void *)v4 + 33);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_startingStopIndex = *((_DWORD *)v4 + 60);
  *(void *)&self->_flags |= 0x200uLL;
  if ((*((void *)v4 + 33) & 0x10) != 0)
  {
LABEL_4:
    self->_endingStopIndex = *((_DWORD *)v4 + 55);
    *(void *)&self->_flags |= 0x10uLL;
  }
LABEL_5:
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v6 = *((id *)v4 + 22);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v74 objects:v82 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v75 != v9) {
          objc_enumerationMutation(v6);
        }
        [(GEOTransitStep *)self addVehicleInfo:*(void *)(*((void *)&v74 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v74 objects:v82 count:16];
    }
    while (v8);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v11 = *((id *)v4 + 14);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v70 objects:v81 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v71;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v71 != v14) {
          objc_enumerationMutation(v11);
        }
        [(GEOTransitStep *)self addEnterExitInfo:*(void *)(*((void *)&v70 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v70 objects:v81 count:16];
    }
    while (v13);
  }

  uint64_t v16 = *((void *)v4 + 33);
  if ((v16 & 0x4000) != 0)
  {
    self->_prioritizeTilesPreloading = *((unsigned char *)v4 + 260);
    *(void *)&self->_flags |= 0x4000uLL;
    uint64_t v16 = *((void *)v4 + 33);
  }
  if ((v16 & 0x1000) != 0)
  {
    self->_walkingIndex = *((_DWORD *)v4 + 63);
    *(void *)&self->_flags |= 0x1000uLL;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v17 = *((id *)v4 + 20);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v66 objects:v80 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v67 != v20) {
          objc_enumerationMutation(v17);
        }
        [(GEOTransitStep *)self addTransferInfo:*(void *)(*((void *)&v66 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v66 objects:v80 count:16];
    }
    while (v19);
  }

  if ((*((unsigned char *)v4 + 265) & 4) != 0)
  {
    self->_startingTime = *((_DWORD *)v4 + 61);
    *(void *)&self->_flags |= 0x400uLL;
  }
  arrivalInfo = self->_arrivalInfo;
  uint64_t v23 = *((void *)v4 + 10);
  if (arrivalInfo)
  {
    if (v23) {
      -[GEOTransitArrivalInfo mergeFrom:](arrivalInfo, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[GEOTransitStep setArrivalInfo:](self, "setArrivalInfo:");
  }
  locatiouint64_t n = self->_location;
  uint64_t v25 = *((void *)v4 + 16);
  if (location)
  {
    if (v25) {
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[GEOTransitStep setLocation:](self, "setLocation:");
  }
  if (*((unsigned char *)v4 + 265))
  {
    self->_significanceForEndNode = *((_DWORD *)v4 + 59);
    *(void *)&self->_flags |= 0x100uLL;
  }
  instructions = self->_instructions;
  uint64_t v27 = *((void *)v4 + 15);
  if (instructions)
  {
    if (v27) {
      -[GEOInstructionSet mergeFrom:](instructions, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[GEOTransitStep setInstructions:](self, "setInstructions:");
  }
  uint64_t v28 = *((void *)v4 + 33);
  if ((v28 & 0x2000) != 0)
  {
    self->_zilchIndex = *((_DWORD *)v4 + 64);
    *(void *)&self->_flags |= 0x2000uLL;
    uint64_t v28 = *((void *)v4 + 33);
  }
  if ((v28 & 8) != 0)
  {
    self->_distanceInMeters = *((_DWORD *)v4 + 54);
    *(void *)&self->_flags |= 8uLL;
  }
  uint64_t v29 = [v4 routeDetailsPrimaryArtworkIndexsCount];
  if (v29)
  {
    uint64_t v30 = v29;
    for (uint64_t m = 0; m != v30; ++m)
      -[GEOTransitStep addRouteDetailsPrimaryArtworkIndex:](self, "addRouteDetailsPrimaryArtworkIndex:", [v4 routeDetailsPrimaryArtworkIndexAtIndex:m]);
  }
  uint64_t v32 = [v4 steppingArtworkIndexsCount];
  if (v32)
  {
    uint64_t v33 = v32;
    for (uint64_t n = 0; n != v33; ++n)
      -[GEOTransitStep addSteppingArtworkIndex:](self, "addSteppingArtworkIndex:", [v4 steppingArtworkIndexAtIndex:n]);
  }
  uint64_t v35 = *((void *)v4 + 33);
  if ((v35 & 0x80) != 0)
  {
    self->_routeDetailsSecondaryArtworkIndex = *((_DWORD *)v4 + 58);
    *(void *)&self->_flags |= 0x80uLL;
    uint64_t v35 = *((void *)v4 + 33);
    if ((v35 & 1) == 0)
    {
LABEL_64:
      if ((v35 & 2) == 0) {
        goto LABEL_65;
      }
      goto LABEL_74;
    }
  }
  else if ((v35 & 1) == 0)
  {
    goto LABEL_64;
  }
  self->_accessPointZilchIndex = *((_DWORD *)v4 + 51);
  *(void *)&self->_flags |= 1uLL;
  uint64_t v35 = *((void *)v4 + 33);
  if ((v35 & 2) == 0)
  {
LABEL_65:
    if ((v35 & 4) == 0) {
      goto LABEL_66;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_defaultVehicleInfoIndex = *((_DWORD *)v4 + 52);
  *(void *)&self->_flags |= 2uLL;
  uint64_t v35 = *((void *)v4 + 33);
  if ((v35 & 4) == 0)
  {
LABEL_66:
    if ((v35 & 0x800) == 0) {
      goto LABEL_67;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_departureFrequency = *((_DWORD *)v4 + 53);
  *(void *)&self->_flags |= 4uLL;
  uint64_t v35 = *((void *)v4 + 33);
  if ((v35 & 0x800) == 0)
  {
LABEL_67:
    if ((v35 & 0x20) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
LABEL_76:
  self->_steppingTransitIncidentMessageIndex = *((_DWORD *)v4 + 62);
  *(void *)&self->_flags |= 0x800uLL;
  if ((*((void *)v4 + 33) & 0x20) != 0)
  {
LABEL_68:
    self->_listTransitIncidentMessageIndex = *((_DWORD *)v4 + 56);
    *(void *)&self->_flags |= 0x20uLL;
  }
LABEL_69:
  advisoriesInfo = self->_advisoriesInfo;
  uint64_t v37 = *((void *)v4 + 9);
  if (advisoriesInfo)
  {
    if (v37) {
      -[GEOAdvisoriesInfo mergeFrom:](advisoriesInfo, "mergeFrom:");
    }
  }
  else if (v37)
  {
    -[GEOTransitStep setAdvisoriesInfo:](self, "setAdvisoriesInfo:");
  }
  baseFare = self->_baseFare;
  uint64_t v39 = *((void *)v4 + 12);
  if (baseFare)
  {
    if (v39) {
      -[GEOTransitBaseFare mergeFrom:](baseFare, "mergeFrom:");
    }
  }
  else if (v39)
  {
    -[GEOTransitStep setBaseFare:](self, "setBaseFare:");
  }
  surcharge = self->_surcharge;
  uint64_t v41 = *((void *)v4 + 19);
  if (surcharge)
  {
    if (v41) {
      -[GEOTransitSurcharge mergeFrom:](surcharge, "mergeFrom:");
    }
  }
  else if (v41)
  {
    -[GEOTransitStep setSurcharge:](self, "setSurcharge:");
  }
  if (*((void *)v4 + 21)) {
    -[GEOTransitStep setUpdateIdentifier:](self, "setUpdateIdentifier:");
  }
  vehiclePositionInfo = self->_vehiclePositionInfo;
  uint64_t v43 = *((void *)v4 + 23);
  if (vehiclePositionInfo)
  {
    if (v43) {
      -[GEOTransitVehiclePositionInfo mergeFrom:](vehiclePositionInfo, "mergeFrom:");
    }
  }
  else if (v43)
  {
    -[GEOTransitStep setVehiclePositionInfo:](self, "setVehiclePositionInfo:");
  }
  scheduleInfo = self->_scheduleInfo;
  uint64_t v45 = *((void *)v4 + 18);
  if (scheduleInfo)
  {
    if (v45) {
      -[GEOTransitScheduleInfo mergeFrom:](scheduleInfo, "mergeFrom:");
    }
  }
  else if (v45)
  {
    -[GEOTransitStep setScheduleInfo:](self, "setScheduleInfo:");
  }
  boardingInfo = self->_boardingInfo;
  uint64_t v47 = *((void *)v4 + 13);
  if (boardingInfo)
  {
    if (v47) {
      -[GEOTransitBoardingInfo mergeFrom:](boardingInfo, "mergeFrom:");
    }
  }
  else if (v47)
  {
    -[GEOTransitStep setBoardingInfo:](self, "setBoardingInfo:");
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v48 = *((id *)v4 + 11);
  uint64_t v49 = [v48 countByEnumeratingWithState:&v62 objects:v79 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v63;
    do
    {
      for (iuint64_t i = 0; ii != v50; ++ii)
      {
        if (*(void *)v63 != v51) {
          objc_enumerationMutation(v48);
        }
        [(GEOTransitStep *)self addBadge:*(void *)(*((void *)&v62 + 1) + 8 * ii)];
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v62 objects:v79 count:16];
    }
    while (v50);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v53 = *((id *)v4 + 17);
  uint64_t v54 = [v53 countByEnumeratingWithState:&v58 objects:v78 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v59;
    do
    {
      for (juint64_t j = 0; jj != v55; ++jj)
      {
        if (*(void *)v59 != v56) {
          objc_enumerationMutation(v53);
        }
        -[GEOTransitStep addRegionAlert:](self, "addRegionAlert:", *(void *)(*((void *)&v58 + 1) + 8 * jj), (void)v58);
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v58 objects:v78 count:16];
    }
    while (v55);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTransitStepReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1648);
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
  *(void *)&self->_flags |= 0x200008000uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitStep *)self readAll:0];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v7 = self->_vehicleInfos;
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
    uint64_t v12 = self->_enterExitInfos;
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
    id v17 = self->_transferInfos;
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

    [(GEOTransitArrivalInfo *)self->_arrivalInfo clearUnknownFields:1];
    [(GEOLatLng *)self->_location clearUnknownFields:1];
    [(GEOInstructionSet *)self->_instructions clearUnknownFields:1];
    [(GEOAdvisoriesInfo *)self->_advisoriesInfo clearUnknownFields:1];
    [(GEOTransitBaseFare *)self->_baseFare clearUnknownFields:1];
    [(GEOTransitSurcharge *)self->_surcharge clearUnknownFields:1];
    [(GEOTransitVehiclePositionInfo *)self->_vehiclePositionInfo clearUnknownFields:1];
    [(GEOTransitScheduleInfo *)self->_scheduleInfo clearUnknownFields:1];
    [(GEOTransitBoardingInfo *)self->_boardingInfo clearUnknownFields:1];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    unint64_t v22 = self->_badges;
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
    uint64_t v27 = self->_regionAlerts;
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
  objc_storeStrong((id *)&self->_vehiclePositionInfo, 0);
  objc_storeStrong((id *)&self->_vehicleInfos, 0);
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
  objc_storeStrong((id *)&self->_transferInfos, 0);
  objc_storeStrong((id *)&self->_surcharge, 0);
  objc_storeStrong((id *)&self->_scheduleInfo, 0);
  objc_storeStrong((id *)&self->_regionAlerts, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_enterExitInfos, 0);
  objc_storeStrong((id *)&self->_boardingInfo, 0);
  objc_storeStrong((id *)&self->_baseFare, 0);
  objc_storeStrong((id *)&self->_badges, 0);
  objc_storeStrong((id *)&self->_arrivalInfo, 0);
  objc_storeStrong((id *)&self->_advisoriesInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)updateTransitStep:(id)a3
{
  id v44 = a3;
  id v4 = [(GEOTransitStep *)self instructions];
  uint64_t v5 = [v44 instructions];
  id v6 = v4;
  id v7 = v5;
  if (!v7)
  {
    id v11 = v6;
    goto LABEL_19;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v8 = (id)_MergedGlobals_223;
  id v9 = v7;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v9 conformsToProtocol:_MergedGlobals_223])
  {
    char v10 = objc_msgSend(v9, "_transit_hasAnyFieldSet");

    if (v10)
    {
LABEL_14:
      if ([v9 conformsToProtocol:v8]
        && [v6 conformsToProtocol:v8])
      {
        objc_msgSend(v6, "_transit_mergeFrom:", v9);
        id v9 = v6;
      }
      id v11 = v9;
      goto LABEL_18;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_14;
    }
    uint64_t v12 = [v9 dictionaryRepresentation];
    uint64_t v13 = [v12 count];

    if (v13) {
      goto LABEL_14;
    }
  }
  id v11 = 0;
LABEL_18:

LABEL_19:
  [(GEOTransitStep *)self setInstructions:v11];

  uint64_t v14 = [(GEOTransitStep *)self vehiclePositionInfo];
  uint64_t v15 = [v44 vehiclePositionInfo];
  id v16 = v14;
  id v17 = v15;
  if (!v17)
  {
    id v21 = v16;
    goto LABEL_37;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v18 = (id)_MergedGlobals_223;
  id v19 = v17;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v19 conformsToProtocol:_MergedGlobals_223])
  {
    char v20 = objc_msgSend(v19, "_transit_hasAnyFieldSet");

    if (v20)
    {
LABEL_32:
      if ([v19 conformsToProtocol:v18]
        && [v16 conformsToProtocol:v18])
      {
        objc_msgSend(v16, "_transit_mergeFrom:", v19);
        id v19 = v16;
      }
      id v21 = v19;
      goto LABEL_36;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_32;
    }
    unint64_t v22 = [v19 dictionaryRepresentation];
    uint64_t v23 = [v22 count];

    if (v23) {
      goto LABEL_32;
    }
  }
  id v21 = 0;
LABEL_36:

LABEL_37:
  [(GEOTransitStep *)self setVehiclePositionInfo:v21];

  uint64_t v24 = [(GEOTransitStep *)self scheduleInfo];
  uint64_t v25 = [v44 scheduleInfo];
  id v26 = v24;
  id v27 = v25;
  if (!v27)
  {
    id v31 = v26;
    goto LABEL_55;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v28 = (id)_MergedGlobals_223;
  id v29 = v27;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v29 conformsToProtocol:_MergedGlobals_223])
  {
    char v30 = objc_msgSend(v29, "_transit_hasAnyFieldSet");

    if (v30)
    {
LABEL_50:
      if ([v29 conformsToProtocol:v28]
        && [v26 conformsToProtocol:v28])
      {
        objc_msgSend(v26, "_transit_mergeFrom:", v29);
        id v29 = v26;
      }
      id v31 = v29;
      goto LABEL_54;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_50;
    }
    long long v32 = [v29 dictionaryRepresentation];
    uint64_t v33 = [v32 count];

    if (v33) {
      goto LABEL_50;
    }
  }
  id v31 = 0;
LABEL_54:

LABEL_55:
  [(GEOTransitStep *)self setScheduleInfo:v31];

  long long v34 = [(GEOTransitStep *)self boardingInfo];
  long long v35 = [v44 boardingInfo];
  id v36 = v34;
  id v37 = v35;
  if (!v37)
  {
    id v41 = v36;
    goto LABEL_73;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v38 = (id)_MergedGlobals_223;
  id v39 = v37;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v39 conformsToProtocol:_MergedGlobals_223])
  {
    char v40 = objc_msgSend(v39, "_transit_hasAnyFieldSet");

    if (v40)
    {
LABEL_68:
      if ([v39 conformsToProtocol:v38]
        && [v36 conformsToProtocol:v38])
      {
        objc_msgSend(v36, "_transit_mergeFrom:", v39);
        id v39 = v36;
      }
      id v41 = v39;
      goto LABEL_72;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_68;
    }
    long long v42 = [v39 dictionaryRepresentation];
    uint64_t v43 = [v42 count];

    if (v43) {
      goto LABEL_68;
    }
  }
  id v41 = 0;
LABEL_72:

LABEL_73:
  [(GEOTransitStep *)self setBoardingInfo:v41];
}

- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a3 - 3;
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v7)
    {
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138412802;
      id v17 = v12;
      __int16 v18 = 2048;
      id v19 = self;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is not compatible with protocol version %lu", buf, 0x20u);
    }
    char v10 = (GEOTransitStep *)[(GEOTransitStep *)self copy];
    uint64_t v15 = v10;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    migrateTransitSteps(v13, a3);
  }
  else
  {
    if (v7)
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138412802;
      id v17 = v9;
      __int16 v18 = 2048;
      id v19 = self;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", buf, 0x20u);
    }
    char v10 = self;
  }

  return v10;
}

- (int64_t)segmentTypeForManeuver
{
  int v2 = [(GEOTransitStep *)self maneuverType] - 2;
  if (v2 > 8) {
    return 0;
  }
  else {
    return qword_18A63E888[v2];
  }
}

@end