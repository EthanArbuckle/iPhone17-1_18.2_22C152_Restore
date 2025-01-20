@interface GEOLogMsgEventVLFUsage
+ (BOOL)isValid:(id)a3;
+ (Class)arStateType;
+ (Class)deviceOrientationType;
+ (Class)localizationDetailsType;
- (BOOL)hasArFailureTypes;
- (BOOL)hasCrowdsourcingDetails;
- (BOOL)hasEntryPoint;
- (BOOL)hasFinalState;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasInitialLocation;
- (BOOL)hasInitialPositionContextClassification;
- (BOOL)hasInitializationFailureDetails;
- (BOOL)hasPostFusionCorrection;
- (BOOL)hasSessionTimeMs;
- (BOOL)hasTimeRoundedToHour;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventVLFUsage)init;
- (GEOLogMsgEventVLFUsage)initWithData:(id)a3;
- (GEOLogMsgEventVLFUsage)initWithDictionary:(id)a3;
- (GEOLogMsgEventVLFUsage)initWithJSON:(id)a3;
- (GEOVLFARFailureTypes)arFailureTypes;
- (GEOVLFCorrection)postFusionCorrection;
- (GEOVLFCrowdsourcingDetails)crowdsourcingDetails;
- (GEOVLFEntryPoint)entryPoint;
- (GEOVLFInitializationFailureDetails)initializationFailureDetails;
- (GEOVLFLocation)initialLocation;
- (GEOVLFPositionContextClassification)initialPositionContextClassification;
- (NSMutableArray)arStates;
- (NSMutableArray)deviceOrientations;
- (NSMutableArray)localizationDetails;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)arStateAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceOrientationAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)finalStateAsString:(int)a3;
- (id)jsonRepresentation;
- (id)localizationDetailsAtIndex:(unint64_t)a3;
- (int)StringAsFinalState:(id)a3;
- (int)finalState;
- (unint64_t)arStatesCount;
- (unint64_t)deviceOrientationsCount;
- (unint64_t)hash;
- (unint64_t)localizationDetailsCount;
- (unsigned)sessionTimeMs;
- (unsigned)timeRoundedToHour;
- (void)_addNoFlagsArState:(uint64_t)a1;
- (void)_addNoFlagsDeviceOrientation:(uint64_t)a1;
- (void)_addNoFlagsLocalizationDetails:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArFailureTypes;
- (void)_readArStates;
- (void)_readCrowdsourcingDetails;
- (void)_readDeviceOrientations;
- (void)_readEntryPoint;
- (void)_readInitialLocation;
- (void)_readInitializationFailureDetails;
- (void)_readLocalizationDetails;
- (void)_readPostFusionCorrection;
- (void)addArState:(id)a3;
- (void)addDeviceOrientation:(id)a3;
- (void)addLocalizationDetails:(id)a3;
- (void)clearArStates;
- (void)clearDeviceOrientations;
- (void)clearLocalizationDetails;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArFailureTypes:(id)a3;
- (void)setArStates:(id)a3;
- (void)setCrowdsourcingDetails:(id)a3;
- (void)setDeviceOrientations:(id)a3;
- (void)setEntryPoint:(id)a3;
- (void)setFinalState:(int)a3;
- (void)setHasFinalState:(BOOL)a3;
- (void)setHasInitialPositionContextClassification:(BOOL)a3;
- (void)setHasSessionTimeMs:(BOOL)a3;
- (void)setHasTimeRoundedToHour:(BOOL)a3;
- (void)setInitialLocation:(id)a3;
- (void)setInitialPositionContextClassification:(GEOVLFPositionContextClassification *)a3;
- (void)setInitializationFailureDetails:(id)a3;
- (void)setLocalizationDetails:(id)a3;
- (void)setPostFusionCorrection:(id)a3;
- (void)setSessionTimeMs:(unsigned int)a3;
- (void)setTimeRoundedToHour:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventVLFUsage

- (int)StringAsFinalState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VLFFinalState_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VLFFinalState_FAILED_TO_INITIALIZE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VLFFinalState_USER_ABANDONED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VLFFinalState_FAILED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VLFFinalState_SUCCEEDED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (GEOLogMsgEventVLFUsage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventVLFUsage;
  v2 = [(GEOLogMsgEventVLFUsage *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    int v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventVLFUsage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventVLFUsage;
  id v3 = [(GEOLogMsgEventVLFUsage *)&v7 initWithData:a3];
  int v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEntryPoint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntryPoint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasEntryPoint
{
  return self->_entryPoint != 0;
}

- (GEOVLFEntryPoint)entryPoint
{
  -[GEOLogMsgEventVLFUsage _readEntryPoint]((uint64_t)self);
  entryPoint = self->_entryPoint;

  return entryPoint;
}

- (void)setEntryPoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2100u;
  objc_storeStrong((id *)&self->_entryPoint, a3);
}

- (unsigned)sessionTimeMs
{
  return self->_sessionTimeMs;
}

- (void)setSessionTimeMs:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_sessionTimeMs = a3;
}

- (void)setHasSessionTimeMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8196;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasSessionTimeMs
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readLocalizationDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizationDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)localizationDetails
{
  -[GEOLogMsgEventVLFUsage _readLocalizationDetails]((uint64_t)self);
  localizationDetails = self->_localizationDetails;

  return localizationDetails;
}

- (void)setLocalizationDetails:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  localizationDetails = self->_localizationDetails;
  self->_localizationDetails = v4;
}

- (void)clearLocalizationDetails
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  localizationDetails = self->_localizationDetails;

  [(NSMutableArray *)localizationDetails removeAllObjects];
}

- (void)addLocalizationDetails:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventVLFUsage _readLocalizationDetails]((uint64_t)self);
  -[GEOLogMsgEventVLFUsage _addNoFlagsLocalizationDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsLocalizationDetails:(uint64_t)a1
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

- (unint64_t)localizationDetailsCount
{
  -[GEOLogMsgEventVLFUsage _readLocalizationDetails]((uint64_t)self);
  localizationDetails = self->_localizationDetails;

  return [(NSMutableArray *)localizationDetails count];
}

- (id)localizationDetailsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventVLFUsage _readLocalizationDetails]((uint64_t)self);
  localizationDetails = self->_localizationDetails;

  return (id)[(NSMutableArray *)localizationDetails objectAtIndex:a3];
}

+ (Class)localizationDetailsType
{
  return (Class)objc_opt_class();
}

- (int)finalState
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_finalState;
  }
  else {
    return 0;
  }
}

- (void)setFinalState:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_finalState = a3;
}

- (void)setHasFinalState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8194;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasFinalState
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)finalStateAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53F8E00[a3];
  }

  return v3;
}

- (void)_readPostFusionCorrection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPostFusionCorrection_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasPostFusionCorrection
{
  return self->_postFusionCorrection != 0;
}

- (GEOVLFCorrection)postFusionCorrection
{
  -[GEOLogMsgEventVLFUsage _readPostFusionCorrection]((uint64_t)self);
  postFusionCorrection = self->_postFusionCorrection;

  return postFusionCorrection;
}

- (void)setPostFusionCorrection:(id)a3
{
  *(_WORD *)&self->_flags |= 0x3000u;
  objc_storeStrong((id *)&self->_postFusionCorrection, a3);
}

- (unsigned)timeRoundedToHour
{
  return self->_timeRoundedToHour;
}

- (void)setTimeRoundedToHour:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_timeRoundedToHour = a3;
}

- (void)setHasTimeRoundedToHour:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8200;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasTimeRoundedToHour
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (GEOVLFPositionContextClassification)initialPositionContextClassification
{
  *retstr = *(GEOVLFPositionContextClassification *)&self->_type;
  return self;
}

- (void)setInitialPositionContextClassification:(GEOVLFPositionContextClassification *)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  uint64_t v3 = *(void *)&a3->_type;
  *(_OWORD *)&self->_initialPositionContextClassification._indoorProbability = *(_OWORD *)&a3->_indoorProbability;
  *(void *)&self->_initialPositionContextClassification._type = v3;
}

- (void)setHasInitialPositionContextClassification:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasInitialPositionContextClassification
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readInitializationFailureDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInitializationFailureDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasInitializationFailureDetails
{
  return self->_initializationFailureDetails != 0;
}

- (GEOVLFInitializationFailureDetails)initializationFailureDetails
{
  -[GEOLogMsgEventVLFUsage _readInitializationFailureDetails]((uint64_t)self);
  initializationFailureDetails = self->_initializationFailureDetails;

  return initializationFailureDetails;
}

- (void)setInitializationFailureDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_initializationFailureDetails, a3);
}

- (void)_readArStates
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArStates_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)arStates
{
  -[GEOLogMsgEventVLFUsage _readArStates]((uint64_t)self);
  arStates = self->_arStates;

  return arStates;
}

- (void)setArStates:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  arStates = self->_arStates;
  self->_arStates = v4;
}

- (void)clearArStates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  arStates = self->_arStates;

  [(NSMutableArray *)arStates removeAllObjects];
}

- (void)addArState:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventVLFUsage _readArStates]((uint64_t)self);
  -[GEOLogMsgEventVLFUsage _addNoFlagsArState:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsArState:(uint64_t)a1
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

- (unint64_t)arStatesCount
{
  -[GEOLogMsgEventVLFUsage _readArStates]((uint64_t)self);
  arStates = self->_arStates;

  return [(NSMutableArray *)arStates count];
}

- (id)arStateAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventVLFUsage _readArStates]((uint64_t)self);
  arStates = self->_arStates;

  return (id)[(NSMutableArray *)arStates objectAtIndex:a3];
}

+ (Class)arStateType
{
  return (Class)objc_opt_class();
}

- (void)_readDeviceOrientations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceOrientations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)deviceOrientations
{
  -[GEOLogMsgEventVLFUsage _readDeviceOrientations]((uint64_t)self);
  deviceOrientations = self->_deviceOrientations;

  return deviceOrientations;
}

- (void)setDeviceOrientations:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  deviceOrientations = self->_deviceOrientations;
  self->_deviceOrientations = v4;
}

- (void)clearDeviceOrientations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  deviceOrientations = self->_deviceOrientations;

  [(NSMutableArray *)deviceOrientations removeAllObjects];
}

- (void)addDeviceOrientation:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventVLFUsage _readDeviceOrientations]((uint64_t)self);
  -[GEOLogMsgEventVLFUsage _addNoFlagsDeviceOrientation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsDeviceOrientation:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)deviceOrientationsCount
{
  -[GEOLogMsgEventVLFUsage _readDeviceOrientations]((uint64_t)self);
  deviceOrientations = self->_deviceOrientations;

  return [(NSMutableArray *)deviceOrientations count];
}

- (id)deviceOrientationAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventVLFUsage _readDeviceOrientations]((uint64_t)self);
  deviceOrientations = self->_deviceOrientations;

  return (id)[(NSMutableArray *)deviceOrientations objectAtIndex:a3];
}

+ (Class)deviceOrientationType
{
  return (Class)objc_opt_class();
}

- (void)_readCrowdsourcingDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCrowdsourcingDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasCrowdsourcingDetails
{
  return self->_crowdsourcingDetails != 0;
}

- (GEOVLFCrowdsourcingDetails)crowdsourcingDetails
{
  -[GEOLogMsgEventVLFUsage _readCrowdsourcingDetails]((uint64_t)self);
  crowdsourcingDetails = self->_crowdsourcingDetails;

  return crowdsourcingDetails;
}

- (void)setCrowdsourcingDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  objc_storeStrong((id *)&self->_crowdsourcingDetails, a3);
}

- (void)_readInitialLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInitialLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasInitialLocation
{
  return self->_initialLocation != 0;
}

- (GEOVLFLocation)initialLocation
{
  -[GEOLogMsgEventVLFUsage _readInitialLocation]((uint64_t)self);
  initialLocation = self->_initialLocation;

  return initialLocation;
}

- (void)setInitialLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2200u;
  objc_storeStrong((id *)&self->_initialLocation, a3);
}

- (void)_readArFailureTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArFailureTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasArFailureTypes
{
  return self->_arFailureTypes != 0;
}

- (GEOVLFARFailureTypes)arFailureTypes
{
  -[GEOLogMsgEventVLFUsage _readArFailureTypes]((uint64_t)self);
  arFailureTypes = self->_arFailureTypes;

  return arFailureTypes;
}

- (void)setArFailureTypes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  objc_storeStrong((id *)&self->_arFailureTypes, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventVLFUsage;
  id v4 = [(GEOLogMsgEventVLFUsage *)&v8 description];
  id v5 = [(GEOLogMsgEventVLFUsage *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventVLFUsage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 entryPoint];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"entryPoint";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"entry_point";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if ((*(_WORD *)(a1 + 136) & 4) != 0)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 128)];
      if (a2) {
        v10 = @"sessionTimeMs";
      }
      else {
        v10 = @"session_time_ms";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if ([*(id *)(a1 + 96) count])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v12 = *(id *)(a1 + 96);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v74 objects:v80 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v75;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v75 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v74 + 1) + 8 * i);
            if (a2) {
              [v17 jsonRepresentation];
            }
            else {
            v18 = [v17 dictionaryRepresentation];
            }
            [v11 addObject:v18];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v74 objects:v80 count:16];
        }
        while (v14);
      }

      if (a2) {
        v19 = @"localizationDetails";
      }
      else {
        v19 = @"localization_details";
      }
      [v4 setObject:v11 forKey:v19];
    }
    if ((*(_WORD *)(a1 + 136) & 2) != 0)
    {
      uint64_t v20 = *(int *)(a1 + 124);
      if (v20 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 124));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = off_1E53F8E00[v20];
      }
      if (a2) {
        v22 = @"finalState";
      }
      else {
        v22 = @"final_state";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = [(id)a1 postFusionCorrection];
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"postFusionCorrection";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"post_fusion_correction";
      }
      [v4 setObject:v25 forKey:v26];
    }
    __int16 v27 = *(_WORD *)(a1 + 136);
    if ((v27 & 8) != 0)
    {
      v28 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 132)];
      if (a2) {
        v29 = @"timeRoundedToHour";
      }
      else {
        v29 = @"time_rounded_to_hour";
      }
      [v4 setObject:v28 forKey:v29];

      __int16 v27 = *(_WORD *)(a1 + 136);
    }
    if (v27)
    {
      v30 = _GEOVLFPositionContextClassificationDictionaryRepresentation(a1 + 16);
      [v4 setObject:v30 forKey:@"initialPositionContextClassification"];
    }
    v31 = [(id)a1 initializationFailureDetails];
    v32 = v31;
    if (v31)
    {
      if (a2)
      {
        v33 = [v31 jsonRepresentation];
        v34 = @"initializationFailureDetails";
      }
      else
      {
        v33 = [v31 dictionaryRepresentation];
        v34 = @"initialization_failure_details";
      }
      [v4 setObject:v33 forKey:v34];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v36 = *(id *)(a1 + 48);
      uint64_t v37 = [v36 countByEnumeratingWithState:&v70 objects:v79 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v71;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v71 != v39) {
              objc_enumerationMutation(v36);
            }
            v41 = *(void **)(*((void *)&v70 + 1) + 8 * j);
            if (a2) {
              [v41 jsonRepresentation];
            }
            else {
            v42 = [v41 dictionaryRepresentation];
            }
            [v35 addObject:v42];
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v70 objects:v79 count:16];
        }
        while (v38);
      }

      if (a2) {
        v43 = @"arState";
      }
      else {
        v43 = @"ar_state";
      }
      [v4 setObject:v35 forKey:v43];
    }
    if ([*(id *)(a1 + 64) count])
    {
      v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v45 = *(id *)(a1 + 64);
      uint64_t v46 = [v45 countByEnumeratingWithState:&v66 objects:v78 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v67;
        do
        {
          for (uint64_t k = 0; k != v47; ++k)
          {
            if (*(void *)v67 != v48) {
              objc_enumerationMutation(v45);
            }
            v50 = *(void **)(*((void *)&v66 + 1) + 8 * k);
            if (a2) {
              [v50 jsonRepresentation];
            }
            else {
            v51 = [v50 dictionaryRepresentation];
            }
            [v44 addObject:v51];
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v66 objects:v78 count:16];
        }
        while (v47);
      }

      if (a2) {
        v52 = @"deviceOrientation";
      }
      else {
        v52 = @"device_orientation";
      }
      [v4 setObject:v44 forKey:v52];
    }
    v53 = [(id)a1 crowdsourcingDetails];
    v54 = v53;
    if (v53)
    {
      if (a2)
      {
        v55 = [v53 jsonRepresentation];
        v56 = @"crowdsourcingDetails";
      }
      else
      {
        v55 = [v53 dictionaryRepresentation];
        v56 = @"crowdsourcing_details";
      }
      [v4 setObject:v55 forKey:v56];
    }
    v57 = [(id)a1 initialLocation];
    v58 = v57;
    if (v57)
    {
      if (a2)
      {
        v59 = [v57 jsonRepresentation];
        v60 = @"initialLocation";
      }
      else
      {
        v59 = [v57 dictionaryRepresentation];
        v60 = @"initial_location";
      }
      [v4 setObject:v59 forKey:v60];
    }
    v61 = [(id)a1 arFailureTypes];
    v62 = v61;
    if (v61)
    {
      if (a2)
      {
        v63 = [v61 jsonRepresentation];
        v64 = @"arFailureTypes";
      }
      else
      {
        v63 = [v61 dictionaryRepresentation];
        v64 = @"ar_failure_types";
      }
      [v4 setObject:v63 forKey:v64];
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
  return -[GEOLogMsgEventVLFUsage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventVLFUsage)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventVLFUsage *)-[GEOLogMsgEventVLFUsage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_134;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_134;
  }
  if (a3) {
    objc_super v6 = @"entryPoint";
  }
  else {
    objc_super v6 = @"entry_point";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEOVLFEntryPoint alloc];
    if (a3) {
      uint64_t v9 = [(GEOVLFEntryPoint *)v8 initWithJSON:v7];
    }
    else {
      uint64_t v9 = [(GEOVLFEntryPoint *)v8 initWithDictionary:v7];
    }
    v10 = (void *)v9;
    [a1 setEntryPoint:v9];
  }
  if (a3) {
    v11 = @"sessionTimeMs";
  }
  else {
    v11 = @"session_time_ms";
  }
  id v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSessionTimeMs:", objc_msgSend(v12, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v13 = @"localizationDetails";
  }
  else {
    uint64_t v13 = @"localization_details";
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  id v79 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v92 objects:v98 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v93;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v93 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v92 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v21 = [GEOVLFLocalizationDetails alloc];
            if (a3) {
              uint64_t v22 = [(GEOVLFLocalizationDetails *)v21 initWithJSON:v20];
            }
            else {
              uint64_t v22 = [(GEOVLFLocalizationDetails *)v21 initWithDictionary:v20];
            }
            v23 = (void *)v22;
            [a1 addLocalizationDetails:v22];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v92 objects:v98 count:16];
      }
      while (v17);
    }

    id v5 = v79;
  }

  if (a3) {
    v24 = @"finalState";
  }
  else {
    v24 = @"final_state";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v25;
    if ([v26 isEqualToString:@"VLFFinalState_UNKNOWN"])
    {
      uint64_t v27 = 0;
    }
    else if ([v26 isEqualToString:@"VLFFinalState_FAILED_TO_INITIALIZE"])
    {
      uint64_t v27 = 1;
    }
    else if ([v26 isEqualToString:@"VLFFinalState_USER_ABANDONED"])
    {
      uint64_t v27 = 2;
    }
    else if ([v26 isEqualToString:@"VLFFinalState_FAILED"])
    {
      uint64_t v27 = 3;
    }
    else if ([v26 isEqualToString:@"VLFFinalState_SUCCEEDED"])
    {
      uint64_t v27 = 4;
    }
    else
    {
      uint64_t v27 = 0;
    }

    goto LABEL_51;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v27 = [v25 intValue];
LABEL_51:
    [a1 setFinalState:v27];
  }

  if (a3) {
    v28 = @"postFusionCorrection";
  }
  else {
    v28 = @"post_fusion_correction";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [GEOVLFCorrection alloc];
    if (a3) {
      uint64_t v31 = [(GEOVLFCorrection *)v30 initWithJSON:v29];
    }
    else {
      uint64_t v31 = [(GEOVLFCorrection *)v30 initWithDictionary:v29];
    }
    v32 = (void *)v31;
    [a1 setPostFusionCorrection:v31];
  }
  if (a3) {
    v33 = @"timeRoundedToHour";
  }
  else {
    v33 = @"time_rounded_to_hour";
  }
  v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTimeRoundedToHour:", objc_msgSend(v34, "unsignedIntValue"));
  }

  v35 = [v5 objectForKeyedSubscript:@"initialPositionContextClassification"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v90 = 0uLL;
    uint64_t v91 = 0;
    _GEOVLFPositionContextClassificationFromDictionaryRepresentation(v35, (uint64_t)&v90);
    long long v88 = v90;
    uint64_t v89 = v91;
    [a1 setInitialPositionContextClassification:&v88];
  }

  if (a3) {
    id v36 = @"initializationFailureDetails";
  }
  else {
    id v36 = @"initialization_failure_details";
  }
  uint64_t v37 = [v5 objectForKeyedSubscript:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v38 = [GEOVLFInitializationFailureDetails alloc];
    if (a3) {
      uint64_t v39 = [(GEOVLFInitializationFailureDetails *)v38 initWithJSON:v37];
    }
    else {
      uint64_t v39 = [(GEOVLFInitializationFailureDetails *)v38 initWithDictionary:v37];
    }
    v40 = (void *)v39;
    [a1 setInitializationFailureDetails:v39];
  }
  if (a3) {
    v41 = @"arState";
  }
  else {
    v41 = @"ar_state";
  }
  v42 = [v5 objectForKeyedSubscript:v41];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v43 = v42;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v84 objects:v97 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v85;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v85 != v46) {
            objc_enumerationMutation(v43);
          }
          uint64_t v48 = *(void *)(*((void *)&v84 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v49 = [GEOVLFARState alloc];
            if (a3) {
              uint64_t v50 = [(GEOVLFARState *)v49 initWithJSON:v48];
            }
            else {
              uint64_t v50 = [(GEOVLFARState *)v49 initWithDictionary:v48];
            }
            v51 = (void *)v50;
            [a1 addArState:v50];
          }
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v84 objects:v97 count:16];
      }
      while (v45);
    }

    id v5 = v79;
  }

  if (a3) {
    v52 = @"deviceOrientation";
  }
  else {
    v52 = @"device_orientation";
  }
  v53 = [v5 objectForKeyedSubscript:v52];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v54 = v53;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v80 objects:v96 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v81;
      do
      {
        for (uint64_t k = 0; k != v56; ++k)
        {
          if (*(void *)v81 != v57) {
            objc_enumerationMutation(v54);
          }
          uint64_t v59 = *(void *)(*((void *)&v80 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v60 = [GEOVLFDeviceOrientation alloc];
            if (a3) {
              uint64_t v61 = [(GEOVLFDeviceOrientation *)v60 initWithJSON:v59];
            }
            else {
              uint64_t v61 = [(GEOVLFDeviceOrientation *)v60 initWithDictionary:v59];
            }
            v62 = (void *)v61;
            [a1 addDeviceOrientation:v61];
          }
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v80 objects:v96 count:16];
      }
      while (v56);
    }

    id v5 = v79;
  }

  if (a3) {
    v63 = @"crowdsourcingDetails";
  }
  else {
    v63 = @"crowdsourcing_details";
  }
  v64 = [v5 objectForKeyedSubscript:v63];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v65 = [GEOVLFCrowdsourcingDetails alloc];
    if (a3) {
      uint64_t v66 = [(GEOVLFCrowdsourcingDetails *)v65 initWithJSON:v64];
    }
    else {
      uint64_t v66 = [(GEOVLFCrowdsourcingDetails *)v65 initWithDictionary:v64];
    }
    long long v67 = (void *)v66;
    [a1 setCrowdsourcingDetails:v66];
  }
  if (a3) {
    long long v68 = @"initialLocation";
  }
  else {
    long long v68 = @"initial_location";
  }
  long long v69 = [v5 objectForKeyedSubscript:v68];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v70 = [GEOVLFLocation alloc];
    if (a3) {
      uint64_t v71 = [(GEOVLFLocation *)v70 initWithJSON:v69];
    }
    else {
      uint64_t v71 = [(GEOVLFLocation *)v70 initWithDictionary:v69];
    }
    long long v72 = (void *)v71;
    [a1 setInitialLocation:v71];
  }
  if (a3) {
    long long v73 = @"arFailureTypes";
  }
  else {
    long long v73 = @"ar_failure_types";
  }
  long long v74 = [v5 objectForKeyedSubscript:v73];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v75 = [GEOVLFARFailureTypes alloc];
    if (a3) {
      uint64_t v76 = [(GEOVLFARFailureTypes *)v75 initWithJSON:v74];
    }
    else {
      uint64_t v76 = [(GEOVLFARFailureTypes *)v75 initWithDictionary:v74];
    }
    long long v77 = (void *)v76;
    [a1 setArFailureTypes:v76];
  }
LABEL_134:

  return a1;
}

- (GEOLogMsgEventVLFUsage)initWithJSON:(id)a3
{
  return (GEOLogMsgEventVLFUsage *)-[GEOLogMsgEventVLFUsage _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_5568;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_5569;
    }
    GEOLogMsgEventVLFUsageReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgEventVLFUsageCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventVLFUsageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventVLFUsageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgEventVLFUsageIsDirty((uint64_t)self) & 1) == 0)
  {
    v19 = self->_reader;
    objc_sync_enter(v19);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v20 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v20];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventVLFUsage *)self readAll:0];
    if (self->_entryPoint) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    objc_super v6 = self->_localizationDetails;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v7);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_postFusionCorrection) {
      PBDataWriterWriteSubmessage();
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags)
    {
      uint64_t v29 = 0;
      PBDataWriterPlaceMark();
      GEOVLFPositionContextClassificationWriteTo((uint64_t)&self->_initialPositionContextClassification);
      PBDataWriterRecallMark();
    }
    if (self->_initializationFailureDetails) {
      PBDataWriterWriteSubmessage();
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v11 = self->_arStates;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v35 count:16];
      }
      while (v12);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = self->_deviceOrientations;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v34 count:16];
      }
      while (v16);
    }

    if (self->_crowdsourcingDetails) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_initialLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_arFailureTypes) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOLogMsgEventVLFUsage _readInitialLocation]((uint64_t)self);
  if ([(GEOVLFLocation *)self->_initialLocation hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLogMsgEventVLFUsage _readLocalizationDetails]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v6 = self->_localizationDetails;
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
  uint64_t v20 = (id *)a3;
  [(GEOLogMsgEventVLFUsage *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 28) = self->_readerMarkPos;
  *((_DWORD *)v20 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_entryPoint) {
    objc_msgSend(v20, "setEntryPoint:");
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v20 + 32) = self->_sessionTimeMs;
    *((_WORD *)v20 + 68) |= 4u;
  }
  if ([(GEOLogMsgEventVLFUsage *)self localizationDetailsCount])
  {
    [v20 clearLocalizationDetails];
    unint64_t v4 = [(GEOLogMsgEventVLFUsage *)self localizationDetailsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgEventVLFUsage *)self localizationDetailsAtIndex:i];
        [v20 addLocalizationDetails:v7];
      }
    }
  }
  uint64_t v8 = v20;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v20 + 31) = self->_finalState;
    *((_WORD *)v20 + 68) |= 2u;
  }
  if (self->_postFusionCorrection)
  {
    objc_msgSend(v20, "setPostFusionCorrection:");
    uint64_t v8 = v20;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v8 + 33) = self->_timeRoundedToHour;
    *((_WORD *)v8 + 68) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    v10 = *(void **)&self->_initialPositionContextClassification._type;
    *((_OWORD *)v8 + 1) = *(_OWORD *)&self->_initialPositionContextClassification._indoorProbability;
    v8[4] = v10;
    *((_WORD *)v8 + 68) |= 1u;
  }
  if (self->_initializationFailureDetails) {
    objc_msgSend(v20, "setInitializationFailureDetails:");
  }
  if ([(GEOLogMsgEventVLFUsage *)self arStatesCount])
  {
    [v20 clearArStates];
    unint64_t v11 = [(GEOLogMsgEventVLFUsage *)self arStatesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        long long v14 = [(GEOLogMsgEventVLFUsage *)self arStateAtIndex:j];
        [v20 addArState:v14];
      }
    }
  }
  if ([(GEOLogMsgEventVLFUsage *)self deviceOrientationsCount])
  {
    [v20 clearDeviceOrientations];
    unint64_t v15 = [(GEOLogMsgEventVLFUsage *)self deviceOrientationsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        uint64_t v18 = [(GEOLogMsgEventVLFUsage *)self deviceOrientationAtIndex:k];
        [v20 addDeviceOrientation:v18];
      }
    }
  }
  if (self->_crowdsourcingDetails) {
    objc_msgSend(v20, "setCrowdsourcingDetails:");
  }
  v19 = v20;
  if (self->_initialLocation)
  {
    objc_msgSend(v20, "setInitialLocation:");
    v19 = v20;
  }
  if (self->_arFailureTypes)
  {
    objc_msgSend(v20, "setArFailureTypes:");
    v19 = v20;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgEventVLFUsageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_35;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventVLFUsage *)self readAll:0];
  id v9 = [(GEOVLFEntryPoint *)self->_entryPoint copyWithZone:a3];
  v10 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v9;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_sessionTimeMs;
    *(_WORD *)(v5 + 136) |= 4u;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  unint64_t v11 = self->_localizationDetails;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(v11);
        }
        unint64_t v15 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addLocalizationDetails:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v12);
  }

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_finalState;
    *(_WORD *)(v5 + 136) |= 2u;
  }
  id v16 = [(GEOVLFCorrection *)self->_postFusionCorrection copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v16;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_timeRoundedToHour;
    *(_WORD *)(v5 + 136) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    uint64_t v19 = *(void *)&self->_initialPositionContextClassification._type;
    *(_OWORD *)(v5 + 16) = *(_OWORD *)&self->_initialPositionContextClassification._indoorProbability;
    *(void *)(v5 + 32) = v19;
    *(_WORD *)(v5 + 136) |= 1u;
  }
  id v20 = [(GEOVLFInitializationFailureDetails *)self->_initializationFailureDetails copyWithZone:a3];
  long long v21 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v20;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v22 = self->_arStates;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(v22);
        }
        long long v26 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addArState:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v23);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v27 = self->_deviceOrientations;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(v27);
        }
        long long v31 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * k), "copyWithZone:", a3, (void)v38);
        [(id)v5 addDeviceOrientation:v31];
      }
      uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v28);
  }

  id v32 = [(GEOVLFCrowdsourcingDetails *)self->_crowdsourcingDetails copyWithZone:a3];
  long long v33 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v32;

  id v34 = [(GEOVLFLocation *)self->_initialLocation copyWithZone:a3];
  v35 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v34;

  id v36 = [(GEOVLFARFailureTypes *)self->_arFailureTypes copyWithZone:a3];
  id v8 = *(id *)(v5 + 40);
  *(void *)(v5 + 40) = v36;
LABEL_35:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  [(GEOLogMsgEventVLFUsage *)self readAll:1];
  [v4 readAll:1];
  entryPoint = self->_entryPoint;
  if ((unint64_t)entryPoint | *((void *)v4 + 9))
  {
    if (!-[GEOVLFEntryPoint isEqual:](entryPoint, "isEqual:")) {
      goto LABEL_49;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 68);
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_sessionTimeMs != *((_DWORD *)v4 + 32)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_49;
  }
  localizationDetails = self->_localizationDetails;
  if ((unint64_t)localizationDetails | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](localizationDetails, "isEqual:")) {
      goto LABEL_49;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v7 = *((_WORD *)v4 + 68);
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_finalState != *((_DWORD *)v4 + 31)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_49;
  }
  postFusionCorrection = self->_postFusionCorrection;
  if ((unint64_t)postFusionCorrection | *((void *)v4 + 13))
  {
    if (-[GEOVLFCorrection isEqual:](postFusionCorrection, "isEqual:"))
    {
      __int16 flags = (__int16)self->_flags;
      __int16 v7 = *((_WORD *)v4 + 68);
      goto LABEL_20;
    }
LABEL_49:
    char v18 = 0;
    goto LABEL_50;
  }
LABEL_20:
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_timeRoundedToHour != *((_DWORD *)v4 + 33)) {
      goto LABEL_49;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_49;
  }
  if (flags)
  {
    if ((v7 & 1) == 0) {
      goto LABEL_49;
    }
    BOOL v10 = *(void *)&self->_initialPositionContextClassification._indoorProbability == *((void *)v4 + 2)
       && *(void *)&self->_initialPositionContextClassification._outdoorProbability == *((void *)v4 + 3);
    if (!v10 || *(void *)&self->_initialPositionContextClassification._type != *((void *)v4 + 4)) {
      goto LABEL_49;
    }
  }
  else if (v7)
  {
    goto LABEL_49;
  }
  initializationFailureDetails = self->_initializationFailureDetails;
  if ((unint64_t)initializationFailureDetails | *((void *)v4 + 11)
    && !-[GEOVLFInitializationFailureDetails isEqual:](initializationFailureDetails, "isEqual:"))
  {
    goto LABEL_49;
  }
  arStates = self->_arStates;
  if ((unint64_t)arStates | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](arStates, "isEqual:")) {
      goto LABEL_49;
    }
  }
  deviceOrientations = self->_deviceOrientations;
  if ((unint64_t)deviceOrientations | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](deviceOrientations, "isEqual:")) {
      goto LABEL_49;
    }
  }
  crowdsourcingDetails = self->_crowdsourcingDetails;
  if ((unint64_t)crowdsourcingDetails | *((void *)v4 + 7))
  {
    if (!-[GEOVLFCrowdsourcingDetails isEqual:](crowdsourcingDetails, "isEqual:")) {
      goto LABEL_49;
    }
  }
  initialLocation = self->_initialLocation;
  if ((unint64_t)initialLocation | *((void *)v4 + 10))
  {
    if (!-[GEOVLFLocation isEqual:](initialLocation, "isEqual:")) {
      goto LABEL_49;
    }
  }
  arFailureTypes = self->_arFailureTypes;
  if ((unint64_t)arFailureTypes | *((void *)v4 + 5)) {
    char v18 = -[GEOVLFARFailureTypes isEqual:](arFailureTypes, "isEqual:");
  }
  else {
    char v18 = 1;
  }
LABEL_50:

  return v18;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventVLFUsage *)self readAll:1];
  unint64_t v3 = [(GEOVLFEntryPoint *)self->_entryPoint hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v4 = 2654435761 * self->_sessionTimeMs;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_localizationDetails hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_finalState;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(GEOVLFCorrection *)self->_postFusionCorrection hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v9 = 2654435761 * self->_timeRoundedToHour;
    if (flags) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  uint64_t v9 = 0;
  if ((flags & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v10 = PBHashBytes();
LABEL_12:
  unint64_t v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  unint64_t v12 = v9 ^ v10 ^ [(GEOVLFInitializationFailureDetails *)self->_initializationFailureDetails hash];
  uint64_t v13 = v11 ^ v12 ^ [(NSMutableArray *)self->_arStates hash];
  uint64_t v14 = [(NSMutableArray *)self->_deviceOrientations hash];
  unint64_t v15 = v14 ^ [(GEOVLFCrowdsourcingDetails *)self->_crowdsourcingDetails hash];
  unint64_t v16 = v15 ^ [(GEOVLFLocation *)self->_initialLocation hash];
  return v13 ^ v16 ^ [(GEOVLFARFailureTypes *)self->_arFailureTypes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  entryPoint = self->_entryPoint;
  uint64_t v6 = *((void *)v4 + 9);
  if (entryPoint)
  {
    if (v6) {
      -[GEOVLFEntryPoint mergeFrom:](entryPoint, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOLogMsgEventVLFUsage setEntryPoint:](self, "setEntryPoint:");
  }
  if ((*((_WORD *)v4 + 68) & 4) != 0)
  {
    self->_sessionTimeMs = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_flags |= 4u;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = *((id *)v4 + 12);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEOLogMsgEventVLFUsage *)self addLocalizationDetails:*(void *)(*((void *)&v42 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v9);
  }

  if ((*((_WORD *)v4 + 68) & 2) != 0)
  {
    self->_finalState = *((_DWORD *)v4 + 31);
    *(_WORD *)&self->_flags |= 2u;
  }
  postFusionCorrection = self->_postFusionCorrection;
  uint64_t v13 = *((void *)v4 + 13);
  if (postFusionCorrection)
  {
    if (v13) {
      -[GEOVLFCorrection mergeFrom:](postFusionCorrection, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOLogMsgEventVLFUsage setPostFusionCorrection:](self, "setPostFusionCorrection:");
  }
  __int16 v14 = *((_WORD *)v4 + 68);
  if ((v14 & 8) != 0)
  {
    self->_timeRoundedToHour = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_flags |= 8u;
    __int16 v14 = *((_WORD *)v4 + 68);
  }
  if (v14)
  {
    uint64_t v15 = *((void *)v4 + 4);
    *(_OWORD *)&self->_initialPositionContextClassification._indoorProbability = *((_OWORD *)v4 + 1);
    *(void *)&self->_initialPositionContextClassification._type = v15;
    *(_WORD *)&self->_flags |= 1u;
  }
  initializationFailureDetails = self->_initializationFailureDetails;
  uint64_t v17 = *((void *)v4 + 11);
  if (initializationFailureDetails)
  {
    if (v17) {
      -[GEOVLFInitializationFailureDetails mergeFrom:](initializationFailureDetails, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEOLogMsgEventVLFUsage setInitializationFailureDetails:](self, "setInitializationFailureDetails:");
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v18 = *((id *)v4 + 6);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v18);
        }
        [(GEOLogMsgEventVLFUsage *)self addArState:*(void *)(*((void *)&v38 + 1) + 8 * j)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v20);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v23 = *((id *)v4 + 8);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v23);
        }
        -[GEOLogMsgEventVLFUsage addDeviceOrientation:](self, "addDeviceOrientation:", *(void *)(*((void *)&v34 + 1) + 8 * k), (void)v34);
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v25);
  }

  crowdsourcingDetails = self->_crowdsourcingDetails;
  uint64_t v29 = *((void *)v4 + 7);
  if (crowdsourcingDetails)
  {
    if (v29) {
      -[GEOVLFCrowdsourcingDetails mergeFrom:](crowdsourcingDetails, "mergeFrom:");
    }
  }
  else if (v29)
  {
    -[GEOLogMsgEventVLFUsage setCrowdsourcingDetails:](self, "setCrowdsourcingDetails:");
  }
  initialLocation = self->_initialLocation;
  uint64_t v31 = *((void *)v4 + 10);
  if (initialLocation)
  {
    if (v31) {
      -[GEOVLFLocation mergeFrom:](initialLocation, "mergeFrom:");
    }
  }
  else if (v31)
  {
    -[GEOLogMsgEventVLFUsage setInitialLocation:](self, "setInitialLocation:");
  }
  arFailureTypes = self->_arFailureTypes;
  uint64_t v33 = *((void *)v4 + 5);
  if (arFailureTypes)
  {
    if (v33) {
      -[GEOVLFARFailureTypes mergeFrom:](arFailureTypes, "mergeFrom:");
    }
  }
  else if (v33)
  {
    -[GEOLogMsgEventVLFUsage setArFailureTypes:](self, "setArFailureTypes:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postFusionCorrection, 0);
  objc_storeStrong((id *)&self->_localizationDetails, 0);
  objc_storeStrong((id *)&self->_initializationFailureDetails, 0);
  objc_storeStrong((id *)&self->_initialLocation, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
  objc_storeStrong((id *)&self->_deviceOrientations, 0);
  objc_storeStrong((id *)&self->_crowdsourcingDetails, 0);
  objc_storeStrong((id *)&self->_arStates, 0);
  objc_storeStrong((id *)&self->_arFailureTypes, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end