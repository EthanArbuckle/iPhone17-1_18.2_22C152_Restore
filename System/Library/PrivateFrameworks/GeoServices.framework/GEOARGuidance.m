@interface GEOARGuidance
+ (BOOL)isValid:(id)a3;
+ (Class)gapRangeType;
- (BOOL)hasArrowLabel;
- (BOOL)hasInstruction;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOARGuidance)init;
- (GEOARGuidance)initWithData:(id)a3;
- (GEOARGuidance)initWithDictionary:(id)a3;
- (GEOARGuidance)initWithJSON:(id)a3;
- (GEOFormattedString)instruction;
- (NSMutableArray)gapRanges;
- (NSString)arrowLabel;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)gapRangeAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)gapRangesCount;
- (unint64_t)hash;
- (void)_addNoFlagsGapRange:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArrowLabel;
- (void)_readGapRanges;
- (void)_readInstruction;
- (void)addGapRange:(id)a3;
- (void)clearGapRanges;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArrowLabel:(id)a3;
- (void)setGapRanges:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setInstruction:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOARGuidance

- (GEOARGuidance)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOARGuidance;
  v2 = [(GEOARGuidance *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOARGuidance)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOARGuidance;
  v3 = [(GEOARGuidance *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DFEF8[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AR_GUIDANCE_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AR_GUIDANCE_TYPE_CONTINUE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AR_GUIDANCE_TYPE_MANEUVER"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOARGuidanceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasInstruction
{
  return self->_instruction != 0;
}

- (GEOFormattedString)instruction
{
  -[GEOARGuidance _readInstruction]((uint64_t)self);
  instruction = self->_instruction;

  return instruction;
}

- (void)setInstruction:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_instruction, a3);
}

- (void)_readArrowLabel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOARGuidanceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArrowLabel_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasArrowLabel
{
  return self->_arrowLabel != 0;
}

- (NSString)arrowLabel
{
  -[GEOARGuidance _readArrowLabel]((uint64_t)self);
  arrowLabel = self->_arrowLabel;

  return arrowLabel;
}

- (void)setArrowLabel:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_arrowLabel, a3);
}

- (void)_readGapRanges
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOARGuidanceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGapRanges_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)gapRanges
{
  -[GEOARGuidance _readGapRanges]((uint64_t)self);
  gapRanges = self->_gapRanges;

  return gapRanges;
}

- (void)setGapRanges:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  gapRanges = self->_gapRanges;
  self->_gapRanges = v4;
}

- (void)clearGapRanges
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  gapRanges = self->_gapRanges;

  [(NSMutableArray *)gapRanges removeAllObjects];
}

- (void)addGapRange:(id)a3
{
  id v4 = a3;
  -[GEOARGuidance _readGapRanges]((uint64_t)self);
  -[GEOARGuidance _addNoFlagsGapRange:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsGapRange:(uint64_t)a1
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

- (unint64_t)gapRangesCount
{
  -[GEOARGuidance _readGapRanges]((uint64_t)self);
  gapRanges = self->_gapRanges;

  return [(NSMutableArray *)gapRanges count];
}

- (id)gapRangeAtIndex:(unint64_t)a3
{
  -[GEOARGuidance _readGapRanges]((uint64_t)self);
  gapRanges = self->_gapRanges;

  return (id)[(NSMutableArray *)gapRanges objectAtIndex:a3];
}

+ (Class)gapRangeType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOARGuidance;
  id v4 = [(GEOARGuidance *)&v8 description];
  id v5 = [(GEOARGuidance *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOARGuidance _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v5 = *(int *)(a1 + 60);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53DFEF8[v5];
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    id v7 = [(id)a1 instruction];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"instruction"];
    }
    v10 = [(id)a1 arrowLabel];
    if (v10)
    {
      if (a2) {
        v11 = @"arrowLabel";
      }
      else {
        v11 = @"arrow_label";
      }
      [v4 setObject:v10 forKey:v11];
    }

    if ([*(id *)(a1 + 32) count])
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v13 = *(id *)(a1 + 32);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v12 addObject:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v15);
      }

      if (a2) {
        v20 = @"gapRange";
      }
      else {
        v20 = @"gap_range";
      }
      [v4 setObject:v12 forKey:v20];
    }
    v21 = *(void **)(a1 + 16);
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __43__GEOARGuidance__dictionaryRepresentation___block_invoke;
        v28[3] = &unk_1E53D8860;
        id v25 = v24;
        id v29 = v25;
        [v23 enumerateKeysAndObjectsUsingBlock:v28];
        id v26 = v25;

        v23 = v26;
      }
      [v4 setObject:v23 forKey:@"Unknown Fields"];
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
  return -[GEOARGuidance _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOARGuidance__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOARGuidance)initWithDictionary:(id)a3
{
  return (GEOARGuidance *)-[GEOARGuidance _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_43;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_43;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"AR_GUIDANCE_TYPE_UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"AR_GUIDANCE_TYPE_CONTINUE"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"AR_GUIDANCE_TYPE_MANEUVER"])
    {
      uint64_t v8 = 2;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_14:
    [a1 setType:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"instruction"];
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
    [a1 setInstruction:v11];
  }
  if (a3) {
    id v13 = @"arrowLabel";
  }
  else {
    id v13 = @"arrow_label";
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = (void *)[v14 copy];
    [a1 setArrowLabel:v15];
  }
  if (a3) {
    uint64_t v16 = @"gapRange";
  }
  else {
    uint64_t v16 = @"gap_range";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = v5;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v24 = [GEORouteLegRange alloc];
            if (a3) {
              uint64_t v25 = [(GEORouteLegRange *)v24 initWithJSON:v23];
            }
            else {
              uint64_t v25 = [(GEORouteLegRange *)v24 initWithDictionary:v23];
            }
            id v26 = (void *)v25;
            [a1 addGapRange:v25];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v20);
    }

    id v5 = v28;
  }

LABEL_43:
  return a1;
}

- (GEOARGuidance)initWithJSON:(id)a3
{
  return (GEOARGuidance *)-[GEOARGuidance _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_26;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_26;
    }
    GEOARGuidanceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOARGuidanceCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOARGuidanceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOARGuidanceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOARGuidanceIsDirty((uint64_t)self) & 1) == 0)
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOARGuidance *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_instruction) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_arrowLabel) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_gapRanges;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOARGuidance *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v8 + 15) = self->_type;
    *((unsigned char *)v8 + 64) |= 1u;
  }
  if (self->_instruction) {
    objc_msgSend(v8, "setInstruction:");
  }
  if (self->_arrowLabel) {
    objc_msgSend(v8, "setArrowLabel:");
  }
  if ([(GEOARGuidance *)self gapRangesCount])
  {
    [v8 clearGapRanges];
    unint64_t v4 = [(GEOARGuidance *)self gapRangesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOARGuidance *)self gapRangeAtIndex:i];
        [v8 addGapRange:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOARGuidanceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOARGuidance *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_type;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v9 = [(GEOFormattedString *)self->_instruction copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_arrowLabel copyWithZone:a3];
  long long v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_gapRanges;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        [(id)v5 addGapRange:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  id v18 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v18;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOARGuidance *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_type != *((_DWORD *)v4 + 15)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  instruction = self->_instruction;
  if ((unint64_t)instruction | *((void *)v4 + 5) && !-[GEOFormattedString isEqual:](instruction, "isEqual:")) {
    goto LABEL_13;
  }
  arrowLabel = self->_arrowLabel;
  if ((unint64_t)arrowLabel | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](arrowLabel, "isEqual:")) {
      goto LABEL_13;
    }
  }
  gapRanges = self->_gapRanges;
  if ((unint64_t)gapRanges | *((void *)v4 + 4)) {
    char v8 = -[NSMutableArray isEqual:](gapRanges, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  [(GEOARGuidance *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOFormattedString *)self->_instruction hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_arrowLabel hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_gapRanges hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 64))
  {
    self->_type = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
  }
  instruction = self->_instruction;
  uint64_t v6 = *((void *)v4 + 5);
  if (instruction)
  {
    if (v6) {
      -[GEOFormattedString mergeFrom:](instruction, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOARGuidance setInstruction:](self, "setInstruction:");
  }
  if (*((void *)v4 + 3)) {
    -[GEOARGuidance setArrowLabel:](self, "setArrowLabel:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEOARGuidance addGapRange:](self, "addGapRange:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
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
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEOARGuidanceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6);
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
  *(unsigned char *)&self->_flags |= 0x22u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOARGuidance *)self readAll:0];
    [(GEOFormattedString *)self->_instruction clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_gapRanges;
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
  objc_storeStrong((id *)&self->_instruction, 0);
  objc_storeStrong((id *)&self->_gapRanges, 0);
  objc_storeStrong((id *)&self->_arrowLabel, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end