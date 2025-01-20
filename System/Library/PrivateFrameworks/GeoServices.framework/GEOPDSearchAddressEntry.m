@interface GEOPDSearchAddressEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchAddressEntry)init;
- (GEOPDSearchAddressEntry)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsCandidates:(uint64_t)a1;
- (void)_readCandidates;
- (void)_readTopResult;
- (void)addCandidates:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchAddressEntry

- (GEOPDSearchAddressEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchAddressEntry;
  v2 = [(GEOPDSearchAddressEntry *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchAddressEntry)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchAddressEntry;
  v3 = [(GEOPDSearchAddressEntry *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTopResult
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  if ((*(unsigned char *)(a1 + 44) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchAddressEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTopResult_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
}

- (void)_readCandidates
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  if ((*(unsigned char *)(a1 + 44) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchAddressEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCandidates_tags_0);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
}

- (void)addCandidates:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchAddressEntry _readCandidates](a1);
    -[GEOPDSearchAddressEntry _addNoFlagsCandidates:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 44) |= 1u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    *(unsigned char *)(a1 + 44) |= 4u;
  }
}

- (void)_addNoFlagsCandidates:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchAddressEntry;
  v4 = [(GEOPDSearchAddressEntry *)&v8 description];
  id v5 = [(GEOPDSearchAddressEntry *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchAddressEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchAddressEntry readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    -[GEOPDSearchAddressEntry _readTopResult](a1);
    id v5 = *(id *)(a1 + 24);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"topResult";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"top_result";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = *(id *)(a1 + 16);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = objc_msgSend(v15, "dictionaryRepresentation", (void)v18);
            }
            objc_msgSend(v9, "addObject:", v16, (void)v18);
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);
      }

      [v4 setObject:v9 forKey:@"candidates"];
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
  return -[GEOPDSearchAddressEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_79;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_80;
      }
      GEOPDSearchAddressEntryReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchAddressEntryCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchAddressEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
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
    -[GEOPDSearchAddressEntry readAll:]((uint64_t)self, 0);
    if (self->_topResult) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_candidates;
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
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchAddressEntryReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchAddressEntry readAll:]((uint64_t)self, 0);
  id v8 = [(GEOPDSearchEntry *)self->_topResult copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = self->_candidates;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        -[GEOPDSearchAddressEntry addCandidates:]((uint64_t)v5, v14);
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSearchAddressEntry readAll:]((uint64_t)self, 1),
         -[GEOPDSearchAddressEntry readAll:]((uint64_t)v4, 1),
         topResult = self->_topResult,
         !((unint64_t)topResult | v4[3]))
     || -[GEOPDSearchEntry isEqual:](topResult, "isEqual:")))
  {
    candidates = self->_candidates;
    if ((unint64_t)candidates | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](candidates, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSearchAddressEntry readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDSearchEntry *)self->_topResult hash];
  return [(NSMutableArray *)self->_candidates hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topResult, 0);
  objc_storeStrong((id *)&self->_candidates, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end