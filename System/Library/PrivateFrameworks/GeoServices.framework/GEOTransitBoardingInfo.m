@interface GEOTransitBoardingInfo
+ (BOOL)isValid:(id)a3;
+ (Class)entryType;
- (BOOL)_transit_hasAnyFieldSet;
- (BOOL)hasEndTimeInstruction;
- (BOOL)hasExitPlanInfo;
- (BOOL)hasPreBoardingTimeInstruction;
- (BOOL)hasSummaryTimeInstruction;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitBoardingInfo)init;
- (GEOTransitBoardingInfo)initWithData:(id)a3;
- (GEOTransitBoardingInfo)initWithDictionary:(id)a3;
- (GEOTransitBoardingInfo)initWithJSON:(id)a3;
- (GEOTransitExitPlanInfo)exitPlanInfo;
- (GEOTransitListTimeInstruction)endTimeInstruction;
- (GEOTransitListTimeInstruction)preBoardingTimeInstruction;
- (GEOTransitListTimeInstruction)summaryTimeInstruction;
- (NSMutableArray)entrys;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)entryAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)entrysCount;
- (unint64_t)hash;
- (void)_addNoFlagsEntry:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readEndTimeInstruction;
- (void)_readEntrys;
- (void)_readExitPlanInfo;
- (void)_readPreBoardingTimeInstruction;
- (void)_readSummaryTimeInstruction;
- (void)_transit_mergeFrom:(id)a3;
- (void)addEntry:(id)a3;
- (void)clearEntrys;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEndTimeInstruction:(id)a3;
- (void)setEntrys:(id)a3;
- (void)setExitPlanInfo:(id)a3;
- (void)setPreBoardingTimeInstruction:(id)a3;
- (void)setSummaryTimeInstruction:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitBoardingInfo

- (GEOTransitBoardingInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitBoardingInfo;
  v2 = [(GEOTransitBoardingInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitBoardingInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitBoardingInfo;
  v3 = [(GEOTransitBoardingInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEntrys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntrys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)entrys
{
  -[GEOTransitBoardingInfo _readEntrys]((uint64_t)self);
  entrys = self->_entrys;

  return entrys;
}

- (void)setEntrys:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  entrys = self->_entrys;
  self->_entrys = v4;
}

- (void)clearEntrys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  entrys = self->_entrys;

  [(NSMutableArray *)entrys removeAllObjects];
}

- (void)addEntry:(id)a3
{
  id v4 = a3;
  -[GEOTransitBoardingInfo _readEntrys]((uint64_t)self);
  -[GEOTransitBoardingInfo _addNoFlagsEntry:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsEntry:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)entrysCount
{
  -[GEOTransitBoardingInfo _readEntrys]((uint64_t)self);
  entrys = self->_entrys;

  return [(NSMutableArray *)entrys count];
}

- (id)entryAtIndex:(unint64_t)a3
{
  -[GEOTransitBoardingInfo _readEntrys]((uint64_t)self);
  entrys = self->_entrys;

  return (id)[(NSMutableArray *)entrys objectAtIndex:a3];
}

+ (Class)entryType
{
  return (Class)objc_opt_class();
}

- (void)_readExitPlanInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExitPlanInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasExitPlanInfo
{
  return self->_exitPlanInfo != 0;
}

- (GEOTransitExitPlanInfo)exitPlanInfo
{
  -[GEOTransitBoardingInfo _readExitPlanInfo]((uint64_t)self);
  exitPlanInfo = self->_exitPlanInfo;

  return exitPlanInfo;
}

- (void)setExitPlanInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_exitPlanInfo, a3);
}

- (void)_readSummaryTimeInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSummaryTimeInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSummaryTimeInstruction
{
  return self->_summaryTimeInstruction != 0;
}

- (GEOTransitListTimeInstruction)summaryTimeInstruction
{
  -[GEOTransitBoardingInfo _readSummaryTimeInstruction]((uint64_t)self);
  summaryTimeInstruction = self->_summaryTimeInstruction;

  return summaryTimeInstruction;
}

- (void)setSummaryTimeInstruction:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_summaryTimeInstruction, a3);
}

- (void)_readEndTimeInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEndTimeInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasEndTimeInstruction
{
  return self->_endTimeInstruction != 0;
}

- (GEOTransitListTimeInstruction)endTimeInstruction
{
  -[GEOTransitBoardingInfo _readEndTimeInstruction]((uint64_t)self);
  endTimeInstruction = self->_endTimeInstruction;

  return endTimeInstruction;
}

- (void)setEndTimeInstruction:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_endTimeInstruction, a3);
}

- (void)_readPreBoardingTimeInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPreBoardingTimeInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPreBoardingTimeInstruction
{
  return self->_preBoardingTimeInstruction != 0;
}

- (GEOTransitListTimeInstruction)preBoardingTimeInstruction
{
  -[GEOTransitBoardingInfo _readPreBoardingTimeInstruction]((uint64_t)self);
  preBoardingTimeInstruction = self->_preBoardingTimeInstruction;

  return preBoardingTimeInstruction;
}

- (void)setPreBoardingTimeInstruction:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_preBoardingTimeInstruction, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitBoardingInfo;
  id v4 = [(GEOTransitBoardingInfo *)&v8 description];
  id v5 = [(GEOTransitBoardingInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitBoardingInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v39 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"entry"];
    }
    v13 = [(id)a1 exitPlanInfo];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"exitPlanInfo";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"exit_plan_info";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = [(id)a1 summaryTimeInstruction];
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"summaryTimeInstruction";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"summary_time_instruction";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = [(id)a1 endTimeInstruction];
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"endTimeInstruction";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"end_time_instruction";
      }
      [v4 setObject:v23 forKey:v24];
    }
    v25 = [(id)a1 preBoardingTimeInstruction];
    v26 = v25;
    if (v25)
    {
      if (a2)
      {
        v27 = [v25 jsonRepresentation];
        v28 = @"preBoardingTimeInstruction";
      }
      else
      {
        v27 = [v25 dictionaryRepresentation];
        v28 = @"pre_boarding_time_instruction";
      }
      [v4 setObject:v27 forKey:v28];
    }
    v29 = *(void **)(a1 + 16);
    if (v29)
    {
      v30 = [v29 dictionaryRepresentation];
      v31 = v30;
      if (a2)
      {
        v32 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __52__GEOTransitBoardingInfo__dictionaryRepresentation___block_invoke;
        v36[3] = &unk_1E53D8860;
        id v33 = v32;
        id v37 = v33;
        [v31 enumerateKeysAndObjectsUsingBlock:v36];
        id v34 = v33;

        v31 = v34;
      }
      [v4 setObject:v31 forKey:@"Unknown Fields"];
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
  return -[GEOTransitBoardingInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOTransitBoardingInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOTransitBoardingInfo)initWithDictionary:(id)a3
{
  return (GEOTransitBoardingInfo *)-[GEOTransitBoardingInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"entry"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v37 = v5;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v39 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = [GEOTransitBoardingInfoEntry alloc];
                if (a3) {
                  uint64_t v14 = [(GEOTransitBoardingInfoEntry *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEOTransitBoardingInfoEntry *)v13 initWithDictionary:v12];
                }
                v15 = (void *)v14;
                [a1 addEntry:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v42 count:16];
          }
          while (v9);
        }

        id v5 = v37;
      }

      if (a3) {
        v16 = @"exitPlanInfo";
      }
      else {
        v16 = @"exit_plan_info";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEOTransitExitPlanInfo alloc];
        if (a3) {
          uint64_t v19 = [(GEOTransitExitPlanInfo *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOTransitExitPlanInfo *)v18 initWithDictionary:v17];
        }
        v20 = (void *)v19;
        [a1 setExitPlanInfo:v19];
      }
      if (a3) {
        v21 = @"summaryTimeInstruction";
      }
      else {
        v21 = @"summary_time_instruction";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [GEOTransitListTimeInstruction alloc];
        if (a3) {
          uint64_t v24 = [(GEOTransitListTimeInstruction *)v23 initWithJSON:v22];
        }
        else {
          uint64_t v24 = [(GEOTransitListTimeInstruction *)v23 initWithDictionary:v22];
        }
        v25 = (void *)v24;
        [a1 setSummaryTimeInstruction:v24];
      }
      if (a3) {
        v26 = @"endTimeInstruction";
      }
      else {
        v26 = @"end_time_instruction";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = [GEOTransitListTimeInstruction alloc];
        if (a3) {
          uint64_t v29 = [(GEOTransitListTimeInstruction *)v28 initWithJSON:v27];
        }
        else {
          uint64_t v29 = [(GEOTransitListTimeInstruction *)v28 initWithDictionary:v27];
        }
        v30 = (void *)v29;
        [a1 setEndTimeInstruction:v29];
      }
      if (a3) {
        v31 = @"preBoardingTimeInstruction";
      }
      else {
        v31 = @"pre_boarding_time_instruction";
      }
      v32 = [v5 objectForKeyedSubscript:v31];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v33 = [GEOTransitListTimeInstruction alloc];
        if (a3) {
          uint64_t v34 = [(GEOTransitListTimeInstruction *)v33 initWithJSON:v32];
        }
        else {
          uint64_t v34 = [(GEOTransitListTimeInstruction *)v33 initWithDictionary:v32];
        }
        v35 = (void *)v34;
        [a1 setPreBoardingTimeInstruction:v34];
      }
    }
  }

  return a1;
}

- (GEOTransitBoardingInfo)initWithJSON:(id)a3
{
  return (GEOTransitBoardingInfo *)-[GEOTransitBoardingInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_288;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_289;
    }
    GEOTransitBoardingInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitBoardingInfoCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitBoardingInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitBoardingInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitBoardingInfoIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitBoardingInfo *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_entrys;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_exitPlanInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_summaryTimeInstruction) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_endTimeInstruction) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_preBoardingTimeInstruction) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOTransitBoardingInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 16) = self->_readerMarkPos;
  *((_DWORD *)v9 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOTransitBoardingInfo *)self entrysCount])
  {
    [v9 clearEntrys];
    unint64_t v4 = [(GEOTransitBoardingInfo *)self entrysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOTransitBoardingInfo *)self entryAtIndex:i];
        [v9 addEntry:v7];
      }
    }
  }
  if (self->_exitPlanInfo) {
    objc_msgSend(v9, "setExitPlanInfo:");
  }
  uint64_t v8 = v9;
  if (self->_summaryTimeInstruction)
  {
    objc_msgSend(v9, "setSummaryTimeInstruction:");
    uint64_t v8 = v9;
  }
  if (self->_endTimeInstruction)
  {
    objc_msgSend(v9, "setEndTimeInstruction:");
    uint64_t v8 = v9;
  }
  if (self->_preBoardingTimeInstruction)
  {
    objc_msgSend(v9, "setPreBoardingTimeInstruction:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTransitBoardingInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitBoardingInfo *)self readAll:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = self->_entrys;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v11), "copyWithZone:", a3, (void)v22);
        [(id)v5 addEntry:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  id v13 = [(GEOTransitExitPlanInfo *)self->_exitPlanInfo copyWithZone:a3];
  long long v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  id v15 = [(GEOTransitListTimeInstruction *)self->_summaryTimeInstruction copyWithZone:a3];
  v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  id v17 = [(GEOTransitListTimeInstruction *)self->_endTimeInstruction copyWithZone:a3];
  v18 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v17;

  id v19 = [(GEOTransitListTimeInstruction *)self->_preBoardingTimeInstruction copyWithZone:a3];
  v20 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v19;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOTransitBoardingInfo *)self readAll:1],
         [v4 readAll:1],
         entrys = self->_entrys,
         !((unint64_t)entrys | v4[4]))
     || -[NSMutableArray isEqual:](entrys, "isEqual:"))
    && ((exitPlanInfo = self->_exitPlanInfo, !((unint64_t)exitPlanInfo | v4[5]))
     || -[GEOTransitExitPlanInfo isEqual:](exitPlanInfo, "isEqual:"))
    && ((summaryTimeInstruction = self->_summaryTimeInstruction, !((unint64_t)summaryTimeInstruction | v4[7]))
     || -[GEOTransitListTimeInstruction isEqual:](summaryTimeInstruction, "isEqual:"))
    && ((endTimeInstruction = self->_endTimeInstruction, !((unint64_t)endTimeInstruction | v4[3]))
     || -[GEOTransitListTimeInstruction isEqual:](endTimeInstruction, "isEqual:")))
  {
    preBoardingTimeInstruction = self->_preBoardingTimeInstruction;
    if ((unint64_t)preBoardingTimeInstruction | v4[6]) {
      char v10 = -[GEOTransitListTimeInstruction isEqual:](preBoardingTimeInstruction, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  [(GEOTransitBoardingInfo *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_entrys hash];
  unint64_t v4 = [(GEOTransitExitPlanInfo *)self->_exitPlanInfo hash] ^ v3;
  unint64_t v5 = [(GEOTransitListTimeInstruction *)self->_summaryTimeInstruction hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOTransitListTimeInstruction *)self->_endTimeInstruction hash];
  return v6 ^ [(GEOTransitListTimeInstruction *)self->_preBoardingTimeInstruction hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4[4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOTransitBoardingInfo addEntry:](self, "addEntry:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  exitPlanInfo = self->_exitPlanInfo;
  id v11 = v4[5];
  if (exitPlanInfo)
  {
    if (v11) {
      -[GEOTransitExitPlanInfo mergeFrom:](exitPlanInfo, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOTransitBoardingInfo setExitPlanInfo:](self, "setExitPlanInfo:");
  }
  summaryTimeInstruction = self->_summaryTimeInstruction;
  id v13 = v4[7];
  if (summaryTimeInstruction)
  {
    if (v13) {
      -[GEOTransitListTimeInstruction mergeFrom:](summaryTimeInstruction, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOTransitBoardingInfo setSummaryTimeInstruction:](self, "setSummaryTimeInstruction:");
  }
  endTimeInstruction = self->_endTimeInstruction;
  id v15 = v4[3];
  if (endTimeInstruction)
  {
    if (v15) {
      -[GEOTransitListTimeInstruction mergeFrom:](endTimeInstruction, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEOTransitBoardingInfo setEndTimeInstruction:](self, "setEndTimeInstruction:");
  }
  preBoardingTimeInstruction = self->_preBoardingTimeInstruction;
  id v17 = v4[6];
  if (preBoardingTimeInstruction)
  {
    if (v17) {
      -[GEOTransitListTimeInstruction mergeFrom:](preBoardingTimeInstruction, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEOTransitBoardingInfo setPreBoardingTimeInstruction:](self, "setPreBoardingTimeInstruction:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOTransitBoardingInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_293);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitBoardingInfo *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_entrys;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(GEOTransitExitPlanInfo *)self->_exitPlanInfo clearUnknownFields:1];
    [(GEOTransitListTimeInstruction *)self->_summaryTimeInstruction clearUnknownFields:1];
    [(GEOTransitListTimeInstruction *)self->_endTimeInstruction clearUnknownFields:1];
    [(GEOTransitListTimeInstruction *)self->_preBoardingTimeInstruction clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryTimeInstruction, 0);
  objc_storeStrong((id *)&self->_preBoardingTimeInstruction, 0);
  objc_storeStrong((id *)&self->_exitPlanInfo, 0);
  objc_storeStrong((id *)&self->_entrys, 0);
  objc_storeStrong((id *)&self->_endTimeInstruction, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)_transit_hasAnyFieldSet
{
  if ([(GEOTransitBoardingInfo *)self entrysCount]
    || [(GEOTransitBoardingInfo *)self hasExitPlanInfo]
    || [(GEOTransitBoardingInfo *)self hasPreBoardingTimeInstruction]
    || [(GEOTransitBoardingInfo *)self hasSummaryTimeInstruction])
  {
    return 1;
  }

  return [(GEOTransitBoardingInfo *)self hasEndTimeInstruction];
}

- (void)_transit_mergeFrom:(id)a3
{
  id v4 = a3;
  [(GEOTransitBoardingInfo *)self clearEntrys];
  id v55 = v4;
  id v5 = [(GEOTransitBoardingInfo *)self entrys];
  uint64_t v6 = [v55 entrys];
  id v7 = v5;
  id v8 = v6;
  if (!v8)
  {
    id v12 = v7;
    goto LABEL_19;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v9 = (id)_MergedGlobals_223;
  id v10 = v8;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v10 conformsToProtocol:_MergedGlobals_223])
  {
    char v11 = objc_msgSend(v10, "_transit_hasAnyFieldSet");

    if (v11)
    {
LABEL_14:
      if ([v10 conformsToProtocol:v9]
        && [v7 conformsToProtocol:v9])
      {
        objc_msgSend(v7, "_transit_mergeFrom:", v10);
        id v10 = v7;
      }
      id v12 = v10;
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
    long long v13 = [v10 dictionaryRepresentation];
    uint64_t v14 = [v13 count];

    if (v14) {
      goto LABEL_14;
    }
  }
  id v12 = 0;
LABEL_18:

LABEL_19:
  [(GEOTransitBoardingInfo *)self setEntrys:v12];

  long long v15 = [(GEOTransitBoardingInfo *)self exitPlanInfo];
  v16 = [v55 exitPlanInfo];
  id v17 = v15;
  id v18 = v16;
  if (!v18)
  {
    id v22 = v17;
    goto LABEL_37;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v19 = (id)_MergedGlobals_223;
  id v20 = v18;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v20 conformsToProtocol:_MergedGlobals_223])
  {
    char v21 = objc_msgSend(v20, "_transit_hasAnyFieldSet");

    if (v21)
    {
LABEL_32:
      if ([v20 conformsToProtocol:v19]
        && [v17 conformsToProtocol:v19])
      {
        objc_msgSend(v17, "_transit_mergeFrom:", v20);
        id v20 = v17;
      }
      id v22 = v20;
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
    uint64_t v23 = [v20 dictionaryRepresentation];
    uint64_t v24 = [v23 count];

    if (v24) {
      goto LABEL_32;
    }
  }
  id v22 = 0;
LABEL_36:

LABEL_37:
  [(GEOTransitBoardingInfo *)self setExitPlanInfo:v22];

  long long v25 = [(GEOTransitBoardingInfo *)self preBoardingTimeInstruction];
  v26 = [v55 preBoardingTimeInstruction];
  id v27 = v25;
  id v28 = v26;
  if (!v28)
  {
    id v32 = v27;
    goto LABEL_55;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v29 = (id)_MergedGlobals_223;
  id v30 = v28;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v30 conformsToProtocol:_MergedGlobals_223])
  {
    char v31 = objc_msgSend(v30, "_transit_hasAnyFieldSet");

    if (v31)
    {
LABEL_50:
      if ([v30 conformsToProtocol:v29]
        && [v27 conformsToProtocol:v29])
      {
        objc_msgSend(v27, "_transit_mergeFrom:", v30);
        id v30 = v27;
      }
      id v32 = v30;
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
    id v33 = [v30 dictionaryRepresentation];
    uint64_t v34 = [v33 count];

    if (v34) {
      goto LABEL_50;
    }
  }
  id v32 = 0;
LABEL_54:

LABEL_55:
  [(GEOTransitBoardingInfo *)self setPreBoardingTimeInstruction:v32];

  v35 = [(GEOTransitBoardingInfo *)self summaryTimeInstruction];
  v36 = [v55 summaryTimeInstruction];
  id v37 = v35;
  id v38 = v36;
  if (!v38)
  {
    id v42 = v37;
    goto LABEL_73;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v39 = (id)_MergedGlobals_223;
  id v40 = v38;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v40 conformsToProtocol:_MergedGlobals_223])
  {
    char v41 = objc_msgSend(v40, "_transit_hasAnyFieldSet");

    if (v41)
    {
LABEL_68:
      if ([v40 conformsToProtocol:v39]
        && [v37 conformsToProtocol:v39])
      {
        objc_msgSend(v37, "_transit_mergeFrom:", v40);
        id v40 = v37;
      }
      id v42 = v40;
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
    uint64_t v43 = [v40 dictionaryRepresentation];
    uint64_t v44 = [v43 count];

    if (v44) {
      goto LABEL_68;
    }
  }
  id v42 = 0;
LABEL_72:

LABEL_73:
  [(GEOTransitBoardingInfo *)self setSummaryTimeInstruction:v42];

  v45 = [(GEOTransitBoardingInfo *)self endTimeInstruction];
  v46 = [v55 endTimeInstruction];
  id v47 = v45;
  id v48 = v46;
  if (!v48)
  {
    id v52 = v47;
    goto LABEL_91;
  }
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  id v49 = (id)_MergedGlobals_223;
  id v50 = v48;
  if (qword_1EB29F940 != -1) {
    dispatch_once(&qword_1EB29F940, &__block_literal_global_64);
  }
  if ([v50 conformsToProtocol:_MergedGlobals_223])
  {
    char v51 = objc_msgSend(v50, "_transit_hasAnyFieldSet");

    if (v51)
    {
LABEL_86:
      if ([v50 conformsToProtocol:v49]
        && [v47 conformsToProtocol:v49])
      {
        objc_msgSend(v47, "_transit_mergeFrom:", v50);
        id v50 = v47;
      }
      id v52 = v50;
      goto LABEL_90;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_86;
    }
    v53 = [v50 dictionaryRepresentation];
    uint64_t v54 = [v53 count];

    if (v54) {
      goto LABEL_86;
    }
  }
  id v52 = 0;
LABEL_90:

LABEL_91:
  [(GEOTransitBoardingInfo *)self setEndTimeInstruction:v52];
}

@end