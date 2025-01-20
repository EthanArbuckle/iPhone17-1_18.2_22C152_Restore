@interface GEOCompanionStep
+ (BOOL)isValid:(id)a3;
+ (Class)guidanceEventType;
+ (Class)instructionWithAlternativesType;
+ (Class)roadDescriptionsType;
- (BOOL)hasCyclingStep;
- (BOOL)hasDistance;
- (BOOL)hasDistanceMeters;
- (BOOL)hasDriveStep;
- (BOOL)hasEndCoordinateIndex;
- (BOOL)hasFerryStep;
- (BOOL)hasGenericStep;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLegID;
- (BOOL)hasListInstruction;
- (BOOL)hasManeuverStartCoordinateIndex;
- (BOOL)hasRoadName;
- (BOOL)hasStartCoordinateIndex;
- (BOOL)hasStepID;
- (BOOL)hasStopWaypoint;
- (BOOL)hasTime;
- (BOOL)hasUpdateID;
- (BOOL)hasWalkStep;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCompanionCyclingStep)cyclingStep;
- (GEOCompanionDriveStep)driveStep;
- (GEOCompanionFerryStep)ferryStep;
- (GEOCompanionGenericStep)genericStep;
- (GEOCompanionStep)init;
- (GEOCompanionStep)initWithData:(id)a3;
- (GEOCompanionStep)initWithDictionary:(id)a3;
- (GEOCompanionStep)initWithJSON:(id)a3;
- (GEOCompanionStep)initWithStep:(id)a3 route:(id)a4 stringFormatter:(id)a5;
- (GEOCompanionWalkStep)walkStep;
- (GEOStopWaypoint)stopWaypoint;
- (NSData)updateID;
- (NSMutableArray)guidanceEvents;
- (NSMutableArray)instructionWithAlternatives;
- (NSMutableArray)roadDescriptions;
- (NSString)description;
- (NSString)listInstruction;
- (NSString)roadName;
- (float)distanceMeters;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)geoStep;
- (id)guidanceEventAtIndex:(unint64_t)a3;
- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3;
- (id)instructionWithAlternativesAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)maneuverStep;
- (id)roadDescriptionsAtIndex:(unint64_t)a3;
- (unint64_t)guidanceEventsCount;
- (unint64_t)hash;
- (unint64_t)instructionWithAlternativesCount;
- (unint64_t)roadDescriptionsCount;
- (unsigned)distance;
- (unsigned)endCoordinateIndex;
- (unsigned)legID;
- (unsigned)maneuverStartCoordinateIndex;
- (unsigned)startCoordinateIndex;
- (unsigned)stepID;
- (unsigned)time;
- (void)_addNoFlagsGuidanceEvent:(uint64_t)a1;
- (void)_addNoFlagsInstructionWithAlternatives:(uint64_t)a1;
- (void)_addNoFlagsRoadDescriptions:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCyclingStep;
- (void)_readDriveStep;
- (void)_readFerryStep;
- (void)_readGenericStep;
- (void)_readGuidanceEvents;
- (void)_readInstructionWithAlternatives;
- (void)_readListInstruction;
- (void)_readRoadDescriptions;
- (void)_readRoadName;
- (void)_readStopWaypoint;
- (void)_readUpdateID;
- (void)_readWalkStep;
- (void)addGuidanceEvent:(id)a3;
- (void)addInstructionWithAlternatives:(id)a3;
- (void)addRoadDescriptions:(id)a3;
- (void)clearGuidanceEvents;
- (void)clearInstructionWithAlternatives;
- (void)clearRoadDescriptions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCyclingStep:(id)a3;
- (void)setDistance:(unsigned int)a3;
- (void)setDistanceMeters:(float)a3;
- (void)setDriveStep:(id)a3;
- (void)setEndCoordinateIndex:(unsigned int)a3;
- (void)setFerryStep:(id)a3;
- (void)setGenericStep:(id)a3;
- (void)setGuidanceEvents:(id)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)setHasDistanceMeters:(BOOL)a3;
- (void)setHasEndCoordinateIndex:(BOOL)a3;
- (void)setHasLegID:(BOOL)a3;
- (void)setHasManeuverStartCoordinateIndex:(BOOL)a3;
- (void)setHasStartCoordinateIndex:(BOOL)a3;
- (void)setHasStepID:(BOOL)a3;
- (void)setHasTime:(BOOL)a3;
- (void)setInstructionWithAlternatives:(id)a3;
- (void)setLegID:(unsigned int)a3;
- (void)setListInstruction:(id)a3;
- (void)setManeuverStartCoordinateIndex:(unsigned int)a3;
- (void)setRoadDescriptions:(id)a3;
- (void)setRoadName:(id)a3;
- (void)setStartCoordinateIndex:(unsigned int)a3;
- (void)setStepID:(unsigned int)a3;
- (void)setStopWaypoint:(id)a3;
- (void)setTime:(unsigned int)a3;
- (void)setUpdateID:(id)a3;
- (void)setWalkStep:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCompanionStep

- (GEOCompanionStep)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionStep;
  v2 = [(GEOCompanionStep *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionStep)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionStep;
  v3 = [(GEOCompanionStep *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100040u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  if (a3) {
    int v3 = 1048640;
  }
  else {
    int v3 = 0x100000;
  }
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasStepID
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (unsigned)distance
{
  return self->_distance;
}

- (void)setDistance:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100002u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  if (a3) {
    int v3 = 1048578;
  }
  else {
    int v3 = 0x100000;
  }
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasDistance
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)time
{
  return self->_time;
}

- (void)setTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100080u;
  self->_time = a3;
}

- (void)setHasTime:(BOOL)a3
{
  if (a3) {
    int v3 = 1048704;
  }
  else {
    int v3 = 0x100000;
  }
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasTime
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (void)_readRoadName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 158) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoadName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasRoadName
{
  return self->_roadName != 0;
}

- (NSString)roadName
{
  -[GEOCompanionStep _readRoadName]((uint64_t)self);
  roadName = self->_roadName;

  return roadName;
}

- (void)setRoadName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x110000u;
  objc_storeStrong((id *)&self->_roadName, a3);
}

- (void)_readDriveStep
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 157) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDriveStep_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasDriveStep
{
  return self->_driveStep != 0;
}

- (GEOCompanionDriveStep)driveStep
{
  -[GEOCompanionStep _readDriveStep]((uint64_t)self);
  driveStep = self->_driveStep;

  return driveStep;
}

- (void)setDriveStep:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x100200u;
  objc_storeStrong((id *)&self->_driveStep, a3);
}

- (void)_readWalkStep
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 158) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWalkStep_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasWalkStep
{
  return self->_walkStep != 0;
}

- (GEOCompanionWalkStep)walkStep
{
  -[GEOCompanionStep _readWalkStep]((uint64_t)self);
  walkStep = self->_walkStep;

  return walkStep;
}

- (void)setWalkStep:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x180000u;
  objc_storeStrong((id *)&self->_walkStep, a3);
}

- (void)_readFerryStep
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 157) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFerryStep_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasFerryStep
{
  return self->_ferryStep != 0;
}

- (GEOCompanionFerryStep)ferryStep
{
  -[GEOCompanionStep _readFerryStep]((uint64_t)self);
  ferryStep = self->_ferryStep;

  return ferryStep;
}

- (void)setFerryStep:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x100400u;
  objc_storeStrong((id *)&self->_ferryStep, a3);
}

- (unsigned)startCoordinateIndex
{
  return self->_startCoordinateIndex;
}

- (void)setStartCoordinateIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100020u;
  self->_startCoordinateIndex = a3;
}

- (void)setHasStartCoordinateIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 1048608;
  }
  else {
    int v3 = 0x100000;
  }
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasStartCoordinateIndex
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (unsigned)maneuverStartCoordinateIndex
{
  return self->_maneuverStartCoordinateIndex;
}

- (void)setManeuverStartCoordinateIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100010u;
  self->_maneuverStartCoordinateIndex = a3;
}

- (void)setHasManeuverStartCoordinateIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 1048592;
  }
  else {
    int v3 = 0x100000;
  }
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFEFFFEF | v3);
}

- (BOOL)hasManeuverStartCoordinateIndex
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (unsigned)endCoordinateIndex
{
  return self->_endCoordinateIndex;
}

- (void)setEndCoordinateIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100004u;
  self->_endCoordinateIndex = a3;
}

- (void)setHasEndCoordinateIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 1048580;
  }
  else {
    int v3 = 0x100000;
  }
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasEndCoordinateIndex
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readInstructionWithAlternatives
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 157) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInstructionWithAlternatives_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)instructionWithAlternatives
{
  -[GEOCompanionStep _readInstructionWithAlternatives]((uint64_t)self);
  instructionWithAlternatives = self->_instructionWithAlternatives;

  return instructionWithAlternatives;
}

- (void)setInstructionWithAlternatives:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  instructionWithAlternatives = self->_instructionWithAlternatives;
  self->_instructionWithAlternatives = v4;
}

- (void)clearInstructionWithAlternatives
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  instructionWithAlternatives = self->_instructionWithAlternatives;

  [(NSMutableArray *)instructionWithAlternatives removeAllObjects];
}

- (void)addInstructionWithAlternatives:(id)a3
{
  id v4 = a3;
  -[GEOCompanionStep _readInstructionWithAlternatives]((uint64_t)self);
  -[GEOCompanionStep _addNoFlagsInstructionWithAlternatives:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsInstructionWithAlternatives:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)instructionWithAlternativesCount
{
  -[GEOCompanionStep _readInstructionWithAlternatives]((uint64_t)self);
  instructionWithAlternatives = self->_instructionWithAlternatives;

  return [(NSMutableArray *)instructionWithAlternatives count];
}

- (id)instructionWithAlternativesAtIndex:(unint64_t)a3
{
  -[GEOCompanionStep _readInstructionWithAlternatives]((uint64_t)self);
  instructionWithAlternatives = self->_instructionWithAlternatives;

  return (id)[(NSMutableArray *)instructionWithAlternatives objectAtIndex:a3];
}

+ (Class)instructionWithAlternativesType
{
  return (Class)objc_opt_class();
}

- (void)_readListInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 157) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readListInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasListInstruction
{
  return self->_listInstruction != 0;
}

- (NSString)listInstruction
{
  -[GEOCompanionStep _readListInstruction]((uint64_t)self);
  listInstruction = self->_listInstruction;

  return listInstruction;
}

- (void)setListInstruction:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x104000u;
  objc_storeStrong((id *)&self->_listInstruction, a3);
}

- (void)_readGuidanceEvents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 157) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuidanceEvents_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)guidanceEvents
{
  -[GEOCompanionStep _readGuidanceEvents]((uint64_t)self);
  guidanceEvents = self->_guidanceEvents;

  return guidanceEvents;
}

- (void)setGuidanceEvents:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  guidanceEvents = self->_guidanceEvents;
  self->_guidanceEvents = v4;
}

- (void)clearGuidanceEvents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  guidanceEvents = self->_guidanceEvents;

  [(NSMutableArray *)guidanceEvents removeAllObjects];
}

- (void)addGuidanceEvent:(id)a3
{
  id v4 = a3;
  -[GEOCompanionStep _readGuidanceEvents]((uint64_t)self);
  -[GEOCompanionStep _addNoFlagsGuidanceEvent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsGuidanceEvent:(uint64_t)a1
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

- (unint64_t)guidanceEventsCount
{
  -[GEOCompanionStep _readGuidanceEvents]((uint64_t)self);
  guidanceEvents = self->_guidanceEvents;

  return [(NSMutableArray *)guidanceEvents count];
}

- (id)guidanceEventAtIndex:(unint64_t)a3
{
  -[GEOCompanionStep _readGuidanceEvents]((uint64_t)self);
  guidanceEvents = self->_guidanceEvents;

  return (id)[(NSMutableArray *)guidanceEvents objectAtIndex:a3];
}

+ (Class)guidanceEventType
{
  return (Class)objc_opt_class();
}

- (void)_readUpdateID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 158) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUpdateID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasUpdateID
{
  return self->_updateID != 0;
}

- (NSData)updateID
{
  -[GEOCompanionStep _readUpdateID]((uint64_t)self);
  updateID = self->_updateID;

  return updateID;
}

- (void)setUpdateID:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x140000u;
  objc_storeStrong((id *)&self->_updateID, a3);
}

- (void)_readGenericStep
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 157) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGenericStep_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasGenericStep
{
  return self->_genericStep != 0;
}

- (GEOCompanionGenericStep)genericStep
{
  -[GEOCompanionStep _readGenericStep]((uint64_t)self);
  genericStep = self->_genericStep;

  return genericStep;
}

- (void)setGenericStep:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x100800u;
  objc_storeStrong((id *)&self->_genericStep, a3);
}

- (void)_readCyclingStep
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 157) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCyclingStep_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasCyclingStep
{
  return self->_cyclingStep != 0;
}

- (GEOCompanionCyclingStep)cyclingStep
{
  -[GEOCompanionStep _readCyclingStep]((uint64_t)self);
  cyclingStep = self->_cyclingStep;

  return cyclingStep;
}

- (void)setCyclingStep:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x100100u;
  objc_storeStrong((id *)&self->_cyclingStep, a3);
}

- (void)_readRoadDescriptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 157) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoadDescriptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)roadDescriptions
{
  -[GEOCompanionStep _readRoadDescriptions]((uint64_t)self);
  roadDescriptions = self->_roadDescriptions;

  return roadDescriptions;
}

- (void)setRoadDescriptions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  roadDescriptions = self->_roadDescriptions;
  self->_roadDescriptions = v4;
}

- (void)clearRoadDescriptions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  roadDescriptions = self->_roadDescriptions;

  [(NSMutableArray *)roadDescriptions removeAllObjects];
}

- (void)addRoadDescriptions:(id)a3
{
  id v4 = a3;
  -[GEOCompanionStep _readRoadDescriptions]((uint64_t)self);
  -[GEOCompanionStep _addNoFlagsRoadDescriptions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsRoadDescriptions:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)roadDescriptionsCount
{
  -[GEOCompanionStep _readRoadDescriptions]((uint64_t)self);
  roadDescriptions = self->_roadDescriptions;

  return [(NSMutableArray *)roadDescriptions count];
}

- (id)roadDescriptionsAtIndex:(unint64_t)a3
{
  -[GEOCompanionStep _readRoadDescriptions]((uint64_t)self);
  roadDescriptions = self->_roadDescriptions;

  return (id)[(NSMutableArray *)roadDescriptions objectAtIndex:a3];
}

+ (Class)roadDescriptionsType
{
  return (Class)objc_opt_class();
}

- (void)_readStopWaypoint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 158) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStopWaypoint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasStopWaypoint
{
  return self->_stopWaypoint != 0;
}

- (GEOStopWaypoint)stopWaypoint
{
  -[GEOCompanionStep _readStopWaypoint]((uint64_t)self);
  stopWaypoint = self->_stopWaypoint;

  return stopWaypoint;
}

- (void)setStopWaypoint:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x120000u;
  objc_storeStrong((id *)&self->_stopWaypoint, a3);
}

- (float)distanceMeters
{
  return self->_distanceMeters;
}

- (void)setDistanceMeters:(float)a3
{
  *(_DWORD *)&self->_flags |= 0x100001u;
  self->_distanceMeters = a3;
}

- (void)setHasDistanceMeters:(BOOL)a3
{
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x100000);
}

- (BOOL)hasDistanceMeters
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unsigned)legID
{
  return self->_legID;
}

- (void)setLegID:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100008u;
  self->_legID = a3;
}

- (void)setHasLegID:(BOOL)a3
{
  if (a3) {
    int v3 = 1048584;
  }
  else {
    int v3 = 0x100000;
  }
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasLegID
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (NSString)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCompanionStep;
  id v4 = [(GEOCompanionStep *)&v8 description];
  id v5 = [(GEOCompanionStep *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_86;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = &OBJC_IVAR___GEOPDSPunchInResultHints__name;
  int v6 = *(_DWORD *)(a1 + 156);
  if ((v6 & 0x40) != 0)
  {
    id v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 148)];
    [v4 setObject:v7 forKey:@"stepID"];

    int v6 = *(_DWORD *)(a1 + 156);
  }
  if ((v6 & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 128)];
    [v4 setObject:v8 forKey:@"distance"];

    int v6 = *(_DWORD *)(a1 + 156);
  }
  if ((v6 & 0x80) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 152)];
    [v4 setObject:v9 forKey:@"time"];
  }
  v10 = [(id)a1 roadName];
  if (v10) {
    [v4 setObject:v10 forKey:@"roadName"];
  }

  v11 = [(id)a1 driveStep];
  v12 = v11;
  if (v11)
  {
    if (a2) {
      [v11 jsonRepresentation];
    }
    else {
    v13 = [v11 dictionaryRepresentation];
    }
    [v4 setObject:v13 forKey:@"driveStep"];
  }
  v14 = [(id)a1 walkStep];
  v15 = v14;
  if (v14)
  {
    if (a2) {
      [v14 jsonRepresentation];
    }
    else {
    v16 = [v14 dictionaryRepresentation];
    }
    [v4 setObject:v16 forKey:@"walkStep"];
  }
  v17 = [(id)a1 ferryStep];
  v18 = v17;
  if (v17)
  {
    if (a2) {
      [v17 jsonRepresentation];
    }
    else {
    v19 = [v17 dictionaryRepresentation];
    }
    [v4 setObject:v19 forKey:@"ferryStep"];
  }
  int v20 = *(_DWORD *)(a1 + 156);
  if ((v20 & 0x20) == 0)
  {
    if ((v20 & 0x10) == 0) {
      goto LABEL_27;
    }
LABEL_49:
    v36 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 140)];
    [v4 setObject:v36 forKey:@"maneuverStartCoordinateIndex"];

    if ((*(_DWORD *)(a1 + 156) & 4) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  v35 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 144)];
  [v4 setObject:v35 forKey:@"startCoordinateIndex"];

  int v20 = *(_DWORD *)(a1 + 156);
  if ((v20 & 0x10) != 0) {
    goto LABEL_49;
  }
LABEL_27:
  if ((v20 & 4) != 0)
  {
LABEL_28:
    v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 132)];
    [v4 setObject:v21 forKey:@"endCoordinateIndex"];
  }
LABEL_29:
  if (*(void *)(a1 + 56))
  {
    v22 = [(id)a1 instructionWithAlternatives];
    [v4 setObject:v22 forKey:@"instructionWithAlternatives"];
  }
  v23 = [(id)a1 listInstruction];
  if (v23) {
    [v4 setObject:v23 forKey:@"listInstruction"];
  }

  if ([*(id *)(a1 + 48) count])
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v25 = *(id *)(a1 + 48);
    uint64_t v26 = [v25 countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v65 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if (a2) {
            [v30 jsonRepresentation];
          }
          else {
          v31 = [v30 dictionaryRepresentation];
          }
          [v24 addObject:v31];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v64 objects:v69 count:16];
      }
      while (v27);
    }

    [v4 setObject:v24 forKey:@"guidanceEvent"];
    id v5 = &OBJC_IVAR___GEOPDSPunchInResultHints__name;
  }
  v32 = [(id)a1 updateID];
  v33 = v32;
  if (v32)
  {
    if (a2)
    {
      v34 = [v32 base64EncodedStringWithOptions:0];
      [v4 setObject:v34 forKey:@"updateID"];
    }
    else
    {
      [v4 setObject:v32 forKey:@"updateID"];
    }
  }

  v37 = [(id)a1 genericStep];
  v38 = v37;
  if (v37)
  {
    if (a2) {
      [v37 jsonRepresentation];
    }
    else {
    v39 = [v37 dictionaryRepresentation];
    }
    [v4 setObject:v39 forKey:@"genericStep"];
  }
  v40 = [(id)a1 cyclingStep];
  v41 = v40;
  if (v40)
  {
    if (a2) {
      [v40 jsonRepresentation];
    }
    else {
    v42 = [v40 dictionaryRepresentation];
    }
    [v4 setObject:v42 forKey:@"cyclingStep"];
  }
  if ([*(id *)(a1 + 72) count])
  {
    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v44 = *(id *)(a1 + 72);
    uint64_t v45 = [v44 countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v46; ++j)
        {
          if (*(void *)v61 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = *(void **)(*((void *)&v60 + 1) + 8 * j);
          if (a2) {
            [v49 jsonRepresentation];
          }
          else {
          v50 = objc_msgSend(v49, "dictionaryRepresentation", (void)v60);
          }
          objc_msgSend(v43, "addObject:", v50, (void)v60);
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v60 objects:v68 count:16];
      }
      while (v46);
    }

    [v4 setObject:v43 forKey:@"roadDescriptions"];
    id v5 = &OBJC_IVAR___GEOPDSPunchInResultHints__name;
  }
  v51 = objc_msgSend((id)a1, "stopWaypoint", (void)v60);
  v52 = v51;
  if (v51)
  {
    if (a2) {
      [v51 jsonRepresentation];
    }
    else {
    v53 = [v51 dictionaryRepresentation];
    }
    [v4 setObject:v53 forKey:@"stopWaypoint"];
  }
  int v55 = *(_DWORD *)(a1 + v5[714]);
  if (v55)
  {
    LODWORD(v54) = *(_DWORD *)(a1 + 124);
    v56 = [NSNumber numberWithFloat:v54];
    if (a2) {
      v57 = @"distanceMeters";
    }
    else {
      v57 = @"distance_meters";
    }
    [v4 setObject:v56 forKey:v57];

    int v55 = *(_DWORD *)(a1 + 156);
  }
  if ((v55 & 8) != 0)
  {
    v58 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 136)];
    [v4 setObject:v58 forKey:@"legID"];
  }
LABEL_86:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCompanionStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionStep)initWithDictionary:(id)a3
{
  return (GEOCompanionStep *)-[GEOCompanionStep _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      int v6 = [v5 objectForKeyedSubscript:@"stepID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStepID:", objc_msgSend(v6, "unsignedIntValue"));
      }

      id v7 = [v5 objectForKeyedSubscript:@"distance"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDistance:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"time"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTime:", objc_msgSend(v8, "unsignedIntValue"));
      }

      v9 = [v5 objectForKeyedSubscript:@"roadName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = (void *)[v9 copy];
        [a1 setRoadName:v10];
      }
      v11 = [v5 objectForKeyedSubscript:@"driveStep"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOCompanionDriveStep alloc];
        if (a3) {
          uint64_t v13 = [(GEOCompanionDriveStep *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOCompanionDriveStep *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setDriveStep:v13];
      }
      v15 = [v5 objectForKeyedSubscript:@"walkStep"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [GEOCompanionWalkStep alloc];
        if (a3) {
          uint64_t v17 = [(GEOCompanionWalkStep *)v16 initWithJSON:v15];
        }
        else {
          uint64_t v17 = [(GEOCompanionWalkStep *)v16 initWithDictionary:v15];
        }
        v18 = (void *)v17;
        [a1 setWalkStep:v17];
      }
      v19 = [v5 objectForKeyedSubscript:@"ferryStep"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v20 = [GEOCompanionFerryStep alloc];
        if (a3) {
          uint64_t v21 = [(GEOCompanionFerryStep *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEOCompanionFerryStep *)v20 initWithDictionary:v19];
        }
        v22 = (void *)v21;
        [a1 setFerryStep:v21];
      }
      v23 = [v5 objectForKeyedSubscript:@"startCoordinateIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStartCoordinateIndex:", objc_msgSend(v23, "unsignedIntValue"));
      }

      v24 = [v5 objectForKeyedSubscript:@"maneuverStartCoordinateIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setManeuverStartCoordinateIndex:", objc_msgSend(v24, "unsignedIntValue"));
      }

      id v25 = [v5 objectForKeyedSubscript:@"endCoordinateIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEndCoordinateIndex:", objc_msgSend(v25, "unsignedIntValue"));
      }

      uint64_t v26 = [v5 objectForKeyedSubscript:@"instructionWithAlternatives"];
      objc_opt_class();
      id v75 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v84 objects:v90 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v85;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v85 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void **)(*((void *)&v84 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v33 = (void *)[v32 copy];
                [a1 addInstructionWithAlternatives:v33];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v84 objects:v90 count:16];
          }
          while (v29);
        }

        id v5 = v75;
      }

      v34 = [v5 objectForKeyedSubscript:@"listInstruction"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = (void *)[v34 copy];
        [a1 setListInstruction:v35];
      }
      v36 = [v5 objectForKeyedSubscript:@"guidanceEvent"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        v74 = v36;
        id v37 = v36;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v80 objects:v89 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v81;
          do
          {
            for (uint64_t j = 0; j != v39; ++j)
            {
              if (*(void *)v81 != v40) {
                objc_enumerationMutation(v37);
              }
              uint64_t v42 = *(void *)(*((void *)&v80 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v43 = [GEOGuidanceEvent alloc];
                if (a3) {
                  uint64_t v44 = [(GEOGuidanceEvent *)v43 initWithJSON:v42];
                }
                else {
                  uint64_t v44 = [(GEOGuidanceEvent *)v43 initWithDictionary:v42];
                }
                uint64_t v45 = (void *)v44;
                objc_msgSend(a1, "addGuidanceEvent:", v44, v74);
              }
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v80 objects:v89 count:16];
          }
          while (v39);
        }

        v36 = v74;
        id v5 = v75;
      }

      uint64_t v46 = [v5 objectForKeyedSubscript:@"updateID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v46 options:0];
        [a1 setUpdateID:v47];
      }
      v48 = [v5 objectForKeyedSubscript:@"genericStep"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v49 = [GEOCompanionGenericStep alloc];
        if (a3) {
          uint64_t v50 = [(GEOCompanionGenericStep *)v49 initWithJSON:v48];
        }
        else {
          uint64_t v50 = [(GEOCompanionGenericStep *)v49 initWithDictionary:v48];
        }
        v51 = (void *)v50;
        objc_msgSend(a1, "setGenericStep:", v50, v74);
      }
      v52 = [v5 objectForKeyedSubscript:@"cyclingStep"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v53 = [GEOCompanionCyclingStep alloc];
        if (a3) {
          uint64_t v54 = [(GEOCompanionCyclingStep *)v53 initWithJSON:v52];
        }
        else {
          uint64_t v54 = [(GEOCompanionCyclingStep *)v53 initWithDictionary:v52];
        }
        int v55 = (void *)v54;
        objc_msgSend(a1, "setCyclingStep:", v54, v74);
      }
      v56 = [v5 objectForKeyedSubscript:@"roadDescriptions"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v57 = v56;
        uint64_t v58 = [v57 countByEnumeratingWithState:&v76 objects:v88 count:16];
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v60 = *(void *)v77;
          do
          {
            for (uint64_t k = 0; k != v59; ++k)
            {
              if (*(void *)v77 != v60) {
                objc_enumerationMutation(v57);
              }
              uint64_t v62 = *(void *)(*((void *)&v76 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v63 = [GEORoadDescription alloc];
                if (a3) {
                  uint64_t v64 = [(GEORoadDescription *)v63 initWithJSON:v62];
                }
                else {
                  uint64_t v64 = [(GEORoadDescription *)v63 initWithDictionary:v62];
                }
                long long v65 = (void *)v64;
                objc_msgSend(a1, "addRoadDescriptions:", v64, v74);
              }
            }
            uint64_t v59 = [v57 countByEnumeratingWithState:&v76 objects:v88 count:16];
          }
          while (v59);
        }

        id v5 = v75;
      }

      long long v66 = [v5 objectForKeyedSubscript:@"stopWaypoint"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v67 = [GEOStopWaypoint alloc];
        if (a3) {
          uint64_t v68 = [(GEOStopWaypoint *)v67 initWithJSON:v66];
        }
        else {
          uint64_t v68 = [(GEOStopWaypoint *)v67 initWithDictionary:v66];
        }
        v69 = (void *)v68;
        objc_msgSend(a1, "setStopWaypoint:", v68, v74);
      }
      if (a3) {
        uint64_t v70 = @"distanceMeters";
      }
      else {
        uint64_t v70 = @"distance_meters";
      }
      v71 = objc_msgSend(v5, "objectForKeyedSubscript:", v70, v74);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v71 floatValue];
        objc_msgSend(a1, "setDistanceMeters:");
      }

      v72 = [v5 objectForKeyedSubscript:@"legID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLegID:", objc_msgSend(v72, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOCompanionStep)initWithJSON:(id)a3
{
  return (GEOCompanionStep *)-[GEOCompanionStep _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1008;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1009;
    }
    GEOCompanionStepReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOCompanionStepCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOCompanionStepIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v21 = self->_reader;
    objc_sync_enter(v21);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v22 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v22];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v21);
    goto LABEL_61;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCompanionStep *)self readAll:0];
  $F2F3A8C3CD2C9F51802C978D5302AD1B flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    $F2F3A8C3CD2C9F51802C978D5302AD1B flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&flags & 0x80) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&flags & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_flags & 0x80) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_roadName) {
    PBDataWriterWriteStringField();
  }
  if (self->_driveStep) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_walkStep) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_ferryStep) {
    PBDataWriterWriteSubmessage();
  }
  $F2F3A8C3CD2C9F51802C978D5302AD1B v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
    if ((*(unsigned char *)&v7 & 0x10) == 0) {
      goto LABEL_17;
    }
LABEL_58:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_flags & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field();
  $F2F3A8C3CD2C9F51802C978D5302AD1B v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x10) != 0) {
    goto LABEL_58;
  }
LABEL_17:
  if ((*(unsigned char *)&v7 & 4) != 0) {
LABEL_18:
  }
    PBDataWriterWriteUint32Field();
LABEL_19:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  objc_super v8 = self->_instructionWithAlternatives;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v9);
  }

  if (self->_listInstruction) {
    PBDataWriterWriteStringField();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v12 = self->_guidanceEvents;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v13);
  }

  if (self->_updateID) {
    PBDataWriterWriteDataField();
  }
  if (self->_genericStep) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_cyclingStep) {
    PBDataWriterWriteSubmessage();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = self->_roadDescriptions;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v17);
  }

  if (self->_stopWaypoint) {
    PBDataWriterWriteSubmessage();
  }
  $F2F3A8C3CD2C9F51802C978D5302AD1B v20 = self->_flags;
  if (*(unsigned char *)&v20)
  {
    PBDataWriterWriteFloatField();
    $F2F3A8C3CD2C9F51802C978D5302AD1B v20 = self->_flags;
  }
  if ((*(unsigned char *)&v20 & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
LABEL_61:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOCompanionStep _readStopWaypoint]((uint64_t)self);
  stopWaypoint = self->_stopWaypoint;

  return [(GEOStopWaypoint *)stopWaypoint hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  $F2F3A8C3CD2C9F51802C978D5302AD1B v20 = (id *)a3;
  [(GEOCompanionStep *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 28) = self->_readerMarkPos;
  *((_DWORD *)v20 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v20;
  $F2F3A8C3CD2C9F51802C978D5302AD1B flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    *((_DWORD *)v20 + 37) = self->_stepID;
    *((_DWORD *)v20 + 39) |= 0x40u;
    $F2F3A8C3CD2C9F51802C978D5302AD1B flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&flags & 0x80) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v20 + 32) = self->_distance;
  *((_DWORD *)v20 + 39) |= 2u;
  if ((*(_DWORD *)&self->_flags & 0x80) != 0)
  {
LABEL_4:
    *((_DWORD *)v20 + 38) = self->_time;
    *((_DWORD *)v20 + 39) |= 0x80u;
  }
LABEL_5:
  if (self->_roadName)
  {
    objc_msgSend(v20, "setRoadName:");
    id v4 = v20;
  }
  if (self->_driveStep)
  {
    objc_msgSend(v20, "setDriveStep:");
    id v4 = v20;
  }
  if (self->_walkStep)
  {
    objc_msgSend(v20, "setWalkStep:");
    id v4 = v20;
  }
  if (self->_ferryStep)
  {
    objc_msgSend(v20, "setFerryStep:");
    id v4 = v20;
  }
  $F2F3A8C3CD2C9F51802C978D5302AD1B v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_15;
    }
LABEL_50:
    *((_DWORD *)v4 + 35) = self->_maneuverStartCoordinateIndex;
    *((_DWORD *)v4 + 39) |= 0x10u;
    if ((*(_DWORD *)&self->_flags & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  *((_DWORD *)v4 + 36) = self->_startCoordinateIndex;
  *((_DWORD *)v4 + 39) |= 0x20u;
  $F2F3A8C3CD2C9F51802C978D5302AD1B v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x10) != 0) {
    goto LABEL_50;
  }
LABEL_15:
  if ((*(unsigned char *)&v6 & 4) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 33) = self->_endCoordinateIndex;
    *((_DWORD *)v4 + 39) |= 4u;
  }
LABEL_17:
  if ([(GEOCompanionStep *)self instructionWithAlternativesCount])
  {
    [v20 clearInstructionWithAlternatives];
    unint64_t v7 = [(GEOCompanionStep *)self instructionWithAlternativesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(GEOCompanionStep *)self instructionWithAlternativesAtIndex:i];
        [v20 addInstructionWithAlternatives:v10];
      }
    }
  }
  if (self->_listInstruction) {
    objc_msgSend(v20, "setListInstruction:");
  }
  if ([(GEOCompanionStep *)self guidanceEventsCount])
  {
    [v20 clearGuidanceEvents];
    unint64_t v11 = [(GEOCompanionStep *)self guidanceEventsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(GEOCompanionStep *)self guidanceEventAtIndex:j];
        [v20 addGuidanceEvent:v14];
      }
    }
  }
  if (self->_updateID) {
    objc_msgSend(v20, "setUpdateID:");
  }
  if (self->_genericStep) {
    objc_msgSend(v20, "setGenericStep:");
  }
  if (self->_cyclingStep) {
    objc_msgSend(v20, "setCyclingStep:");
  }
  if ([(GEOCompanionStep *)self roadDescriptionsCount])
  {
    [v20 clearRoadDescriptions];
    unint64_t v15 = [(GEOCompanionStep *)self roadDescriptionsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        uint64_t v18 = [(GEOCompanionStep *)self roadDescriptionsAtIndex:k];
        [v20 addRoadDescriptions:v18];
      }
    }
  }
  if (self->_stopWaypoint) {
    objc_msgSend(v20, "setStopWaypoint:");
  }
  $F2F3A8C3CD2C9F51802C978D5302AD1B v19 = self->_flags;
  if (*(unsigned char *)&v19)
  {
    *((_DWORD *)v20 + 31) = LODWORD(self->_distanceMeters);
    *((_DWORD *)v20 + 39) |= 1u;
    $F2F3A8C3CD2C9F51802C978D5302AD1B v19 = self->_flags;
  }
  if ((*(unsigned char *)&v19 & 8) != 0)
  {
    *((_DWORD *)v20 + 34) = self->_legID;
    *((_DWORD *)v20 + 39) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
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
      GEOCompanionStepReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCompanionStep *)self readAll:0];
  $F2F3A8C3CD2C9F51802C978D5302AD1B flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_stepID;
    *(_DWORD *)(v5 + 156) |= 0x40u;
    $F2F3A8C3CD2C9F51802C978D5302AD1B flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&flags & 0x80) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 128) = self->_distance;
  *(_DWORD *)(v5 + 156) |= 2u;
  if ((*(_DWORD *)&self->_flags & 0x80) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 152) = self->_time;
    *(_DWORD *)(v5 + 156) |= 0x80u;
  }
LABEL_9:
  uint64_t v10 = [(NSString *)self->_roadName copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v10;

  id v12 = [(GEOCompanionDriveStep *)self->_driveStep copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  id v14 = [(GEOCompanionWalkStep *)self->_walkStep copyWithZone:a3];
  unint64_t v15 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v14;

  id v16 = [(GEOCompanionFerryStep *)self->_ferryStep copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  $F2F3A8C3CD2C9F51802C978D5302AD1B v18 = self->_flags;
  if ((*(unsigned char *)&v18 & 0x20) == 0)
  {
    if ((*(unsigned char *)&v18 & 0x10) == 0) {
      goto LABEL_11;
    }
LABEL_43:
    *(_DWORD *)(v5 + 140) = self->_maneuverStartCoordinateIndex;
    *(_DWORD *)(v5 + 156) |= 0x10u;
    if ((*(_DWORD *)&self->_flags & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  *(_DWORD *)(v5 + 144) = self->_startCoordinateIndex;
  *(_DWORD *)(v5 + 156) |= 0x20u;
  $F2F3A8C3CD2C9F51802C978D5302AD1B v18 = self->_flags;
  if ((*(unsigned char *)&v18 & 0x10) != 0) {
    goto LABEL_43;
  }
LABEL_11:
  if ((*(unsigned char *)&v18 & 4) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 132) = self->_endCoordinateIndex;
    *(_DWORD *)(v5 + 156) |= 4u;
  }
LABEL_13:
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  $F2F3A8C3CD2C9F51802C978D5302AD1B v19 = self->_instructionWithAlternatives;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v55 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addInstructionWithAlternatives:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v20);
  }

  uint64_t v24 = [(NSString *)self->_listInstruction copyWithZone:a3];
  long long v25 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v24;

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v26 = self->_guidanceEvents;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v51 != v28) {
          objc_enumerationMutation(v26);
        }
        long long v30 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addGuidanceEvent:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v27);
  }

  uint64_t v31 = [(NSData *)self->_updateID copyWithZone:a3];
  long long v32 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v31;

  id v33 = [(GEOCompanionGenericStep *)self->_genericStep copyWithZone:a3];
  long long v34 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v33;

  id v35 = [(GEOCompanionCyclingStep *)self->_cyclingStep copyWithZone:a3];
  v36 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v35;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v37 = self->_roadDescriptions;
  uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v38; ++k)
      {
        if (*(void *)v47 != v39) {
          objc_enumerationMutation(v37);
        }
        v41 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * k), "copyWithZone:", a3, (void)v46);
        [(id)v5 addRoadDescriptions:v41];
      }
      uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v38);
  }

  id v42 = [(GEOStopWaypoint *)self->_stopWaypoint copyWithZone:a3];
  v43 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v42;

  $F2F3A8C3CD2C9F51802C978D5302AD1B v44 = self->_flags;
  if (*(unsigned char *)&v44)
  {
    *(float *)(v5 + 124) = self->_distanceMeters;
    *(_DWORD *)(v5 + 156) |= 1u;
    $F2F3A8C3CD2C9F51802C978D5302AD1B v44 = self->_flags;
  }
  if ((*(unsigned char *)&v44 & 8) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_legID;
    *(_DWORD *)(v5 + 156) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_66;
  }
  [(GEOCompanionStep *)self readAll:1];
  [v4 readAll:1];
  $F2F3A8C3CD2C9F51802C978D5302AD1B flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 39);
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_stepID != *((_DWORD *)v4 + 37)) {
      goto LABEL_66;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
LABEL_66:
    BOOL v23 = 0;
    goto LABEL_67;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_distance != *((_DWORD *)v4 + 32)) {
      goto LABEL_66;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_66;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_time != *((_DWORD *)v4 + 38)) {
      goto LABEL_66;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_66;
  }
  roadName = self->_roadName;
  if ((unint64_t)roadName | *((void *)v4 + 10) && !-[NSString isEqual:](roadName, "isEqual:")) {
    goto LABEL_66;
  }
  driveStep = self->_driveStep;
  if ((unint64_t)driveStep | *((void *)v4 + 3))
  {
    if (!-[GEOCompanionDriveStep isEqual:](driveStep, "isEqual:")) {
      goto LABEL_66;
    }
  }
  walkStep = self->_walkStep;
  if ((unint64_t)walkStep | *((void *)v4 + 13))
  {
    if (!-[GEOCompanionWalkStep isEqual:](walkStep, "isEqual:")) {
      goto LABEL_66;
    }
  }
  ferryStep = self->_ferryStep;
  if ((unint64_t)ferryStep | *((void *)v4 + 4))
  {
    if (!-[GEOCompanionFerryStep isEqual:](ferryStep, "isEqual:")) {
      goto LABEL_66;
    }
  }
  $F2F3A8C3CD2C9F51802C978D5302AD1B v11 = self->_flags;
  int v12 = *((_DWORD *)v4 + 39);
  if ((*(unsigned char *)&v11 & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_startCoordinateIndex != *((_DWORD *)v4 + 36)) {
      goto LABEL_66;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_66;
  }
  if ((*(unsigned char *)&v11 & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_maneuverStartCoordinateIndex != *((_DWORD *)v4 + 35)) {
      goto LABEL_66;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_66;
  }
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_endCoordinateIndex != *((_DWORD *)v4 + 33)) {
      goto LABEL_66;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_66;
  }
  instructionWithAlternatives = self->_instructionWithAlternatives;
  if ((unint64_t)instructionWithAlternatives | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](instructionWithAlternatives, "isEqual:"))
  {
    goto LABEL_66;
  }
  listInstruction = self->_listInstruction;
  if ((unint64_t)listInstruction | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](listInstruction, "isEqual:")) {
      goto LABEL_66;
    }
  }
  guidanceEvents = self->_guidanceEvents;
  if ((unint64_t)guidanceEvents | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](guidanceEvents, "isEqual:")) {
      goto LABEL_66;
    }
  }
  updateID = self->_updateID;
  if ((unint64_t)updateID | *((void *)v4 + 12))
  {
    if (!-[NSData isEqual:](updateID, "isEqual:")) {
      goto LABEL_66;
    }
  }
  genericStep = self->_genericStep;
  if ((unint64_t)genericStep | *((void *)v4 + 5))
  {
    if (!-[GEOCompanionGenericStep isEqual:](genericStep, "isEqual:")) {
      goto LABEL_66;
    }
  }
  cyclingStep = self->_cyclingStep;
  if ((unint64_t)cyclingStep | *((void *)v4 + 2))
  {
    if (!-[GEOCompanionCyclingStep isEqual:](cyclingStep, "isEqual:")) {
      goto LABEL_66;
    }
  }
  roadDescriptions = self->_roadDescriptions;
  if ((unint64_t)roadDescriptions | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](roadDescriptions, "isEqual:")) {
      goto LABEL_66;
    }
  }
  stopWaypoint = self->_stopWaypoint;
  if ((unint64_t)stopWaypoint | *((void *)v4 + 11))
  {
    if (!-[GEOStopWaypoint isEqual:](stopWaypoint, "isEqual:")) {
      goto LABEL_66;
    }
  }
  $F2F3A8C3CD2C9F51802C978D5302AD1B v21 = self->_flags;
  int v22 = *((_DWORD *)v4 + 39);
  if (*(unsigned char *)&v21)
  {
    if ((v22 & 1) == 0 || self->_distanceMeters != *((float *)v4 + 31)) {
      goto LABEL_66;
    }
  }
  else if (v22)
  {
    goto LABEL_66;
  }
  if ((*(unsigned char *)&v21 & 8) != 0)
  {
    if ((v22 & 8) == 0 || self->_legID != *((_DWORD *)v4 + 34)) {
      goto LABEL_66;
    }
    BOOL v23 = 1;
  }
  else
  {
    BOOL v23 = (*((_DWORD *)v4 + 39) & 8) == 0;
  }
LABEL_67:

  return v23;
}

- (unint64_t)hash
{
  [(GEOCompanionStep *)self readAll:1];
  $F2F3A8C3CD2C9F51802C978D5302AD1B flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
    uint64_t v31 = 0;
    if ((*(unsigned char *)&flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v30 = 0;
    if ((*(unsigned char *)&flags & 0x80) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v31 = 2654435761 * self->_stepID;
  if ((*(unsigned char *)&flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v30 = 2654435761 * self->_distance;
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
LABEL_4:
    uint64_t v29 = 2654435761 * self->_time;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v29 = 0;
LABEL_8:
  NSUInteger v28 = [(NSString *)self->_roadName hash];
  unint64_t v27 = [(GEOCompanionDriveStep *)self->_driveStep hash];
  unint64_t v26 = [(GEOCompanionWalkStep *)self->_walkStep hash];
  unint64_t v25 = [(GEOCompanionFerryStep *)self->_ferryStep hash];
  $F2F3A8C3CD2C9F51802C978D5302AD1B v4 = self->_flags;
  if ((*(unsigned char *)&v4 & 0x20) == 0)
  {
    uint64_t v24 = 0;
    if ((*(unsigned char *)&v4 & 0x10) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v23 = 0;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  uint64_t v24 = 2654435761 * self->_startCoordinateIndex;
  if ((*(unsigned char *)&v4 & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v23 = 2654435761 * self->_maneuverStartCoordinateIndex;
  if ((*(unsigned char *)&v4 & 4) != 0)
  {
LABEL_11:
    uint64_t v5 = [(NSMutableArray *)self->_instructionWithAlternatives hash];
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = [(NSMutableArray *)self->_instructionWithAlternatives hash];
LABEL_15:
  uint64_t v6 = v5;
  NSUInteger v7 = [(NSString *)self->_listInstruction hash];
  uint64_t v8 = [(NSMutableArray *)self->_guidanceEvents hash];
  uint64_t v9 = [(NSData *)self->_updateID hash];
  unint64_t v10 = [(GEOCompanionGenericStep *)self->_genericStep hash];
  unint64_t v11 = [(GEOCompanionCyclingStep *)self->_cyclingStep hash];
  uint64_t v12 = [(NSMutableArray *)self->_roadDescriptions hash];
  unint64_t v13 = [(GEOStopWaypoint *)self->_stopWaypoint hash];
  $F2F3A8C3CD2C9F51802C978D5302AD1B v14 = self->_flags;
  if (*(unsigned char *)&v14)
  {
    float distanceMeters = self->_distanceMeters;
    double v17 = distanceMeters;
    if (distanceMeters < 0.0) {
      double v17 = -distanceMeters;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if ((*(unsigned char *)&v14 & 8) != 0) {
    uint64_t v20 = 2654435761 * self->_legID;
  }
  else {
    uint64_t v20 = 0;
  }
  return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x40) != 0)
  {
    self->_stepID = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_flags |= 0x40u;
    int v5 = *((_DWORD *)v4 + 39);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_distance = *((_DWORD *)v4 + 32);
  *(_DWORD *)&self->_flags |= 2u;
  if ((*((_DWORD *)v4 + 39) & 0x80) != 0)
  {
LABEL_4:
    self->_time = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_flags |= 0x80u;
  }
LABEL_5:
  if (*((void *)v4 + 10)) {
    -[GEOCompanionStep setRoadName:](self, "setRoadName:");
  }
  driveStep = self->_driveStep;
  uint64_t v7 = *((void *)v4 + 3);
  if (driveStep)
  {
    if (v7) {
      -[GEOCompanionDriveStep mergeFrom:](driveStep, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOCompanionStep setDriveStep:](self, "setDriveStep:");
  }
  walkStep = self->_walkStep;
  uint64_t v9 = *((void *)v4 + 13);
  if (walkStep)
  {
    if (v9) {
      -[GEOCompanionWalkStep mergeFrom:](walkStep, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOCompanionStep setWalkStep:](self, "setWalkStep:");
  }
  ferryStep = self->_ferryStep;
  uint64_t v11 = *((void *)v4 + 4);
  if (ferryStep)
  {
    if (v11) {
      -[GEOCompanionFerryStep mergeFrom:](ferryStep, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOCompanionStep setFerryStep:](self, "setFerryStep:");
  }
  int v12 = *((_DWORD *)v4 + 39);
  if ((v12 & 0x20) != 0)
  {
    self->_startCoordinateIndex = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_flags |= 0x20u;
    int v12 = *((_DWORD *)v4 + 39);
    if ((v12 & 0x10) == 0)
    {
LABEL_27:
      if ((v12 & 4) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((v12 & 0x10) == 0)
  {
    goto LABEL_27;
  }
  self->_maneuverStartCoordinateIndex = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_flags |= 0x10u;
  if ((*((_DWORD *)v4 + 39) & 4) != 0)
  {
LABEL_28:
    self->_endCoordinateIndex = *((_DWORD *)v4 + 33);
    *(_DWORD *)&self->_flags |= 4u;
  }
LABEL_29:
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v13 = *((id *)v4 + 7);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v13);
        }
        [(GEOCompanionStep *)self addInstructionWithAlternatives:*(void *)(*((void *)&v43 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v15);
  }

  if (*((void *)v4 + 8)) {
    -[GEOCompanionStep setListInstruction:](self, "setListInstruction:");
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v18 = *((id *)v4 + 6);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v18);
        }
        [(GEOCompanionStep *)self addGuidanceEvent:*(void *)(*((void *)&v39 + 1) + 8 * j)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v20);
  }

  if (*((void *)v4 + 12)) {
    -[GEOCompanionStep setUpdateID:](self, "setUpdateID:");
  }
  genericStep = self->_genericStep;
  uint64_t v24 = *((void *)v4 + 5);
  if (genericStep)
  {
    if (v24) {
      -[GEOCompanionGenericStep mergeFrom:](genericStep, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[GEOCompanionStep setGenericStep:](self, "setGenericStep:");
  }
  cyclingStep = self->_cyclingStep;
  uint64_t v26 = *((void *)v4 + 2);
  if (cyclingStep)
  {
    if (v26) {
      -[GEOCompanionCyclingStep mergeFrom:](cyclingStep, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[GEOCompanionStep setCyclingStep:](self, "setCyclingStep:");
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v27 = *((id *)v4 + 9);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(v27);
        }
        -[GEOCompanionStep addRoadDescriptions:](self, "addRoadDescriptions:", *(void *)(*((void *)&v35 + 1) + 8 * k), (void)v35);
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v29);
  }

  stopWaypoint = self->_stopWaypoint;
  uint64_t v33 = *((void *)v4 + 11);
  if (stopWaypoint)
  {
    if (v33) {
      -[GEOStopWaypoint mergeFrom:](stopWaypoint, "mergeFrom:");
    }
  }
  else if (v33)
  {
    -[GEOCompanionStep setStopWaypoint:](self, "setStopWaypoint:");
  }
  int v34 = *((_DWORD *)v4 + 39);
  if (v34)
  {
    self->_float distanceMeters = *((float *)v4 + 31);
    *(_DWORD *)&self->_flags |= 1u;
    int v34 = *((_DWORD *)v4 + 39);
  }
  if ((v34 & 8) != 0)
  {
    self->_legID = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_flags |= 8u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkStep, 0);
  objc_storeStrong((id *)&self->_updateID, 0);
  objc_storeStrong((id *)&self->_stopWaypoint, 0);
  objc_storeStrong((id *)&self->_roadName, 0);
  objc_storeStrong((id *)&self->_roadDescriptions, 0);
  objc_storeStrong((id *)&self->_listInstruction, 0);
  objc_storeStrong((id *)&self->_instructionWithAlternatives, 0);
  objc_storeStrong((id *)&self->_guidanceEvents, 0);
  objc_storeStrong((id *)&self->_genericStep, 0);
  objc_storeStrong((id *)&self->_ferryStep, 0);
  objc_storeStrong((id *)&self->_driveStep, 0);
  objc_storeStrong((id *)&self->_cyclingStep, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3 >= 6)
  {
    [(GEOCompanionStep *)self hasCyclingStep];
    goto LABEL_20;
  }
  if ([(GEOCompanionStep *)self hasDriveStep])
  {
    int v5 = [(GEOCompanionStep *)self driveStep];
    int v6 = [v5 maneuverType];

    if (v6 == 88)
    {
      uint64_t v7 = [(GEOCompanionStep *)self driveStep];
      uint64_t v8 = (void *)[v7 copy];

      [v8 setManeuverType:4];
      [(GEOCompanionStep *)self setDriveStep:v8];
LABEL_12:

      goto LABEL_13;
    }
  }
  if ([(GEOCompanionStep *)self hasWalkStep])
  {
    uint64_t v9 = [(GEOCompanionStep *)self walkStep];
    int v10 = [v9 maneuverType];

    if (v10 == 88)
    {
      uint64_t v11 = [(GEOCompanionStep *)self walkStep];
      uint64_t v8 = (void *)[v11 copy];

      [v8 setManeuverType:4];
      [(GEOCompanionStep *)self setWalkStep:v8];
      goto LABEL_12;
    }
  }
  if ([(GEOCompanionStep *)self hasCyclingStep])
  {
    int v12 = [(GEOCompanionStep *)self cyclingStep];
    int v13 = [v12 maneuverType];

    if (v13 == 88)
    {
      uint64_t v14 = [(GEOCompanionStep *)self cyclingStep];
      uint64_t v8 = (void *)[v14 copy];

      [v8 setManeuverType:4];
      [(GEOCompanionStep *)self setCyclingStep:v8];
      goto LABEL_12;
    }
  }
LABEL_13:
  BOOL v15 = [(GEOCompanionStep *)self hasCyclingStep];
  if (a3 <= 3 && v15)
  {
    uint64_t v16 = GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      double v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      int v30 = 138412802;
      uint64_t v31 = v18;
      __int16 v32 = 2048;
      uint64_t v33 = self;
      __int16 v34 = 2048;
      unint64_t v35 = a3;
      _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEBUG, "%@<%p> is not compatible with protocol version %lu", (uint8_t *)&v30, 0x20u);
    }
    uint64_t v19 = GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      int v30 = 138412546;
      uint64_t v31 = v21;
      __int16 v32 = 2048;
      uint64_t v33 = self;
      _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_INFO, "%@<%p> | Converting to generic step", (uint8_t *)&v30, 0x16u);
    }
    uint64_t v22 = [(GEOCompanionStep *)self cyclingStep];
    uint64_t v23 = +[GEOCompanionGenericStep genericStepForCyclingStep:v22 protocolVersion:a3];

    [(GEOCompanionStep *)self setCyclingStep:0];
    [(GEOCompanionStep *)self setGenericStep:v23];
    uint64_t v24 = self;

    goto LABEL_23;
  }
LABEL_20:
  unint64_t v25 = GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = (objc_class *)objc_opt_class();
    id v27 = NSStringFromClass(v26);
    int v30 = 138412802;
    uint64_t v31 = v27;
    __int16 v32 = 2048;
    uint64_t v33 = self;
    __int16 v34 = 2048;
    unint64_t v35 = a3;
    _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", (uint8_t *)&v30, 0x20u);
  }
  uint64_t v28 = self;
LABEL_23:

  return self;
}

- (GEOCompanionStep)initWithStep:(id)a3 route:(id)a4 stringFormatter:(id)a5
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v77.receiver = self;
  v77.super_class = (Class)GEOCompanionStep;
  uint64_t v11 = [(GEOCompanionStep *)&v77 init];
  if (v11)
  {
    -[GEOCompanionStep setStepID:](v11, "setStepID:", [v8 stepIndex]);
    -[GEOCompanionStep setLegID:](v11, "setLegID:", objc_msgSend(v9, "legIndexForStepIndex:", objc_msgSend(v8, "stepIndex")));
    int v12 = [v8 transitStep];
    int v13 = [v12 updateIdentifier];
    [(GEOCompanionStep *)v11 setUpdateID:v13];

    [v8 distance];
    LODWORD(v15) = vcvtad_u64_f64(v14);
    [(GEOCompanionStep *)v11 setDistance:v15];
    [v8 distance];
    *(float *)&double v16 = v16;
    [(GEOCompanionStep *)v11 setDistanceMeters:v16];
    -[GEOCompanionStep setTime:](v11, "setTime:", [v8 duration]);
    -[GEOCompanionStep setStartCoordinateIndex:](v11, "setStartCoordinateIndex:", [v8 startPointIndex]);
    -[GEOCompanionStep setManeuverStartCoordinateIndex:](v11, "setManeuverStartCoordinateIndex:", [v8 maneuverStartPointIndex]);
    -[GEOCompanionStep setEndCoordinateIndex:](v11, "setEndCoordinateIndex:", [v8 endPointIndex]);
    double v17 = [v8 geoStep];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v18 = [v9 legs];
    id v19 = (id)[v18 countByEnumeratingWithState:&v73 objects:v78 count:16];
    if (v19)
    {
      uint64_t v68 = v17;
      id v20 = v10;
      id v21 = v9;
      uint64_t v22 = *(void *)v74;
      while (2)
      {
        for (uint64_t i = 0; i != v19; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v74 != v22) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          unsigned int v25 = [(GEOCompanionStep *)v11 stepID];
          if ([v24 startStepIndex] <= (unint64_t)v25)
          {
            unsigned int v26 = [(GEOCompanionStep *)v11 stepID];
            if ([v24 endStepIndex] >= (unint64_t)v26)
            {
              id v19 = v24;
              goto LABEL_13;
            }
          }
        }
        id v19 = (id)[v18 countByEnumeratingWithState:&v73 objects:v78 count:16];
        if (v19) {
          continue;
        }
        break;
      }
LABEL_13:
      id v9 = v21;
      id v10 = v20;
      double v17 = v68;
    }

    id v27 = [v17 guidanceEvents];
    [(GEOCompanionStep *)v11 setGuidanceEvents:v27];

    uint64_t v28 = [v17 roadDescriptions];
    [(GEOCompanionStep *)v11 setRoadDescriptions:v28];

    uint64_t v29 = [v17 stopWaypoint];
    [(GEOCompanionStep *)v11 setStopWaypoint:v29];

    switch([v8 routeSegmentType])
    {
      case 1:
        int v30 = objc_alloc_init(GEOCompanionDriveStep);
        if ([v17 hasManeuverType]) {
          -[GEOCompanionDriveStep setManeuverType:](v30, "setManeuverType:", [v17 maneuverType]);
        }
        uint64_t v31 = [v17 maneuverNames];
        __int16 v32 = (void *)[v31 mutableCopy];
        [(GEOCompanionDriveStep *)v30 setManeuverNames:v32];

        uint64_t v33 = [v17 signposts];
        __int16 v34 = (void *)[v33 mutableCopy];
        [(GEOCompanionDriveStep *)v30 setSignposts:v34];

        if ([v17 hasToFreeway]) {
          -[GEOCompanionDriveStep setToFreeway:](v30, "setToFreeway:", [v17 toFreeway]);
        }
        if ([v17 hasExitNumber])
        {
          unint64_t v35 = [v17 exitNumber];
          [(GEOCompanionDriveStep *)v30 setExitNumber:v35];
        }
        if ([v17 hasJunctionType]) {
          -[GEOCompanionDriveStep setJunctionType:](v30, "setJunctionType:", [v17 junctionType]);
        }
        if ([v17 junctionElementsCount]) {
          -[GEOCompanionDriveStep setJunctionElements:count:](v30, "setJunctionElements:count:", [v17 junctionElements], objc_msgSend(v17, "junctionElementsCount"));
        }
        -[GEOCompanionDriveStep setDrivingSide:](v30, "setDrivingSide:", [v8 drivingSide]);
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __72__GEOCompanionStep_CompanionExtras__initWithStep_route_stringFormatter___block_invoke;
        v71[3] = &unk_1E53E5978;
        uint64_t v36 = v30;
        v72 = v36;
        [v17 shieldInfo:v71];
        if ([v17 hasArtworkOverride])
        {
          long long v37 = [v17 artworkOverride];
          [(GEOCompanionWalkStep *)v36 setArtworkOverride:v37];
        }
        if ([v17 hasEvInfo])
        {
          long long v38 = [v17 evInfo];
          [(GEOCompanionWalkStep *)v36 setEvInfo:v38];
        }
        if ([v17 maneuverType] == 82
          || [v17 maneuverType] == 83
          || [v17 maneuverType] == 84)
        {
          long long v39 = [v19 destination];
          long long v40 = [v39 chargingInfo];

          if (v40)
          {
            long long v41 = objc_opt_new();
            [v40 chargingTime];
            [v41 setChargingTime:v42];
            [v41 setGainedBatteryPercentage:0.0];
            [v41 setGainedBatteryCharge:0];
            [v41 setGainedTravelRange:0];
            [(GEOCompanionWalkStep *)v36 setChargingInfo:v41];
          }
        }
        [(GEOCompanionStep *)v11 setDriveStep:v36];
        long long v43 = v72;
        goto LABEL_68;
      case 2:
        uint64_t v36 = objc_alloc_init(GEOCompanionWalkStep);
        if ([v17 hasManeuverType]) {
          -[GEOCompanionWalkStep setManeuverType:](v36, "setManeuverType:", [v17 maneuverType]);
        }
        long long v48 = [v17 maneuverNames];
        long long v49 = (void *)[v48 mutableCopy];
        [(GEOCompanionWalkStep *)v36 setManeuverNames:v49];

        uint64_t v50 = [v17 signposts];
        long long v51 = (void *)[v50 mutableCopy];
        [(GEOCompanionWalkStep *)v36 setSignposts:v51];

        if ([v17 hasJunctionType]) {
          -[GEOCompanionWalkStep setJunctionType:](v36, "setJunctionType:", [v17 junctionType]);
        }
        if ([v17 junctionElementsCount]) {
          -[GEOCompanionWalkStep setJunctionElements:count:](v36, "setJunctionElements:count:", [v17 junctionElements], objc_msgSend(v17, "junctionElementsCount"));
        }
        if ([v17 hasArtworkOverride])
        {
          long long v52 = [v17 artworkOverride];
          [(GEOCompanionWalkStep *)v36 setArtworkOverride:v52];
        }
        [(GEOCompanionStep *)v11 setWalkStep:v36];
        goto LABEL_69;
      case 3:
        uint64_t v36 = objc_alloc_init(GEOCompanionFerryStep);
        if ([v17 hasManeuverType]) {
          -[GEOCompanionWalkStep setManeuverType:](v36, "setManeuverType:", [v17 maneuverType]);
        }
        long long v53 = [v17 artworkOverride];
        [(GEOCompanionWalkStep *)v36 setArtworkOverride:v53];

        [(GEOCompanionStep *)v11 setFerryStep:v36];
        goto LABEL_69;
      case 4:
        long long v54 = objc_alloc_init(GEOCompanionCyclingStep);
        if ([v17 hasManeuverType]) {
          -[GEOCompanionCyclingStep setManeuverType:](v54, "setManeuverType:", [v17 maneuverType]);
        }
        long long v55 = [v17 maneuverNames];
        long long v56 = (void *)[v55 mutableCopy];
        [(GEOCompanionCyclingStep *)v54 setManeuverNames:v56];

        long long v57 = [v17 signposts];
        uint64_t v58 = (void *)[v57 mutableCopy];
        [(GEOCompanionCyclingStep *)v54 setSignposts:v58];

        if ([v17 hasToFreeway]) {
          -[GEOCompanionCyclingStep setToFreeway:](v54, "setToFreeway:", [v17 toFreeway]);
        }
        if ([v17 hasExitNumber])
        {
          uint64_t v59 = [v17 exitNumber];
          [(GEOCompanionCyclingStep *)v54 setExitNumber:v59];
        }
        if ([v17 hasJunctionType]) {
          -[GEOCompanionCyclingStep setJunctionType:](v54, "setJunctionType:", [v17 junctionType]);
        }
        if ([v17 junctionElementsCount]) {
          -[GEOCompanionCyclingStep setJunctionElements:count:](v54, "setJunctionElements:count:", [v17 junctionElements], objc_msgSend(v17, "junctionElementsCount"));
        }
        -[GEOCompanionCyclingStep setDrivingSide:](v54, "setDrivingSide:", [v8 drivingSide]);
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __72__GEOCompanionStep_CompanionExtras__initWithStep_route_stringFormatter___block_invoke_2;
        v69[3] = &unk_1E53E5978;
        uint64_t v36 = v54;
        uint64_t v70 = v36;
        [v17 shieldInfo:v69];
        if ([v17 hasArtworkOverride])
        {
          uint64_t v60 = [v17 artworkOverride];
          [(GEOCompanionWalkStep *)v36 setArtworkOverride:v60];
        }
        [(GEOCompanionStep *)v11 setCyclingStep:v36];
        long long v43 = v70;
LABEL_68:

        goto LABEL_69;
      case 5:
      case 6:
        goto LABEL_70;
      default:
        uint64_t v36 = objc_alloc_init(GEOCompanionGenericStep);
        -[GEOCompanionWalkStep setTransportType:](v36, "setTransportType:", [v8 transportType]);
        if ([v17 hasManeuverType]) {
          -[GEOCompanionWalkStep setManeuverType:](v36, "setManeuverType:", [v17 maneuverType]);
        }
        long long v44 = [v17 maneuverNames];
        long long v45 = (void *)[v44 mutableCopy];
        [(GEOCompanionWalkStep *)v36 setManeuverNames:v45];

        long long v46 = [v17 signposts];
        long long v47 = (void *)[v46 mutableCopy];
        [(GEOCompanionWalkStep *)v36 setSignposts:v47];

        if ([v17 hasJunctionType]) {
          -[GEOCompanionWalkStep setJunctionType:](v36, "setJunctionType:", [v17 junctionType]);
        }
        if ([v17 junctionElementsCount]) {
          -[GEOCompanionWalkStep setJunctionElements:count:](v36, "setJunctionElements:count:", [v17 junctionElements], objc_msgSend(v17, "junctionElementsCount"));
        }
        [(GEOCompanionStep *)v11 setGenericStep:v36];
LABEL_69:

LABEL_70:
        uint64_t v61 = [v17 roadName];
        if (v61) {
          [(GEOCompanionStep *)v11 setRoadName:v61];
        }
        uint64_t v62 = [v10 listInstructionForStep:v8];
        long long v63 = (void *)[v62 mutableCopy];
        [(GEOCompanionStep *)v11 setListInstruction:v63];

        uint64_t v64 = [v10 signInstructionsForStep:v8];
        long long v65 = (void *)[v64 mutableCopy];
        [(GEOCompanionStep *)v11 setInstructionWithAlternatives:v65];

        long long v66 = v11;
        break;
    }
  }

  return v11;
}

void __72__GEOCompanionStep_CompanionExtras__initWithStep_route_stringFormatter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    int v5 = *(void **)(a1 + 32);
    id v6 = a3;
    [v5 setShieldType:a2];
    id v7 = (id)[v6 copy];

    [*(id *)(a1 + 32) setShield:v7];
  }
}

void __72__GEOCompanionStep_CompanionExtras__initWithStep_route_stringFormatter___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    int v5 = *(void **)(a1 + 32);
    id v6 = a3;
    [v5 setShieldType:a2];
    id v7 = (id)[v6 copy];

    [*(id *)(a1 + 32) setShield:v7];
  }
}

- (id)maneuverStep
{
  if ([(GEOCompanionStep *)self hasDriveStep])
  {
    BOOL v3 = [(GEOCompanionStep *)self driveStep];
  }
  else if ([(GEOCompanionStep *)self hasWalkStep])
  {
    BOOL v3 = [(GEOCompanionStep *)self walkStep];
  }
  else if ([(GEOCompanionStep *)self hasCyclingStep])
  {
    BOOL v3 = [(GEOCompanionStep *)self cyclingStep];
  }
  else if ([(GEOCompanionStep *)self hasFerryStep])
  {
    BOOL v3 = [(GEOCompanionStep *)self ferryStep];
  }
  else if ([(GEOCompanionStep *)self hasGenericStep])
  {
    BOOL v3 = [(GEOCompanionStep *)self genericStep];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)geoStep
{
  BOOL v3 = objc_alloc_init(GEOStep);
  [(GEOStep *)v3 setStepID:[(GEOCompanionStep *)self stepID]];
  if ([(GEOStep *)v3 hasDistanceMeters])
  {
    [(GEOStep *)v3 distanceMeters];
    float v6 = v5;
  }
  else
  {
    float v6 = (float)[(GEOStep *)v3 distance];
  }
  LODWORD(v4) = vcvtas_u32_f32(v6);
  [(GEOStep *)v3 setDistance:v4];
  *(float *)&double v7 = v6;
  [(GEOStep *)v3 setDistanceMeters:v7];
  [(GEOStep *)v3 setExpectedTime:[(GEOCompanionStep *)self time]];
  [(GEOStep *)v3 setManeuverEndBasicIndex:[(GEOCompanionStep *)self endCoordinateIndex]];
  id v8 = [(GEOCompanionStep *)self roadDescriptions];
  id v9 = (void *)[v8 mutableCopy];
  [(GEOStep *)v3 setRoadDescriptions:v9];

  id v10 = [(GEOCompanionStep *)self stopWaypoint];
  [(GEOStep *)v3 setStopWaypoint:v10];

  uint64_t v11 = [(GEOCompanionStep *)self maneuverStep];
  int v12 = v11;
  if (v11)
  {
    if ([v11 hasManeuverType]) {
      -[GEOStep setManeuverType:](v3, "setManeuverType:", [v12 maneuverType]);
    }
    int v13 = [v12 maneuverNames];
    double v14 = (void *)[v13 mutableCopy];
    [(GEOStep *)v3 setManeuverNames:v14];

    uint64_t v15 = [v12 signposts];
    double v16 = (void *)[v15 mutableCopy];
    [(GEOStep *)v3 setSignposts:v16];

    if ([v12 hasJunctionType]) {
      -[GEOStep setJunctionType:](v3, "setJunctionType:", [v12 junctionType]);
    }
    -[GEOStep setJunctionElements:count:](v3, "setJunctionElements:count:", [v12 junctionElements], objc_msgSend(v12, "junctionElementsCount"));
    double v17 = [(GEOCompanionStep *)self driveStep];
    id v18 = v17;
    if (v17)
    {
      if ([v17 hasExitNumber])
      {
        id v19 = [v18 exitNumber];
        id v20 = (void *)[v19 copy];
        [(GEOStep *)v3 setExitNumber:v20];
      }
      if ([v18 hasToFreeway]) {
        -[GEOStep setToFreeway:](v3, "setToFreeway:", [v18 toFreeway]);
      }
      if ([v18 drivingSide]) {
        -[GEOStep setOverrideDrivingSide:](v3, "setOverrideDrivingSide:", [v18 drivingSide]);
      }
      if ([v18 hasChargingInfo])
      {
        id v21 = [v18 chargingInfo];
        [(GEOStep *)v3 setChargingInfo:v21];
      }
      if ([v18 hasEvInfo])
      {
        uint64_t v22 = [v18 evInfo];
        [(GEOStep *)v3 setEvInfo:v22];
      }
    }
    uint64_t v23 = [(GEOCompanionStep *)self driveStep];
    uint64_t v24 = [v23 artworkOverride];
    if (v24)
    {
      [(GEOStep *)v3 setArtworkOverride:v24];
    }
    else
    {
      unsigned int v25 = [(GEOCompanionStep *)self walkStep];
      unsigned int v26 = [v25 artworkOverride];
      if (v26)
      {
        [(GEOStep *)v3 setArtworkOverride:v26];
      }
      else
      {
        id v27 = [(GEOCompanionStep *)self ferryStep];
        uint64_t v28 = [v27 artworkOverride];
        [(GEOStep *)v3 setArtworkOverride:v28];
      }
    }
  }
  uint64_t v29 = [(GEOCompanionStep *)self guidanceEvents];
  int v30 = (void *)[v29 mutableCopy];
  [(GEOStep *)v3 setGuidanceEvents:v30];

  uint64_t v31 = [(GEOCompanionStep *)self listInstruction];
  __int16 v32 = (void *)[v31 copy];
  [(GEOStep *)v3 setInstructions:v32];

  return v3;
}

@end