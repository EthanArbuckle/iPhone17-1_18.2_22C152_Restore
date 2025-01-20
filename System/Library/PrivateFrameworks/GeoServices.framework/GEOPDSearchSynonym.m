@interface GEOPDSearchSynonym
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchSynonym)init;
- (GEOPDSearchSynonym)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsSynFeatureMap:(uint64_t)a1;
- (void)_addNoFlagsTokenList:(uint64_t)a1;
- (void)addSynFeatureMap:(uint64_t)a1;
- (void)addTokenList:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchSynonym

- (GEOPDSearchSynonym)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchSynonym;
  v2 = [(GEOPDSearchSynonym *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchSynonym)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchSynonym;
  v3 = [(GEOPDSearchSynonym *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addSynFeatureMap:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchSynonymReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSynFeatureMaps_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEOPDSearchSynonym _addNoFlagsSynFeatureMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsSynFeatureMap:(uint64_t)a1
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

- (void)addTokenList:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchSynonymReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenLists_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEOPDSearchSynonym _addNoFlagsTokenList:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsTokenList:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchSynonym;
  v4 = [(GEOPDSearchSynonym *)&v8 description];
  id v5 = [(GEOPDSearchSynonym *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchSynonym _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchSynonym readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 60))
    {
      LODWORD(v5) = *(_DWORD *)(a1 + 52);
      objc_super v6 = [NSNumber numberWithFloat:v5];
      [v4 setObject:v6 forKey:@"confidence"];
    }
    if ([*(id *)(a1 + 16) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v8 = *(id *)(a1 + 16);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v36 != v10) {
              objc_enumerationMutation(v8);
            }
            v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = [v12 dictionaryRepresentation];
            }
            [v7 addObject:v13];
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v9);
      }

      if (a2) {
        v14 = @"synFeatureMap";
      }
      else {
        v14 = @"syn_feature_map";
      }
      [v4 setObject:v7 forKey:v14];
    }
    if ((*(unsigned char *)(a1 + 60) & 2) != 0)
    {
      uint64_t v15 = *(int *)(a1 + 56);
      if (v15 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 56));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E53E2AB0[v15];
      }
      if (a2) {
        v17 = @"rewriteProvider";
      }
      else {
        v17 = @"rewrite_provider";
      }
      [v4 setObject:v16 forKey:v17];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v19 = *(id *)(a1 + 32);
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
        v25 = @"tokenList";
      }
      else {
        v25 = @"token_list";
      }
      [v4 setObject:v18 forKey:v25];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v26 = *(void **)(a1 + 8);
      if (v26)
      {
        id v27 = v26;
        objc_sync_enter(v27);
        GEOPDSearchSynonymReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSynonymText_tags);
        objc_sync_exit(v27);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v28 = *(id *)(a1 + 24);
    if (v28)
    {
      if (a2) {
        v29 = @"synonymText";
      }
      else {
        v29 = @"synonym_text";
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
  return -[GEOPDSearchSynonym _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_2448;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_2449;
      }
      GEOPDSearchSynonymReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchSynonymCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchSynonymReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchSynonym readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteFloatField();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_synFeatureMaps;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_tokenLists;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if (self->_synonymText) {
      PBDataWriterWriteStringField();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
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
      GEOPDSearchSynonymReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchSynonym readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(float *)(v5 + 52) = self->_confidence;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = self->_synFeatureMaps;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchSynonym addSynFeatureMap:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_rewriteProvider;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_tokenLists;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        -[GEOPDSearchSynonym addTokenList:](v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [(NSString *)self->_synonymText copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v19;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  -[GEOPDSearchSynonym readAll:]((uint64_t)self, 1);
  -[GEOPDSearchSynonym readAll:]((uint64_t)v4, 1);
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 60);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_confidence != *((float *)v4 + 13)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_19;
  }
  synFeatureMaps = self->_synFeatureMaps;
  if ((unint64_t)synFeatureMaps | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](synFeatureMaps, "isEqual:"))
    {
LABEL_19:
      char v10 = 0;
      goto LABEL_20;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 60);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_rewriteProvider != *((_DWORD *)v4 + 14)) {
      goto LABEL_19;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_19;
  }
  tokenLists = self->_tokenLists;
  if ((unint64_t)tokenLists | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](tokenLists, "isEqual:"))
  {
    goto LABEL_19;
  }
  synonymText = self->_synonymText;
  if ((unint64_t)synonymText | *((void *)v4 + 3)) {
    char v10 = -[NSString isEqual:](synonymText, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  -[GEOPDSearchSynonym readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags)
  {
    float confidence = self->_confidence;
    double v5 = confidence;
    if (confidence < 0.0) {
      double v5 = -confidence;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  uint64_t v8 = [(NSMutableArray *)self->_synFeatureMaps hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_rewriteProvider;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = v8 ^ v3 ^ v9;
  uint64_t v11 = [(NSMutableArray *)self->_tokenLists hash];
  return v10 ^ v11 ^ [(NSString *)self->_synonymText hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenLists, 0);
  objc_storeStrong((id *)&self->_synonymText, 0);
  objc_storeStrong((id *)&self->_synFeatureMaps, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end