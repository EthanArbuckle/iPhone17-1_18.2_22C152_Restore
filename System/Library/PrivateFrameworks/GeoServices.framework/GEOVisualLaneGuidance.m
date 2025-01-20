@interface GEOVisualLaneGuidance
+ (BOOL)isValid:(id)a3;
+ (Class)instructionType;
+ (Class)laneInfoType;
+ (Class)titleType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVisualLaneGuidance)init;
- (GEOVisualLaneGuidance)initWithData:(id)a3;
- (GEOVisualLaneGuidance)initWithDictionary:(id)a3;
- (GEOVisualLaneGuidance)initWithJSON:(id)a3;
- (NSMutableArray)instructions;
- (NSMutableArray)laneInfos;
- (NSMutableArray)titles;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)instructionAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)laneInfoAtIndex:(unint64_t)a3;
- (id)titleAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)instructionsCount;
- (unint64_t)laneInfosCount;
- (unint64_t)titlesCount;
- (void)_addNoFlagsInstruction:(uint64_t)a1;
- (void)_addNoFlagsLaneInfo:(uint64_t)a1;
- (void)_addNoFlagsTitle:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readInstructions;
- (void)_readLaneInfos;
- (void)_readTitles;
- (void)addInstruction:(id)a3;
- (void)addLaneInfo:(id)a3;
- (void)addTitle:(id)a3;
- (void)clearInstructions;
- (void)clearLaneInfos;
- (void)clearTitles;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setInstructions:(id)a3;
- (void)setLaneInfos:(id)a3;
- (void)setTitles:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVisualLaneGuidance

- (GEOVisualLaneGuidance)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOVisualLaneGuidance;
  v2 = [(GEOVisualLaneGuidance *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVisualLaneGuidance)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOVisualLaneGuidance;
  v3 = [(GEOVisualLaneGuidance *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLaneInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVisualLaneGuidanceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLaneInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)laneInfos
{
  -[GEOVisualLaneGuidance _readLaneInfos]((uint64_t)self);
  laneInfos = self->_laneInfos;

  return laneInfos;
}

- (void)setLaneInfos:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  laneInfos = self->_laneInfos;
  self->_laneInfos = v4;
}

- (void)clearLaneInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  laneInfos = self->_laneInfos;

  [(NSMutableArray *)laneInfos removeAllObjects];
}

- (void)addLaneInfo:(id)a3
{
  id v4 = a3;
  -[GEOVisualLaneGuidance _readLaneInfos]((uint64_t)self);
  -[GEOVisualLaneGuidance _addNoFlagsLaneInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsLaneInfo:(uint64_t)a1
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

- (unint64_t)laneInfosCount
{
  -[GEOVisualLaneGuidance _readLaneInfos]((uint64_t)self);
  laneInfos = self->_laneInfos;

  return [(NSMutableArray *)laneInfos count];
}

- (id)laneInfoAtIndex:(unint64_t)a3
{
  -[GEOVisualLaneGuidance _readLaneInfos]((uint64_t)self);
  laneInfos = self->_laneInfos;

  return (id)[(NSMutableArray *)laneInfos objectAtIndex:a3];
}

+ (Class)laneInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readInstructions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVisualLaneGuidanceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInstructions_tags_8860);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)instructions
{
  -[GEOVisualLaneGuidance _readInstructions]((uint64_t)self);
  instructions = self->_instructions;

  return instructions;
}

- (void)setInstructions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  instructions = self->_instructions;
  self->_instructions = v4;
}

- (void)clearInstructions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  instructions = self->_instructions;

  [(NSMutableArray *)instructions removeAllObjects];
}

- (void)addInstruction:(id)a3
{
  id v4 = a3;
  -[GEOVisualLaneGuidance _readInstructions]((uint64_t)self);
  -[GEOVisualLaneGuidance _addNoFlagsInstruction:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsInstruction:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)instructionsCount
{
  -[GEOVisualLaneGuidance _readInstructions]((uint64_t)self);
  instructions = self->_instructions;

  return [(NSMutableArray *)instructions count];
}

- (id)instructionAtIndex:(unint64_t)a3
{
  -[GEOVisualLaneGuidance _readInstructions]((uint64_t)self);
  instructions = self->_instructions;

  return (id)[(NSMutableArray *)instructions objectAtIndex:a3];
}

+ (Class)instructionType
{
  return (Class)objc_opt_class();
}

- (void)_readTitles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVisualLaneGuidanceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)titles
{
  -[GEOVisualLaneGuidance _readTitles]((uint64_t)self);
  titles = self->_titles;

  return titles;
}

- (void)setTitles:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  titles = self->_titles;
  self->_titles = v4;
}

- (void)clearTitles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  titles = self->_titles;

  [(NSMutableArray *)titles removeAllObjects];
}

- (void)addTitle:(id)a3
{
  id v4 = a3;
  -[GEOVisualLaneGuidance _readTitles]((uint64_t)self);
  -[GEOVisualLaneGuidance _addNoFlagsTitle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsTitle:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)titlesCount
{
  -[GEOVisualLaneGuidance _readTitles]((uint64_t)self);
  titles = self->_titles;

  return [(NSMutableArray *)titles count];
}

- (id)titleAtIndex:(unint64_t)a3
{
  -[GEOVisualLaneGuidance _readTitles]((uint64_t)self);
  titles = self->_titles;

  return (id)[(NSMutableArray *)titles objectAtIndex:a3];
}

+ (Class)titleType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVisualLaneGuidance;
  id v4 = [(GEOVisualLaneGuidance *)&v8 description];
  id v5 = [(GEOVisualLaneGuidance *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVisualLaneGuidance _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v48 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v47 objects:v53 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"laneInfo";
      }
      else {
        v13 = @"lane_info";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v15 = *(id *)(a1 + 24);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v44 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v43 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v17);
      }

      [v4 setObject:v14 forKey:@"instruction"];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v23 = *(id *)(a1 + 40);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v51 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v40;
        do
        {
          for (uint64_t k = 0; k != v25; ++k)
          {
            if (*(void *)v40 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v39 + 1) + 8 * k);
            if (a2) {
              [v28 jsonRepresentation];
            }
            else {
            v29 = [v28 dictionaryRepresentation];
            }
            [v22 addObject:v29];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v51 count:16];
        }
        while (v25);
      }

      [v4 setObject:v22 forKey:@"title"];
    }
    v30 = *(void **)(a1 + 16);
    if (v30)
    {
      v31 = [v30 dictionaryRepresentation];
      v32 = v31;
      if (a2)
      {
        v33 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __51__GEOVisualLaneGuidance__dictionaryRepresentation___block_invoke;
        v37[3] = &unk_1E53D8860;
        id v34 = v33;
        id v38 = v34;
        [v32 enumerateKeysAndObjectsUsingBlock:v37];
        id v35 = v34;

        v32 = v35;
      }
      [v4 setObject:v32 forKey:@"Unknown Fields"];
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
  return -[GEOVisualLaneGuidance _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOVisualLaneGuidance__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOVisualLaneGuidance)initWithDictionary:(id)a3
{
  return (GEOVisualLaneGuidance *)-[GEOVisualLaneGuidance _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"laneInfo";
      }
      else {
        id v6 = @"lane_info";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v38 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v53 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v48 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v47 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOLaneInfo alloc];
                if (a3) {
                  uint64_t v15 = [(GEOLaneInfo *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOLaneInfo *)v14 initWithDictionary:v13];
                }
                uint64_t v16 = (void *)v15;
                [a1 addLaneInfo:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v47 objects:v53 count:16];
          }
          while (v10);
        }

        id v5 = v38;
      }

      uint64_t v17 = [v5 objectForKeyedSubscript:@"instruction"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v44;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v44 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void *)(*((void *)&v43 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v24 = [GEOFormattedString alloc];
                if (a3) {
                  uint64_t v25 = [(GEOFormattedString *)v24 initWithJSON:v23];
                }
                else {
                  uint64_t v25 = [(GEOFormattedString *)v24 initWithDictionary:v23];
                }
                uint64_t v26 = (void *)v25;
                [a1 addInstruction:v25];
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
          }
          while (v20);
        }

        id v5 = v38;
      }

      v27 = [v5 objectForKeyedSubscript:@"title"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v28 = v27;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v39 objects:v51 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v40;
          do
          {
            for (uint64_t k = 0; k != v30; ++k)
            {
              if (*(void *)v40 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v39 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v34 = [GEOFormattedString alloc];
                if (a3) {
                  uint64_t v35 = [(GEOFormattedString *)v34 initWithJSON:v33];
                }
                else {
                  uint64_t v35 = [(GEOFormattedString *)v34 initWithDictionary:v33];
                }
                v36 = (void *)v35;
                [a1 addTitle:v35];
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v39 objects:v51 count:16];
          }
          while (v30);
        }

        id v5 = v38;
      }
    }
  }

  return a1;
}

- (GEOVisualLaneGuidance)initWithJSON:(id)a3
{
  return (GEOVisualLaneGuidance *)-[GEOVisualLaneGuidance _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_8867;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_8868;
    }
    GEOVisualLaneGuidanceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOVisualLaneGuidanceCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVisualLaneGuidanceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVisualLaneGuidanceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOVisualLaneGuidanceIsDirty((uint64_t)self) & 1) == 0)
  {
    id v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOVisualLaneGuidance *)self readAll:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = self->_laneInfos;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = self->_instructions;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = self->_titles;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v16 = (id *)a3;
  [(GEOVisualLaneGuidance *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 12) = self->_readerMarkPos;
  *((_DWORD *)v16 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOVisualLaneGuidance *)self laneInfosCount])
  {
    [v16 clearLaneInfos];
    unint64_t v4 = [(GEOVisualLaneGuidance *)self laneInfosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOVisualLaneGuidance *)self laneInfoAtIndex:i];
        [v16 addLaneInfo:v7];
      }
    }
  }
  if ([(GEOVisualLaneGuidance *)self instructionsCount])
  {
    [v16 clearInstructions];
    unint64_t v8 = [(GEOVisualLaneGuidance *)self instructionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOVisualLaneGuidance *)self instructionAtIndex:j];
        [v16 addInstruction:v11];
      }
    }
  }
  if ([(GEOVisualLaneGuidance *)self titlesCount])
  {
    [v16 clearTitles];
    unint64_t v12 = [(GEOVisualLaneGuidance *)self titlesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOVisualLaneGuidance *)self titleAtIndex:k];
        [v16 addTitle:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOVisualLaneGuidanceReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOVisualLaneGuidance *)self readAll:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v8 = self->_laneInfos;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * i) copyWithZone:a3];
        [v5 addLaneInfo:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v9);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v13 = self->_instructions;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * j) copyWithZone:a3];
        [v5 addInstruction:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v14);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = self->_titles;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * k), "copyWithZone:", a3, (void)v24);
        [v5 addTitle:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v19);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOVisualLaneGuidance *)self readAll:1],
         [v4 readAll:1],
         laneInfos = self->_laneInfos,
         !((unint64_t)laneInfos | v4[4]))
     || -[NSMutableArray isEqual:](laneInfos, "isEqual:"))
    && ((instructions = self->_instructions, !((unint64_t)instructions | v4[3]))
     || -[NSMutableArray isEqual:](instructions, "isEqual:")))
  {
    titles = self->_titles;
    if ((unint64_t)titles | v4[5]) {
      char v8 = -[NSMutableArray isEqual:](titles, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEOVisualLaneGuidance *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_laneInfos hash];
  uint64_t v4 = [(NSMutableArray *)self->_instructions hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_titles hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v4[4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOVisualLaneGuidance *)self addLaneInfo:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4[3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOVisualLaneGuidance *)self addInstruction:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4[5];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEOVisualLaneGuidance addTitle:](self, "addTitle:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOVisualLaneGuidanceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8872);
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
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOVisualLaneGuidance *)self readAll:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v7 = self->_laneInfos;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v12 = self->_instructions;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v14);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v17 = self->_titles;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v21++), "clearUnknownFields:", 1, (void)v22);
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v19);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_laneInfos, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end