@interface GEOPDSearchQueryFuzzyMatchV2Metadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryFuzzyMatchV2Metadata)init;
- (GEOPDSearchQueryFuzzyMatchV2Metadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsRewrittenQueries:(uint64_t)a1;
- (void)_addNoFlagsRewrittenQueryTokens:(uint64_t)a1;
- (void)_readRewrittenQueries;
- (void)addRewrittenQueries:(uint64_t)a1;
- (void)addRewrittenQueryTokens:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryFuzzyMatchV2Metadata

- (GEOPDSearchQueryFuzzyMatchV2Metadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryFuzzyMatchV2Metadata;
  v2 = [(GEOPDSearchQueryFuzzyMatchV2Metadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryFuzzyMatchV2Metadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryFuzzyMatchV2Metadata;
  v3 = [(GEOPDSearchQueryFuzzyMatchV2Metadata *)&v7 initWithData:a3];
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
  PBRepeatedDoubleClear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchQueryFuzzyMatchV2Metadata;
  [(GEOPDSearchQueryFuzzyMatchV2Metadata *)&v3 dealloc];
}

- (void)_readRewrittenQueries
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(unsigned char *)(a1 + 96) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchQueryFuzzyMatchV2MetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRewrittenQueries_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
}

- (void)addRewrittenQueries:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchQueryFuzzyMatchV2Metadata _readRewrittenQueries](a1);
    -[GEOPDSearchQueryFuzzyMatchV2Metadata _addNoFlagsRewrittenQueries:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 96) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(unsigned char *)(a1 + 96) |= 0x40u;
  }
}

- (void)_addNoFlagsRewrittenQueries:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addRewrittenQueryTokens:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 96) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryFuzzyMatchV2MetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRewrittenQueryTokens_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    -[GEOPDSearchQueryFuzzyMatchV2Metadata _addNoFlagsRewrittenQueryTokens:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 96) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(unsigned char *)(a1 + 96) |= 0x40u;
  }
}

- (void)_addNoFlagsRewrittenQueryTokens:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQueryFuzzyMatchV2Metadata;
  v4 = [(GEOPDSearchQueryFuzzyMatchV2Metadata *)&v8 description];
  id v5 = [(GEOPDSearchQueryFuzzyMatchV2Metadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryFuzzyMatchV2Metadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchQueryFuzzyMatchV2Metadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 64))
    {
      -[GEOPDSearchQueryFuzzyMatchV2Metadata _readRewrittenQueries](a1);
      id v5 = *(id *)(a1 + 64);
      [v4 setObject:v5 forKey:@"rewrittenQueries"];
    }
    char v6 = *(unsigned char *)(a1 + 96);
    if ((v6 & 2) != 0)
    {
      id v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 93)];
      [v4 setObject:v7 forKey:@"useFuzzyV1"];

      char v6 = *(unsigned char *)(a1 + 96);
    }
    if (v6)
    {
      objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 92)];
      [v4 setObject:v8 forKey:@"pruneFuzzyV2Results"];
    }
    if (*(void *)(a1 + 24))
    {
      v9 = PBRepeatedDoubleNSArray();
      [v4 setObject:v9 forKey:@"fuzzyV2Scores"];
    }
    if (*(void *)(a1 + 48))
    {
      v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v11 = (void *)(a1 + 40);
      if (*(void *)(a1 + 48))
      {
        unint64_t v12 = 0;
        do
        {
          uint64_t v13 = *(int *)(*v11 + 4 * v12);
          if (v13 >= 3)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v13);
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = off_1E53E2710[v13];
          }
          [v10 addObject:v14];

          ++v12;
          v11 = (void *)(a1 + 40);
        }
        while (v12 < *(void *)(a1 + 48));
      }
      if (a2) {
        v15 = @"rewriteTypes";
      }
      else {
        v15 = @"rewrite_types";
      }
      [v4 setObject:v10 forKey:v15];
    }
    if ([*(id *)(a1 + 72) count])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v17 = *(id *)(a1 + 72);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            v23 = [v22 dictionaryRepresentation];
            }
            [v16 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v19);
      }

      [v4 setObject:v16 forKey:@"rewrittenQueryTokens"];
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
  return -[GEOPDSearchQueryFuzzyMatchV2Metadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        char v6 = (int *)&readAll__recursiveTag_1380;
      }
      else {
        char v6 = (int *)&readAll__nonRecursiveTag_1381;
      }
      GEOPDSearchQueryFuzzyMatchV2MetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchQueryFuzzyMatchV2MetadataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryFuzzyMatchV2MetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchQueryFuzzyMatchV2MetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    id v17 = self->_reader;
    objc_sync_enter(v17);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v18 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v18];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryFuzzyMatchV2Metadata readAll:]((uint64_t)self, 0);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    char v6 = self->_rewrittenQueries;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_fuzzyV2Scores.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v11;
      }
      while (v11 < self->_fuzzyV2Scores.count);
    }
    if (self->_rewriteTypes.count)
    {
      unint64_t v12 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v12;
      }
      while (v12 < self->_rewriteTypes.count);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v13 = self->_rewrittenQueryTokens;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v13);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDSearchQueryFuzzyMatchV2MetadataReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryFuzzyMatchV2Metadata readAll:]((uint64_t)self, 0);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v9 = self->_rewrittenQueries;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchQueryFuzzyMatchV2Metadata addRewrittenQueries:]((uint64_t)v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[93] = self->_useFuzzyV1;
    v5[96] |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[92] = self->_pruneFuzzyV2Results;
    v5[96] |= 1u;
  }
  PBRepeatedDoubleCopy();
  PBRepeatedInt32Copy();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = self->_rewrittenQueryTokens;
  uint64_t v15 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v8);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "copyWithZone:", a3, (void)v20);
        -[GEOPDSearchQueryFuzzyMatchV2Metadata addRewrittenQueryTokens:]((uint64_t)v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }
LABEL_23:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  -[GEOPDSearchQueryFuzzyMatchV2Metadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryFuzzyMatchV2Metadata readAll:]((uint64_t)v4, 1);
  rewrittenQueries = self->_rewrittenQueries;
  if ((unint64_t)rewrittenQueries | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](rewrittenQueries, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0) {
      goto LABEL_24;
    }
    if (self->_useFuzzyV1)
    {
      if (!*((unsigned char *)v4 + 93)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 93))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 96))
    {
      if (self->_pruneFuzzyV2Results)
      {
        if (!*((unsigned char *)v4 + 92)) {
          goto LABEL_24;
        }
        goto LABEL_20;
      }
      if (!*((unsigned char *)v4 + 92)) {
        goto LABEL_20;
      }
    }
LABEL_24:
    char v7 = 0;
    goto LABEL_25;
  }
  if (*((unsigned char *)v4 + 96)) {
    goto LABEL_24;
  }
LABEL_20:
  if (!PBRepeatedDoubleIsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_24;
  }
  rewrittenQueryTokens = self->_rewrittenQueryTokens;
  if ((unint64_t)rewrittenQueryTokens | *((void *)v4 + 9)) {
    char v7 = -[NSMutableArray isEqual:](rewrittenQueryTokens, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSearchQueryFuzzyMatchV2Metadata readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_rewrittenQueries hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_useFuzzyV1;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_pruneFuzzyV2Results;
LABEL_6:
  uint64_t v6 = v4 ^ v3;
  uint64_t v7 = v5 ^ PBRepeatedDoubleHash();
  uint64_t v8 = v7 ^ PBRepeatedInt32Hash();
  return v6 ^ v8 ^ [(NSMutableArray *)self->_rewrittenQueryTokens hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenQueryTokens, 0);
  objc_storeStrong((id *)&self->_rewrittenQueries, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end