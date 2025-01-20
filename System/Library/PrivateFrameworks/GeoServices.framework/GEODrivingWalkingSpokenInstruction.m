@interface GEODrivingWalkingSpokenInstruction
+ (BOOL)isValid:(id)a3;
+ (Class)executionStageType;
- (BOOL)hasContinueStage;
- (BOOL)hasInitialStage;
- (BOOL)hasPreparationStage;
- (BOOL)hasProceedStage;
- (BOOL)hasShortChainedInstructionIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODrivingWalkingSpokenInstruction)init;
- (GEODrivingWalkingSpokenInstruction)initWithData:(id)a3;
- (GEODrivingWalkingSpokenInstruction)initWithDictionary:(id)a3;
- (GEODrivingWalkingSpokenInstruction)initWithJSON:(id)a3;
- (GEOFormattedString)continueStage;
- (GEOFormattedString)initialStage;
- (GEOFormattedString)preparationStage;
- (GEOFormattedString)proceedStage;
- (NSMutableArray)executionStages;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)executionStageAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)executionStagesCount;
- (unint64_t)hash;
- (unsigned)shortChainedInstructionIndex;
- (void)_addNoFlagsExecutionStage:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readContinueStage;
- (void)_readExecutionStages;
- (void)_readInitialStage;
- (void)_readPreparationStage;
- (void)_readProceedStage;
- (void)addExecutionStage:(id)a3;
- (void)clearExecutionStages;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setContinueStage:(id)a3;
- (void)setExecutionStages:(id)a3;
- (void)setHasShortChainedInstructionIndex:(BOOL)a3;
- (void)setInitialStage:(id)a3;
- (void)setPreparationStage:(id)a3;
- (void)setProceedStage:(id)a3;
- (void)setShortChainedInstructionIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEODrivingWalkingSpokenInstruction

- (GEODrivingWalkingSpokenInstruction)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEODrivingWalkingSpokenInstruction;
  v2 = [(GEODrivingWalkingSpokenInstruction *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEODrivingWalkingSpokenInstruction)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEODrivingWalkingSpokenInstruction;
  v3 = [(GEODrivingWalkingSpokenInstruction *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readProceedStage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingSpokenInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProceedStage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasProceedStage
{
  return self->_proceedStage != 0;
}

- (GEOFormattedString)proceedStage
{
  -[GEODrivingWalkingSpokenInstruction _readProceedStage]((uint64_t)self);
  proceedStage = self->_proceedStage;

  return proceedStage;
}

- (void)setProceedStage:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_proceedStage, a3);
}

- (void)_readContinueStage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingSpokenInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContinueStage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasContinueStage
{
  return self->_continueStage != 0;
}

- (GEOFormattedString)continueStage
{
  -[GEODrivingWalkingSpokenInstruction _readContinueStage]((uint64_t)self);
  continueStage = self->_continueStage;

  return continueStage;
}

- (void)setContinueStage:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_continueStage, a3);
}

- (void)_readInitialStage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingSpokenInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInitialStage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasInitialStage
{
  return self->_initialStage != 0;
}

- (GEOFormattedString)initialStage
{
  -[GEODrivingWalkingSpokenInstruction _readInitialStage]((uint64_t)self);
  initialStage = self->_initialStage;

  return initialStage;
}

- (void)setInitialStage:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_initialStage, a3);
}

- (void)_readPreparationStage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingSpokenInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPreparationStage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPreparationStage
{
  return self->_preparationStage != 0;
}

- (GEOFormattedString)preparationStage
{
  -[GEODrivingWalkingSpokenInstruction _readPreparationStage]((uint64_t)self);
  preparationStage = self->_preparationStage;

  return preparationStage;
}

- (void)setPreparationStage:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_preparationStage, a3);
}

- (void)_readExecutionStages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingSpokenInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExecutionStages_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)executionStages
{
  -[GEODrivingWalkingSpokenInstruction _readExecutionStages]((uint64_t)self);
  executionStages = self->_executionStages;

  return executionStages;
}

- (void)setExecutionStages:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  executionStages = self->_executionStages;
  self->_executionStages = v4;
}

- (void)clearExecutionStages
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  executionStages = self->_executionStages;

  [(NSMutableArray *)executionStages removeAllObjects];
}

- (void)addExecutionStage:(id)a3
{
  id v4 = a3;
  -[GEODrivingWalkingSpokenInstruction _readExecutionStages]((uint64_t)self);
  -[GEODrivingWalkingSpokenInstruction _addNoFlagsExecutionStage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsExecutionStage:(uint64_t)a1
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

- (unint64_t)executionStagesCount
{
  -[GEODrivingWalkingSpokenInstruction _readExecutionStages]((uint64_t)self);
  executionStages = self->_executionStages;

  return [(NSMutableArray *)executionStages count];
}

- (id)executionStageAtIndex:(unint64_t)a3
{
  -[GEODrivingWalkingSpokenInstruction _readExecutionStages]((uint64_t)self);
  executionStages = self->_executionStages;

  return (id)[(NSMutableArray *)executionStages objectAtIndex:a3];
}

+ (Class)executionStageType
{
  return (Class)objc_opt_class();
}

- (unsigned)shortChainedInstructionIndex
{
  return self->_shortChainedInstructionIndex;
}

- (void)setShortChainedInstructionIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_shortChainedInstructionIndex = a3;
}

- (void)setHasShortChainedInstructionIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasShortChainedInstructionIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODrivingWalkingSpokenInstruction;
  id v4 = [(GEODrivingWalkingSpokenInstruction *)&v8 description];
  id v5 = [(GEODrivingWalkingSpokenInstruction *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODrivingWalkingSpokenInstruction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 proceedStage];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"proceedStage";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"proceed_stage";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 continueStage];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"continueStage";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"continue_stage";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 initialStage];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"initialStage";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"initial_stage";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = [(id)a1 preparationStage];
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"preparationStage";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"preparation_stage";
      }
      [v4 setObject:v19 forKey:v20];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v22 = *(id *)(a1 + 32);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v42 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if (a2) {
              [v27 jsonRepresentation];
            }
            else {
            v28 = [v27 dictionaryRepresentation];
            }
            [v21 addObject:v28];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v24);
      }

      if (a2) {
        v29 = @"executionStage";
      }
      else {
        v29 = @"execution_stage";
      }
      [v4 setObject:v21 forKey:v29];
    }
    if (*(unsigned char *)(a1 + 80))
    {
      v30 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
      if (a2) {
        v31 = @"shortChainedInstructionIndex";
      }
      else {
        v31 = @"short_chained_instruction_index";
      }
      [v4 setObject:v30 forKey:v31];
    }
    v32 = *(void **)(a1 + 16);
    if (v32)
    {
      v33 = [v32 dictionaryRepresentation];
      v34 = v33;
      if (a2)
      {
        v35 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v33, "count"));
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __64__GEODrivingWalkingSpokenInstruction__dictionaryRepresentation___block_invoke;
        v39[3] = &unk_1E53D8860;
        id v36 = v35;
        id v40 = v36;
        [v34 enumerateKeysAndObjectsUsingBlock:v39];
        id v37 = v36;

        v34 = v37;
      }
      [v4 setObject:v34 forKey:@"Unknown Fields"];
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
  return -[GEODrivingWalkingSpokenInstruction _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __64__GEODrivingWalkingSpokenInstruction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEODrivingWalkingSpokenInstruction)initWithDictionary:(id)a3
{
  return (GEODrivingWalkingSpokenInstruction *)-[GEODrivingWalkingSpokenInstruction _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"proceedStage";
      }
      else {
        objc_super v6 = @"proceed_stage";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setProceedStage:v9];
      }
      if (a3) {
        v11 = @"continueStage";
      }
      else {
        v11 = @"continue_stage";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v14 = [(GEOFormattedString *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOFormattedString *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setContinueStage:v14];
      }
      if (a3) {
        v16 = @"initialStage";
      }
      else {
        v16 = @"initial_stage";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v19 = [(GEOFormattedString *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOFormattedString *)v18 initWithDictionary:v17];
        }
        v20 = (void *)v19;
        [a1 setInitialStage:v19];
      }
      if (a3) {
        v21 = @"preparationStage";
      }
      else {
        v21 = @"preparation_stage";
      }
      id v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v23 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v24 = [(GEOFormattedString *)v23 initWithJSON:v22];
        }
        else {
          uint64_t v24 = [(GEOFormattedString *)v23 initWithDictionary:v22];
        }
        uint64_t v25 = (void *)v24;
        [a1 setPreparationStage:v24];
      }
      if (a3) {
        v26 = @"executionStage";
      }
      else {
        v26 = @"execution_stage";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v40 = v5;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v28 = v27;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v42 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v41 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v34 = [GEOFormattedString alloc];
                if (a3) {
                  uint64_t v35 = [(GEOFormattedString *)v34 initWithJSON:v33];
                }
                else {
                  uint64_t v35 = [(GEOFormattedString *)v34 initWithDictionary:v33];
                }
                id v36 = (void *)v35;
                [a1 addExecutionStage:v35];
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v41 objects:v45 count:16];
          }
          while (v30);
        }

        id v5 = v40;
      }

      if (a3) {
        id v37 = @"shortChainedInstructionIndex";
      }
      else {
        id v37 = @"short_chained_instruction_index";
      }
      v38 = [v5 objectForKeyedSubscript:v37];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setShortChainedInstructionIndex:", objc_msgSend(v38, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEODrivingWalkingSpokenInstruction)initWithJSON:(id)a3
{
  return (GEODrivingWalkingSpokenInstruction *)-[GEODrivingWalkingSpokenInstruction _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1554;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1555;
    }
    GEODrivingWalkingSpokenInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEODrivingWalkingSpokenInstructionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEODrivingWalkingSpokenInstructionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODrivingWalkingSpokenInstructionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEODrivingWalkingSpokenInstructionIsDirty((uint64_t)self) & 1) == 0)
  {
    id v10 = self->_reader;
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
    [(GEODrivingWalkingSpokenInstruction *)self readAll:0];
    if (self->_proceedStage) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_continueStage) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_initialStage) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_preparationStage) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_executionStages;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEODrivingWalkingSpokenInstruction *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 16) = self->_readerMarkPos;
  *((_DWORD *)v8 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_proceedStage) {
    objc_msgSend(v8, "setProceedStage:");
  }
  if (self->_continueStage) {
    objc_msgSend(v8, "setContinueStage:");
  }
  if (self->_initialStage) {
    objc_msgSend(v8, "setInitialStage:");
  }
  if (self->_preparationStage) {
    objc_msgSend(v8, "setPreparationStage:");
  }
  if ([(GEODrivingWalkingSpokenInstruction *)self executionStagesCount])
  {
    [v8 clearExecutionStages];
    unint64_t v4 = [(GEODrivingWalkingSpokenInstruction *)self executionStagesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEODrivingWalkingSpokenInstruction *)self executionStageAtIndex:i];
        [v8 addExecutionStage:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v8 + 19) = self->_shortChainedInstructionIndex;
    *((unsigned char *)v8 + 80) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEODrivingWalkingSpokenInstructionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEODrivingWalkingSpokenInstruction *)self readAll:0];
  id v9 = [(GEOFormattedString *)self->_proceedStage copyWithZone:a3];
  id v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  id v11 = [(GEOFormattedString *)self->_continueStage copyWithZone:a3];
  long long v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  id v13 = [(GEOFormattedString *)self->_initialStage copyWithZone:a3];
  long long v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  id v15 = [(GEOFormattedString *)self->_preparationStage copyWithZone:a3];
  v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v17 = self->_executionStages;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (void)v24);
        [(id)v5 addExecutionStage:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 76) = self->_shortChainedInstructionIndex;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  id v22 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v22;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEODrivingWalkingSpokenInstruction *)self readAll:1];
  [v4 readAll:1];
  proceedStage = self->_proceedStage;
  if ((unint64_t)proceedStage | *((void *)v4 + 7))
  {
    if (!-[GEOFormattedString isEqual:](proceedStage, "isEqual:")) {
      goto LABEL_16;
    }
  }
  continueStage = self->_continueStage;
  if ((unint64_t)continueStage | *((void *)v4 + 3))
  {
    if (!-[GEOFormattedString isEqual:](continueStage, "isEqual:")) {
      goto LABEL_16;
    }
  }
  initialStage = self->_initialStage;
  if ((unint64_t)initialStage | *((void *)v4 + 5))
  {
    if (!-[GEOFormattedString isEqual:](initialStage, "isEqual:")) {
      goto LABEL_16;
    }
  }
  preparationStage = self->_preparationStage;
  if ((unint64_t)preparationStage | *((void *)v4 + 6))
  {
    if (!-[GEOFormattedString isEqual:](preparationStage, "isEqual:")) {
      goto LABEL_16;
    }
  }
  executionStages = self->_executionStages;
  if ((unint64_t)executionStages | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](executionStages, "isEqual:")) {
      goto LABEL_16;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 80) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) != 0 && self->_shortChainedInstructionIndex == *((_DWORD *)v4 + 19))
    {
      BOOL v10 = 1;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  [(GEODrivingWalkingSpokenInstruction *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_proceedStage hash];
  unint64_t v4 = [(GEOFormattedString *)self->_continueStage hash];
  unint64_t v5 = [(GEOFormattedString *)self->_initialStage hash];
  unint64_t v6 = [(GEOFormattedString *)self->_preparationStage hash];
  uint64_t v7 = [(NSMutableArray *)self->_executionStages hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v8 = 2654435761 * self->_shortChainedInstructionIndex;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  proceedStage = self->_proceedStage;
  uint64_t v6 = *((void *)v4 + 7);
  if (proceedStage)
  {
    if (v6) {
      -[GEOFormattedString mergeFrom:](proceedStage, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEODrivingWalkingSpokenInstruction setProceedStage:](self, "setProceedStage:");
  }
  continueStage = self->_continueStage;
  uint64_t v8 = *((void *)v4 + 3);
  if (continueStage)
  {
    if (v8) {
      -[GEOFormattedString mergeFrom:](continueStage, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEODrivingWalkingSpokenInstruction setContinueStage:](self, "setContinueStage:");
  }
  initialStage = self->_initialStage;
  uint64_t v10 = *((void *)v4 + 5);
  if (initialStage)
  {
    if (v10) {
      -[GEOFormattedString mergeFrom:](initialStage, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[GEODrivingWalkingSpokenInstruction setInitialStage:](self, "setInitialStage:");
  }
  preparationStage = self->_preparationStage;
  uint64_t v12 = *((void *)v4 + 6);
  if (preparationStage)
  {
    if (v12) {
      -[GEOFormattedString mergeFrom:](preparationStage, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[GEODrivingWalkingSpokenInstruction setPreparationStage:](self, "setPreparationStage:");
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = *((id *)v4 + 4);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[GEODrivingWalkingSpokenInstruction addExecutionStage:](self, "addExecutionStage:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }

  if (*((unsigned char *)v4 + 80))
  {
    self->_shortChainedInstructionIndex = *((_DWORD *)v4 + 19);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEODrivingWalkingSpokenInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1559);
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
  *(unsigned char *)&self->_flags |= 0x82u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEODrivingWalkingSpokenInstruction *)self readAll:0];
    [(GEOFormattedString *)self->_proceedStage clearUnknownFields:1];
    [(GEOFormattedString *)self->_continueStage clearUnknownFields:1];
    [(GEOFormattedString *)self->_initialStage clearUnknownFields:1];
    [(GEOFormattedString *)self->_preparationStage clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_executionStages;
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
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proceedStage, 0);
  objc_storeStrong((id *)&self->_preparationStage, 0);
  objc_storeStrong((id *)&self->_initialStage, 0);
  objc_storeStrong((id *)&self->_executionStages, 0);
  objc_storeStrong((id *)&self->_continueStage, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end