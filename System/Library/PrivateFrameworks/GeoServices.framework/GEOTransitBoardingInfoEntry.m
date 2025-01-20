@interface GEOTransitBoardingInfoEntry
+ (BOOL)isValid:(id)a3;
- (BOOL)clearExitPlanInfo;
- (BOOL)hasAlternativeText;
- (BOOL)hasAlternativeTimeInstruction;
- (BOOL)hasClearExitPlanInfo;
- (BOOL)hasExitPlanInfoOverride;
- (BOOL)hasExpectedDepartureTime;
- (BOOL)hasMainText;
- (BOOL)hasMainTimeInstruction;
- (BOOL)hasOccupancyInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)alternativeText;
- (GEOFormattedString)mainText;
- (GEOTransitBoardingInfoEntry)init;
- (GEOTransitBoardingInfoEntry)initWithData:(id)a3;
- (GEOTransitBoardingInfoEntry)initWithDictionary:(id)a3;
- (GEOTransitBoardingInfoEntry)initWithJSON:(id)a3;
- (GEOTransitExitPlanInfo)exitPlanInfoOverride;
- (GEOTransitListTimeInstruction)alternativeTimeInstruction;
- (GEOTransitListTimeInstruction)mainTimeInstruction;
- (GEOTransitOccupancyInfo)occupancyInfo;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)expectedDepartureTime;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAlternativeText;
- (void)_readAlternativeTimeInstruction;
- (void)_readExitPlanInfoOverride;
- (void)_readMainText;
- (void)_readMainTimeInstruction;
- (void)_readOccupancyInfo;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAlternativeText:(id)a3;
- (void)setAlternativeTimeInstruction:(id)a3;
- (void)setClearExitPlanInfo:(BOOL)a3;
- (void)setExitPlanInfoOverride:(id)a3;
- (void)setExpectedDepartureTime:(unsigned int)a3;
- (void)setHasClearExitPlanInfo:(BOOL)a3;
- (void)setHasExpectedDepartureTime:(BOOL)a3;
- (void)setMainText:(id)a3;
- (void)setMainTimeInstruction:(id)a3;
- (void)setOccupancyInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitBoardingInfoEntry

- (GEOTransitBoardingInfoEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitBoardingInfoEntry;
  v2 = [(GEOTransitBoardingInfoEntry *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitBoardingInfoEntry)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitBoardingInfoEntry;
  v3 = [(GEOTransitBoardingInfoEntry *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)expectedDepartureTime
{
  return self->_expectedDepartureTime;
}

- (void)setExpectedDepartureTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_expectedDepartureTime = a3;
}

- (void)setHasExpectedDepartureTime:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasExpectedDepartureTime
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readMainText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMainText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasMainText
{
  return self->_mainText != 0;
}

- (GEOFormattedString)mainText
{
  -[GEOTransitBoardingInfoEntry _readMainText]((uint64_t)self);
  mainText = self->_mainText;

  return mainText;
}

- (void)setMainText:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_mainText, a3);
}

- (void)_readAlternativeText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlternativeText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAlternativeText
{
  return self->_alternativeText != 0;
}

- (GEOFormattedString)alternativeText
{
  -[GEOTransitBoardingInfoEntry _readAlternativeText]((uint64_t)self);
  alternativeText = self->_alternativeText;

  return alternativeText;
}

- (void)setAlternativeText:(id)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  objc_storeStrong((id *)&self->_alternativeText, a3);
}

- (void)_readMainTimeInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMainTimeInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasMainTimeInstruction
{
  return self->_mainTimeInstruction != 0;
}

- (GEOTransitListTimeInstruction)mainTimeInstruction
{
  -[GEOTransitBoardingInfoEntry _readMainTimeInstruction]((uint64_t)self);
  mainTimeInstruction = self->_mainTimeInstruction;

  return mainTimeInstruction;
}

- (void)setMainTimeInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_mainTimeInstruction, a3);
}

- (void)_readAlternativeTimeInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlternativeTimeInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAlternativeTimeInstruction
{
  return self->_alternativeTimeInstruction != 0;
}

- (GEOTransitListTimeInstruction)alternativeTimeInstruction
{
  -[GEOTransitBoardingInfoEntry _readAlternativeTimeInstruction]((uint64_t)self);
  alternativeTimeInstruction = self->_alternativeTimeInstruction;

  return alternativeTimeInstruction;
}

- (void)setAlternativeTimeInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_alternativeTimeInstruction, a3);
}

- (void)_readOccupancyInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOccupancyInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasOccupancyInfo
{
  return self->_occupancyInfo != 0;
}

- (GEOTransitOccupancyInfo)occupancyInfo
{
  -[GEOTransitBoardingInfoEntry _readOccupancyInfo]((uint64_t)self);
  occupancyInfo = self->_occupancyInfo;

  return occupancyInfo;
}

- (void)setOccupancyInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_occupancyInfo, a3);
}

- (void)_readExitPlanInfoOverride
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExitPlanInfoOverride_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasExitPlanInfoOverride
{
  return self->_exitPlanInfoOverride != 0;
}

- (GEOTransitExitPlanInfo)exitPlanInfoOverride
{
  -[GEOTransitBoardingInfoEntry _readExitPlanInfoOverride]((uint64_t)self);
  exitPlanInfoOverride = self->_exitPlanInfoOverride;

  return exitPlanInfoOverride;
}

- (void)setExitPlanInfoOverride:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_exitPlanInfoOverride, a3);
}

- (BOOL)clearExitPlanInfo
{
  return self->_clearExitPlanInfo;
}

- (void)setClearExitPlanInfo:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_clearExitPlanInfo = a3;
}

- (void)setHasClearExitPlanInfo:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasClearExitPlanInfo
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitBoardingInfoEntry;
  v4 = [(GEOTransitBoardingInfoEntry *)&v8 description];
  v5 = [(GEOTransitBoardingInfoEntry *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitBoardingInfoEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(_WORD *)(a1 + 92))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
      if (a2) {
        objc_super v6 = @"expectedDepartureTime";
      }
      else {
        objc_super v6 = @"expected_departure_time";
      }
      [v4 setObject:v5 forKey:v6];
    }
    objc_super v7 = [(id)a1 mainText];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"mainText";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"main_text";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = [(id)a1 alternativeText];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"alternativeText";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"alternative_text";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [(id)a1 mainTimeInstruction];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"mainTimeInstruction";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"main_time_instruction";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = [(id)a1 alternativeTimeInstruction];
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"alternativeTimeInstruction";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"alternative_time_instruction";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = [(id)a1 occupancyInfo];
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"occupancyInfo";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"occupancy_info";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = [(id)a1 exitPlanInfoOverride];
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 jsonRepresentation];
        v30 = @"exitPlanInfoOverride";
      }
      else
      {
        v29 = [v27 dictionaryRepresentation];
        v30 = @"exit_plan_info_override";
      }
      [v4 setObject:v29 forKey:v30];
    }
    if ((*(_WORD *)(a1 + 92) & 2) != 0)
    {
      v31 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 88)];
      if (a2) {
        v32 = @"clearExitPlanInfo";
      }
      else {
        v32 = @"clear_exit_plan_info";
      }
      [v4 setObject:v31 forKey:v32];
    }
    v33 = *(void **)(a1 + 16);
    if (v33)
    {
      v34 = [v33 dictionaryRepresentation];
      v35 = v34;
      if (a2)
      {
        v36 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __57__GEOTransitBoardingInfoEntry__dictionaryRepresentation___block_invoke;
        v40[3] = &unk_1E53D8860;
        id v37 = v36;
        id v41 = v37;
        [v35 enumerateKeysAndObjectsUsingBlock:v40];
        id v38 = v37;

        v35 = v38;
      }
      [v4 setObject:v35 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitBoardingInfoEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOTransitBoardingInfoEntry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitBoardingInfoEntry)initWithDictionary:(id)a3
{
  return (GEOTransitBoardingInfoEntry *)-[GEOTransitBoardingInfoEntry _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"expectedDepartureTime";
      }
      else {
        objc_super v6 = @"expected_departure_time";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setExpectedDepartureTime:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"mainText";
      }
      else {
        objc_super v8 = @"main_text";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v11 = [(GEOFormattedString *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOFormattedString *)v10 initWithDictionary:v9];
        }
        v12 = (void *)v11;
        [a1 setMainText:v11];
      }
      if (a3) {
        v13 = @"alternativeText";
      }
      else {
        v13 = @"alternative_text";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v16 = [(GEOFormattedString *)v15 initWithJSON:v14];
        }
        else {
          uint64_t v16 = [(GEOFormattedString *)v15 initWithDictionary:v14];
        }
        v17 = (void *)v16;
        [a1 setAlternativeText:v16];
      }
      if (a3) {
        v18 = @"mainTimeInstruction";
      }
      else {
        v18 = @"main_time_instruction";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [GEOTransitListTimeInstruction alloc];
        if (a3) {
          uint64_t v21 = [(GEOTransitListTimeInstruction *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEOTransitListTimeInstruction *)v20 initWithDictionary:v19];
        }
        v22 = (void *)v21;
        [a1 setMainTimeInstruction:v21];
      }
      if (a3) {
        v23 = @"alternativeTimeInstruction";
      }
      else {
        v23 = @"alternative_time_instruction";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [GEOTransitListTimeInstruction alloc];
        if (a3) {
          uint64_t v26 = [(GEOTransitListTimeInstruction *)v25 initWithJSON:v24];
        }
        else {
          uint64_t v26 = [(GEOTransitListTimeInstruction *)v25 initWithDictionary:v24];
        }
        v27 = (void *)v26;
        [a1 setAlternativeTimeInstruction:v26];
      }
      if (a3) {
        v28 = @"occupancyInfo";
      }
      else {
        v28 = @"occupancy_info";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = [GEOTransitOccupancyInfo alloc];
        if (a3) {
          uint64_t v31 = [(GEOTransitOccupancyInfo *)v30 initWithJSON:v29];
        }
        else {
          uint64_t v31 = [(GEOTransitOccupancyInfo *)v30 initWithDictionary:v29];
        }
        v32 = (void *)v31;
        [a1 setOccupancyInfo:v31];
      }
      if (a3) {
        v33 = @"exitPlanInfoOverride";
      }
      else {
        v33 = @"exit_plan_info_override";
      }
      v34 = [v5 objectForKeyedSubscript:v33];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = [GEOTransitExitPlanInfo alloc];
        if (a3) {
          uint64_t v36 = [(GEOTransitExitPlanInfo *)v35 initWithJSON:v34];
        }
        else {
          uint64_t v36 = [(GEOTransitExitPlanInfo *)v35 initWithDictionary:v34];
        }
        id v37 = (void *)v36;
        [a1 setExitPlanInfoOverride:v36];
      }
      if (a3) {
        id v38 = @"clearExitPlanInfo";
      }
      else {
        id v38 = @"clear_exit_plan_info";
      }
      v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setClearExitPlanInfo:", objc_msgSend(v39, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOTransitBoardingInfoEntry)initWithJSON:(id)a3
{
  return (GEOTransitBoardingInfoEntry *)-[GEOTransitBoardingInfoEntry _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_387;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_388;
    }
    GEOTransitBoardingInfoEntryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitBoardingInfoEntryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitBoardingInfoEntryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitBoardingInfoEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitBoardingInfoEntryIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitBoardingInfoEntry *)self readAll:0];
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    id v5 = v8;
    if (self->_mainText)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_alternativeText)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_mainTimeInstruction)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_alternativeTimeInstruction)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_occupancyInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_exitPlanInfoOverride)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOTransitBoardingInfoEntry *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 18) = self->_readerMarkPos;
  *((_DWORD *)v4 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v4 + 21) = self->_expectedDepartureTime;
    *((_WORD *)v4 + 46) |= 1u;
  }
  if (self->_mainText) {
    objc_msgSend(v4, "setMainText:");
  }
  if (self->_alternativeText) {
    objc_msgSend(v4, "setAlternativeText:");
  }
  if (self->_mainTimeInstruction) {
    objc_msgSend(v4, "setMainTimeInstruction:");
  }
  if (self->_alternativeTimeInstruction) {
    objc_msgSend(v4, "setAlternativeTimeInstruction:");
  }
  if (self->_occupancyInfo) {
    objc_msgSend(v4, "setOccupancyInfo:");
  }
  if (self->_exitPlanInfoOverride) {
    objc_msgSend(v4, "setExitPlanInfoOverride:");
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v4 + 88) = self->_clearExitPlanInfo;
    *((_WORD *)v4 + 46) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTransitBoardingInfoEntryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitBoardingInfoEntry *)self readAll:0];
  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 84) = self->_expectedDepartureTime;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  id v9 = [(GEOFormattedString *)self->_mainText copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  id v11 = [(GEOFormattedString *)self->_alternativeText copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  id v13 = [(GEOTransitListTimeInstruction *)self->_mainTimeInstruction copyWithZone:a3];
  v14 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v13;

  id v15 = [(GEOTransitListTimeInstruction *)self->_alternativeTimeInstruction copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  id v17 = [(GEOTransitOccupancyInfo *)self->_occupancyInfo copyWithZone:a3];
  v18 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v17;

  id v19 = [(GEOTransitExitPlanInfo *)self->_exitPlanInfoOverride copyWithZone:a3];
  v20 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v19;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 88) = self->_clearExitPlanInfo;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  uint64_t v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOTransitBoardingInfoEntry *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 46);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_expectedDepartureTime != *((_DWORD *)v4 + 21)) {
      goto LABEL_21;
    }
  }
  else if (v5)
  {
    goto LABEL_21;
  }
  mainText = self->_mainText;
  if ((unint64_t)mainText | *((void *)v4 + 6) && !-[GEOFormattedString isEqual:](mainText, "isEqual:")) {
    goto LABEL_21;
  }
  alternativeText = self->_alternativeText;
  if ((unint64_t)alternativeText | *((void *)v4 + 3))
  {
    if (!-[GEOFormattedString isEqual:](alternativeText, "isEqual:")) {
      goto LABEL_21;
    }
  }
  mainTimeInstruction = self->_mainTimeInstruction;
  if ((unint64_t)mainTimeInstruction | *((void *)v4 + 7))
  {
    if (!-[GEOTransitListTimeInstruction isEqual:](mainTimeInstruction, "isEqual:")) {
      goto LABEL_21;
    }
  }
  alternativeTimeInstruction = self->_alternativeTimeInstruction;
  if ((unint64_t)alternativeTimeInstruction | *((void *)v4 + 4))
  {
    if (!-[GEOTransitListTimeInstruction isEqual:](alternativeTimeInstruction, "isEqual:")) {
      goto LABEL_21;
    }
  }
  occupancyInfo = self->_occupancyInfo;
  if ((unint64_t)occupancyInfo | *((void *)v4 + 8))
  {
    if (!-[GEOTransitOccupancyInfo isEqual:](occupancyInfo, "isEqual:")) {
      goto LABEL_21;
    }
  }
  exitPlanInfoOverride = self->_exitPlanInfoOverride;
  if ((unint64_t)exitPlanInfoOverride | *((void *)v4 + 5))
  {
    if (!-[GEOTransitExitPlanInfo isEqual:](exitPlanInfoOverride, "isEqual:")) {
      goto LABEL_21;
    }
  }
  __int16 v12 = *((_WORD *)v4 + 46);
  BOOL v13 = (v12 & 2) == 0;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v12 & 2) == 0)
    {
LABEL_21:
      BOOL v13 = 0;
      goto LABEL_22;
    }
    if (self->_clearExitPlanInfo)
    {
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)v4 + 88))
    {
      goto LABEL_21;
    }
    BOOL v13 = 1;
  }
LABEL_22:

  return v13;
}

- (unint64_t)hash
{
  [(GEOTransitBoardingInfoEntry *)self readAll:1];
  if (*(_WORD *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_expectedDepartureTime;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOFormattedString *)self->_mainText hash];
  unint64_t v5 = [(GEOFormattedString *)self->_alternativeText hash];
  unint64_t v6 = [(GEOTransitListTimeInstruction *)self->_mainTimeInstruction hash];
  unint64_t v7 = [(GEOTransitListTimeInstruction *)self->_alternativeTimeInstruction hash];
  unint64_t v8 = [(GEOTransitOccupancyInfo *)self->_occupancyInfo hash];
  unint64_t v9 = [(GEOTransitExitPlanInfo *)self->_exitPlanInfoOverride hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_clearExitPlanInfo;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v17 = (unsigned int *)a3;
  [v17 readAll:0];
  unint64_t v4 = v17;
  if (v17[23])
  {
    self->_expectedDepartureTime = v17[21];
    *(_WORD *)&self->_flags |= 1u;
  }
  mainText = self->_mainText;
  uint64_t v6 = *((void *)v17 + 6);
  if (mainText)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOFormattedString mergeFrom:](mainText, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOTransitBoardingInfoEntry setMainText:](self, "setMainText:");
  }
  unint64_t v4 = v17;
LABEL_9:
  alternativeText = self->_alternativeText;
  uint64_t v8 = *((void *)v4 + 3);
  if (alternativeText)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOFormattedString mergeFrom:](alternativeText, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOTransitBoardingInfoEntry setAlternativeText:](self, "setAlternativeText:");
  }
  unint64_t v4 = v17;
LABEL_15:
  mainTimeInstruction = self->_mainTimeInstruction;
  uint64_t v10 = *((void *)v4 + 7);
  if (mainTimeInstruction)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOTransitListTimeInstruction mergeFrom:](mainTimeInstruction, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOTransitBoardingInfoEntry setMainTimeInstruction:](self, "setMainTimeInstruction:");
  }
  unint64_t v4 = v17;
LABEL_21:
  alternativeTimeInstruction = self->_alternativeTimeInstruction;
  uint64_t v12 = *((void *)v4 + 4);
  if (alternativeTimeInstruction)
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEOTransitListTimeInstruction mergeFrom:](alternativeTimeInstruction, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEOTransitBoardingInfoEntry setAlternativeTimeInstruction:](self, "setAlternativeTimeInstruction:");
  }
  unint64_t v4 = v17;
LABEL_27:
  occupancyInfo = self->_occupancyInfo;
  uint64_t v14 = *((void *)v4 + 8);
  if (occupancyInfo)
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[GEOTransitOccupancyInfo mergeFrom:](occupancyInfo, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[GEOTransitBoardingInfoEntry setOccupancyInfo:](self, "setOccupancyInfo:");
  }
  unint64_t v4 = v17;
LABEL_33:
  exitPlanInfoOverride = self->_exitPlanInfoOverride;
  uint64_t v16 = *((void *)v4 + 5);
  if (exitPlanInfoOverride)
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[GEOTransitExitPlanInfo mergeFrom:](exitPlanInfoOverride, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[GEOTransitBoardingInfoEntry setExitPlanInfoOverride:](self, "setExitPlanInfoOverride:");
  }
  unint64_t v4 = v17;
LABEL_39:
  if ((v4[23] & 2) != 0)
  {
    self->_clearExitPlanInfo = *((unsigned char *)v4 + 88);
    *(_WORD *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTransitBoardingInfoEntryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_392);
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
  *(_WORD *)&self->_flags |= 0x204u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitBoardingInfoEntry *)self readAll:0];
    [(GEOFormattedString *)self->_mainText clearUnknownFields:1];
    [(GEOFormattedString *)self->_alternativeText clearUnknownFields:1];
    [(GEOTransitListTimeInstruction *)self->_mainTimeInstruction clearUnknownFields:1];
    [(GEOTransitListTimeInstruction *)self->_alternativeTimeInstruction clearUnknownFields:1];
    [(GEOTransitOccupancyInfo *)self->_occupancyInfo clearUnknownFields:1];
    exitPlanInfoOverride = self->_exitPlanInfoOverride;
    [(GEOTransitExitPlanInfo *)exitPlanInfoOverride clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occupancyInfo, 0);
  objc_storeStrong((id *)&self->_mainTimeInstruction, 0);
  objc_storeStrong((id *)&self->_mainText, 0);
  objc_storeStrong((id *)&self->_exitPlanInfoOverride, 0);
  objc_storeStrong((id *)&self->_alternativeTimeInstruction, 0);
  objc_storeStrong((id *)&self->_alternativeText, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end