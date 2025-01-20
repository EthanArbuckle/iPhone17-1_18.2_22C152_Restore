@interface GEOPDSearchGeoParsingResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchGeoParsingResult)init;
- (GEOPDSearchGeoParsingResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsDroppedTokens:(uint64_t)a1;
- (void)_addNoFlagsLabeling:(uint64_t)a1;
- (void)addDroppedTokens:(uint64_t)a1;
- (void)addLabeling:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchGeoParsingResult

- (GEOPDSearchGeoParsingResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchGeoParsingResult;
  v2 = [(GEOPDSearchGeoParsingResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchGeoParsingResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchGeoParsingResult;
  v3 = [(GEOPDSearchGeoParsingResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addLabeling:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchGeoParsingResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabelings_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    -[GEOPDSearchGeoParsingResult _addNoFlagsLabeling:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 64) |= 0x20u;
  }
}

- (void)_addNoFlagsLabeling:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addDroppedTokens:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchGeoParsingResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDroppedTokens_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    -[GEOPDSearchGeoParsingResult _addNoFlagsDroppedTokens:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 64) |= 0x20u;
  }
}

- (void)_addNoFlagsDroppedTokens:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchGeoParsingResult;
  v4 = [(GEOPDSearchGeoParsingResult *)&v8 description];
  id v5 = [(GEOPDSearchGeoParsingResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchGeoParsingResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchGeoParsingResult readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v36 != v8) {
              objc_enumerationMutation(v6);
            }
            v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            if (a2) {
              [v10 jsonRepresentation];
            }
            else {
            v11 = [v10 dictionaryRepresentation];
            }
            [v5 addObject:v11];
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v7);
      }

      [v4 setObject:v5 forKey:@"labeling"];
    }
    char v12 = *(unsigned char *)(a1 + 64);
    if (v12)
    {
      v13 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      if (a2) {
        v14 = @"labelScore";
      }
      else {
        v14 = @"label_score";
      }
      [v4 setObject:v13 forKey:v14];

      char v12 = *(unsigned char *)(a1 + 64);
    }
    if ((v12 & 2) != 0)
    {
      unsigned int v15 = *(_DWORD *)(a1 + 60) - 1;
      if (v15 >= 0x1C)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 60));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E53E2750[v15];
      }
      if (a2) {
        v17 = @"tagSource";
      }
      else {
        v17 = @"tag_source";
      }
      [v4 setObject:v16 forKey:v17];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v19 = *(id *)(a1 + 16);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v19);
            }
            v23 = *(void **)(*((void *)&v31 + 1) + 8 * j);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = [v23 dictionaryRepresentation];
            }
            [v18 addObject:v24];
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v20);
      }

      if (a2) {
        v25 = @"droppedTokens";
      }
      else {
        v25 = @"dropped_tokens";
      }
      [v4 setObject:v18 forKey:v25];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v26 = *(void **)(a1 + 8);
      if (v26)
      {
        id v27 = v26;
        objc_sync_enter(v27);
        GEOPDSearchGeoParsingResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTaggerModelId_tags);
        objc_sync_exit(v27);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v28 = *(id *)(a1 + 40);
    if (v28)
    {
      if (a2) {
        v29 = @"taggerModelId";
      }
      else {
        v29 = @"tagger_model_id";
      }
      [v4 setObject:v28 forKey:v29];
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
  return -[GEOPDSearchGeoParsingResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_872;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_873;
      }
      GEOPDSearchGeoParsingResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchGeoParsingResultCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchGeoParsingResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchGeoParsingResultIsDirty((uint64_t)self) & 1) == 0)
  {
    unsigned int v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchGeoParsingResult readAll:]((uint64_t)self, 0);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = self->_labelings;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteDoubleField();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v11 = self->_droppedTokens;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }

    if (self->_taggerModelId) {
      PBDataWriterWriteStringField();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
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
      GEOPDSearchGeoParsingResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchGeoParsingResult readAll:]((uint64_t)self, 0);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v9 = self->_labelings;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchGeoParsingResult addLabeling:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  char flags = (char)self->_flags;
  if (flags)
  {
    *(double *)(v5 + 24) = self->_labelScore;
    *(unsigned char *)(v5 + 64) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_tagSource;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unsigned int v15 = self->_droppedTokens;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (void)v22);
        -[GEOPDSearchGeoParsingResult addDroppedTokens:](v5, v19);
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSString *)self->_taggerModelId copyWithZone:a3];
  id v8 = *(id *)(v5 + 40);
  *(void *)(v5 + 40) = v20;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  -[GEOPDSearchGeoParsingResult readAll:]((uint64_t)self, 1);
  -[GEOPDSearchGeoParsingResult readAll:]((uint64_t)v4, 1);
  labelings = self->_labelings;
  if ((unint64_t)labelings | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](labelings, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_labelScore != *((double *)v4 + 3)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_tagSource != *((_DWORD *)v4 + 15)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_18;
  }
  droppedTokens = self->_droppedTokens;
  if ((unint64_t)droppedTokens | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](droppedTokens, "isEqual:"))
  {
    goto LABEL_18;
  }
  taggerModelId = self->_taggerModelId;
  if ((unint64_t)taggerModelId | *((void *)v4 + 5)) {
    char v8 = -[NSString isEqual:](taggerModelId, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDSearchGeoParsingResult readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_labelings hash];
  char flags = (char)self->_flags;
  if (flags)
  {
    double labelScore = self->_labelScore;
    double v7 = -labelScore;
    if (labelScore >= 0.0) {
      double v7 = self->_labelScore;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((flags & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_tagSource;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v5 ^ v3 ^ v10 ^ [(NSMutableArray *)self->_droppedTokens hash];
  return v11 ^ [(NSString *)self->_taggerModelId hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taggerModelId, 0);
  objc_storeStrong((id *)&self->_labelings, 0);
  objc_storeStrong((id *)&self->_droppedTokens, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end