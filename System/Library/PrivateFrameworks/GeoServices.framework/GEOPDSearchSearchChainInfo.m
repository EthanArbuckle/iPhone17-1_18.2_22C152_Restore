@interface GEOPDSearchSearchChainInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchSearchChainInfo)init;
- (GEOPDSearchSearchChainInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsCountryOccurrence:(uint64_t)a1;
- (void)_addNoFlagsTrigger:(uint64_t)a1;
- (void)_readTriggers;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchSearchChainInfo

- (GEOPDSearchSearchChainInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchSearchChainInfo;
  v2 = [(GEOPDSearchSearchChainInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchSearchChainInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchSearchChainInfo;
  v3 = [(GEOPDSearchSearchChainInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTriggers
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchSearchChainInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTriggers_tags_157);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)_addNoFlagsTrigger:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsCountryOccurrence:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchSearchChainInfo;
  v4 = [(GEOPDSearchSearchChainInfo *)&v8 description];
  id v5 = [(GEOPDSearchSearchChainInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchSearchChainInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchSearchChainInfo readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchSearchChainInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchChainKey_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v7 = *(id *)(a1 + 32);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"searchChainKey";
      }
      else {
        objc_super v8 = @"search_chain_key";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if (*(void *)(a1 + 48))
    {
      -[GEOPDSearchSearchChainInfo _readTriggers](a1);
      id v9 = *(id *)(a1 + 48);
      [v4 setObject:v9 forKey:@"trigger"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v11 = *(id *)(a1 + 24);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = objc_msgSend(v15, "dictionaryRepresentation", (void)v24);
            }
            objc_msgSend(v10, "addObject:", v16, (void)v24);
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v12);
      }

      if (a2) {
        v17 = @"countryOccurrence";
      }
      else {
        v17 = @"country_occurrence";
      }
      objc_msgSend(v4, "setObject:forKey:", v10, v17, (void)v24);
    }
    if (*(unsigned char *)(a1 + 68))
    {
      v18 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      [v4 setObject:v18 forKey:@"total"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v19 = *(void **)(a1 + 8);
      if (v19)
      {
        id v20 = v19;
        objc_sync_enter(v20);
        GEOPDSearchSearchChainInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrandKey_tags_159);
        objc_sync_exit(v20);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v21 = *(id *)(a1 + 16);
    if (v21)
    {
      if (a2) {
        v22 = @"brandKey";
      }
      else {
        v22 = @"brand_key";
      }
      [v4 setObject:v21 forKey:v22];
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
  return -[GEOPDSearchSearchChainInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_166;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_167;
      }
      GEOPDSearchSearchChainInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v7 = *(id *)(a1 + 24);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v11;
        while (1)
        {
          if (*(void *)v11 != v9) {
            objc_enumerationMutation(v7);
          }
          if (!--v8)
          {
            uint64_t v8 = [v7 countByEnumeratingWithState:&v10 objects:v14 count:16];
            if (!v8) {
              break;
            }
          }
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchSearchChainInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3E) == 0))
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
    -[GEOPDSearchSearchChainInfo readAll:]((uint64_t)self, 0);
    if (self->_searchChainKey) {
      PBDataWriterWriteStringField();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_triggers;
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
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v10 = self->_countryOccurrences;
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

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_brandKey) {
      PBDataWriterWriteStringField();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
      GEOPDSearchSearchChainInfoReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_27;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchSearchChainInfo readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_searchChainKey copyWithZone:a3];
  long long v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v27 = self;
  uint64_t v11 = self->_triggers;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = (id)[*(id *)(*((void *)&v33 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchSearchChainInfo _readTriggers](v5);
        -[GEOPDSearchSearchChainInfo _addNoFlagsTrigger:](v5, v15);

        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v5 + 68) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 64));
        *(unsigned char *)(v5 + 68) |= 0x20u;
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = self->_countryOccurrences;
  uint64_t v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v30;
    long long v18 = (os_unfair_lock_s *)(v5 + 64);
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(obj);
        }
        long long v20 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * j) copyWithZone:a3];
        long long v21 = v20;
        if (v5)
        {
          id v22 = v20;
          os_unfair_lock_lock(v18);
          if ((*(unsigned char *)(v5 + 68) & 4) == 0)
          {
            long long v23 = *(void **)(v5 + 8);
            if (v23)
            {
              id v24 = v23;
              objc_sync_enter(v24);
              GEOPDSearchSearchChainInfoReadSpecified(v5, *(void *)(v5 + 8), (int *)&_readCountryOccurrences_tags_158);
              objc_sync_exit(v24);
            }
          }
          os_unfair_lock_unlock(v18);
          -[GEOPDSearchSearchChainInfo _addNoFlagsCountryOccurrence:](v5, v22);

          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v5 + 68) |= 4u;
          os_unfair_lock_unlock(v18);
          *(unsigned char *)(v5 + 68) |= 0x20u;
        }
      }
      uint64_t v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v16);
  }

  if (*(unsigned char *)&v27->_flags)
  {
    *(void *)(v5 + 40) = v27->_total;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  uint64_t v25 = [(NSString *)v27->_brandKey copyWithZone:a3];
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v25;
LABEL_27:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPDSearchSearchChainInfo readAll:]((uint64_t)self, 1);
  -[GEOPDSearchSearchChainInfo readAll:]((uint64_t)v4, 1);
  searchChainKey = self->_searchChainKey;
  if ((unint64_t)searchChainKey | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](searchChainKey, "isEqual:")) {
      goto LABEL_15;
    }
  }
  triggers = self->_triggers;
  if ((unint64_t)triggers | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](triggers, "isEqual:")) {
      goto LABEL_15;
    }
  }
  countryOccurrences = self->_countryOccurrences;
  if ((unint64_t)countryOccurrences | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](countryOccurrences, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_total != *((void *)v4 + 5)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  brandKey = self->_brandKey;
  if ((unint64_t)brandKey | *((void *)v4 + 2)) {
    char v9 = -[NSString isEqual:](brandKey, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDSearchSearchChainInfo readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_searchChainKey hash];
  uint64_t v4 = [(NSMutableArray *)self->_triggers hash];
  uint64_t v5 = [(NSMutableArray *)self->_countryOccurrences hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v6 = 2654435761u * self->_total;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_brandKey hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_searchChainKey, 0);
  objc_storeStrong((id *)&self->_countryOccurrences, 0);
  objc_storeStrong((id *)&self->_brandKey, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end